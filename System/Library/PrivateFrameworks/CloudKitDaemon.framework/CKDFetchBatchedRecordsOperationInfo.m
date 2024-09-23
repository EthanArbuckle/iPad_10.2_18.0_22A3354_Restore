@implementation CKDFetchBatchedRecordsOperationInfo

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
}

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  self->_forcePCSDecryptionAttempt = a3;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  self->_errorReportingStyle = a3;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, a3);
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (BOOL)forcePCSDecryptionAttempt
{
  return self->_forcePCSDecryptionAttempt;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

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
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t AssetContents;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t AllChanges;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  objc_super v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchBatchedRecordsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZoneIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, CFSTR("recordZoneIDs"));

  objc_msgSend_configurationsByRecordZoneID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, CFSTR("configurationsByRecordZoneID"));

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v14, v15);
  objc_msgSend_encodeBool_forKey_(v4, v17, AssetContents, CFSTR("shouldFetchAssetContents"));
  AllChanges = objc_msgSend_fetchAllChanges(self, v18, v19);
  objc_msgSend_encodeBool_forKey_(v4, v21, AllChanges, CFSTR("fetchAllChanges"));
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, CFSTR("assetTransferOptionsByKeyByRecordType"));

  objc_autoreleasePoolPop(v5);
}

- (CKDFetchBatchedRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKDFetchBatchedRecordsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *recordZoneIDs;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSDictionary *configurationsByRecordZoneID;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKDFetchBatchedRecordsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, CFSTR("recordZoneIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    recordZoneIDs = v5->_recordZoneIDs;
    v5->_recordZoneIDs = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v15, v19, v16, v17, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, CFSTR("configurationsByRecordZoneID"));
    v22 = objc_claimAutoreleasedReturnValue();
    configurationsByRecordZoneID = v5->_configurationsByRecordZoneID;
    v5->_configurationsByRecordZoneID = (NSDictionary *)v22;

    v5->_shouldFetchAssetContents = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("shouldFetchAssetContents"));
    v5->_fetchAllChanges = objc_msgSend_decodeBoolForKey_(v4, v25, (uint64_t)CFSTR("fetchAllChanges"));
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend_setWithObjects_(v26, v30, v27, v28, v29, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, CFSTR("assetTransferOptionsByKeyByRecordType"));
    v33 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, a3);
}

@end
