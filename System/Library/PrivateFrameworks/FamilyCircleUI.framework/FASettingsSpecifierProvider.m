@implementation FASettingsSpecifierProvider

- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  FASettingsSpecifierProvider *v9;
  FASettingsSpecifierProvider *v10;
  NSMutableArray *v11;
  NSMutableArray *pendingFamilyDetailsCompletionBlocks;
  void *v13;
  NSOperationQueue *v14;
  NSOperationQueue *networkActivityQueue;
  NSOperationQueue *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = -[FASettingsSpecifierProvider init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_presenter, v8);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingFamilyDetailsCompletionBlocks = v10->_pendingFamilyDetailsCompletionBlocks;
    v10->_pendingFamilyDetailsCompletionBlocks = v11;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__handleFamilyChanged_, *MEMORY[0x24BE30928], 0);

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkActivityQueue = v10->_networkActivityQueue;
    v10->_networkActivityQueue = v14;

    v16 = v10->_networkActivityQueue;
    dispatch_get_global_queue(33, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v16, "setUnderlyingQueue:", v17);

  }
  return v10;
}

- (void)setSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_specifiers, a3);
  if (!self->_specifiers && self->_didFailToGetFamilyDetails)
    self->_didFailToGetFamilyDetails = 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[FASettingsSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (id)_accountStore
{
  return (id)-[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
}

- (id)_grandSlamSigner
{
  AAGrandSlamSigner *grandSlamSigner;
  void *v4;
  id v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    -[AIDAAccountManager aidaAccountForService:](self->_accountManager, "aidaAccountForService:", *MEMORY[0x24BE06080]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE049B0]);
    -[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AAGrandSlamSigner *)objc_msgSend(v5, "initWithAccountStore:grandSlamAccount:appTokenID:", v6, v4, *MEMORY[0x24BE04878]);
    v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_requestConfigurator
{
  FARequestConfigurator *requestConfigurator;
  id v4;
  void *v5;
  FARequestConfigurator *v6;
  FARequestConfigurator *v7;

  requestConfigurator = self->_requestConfigurator;
  if (!requestConfigurator)
  {
    v4 = objc_alloc(MEMORY[0x24BE30AE0]);
    -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (FARequestConfigurator *)objc_msgSend(v4, "initWithAccount:", v5);
    v7 = self->_requestConfigurator;
    self->_requestConfigurator = v6;

    requestConfigurator = self->_requestConfigurator;
  }
  return requestConfigurator;
}

- (BOOL)_isEnabled
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "aa_needsToVerifyTerms") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      objc_msgSend(v3, "aa_suspensionInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isFamilySuspended") ^ 1;

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (NSArray)specifiers
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSArray *v16;
  NSArray *specifiers;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode"))
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v5 = "Device is in multi-user mode, not showing Family Sharing specifiers.";
LABEL_12:
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    goto LABEL_13;
  }
  -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v5 = "User not signed in to AppleAccount, not showing family sharing specifiers.";
    goto LABEL_12;
  }
  -[FASettingsSpecifierProvider _familySpecifier](self, "_familySpecifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[FASettingsSpecifierProvider _invitationsCellSpecifier](self, "_invitationsCellSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "insertObject:atIndex:", v7, 0);

LABEL_13:
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Family"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertObject:atIndex:", v8, 0);

  }
  if (!-[FASettingsSpecifierProvider _isEnabled](self, "_isEnabled"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v13 = *MEMORY[0x24BE75A18];
      v14 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setProperty:forKey:", v14, v13, (_QWORD)v20);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

  }
  v16 = (NSArray *)objc_msgSend(v3, "copy", (_QWORD)v20);
  specifiers = self->_specifiers;
  self->_specifiers = v16;

  v18 = self->_specifiers;
  return v18;
}

- (unint64_t)_familyState
{
  unint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_didFailToGetFamilyDetails)
  {
    v2 = 4;
    goto LABEL_10;
  }
  if (self->_isLoadingFamilyDetails)
  {
    v2 = 3;
    goto LABEL_10;
  }
  -[FAFamilyCircle pendingMembers](self->_familyCircle, "pendingMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_8:
    v2 = 1;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInteger:forKey:", v2, CFSTR("_FAFamilyCachedFamilyStateKey"));

    goto LABEL_10;
  }
  -[FAFamilyCircle members](self->_familyCircle, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    goto LABEL_8;
  if (self->_familyEligibilityStatus)
  {
    v2 = 2;
    goto LABEL_9;
  }
  v2 = 0;
LABEL_10:
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v2;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Returning FAFamilySpecifierState - %lu", (uint8_t *)&v10, 0xCu);
  }

  return v2;
}

- (id)_invitationsCellSpecifier
{
  PSSpecifier *invitationsCellSpecifier;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  NSObject *v10;
  uint8_t buf[16];

  if (self->_invitationSummary || self->_isHandlingURLForInvite)
  {
    invitationsCellSpecifier = self->_invitationsCellSpecifier;
    if (!invitationsCellSpecifier)
    {
      v4 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FAMILY_INVITATIONS_CELL"), &stru_24C8A3000, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__valueForInvitiationsSpecifier_, 0, 2, 0);
      v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v8 = self->_invitationsCellSpecifier;
      self->_invitationsCellSpecifier = v7;

      -[PSSpecifier setControllerLoadAction:](self->_invitationsCellSpecifier, "setControllerLoadAction:", sel__pendingInvitationsSpecifierWasTapped_);
      -[PSSpecifier setIdentifier:](self->_invitationsCellSpecifier, "setIdentifier:", CFSTR("INVITATIONS"));
      invitationsCellSpecifier = self->_invitationsCellSpecifier;
    }
    return invitationsCellSpecifier;
  }
  else
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "No invitations returning nil invitations specfier", buf, 2u);
    }

    return 0;
  }
}

- (id)_familySpecifier
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  id result;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("_FAFamilyCachedFamilyStateKey"));

  v5 = v4 && !self->_familyCircle && !self->_didFailToGetFamilyDetails;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v15 = v5;
    v16 = 2048;
    v17 = v4;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Using cache - %d with state - %lu", buf, 0x12u);
  }

  if (self->_familyCircle || self->_didFailToGetFamilyDetails)
  {
    if (v5)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", 0);
  if (!v5)
LABEL_10:
    v4 = -[FASettingsSpecifierProvider _familyState](self, "_familyState");
LABEL_11:
  switch(v4)
  {
    case 1:
      -[FASettingsSpecifierProvider _familyBaseSpecifierWithState:](self, "_familyBaseSpecifierWithState:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setControllerLoadAction:", sel__viewFamilySpecifierWasTapped);
      v8 = CFSTR("Family");
      goto LABEL_17;
    case 2:
      -[FASettingsSpecifierProvider _familyBaseSpecifierWithState:](self, "_familyBaseSpecifierWithState:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtonAction:", sel__setUpFamilySpecifierWasTapped_);
      v8 = CFSTR("INITIATE_FAMILY");
LABEL_17:
      objc_msgSend(v7, "setIdentifier:", v8);
      goto LABEL_20;
    case 3:
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
      return (id)objc_claimAutoreleasedReturnValue();
    case 4:
      v11 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FAILED_TO_LOAD_FAMILY_STATUS"), &stru_24C8A3000, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, 0, 0, 0, 0, -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
LABEL_20:
      result = v7;
      break;
    default:
      _FALogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Invalid family state, returning nil specifier", buf, 2u);
      }

      result = 0;
      break;
  }
  return result;
}

- (id)_familyBaseSpecifierWithState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("family"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FAMILY_CELL_LABEL"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel__valueForFamilySpecifier_, 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v12, CFSTR("_FAFamilyCachedFamilyStateKey"));

  return v11;
}

- (unint64_t)cachePolicy
{
  return 2;
}

- (void)_loadFamilyDetailsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *pendingFamilyDetailsCompletionBlocks;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
    {
      pendingFamilyDetailsCompletionBlocks = self->_pendingFamilyDetailsCompletionBlocks;
      v7 = _Block_copy(v4);
      -[NSMutableArray addObject:](pendingFamilyDetailsCompletionBlocks, "addObject:", v7);

    }
    if (!self->_isLoadingFamilyDetails)
    {
      self->_isLoadingFamilyDetails = 1;
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setCachePolicy:", -[FASettingsSpecifierProvider cachePolicy](self, "cachePolicy"));
      objc_msgSend(v8, "setQualityOfService:", 33);
      objc_msgSend(v8, "setPromptUserToResolveAuthenticatonFailure:", 1);
      _FALogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Starting family request.", buf, 2u);
      }

      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke;
      v11[3] = &unk_24C88CA88;
      v11[4] = self;
      objc_msgSend(v8, "startRequestWithCompletionHandler:", v11);

    }
  }
  else
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to load family details without an Apple Account, bailing!", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  FACacheImageMarqueeOperationWrapper *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper op being fired off", buf, 2u);
  }

  v8 = -[FACacheImageMarqueeOperationWrapper initWithFamilyCircle:]([FACacheImageMarqueeOperationWrapper alloc], "initWithFamilyCircle:", v5);
  -[FACacheImageMarqueeOperationWrapper generateMarqueeWith:](v8, "generateMarqueeWith:", 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_64;
  block[3] = &unk_24C88C190;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_64(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_2;
  v5[3] = &unk_24C88CA60;
  v5[4] = v2;
  return objc_msgSend(v2, "_handleFamilyDetailsResponse:error:completion:", v1, v3, v5);
}

_BYTE *__64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE *result;
  BOOL v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects", (_QWORD)v11);
  result = *(_BYTE **)(a1 + 32);
  if (result[160])
    v10 = a2 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(result, "_setUpFamilySpecifierWasTapped:", 0);
    result = *(_BYTE **)(a1 + 32);
  }
  result[160] = 0;
  return result;
}

- (void)_handleFamilyDetailsResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  FAFamilyCircle **p_familyCircle;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *invitationSummary;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *pendingInvites;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *familyStatusSummary;
  void *v30;
  NSString *v31;
  NSString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  void *v42;
  void *v43;
  NSString *v44;
  NSString *v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  self->_isLoadingFamilyDetails = 0;
  if (!v10)
  {
    p_familyCircle = &self->_familyCircle;
    objc_storeStrong((id *)&self->_familyCircle, a3);
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[FAFamilyCircle _serverResponse](*p_familyCircle, "_serverResponse");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v15;
      _os_log_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEFAULT, "Family details response: %@", buf, 0xCu);

    }
    -[FAFamilyCircle invites](*p_familyCircle, "invites");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 >= 1 && -[FAFamilyCircle shouldShowInvites](*p_familyCircle, "shouldShowInvites"))
    {
      v18 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v19, 0);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      invitationSummary = self->_invitationSummary;
      self->_invitationSummary = v20;

      -[FAFamilyCircle invites](self->_familyCircle, "invites");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (NSMutableArray *)objc_msgSend(v22, "mutableCopy");
      pendingInvites = self->_pendingInvites;
      self->_pendingInvites = v23;

    }
    -[FAFamilyCircle members](*p_familyCircle, "members");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    -[FAFamilyCircle pendingMembers](*p_familyCircle, "pendingMembers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (!(v28 | v26))
    {
      familyStatusSummary = self->_familyStatusSummary;
      self->_familyStatusSummary = 0;

      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __77__FASettingsSpecifierProvider__handleFamilyDetailsResponse_error_completion___block_invoke;
      v46[3] = &unk_24C88CAB0;
      v46[4] = self;
      v47 = v11;
      -[FASettingsSpecifierProvider _loadFamilyEligibilityWithCompletion:](self, "_loadFamilyEligibilityWithCompletion:", v46);

      goto LABEL_26;
    }
    -[FAFamilyCircle me](*p_familyCircle, "me");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "hasLinkediTunesAccount") & 1) == 0)
    {
      objc_msgSend(v30, "iTunesNotLinkedMessage");
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      v32 = self->_familyStatusSummary;
      self->_familyStatusSummary = v31;

      if (!-[NSString length](self->_familyStatusSummary, "length"))
      {
        _FALogSystem();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v30, "appleID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[FAFamilyCircle _serverResponse](*p_familyCircle, "_serverResponse");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v34;
          v50 = 2112;
          v51 = v35;
          _os_log_impl(&dword_20DE41000, v33, OS_LOG_TYPE_DEFAULT, "Member %@ is not sharing purchases but there is no iTunesNotLinkedMessage, response dictionary is %@", buf, 0x16u);

        }
      }
    }
    if (!self->_familyStatusSummary)
    {
      if (v26 > 1)
      {
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FAMILY_MEMBERS_IN_FAMILY"), &stru_24C8A3000, CFSTR("Localizable"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringWithFormat:", v38, v26);
        v39 = (NSString *)objc_claimAutoreleasedReturnValue();
        v40 = self->_familyStatusSummary;
        self->_familyStatusSummary = v39;

LABEL_24:
        goto LABEL_25;
      }
      if (v28 >= 1)
      {
        if (v28 == 1)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FAMILY_SENT_INVITE_ONE"), &stru_24C8A3000, CFSTR("Localizable"));
          v41 = (NSString *)objc_claimAutoreleasedReturnValue();
          v38 = self->_familyStatusSummary;
          self->_familyStatusSummary = v41;
        }
        else
        {
          v42 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FAMILY_SENT_INVITES_MANY"), &stru_24C8A3000, CFSTR("Localizable"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v28);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", v38, v43);
          v44 = (NSString *)objc_claimAutoreleasedReturnValue();
          v45 = self->_familyStatusSummary;
          self->_familyStatusSummary = v44;

        }
        goto LABEL_24;
      }
    }
LABEL_25:
    -[FASettingsSpecifierProvider reloadSpecifiers](self, "reloadSpecifiers");
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);

    goto LABEL_26;
  }
  self->_didFailToGetFamilyDetails = 1;
  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v10;
    _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get family details: %@", buf, 0xCu);
  }

  -[FASettingsSpecifierProvider reloadSpecifiers](self, "reloadSpecifiers");
  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_26:

}

uint64_t __77__FASettingsSpecifierProvider__handleFamilyDetailsResponse_error_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setUpFamilySpecifierWasTapped:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  int64_t familyEligibilityStatus;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v9 = 138412290;
    v10 = WeakRetained;
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Setup Family activated with presenter %@", (uint8_t *)&v9, 0xCu);

  }
  if (self->_familyEligibilityResponse)
  {
    familyEligibilityStatus = self->_familyEligibilityStatus;
    if (familyEligibilityStatus == 1)
    {
      _FALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Starting Family Setup Flow", (uint8_t *)&v9, 2u);
      }

      -[FASettingsSpecifierProvider _initiateFamily](self, "_initiateFamily");
    }
    else if (familyEligibilityStatus == 2)
    {
      -[FASettingsSpecifierProvider _showUnderageAlertWithEligibilityResponse:](self, "_showUnderageAlertWithEligibilityResponse:");
    }
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Error: The user tapped the Family setup specifier before we got a response from the server. We need to confirm eligibility prior.", (uint8_t *)&v9, 2u);
    }

    self->_delayedEnterInitiateFlow = 1;
  }
}

- (void)_reloadFamily
{
  -[FASettingsSpecifierProvider _clearFamilyState](self, "_clearFamilyState");
  -[FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated:](self, "_reloadFamilySpecifiersAnimated:", 1);
}

- (void)_initiateFamily
{
  -[FASettingsSpecifierProvider _initiateFamilyWithResources:](self, "_initiateFamilyWithResources:", 0);
}

- (void)_initiateFamilyWithResources:(id)a3
{
  id v4;
  FACircleContext *v5;
  FACircleContext *context;
  void *v7;
  id WeakRetained;
  FACircleStateController *v9;
  id v10;
  void *v11;
  FACircleContext *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  FACircleStateController *v22;

  v4 = a3;
  -[FASettingsSpecifierProvider _configureContextWithType:resourceDictionary:](self, "_configureContextWithType:resourceDictionary:", CFSTR("FACircleEventTypeInitiate"), v4);
  v5 = (FACircleContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v5;

  -[NSArray specifierForID:](self->_specifiers, "specifierForID:", CFSTR("INITIATE_FAMILY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:willBeginLoadingSpecifier:", self, v7);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v9 = [FACircleStateController alloc];
  v10 = objc_loadWeakRetained((id *)&self->_presenter);
  v22 = -[FACircleStateController initWithPresenter:](v9, "initWithPresenter:", v10);

  objc_msgSend((id)v18[5], "setPresentationType:", 2);
  v11 = (void *)v18[5];
  v12 = self->_context;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke;
  v14[3] = &unk_24C88CAD8;
  v16 = &v17;
  v14[4] = self;
  v13 = v7;
  v15 = v13;
  objc_msgSend(v11, "performWithContext:completion:", v12, v14);

  _Block_object_dispose(&v17, 8);
}

void __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke_2;
  block[3] = &unk_24C88C190;
  v6 = (void *)a1[5];
  block[4] = a1[4];
  v9 = v6;
  v10 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 48), "loadSuccess");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_reloadFamily");
  return result;
}

- (id)_configureContextWithType:(id)a3 resourceDictionary:(id)a4
{
  id v5;
  id v6;
  FACircleContext *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", v6);

  -[FACircleContext setClientName:](v7, "setClientName:", CFSTR("Preferences"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientAppContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientAppContext"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FACircleContext setClientName:](v7, "setClientName:", v9);

    }
  }

  return v7;
}

- (void)_showUnderageAlertWithEligibilityResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Error: showing underage alert.", buf, 2u);
  }

  objc_msgSend(v4, "underageEligibilityAlertTitle");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underageEligibilityAlertMessage");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v6 | v7)
  {
    v9 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertWithTitle:message:buttonTitle:", v6, v7, v11);
    v8 = objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Server did not provide under alert title and message. Cannot show alert!", v13, 2u);
    }
  }

}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id WeakRetained;
  _QWORD v5[5];

  if (a4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __80__FASettingsSpecifierProvider_familySetupViewController_didCompleteWithSuccess___block_invoke;
    v5[3] = &unk_24C88CA60;
    v5[4] = self;
    -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", v5);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __80__FASettingsSpecifierProvider_familySetupViewController_didCompleteWithSuccess___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = *(id **)(a1 + 32);
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 4);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "_viewFamilySpecifierWasTapped");
  }
  else
  {
    objc_msgSend(v4, "_viewFamilySpecifierWasTapped");
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_valueForInvitiationsSpecifier:(id)a3
{
  return self->_invitationSummary;
}

- (void)_pendingInvitationsSpecifierWasTapped:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v4 = a3;
  if (!self->_familyCircle)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "Error: pending invites specifier cannot possibly be tapped when no family info is available!";
      v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!-[NSMutableArray count](self->_pendingInvites, "count"))
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v7 = "No invites to send to the Invitations VC.";
      v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[PSSpecifier setProperty:forKey:](self->_invitationsCellSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[FASettingsSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierProvider:willBeginLoadingSpecifier:", self, self->_invitationsCellSpecifier);

  -[FASettingsSpecifierProvider _presentPendingInvitesRemoteUI](self, "_presentPendingInvitesRemoteUI");
LABEL_10:

}

- (void)_presentFlowWithEventType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  FACircleContext *v9;
  FACircleStateController *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  FACircleStateController *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v9 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", v6);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v10 = [FACircleStateController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v21 = -[FACircleStateController initWithPresenter:](v10, "initWithPresenter:", WeakRetained);

    v12 = (void *)v17[5];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__FASettingsSpecifierProvider__presentFlowWithEventType_completion___block_invoke;
    v13[3] = &unk_24C88CB00;
    v15 = &v16;
    v14 = v8;
    objc_msgSend(v12, "performWithContext:completion:", v9, v13);

    _Block_object_dispose(&v16, 8);
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v9 = (FACircleContext *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 1, 0, 0);
    ((void (**)(_QWORD, FACircleContext *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:

}

void __68__FASettingsSpecifierProvider__presentFlowWithEventType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)_presentPendingInvitesRemoteUI
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke;
  v2[3] = &unk_24C88CB28;
  v2[4] = self;
  -[FASettingsSpecifierProvider _presentFlowWithEventType:completion:](self, "_presentFlowWithEventType:completion:", CFSTR("FACircleEventTypeGetFamilyInvitationsUI"), v2);
}

void __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke_2;
  block[3] = &unk_24C88B7F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_reloadFamily");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

}

- (id)_valueForFamilySpecifier:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;

  objc_msgSend(a3, "propertyForKey:", CFSTR("_FAFamilyCachedFamilyStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY"), &stru_24C8A3000, CFSTR("Localizable"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_familyStatusSummary;
  }
  return v7;
}

- (void)_viewFamilySpecifierWasTapped
{
  NSDictionary *cachedResourceDictionary;

  -[FASettingsSpecifierProvider _viewFamilyWithResourceDictionary:](self, "_viewFamilyWithResourceDictionary:", self->_cachedResourceDictionary);
  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = 0;

}

- (void)_viewFamilyWithResourceDictionary:(id)a3
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  FAProfilePictureStore *v8;
  FAProfilePictureStore *familyPictureStore;
  FAFamilySettingsMemberSpecifierProvider *v10;
  void *v11;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v12;
  void *v13;
  void *v14;
  FAFamilyCircle *familyCircle;
  FAProfilePictureStore *v16;
  AIDAAccountManager *accountManager;
  void *v18;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v19;
  id v20;
  void *v21;
  FAProfilePictureStore *v22;
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v23;
  FAFamilySettingsMemberSpecifierProvider *v24;
  id v25;
  _QWORD v26[4];
  _TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *v27;
  id v28;
  FASettingsSpecifierProvider *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v25;
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "_viewFamilyWithResourceDictionary: %@", buf, 0xCu);
  }

  -[NSArray specifierForID:](self->_specifiers, "specifierForID:", CFSTR("Family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", self, v5);

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "specifierProvider:willBeginLoadingSpecifier:", self, v5);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Family"), 0, 0, 0, 0, 13, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", CFSTR("Family"));
  }
  if (self->_familyCircle)
  {
    if (!self->_familyPictureStore)
    {
      v8 = -[FAProfilePictureStore initWithFamilyCircle:]([FAProfilePictureStore alloc], "initWithFamilyCircle:", self->_familyCircle);
      familyPictureStore = self->_familyPictureStore;
      self->_familyPictureStore = v8;

    }
    v10 = [FAFamilySettingsMemberSpecifierProvider alloc];
    -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FAFamilySettingsMemberSpecifierProvider initWithAppleAccount:familyCircle:familyPictureStore:](v10, "initWithAppleAccount:familyCircle:familyPictureStore:", v11, self->_familyCircle, self->_familyPictureStore);

    v12 = [_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 alloc];
    -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FASettingsSpecifierProvider _grandSlamSigner](self, "_grandSlamSigner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    familyCircle = self->_familyCircle;
    v16 = self->_familyPictureStore;
    accountManager = self->_accountManager;
    objc_msgSend(MEMORY[0x24BE30AC8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[FAFamilySettingsViewControllerV2 initWithAppleAccount:grandSlamSigner:familyCircle:pictureStore:accountManager:peopleDiscoveryService:](v12, "initWithAppleAccount:grandSlamSigner:familyCircle:pictureStore:accountManager:peopleDiscoveryService:", v13, v14, familyCircle, v16, accountManager, v18);

    -[FAFamilySettingsViewControllerV2 setDelegate:](v19, "setDelegate:", self);
    v20 = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(v20, "rootController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARestorableViewController setRootController:](v19, "setRootController:", v21);

    -[FARestorableViewController setSpecifier:](v19, "setSpecifier:", v5);
    objc_initWeak((id *)buf, self);
    v22 = self->_familyPictureStore;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3;
    v26[3] = &unk_24C88CB50;
    objc_copyWeak(&v31, (id *)buf);
    v23 = v19;
    v27 = v23;
    v28 = v5;
    v29 = self;
    v30 = v25;
    -[FAProfilePictureStore fetchProfileImagesWithCompletion:](v22, "fetchProfileImagesWithCompletion:", v26);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke;
    v32[3] = &unk_24C88C030;
    v32[4] = self;
    v33 = v25;
    -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", v32);

  }
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_2;
  v2[3] = &unk_24C88B958;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_viewFamilyWithResourceDictionary:", *(_QWORD *)(a1 + 40));
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 23);
    objc_msgSend(v4, "specifierProvider:didFinishLoadingSpecifier:", v3, *(_QWORD *)(a1 + 40));

    v5 = objc_loadWeakRetained(v3 + 4);
    objc_msgSend(*(id *)(a1 + 32), "set_presenter:", v5);

    objc_msgSend(*(id *)(a1 + 48), "_presentViewController:", *(_QWORD *)(a1 + 32));
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "fa_eventTypeForFamilyActionURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_presentFlowWithEventType:completion:", v7, 0);

  }
  else
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3_cold_1(a1, v8);

  }
}

- (void)_loadFamilyEligibilityWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke;
  aBlock[3] = &unk_24C88B998;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_2;
  v14[3] = &unk_24C88CBA0;
  v14[4] = self;
  v15 = v4;
  v7 = v4;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_4;
  v11[3] = &unk_24C88CBF0;
  v11[4] = self;
  v12 = v6;
  v13 = _Block_copy(v14);
  v8 = v13;
  v9 = v6;
  v10 = _Block_copy(v11);
  v9[2](v9, v10);

}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x24BE04990];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_grandSlamSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "initWithGrandSlamSigner:", v6);

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setITunesAccount:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04A18]), "initWithRequest:handler:", v10, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addOperation:", v9);

}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_3;
  block[3] = &unk_24C88CB78;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFamilyEligibilityResponse:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "_appleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "statusCode") == 401 && v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    v6 = *MEMORY[0x24BDB4530];
    v18[0] = MEMORY[0x24BDBD1C8];
    v7 = *MEMORY[0x24BDB4520];
    v17[0] = v6;
    v17[1] = v7;
    v16 = *MEMORY[0x24BE04878];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "_accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_97;
    v11[3] = &unk_24C88CBC8;
    v13 = a1[5];
    v14 = a1[6];
    v12 = v3;
    objc_msgSend(v10, "renewCredentialsForAccount:options:completion:", v4, v9, v11);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_98;
    v7[3] = &unk_24C88BA38;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_handleFamilyEligibilityResponse:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, BOOL);
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  AAFamilyEligibilityResponse **p_familyEligibilityResponse;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, BOOL))a4;
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      v12 = "Failed to get family eligibility: %@";
LABEL_6:
      _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);

    }
  }
  else
  {
    self->_familyEligibilityStatus = objc_msgSend(v7, "eligibilityStatus");
    p_familyEligibilityResponse = &self->_familyEligibilityResponse;
    objc_storeStrong((id *)p_familyEligibilityResponse, a3);
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[AAFamilyEligibilityResponse responseDictionary](*p_familyEligibilityResponse, "responseDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      v12 = "Family eligibility response: %@";
      goto LABEL_6;
    }
  }

  v8[2](v8, v9 == 0);
}

- (void)reloadSpecifiers
{
  -[FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated:](self, "_reloadFamilySpecifiersAnimated:", 0);
}

- (void)_reloadFamilySpecifiers
{
  -[FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated:](self, "_reloadFamilySpecifiersAnimated:", 1);
}

- (void)_reloadFamilySpecifiersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSArray *specifiers;
  id WeakRetained;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated: %d", (uint8_t *)v9, 8u);
  }

  v6 = (void *)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v6, v3);

}

- (void)_clearFamilyState
{
  NSObject *v3;
  FAFamilyCircle *familyCircle;
  NSMutableArray *pendingInvites;
  NSString *familyStatusSummary;
  NSString *invitationSummary;
  NSDictionary *cachedResourceDictionary;
  uint8_t v9[16];

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider _clearFamilyState", v9, 2u);
  }

  self->_didFailToGetFamilyDetails = 0;
  familyCircle = self->_familyCircle;
  self->_familyCircle = 0;

  pendingInvites = self->_pendingInvites;
  self->_pendingInvites = 0;

  self->_familyEligibilityStatus = 0;
  familyStatusSummary = self->_familyStatusSummary;
  self->_familyStatusSummary = 0;

  invitationSummary = self->_invitationSummary;
  self->_invitationSummary = 0;

  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = 0;

}

- (BOOL)handleURL:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *cachedResourceDictionary;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = v5;

  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Handle URL in: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aaaction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", CFSTR("showFamilyInvite")))
  {
    -[FASettingsSpecifierProvider _handleShowFamilyInviteActionURL:](self, "_handleShowFamilyInviteActionURL:", v4);
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("setupFamily")))
  {
    -[FASettingsSpecifierProvider _handleStartFamilySetupActionURL:](self, "_handleStartFamilySetupActionURL:", v4);
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("showFamilySettings")))
  {
    -[FASettingsSpecifierProvider _handleShowFamilySettingsURL:](self, "_handleShowFamilySettingsURL:", v4);
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("showFamilySettingsV2")))
  {
    -[FASettingsSpecifierProvider _handleShowFamilySettingsV2WithResourceDictionary:](self, "_handleShowFamilySettingsV2WithResourceDictionary:", v4);
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("showChildTransferRequest")))
  {
    -[FASettingsSpecifierProvider _handleShowChildTransferActionURL:](self, "_handleShowChildTransferActionURL:", v4);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqual:", CFSTR("showAllInvites")))
    {
      v9 = 0;
      goto LABEL_16;
    }
    -[FASettingsSpecifierProvider _handleShowInvitesActionURL:](self, "_handleShowInvitesActionURL:", v4);
  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (void)_handleShowFamilySettingsV2WithResourceDictionary:(id)a3
{
  id v4;

  +[FASwiftUIHostingControllerProvider getSettingsViewControllerWithResourceDictionary:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getSettingsViewControllerWithResourceDictionary:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FASettingsSpecifierProvider _presentViewController:](self, "_presentViewController:", v4);

}

- (void)_presentViewController:(id)a3
{
  id v4;
  PSListController **p_presenter;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  char isKindOfClass;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_presenter = &self->_presenter;
  WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  objc_msgSend(WeakRetained, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) != 0)
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "View Controller %@ already exists in Navigation stack, can't push another", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)p_presenter);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_loadWeakRetained((id *)p_presenter);
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_20DE41000, v13, OS_LOG_TYPE_DEFAULT, "Calling showController with settingsViewController %@ for presenter %@", (uint8_t *)&v18, 0x16u);

      }
      v10 = objc_loadWeakRetained((id *)p_presenter);
      -[NSObject showController:animate:](v10, "showController:animate:", v4, 1);
    }
    else
    {
      v15 = objc_loadWeakRetained((id *)p_presenter);
      objc_msgSend(v15, "splitViewController");
      v10 = objc_claimAutoreleasedReturnValue();

      _FALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_loadWeakRetained((id *)p_presenter);
        v18 = 138412802;
        v19 = v4;
        v20 = 2112;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_20DE41000, v16, OS_LOG_TYPE_DEFAULT, "Calling showInitialViewController with settingsViewController %@ for presenter %@ with splitViewController %@", (uint8_t *)&v18, 0x20u);

      }
      -[NSObject showInitialViewController:](v10, "showInitialViewController:", v4);
    }
  }

}

- (void)_handleShowInvitesActionURL:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "User not signed in to an Apple Account. How did you even get here?";
LABEL_8:
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "aa_isPrimaryAccount") & 1) == 0)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Non-primary accounts cannot see family invites. How did you even get here?";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__FASettingsSpecifierProvider__handleShowInvitesActionURL___block_invoke;
  v8[3] = &unk_24C88CA60;
  v8[4] = self;
  -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", v8);
LABEL_10:

}

void __59__FASettingsSpecifierProvider__handleShowInvitesActionURL___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v3, "_acuPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_CONNECT_TO_ICLOUD"), &stru_24C8A3000, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v9, v11, 0, 0, 0);

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v3[1], "invites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    objc_msgSend(v6, "_acuPresenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO_INVITATIONS_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showConfirmationWithButtons:title:message:destructive:completion:", v13, v15, 0, 0, 0);

    goto LABEL_6;
  }
  objc_msgSend(v6, "_presentPendingInvitesRemoteUI");
LABEL_7:

}

- (void)_handleShowFamilySettingsURL:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__FASettingsSpecifierProvider__handleShowFamilySettingsURL___block_invoke;
  v3[3] = &unk_24C88CA60;
  v3[4] = self;
  -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", v3);
}

void __60__FASettingsSpecifierProvider__handleShowFamilySettingsURL___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v3, "_acuPresenter");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_CONNECT_TO_ICLOUD"), &stru_24C8A3000, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject showConfirmationWithButtons:title:message:destructive:completion:](v6, "showConfirmationWithButtons:title:message:destructive:completion:", v10, v12, 0, 0, 0);

LABEL_7:
    return;
  }
  objc_msgSend(v3[1], "members");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "No family member found. Staying at spyglass.", v13, 2u);
    }
    goto LABEL_7;
  }
  if (v7)
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Viewing family.", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_viewFamilySpecifierWasTapped");
}

- (id)_acuPresenter
{
  return objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)_handleShowChildTransferActionURL:(id)a3
{
  -[FASettingsSpecifierProvider _handleShowInviteActionURL:isChildTransfer:](self, "_handleShowInviteActionURL:isChildTransfer:", a3, 1);
}

- (void)_handleShowFamilyInviteActionURL:(id)a3
{
  -[FASettingsSpecifierProvider _handleShowInviteActionURL:isChildTransfer:](self, "_handleShowInviteActionURL:isChildTransfer:", a3, 0);
}

- (void)_handleShowInviteActionURL:(id)a3 isChildTransfer:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  _QWORD v18[5];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v17 = "User not signed in to an Apple Account. How did you even get here?";
LABEL_11:
    _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    goto LABEL_15;
  }
  if ((objc_msgSend(v7, "aa_isPrimaryAccount") & 1) == 0)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v17 = "Non-primary accounts cannot accept family invites. How did you even get here?";
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inviteCode"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self->_isHandlingURLForInvite = 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organizerFirstName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organizerLastName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organizerEmail"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _FALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_20DE41000, v13, OS_LOG_TYPE_DEFAULT, "About to present family invite coming from %@ %@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __74__FASettingsSpecifierProvider__handleShowInviteActionURL_isChildTransfer___block_invoke;
    v18[3] = &unk_24C88CC18;
    v18[4] = self;
    v23 = a4;
    v19 = v9;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    v14 = v12;
    v15 = v11;
    v16 = v10;
    -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", v18);

  }
  else
  {
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v16, OS_LOG_TYPE_DEFAULT, "Asked to show family invite details but no invite code was provided.", buf, 2u);
    }
  }

LABEL_15:
}

void __74__FASettingsSpecifierProvider__handleShowInviteActionURL_isChildTransfer___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v3, "_acuPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_CONNECT_TO_ICLOUD"), &stru_24C8A3000, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v11, v13, 0, 0, 0);

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(v3[1], "invites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "code");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v8 & 1) != 0)
        break;
      if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_9;
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentPendingInvitesRemoteUI");
      goto LABEL_15;
    }
  }
LABEL_9:
  if (!*(_BYTE *)(a1 + 72))
  {
    v9 = objc_alloc_init(MEMORY[0x24BE30A68]);
    objc_msgSend(v9, "setCode:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "setOrganizerFirstName:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v9, "setOrganizerLastName:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v9, "setOrganizerEmail:", *(_QWORD *)(a1 + 64));
    v10 = (id)objc_msgSend(v4, "mutableCopy");
    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v10, "insertObject:atIndex:", v9, 0);
    objc_msgSend(*(id *)(a1 + 32), "_presentPendingInvitesRemoteUI");
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "_acuPresenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("INVALID_INVITE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INVALID_INVITE_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "showConfirmationWithButtons:title:message:destructive:completion:", v16, v18, v20, 0, 0);

LABEL_15:
}

- (void)_handleStartFamilySetupActionURL:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  -[FASettingsSpecifierProvider _initiateFamilyWithResources:](self, "_initiateFamilyWithResources:", v7);

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[FASettingsSpecifierProvider _requestConfigurator](self, "_requestConfigurator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFresnoHeadersToRequest:", v6);

  -[FASettingsSpecifierProvider _requestConfigurator](self, "_requestConfigurator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("clientAppContext");
  -[FACircleContext clientName](self->_context, "clientName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFresnoPayloadToRequest:additionalPayload:", v6, v10);

  return 1;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[FASettingsSpecifierProvider _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v7, v6, 0);

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[FASettingsSpecifierProvider _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v9, v8, v5);

}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FAProfileViewTableViewDecorator *v27;
  void *v28;
  void *v29;
  void *v30;
  FATableViewDecorator *v31;
  FATableViewDecorator *remoteUIDecorator;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412290;
    v34 = v8;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Handling an object model: %@", (uint8_t *)&v33, 0xCu);

  }
  objc_msgSend(v6, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("needsProfilePhotoHeader"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("true"));

  if (v11)
  {
    objc_msgSend(v6, "defaultPages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "hasTableView");
    _FALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((v14 & 1) != 0)
    {
      if (v16)
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Handing page over to FAFamilyMemberDetailsPageSurrogate...", (uint8_t *)&v33, 2u);
      }

      v15 = objc_alloc_init(MEMORY[0x24BE04998]);
      -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "aa_firstName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFirstName:](v15, "setFirstName:", v18);

      -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aa_lastName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastName:](v15, "setLastName:", v20);

      -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "aa_appleId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setAppleID:](v15, "setAppleID:", v22);

      v23 = (void *)MEMORY[0x24BDD16E0];
      -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "aa_personID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v25, "longLongValue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPersonID:](v15, "setPersonID:", v26);

      -[NSObject setIsMe:](v15, "setIsMe:", 1);
      v27 = [FAProfileViewTableViewDecorator alloc];
      objc_msgSend(v13, "tableViewOM");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "tableView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tableViewOM");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[FAProfileViewTableViewDecorator initWithTableView:ruiTableView:forPerson:pictureStore:](v27, "initWithTableView:ruiTableView:forPerson:pictureStore:", v29, v30, v15, self->_familyPictureStore);
      remoteUIDecorator = self->_remoteUIDecorator;
      self->_remoteUIDecorator = v31;

    }
    else if (v16)
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "OM wants us to add a photo header, but it has no table view in its page.", (uint8_t *)&v33, 2u);
    }

  }
}

- (void)_handleFamilyChanged:(id)a3
{
  -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  FASettingsSpecifierProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider dealloc %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FASettingsSpecifierProvider;
  -[FASettingsSpecifierProvider dealloc](&v5, sel_dealloc);
}

- (void)familySettingsViewController2StopFamilySharing:(id)a3
{
  id v4;
  PSListController **p_presenter;
  id WeakRetained;
  char isKindOfClass;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  -[FASettingsSpecifierProvider _clearFamilyState](self, "_clearFamilyState");
  -[FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated:](self, "_reloadFamilySpecifiersAnimated:", 0);
  p_presenter = &self->_presenter;
  WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_presenter);
    v10 = (id)objc_msgSend(v8, "popToViewController:animated:", v9, 1);

  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 0, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openSensitiveURL:withOptions:", v11, 0);

  }
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_invitationSummary, 0);
  objc_storeStrong((id *)&self->_familyStatusSummary, 0);
  objc_storeStrong((id *)&self->_pendingInvites, 0);
  objc_storeStrong((id *)&self->_familyEligibilityResponse, 0);
  objc_storeStrong((id *)&self->_pendingFamilyDetailsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_invitationsCellSpecifier, 0);
  objc_storeStrong((id *)&self->_familyCellSpecifier, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_remoteUIDecorator, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_20DE41000, a2, OS_LOG_TYPE_DEBUG, "Can't present %@, presenter seems deallocated.", (uint8_t *)&v3, 0xCu);
}

@end
