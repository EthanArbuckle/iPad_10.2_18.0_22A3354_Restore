@implementation CKDFetchWebAuthTokenURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchWebAuthTokenURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v9, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_APIToken(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("APIToken"));

}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setWebAuthTokenRetrieveRequest_(v6, v8, (uint64_t)v7);

  objc_msgSend_APIToken(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_length(v11, v12, v13);

  if (v14)
  {
    objc_msgSend_APIToken(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_webAuthTokenRetrieveRequest(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApiToken_(v20, v21, (uint64_t)v17);

  }
  v24[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  const char *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  if (objc_msgSend_hasWebAuthTokenRetrieveResponse(v4, v5, v6))
  {
    objc_msgSend_webAuthTokenRetrieveResponse(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_token(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend_tokenFetchedBlock(self, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_tokenFetchedBlock(self, v14, v15);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v16)[2](v16, v12, v19);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_tokenFetchedBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_tokenFetchedBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v13, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v12);

  }
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)tokenFetchedBlock
{
  return self->_tokenFetchedBlock;
}

- (void)setTokenFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tokenFetchedBlock, 0);
  objc_storeStrong((id *)&self->_APIToken, 0);
}

@end
