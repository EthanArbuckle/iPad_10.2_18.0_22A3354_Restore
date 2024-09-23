@implementation CKMarkAssetBrokenOperationInfo

- (CKMarkAssetBrokenOperationInfo)init
{
  CKMarkAssetBrokenOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
  {
    result->_touchRepairZone = 1;
    result->_simulateCorruptAsset = 1;
    result->_writeRepairRecord = 1;
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
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  objc_super v54;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v54.receiver = self;
  v54.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v54, sel_encodeWithCoder_, v4);
  objc_msgSend_recordID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_recordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  objc_msgSend_field(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_field);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  v21 = objc_msgSend_listIndex(self, v18, v19, v20);
  NSStringFromSelector(sel_listIndex);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v4, v23, v21, (uint64_t)v22);

  v27 = objc_msgSend_touchRepairZone(self, v24, v25, v26);
  NSStringFromSelector(sel_touchRepairZone);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v29, v27, (uint64_t)v28);

  v33 = objc_msgSend_simulateCorruptAsset(self, v30, v31, v32);
  NSStringFromSelector(sel_simulateCorruptAsset);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v35, v33, (uint64_t)v34);

  v39 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(self, v36, v37, v38);
  NSStringFromSelector(sel_bypassPCSEncryptionForTouchRepairZone);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v41, v39, (uint64_t)v40);

  v45 = objc_msgSend_writeRepairRecord(self, v42, v43, v44);
  NSStringFromSelector(sel_writeRepairRecord);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v47, v45, (uint64_t)v46);

  objc_msgSend_uploadRequestConfiguration(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uploadRequestConfiguration);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v53, (uint64_t)v51, (uint64_t)v52);

  objc_autoreleasePoolPop(v5);
}

- (CKMarkAssetBrokenOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKMarkAssetBrokenOperationInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKRecordID *recordID;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSString *field;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CKMarkAssetBrokenOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v38, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_recordID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_field);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    field = v5->_field;
    v5->_field = (NSString *)v15;

    NSStringFromSelector(sel_listIndex);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_listIndex = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)v17, v19);

    NSStringFromSelector(sel_touchRepairZone);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_touchRepairZone = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)v20, v22);

    NSStringFromSelector(sel_simulateCorruptAsset);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_simulateCorruptAsset = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)v23, v25);

    NSStringFromSelector(sel_bypassPCSEncryptionForTouchRepairZone);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bypassPCSEncryptionForTouchRepairZone = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)v26, v28);

    NSStringFromSelector(sel_writeRepairRecord);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_writeRepairRecord = objc_msgSend_decodeBoolForKey_(v4, v30, (uint64_t)v29, v31);

    v32 = objc_opt_class();
    NSStringFromSelector(sel_uploadRequestConfiguration);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    v35 = objc_claimAutoreleasedReturnValue();
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v35;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, a3);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (BOOL)touchRepairZone
{
  return self->_touchRepairZone;
}

- (void)setTouchRepairZone:(BOOL)a3
{
  self->_touchRepairZone = a3;
}

- (BOOL)bypassPCSEncryptionForTouchRepairZone
{
  return self->_bypassPCSEncryptionForTouchRepairZone;
}

- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3
{
  self->_bypassPCSEncryptionForTouchRepairZone = a3;
}

- (BOOL)simulateCorruptAsset
{
  return self->_simulateCorruptAsset;
}

- (void)setSimulateCorruptAsset:(BOOL)a3
{
  self->_simulateCorruptAsset = a3;
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
}

@end
