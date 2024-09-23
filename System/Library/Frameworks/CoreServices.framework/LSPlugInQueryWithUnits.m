@implementation LSPlugInQueryWithUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryWithUnits)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4
{
  id v6;
  id v7;
  LSPlugInQueryWithUnits *v8;
  uint64_t v9;
  NSArray *pluginUnits;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithUnits;
  v8 = -[LSPlugInQuery _init](&v12, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pluginUnits = v8->_pluginUnits;
    v8->_pluginUnits = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dbUUID, a4);
  }

  return v8;
}

- (LSPlugInQueryWithUnits)initWithCoder:(id)a3
{
  id v4;
  LSPlugInQueryWithUnits *v5;
  uint64_t v6;
  NSArray *pluginUnits;
  uint64_t v8;
  NSUUID *dbUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInQueryWithUnits;
  v5 = -[LSPlugInQuery initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("pluginUnits"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluginUnits = v5->_pluginUnits;
    v5->_pluginUnits = (NSArray *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    dbUUID = v5->_dbUUID;
    v5->_dbUUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *pluginUnits;
  id v5;

  pluginUnits = self->_pluginUnits;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pluginUnits, CFSTR("pluginUnits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dbUUID, CFSTR("dbUUID"));

}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  int inited;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v26 = 0;
  v27 = 0;
  inited = _LSContextInitReturningError(&v27, &v26);
  v9 = v26;
  if (inited)
  {
    _LSDatabaseGetCacheGUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self->_dbUUID);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_pluginUnits);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = v12;
      v15 = v13;
      _CSStoreEnumerateUnits();
      if ((objc_msgSend(v15, "isEqual:", v14) & 1) != 0)
      {
        if (objc_msgSend(v15, "count"))
          -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 0, v14, v7, &v27);
      }
      else
      {
        v16 = (void *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v16, "minusSet:", v15);
        _LSDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

        v30 = *MEMORY[0x1E0CB2938];
        v31[0] = CFSTR("specified plugin units were not available");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 114, (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]", 141, v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v7[2](v7, 0, v25);
        v9 = (id)v25;
      }

    }
    else
    {
      v28 = *MEMORY[0x1E0CB2938];
      v29 = CFSTR("DB UUID mismatch");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 114, (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]", 147, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, (uint64_t)v15);
    }

    _LSContextDestroy(&v27);
  }
  else
  {
    v7[2](v7, 0, (uint64_t)v9);
  }

}

void __60__LSPlugInQueryWithUnits__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbUUID, 0);
  objc_storeStrong((id *)&self->_pluginUnits, 0);
}

- (void)_enumerateWithXPCConnection:(uint64_t)a3 block:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "LSPlugInQueryWithUnits: missing units %@", a5, a6, a7, a8, 2u);
}

@end
