@implementation CKDAssetTokenRequestOperation

- (CKDAssetTokenRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDAssetTokenRequestOperation *v9;
  uint64_t v10;
  CKDAssetTokenRequest *assetTokenRequest;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDAssetTokenRequestOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_assetTokenRequest(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    assetTokenRequest = v9->_assetTokenRequest;
    v9->_assetTokenRequest = (CKDAssetTokenRequest *)v10;

  }
  return v9;
}

- (int)operationType
{
  return 230;
}

- (void)main
{
  CKDFetchContentAuthTokensForPutURLRequest *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id from;
  id location;

  v3 = [CKDFetchContentAuthTokensForPutURLRequest alloc];
  objc_msgSend_assetTokenRequest(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protocolHeaders(CKDMMCS, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithOperation_assetTokenRequest_headers_(v3, v10, (uint64_t)self, v6, v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v14 = objc_msgSend_useEncryption(self, v12, v13);
  objc_msgSend_setUseEncryption_(v11, v15, v14);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = sub_1BEC5B574;
  v25 = &unk_1E782E468;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(&v27, &from);
  objc_msgSend_setCompletionBlock_(v11, v16, (uint64_t)&v22);
  objc_msgSend_setRequest_(self, v17, (uint64_t)v11, v22, v23, v24, v25);
  objc_msgSend_container(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v20, v21, (uint64_t)v11);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (CKDAssetTokenRequest)assetTokenRequest
{
  return self->_assetTokenRequest;
}

- (void)setAssetTokenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_assetTokenRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTokenRequest, 0);
}

@end
