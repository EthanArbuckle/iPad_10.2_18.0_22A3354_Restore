@implementation CKAggregateZonePCSOperationInfo

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
  void *v14;
  const char *v15;
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v16.receiver = self;
  v16.super_class = (Class)CKAggregateZonePCSOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend_sourceZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("sourceZoneIDs"));

  objc_msgSend_targetZone(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("targetZone"));

  objc_autoreleasePoolPop(v5);
}

- (CKAggregateZonePCSOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKAggregateZonePCSOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *sourceZoneIDs;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  CKRecordZone *targetZone;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAggregateZonePCSOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v21, sel_initWithCoder_, v4);
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
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("sourceZoneIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceZoneIDs = v5->_sourceZoneIDs;
    v5->_sourceZoneIDs = (NSArray *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("targetZone"));
    v18 = objc_claimAutoreleasedReturnValue();
    targetZone = v5->_targetZone;
    v5->_targetZone = (CKRecordZone *)v18;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)sourceZoneIDs
{
  return self->_sourceZoneIDs;
}

- (void)setSourceZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sourceZoneIDs, a3);
}

- (CKRecordZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
  objc_storeStrong((id *)&self->_targetZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);
}

@end
