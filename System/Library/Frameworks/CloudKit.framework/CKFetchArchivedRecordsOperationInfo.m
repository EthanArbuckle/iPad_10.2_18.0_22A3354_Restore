@implementation CKFetchArchivedRecordsOperationInfo

- (CKFetchArchivedRecordsOperationInfo)init
{
  CKFetchArchivedRecordsOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_fetchAllChanges = 1;
  }
  return result;
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
  uint64_t AssetContents;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t AllChanges;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  objc_super v31;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v31.receiver = self;
  v31.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v31, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordZoneIDs"));

  objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("configurationsByRecordZoneID"));

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContents, (uint64_t)CFSTR("shouldFetchAssetContents"));
  AllChanges = objc_msgSend_fetchAllChanges(self, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v4, v25, AllChanges, (uint64_t)CFSTR("fetchAllChanges"));
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("assetTransferOptionsByRecordTypeAndKey"));

  objc_autoreleasePoolPop(v5);
}

- (CKFetchArchivedRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchArchivedRecordsOperationInfo *v5;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSDictionary *configurationsByRecordZoneID;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v41, sel_initWithCoder_, v4);
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

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v20, v17, v21, v18, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("configurationsByRecordZoneID"));
    v24 = objc_claimAutoreleasedReturnValue();
    configurationsByRecordZoneID = v5->_configurationsByRecordZoneID;
    v5->_configurationsByRecordZoneID = (NSDictionary *)v24;

    v5->_shouldFetchAssetContents = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("shouldFetchAssetContents"), v27);
    v5->_fetchAllChanges = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)CFSTR("fetchAllChanges"), v29);
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend_setWithObjects_(v30, v34, v31, v35, v32, v33, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, (uint64_t)CFSTR("assetTransferOptionsByRecordTypeAndKey"));
    v38 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v38;

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

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, a3);
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
