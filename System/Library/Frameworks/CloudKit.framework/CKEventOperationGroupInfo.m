@implementation CKEventOperationGroupInfo

- (CKEventOperationGroupInfo)initWithCoder:(id)a3
{
  id v4;
  CKEventOperationGroupInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *operationGroupID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *operationGroupName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEventOperationGroupInfo;
  v5 = -[CKEventOperationGroupInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("operationGroupID"));
    v9 = objc_claimAutoreleasedReturnValue();
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("operationGroupName"));
    v13 = objc_claimAutoreleasedReturnValue();
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v13;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)operationGroupID
{
  return self->_operationGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupID, 0);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
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
  void *v13;
  const char *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_operationGroupID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("operationGroupID"));

  objc_msgSend_operationGroupName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, (uint64_t)CFSTR("operationGroupName"));

  objc_autoreleasePoolPop(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
