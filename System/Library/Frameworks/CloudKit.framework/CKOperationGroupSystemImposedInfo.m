@implementation CKOperationGroupSystemImposedInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_networkServiceTypePerConfig(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, (uint64_t)CFSTR("ServiceTypePerConfig"));

  v13 = objc_msgSend_expectedSendSize(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v20, v14, v13, (uint64_t)CFSTR("ExpectedSendSize"));
  v18 = objc_msgSend_expectedReceiveSize(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v20, v19, v18, (uint64_t)CFSTR("ExpectedReceiveSize"));
  objc_autoreleasePoolPop(v4);

}

- (CKOperationGroupSystemImposedInfo)initWithCoder:(id)a3
{
  id v4;
  CKOperationGroupSystemImposedInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSDictionary *networkServiceTypePerConfig;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKOperationGroupSystemImposedInfo;
  v5 = -[CKOperationGroupSystemImposedInfo init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v22, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("ServiceTypePerConfig"));
    v14 = objc_claimAutoreleasedReturnValue();
    networkServiceTypePerConfig = v5->_networkServiceTypePerConfig;
    v5->_networkServiceTypePerConfig = (NSDictionary *)v14;

    v5->_expectedSendSize = objc_msgSend_decodeInt64ForKey_(v4, v16, (uint64_t)CFSTR("ExpectedSendSize"), v17);
    v5->_expectedReceiveSize = objc_msgSend_decodeInt64ForKey_(v4, v18, (uint64_t)CFSTR("ExpectedReceiveSize"), v19);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSDictionary)networkServiceTypePerConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkServiceTypePerConfig:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)expectedSendSize
{
  return self->_expectedSendSize;
}

- (void)setExpectedSendSize:(int64_t)a3
{
  self->_expectedSendSize = a3;
}

- (int64_t)expectedReceiveSize
{
  return self->_expectedReceiveSize;
}

- (void)setExpectedReceiveSize:(int64_t)a3
{
  self->_expectedReceiveSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkServiceTypePerConfig, 0);
}

@end
