@implementation MOPersistableKeyStringDictionarySettingMetadata

- (MOPersistableKeyStringDictionarySettingMetadata)initWithSettingName:(id)a3 defaultDictionary:(id)a4 persistableKeyClass:(Class)a5 combineOperator:(int64_t)a6 rankedAllowedValues:(id)a7 maximumCount:(unint64_t)a8 isPublic:(BOOL)a9 scope:(id)a10 isPrivacySensitive:(BOOL)a11
{
  NSDictionary *v17;
  MOPersistableKeyStringDictionarySettingMetadata *v18;
  NSDictionary *rankedAllowedValues;
  objc_super v21;

  v17 = (NSDictionary *)a7;
  v21.receiver = self;
  v21.super_class = (Class)MOPersistableKeyStringDictionarySettingMetadata;
  v18 = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v21, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a9, a10, a11);
  objc_storeStrong((id *)&v18->_persistableKeyClass, a5);
  v18->_combineOperator = a6;
  rankedAllowedValues = v18->_rankedAllowedValues;
  v18->_rankedAllowedValues = v17;

  v18->_maximumCount = a8;
  return v18;
}

- (NSDictionary)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOPersistableKeyStringDictionarySettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)persistableValueFromValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && -[MOPersistableKeyStringDictionarySettingMetadata _isAcceptableStringValue:](self, "_isAcceptableStringValue:", v12))
            {
              v22[0] = CFSTR("key");
              objc_msgSend(v11, "persistableValue");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v22[1] = CFSTR("value");
              v23[0] = v13;
              v23[1] = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "addObject:", v14);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    v15 = (void *)objc_msgSend(v17, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)valueFromPersistableValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  Class persistableKeyClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v4;
    v5 = v4;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (-[MOPersistableKeyStringDictionarySettingMetadata _isAcceptablePersistedArrayElement:](self, "_isAcceptablePersistedArrayElement:", v11, v18))
          {
            persistableKeyClass = self->_persistableKeyClass;
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("key"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_class initializeWithPersistableValue:](persistableKeyClass, "initializeWithPersistableValue:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v14);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_msgSend(v19, "copy");
    v4 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "count") <= self->_maximumCount)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (-[MOPersistableKeyStringDictionarySettingMetadata _isAcceptablePersistedArrayElement:](self, "_isAcceptablePersistedArrayElement:", v13, (_QWORD)v15))
            {
              objc_msgSend(v7, "addObject:", v13);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

      v6 = (void *)objc_msgSend(v7, "copy");
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isAcceptableStringValue:(id)a3
{
  void *v3;
  char isKindOfClass;

  -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isAcceptablePersistedArrayElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[objc_class isValidPersistableRepresentation:](self->_persistableKeyClass, "isValidPersistableRepresentation:", v5))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = (objc_opt_isKindOfClass() & 1) != 0
        && -[MOPersistableKeyStringDictionarySettingMetadata _isAcceptableStringValue:](self, "_isAcceptableStringValue:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[MOPersistableKeyStringDictionarySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPersistableKeyStringDictionarySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      -[MOPersistableKeyStringDictionarySettingMetadata _combine:with:](self, "_combine:with:", v7, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
  }
  else
  {
    if (!v8)
    {
      v10 = 0;
      goto LABEL_8;
    }
    v9 = v8;
  }
  v10 = v9;
LABEL_8:

  return v10;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t combineOperator;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MOPersistableKeyStringDictionarySettingMetadata valueFromPersistableValue:](self, "valueFromPersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v21 = v6;
  -[MOPersistableKeyStringDictionarySettingMetadata valueFromPersistableValue:](self, "valueFromPersistableValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v9);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          combineOperator = self->_combineOperator;
          if (combineOperator == 1)
            goto LABEL_11;
          if (!combineOperator)
          {
            v17 = objc_msgSend(v14, "integerValue");
            if (v17 > objc_msgSend(v15, "integerValue"))
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v11);
LABEL_11:
            v18 = objc_msgSend(v14, "integerValue");
            if (v18 < objc_msgSend(v15, "integerValue"))
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v11);
          }

          goto LABEL_15;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v11);
LABEL_15:

      }
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v23);
  }
  -[MOPersistableKeyStringDictionarySettingMetadata persistableValueFromValue:](self, "persistableValueFromValue:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (Class)persistableKeyClass
{
  return self->_persistableKeyClass;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (NSDictionary)rankedAllowedValues
{
  return self->_rankedAllowedValues;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedAllowedValues, 0);
  objc_storeStrong((id *)&self->_persistableKeyClass, 0);
}

@end
