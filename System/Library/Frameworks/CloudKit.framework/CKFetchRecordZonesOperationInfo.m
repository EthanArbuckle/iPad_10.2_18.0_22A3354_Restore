@implementation CKFetchRecordZonesOperationInfo

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AllRecordZonesOperation;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  objc_super v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordZonesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v21, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordZoneIDs"));

  AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, AllRecordZonesOperation, (uint64_t)CFSTR("isFetchAllRecordZonesOperation"));
  v19 = objc_msgSend_ignorePCSFailures(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, v19, (uint64_t)CFSTR("ignorePCSFailures"));
  objc_autoreleasePoolPop(v5);

}

- (CKFetchRecordZonesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordZonesOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *recordZoneIDs;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordZonesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("recordZoneIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordZoneIDs = v5->_recordZoneIDs;
    v5->_recordZoneIDs = (NSArray *)v14;

    v5->_isFetchAllRecordZonesOperation = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("isFetchAllRecordZonesOperation"), v17);
    v5->_ignorePCSFailures = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)CFSTR("ignorePCSFailures"), v19);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchAllRecordZonesOperation = a3;
}

- (BOOL)ignorePCSFailures
{
  return self->_ignorePCSFailures;
}

- (void)setIgnorePCSFailures:(BOOL)a3
{
  self->_ignorePCSFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
