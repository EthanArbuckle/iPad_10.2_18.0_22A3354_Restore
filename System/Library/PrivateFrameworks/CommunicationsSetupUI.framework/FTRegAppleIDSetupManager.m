@implementation FTRegAppleIDSetupManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  return (id)sharedInstance___instance;
}

void __42__FTRegAppleIDSetupManager_sharedInstance__block_invoke()
{
  FTRegAppleIDSetupManager *v0;
  void *v1;

  v0 = objc_alloc_init(FTRegAppleIDSetupManager);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (FTRegAppleIDSetupManager)init
{
  FTRegAppleIDSetupManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *setupOperations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTRegAppleIDSetupManager;
  v2 = -[FTRegAppleIDSetupManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    setupOperations = v2->_setupOperations;
    v2->_setupOperations = v3;

  }
  return v2;
}

- (IDSAccountController)iMessageAccountController
{
  IDSAccountController *iMessageAccountController;
  id v4;
  IDSAccountController *v5;
  IDSAccountController *v6;

  iMessageAccountController = self->_iMessageAccountController;
  if (!iMessageAccountController)
  {
    v4 = objc_alloc(MEMORY[0x24BE4FBE0]);
    v5 = (IDSAccountController *)objc_msgSend(v4, "initWithService:", *MEMORY[0x24BE4FB70]);
    v6 = self->_iMessageAccountController;
    self->_iMessageAccountController = v5;

    iMessageAccountController = self->_iMessageAccountController;
  }
  return iMessageAccountController;
}

- (IDSAccountController)faceTimeAccountController
{
  IDSAccountController *faceTimeAccountController;
  id v4;
  IDSAccountController *v5;
  IDSAccountController *v6;

  faceTimeAccountController = self->_faceTimeAccountController;
  if (!faceTimeAccountController)
  {
    v4 = objc_alloc(MEMORY[0x24BE4FBE0]);
    v5 = (IDSAccountController *)objc_msgSend(v4, "initWithService:", *MEMORY[0x24BE4FB58]);
    v6 = self->_faceTimeAccountController;
    self->_faceTimeAccountController = v5;

    faceTimeAccountController = self->_faceTimeAccountController;
  }
  return faceTimeAccountController;
}

- (id)accountControllerForService:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE4FB70]) & 1) != 0)
    -[FTRegAppleIDSetupManager iMessageAccountController](self, "iMessageAccountController");
  else
    -[FTRegAppleIDSetupManager faceTimeAccountController](self, "faceTimeAccountController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_cleanup
{
  -[FTRegAppleIDSetupManager setSetupOperations:](self, "setSetupOperations:", 0);
  -[FTRegAppleIDSetupManager setCandidateAliases:](self, "setCandidateAliases:", 0);
  -[FTRegAppleIDSetupManager setSelectedAliases:](self, "setSelectedAliases:", 0);
  -[FTRegAppleIDSetupManager setHandler:](self, "setHandler:", 0);
}

- (void)_notifySuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v4 = a3;
  v9 = a4;
  -[FTRegAppleIDSetupManager handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FTRegAppleIDSetupManager handler](self, "handler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v7, "copy");

    -[FTRegAppleIDSetupManager setHandler:](self, "setHandler:", 0);
    ((void (**)(_QWORD, _BOOL8, id))v8)[2](v8, v4, v9);

  }
  -[FTRegAppleIDSetupManager _cleanup](self, "_cleanup");

}

- (void)_notifySuccess
{
  -[FTRegAppleIDSetupManager _notifySuccess:error:](self, "_notifySuccess:error:", 1, 0);
}

- (void)_notifyFailureWithError:(id)a3
{
  -[FTRegAppleIDSetupManager _notifySuccess:error:](self, "_notifySuccess:error:", 0, a3);
}

- (id)_aliasesForDictionary:(id)a3
{
  return 0;
}

- (id)_appleID
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__FTRegAppleIDSetupManager__appleID__block_invoke;
  v5[3] = &unk_24D0763A8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__FTRegAppleIDSetupManager__appleID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  IDSParseAuthDictionary();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE4FD48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
    if (a4)
      *a4 = 1;
  }

}

- (BOOL)_shouldAttemptAccountRegistration
{
  FTRegAppleIDSetupManager *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__FTRegAppleIDSetupManager__shouldAttemptAccountRegistration__block_invoke;
  v5[3] = &unk_24D0763D0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __61__FTRegAppleIDSetupManager__shouldAttemptAccountRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IDSParseAuthDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE4FD48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "intValue");

  v7 = (id *)MEMORY[0x24BE4FB70];
  if (v6 != 1)
    v7 = (id *)MEMORY[0x24BE4FB58];
  v8 = *v7;
  objc_msgSend(*(id *)(a1 + 32), "accountControllerForService:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountWithLoginID:service:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "isActive") || objc_msgSend(v11, "registrationStatus") != 5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  csui_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Should attempt registration: %@ for account %@", (uint8_t *)&v14, 0x16u);
  }

}

- (void)addSetupDictionary:(id)a3 forService:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = a3;
    csui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a4;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Adding setup dictionary for service type: %ld", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_35_0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
    -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v8);

    -[FTRegAppleIDSetupManager _updateCandidateAliases](self, "_updateCandidateAliases");
  }
}

void __58__FTRegAppleIDSetupManager_addSetupDictionary_forService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isEqual:", CFSTR("password"));
  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      v9 = "  => password : REDACTED";
      v10 = v7;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v9 = "  => %@ : %@";
    v10 = v7;
    v11 = 22;
    goto LABEL_6;
  }

}

- (BOOL)_shouldShowAliasSelectionUI
{
  void *v3;
  __CFString *v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  unint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[FTRegAppleIDSetupManager _shouldAttemptAccountRegistration](self, "_shouldAttemptAccountRegistration"))
  {
    -[FTRegAppleIDSetupManager candidateAliases](self, "candidateAliases");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (__CFString *)_IDSCopyOrderedAliases();
    v5 = -[__CFString count](v4, "count");
    csui_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "  => Squashed sorted candidates: %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = -[FTRegAppleIDSetupManager showsPhoneNumberDisplayString](self, "showsPhoneNumberDisplayString");
    v8 = 1;
    if (v7)
      v8 = 2;
    v9 = v5 > v8;

  }
  else
  {
    v9 = 0;
  }
  csui_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v9)
      v11 = CFSTR("YES");
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "shouldShowAliasSelectionUI: %@", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

- (BOOL)shouldShowAliasSelectionUI
{
  -[FTRegAppleIDSetupManager _updateCandidateAliases](self, "_updateCandidateAliases");
  return -[FTRegAppleIDSetupManager _shouldShowAliasSelectionUI](self, "_shouldShowAliasSelectionUI");
}

- (BOOL)aliasIsEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  char v11;

  v4 = a3;
  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("YOUR_NUMBER_STRING"), &stru_24D077260, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else if (-[FTRegAppleIDSetupManager showsPhoneNumberDisplayString](self, "showsPhoneNumberDisplayString"))
  {
    -[FTRegAppleIDSetupManager phoneNumberDisplayString](self, "phoneNumberDisplayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

    v9 = v11 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)showsPhoneNumberDisplayString
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSMSIdentification");

  return v3;
}

- (id)phoneNumberDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (-[FTRegAppleIDSetupManager showsPhoneNumberDisplayString](self, "showsPhoneNumberDisplayString"))
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "telephoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_stripFZIDPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
      CNFRegFormattedPhoneNumberForString(v4);
    else
      CNFRegLocalPhoneNumberDisplayString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateSelectionSummaryText
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  char v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  FTRegAppleIDSetupManager *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[FTRegAppleIDSetupManager _appleID](self, "_appleID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v37 = self;
  -[FTRegAppleIDSetupManager selectedAliases](self, "selectedAliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v4)
  {

LABEL_27:
    -[FTRegAppleIDSetupManager setSelectionSummaryText:](v37, "setSelectionSummaryText:", 0);
    v7 = 0;
    goto LABEL_38;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v39;
  obj = v3;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v39 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      CommunicationsSetupUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("YOUR_NUMBER_STRING"), &stru_24D077260, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v13);

      if (v14)
      {
        v20 = v10;

LABEL_22:
        v7 = v20;
        v19 = obj;
        goto LABEL_23;
      }
      if (-[FTRegAppleIDSetupManager showsPhoneNumberDisplayString](v37, "showsPhoneNumberDisplayString"))
      {
        -[FTRegAppleIDSetupManager phoneNumberDisplayString](v37, "phoneNumberDisplayString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v10, "isEqualToString:", v15);

        if (v16)
        {
          v20 = v10;

          v6 = objc_msgSend(v20, "_appearsToBePhoneNumber");
          goto LABEL_22;
        }
      }
      if (((v7 != 0) & v6) != 0)
      {
        v6 = 1;
        continue;
      }
      v17 = objc_msgSend(v10, "_appearsToBePhoneNumber");
      if ((v17 & 1) == 0 && v7)
      {
        if (!objc_msgSend(v10, "isEqualToString:", v35))
          continue;
        v17 = 0;
      }
      v18 = v10;

      v6 = v17;
      v7 = v18;
    }
    v19 = obj;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v5)
      continue;
    break;
  }
LABEL_23:

  if (!v7)
    goto LABEL_27;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "callingAvailable");

  if (v14)
  {
    CommunicationsSetupUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v22 & 1) != 0)
      v25 = CFSTR("BUDDY_CALLERID_GENERIC_PHONE");
    else
      v25 = CFSTR("BUDDY_CALLERID_GENERIC_PHONE_NO_FACETIME_AUDIO");
    objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_24D077260, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTRegAppleIDSetupManager setSelectionSummaryText:](v37, "setSelectionSummaryText:", v30);

  }
  else
  {
    v26 = objc_msgSend(v7, "_appearsToBePhoneNumber") | v6;
    v27 = (void *)MEMORY[0x24BDD17C8];
    CommunicationsSetupUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v26 & 1) != 0)
    {
      if (v22)
        v29 = CFSTR("BUDDY_CALLERID_UNQUOTED");
      else
        v29 = CFSTR("BUDDY_CALLERID_UNQUOTED_NO_FACETIME_AUDIO");
    }
    else if (v22)
    {
      v29 = CFSTR("BUDDY_CALLERID_QUOTED");
    }
    else
    {
      v29 = CFSTR("BUDDY_CALLERID_QUOTED_NO_FACETIME_AUDIO");
    }
    CNFStringKeyForIdiom(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", v31, &stru_24D077260, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v33, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[FTRegAppleIDSetupManager setSelectionSummaryText:](v37, "setSelectionSummaryText:", v34);
  }
LABEL_38:

}

- (void)_updateCandidateAliases
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t v32[128];
  uint8_t v33[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  csui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Updating candidate aliases", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v4 = (void *)MEMORY[0x2199B8CB8]();
  -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke;
  v25[3] = &unk_24D0763A8;
  v25[4] = buf;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_autoreleasePoolPop(v4);
  objc_msgSend(*((id *)v27 + 5), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_IDSCopyOrderedAliases();

  csui_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)*((_QWORD *)v27 + 5);
    *(_DWORD *)v33 = 138412290;
    v34 = v9;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Candidates: %@", v33, 0xCu);
  }

  csui_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v33 = 138412290;
    v34 = v7;
    _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "Sorted candidate aliases: %@", v33, 0xCu);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[FTRegAppleIDSetupManager showsPhoneNumberDisplayString](self, "showsPhoneNumberDisplayString"))
  {
    -[FTRegAppleIDSetupManager phoneNumberDisplayString](self, "phoneNumberDisplayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "_stripFZIDPrefix", (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "_appearsToBePhoneNumber"))
        {
          CNFRegFormattedPhoneNumberForString(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length") && (objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v11, "addObject:", v18);

        }
        else if ((objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v11, "addObject:", v17);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    }
    while (v14);
  }

  csui_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v33 = 138412290;
    v34 = v11;
    _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "Setting candidate aliases to: %@", v33, 0xCu);
  }

  -[FTRegAppleIDSetupManager setCandidateAliases:](self, "setCandidateAliases:", v11);
  -[FTRegAppleIDSetupManager setSelectedAliases:](self, "setSelectedAliases:", v11);
  csui_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "...Done", v33, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  IDSParseAuthDictionary();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FD50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:", &__block_literal_global_56);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "intersectSet:", v5);
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v3);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }

  }
}

id __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("uri"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v4, "intValue");
  if ((_DWORD)v2 == 5051)
  {
    objc_msgSend(v3, "_stripFZIDPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setSelectedAliases:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *selectedAliases;
  NSObject *v8;
  int v9;
  NSArray *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_selectedAliases != v4)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    selectedAliases = self->_selectedAliases;
    self->_selectedAliases = v6;

    csui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Set selected aliases: %@", (uint8_t *)&v9, 0xCu);
    }

    -[FTRegAppleIDSetupManager _updateSelectionSummaryText](self, "_updateSelectionSummaryText");
  }

}

- (BOOL)beginSetupWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[FTRegAppleIDSetupManager setHandler:](self, "setHandler:", a3);
  -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    csui_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (-[FTRegAppleIDSetupManager _shouldShowAliasSelectionUI](self, "_shouldShowAliasSelectionUI"))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      -[FTRegAppleIDSetupManager selectedAliases](self, "selectedAliases");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Starting setup operation. Should show selection UI:%@  selectedAliases: %@", buf, 0x16u);

    }
    -[FTRegAppleIDSetupManager setupOperations](self, "setupOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_64;
    v15[3] = &unk_24D0764A8;
    v15[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_70;
    v14[3] = &unk_24D075180;
    v14[4] = self;
    v11 = MEMORY[0x24BDAC9B8];
    v12 = v14;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke;
    block[3] = &unk_24D075180;
    block[4] = self;
    v11 = MEMORY[0x24BDAC9B8];
    v12 = block;
  }
  dispatch_async(v11, v12);
  return 1;
}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySuccess");
}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IDSParseAuthDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intValue");

  v6 = (id *)MEMORY[0x24BE4FB70];
  if (v5 != 1)
    v6 = (id *)MEMORY[0x24BE4FB58];
  v7 = *v6;
  objc_msgSend(*(id *)(a1 + 32), "accountControllerForService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedAliases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "showsPhoneNumberDisplayString"))
  {
    v10 = v9;
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v10;
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_65);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsSMSIdentification");

  if (v14)
  {
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v12, "arrayByAddingObject:", *MEMORY[0x24BE4FEE0]);
    else
      IMSingleObjectArray();
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE4FD48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE4FD58]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  csui_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v32 = v7;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, " => Setting up service: %@   with apple id: %@  profile id: %@  aliases: %@", buf, 0x2Au);
  }

  objc_msgSend(v8, "serviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountWithLoginID:service:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "isActive") && objc_msgSend(v20, "registrationStatus") == 5)
  {
    csui_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      v22 = " => Has existing registered account: %@";
      v23 = v21;
      v24 = 12;
LABEL_25:
      _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
  }
  else
  {
    csui_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, " => Existing account: %@", buf, 0xCu);
    }

    if (!objc_msgSend(v20, "isUserDisabled"))
    {
      v27 = v8;
      v28 = v4;
      v29 = v12;
      v30 = v7;
      dispatch_get_global_queue(21, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      IDSRegistrationControlGetStateForRegistrationType();

      v21 = v27;
      goto LABEL_27;
    }
    csui_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = " => Account was disabled by the user, not setting up...";
      v23 = v21;
      v24 = 2;
      goto LABEL_25;
    }
  }
LABEL_27:

}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2()
{
  return IMStripFormattingFromAddress();
}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_66(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  NSObject *v9;

  if (a2 == 1)
  {
    csui_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, " => Do not have permission to use PhoneNumber, not setting up...", v7, 2u);
    }
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "__imSetFromArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2_67;
    v8[3] = &unk_24D076458;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v4, "setupAccountWithSetupParameters:aliases:completionHandler:", v5, v6, v8);

    v2 = v9;
  }

}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2_67(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v10 = 138412802;
    if (a3)
      v9 = CFSTR("YES");
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Got response from setup operation for service: %@. Success=%@, error=%@", (uint8_t *)&v10, 0x20u);
  }

}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySuccess");
}

- (NSMutableDictionary)setupOperations
{
  return self->_setupOperations;
}

- (void)setSetupOperations:(id)a3
{
  objc_storeStrong((id *)&self->_setupOperations, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)candidateAliases
{
  return self->_candidateAliases;
}

- (void)setCandidateAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)selectedAliases
{
  return self->_selectedAliases;
}

- (NSString)selectionSummaryText
{
  return self->_selectionSummaryText;
}

- (void)setSelectionSummaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIMessageAccountController:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageAccountController, a3);
}

- (void)setFaceTimeAccountController:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeAccountController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTimeAccountController, 0);
  objc_storeStrong((id *)&self->_iMessageAccountController, 0);
  objc_storeStrong((id *)&self->_selectionSummaryText, 0);
  objc_storeStrong((id *)&self->_selectedAliases, 0);
  objc_storeStrong((id *)&self->_candidateAliases, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_setupOperations, 0);
}

@end
