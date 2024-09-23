@implementation CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)clearAssetFields
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_assetFields, a2, v2);
}

- (void)addAssetFields:(id)a3
{
  const char *v4;
  NSMutableArray *assetFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  assetFields = self->_assetFields;
  v8 = (char *)v4;
  if (!assetFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assetFields;
    self->_assetFields = v6;

    v4 = v8;
    assetFields = self->_assetFields;
  }
  objc_msgSend_addObject_(assetFields, v4, (uint64_t)v4);

}

- (unint64_t)assetFieldsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_assetFields, a2, v2);
}

- (id)assetFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assetFields, a2, a3);
}

+ (Class)assetFieldsType
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
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload;
  -[CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload description](&v11, sel_description);
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
  CKDPRecordIdentifier *recordId;
  void *v8;
  const char *v9;
  CKDPRecordType *type;
  void *v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  const char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordId = self->_recordId;
  if (recordId)
  {
    objc_msgSend_dictionaryRepresentation(recordId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("recordId"));

  }
  type = self->_type;
  if (type)
  {
    objc_msgSend_dictionaryRepresentation(type, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("type"));

  }
  if (objc_msgSend_count(self->_assetFields, v4, v5))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_assetFields, v14, v15);
    v18 = (void *)objc_msgSend_initWithCapacity_(v13, v17, v16);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = self->_assetFields;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, v35, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v19);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v22, v23, (_QWORD)v31);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v31, v35, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, CFSTR("assetFields"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEADBFC8((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_recordId)
    PBDataWriterWriteSubmessage();
  if (self->_type)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_assetFields;
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
  CKDPRecordIdentifier *recordId;
  CKDPRecordType *type;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  recordId = self->_recordId;
  if (recordId)
    objc_msgSend_setRecordId_(v17, v4, (uint64_t)recordId);
  type = self->_type;
  if (type)
    objc_msgSend_setType_(v17, v4, (uint64_t)type);
  if (objc_msgSend_assetFieldsCount(self, v4, (uint64_t)type))
  {
    objc_msgSend_clearAssetFields(v17, v7, v8);
    v11 = objc_msgSend_assetFieldsCount(self, v9, v10);
    if (v11)
    {
      v13 = v11;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_assetFieldsAtIndex_(self, v12, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAssetFields_(v17, v16, (uint64_t)v15);

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
  const char *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_recordId, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_type, v14, (uint64_t)a3);
  v16 = (void *)v10[3];
  v10[3] = v15;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_assetFields;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v23), v20, (uint64_t)a3, (_QWORD)v27);
        objc_msgSend_addAssetFields_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *recordId;
  uint64_t v9;
  CKDPRecordType *type;
  uint64_t v11;
  NSMutableArray *assetFields;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordId = self->_recordId, v9 = v4[2], !((unint64_t)recordId | v9))
     || objc_msgSend_isEqual_(recordId, v7, v9))
    && ((type = self->_type, v11 = v4[3], !((unint64_t)type | v11))
     || objc_msgSend_isEqual_(type, v7, v11)))
  {
    assetFields = self->_assetFields;
    v13 = v4[1];
    if ((unint64_t)assetFields | v13)
      isEqual = objc_msgSend_isEqual_(assetFields, v7, v13);
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
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_recordId, a2, v2);
  v7 = objc_msgSend_hash(self->_type, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_assetFields, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordIdentifier *recordId;
  uint64_t v7;
  CKDPRecordType *type;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  recordId = self->_recordId;
  v7 = *((_QWORD *)v5 + 2);
  if (recordId)
  {
    if (v7)
      objc_msgSend_mergeFrom_(recordId, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setRecordId_(self, v4, v7);
  }
  type = self->_type;
  v9 = *((_QWORD *)v5 + 3);
  if (type)
  {
    if (v9)
      objc_msgSend_mergeFrom_(type, v4, v9);
  }
  else if (v9)
  {
    objc_msgSend_setType_(self, v4, v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *((id *)v5 + 1);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v17, v21, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_addAssetFields_(self, v13, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v17, v21, 16);
    }
    while (v14);
  }

}

- (CKDPRecordIdentifier)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
  objc_storeStrong((id *)&self->_recordId, a3);
}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSMutableArray)assetFields
{
  return self->_assetFields;
}

- (void)setAssetFields:(id)a3
{
  objc_storeStrong((id *)&self->_assetFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_assetFields, 0);
}

@end
