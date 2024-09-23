@implementation BUAccountsProvider

- (BOOL)isPrimaryAccountManagedAppleID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char v11;

  objc_msgSend_cachedIsPrimaryAccountManagedAppleID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_BOOLForKey_(v9, v10, (uint64_t)CFSTR("BCForceMAIDAccount"));

  return v11 | v6;
}

- (BOOL)isStoreAccountManagedAppleID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char v11;

  objc_msgSend_cachedIsStoreAccountManagedAppleID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_BOOLForKey_(v9, v10, (uint64_t)CFSTR("BCForceMAIDAccount"));

  return v11 | v6;
}

- (NSNumber)cachedIsStoreAccountManagedAppleID
{
  os_unfair_lock_s *p_storeAccountCacheLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  BUAccountsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E62684;
  v15 = sub_212E62694;
  v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E476E0;
  v8 = &unk_24CED9D98;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSNumber *)v4;
}

- (NSNumber)cachedIsPrimaryAccountManagedAppleID
{
  os_unfair_lock_s *p_appleAccountCacheLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, const char *, uint64_t);
  void *v8;
  BUAccountsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E62684;
  v15 = sub_212E62694;
  v16 = 0;
  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E47850;
  v8 = &unk_24CED9D98;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSNumber *)v4;
}

+ (BUAccountsProvider)sharedProvider
{
  if (qword_253DB2550 != -1)
    dispatch_once(&qword_253DB2550, &unk_24CEDA9F0);
  return (BUAccountsProvider *)(id)qword_253DB2558;
}

- (void)addObserver:(id)a3 accountTypes:(unint64_t)a4
{
  char v4;
  id v6;
  const char *v7;
  OS_dispatch_queue *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *p_appleAccountCacheLock;
  _QWORD *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  _QWORD v23[4];
  OS_dispatch_queue *v24;
  id v25;
  _QWORD v26[2];
  uint64_t (*v27)(uint64_t, const char *);
  void *v28;
  BUAccountsProvider *v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[2];
  uint64_t (*v33)(uint64_t, const char *);
  void *v34;
  BUAccountsProvider *v35;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  v8 = self->_notifyQueue;
  if ((v4 & 1) != 0 && objc_msgSend__addObserver_forAccountType_(self, v7, (uint64_t)v6, 1) == 1)
  {
    v9 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v33 = sub_212E49E00;
    v34 = &unk_24CED9E10;
    v35 = self;
    v10 = v32;
    os_unfair_lock_lock_with_options();
    ((void (*)(_QWORD *))v33)(v10);
    os_unfair_lock_unlock(&self->_storeAccountCacheLock);

    block[0] = v9;
    block[1] = 3221225472;
    block[2] = sub_212E49D90;
    block[3] = &unk_24CEDAA18;
    objc_copyWeak(&v31, &location);
    dispatch_async((dispatch_queue_t)v8, block);
    objc_destroyWeak(&v31);
  }
  if ((v4 & 2) != 0)
  {
    v11 = objc_msgSend__addObserver_forAccountType_(self, v7, (uint64_t)v6, 2);
    if (objc_msgSend_hasCloudKitEntitlement(self, v12, v13))
    {
      if (v11 == 1)
      {
        v14 = MEMORY[0x24BDAC760];
        p_appleAccountCacheLock = &self->_appleAccountCacheLock;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v27 = sub_212E62928;
        v28 = &unk_24CED9E10;
        v29 = self;
        v16 = v26;
        os_unfair_lock_lock_with_options();
        ((void (*)(_QWORD *))v27)(v16);
        os_unfair_lock_unlock(p_appleAccountCacheLock);

        sub_212E56D84();
        v17 = (void *)objc_opt_class();
        objc_msgSend_defaultContainer(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = sub_212E62934;
        v23[3] = &unk_24CEDAA68;
        v24 = v8;
        objc_copyWeak(&v25, &location);
        objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v20, v21, (uint64_t)v23);

        objc_destroyWeak(&v25);
      }
    }
    else
    {
      BookUtilityLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        sub_212E6D514();

    }
  }

  objc_destroyWeak(&location);
}

- (int64_t)_addObserver:(id)a3 forAccountType:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_observersLock;
  id v8;
  _QWORD *v9;
  int64_t v10;
  _QWORD v12[2];
  void (*v13)(_QWORD *);
  void *v14;
  BUAccountsProvider *v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  p_observersLock = &self->_observersLock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = (void (*)(_QWORD *))sub_212E48264;
  v14 = &unk_24CEDAAB0;
  v15 = self;
  v18 = a4;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v9 = v12;
  os_unfair_lock_lock_with_options();
  v13(v9);
  os_unfair_lock_unlock(p_observersLock);

  v10 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (NSString)iCloudIdentity
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_primaryAppleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_altDSID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isGlobalICloudDriveSyncOptedIn
{
  uint64_t v2;
  void *v3;
  const char *v4;
  char isEnabledForDataclass;

  objc_msgSend_primaryAppleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isEnabledForDataclass = objc_msgSend_isEnabledForDataclass_(v3, v4, *MEMORY[0x24BDB4668]);

  return isEnabledForDataclass;
}

- (BOOL)isUserSignedInToiCloud
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char isEqualToString;

  objc_msgSend_primaryAppleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountType(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x24BDB3FD8]);

  return isEqualToString;
}

- (ACAccount)primaryAppleAccount
{
  os_unfair_lock_s *p_appleAccountCacheLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, const char *, uint64_t);
  void *v8;
  BUAccountsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E62684;
  v15 = sub_212E62694;
  v16 = 0;
  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E48508;
  v8 = &unk_24CED9AC8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (NSString)currentStorefront
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;

  objc_msgSend_activeStoreAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_ams_storefront(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v8, v9, v10))
    {
      if (v8)
      {
        v11 = v7;
        goto LABEL_16;
      }
    }
    else
    {
      BookUtilityLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_212E6D4E8();

    }
  }
  objc_msgSend_localStoreAccount(self, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_ams_storefront(v11, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v8, v15, v16))
    {
      if (v8)
        goto LABEL_16;
    }
    else
    {

    }
  }
  BookUtilityLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_212E6D4BC();

  v8 = 0;
LABEL_16:

  return (NSString *)v8;
}

- (ACAccount)activeStoreAccount
{
  os_unfair_lock_s *p_storeAccountCacheLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, const char *, uint64_t);
  void *v8;
  BUAccountsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E62684;
  v15 = sub_212E62694;
  v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E48724;
  v8 = &unk_24CED9AC8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (id)l_primaryAppleAccount
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  ACAccount *v11;
  ACAccount *primaryAppleAccount;
  NSObject *v13;
  ACAccount *v14;
  int v16;
  ACAccount *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(self, a2, 2);
  if (!self->_primaryAppleAccount || (objc_msgSend_hasCloudKitEntitlement(self, v3, v4) & 1) == 0)
  {
    BookUtilityLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_212E45000, v5, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] No account available. Calling ams_activeiCloudAccount", (uint8_t *)&v16, 2u);
    }

    objc_msgSend_bu_sharedAccountStore(MEMORY[0x24BDB4398], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_activeiCloudAccount(v8, v9, v10);
    v11 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    primaryAppleAccount = self->_primaryAppleAccount;
    self->_primaryAppleAccount = v11;

    BookUtilityLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_primaryAppleAccount;
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_212E45000, v13, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] primaryAppleAccount: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  return self->_primaryAppleAccount;
}

- (id)l_activeStoreAccount
{
  const char *v3;
  uint64_t v4;
  ACAccount *activeStoreAccount;
  void *v6;
  const char *v7;
  uint64_t v8;
  ACAccount *v9;
  ACAccount *v10;

  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(self, a2, 1);
  activeStoreAccount = self->_activeStoreAccount;
  if (!activeStoreAccount)
  {
    objc_msgSend_bu_sharedAccountStore(MEMORY[0x24BDB4398], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_activeiTunesAccount(v6, v7, v8);
    v9 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v10 = self->_activeStoreAccount;
    self->_activeStoreAccount = v9;

    activeStoreAccount = self->_activeStoreAccount;
  }
  return activeStoreAccount;
}

- (void)_registerNotificationForAccountTypeIfNeeded:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    if (objc_msgSend_hasCloudKitEntitlement(self, v5, v6))
    {
      objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v22, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        sub_212E49A9C();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = sub_212E633B0;
        v26[3] = &unk_24CEDAB28;
        v15 = &v27;
        objc_copyWeak(&v27, &location);
        objc_msgSend_addObserverForName_object_queue_usingBlock_(v10, v24, (uint64_t)v13, 0, 0, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAppleAccountDidChangeNotificationRegisteredToken_(self, v25, (uint64_t)v17);
        goto LABEL_8;
      }
    }
  }
  else if (a3 == 1)
  {
    objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bu_sharedAccountStore(MEMORY[0x24BDB4398], v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BDB3FB0];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_212E63368;
      v28[3] = &unk_24CEDAB28;
      v15 = &v29;
      objc_copyWeak(&v29, &location);
      objc_msgSend_addObserverForName_object_queue_usingBlock_(v10, v16, v14, v13, 0, v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStoreAccountDidChangeNotificationRegisteredToken_(self, v18, (uint64_t)v17);
LABEL_8:

      objc_destroyWeak(v15);
    }
  }
  objc_destroyWeak(&location);
}

- (NSObject)storeAccountDidChangeNotificationRegisteredToken
{
  return self->_storeAccountDidChangeNotificationRegisteredToken;
}

- (BOOL)hasCloudKitEntitlement
{
  if (qword_253DB2518 != -1)
    dispatch_once(&qword_253DB2518, &unk_24CEDAA88);
  return byte_253DB2510;
}

- (NSObject)appleAccountDidChangeNotificationRegisteredToken
{
  return self->_appleAccountDidChangeNotificationRegisteredToken;
}

- (ACAccount)localStoreAccount
{
  os_unfair_lock_s *p_storeAccountCacheLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, const char *);
  void *v8;
  BUAccountsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E62684;
  v15 = sub_212E62694;
  v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E48C70;
  v8 = &unk_24CED9D98;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (BOOL)isUserSignedInToiTunes
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_activeStoreAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setStoreAccountDidChangeNotificationRegisteredToken:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccountDidChangeNotificationRegisteredToken, a3);
}

- (void)setAppleAccountDidChangeNotificationRegisteredToken:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountDidChangeNotificationRegisteredToken, a3);
}

- (void)nq_setupNotifyBlockForAccountType:(unint64_t)a3 currentAccountIdentifier:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  NSMutableDictionary *notifyBlocks;
  void *v10;
  const char *v11;
  void *v12;
  OS_dispatch_queue *v13;
  BUCoalescingCallBlock *v14;
  OS_dispatch_queue *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  const char *v25;
  void *v26;
  const char *v27;
  NSMutableDictionary *accountIdentifiers;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  OS_dispatch_queue *v36;
  id v37[2];
  id location;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  if (objc_msgSend__observerCountForAccountType_(self, v7, a3) >= 1)
  {
    notifyBlocks = self->_notifyBlocks;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v8, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(notifyBlocks, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = self->_notifyQueue;
      objc_initWeak(&location, self);
      v14 = [BUCoalescingCallBlock alloc];
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = sub_212E6373C;
      v35 = &unk_24CEDAB98;
      v15 = v13;
      v36 = v15;
      objc_copyWeak(v37, &location);
      v37[1] = (id)a3;
      NSStringFromBUAccountsType(a3, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_initWithNotifyBlock_blockDescription_(v14, v18, (uint64_t)&v32, v17);

      objc_msgSend_setCoalescingDelay_(v19, v20, v21, 1.0, v32, v33, v34, v35);
      objc_msgSend_setMaximumDelay_(v19, v22, v23, 2.0);
      v24 = self->_notifyBlocks;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v25, a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v24, v27, (uint64_t)v19, v26);

      accountIdentifiers = self->_accountIdentifiers;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v29, a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(accountIdentifiers, v31, (uint64_t)v6, v30);

      objc_destroyWeak(v37);
      objc_destroyWeak(&location);

    }
  }

}

- (BUAccountsProvider)init
{
  BUAccountsProvider *v2;
  BUAccountsProvider *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *notifyQueue;
  uint64_t v7;
  NSMutableDictionary *notifyBlocks;
  uint64_t v9;
  NSMutableDictionary *observerHashTables;
  uint64_t v11;
  NSMutableDictionary *accountIdentifiers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BUAccountsProvider;
  v2 = -[BUAccountsProvider init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_appleAccountCacheLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("BUAccountsProvider.notifyQueue", v4);
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    notifyBlocks = v3->_notifyBlocks;
    v3->_notifyBlocks = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    observerHashTables = v3->_observerHashTables;
    v3->_observerHashTables = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    accountIdentifiers = v3->_accountIdentifiers;
    v3->_accountIdentifiers = (NSMutableDictionary *)v11;

    *(_QWORD *)&v3->_tccObserverLock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
  }
  return v3;
}

- (int64_t)_observerCountForAccountType:(unint64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  _QWORD *v4;
  int64_t v5;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  BUAccountsProvider *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v8 = (void (*)(_QWORD *))sub_212E49CC4;
  v9 = &unk_24CEDAB00;
  v11 = &v13;
  v12 = a3;
  v10 = self;
  v4 = v7;
  os_unfair_lock_lock_with_options();
  v8(v4);
  os_unfair_lock_unlock(p_observersLock);

  v5 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  os_unfair_lock_s *p_storeAccountCacheLock;
  _QWORD *v5;
  objc_super v6;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t);
  void *v9;
  BUAccountsProvider *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = MEMORY[0x24BDAC760];
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212E62658;
  v17[3] = &unk_24CED9E10;
  v17[4] = self;
  os_unfair_lock_lock_with_options();
  sub_212E62658((uint64_t)v17);
  os_unfair_lock_unlock(p_storeAccountCacheLock);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = sub_212E62664;
  v16[3] = &unk_24CED9E10;
  v16[4] = self;
  os_unfair_lock_lock_with_options();
  sub_212E62664((uint64_t)v16);
  os_unfair_lock_unlock(&self->_appleAccountCacheLock);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v7[0] = v3;
  v7[1] = 3221225472;
  v8 = sub_212E62670;
  v9 = &unk_24CED9AC8;
  v10 = self;
  v11 = &v12;
  v5 = v7;
  os_unfair_lock_lock_with_options();
  v8((uint64_t)v5);
  os_unfair_lock_unlock(&self->_tccObserverLock);

  if (notify_is_valid_token(*((_DWORD *)v13 + 6)))
    notify_cancel(*((_DWORD *)v13 + 6));
  _Block_object_dispose(&v12, 8);
  v6.receiver = self;
  v6.super_class = (Class)BUAccountsProvider;
  -[BUAccountsProvider dealloc](&v6, sel_dealloc);
}

- (NSString)iCloudAccountName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_primaryAppleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_formattedUsername(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSNumber)lastUsedStoreAccountID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("BKPreviousUserId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (BOOL)hasRecommendationsEnabled
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char v12;

  v3 = objc_opt_class();
  objc_msgSend_activeStoreAccount(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_accountFlagValueForAccountFlag_(v6, v7, *MEMORY[0x24BE07C88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast(v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_BOOLValue(v9, v10, v11);

  return v12;
}

- (BOOL)detectedUserSwitchWithId:(id)a3 outSignedIn:(BOOL *)a4 outSignedOut:(BOOL *)a5 outAccountNumberChanged:(BOOL *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  int v22;
  char v23;

  v10 = a3;
  objc_msgSend_activeStoreAccount(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v18 = v16 == 0;
  else
    v18 = 0;
  v19 = v18;
  if (a5)
    *a5 = v19;
  if (v10)
    v20 = 1;
  else
    v20 = v16 == 0;
  v21 = !v20;
  if (a4)
    *a4 = v21;
  LOBYTE(v22) = 0;
  if (v10 && v16)
    v22 = objc_msgSend_isEqualToNumber_(v10, v17, (uint64_t)v16) ^ 1;
  if (a6)
    *a6 = v22;
  v23 = (v19 || v21) | v22;

  return v23;
}

- (void)updateLastUsedStoreAccountID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;

  objc_msgSend_activeStoreAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v3, v4, v5);
  v10 = (char *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v10)
    objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v10, CFSTR("BKPreviousUserId"));
  else
    objc_msgSend_removeObjectForKey_(v8, 0, (uint64_t)CFSTR("BKPreviousUserId"));

}

- (void)clearLastUsedStoreAccountID
{
  uint64_t v2;
  const char *v3;
  id v4;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v4, v3, (uint64_t)CFSTR("BKPreviousUserId"));

}

- (void)removeObserver:(id)a3 accountTypes:(unint64_t)a4
{
  char v4;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *notifyQueue;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  if ((v4 & 1) != 0 && !objc_msgSend__removeObserver_forAccountType_(self, v7, (uint64_t)v6, 1))
  {
    notifyQueue = self->_notifyQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_212E62BDC;
    v12[3] = &unk_24CEDAA18;
    objc_copyWeak(&v13, &location);
    dispatch_async(notifyQueue, v12);
    objc_destroyWeak(&v13);
    if ((v4 & 2) == 0)
      goto LABEL_7;
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_7;
  }
  if (!objc_msgSend__removeObserver_forAccountType_(self, v7, (uint64_t)v6, 2))
  {
    v8 = self->_notifyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E62C0C;
    block[3] = &unk_24CEDAA18;
    objc_copyWeak(&v11, &location);
    dispatch_async(v8, block);
    objc_destroyWeak(&v11);
  }
LABEL_7:
  objc_destroyWeak(&location);

}

- (void)observeTCCAccessChangeNotificationIfNeeded
{
  uint64_t v2;
  NSObject *v4;
  _QWORD v5[5];

  if (objc_msgSend_hasCloudKitEntitlement(self, a2, v2))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_212E62CE4;
    v5[3] = &unk_24CED9E10;
    v5[4] = self;
    os_unfair_lock_lock(&self->_tccObserverLock);
    sub_212E62CE4((uint64_t)v5);
    os_unfair_lock_unlock(&self->_tccObserverLock);
  }
  else
  {
    BookUtilityLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_212E6D5A4();

  }
}

- (void)ubiquityIdentityDidChange
{
  NSObject *notifyQueue;
  _QWORD block[5];

  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E62EC8;
  block[3] = &unk_24CED9E10;
  block[4] = self;
  dispatch_sync(notifyQueue, block);
}

- (void)nq_resetStoreAccountCachedValues
{
  os_unfair_lock_s *p_storeAccountCacheLock;
  _QWORD v3[5];

  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_212E62F44;
  v3[3] = &unk_24CED9E10;
  v3[4] = self;
  os_unfair_lock_lock_with_options();
  ((void (*)(_QWORD *))sub_212E62F44)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);
}

- (void)nq_resetAppleAccountCachedValues
{
  os_unfair_lock_s *p_appleAccountCacheLock;
  _QWORD v3[5];

  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_212E62FF4;
  v3[3] = &unk_24CED9E10;
  v3[4] = self;
  os_unfair_lock_lock_with_options();
  sub_212E62FF4((uint64_t)v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);
}

- (int64_t)_removeObserver:(id)a3 forAccountType:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_observersLock;
  id v8;
  _QWORD *v9;
  int64_t v10;
  _QWORD v12[2];
  void (*v13)(_QWORD *);
  void *v14;
  BUAccountsProvider *v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  p_observersLock = &self->_observersLock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = (void (*)(_QWORD *))sub_212E63170;
  v14 = &unk_24CEDAAB0;
  v15 = self;
  v18 = a4;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v9 = v12;
  os_unfair_lock_lock_with_options();
  v13(v9);
  os_unfair_lock_unlock(p_observersLock);

  v10 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_observersForAccountType:(unint64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  _QWORD *v4;
  id v5;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  BUAccountsProvider *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_212E62684;
  v17 = sub_212E62694;
  v18 = 0;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v8 = (void (*)(_QWORD *))sub_212E632EC;
  v9 = &unk_24CEDAAD8;
  v10 = self;
  v11 = &v13;
  v12 = a3;
  v4 = v7;
  os_unfair_lock_lock_with_options();
  v8(v4);
  os_unfair_lock_unlock(p_observersLock);

  v5 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (void)_unregisterNotificationForAccountType:(unint64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;

  if (a3 == 2)
  {
    objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, a2, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      sub_212E49A9C();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_name_object_(v16, v21, (uint64_t)v19, v20, 0);

      objc_msgSend_setAppleAccountDidChangeNotificationRegisteredToken_(self, v22, 0);
    }
  }
  else if (a3 == 1)
  {
    objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, a2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_name_object_(v7, v11, (uint64_t)v10, *MEMORY[0x24BDB3FB0], 0);

      objc_msgSend_setStoreAccountDidChangeNotificationRegisteredToken_(self, v12, 0);
    }
  }
}

- (void)_didReceiveNotification:(id)a3
{
  id v4;
  NSObject *notifyQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E635DC;
  block[3] = &unk_24CEDAA40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(notifyQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)nq_teardownNotifyBlockForAccountType:(unint64_t)a3
{
  const char *v5;
  const char *v6;
  NSMutableDictionary *notifyBlocks;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  NSMutableDictionary *v12;
  void *v13;
  const char *v14;
  NSMutableDictionary *accountIdentifiers;
  const char *v16;
  const char *v17;
  id v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  if (!objc_msgSend__observerCountForAccountType_(self, v5, a3))
  {
    notifyBlocks = self->_notifyBlocks;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(notifyBlocks, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v12 = self->_notifyBlocks;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v11, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v12, v14, (uint64_t)v13);

      accountIdentifiers = self->_accountIdentifiers;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v16, a3);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(accountIdentifiers, v17, (uint64_t)v18);

    }
  }
}

- (void)nq_updateAccountIdentifierAndNotifyObserversForAccountType:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3 == 2)
  {
    objc_msgSend_nq_resetAppleAccountCachedValues(self, a2, 2);
    MEMORY[0x24BEDD108](self, sel_nq_updateiCloudAccountIdentifierAndNotifyObservers, v4);
  }
  else if (a3 == 1)
  {
    objc_msgSend_nq_resetStoreAccountCachedValues(self, a2, 1);
    MEMORY[0x24BEDD108](self, sel_nq_updateiTunesAccountIdentifierAndNotifyObservers, v5);
  }
}

- (void)nq_updateiTunesAccountIdentifierAndNotifyObservers
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_notifyQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountIdentifiers(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_activeStoreAccount(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v17 || (objc_msgSend_isEqual_(v11, v18, (uint64_t)v17) & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    if (v11 && v17)
    {
      v20 = 102;
    }
    else if (v11 || !v17)
    {
      if (v17)
        v21 = 1;
      else
        v21 = v11 == 0;
      if (v21)
        v20 = 0;
      else
        v20 = 101;
    }
    else
    {
      v20 = 100;
    }
    objc_msgSend_accountIdentifiers(self, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, v6);

  }
  objc_msgSend__observersForAccountType_(self, v18, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, v35, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v24);
        objc_msgSend_account_didChangeWithReason_(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v27, 1, v20);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v31, v35, 16);
    }
    while (v28);
  }

}

- (void)nq_updateiCloudAccountIdentifierAndNotifyObservers
{
  uint64_t v2;
  NSObject *v4;
  OS_dispatch_queue *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  OS_dispatch_queue *v15;
  BUAccountsProvider *v16;
  id v17;
  id location;

  objc_msgSend_notifyQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = self->_notifyQueue;
  objc_initWeak(&location, self);
  if (objc_msgSend_hasCloudKitEntitlement(self, v6, v7)
    && objc_msgSend__observerCountForAccountType_(self, v8, 2) >= 1)
  {
    sub_212E56D84();
    v9 = (void *)objc_opt_class();
    objc_msgSend_defaultContainer(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_212E63CDC;
    v14[3] = &unk_24CEDABE8;
    v15 = v5;
    objc_copyWeak(&v17, &location);
    v16 = self;
    objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v12, v13, (uint64_t)v14);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);

}

- (unint64_t)_singleAccountTypeForNotification:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  int isEqualToString;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_name(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDB3FB0]))
  {
    objc_msgSend_userInfo(v3, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x24BDB40B8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && !objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x24BDB4180]))
    {
      v15 = 0;
    }
    else
    {
      BookUtilityLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v12;
        _os_log_impl(&dword_212E45000, v14, OS_LOG_TYPE_INFO, "ACAccountStoreDidChangeNotification account type identifier is '%@', treat it as if there was an iTunes account change", (uint8_t *)&v20, 0xCu);
      }

      v15 = 1;
    }

  }
  else
  {
    sub_212E49A9C();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v6, v17, (uint64_t)v16);

    if (isEqualToString)
      v15 = 2;
    else
      v15 = 0;
  }

  return v15;
}

- (void)setPrimaryAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, a3);
}

- (void)setActiveStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_activeStoreAccount, a3);
}

- (void)setLocalStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_localStoreAccount, a3);
}

- (int)tccObserverToken
{
  return self->_tccObserverToken;
}

- (void)setTccObserverToken:(int)a3
{
  self->_tccObserverToken = a3;
}

- (void)setCachedIsPrimaryAccountManagedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setCachedIsStoreAccountManagedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (NSMutableDictionary)notifyBlocks
{
  return self->_notifyBlocks;
}

- (void)setNotifyBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_notifyBlocks, a3);
}

- (NSMutableDictionary)observerHashTables
{
  return self->_observerHashTables;
}

- (void)setObserverHashTables:(id)a3
{
  objc_storeStrong((id *)&self->_observerHashTables, a3);
}

- (NSMutableDictionary)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (void)setAccountIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerHashTables, 0);
  objc_storeStrong((id *)&self->_notifyBlocks, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_cachedIsStoreAccountManagedAppleID, 0);
  objc_storeStrong((id *)&self->_cachedIsPrimaryAccountManagedAppleID, 0);
  objc_storeStrong((id *)&self->_storeAccountDidChangeNotificationRegisteredToken, 0);
  objc_storeStrong((id *)&self->_appleAccountDidChangeNotificationRegisteredToken, 0);
  objc_storeStrong((id *)&self->_localStoreAccount, 0);
  objc_storeStrong((id *)&self->_activeStoreAccount, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
}

@end
