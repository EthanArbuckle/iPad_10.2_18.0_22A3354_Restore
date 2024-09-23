@implementation CNUIUserActionSkypeVideoTarget

id __91___CNUIUserActionSkypeVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNHandle *v5;
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

  v3 = a2;
  if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v5 = [CNHandle alloc];
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNHandle initWithStringValue:type:](v5, "initWithStringValue:type:", v6, 3);

    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_skypeVideoURLFutureWithHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C97280];
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *MEMORY[0x1E0C966A8];
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x1E0C96658];
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v14, v13, v15, v8, 6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __89___CNUIUserActionSkypeVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNHandle *v5;
  void *v6;
  void *v7;
  CNHandle *v8;
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
    v5 = [CNHandle alloc];
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNHandle initWithStringValue:type:](v5, "initWithStringValue:type:", v7, 2);

    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_skypeVideoURLFutureWithHandle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97280];
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *MEMORY[0x1E0C967C0];
    objc_msgSend(v3, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0C96658];
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v15, v14, v16, v9, 6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
