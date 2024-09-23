@implementation CKDBackingPlatformAccount

- (int64_t)accountType
{
  return 0;
}

- (CKDBackingPlatformAccount)initWithAppleAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKDBackingPlatformAccount *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_ck_cloudKitAccount(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)CKDBackingPlatformAccount;
    self = -[CKDBackingAccount initWithAppleAccount:](&v11, sel_initWithAppleAccount_, v4);
    v8 = self;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = v4;
      v14 = 2112;
      v15 = v4;
      _os_log_fault_impl(&dword_1BE990000, v9, OS_LOG_TYPE_FAULT, "There's an iCloud account without a CloudKit Child Account. Ignoring it. %p: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)ckAccount
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ck_cloudKitAccount(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  CKDBackingPlatformAccount *v19;
  id v20;

  v4 = a3;
  objc_msgSend_sharedAccountStore(CKDAccountStore, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountStore(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_appleAccount(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEC375A8;
  v17[3] = &unk_1E7838288;
  v19 = self;
  v20 = v4;
  v18 = v10;
  v14 = v10;
  v15 = v4;
  objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(v14, v16, (uint64_t)v13, v17);

}

@end
