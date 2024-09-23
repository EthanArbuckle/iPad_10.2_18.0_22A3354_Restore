@implementation CKDDiscoverUserIdentitiesOperation

- (CKDDiscoverUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDDiscoverUserIdentitiesOperation *v9;
  uint64_t v10;
  NSArray *userIdentityLookupInfos;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDiscoverUserIdentitiesOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_userIdentityLookupInfos(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    userIdentityLookupInfos = v9->_userIdentityLookupInfos;
    v9->_userIdentityLookupInfos = (NSArray *)v10;

  }
  return v9;
}

+ (BOOL)adopterProvidedLookupInfos
{
  return 1;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/discover-user-identities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 401;
}

- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  _QWORD block[5];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v9;
    v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "For lookup info %@, discovered identity %@", buf, 0x16u);
  }
  if (objc_msgSend_code(v10, v12, v13) == 1)
  {
    if (v8)
    {
      objc_msgSend_callbackQueue(self, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEA8B7B4;
      block[3] = &unk_1E782E418;
      block[4] = self;
      v33 = v9;
      v34 = v8;
      dispatch_async(v16, block);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C94FF8];
    v18 = *MEMORY[0x1E0C94B20];
    v19 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v22, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v17, v24, v18, v19, v23, CFSTR("Error discovering identity for lookup info %@"), v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v26, (uint64_t)v25);

    objc_msgSend_request(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v29, v30, v31);

  }
}

- (void)_discoverIdentitiesWithLookupInfos:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDDiscoverUserIdentitiesURLRequest *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_count(v6, v8, v9))
  {
    v10 = [CKDDiscoverUserIdentitiesURLRequest alloc];
    v11 = (void *)objc_opt_class();
    v14 = objc_msgSend_adopterProvidedLookupInfos(v11, v12, v13);
    v16 = (void *)objc_msgSend_initWithOperation_lookupInfos_adopterProvidedLookupInfos_(v10, v15, (uint64_t)self, v6, v14);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v16);
    v17 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1BEA8BA28;
    v32[3] = &unk_1E7831EA8;
    objc_copyWeak(&v33, &location);
    objc_msgSend_setProgressBlock_(v16, v18, (uint64_t)v32);
    v25 = v17;
    v26 = 3221225472;
    v27 = sub_1BEA8BAB8;
    v28 = &unk_1E7831ED0;
    objc_copyWeak(&v30, &location);
    v29 = v7;
    objc_copyWeak(&v31, &from);
    objc_msgSend_setCompletionBlock_(v16, v19, (uint64_t)&v25);
    objc_msgSend_setRequest_(self, v20, (uint64_t)v16, v25, v26, v27, v28);
    objc_msgSend_container(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v23, v24, (uint64_t)v16);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  _QWORD v6[5];

  objc_msgSend_userIdentityLookupInfos(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEA8BBD4;
  v6[3] = &unk_1E782EDA8;
  v6[4] = self;
  objc_msgSend__discoverIdentitiesWithLookupInfos_completionBlock_(self, v5, (uint64_t)v4, v6);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDDiscoverUserIdentitiesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)discoverUserIdentitiesProgressBlock
{
  return self->_discoverUserIdentitiesProgressBlock;
}

- (void)setDiscoverUserIdentitiesProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong(&self->_discoverUserIdentitiesProgressBlock, 0);
}

@end
