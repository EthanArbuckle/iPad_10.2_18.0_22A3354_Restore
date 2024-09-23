@implementation CNUIUserActionSendMessageIntentTarget

uint64_t __98___CNUIUserActionSendMessageIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v3 = a2;
  v4 = *MEMORY[0x1E0D13850];
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __98___CNUIUserActionSendMessageIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2;
    v11[3] = &unk_1EA603180;
    v11[4] = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(v8, "_cn_any:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __98___CNUIUserActionSendMessageIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __98___CNUIUserActionSendMessageIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CNHandle *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNHandle initWithStringValue:customIdentifier:type:]([CNHandle alloc], "initWithStringValue:customIdentifier:type:", v20, v6, 1);
  objc_msgSend(MEMORY[0x1E0CB3B10], "_cnui_sendMessageIntentWithHandle:contact:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C97280];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *MEMORY[0x1E0C96868];
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0C96620];
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "isSuggested");

  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:userActivity:isSuggested:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:userActivity:isSuggested:options:", v14, v13, v15, v8, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "teamIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTeamIdentifier:", v18);

  return v17;
}

uint64_t __107___CNUIUserActionSendMessageIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v3 = a2;
  v4 = *MEMORY[0x1E0D13850];
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __107___CNUIUserActionSendMessageIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2;
    v11[3] = &unk_1EA603180;
    v11[4] = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(v8, "_cn_any:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __107___CNUIUserActionSendMessageIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __107___CNUIUserActionSendMessageIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CNHandle *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNHandle initWithStringValue:customIdentifier:type:]([CNHandle alloc], "initWithStringValue:customIdentifier:type:", v20, v6, 1);
  objc_msgSend(MEMORY[0x1E0CB3B10], "_cnui_sendMessageIntentWithHandle:contact:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C97280];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *MEMORY[0x1E0C96740];
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0C96620];
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "isSuggested");

  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:userActivity:isSuggested:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:userActivity:isSuggested:options:", v14, v13, v15, v8, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "teamIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTeamIdentifier:", v18);

  return v17;
}

@end
