@implementation CKDModifyRecordsOperationReReferenceBatchKey

- (CKDModifyRecordsOperationReReferenceBatchKey)initWithAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDModifyRecordsOperationReReferenceBatchKey *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *owner;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDModifyRecordsOperationReReferenceBatchKey;
  v7 = -[CKDModifyRecordsOperationReReferenceBatchKey init](&v29, sel_init);
  if (v7)
  {
    objc_msgSend_assetReference(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v4, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isClone = objc_msgSend_hasSameOwnerAs_(v20, v21, (uint64_t)v14) ^ 1;

    v7->_databaseScope = objc_msgSend_databaseScope(v8, v22, v23);
    objc_msgSend_ownerName(v14, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    owner = v7->_owner;
    v7->_owner = (NSString *)v26;

  }
  return v7;
}

- (CKDModifyRecordsOperationReReferenceBatchKey)initWithPackage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDModifyRecordsOperationReReferenceBatchKey *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *owner;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDModifyRecordsOperationReReferenceBatchKey;
  v7 = -[CKDModifyRecordsOperationReReferenceBatchKey init](&v32, sel_init);
  if (v7)
  {
    objc_msgSend_packageReference(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v4, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isClone = objc_msgSend_hasSameOwnerAs_(v23, v24, (uint64_t)v14) ^ 1;

    v7->_databaseScope = objc_msgSend_databaseScope(v8, v25, v26);
    objc_msgSend_ownerName(v14, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    owner = v7->_owner;
    v7->_owner = (NSString *)v29;

    v7->_isPackageSection = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_isClone)
    return objc_msgSend_hash(self->_owner, a2, v2);
  else
    return self->_databaseScope;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  const char *v5;
  uint64_t *v6;
  char isEqualToString;

  v4 = (uint64_t *)a3;
  v6 = v4;
  if (!self->_isPackageSection && self->_databaseScope == v4[3] && self->_isClone == *((unsigned __int8 *)v4 + 16))
    isEqualToString = objc_msgSend_isEqualToString_(self->_owner, v5, v4[1]);
  else
    isEqualToString = 0;

  return isEqualToString;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (BOOL)isClone
{
  return self->_isClone;
}

- (BOOL)isPackageSection
{
  return self->_isPackageSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
