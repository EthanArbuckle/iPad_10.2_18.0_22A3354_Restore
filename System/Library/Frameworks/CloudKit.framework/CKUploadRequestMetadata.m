@implementation CKUploadRequestMetadata

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CKUploadRequestMetadata *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKUploadRequestMetadata *v20;
  uint64_t v21;
  CKRecordID *recordID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *recordType;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *fieldName;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CKRecordID *repairZoneRecordID;
  objc_super v39;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v39.receiver = self;
  v39.super_class = (Class)CKUploadRequestMetadata;
  v16 = -[CKUploadRequestMetadata init](&v39, sel_init);
  v20 = v16;
  if (v16)
  {
    v16->_databaseScope = a4;
    v21 = objc_msgSend_copy(v13, v17, v18, v19);
    recordID = v20->_recordID;
    v20->_recordID = (CKRecordID *)v21;

    v26 = objc_msgSend_copy(v14, v23, v24, v25);
    recordType = v20->_recordType;
    v20->_recordType = (NSString *)v26;

    v31 = objc_msgSend_copy(v15, v28, v29, v30);
    fieldName = v20->_fieldName;
    v20->_fieldName = (NSString *)v31;

    v36 = objc_msgSend_copy(v12, v33, v34, v35);
    repairZoneRecordID = v20->_repairZoneRecordID;
    v20->_repairZoneRecordID = (CKRecordID *)v36;

  }
  return v20;
}

- (CKUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  CKUploadRequestMetadata *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CKRecordID *recordID;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSString *recordType;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSString *fieldName;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  CKRecordID *repairZoneRecordID;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKUploadRequestMetadata;
  v5 = -[CKUploadRequestMetadata init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    NSStringFromSelector(sel_databaseScope);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)v7, v9);

    v10 = objc_opt_class();
    NSStringFromSelector(sel_recordID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);
    v13 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_recordType);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    v18 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v18;

    v20 = objc_opt_class();
    NSStringFromSelector(sel_fieldName);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v20, (uint64_t)v21);
    v23 = objc_claimAutoreleasedReturnValue();
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v23;

    v25 = objc_opt_class();
    NSStringFromSelector(sel_repairZoneRecordID);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v25, (uint64_t)v26);
    v28 = objc_claimAutoreleasedReturnValue();
    repairZoneRecordID = v5->_repairZoneRecordID;
    v5->_repairZoneRecordID = (CKRecordID *)v28;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, (uint64_t)CFSTR("databaseScope"));

  objc_msgSend_recordType(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, (uint64_t)CFSTR("recordType"));

  objc_msgSend_fieldName(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, (uint64_t)CFSTR("fieldName"));

  objc_msgSend_recordID(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v26, (uint64_t)CFSTR("recordID"));

  objc_msgSend_repairZoneRecordID(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v31, (uint64_t)CFSTR("repairZoneRecordID"));

  objc_msgSend_properties(v3, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v36;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  id v35;

  v35 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  NSStringFromSelector(sel_databaseScope);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v35, v10, v8, (uint64_t)v9);

  objc_msgSend_recordID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_recordID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v35, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_recordType(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_recordType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v35, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_fieldName(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fieldName);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v35, v28, (uint64_t)v26, (uint64_t)v27);

  objc_msgSend_repairZoneRecordID(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_repairZoneRecordID);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v35, v34, (uint64_t)v32, (uint64_t)v33);

  objc_autoreleasePoolPop(v4);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v5 = objc_msgSend_databaseScope(self, a2, v2, v3);
  objc_msgSend_recordID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;
  objc_msgSend_recordType(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v17, v18, v19, v20);
  objc_msgSend_fieldName(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13 ^ v21 ^ objc_msgSend_hash(v25, v26, v27, v28);
  objc_msgSend_repairZoneRecordID(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v29 ^ objc_msgSend_hash(v33, v34, v35, v36);

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  CKUploadRequestMetadata *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  CKUploadRequestMetadata *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int isEqual;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  char v59;

  v4 = (CKUploadRequestMetadata *)a3;
  if (self == v4)
  {
    v59 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      v8 = v4;
      v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
      if (v12 != objc_msgSend_databaseScope(v8, v13, v14, v15))
        goto LABEL_10;
      objc_msgSend_recordID(self, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v8, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

      if (!isEqual)
        goto LABEL_10;
      objc_msgSend_recordType(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordType(v8, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_isEqual_(v30, v35, (uint64_t)v34, v36);

      if (!v37)
        goto LABEL_10;
      objc_msgSend_fieldName(self, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fieldName(v8, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_isEqual_(v41, v46, (uint64_t)v45, v47);

      if (v48)
      {
        objc_msgSend_repairZoneRecordID(self, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_repairZoneRecordID(v8, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_isEqual_(v52, v57, (uint64_t)v56, v58);

      }
      else
      {
LABEL_10:
        v59 = 0;
      }

    }
    else
    {
      v59 = 0;
    }
  }

  return v59;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;

  v5 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneRecordID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v16, (uint64_t)CFSTR("requestRecordName"), (uint64_t)v15);

  if (v5)
  {
    v20 = objc_msgSend_databaseScope(self, v17, v18, v19);
    CKDatabaseScopeString(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v22, (uint64_t)CFSTR("databaseScope"), (uint64_t)v21);

    objc_msgSend_recordID(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v27, (uint64_t)CFSTR("recordID"), (uint64_t)v26);

    objc_msgSend_recordType(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v32, (uint64_t)CFSTR("recordType"), (uint64_t)v31);

    objc_msgSend_fieldName(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v37, (uint64_t)CFSTR("fieldName"), (uint64_t)v36);

  }
  return v7;
}

- (id)description
{
  return (id)((uint64_t (*)(CKUploadRequestMetadata *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (CKRecordID)repairZoneRecordID
{
  return self->_repairZoneRecordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairZoneRecordID, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
