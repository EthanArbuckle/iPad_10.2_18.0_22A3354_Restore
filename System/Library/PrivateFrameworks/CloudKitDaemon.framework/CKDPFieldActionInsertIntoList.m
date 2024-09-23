@implementation CKDPFieldActionInsertIntoList

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (void)setInsertAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_insertAfter = a3;
}

- (void)setHasInsertAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInsertAfter
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_values, a2, v2);
}

- (void)addValue:(id)a3
{
  const char *v4;
  NSMutableArray *values;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  values = self->_values;
  v8 = (char *)v4;
  if (!values)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_values;
    self->_values = v6;

    v4 = v8;
    values = self->_values;
  }
  objc_msgSend_addObject_(values, v4, (uint64_t)v4);

}

- (unint64_t)valuesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_values, a2, v2);
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_values, a2, a3);
}

+ (Class)valueType
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
  v11.super_class = (Class)CKDPFieldActionInsertIntoList;
  -[CKDPFieldActionInsertIntoList description](&v11, sel_description);
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
  CKDPListPosition *position;
  void *v8;
  const char *v9;
  void *v10;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  position = self->_position;
  if (position)
  {
    objc_msgSend_dictionaryRepresentation(position, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("position"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_insertAfter);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("insert_after"));

  }
  if (objc_msgSend_count(self->_values, v4, v5))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = objc_msgSend_count(self->_values, v13, v14);
    v17 = (void *)objc_msgSend_initWithCapacity_(v12, v16, v15);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = self->_values;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v30, v34, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v18);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v21, v22, (_QWORD)v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);

        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v30, v34, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, CFSTR("value"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAB6878((uint64_t)self, (uint64_t)a3);
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
  if (self->_position)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_values;
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
  _BYTE *v4;
  const char *v5;
  CKDPListPosition *position;
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
  _BYTE *v17;

  v4 = a3;
  position = self->_position;
  v17 = v4;
  if (position)
  {
    objc_msgSend_setPosition_(v4, v5, (uint64_t)position);
    v4 = v17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_insertAfter;
    v4[28] |= 1u;
  }
  if (objc_msgSend_valuesCount(self, v5, (uint64_t)position))
  {
    objc_msgSend_clearValues(v17, v7, v8);
    v11 = objc_msgSend_valuesCount(self, v9, v10);
    if (v11)
    {
      v13 = v11;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_valueAtIndex_(self, v12, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addValue_(v17, v16, (uint64_t)v15);

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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_position, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_insertAfter;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_values;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * i), v17, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addValue_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPListPosition *position;
  uint64_t v9;
  char isEqual;
  NSMutableArray *values;
  uint64_t v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  position = self->_position;
  v9 = v4[1];
  if ((unint64_t)position | v9)
  {
    if (!objc_msgSend_isEqual_(position, v7, v9))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_insertAfter)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    isEqual = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  values = self->_values;
  v13 = v4[2];
  if ((unint64_t)values | v13)
    isEqual = objc_msgSend_isEqual_(values, v7, v13);
  else
    isEqual = 1;
LABEL_9:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend_hash(self->_position, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_insertAfter;
  else
    v7 = 0;
  return v7 ^ objc_msgSend_hash(self->_values, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPListPosition *position;
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
  position = self->_position;
  v7 = *((_QWORD *)v5 + 1);
  if (position)
  {
    if (v7)
      objc_msgSend_mergeFrom_(position, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setPosition_(self, v4, v7);
  }
  if ((*((_BYTE *)v5 + 28) & 1) != 0)
  {
    self->_insertAfter = *((_BYTE *)v5 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *((id *)v5 + 2);
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
        objc_msgSend_addValue_(self, v11, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }

}

- (CKDPListPosition)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
  objc_storeStrong((id *)&self->_position, a3);
}

- (BOOL)insertAfter
{
  return self->_insertAfter;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

@end
