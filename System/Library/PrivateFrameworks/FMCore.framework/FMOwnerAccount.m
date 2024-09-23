@implementation FMOwnerAccount

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance___instance;
}

uint64_t __32__FMOwnerAccount_sharedInstance__block_invoke()
{
  FMOwnerAccount *v0;
  void *v1;

  v0 = objc_alloc_init(FMOwnerAccount);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance___instance, "setLegacyBehavior:", 1);
}

- (FMOwnerAccount)init
{
  FMOwnerAccount *v2;
  FMOwnerAccount *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMOwnerAccount;
  v2 = -[FMOwnerAccount init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FMOwnerAccount initializeAccount](v2, "initializeAccount");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)accountChanged, (CFStringRef)*MEMORY[0x1E0C8F1C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_accountChanged, CFSTR("accountChangedNotification"), 0);

  }
  return v3;
}

- (void)initializeAccount
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "FMOwnerAccount: Cannot retreive iCloud account", v1, 2u);
}

- (NSString)username
{
  void *v3;
  NSString *v4;

  if (-[FMOwnerAccount legacyBehavior](self, "legacyBehavior"))
  {
    -[FMOwnerAccount account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "username");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_username;
  }
  return v4;
}

- (BOOL)legacyBehavior
{
  return self->_legacyBehavior;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setLegacyBehavior:(BOOL)a3
{
  self->_legacyBehavior = a3;
}

- (FMOwnerAccount)initWithAuthToken:(id)a3 personId:(id)a4
{
  id v7;
  id v8;
  FMOwnerAccount *v9;
  FMOwnerAccount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMOwnerAccount;
  v9 = -[FMOwnerAccount init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authToken, a3);
    objc_storeStrong((id *)&v10->_personId, a4);
  }

  return v10;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  if (-[FMOwnerAccount legacyBehavior](self, "legacyBehavior"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0C8F1C0], 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
  v5.receiver = self;
  v5.super_class = (Class)FMOwnerAccount;
  -[FMOwnerAccount dealloc](&v5, sel_dealloc);
}

- (void)accountChanged
{
  NSObject *v3;
  ACAccount *account;
  uint8_t v5[16];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_DEFAULT, "FMOwnerAccount: Account changed", v5, 2u);
  }

  account = self->_account;
  self->_account = 0;

  -[FMOwnerAccount initializeAccount](self, "initializeAccount");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMOwnerAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMOwnerAccount personId](self, "personId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@[%@]>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)personId
{
  void *v3;
  NSString *v4;

  if (-[FMOwnerAccount legacyBehavior](self, "legacyBehavior"))
  {
    -[FMOwnerAccount account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_personID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_personId;
  }
  return v4;
}

- (NSString)firstName
{
  void *v3;
  NSString *v4;

  if (-[FMOwnerAccount legacyBehavior](self, "legacyBehavior"))
  {
    -[FMOwnerAccount account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_firstName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_firstName;
  }
  return v4;
}

- (NSString)lastName
{
  void *v3;
  NSString *v4;

  if (-[FMOwnerAccount legacyBehavior](self, "legacyBehavior"))
  {
    -[FMOwnerAccount account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_lastName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_lastName;
  }
  return v4;
}

- (id)tokenOfType:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    if (objc_msgSend(v6, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F408]))
    {
      objc_msgSend(v7, "aa_fmfAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v18 = 0;
    objc_msgSend(v9, "credentialWithError:", &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    objc_msgSend(v8, "credentialItemForKey:", *MEMORY[0x1E0C8F1E0]);
    v12 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v12;
    if (!v11 && v12)
    {
      -[FMOwnerAccount setAccount:](self, "setAccount:", v7);
      v10 = v10;
      v11 = 0;
      v13 = v10;
      goto LABEL_15;
    }
    LogCategory_Unspecified();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "username");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = (int64_t)v15;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1C9967000, v14, OS_LOG_TYPE_DEFAULT, "Count not retrieve app token for FMF account [%@]. Error: %@", buf, 0x16u);

    }
  }
  LogCategory_Unspecified();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a3;
    _os_log_impl(&dword_1C9967000, v16, OS_LOG_TYPE_INFO, "Unknown FMAuthTokenType: %ld", buf, 0xCu);
  }

  v13 = 0;
LABEL_15:

  return v13;
}

- (id)hostNameOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FMOwnerAccount account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataclassProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1C9967000, v6, OS_LOG_TYPE_DEFAULT, "Unknown FMAuthTokenType: %ld", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F408]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appHostname"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)authTokenForSubAccount:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(a3, "credentialWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (a4 == 1)
  {
    v10 = (id *)MEMORY[0x1E0C8F1F8];
    goto LABEL_5;
  }
  v9 = 0;
  if (!a4)
  {
    v10 = (id *)MEMORY[0x1E0C8F1E0];
LABEL_5:
    v9 = *v10;
  }
  objc_msgSend(v7, "credentialItemForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 || !v11)
  {
    LogCategory_Unspecified();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1C9967000, v14, OS_LOG_TYPE_INFO, "Count not retrieve token for account. Error: %@", buf, 0xCu);
    }

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "fm_safeSetObject:forKey:", v8, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmcore.FMOwnerAccountError"), 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v13 = 0;
  }
  else
  {
    v13 = v11;
  }

  return v13;
}

+ (id)hostNameForAccount:(id)a3 type:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "dataclassProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 == 1)
  {
    v9 = *MEMORY[0x1E0C8F3A8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F3A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appHostname"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("hostname"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v13 = v7;
    else
      v13 = v12;
    v8 = v13;

  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F408]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appHostname"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v8;
}

+ (id)subAccountForAccount:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    objc_msgSend(v5, "aa_fmipAccount");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "aa_fmfAccount");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

+ (id)primaryAccountWithStore:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v8 = v7;
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmcore.FMOwnerAccountError"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

  }
  return v9;
}

+ (id)personIdForAccount:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "aa_personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmcore.FMOwnerAccountError"), 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a4)
      *a4 = objc_retainAutorelease(v6);

  }
  return v5;
}

+ (id)ownerAccount
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v7;

  v2 = (void *)objc_opt_new();
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FMOwnerAccount_ownerAccount__block_invoke;
  block[3] = &unk_1E82AA5A8;
  v4 = v2;
  v7 = v4;
  dispatch_async(v3, block);

  return v4;
}

void __30__FMOwnerAccount_ownerAccount__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  FMInternalOwnerAccount *v4;
  id v5;

  v5 = 0;
  +[FMOwnerAccount primaryAccountWithStore:error:](FMOwnerAccount, "primaryAccountWithStore:error:", 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    v4 = -[FMInternalOwnerAccount initWithAccount:]([FMInternalOwnerAccount alloc], "initWithAccount:", v2);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);

  }
}

+ (id)ownerAccountWithType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v5 = (void *)objc_opt_new();
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FMOwnerAccount_ownerAccountWithType___block_invoke;
  block[3] = &unk_1E82AA8D0;
  v7 = v5;
  v10 = v7;
  v11 = a1;
  v12 = a3;
  dispatch_async(v6, block);

  return v7;
}

void __39__FMOwnerAccount_ownerAccountWithType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  FMOwnerAccount *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v18 = 0;
  +[FMOwnerAccount primaryAccountWithStore:error:](FMOwnerAccount, "primaryAccountWithStore:error:", 0, &v18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v18;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    v17 = 0;
    +[FMOwnerAccount personIdForAccount:error:](FMOwnerAccount, "personIdForAccount:error:", v2, &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "subAccountForAccount:type:", v2, *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v16 = 0;
      +[FMOwnerAccount authTokenForSubAccount:type:error:](FMOwnerAccount, "authTokenForSubAccount:type:error:", v6, v7, &v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16;
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "hostNameForAccount:type:", v2, *(_QWORD *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v8;
        v11 = -[FMOwnerAccount initWithAuthToken:personId:]([FMOwnerAccount alloc], "initWithAuthToken:personId:", v8, v4);
        -[FMOwnerAccount setHostName:](v11, "setHostName:", v10);
        objc_msgSend(v2, "aa_firstName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMOwnerAccount setFirstName:](v11, "setFirstName:", v12);

        objc_msgSend(v2, "aa_lastName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMOwnerAccount setLastName:](v11, "setLastName:", v13);

        objc_msgSend(v2, "username");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMOwnerAccount setUsername:](v11, "setUsername:", v14);

        objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v11);
        v8 = v15;

      }
    }

  }
}

+ (void)renewCredentialsWithBundleId:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  void (**v11)(id, id);
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, id);
  id v32;
  uint8_t buf[16];

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, id))a6;
  LogCategory_Unspecified();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9967000, v12, OS_LOG_TYPE_DEFAULT, "FMOwnerAccount renewCredentialsWithBundleId:force:reason:completion:", buf, 2u);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v32 = 0;
  +[FMOwnerAccount primaryAccountWithStore:error:](FMOwnerAccount, "primaryAccountWithStore:error:", v13, &v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;
  if (v15)
  {
    LogCategory_Unspecified();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[FMOwnerAccount renewCredentialsWithBundleId:force:reason:completion:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

    if (v11)
      v11[2](v11, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    v25 = *MEMORY[0x1E0C8F330];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v9 = v24;
    objc_msgSend(v23, "fm_safelyMapKey:toObject:", v27, v26);

    objc_msgSend(v23, "fm_safelyMapKey:toObject:", *MEMORY[0x1E0C8F308], v24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fm_safelyMapKey:toObject:", CFSTR("AARenewShouldForceInteraction"), v28);

    objc_msgSend(v23, "fm_safelyMapKey:toObject:", *MEMORY[0x1E0C8F310], v10);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke;
    v29[3] = &unk_1E82AA8F8;
    v30 = v14;
    v31 = v11;
    objc_msgSend(v13, "renewCredentialsForAccount:options:completion:", v30, v23, v29);

  }
}

void __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 > 2)
    v6 = 0;
  else
    v6 = off_1E82AA918[a2];
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "aa_personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1C9967000, v7, OS_LOG_TYPE_DEFAULT, "renewCredentials of account %@ completed with status %@", (uint8_t *)&v19, 0x16u);

  }
  if (a2 || v5)
  {
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "fm_safeSetObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmcore.FMOwnerAccountError"), 4, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v9);

}

- (void)setPersonId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_personId, 0);
}

+ (void)renewCredentialsWithBundleId:(uint64_t)a3 force:(uint64_t)a4 reason:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, a2, a3, "FMOwnerAccount primaryAccountError %@", a5, a6, a7, a8, 2u);
}

void __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, a2, a3, "renewCredentials failed %@", a5, a6, a7, a8, 2u);
}

@end
