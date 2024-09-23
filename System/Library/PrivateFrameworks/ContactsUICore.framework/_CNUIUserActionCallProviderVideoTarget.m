@implementation _CNUIUserActionCallProviderVideoTarget

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a3;
  v8 = a4;
  -[CNUIUserActionTarget callProvider](self, "callProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supportedHandleTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", &unk_1EA61C3E8);

  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
    v14[3] = &unk_1EA603158;
    v14[4] = self;
    v15 = v8;
    objc_msgSend(v7, "_cn_map:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a3;
  v8 = a4;
  -[CNUIUserActionTarget callProvider](self, "callProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supportedHandleTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", &unk_1EA61C400);

  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96___CNUIUserActionCallProviderVideoTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
    v14[3] = &unk_1EA603158;
    v14[4] = self;
    v15 = v8;
    objc_msgSend(v7, "_cn_map:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_1EA6031A8;
  v15[4] = self;
  objc_msgSend(a3, "_cn_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __98___CNUIUserActionCallProviderVideoTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
  v13[3] = &unk_1EA603158;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_1EA6031A8;
  v15[4] = self;
  objc_msgSend(a3, "_cn_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __107___CNUIUserActionCallProviderVideoTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v13[3] = &unk_1EA603158;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
