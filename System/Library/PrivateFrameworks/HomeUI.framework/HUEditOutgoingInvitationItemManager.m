@implementation HUEditOutgoingInvitationItemManager

- (HUEditOutgoingInvitationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5
{
  id v9;
  HUEditOutgoingInvitationItemManager *v10;
  HUEditOutgoingInvitationItemManager *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUEditOutgoingInvitationItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_overrideHome, a5);

  return v11;
}

- (HMOutgoingHomeInvitation)outgoingInvitation
{
  void *v2;
  void *v3;

  -[HFItemManager sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outgoingInvitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMOutgoingHomeInvitation *)v3;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUEditOutgoingInvitationItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  char v27;
  id location;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  -[HUEditOutgoingInvitationItemManager outgoingInvitation](self, "outgoingInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "invitationState") != 4)
  {
    -[HUEditOutgoingInvitationItemManager outgoingInvitation](self, "outgoingInvitation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invitationState");

  }
  v7 = objc_alloc(MEMORY[0x1E0D31840]);
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke;
  v25[3] = &unk_1E6F4E590;
  objc_copyWeak(&v26, &location);
  v27 = 1;
  v9 = (void *)objc_msgSend(v7, "initWithResultsBlock:", v25);
  -[HUEditOutgoingInvitationItemManager setInviteAgainItem:](self, "setInviteAgainItem:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v20 = v8;
  v21 = 3221225472;
  v22 = __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke_2;
  v23 = &unk_1E6F4C4E8;
  objc_copyWeak(&v24, &location);
  v11 = (void *)objc_msgSend(v10, "initWithResultsBlock:", &v20);
  -[HUEditOutgoingInvitationItemManager setRemoveItem:](self, "setRemoveItem:", v11, v20, v21, v22, v23);

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUEditOutgoingInvitationItemManager inviteAgainItem](self, "inviteAgainItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  -[HUEditOutgoingInvitationItemManager removeItem](self, "removeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithArray:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v16);
  v29 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

id __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCellInviteAgain"), CFSTR("HUUsersCellInviteAgain"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = *MEMORY[0x1E0D30B80];
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(WeakRetained, "outgoingInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(WeakRetained, "outgoingInvitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_removeTitleForInvitationState:", objc_msgSend(v3, "invitationState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = *MEMORY[0x1E0D30D70];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "outgoingInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "invitationState") == 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = *MEMORY[0x1E0D30B80];
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(WeakRetained, "outgoingInvitation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUEditOutgoingInvitationItemManager inviteAgainItem](self, "inviteAgainItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    -[HUEditOutgoingInvitationItemManager inviteAgainItem](self, "inviteAgainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  -[HUEditOutgoingInvitationItemManager removeItem](self, "removeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "containsObject:", v9);

  if (v10)
  {
    -[HUEditOutgoingInvitationItemManager removeItem](self, "removeItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditOutgoingInvitationItemManagerButtonSectionIdentifier"));
  objc_msgSend(v12, "setItems:", v5);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_removeTitleForInvitationState:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 2)
    v3 = CFSTR("HUUsersCellCancelInvitation");
  else
    v3 = CFSTR("HUUsersCellRemovePerson");
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HFStaticItem)inviteAgainItem
{
  return self->_inviteAgainItem;
}

- (void)setInviteAgainItem:(id)a3
{
  objc_storeStrong((id *)&self->_inviteAgainItem, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHome, a3);
}

- (HFStaticItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_inviteAgainItem, 0);
}

@end
