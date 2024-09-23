@implementation BCMutableCloudData

- (NSString)localRecordID
{
  return self->_localRecordID;
}

- (BCMutableCloudData)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BCMutableCloudData *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *localRecordID;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDate *modificationDate;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v9 = (BCMutableCloudData *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("localRecordID"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    localRecordID = v9->_localRecordID;
    v9->_localRecordID = (NSString *)v13;

    v9->_deletedFlag = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)CFSTR("deletedFlag"), v16, v17);
    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("modificationDate"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v21;

    v9->_editGeneration = objc_msgSend_decodeInt64ForKey_(v4, v23, (uint64_t)CFSTR("editGeneration"), v24, v25);
    v9->_syncGeneration = objc_msgSend_decodeInt64ForKey_(v4, v26, (uint64_t)CFSTR("syncGeneration"), v27, v28);
  }

  return v9;
}

- (BCMutableCloudData)init
{
  BCMutableCloudData *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCMutableCloudData;
  v2 = -[BCMutableCloudData init](&v9, sel_init);
  if (v2 && BUIsRunningTests())
  {
    objc_msgSend_nullPrivacyDelegate(BCCloudDataNullPrivacyDelegate, v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_privacyDelegate, v7);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecordID, 0);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_systemFields, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

- (BCMutableCloudData)initWithCloudData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BCMutableCloudData *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSDate *modificationDate;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CKRecord *systemFields;

  v4 = a3;
  v13 = (BCMutableCloudData *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v13)
  {
    objc_msgSend_privacyDelegate(v4, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      BDSCloudKitLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_227E5B680();

    }
    objc_msgSend_privacyDelegate(v4, v15, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_privacyDelegate, v20);

    v13->_deletedFlag = objc_msgSend_deletedFlag(v4, v21, v22, v23, v24);
    objc_msgSend_modificationDate(v4, v25, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    modificationDate = v13->_modificationDate;
    v13->_modificationDate = (NSDate *)v29;

    v13->_editGeneration = objc_msgSend_editGeneration(v4, v31, v32, v33, v34);
    v13->_syncGeneration = objc_msgSend_syncGeneration(v4, v35, v36, v37, v38);
    objc_msgSend_systemFields(v4, v39, v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    systemFields = v13->_systemFields;
    v13->_systemFields = (CKRecord *)v43;

  }
  return v13;
}

- (BCMutableCloudData)initWithRecord:(id)a3
{
  id v5;
  BCMutableCloudData *v6;
  BCMutableCloudData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *modificationDate;
  NSObject *v14;
  objc_super v16;

  v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)BCMutableCloudData;
    v6 = -[BCMutableCloudData init](&v16, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_systemFields, a3);
      v7->_deletedFlag = 0;
      objc_msgSend_modificationDate(v5, v8, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      modificationDate = v7->_modificationDate;
      v7->_modificationDate = (NSDate *)v12;

      v7->_editGeneration = 0;
      v7->_syncGeneration = 0;
    }
  }
  else
  {
    BDSCloudKitLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_227E5B6AC();

    v7 = 0;
  }

  return v7;
}

- (NSData)ckSystemFields
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B6D8();

  objc_msgSend_data(MEMORY[0x24BDBCE50], v3, v4, v5, v6);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)recordType
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B704();

  return &stru_24F091B90;
}

- (id)identifier
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B730();

  return 0;
}

- (id)zoneName
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B628();

  return &stru_24F091B90;
}

- (CKRecord)systemFields
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CKRecord *systemFields;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char isEqualToString;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  CKRecord *v65;
  CKRecord *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CKRecord *v71;

  objc_msgSend_privacyDelegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_establishedSalt(v6, v7, v8, v9, v10))
  {
    objc_msgSend_identifier(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_recordType(self, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordNameFromRecordType_identifier_(v6, v26, (uint64_t)v20, (uint64_t)v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      systemFields = self->_systemFields;
      if (!systemFields
        || (objc_msgSend_recordID(systemFields, v29, v30, v31, v32),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_recordName(v34, v35, v36, v37, v38),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            isEqualToString = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)v28, v41, v42),
            v39,
            v34,
            (isEqualToString & 1) == 0))
      {
        v44 = objc_alloc(MEMORY[0x24BDB91F8]);
        objc_msgSend_zoneName(self, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend_initWithZoneName_ownerName_(v44, v50, (uint64_t)v49, *MEMORY[0x24BDB8E88], v51);

        v53 = objc_alloc(MEMORY[0x24BDB91E8]);
        v56 = (void *)objc_msgSend_initWithRecordName_zoneID_(v53, v54, (uint64_t)v28, (uint64_t)v52, v55);
        v57 = objc_alloc(MEMORY[0x24BDB91D8]);
        objc_msgSend_recordType(self, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(v57, v63, (uint64_t)v62, (uint64_t)v56, v64);
        v66 = self->_systemFields;
        self->_systemFields = v65;

        objc_msgSend_incrementEditGeneration(self, v67, v68, v69, v70);
      }

    }
  }
  v71 = self->_systemFields;

  return v71;
}

- (void)incrementEditGeneration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_editGeneration(self, a2, v2, v3, v4) + 1;
  objc_msgSend_setEditGeneration_(self, v7, v6, v8, v9);
}

- (id)configuredRecordFromAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend_systemFields(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedValuesByKey(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)CFSTR("localRecordIDEncrypted"), v18);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char isEqualToString;

  v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v5, v7, v6, v8, v9))
  {
    objc_msgSend_identifier(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v5, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v14, v20, (uint64_t)v19, v21, v22);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_identifier(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;

  v39 = a3;
  objc_msgSend_identifier(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v39, v9, (uint64_t)v8, (uint64_t)CFSTR("localRecordID"), v10);

  v15 = objc_msgSend_deletedFlag(self, v11, v12, v13, v14);
  objc_msgSend_encodeBool_forKey_(v39, v16, v15, (uint64_t)CFSTR("deletedFlag"), v17);
  objc_msgSend_modificationDate(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v39, v23, (uint64_t)v22, (uint64_t)CFSTR("modificationDate"), v24);

  v29 = objc_msgSend_editGeneration(self, v25, v26, v27, v28);
  objc_msgSend_encodeInt64_forKey_(v39, v30, v29, (uint64_t)CFSTR("editGeneration"), v31);
  v36 = objc_msgSend_syncGeneration(self, v32, v33, v34, v35);
  objc_msgSend_encodeInt64_forKey_(v39, v37, v36, (uint64_t)CFSTR("syncGeneration"), v38);

}

- (BOOL)deletedFlag
{
  return self->_deletedFlag;
}

- (void)setDeletedFlag:(BOOL)a3
{
  self->_deletedFlag = a3;
}

- (int64_t)editGeneration
{
  return self->_editGeneration;
}

- (void)setEditGeneration:(int64_t)a3
{
  self->_editGeneration = a3;
}

- (int64_t)syncGeneration
{
  return self->_syncGeneration;
}

- (void)setSyncGeneration:(int64_t)a3
{
  self->_syncGeneration = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSystemFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  return (BCCloudDataPrivacyDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void)setPrivacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privacyDelegate, a3);
}

- (void)setLocalRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
