@implementation CKDBackingMockAccount

- (int64_t)accountType
{
  return 3;
}

- (id)_initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  id v7;
  id v8;
  CKDBackingMockAccount *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDBackingMockAccount;
  v9 = -[CKDBackingAccount init](&v12, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testAccount, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  void *inited;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CKCurrentPersonaID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountOverrideInfo(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountPropertyOverrides(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E0C8EFC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v8) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      objc_msgSend_accountID(v6, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v8;
      v29 = 2112;
      v30 = v25;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1BE990000, v22, OS_LOG_TYPE_INFO, "Current persona identifier %@ does not match persona override on requested mock account %@: %@. Not returning an account", (uint8_t *)&v27, 0x20u);

    }
    inited = 0;
  }
  else
  {
    v18 = objc_alloc((Class)a1);
    inited = (void *)objc_msgSend__initMockAccountWithTestAccount_testDevice_(v18, v19, (uint64_t)v6, v7);
  }

  return inited;
}

- (void)updateAccountPropertiesAndSaveAccountInStore:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C94FF8];
  v6 = *MEMORY[0x1E0C94B20];
  v7 = a4;
  objc_msgSend_errorWithDomain_code_format_(v5, v8, v6, 1000, CFSTR("Mock account was asked to refresh account properties. This is unsupported"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v7, 0, v9);

}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0C94FF8];
  v8 = *MEMORY[0x1E0C94B20];
  v9 = a6;
  objc_msgSend_errorWithDomain_code_format_(v7, v10, v8, 1000, CFSTR("Mock account was asked to validate vetting token. This is unsupported"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v9, 0, v11);

}

- (id)dsid
{
  CKDBackingMockAccount *v2;
  const char *v3;
  uint64_t v4;
  NSString *dsid;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  NSString *v13;

  v2 = self;
  objc_sync_enter(v2);
  dsid = v2->_dsid;
  if (!dsid)
  {
    objc_msgSend_testAccount(v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_dsid(v6, v7, v8);

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%lld"), v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v2->_dsid;
    v2->_dsid = (NSString *)v11;

    dsid = v2->_dsid;
  }
  v13 = dsid;
  objc_sync_exit(v2);

  return v13;
}

- (id)identifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_testAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_globallyUniqueID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)primaryEmail
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_testAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_email(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serverPreferredPushEnvironment
{
  return (id)*MEMORY[0x1E0CFE130];
}

- (id)fullName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_testAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameComponents(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayedHostname
{
  return CFSTR("MockICloud.com");
}

- (id)sharingURLHostname
{
  return CFSTR("mock-icloud.com");
}

- (id)personaIdentifier
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
  void *v11;

  objc_msgSend_testAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountOverrideInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountPropertyOverrides(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E0C8EFC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  char hasValidCredentials;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;

  objc_msgSend_testDevice(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasValidCredentials = objc_msgSend_hasValidCredentials(v5, v6, v7);

  if ((hasValidCredentials & 1) == 0)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1002, CFSTR("TestDevice is withholding credentials for account"));
      goto LABEL_7;
    }
LABEL_8:
    v17 = 0;
    return v17;
  }
  objc_msgSend_testAccount(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_needsToVerifyTerms(v11, v12, v13);

  if (!v14)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_testAccount(self, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountOverrideInfo(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v26, (uint64_t)CFSTR("CKAuthToken-%@-%zu"), v25, qword_1EF577A30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
  if (!a3)
    goto LABEL_8;
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 1004, CFSTR("TestAccount is simulating Needs to Verify Terms"));
LABEL_7:
  v17 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  char hasValidCredentials;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  objc_msgSend_testDevice(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasValidCredentials = objc_msgSend_hasValidCredentials(v5, v6, v7);

  if ((hasValidCredentials & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_testAccount(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountOverrideInfo(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v19, (uint64_t)CFSTR("ICAuthToken-%@-%zu"), v18, qword_1EF577A30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1002, CFSTR("TestDevice is withholding credentials for account"));
    v20 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)isPrimaryEmailVerified
{
  return 1;
}

- (id)accountPropertiesForDataclass:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(&unk_1E78AFE38, a2, (uint64_t)a3);
}

- (BOOL)isDataclassEnabled:(id)a3
{
  return 1;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  return 1;
}

- (id)suspendedAccountIdentifier
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v8;
  const char *v9;

  if ((objc_msgSend_isAccountSuspended(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKDBackingMockAccount.m"), 174, CFSTR("Should only be called for suspended accounts."));

  }
  return (id)objc_msgSend_identifier(self, v5, v6);
}

- (BOOL)isAccountSuspended
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  objc_super v9;

  objc_msgSend_testAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_needsToVerifyTerms(v4, v5, v6);

  if ((v7 & 1) != 0)
    return 1;
  v9.receiver = self;
  v9.super_class = (Class)CKDBackingMockAccount;
  return -[CKDBackingAccount isAccountSuspended](&v9, sel_isAccountSuspended);
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, id);
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, BOOL, id))a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_INFO, "Mock: Re-fetching our auth token", buf, 2u);
  }
  if (objc_msgSend_isAccountSuspended(self, v9, v10))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1004, CFSTR("TestAccount is simulating Needs to Verify Terms"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v16 = objc_msgSend_length(0, v14, v15);
  }
  else
  {
    v21 = 0;
    objc_msgSend_iCloudAuthTokenWithError_(self, v11, (uint64_t)&v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (objc_msgSend_length(v13, v17, v18) && !v12)
      ++qword_1EF577A30;
    v16 = objc_msgSend_length(v13, v19, v20);
  }
  v7[2](v7, v16 != 0, v12);

}

- (CKDTestAccountProtocol)testAccount
{
  return self->_testAccount;
}

- (CKDTestDeviceProtocol)testDevice
{
  return self->_testDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDevice, 0);
  objc_storeStrong((id *)&self->_testAccount, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
