@implementation _LSLazyPropertyList

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  -[_LSLazyPropertyList objectForKey:checkingKeyClass:checkingValueClass:](self, "objectForKey:checkingKeyClass:checkingValueClass:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  -[_LSLazyPropertyList objectForKey:checkingKeyClass:checkingValueClass:](self, "objectForKey:checkingKeyClass:checkingValueClass:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (_LSLazyPropertyList)lazyPropertyListWithContext:(LSContext *)a3 unit:(unsigned int)a4
{
  if (a3)
    a3 = (LSContext *)a3->db;
  return (_LSLazyPropertyList *)objc_msgSend(a1, "lazyPropertyListWithDatabase:unit:", a3, *(_QWORD *)&a4);
}

+ (_LSDataBackedPropertyList)lazyPropertyListWithPropertyListData:(uint64_t)a1
{
  id v2;
  _LSDataBackedPropertyList *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[_LSDataBackedPropertyList initWithPropertyListData:]([_LSDataBackedPropertyList alloc], "initWithPropertyListData:", v2);

  return v3;
}

- (_LSLazyPropertyList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LSLazyPropertyList;
  return (_LSLazyPropertyList *)-[LSPropertyList _init](&v3, sel__init);
}

+ (_LSDictionaryBackedPropertyList)lazyPropertyListWithPropertyList:(uint64_t)a1
{
  id v2;
  _LSDictionaryBackedPropertyList *v3;
  _LSDictionaryBackedPropertyList *v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    v3 = -[_LSDictionaryBackedPropertyList initWithPropertyList:]([_LSDictionaryBackedPropertyList alloc], "initWithPropertyList:", v2);
  }
  else
  {
    +[_LSEmptyPropertyList sharedInstance](_LSEmptyPropertyList, "sharedInstance");
    v3 = (_LSDictionaryBackedPropertyList *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)propertyList
{
  id v2;

  if (a1)
  {
    v2 = 0;
    objc_msgSend(a1, "_getPropertyList:", &v2);
    a1 = v2;
  }
  return a1;
}

- (id)objectsForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x186DAE7A0]();
  -[_LSLazyPropertyList uncheckedObjectsForKeys:](self, "uncheckedObjectsForKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]([LSBundleInfoCachedValues alloc], "_initWithKeys:forDictionary:", v4, v6);

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = a2;
  v3 = objc_opt_self();
  v8 = 0;
  +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:](v3, v2, 1, (uint64_t)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:].cold.2((uint64_t)v2, v6);
  }
  else
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:].cold.1((uint64_t)v2, (uint64_t)v5, v6);
  }

  return v4;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a3 options:(uint64_t)a4 error:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a2;
  v7 = objc_opt_self();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, a3, a4);
  if (v8)
  {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:](v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSLazyPropertyList.mm"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[_LSLazyPropertyList objectForKey:ofClass:](self, "objectForKey:ofClass:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (BOOL)_getPropertyList:(id *)a3
{
  return 0;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  return 0;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  Class v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x186DAE7A0]();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSLazyPropertyList.mm"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v25 = 0;
  v11 = -[_LSLazyPropertyList _getValue:forPropertyListKey:](self, "_getValue:forPropertyListKey:", &v25, v9);
  v12 = v25;
  v13 = v12;
  if (v12)
    v14 = v11;
  else
    v14 = 0;
  if (v14)
  {
    v15 = v12;
    if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      v16 = v15;
LABEL_25:

      goto LABEL_26;
    }
    v13 = v15;
    if (a5)
    {
      if (_NSIsNSArray())
      {
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v15;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(v17);
              v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v16, "addObject:", v21);
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v18);
        }

        v13 = (void *)objc_msgSend(v16, "copy");
        goto LABEL_24;
      }
      v13 = v15;
      if (_NSIsNSDictionary())
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = ___ZN14LaunchServices13PropertyListsL27filterValueFromPropertyListEP11objc_objectP10objc_classS4__block_invoke;
        v30[3] = &unk_1E1044390;
        v32 = a5;
        v16 = v22;
        v31 = v16;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v30);
        v13 = (void *)objc_msgSend(v16, "copy");

        v17 = v31;
LABEL_24:

        goto LABEL_25;
      }
    }
LABEL_26:

  }
  objc_autoreleasePoolPop(v10);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_LSLazyPropertyList)lazyPropertyListWithDatabase:(id)a3 unit:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (!v6
    || !a4
    || (_LSPlistGet((uint64_t)v6, a4), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (+[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)a1, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    +[_LSEmptyPropertyList sharedInstance](_LSEmptyPropertyList, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (_LSLazyPropertyList *)v9;
}

+ (void)lazyPropertyListWithPropertyListURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138478083;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Failed to load plist data from %{private}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)lazyPropertyListWithPropertyListURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Loaded plist data at %{private}@ (don't know if valid yet)", (uint8_t *)&v2, 0xCu);
}

@end
