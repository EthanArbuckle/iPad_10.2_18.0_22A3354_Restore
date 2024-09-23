@implementation CKDBackingAccount

+ (id)primaryAccount
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDBackingPlatformAccount *v7;
  const char *v8;
  void *v9;

  objc_msgSend_sharedAccountStore(CKDAccountStore, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryAccount(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [CKDBackingPlatformAccount alloc];
    v9 = (void *)objc_msgSend_initWithAppleAccount_(v7, v8, (uint64_t)v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)urlForDataclass:(id)a3 preferringGateway:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_accountPropertiesForDataclass_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v4)
    objc_msgSend_CKFirstUrlForKeys_(v8, v9, (uint64_t)&unk_1E78AF480);
  else
    objc_msgSend_CKFirstUrlForKeys_(v8, v9, (uint64_t)&unk_1E78AF498);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Couldn't create url from dataclass %{public}@ with properties %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }

  return v11;
}

- (id)urlForDataclass:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_preferringGateway_, a3);
}

- (NSURL)privateMetricsServiceURL
{
  return (NSURL *)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_, *MEMORY[0x1E0C8EE48]);
}

- (NSURL)privateCloudDBURL
{
  return (NSURL *)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_, *MEMORY[0x1E0C8EE38]);
}

- (BOOL)isPrimaryAccount
{
  uint64_t v2;
  void *v3;
  const char *v4;
  char isAccountClass;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isAccountClass = objc_msgSend_aa_isAccountClass_(v3, v4, *MEMORY[0x1E0CFAAE8]);

  return isAccountClass;
}

- (BOOL)isAccountSuspended
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char isCurrentAppleAccountSuspended;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isCurrentAppleAccountSuspended = objc_msgSend_isCurrentAppleAccountSuspended(v4, v5, v6);

  objc_msgSend_appleAccount(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = isCurrentAppleAccountSuspended | objc_msgSend_aa_isSuspended(v10, v11, v12);

  return (char)v4;
}

- (CKDBackingAccount)initWithAppleAccount:(id)a3
{
  id v5;
  uint64_t v6;
  CKDBackingAccount *v7;
  CKDBackingAccount *v8;
  NSObject *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    if (*MEMORY[0x1E0C95300] != -1)
      goto LABEL_9;
    while (1)
    {
      v10 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "CKDBackingAccount must be subclassed", buf, 2u);
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("CKDBackingAccount must be subclassed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v12, v13, v14);
      _os_crash();
      __break(1u);
LABEL_9:
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CKDBackingAccount;
  v7 = -[CKDBackingAccount init](&v15, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_appleAccount, a3);

  return v8;
}

- (NSString)identifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ck_identifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)dsid
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_personID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_ckAccount(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend__accountCredentialForAccount_withError_(self, v6, (uint64_t)v5, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v7)
  {
    objc_msgSend_token(v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1002, CFSTR("Couldn't get cloudKitAuthToken from credential"));
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v10)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v10);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Error getting cloudKitAuthToken: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (id)accountPropertiesForDataclass:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_appleAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertiesForDataclass_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accountCredentialForAccount:(id)a3 withError:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v28;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 1002, CFSTR("Can't return account credentials for nil account"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend_isAccountSuspended(self, v6, v7))
  {
    v11 = (void *)MEMORY[0x1E0C94FF8];
    v12 = *MEMORY[0x1E0C94B20];
    objc_msgSend_appleAccount(self, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ck_identifier(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v11, v17, v12, 1004, CFSTR("Can't return account credentials for account %@ because the account needs to verify new terms or is in suspended mode."), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v28 = 0;
  objc_msgSend_credentialWithError_(v8, v9, (uint64_t)&v28);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (unint64_t)v28;
  if (!(v19 | v20))
  {
    v23 = (void *)MEMORY[0x1E0C94FF8];
    v24 = *MEMORY[0x1E0C94B20];
    objc_msgSend_ck_identifier(v8, v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v23, v26, v24, 1002, CFSTR("Didn't get account credentials for account %@ with no error"), v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v19 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v18 = (void *)v20;
  if (!a4)
    goto LABEL_10;
LABEL_8:
  if (v18)
    *a4 = objc_retainAutorelease(v18);
LABEL_10:

  return (id)v19;
}

+ (CKDBackingAccount)accountWithIdentifier:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  CKDBackingPlatformAccount *v9;
  const char *v10;
  void *v11;

  v3 = a3;
  objc_msgSend_sharedAccountStore(CKDAccountStore, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountWithIdentifier_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [CKDBackingPlatformAccount alloc];
    v11 = (void *)objc_msgSend_initWithAppleAccount_(v9, v10, (uint64_t)v8);
  }
  else
  {
    v11 = 0;
  }

  return (CKDBackingAccount *)v11;
}

+ (CKDBackingAccount)accountWithAltDSID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  CKDBackingPlatformAccount *v9;
  const char *v10;
  void *v11;

  v3 = a3;
  objc_msgSend_sharedAccountStore(CKDAccountStore, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountWithAltDSID_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [CKDBackingPlatformAccount alloc];
    v11 = (void *)objc_msgSend_initWithAppleAccount_(v9, v10, (uint64_t)v8);
  }
  else
  {
    v11 = 0;
  }

  return (CKDBackingAccount *)v11;
}

+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7
{
  return (id)objc_msgSend_explicitCredentialsAccountWithEmail_password_recoveryKey_propertyOverrides_overridesByDataclass_(CKDBackingExplicitCredentialsAccount, a2, (uint64_t)a3, a4, a5, a6, a7);
}

+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  return (id)objc_msgSend_mockAccountWithTestAccount_testDevice_(CKDBackingMockAccount, a2, (uint64_t)a3, a4);
}

+ (id)credentialRenewalDatesBySuspendedAccountID
{
  if (qword_1ED702C00 != -1)
    dispatch_once(&qword_1ED702C00, &unk_1E7837B50);
  return (id)qword_1ED702BF8;
}

- (CKDBackingAccount)init
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[16];

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    if (*MEMORY[0x1E0C95300] != -1)
      goto LABEL_7;
    while (1)
    {
      v5 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v5, OS_LOG_TYPE_ERROR, "CKDBackingAccount must be subclassed", buf, 2u);
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("CKDBackingAccount must be subclassed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v7, v8, v9);
      _os_crash();
      __break(1u);
LABEL_7:
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CKDBackingAccount;
  return -[CKDBackingAccount init](&v10, sel_init);
}

- (ACAccount)ckAccount
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0C94D90]);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v7 = (id)objc_msgSend_initWithCode_format_(v3, v6, 12, CFSTR("%@ must be subclassed in class %@"), v4, v5);

  objc_exception_throw(v7);
}

- (NSString)primaryEmail
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_primaryEmail(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)username
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)altDSID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_altDSID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSPersonNameComponents)fullName
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend_appleAccount(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_firstName(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGivenName_(v3, v10, (uint64_t)v9);

  objc_msgSend_appleAccount(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_lastName(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFamilyName_(v3, v17, (uint64_t)v16);

  return (NSPersonNameComponents *)v3;
}

- (NSString)displayedHostname
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v3 = (id)*MEMORY[0x1E0C95370];
  objc_msgSend_appleAccount(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_regionInfo(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayedHostname(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v15, v16, v17) && (objc_msgSend_isEqualToString_(v15, v18, *MEMORY[0x1E0C95368]) & 1) == 0)
  {
    v19 = v15;

    v3 = v19;
  }

  return (NSString *)v3;
}

- (BOOL)isPrimaryEmailVerified
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isPrimaryEmailVerified;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isPrimaryEmailVerified = objc_msgSend_aa_isPrimaryEmailVerified(v3, v4, v5);

  return isPrimaryEmailVerified;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char isEnabledForDataclass;

  v4 = a3;
  objc_msgSend_appleAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEnabledForDataclass = objc_msgSend_isEnabledForDataclass_(v7, v8, (uint64_t)v4);

  return isEnabledForDataclass;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char v9;

  v4 = a3;
  objc_msgSend_appleAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_aa_useCellularForDataclass_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend_appleAccount(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_authToken(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 1002, CFSTR("Couldn't get iCloudAuthToken from credential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "Error getting iCloudAuthToken: %@", (uint8_t *)&v12, 0xCu);
      if (!a3)
        goto LABEL_7;
    }
    else if (!a3)
    {
LABEL_7:

      return v7;
    }
    *a3 = objc_retainAutorelease(v9);
    goto LABEL_7;
  }
  return v7;
}

- (NSString)suspendedAccountIdentifier
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  const char *v13;

  if ((objc_msgSend_isAccountSuspended(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDBackingAccount.m"), 263, CFSTR("Should only be called for suspended accounts."));

  }
  objc_msgSend_appleAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ck_identifier(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)canSuspendedAccountRenewCredentials
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  _BOOL4 v17;
  NSObject *v18;
  const __CFString *v19;
  int v21;
  double v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  objc_msgSend_credentialRenewalDatesBySuspendedAccountID(v3, v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  objc_msgSend_suspendedAccountIdentifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v11, v12, v13);
  v15 = fabs(v14);
  v17 = v15 >= 28800.0 || v11 == 0;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v19 = CFSTR(" not");
    v21 = 134218754;
    v22 = v15;
    if (v17)
      v19 = &stru_1E7838F48;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "It has been %f s since suspended account %@ last renewal date %@. Can%@ renew credentials", (uint8_t *)&v21, 0x2Au);
  }

  objc_sync_exit(v6);
  return v17;
}

- (void)noteSuspendedAccountRenewalDate
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id obj;

  if (objc_msgSend_isAccountSuspended(self, a2, v2))
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend_credentialRenewalDatesBySuspendedAccountID(v4, v5, v6);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    objc_msgSend_suspendedAccountIdentifier(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(obj, v13, (uint64_t)v12, v9);

    objc_sync_exit(obj);
  }
}

- (NSString)serverPreferredPushEnvironment
{
  void *v2;
  const char *v3;
  void *v4;

  objc_msgSend_accountPropertiesForDataclass_(self, a2, *MEMORY[0x1E0C8EE38]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v3, (uint64_t)CFSTR("apsEnv"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)accountType
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDBackingAccount.m"), 300, CFSTR("Expected to be overridden in subclass"));

  return 0;
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend_CKDeepCopy(a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedAccountStore(CKDAccountStore, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountStore(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_appleAccount(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)*MEMORY[0x1E0C952F8];
  v20 = *MEMORY[0x1E0C95300];
  if (v18 && v15)
  {
    if (v20 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v19);
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Re-fetching our auth token", buf, 2u);
    }
    objc_msgSend_appleAccount(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1BEC15A54;
    v29[3] = &unk_1E7830090;
    v30 = v6;
    objc_msgSend_renewCredentialsForAccount_options_completion_(v15, v25, (uint64_t)v24, v9, v29);

    v26 = v30;
  }
  else
  {
    if (v20 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v19);
    v27 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v27, OS_LOG_TYPE_INFO, "Can't renew auth token because we don't have an account or an account store", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 1002, CFSTR("No account exists"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v26);
  }

}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C94D90]);
  v5 = objc_opt_class();
  v7 = (id)objc_msgSend_initWithCode_format_(v4, v6, 12, CFSTR("This method must be subclassed in class %@"), v5);
  objc_exception_throw(v7);
}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  const char *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;

  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0D00128];
  v13 = a5;
  v14 = a4;
  v15 = objc_alloc_init(v12);
  if (v14)
    v16 = v14;
  else
    v16 = v13;
  v17 = v16;
  CKLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v15, v19, (uint64_t)v18);

  CKLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setReason_(v15, v21, (uint64_t)v20, v17);
  objc_msgSend_username(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsername_(v15, v25, (uint64_t)v24);

  objc_msgSend_setIsUsernameEditable_(v15, v26, 0);
  objc_msgSend_setShouldUpdatePersistentServiceTokens_(v15, v27, 1);
  objc_msgSend_setShouldSkipSettingsLaunchAlert_(v15, v28, 1);
  objc_msgSend_setHelpBook_(v15, v29, (uint64_t)CFSTR("com.apple.machelp"));
  objc_msgSend_setHelpAnchor_(v15, v30, (uint64_t)CFSTR("mchl267b6234"));
  objc_msgSend__setOverridesOnVettingContext_(self, v31, (uint64_t)v15);
  v32 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1BEC15E28;
  v37[3] = &unk_1E7837BA0;
  v38 = v32;
  v39 = v10;
  v40 = v11;
  v33 = v11;
  v34 = v10;
  v35 = v32;
  objc_msgSend_authenticateWithContext_completion_(v35, v36, (uint64_t)v15, v37);

}

- (NSURL)privateShareServiceURL
{
  return (NSURL *)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_, *MEMORY[0x1E0C8EE50]);
}

- (NSURL)privateDeviceServiceURL
{
  return (NSURL *)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_, *MEMORY[0x1E0C8EE40]);
}

- (NSURL)privateCodeServiceURL
{
  return (NSURL *)MEMORY[0x1E0DE7D20](self, sel_privateCodeServiceURLPreferringGateway_, 1);
}

- (id)privateCodeServiceURLPreferringGateway:(BOOL)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_urlForDataclass_preferringGateway_, *MEMORY[0x1E0C8EE30]);
}

- (NSString)sharingURLHostname
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_accountPropertiesForDataclass_(self, a2, *MEMORY[0x1E0C8EE50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("cloudSharingURLHostname"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v5, v6, v7))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v3;
      _os_log_error_impl(&dword_1BE990000, v8, OS_LOG_TYPE_ERROR, "Couldn't get sharing URL host from properties %{public}@. Falling back to legacy hostname.", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend_displayedHostname(self, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }

  return (NSString *)v5;
}

- (NSString)personaIdentifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appleAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)lastKnownDeviceCount
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _DWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceCountOverride(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = objc_msgSend_integerValue(v7, v8, v9);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v24[0] = 67109120;
      v24[1] = v10;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Using device count override (%d)", (uint8_t *)v24, 8u);
    }
  }
  else
  {
    objc_msgSend_appleAccount(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ck_cloudKitAccount(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    if (v15)
    {
      objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)CFSTR("deviceCount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_integerValue(v18, v19, v20);

      if (v21 == 1)
        v10 = 1;
      else
        v10 = 2 * (v21 != 0);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24[0]) = 0;
        _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "No account, returning unknown last known device count", (uint8_t *)v24, 2u);
      }
      v10 = 0;
    }

  }
  return v10;
}

+ (void)registerDeviceCountRefreshActivity
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isSystemInstalledBinary;
  id v12;
  _QWORD block[5];

  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_processType(v12, v4, v5) == 2)
  {

  }
  else
  {
    objc_msgSend_currentProcess(CKDDaemonProcess, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v8, v9, v10);

    if (isSystemInstalledBinary)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEC16460;
      block[3] = &unk_1E7830348;
      block[4] = a1;
      if (qword_1ED7026C0 != -1)
        dispatch_once(&qword_1ED7026C0, block);
    }
  }
}

+ (id)deviceCountQueue
{
  if (qword_1ED702C10 != -1)
    dispatch_once(&qword_1ED702C10, &unk_1E7837BE8);
  return (id)qword_1ED702C08;
}

+ (void)deviceCountForAccount:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  dispatch_block_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    v11 = CKCurrentThreadQualityOfService();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEC16BB4;
    block[3] = &unk_1E7837C60;
    v21 = a4;
    v17 = v8;
    v19 = v11;
    v18 = v10;
    v20 = a1;
    v12 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    objc_msgSend_deviceCountQueue(a1, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v15, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
  }

}

+ (void)fetchDeviceCountForAccount:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Fetching device list for account: %@", buf, 0xCu);
  }
  v8 = objc_alloc(MEMORY[0x1E0CFAC40]);
  v10 = (void *)objc_msgSend_initWithAccount_(v8, v9, (uint64_t)v5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC17420;
  v13[3] = &unk_1E7837C88;
  v14 = v6;
  v11 = v6;
  objc_msgSend_performRequestWithHandler_(v10, v12, (uint64_t)v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
