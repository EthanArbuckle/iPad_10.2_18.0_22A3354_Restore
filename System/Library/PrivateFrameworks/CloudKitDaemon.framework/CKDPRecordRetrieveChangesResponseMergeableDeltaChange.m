@implementation CKDPRecordRetrieveChangesResponseMergeableDeltaChange

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasFieldIdentifier
{
  return self->_fieldIdentifier != 0;
}

- (void)clearDeltas
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_deltas, a2, v2);
}

- (void)addDeltas:(id)a3
{
  const char *v4;
  NSMutableArray *deltas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  deltas = self->_deltas;
  v8 = (char *)v4;
  if (!deltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deltas;
    self->_deltas = v6;

    v4 = v8;
    deltas = self->_deltas;
  }
  objc_msgSend_addObject_(deltas, v4, (uint64_t)v4);

}

- (unint64_t)deltasCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_deltas, a2, v2);
}

- (id)deltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deltas, a2, a3);
}

+ (Class)deltasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseMergeableDeltaChange;
  -[CKDPRecordRetrieveChangesResponseMergeableDeltaChange description](&v11, sel_description);
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
  CKDPMergeableValueIdentifier *identifier;
  void *v8;
  const char *v9;
  CKDPRecordIdentifier *recordIdentifier;
  void *v11;
  const char *v12;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSMutableArray *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  const char *v33;
  const char *v34;
  CKDPRecordType *recordType;
  void *v36;
  const char *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("recordIdentifier"));

  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(fieldIdentifier, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("fieldIdentifier"));

  }
  if (objc_msgSend_count(self->_deltas, v4, v5))
  {
    v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v21 = objc_msgSend_count(self->_deltas, v19, v20);
    v23 = (void *)objc_msgSend_initWithCapacity_(v18, v22, v21);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = self->_deltas;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v39, v43, 16);
    if (v26)
    {
      v29 = v26;
      v30 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v24);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v39 + 1) + 8 * i), v27, v28, (_QWORD)v39);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v23, v33, (uint64_t)v32);

        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v39, v43, 16);
      }
      while (v29);
    }

    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v23, CFSTR("deltas"));
  }
  recordType = self->_recordType;
  if (recordType)
  {
    objc_msgSend_dictionaryRepresentation(recordType, v16, v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, CFSTR("recordType"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA1EF64((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_identifier)
    PBDataWriterWriteSubmessage();
  if (self->_recordIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_fieldIdentifier)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_deltas;
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

  if (self->_recordType)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPMergeableValueIdentifier *identifier;
  CKDPRecordIdentifier *recordIdentifier;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  CKDPRecordType *recordType;
  id v18;

  v18 = a3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setIdentifier_(v18, v4, (uint64_t)identifier);
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
    objc_msgSend_setRecordIdentifier_(v18, v4, (uint64_t)recordIdentifier);
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
    objc_msgSend_setFieldIdentifier_(v18, v4, (uint64_t)fieldIdentifier);
  if (objc_msgSend_deltasCount(self, v4, (uint64_t)fieldIdentifier))
  {
    objc_msgSend_clearDeltas(v18, v8, v9);
    v12 = objc_msgSend_deltasCount(self, v10, v11);
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_deltasAtIndex_(self, v8, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addDeltas_(v18, v16, (uint64_t)v15);

      }
    }
  }
  recordType = self->_recordType;
  if (recordType)
    objc_msgSend_setRecordType_(v18, v8, (uint64_t)recordType);

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
  const char *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
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
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_fieldIdentifier, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = self->_deltas;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v33, v37, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v20);
        v27 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v26), v23, (uint64_t)a3, (_QWORD)v33);
        objc_msgSend_addDeltas_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v33, v37, 16);
    }
    while (v24);
  }

  v30 = objc_msgSend_copyWithZone_(self->_recordType, v29, (uint64_t)a3);
  v31 = (void *)v10[5];
  v10[5] = v30;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v9;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v11;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  uint64_t v13;
  NSMutableArray *deltas;
  uint64_t v15;
  CKDPRecordType *recordType;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  identifier = self->_identifier;
  v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9))
      goto LABEL_12;
  }
  if (((recordIdentifier = self->_recordIdentifier, v11 = v4[4], !((unint64_t)recordIdentifier | v11))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v11))
    && ((fieldIdentifier = self->_fieldIdentifier, v13 = v4[2], !((unint64_t)fieldIdentifier | v13))
     || objc_msgSend_isEqual_(fieldIdentifier, v7, v13))
    && ((deltas = self->_deltas, v15 = v4[1], !((unint64_t)deltas | v15))
     || objc_msgSend_isEqual_(deltas, v7, v15)))
  {
    recordType = self->_recordType;
    v17 = v4[5];
    if ((unint64_t)recordType | v17)
      isEqual = objc_msgSend_isEqual_(recordType, v7, v17);
    else
      isEqual = 1;
  }
  else
  {
LABEL_12:
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  v7 = objc_msgSend_hash(self->_recordIdentifier, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_fieldIdentifier, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_deltas, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_recordType, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v7;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v9;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  CKDPRecordType *recordType;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  identifier = self->_identifier;
  v7 = *((_QWORD *)v5 + 3);
  if (identifier)
  {
    if (v7)
      objc_msgSend_mergeFrom_(identifier, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setIdentifier_(self, v4, v7);
  }
  recordIdentifier = self->_recordIdentifier;
  v9 = *((_QWORD *)v5 + 4);
  if (recordIdentifier)
  {
    if (v9)
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v9);
  }
  else if (v9)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v9);
  }
  fieldIdentifier = self->_fieldIdentifier;
  v11 = *((_QWORD *)v5 + 2);
  if (fieldIdentifier)
  {
    if (v11)
      objc_msgSend_mergeFrom_(fieldIdentifier, v4, v11);
  }
  else if (v11)
  {
    objc_msgSend_setFieldIdentifier_(self, v4, v11);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = *((id *)v5 + 1);
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, v26, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend_addDeltas_(self, v15, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v22, v26, 16);
    }
    while (v16);
  }

  recordType = self->_recordType;
  v21 = *((_QWORD *)v5 + 5);
  if (recordType)
  {
    if (v21)
      objc_msgSend_mergeFrom_(recordType, v19, v21);
  }
  else if (v21)
  {
    objc_msgSend_setRecordType_(self, v19, v21);
  }

}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (CKDPRecordFieldIdentifier)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fieldIdentifier, a3);
}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_deltas, a3);
}

- (CKDPRecordType)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
}

@end
