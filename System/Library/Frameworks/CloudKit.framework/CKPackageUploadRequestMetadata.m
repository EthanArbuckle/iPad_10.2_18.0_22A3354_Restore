@implementation CKPackageUploadRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
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

- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignatures:(id)a8 referenceSignatures:(id)a9
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKPackageUploadRequestMetadata *v20;
  uint64_t v21;
  NSArray *fileSignatures;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *referenceSignatures;
  objc_super v29;

  v15 = a8;
  v16 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKPackageUploadRequestMetadata;
  v20 = -[CKUploadRequestMetadata initWithRepairZoneRecordID:databaseScope:recordID:recordType:fieldName:](&v29, sel_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_, a3, a4, a5, a6, a7);
  if (v20)
  {
    objc_msgSend_CKDeepCopy(v15, v17, v18, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    fileSignatures = v20->_fileSignatures;
    v20->_fileSignatures = (NSArray *)v21;

    objc_msgSend_CKDeepCopy(v16, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    referenceSignatures = v20->_referenceSignatures;
    v20->_referenceSignatures = (NSArray *)v26;

  }
  return v20;
}

- (CKPackageUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  CKPackageUploadRequestMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSArray *fileSignatures;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *referenceSignatures;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKPackageUploadRequestMetadata;
  v5 = -[CKUploadRequestMetadata initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fileSignatures);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    fileSignatures = v5->_fileSignatures;
    v5->_fileSignatures = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_referenceSignatures);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    referenceSignatures = v5->_referenceSignatures;
    v5->_referenceSignatures = (NSArray *)v25;

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
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  objc_super v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v18.receiver = self;
  v18.super_class = (Class)CKPackageUploadRequestMetadata;
  -[CKUploadRequestMetadata encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  objc_msgSend_fileSignatures(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileSignatures);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  objc_msgSend_referenceSignatures(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_referenceSignatures);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  objc_autoreleasePoolPop(v5);
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKPackageUploadRequestMetadata;
  v3 = -[CKUploadRequestMetadata hash](&v21, sel_hash);
  objc_msgSend_fileSignatures(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_hash(v7, v8, v9, v10);
  objc_msgSend_referenceSignatures(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ objc_msgSend_hash(v15, v16, v17, v18) ^ v3;

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
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
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKPackageUploadRequestMetadata;
  if (-[CKUploadRequestMetadata isEqual:](&v29, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_msgSend_fileSignatures(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileSignatures(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

    if (isEqual)
    {
      objc_msgSend_referenceSignatures(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignatures(v5, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSArray)fileSignatures
{
  return self->_fileSignatures;
}

- (NSArray)referenceSignatures
{
  return self->_referenceSignatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignatures, 0);
  objc_storeStrong((id *)&self->_fileSignatures, 0);
}

@end
