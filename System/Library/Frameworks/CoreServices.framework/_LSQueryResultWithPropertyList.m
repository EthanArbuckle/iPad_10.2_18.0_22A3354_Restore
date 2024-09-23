@implementation _LSQueryResultWithPropertyList

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyList, 0);
}

- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3 valuesOfClass:(Class)a4
{
  uint64_t *v6;
  char isKindOfClass;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  -[_LSQueryResultWithPropertyList propertyList](self, "propertyList");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  if (a3)
  {
    if (v24[5])
    {
      isKindOfClass = objc_opt_isKindOfClass();
      v6 = v24;
      if ((isKindOfClass & 1) == 0)
      {
        v8 = (void *)v24[5];
        v24[5] = 0;

        v6 = v24;
      }
    }
  }
  if (a4 && v6[5])
  {
    v9 = _NSIsNSDictionary();
    v10 = (void *)v24[5];
    if (v9)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70___LSQueryResultWithPropertyList_propertyListWithClass_valuesOfClass___block_invoke;
      v22[3] = &unk_1E1044E50;
      v22[4] = &v23;
      v22[5] = a4;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);
    }
    else if (_NSIsNSArray())
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = (id)v24[5];
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v15 = (void *)v24[5];
              v24[5] = 0;

              goto LABEL_20;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_20:

    }
  }
  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return (_LSQueryResultWithPropertyList *)v16;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3
{
  return -[_LSQueryResultWithPropertyList propertyListWithClass:valuesOfClass:](self, "propertyListWithClass:valuesOfClass:", a3, 0);
}

- (_LSQueryResultWithPropertyList)initWithPropertyList:(id)a3
{
  id v5;
  id *v6;
  _LSQueryResultWithPropertyList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSQueryResultWithPropertyList;
  v6 = -[_LSQueryResult _init](&v9, sel__init);
  v7 = (_LSQueryResultWithPropertyList *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_LSQueryResultWithPropertyList propertyList](self, "propertyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("propertyList"));

}

- (_LSQueryResultWithPropertyList)initWithCoder:(id)a3
{
  id v4;
  _LSQueryResultWithPropertyList *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id propertyList;

  v4 = a3;
  v5 = -[_LSQueryResult _init](self, "_init");
  if (v5)
  {
    v6 = objc_opt_class();
    XNSGetPropertyListClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v6, v7, CFSTR("propertyList"));
    v8 = objc_claimAutoreleasedReturnValue();
    propertyList = v5->_propertyList;
    v5->_propertyList = (id)v8;

  }
  return v5;
}

@end
