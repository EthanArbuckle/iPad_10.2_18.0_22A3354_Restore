@implementation CKAssetUploadRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKException *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = [CKException alloc];
  v16 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend_initWithName_format_(v15, v18, v16, (uint64_t)CFSTR("%@ is unavailable"), v17);

  objc_exception_throw(v19);
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9
{
  return (CKAssetUploadRequestMetadata *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, -1);
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9 listIndex:(int64_t)a10
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CKAssetUploadRequestMetadata *v21;
  uint64_t v22;
  NSData *fileSignature;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSData *referenceSignature;
  objc_super v30;

  v16 = a8;
  v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)CKAssetUploadRequestMetadata;
  v21 = -[CKUploadRequestMetadata initWithRepairZoneRecordID:databaseScope:recordID:recordType:fieldName:](&v30, sel_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_, a3, a4, a5, a6, a7);
  if (v21)
  {
    v22 = objc_msgSend_copy(v16, v18, v19, v20);
    fileSignature = v21->_fileSignature;
    v21->_fileSignature = (NSData *)v22;

    v27 = objc_msgSend_copy(v17, v24, v25, v26);
    referenceSignature = v21->_referenceSignature;
    v21->_referenceSignature = (NSData *)v27;

    v21->_listIndex = a10;
  }

  return v21;
}

- (CKAssetUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  CKAssetUploadRequestMetadata *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSData *fileSignature;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSData *referenceSignature;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAssetUploadRequestMetadata;
  v5 = -[CKUploadRequestMetadata initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    NSStringFromSelector(sel_listIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_listIndex = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)v7, v9);

    v10 = objc_opt_class();
    NSStringFromSelector(sel_fileSignature);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);
    v13 = objc_claimAutoreleasedReturnValue();
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_referenceSignature);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    v18 = objc_claimAutoreleasedReturnValue();
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v18;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  const char *v23;
  objc_super v24;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v24.receiver = self;
  v24.super_class = (Class)CKAssetUploadRequestMetadata;
  -[CKUploadRequestMetadata encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  v9 = objc_msgSend_listIndex(self, v6, v7, v8);
  NSStringFromSelector(sel_listIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v4, v11, v9, (uint64_t)v10);

  objc_msgSend_fileSignature(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileSignature);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  objc_msgSend_referenceSignature(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_referenceSignature);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);

  objc_autoreleasePoolPop(v5);
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CKAssetUploadRequestMetadata;
  v3 = -[CKUploadRequestMetadata hash](&v25, sel_hash);
  v7 = objc_msgSend_listIndex(self, v4, v5, v6);
  objc_msgSend_fileSignature(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7 ^ objc_msgSend_hash(v11, v12, v13, v14);
  objc_msgSend_referenceSignature(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15 ^ objc_msgSend_hash(v19, v20, v21, v22) ^ v3;

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
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
  char isEqual;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKAssetUploadRequestMetadata;
  if (-[CKUploadRequestMetadata isEqual:](&v36, sel_isEqual_, v4))
  {
    v5 = v4;
    v9 = objc_msgSend_listIndex(self, v6, v7, v8);
    if (v9 == objc_msgSend_listIndex(v5, v10, v11, v12)
      && (objc_msgSend_fileSignature(self, v13, v14, v15),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_fileSignature(v5, v17, v18, v19),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22),
          v20,
          v16,
          v23))
    {
      objc_msgSend_referenceSignature(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  objc_super v25;

  v5 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CKAssetUploadRequestMetadata;
  -[CKUploadRequestMetadata CKDescriptionPropertiesWithPublic:private:shouldExpand:](&v25, sel_CKDescriptionPropertiesWithPublic_private_shouldExpand_, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v7, v8, v9, v10);

  if (v5 && objc_msgSend_listIndex(self, v12, v13, v14) != -1)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = objc_msgSend_listIndex(self, v15, v16, v17);
    objc_msgSend_numberWithInteger_(v18, v20, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v23, (uint64_t)CFSTR("listIndex"), (uint64_t)v22);

  }
  return v11;
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
}

@end
