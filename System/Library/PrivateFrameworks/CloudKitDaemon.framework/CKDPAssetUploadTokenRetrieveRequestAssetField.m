@implementation CKDPAssetUploadTokenRetrieveRequestAssetField

- (BOOL)hasField
{
  return self->_field != 0;
}

- (void)clearAssets
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_assets, a2, v2);
}

- (void)addAssets:(id)a3
{
  const char *v4;
  NSMutableArray *assets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  assets = self->_assets;
  v8 = (char *)v4;
  if (!assets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assets;
    self->_assets = v6;

    v4 = v8;
    assets = self->_assets;
  }
  objc_msgSend_addObject_(assets, v4, (uint64_t)v4);

}

- (unint64_t)assetsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_assets, a2, v2);
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assets, a2, a3);
}

+ (Class)assetsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveRequestAssetField;
  -[CKDPAssetUploadTokenRetrieveRequestAssetField description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPRecordFieldIdentifier *field;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  NSMutableArray *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  field = self->_field;
  if (field)
  {
    objc_msgSend_dictionaryRepresentation(field, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("field"));

  }
  if (objc_msgSend_count(self->_assets, v4, v5))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_count(self->_assets, v11, v12);
    v15 = (void *)objc_msgSend_initWithCapacity_(v10, v14, v13);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = self->_assets;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, v32, 16);
    if (v18)
    {
      v21 = v18;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v16);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v19, v20, (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v15, v25, (uint64_t)v24);

        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v28, v32, 16);
      }
      while (v21);
    }

    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v15, CFSTR("assets"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB37558((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_field)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_assets;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPRecordFieldIdentifier *field;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  field = self->_field;
  if (field)
    objc_msgSend_setField_(v16, v4, (uint64_t)field);
  if (objc_msgSend_assetsCount(self, v4, (uint64_t)field))
  {
    objc_msgSend_clearAssets(v16, v6, v7);
    v10 = objc_msgSend_assetsCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_assetsAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAssets_(v16, v15, (uint64_t)v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_field, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_assets;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addAssets_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordFieldIdentifier *field;
  uint64_t v9;
  NSMutableArray *assets;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((field = self->_field, v9 = v4[2], !((unint64_t)field | v9))
     || objc_msgSend_isEqual_(field, v7, v9)))
  {
    assets = self->_assets;
    v11 = v4[1];
    if ((unint64_t)assets | v11)
      isEqual = objc_msgSend_isEqual_(assets, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_field, a2, v2);
  return objc_msgSend_hash(self->_assets, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordFieldIdentifier *field;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  field = self->_field;
  v7 = *((_QWORD *)v5 + 2);
  if (field)
  {
    if (v7)
      objc_msgSend_mergeFrom_(field, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setField_(self, v4, v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *((id *)v5 + 1);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addAssets_(self, v11, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }

}

- (CKDPRecordFieldIdentifier)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
