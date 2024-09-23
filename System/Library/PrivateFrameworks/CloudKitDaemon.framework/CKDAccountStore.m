@implementation CKDAccountStore

+ (CKDAccountStore)sharedAccountStore
{
  if (qword_1ED702B30 != -1)
    dispatch_once(&qword_1ED702B30, &unk_1E78367D8);
  return (CKDAccountStore *)(id)qword_1ED702B28;
}

- (ACAccount)primaryAccount
{
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  CKCurrentPersonaID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend_primaryAccountWithPersonaIdentifier_(self, v3, (uint64_t)v5);
  else
    objc_msgSend__primaryAccount(self, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v6;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (id)_primaryAccount
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;

  objc_msgSend_null(MEMORY[0x1E0C99E38], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1BE9BB128;
  v10[4] = sub_1BE9BAE48;
  v11 = 0;
  v8[5] = v10;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEBCAE60;
  v9[3] = &unk_1E7836800;
  v9[4] = self;
  v9[5] = v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE9C5620;
  v8[3] = &unk_1E7836828;
  v8[4] = self;
  objc_msgSend__accountForKey_matchBlock_createBlock_(self, v5, (uint64_t)v4, v9, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v10, 8);

  return v6;
}

- (id)_accountForKey:(id)a3 matchBlock:(id)a4 createBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  const char *v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  CKDAccountStore *v15;
  NSCache *cache;
  NSCache *v17;
  const char *v18;
  void *v19;
  NSCache *v20;
  NSCache *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  NSCache *v28;
  NSCache *v29;
  const char *v30;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  v14 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, CFSTR("CKDAccountStore.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, self, CFSTR("CKDAccountStore.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("createBlock"));

LABEL_3:
  v15 = self;
  objc_sync_enter(v15);
  if (v15)
    cache = v15->_cache;
  else
    cache = 0;
  v17 = cache;
  objc_msgSend_objectForKey_(v17, v18, (uint64_t)v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (v15)
      v20 = v15->_cache;
    else
      v20 = 0;
    v21 = v20;
    objc_msgSend_allObjects(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEBCB564;
    v36[3] = &unk_1E78368A0;
    v37 = v10;
    objc_msgSend_CKFirstObjectPassingTest_(v24, v25, (uint64_t)v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v9;
        v40 = 2112;
        v41 = v19;
        goto LABEL_23;
      }
    }
    else
    {
      v14[2](v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
LABEL_20:

        goto LABEL_21;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v9;
        v40 = 2112;
        v41 = v19;
LABEL_23:
        _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, v27, buf, 0x16u);
        if (!v15)
          goto LABEL_24;
        goto LABEL_18;
      }
    }
    if (!v15)
    {
LABEL_24:
      v28 = 0;
      goto LABEL_19;
    }
LABEL_18:
    v28 = v15->_cache;
LABEL_19:
    v29 = v28;
    objc_msgSend_setObject_forKey_(v29, v30, (uint64_t)v19, v9);

    goto LABEL_20;
  }
LABEL_21:
  objc_sync_exit(v15);

  return v19;
}

- (CKDAccountStore)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  CKDAccountStore *v18;

  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_processType(v4, v5, v6);

  if ((v7 | 2) == 2)
  {
    v9 = objc_alloc(MEMORY[0x1E0C8F2B8]);
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_initWithEffectiveBundleID_(v9, v16, (uint64_t)v15);

  }
  else
  {
    v17 = 0;
  }
  v18 = (CKDAccountStore *)objc_msgSend_initWithAccountStore_(self, v8, (uint64_t)v17);

  return v18;
}

- (CKDAccountStore)initWithAccountStore:(id)a3
{
  id v5;
  CKDAccountStore *v6;
  CKDAccountStore *v7;
  NSCache *v8;
  NSCache *cache;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDAccountStore;
  v6 = -[CKDAccountStore init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v7->_cache;
    v7->_cache = v8;

    objc_msgSend_setName_(v7->_cache, v10, (uint64_t)CFSTR("com.apple.cloudkit.accountStore"));
    objc_msgSend_setCountLimit_(v7->_cache, v11, 16);
    objc_msgSend_setMinimumObjectCount_(v7->_cache, v12, 1);
    objc_msgSend_setDelegate_(v7->_cache, v13, (uint64_t)v7);
  }

  return v7;
}

- (unint64_t)countLimit
{
  CKDAccountStore *v2;
  NSCache *cache;
  NSCache *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    cache = v2->_cache;
  else
    cache = 0;
  v4 = cache;
  v7 = objc_msgSend_countLimit(v4, v5, v6);

  objc_sync_exit(v2);
  return v7;
}

- (void)setCountLimit:(unint64_t)a3
{
  NSCache *cache;
  NSCache *v5;
  const char *v6;
  CKDAccountStore *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj)
    cache = obj->_cache;
  else
    cache = 0;
  v5 = cache;
  objc_msgSend_setCountLimit_(v5, v6, a3);

  objc_sync_exit(obj);
}

- (NSArray)cachedAccounts
{
  CKDAccountStore *v2;
  NSCache *cache;
  NSCache *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    cache = v2->_cache;
  else
    cache = 0;
  v4 = cache;
  objc_msgSend_allObjects(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (id)primaryAccountWithPersonaIdentifier:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDAccountStore.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persona"));

  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("persona:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBCB054;
  v18[3] = &unk_1E7836850;
  v19 = v7;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1BEBCB0C4;
  v16[3] = &unk_1E7836878;
  v16[4] = self;
  v17 = v19;
  v10 = v19;
  objc_msgSend__accountForKey_matchBlock_createBlock_(self, v11, (uint64_t)v8, v18, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accountWithIdentifier:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDAccountStore.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountID"));

  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("identifier:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBCB31C;
  v18[3] = &unk_1E7836850;
  v19 = v7;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1BEBCB35C;
  v16[3] = &unk_1E7836878;
  v16[4] = self;
  v17 = v19;
  v10 = v19;
  objc_msgSend__accountForKey_matchBlock_createBlock_(self, v11, (uint64_t)v8, v18, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accountWithAltDSID:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDAccountStore.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("altDSID"));

  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("alt-dsid:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBCB4E0;
  v18[3] = &unk_1E7836850;
  v19 = v7;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1BEBCB520;
  v16[3] = &unk_1E7836878;
  v16[4] = self;
  v17 = v19;
  v10 = v19;
  objc_msgSend__accountForKey_matchBlock_createBlock_(self, v11, (uint64_t)v8, v18, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)invalidateCache
{
  NSObject *v3;
  CKDAccountStore *v4;
  NSCache *cache;
  NSCache *v6;
  const char *v7;
  uint64_t v8;
  __int16 v9[8];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v9[0] = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Invalidating account cache", (uint8_t *)v9, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    cache = v4->_cache;
  else
    cache = 0;
  v6 = cache;
  objc_msgSend_removeAllObjects(v6, v7, v8);

  objc_sync_exit(v4);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend_identifier(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Account store evicting cached account: %@", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend_delegate(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_accountStore_willEvictCachedAccount_(v12, v13, (uint64_t)self, v5);

}

- (CKDAccountStoreDelegate)delegate
{
  return (CKDAccountStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
