@implementation CNUIUserActionTarget

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v19 = (void *)MEMORY[0x1E0D13AE8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget actionsForEmailAddresses:contact:discoveringEnvironment:](self, "actionsForEmailAddresses:contact:discoveringEnvironment:", v23, v7, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  objc_msgSend(v7, "phoneNumbers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget actionsForPhoneNumbers:contact:discoveringEnvironment:](self, "actionsForPhoneNumbers:contact:discoveringEnvironment:", v21, v7, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(v7, "instantMessageAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget actionsForInstantMessageAddresses:contact:discoveringEnvironment:](self, "actionsForInstantMessageAddresses:contact:discoveringEnvironment:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v9;
  objc_msgSend(v7, "socialProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget actionsForSocialProfiles:contact:discoveringEnvironment:](self, "actionsForSocialProfiles:contact:discoveringEnvironment:", v10, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(v7, "postalAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget actionsForPostalAddresses:contact:discoveringEnvironment:](self, "actionsForPostalAddresses:contact:discoveringEnvironment:", v12, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cn_flatten");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "observableWithResults:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)descriptorForRequiredKeysForActionDiscovering
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  v3 = *MEMORY[0x1E0C967C0];
  v10[0] = *MEMORY[0x1E0C966A8];
  v10[1] = v3;
  v4 = *MEMORY[0x1E0C96868];
  v10[2] = *MEMORY[0x1E0C96740];
  v10[3] = v4;
  v10[4] = *MEMORY[0x1E0C967F0];
  objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIUserActionTarget descriptorForRequiredKeysForActionDiscovering]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)targetForSendMessageIntentWithAppProxy:(id)a3
{
  id v3;
  _CNUIUserActionSendMessageIntentTarget *v4;
  void *v5;
  void *v6;
  void *v7;
  _CNUIUserActionSendMessageIntentTarget *v8;

  v3 = a3;
  v4 = [_CNUIUserActionSendMessageIntentTarget alloc];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v5, v6, v7);
  return v8;
}

+ (id)targetForVoiceWithFaceTime
{
  return objc_alloc_init(_CNUIUserActionFaceTimeVoiceTarget);
}

+ (id)targetForTextWithMessages
{
  return objc_alloc_init(_CNUIUserActionMessagesTextTarget);
}

+ (id)targetForVideoWithFaceTime
{
  return objc_alloc_init(_CNUIUserActionFaceTimeVideoTarget);
}

+ (id)targetForPayWithWallet
{
  return objc_alloc_init(_CNUIUserActionWalletPayTarget);
}

- (CNUIUserActionTarget)initWithName:(id)a3 bundleIdentifier:(id)a4 teamIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNUIUserActionTarget *v12;
  CNUIUserActionTarget *v13;
  CNUIUserActionTarget *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNUIUserActionTarget;
  v12 = -[CNUIUserActionTarget init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_teamIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

+ (id)targetForEmailWithMail
{
  return objc_alloc_init(_CNUIUserActionMailEmailTarget);
}

+ (id)targetForVoiceWithTelephony
{
  return objc_alloc_init(_CNUIUserActionTelephonyVoiceTarget);
}

+ (id)targetForDirections
{
  return objc_alloc_init(_CNUIUserActionDirectionsTarget);
}

+ (id)targetForVoiceWithSkype
{
  return objc_alloc_init(_CNUIUserActionSkypeVoiceTarget);
}

+ (id)targetForVoiceWithCallProvider:(id)a3
{
  id v3;
  _CNUIUserActionCallProviderVoiceTarget *v4;
  void *v5;
  void *v6;
  _CNUIUserActionCallProviderVoiceTarget *v7;

  v3 = a3;
  v4 = [_CNUIUserActionCallProviderVoiceTarget alloc];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v5, v6, 0);

  -[CNUIUserActionTarget setCallProvider:](v7, "setCallProvider:", v3);
  return v7;
}

+ (id)targetForStartAudioCallIntentWithAppProxy:(id)a3
{
  id v3;
  _CNUIUserActionStartAudioCallIntentTarget *v4;
  void *v5;
  void *v6;
  void *v7;
  _CNUIUserActionStartAudioCallIntentTarget *v8;

  v3 = a3;
  v4 = [_CNUIUserActionStartAudioCallIntentTarget alloc];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v5, v6, v7);
  return v8;
}

+ (id)targetForVideoWithSkype
{
  return objc_alloc_init(_CNUIUserActionSkypeVideoTarget);
}

+ (id)targetForVideoWithCallProvider:(id)a3
{
  id v3;
  _CNUIUserActionCallProviderVideoTarget *v4;
  void *v5;
  void *v6;
  _CNUIUserActionCallProviderVideoTarget *v7;

  v3 = a3;
  v4 = [_CNUIUserActionCallProviderVideoTarget alloc];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v5, v6, 0);

  -[CNUIUserActionTarget setCallProvider:](v7, "setCallProvider:", v3);
  return v7;
}

+ (id)targetForStartVideoCallIntentWithAppProxy:(id)a3
{
  id v3;
  _CNUIUserActionStartVideoCallIntentTarget *v4;
  void *v5;
  void *v6;
  void *v7;
  _CNUIUserActionStartVideoCallIntentTarget *v8;

  v3 = a3;
  v4 = [_CNUIUserActionStartVideoCallIntentTarget alloc];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v5, v6, v7);
  return v8;
}

+ (id)targetForTextWithSkype
{
  return objc_alloc_init(_CNUIUserActionSkypeTextTarget);
}

- (CNUIUserActionTarget)init
{
  void *v3;
  objc_class *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("CNUIInitializerException"), CFSTR("You can't instantiate the base class %@ without a name and bundle identifier"), v5);

  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](self, "initWithName:bundleIdentifier:teamIdentifier:", &stru_1EA606688, &stru_1EA606688, &stru_1EA606688);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __32__CNUIUserActionTarget_isEqual___block_invoke;
  v17[3] = &unk_1EA603108;
  v17[4] = self;
  v18 = v4;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __32__CNUIUserActionTarget_isEqual___block_invoke_2;
  v15[3] = &unk_1EA603108;
  v15[4] = self;
  v8 = v18;
  v16 = v8;
  v9 = (void *)MEMORY[0x1DF0D6388](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __32__CNUIUserActionTarget_isEqual___block_invoke_3;
  v13[3] = &unk_1EA603108;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1DF0D6388](v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v10, v6, self, v17, v9, v11, 0);

  return (char)self;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "teamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__CNUIUserActionTarget_hash__block_invoke;
  v11[3] = &unk_1EA603130;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__CNUIUserActionTarget_hash__block_invoke_2;
  v10[3] = &unk_1EA603130;
  v5 = (void *)MEMORY[0x1DF0D6388](v10, a2);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __28__CNUIUserActionTarget_hash__block_invoke_3;
  v9[3] = &unk_1EA603130;
  v9[4] = self;
  v6 = (void *)MEMORY[0x1DF0D6388](v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "teamIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (CNTUCallProvider)callProvider
{
  return (CNTUCallProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProvider, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
