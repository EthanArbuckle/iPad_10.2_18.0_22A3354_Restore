@implementation FCAppleAccount

uint64_t __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  _QWORD block[5];

  v2 = *(id *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__FCAppleAccount_supportedLanguageCodes__block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = v2;
    if (qword_1ED0F8760 != -1)
      dispatch_once(&qword_1ED0F8760, block);
    v2 = (id)qword_1ED0F8758;
  }
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  NewsCoreUserDefaults();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringForKey:", CFSTR("FCAppleAccountContentStoreFrontiTunesDSIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringForKey:", CFSTR("FCAppleAccountContentStoreFrontIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iTunesAccountDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentStoreFrontID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  FCAppleAccountDetermineContentStoreFrontID(v4, v6, v5, v7, &v20, &v19);
  v8 = v20;
  v9 = v19;
  if (a2)
  {
    if (v8)
    {
      objc_msgSend(v18, "setObject:forKey:", v8, CFSTR("FCAppleAccountContentStoreFrontiTunesDSIDKey"));
      if (v9)
      {
LABEL_4:
        objc_msgSend(v18, "setObject:forKey:", v9, CFSTR("FCAppleAccountContentStoreFrontIDKey"));
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("FCAppleAccountContentStoreFrontiTunesDSIDKey"));
      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(v18, "removeObjectForKey:", CFSTR("FCAppleAccountContentStoreFrontIDKey"));
  }
LABEL_7:
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)a1[10];
  a1[10] = v10;

  v12 = objc_msgSend(v7, "copy");
  v13 = (void *)a1[9];
  a1[9] = v12;

  objc_msgSend(a1, "iCloudAccountDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = v6;
  v16 = objc_msgSend(v14, "copy");
  v17 = (void *)a1[8];
  a1[8] = v16;

}

- (id)currentStoreFrontID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  -[FCAppleAccount ams_storefront](self, "ams_storefront");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" -,"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)iTunesAccountDSID
{
  void *v2;
  void *v3;

  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  -[FCAppleAccount ams_DSID](self, "ams_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iCloudAccountDSID
{
  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  return (id)-[FCAppleAccount aa_personID](self, "aa_personID");
}

- (BOOL)isPrivateDataSyncingEnabled
{
  const char *v3;
  id Property;

  if (-[FCAppleAccount isRunningPPT](self, "isRunningPPT"))
    return 0;
  if (self)
    Property = objc_getProperty(self, v3, 24, 1);
  else
    Property = 0;
  return objc_msgSend(Property, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3F0]);
}

- (BOOL)isRunningPPT
{
  return self->_runningPPT;
}

+ (id)sharedAccount
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FCAppleAccount_sharedAccount__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_204 != -1)
    dispatch_once(&_MergedGlobals_204, block);
  return (id)qword_1ED0F8750;
}

- (BOOL)isContentStoreFrontSupported
{
  void *v2;
  void *v3;
  char v4;

  -[FCAppleAccount contentStoreFrontID](self, "contentStoreFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    FCSupportedStoreFrontIDs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)contentStoreFrontID
{
  NSString **p_contentStoreFrontID;
  NSString *v4;
  NSString *v5;
  Class v6;
  __CFString *v7;
  NSObject *v8;
  uint8_t v10[16];

  if (!self
    || (p_contentStoreFrontID = &self->_overrideContentStoreFrontID,
        (v4 = self->_overrideContentStoreFrontID) == 0)
    || (v5 = v4, v6 = NSClassFromString(CFSTR("XCTest")), v5, !v6))
  {
    p_contentStoreFrontID = &self->_contentStoreFrontID;
  }
  v7 = *p_contentStoreFrontID;
  if (!v7)
  {
    v8 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "Received nil storeFront ID. Falling back to U.S.", v10, 2u);
    }
    v7 = CFSTR("143441");
  }
  return (NSString *)v7;
}

- (NSString)primaryLanguageCode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FCAppleAccount_primaryLanguageCode__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  if (qword_1ED0F8770 != -1)
    dispatch_once(&qword_1ED0F8770, block);
  return (NSString *)(id)qword_1ED0F8768;
}

- (NSString)endpointConnectionClientID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NewsCoreSensitiveUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("report_concern_user_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    NewsCoreSensitiveUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("report_concern_user_id"));

  }
  return (NSString *)v3;
}

- (NSString)supportedContentStoreFrontID
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  -[FCAppleAccount contentStoreFrontID](self, "contentStoreFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (FCSupportedStoreFrontIDs(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "containsObject:", v2),
        v3,
        (v4 & 1) == 0))
  {
    v5 = CFSTR("143441");

    v2 = v5;
  }
  return (NSString *)v2;
}

- (BOOL)isUserSignedInToiCloud
{
  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  return self != 0;
}

void __31__FCAppleAccount_sharedAccount__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED0F8750;
  qword_1ED0F8750 = (uint64_t)v1;

}

- (FCAppleAccount)init
{
  FCAppleAccount *v2;
  uint64_t v3;
  ACAccountStore *accountStore;
  uint64_t v5;
  NSHashTable *observers;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCAppleAccount;
  v2 = -[FCAppleAccount init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    -[FCAppleAccount _reloadAccountsFromAccountStore](v2, "_reloadAccountsFromAccountStore");
    -[FCAppleAccount _setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:](v2, FCAppleAccountStoreFrontLockingEnabled);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange, *MEMORY[0x1E0C8F010], v2->_accountStore);

  }
  return v2;
}

- (void)_reloadAccountsFromAccountStore
{
  ACAccountStore *v2;
  id v4;
  SEL v5;
  id v6;
  ACAccountStore *accountStore;
  uint64_t v8;
  void *v9;
  ACAccountStore *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  ACAccountStore *v18;
  int v19;
  void *v20;
  id v21;
  const char *v22;
  id v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  ACAccountStore *v36;
  void *v37;
  _QWORD block[5];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = objc_getProperty(self, a2, 24, 1);
    v6 = objc_getProperty(self, v5, 32, 1);
    accountStore = self->_accountStore;
  }
  else
  {
    v6 = 0;
    v4 = 0;
    accountStore = 0;
  }
  v8 = *MEMORY[0x1E0C8F170];
  v39[0] = *MEMORY[0x1E0C8F030];
  v39[1] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = accountStore;
  objc_msgSend(v9, "arrayWithObjects:count:", v39, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](v10, "accountsWithAccountTypeIdentifiers:error:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_72);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_73_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_74);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v13;
  if (!v13)
  {
    if (self)
      v18 = self->_accountStore;
    else
      v18 = 0;
    v2 = v18;
    -[ACAccountStore aa_primaryAppleAccount](v2, "aa_primaryAppleAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self)
    objc_setProperty_atomic(self, v15, v17, 24);
  if (!v13)
  {

  }
  v37 = (void *)v13;
  if (v14)
  {
    v19 = 0;
    v20 = v14;
    if (!self)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v16)
  {
    v19 = 0;
    v20 = v16;
    if (!self)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (self)
    v36 = self->_accountStore;
  else
    v36 = 0;
  v2 = v36;
  -[ACAccountStore ams_localiTunesAccount](v2, "ams_localiTunesAccount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 1;
  if (self)
LABEL_16:
    objc_setProperty_atomic(self, v15, v20, 32);
LABEL_17:
  if (v19)
  {

  }
  v21 = v4;
  v23 = v6;
  if (self)
  {
    v24 = v12;
    v26 = v14;
    if (objc_getProperty(self, v22, 24, 1) == v21)
    {
      v29 = 0;
    }
    else
    {
      objc_msgSend(objc_getProperty(self, v25, 24, 1), "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28) ^ 1;

    }
    v30 = v16;
    if (objc_getProperty(self, v25, 32, 1) == v23)
    {
      v34 = 0;
    }
    else
    {
      objc_msgSend(objc_getProperty(self, v31, 32, 1), "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToString:", v33) ^ 1;

    }
    v35 = v29 | v34;
    v16 = v30;
    v14 = v26;
    v12 = v24;
    if (v35 == 1)
    {
      -[FCAppleAccount _setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:](self, FCAppleAccountStoreFrontLockingEnabled);
      -[FCAppleAccount invalidateGSTokenCache](self, "invalidateGSTokenCache");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__FCAppleAccount_notifyObserversOfAccountChange__block_invoke;
      block[3] = &unk_1E463AB18;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

- (void)invalidateGSTokenCache
{
  NFPromise *v3;
  NFPromise *base64GSTokenPromise;

  if (self->_base64GSTokenPromise)
  {
    -[FCAppleAccount getNewGSTokenPromise](self);
    v3 = (NFPromise *)objc_claimAutoreleasedReturnValue();
    base64GSTokenPromise = self->_base64GSTokenPromise;
    self->_base64GSTokenPromise = v3;

  }
}

void __48__FCAppleAccount_notifyObserversOfAccountChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 56);
  else
    v2 = 0;
  v3 = (void *)objc_msgSend(v2, "copy", (_QWORD)v8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "appleAccountChanged");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addObserver:(id)a3
{
  if (self)
    self = (FCAppleAccount *)self->_observers;
  -[FCAppleAccount addObject:](self, "addObject:", a3);
}

- (id)iTunesAccountName
{
  FCAppleAccount *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  id Property;
  void *v7;
  void *v8;

  v2 = self;
  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  -[FCAppleAccount username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    if (v2)
      Property = objc_getProperty(v2, v5, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isPrimaryAccountEmailAddress
{
  void *v2;
  char v3;

  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  -[FCAppleAccount username](self, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ea_isLegalEmailAddress");

  return v3;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

+ (void)enableStoreFrontLocking
{
  FCAppleAccountStoreFrontLockingEnabled = 1;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8F170]))
    v5 = objc_msgSend(v2, "isActive");
  else
    v5 = 0;

  return v5;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8F170]))
    v5 = objc_msgSend(v2, "ams_isLocalAccount");
  else
    v5 = 0;

  return v5;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F030]))
    v5 = objc_msgSend(v2, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isUserSignedIntoiTunes
{
  void *v2;
  BOOL v3;

  -[FCAppleAccount iTunesAccountDSID](self, "iTunesAccountDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)loadStoreFrontWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[FCAMSBag bag](FCAMSBag, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForKey:", CFSTR("metrics/metricsUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__FCAppleAccount_loadStoreFrontWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4648C30;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "addFinishBlock:", v8);

}

- (int64_t)supportedContentLanguage
{
  void *v2;
  int64_t v3;

  -[FCAppleAccount primaryLanguageCode](self, "primaryLanguageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("fr"));

  return v3;
}

void __37__FCAppleAccount_primaryLanguageCode__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  -[FCAppleAccount dynamicPrimaryLanguageCode](*(__CFString **)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0F8768;
  qword_1ED0F8768 = v1;

}

- (__CFString)dynamicPrimaryLanguageCode
{
  __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  _QWORD v8[5];

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_155);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke_2;
    v8[3] = &unk_1E463C7A0;
    v8[4] = v1;
    objc_msgSend(v3, "fc_firstObjectPassingTest:", v8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("en");
    if (v4)
      v6 = (__CFString *)v4;
    v1 = v6;

  }
  return v1;
}

void __40__FCAppleAccount_supportedLanguageCodes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "contentStoreFrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("143455")))
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("en"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0F8758;
  qword_1ED0F8758 = v1;

}

void __54__FCAppleAccount_loadStoreFrontWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to obtain metrics URL from bag with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (BOOL)isSignedInStoreFrontSupported
{
  void *v2;
  void *v3;
  char v4;

  -[FCAppleAccount currentStoreFrontID](self, "currentStoreFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    FCSupportedStoreFrontIDs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)dynamicSupportedContentLanguage
{
  void *v2;
  int64_t v3;

  -[FCAppleAccount dynamicPrimaryLanguageCode]((__CFString *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("fr"));

  return v3;
}

- (void)checkAlliOSDevicesRunningMinimumOSVersion:(id)a3 orInactiveForTimeInterval:(double)a4 completionHandler:(id)a5
{
  -[FCAppleAccount checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:](self, "checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:", a3.var0, a3.var1, 0, 0, a5, a4);
}

- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6
{
  int64_t var1;
  int64_t var0;
  int64_t v9;
  int64_t v10;
  id v12;
  const char *v13;
  id v14;
  id Property;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  double v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  _QWORD v27[2];

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3.var1;
  v10 = a3.var0;
  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0D001E0]);
  if (self)
    Property = objc_getProperty(self, v13, 24, 1);
  else
    Property = 0;
  objc_msgSend(Property, "aa_altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAltDSID:", v16);

  objc_msgSend(v14, "setIncludeUntrustedDevices:", 1);
  v27[0] = *MEMORY[0x1E0D000A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setServices:", v17);

  objc_msgSend(v14, "setOperatingSystems:", &unk_1E470C828);
  v18 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke;
  v20[3] = &unk_1E4648C78;
  v22 = a5;
  v23 = v10;
  v24 = v9;
  v25 = var0;
  v26 = var1;
  v21 = v12;
  v19 = v12;
  objc_msgSend(v18, "fetchDeviceListWithContext:completion:", v14, v20);

}

void __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  id obj;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = FCDefaultLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "encountered error fetching device list: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v29 = a1;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 134217984;
      v40 = (const char *)objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "successfully fetched device list with %lu devices", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v5;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
          v15 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            objc_msgSend(v14, "model");
            v17 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "buildNumber");
            v18 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastUpdatedDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fc_stringWithISO8601Format");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v40 = v17;
            v41 = 2114;
            v42 = v18;
            v43 = 2114;
            v44[0] = v20;
            _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "fetched device: %{public}@ %{public}@; last updated %{public}@",
              buf,
              0x20u);

          }
          objc_msgSend(v14, "serialNumber");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v22
              || (objc_msgSend(v14, "lastUpdatedDate"),
                  v23 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v22, "lastUpdatedDate"),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  v25 = objc_msgSend(v23, "fc_isLaterThan:", v24),
                  v24,
                  v23,
                  v25))
            {
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v21);
            }

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "serialNumber");
            *(_DWORD *)buf = 136315906;
            v40 = "-[FCAppleAccount checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:comple"
                  "tionHandler:]_block_invoke";
            v41 = 2080;
            v42 = "FCAppleAccount.m";
            v43 = 1024;
            LODWORD(v44[0]) = 403;
            WORD2(v44[0]) = 2114;
            *(_QWORD *)((char *)v44 + 6) = v26;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = 3221225472;
    v32[4] = *(_QWORD *)(v29 + 40);
    v28 = *(_OWORD *)(v29 + 64);
    v33 = *(_OWORD *)(v29 + 48);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[2] = __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_44;
    v32[3] = &__block_descriptor_72_e24_B16__0__AKRemoteDevice_8l;
    v34 = v28;
    objc_msgSend(v27, "fc_allObjectsPassTest:", v32);

    (*(void (**)(void))(*(_QWORD *)(v29 + 32) + 16))();
    v6 = 0;
    v5 = v30;
  }

}

uint64_t __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t *v17;
  uint64_t *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v24;

  v3 = a2;
  objc_msgSend(v3, "operatingSystemVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  objc_msgSend(v3, "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_timeIntervalUntilNow");
  v12 = v11;
  v13 = *(double *)(a1 + 32);

  if (v12 > v13)
  {
    v14 = 1;
    goto LABEL_21;
  }
  objc_msgSend(v3, "operatingSystemName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("iOS"));

  if (v16)
  {
    v17 = (uint64_t *)(a1 + 40);
    v18 = (uint64_t *)(a1 + 48);
  }
  else
  {
    objc_msgSend(v3, "operatingSystemName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("macOS"));

    if (!v20)
    {
      v21 = 0;
      v22 = 0;
      goto LABEL_12;
    }
    v17 = (uint64_t *)(a1 + 56);
    v18 = (uint64_t *)(a1 + 64);
  }
  v21 = *v17;
  v22 = *v18;
LABEL_12:
  v24 = v7 == v21 && v9 >= v22;
  v14 = v7 > v21 || v24;
LABEL_21:

  return v14;
}

- (void)fetchMinimumDeviceVersionsActiveSinceInterval:(double)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  id Property;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  double v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D001E0]);
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  objc_msgSend(Property, "aa_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAltDSID:", v10);

  objc_msgSend(v8, "setIncludeUntrustedDevices:", 1);
  v17[0] = *MEMORY[0x1E0D000A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServices:", v11);

  objc_msgSend(v8, "setOperatingSystems:", &unk_1E470C840);
  v12 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke;
  v14[3] = &unk_1E4648CC8;
  v15 = v6;
  v16 = a3;
  v13 = v6;
  objc_msgSend(v12, "fetchDeviceListWithContext:completion:", v8, v14);

}

void __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void (*v62)(void);
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id obj;
  id obja;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[6];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE buf[24];
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v70 = a1;
    v9 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "successfully fetched device list with %lu devices", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v63 = v5;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v80 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          v16 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            objc_msgSend(v15, "model");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "buildNumber");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastUpdatedDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "fc_stringWithISO8601Format");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&v89 = v21;
            _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "fetched device: %{public}@ %{public}@; last updated %{public}@",
              buf,
              0x20u);

          }
          objc_msgSend(v15, "serialNumber");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v74, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23
              || (objc_msgSend(v15, "lastUpdatedDate"),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v23, "lastUpdatedDate"),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  v26 = objc_msgSend(v24, "fc_isLaterThan:", v25),
                  v25,
                  v24,
                  v26))
            {
              objc_msgSend(v74, "setObject:forKeyedSubscript:", v15, v22);
            }

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "serialNumber");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[FCAppleAccount fetchMinimumDeviceVersionsActiveSinceInterval:completionHandler:]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCAppleAccount.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v89) = 480;
            WORD2(v89) = 2114;
            *(_QWORD *)((char *)&v89 + 6) = v27;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      }
      while (v12);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v74, "allValues");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    if (!v28)
    {
      v30 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v31 = 0;
      obja = 0;
      v33 = a1;
      goto LABEL_86;
    }
    v29 = v28;
    v30 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v31 = 0;
    obja = 0;
    v32 = *(_QWORD *)v76;
    v33 = a1;
    v68 = *(_QWORD *)v76;
    v69 = 0;
    while (1)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v76 != v32)
          objc_enumerationMutation(v71);
        v35 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        objc_msgSend(v35, "lastUpdatedDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "fc_timeIntervalUntilNow");
        v38 = v37;
        v39 = *(double *)(v33 + 40);

        if (v38 <= v39)
        {
          objc_msgSend(v35, "operatingSystemVersion");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "componentsSeparatedByString:", CFSTR("."));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "integerValue");

          if ((unint64_t)objc_msgSend(v41, "count") < 2)
          {
            v45 = 0;
          }
          else
          {
            objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "integerValue");

          }
          objc_msgSend(v35, "operatingSystemName");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("iOS"));

          if (v47)
          {
            if (v45 < v69)
              v48 = v43;
            else
              v48 = v30;
            if (v45 < v69)
              v49 = v45;
            else
              v49 = v69;
            if (v43 > v30)
            {
              v48 = v30;
              v49 = v69;
            }
            if (v43 < v30)
            {
              v48 = v43;
              v49 = v45;
            }
            v50 = v30 == 0;
            if (v30)
              v30 = v48;
            else
              v30 = v43;
            if (v50)
              v51 = v45;
            else
              v51 = v49;
            v69 = v51;
            goto LABEL_80;
          }
          objc_msgSend(v35, "operatingSystemName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("macOS"));

          if (v53)
          {
            if (v45 < v66)
              v54 = v43;
            else
              v54 = v67;
            if (v45 < v66)
              v55 = v45;
            else
              v55 = v66;
            if (v43 > v67)
            {
              v54 = v67;
              v55 = v66;
            }
            if (v43 < v67)
            {
              v54 = v43;
              v55 = v45;
            }
            if (v67)
              v56 = v54;
            else
              v56 = v43;
            if (v67)
              v57 = v55;
            else
              v57 = v45;
            v66 = v57;
            v67 = v56;
LABEL_80:
            v43 = v31;
            v45 = (uint64_t)obja;
            v33 = v70;
            v32 = v68;
LABEL_81:

            v31 = v43;
            obja = (id)v45;
            continue;
          }
          objc_msgSend(v35, "operatingSystemName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("watchOS"));

          if (v59)
          {
            if (!v65)
            {
              v64 = v45;
              v65 = v43;
              goto LABEL_80;
            }
            v33 = v70;
            v32 = v68;
            if (v43 < v65 || v43 <= v65 && v45 < v64)
            {
              v64 = v45;
              v65 = v43;
            }
          }
          else
          {
            objc_msgSend(v35, "operatingSystemName");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("visionOS"));

            if (!v61)
              goto LABEL_80;
            v33 = v70;
            v32 = v68;
            if (!v31 || v43 < v31 || v43 <= v31 && v45 < (uint64_t)obja)
              goto LABEL_81;
          }
          v43 = v31;
          v45 = (uint64_t)obja;
          goto LABEL_81;
        }
      }
      v29 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      if (!v29)
      {
LABEL_86:

        v62 = *(void (**)(void))(*(_QWORD *)(v33 + 32) + 16);
        *(_QWORD *)buf = v30;
        *(_QWORD *)&buf[8] = v69;
        *(_QWORD *)&buf[16] = v67;
        *(_QWORD *)&v89 = v66;
        *((_QWORD *)&v89 + 1) = v65;
        v90 = v64;
        v91 = v31;
        v92 = obja;
        v62();

        v7 = 0;
        v5 = v63;
        goto LABEL_87;
      }
    }
  }
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2;
  v83[3] = &unk_1E4648CA0;
  v8 = *(_QWORD *)(a1 + 32);
  v83[4] = v6;
  v83[5] = v8;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2((uint64_t)v83);
LABEL_87:

}

uint64_t __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  __int128 v12;
  uint64_t v14;
  _OWORD v15[4];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    LODWORD(v15[0]) = 138543362;
    *(_QWORD *)((char *)v15 + 4) = v14;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching device list: %{public}@", (uint8_t *)v15, 0xCu);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  v11 = *(_OWORD *)(a1 + 64);
  v15[0] = *(_OWORD *)(a1 + 48);
  v15[1] = v11;
  v12 = *(_OWORD *)(a1 + 96);
  v15[2] = *(_OWORD *)(a1 + 80);
  v15[3] = v12;
  return v10(v8, v15, v9, v3, v4, v5, v6, v7);
}

- (void)getGSTokenWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[FCAppleAccount getGSToken](self, "getGSToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E4648CF0;
  v8 = v4;
  v15 = v8;
  v9 = (id)objc_msgSend(v5, "thenOn:then:", v6, v14);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E463DB48;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v5, "error:", v12);

}

uint64_t __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

uint64_t __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getGSToken
{
  NFPromise *base64GSTokenPromise;
  NFPromise *v4;
  NFPromise *v5;

  base64GSTokenPromise = self->_base64GSTokenPromise;
  if (!base64GSTokenPromise)
  {
    -[FCAppleAccount getNewGSTokenPromise](self);
    v4 = (NFPromise *)objc_claimAutoreleasedReturnValue();
    v5 = self->_base64GSTokenPromise;
    self->_base64GSTokenPromise = v4;

    base64GSTokenPromise = self->_base64GSTokenPromise;
  }
  return base64GSTokenPromise;
}

- (id)getNewGSTokenPromise
{
  void *v1;
  id v2;
  _QWORD v4[5];

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke;
    v4[3] = &unk_1E463DAD0;
    v4[4] = v1;
    a1 = (void *)objc_msgSend(v2, "initWithResolver:", v4);
  }
  return a1;
}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  id Property;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];

  v5 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  if (!v8)
    goto LABEL_17;
  v9 = objc_getProperty(v8, v6, 24, 1);
  if (v9)
  {
    v11 = v9;
    objc_msgSend(*(id *)(a1 + 32), "iCloudAccountDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v10, 24, 1);
      v14 = Property;
      objc_msgSend(*(id *)(a1 + 32), "iCloudAccountDSID");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v16 = *(void **)(a1 + 32);
  if (!v16)
  {
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v14 = objc_getProperty(v16, v10, 32, 1);
  if (!v14)
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "iTunesAccountDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v14 = 0;
LABEL_19:
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2;
    v29[3] = &unk_1E463B598;
    v29[4] = v7;
    __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2((uint64_t)v29);
    goto LABEL_20;
  }
  v19 = *(id *)(a1 + 32);
  if (v19)
    v19 = objc_getProperty(v19, v18, 32, 1);
  v14 = v19;
  objc_msgSend(*(id *)(a1 + 32), "iTunesAccountDSID");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v17 = (void *)v15;
  if (!v14 || !v15)
    goto LABEL_19;
  v20 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v20, "setServiceIdentifier:", CFSTR("com.apple.gs.news.auth"));
  objc_msgSend(v14, "username");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUsername:", v21);

  objc_msgSend(v20, "setDSID:", v17);
  objc_msgSend(v20, "setIsUsernameEditable:", 0);
  objc_msgSend(v20, "setAuthenticationType:", 0);
  v22 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_3;
  v24[3] = &unk_1E463F558;
  v27 = v7;
  v14 = v14;
  v23 = *(_QWORD *)(a1 + 32);
  v25 = v14;
  v26 = v23;
  v28 = v5;
  objc_msgSend(v22, "authenticateWithContext:completion:", v20, v24);

LABEL_20:
}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_authUserAccountInvalid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (v17
    && (v6 = *MEMORY[0x1E0CFFF70],
        objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AKAltDSID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "aa_altDSID");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 40), "setAltDSID:", v11);
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.gs.news.auth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)removeObserver:(id)a3
{
  if (self)
    self = (FCAppleAccount *)self->_observers;
  -[FCAppleAccount removeObject:](self, "removeObject:", a3);
}

- (ACAccount)activeiTunesAccount
{
  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  return (ACAccount *)self;
}

- (NSString)primaryEmailAddress
{
  void *v2;
  void *v3;

  if (self)
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  -[FCAppleAccount aa_primaryEmail](self, "aa_primaryEmail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)appStoreEmailAddress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[FCAppleAccount iTunesAccountName](self, "iTunesAccountName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ea_isLegalEmailAddress");

  if (v4)
  {
    -[FCAppleAccount iTunesAccountName](self, "iTunesAccountName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)allEmailAddresses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[FCAppleAccount appStoreEmailAddress](self, "appStoreEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCAppleAccount appStoreEmailAddress](self, "appStoreEmailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "addObject:", v6);

  }
  -[FCAppleAccount primaryEmailAddress](self, "primaryEmailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCAppleAccount primaryEmailAddress](self, "primaryEmailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (void)_accountStoreDidChange
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadAccountsFromAccountStore, 0);
  -[FCAppleAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadAccountsFromAccountStore, 0, 1.0);
}

- (void)t_startOverridingContentStoreFrontID:(id)a3
{
  if (self)
    objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)t_stopOverridingContentStoreFrontID
{
  if (self)
    objc_setProperty_nonatomic_copy(self, a2, 0, 40);
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)userStoreFrontID
{
  return self->_userStoreFrontID;
}

- (void)setUserStoreFrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setContentStoreFrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_contentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_userStoreFrontID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_base64GSTokenPromise, 0);
  objc_storeStrong((id *)&self->_overrideContentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
