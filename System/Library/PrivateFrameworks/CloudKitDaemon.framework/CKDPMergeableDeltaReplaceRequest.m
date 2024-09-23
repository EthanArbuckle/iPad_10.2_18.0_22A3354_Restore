@implementation CKDPMergeableDeltaReplaceRequest

+ (id)options
{
  if (qword_1ED700990 != -1)
    dispatch_once(&qword_1ED700990, &unk_1E78333B8);
  return (id)qword_1ED700988;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearDeltaIdentifiers
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_deltaIdentifiers, a2, v2);
}

- (void)addDeltaIdentifiers:(id)a3
{
  const char *v4;
  NSMutableArray *deltaIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  deltaIdentifiers = self->_deltaIdentifiers;
  v8 = (char *)v4;
  if (!deltaIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deltaIdentifiers;
    self->_deltaIdentifiers = v6;

    v4 = v8;
    deltaIdentifiers = self->_deltaIdentifiers;
  }
  objc_msgSend_addObject_(deltaIdentifiers, v4, (uint64_t)v4);

}

- (unint64_t)deltaIdentifiersCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_deltaIdentifiers, a2, v2);
}

- (id)deltaIdentifiersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deltaIdentifiers, a2, a3);
}

+ (Class)deltaIdentifiersType
{
  return (Class)objc_opt_class();
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

- (void)setIgnoreMissingDeltas:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ignoreMissingDeltas = a3;
}

- (void)setHasIgnoreMissingDeltas:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIgnoreMissingDeltas
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setContainsNewData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containsNewData = a3;
}

- (void)setHasContainsNewData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsNewData
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPMergeableDeltaReplaceRequest;
  -[CKDPMergeableDeltaReplaceRequest description](&v11, sel_description);
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
  NSMutableArray *deltaIdentifiers;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  const char *v28;
  char has;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  deltaIdentifiers = self->_deltaIdentifiers;
  if (deltaIdentifiers)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)deltaIdentifiers, CFSTR("deltaIdentifiers"));
  if (objc_msgSend_count(self->_deltas, v4, (uint64_t)deltaIdentifiers))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = objc_msgSend_count(self->_deltas, v13, v14);
    v17 = (void *)objc_msgSend_initWithCapacity_(v12, v16, v15);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = self->_deltas;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v35, v39, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v18);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i), v21, v22, (_QWORD)v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);

        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v35, v39, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, CFSTR("deltas"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v11, self->_ignoreMissingDeltas);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, CFSTR("ignoreMissingDeltas"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v11, self->_containsNewData);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, CFSTR("containsNewData"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAF5E28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const char *v18;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteSubmessage();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_deltaIdentifiers;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_deltas;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v20, v28, 16);
    }
    while (v15);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (unsigned)requestTypeCode
{
  return 76;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPMergeableValueIdentifier *identifier;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const char *v24;
  char has;
  _BYTE *v26;

  v26 = a3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setIdentifier_(v26, v4, (uint64_t)identifier);
  if (objc_msgSend_deltaIdentifiersCount(self, v4, (uint64_t)identifier))
  {
    objc_msgSend_clearDeltaIdentifiers(v26, v6, v7);
    v10 = objc_msgSend_deltaIdentifiersCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_deltaIdentifiersAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addDeltaIdentifiers_(v26, v14, (uint64_t)v13);

      }
    }
  }
  if (objc_msgSend_deltasCount(self, v6, v7))
  {
    objc_msgSend_clearDeltas(v26, v15, v16);
    v19 = objc_msgSend_deltasCount(self, v17, v18);
    if (v19)
    {
      v21 = v19;
      for (j = 0; j != v21; ++j)
      {
        objc_msgSend_deltasAtIndex_(self, v20, j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addDeltas_(v26, v24, (uint64_t)v23);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v26[33] = self->_ignoreMissingDeltas;
    v26[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v26[32] = self->_containsNewData;
    v26[36] |= 1u;
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
  NSMutableArray *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const char *v31;
  char has;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = self->_deltaIdentifiers;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v38, v43, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v38 + 1) + 8 * i), v17, (uint64_t)a3);
        objc_msgSend_addDeltaIdentifiers_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v38, v43, 16);
    }
    while (v18);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = self->_deltas;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v34, v42, 16);
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v23);
        v30 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v34 + 1) + 8 * j), v26, (uint64_t)a3, (_QWORD)v34);
        objc_msgSend_addDeltas_((void *)v10, v31, (uint64_t)v30);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v34, v42, 16);
    }
    while (v27);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 33) = self->_ignoreMissingDeltas;
    *(_BYTE *)(v10 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_containsNewData;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v9;
  NSMutableArray *deltaIdentifiers;
  uint64_t v11;
  NSMutableArray *deltas;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_18;
  identifier = self->_identifier;
  v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9))
      goto LABEL_18;
  }
  deltaIdentifiers = self->_deltaIdentifiers;
  v11 = v4[1];
  if ((unint64_t)deltaIdentifiers | v11)
  {
    if (!objc_msgSend_isEqual_(deltaIdentifiers, v7, v11))
      goto LABEL_18;
  }
  deltas = self->_deltas;
  v13 = v4[2];
  if ((unint64_t)deltas | v13)
  {
    if (!objc_msgSend_isEqual_(deltas, v7, v13))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_18;
    if (self->_ignoreMissingDeltas)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  v14 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0)
    {
      if (self->_containsNewData)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_18;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_18;
      }
      v14 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v14 = 0;
  }
LABEL_19:

  return v14;
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
  uint64_t v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  v7 = objc_msgSend_hash(self->_deltaIdentifiers, v5, v6);
  v10 = objc_msgSend_hash(self->_deltas, v8, v9);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_ignoreMissingDeltas;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v12 = 2654435761 * self->_containsNewData;
  return v7 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = *((id *)v5 + 1);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, v32, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addDeltaIdentifiers_(self, v11, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *((id *)v5 + 2);
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, v31, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_addDeltas_(self, v18, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v23, v31, 16);
    }
    while (v19);
  }

  v22 = *((_BYTE *)v5 + 36);
  if ((v22 & 2) != 0)
  {
    self->_ignoreMissingDeltas = *((_BYTE *)v5 + 33);
    *(_BYTE *)&self->_has |= 2u;
    v22 = *((_BYTE *)v5 + 36);
  }
  if ((v22 & 1) != 0)
  {
    self->_containsNewData = *((_BYTE *)v5 + 32);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSMutableArray)deltaIdentifiers
{
  return self->_deltaIdentifiers;
}

- (void)setDeltaIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deltaIdentifiers, a3);
}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_deltas, a3);
}

- (BOOL)ignoreMissingDeltas
{
  return self->_ignoreMissingDeltas;
}

- (BOOL)containsNewData
{
  return self->_containsNewData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong((id *)&self->_deltaIdentifiers, 0);
}

@end
