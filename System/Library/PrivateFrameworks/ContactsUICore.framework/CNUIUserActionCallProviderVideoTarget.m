@implementation CNUIUserActionCallProviderVideoTarget

id __98___CNUIUserActionCallProviderVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CNHandle *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNHandle initWithStringValue:type:]([CNHandle alloc], "initWithStringValue:type:", v5, 3);
    objc_msgSend(*(id *)(a1 + 32), "callProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialRequestForHandle:contact:video:", v6, *(_QWORD *)(a1 + 40), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C97280];
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *MEMORY[0x1E0C966A8];
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x1E0C96658];
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", v14, v13, v15, v8, 8, 54);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __96___CNUIUserActionCallProviderVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CNHandle *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a2;
  if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[CNHandle initWithStringValue:type:]([CNHandle alloc], "initWithStringValue:type:", v6, 2);
    objc_msgSend(*(id *)(a1 + 32), "callProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dialRequestForHandle:contact:video:", v7, *(_QWORD *)(a1 + 40), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C97280];
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *MEMORY[0x1E0C967C0];
    objc_msgSend(v3, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0C96658];
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", v15, v14, v16, v9, 8, 54);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v11[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
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

id __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNHandle initWithStringValue:customIdentifier:type:]([CNHandle alloc], "initWithStringValue:customIdentifier:type:", v5, v7, 1);
  objc_msgSend(*(id *)(a1 + 32), "callProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dialRequestForHandle:contact:video:", v8, *(_QWORD *)(a1 + 40), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97280];
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *MEMORY[0x1E0C96868];
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x1E0C96658];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "isSuggested");

  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:dialRequest:isSuggested:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:dialRequest:isSuggested:options:", v16, v15, v17, v10, v18, 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    v11[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2;
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

uint64_t __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_2(uint64_t a1, void *a2)
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

id __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNHandle initWithStringValue:customIdentifier:type:]([CNHandle alloc], "initWithStringValue:customIdentifier:type:", v5, v7, 1);
  objc_msgSend(*(id *)(a1 + 32), "callProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dialRequestForHandle:contact:video:", v8, *(_QWORD *)(a1 + 40), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97280];
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *MEMORY[0x1E0C96740];
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x1E0C96658];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "isSuggested");

  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:dialRequest:isSuggested:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:dialRequest:isSuggested:options:", v16, v15, v17, v10, v18, 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
