@implementation ASAccountSharingGroupMemberDataManager

void __56___ASAccountSharingGroupMemberDataManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v1;

}

_ASAccountSharingGroupMemberData *__72___ASAccountSharingGroupMemberDataManager_groupMemberDataForRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _ASAccountSharingGroupMemberData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(_ASAccountSharingGroupMemberData);
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD1730];
  objc_msgSend(v3, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsForContact:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_contactDisplayNameFromNameComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setContactDisplayName:](v4, "setContactDisplayName:", v9);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x24BDD1730];
  objc_msgSend(v3, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsForContact:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_shortContactDisplayNameFromNameComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setShortContactDisplayName:](v4, "setShortContactDisplayName:", v14);

  objc_msgSend(v3, "normalizedAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setHandle:](v4, "setHandle:", v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v3, "address");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_formattedAddressForAddress:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setHandleForDisplay:](v4, "setHandleForDisplay:", v18);

  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v3, "contact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_renderingScopeForDiameter:", 37.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "avatarImageForContacts:scope:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setAvatarImageForGroupMemberCell:](v4, "setAvatarImageForGroupMemberCell:", v23);

  -[_ASAccountSharingGroupMemberData setGroupPermissionLevel:](v4, "setGroupPermissionLevel:", 1);
  objc_msgSend(v3, "contact");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ASAccountSharingGroupMemberData setContact:](v4, "setContact:", v24);
  return v4;
}

_ASAccountSharingGroupMemberData *__79___ASAccountSharingGroupMemberDataManager_groupMemberDataForGroupParticipants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _ASAccountSharingGroupMemberData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _ASAccountSharingGroupMemberData *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  v4 = objc_alloc_init(_ASAccountSharingGroupMemberData);
  if (objc_msgSend(v3, "isCurrentUser"))
  {
    objc_msgSend(*(id *)(a1 + 32), "groupMemberDataForPrimaryAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setGroupPermissionLevel:", objc_msgSend(v3, "permissionLevel"));
    objc_msgSend(*(id *)(a1 + 32), "_contactForCurrentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContact:", v6);

    objc_msgSend(v5, "setIsMeParticipant:", 1);
    objc_msgSend(v5, "setInviteStatus:", objc_msgSend(v3, "inviteStatus"));
    objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUserParticipantID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParticipantID:", v8);

    v9 = v5;
  }
  else
  {
    objc_msgSend(v3, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupMemberData setHandle:](v4, "setHandle:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_formattedAddressForAddress:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupMemberData setHandleForDisplay:](v4, "setHandleForDisplay:", v11);

    -[_ASAccountSharingGroupMemberData setGroupPermissionLevel:](v4, "setGroupPermissionLevel:", objc_msgSend(v3, "permissionLevel"));
    -[_ASAccountSharingGroupMemberData setInviteStatus:](v4, "setInviteStatus:", objc_msgSend(v3, "inviteStatus"));
    objc_msgSend(v3, "participantID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupMemberData setParticipantID:](v4, "setParticipantID:", v12);

    objc_msgSend(*(id *)(a1 + 32), "fetchContactForUserHandle:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[_ASAccountSharingGroupMemberData setContact:](v4, "setContact:", v13);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1730], "componentsForContact:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_contactDisplayNameFromNameComponents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ASAccountSharingGroupMemberData setContactDisplayName:](v4, "setContactDisplayName:", v16);

      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1730], "componentsForContact:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_shortContactDisplayNameFromNameComponents:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ASAccountSharingGroupMemberData setShortContactDisplayName:](v4, "setShortContactDisplayName:", v19);

    }
    objc_msgSend(*(id *)(a1 + 32), "avatarImageForGroupMember:diameter:", v4, 37.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupMemberData setAvatarImageForGroupMemberCell:](v4, "setAvatarImageForGroupMemberCell:", v20);

    v9 = v4;
  }

  return v9;
}

uint64_t __93___ASAccountSharingGroupMemberDataManager_nameForOriginalContributorParticipantID_inGroupID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isCurrentUser") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentUserParticipantID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "participantID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

id __81___ASAccountSharingGroupMemberDataManager_KCSharingParticipantsFromGroupMembers___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDE84A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "groupPermissionLevel");

  v7 = (void *)objc_msgSend(v4, "initWithHandle:permissionLevel:", v5, v6);
  return v7;
}

@end
