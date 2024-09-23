@implementation _CNUIUserActionCallProviderVoiceTarget

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;
  objc_super v22;
  _CNUIUserActionCallProviderVoiceTarget *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  if (objc_msgSend(v6, "isUnified"))
  {
    objc_msgSend(v6, "linkedContacts");
  }
  else
  {
    v34[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83___CNUIUserActionCallProviderVoiceTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v24[3] = &unk_1EA603B30;
  v24[4] = self;
  v9 = v7;
  v25 = v9;
  v26 = &v27;
  objc_msgSend(v8, "_cn_filter:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v28[5];
  if (!v11)
  {
    if (-[_CNUIUserActionCallProviderVoiceTarget isCallProviderManagedUsingDiscoveringEnvironment:](self, "isCallProviderManagedUsingDiscoveringEnvironment:", v9))
    {
      v23 = self;
      v17 = (objc_super *)&v23;
    }
    else
    {
      v18 = objc_msgSend(v10, "count");
      if (v18 != objc_msgSend(v8, "count"))
      {
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21.receiver = self;
          v21.super_class = (Class)_CNUIUserActionCallProviderVoiceTarget;
          -[CNUIUserActionTarget actionsForContact:discoveringEnvironment:](&v21, sel_actionsForContact_discoveringEnvironment_, v13, v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v16 = (void *)v19;
        goto LABEL_13;
      }
      v22.receiver = self;
      v17 = &v22;
    }
    v17->super_class = (Class)_CNUIUserActionCallProviderVoiceTarget;
    -[objc_super actionsForContact:discoveringEnvironment:](v17, sel_actionsForContact_discoveringEnvironment_, v6, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(v11, "phoneNumbers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUIUserActionCallProviderVoiceTarget actionsForPhoneNumbers:contact:group:options:discoveringEnvironment:](self, "actionsForPhoneNumbers:contact:group:options:discoveringEnvironment:", v13, v28[5], 2, 0, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "observableWithResults:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_13:

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)managedBundleIdentifierForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUIUserActionCallProviderVoiceTarget externalAccountIdentifierForContact:contactStore:](self, "externalAccountIdentifierForContact:contactStore:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "profileConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getkMCCommunicationServiceTypeAudioCall();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)externalAccountIdentifierForContact:(id)a3 contactStore:(id)a4
{
  id v5;
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

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForContainerOfContactWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "containersMatchingPredicate:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C971B0];
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForAccountForContainerWithIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accountsMatchingPredicate:error:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "externalIdentifierString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)isCallProviderManagedUsingDiscoveringEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "profileConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTarget callProvider](self, "callProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getkMCCommunicationServiceTypeAudioCall();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "communicationServiceRulesExistForBundleID:forCommunicationServiceType:", v6, v7);

  return v8;
}

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
  v11 = objc_msgSend(v10, "containsObject:", &unk_1EA61C3A0);

  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
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
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIUserActionTarget callProvider](self, "callProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "supportedHandleTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", &unk_1EA61C3B8);

  if (v13)
  {
    -[_CNUIUserActionCallProviderVoiceTarget actionsForPhoneNumbers:contact:group:options:discoveringEnvironment:](self, "actionsForPhoneNumbers:contact:group:options:discoveringEnvironment:", v8, v9, 8, 54, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 group:(int64_t)a5 options:(unint64_t)a6 discoveringEnvironment:(id)a7
{
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  unint64_t v18;

  v11 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110___CNUIUserActionCallProviderVoiceTarget_actionsForPhoneNumbers_contact_group_options_discoveringEnvironment___block_invoke;
  v15[3] = &unk_1EA603B58;
  v15[4] = self;
  v16 = v11;
  v17 = a5;
  v18 = a6;
  v12 = v11;
  objc_msgSend(a3, "_cn_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  v15[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_1EA6031A8;
  v15[4] = self;
  objc_msgSend(a3, "_cn_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __98___CNUIUserActionCallProviderVoiceTarget_actionsForSocialProfiles_contact_discoveringEnvironment___block_invoke_3;
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
  v15[2] = __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke;
  v15[3] = &unk_1EA6031A8;
  v15[4] = self;
  objc_msgSend(a3, "_cn_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __107___CNUIUserActionCallProviderVoiceTarget_actionsForInstantMessageAddresses_contact_discoveringEnvironment___block_invoke_3;
  v13[3] = &unk_1EA603158;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "_cn_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
