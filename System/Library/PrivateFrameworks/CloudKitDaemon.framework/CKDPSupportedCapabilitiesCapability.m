@implementation CKDPSupportedCapabilitiesCapability

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)clearValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_values, a2, v2);
}

- (void)addValues:(id)a3
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

- (id)valuesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_values, a2, a3);
}

+ (Class)valuesType
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
  v11.super_class = (Class)CKDPSupportedCapabilitiesCapability;
  -[CKDPSupportedCapabilitiesCapability description](&v11, sel_description);
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
  NSString *key;
  NSMutableArray *values;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  key = self->_key;
  if (key)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)key, CFSTR("key"));
  values = self->_values;
  if (values)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)values, CFSTR("values"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAD0ADC(self, (uint64_t)a3);
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
  if (self->_key)
    PBDataWriterWriteStringField();
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
        PBDataWriterWriteStringField();
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
  NSString *key;
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
  key = self->_key;
  if (key)
    objc_msgSend_setKey_(v16, v4, (uint64_t)key);
  if (objc_msgSend_valuesCount(self, v4, (uint64_t)key))
  {
    objc_msgSend_clearValues(v16, v6, v7);
    v10 = objc_msgSend_valuesCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_valuesAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addValues_(v16, v15, (uint64_t)v14);

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
  v12 = objc_msgSend_copyWithZone_(self->_key, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

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
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addValues_(v10, v22, (uint64_t)v21);

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
  NSString *key;
  uint64_t v9;
  NSMutableArray *values;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((key = self->_key, v9 = v4[1], !((unint64_t)key | v9)) || objc_msgSend_isEqual_(key, v7, v9)))
  {
    values = self->_values;
    v11 = v4[2];
    if ((unint64_t)values | v11)
      isEqual = objc_msgSend_isEqual_(values, v7, v11);
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

  v4 = objc_msgSend_hash(self->_key, a2, v2);
  return objc_msgSend_hash(self->_values, v5, v6) ^ v4;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 1);
  if (v6)
    objc_msgSend_setKey_(self, v4, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v5 + 2);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_addValues_(self, v10, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
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
  objc_storeStrong((id *)&self->_key, 0);
}

@end
