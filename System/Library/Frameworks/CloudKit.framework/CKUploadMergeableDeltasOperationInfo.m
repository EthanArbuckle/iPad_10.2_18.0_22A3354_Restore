@implementation CKUploadMergeableDeltasOperationInfo

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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  objc_super v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v18.receiver = self;
  v18.super_class = (Class)CKUploadMergeableDeltasOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  objc_msgSend_deltas(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deltas);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  objc_msgSend_replacementRequests(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_replacementRequests);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  objc_autoreleasePoolPop(v5);
}

- (CKUploadMergeableDeltasOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKUploadMergeableDeltasOperationInfo *v5;
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
  NSArray *deltas;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *replacementRequests;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKUploadMergeableDeltasOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deltas);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    deltas = v5->_deltas;
    v5->_deltas = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_replacementRequests);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    replacementRequests = v5->_replacementRequests;
    v5->_replacementRequests = (NSArray *)v25;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (void)setReplacementRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
}

@end
