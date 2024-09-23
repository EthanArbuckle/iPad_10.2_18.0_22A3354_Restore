@implementation SUUIJSRestrictions

- (SUUIJSRestrictions)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v7;
  SUUIJSRestrictions *v8;
  SUUIJSRestrictions *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIJSRestrictions;
  v8 = -[IKJSObject initWithAppContext:](&v11, sel_initWithAppContext_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_clientContext, a4);

  return v9;
}

- (BOOL)isRestrictedApp:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BEC8C70], "isRestrictedAppBundleIdentifier:", v3) & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.facetime")))
  {
    v5 = MGGetBoolAnswer();
    v4 = v5 & MGGetBoolAnswer() ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SUUIJSRestrictions *v18;

  v4 = (void *)MEMORY[0x24BDDA728];
  v5 = a3;
  objc_msgSend(v4, "managedValueWithValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEB1FA0];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__SUUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke;
  v14[3] = &unk_2511F74A0;
  v15 = v9;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v9;
  objc_msgSend(v10, "isExplicitContentRestrictedByDefaultInCurrentStoreFront:", v14);

}

void __78__SUUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__SUUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke_2;
  v7[3] = &unk_2511F7478;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "evaluate:completionBlock:", v7, 0);

}

void __78__SUUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SUUIJSRestrictions *v18;

  v4 = (void *)MEMORY[0x24BDDA728];
  v5 = a3;
  objc_msgSend(v4, "managedValueWithValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEB1FA0];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__SUUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke;
  v14[3] = &unk_2511F74A0;
  v15 = v9;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v9;
  objc_msgSend(v10, "isExplicitContentDisallowedInCurrentStoreFront:", v14);

}

void __69__SUUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SUUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke_2;
  v7[3] = &unk_2511F7478;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "evaluate:completionBlock:", v7, 0);

}

void __69__SUUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)isRestrictionsPasscodeSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SUUIJSRestrictions *v18;

  v4 = (void *)MEMORY[0x24BDDA728];
  v5 = a3;
  objc_msgSend(v4, "managedValueWithValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEB1FA0];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__SUUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke;
  v14[3] = &unk_2511F74A0;
  v15 = v9;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v9;
  objc_msgSend(v10, "isRestrictionsPasscodeSet:", v14);

}

void __48__SUUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke_2;
  v7[3] = &unk_2511F7478;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "evaluate:completionBlock:", v7, 0);

}

void __48__SUUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)setAllowExplicitContent
{
  objc_msgSend(MEMORY[0x24BEB1FA0], "setAllowExplicitContent");
}

- (void)shouldDisplayExplicitRestrictionAlertOfType:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  id *v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  void *v22;
  _QWORD v23[2];
  _QWORD v24[4];
  id v25;
  void *v26;
  id v27;
  SUUIJSRestrictions *v28;

  v6 = (void *)MEMORY[0x24BDDA728];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SUUIJSRestrictions _explicitRestrictionAlertTypeForTypeString:](self, "_explicitRestrictionAlertTypeForTypeString:", v8);

  if (v13 < 0)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_3;
    v21[3] = &unk_2511F74C8;
    v15 = &v22;
    v16 = (id *)v23;
    v22 = v9;
    v23[0] = v11;
    v23[1] = self;
    v19 = v11;
    v20 = v9;
    objc_msgSend(v12, "evaluate:completionBlock:", v21, 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BEB1FA0];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke;
    v24[3] = &unk_2511F74A0;
    v15 = &v25;
    v16 = &v26;
    v25 = v12;
    v26 = v9;
    v27 = v11;
    v28 = self;
    v17 = v11;
    v18 = v9;
    objc_msgSend(v14, "shouldDisplayExplicitRestrictionAlertOfType:completionBlock:", v13, v24);

  }
}

void __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_2;
  v7[3] = &unk_2511F7478;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "evaluate:completionBlock:", v7, 0);

}

void __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __67__SUUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "callWithArguments:", &unk_2512EE9E8);
  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)didDisplayExplicitRestrictionAlertOfType:(id)a3
{
  int64_t v3;

  v3 = -[SUUIJSRestrictions _explicitRestrictionAlertTypeForTypeString:](self, "_explicitRestrictionAlertTypeForTypeString:", a3);
  if ((v3 & 0x8000000000000000) == 0)
    objc_msgSend(MEMORY[0x24BEB1FA0], "didDisplayExplicitRestrictionAlertOfType:", v3);
}

- (void)presentExplicitRestrictionAlertIfNeededOfType:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  SUUIExplicitRestrictionAlertController *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  void *v18;
  id v19;
  SUUIJSRestrictions *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SUUIJSRestrictions *v25;

  v6 = (void *)MEMORY[0x24BDDA728];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SUUIJSRestrictions _explicitRestrictionAlertTypeForTypeString:](self, "_explicitRestrictionAlertTypeForTypeString:", v8);

  if (v13 < 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_3;
    v17[3] = &unk_2511F74C8;
    v18 = v9;
    v19 = v11;
    v20 = self;
    v16 = v11;
    v14 = v9;
    objc_msgSend(v12, "evaluate:completionBlock:", v17, 0);

    v15 = v18;
  }
  else
  {
    v14 = -[SUUIExplicitRestrictionAlertController initWithClientContext:]([SUUIExplicitRestrictionAlertController alloc], "initWithClientContext:", self->_clientContext);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke;
    v21[3] = &unk_2511F74A0;
    v22 = v12;
    v23 = v9;
    v24 = v11;
    v25 = self;
    v15 = v11;
    v16 = v9;
    -[SUUIExplicitRestrictionAlertController presentExplicitRestrictionAlertIfNeededOfType:completionBlock:](v14, "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:", v13, v21);

  }
}

void __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_2;
  v7[3] = &unk_2511F7478;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "evaluate:completionBlock:", v7, 0);

}

void __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __69__SUUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "callWithArguments:", &unk_2512EEA00);
  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (int64_t)_explicitRestrictionAlertTypeForTypeString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onLaunch")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onContainerLoad")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onPlay")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onPurchase")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onAddToLibrary")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("onOpen")))
  {
    v4 = 5;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
