@implementation CKAssetReference

- (CKAssetReference)initWithExistingRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 fileSignature:(id)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  char v15;
  char v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CKAssetReference *v23;
  uint64_t v24;
  CKRecordID *recordID;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *fieldName;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSData *fileSignature;
  void *v37;
  CKException *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  objc_super v49;
  id v50;
  id v51;
  id v52;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v52 = 0;
  v13 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 0, 0, &v52);
  v14 = v52;
  if ((v13 & 1) == 0)
    goto LABEL_9;

  v51 = 0;
  v15 = _CKCheckArgument((uint64_t)"fieldName", v11, 0, 0, 0, &v51);
  v14 = v51;
  if ((v15 & 1) == 0
    || (v14,
        v50 = 0,
        v16 = _CKCheckArgument((uint64_t)"fileSignature", v12, 0, 0, 0, &v50),
        v14 = v50,
        (v16 & 1) == 0))
  {
LABEL_9:
    v37 = v14;
    v38 = [CKException alloc];
    v42 = objc_msgSend_code(v37, v39, v40, v41);
    objc_msgSend_localizedDescription(v37, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)objc_msgSend_initWithCode_format_(v38, v47, v42, (uint64_t)CFSTR("%@"), v46);

    objc_exception_throw(v48);
  }

  if ((objc_msgSend_isValidSignature_(CKSignatureGenerator, v17, (uint64_t)v12, v18) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v19, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Invalid fileSignature"));
  v49.receiver = self;
  v49.super_class = (Class)CKAssetReference;
  v23 = -[CKAssetReference init](&v49, sel_init);
  if (v23)
  {
    v24 = objc_msgSend_copy(v10, v20, v21, v22);
    recordID = v23->_recordID;
    v23->_recordID = (CKRecordID *)v24;

    v23->_databaseScope = a4;
    v29 = objc_msgSend_copy(v11, v26, v27, v28);
    fieldName = v23->_fieldName;
    v23->_fieldName = (NSString *)v29;

    v34 = objc_msgSend_copy(v12, v31, v32, v33);
    fileSignature = v23->_fileSignature;
    v23->_fileSignature = (NSData *)v34;

  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  CKAssetReference *v4;
  CKAssetReference *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int isEqual;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  char v45;

  v4 = (CKAssetReference *)a3;
  if (self == v4)
  {
    v45 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_recordID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

      if (!isEqual)
        goto LABEL_9;
      v20 = objc_msgSend_databaseScope(self, v17, v18, v19);
      if (v20 != objc_msgSend_databaseScope(v5, v21, v22, v23))
        goto LABEL_9;
      objc_msgSend_fieldName(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fieldName(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);

      if (v34)
      {
        objc_msgSend_fileSignature(self, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileSignature(v5, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_isEqual_(v38, v43, (uint64_t)v42, v44);

      }
      else
      {
LABEL_9:
        v45 = 0;
      }

    }
    else
    {
      v45 = 0;
    }
  }

  return v45;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  unint64_t v29;

  objc_msgSend_recordID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_databaseScope(self, v10, v11, v12) ^ v9;
  objc_msgSend_fieldName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v17, v18, v19, v20);
  objc_msgSend_fileSignature(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13 ^ v21 ^ objc_msgSend_hash(v25, v26, v27, v28);

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_recordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, (uint64_t)CFSTR("RecordID"));

  v13 = objc_msgSend_databaseScope(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v25, v14, v13, (uint64_t)CFSTR("DatabaseScope"));
  objc_msgSend_fieldName(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, (uint64_t)CFSTR("FieldName"));

  objc_msgSend_fileSignature(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, (uint64_t)CFSTR("FileSignature"));

  objc_autoreleasePoolPop(v4);
}

- (CKAssetReference)initWithCoder:(id)a3
{
  id v4;
  CKAssetReference *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKRecordID *recordID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSString *fieldName;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSData *fileSignature;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKAssetReference;
  v5 = -[CKAssetReference init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("RecordID"));
    v9 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v9;

    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("DatabaseScope"), v12);
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("FieldName"));
    v15 = objc_claimAutoreleasedReturnValue();
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("FileSignature"));
    v19 = objc_claimAutoreleasedReturnValue();
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v19;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;

  v5 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_recordID(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v16, (uint64_t)CFSTR("recordID"), (uint64_t)v15);

    v17 = (void *)MEMORY[0x1E0CB37E8];
    v21 = objc_msgSend_databaseScope(self, v18, v19, v20);
    objc_msgSend_numberWithInteger_(v17, v22, v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v25, (uint64_t)CFSTR("databaseScope"), (uint64_t)v24);

    objc_msgSend_fieldName(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v30, (uint64_t)CFSTR("fieldName"), (uint64_t)v29);

    objc_msgSend_fileSignature(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v39, (uint64_t)CFSTR("fileSignature"), (uint64_t)v38);

  }
  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetReference *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (BOOL)isPackageMember
{
  return self->_isPackageMember;
}

- (void)setIsPackageMember:(BOOL)a3
{
  self->_isPackageMember = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
