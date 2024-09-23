@implementation VSAccountStore

+ (id)sharedAccountStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VSAccountStore_sharedAccountStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountStore___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedAccountStore___vs_lazy_init_predicate, block);
  return (id)sharedAccountStore___vs_lazy_init_variable;
}

void __36__VSAccountStore_sharedAccountStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedAccountStore___vs_lazy_init_variable;
  sharedAccountStore___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSAccountStore)init
{
  VSAccountStore *v2;
  VSKeychainEditingContext *v3;
  VSKeychainEditingContext *keychainEditingContext;
  NSOperationQueue *v5;
  NSOperationQueue *keychainQueue;
  VSRemoteNotifier *v7;
  VSRemoteNotifier *remoteNotifier;
  VSPreferences *v9;
  VSPreferences *preferences;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  VSAccountStore *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VSAccountStore;
  v2 = -[VSAccountStore init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSKeychainEditingContext);
    keychainEditingContext = v2->_keychainEditingContext;
    v2->_keychainEditingContext = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = v5;

    -[NSOperationQueue setName:](v2->_keychainQueue, "setName:", CFSTR("VSAccountStore"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_keychainQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSAccountStoreDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v7;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
    v9 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __22__VSAccountStore_init__block_invoke;
    v17[3] = &unk_1E939EEB0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("VSAccountStoreDidChangeNotification"), 0, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v2->_changeObserver, v13);

    v2->_needsUpdateCachedFirstAccount = 1;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __22__VSAccountStore_init__block_invoke_34;
    v15[3] = &unk_1E939EE88;
    v16 = v2;
    VSPerformBlockOnMainThread(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __22__VSAccountStore_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "object");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != WeakRetained)
    {
      VSDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Received local account store notification from another instance.", buf, 2u);
      }

      objc_msgSend(WeakRetained, "setNeedsUpdateCachedFirstAccount:", 1);
      if ((objc_msgSend(WeakRetained, "isFirstAccountLoaded") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "keychainQueue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __22__VSAccountStore_init__block_invoke_32;
        v8[3] = &unk_1E939EE88;
        v9 = WeakRetained;
        objc_msgSend(v7, "addOperationWithBlock:", v8);

      }
    }
  }

}

void __22__VSAccountStore_init__block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Will update cached first account.", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "_updateCachedFirstAccount"))
  {
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Cached first account actually changed.", v4, 2u);
    }

  }
}

void __22__VSAccountStore_init__block_invoke_34(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstAccountLoaded") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "keychainQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __22__VSAccountStore_init__block_invoke_2;
    v3[3] = &unk_1E939EE88;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v2, "addOperationWithBlock:", v3);

  }
}

void __22__VSAccountStore_init__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_updateCachedFirstAccount"))
  {
    VSDefaultLogObject();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1D2419000, v1, OS_LOG_TYPE_DEFAULT, "After initialization, update revealed existing account.", v2, 2u);
    }

  }
}

+ (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_changeObserver);
  if (WeakRetained)
    objc_msgSend(v3, "removeObserver:", WeakRetained);

  v5.receiver = self;
  v5.super_class = (Class)VSAccountStore;
  -[VSAccountStore dealloc](&v5, sel_dealloc);
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[VSAccountStore keychainQueue](self, "keychainQueue", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__VSAccountStore_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E939EE88;
  v6[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

}

uint64_t __74__VSAccountStore_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedFirstAccount");
}

- (void)_sendLocalNotification
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will send local account store change notificaiton.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VSAccountStoreDidChangeNotification"), self);
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Did send local account store change notificaiton.", v6, 2u);
  }

}

- (void)_sendRemoteNotification
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will send remote account store change notificaiton.", buf, 2u);
  }

  -[VSAccountStore remoteNotifier](self, "remoteNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification");

  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Did send remote account store change notificaiton.", v6, 2u);
  }

}

- (id)_uniqueIdentifierForKeychainItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[VSAccountStore _accountForKeychainItem:](self, "_accountForKeychainItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityProviderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(v4, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "hash") ^ v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accountForKeychainItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
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
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  objc_class *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  void *v57;
  id v58;

  v4 = a3;
  VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "accountClass"));
  objc_msgSend(v7, "setAccountStore:", self);
  objc_msgSend(v4, "creatorCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  if (v9)
  {
    objc_msgSend(v4, "generic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v7, "setLegacyKeychainItem:", v4);
    objc_msgSend(v4, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", v12);

    objc_msgSend(v4, "comment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredAppID:", v13);

    objc_msgSend(v4, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOptionalIdentityProviderDisplayName:", v16);

    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentityProviderID:", v17);

    objc_msgSend(v7, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
    objc_msgSend(v4, "typeCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    VSNumberForFourCharCode(0x6174684Eu);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v18, "isEqual:", v19);

    if ((_DWORD)v15
      || (VSNumberForFourCharCode(0x746F6B4Eu),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = objc_msgSend(v18, "isEqual:", v40),
          v40,
          v41))
    {
      v42 = (objc_class *)objc_opt_class();
    }
    else
    {
      VSErrorLogObject();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[VSAccountStore _accountForKeychainItem:].cold.2();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected token type code when deserializing account from keychain."));
      v42 = 0;
    }
    objc_msgSend(v4, "data");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = objc_msgSend([v42 alloc], "initWithSerializedData:", v45);
      +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAuthenticationToken:", v47);

    }
    else
    {
      VSErrorLogObject();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        -[VSAccountStore _accountForKeychainItem:].cold.1();
    }

LABEL_39:
    goto LABEL_40;
  }
  objc_msgSend(v4, "creatorCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqual:", v6);

  if (v21)
  {
    objc_msgSend(v4, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [keychainItem data] parameter must not be nil."));
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v58);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v58;
    if (v23)
    {
      v57 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1E0C99DA0];
        v26 = *MEMORY[0x1E0C99778];
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "raise:format:", v26, CFSTR("Unexpectedly, result was %@, instead of NSDictionary."), v28);

      }
      v29 = v23;
      objc_msgSend(v7, "setKeychainItem:", v4);
      objc_msgSend(v29, "objectForKey:", CFSTR("u"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUsername:", v30);

      objc_msgSend(v29, "objectForKey:", CFSTR("paid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreferredAppID:", v31);

      objc_msgSend(v29, "objectForKey:", CFSTR("dn"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOptionalIdentityProviderDisplayName:", v33);

      objc_msgSend(v29, "objectForKey:", CFSTR("pid"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdentityProviderID:", v35);

      objc_msgSend(v29, "objectForKey:", CFSTR("lhash"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLegacyItemHash:", v36);

      objc_msgSend(v7, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
      objc_msgSend(v29, "objectForKey:", CFSTR("channels"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setChannelsData:", v37);

      objc_msgSend(v29, "objectForKey:", CFSTR("proto"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [accountData objectForKey:VSAccountKeychainKeyScheme] parameter must not be nil."));
      objc_msgSend(v29, "objectForKey:", CFSTR("proto"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v24;
      if (objc_msgSend(v39, "isEqual:", CFSTR("api"))
        || objc_msgSend(v39, "isEqual:", CFSTR("saml")))
      {
        v49 = (objc_class *)objc_opt_class();
      }
      else
      {
        VSErrorLogObject();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[VSAccountStore _accountForKeychainItem:].cold.4();

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected scheme when decoding account from 2.0 keychain item."));
        v49 = 0;
      }
      objc_msgSend(v29, "objectForKey:", CFSTR("data"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [accountData objectForKey:VSAccountKeychainKeyTokenData] parameter must not be nil."));
      objc_msgSend(v29, "objectForKey:", CFSTR("data"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend([v49 alloc], "initWithSerializedData:", v52);
      +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAuthenticationToken:", v54);

      v24 = v56;
      v11 = v57;
    }
    else
    {
      VSErrorLogObject();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[VSAccountStore _accountForKeychainItem:].cold.3();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to deserialize account data from keychain item data."));
    }

    goto LABEL_39;
  }
  VSErrorLogObject();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    -[VSAccountStore _accountForKeychainItem:].cold.5(v4, v43);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected creator code when deserialziing account from keychain item."));
LABEL_40:

  return v7;
}

- (void)_fetchAccountsSimulatingExpiredToken:(BOOL)a3 forProviderIDs:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  id *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _BOOL4 v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v88[4];
  id v89;
  id v90;
  uint64_t *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id obj;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  id v106;
  id v107;
  id v108;
  _QWORD v109[5];
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  _QWORD v115[4];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  uint64_t *v127;
  _QWORD v128[5];
  _QWORD v129[5];
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  void (*v140)(uint64_t);
  id v141;
  _BYTE v142[128];
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v80 = a3;
  v151 = *MEMORY[0x1E0C80C00];
  v81 = a4;
  v82 = a5;
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountStore keychainQueue](self, "keychainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected operation queue for account fetch."));
  v136 = 0;
  v137 = &v136;
  v138 = 0x3032000000;
  v139 = __Block_byref_object_copy_;
  v140 = __Block_byref_object_dispose_;
  v141 = (id)MEMORY[0x1E0C9AA60];
  v130 = 0;
  v131 = &v130;
  v132 = 0x3032000000;
  v133 = __Block_byref_object_copy_;
  v134 = __Block_byref_object_dispose_;
  v135 = 0;
  -[VSAccountStore _keychainItemsWithLimit:](self, "_keychainItemsWithLimit:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke;
  v129[3] = &unk_1E939EED8;
  v129[4] = &v136;
  v128[0] = MEMORY[0x1E0C809B0];
  v128[1] = 3221225472;
  v128[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2;
  v128[3] = &unk_1E939EF00;
  v128[4] = &v130;
  objc_msgSend(v9, "unwrapObject:error:", v129, v128);

  if (v131[5])
  {
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_3;
    v125[3] = &unk_1E939EF28;
    v126 = v82;
    v127 = &v130;
    VSPerformCompletionHandler(v125);
    v10 = v126;
  }
  else
  {
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v137[5];
      *(_DWORD *)buf = 138412290;
      v146 = v12;
      _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Fetched keychain items: %@", buf, 0xCu);
    }

    v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v84 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v78 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v14 = (id)v137[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v121, v150, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v122 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
          objc_msgSend(v18, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            VSErrorLogObject();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v146 = (uint64_t)v18;
              _os_log_fault_impl(&dword_1D2419000, v21, OS_LOG_TYPE_FAULT, "Invalid keychain item found: %@", buf, 0xCu);
            }

            objc_msgSend(v13, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v121, v150, 16);
      }
      while (v15);
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v22 = (id)v137[5];
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v117, v149, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v118;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v118 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
          if ((objc_msgSend(v13, "containsObject:", v26) & 1) == 0)
          {
            -[VSAccountStore _uniqueIdentifierForKeychainItem:](self, "_uniqueIdentifierForKeychainItem:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "creatorCode");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            VSNumberForFourCharCode(VSKeychainItemCreatorCode);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "isEqual:", v29);

            v31 = v85;
            if ((v30 & 1) != 0)
              goto LABEL_26;
            objc_msgSend(v26, "creatorCode");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v32, "isEqual:", v33);

            v31 = v84;
            if (v34)
            {
LABEL_26:
              objc_msgSend(v31, "setObject:forKey:", v26, v27);
            }
            else
            {
              VSErrorLogObject();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v146 = (uint64_t)v26;
                _os_log_error_impl(&dword_1D2419000, v35, OS_LOG_TYPE_ERROR, "Fetched keychain item with unexpected type code: %@", buf, 0xCu);
              }

            }
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v117, v149, 16);
      }
      while (v23);
    }

    VSDefaultLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v84, "count");
      v38 = objc_msgSend(v85, "count");
      *(_DWORD *)buf = 134218240;
      v146 = v37;
      v147 = 2048;
      v148 = v38;
      _os_log_impl(&dword_1D2419000, v36, OS_LOG_TYPE_DEFAULT, "Fetched %lu modern items and %lu legacy items", buf, 0x16u);
    }

    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((unint64_t)objc_msgSend(v85, "count") >= 2)
    {
      VSDefaultLogObject();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v41, OS_LOG_TYPE_DEFAULT, "deduplicating legacy items.", buf, 2u);
      }

      objc_msgSend(v85, "allValues");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v42, "mutableCopy");

      objc_msgSend(v43, "sortUsingComparator:", &__block_literal_global_3);
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2_74;
      v115[3] = &unk_1E939EF70;
      v116 = v13;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v115);

    }
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_76;
    v109[3] = &unk_1E939EF98;
    v109[4] = self;
    v44 = v78;
    v110 = v44;
    v77 = v85;
    v111 = v77;
    v86 = v13;
    v112 = v86;
    v45 = v40;
    v113 = v45;
    v46 = v39;
    v114 = v46;
    objc_msgSend(v84, "enumerateKeysAndObjectsUsingBlock:", v109);
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_84;
    v105[3] = &unk_1E939EFC0;
    v105[4] = self;
    v76 = v44;
    v106 = v76;
    v83 = v45;
    v107 = v83;
    v79 = v46;
    v108 = v79;
    objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", v105);
    objc_msgSend(v83, "sortUsingComparator:", &__block_literal_global_87);
    if (objc_msgSend(v86, "count") || objc_msgSend(v79, "count", v76))
    {
      VSDefaultLogObject();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = objc_msgSend(v86, "count");
        v49 = objc_msgSend(v79, "count");
        *(_DWORD *)buf = 134218240;
        v146 = v48;
        v147 = 2048;
        v148 = v49;
        _os_log_impl(&dword_1D2419000, v47, OS_LOG_TYPE_DEFAULT, "finished processing keychain items (delete=%lu modernize=%lu)", buf, 0x16u);
      }

      -[VSAccountStore keychainEditingContext](self, "keychainEditingContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v51 = v86;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v102;
        do
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v102 != v53)
              objc_enumerationMutation(v51);
            objc_msgSend(v50, "deleteItem:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * k), v76);
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
        }
        while (v52);
      }

      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v55 = v79;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v98;
        do
        {
          for (m = 0; m != v56; ++m)
          {
            if (*(_QWORD *)v98 != v57)
              objc_enumerationMutation(v55);
            -[VSAccountStore _insertModernKeychainItemForAccount:context:](self, "_insertModernKeychainItemForAccount:context:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * m), v50, v76);
          }
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
        }
        while (v56);
      }

      v59 = (id *)(v131 + 5);
      obj = (id)v131[5];
      objc_msgSend(v50, "save:", &obj);
      objc_storeStrong(v59, obj);

    }
    if (v80 && objc_msgSend(v81, "count"))
    {
      if (!v81)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The providerIDsOrNil parameter must not be nil."));
      v60 = v81;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v61 = v83;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v142, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v93;
        do
        {
          for (n = 0; n != v62; ++n)
          {
            if (*(_QWORD *)v93 != v63)
              objc_enumerationMutation(v61);
            v65 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * n);
            objc_msgSend(v65, "identityProviderID", v76);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "forceUnwrapObject");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v60, "containsObject:", v67);

            if (v68)
            {
              VSDefaultLogObject();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v146 = (uint64_t)v65;
                _os_log_impl(&dword_1D2419000, v69, OS_LOG_TYPE_DEFAULT, "simulate expired token enabled, mutating token expiration for account: %@", buf, 0xCu);
              }

              objc_msgSend(v65, "authenticationToken");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "forceUnwrapObject");
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setExpirationDate:", v72);

            }
          }
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v142, 16);
        }
        while (v62);
      }

    }
    VSDefaultLogObject();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = v131[5];
      *(_DWORD *)buf = 138412546;
      v146 = (uint64_t)v83;
      v147 = 2112;
      v148 = v74;
      _os_log_impl(&dword_1D2419000, v73, OS_LOG_TYPE_DEFAULT, "fetched accounts: %@ with error: %@", buf, 0x16u);
    }

    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_91;
    v88[3] = &unk_1E939F028;
    v90 = v82;
    v75 = v83;
    v89 = v75;
    v91 = &v130;
    VSPerformCompletionHandler(v88);

    v10 = v77;
  }

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v136, 8);

}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  objc_msgSend(a3, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [obj1 modificationDate] parameter must not be nil."));
  objc_msgSend(v4, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2_74(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will mark duplicate legacy keychain item for deletion: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_76(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1[4], "_accountForKeychainItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyItemHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [account legacyItemHash] parameter must not be nil."));
  objc_msgSend(v5, "legacyItemHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "addObject:", v7);
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "modern keychain item has legacy equivalent with hash %@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend(a1[6], "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    if ((objc_msgSend(a1[7], "containsObject:", v11) & 1) != 0)
    {
      VSDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D2419000, v12, OS_LOG_TYPE_DEFAULT, "Modern item has legacy item marked for deletion, deleting modern item.", (uint8_t *)&v26, 2u);
      }

      objc_msgSend(a1[7], "addObject:", v4);
    }
    else
    {
      objc_msgSend(v5, "setLegacyKeychainItem:", v11);
      objc_msgSend(a1[8], "addObject:", v5);
      objc_msgSend(a1[4], "_accountForKeychainItem:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "contentsHash");
      if (v15 != objc_msgSend(v5, "contentsHash"))
      {
        VSDefaultLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "Legacy keychain item and modern keychain item contents do not match.", (uint8_t *)&v26, 2u);
        }

        objc_msgSend(v4, "modificationDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [legacyItem modificationDate] parameter must not be nil."));
        objc_msgSend(v11, "modificationDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "vs_isBefore:", v19);

        VSDefaultLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          if (v22)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1D2419000, v21, OS_LOG_TYPE_DEFAULT, "Legacy keychain item has the most recent values, preferring them over the modern item values.", (uint8_t *)&v26, 2u);
          }

          objc_msgSend(v14, "authenticationToken");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setAuthenticationToken:", v23);

          objc_msgSend(v14, "preferredAppID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setPreferredAppID:", v24);

          objc_msgSend(v14, "username");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setUsername:", v25);

          objc_msgSend(a1[9], "addObject:", v5);
        }
        else
        {
          if (v22)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1D2419000, v21, OS_LOG_TYPE_DEFAULT, "Modern keychain item has the most recent values, keeping them.", (uint8_t *)&v26, 2u);
          }

        }
      }

    }
  }
  else
  {
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Modern item without legacy item found, assuming sign out from legacy device.", (uint8_t *)&v26, 2u);
    }

    objc_msgSend(a1[7], "addObject:", v4);
  }

}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_84(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1[4], "_uniqueIdentifierForKeychainItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "legacy keychain item has hash %@ (cdat=%@)", (uint8_t *)&v10, 0x16u);

  }
  if ((objc_msgSend(a1[5], "containsObject:", v5) & 1) == 0)
  {
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Legacy keychain item found without matching modern item.", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(a1[4], "_accountForKeychainItem:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObject:", v9);
    objc_msgSend(a1[7], "addObject:", v9);

  }
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "effectiveModificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveModificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_91(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_insertModernKeychainItemForAccount:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  VSKeychainGenericPassword *v8;
  VSKeychainGenericPassword *v9;
  void *v10;
  VSKeychainGenericPassword *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "keychainItem");
  v8 = (VSKeychainGenericPassword *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [VSKeychainGenericPassword alloc];
    VSKeychainItemKindGenericPassword();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VSKeychainItem initWithItemKind:insertIntoEditingContext:](v9, "initWithItemKind:insertIntoEditingContext:", v10, v7);

    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keychainItemOrNil parameter must not be nil."));
  }
  v11 = v8;
  objc_msgSend(v6, "setKeychainItem:", v11);
  -[VSKeychainGenericPassword setAccessGroup:](v11, "setAccessGroup:", CFSTR("com.apple.VideoSubscriberAccount"));
  VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setCreatorCode:](v11, "setCreatorCode:", v12);

  objc_msgSend(v6, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setAccount:](v11, "setAccount:", v13);

  -[VSKeychainGenericPassword setSynchronizable:](v11, "setSynchronizable:", objc_msgSend(v6, "isSynchronizable"));
  -[VSKeychainGenericPassword setViewHint:](v11, "setViewHint:", *MEMORY[0x1E0CD6BF0]);
  VSNumberForFourCharCode(0x746F6B32u);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setTypeCode:](v11, "setTypeCode:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "optionalIdentityProviderDisplayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "forceUnwrapObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("TV Provider: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSKeychainGenericPassword setService:](v11, "setService:", v18);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("u"));

  objc_msgSend(v6, "identityProviderID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "forceUnwrapObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("pid"));

  objc_msgSend(v6, "identityProviderDisplayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("dn"));

  objc_msgSend(v6, "preferredAppID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("paid"));

  objc_msgSend(v6, "authenticationToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "forceUnwrapObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "serializedData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("data"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isSynchronizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("sync"));

  objc_msgSend(v6, "channelsData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("channels"));

  objc_msgSend(v6, "legacyKeychainItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountStore _uniqueIdentifierForKeychainItem:](self, "_uniqueIdentifierForKeychainItem:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLegacyItemHash:", v31);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("lhash"));
  objc_msgSend(v6, "authenticationToken");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "forceUnwrapObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v33, "isOpaque");

  if ((_DWORD)v27)
    v34 = CFSTR("api");
  else
    v34 = CFSTR("saml");
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v34, CFSTR("proto"));
  objc_msgSend(v6, "authenticationToken");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "forceUnwrapObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "serializedData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v37, CFSTR("data"));

  v41 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v19, 200, 0, &v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v41;
  if (!v38)
  {
    VSErrorLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[VSAccountStore _insertModernKeychainItemForAccount:context:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error serializing account to property list."));
  }
  -[VSKeychainItem setData:](v11, "setData:", v38);

}

- (void)_insertLegacyKeychainItemForAccount:(id)a3 context:(id)a4
{
  id v5;
  VSKeychainGenericPassword *v6;
  VSKeychainGenericPassword *v7;
  void *v8;
  VSKeychainGenericPassword *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  objc_msgSend(v23, "legacyKeychainItem");
  v6 = (VSKeychainGenericPassword *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [VSKeychainGenericPassword alloc];
    VSKeychainItemKindGenericPassword();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VSKeychainItem initWithItemKind:insertIntoEditingContext:](v7, "initWithItemKind:insertIntoEditingContext:", v8, v5);

    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keychainItemOrNil parameter must not be nil."));
  }
  v9 = v6;
  objc_msgSend(v23, "setLegacyKeychainItem:", v9);
  -[VSKeychainGenericPassword setAccessGroup:](v9, "setAccessGroup:", CFSTR("com.apple.VideoSubscriberAccount"));
  VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setCreatorCode:](v9, "setCreatorCode:", v10);

  objc_msgSend(v23, "accountDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setLabel:](v9, "setLabel:", v11);

  objc_msgSend(v23, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    -[VSKeychainGenericPassword setAccount:](v9, "setAccount:", v12);
  objc_msgSend(v23, "preferredAppID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setComment:](v9, "setComment:", v13);

  objc_msgSend(v23, "optionalIdentityProviderDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "forceUnwrapObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setService:](v9, "setService:", v15);

  objc_msgSend(v23, "identityProviderID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "forceUnwrapObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setGeneric:](v9, "setGeneric:", v17);

  objc_msgSend(v23, "authenticationToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "forceUnwrapObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "isOpaque"))
    v20 = 1953459022;
  else
    v20 = 1635018830;
  VSNumberForFourCharCode(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainGenericPassword setTypeCode:](v9, "setTypeCode:", v21);

  objc_msgSend(v19, "serializedData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
    -[VSKeychainItem setData:](v9, "setData:", v22);
  -[VSKeychainGenericPassword setSynchronizable:](v9, "setSynchronizable:", objc_msgSend(v23, "isSynchronizable"));
  -[VSKeychainGenericPassword setViewHint:](v9, "setViewHint:", *MEMORY[0x1E0CD6BF0]);

}

- (id)_keychainItemsWithLimit:(unint64_t)a3
{
  VSKeychainFetchRequest *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(VSKeychainFetchRequest);
  VSKeychainItemKindGenericPassword();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setItemKind:](v4, "setItemKind:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  v8 = objc_claimAutoreleasedReturnValue();
  VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v8;
  v35[0] = v8;
  v35[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("creatorCode"), v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  VSNumberForFourCharCode(0x6174684Eu);
  v10 = objc_claimAutoreleasedReturnValue();
  VSNumberForFourCharCode(0x746F6B4Eu);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  VSNumberForFourCharCode(0x746F6B32u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v10;
  v34[0] = v10;
  v34[1] = v11;
  v34[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("typeCode"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("accessGroup"), CFSTR("com.apple.VideoSubscriberAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setPredicate:](v4, "setPredicate:", v16);

  -[VSKeychainFetchRequest setFetchLimit:](v4, "setFetchLimit:", a3);
  -[VSKeychainFetchRequest setIncludesDataValues:](v4, "setIncludesDataValues:", 1);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("label"), 1);
  v33[0] = v17;
  v33[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setSortDescriptors:](v4, "setSortDescriptors:", v19);

  -[VSAccountStore keychainEditingContext](self, "keychainEditingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v20, "executeFetchRequest:error:", v4, &v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;

  if (v21)
  {
    +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v21);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSErrorLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[VSAccountStore _keychainItemsWithLimit:].cold.1();

    if (!v22)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v23;
  if (!v23)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));

  return v25;
}

- (NSUndoManager)undoManager
{
  void *v2;
  void *v3;

  -[VSAccountStore keychainEditingContext](self, "keychainEditingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v3;
}

- (void)setUndoManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSAccountStore keychainEditingContext](self, "keychainEditingContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUndoManager:", v4);

}

- (BOOL)isFirstAccountLoaded
{
  return !-[VSAccountStore needsUpdateCachedFirstAccount](self, "needsUpdateCachedFirstAccount");
}

- (id)firstAccountIfLoaded
{
  void *v3;
  void *v4;

  if (-[VSAccountStore needsUpdateCachedFirstAccount](self, "needsUpdateCachedFirstAccount")
    || (-[VSAccountStore cachedFirstAccount](self, "cachedFirstAccount"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v4 = 0;
  }
  else
  {
    -[VSAccountStore firstAccount](self, "firstAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_updateCachedFirstAccount
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  VSSemaphore *v7;
  VSDeveloperSettingsFetchOperation *v8;
  uint64_t v9;
  VSSemaphore *v10;
  VSDeveloperIdentityProviderFetchAllOperation *v11;
  id v12;
  VSSemaphore *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  VSSemaphore *v17;
  BOOL v18;
  _QWORD v20[5];
  _QWORD v21[5];
  VSSemaphore *v22;
  uint64_t *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[4];
  id v30;
  VSSemaphore *v31;
  id v32;
  id location;
  _QWORD v34[4];
  VSSemaphore *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountStore keychainQueue](self, "keychainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected operation queue for updating cached account."));
  v7 = objc_alloc_init(VSSemaphore);
  v8 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  v9 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke;
  v34[3] = &unk_1E939EE88;
  v10 = v7;
  v35 = v10;
  -[VSDeveloperSettingsFetchOperation setCompletionBlock:](v8, "setCompletionBlock:", v34);
  -[VSAsyncOperation start](v8, "start");
  -[VSSemaphore wait](v10, "wait");
  v11 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  objc_initWeak(&location, v11);
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2;
  v29[3] = &unk_1E939F0A0;
  objc_copyWeak(&v32, &location);
  v12 = v3;
  v30 = v12;
  v13 = v10;
  v31 = v13;
  -[VSDeveloperIdentityProviderFetchAllOperation setCompletionBlock:](v11, "setCompletionBlock:", v29);
  -[VSAsyncOperation start](v11, "start");
  -[VSSemaphore wait](v13, "wait");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[VSDeveloperSettingsFetchOperation result](v8, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "forceUnwrapObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_132;
  v24[3] = &unk_1E939F0C8;
  v24[4] = &v25;
  objc_msgSend(v15, "unwrapObject:error:", v24, &__block_literal_global_135);
  v16 = *((unsigned __int8 *)v26 + 24);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_136;
  v21[3] = &unk_1E939F110;
  v21[4] = self;
  v23 = &v36;
  v17 = v13;
  v22 = v17;
  -[VSAccountStore _fetchAccountsSimulatingExpiredToken:forProviderIDs:completion:](self, "_fetchAccountsSimulatingExpiredToken:forProviderIDs:completion:", v16, v12, v21);
  -[VSSemaphore wait](v17, "wait");
  if (*((_BYTE *)v37 + 24))
  {
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_138;
    v20[3] = &unk_1E939EE88;
    v20[4] = self;
    VSPerformBlockOnMainThread(v20);
    v18 = *((_BYTE *)v37 + 24) != 0;
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v36, 8);
  return v18;
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_3;
  v8[3] = &unk_1E939F078;
  v9 = a1[4];
  v10 = a1[5];
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5;
  v6[3] = &unk_1E939ED90;
  v7 = a1[5];
  objc_msgSend(v5, "unwrapObject:error:", v8, v6);

}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "providerID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_4;
        v10[3] = &unk_1E939F050;
        v11 = *(id *)(a1 + 32);
        objc_msgSend(v9, "conditionallyUnwrapObject:", v10);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "signal");

}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "signal");
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "simulateExpiredToken");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_134()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_134_cold_1(v0);

}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedFirstAccount");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (v9 && v8)
      {
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "setCachedFirstAccount:", v10);
    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateCachedFirstAccount:", 0);

    goto LABEL_14;
  }
  VSErrorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_136_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateCachedFirstAccount:", 1);
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "signal");

}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_138(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLocalNotification");
}

- (id)firstAccount
{
  void *v3;
  VSSemaphore *v4;
  void *v5;
  VSSemaphore *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  VSAccountStore *v12;
  VSSemaphore *v13;

  if (-[VSAccountStore needsUpdateCachedFirstAccount](self, "needsUpdateCachedFirstAccount")
    || (-[VSAccountStore cachedFirstAccount](self, "cachedFirstAccount"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v4 = objc_alloc_init(VSSemaphore);
    -[VSAccountStore keychainQueue](self, "keychainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __30__VSAccountStore_firstAccount__block_invoke;
    v11 = &unk_1E939F138;
    v12 = self;
    v13 = v4;
    v6 = v4;
    objc_msgSend(v5, "addOperationWithBlock:", &v8);

    -[VSSemaphore wait](v6, "wait", v8, v9, v10, v11, v12);
  }
  -[VSAccountStore cachedFirstAccount](self, "cachedFirstAccount");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __30__VSAccountStore_firstAccount__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateCachedFirstAccount");
  return objc_msgSend(*(id *)(a1 + 40), "signal");
}

- (NSArray)accounts
{
  VSSemaphore *v3;
  VSSemaphore *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  VSSemaphore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = objc_alloc_init(VSSemaphore);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = (id)MEMORY[0x1E0C9AA60];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __26__VSAccountStore_accounts__block_invoke;
  v10 = &unk_1E939F160;
  v12 = &v13;
  v4 = v3;
  v11 = v4;
  -[VSAccountStore fetchAccountsWithCompletionHandler:](self, "fetchAccountsWithCompletionHandler:", &v7);
  -[VSSemaphore wait](v4, "wait", v7, v8, v9, v10);
  v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v5;
}

uint64_t __26__VSAccountStore_accounts__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__VSAccountStore_accounts__block_invoke_2;
  v4[3] = &unk_1E939EED8;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "unwrapObject:error:", v4, &__block_literal_global_139);
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __26__VSAccountStore_accounts__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __26__VSAccountStore_accounts__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __26__VSAccountStore_accounts__block_invoke_3_cold_1();

}

- (void)fetchAccountsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  VSAccountStore *v11;
  id v12;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VSAccountStore keychainQueue](self, "keychainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E939F1F8;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v9);

}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke(uint64_t a1)
{
  VSDeveloperSettingsFetchOperation *v2;
  VSSemaphore *v3;
  uint64_t v4;
  VSSemaphore *v5;
  VSDeveloperIdentityProviderFetchAllOperation *v6;
  VSSemaphore *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  VSSemaphore *v18;
  id v19;
  id location;
  _QWORD v21[4];
  VSSemaphore *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v2 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  v3 = objc_alloc_init(VSSemaphore);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E939EE88;
  v5 = v3;
  v22 = v5;
  -[VSDeveloperSettingsFetchOperation setCompletionBlock:](v2, "setCompletionBlock:", v21);
  -[VSAsyncOperation start](v2, "start");
  -[VSSemaphore wait](v5, "wait");
  v6 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  objc_initWeak(&location, v6);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E939F0A0;
  objc_copyWeak(&v19, &location);
  v17 = *(id *)(a1 + 32);
  v7 = v5;
  v18 = v7;
  -[VSDeveloperIdentityProviderFetchAllOperation setCompletionBlock:](v6, "setCompletionBlock:", v16);
  -[VSAsyncOperation start](v6, "start");
  -[VSSemaphore wait](v7, "wait");
  -[VSDeveloperSettingsFetchOperation result](v2, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_143;
  v15[3] = &unk_1E939F0C8;
  v15[4] = &v23;
  objc_msgSend(v9, "unwrapObject:error:", v15, &__block_literal_global_145);
  v10 = *((unsigned __int8 *)v24 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_146;
  v13[3] = &unk_1E939F1D0;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v11, "_fetchAccountsSimulatingExpiredToken:forProviderIDs:completion:", v10, v12, v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E939F078;
  v9 = a1[4];
  v10 = a1[5];
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_6;
  v6[3] = &unk_1E939ED90;
  v7 = a1[5];
  objc_msgSend(v5, "unwrapObject:error:", v8, v6);

}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "providerID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_5;
        v10[3] = &unk_1E939F050;
        v11 = *(id *)(a1 + 32);
        objc_msgSend(v9, "conditionallyUnwrapObject:", v10);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "signal");

}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "signal");
}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "simulateExpiredToken");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_144(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_144_cold_1();

}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(uint64_t);
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11 = MEMORY[0x1E0C809B0];
    v8 = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3_150;
    v9 = &v11;
    v10 = v6;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v8 = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_147;
    v9 = &v12;
    v10 = v5;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v9[3] = (uint64_t)&unk_1E939F1A8;
  v9[5] = (uint64_t)*(id *)(a1 + 32);
  v9[4] = (uint64_t)v10;
  VSPerformCompletionHandler(v9);

}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_147(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accounts parameter must not be nil."));
    v1 = *(void **)(a1 + 32);
  }
  v4 = v1;
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);

}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3_150(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
    v1 = *(void **)(a1 + 32);
  }
  v4 = v1;
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);

}

- (BOOL)_insertAccount:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "VSAccountStore _insertAccount: %@", buf, 0xCu);
  }

  -[VSAccountStore _insertLegacyKeychainItemForAccount:context:](self, "_insertLegacyKeychainItemForAccount:context:", v8, v9);
  v30 = 0;
  v11 = objc_msgSend(v9, "save:", &v30);
  v12 = v30;
  if (v11)
  {
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "legacyKeychainItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountStore _uniqueIdentifierForKeychainItem:](self, "_uniqueIdentifierForKeychainItem:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legacyKeychainItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "creationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Successfully committed legacy item with hash %@ (cdat=%@)", buf, 0x16u);

    }
    -[VSAccountStore _insertModernKeychainItemForAccount:context:](self, "_insertModernKeychainItemForAccount:context:", v8, v9);
    v29 = v12;
    v18 = objc_msgSend(v9, "save:", &v29);
    v19 = v29;

    if ((v18 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      VSErrorLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[VSAccountStore _insertAccount:inContext:error:].cold.2();

      v23 = objc_retainAutorelease(v19);
      *a5 = v23;

      objc_msgSend(v8, "legacyKeychainItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [account legacyKeychainItem] parameter must not be nil."));
      objc_msgSend(v8, "legacyKeychainItem");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deleteItem:", v25);

      v28 = 0;
      LOBYTE(v25) = objc_msgSend(v9, "save:", &v28);
      v19 = v28;
      if ((v25 & 1) == 0)
      {
        VSErrorLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[VSAccountStore _insertAccount:inContext:error:].cold.1();

      }
      v20 = 0;
    }
  }
  else
  {
    VSErrorLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[VSAccountStore _insertAccount:inContext:error:].cold.3();

    v19 = objc_retainAutorelease(v12);
    v20 = 0;
    *a5 = v19;
  }

  return v20;
}

- (void)saveAccounts:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accounts parameter must not be nil."));
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must supply at least one account to save."));
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSAccountStore saveAccounts:withCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSAccountStore keychainQueue](self, "keychainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E939F1F8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "addOperationWithBlock:", v12);

}

void __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  _BYTE v28[14];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "keychainEditingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v11 = *(void **)(a1 + 32);
        v22 = v9;
        v12 = objc_msgSend(v11, "_insertAccount:inContext:error:", v10, v2, &v22);
        v6 = v22;

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v12 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateCachedFirstAccount");
  VSDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v28 = v12;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v6;
    _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Finished saving accounts with status %i with error %@", buf, 0x12u);
  }

  v14 = *(void **)(a1 + 48);
  v15 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_155;
    v18[3] = &unk_1E939F220;
    v20 = v14;
    v21 = v12;
    v19 = v6;
    VSPerformCompletionHandler(v18);

    v16 = v20;
  }
  else
  {
    VSDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v28 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", buf, 0xCu);
    }
  }

  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_158;
  v17[3] = &unk_1E939EE88;
  v17[4] = *(_QWORD *)(a1 + 32);
  VSPerformBlockOnMainThread(v17);

}

void __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_155(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void (*v4)(void);
  _QWORD *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", (uint8_t *)&v7, 0xCu);
  }

  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void (*)(void))v3[2];
  v5 = v3;
  v4();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRemoteNotification");
}

- (void)removeAccounts:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accounts parameter must not be nil."));
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must supply at least one account to remove."));
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSAccountStore removeAccounts:withCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSAccountStore keychainQueue](self, "keychainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E939F1F8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "addOperationWithBlock:", v12);

}

void __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "keychainEditingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = a1;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    v7 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "legacyKeychainItem", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v7, CFSTR("The [account legacyKeychainItem] parameter must not be nil."));
        objc_msgSend(v9, "legacyKeychainItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "deleteItem:", v11);

        objc_msgSend(v9, "keychainItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v7, CFSTR("The [account keychainItem] parameter must not be nil."));
        objc_msgSend(v9, "keychainItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "deleteItem:", v13);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v5);
  }

  v26 = 0;
  v14 = objc_msgSend(v2, "save:", &v26);
  v15 = v26;
  objc_msgSend(*(id *)(v20 + 32), "_updateCachedFirstAccount");
  VSDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "Finished removing accounts.  Will invoke completion handler and post notification.", buf, 2u);
  }

  v17 = *(void **)(v20 + 48);
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_163;
    v22[3] = &unk_1E939F220;
    v24 = v17;
    v25 = v14;
    v23 = v15;
    VSPerformCompletionHandler(v22);

    v19 = v24;
  }
  else
  {
    VSDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1D2419000, v19, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", buf, 0xCu);
    }
  }

  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_166;
  v21[3] = &unk_1E939EE88;
  v21[4] = *(_QWORD *)(v20 + 32);
  VSPerformBlockOnMainThread(v21);

}

void __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_163(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void (*v4)(void);
  _QWORD *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", (uint8_t *)&v7, 0xCu);
  }

  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void (*)(void))v3[2];
  v5 = v3;
  v4();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRemoteNotification");
}

- (VSAccount)cachedFirstAccount
{
  return (VSAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedFirstAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)needsUpdateCachedFirstAccount
{
  return self->_needsUpdateCachedFirstAccount;
}

- (void)setNeedsUpdateCachedFirstAccount:(BOOL)a3
{
  self->_needsUpdateCachedFirstAccount = a3;
}

- (VSKeychainEditingContext)keychainEditingContext
{
  return self->_keychainEditingContext;
}

- (void)setKeychainEditingContext:(id)a3
{
  objc_storeStrong((id *)&self->_keychainEditingContext, a3);
}

- (NSOperationQueue)keychainQueue
{
  return self->_keychainQueue;
}

- (void)setKeychainQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keychainQueue, a3);
}

- (id)changeObserver
{
  return objc_loadWeakRetained(&self->_changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak(&self->_changeObserver, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_destroyWeak(&self->_changeObserver);
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_keychainEditingContext, 0);
  objc_storeStrong((id *)&self->_cachedFirstAccount, 0);
}

- (void)_accountForKeychainItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D2419000, v0, OS_LOG_TYPE_FAULT, "Got keychain item with no data: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_accountForKeychainItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unexpected token type code when deserializing account from keychain: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_accountForKeychainItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error deserializing keychain item body: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_accountForKeychainItem:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unexpected scheme when decoding account from 2.0 keychain item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_accountForKeychainItem:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "creatorCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Unexpected creator code when deserialziing account from keychain item: %@", v4, 0xCu);

}

- (void)_insertModernKeychainItemForAccount:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error serializing account to property list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_keychainItemsWithLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching keychain items: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetch existing providers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_134_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Error fetching developer settings, assuming no token expiration simulation.", v1, 2u);
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_136_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Failed to update cached account: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __26__VSAccountStore_accounts__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to fetch accounts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_144_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching developer settings to check for expired token simulation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_insertAccount:inContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error saving keychain after removing item for error cleanup: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_insertAccount:inContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error saving modern keychain item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_insertAccount:inContext:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error saving legacy keychain item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
