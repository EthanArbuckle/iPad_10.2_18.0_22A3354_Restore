@implementation LSBundleInfoCachedValues

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleInfoCachedValues objectForKey:ofClass:valuesOfClass:](self, "objectForKey:ofClass:valuesOfClass:", a3, a4, 0);
}

- (id)stringForKey:(id)a3
{
  id v5;
  NSDictionary *values;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 67, CFSTR("value for key='%@' not requested to be cached"), v5);

  }
  values = self->_values;
  v7 = objc_opt_class();
  -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 47, CFSTR("value for key='%@' not requested to be cached"), v7);

  }
  -[NSDictionary objectForKey:](self->_values, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (id)_initWithKeys:(id)a3 forDictionary:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys"));

  }
  v16.receiver = self;
  v16.super_class = (Class)LSBundleInfoCachedValues;
  v9 = -[LSPropertyList _init](&v16, sel__init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)v9[1];
    v9[1] = v10;

    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v9[2];
    v9[2] = v12;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (LSBundleInfoCachedValues)init
{
  void *v3;
  LSBundleInfoCachedValues *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](self, "_initWithKeys:forDictionary:", v3, MEMORY[0x1E0C9AA70]);

  return v4;
}

- (id)objectForKey:(id)a3
{
  return -[LSBundleInfoCachedValues objectForKey:ofType:](self, "objectForKey:ofType:", a3, 0);
}

- (BOOL)BOOLForKey:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 52, CFSTR("value for key='%@' not requested to be cached"), v5);

  }
  v6 = -[NSDictionary _LS_BoolForKey:](self->_values, "_LS_BoolForKey:", v5);

  return v6;
}

- (id)numberForKey:(id)a3
{
  id v5;
  NSDictionary *values;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 57, CFSTR("value for key='%@' not requested to be cached"), v5);

  }
  values = self->_values;
  v7 = objc_opt_class();
  -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (id)URLForKey:(id)a3
{
  id v5;
  NSDictionary *values;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 62, CFSTR("value for key='%@' not requested to be cached"), v5);

  }
  values = self->_values;
  v7 = objc_opt_class();
  -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (id)arrayForKey:(id)a3
{
  return -[LSBundleInfoCachedValues arrayForKey:withValuesOfClass:](self, "arrayForKey:withValuesOfClass:", a3, 0);
}

- (id)arrayForKey:(id)a3 withValuesOfClass:(Class)a4
{
  id v7;
  NSDictionary *values;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  char v15;
  void *v17;
  Class v18;

  v7 = a3;
  v18 = a4;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 79, CFSTR("value for key='%@' not requested to be cached"), v7);

  }
  values = self->_values;
  v9 = objc_opt_class();
  -[NSDictionary objectForKey:](values, "objectForKey:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  if (v11)
    v13 = a4 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v18, 1);
    v15 = _LSIsArrayWithValuesOfClasses(v11, v14);

    if ((v15 & 1) == 0)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)dictionaryForKey:(id)a3
{
  return -[LSBundleInfoCachedValues dictionaryForKey:valuesOfClass:](self, "dictionaryForKey:valuesOfClass:", a3, 0);
}

- (id)dictionaryForKey:(id)a3 valuesOfClass:(Class)a4
{
  id v7;
  NSDictionary *values;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v14;

  v7 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSBundleInfoCachedValues.m"), 97, CFSTR("value for key='%@' not requested to be cached"), v7);

  }
  values = self->_values;
  v9 = objc_opt_class();
  -[NSDictionary objectForKey:](values, "objectForKey:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  if (a4 && v11 && (_LSIsDictionaryWithKeysAndValuesOfClass(v11, 0, a4) & 1) == 0)
  {

    v11 = 0;
  }

  return v11;
}

- (id)objectsForKeys:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]([LSBundleInfoCachedValues alloc], "_initWithKeys:forDictionary:", v4, self->_values);

  return v5;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    -[LSBundleInfoCachedValues arrayForKey:withValuesOfClass:](self, "arrayForKey:withValuesOfClass:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((Class)objc_opt_class() == a4)
      -[LSBundleInfoCachedValues dictionaryForKey:valuesOfClass:](self, "dictionaryForKey:valuesOfClass:", v8, a5);
    else
      -[LSBundleInfoCachedValues objectForKey:ofType:](self, "objectForKey:ofType:", v8, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_expensiveDictionaryRepresentation
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_keys;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = -[NSDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v9, (_QWORD)v12);
        if (v10)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSDictionary)rawValues
{
  return self->_values;
}

- (NSSet)allKeys
{
  return self->_keys;
}

@end
