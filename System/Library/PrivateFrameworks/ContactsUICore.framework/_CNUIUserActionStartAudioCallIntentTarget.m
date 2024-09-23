@implementation _CNUIUserActionStartAudioCallIntentTarget

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionStartAudioCallIntentTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101___CNUIUserActionStartAudioCallIntentTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionStartAudioCallIntentTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99___CNUIUserActionStartAudioCallIntentTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _CNUIUserActionStartAudioCallIntentTarget *v15;
  _QWORD v16[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101___CNUIUserActionStartAudioCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v16[3] = &unk_1EA6031A8;
  v16[4] = self;
  objc_msgSend(a3, "_cn_filter:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __101___CNUIUserActionStartAudioCallIntentTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
  v13[3] = &unk_1EA603158;
  v14 = v7;
  v15 = self;
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
  _QWORD v13[4];
  id v14;
  _CNUIUserActionStartAudioCallIntentTarget *v15;
  _QWORD v16[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110___CNUIUserActionStartAudioCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v16[3] = &unk_1EA6031A8;
  v16[4] = self;
  objc_msgSend(a3, "_cn_filter:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __110___CNUIUserActionStartAudioCallIntentTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v13[3] = &unk_1EA603158;
  v14 = v7;
  v15 = self;
  v10 = v7;
  objc_msgSend(v9, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
