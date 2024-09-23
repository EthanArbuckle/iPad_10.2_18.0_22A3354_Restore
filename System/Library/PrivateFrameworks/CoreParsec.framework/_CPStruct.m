@implementation _CPStruct

- (void)setStringKeyFields:(id)a3
{
  NSDictionary *v4;
  NSDictionary *stringKeyFields;

  v4 = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  stringKeyFields = self->_stringKeyFields;
  self->_stringKeyFields = v4;

}

- (BOOL)getStringKeyFields:(id *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_stringKeyFields, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_retainAutorelease(v5);

  return v6 != 0;
}

- (void)setStringKeyFields:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *stringKeyFields;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!self->_stringKeyFields)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    stringKeyFields = self->_stringKeyFields;
    self->_stringKeyFields = v8;

  }
  v10 = v7;
  v11 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSDictionary setObject:forKey:](self->_stringKeyFields, "setObject:forKey:", v11, v10);
  }

}

- (void)setIntKeyFields:(id)a3
{
  NSDictionary *v4;
  NSDictionary *intKeyFields;

  v4 = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  intKeyFields = self->_intKeyFields;
  self->_intKeyFields = v4;

}

- (BOOL)getIntKeyFields:(id *)a3 forKey:(int)a4
{
  NSDictionary *intKeyFields;
  void *v6;
  void *v7;

  intKeyFields = self->_intKeyFields;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](intKeyFields, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
    *a3 = objc_retainAutorelease(v7);

  return v7 != 0;
}

- (void)setIntKeyFields:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  id v6;
  NSDictionary *v7;
  NSDictionary *intKeyFields;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (!self->_intKeyFields)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    intKeyFields = self->_intKeyFields;
    self->_intKeyFields = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSDictionary setObject:forKey:](self->_intKeyFields, "setObject:forKey:", v10, v9);

}

- (BOOL)readFrom:(id)a3
{
  return _CPStructReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_stringKeyFields;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v23 = 0;
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        -[NSDictionary objectForKeyedSubscript:](self->_stringKeyFields, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PBDataWriterWriteSubmessage();

        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_intKeyFields;
  v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        v23 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v17, "intValue", (_QWORD)v19);
        PBDataWriterWriteInt32Field();
        -[NSDictionary objectForKeyedSubscript:](self->_intKeyFields, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PBDataWriterWriteSubmessage();

        PBDataWriterRecallMark();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v14);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_CPStruct stringKeyFields](self, "stringKeyFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringKeyFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_CPStruct stringKeyFields](self, "stringKeyFields");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPStruct stringKeyFields](self, "stringKeyFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringKeyFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_CPStruct intKeyFields](self, "intKeyFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intKeyFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_CPStruct intKeyFields](self, "intKeyFields");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_CPStruct intKeyFields](self, "intKeyFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intKeyFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->_stringKeyFields, "hash");
  return -[NSDictionary hash](self->_intKeyFields, "hash") ^ v3;
}

- (NSDictionary)stringKeyFields
{
  return self->_stringKeyFields;
}

- (NSDictionary)intKeyFields
{
  return self->_intKeyFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intKeyFields, 0);
  objc_storeStrong((id *)&self->_stringKeyFields, 0);
}

- (_CPStruct)initWithFacade:(id)a3
{
  id v4;
  _CPStruct *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _CPValue *v12;
  void *v13;
  _CPValue *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _CPStruct *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPStruct init](self, "init");
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          v12 = [_CPValue alloc];
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[_CPValue initWithFacade:](v12, "initWithFacade:", v13);

          if (v14)
          {
            if (!-[_CPValue whichKind](v14, "whichKind"))
            {
              if (PARLogHandleForCategory_onceToken_1514 != -1)
                dispatch_once(&PARLogHandleForCategory_onceToken_1514, &__block_literal_global_1515);
              v15 = (void *)PARLogHandleForCategory_logHandles_2_1516;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_1516, OS_LOG_TYPE_DEBUG))
              {
                v16 = v15;
                objc_msgSend(v6, "objectForKeyedSubscript:", v11);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v26 = v11;
                v27 = 2112;
                v28 = v17;
                _os_log_debug_impl(&dword_19A825000, v16, OS_LOG_TYPE_DEBUG, "dictionary entry (%@,%@) could not be translated correctly.", buf, 0x16u);

              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[_CPStruct setStringKeyFields:forKey:](v5, "setStringKeyFields:forKey:", v14, v11);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[_CPStruct setIntKeyFields:forKey:](v5, "setIntKeyFields:forKey:", v14, objc_msgSend(v11, "intValue"));
            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

    v18 = v5;
    v4 = v20;
  }

  return v5;
}

@end
