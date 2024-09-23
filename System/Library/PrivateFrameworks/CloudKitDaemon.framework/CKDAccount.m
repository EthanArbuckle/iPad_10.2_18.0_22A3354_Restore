@implementation CKDAccount

- (id)_lockedCloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  char canAuthWithCloudKit;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_authTokenQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend_backingAccount(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v15 = (void *)v12,
        canAuthWithCloudKit = objc_msgSend_canAuthWithCloudKit(v6, v13, v14),
        v15,
        (canAuthWithCloudKit & 1) == 0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v31 = "No backing account, so not returning an auth token.";
    goto LABEL_21;
  }
  if ((objc_msgSend_canAccessAccount(v6, v17, v18) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v31 = "No access to existing account, so not returning an auth token.";
LABEL_21:
    _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
LABEL_22:
    v24 = 0;
    v23 = 0;
    goto LABEL_23;
  }
  objc_msgSend_backingAccount(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend_cloudKitAuthTokenWithError_(v21, v22, (uint64_t)&v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v33;

  if (v23 && objc_msgSend_containsObject_((void *)qword_1ED7026C8, v25, (uint64_t)v23))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Found token: %@ in failedTokenCache.", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 2011, CFSTR("Got a CloudKit auth token that has already failed a previous auth attempt"));
    v28 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v28;
  }
  if (v24)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v24;
      _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "Error getting CloudKit auth token: %@", buf, 0xCu);
      if (!a4)
        goto LABEL_23;
      goto LABEL_16;
    }
    if (a4)
    {
LABEL_16:
      v24 = objc_retainAutorelease(v24);
      *a4 = v24;
    }
  }
LABEL_23:

  return v23;
}

- (id)_lockediCloudAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  char canAuthWithCloudKit;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  const char *v30;
  int isEqualToString;
  const char *v32;
  NSObject *v33;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_authTokenQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend_backingAccount(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v15 = (void *)v12,
        canAuthWithCloudKit = objc_msgSend_canAuthWithCloudKit(v6, v13, v14),
        v15,
        (canAuthWithCloudKit & 1) == 0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v28 = "No backing account, so not returning an auth token.";
    goto LABEL_10;
  }
  if ((objc_msgSend_canAccessAccount(v6, v17, v18) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v28 = "No access to existing account, so not returning an auth token.";
LABEL_10:
    _os_log_impl(&dword_1BE990000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
LABEL_11:
    v23 = 0;
    goto LABEL_12;
  }
  objc_msgSend_backingAccount(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_iCloudAuthTokenWithError_(v21, v22, (uint64_t)&v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v35;

  if (!v24)
  {
LABEL_12:
    objc_msgSend_lastFailediCloudAuthToken(self, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v23, v30, (uint64_t)v29);

    if (!isEqualToString)
    {
      v24 = 0;
      goto LABEL_20;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v32, *MEMORY[0x1E0C94B20], 2011, CFSTR("Got an iCloud auth token that has already failed a previous auth attempt"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_20;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v33 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v24;
    _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Error getting iCloud auth token: %@", buf, 0xCu);
    if (!a4)
      goto LABEL_20;
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_18:
    v24 = objc_retainAutorelease(v24);
    *a4 = v24;
  }
LABEL_20:

  return v23;
}

- (NSString)lastFailediCloudAuthToken
{
  return self->_lastFailediCloudAuthToken;
}

- (NSURL)privateMetricsServiceURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateMetricsServiceURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (NSString)accountID
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  if (objc_msgSend_accountType(self, a2, v2) == 1)
  {
    v6 = CFSTR("AnonymousAccount");
  }
  else
  {
    objc_msgSend_backingAccount(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v7, v8, v9);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (BOOL)isPrimaryAccount
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isPrimaryAccount;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isPrimaryAccount = objc_msgSend_isPrimaryAccount(v3, v4, v5);

  return isPrimaryAccount;
}

- (int64_t)accountType
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;

  objc_msgSend_backingAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  objc_msgSend_backingAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_accountType(v7, v8, v9);

  return v10;
}

- (CKDBackingAccount)backingAccount
{
  return self->_backingAccount;
}

- (BOOL)isCarryAccount
{
  return ((uint64_t (*)(CKDAccount *, char *))MEMORY[0x1E0DE7D20])(self, sel__userCloudDBURLisInCarryPartition);
}

- (id)iCloudAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1BE9BB008;
  v27 = sub_1BE9BADB8;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BB008;
  v21 = sub_1BE9BADB8;
  v22 = 0;
  objc_msgSend_authTokenQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9A2C24;
  v13[3] = &unk_1E7832BF0;
  v15 = &v23;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v16 = &v17;
  dispatch_sync(v9, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)cloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1BE9BB008;
  v27 = sub_1BE9BADB8;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BB008;
  v21 = sub_1BE9BADB8;
  v22 = 0;
  objc_msgSend_authTokenQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9A2868;
  v13[3] = &unk_1E7832BF0;
  v15 = &v23;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v16 = &v17;
  dispatch_sync(v9, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (OS_dispatch_queue)authTokenQueue
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class();
  return (OS_dispatch_queue *)MEMORY[0x1E0DE7D20](v2, sel_globalAuthTokenQueue, v3);
}

+ (id)globalAuthTokenQueue
{
  if (qword_1ED702810 != -1)
    dispatch_once(&qword_1ED702810, &unk_1E7832B50);
  return (id)qword_1ED702808;
}

- (BOOL)_userCloudDBURLisInCarryPartition
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  BOOL v9;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountPropertiesForDataclass_(v3, v4, *MEMORY[0x1E0C8F370]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = objc_msgSend_rangeOfString_options_(v7, v8, (uint64_t)CFSTR("p9(7|8)-ckdatabase"), 1025) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailediCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_authTokenCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
}

- (NSURL)privateCloudDBURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDBURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (id)initPrimaryAccount
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  _QWORD *inited;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  inited = (_QWORD *)objc_msgSend_initInternal(self, a2, v2);
  if (!inited)
  {
LABEL_7:
    v14 = inited;
    goto LABEL_13;
  }
  objc_msgSend_primaryAccount(CKDBackingAccount, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)inited[2];
  inited[2] = v6;

  v8 = (void *)*MEMORY[0x1E0C952F8];
  if (inited[2])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v8);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      objc_msgSend_accountID(inited, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_INFO, "Created primary backing account with ID \"%@\", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v8);
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17) = 0;
    _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Could not create primary backing account", (uint8_t *)&v17, 2u);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)initInternal
{
  CKDAccount *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *authTokenCallbackQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDAccount;
  v2 = -[CKDAccount init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cloudkit.account.authCallbackQueue", v3);
    authTokenCallbackQueue = v2->_authTokenCallbackQueue;
    v2->_authTokenCallbackQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)initAnonymousAccount
{
  uint64_t v2;
  void *inited;
  NSObject *v4;
  uint8_t v6[16];

  inited = (void *)objc_msgSend_initInternal(self, a2, v2);
  if (inited)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE990000, v4, OS_LOG_TYPE_INFO, "Created anonymous account", v6, 2u);
    }
  }
  return inited;
}

- (NSString)dsid
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)cloudKitAuthTokenWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  CKDAccount *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend_authTokenQueue(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE9C2AC4;
    block[3] = &unk_1E7830C88;
    objc_copyWeak(&v15, &location);
    v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (OS_dispatch_queue)authTokenCallbackQueue
{
  return self->_authTokenCallbackQueue;
}

- (CKDAccount)initWithAccountID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  _QWORD *inited;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  CKDAccount *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inited = (_QWORD *)objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    v17 = inited;
    goto LABEL_13;
  }
  objc_msgSend_accountWithIdentifier_(CKDBackingAccount, v7, (uint64_t)v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)inited[2];
  inited[2] = v9;

  v11 = (void *)*MEMORY[0x1E0C952F8];
  if (inited[2])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v12 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend_accountID(inited, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v16;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Created backing account with ID \"%@\", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v11);
  v18 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Could not create backing account with ID \"%@\", (uint8_t *)&v20, 0xCu);
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (CKDAccount)initWithAltDSID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  _QWORD *inited;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  CKDAccount *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inited = (_QWORD *)objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    v17 = inited;
    goto LABEL_13;
  }
  objc_msgSend_accountWithAltDSID_(CKDBackingAccount, v7, (uint64_t)v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)inited[2];
  inited[2] = v9;

  v11 = (void *)*MEMORY[0x1E0C952F8];
  if (inited[2])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v12 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend_altDSID(inited, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v16;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Created backing account with altDSID \"%@\", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v11);
  v18 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Could not create backing account with altDSID \"%@\", (uint8_t *)&v20, 0xCu);
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (id)initExplicitCredentialsAccountWithAccountOverrideInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _QWORD *inited;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  NSObject *v33;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inited = (_QWORD *)objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    v32 = inited;
    goto LABEL_13;
  }
  objc_msgSend_email(v4, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_password(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recoveryKey(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountPropertyOverrides(v4, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_overridesByDataclass(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_explicitCredentialsAccountWithEmail_password_recoveryKey_propertyOverrides_overridesByDataclass_(CKDBackingAccount, v23, (uint64_t)v10, v13, v16, v19, v22);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)inited[2];
  inited[2] = v24;

  v26 = (void *)*MEMORY[0x1E0C952F8];
  if (inited[2])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v26);
    v27 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      objc_msgSend_accountID(inited, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412546;
      v36 = v4;
      v37 = 2112;
      v38 = v31;
      _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, "Created fake backing account with account override info \"%@\" and ID \"%@\", (uint8_t *)&v35, 0x16u);

    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v26);
  v33 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v35 = 138412290;
    v36 = v4;
    _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Could not create fake backing account with account override info \"%@\", (uint8_t *)&v35, 0xCu);
  }
  v32 = 0;
LABEL_13:

  return v32;
}

- (id)initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  _QWORD *inited;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  inited = (_QWORD *)objc_msgSend_initInternal(self, v8, v9);
  if (!inited)
  {
LABEL_7:
    v16 = inited;
    goto LABEL_13;
  }
  objc_msgSend_mockAccountWithTestAccount_testDevice_(CKDBackingAccount, v10, (uint64_t)v6, v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)inited[2];
  inited[2] = v12;

  v14 = (void *)*MEMORY[0x1E0C952F8];
  if (inited[2])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v14);
    v15 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v19 = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Created mock backing account with test account \"%@\", testDevice \"%@\", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v14);
  v17 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v19 = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "Could not create mock backing account with test account \"%@\", test device \"%@\", (uint8_t *)&v19, 0x16u);
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (NSPersonNameComponents)fullName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fullName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersonNameComponents *)v6;
}

- (NSString)primaryEmail
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryEmail(v3, v4, v5);
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

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)formattedUsername
{
  uint64_t v2;
  const char *v3;
  void *v4;
  void *v5;

  objc_msgSend_username(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend_formattedUsernameFromUsername_(MEMORY[0x1E0D002B8], v3, (uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
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

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)displayedHostname
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayedHostname(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)serverPreferredPushEnvironment
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int isAppleInternalInstall;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_backingAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverPreferredPushEnvironment(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v7, v8, v9))
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v12, v13, v14);

    if (isAppleInternalInstall && (objc_msgSend_haveWarnedAboutServerPreferredPushEnvironment(self, v16, v17) & 1) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v18 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v20 = v18;
        objc_msgSend_backingAccount(self, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Warn: Couldn't determine server preferred push environment from backing account %@", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend_setHaveWarnedAboutServerPreferredPushEnvironment_(self, v19, 1);
    }
    v24 = (id)*MEMORY[0x1E0CFE130];

    v7 = v24;
  }
  return (NSString *)v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingAccount(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryEmail(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@ %p> (\"%@\" Account ID: %@)"), v5, self, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isPrimaryEmailVerified
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isPrimaryEmailVerified;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isPrimaryEmailVerified = objc_msgSend_isPrimaryEmailVerified(v3, v4, v5);

  return isPrimaryEmailVerified;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char isDataclassEnabled;

  v4 = a3;
  objc_msgSend_backingAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isDataclassEnabled = objc_msgSend_isDataclassEnabled_(v7, v8, (uint64_t)v4);

  return isDataclassEnabled;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isDataclassEnabledForCellular;
  NSObject *v13;
  uint8_t v15[16];

  v4 = a3;
  objc_msgSend_backingAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_backingAccount(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isDataclassEnabledForCellular = objc_msgSend_isDataclassEnabledForCellular_(v10, v11, (uint64_t)v4);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "No backing account, so allowing cellular access from account perspective.", v15, 2u);
    }
    isDataclassEnabledForCellular = 1;
  }

  return isDataclassEnabledForCellular;
}

- (NSString)altDSID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_altDSID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)updateAccountPropertiesAndSaveAccountWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend_backingAccount(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_backingAccount(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateAccountPropertiesAndSaveAccount_(v9, v10, (uint64_t)v12);
LABEL_5:

    v11 = v12;
    goto LABEL_6;
  }
  v11 = v12;
  if (v12)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 1002, CFSTR("Can't update account properties because we have no account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_lockedRenewTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 tokenFetchBlock:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  void (**v13)(id, id *);
  id v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void **v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int isAccountSuspended;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  int canSuspendedAccountRenewCredentials;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  _QWORD *v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const char *v87;
  uint64_t v88;
  NSObject *v89;
  dispatch_semaphore_t v90;
  id v91;
  _QWORD v92[4];
  id v93;
  uint64_t *v94;
  __int128 *v95;
  _QWORD v96[4];
  NSObject *v97;
  uint64_t *v98;
  __int128 *p_buf;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  _QWORD v104[4];
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  _QWORD block[4];
  id v111;
  id v112;
  uint8_t v113[4];
  uint64_t v114;
  __int16 v115;
  const __CFString *v116;
  __int16 v117;
  const __CFString *v118;
  __int16 v119;
  const __CFString *v120;
  __int128 buf;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;

  v10 = a4;
  v126 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v12 = a5;
  v13 = (void (**)(id, id *))a6;
  v14 = a7;
  objc_msgSend_authTokenQueue(self, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v112 = 0;
  v13[2](v13, &v112);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v112;
  if (!v21 && v18 && !v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v25 = v22;
      objc_msgSend_accountID(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "The CloudKit auth token for account %@ has changed since the last one we attempted. Trying again with the new token.", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend_authTokenCallbackQueue(self, v23, v24);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEABD118;
    block[3] = &unk_1E782EFD8;
    v111 = v14;
    dispatch_async(v29, block);

    v21 = 0;
    v30 = &v111;
    goto LABEL_42;
  }
  objc_msgSend_backingAccount(self, v19, v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isAccountSuspended = objc_msgSend_isAccountSuspended(v31, v32, v33);

  if (isAccountSuspended)
  {
    objc_msgSend_backingAccount(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    canSuspendedAccountRenewCredentials = objc_msgSend_canSuspendedAccountRenewCredentials(v37, v38, v39);

    if (((canSuspendedAccountRenewCredentials | v10) & 1) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v71 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BE990000, v71, OS_LOG_TYPE_INFO, "Account is suspended and we did attempt a renewal recently. Rate limiting this renewal request", (uint8_t *)&buf, 2u);
      }
      if (!v21)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v72, *MEMORY[0x1E0C94B20], 1004, CFSTR("Can't renew our auth token since account is suspended and renewal is rate limited"));
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v14)
      {
        objc_msgSend_authTokenCallbackQueue(self, v72, v73);
        v74 = objc_claimAutoreleasedReturnValue();
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = sub_1BEABD134;
        v107[3] = &unk_1E782EC68;
        v75 = v107;
        v109 = v14;
        v21 = v21;
        v108 = v21;
        dispatch_async(v74, v107);

LABEL_41:
        v30 = (void **)(v75 + 5);
LABEL_42:
        v50 = *v30;
LABEL_56:

        goto LABEL_57;
      }
      goto LABEL_57;
    }
    if ((objc_msgSend_canAccessAccount(v12, v41, v42) & 1) != 0)
    {
      objc_msgSend_backingAccount(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_noteSuspendedAccountRenewalDate(v45, v46, v47);

LABEL_14:
      v48 = (void *)objc_opt_new();
      v50 = v48;
      if (v91)
        objc_msgSend_setObject_forKeyedSubscript_(v48, v49, (uint64_t)v91, *MEMORY[0x1E0C8F310]);
      if (v10)
        objc_msgSend_setObject_forKeyedSubscript_(v50, v49, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F330]);
      v90 = dispatch_semaphore_create(0);
      v100 = 0;
      v101 = &v100;
      v102 = 0x2020000000;
      v103 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v122 = 0x3032000000;
      v123 = sub_1BE9BB008;
      v124 = sub_1BE9BADB8;
      v125 = 0;
      objc_msgSend_backingAccount(self, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend_backingAccount(self, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = MEMORY[0x1E0C809B0];
        v96[1] = 3221225472;
        v96[2] = sub_1BEABD15C;
        v96[3] = &unk_1E7832B78;
        v98 = &v100;
        p_buf = &buf;
        v57 = v90;
        v97 = v57;
        objc_msgSend_renewAuthTokenWithOptions_completionHandler_(v56, v58, (uint64_t)v50, v96);

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v59 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_accountID(self, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v113 = 138412290;
          v114 = (uint64_t)v62;
          _os_log_impl(&dword_1BE990000, v59, OS_LOG_TYPE_INFO, "Waiting on a credential renewal for account %@", v113, 0xCu);

        }
        dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
        v63 = v97;
      }
      else
      {
        *((_BYTE *)v101 + 24) = 0;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v54, *MEMORY[0x1E0C94B20], 1002, CFSTR("Can't renew credentials because we don't have an account"));
        v77 = objc_claimAutoreleasedReturnValue();
        v63 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v77;
      }

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v78 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_accountID(self, v79, v80);
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = (void *)v81;
        v83 = &stru_1E7838F48;
        if (*((_BYTE *)v101 + 24))
          v84 = &stru_1E7838F48;
        else
          v84 = CFSTR("un");
        v85 = *(const __CFString **)(*((_QWORD *)&buf + 1) + 40);
        v86 = CFSTR(" Error was ");
        if (!v85)
          v86 = &stru_1E7838F48;
        *(_DWORD *)v113 = 138413058;
        if (v85)
          v83 = v85;
        v114 = v81;
        v115 = 2114;
        v116 = v84;
        v117 = 2114;
        v118 = v86;
        v119 = 2112;
        v120 = v83;
        _os_log_impl(&dword_1BE990000, v78, OS_LOG_TYPE_INFO, "Credential renewal for account %@ finished %{public}@successfully.%{public}@%@", v113, 0x2Au);

      }
      objc_msgSend_authTokenCallbackQueue(self, v87, v88);
      v89 = objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = sub_1BEABD1B8;
      v92[3] = &unk_1E78314A0;
      v93 = v14;
      v94 = &v100;
      v95 = &buf;
      dispatch_async(v89, v92);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v100, 8);

      goto LABEL_56;
    }
  }
  else if ((objc_msgSend_canAccessAccount(v12, v35, v36) & 1) != 0)
  {
    goto LABEL_14;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v64 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v67 = v64;
    objc_msgSend_accountID(self, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v70;
    _os_log_impl(&dword_1BE990000, v67, OS_LOG_TYPE_INFO, "Can't access the account with ID %@, so failing this auth token renew request", (uint8_t *)&buf, 0xCu);

  }
  if (v21)
  {
    if (!v14)
      goto LABEL_57;
    goto LABEL_40;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v65, *MEMORY[0x1E0C94B20], 2011, CFSTR("Can't renew our auth token since we don't have access to the account"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
LABEL_40:
    objc_msgSend_authTokenCallbackQueue(self, v65, v66);
    v76 = objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = sub_1BEABD148;
    v104[3] = &unk_1E782EC68;
    v75 = v104;
    v106 = v14;
    v21 = v21;
    v105 = v21;
    dispatch_async(v76, v104);

    goto LABEL_41;
  }
LABEL_57:

}

- (void)renewCloudKitAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  objc_msgSend_authTokenQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEABD33C;
  block[3] = &unk_1E7832BC8;
  objc_copyWeak(&v28, &location);
  v29 = a4;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v18, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)renewiCloudAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  objc_msgSend_authTokenQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEABD7E8;
  block[3] = &unk_1E7832BC8;
  objc_copyWeak(&v28, &location);
  v29 = a4;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v18, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)iCloudAuthTokenWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  CKDAccount *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend_authTokenQueue(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEABDAD0;
    block[3] = &unk_1E7830C88;
    objc_copyWeak(&v15, &location);
    v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (NSURL)privateShareServiceURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateShareServiceURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (NSURL)privateDeviceServiceURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateDeviceServiceURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (NSURL)privateCodeServiceURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCodeServiceURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 container:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a7;
  if (objc_msgSend_canAccessAccount(a6, v15, v16))
  {
    objc_msgSend_backingAccount(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateVettingToken_vettingEmail_vettingPhone_completionHandler_(v19, v20, (uint64_t)v21, v12, v13, v14);
LABEL_5:

    goto LABEL_6;
  }
  if (v14)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 2011, CFSTR("Can't reauth since we don't have access to the account"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v19);
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)sharingURLHostname
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingAccount(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharingURLHostname(v3, v4, v5);
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
  int64_t KnownDeviceCount;
  NSObject *v12;
  uint8_t v13[16];

  objc_msgSend_backingAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_backingAccount(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v7, v8, v9);

    return KnownDeviceCount;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "No backing account, assuming single device", v13, 2u);
    }
    return 1;
  }
}

- (BOOL)isValidTestAccount
{
  uint64_t v2;
  void *v4;
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
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int isAccountSuspended;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  char v40;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  int v53;
  CKDAccount *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend_backingAccount(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_iCloudAuthTokenWithError_(v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_backingAccount(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudKitAuthTokenWithError_(v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v31 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v53 = 138412290;
        v54 = self;
        _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it has no iCloud auth token", (uint8_t *)&v53, 0xCu);
      }
      v30 = 0;
      goto LABEL_31;
    }
    objc_msgSend_backingAccount(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountPropertiesForDataclass_(v14, v15, (uint64_t)CFSTR("com.apple.Dataclass.Account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("iCloudEnv"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((!v18 || objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("PROD")))
      && (objc_msgSend_isCarryAccount(self, v19, v20) & 1) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v32 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v42 = v32;
        objc_msgSend_backingAccount(self, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_accountPropertiesForDataclass_(v45, v46, *MEMORY[0x1E0C8F370]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_backingAccount(self, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_accountPropertiesForDataclass_(v50, v51, (uint64_t)CFSTR("com.apple.Dataclass.Account"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138412802;
        v54 = self;
        v55 = 2112;
        v56 = v47;
        v57 = 2112;
        v58 = v52;
        _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it is a non-carry prod account according to these property sets: %@ %@", (uint8_t *)&v53, 0x20u);

      }
      goto LABEL_26;
    }
    objc_msgSend_backingAccount(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isAccountSuspended = objc_msgSend_isAccountSuspended(v21, v22, v23);

    if (isAccountSuspended)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v27 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      v53 = 138412290;
      v54 = self;
      v28 = "Account %@ is not valid because it's marked as suspended";
    }
    else
    {
      objc_msgSend_backingAccount(self, v25, v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0
        || (objc_msgSend_backingAccount(self, v36, v37),
            v38 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend_credentialsAreValidForAccount_(CKDPCSIdentityManager, v39, (uint64_t)v38),
            v38,
            (v40 & 1) != 0))
      {
        v30 = 1;
        goto LABEL_30;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v27 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        v30 = 0;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      v53 = 138412290;
      v54 = self;
      v28 = "Account %@ is not valid because it can't get Stingray identities via PCS";
    }
    _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v53, 0xCu);
    goto LABEL_26;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v29 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v53 = 138412290;
    v54 = self;
    _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it has no iCloud auth token", (uint8_t *)&v53, 0xCu);
  }
  v30 = 0;
LABEL_32:

  return v30;
}

- (BOOL)haveWarnedAboutServerPreferredPushEnvironment
{
  return self->_haveWarnedAboutServerPreferredPushEnvironment;
}

- (void)setHaveWarnedAboutServerPreferredPushEnvironment:(BOOL)a3
{
  self->_haveWarnedAboutServerPreferredPushEnvironment = a3;
}

- (void)setAuthTokenCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_authTokenCallbackQueue, a3);
}

- (void)setLastFailediCloudAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
