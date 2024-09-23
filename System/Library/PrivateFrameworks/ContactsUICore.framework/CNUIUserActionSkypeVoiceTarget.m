@implementation CNUIUserActionSkypeVoiceTarget

id __91___CNUIUserActionSkypeVoiceTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CNHandle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

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
    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_skypeVoiceURLFutureWithHandle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C97280];
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *MEMORY[0x1E0C966A8];
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x1E0C965F8];
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v13, v12, v14, v7, 6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __89___CNUIUserActionSkypeVoiceTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_skypeVoiceURLFutureWithHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C97280];
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *MEMORY[0x1E0C967C0];
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x1E0C965F8];
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v14, v13, v15, v8, 6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
