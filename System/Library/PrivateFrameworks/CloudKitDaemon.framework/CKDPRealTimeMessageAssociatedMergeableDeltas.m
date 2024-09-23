@implementation CKDPRealTimeMessageAssociatedMergeableDeltas

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasFieldIdentifier
{
  return self->_fieldIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearMergeableDeltas
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_mergeableDeltas, a2, v2);
}

- (void)addMergeableDeltas:(id)a3
{
  const char *v4;
  NSMutableArray *mergeableDeltas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  mergeableDeltas = self->_mergeableDeltas;
  v8 = (char *)v4;
  if (!mergeableDeltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_mergeableDeltas;
    self->_mergeableDeltas = v6;

    v4 = v8;
    mergeableDeltas = self->_mergeableDeltas;
  }
  objc_msgSend_addObject_(mergeableDeltas, v4, (uint64_t)v4);

}

- (unint64_t)mergeableDeltasCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_mergeableDeltas, a2, v2);
}

- (id)mergeableDeltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_mergeableDeltas, a2, a3);
}

+ (Class)mergeableDeltasType
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
  v11.super_class = (Class)CKDPRealTimeMessageAssociatedMergeableDeltas;
  -[CKDPRealTimeMessageAssociatedMergeableDeltas description](&v11, sel_description);
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
  CKDPRecordIdentifier *recordIdentifier;
  void *v8;
  const char *v9;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  void *v11;
  const char *v12;
  CKDPMergeableValueIdentifier *identifier;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  NSMutableArray *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  const char *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("record_identifier"));

  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(fieldIdentifier, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("field_identifier"));

  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("identifier"));

  }
  if (objc_msgSend_count(self->_mergeableDeltas, v4, v5))
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v19 = objc_msgSend_count(self->_mergeableDeltas, v17, v18);
    v21 = (void *)objc_msgSend_initWithCapacity_(v16, v20, v19);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = self->_mergeableDeltas;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v34, v38, 16);
    if (v24)
    {
      v27 = v24;
      v28 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v22);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i), v25, v26, (_QWORD)v34);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v21, v31, (uint64_t)v30);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v34, v38, 16);
      }
      while (v27);
    }

    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v21, CFSTR("mergeable_deltas"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEABA960((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_recordIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_fieldIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_identifier)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_mergeableDeltas;
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
  CKDPRecordIdentifier *recordIdentifier;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  CKDPMergeableValueIdentifier *identifier;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
    objc_msgSend_setRecordIdentifier_(v18, v4, (uint64_t)recordIdentifier);
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
    objc_msgSend_setFieldIdentifier_(v18, v4, (uint64_t)fieldIdentifier);
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setIdentifier_(v18, v4, (uint64_t)identifier);
  if (objc_msgSend_mergeableDeltasCount(self, v4, (uint64_t)identifier))
  {
    objc_msgSend_clearMergeableDeltas(v18, v8, v9);
    v12 = objc_msgSend_mergeableDeltasCount(self, v10, v11);
    if (v12)
    {
      v14 = v12;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_mergeableDeltasAtIndex_(self, v13, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addMergeableDeltas_(v18, v17, (uint64_t)v16);

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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fieldIdentifier, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_identifier, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_mergeableDeltas;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v34, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v20);
        v27 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (_QWORD)v30);
        objc_msgSend_addMergeableDeltas_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v34, 16);
    }
    while (v24);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v9;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  uint64_t v11;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v13;
  NSMutableArray *mergeableDeltas;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordIdentifier = self->_recordIdentifier, v9 = v4[4], !((unint64_t)recordIdentifier | v9))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v9))
    && ((fieldIdentifier = self->_fieldIdentifier, v11 = v4[1], !((unint64_t)fieldIdentifier | v11))
     || objc_msgSend_isEqual_(fieldIdentifier, v7, v11))
    && ((identifier = self->_identifier, v13 = v4[2], !((unint64_t)identifier | v13))
     || objc_msgSend_isEqual_(identifier, v7, v13)))
  {
    mergeableDeltas = self->_mergeableDeltas;
    v15 = v4[3];
    if ((unint64_t)mergeableDeltas | v15)
      isEqual = objc_msgSend_isEqual_(mergeableDeltas, v7, v15);
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_fieldIdentifier, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_identifier, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_mergeableDeltas, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v7;
  CKDPRecordFieldIdentifier *fieldIdentifier;
  uint64_t v9;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  recordIdentifier = self->_recordIdentifier;
  v7 = *((_QWORD *)v5 + 4);
  if (recordIdentifier)
  {
    if (v7)
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v7);
  }
  fieldIdentifier = self->_fieldIdentifier;
  v9 = *((_QWORD *)v5 + 1);
  if (fieldIdentifier)
  {
    if (v9)
      objc_msgSend_mergeFrom_(fieldIdentifier, v4, v9);
  }
  else if (v9)
  {
    objc_msgSend_setFieldIdentifier_(self, v4, v9);
  }
  identifier = self->_identifier;
  v11 = *((_QWORD *)v5 + 2);
  if (identifier)
  {
    if (v11)
      objc_msgSend_mergeFrom_(identifier, v4, v11);
  }
  else if (v11)
  {
    objc_msgSend_setIdentifier_(self, v4, v11);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = *((id *)v5 + 3);
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend_addMergeableDeltas_(self, v15, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v19, v23, 16);
    }
    while (v16);
  }

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

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableArray)mergeableDeltas
{
  return self->_mergeableDeltas;
}

- (void)setMergeableDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_mergeableDeltas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
}

@end
