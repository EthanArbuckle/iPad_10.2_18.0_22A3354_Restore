@implementation CKDMarkAssetBrokenURLRequestWrapperOperation

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/break-assets-url-request-wrapper", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 901;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)main
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
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
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_urlRequest(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_1BEBD266C;
  v21 = &unk_1E782EF38;
  objc_copyWeak(&v22, &location);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v18);

  objc_msgSend_urlRequest(self, v7, v8, v18, v19, v20, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequest_(self, v10, (uint64_t)v9);

  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_urlRequest(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v13, v17, (uint64_t)v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (CKDMarkAssetBrokenURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end
