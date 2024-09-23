@implementation CKReplaceMergeableDeltasOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSArray *replaceDeltasRequests;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v9.receiver = self;
  v9.super_class = (Class)CKReplaceMergeableDeltasOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  replaceDeltasRequests = self->_replaceDeltasRequests;
  NSStringFromSelector(sel_replaceDeltasRequests);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)replaceDeltasRequests, (uint64_t)v7);

  objc_autoreleasePoolPop(v5);
}

- (CKReplaceMergeableDeltasOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKReplaceMergeableDeltasOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSArray *replaceDeltasRequests;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKReplaceMergeableDeltasOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_replaceDeltasRequests);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    replaceDeltasRequests = v5->_replaceDeltasRequests;
    v5->_replaceDeltasRequests = (NSArray *)v15;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
}

@end
