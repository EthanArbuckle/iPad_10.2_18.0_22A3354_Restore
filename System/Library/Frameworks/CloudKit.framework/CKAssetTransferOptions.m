@implementation CKAssetTransferOptions

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
  void *v13;
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
  objc_msgSend_sparseAware(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, (uint64_t)CFSTR("AssetTransferOptionSparseAware"));

  objc_msgSend_shouldFetchAssetContent(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, (uint64_t)CFSTR("AssetTransferOptionShouldFetchAssetContent"));

  objc_msgSend_shouldFetchAssetContentInMemory(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, (uint64_t)CFSTR("AssetTransferOptionShouldFetchAssetContentInMemory"));

  objc_msgSend_useMMCSEncryptionV2(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, (uint64_t)CFSTR("AssetTransferOptionUseMMCSEncryptionV2"));

  objc_autoreleasePoolPop(v4);
}

- (CKAssetTransferOptions)initWithCoder:(id)a3
{
  id v4;
  CKAssetTransferOptions *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSNumber *sparseAware;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSNumber *shouldFetchAssetContent;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSNumber *shouldFetchAssetContentInMemory;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSNumber *useMMCSEncryptionV2;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKAssetTransferOptions;
  v5 = -[CKAssetTransferOptions init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("AssetTransferOptionSparseAware"));
    v9 = objc_claimAutoreleasedReturnValue();
    sparseAware = v5->_sparseAware;
    v5->_sparseAware = (NSNumber *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("AssetTransferOptionShouldFetchAssetContent"));
    v13 = objc_claimAutoreleasedReturnValue();
    shouldFetchAssetContent = v5->_shouldFetchAssetContent;
    v5->_shouldFetchAssetContent = (NSNumber *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("AssetTransferOptionShouldFetchAssetContentInMemory"));
    v17 = objc_claimAutoreleasedReturnValue();
    shouldFetchAssetContentInMemory = v5->_shouldFetchAssetContentInMemory;
    v5->_shouldFetchAssetContentInMemory = (NSNumber *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("AssetTransferOptionUseMMCSEncryptionV2"));
    v21 = objc_claimAutoreleasedReturnValue();
    useMMCSEncryptionV2 = v5->_useMMCSEncryptionV2;
    v5->_useMMCSEncryptionV2 = (NSNumber *)v21;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 6, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v5, 3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sparseAware(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_BOOLValue(v11, v12, v13, v14);

  if (v15)
    objc_msgSend_addObject_(v7, v16, (uint64_t)CFSTR("sparse-aware"), v18);
  objc_msgSend_shouldFetchAssetContent(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_BOOLValue(v19, v20, v21, v22);

  if (v23)
    objc_msgSend_addObject_(v7, v24, (uint64_t)CFSTR("fetch-asset-content"), v26);
  objc_msgSend_shouldFetchAssetContentInMemory(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v31)
    objc_msgSend_addObject_(v7, v32, (uint64_t)CFSTR("fetch-asset-content-in-memory"), v34);
  objc_msgSend_useMMCSEncryptionV2(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v35;
  if (v35)
  {
    if (objc_msgSend_BOOLValue(v35, v36, v37, v38))
      objc_msgSend_addObject_(v7, v40, (uint64_t)CFSTR("force-v2-encryption"), v41);
    else
      objc_msgSend_addObject_(v7, v40, (uint64_t)CFSTR("force-v1-encryption"), v41);
  }
  if (objc_msgSend_count(v7, v36, v37, v38))
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v7, v42, (uint64_t)CFSTR("|"), v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v44, v46, (uint64_t)CFSTR("flags=%@"), v47, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v49, (uint64_t)v48, v50);

  }
  objc_msgSend_componentsJoinedByString_(v4, v42, (uint64_t)CFSTR(", "), v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetTransferOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKAssetTransferOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *sparseAware;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSNumber *shouldFetchAssetContent;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *shouldFetchAssetContentInMemory;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *useMMCSEncryptionV2;

  v4 = objc_alloc_init(CKAssetTransferOptions);
  objc_msgSend_sparseAware(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  sparseAware = v4->_sparseAware;
  v4->_sparseAware = (NSNumber *)v12;

  objc_msgSend_shouldFetchAssetContent(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  shouldFetchAssetContent = v4->_shouldFetchAssetContent;
  v4->_shouldFetchAssetContent = (NSNumber *)v21;

  objc_msgSend_shouldFetchAssetContentInMemory(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_copy(v26, v27, v28, v29);
  shouldFetchAssetContentInMemory = v4->_shouldFetchAssetContentInMemory;
  v4->_shouldFetchAssetContentInMemory = (NSNumber *)v30;

  objc_msgSend_useMMCSEncryptionV2(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_copy(v35, v36, v37, v38);
  useMMCSEncryptionV2 = v4->_useMMCSEncryptionV2;
  v4->_useMMCSEncryptionV2 = (NSNumber *)v39;

  return v4;
}

- (NSNumber)sparseAware
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSparseAware:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)shouldFetchAssetContent
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShouldFetchAssetContent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)shouldFetchAssetContentInMemory
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShouldFetchAssetContentInMemory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)useMMCSEncryptionV2
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUseMMCSEncryptionV2:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useMMCSEncryptionV2, 0);
  objc_storeStrong((id *)&self->_shouldFetchAssetContentInMemory, 0);
  objc_storeStrong((id *)&self->_shouldFetchAssetContent, 0);
  objc_storeStrong((id *)&self->_sparseAware, 0);
}

@end
