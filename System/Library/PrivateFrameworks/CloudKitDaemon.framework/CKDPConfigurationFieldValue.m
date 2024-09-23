@implementation CKDPConfigurationFieldValue

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1E78367A0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("bytesType")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("BOOLType")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("longType")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("doubleType")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("stringType")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("fieldType")) & 1) != 0)
  {
    v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("listType")))
  {
    v6 = 7;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLongValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_longValue = a3;
}

- (void)setHasLongValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)clearFieldValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fieldValues, a2, v2);
}

- (void)addFieldValues:(id)a3
{
  const char *v4;
  NSMutableArray *fieldValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fieldValues = self->_fieldValues;
  v8 = (char *)v4;
  if (!fieldValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fieldValues;
    self->_fieldValues = v6;

    v4 = v8;
    fieldValues = self->_fieldValues;
  }
  objc_msgSend_addObject_(fieldValues, v4, (uint64_t)v4);

}

- (unint64_t)fieldValuesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fieldValues, a2, v2);
}

- (id)fieldValuesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldValues, a2, a3);
}

+ (Class)fieldValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearListValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_listValues, a2, v2);
}

- (void)addListValues:(id)a3
{
  const char *v4;
  NSMutableArray *listValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  listValues = self->_listValues;
  v8 = (char *)v4;
  if (!listValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_listValues;
    self->_listValues = v6;

    v4 = v8;
    listValues = self->_listValues;
  }
  objc_msgSend_addObject_(listValues, v4, (uint64_t)v4);

}

- (unint64_t)listValuesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_listValues, a2, v2);
}

- (id)listValuesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_listValues, a2, a3);
}

+ (Class)listValuesType
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
  v11.super_class = (Class)CKDPConfigurationFieldValue;
  -[CKDPConfigurationFieldValue description](&v11, sel_description);
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
  void *v5;
  unsigned int v6;
  __CFString *v7;
  NSData *bytesValue;
  char has;
  void *v10;
  const char *v11;
  NSString *stringValue;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  const char *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  NSMutableArray *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  const char *v47;
  const char *v48;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = self->_type - 1;
    if (v6 >= 7)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E78367A0[v6];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, CFSTR("type"));

  }
  bytesValue = self->_bytesValue;
  if (bytesValue)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)bytesValue, CFSTR("bytesValue"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_BOOLValue);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v51, (uint64_t)v50, CFSTR("BOOLValue"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_longValue);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v53, (uint64_t)v52, CFSTR("longValue"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_11:
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, (uint64_t)bytesValue, self->_doubleValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("doubleValue"));

  }
LABEL_12:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, CFSTR("stringValue"));
  if (objc_msgSend_count(self->_fieldValues, v4, (uint64_t)stringValue))
  {
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend_count(self->_fieldValues, v16, v17);
    v20 = (void *)objc_msgSend_initWithCapacity_(v15, v19, v18);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v21 = self->_fieldValues;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v58, v63, 16);
    if (v23)
    {
      v26 = v23;
      v27 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v59 != v27)
            objc_enumerationMutation(v21);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v58 + 1) + 8 * i), v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);

        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v58, v63, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v5, v31, (uint64_t)v20, CFSTR("fieldValues"));
  }
  if (objc_msgSend_count(self->_listValues, v13, v14))
  {
    v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v35 = objc_msgSend_count(self->_listValues, v33, v34);
    v37 = (void *)objc_msgSend_initWithCapacity_(v32, v36, v35);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v38 = self->_listValues;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v54, v62, 16);
    if (v40)
    {
      v43 = v40;
      v44 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v38);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v54 + 1) + 8 * j), v41, v42);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v37, v47, (uint64_t)v46);

        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v54, v62, 16);
      }
      while (v43);
    }

    objc_msgSend_setObject_forKey_(v5, v48, (uint64_t)v37, CFSTR("listValues"));
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBC98F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  NSMutableArray *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const char *v19;
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bytesValue)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_fieldValues;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_listValues;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v19, (uint64_t)&v20, v28, 16);
    }
    while (v16);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSData *bytesValue;
  char has;
  NSString *stringValue;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const char *v27;
  _DWORD *v28;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[14] = self->_type;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  bytesValue = self->_bytesValue;
  v28 = v4;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v4, v5, (uint64_t)bytesValue);
    v4 = v28;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 60) = self->_BOOLValue;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = self->_longValue;
  *((_BYTE *)v4 + 64) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 64) |= 1u;
  }
LABEL_9:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setStringValue_(v28, v5, (uint64_t)stringValue);
  if (objc_msgSend_fieldValuesCount(self, v5, (uint64_t)stringValue))
  {
    objc_msgSend_clearFieldValues(v28, v9, v10);
    v13 = objc_msgSend_fieldValuesCount(self, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_fieldValuesAtIndex_(self, v9, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFieldValues_(v28, v17, (uint64_t)v16);

      }
    }
  }
  if (objc_msgSend_listValuesCount(self, v9, v10))
  {
    objc_msgSend_clearListValues(v28, v18, v19);
    v22 = objc_msgSend_listValuesCount(self, v20, v21);
    if (v22)
    {
      v24 = v22;
      for (j = 0; j != v24; ++j)
      {
        objc_msgSend_listValuesAtIndex_(self, v23, j);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addListValues_(v28, v27, (uint64_t)v26);

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
  uint64_t v13;
  void *v14;
  const char *v15;
  char has;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  NSMutableArray *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  const char *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_type;
    *(_BYTE *)(v10 + 64) |= 4u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_bytesValue, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v13;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v12 + 60) = self->_BOOLValue;
    *(_BYTE *)(v12 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v12 + 16) = self->_longValue;
  *(_BYTE *)(v12 + 64) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *(double *)(v12 + 8) = self->_doubleValue;
    *(_BYTE *)(v12 + 64) |= 1u;
  }
LABEL_7:
  v17 = objc_msgSend_copyWithZone_(self->_stringValue, v15, (uint64_t)a3);
  v18 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v17;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = self->_fieldValues;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v42, v47, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v19);
        v26 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v42 + 1) + 8 * i), v22, (uint64_t)a3);
        objc_msgSend_addFieldValues_((void *)v12, v27, (uint64_t)v26);

      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v42, v47, 16);
    }
    while (v23);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = self->_listValues;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v38, v46, 16);
  if (v30)
  {
    v32 = v30;
    v33 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(v28);
        v35 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v38 + 1) + 8 * j), v31, (uint64_t)a3, (_QWORD)v38);
        objc_msgSend_addListValues_((void *)v12, v36, (uint64_t)v35);

      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v38, v46, 16);
    }
    while (v32);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char has;
  char v9;
  NSData *bytesValue;
  uint64_t v11;
  NSString *stringValue;
  uint64_t v13;
  NSMutableArray *fieldValues;
  uint64_t v15;
  NSMutableArray *listValues;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_34;
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 64);
  if ((has & 4) != 0)
  {
    if ((v4[8] & 4) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_34;
  }
  else if ((v4[8] & 4) != 0)
  {
    goto LABEL_34;
  }
  bytesValue = self->_bytesValue;
  v11 = v4[3];
  if ((unint64_t)bytesValue | v11)
  {
    if (!objc_msgSend_isEqual_(bytesValue, v7, v11))
      goto LABEL_34;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 64);
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_34;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_18;
    }
LABEL_34:
    isEqual = 0;
    goto LABEL_35;
  }
  if ((v9 & 8) != 0)
    goto LABEL_34;
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_longValue != v4[2])
      goto LABEL_34;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_34;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_34;
  }
  stringValue = self->_stringValue;
  v13 = v4[6];
  if ((unint64_t)stringValue | v13 && !objc_msgSend_isEqual_(stringValue, v7, v13))
    goto LABEL_34;
  fieldValues = self->_fieldValues;
  v15 = v4[4];
  if ((unint64_t)fieldValues | v15)
  {
    if (!objc_msgSend_isEqual_(fieldValues, v7, v15))
      goto LABEL_34;
  }
  listValues = self->_listValues;
  v17 = v4[5];
  if ((unint64_t)listValues | v17)
    isEqual = objc_msgSend_isEqual_(listValues, v7, v17);
  else
    isEqual = 1;
LABEL_35:

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
  double doubleValue;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v7 = objc_msgSend_hash(self->_bytesValue, a2, v2);
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v14 = 0;
    goto LABEL_16;
  }
  v8 = 2654435761 * self->_BOOLValue;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v9 = 2654435761 * self->_longValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  doubleValue = self->_doubleValue;
  v11 = -doubleValue;
  if (doubleValue >= 0.0)
    v11 = self->_doubleValue;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_16:
  v15 = v7 ^ v4 ^ v8 ^ v9 ^ v14;
  v16 = objc_msgSend_hash(self->_stringValue, v5, v6);
  v19 = v15 ^ v16 ^ objc_msgSend_hash(self->_fieldValues, v17, v18);
  return v19 ^ objc_msgSend_hash(self->_listValues, v20, v21);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = v4;
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
    objc_msgSend_setBytesValue_(self, v5, v7);
  v8 = *((_BYTE *)v6 + 64);
  if ((v8 & 8) != 0)
  {
    self->_BOOLValue = *((_BYTE *)v6 + 60);
    *(_BYTE *)&self->_has |= 8u;
    v8 = *((_BYTE *)v6 + 64);
    if ((v8 & 2) == 0)
    {
LABEL_7:
      if ((v8 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v6 + 64) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_longValue = *((_QWORD *)v6 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v6 + 64) & 1) != 0)
  {
LABEL_8:
    self->_doubleValue = *((double *)v6 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:
  v9 = *((_QWORD *)v6 + 6);
  if (v9)
    objc_msgSend_setStringValue_(self, v5, v9);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = *((id *)v6 + 4);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v33, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_addFieldValues_(self, v13, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v33, 16);
    }
    while (v14);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = *((id *)v6 + 5);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, v32, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_addListValues_(self, v20, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v24, v32, 16);
    }
    while (v21);
  }

}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
  objc_storeStrong((id *)&self->_bytesValue, a3);
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (int64_t)longValue
{
  return self->_longValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSMutableArray)fieldValues
{
  return self->_fieldValues;
}

- (void)setFieldValues:(id)a3
{
  objc_storeStrong((id *)&self->_fieldValues, a3);
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (void)setListValues:(id)a3
{
  objc_storeStrong((id *)&self->_listValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_fieldValues, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

@end
