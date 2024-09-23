@implementation CKDPRecordResolveTokenResponse

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (int)containerEnvironment
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_containerEnvironment;
  else
    return 2;
}

- (void)setContainerEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containerEnvironment = a3;
}

- (void)setHasContainerEnvironment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerEnvironment
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)containerEnvironmentAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("production");
  if (a3 == 2)
  {
    v3 = CFSTR("sandbox");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsContainerEnvironment:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("production")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("sandbox")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (void)clearRecords
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_records, a2, v2);
}

- (void)addRecord:(id)a3
{
  const char *v4;
  NSMutableArray *records;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  records = self->_records;
  v8 = (char *)v4;
  if (!records)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_records;
    self->_records = v6;

    v4 = v8;
    records = self->_records;
  }
  objc_msgSend_addObject_(records, v4, (uint64_t)v4);

}

- (unint64_t)recordsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_records, a2, v2);
}

- (id)recordAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_records, a2, a3);
}

+ (Class)recordType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareRecord
{
  return self->_shareRecord != 0;
}

- (BOOL)hasShareMetadata
{
  return self->_shareMetadata != 0;
}

- (BOOL)hasRecordZone
{
  return self->_recordZone != 0;
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
  v11.super_class = (Class)CKDPRecordResolveTokenResponse;
  -[CKDPRecordResolveTokenResponse description](&v11, sel_description);
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
  void *v4;
  const char *v5;
  void *v6;
  NSString *container;
  int containerEnvironment;
  __CFString *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
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
  CKDPRecord *shareRecord;
  void *v31;
  const char *v32;
  CKDPShareMetadata *shareMetadata;
  void *v34;
  const char *v35;
  CKDPZone *recordZone;
  void *v37;
  const char *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  container = self->_container;
  if (container)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)container, CFSTR("container"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    containerEnvironment = self->_containerEnvironment;
    if (containerEnvironment == 1)
    {
      v9 = CFSTR("production");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("containerEnvironment"));
    }
    else if (containerEnvironment == 2)
    {
      v9 = CFSTR("sandbox");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sandbox"), CFSTR("containerEnvironment"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_containerEnvironment);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("containerEnvironment"));
    }

  }
  if (objc_msgSend_count(self->_records, v5, (uint64_t)container))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_records, v14, v15);
    v18 = (void *)objc_msgSend_initWithCapacity_(v13, v17, v16);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = self->_records;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v40, v44, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v19);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v40 + 1) + 8 * i), v22, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v40, v44, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, CFSTR("record"));
  }
  shareRecord = self->_shareRecord;
  if (shareRecord)
  {
    objc_msgSend_dictionaryRepresentation(shareRecord, v11, v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, CFSTR("shareRecord"));

  }
  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    objc_msgSend_dictionaryRepresentation(shareMetadata, v11, v12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, CFSTR("shareMetadata"));

  }
  recordZone = self->_recordZone;
  if (recordZone)
  {
    objc_msgSend_dictionaryRepresentation(recordZone, v11, v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v37, CFSTR("recordZone"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA09E10((uint64_t)self, (uint64_t)a3);
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
  if (self->_container)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_records;
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

  if (self->_shareRecord)
    PBDataWriterWriteSubmessage();
  if (self->_shareMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_recordZone)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *container;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  CKDPRecord *shareRecord;
  CKDPShareMetadata *shareMetadata;
  void *v18;
  CKDPZone *recordZone;
  id v20;

  v4 = a3;
  container = self->_container;
  v20 = v4;
  if (container)
  {
    objc_msgSend_setContainer_(v4, v5, (uint64_t)container);
    v4 = v20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_containerEnvironment;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (objc_msgSend_recordsCount(self, v5, (uint64_t)container))
  {
    objc_msgSend_clearRecords(v20, v7, v8);
    v11 = objc_msgSend_recordsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_recordAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addRecord_(v20, v15, (uint64_t)v14);

      }
    }
  }
  shareRecord = self->_shareRecord;
  if (shareRecord)
    objc_msgSend_setShareRecord_(v20, v7, (uint64_t)shareRecord);
  shareMetadata = self->_shareMetadata;
  v18 = v20;
  if (shareMetadata)
  {
    objc_msgSend_setShareMetadata_(v20, v7, (uint64_t)shareMetadata);
    v18 = v20;
  }
  recordZone = self->_recordZone;
  if (recordZone)
  {
    objc_msgSend_setRecordZone_(v20, v7, (uint64_t)recordZone);
    v18 = v20;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_container, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_containerEnvironment;
    *(_BYTE *)(v10 + 56) |= 1u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->_records;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v33, v37, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i), v17, (uint64_t)a3, (_QWORD)v33);
        objc_msgSend_addRecord_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v33, v37, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend_copyWithZone_(self->_shareRecord, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v24;

  v27 = objc_msgSend_copyWithZone_(self->_shareMetadata, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v27;

  v30 = objc_msgSend_copyWithZone_(self->_recordZone, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v30;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *container;
  uint64_t v9;
  NSMutableArray *records;
  uint64_t v11;
  CKDPRecord *shareRecord;
  uint64_t v13;
  CKDPShareMetadata *shareMetadata;
  uint64_t v15;
  CKDPZone *recordZone;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_17;
  container = self->_container;
  v9 = v4[1];
  if ((unint64_t)container | v9)
  {
    if (!objc_msgSend_isEqual_(container, v7, v9))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[7] & 1) == 0 || self->_containerEnvironment != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((v4[7] & 1) != 0)
  {
LABEL_17:
    isEqual = 0;
    goto LABEL_18;
  }
  records = self->_records;
  v11 = v4[4];
  if ((unint64_t)records | v11 && !objc_msgSend_isEqual_(records, v7, v11))
    goto LABEL_17;
  shareRecord = self->_shareRecord;
  v13 = v4[6];
  if ((unint64_t)shareRecord | v13)
  {
    if (!objc_msgSend_isEqual_(shareRecord, v7, v13))
      goto LABEL_17;
  }
  shareMetadata = self->_shareMetadata;
  v15 = v4[5];
  if ((unint64_t)shareMetadata | v15)
  {
    if (!objc_msgSend_isEqual_(shareMetadata, v7, v15))
      goto LABEL_17;
  }
  recordZone = self->_recordZone;
  v17 = v4[3];
  if ((unint64_t)recordZone | v17)
    isEqual = objc_msgSend_isEqual_(recordZone, v7, v17);
  else
    isEqual = 1;
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  v4 = objc_msgSend_hash(self->_container, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_containerEnvironment;
  else
    v7 = 0;
  v8 = v7 ^ v4;
  v9 = objc_msgSend_hash(self->_records, v5, v6);
  v12 = v8 ^ v9 ^ objc_msgSend_hash(self->_shareRecord, v10, v11);
  v15 = objc_msgSend_hash(self->_shareMetadata, v13, v14);
  return v12 ^ v15 ^ objc_msgSend_hash(self->_recordZone, v16, v17);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  CKDPRecord *shareRecord;
  uint64_t v16;
  CKDPShareMetadata *shareMetadata;
  uint64_t v18;
  CKDPZone *recordZone;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 1);
  if (v6)
    objc_msgSend_setContainer_(self, v4, v6);
  if ((*((_BYTE *)v5 + 56) & 1) != 0)
  {
    self->_containerEnvironment = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v5 + 4);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, v25, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_addRecord_(self, v10, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, v25, 16);
    }
    while (v11);
  }

  shareRecord = self->_shareRecord;
  v16 = *((_QWORD *)v5 + 6);
  if (shareRecord)
  {
    if (v16)
      objc_msgSend_mergeFrom_(shareRecord, v14, v16);
  }
  else if (v16)
  {
    objc_msgSend_setShareRecord_(self, v14, v16);
  }
  shareMetadata = self->_shareMetadata;
  v18 = *((_QWORD *)v5 + 5);
  if (shareMetadata)
  {
    if (v18)
      objc_msgSend_mergeFrom_(shareMetadata, v14, v18);
  }
  else if (v18)
  {
    objc_msgSend_setShareMetadata_(self, v14, v18);
  }
  recordZone = self->_recordZone;
  v20 = *((_QWORD *)v5 + 3);
  if (recordZone)
  {
    if (v20)
      objc_msgSend_mergeFrom_(recordZone, v14, v20);
  }
  else if (v20)
  {
    objc_msgSend_setRecordZone_(self, v14, v20);
  }

}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (CKDPRecord)shareRecord
{
  return self->_shareRecord;
}

- (void)setShareRecord:(id)a3
{
  objc_storeStrong((id *)&self->_shareRecord, a3);
}

- (CKDPShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadata, a3);
}

- (CKDPZone)recordZone
{
  return self->_recordZone;
}

- (void)setRecordZone:(id)a3
{
  objc_storeStrong((id *)&self->_recordZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRecord, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
