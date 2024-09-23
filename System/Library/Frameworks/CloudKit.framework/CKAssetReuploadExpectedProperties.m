@implementation CKAssetReuploadExpectedProperties

- (CKAssetReuploadExpectedProperties)initWithFileSignature:(id)a3 referenceSignature:(id)a4 assetKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKAssetReuploadExpectedProperties *v14;
  uint64_t v15;
  NSData *fileSignature;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSData *referenceSignature;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSData *assetKey;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKAssetReuploadExpectedProperties;
  v14 = -[CKAssetReuploadExpectedProperties init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    fileSignature = v14->_fileSignature;
    v14->_fileSignature = (NSData *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    referenceSignature = v14->_referenceSignature;
    v14->_referenceSignature = (NSData *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    assetKey = v14->_assetKey;
    v14->_assetKey = (NSData *)v25;

  }
  return v14;
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
  id v23;

  v23 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_fileSignature(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileSignature);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_referenceSignature(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_referenceSignature);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_assetKey(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetKey);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);

  objc_autoreleasePoolPop(v4);
}

- (CKAssetReuploadExpectedProperties)initWithCoder:(id)a3
{
  id v4;
  CKAssetReuploadExpectedProperties *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSData *fileSignature;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSData *referenceSignature;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSData *assetKey;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKAssetReuploadExpectedProperties;
  v5 = -[CKAssetReuploadExpectedProperties init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_fileSignature);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_referenceSignature);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_assetKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();
    assetKey = v5->_assetKey;
    v5->_assetKey = (NSData *)v20;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_fileSignature(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKHexString(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v14, (uint64_t)CFSTR("fileSignature=%@"), v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v17, (uint64_t)v16, v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_referenceSignature(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKHexString(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v19, v28, (uint64_t)CFSTR("referenceSignature=%@"), v29, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v31, (uint64_t)v30, v32);

  objc_msgSend_assetKey(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    objc_msgSend_addObject_(v4, v37, (uint64_t)CFSTR("hasAssetKey"), v38);
  objc_msgSend_componentsJoinedByString_(v4, v37, (uint64_t)CFSTR(", "), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetReuploadExpectedProperties *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (NSData)assetKey
{
  return self->_assetKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
}

@end
