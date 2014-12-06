
bd.interactions.Register("pager_pickup", {
    filter = function(ent, ply)
        return ent:GetClass() == "prop_ragdoll" and not ent:GetNWBool("PagerTaken")
    end,
    help = function(ent, ply) return "Take pager" end,
    finish = function(ent, ply)
        -- TODO

        ent:SetNWBool("PagerTaken", true)
    end,
    cancel = function(ent, ply) end,
    length = function() return 0.5 end,

    menu_icon = Material("icon16/phone.png")
})

bd.interactions.Register("pager_respond", {
    filter = function(ent, ply)
        local pager_being_called = false

        if (ent:GetClass() == "prop_ragdoll" and not ent:GetNWBool("PagerTaken")) then
            pager_being_called = true
        end
        if ent:GetClass() == "bd_pager" then
            pager_being_called = true
        end

        return pager_being_called
    end,
    help = function(ent, ply) return "Respond to pager" end,
    finish = function(ent, ply)
    end,
    cancel = function(ent, ply) end,
    length = function() return 2.5 end,

    menu_icon = Material("icon16/phone_sound.png")
})
