@implementation CKFetchWebAuthTokenOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v11.receiver = self;
  v11.super_class = (Class)CKFetchWebAuthTokenOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_APIToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("APIToken"));

  objc_autoreleasePoolPop(v5);
}

- (CKFetchWebAuthTokenOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchWebAuthTokenOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *APIToken;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchWebAuthTokenOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("APIToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    APIToken = v5->_APIToken;
    v5->_APIToken = (NSString *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
  objc_storeStrong((id *)&self->_APIToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APIToken, 0);
}

@end
