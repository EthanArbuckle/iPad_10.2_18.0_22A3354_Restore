@implementation CKMovePhotosOperationInfo

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
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v18.receiver = self;
  v18.super_class = (Class)CKMovePhotosOperationInfo;
  -[CKModifyRecordsOperationInfo encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  objc_msgSend_moveChanges(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_moveChanges);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  v15 = objc_msgSend_sourceDatabaseScope(self, v12, v13, v14);
  NSStringFromSelector(sel_databaseScope);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v4, v17, v15, (uint64_t)v16);

  objc_autoreleasePoolPop(v5);
}

- (CKMovePhotosOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKMovePhotosOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSArray *moveChanges;
  void *v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKMovePhotosOperationInfo;
  v5 = -[CKModifyRecordsOperationInfo initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_moveChanges);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    moveChanges = v5->_moveChanges;
    v5->_moveChanges = (NSArray *)v15;

    NSStringFromSelector(sel_databaseScope);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceDatabaseScope = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)v17, v19);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveChanges, 0);
}

@end
