@implementation CKDFetchWebAuthTokenOperation

- (CKDFetchWebAuthTokenOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchWebAuthTokenOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *APIToken;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKDFetchWebAuthTokenOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v16, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_APIToken(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_copy(v10, v11, v12);
    APIToken = v9->_APIToken;
    v9->_APIToken = (NSString *)v13;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-web-auth-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 250;
}

- (void)main
{
  void *v3;
  CKDFetchWebAuthTokenURLRequest *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id from;
  _BYTE location[12];
  __int16 v43;
  CKDFetchWebAuthTokenOperation *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v19 = v3;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v22, 1, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v27, 0, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544130;
    *(_QWORD *)&location[4] = v21;
    v43 = 2048;
    v44 = self;
    v45 = 2114;
    v46 = v26;
    v47 = 2112;
    v48 = v31;
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Fetch web auth token operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);

  }
  v4 = [CKDFetchWebAuthTokenURLRequest alloc];
  v6 = (void *)objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  objc_msgSend_APIToken(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAPIToken_(v6, v10, (uint64_t)v9);

  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1BEB82144;
  v38[3] = &unk_1E7835AA8;
  objc_copyWeak(&v39, (id *)location);
  v38[4] = self;
  objc_copyWeak(&v40, &from);
  objc_msgSend_setTokenFetchedBlock_(v6, v12, (uint64_t)v38);
  v32 = v11;
  v33 = 3221225472;
  v34 = sub_1BEB8238C;
  v35 = &unk_1E782E468;
  objc_copyWeak(&v36, (id *)location);
  objc_copyWeak(&v37, &from);
  objc_msgSend_setCompletionBlock_(v6, v13, (uint64_t)&v32);
  objc_msgSend_setRequest_(self, v14, (uint64_t)v6, v32, v33, v34, v35);
  objc_msgSend_container(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v17, v18, (uint64_t)v6);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (NSString)webAuthToken
{
  return self->_webAuthToken;
}

- (void)setWebAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APIToken, 0);
  objc_storeStrong((id *)&self->_webAuthToken, 0);
}

@end
