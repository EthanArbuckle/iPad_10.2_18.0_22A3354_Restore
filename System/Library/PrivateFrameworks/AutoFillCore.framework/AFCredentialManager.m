@implementation AFCredentialManager

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)instance_0;
  if (!instance_0)
  {
    if (sharedInstance_onceToken_0 != -1)
      dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
    v2 = (void *)instance_0;
  }
  return v2;
}

void __37__AFCredentialManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AFCredentialManager initPrivate]([AFCredentialManager alloc], "initPrivate");
  v1 = (void *)instance_0;
  instance_0 = (uint64_t)v0;

}

- (id)initPrivate
{
  AFCredentialManager *v2;
  void *v3;
  objc_class *v4;
  SFAppAutoFillPasskeyProvider *v5;
  SFAppAutoFillPasskeyProvider *passkeyProvider;
  void *v7;
  objc_class *v8;
  SFAppAutoFillOneTimeCodeProvider *v9;
  SFAppAutoFillOneTimeCodeProvider *oneTimeCodeProvider;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v12.receiver = self;
  v12.super_class = (Class)AFCredentialManager;
  v2 = -[AFCredentialManager init](&v12, sel_init);
  if (v2)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v3 = (void *)getSFAppAutoFillPasskeyProviderClass_softClass;
    v21 = getSFAppAutoFillPasskeyProviderClass_softClass;
    if (!getSFAppAutoFillPasskeyProviderClass_softClass)
    {
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __getSFAppAutoFillPasskeyProviderClass_block_invoke;
      v16 = &unk_2508535B8;
      v17 = &v18;
      __getSFAppAutoFillPasskeyProviderClass_block_invoke((uint64_t)&v13);
      v3 = (void *)v19[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v18, 8);
    v5 = (SFAppAutoFillPasskeyProvider *)objc_alloc_init(v4);
    passkeyProvider = v2->_passkeyProvider;
    v2->_passkeyProvider = v5;

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v7 = (void *)getSFAppAutoFillOneTimeCodeProviderClass_softClass;
    v21 = getSFAppAutoFillOneTimeCodeProviderClass_softClass;
    if (!getSFAppAutoFillOneTimeCodeProviderClass_softClass)
    {
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke;
      v16 = &unk_2508535B8;
      v17 = &v18;
      __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke((uint64_t)&v13);
      v7 = (void *)v19[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v18, 8);
    v9 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(v8);
    oneTimeCodeProvider = v2->_oneTimeCodeProvider;
    v2->_oneTimeCodeProvider = v9;

    -[SFAppAutoFillOneTimeCodeProvider addObserver:](v2->_oneTimeCodeProvider, "addObserver:", v2);
  }
  return v2;
}

- (id)obtainApplicationIdentifierFromConnection:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  NSObject *v8;
  CFErrorRef error;
  audit_token_t token;

  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, CFSTR("application-identifier"), &error);
    if (error)
    {
      AFCredentialManagerOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AFCredentialManager obtainApplicationIdentifierFromConnection:].cold.1((uint64_t *)&error);

      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)obtainBundleIdentifierFromConnection:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  CPCopyBundleIdentifierAndTeamFromAuditToken();

  return 0;
}

- (BOOL)hasAutoFillContextEntitlementForConnection:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  char v8;
  NSObject *v9;
  CFErrorRef error;
  audit_token_t token;

  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.textInput.autofillContext"), &error);
    v8 = objc_msgSend(v7, "BOOLValue");

    if (error)
    {
      AFCredentialManagerOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AFCredentialManager hasAutoFillContextEntitlementForConnection:].cold.1((uint64_t *)&error);

      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)getCredentialsWithApplicationIdentifier:(id)a3 documentTraits:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "associatedDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") && (getSFSafariCredentialStoreClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(getSFSafariCredentialStoreClass(), "getCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:completionHandler:", v12, v9, v8);
  }
  else
  {
    getSFSafariCredentialStoreClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "autofillContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("_WebViewURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v11 = 0;
      }
      objc_msgSend(getSFSafariCredentialStoreClass(), "getCredentialsForAppWithAppID:websiteURL:completionHandler:", v12, v11, v8);

    }
    else
    {
      objc_msgSend(getSFSafariCredentialStoreClass(), "getCredentialsForAppWithAppID:completionHandler:", v12, v8);
    }
  }

}

- (id)_autoFillPayloadForPasswordCredential:(id)a3 customInfoType:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isExternal"))
  {
    *a4 = 13;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("ExternalCredentialData"));

  }
  else
  {
    *a4 = 5;
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("AutofillUsername"));
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("AutofillPassword"));
  }

  return v8;
}

- (id)_suggestionForPasswordCredential:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  AFSuggestion *v25;
  id v27;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:", CFSTR("SAFARI_CREDENTIAL_DATE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(v7, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromDate:dateStyle:timeStyle:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), &v27, v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = v27;
    v18 = &stru_250853C50;
    if (v16)
      v18 = v16;
    v19 = v18;

    if (v17)
    {
      AFCredentialManagerOSLogFacility();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[AFCredentialManager _suggestionForPasswordCredential:autoFillPayload:customInfoType:].cold.1((uint64_t)v17);

    }
    v9 = v19;
  }
  if (objc_msgSend(v7, "isExternal"))
  {
    objc_msgSend(getSFSafariCredentialStoreClass(), "textSuggestionHeaderForExternalCredential:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "site");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "length"))
    {
      +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:", CFSTR("SAFARI_KEYCHAIN"));
      v24 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v24;
    }
  }
  v25 = -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:", v9, v21, v8, 0, 0, a5);

  return v25;
}

- (id)_autoFillPayloadForPasskey:(id)a3 customInfoType:(unint64_t *)a4
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  *a4 = 12;
  v8 = CFSTR("Passkey");
  v9[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_suggestionForPasskey:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  AFSuggestion *v20;
  id v22;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:", CFSTR("SAFARI_PASSKEY_SITE_SHORT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  v22 = 0;
  objc_msgSend(v8, "relyingPartyIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), &v22, v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  v17 = &stru_250853C50;
  if (v15)
    v17 = v15;
  v18 = v17;

  if (v16)
  {
    AFCredentialManagerOSLogFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AFCredentialManager _suggestionForPasskey:autoFillPayload:customInfoType:].cold.1((uint64_t)v16);

  }
  v20 = -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:", v9, v18, v7, 0, 0, a5);

  return v20;
}

- (id)generateLoginAutoFillWithDocumentTraits:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  SFAppAutoFillPasskeyProvider *passkeyProvider;
  dispatch_time_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  AFSuggestion *v31;
  dispatch_group_t group;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  dispatch_group_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSFAutoFillFeatureManagerClass(), "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAutoFillPasswords");

  if (!v5)
  {
    v10 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v36, "appId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
    goto LABEL_13;
  if (isSystemAutoFillBundle_onceToken != -1)
    dispatch_once(&isSystemAutoFillBundle_onceToken, &__block_literal_global_230);
  v6 = isSystemAutoFillBundle_autoFillPanelIdentifiers;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "containsObject:", v8);

  if ((v6 & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v36, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[AFCredentialManager obtainBundleIdentifierFromConnection:](self, "obtainBundleIdentifierFromConnection:", v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0
    && !-[AFCredentialManager hasAutoFillContextEntitlementForConnection:](self, "hasAutoFillContextEntitlementForConnection:", v34))
  {

LABEL_13:
    -[AFCredentialManager obtainApplicationIdentifierFromConnection:](self, "obtainApplicationIdentifierFromConnection:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

LABEL_14:
  v11 = dispatch_group_create();
  v12 = v11;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__0;
  v54 = __Block_byref_object_dispose__0;
  v55 = 0;
  v13 = MEMORY[0x24BDAC760];
  if (self->_passkeyProvider)
  {
    dispatch_group_enter(v11);
    passkeyProvider = self->_passkeyProvider;
    v47[0] = v13;
    v47[1] = 3221225472;
    v47[2] = __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke;
    v47[3] = &unk_250853678;
    v49 = &v50;
    v48 = v12;
    -[SFAppAutoFillPasskeyProvider getAvailablePasskeysForApplicationIdentifier:completionHandler:](passkeyProvider, "getAvailablePasskeysForApplicationIdentifier:completionHandler:", v35, v47);

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v46 = 0;
  dispatch_group_enter(v12);
  v38[0] = v13;
  v38[1] = 3221225472;
  v38[2] = __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke_2;
  v38[3] = &unk_250853678;
  v40 = &v41;
  group = v12;
  v39 = group;
  -[AFCredentialManager getCredentialsWithApplicationIdentifier:documentTraits:withCompletionHandler:](self, "getCredentialsWithApplicationIdentifier:documentTraits:withCompletionHandler:", v35, v36, v38);
  v15 = dispatch_time(0, 3000000000);
  dispatch_group_wait(group, v15);
  if (objc_msgSend((id)v51[5], "count"))
  {
    objc_msgSend((id)v51[5], "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)v42[5], "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isExternal");

    v20 = (void *)v42[5];
    if (v19)
    {
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v20;
    }
  }
  if ((unint64_t)objc_msgSend(v17, "count") >= 2)
  {
    objc_msgSend(v17, "subarrayWithRange:", 0, 1);
    v22 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v22;
  }
  if ((unint64_t)objc_msgSend(v17, "count") > 2)
    v23 = 3;
  else
    v23 = objc_msgSend(v17, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v17, "count");
  if (v24)
  {
    for (i = 0; v24 != i; ++i)
    {
      objc_msgSend(v17, "objectAtIndex:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v57 = 0;
      v58 = &v57;
      v59 = 0x2050000000;
      v27 = (void *)getSFSafariCredentialClass_softClass;
      v60 = getSFSafariCredentialClass_softClass;
      if (!getSFSafariCredentialClass_softClass)
      {
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __getSFSafariCredentialClass_block_invoke;
        v56[3] = &unk_2508535B8;
        v56[4] = &v57;
        __getSFSafariCredentialClass_block_invoke((uint64_t)v56);
        v27 = (void *)v58[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v57, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AFCredentialManager _autoFillPayloadForPasswordCredential:customInfoType:](self, "_autoFillPayloadForPasswordCredential:customInfoType:", v26, &v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFCredentialManager _suggestionForPasswordCredential:autoFillPayload:customInfoType:](self, "_suggestionForPasswordCredential:autoFillPayload:customInfoType:", v26, v29, v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v30);
      }
      else
      {
        if (!getSFAutoFillPasskeyClass())
          goto LABEL_36;
        getSFAutoFillPasskeyClass();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        -[AFCredentialManager _autoFillPayloadForPasskey:customInfoType:](self, "_autoFillPayloadForPasskey:customInfoType:", v26, &v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFCredentialManager _suggestionForPasskey:autoFillPayload:customInfoType:](self, "_suggestionForPasskey:autoFillPayload:customInfoType:", v26, v29, v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v30);
      }

LABEL_36:
    }
  }
  v31 = -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:", &stru_250853C50, &stru_250853C50, 0, 0, 0, 6);
  objc_msgSend(v10, "addObject:", v31);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v50, 8);

LABEL_38:
  return v10;
}

void __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)generateSignupAutoFillWithAutoFillMode:(unint64_t)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  void *v6;
  char v7;
  dispatch_semaphore_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  char v20;
  uint64_t i;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  AFSuggestion *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[8];

  v52[6] = *MEMORY[0x24BDAC8D0];
  v34 = a4;
  v33 = a5;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSFAutoFillFeatureManagerClass(), "sharedFeatureManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldAutoFillPasswords");

  if ((v7 & 1) != 0)
  {
    v8 = dispatch_semaphore_create(0);
    objc_msgSend(v34, "textInputTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "keyboardType") == 7;

    v48 = 0;
    v49 = &v48;
    v50 = 0x2050000000;
    v11 = (void *)getSFSuggestedUserProviderClass_softClass;
    v51 = getSFSuggestedUserProviderClass_softClass;
    if (!getSFSuggestedUserProviderClass_softClass)
    {
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __getSFSuggestedUserProviderClass_block_invoke;
      v52[3] = &unk_2508535B8;
      v52[4] = &v48;
      __getSFSuggestedUserProviderClass_block_invoke((uint64_t)v52);
      v11 = (void *)v49[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v48, 8);
    objc_msgSend(v12, "sharedProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke;
    v39[3] = &unk_250853678;
    v41 = &v42;
    v14 = v8;
    v40 = v14;
    objc_msgSend(v13, "suggestedUsersOfType:completionHandler:", v10, v39);

    v15 = dispatch_time(0, 200000000);
    dispatch_semaphore_wait(v14, v15);

  }
  if ((unint64_t)objc_msgSend((id)v43[5], "count") > 2)
  {
    v16 = 3;
  }
  else
  {
    v16 = objc_msgSend((id)v43[5], "count");
    if (!v16)
      goto LABEL_16;
  }
  v17 = 0;
  v18 = 1;
  do
  {
    objc_msgSend((id)v43[5], "objectAtIndex:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsString:", CFSTR("@"));

    if ((v20 & 1) == 0)
      break;
    v18 = ++v17 < v16;
  }
  while (v16 != v17);
  for (i = 0; i != v16; ++i)
  {
    objc_msgSend((id)v43[5], "objectAtIndex:", i);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = &stru_250853C50;
    if (v18)
    {
      +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:", CFSTR("SAFARI_CREDENTIAL_SUGGESTED_USERNAME"));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v26 = -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:", v23, v22, 0, 0, 0, 8);
    objc_msgSend(v35, "addObject:", v26);

  }
LABEL_16:
  if (objc_msgSend(v34, "autofillSubMode") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      -[AFCredentialManager obtainApplicationIdentifierFromConnection:](self, "obtainApplicationIdentifierFromConnection:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v34, "bundleId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29
      || (-[AFCredentialManager obtainBundleIdentifierFromConnection:](self, "obtainBundleIdentifierFromConnection:", v27), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v28)
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke_2;
        v36[3] = &unk_2508536A0;
        v37 = v35;
        v38 = v33;
        -[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:](self, "generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:", v29, v28, v36);

        goto LABEL_27;
      }
    }

  }
  AFCredentialManagerOSLogFacility();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Hide My Email is not required."), "-[AFCredentialManager generateSignupAutoFillWithAutoFillMode:documentTraits:completionHandler:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFCredentialManager generateSignupAutoFillWithAutoFillMode:documentTraits:completionHandler:].cold.1(v31, (uint64_t)v52, v30);
  }

  (*((void (**)(id, id))v33 + 2))(v33, v35);
LABEL_27:
  _Block_object_dispose(&v42, 8);

}

void __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!v6)
  {
    AFCredentialManagerOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:].cold.2();

    v7[2](v7, 0);
  }
  objc_msgSend(v6, "bundleId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v6, "appId"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v6, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __85__AFCredentialManager_generateHideMyEmailAutoFillWithRenderTraits_completionHandler___block_invoke;
    v15[3] = &unk_2508536C8;
    v16 = v7;
    -[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:](self, "generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:", v12, v13, v15);

  }
  else
  {
    AFCredentialManagerOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:].cold.1();

    v7[2](v7, 0);
  }

}

uint64_t __85__AFCredentialManager_generateHideMyEmailAutoFillWithRenderTraits_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateHideMyEmailSuggestionWithApplicationBundleId:(id)a3 applicationId:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  dispatch_semaphore_t v9;
  id SFSafariCredentialStoreClass;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v28;
  uint64_t v29;
  id v30;
  id v31;
  void (**v32)(id, _QWORD);
  void *v33;
  id v34;
  void (**v35)(id, _QWORD);
  id v36;
  void *v37;
  void *v38;
  id v39;
  void (**v40)(id, _QWORD);
  id v41;
  dispatch_time_t v42;
  void *v43;
  id v44;
  _QWORD block[4];
  void (**v46)(id, _QWORD);
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint8_t *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  uint8_t *v64;
  _QWORD *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint8_t *v70;
  uint64_t *v71;
  _QWORD *v72;
  _QWORD v73[4];
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _QWORD v87[4];
  NSObject *v88;
  _QWORD *v89;
  _QWORD v90[5];
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  char v101[16];
  uint8_t buf[8];
  uint8_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__0;
  v90[4] = __Block_byref_object_dispose__0;
  v91 = 0;
  v9 = dispatch_semaphore_create(0);
  SFSafariCredentialStoreClass = getSFSafariCredentialStoreClass();
  v11 = MEMORY[0x24BDAC760];
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke;
  v87[3] = &unk_250853678;
  v89 = v90;
  v12 = v9;
  v88 = v12;
  objc_msgSend(SFSafariCredentialStoreClass, "getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", v7, v87);
  v13 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    AFCredentialManagerOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s AFCTester: Timeout on getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:"), "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:].cold.2(v15, buf, v14);
    }

    v8[2](v8, 0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v103 = buf;
    v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__0;
    v106 = __Block_byref_object_dispose__0;
    v107 = 0;
    +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v103 + 5);
    *((_QWORD *)v103 + 5) = v18;

    v20 = (void *)*((_QWORD *)v103 + 5);
    if (!v20 || !objc_msgSend(v20, "length"))
    {
      AFCredentialManagerOSLogFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Localized Hide My Email text is nil"), "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFCredentialManager generateSignupAutoFillWithAutoFillMode:documentTraits:completionHandler:].cold.1(v22, (uint64_t)v101, v21);
      }

      v23 = (void *)*((_QWORD *)v103 + 5);
      *((_QWORD *)v103 + 5) = CFSTR("Hide My Email");

    }
    v75 = 0;
    v76 = (uint64_t)&v75;
    v77 = 0x2050000000;
    v24 = (void *)getAKAccountManagerClass_softClass;
    v78 = (uint64_t (*)(uint64_t, uint64_t))getAKAccountManagerClass_softClass;
    if (!getAKAccountManagerClass_softClass)
    {
      v81 = v11;
      v82 = 3221225472;
      v83 = (uint64_t)__getAKAccountManagerClass_block_invoke;
      v84 = (uint64_t (*)(uint64_t, uint64_t))&unk_2508535B8;
      v85 = (void (*)(uint64_t))&v75;
      __getAKAccountManagerClass_block_invoke((uint64_t)&v81);
      v24 = *(void **)(v76 + 24);
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v75, 8);
    objc_msgSend(v25, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    v82 = (uint64_t)&v81;
    v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__0;
    v85 = __Block_byref_object_dispose__0;
    v92 = 0;
    v93 = (uint64_t)&v92;
    v94 = 0x2050000000;
    v27 = (void *)getAKPrivateEmailControllerClass_softClass;
    v95 = (void *)getAKPrivateEmailControllerClass_softClass;
    if (!getAKPrivateEmailControllerClass_softClass)
    {
      v75 = v11;
      v76 = 3221225472;
      v77 = (uint64_t)__getAKPrivateEmailControllerClass_block_invoke;
      v78 = (uint64_t (*)(uint64_t, uint64_t))&unk_2508535B8;
      v79 = (void (*)(uint64_t))&v92;
      __getAKPrivateEmailControllerClass_block_invoke((uint64_t)&v75);
      v27 = *(void **)(v93 + 24);
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v92, 8);
    v86 = objc_alloc_init(v28);
    objc_msgSend(v26, "primaryAuthKitAccount");
    v29 = objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v76 = (uint64_t)&v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__0;
    v79 = __Block_byref_object_dispose__0;
    v43 = (void *)v29;
    objc_msgSend(v26, "altDSIDForAccount:");
    v80 = (id)objc_claimAutoreleasedReturnValue();
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2810000000;
    v73[3] = "";
    v74 = 0;
    v66[0] = v11;
    v66[1] = 3221225472;
    v66[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_69;
    v66[3] = &unk_250853718;
    v30 = v44;
    v67 = v30;
    v31 = v7;
    v68 = v31;
    v70 = buf;
    v71 = &v75;
    v72 = v73;
    v32 = v8;
    v69 = v32;
    v33 = (void *)MEMORY[0x23B803990](v66);
    v57[0] = v11;
    v57[1] = 3221225472;
    v57[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_73;
    v57[3] = &unk_250853768;
    v58 = v31;
    v62 = &v75;
    v34 = v30;
    v59 = v34;
    v63 = &v81;
    v64 = buf;
    v65 = v73;
    v35 = v32;
    v60 = v35;
    v36 = v33;
    v61 = v36;
    v37 = (void *)MEMORY[0x23B803990](v57);
    v97 = 0;
    v98 = &v97;
    v99 = 0x2050000000;
    v38 = (void *)getCSFFeatureManagerClass_softClass;
    v100 = getCSFFeatureManagerClass_softClass;
    if (!getCSFFeatureManagerClass_softClass)
    {
      v92 = v11;
      v93 = 3221225472;
      v94 = (uint64_t)__getCSFFeatureManagerClass_block_invoke;
      v95 = &unk_2508535B8;
      v96 = &v97;
      __getCSFFeatureManagerClass_block_invoke((uint64_t)&v92);
      v38 = (void *)v98[3];
    }
    v39 = objc_retainAutorelease(v38);
    _Block_object_dispose(&v97, 8);
    v48[0] = v11;
    v48[1] = 3221225472;
    v48[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76;
    v48[3] = &unk_2508537E0;
    v52 = v73;
    v40 = v35;
    v50 = v40;
    v53 = v90;
    v54 = &v75;
    v49 = v34;
    v55 = &v81;
    v56 = buf;
    v41 = v37;
    v51 = v41;
    objc_msgSend(v39, "requestFeatureWithId:completion:", CFSTR("mail.hide-my-email.create"), v48);
    v42 = dispatch_time(0, 200000000);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_87;
    block[3] = &unk_250853808;
    v47 = v73;
    v46 = v40;
    dispatch_after(v42, MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(buf, 8);

  }
  _Block_object_dispose(v90, 8);

}

intptr_t __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCE30];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithArray:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_69(uint64_t a1)
{
  id SFSafariCredentialStoreClass;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;

  SFSafariCredentialStoreClass = getSFSafariCredentialStoreClass();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2;
  v6[3] = &unk_2508536F0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v10 = v5;
  v8 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(SFSafariCredentialStoreClass, "bestDomainForAppID:completionHandler:", v3, v6);

}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  AFSuggestion *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  if (!v3)
    v4 = (void *)a1[4];
  v5 = v4;
  v6 = -[AFSuggestion initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:]([AFSuggestion alloc], "initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v5, a1[5], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), 11);
  v7 = (unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) != 0)
  {
    AFCredentialManagerOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_73(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = (void *)objc_msgSend(objc_alloc((Class)getAKPrivateEmailContextClass()), "initWithKey:altDSID:clientAppBundleId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_74;
  v9[3] = &unk_250853740;
  v5 = *(void **)(v4 + 40);
  v9[1] = 3221225472;
  v14 = v3;
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v8 = *(_QWORD *)(a1 + 88);
  v15 = v7;
  v16 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v5, "lookupPrivateEmailWithContext:completion:", v2, v9);

}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_74(_QWORD *a1, void *a2)
{
  void *v3;
  AFSuggestion *v4;
  unsigned __int8 *v5;
  unsigned __int8 v6;
  NSObject *v7;

  objc_msgSend(a2, "privateEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[AFSuggestion initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:]([AFSuggestion alloc], "initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), a1[4], a1[5], *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), 11);
    v5 = (unsigned __int8 *)(*(_QWORD *)(a1[10] + 8) + 32);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(1u, v5));
    if ((v6 & 1) != 0)
    {
      AFCredentialManagerOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();

    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  char v30;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    AFCredentialManagerOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_3((uint64_t)v6);
LABEL_12:

    v17 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(1u, v17));
    if ((v18 & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if ((objc_msgSend(v5, "canUse") & 1) == 0)
  {
    AFCredentialManagerOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_2();
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "canUse"))
  {
    AFCredentialManagerOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_1(v8);

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_83;
      v19[3] = &unk_2508537B8;
      v9 = *(_QWORD *)(a1 + 72);
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v19[1] = 3221225472;
      v23 = v9;
      v11 = *(id *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 80);
      v12 = *(_QWORD *)(a1 + 88);
      v20 = v11;
      v24 = v13;
      v25 = v29;
      v14 = *(_QWORD *)(a1 + 56);
      v26 = v12;
      v27 = v14;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 64);
      v21 = v15;
      v28 = v16;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(v29, 8);
  }
LABEL_16:

}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_83(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a2;
  v8 = objc_alloc((Class)getAKPrivateEmailContextClass());
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:altDSID:clientAppBundleId:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_84;
  v18[3] = &unk_250853790;
  v27 = a4;
  v23 = *(_OWORD *)(a1 + 72);
  v19 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 56);
  v20 = v12;
  v14 = *(_QWORD *)(a1 + 88);
  v24 = v13;
  v25 = v14;
  v15 = *(id *)(a1 + 40);
  v28 = a3;
  v16 = *(_QWORD *)(a1 + 96);
  v21 = v15;
  v26 = v16;
  v22 = *(id *)(a1 + 48);
  v17 = v7;
  objc_msgSend(v11, "lookupPrivateEmailWithContext:completion:", v10, v18);

}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_84(uint64_t a1, void *a2)
{
  void *v3;
  AFSuggestion *v4;
  uint64_t v5;
  void *v6;
  AFSuggestion *v7;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;

  objc_msgSend(a2, "privateEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 104) = 1;
    v4 = [AFSuggestion alloc];
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AFSuggestion initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:](v4, "initWithTitle:applicationKey:applicationBundleId:altDSID:customInfoType:", v5, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), 11);

    v8 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(1u, v8));
    if ((v9 & 1) != 0)
    {
      AFCredentialManagerOSLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 112);
    if (v10 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count") - 1
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_87(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *v4;

  v1 = result;
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    AFCredentialManagerOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_87_cold_1();

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (id)oneTimeCodeProvider
{
  return self->_oneTimeCodeProvider;
}

- (void)generateOneTimeCodeAutoFillSuggestionsWithDocumentTraits:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  AFSuggestion *v26;
  void (**v27)(id, void *);
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  const __CFString *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("one-time-code"));

  if (v9)
    v10 = 2;
  else
    v10 = 0;
  -[AFCredentialManager oneTimeCodeProvider](self, "oneTimeCodeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autofillContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_WebViewURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:", v12, v14, 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "count") >= 4)
  {
    objc_msgSend(v15, "subarrayWithRange:", 0, 3);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v21, "localizedTitleForContext:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedSubtitleForContext:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = CFSTR("OneTimeCode");
        v35 = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "source") == 2)
          v25 = 10;
        else
          v25 = 7;
        v26 = -[AFSuggestion initWithTitle:subtitle:oneTimeCodePayload:customInfoType:]([AFSuggestion alloc], "initWithTitle:subtitle:oneTimeCodePayload:customInfoType:", v22, v23, v24, v25);
        objc_msgSend(v29, "addObject:", v26);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v18);
  }

  v27[2](v27, v29);
}

- (void)_consumeOneTimeCodeAutoFillSuggestionIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "oneTimeCodePayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OneTimeCode"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AFCredentialManager oneTimeCodeProvider](self, "oneTimeCodeProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "consumeOneTimeCode:", v6);

  }
}

- (BOOL)shouldAuthenticateToAcceptAutoFill
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass_0;
  v18 = getMCProfileConnectionClass_softClass_0;
  if (!getMCProfileConnectionClass_softClass_0)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = (uint64_t)__getMCProfileConnectionClass_block_invoke_0;
    v13 = &unk_2508535B8;
    v14 = &v15;
    __getMCProfileConnectionClass_block_invoke_0((uint64_t)&v10);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = (uint64_t)&v10;
  v12 = 0x2020000000;
  v5 = (_QWORD *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0;
  v13 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0)
  {
    v6 = (void *)ManagedConfigurationLibrary_0();
    v5 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(_QWORD *)(v11 + 24) = v5;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0 = (uint64_t)v5;
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    v9 = (_Unwind_Exception *)-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:].cold.3();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v9);
  }
  v7 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *v5) == 1;

  return v7;
}

- (void)shouldAcceptAutoFill:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  int v53;
  void *v54;
  id v55;
  __CFString *v56;
  void *v57;
  void (**v58)(_QWORD, _QWORD, _QWORD);
  id v59;
  _QWORD v60[5];
  void (**v61)(_QWORD, _QWORD, _QWORD);
  char v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  BOOL v71;
  _QWORD v72[5];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[4];
  _QWORD v80[6];

  v80[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v59 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    if (v10)
    {
      v14 = objc_msgSend(v10, "customInfoType");
      v15 = objc_msgSend(v10, "customInfoType");
      v16 = objc_msgSend(v10, "customInfoType");
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke;
      v67[3] = &unk_250853830;
      v71 = v15 == 12;
      v67[4] = self;
      v55 = v59;
      v68 = v55;
      v69 = v10;
      v70 = v13;
      v58 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23B803990](v67);
      if (-[AFCredentialManager shouldAuthenticateToAcceptAutoFill](self, "shouldAuthenticateToAcceptAutoFill")
        && (v14 == 5 || v15 == 12 || v16 == 10))
      {
        objc_msgSend(v11, "bundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFCredentialManager obtainBundleIdentifierFromConnection:](self, "obtainBundleIdentifierFromConnection:", v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v73 = 0;
        v74 = &v73;
        v75 = 0x2050000000;
        v19 = (void *)getLAContextClass_softClass_0;
        v76 = getLAContextClass_softClass_0;
        if (!getLAContextClass_softClass_0)
        {
          v72[0] = MEMORY[0x24BDAC760];
          v72[1] = 3221225472;
          v72[2] = __getLAContextClass_block_invoke_0;
          v72[3] = &unk_2508535B8;
          v72[4] = &v73;
          __getLAContextClass_block_invoke_0((uint64_t)v72);
          v19 = (void *)v74[3];
        }
        v20 = objc_retainAutorelease(v19);
        _Block_object_dispose(&v73, 8);
        v21 = objc_alloc_init(v20);
        -[AFCredentialManager setLaContext:](self, "setLaContext:", v21);

        v57 = (void *)MGCopyAnswer();
        if (v14 == 5)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizationManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:", CFSTR("AUTOFILL_AUTH_PASSCODE_TITLE"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@"), &v66, v57);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v27 = v66;
          v28 = &stru_250853C50;
          if (v26)
            v28 = v26;
          v56 = v28;

          if (v27)
          {
            AFCredentialManagerOSLogFacility();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.2((uint64_t)v27);

          }
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizationManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:", CFSTR("AUTOFILL_AUTH_ALERT_TITLE"));
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else if (v16 == 10)
        {
          v33 = (void *)MEMORY[0x24BDD17C8];
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizationManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringForKey:", CFSTR("TOTP_AUTOFILL_AUTH_PASSCODE_TITLE"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0;
          objc_msgSend(v33, "stringWithValidatedFormat:validFormatSpecifiers:error:", v36, CFSTR("%@"), &v65, v57);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v27 = v65;
          v38 = &stru_250853C50;
          if (v37)
            v38 = v37;
          v56 = v38;

          if (v27)
          {
            AFCredentialManagerOSLogFacility();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.3((uint64_t)v27);

          }
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizationManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:", CFSTR("TOTP_AUTOFILL_AUTH_ALERT_TITLE"));
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 != 12)
            -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.5();
          v40 = (void *)MEMORY[0x24BDD17C8];
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizationManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:", CFSTR("PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0;
          objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v43, CFSTR("%@"), &v64, v57);
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v27 = v64;
          v45 = &stru_250853C50;
          if (v44)
            v45 = v44;
          v56 = v45;

          if (v27)
          {
            AFCredentialManagerOSLogFacility();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.4((uint64_t)v27);

          }
          +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizationManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForKey:", CFSTR("PASSKEY_AUTOFILL_AUTH_ALERT_TITLE"));
          v32 = objc_claimAutoreleasedReturnValue();
        }
        v47 = (void *)v32;

        if (!v47)
          -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.1();
        if (objc_msgSend(v11, "processId"))
        {
          v79[0] = &unk_250855CD0;
          v79[1] = &unk_250855CE8;
          v80[0] = v47;
          v80[1] = v56;
          v80[2] = MEMORY[0x24BDBD1C8];
          v79[2] = &unk_250855D00;
          v79[3] = &unk_250855D18;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "processId"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v80[3] = v48;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v77[0] = &unk_250855CD0;
          v77[1] = &unk_250855CE8;
          v78[0] = v47;
          v78[1] = v56;
          v77[2] = &unk_250855D00;
          v78[2] = MEMORY[0x24BDBD1C8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[AFCredentialManager laContext](self, "laContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
        v51 = objc_msgSend(v50, "canEvaluatePolicy:error:", 2, &v63);
        v52 = v63;

        if (v51)
        {
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.springboard"))
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v58[2](v58, 0, 0);
            v53 = 1;
          }
          else
          {
            v53 = 0;
          }
          -[AFCredentialManager laContext](self, "laContext");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = MEMORY[0x24BDAC760];
          v60[1] = 3221225472;
          v60[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_121;
          v60[3] = &unk_250853858;
          v60[4] = self;
          v62 = v53;
          v61 = v58;
          objc_msgSend(v54, "evaluatePolicy:options:reply:", 2, v49, v60);

          if (v53)
            -[AFCredentialManager setQueuedUnauthenticatedCustomInfo:](self, "setQueuedUnauthenticatedCustomInfo:", v55);

        }
        else
        {
          -[AFCredentialManager setLaContext:](self, "setLaContext:", 0);
          v58[2](v58, 1, 0);
        }

      }
      else
      {
        v58[2](v58, 1, 0);
      }

    }
    else
    {
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
  }

}

void __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a2 && *(_BYTE *)(a1 + 64))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Passkey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userSelectedPasskey:authenticatedLAContext:", v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "_consumeOneTimeCodeAutoFillSuggestionIfNeeded:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_121(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queuedUnauthenticatedCustomInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3 && *(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "queuedUnauthenticatedCustomInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setQueuedCustomInfo:", v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "setQueuedUnauthenticatedCustomInfo:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "laContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 48))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_2;
    v7[3] = &unk_250853518;
    v10 = *(id *)(a1 + 40);
    v8 = v3;
    v9 = v6;
    AFDispatchAsync(MEMORY[0x24BDAC9B8], v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "setLaContext:", 0);

}

uint64_t __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.AutoFillCore.AFOneTimeCodeSuggestionsDidChangeNotification"), 0);

}

- (NSDictionary)queuedCustomInfo
{
  return self->_queuedCustomInfo;
}

- (void)setQueuedCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_queuedCustomInfo, a3);
}

- (NSDictionary)queuedUnauthenticatedCustomInfo
{
  return self->_queuedUnauthenticatedCustomInfo;
}

- (void)setQueuedUnauthenticatedCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, a3);
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
  objc_storeStrong((id *)&self->_laContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, 0);
  objc_storeStrong((id *)&self->_queuedCustomInfo, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);
  objc_storeStrong((id *)&self->_passkeyProvider, 0);
}

- (void)obtainApplicationIdentifierFromConnection:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint8_t v9;

  v8 = *a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Cannot obtain application identifier: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager obtainApplicationIdentifierFromConnection:]", v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)hasAutoFillContextEntitlementForConnection:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint8_t v9;

  v8 = *a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Cannot obtain AutoFill context: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager hasAutoFillContextEntitlementForConnection:]", v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)_suggestionForPasswordCredential:(uint64_t)a1 autoFillPayload:customInfoType:.cold.1(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key SAFARI_CREDENTIAL_DATE: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager _suggestionForPasswordCredential:autoFillPayload:customInfoType:]", a1, v9);

  OUTLINED_FUNCTION_0();
}

- (void)_suggestionForPasskey:(uint64_t)a1 autoFillPayload:customInfoType:.cold.1(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key SAFARI_PASSKEY_SITE_SHORT: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager _suggestionForPasskey:autoFillPayload:customInfoType:]", a1, v9);

  OUTLINED_FUNCTION_0();
}

- (void)generateSignupAutoFillWithAutoFillMode:(void *)a1 documentTraits:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_236D9D000, a3, (uint64_t)a3, "%@", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:completionHandler:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s documentTraits one or both of bundleId and appId not set properly"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]", v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:completionHandler:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s documentTraits is nil"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]", v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)generateHideMyEmailSuggestionWithApplicationBundleId:(void *)a1 applicationId:(uint8_t *)buf completionHandler:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_236D9D000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Timeout before handler completed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke_2", v7, v8);

  OUTLINED_FUNCTION_0();
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s HME: feature is available for user"), "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_236D9D000, a1, v3, "%@", v4);

  OUTLINED_FUNCTION_0();
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s HME: feature is unavailable for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", v7, v8);

  OUTLINED_FUNCTION_0();
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_76_cold_3(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s HME: %@ on requestFeatureWithId:completion: HideMyEmail"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", a1, v9);

  OUTLINED_FUNCTION_0();
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_87_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Timeout before Hide My Email completed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:.cold.1()
{
  __assert_rtn("-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", "AFCredentialManager.m", 804, "localizedAuthTitle");
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.2(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key AUTOFILL_AUTH_PASSCODE_TITLE: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);

  OUTLINED_FUNCTION_0();
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.3(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key TOTP_AUTOFILL_AUTH_PASSCODE_TITLE: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);

  OUTLINED_FUNCTION_0();
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.4(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE: %@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_236D9D000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);

  OUTLINED_FUNCTION_0();
}

- (void)shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:.cold.5()
{
  __assert_rtn("-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", "AFCredentialManager.m", 803, "localizedPasscodeTitle");
}

@end
