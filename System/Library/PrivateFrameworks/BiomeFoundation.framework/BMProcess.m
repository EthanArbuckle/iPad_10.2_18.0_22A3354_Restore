@implementation BMProcess

- (BOOL)hasNonEmptyArrayForEntitlement:(id)a3
{
  void *v3;
  BOOL v4;

  -[BMProcess nonnullArrayForEntitlement:](self, "nonnullArrayForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)nonnullArrayForEntitlement:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BMProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
    }
    else
    {
      v7[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BOOL)hasNonEmptyDictionaryForEntitlement:(id)a3
{
  void *v3;
  BOOL v4;

  -[BMProcess dictionaryForEntitlement:](self, "dictionaryForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)dictionaryForEntitlement:(id)a3
{
  void *v3;
  id v4;

  -[BMProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)stringForEntitlement:(id)a3
{
  void *v3;
  id v4;

  -[BMProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)nonnullSetOfStringsForEntitlement:(id)a3
{
  void *v3;
  void *v4;

  -[BMProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMNonnullSetOfStringsFromEntitlementValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  os_unfair_lock_s *p_entitlementCacheLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;

  v4 = a3;
  p_entitlementCacheLock = &self->_entitlementCacheLock;
  os_unfair_lock_lock(&self->_entitlementCacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlementCache, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 0;
    else
      v8 = v6;
  }
  else
  {
    v9 = objc_retainAutorelease(v4);
    objc_msgSend(v9, "UTF8String");
    v7 = (void *)xpc_copy_entitlement_for_token();
    if (v7 && (v10 = _CFXPCCreateCFObjectFromXPCObject(), (v8 = (void *)v10) != 0))
    {
      v11 = 0;
      v12 = (void *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v11 = 1;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlementCache, "setObject:forKeyedSubscript:", v12, v9);
    if (v11)

    v6 = v8;
  }
  v13 = v8;

  os_unfair_lock_unlock(p_entitlementCacheLock);
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)processType
{
  return self->_processType;
}

- (void)cacheValuesForEntitlements:(id)a3
{
  void *v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  os_unfair_lock_t lock;
  id v19;
  NSObject *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  lock = &self->_entitlementCacheLock;
  os_unfair_lock_lock(&self->_entitlementCacheLock);
  v5 = xpc_copy_entitlement_for_token();
  v6 = (void *)v5;
  if (!v5 || MEMORY[0x1AF456F50](v5) == MEMORY[0x1E0C812F8])
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v19;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      obj = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i));
          xpc_dictionary_get_value(v6, (const char *)objc_msgSend(v12, "UTF8String"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && (v14 = _CFXPCCreateCFObjectFromXPCObject(), (v15 = (void *)v14) != 0))
          {
            v16 = 0;
            v17 = (void *)v14;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 0;
            v16 = 1;
            v17 = v3;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlementCache, "setObject:forKeyedSubscript:", v17, v12);
          if (v16)

        }
        v7 = obj;
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v9);
    }
  }
  else
  {
    __biome_log_for_category(6);
    v7 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x2020000000;
    v29 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__BMProcess_cacheValuesForEntitlements___block_invoke;
    block[3] = &unk_1E5E3C680;
    block[4] = buf;
    if (cacheValuesForEntitlements__onceToken != -1)
      dispatch_once(&cacheValuesForEntitlements__onceToken, block);
    v8 = v27[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v7, v8, "Failed to cache entitlements", buf, 2u);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (BMProcess)initWithAuditToken:(id *)a3
{
  __int128 v3;
  BMProcess *v4;
  void *v5;
  _OWORD v7[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v3;
  v4 = -[BMProcess _initWithAuditToken:](self, "_initWithAuditToken:", v7);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1AF4569E0]();
    -[BMProcess _initializeProcessProperties](v4, "_initializeProcessProperties");
    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (void)_initializeProcessProperties
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_2(&dword_1AEB31000, v2, v3, "Warning: Not trusting process %{public}@(%d)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (id)_initWithAuditToken:(id *)a3
{
  char *v4;
  _QWORD *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BMProcess;
  v4 = -[BMProcess init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 8) = v6;
    *((_DWORD *)v4 + 12) = 0;
    v7 = objc_opt_new();
    v8 = (void *)v5[7];
    v5[7] = v7;

    *((_DWORD *)v5 + 16) = 0;
    v9 = (void *)v5[9];
    v5[9] = 0;

    *((_DWORD *)v5 + 20) = 0;
    v10 = objc_opt_new();
    v11 = (void *)v5[11];
    v5[11] = v10;

    v5[13] = 0;
  }
  return v5;
}

- (BOOL)_canTrustApplicationIdentifierEntitlement
{
  return 1;
}

- (BOOL)BOOLForEntitlement:(id)a3
{
  void *v3;
  char v4;

  -[BMProcess valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AAB0]);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_machLookupCache, 0);
  objc_storeStrong((id *)&self->_reliesOnCoreDuetAccess, 0);
  objc_storeStrong((id *)&self->_entitlementCache, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
}

void __20__BMProcess_current__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  BMProcessCurrent *v2;
  void *v3;
  _OWORD v4[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v7;

  *(_OWORD *)task_info_out = 0u;
  v7 = 0u;
  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt))
  {
    __biome_log_for_category(0);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      __20__BMProcess_current__block_invoke_cold_1();

    v1 = 0;
  }
  else
  {
    v2 = [BMProcessCurrent alloc];
    v4[0] = *(_OWORD *)task_info_out;
    v4[1] = v7;
    v1 = -[BMProcess initWithAuditToken:](v2, "initWithAuditToken:", v4);
  }
  v3 = (void *)current_instance;
  current_instance = v1;

}

+ (BMProcess)processWithXPCConnection:(id)a3
{
  return -[NSXPCConnection bm_process]((BMProcess *)a3);
}

- (int)pid
{
  return self->_pid;
}

- (NSSet)useCases
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  const __CFString *v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32[0] = CFSTR("com.apple.private.intelligenceplatform.use-cases");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_allows_internal_security_policies())
  {
    v31 = CFSTR("com.apple.internal.intelligenceplatform.use-cases");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[BMProcess dictionaryForEntitlement:](self, "dictionaryForEntitlement:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
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
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v2, "addObject:", v16);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v2, "copy");
  return (NSSet *)v17;
}

+ (id)current
{
  if (current_onceToken != -1)
    dispatch_once(&current_onceToken, &__block_literal_global_6);
  return (id)current_instance;
}

- (BOOL)canPerformGlobalMachLookup:(id)a3 report:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_unfair_lock_s *p_machLookupCacheLock;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  _OWORD v17[2];

  v4 = a4;
  v6 = a3;
  p_machLookupCacheLock = &self->_machLookupCacheLock;
  os_unfair_lock_lock(&self->_machLookupCacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_machLookupCache, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = 1;
    switch(objc_msgSend(v8, "intValue"))
    {
      case 0xFFFFFFFF:
        __biome_log_for_category(6);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMProcess canPerformGlobalMachLookup:report:].cold.1();

        goto LABEL_11;
      case 0u:
        break;
      case 1u:
        if (v4)
          goto LABEL_7;
        goto LABEL_11;
      case 2u:
LABEL_11:
        v10 = 0;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    if (v4)
      v12 = 2;
    else
      v12 = *MEMORY[0x1E0C806B0] | 2u;
    v13 = *(_OWORD *)&self->_auditToken.val[4];
    v17[0] = *(_OWORD *)self->_auditToken.val;
    v17[1] = v13;
    v14 = BMSandboxCheck(v17, CFSTR("mach-lookup"), v12, v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_machLookupCache, "setObject:forKeyedSubscript:", v15, v6);

    v10 = (_DWORD)v14 == 0;
  }

  os_unfair_lock_unlock(p_machLookupCacheLock);
  return v10;
}

- (NSString)executableName
{
  void *v2;
  void *v3;

  -[BMProcess executablePath](self, "executablePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)executablePath
{
  NSString *executablePath;
  void *v5;
  int v6;
  int v7;
  NSString *v8;
  NSString *v9;
  _BYTE buffer[4096];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  executablePath = self->_executablePath;
  if (!executablePath)
  {
    self->_executablePath = (NSString *)&stru_1E5E40E10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[BMProcess canPerformSyscall:report:](self, "canPerformSyscall:report:", &unk_1E5E48B58, 0))
        return (NSString *)0;
    }
    else
    {
      +[BMProcess current](BMProcess, "current");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "canPerformSyscall:report:", &unk_1E5E48B58, 0);

      if (!v6)
        return (NSString *)0;
    }
    v7 = proc_pidpath_audittoken((audit_token_t *)&self->_auditToken, buffer, 0x1000u);
    if (v7 >= 1)
    {
      v8 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v7, 4);
      v9 = self->_executablePath;
      self->_executablePath = v8;

    }
    return self->_executablePath;
  }
  if ((-[NSString isEqual:](executablePath, "isEqual:", &stru_1E5E40E10) & 1) != 0)
    return (NSString *)0;
  return self->_executablePath;
}

- (BOOL)canPerformSyscall:(id)a3 report:(BOOL)a4
{
  __int128 v5;
  uint64_t v6;
  _OWORD v8[2];

  v5 = *(_OWORD *)&self->_auditToken.val[4];
  if (a4)
    v6 = 14;
  else
    v6 = *MEMORY[0x1E0C806B0] | 0xEu;
  v8[0] = *(_OWORD *)self->_auditToken.val;
  v8[1] = v5;
  return BMSandboxCheck(v8, CFSTR("syscall-unix"), v6, a3) == 0;
}

- (BOOL)canPerformFileOperation:(id)a3 onPath:(id)a4 report:(BOOL)a5
{
  __int128 v6;
  uint64_t v7;
  _OWORD v9[2];

  v6 = *(_OWORD *)&self->_auditToken.val[4];
  if (a5)
    v7 = 1;
  else
    v7 = *MEMORY[0x1E0C806B0] | 1u;
  v9[0] = *(_OWORD *)self->_auditToken.val;
  v9[1] = v6;
  return BMSandboxCheck(v9, a3, v7, a4) == 0;
}

- (BOOL)isSandboxed
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  v4[0] = *(_OWORD *)self->_auditToken.val;
  v4[1] = v2;
  return BMSandboxCheck(v4, 0, 0, 0) != 0;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BMProcess)init
{
  NSObject *v3;

  __biome_log_for_category(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BMProcess init].cold.1();

  return 0;
}

uint64_t __40__BMProcess_cacheValuesForEntitlements___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)hasDatavaultEntitlement
{
  return -[BMProcess BOOLForEntitlement:](self, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.Biome"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProcess executableName](self, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<BMProcess %@(%d) %@>"), v4, self->_pid, self->_identifier);

  return v5;
}

- (unsigned)uid
{
  return self->_uid;
}

void __20__BMProcess_current__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AEB31000, v0, v1, "Failed to get audit token of self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AEB31000, v0, v1, "BMProcess requires an audit token!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)canPerformGlobalMachLookup:report:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1AEB31000, v0, OS_LOG_TYPE_ERROR, "Skipping sandbox check, but cached value is an error", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
