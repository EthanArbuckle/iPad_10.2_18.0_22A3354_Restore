@implementation CKEventOperationInfo

- (CKEventOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKEventOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *operationID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *operationType;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *operationGroupID;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKEventOperationInfo;
  v5 = -[CKEventOperationInfo init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("operationID"));
    v9 = objc_claimAutoreleasedReturnValue();
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("operationType"));
    v13 = objc_claimAutoreleasedReturnValue();
    operationType = v5->_operationType;
    v5->_operationType = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("groupID"));
    v17 = objc_claimAutoreleasedReturnValue();
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v17;

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
  objc_storeStrong((id *)&self->_operationGroupID, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

- (NSString)operationType
{
  return self->_operationType;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (CKEventOperationInfo)initWithOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKEventOperationInfo *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *operationID;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *operationType;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *operationGroupID;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKEventOperationInfo;
  v8 = -[CKEventOperationInfo init](&v36, sel_init);
  if (v8)
  {
    objc_msgSend_operationID(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_copy(v9, v10, v11, v12);
    operationID = v8->_operationID;
    v8->_operationID = (NSString *)v13;

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_copy(v16, v17, v18, v19);
    operationType = v8->_operationType;
    v8->_operationType = (NSString *)v20;

    objc_msgSend_group(v4, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationGroupID(v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_copy(v29, v30, v31, v32);
    operationGroupID = v8->_operationGroupID;
    v8->_operationGroupID = (NSString *)v33;

  }
  return v8;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_operationID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, (uint64_t)CFSTR("operationID"));

  objc_msgSend_operationType(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, (uint64_t)CFSTR("operationType"));

  objc_msgSend_operationGroupID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, (uint64_t)CFSTR("groupID"));

  objc_autoreleasePoolPop(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
