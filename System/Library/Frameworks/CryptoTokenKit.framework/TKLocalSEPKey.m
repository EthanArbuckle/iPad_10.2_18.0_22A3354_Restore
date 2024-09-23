@implementation TKLocalSEPKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  char v17;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v17 = 0;
  v15 = -[TKLocalSEPSystemKey _initWithObjectID:authContext:caller:isIDUnknown:error:]([TKLocalSEPSystemKey alloc], "_initWithObjectID:authContext:caller:isIDUnknown:error:", v12, v13, v14, &v17, a7);

  if (!v15)
  {
    if (v17)
      v15 = -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:]([TKLocalSEPRefKey alloc], "_initWithObjectID:authContext:caller:forceSystemSession:error:", v12, v13, v14, v8, a7);
    else
      v15 = 0;
  }

  return v15;
}

- (id)_initWithAuthContext:(id)a3 caller:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TKLocalSEPKey;
  v8 = -[TKSEPKey _initWithAuthContext:](&v11, sel__initWithAuthContext_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 3, a4);

  return v9;
}

+ (id)protectionForKeyClass:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (protectionForKeyClass__once != -1)
    dispatch_once(&protectionForKeyClass__once, &__block_literal_global_116);
  v4 = (void *)protectionForKeyClass__protections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)*MEMORY[0x1E0CD68E8];
  v8 = v7;

  return v8;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_sac;
}

- (void)setSac:(id)a3
{
  objc_storeStrong(&self->_sac, a3);
}

+ (int)keybagHandleForceSystemSession:(BOOL)a3
{
  NSObject *v4;

  if (_enableTesting)
    return _testingKeybagHandle;
  if (_testing_keybagHandle)
    return objc_msgSend((id)_testing_keybagHandle, "intValue", a3);
  if (!a3)
    return 0;
  TK_LOG_sepkey_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[TKLocalSEPKey keybagHandleForceSystemSession:].cold.1();

  return -6;
}

- (id)parametersWithACMHandle:(id)a3
{
  id v4;
  TKAKSParameters *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(TKAKSParameters);
  -[TKAKSParameters setData:forKey:](v5, "setData:forKey:", v4, 3);

  -[TKLocalSEPKey encodedAccessGroups](self, "encodedAccessGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKAKSParameters setData:forKey:](v5, "setData:forKey:", v6, 1);

  return v5;
}

- (id)encodedAccessGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TKBERTLVRecord *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKLocalSEPKey sac](self, "sac");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", CFSTR("keychain-access-groups"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = (void *)MEMORY[0x1E0C9AA60];
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", CFSTR("application-identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "addObject:", v8);
    if (objc_msgSend(v7, "count"))
    {
      -[TKLocalSEPKey accessControl](self, "accessControl");
      SecAccessControlGetConstraints();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey processAccessGroupsOfACLDictionary:intoGroups:callerGroups:](self, "processAccessGroupsOfACLDictionary:intoGroups:callerGroups:", v9, v3, v7);

    }
  }
  v10 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v3);
  -[TKTLVRecord data](v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)authContextWithError:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  TKAuthContext *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[TKSEPKey authContext](self, "authContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = 0;
LABEL_7:
    -[NSObject externalizedContext](v5, "externalizedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[TKAuthContext initWithLAContext:ACMHandle:sharedResource:]([TKAuthContext alloc], "initWithLAContext:ACMHandle:sharedResource:", v5, v8, v6);
    }
    else
    {
      TK_LOG_sepkey_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[TKLocalSEPKey authContextWithError:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

      if (a3)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D50];
        v22[0] = CFSTR("LAContext.externalizedContext failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, v19);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (contextErrorHandler)
        (*(void (**)(void))(contextErrorHandler + 16))();
      v9 = 0;
    }

    goto LABEL_17;
  }
  if (authContextWithError__onceToken != -1)
    dispatch_once(&authContextWithError__onceToken, &__block_literal_global_103);
  objc_msgSend((id)authContextWithError__sharedResourceSlot, "resourceWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = v7;
    goto LABEL_7;
  }
  TK_LOG_sepkey_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[TKLocalSEPKey authContextWithError:].cold.1((uint64_t *)a3, v5);
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  CFErrorRef error;

  v4 = (__CFString *)a3;
  if (_testingCallerEntitlements)
  {
    objc_msgSend((id)_testingCallerEntitlements, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TKLocalSEPKey caller](self, "caller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TKLocalSEPKey caller](self, "caller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForEntitlement:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (valueForEntitlement__onceToken != -1)
        dispatch_once(&valueForEntitlement__onceToken, &__block_literal_global_85);
      error = 0;
      v5 = (void *)SecTaskCopyValueForEntitlement((SecTaskRef)valueForEntitlement__selfTask, v4, &error);

    }
  }

  return v5;
}

- (void)processAccessGroupsOfACLDictionary:(id)a3 intoGroups:(id)a4 callerGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  TKLocalSEPKey *v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke;
  v12[3] = &unk_1E7089CD0;
  v13 = v9;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);

}

id __38__TKLocalSEPKey_authContextWithError___block_invoke_2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  do
    v0 = __ldaxr((unsigned int *)&TKAuthContextSerialNumber);
  while (__stlxr(v0 + 1, (unsigned int *)&TKAuthContextSerialNumber));
  TK_LOG_sepkey_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return objc_alloc_init(MEMORY[0x1E0CC12A0]);
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (id)sac
{
  return self->_sac;
}

+ (BOOL)hasSEP
{
  return MGGetBoolAnswer();
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

SecTaskRef __37__TKLocalSEPKey_valueForEntitlement___block_invoke()
{
  SecTaskRef result;

  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  valueForEntitlement__selfTask = (uint64_t)result;
  return result;
}

void __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("cag")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      if (objc_msgSend(a1[4], "containsObject:", v6))
        objc_msgSend(a1[5], "addObject:", v6);
LABEL_17:

      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
            if (objc_msgSend(a1[4], "containsObject:", v11, (_QWORD)v12))
              objc_msgSend(a1[5], "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }
      goto LABEL_17;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1[6], "processAccessGroupsOfACLDictionary:intoGroups:callerGroups:", v5, a1[5], a1[4]);
  }
LABEL_18:

}

+ (void)setContextErrorHandler:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x1BCCC4AEC](a3, a2);
  v4 = (void *)contextErrorHandler;
  contextErrorHandler = v3;

}

- (BOOL)evaluateRequirementIgnoringAccessGroups:(__ACMRequirement *)a3
{
  int Type;
  uint64_t v6;
  BOOL v7;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  Type = ACMRequirementGetType(a3, a2);
  if (Type == 8)
  {
    if (ACMRequirementGetState(a3) == 2)
      return 1;
    return ACMRequirementGetState(a3) == 1;
  }
  else
  {
    if (Type == 7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v6 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke;
      v15[3] = &unk_1E7089CF8;
      v15[4] = self;
      v15[5] = &v16;
      ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v15);
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2;
      v10[3] = &unk_1E7089D20;
      v10[4] = &v11;
      ACMRequirementGetProperty((int *)a3, 700, (uint64_t)v10);
      v7 = *((_DWORD *)v17 + 6) >= *((_DWORD *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      _Block_object_dispose(&v16, 8);
      return v7;
    }
    return ACMRequirementGetState(a3) == 2;
  }
}

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateRequirementIgnoringAccessGroups:", a2);
  if ((_DWORD)result)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2(uint64_t result, _DWORD *a2, uint64_t a3)
{
  if (a3 == 4)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *a2;
  return result;
}

- (BOOL)error:(id *)a3 withAKSReturn:(int)a4 ACMHandle:(id)a5 AKSOperation:(id)a6 params:(id)a7 message:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _DWORD *v22;
  void *v23;
  TKBERTLVRecord *v24;
  void *v25;
  id v26;
  id v27;
  const void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  _BOOL4 v32;
  id v33;
  _DWORD *v34;
  _DWORD *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  __SecAccessControl *v40;
  void *v42;
  __SecAccessControl *v43;
  void *v44;
  id v46;
  _QWORD v47[6];
  _QWORD v48[3];
  _BYTE buf[24];
  id v50;
  __int16 v51;
  _BYTE v52[10];
  _BYTE v53[10];
  __int16 v54;
  id v55;
  const __CFString *v56;
  _QWORD v57[3];

  v11 = *(_QWORD *)&a4;
  v57[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v46 = a7;
  v15 = a8;
  if (!a3)
  {
LABEL_34:
    TK_LOG_sepkey_0();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      -[TKLocalSEPKey callerName](self, "callerName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[TKLocalSEPKey accessControl](self, "accessControl");
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2114;
      v50 = v15;
      v51 = 1024;
      *(_DWORD *)v52 = v11;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v11;
      *(_WORD *)v53 = 2114;
      *(_QWORD *)&v53[2] = v43;
      v54 = 2114;
      v55 = v46;
      _os_log_error_impl(&dword_1B9768000, v38, OS_LOG_TYPE_ERROR, "%{public}@: (%{public}@) %{public}@: error %08x(%d) ACL=%{public}@ params=%{public}@", buf, 0x40u);

    }
    goto LABEL_36;
  }
  v56 = CFSTR("AKSError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), self, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB2938]);

  }
  if ((_DWORD)v11 == -536870174)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -25308, v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
  if ((_DWORD)v11 == -536363000 && v14)
  {
    TK_LOG_sepkey_0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:].cold.2();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v50) = 0;
    v21 = objc_retainAutorelease(v13);
    v22 = ACMContextCreateWithExternalForm((_OWORD *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
    if (v22)
    {
      -[TKLocalSEPKey sac](self, "sac");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      SecAccessControlGetConstraint();
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v44);
      -[TKTLVRecord data](v24, "data");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[TKLocalSEPKey encodedAccessGroups](self, "encodedAccessGroups");
      v48[0] = 3;
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48[1] = objc_msgSend(v26, "bytes");
      v48[2] = objc_msgSend(v26, "length");
      v27 = objc_retainAutorelease(v25);
      v28 = (const void *)objc_msgSend(v27, "bytes");
      v29 = objc_msgSend(v27, "length");
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke;
      v47[3] = &unk_1E7089D48;
      v47[4] = self;
      v47[5] = buf;
      ACMContextVerifyAclConstraint(v22, v28, v29, 1u, v48, 1u, 0xFFFFFFFF, (uint64_t)v47);
      ACMContextDelete(v22, 0);

    }
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      TK_LOG_sepkey_0();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:].cold.1();

      _Block_object_dispose(buf, 8);
      v31 = -5;
      goto LABEL_29;
    }
    _Block_object_dispose(buf, 8);
    v32 = 0;
  }
  else
  {
    if ((_DWORD)v11 == -536870170)
      v31 = -1;
    else
      v31 = -3;
    if ((_DWORD)v11 != -536363000 && (_DWORD)v11 != -536870194)
      goto LABEL_29;
    v32 = v11 == -536870194;
    if (!v14)
      goto LABEL_25;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("operation"));
LABEL_25:
  v31 = -9;
  if (v13)
  {
    if (v32)
    {
      v33 = objc_retainAutorelease(v13);
      v34 = ACMContextCreateWithExternalForm((_OWORD *)objc_msgSend(v33, "bytes"), objc_msgSend(v33, "length"));
      v35 = v34;
      if (v34)
      {
        ACMContextRemovePassphraseCredentialsByPurposeAndScope(v34, 0, 1);
        ACMContextDelete(v35, 0);
      }
    }
  }
LABEL_29:
  if (!*a3)
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), v31, v37);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v31 != -9)
    goto LABEL_34;
  TK_LOG_sepkey_0();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    -[TKLocalSEPKey callerName](self, "callerName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[TKLocalSEPKey accessControl](self, "accessControl");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2114;
    v50 = v14;
    v51 = 2114;
    *(_QWORD *)v52 = v40;
    *(_WORD *)&v52[8] = 2114;
    *(_QWORD *)v53 = v46;
    _os_log_debug_impl(&dword_1B9768000, v38, OS_LOG_TYPE_DEBUG, "%{public}@: (%{public}@) authentication needed for operation '%{public}@' ACL=%{public}@ params=%{public}@", buf, 0x34u);

  }
LABEL_36:

  return 0;
}

uint64_t __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke(uint64_t result, int a2, char a3, uint64_t a4)
{
  uint64_t v4;

  if (!a2 && (a3 & 1) == 0)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "evaluateRequirementIgnoringAccessGroups:", a4);
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __38__TKLocalSEPKey_authContextWithError___block_invoke()
{
  TKSharedResourceSlot *v0;
  void *v1;

  v0 = -[TKSharedResourceSlot initWithName:]([TKSharedResourceSlot alloc], "initWithName:", CFSTR("LAContext/ACMHandle temporary default slot"));
  v1 = (void *)authContextWithError__sharedResourceSlot;
  authContextWithError__sharedResourceSlot = (uint64_t)v0;

  objc_msgSend((id)authContextWithError__sharedResourceSlot, "setIdleTimeout:", 3.0);
  objc_msgSend((id)authContextWithError__sharedResourceSlot, "setCreateObjectBlock:", &__block_literal_global_108);
  return objc_msgSend((id)authContextWithError__sharedResourceSlot, "setObjectDestroyedBlock:", &__block_literal_global_112);
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_110()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  TK_LOG_sepkey_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __38__TKLocalSEPKey_authContextWithError___block_invoke_110_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

+ (id)_testing_keybagHandle
{
  return (id)_testing_keybagHandle;
}

+ (void)set_testing_keybagHandle:(id)a3
{
  objc_storeStrong((id *)&_testing_keybagHandle, a3);
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  if (a3)
  {
    if (!_testingKeybagHandle)
    {
      if (aks_create_bag())
      {
        TK_LOG_sepkey_0();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
          +[TKLocalSEPKey setupKeybagForTesting:].cold.3();

      }
      if (aks_ref_key_enable_test_keys())
      {
        TK_LOG_sepkey_0();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          +[TKLocalSEPKey setupKeybagForTesting:].cold.2();

      }
      aks_get_device_state();
      TK_LOG_sepkey_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        +[TKLocalSEPKey setupKeybagForTesting:].cold.1();

    }
  }
  else if (_testingKeybagHandle)
  {
    if (aks_save_bag())
    {
      TK_LOG_sepkey_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        +[TKLocalSEPKey setupKeybagForTesting:].cold.6();

    }
    if (aks_unload_bag())
    {
      TK_LOG_sepkey_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[TKLocalSEPKey setupKeybagForTesting:].cold.5();

    }
    if (aks_invalidate_bag())
    {
      TK_LOG_sepkey_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        +[TKLocalSEPKey setupKeybagForTesting:].cold.4();

    }
  }
  _enableTesting = a3;
}

+ (id)_testing_callerEntitlements
{
  return (id)_testingCallerEntitlements;
}

+ (void)set_testing_callerEntitlements:(id)a3
{
  objc_storeStrong((id *)&_testingCallerEntitlements, a3);
}

void __39__TKLocalSEPKey_protectionForKeyClass___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[8];
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD68E8];
  v9[0] = &unk_1E7097678;
  v9[1] = &unk_1E7097690;
  v1 = *MEMORY[0x1E0CD68A8];
  v10[0] = v0;
  v10[1] = v1;
  v2 = *MEMORY[0x1E0CD68C0];
  v9[2] = &unk_1E70976A8;
  v9[3] = &unk_1E70976C0;
  v3 = *MEMORY[0x1E0CD68F0];
  v10[2] = v2;
  v10[3] = v3;
  v4 = *MEMORY[0x1E0CD68B0];
  v9[4] = &unk_1E70976D8;
  v9[5] = &unk_1E70976F0;
  v5 = *MEMORY[0x1E0CD68D0];
  v10[4] = v4;
  v10[5] = v5;
  v9[6] = &unk_1E7097708;
  v9[7] = &unk_1E7097720;
  v6 = *MEMORY[0x1E0CD68D8];
  v10[6] = *MEMORY[0x1E0CD68E0];
  v10[7] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 8);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)protectionForKeyClass__protections;
  protectionForKeyClass__protections = v7;

}

+ (int)keyClassForProtection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  v4 = v3;
  if (keyClassForProtection__once == -1)
  {
    if (!v3)
    {
LABEL_6:
      v7 = 6;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&keyClassForProtection__once, &__block_literal_global_125);
    if (!v4)
      goto LABEL_6;
  }
  objc_msgSend((id)keyClassForProtection__protections, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  v7 = objc_msgSend(v5, "integerValue");

LABEL_7:
  return v7;
}

void __39__TKLocalSEPKey_keyClassForProtection___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD68A8];
  v6[0] = *MEMORY[0x1E0CD68E8];
  v6[1] = v0;
  v7[0] = &unk_1E7097678;
  v7[1] = &unk_1E7097690;
  v1 = *MEMORY[0x1E0CD68F0];
  v6[2] = *MEMORY[0x1E0CD68C0];
  v6[3] = v1;
  v7[2] = &unk_1E70976A8;
  v7[3] = &unk_1E70976C0;
  v2 = *MEMORY[0x1E0CD68D0];
  v6[4] = *MEMORY[0x1E0CD68B0];
  v6[5] = v2;
  v7[4] = &unk_1E70976D8;
  v7[5] = &unk_1E70976F0;
  v3 = *MEMORY[0x1E0CD68D8];
  v6[6] = *MEMORY[0x1E0CD68E0];
  v6[7] = v3;
  v7[6] = &unk_1E7097708;
  v7[7] = &unk_1E7097720;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)keyClassForProtection__protections;
  keyClassForProtection__protections = v4;

}

- (BOOL)systemKey
{
  return 0;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;

  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  LOBYTE(v22) = a9;
  v20 = -[TKLocalSEPRefKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]([TKLocalSEPRefKey alloc], "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:", v19, a4, a5, v18, v17, v16, v22, a10);

  return v20;
}

- (BOOL)callerHasEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  v6 = a3;
  -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    TK_LOG_sepkey_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[TKLocalSEPKey callerHasEntitlement:error:].cold.1(self, (uint64_t)v6, v9);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)callerName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *callerName;
  audit_token_t audittoken;

  if (!self->_callerName)
  {
    -[TKLocalSEPKey caller](self, "caller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      memset(&audittoken, 0, sizeof(audittoken));
      -[TKLocalSEPKey caller](self, "caller");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        objc_msgSend(v4, "auditToken");
      else
        memset(&audittoken, 0, sizeof(audittoken));

      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4096);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = proc_pidpath_audittoken(&audittoken, (void *)objc_msgSend(v9, "mutableBytes"), objc_msgSend(v9, "length"));
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v6 = objc_retainAutorelease(v9);
      v12 = (void *)objc_msgSend(v11, "initWithBytes:length:encoding:", objc_msgSend(v6, "bytes"), v10, 4);
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey caller](self, "caller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@<%d>"), v14, objc_msgSend(v15, "processIdentifier"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      callerName = self->_callerName;
      self->_callerName = v16;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_callerName;
      self->_callerName = v7;

    }
  }
  return self->_callerName;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sac, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Authentication failure due to access groups detected, forcing hard failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Checking whether kAKSReturnPolicyError is because of unsatisfied access groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)authContextWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1)
    v2 = *a1;
  else
    v2 = 0;
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_1B9768000, a2, OS_LOG_TYPE_FAULT, "failed to create shared resource: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)authContextWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, a1, a3, "LAContext.externalizedContext(sn=%d) failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_1B9768000, a2, a3, "creating temporary context(sn=%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_110_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  atomic_load((unsigned int *)&TKAuthContextSerialNumber);
  OUTLINED_FUNCTION_10_0(&dword_1B9768000, a1, a3, "deleting temporary context(sn=%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)keybagHandleForceSystemSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "using system_keychain_handle, forced by client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_1B9768000, v0, OS_LOG_TYPE_FAULT, "Test keys not enabled for testing keybag!", v1, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, v0, v1, "Failed to enable test keys, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, v0, v1, "Failed to create testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, v0, v1, "Failed to invalidate testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, v0, v1, "Failed to unload testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2_0(&dword_1B9768000, v0, v1, "Failed to save testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)callerHasEntitlement:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "callerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_fault_impl(&dword_1B9768000, a3, OS_LOG_TYPE_FAULT, "Requested SEP key operation not allowed (%{public}@ is missing '%{public}@' entitlement)", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

@end
