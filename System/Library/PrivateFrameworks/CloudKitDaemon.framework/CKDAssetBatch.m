@implementation CKDAssetBatch

- (CKDAssetBatch)initWithAssetZone:(id)a3
{
  id v5;
  CKDAssetBatch *v6;
  CKDAssetBatch *v7;
  uint64_t v8;
  NSArray *assetRecords;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDAssetBatch;
  v6 = -[CKDAssetBatch init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetZone, a3);
    v8 = objc_opt_new();
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = (NSArray *)v8;

    objc_msgSend_assetZoneKey(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_useMMCSEncryptionV2(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_BOOLValue(v15, v16, v17);

    if (v18)
      objc_msgSend_setUseMMCSEncryptionV2_(v7, v19, 1);
  }

  return v7;
}

- (void)addAssetRecord:(id)a3
{
  objc_msgSend_addObject_(self->_assetRecords, a2, (uint64_t)a3);
}

- (unsigned)sizeUpperBound
{
  NSArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_assetRecords;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v12, v16, 16);
  if (v4)
  {
    v7 = v4;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v2);
        v8 += objc_msgSend_sizeUpperBound(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v5, v6, (_QWORD)v12);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)size
{
  uint64_t v2;

  return objc_msgSend_length(self->_authPutRequest, a2, v2);
}

- (NSArray)allMMCSItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1E7838728);
}

- (NSArray)allRereferenceMMCSPackageItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1E7838748);
}

- (NSArray)allMMCSSectionItems
{
  return (NSArray *)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1E7838768);
}

- (id)allMMCSAndSectionItems
{
  return (id)objc_msgSend_CKFlatMap_(self->_assetRecords, a2, (uint64_t)&unk_1E7838788);
}

- (NSArray)allRegularAndSectionAndRereferenceItems
{
  void *v3;
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_assetRecords;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, v24, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend_allMMCSAndSectionItems(v12, v7, v8, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v3, v14, (uint64_t)v13);

        objc_msgSend_allRereferenceMMCSPackageItems(v12, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v3, v18, (uint64_t)v17);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, v24, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (void)failIfNotDoneAllRegularAndSectionAndRereferenceItemsWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_allRegularAndSectionAndRereferenceItems(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend_error(v15, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          objc_msgSend_setError_(v15, v10, (uint64_t)v4);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v12);
  }

}

- (id)firstMMCSItemError
{
  NSArray *assetRecords;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1BE9BB210;
  v10 = sub_1BE9BAEB0;
  v11 = 0;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEC6B278;
  v5[3] = &unk_1E782E9F0;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPackageSectionBatch
{
  NSArray *assetRecords;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEC6B374;
  v5[3] = &unk_1E782E9F0;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRereferenceAssetBatch
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isReReference;

  objc_msgSend_assetZoneKey(self->_assetZone, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isReReference = objc_msgSend_isReReference(v3, v4, v5);

  return isReReference;
}

- (BOOL)isEmptyOfAssets
{
  NSArray *assetRecords;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEC6B4B8;
  v5[3] = &unk_1E782E9F0;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEmptyOfRereferencesAssets
{
  NSArray *assetRecords;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  assetRecords = self->_assetRecords;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEC6B5B4;
  v5[3] = &unk_1E782E9F0;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetRecords, a2, (uint64_t)v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetZone(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("zone=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetRecords(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);
  objc_msgSend_stringWithFormat_(v11, v18, (uint64_t)CFSTR("recordCount=%llu"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

  if (objc_msgSend_isPackageSectionBatch(self, v21, v22))
    objc_msgSend_addObject_(v3, v23, (uint64_t)CFSTR("isPackageSectionBatch"));
  objc_msgSend_componentsJoinedByString_(v3, v23, (uint64_t)CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetBatch *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSArray)assetRecords
{
  return self->_assetRecords;
}

- (CKDAssetZone)assetZone
{
  return self->_assetZone;
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authPutRequest, a3);
}

- (NSData)authPutResponse
{
  return self->_authPutResponse;
}

- (void)setAuthPutResponse:(id)a3
{
  objc_storeStrong((id *)&self->_authPutResponse, a3);
}

- (NSDictionary)authPutResponseHeaders
{
  return self->_authPutResponseHeaders;
}

- (void)setAuthPutResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_authPutResponseHeaders, a3);
}

- (BOOL)isFailed
{
  return self->_isFailed;
}

- (void)setIsFailed:(BOOL)a3
{
  self->_isFailed = a3;
}

- (CKDAssetTokenRequest)assetTokenRequest
{
  return (CKDAssetTokenRequest *)objc_loadWeakRetained((id *)&self->_assetTokenRequest);
}

- (void)setAssetTokenRequest:(id)a3
{
  objc_storeWeak((id *)&self->_assetTokenRequest, a3);
}

- (BOOL)useMMCSEncryptionV2
{
  return self->_useMMCSEncryptionV2;
}

- (void)setUseMMCSEncryptionV2:(BOOL)a3
{
  self->_useMMCSEncryptionV2 = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetTokenRequest);
  objc_storeStrong((id *)&self->_authPutResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authPutResponse, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_assetZone, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
}

@end
