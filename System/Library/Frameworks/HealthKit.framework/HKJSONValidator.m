@implementation HKJSONValidator

+ (void)registerSearchPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = v11;
  v6 = (void *)_searchPaths;
  if (!_searchPaths)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v8 = (void *)_searchPaths;
    _searchPaths = (uint64_t)v7;

    v6 = (void *)_searchPaths;
    v5 = v11;
  }
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend((id)_searchPaths, "arrayByAddingObject:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_searchPaths;
    _searchPaths = v9;

  }
  objc_sync_exit(v4);

}

+ (NSArray)searchPaths
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_searchPaths;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (HKJSONValidator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKJSONValidator)initWithSchema:(id)a3
{
  id v4;
  HKJSONValidator *v5;
  uint64_t v6;
  NSCopying *schema;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKJSONValidator;
  v5 = -[HKJSONValidator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    schema = v5->_schema;
    v5->_schema = (NSCopying *)v6;

  }
  return v5;
}

- (HKJSONValidator)initWithSchema:(id)a3 subschemaCache:(id)a4
{
  id v6;
  HKJSONValidator *v7;
  uint64_t v8;
  NSMutableDictionary *subschemaCache;

  v6 = a4;
  v7 = -[HKJSONValidator initWithSchema:](self, "initWithSchema:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    subschemaCache = v7->_subschemaCache;
    v7->_subschemaCache = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (HKJSONValidator)initWithSchemaNamed:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  HKJSONValidator *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v8);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "open");
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v10, 0, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      objc_msgSend(v10, "close");
      if (v11)
      {
        self = -[HKJSONValidator initWithSchema:](self, "initWithSchema:", v11);
        v13 = self;
      }
      else
      {
        _HKInitializeLogging();
        v14 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v18 = v6;
          v19 = 2114;
          v20 = v7;
          v21 = 2114;
          v22 = v12;
          _os_log_error_impl(&dword_19A0E6000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize schema %{public}@ in bundle %{public}@: %{public}@", buf, 0x20u);
        }
        v13 = 0;
      }

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        -[HKJSONValidator initWithSchemaNamed:bundle:].cold.2();
      v13 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[HKJSONValidator initWithSchemaNamed:bundle:].cold.1();
    v13 = 0;
  }

  return v13;
}

- (BOOL)validateJSONObject:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = -[HKJSONValidator _validateJSONObject:keyStack:](self, "_validateJSONObject:keyStack:", v7, v8);

  if (!v9)
  {
    -[HKJSONValidator _mismatchErrorFromKeyStack:](self, "_mismatchErrorFromKeyStack:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

  }
  return v9;
}

- (BOOL)_validateJSONObject:(id)a3 keyStack:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[HKJSONValidator schema](self, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HKJSONValidator _validateValue:schema:keyStack:root:](self, "_validateValue:schema:keyStack:root:", v7, v8, v6, 1);

  return (char)self;
}

+ (BOOL)validateJSONObject:(id)a3 withSchemaNamed:(id)a4 bundle:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HKJSONValidator *v12;
  HKJSONValidator *v13;
  BOOL v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[HKJSONValidator initWithSchemaNamed:bundle:]([HKJSONValidator alloc], "initWithSchemaNamed:bundle:", v10, v11);
  v13 = v12;
  if (v12)
  {
    v14 = -[HKJSONValidator validateJSONObject:error:](v12, "validateJSONObject:error:", v9, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Unable to create JSON validator with schema %@ in bundle %@"), v10, v11);
    v14 = 0;
  }

  return v14;
}

- (BOOL)_validateValue:(id)a3 schema:(id)a4 keyStack:(id)a5 root:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[HKJSONValidator _validateArray:schema:keyStack:](self, "_validateArray:schema:keyStack:", v10, v11, v12);
      goto LABEL_9;
    }
    if (!a6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = -[HKJSONValidator _validatePrimitive:schema:keyStack:](self, "_validatePrimitive:schema:keyStack:", v10, v11, v12);
        goto LABEL_9;
      }
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v13 = -[HKJSONValidator _validateDictionary:schema:keyStack:](self, "_validateDictionary:schema:keyStack:", v10, v11, v12);
LABEL_9:
  v14 = v13;
LABEL_11:

  return v14;
}

- (BOOL)_validateDictionary:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v19 = 1;
    goto LABEL_24;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v11)
  {
    v19 = 1;
    goto LABEL_23;
  }
  v12 = v11;
  v13 = *(_QWORD *)v24;
  v21 = v8;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_22;
      objc_msgSend(v10, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "hasSuffix:", CFSTR("?")))
      {
        objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - objc_msgSend(CFSTR("?"), "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "addObject:", v15, v21);
      if (!-[HKJSONValidator _validateValue:schema:keyStack:root:](self, "_validateValue:schema:keyStack:root:", v18, v16, v9, 0))
      {

LABEL_22:
        v19 = 0;
        v8 = v21;
        goto LABEL_23;
      }
      objc_msgSend(v9, "removeLastObject");

LABEL_15:
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v19 = 1;
    v8 = v21;
    if (v12)
      continue;
    break;
  }
LABEL_23:

LABEL_24:
  return v19;
}

- (BOOL)_validateArray:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            if (!-[HKJSONValidator _validateValue:schema:keyStack:root:](self, "_validateValue:schema:keyStack:root:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v11, v10, 0, (_QWORD)v19))
            {
              v17 = 0;
              goto LABEL_14;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
            continue;
          break;
        }
      }
      v17 = 1;
LABEL_14:

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_validatePrimitive:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "addObject:", v9);
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("BOOLean")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("number"))
      || objc_msgSend(v9, "isEqualToString:", CFSTR("string")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("fingerprint:sha256")))
      {
        if (!-[HKJSONValidator _validateFingerprintSHA256:](self, "_validateFingerprintSHA256:", v8))
          goto LABEL_20;
        goto LABEL_7;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("timezone")))
      {
        if (!-[HKJSONValidator _validateTimezone:](self, "_validateTimezone:", v8))
          goto LABEL_20;
        goto LABEL_7;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("url")))
      {
        if (!-[HKJSONValidator _validateURL:](self, "_validateURL:", v8))
          goto LABEL_20;
        goto LABEL_7;
      }
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("schema:")))
      {
        objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("schema:"), "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HKJSONValidator _validateValue:subschemaNamed:keyStack:](self, "_validateValue:subschemaNamed:keyStack:", v8, v12, v10);

        if (!v11)
          goto LABEL_21;
        goto LABEL_7;
      }
    }
LABEL_20:
    LOBYTE(v11) = 0;
    goto LABEL_21;
  }
  if (!-[HKJSONValidator _validateBoolean:](self, "_validateBoolean:", v8))
    goto LABEL_20;
LABEL_7:
  objc_msgSend(v10, "removeLastObject");
  LOBYTE(v11) = 1;
LABEL_21:

  return v11;
}

- (BOOL)_validateBoolean:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFGetTypeID(v3);
    v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_validateFingerprintSHA256:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "hk_dataWithSHA256Fingerprint:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_validateTimezone:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_validateURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "scheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "host");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 != 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_validateValue:(id)a3 subschemaNamed:(id)a4 keyStack:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a5;
  -[HKJSONValidator _loadSubschemaNamed:](self, "_loadSubschemaNamed:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc((Class)objc_opt_class());
    v12 = (void *)-[NSMutableDictionary mutableCopy](self->_subschemaCache, "mutableCopy");
    v13 = (void *)objc_msgSend(v11, "initWithSchema:subschemaCache:", v10, v12);

    v14 = objc_msgSend(v13, "_validateJSONObject:keyStack:", v8, v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_loadSubschemaNamed:(id)a3
{
  id v4;
  NSMutableDictionary *subschemaCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  subschemaCache = self->_subschemaCache;
  if (!subschemaCache)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_subschemaCache;
    self->_subschemaCache = v6;

    subschemaCache = self->_subschemaCache;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](subschemaCache, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("json"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend((id)objc_opt_class(), "searchPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "URLByAppendingPathComponent:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v16);
          if (v17)
          {
            v19 = v17;
            objc_msgSend(v17, "open");
            v24 = 0;
            objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v19, 0, &v24);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v24;
            objc_msgSend(v19, "close");
            if (!v20)
            {
              _HKInitializeLogging();
              v22 = (void *)HKLogDefault;
              if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
                -[HKJSONValidator _loadSubschemaNamed:].cold.2(v22, v16, (uint64_t)v21);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subschemaCache, "setObject:forKeyedSubscript:", v20, v4);
            v9 = v20;

            goto LABEL_20;
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v18 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[HKJSONValidator _loadSubschemaNamed:].cold.1((uint64_t)v4, v18);
    v9 = 0;
LABEL_20:

  }
  return v9;
}

- (id)_mismatchErrorFromKeyStack:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Schema mismatch at %@"), v3);
  v5 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("HKJSONErrorKeyPathKey");
  v9[1] = v5;
  v10[0] = v3;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.healthkit.private.json"), 1, v6);

  return v7;
}

- (NSCopying)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_subschemaCache, 0);
}

- (void)initWithSchemaNamed:bundle:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, (uint64_t)v0, "Schema %{public}@ not found in bundle %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSchemaNamed:bundle:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, (uint64_t)v0, "Failed to open schema %{public}@ in bundle %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_loadSubschemaNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Subschema not found: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_loadSubschemaNamed:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v5, v7, "Unable to load subschema at %{public}@: %{public}@", (uint8_t *)&v8);

}

@end
