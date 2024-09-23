@implementation CKFetchMergeableDeltasOperationInfo

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
  void *v10;
  const char *v11;
  objc_super v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v12.receiver = self;
  v12.super_class = (Class)CKFetchMergeableDeltasOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend_mergeableValueIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mergeableValueIDs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  objc_autoreleasePoolPop(v5);
}

- (CKFetchMergeableDeltasOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchMergeableDeltasOperationInfo *v5;
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
  NSArray *mergeableValueIDs;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKFetchMergeableDeltasOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_mergeableValueIDs);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    mergeableValueIDs = v5->_mergeableValueIDs;
    v5->_mergeableValueIDs = (NSArray *)v15;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
}

@end
