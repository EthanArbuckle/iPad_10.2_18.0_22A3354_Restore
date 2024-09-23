@implementation CKFetchRecordZoneChangesOperationInfo

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, a3);
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
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

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (CKFetchRecordZoneChangesOperationInfo)init
{
  CKFetchRecordZoneChangesOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_fetchAllChanges = 1;
    result->_errorReportingStyle = 1;
  }
  return result;
}

- (CKFetchRecordZoneChangesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordZoneChangesOperationInfo *v5;
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
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  NSDictionary *supplementalChangeTokenByZoneID;
  const char *v52;
  uint64_t v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v55, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("RecordZoneIDs"));
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
    v5->_changeTypes = objc_msgSend_decodeIntegerForKey_(v4, v28, (uint64_t)CFSTR("changeTypes"), v29);
    v5->_fetchAllChanges = objc_msgSend_decodeBoolForKey_(v4, v30, (uint64_t)CFSTR("fetchAllChanges"), v31);
    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend_setWithObjects_(v32, v36, v33, v37, v34, v35, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, (uint64_t)CFSTR("assetTransferOptionsByKeyByRecordType"));
    v40 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    objc_msgSend_setWithObjects_(v42, v46, v43, v47, v44, v45, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v49, (uint64_t)v48, (uint64_t)CFSTR("supplementalChangeTokenByZoneID"));
    v50 = objc_claimAutoreleasedReturnValue();
    supplementalChangeTokenByZoneID = v5->_supplementalChangeTokenByZoneID;
    v5->_supplementalChangeTokenByZoneID = (NSDictionary *)v50;

    v5->_errorReportingStyle = objc_msgSend_decodeIntegerForKey_(v4, v52, (uint64_t)CFSTR("errorReportingStyle"), v53);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
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
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t AllChanges;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  objc_super v46;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v46.receiver = self;
  v46.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v46, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("RecordZoneIDs"));

  objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("configurationsByRecordZoneID"));

  AssetContents = objc_msgSend_shouldFetchAssetContents(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContents, (uint64_t)CFSTR("shouldFetchAssetContents"));
  v24 = objc_msgSend_changeTypes(self, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, (uint64_t)CFSTR("changeTypes"));
  AllChanges = objc_msgSend_fetchAllChanges(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, AllChanges, (uint64_t)CFSTR("fetchAllChanges"));
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("assetTransferOptionsByKeyByRecordType"));

  objc_msgSend_supplementalChangeTokenByZoneID(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, (uint64_t)CFSTR("supplementalChangeTokenByZoneID"));

  v44 = objc_msgSend_errorReportingStyle(self, v41, v42, v43);
  objc_msgSend_encodeInteger_forKey_(v4, v45, v44, (uint64_t)CFSTR("errorReportingStyle"));
  objc_autoreleasePoolPop(v5);

}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
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

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  if (a3 && objc_msgSend_errorReportingStyle(self, a2, a3, v3) == 2)
    objc_msgSend_setErrorReportingStyle_(self, v6, 1, v7);
  self->_forcePCSDecryptionAttempt = a3;
}

@end
