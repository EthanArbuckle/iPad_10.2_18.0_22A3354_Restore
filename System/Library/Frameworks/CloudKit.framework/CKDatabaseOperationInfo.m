@implementation CKDatabaseOperationInfo

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void)takeValuesFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  self->_databaseScope = objc_msgSend_databaseScope(v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)CKDatabaseOperationInfo;
  -[CKOperationInfo takeValuesFrom:](&v8, sel_takeValuesFrom_, v4);

}

- (CKDatabaseOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKDatabaseOperationInfo *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDatabaseOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)CFSTR("DatabaseScope"), v8);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v11.receiver = self;
  v11.super_class = (Class)CKDatabaseOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  v9 = objc_msgSend_databaseScope(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, v9, (uint64_t)CFSTR("DatabaseScope"));
  objc_autoreleasePoolPop(v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/db-operation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
