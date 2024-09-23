@implementation CKDPConfiguration

- (void)clearFields
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fields, a2, v2);
}

- (void)addFields:(id)a3
{
  const char *v4;
  NSMutableArray *fields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fields = self->_fields;
  v8 = (char *)v4;
  if (!fields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fields;
    self->_fields = v6;

    v4 = v8;
    fields = self->_fields;
  }
  objc_msgSend_addObject_(fields, v4, (uint64_t)v4);

}

- (unint64_t)fieldsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fields, a2, v2);
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fields, a2, a3);
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (void)setCreated:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_created = a3;
}

- (void)setHasCreated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpires:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expires = a3;
}

- (void)setHasExpires:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpires
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v11.super_class = (Class)CKDPConfiguration;
  -[CKDPConfiguration description](&v11, sel_description);
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
  uint64_t v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  const char *v24;
  char has;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_fields, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_fields, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = self->_fields;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, v35, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v17, v18, (_QWORD)v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, v35, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("fields"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, self->_created);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, CFSTR("created"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, self->_expires);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v28, CFSTR("expires"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  CKDPConfigurationField *v19;
  const char *v20;
  char v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int v32;
  uint64_t v33;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_50;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        goto LABEL_50;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        v27 = 0;
        v28 = 0;
        v23 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v29 = *v4;
          v30 = *(_QWORD *)((char *)a3 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v30);
          *(_QWORD *)((char *)a3 + v29) = v30 + 1;
          v23 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
            goto LABEL_45;
          v27 += 7;
          v15 = v28++ >= 9;
          if (v15)
          {
            v23 = 0;
            goto LABEL_47;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_45:
        if (*((_BYTE *)a3 + *v6))
          v23 = 0;
LABEL_47:
        v33 = 8;
LABEL_48:
        *(Class *)((char *)&self->super.super.isa + v33) = (Class)v23;
        goto LABEL_49;
      }
      if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(CKDPConfigurationField);
        objc_msgSend_addFields_(self, v20, (uint64_t)v19);
        if (!PBReaderPlaceMark() || !sub_1BEA8AB98((uint64_t)v19, (uint64_t)a3))
        {

          LOBYTE(v32) = 0;
          return v32;
        }
        PBReaderRecallMark();

      }
      else
      {
        v32 = PBReaderSkipValueWithTag();
        if (!v32)
          return v32;
      }
LABEL_49:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_50;
    }
    v21 = 0;
    v22 = 0;
    v23 = 0;
    *(_BYTE *)&self->_has |= 2u;
    while (1)
    {
      v24 = *v4;
      v25 = *(_QWORD *)((char *)a3 + v24);
      if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
        break;
      v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
      *(_QWORD *)((char *)a3 + v24) = v25 + 1;
      v23 |= (unint64_t)(v26 & 0x7F) << v21;
      if ((v26 & 0x80) == 0)
        goto LABEL_41;
      v21 += 7;
      v15 = v22++ >= 9;
      if (v15)
      {
        v23 = 0;
        goto LABEL_43;
      }
    }
    *((_BYTE *)a3 + *v6) = 1;
LABEL_41:
    if (*((_BYTE *)a3 + *v6))
      v23 = 0;
LABEL_43:
    v33 = 16;
    goto LABEL_48;
  }
LABEL_50:
  LOBYTE(v32) = *((_BYTE *)a3 + *v6) == 0;
  return v32;
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
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_fields;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, v17, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
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
  char has;
  id v17;

  v17 = a3;
  if (objc_msgSend_fieldsCount(self, v4, v5))
  {
    objc_msgSend_clearFields(v17, v6, v7);
    v10 = objc_msgSend_fieldsCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_fieldsAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFields_(v17, v15, (uint64_t)v14);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v17 + 1) = self->_created;
    *((_BYTE *)v17 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v17 + 2) = self->_expires;
    *((_BYTE *)v17 + 32) |= 2u;
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
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  char has;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_fields;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i), v14, (uint64_t)a3, (_QWORD)v22);
        objc_msgSend_addFields_((void *)v10, v19, (uint64_t)v18);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
    }
    while (v15);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_created;
    *(_BYTE *)(v10 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v10 + 16) = self->_expires;
    *(_BYTE *)(v10 + 32) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *fields;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  fields = self->_fields;
  v9 = v4[3];
  if ((unint64_t)fields | v9)
  {
    if (!objc_msgSend_isEqual_(fields, v7, v9))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_created != v4[1])
      goto LABEL_13;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v10 = (v4[4] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_expires != v4[2])
      goto LABEL_13;
    v10 = 1;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = objc_msgSend_hash(self->_fields, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_created;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761u * self->_expires;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v4 + 3);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addFields_(self, v8, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v4 + 32);
  if ((v12 & 1) != 0)
  {
    self->_created = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v12 = *((_BYTE *)v4 + 32);
  }
  if ((v12 & 2) != 0)
  {
    self->_expires = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (unint64_t)created
{
  return self->_created;
}

- (unint64_t)expires
{
  return self->_expires;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
}

@end
