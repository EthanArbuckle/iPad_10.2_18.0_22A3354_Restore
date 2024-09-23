@implementation FCCKRecordSchema

+ (FCCKRecordSchema)recordWithType:(void *)a3 fields:
{
  id v4;
  id v5;
  FCCKRecordSchema *v6;
  id v7;
  id v8;
  FCCKRecordSchema *v9;
  NSDictionary *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *fieldSchemasByName;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = [FCCKRecordSchema alloc];
  v7 = v5;
  v8 = v4;
  if (v6)
  {
    v25.receiver = v6;
    v25.super_class = (Class)FCCKRecordSchema;
    v9 = (FCCKRecordSchema *)objc_msgSendSuper2(&v25, sel_init);
    v6 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_recordType, a2);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
            if (v16)
              v17 = *(_QWORD *)(v16 + 16);
            else
              v17 = 0;
            -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, v17, (_QWORD)v21);
            ++v15;
          }
          while (v13 != v15);
          v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          v13 = v18;
        }
        while (v18);
      }

      fieldSchemasByName = v6->_fieldSchemasByName;
      v6->_fieldSchemasByName = v10;

    }
  }

  return v6;
}

- (FCCKRecordSchema)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKRecordSchema init]";
    v9 = 2080;
    v10 = "FCCKRecordSchema.m";
    v11 = 1024;
    v12 = 68;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKRecordSchema init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id *v7;
  NSString *recordType;
  NSString *v9;
  id v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (id *)v6;
    if (self)
      recordType = self->_recordType;
    else
      recordType = 0;
    v9 = recordType;
    v10 = v7[2];
    if (-[NSString isEqualToString:](v9, "isEqualToString:", v10))
      v11 = -[NSDictionary isEqualToDictionary:](self->_fieldSchemasByName, "isEqualToDictionary:", v7[1]);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSString *recordType;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;

  if (self)
    recordType = self->_recordType;
  else
    recordType = 0;
  v4 = recordType;
  v5 = -[NSString hash](v4, "hash");
  v6 = -[NSDictionary hash](self->_fieldSchemasByName, "hash");

  return v6 ^ v5;
}

- (id)allEncryptedFieldNames
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "allValues");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_24_2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __42__FCCKRecordSchema_allEncryptedFieldNames__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2 && *((_BYTE *)v2 + 8))
    v4 = v2[2];
  else
    v4 = 0;

  return v4;
}

- (id)allUnencryptedFieldNames
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "allValues");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_25_1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __44__FCCKRecordSchema_allUnencryptedFieldNames__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (!v2)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (!*((_BYTE *)v2 + 8))
  {
    v5 = (void *)*((_QWORD *)v2 + 2);
LABEL_5:
    v4 = v5;
    goto LABEL_6;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (BOOL)isFieldKnown:(uint64_t)a1
{
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFieldEncrypted:(uint64_t)a1
{
  _BYTE *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[8] != 0;
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_fieldSchemasByName, 0);
}

@end
