@implementation CKArchiveRecordsOperationInfo

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
  v11.super_class = (Class)CKArchiveRecordsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_recordIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordIDs"));

  objc_autoreleasePoolPop(v5);
}

- (CKArchiveRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKArchiveRecordsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *recordIDs;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKArchiveRecordsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("recordIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
