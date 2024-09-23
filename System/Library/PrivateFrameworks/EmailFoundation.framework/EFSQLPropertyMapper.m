@implementation EFSQLPropertyMapper

- (id)_findAllProtocolsOfClass:(Class)a3 withProperty:(SEL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void (**v16)(void *, _QWORD *);
  objc_class *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  Protocol *v22;
  const char *Name;
  _QWORD v25[4];
  Protocol *v26;
  _QWORD v27[5];
  _QWORD aBlock[5];
  id v29;

  -[EFSQLPropertyMapper protocolQueueCache](self, "protocolQueueCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = v12;

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke;
  aBlock[3] = &unk_1E62A7368;
  aBlock[4] = self;
  v15 = v13;
  v29 = v15;
  v16 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  if (!v9)
  {
    for (i = a3; i; i = class_getSuperclass(i))
    {
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_2;
      v27[3] = &__block_descriptor_40_e10___16__0_I8lu32l8;
      v27[4] = i;
      v16[2](v16, v27);
    }
    -[EFSQLPropertyMapper protocolQueueCache](self, "protocolQueueCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "copy");
    NSStringFromClass(a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, v20);

  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  while (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "anyObject");
    v22 = (Protocol *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v22);
    if ((objc_msgSend(v21, "containsObject:", v22) & 1) == 0)
    {
      Name = sel_getName(a4);
      if (protocol_getProperty(v22, Name, 1, 1))
        objc_msgSend(v21, "addObject:", v22);
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_3;
      v25[3] = &unk_1E62A73B0;
      v26 = v22;
      v16[2](v16, v25);

    }
  }

  return v21;
}

void __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  unint64_t i;
  Protocol *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v8 = 0;
  v3 = (id *)(*(uint64_t (**)(uint64_t, unsigned int *))(a2 + 16))(a2, &v8);
  if (v8)
  {
    for (i = 0; i < v8; ++i)
    {
      v5 = (Protocol *)v3[i];
      v6 = *(void **)(a1 + 32);
      NSStringFromProtocol(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "_hasAllowedPrefix:", v7);

      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

    }
  }
  free(v3);
}

Protocol **__61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_3(uint64_t a1, unsigned int *a2)
{
  return protocol_copyProtocolList(*(Protocol **)(a1 + 32), a2);
}

Protocol **__61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_2(uint64_t a1, unsigned int *a2)
{
  return class_copyProtocolList(*(Class *)(a1 + 32), a2);
}

- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5 forClass:(Class)a6 property:(SEL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFSQLPropertyMapper _registerQualifiedColumns:lookupKeys:forClass:property:](self, "_registerQualifiedColumns:lookupKeys:forClass:property:", v16, v14, a6, a7);
}

- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__EFSQLPropertyMapper_registerColumnName_table_lookupKeys___block_invoke;
  v15[3] = &unk_1E62A7340;
  v16 = v13;
  v17 = a2;
  v15[4] = self;
  v14 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __59__EFSQLPropertyMapper_registerColumnName_table_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  _keyForLookupValue(v12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("EFSQLPropertyMapper.m"), 287, CFSTR("A column is already registed for lookupKey=%@ value=%@"), v12, v5);

  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

}

void __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  _keyForProtocolInstanceProperty(v11, *(Protocol **)(a1 + 32), *(const char **)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("EFSQLPropertyMapper.m"), 268, CFSTR("A value is already registed for lookupKey=%@ protoKey=%@"), v11, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 40), "lookupValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

}

void __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  _keyForClassInstanceProperty(v11, *(objc_class **)(a1 + 48), *(const char **)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("EFSQLPropertyMapper.m"), 275, CFSTR("A value is already registed for lookupKey=%@ classKey=%@"), v11, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

}

- (void)_registerQualifiedColumns:(id)a3 lookupKeys:(id)a4 forClass:(Class)a5 property:(SEL)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  Protocol *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  Class v30;
  void *v31;
  id obj;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  Class v38;
  SEL v39;
  SEL v40;
  _QWORD v41[6];
  id v42;
  SEL v43;
  SEL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  v30 = a5;
  if (!class_getInstanceMethod(a5, a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class_getInstanceMethod(class, property) && \"property does not exist on class\"));

  }
  if (objc_msgSend(v35, "count") == 1)
  {
    objc_msgSend(v35, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "first");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EFSQLPropertyMapper registerColumnName:table:lookupKeys:](self, "registerColumnName:table:lookupKeys:", v11, v13, v34);
  }
  _keyForClassInstanceProperty(CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a5, a6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 251, CFSTR("A column is already registed for key=%@"), v31);

  }
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, v31);

  -[EFSQLPropertyMapper _findAllProtocolsOfClass:withProperty:](self, "_findAllProtocolsOfClass:withProperty:", a5, a6);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(obj);
        v20 = *(Protocol **)(*((_QWORD *)&v45 + 1) + 8 * i);
        _keyForProtocolInstanceProperty(CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), v20, a6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 && (objc_msgSend(v23, "isEqual:", v35) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 262, CFSTR("A column is already registered for key=%@"), v21);

        }
        -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, v21);

        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke;
        v41[3] = &unk_1E62A72C8;
        v41[4] = v20;
        v41[5] = self;
        v43 = a6;
        v44 = a2;
        v25 = v21;
        v42 = v25;
        objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v41);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v17);
  }

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke_2;
  v36[3] = &unk_1E62A7318;
  v38 = v30;
  v39 = a6;
  v36[4] = self;
  v40 = a2;
  v27 = v31;
  v37 = v27;
  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v36);

}

- (NSMutableDictionary)lookupValues
{
  return self->_lookupValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolQueueCache, 0);
  objc_storeStrong((id *)&self->_allowedProtocolPrefixes, 0);
  objc_storeStrong((id *)&self->_lookupValues, 0);
}

- (EFSQLPropertyMapper)init
{
  return -[EFSQLPropertyMapper initWithAllowedProtocolPrefixes:](self, "initWithAllowedProtocolPrefixes:", MEMORY[0x1E0C9AA60]);
}

- (void)setLookupValues:(id)a3
{
  objc_storeStrong((id *)&self->_lookupValues, a3);
}

+ (id)emptyPropertyMapper
{
  id v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "setLookupValues:", MEMORY[0x1E0C9AA70]);
  return v2;
}

- (EFSQLPropertyMapper)initWithAllowedProtocolPrefixes:(id)a3
{
  id v5;
  EFSQLPropertyMapper *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *lookupValues;
  NSCache *v9;
  NSCache *protocolQueueCache;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EFSQLPropertyMapper;
  v6 = -[EFSQLPropertyMapper init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lookupValues = v6->_lookupValues;
    v6->_lookupValues = v7;

    objc_storeStrong((id *)&v6->_allowedProtocolPrefixes, a3);
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    protocolQueueCache = v6->_protocolQueueCache;
    v6->_protocolQueueCache = v9;

  }
  return v6;
}

- (void)registerColumn:(id)a3 forClass:(Class)a4 property:(SEL)a5 lookupKeys:(id)a6
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  SEL v30;
  Class v31;
  SEL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (!class_getInstanceMethod(a4, a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class_getInstanceMethod(class, property) && \"property does not exist on class\"));

  }
  _keyForClassInstanceProperty(CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a4, a5);
  v13 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v13;
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 155, CFSTR("A column is already registed for key=%@"), v13);

  }
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v13);

  -[EFSQLPropertyMapper _findAllProtocolsOfClass:withProperty:](self, "_findAllProtocolsOfClass:withProperty:", a4, a5);
  v17 = a2;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v18);
        -[EFSQLPropertyMapper registerColumn:forProtocol:property:lookupKeys:](self, "registerColumn:forProtocol:property:lookupKeys:", v11, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21++), a5, v12);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__EFSQLPropertyMapper_registerColumn_forClass_property_lookupKeys___block_invoke;
  v27[3] = &unk_1E62A72A0;
  v27[4] = self;
  v30 = v17;
  v22 = v11;
  v28 = v22;
  v31 = a4;
  v32 = a5;
  v23 = v26;
  v29 = v23;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v27);

}

void __67__EFSQLPropertyMapper_registerColumn_forClass_property_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  _keyForLookupValue(v17, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("EFSQLPropertyMapper.m"), 165, CFSTR("A column is already registed for lookupKey=%@ value=%@"), v17, v5);

  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  _keyForClassInstanceProperty(v17, *(objc_class **)(a1 + 64), *(const char **)(a1 + 72));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("EFSQLPropertyMapper.m"), 169, CFSTR("A value is already registed for lookupKey=%@ classKey=%@"), v17, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "lookupValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, v11);

}

- (void)registerColumn:(id)a3 forProtocol:(id)a4 property:(SEL)a5 lookupKeys:(id)a6
{
  Protocol *v11;
  id v12;
  const char *Name;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Protocol *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  Protocol *v24;
  EFSQLPropertyMapper *v25;
  id v26;
  SEL v27;
  SEL v28;

  v22 = a3;
  v11 = (Protocol *)a4;
  v12 = a6;
  Name = sel_getName(a5);
  if (!protocol_getProperty(v11, Name, 1, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protocol_getProperty(protocol, sel_getName(property), YES, YES) && \"property does not exist on protocol\"));

  }
  _keyForProtocolInstanceProperty(CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 182, CFSTR("A column is already registered for key=%@"), v14);

  }
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v14);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__EFSQLPropertyMapper_registerColumn_forProtocol_property_lookupKeys___block_invoke;
  v23[3] = &unk_1E62A72C8;
  v18 = v11;
  v24 = v18;
  v25 = self;
  v27 = a5;
  v28 = a2;
  v19 = v14;
  v26 = v19;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v23);

}

void __70__EFSQLPropertyMapper_registerColumn_forProtocol_property_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  _keyForProtocolInstanceProperty(v11, *(Protocol **)(a1 + 32), *(const char **)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("EFSQLPropertyMapper.m"), 187, CFSTR("A value is already registed for lookupKey=%@ protoKey=%@"), v11, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 40), "lookupValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

}

- (id)columnForClass:(Class)a3 property:(SEL)a4
{
  void *v6;
  void *v8;

  -[EFSQLPropertyMapper valueForLookupKey:class:property:](self, "valueForLookupKey:class:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 194, CFSTR("Column has incorrect type"));

  }
  return v6;
}

- (id)columnForProtocol:(id)a3 property:(SEL)a4
{
  void *v6;
  void *v8;

  -[EFSQLPropertyMapper valueForLookupKey:protocol:property:](self, "valueForLookupKey:protocol:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 200, CFSTR("Column has incorrect type"));

  }
  return v6;
}

- (id)columnForLookupKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  _keyForLookupValue(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 207, CFSTR("Schema doesn't define column for lookupKey=%@ value=%@"), v7, v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 208, CFSTR("Column has incorrect type"));

  }
  return v11;
}

- (void)registerColumnNames:(id)a3 table:(id)a4 forClass:(Class)a5 property:(SEL)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__EFSQLPropertyMapper_registerColumnNames_table_forClass_property___block_invoke;
  v13[3] = &unk_1E62A72F0;
  v12 = v10;
  v14 = v12;
  objc_msgSend(a3, "ef_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper _registerQualifiedColumns:lookupKeys:forClass:property:](self, "_registerQualifiedColumns:lookupKeys:forClass:property:", v11, MEMORY[0x1E0C9AA70], a5, a6);

}

id __67__EFSQLPropertyMapper_registerColumnNames_table_forClass_property___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", *(_QWORD *)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)columnNameForClass:(Class)a3 property:(SEL)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[EFSQLPropertyMapper valueForLookupKey:class:property:](self, "valueForLookupKey:class:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)columnNameForProtocol:(id)a3 property:(SEL)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[EFSQLPropertyMapper valueForLookupKey:protocol:property:](self, "valueForLookupKey:protocol:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)columnNameForLookupKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v7 = a3;
  v8 = a4;
  _keyForLookupValue(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 313, CFSTR("Schema doesn't define column for lookupKey=%@ value=%@"), v7, v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "first");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "second");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@.%@"), v15, v17);

  }
  return v12;
}

- (id)qualifiedColumnExpressionForLookupKey:(id)a3 value:(id)a4 availableTables:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _keyForLookupValue(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 327, CFSTR("Schema doesn't define column for lookupKey=%@ value=%@"), v9, v10);

  }
  -[EFSQLPropertyMapper _qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:](self, "_qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:", v14, v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)qualifiedColumnExpressionForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  -[EFSQLPropertyMapper valueForLookupKey:class:property:](self, "valueForLookupKey:class:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper _qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:](self, "_qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)qualifiedColumnExpressionsForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[EFSQLPropertyMapper valueForLookupKey:class:property:](self, "valueForLookupKey:class:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper _qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:](self, "_qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)qualifiedColumnNamesForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[EFSQLPropertyMapper valueForLookupKey:class:property:](self, "valueForLookupKey:class:property:", CFSTR("EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper _qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:](self, "_qualifiedColumnExpressionsForColumn:availableTables:replaceNULL:", v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_qualifiedColumnExpressionsForColumn:(id)a3 availableTables:(id)a4 replaceNULL:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v5 = a5;
  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v7;
  v29 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "containsObject:", v12);

    if (v13)
    {
      objc_msgSend(v29, "fullNameWithDatabaseName:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v5)
    {
      v15 = &unk_1E62BDD48;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v28 = v7;
    v15 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v29;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v20, "first");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v8, "containsObject:", v21);

          if (v22)
          {
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "first");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "second");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.%@"), v24, v25, v28);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v26);

          }
          else if (v5)
          {
            objc_msgSend(v15, "addObject:", CFSTR("NULL"));
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

  }
  return v15;
}

- (BOOL)hasLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  _keyForClassInstanceProperty(a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (id)valueForLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v9 = a3;
  _keyForClassInstanceProperty(v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 390, CFSTR("Schema doesn't define value for lookupKey=%@ class=%@ property=%@"), v9, a4, v15);

  }
  return v12;
}

- (id)valueForLookupKey:(id)a3 protocol:(id)a4 property:(SEL)a5
{
  id v9;
  Protocol *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = (Protocol *)a4;
  _keyForProtocolInstanceProperty(v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPropertyMapper lookupValues](self, "lookupValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPropertyMapper.m"), 398, CFSTR("Schema doesn't define value for lookupKey=%@ protocol=%@ property=%@"), v9, v10, v16);

  }
  return v13;
}

- (BOOL)_hasAllowedPrefix:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EFSQLPropertyMapper allowedProtocolPrefixes](self, "allowedProtocolPrefixes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[EFSQLPropertyMapper allowedProtocolPrefixes](self, "allowedProtocolPrefixes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (NSArray)allowedProtocolPrefixes
{
  return self->_allowedProtocolPrefixes;
}

- (void)setAllowedProtocolPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProtocolPrefixes, a3);
}

- (NSCache)protocolQueueCache
{
  return self->_protocolQueueCache;
}

- (void)setProtocolQueueCache:(id)a3
{
  objc_storeStrong((id *)&self->_protocolQueueCache, a3);
}

@end
