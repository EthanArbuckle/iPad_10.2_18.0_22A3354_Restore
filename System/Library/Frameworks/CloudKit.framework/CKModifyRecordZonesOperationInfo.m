@implementation CKModifyRecordZonesOperationInfo

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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  objc_super v31;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v31.receiver = self;
  v31.super_class = (Class)CKModifyRecordZonesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v31, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZonesToSave(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordZones"));

  objc_msgSend_recordZoneIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("recordZoneIDs"));

  v19 = objc_msgSend_markZonesAsUserPurged(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, v19, (uint64_t)CFSTR("userPurge"));
  v24 = objc_msgSend_maxZoneSaveAttempts(self, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, (uint64_t)CFSTR("maxZoneSaveAttempts"));
  v29 = objc_msgSend_dontFetchFromServer(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, (uint64_t)CFSTR("dontFetchFromServer"));
  objc_autoreleasePoolPop(v5);

}

- (CKModifyRecordZonesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKModifyRecordZonesOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *recordZonesToSave;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSArray *recordZoneIDsToDelete;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKModifyRecordZonesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("recordZones"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordZonesToSave = v5->_recordZonesToSave;
    v5->_recordZonesToSave = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("recordZoneIDs"));
    v23 = objc_claimAutoreleasedReturnValue();
    recordZoneIDsToDelete = v5->_recordZoneIDsToDelete;
    v5->_recordZoneIDsToDelete = (NSArray *)v23;

    v5->_markZonesAsUserPurged = objc_msgSend_decodeBoolForKey_(v4, v25, (uint64_t)CFSTR("userPurge"), v26);
    v5->_maxZoneSaveAttempts = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("maxZoneSaveAttempts"), v28);
    v5->_dontFetchFromServer = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("dontFetchFromServer"), v30);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordZonesToSave, a3);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, a3);
}

- (BOOL)allowDefaultZoneSave
{
  return self->_allowDefaultZoneSave;
}

- (void)setAllowDefaultZoneSave:(BOOL)a3
{
  self->_allowDefaultZoneSave = a3;
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (BOOL)dontFetchFromServer
{
  return self->_dontFetchFromServer;
}

- (void)setDontFetchFromServer:(BOOL)a3
{
  self->_dontFetchFromServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end
