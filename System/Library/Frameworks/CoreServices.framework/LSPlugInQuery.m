@implementation LSPlugInQuery

+ (id)pluginQueryWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:]([LSPlugInQueryWithIdentifier alloc], "_initWithIdentifier:inMap:", v3, 9);

  return v4;
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t (**v23)(_QWORD, _QWORD, _QWORD);
  unint64_t v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  LSContext *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSPlugInQuery.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("yield != nil"));

    if (a6)
      goto LABEL_4;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSPlugInQuery.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pluginIDs != nil"));

  if (!v12)
    goto LABEL_22;
LABEL_3:
  if (a6)
    goto LABEL_4;
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSPlugInQuery.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != NULL"));

LABEL_4:
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    v16 = 0x1E103B000uLL;
    v30 = a6;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x186DAE7A0]();
        v20 = objc_msgSend(v18, "unsignedLongLongValue");
        objc_msgSend(*(id *)(v16 + 3760), "plugInKitProxyForPlugin:withContext:", v20, a6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if ((((uint64_t (**)(_QWORD, void *, _QWORD))v12)[2](v12, v21, 0) & 1) == 0)
          {

            objc_autoreleasePoolPop(v19);
            goto LABEL_20;
          }
        }
        else
        {
          v22 = (uint64_t *)a6;
          v23 = v12;
          v24 = v16;
          if (_LSGetPlugin(*v22, v20))
            v25 = (__CFString *)_CSStringCopyCFString();
          else
            v25 = CFSTR("<unknown>");
          _LSDefaultLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            v38 = 2048;
            v39 = v20;
            _os_log_error_impl(&dword_182882000, v26, OS_LOG_TYPE_ERROR, "Failed to create LSPlugInKitProxy object (after sorting) for %@ (%llu)", buf, 0x16u);
          }

          v16 = v24;
          v12 = v23;
          a6 = v30;
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);
  }
LABEL_20:

}

+ (id)pluginQueryWithUUID:(id)a3
{
  id v3;
  LSPlugInQueryWithIdentifier *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [LSPlugInQueryWithIdentifier alloc];
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:](v4, "_initWithIdentifier:inMap:", v5, 11);
  return v6;
}

- (id)_init
{
  id v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LSPlugInQuery;
  v3 = -[_LSQuery _init](&v6, sel__init);
  if (v3 && objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("LSPlugInQuery.m"), 186, CFSTR("cannot directly instantiate LSPlugInQuery"));

  }
  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSPlugInQuery;
  return -[_LSQuery hash](&v3, sel_hash);
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

+ (id)pluginQuery
{
  return -[LSPlugInQuery _init]([LSPlugInQueryAll alloc], "_init");
}

+ (id)pluginQueryWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[LSPlugInQueryWithQueryDictionary _initWithQueryDictionary:applyFilter:]([LSPlugInQueryWithQueryDictionary alloc], "_initWithQueryDictionary:applyFilter:", v6, v5);

  return v7;
}

+ (id)pluginQueryWithURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[LSPlugInQueryWithURL _initWithURL:]([LSPlugInQueryWithURL alloc], "_initWithURL:", v3);

  return v4;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  id *v9;
  int v10;
  id v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v12 = 0;
  v13 = (void **)&v12;
  v14 = 0x3812000000;
  v15 = __Block_byref_object_copy__36;
  v16 = __Block_byref_object_dispose__36;
  v17 = 256;
  v18 = 0;
  if (v6)
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[LSPlugInQuery _enumerateWithXPCConnection:block:].cold.1(v8);

    v9 = v13 + 6;
  }
  else
  {
    v9 = &v18;
  }
  v10 = _LSContextInit(v9);
  if (v10)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v10, (uint64_t)"-[LSPlugInQuery _enumerateWithXPCConnection:block:]", 171, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _CSStoreEnumerateUnits();
    -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 0, v11, v7, v13 + 6);
    _LSContextDestroy(v13 + 6);

  }
  _Block_object_dispose(&v12, 8);

}

void __51__LSPlugInQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  if (_LSPluginIsValid(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), a2, a3, 0, 0, 0))
  {
    if (_LSPluginCheckExtensionPoint(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), a2, a3, 0))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LSPlugInQuery;
  if (-[_LSQuery isEqual:](&v7, sel_isEqual_, v4))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  }
}

- (void)_enumerateWithXPCConnection:(os_log_t)log block:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "LSPlugInQuery for enumerating all plugins called from a processs that cannot map the database", v1, 2u);
}

@end
