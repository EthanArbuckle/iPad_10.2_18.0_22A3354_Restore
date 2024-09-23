@implementation LAContext

- (LAContext)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4
{
  id v6;
  LAContext *v7;
  NSObject *v8;
  __CFString *v9;
  unsigned int v10;
  unsigned int v11;
  LAClient *v12;
  LAClient *client;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LAContext;
  v7 = -[LAContext init](&v15, sel_init);
  if (!v7)
    goto LABEL_15;
  if (initWithExternalizedContext_userSession__onceToken != -1)
    dispatch_once(&initWithExternalizedContext_userSession__onceToken, &__block_literal_global_12);
  LALogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("with externalized context %x"), objc_msgSend(v6, "hash"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_10;
LABEL_8:
    v10 = *a4;
    if (v10 != geteuid())
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid uid: %d"), *a4);
    goto LABEL_10;
  }
  v9 = CFSTR("new");
  if (a4)
    goto LABEL_8;
LABEL_10:
  v11 = +[LAContext newCommandId](LAContext, "newCommandId");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 1024;
    LODWORD(v19) = v11;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "Creating LAContext %{public}@ cid:%u", buf, 0x12u);
  }
  v7->_instanceId = +[LAContext newInstanceId](LAContext, "newInstanceId");
  v12 = -[LAClient initWithExternalizedContext:userSession:context:]([LAClient alloc], "initWithExternalizedContext:userSession:context:", v6, a4, v7);
  client = v7->_client;
  v7->_client = v12;

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v11;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@ cid:%u", buf, 0x1Cu);
  }

LABEL_15:
  return v7;
}

- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError *)error
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  const __CFString *v18;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  LAContext *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29 = &unk_1E7088038;
  v30[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[LAContext newCommandId](LAContext, "newCommandId");
  LALogForPolicy();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v22 = policy;
    v23 = 2114;
    v24 = self;
    v25 = 1024;
    v26 = v8;
    _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_INFO, "canEvaluatePolicy:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  v20 = 0;
  -[LAContext _evaluatePolicy:options:log:cid:error:](self, "_evaluatePolicy:options:log:cid:error:", policy, v7, 0, v8, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (v10)
    v12 = 1;
  else
    v12 = objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v11, -1004);
  -[LAContext _publicErrorFromInternalError:options:](self, "_publicErrorFromInternalError:options:", v11, v7);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (error)
  {
    if (v12)
      v14 = 0;
    else
      v14 = v13;
    *error = (NSError *)objc_retainAutorelease(v14);
  }
  v15 = v9;
  if ((v12 & 1) != 0)
  {
    v16 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    -[__CFString domain](v13, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.LocalAuthentication")))
      v16 = OS_LOG_TYPE_DEFAULT;
    else
      v16 = OS_LOG_TYPE_ERROR;

  }
  if (os_log_type_enabled(v15, v16))
  {
    v18 = CFSTR("YES");
    *(_DWORD *)buf = 67109890;
    if (!v12)
      v18 = v13;
    v22 = policy;
    v23 = 2114;
    v24 = self;
    v25 = 1024;
    v26 = v8;
    v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_1B971E000, v15, v16, "canEvaluatePolicy:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v12;
}

+ (unsigned)newCommandId
{
  return ++_commandCounter;
}

- (id)_publicErrorFromInternalError:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.LocalAuthentication"));

  v10 = v7;
  if (v9)
  {
    v11 = objc_msgSend(v7, "code");
    v12 = objc_msgSend(v7, "code");
    if (v12 == -4)
    {
      objc_msgSend(v7, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Subcode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && (unint64_t)(objc_msgSend(v14, "integerValue") - 12) <= 2)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E7088008);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v11 = -3;
        if (v15 && !objc_msgSend(v15, "length"))
          v11 = -2;

      }
    }
    else if (v12 == -1018)
    {
      v11 = -6;
    }
    v17 = (void *)MEMORY[0x1E0CC1310];
    objc_msgSend(v7, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CB2938]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithCode:message:", v11, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = *(_QWORD *)&a6;
  v12 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke;
  v15[3] = &unk_1E707A688;
  v15[4] = &v22;
  v15[5] = &v16;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:](self, "_evaluatePolicy:options:log:cid:synchronous:reply:", a3, v12, a5, v8, 1, v15);
  if (a7)
    *a7 = objc_retainAutorelease((id)v17[5]);
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  int64_t v24;
  unsigned int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  unsigned int v35;
  uint64_t v36;

  v9 = a7;
  v36 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a8;
  if (a5)
  {
    -[LAContext description](self, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LALogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = "async";
      *(_DWORD *)buf = 67110146;
      v27 = a3;
      if (v9)
        v18 = "sync";
      v28 = 2114;
      v29 = v14;
      v30 = 2114;
      v31 = v16;
      v32 = 2082;
      v33 = v18;
      v34 = 1024;
      v35 = a6;
      _os_log_impl(&dword_1B971E000, v17, OS_LOG_TYPE_DEFAULT, "evaluatePolicy:%d options:%{public}@ on %{public}@ (%{public}s) cid:%u", buf, 0x2Cu);
    }

  }
  else
  {
    v16 = 0;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke;
  v21[3] = &unk_1E707A660;
  v21[4] = self;
  v22 = v16;
  v25 = a6;
  v23 = v15;
  v24 = a5;
  v19 = v15;
  v20 = v16;
  -[LAContext _evaluatePolicy:options:synchronous:reply:](self, "_evaluatePolicy:options:synchronous:reply:", a3, v14, v9, v21);

}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 synchronous:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v6;
  id v10;
  LAClient *client;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a5;
  v10 = a6;
  client = self->_client;
  v12 = a4;
  -[LAContext uiDelegate](self, "uiDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke;
  v15[3] = &unk_1E7079298;
  v16 = v10;
  v14 = v10;
  -[LAClient evaluatePolicy:options:uiDelegate:synchronous:reply:](client, "evaluatePolicy:options:uiDelegate:synchronous:reply:", a3, v12, v13, v6, v15);

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[LAContext uiDelegate](self, "uiDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[LAContext instanceId](self, "instanceId");
  -[LAClient proxyId](self->_client, "proxyId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    -[LAContext uiDelegate](self, "uiDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("LAContext[%u:%@ uiDelegate:%@]"), v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("LAContext[%u:%@]"), v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (LAUIDelegate)uiDelegate
{
  return -[LAClient uiDelegate](self->_client, "uiDelegate");
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

void __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CC1310];
  v6 = a2;
  objc_msgSend(v5, "redactInternalError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", &unk_1E7087FF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hashWithBundleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEvaluatedPolicyDomainState:", v10);
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("BiometryDatabaseHash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hashWithBundleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEvaluatedPolicyDomainState:", v13);

    objc_msgSend(v7, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BiometryType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_cachedBiometryType;
    _cachedBiometryType = v15;
  }

LABEL_6:
  if (*(_QWORD *)(a1 + 56))
  {
    LALogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_DWORD *)(a1 + 64);
      if (v5)
        v19 = v5;
      else
        v19 = v7;
      v21 = 138543874;
      v22 = v17;
      v23 = 1024;
      v24 = v18;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_1B971E000, v16, OS_LOG_TYPE_DEFAULT, "evaluatePolicy on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v21, 0x1Cu);
    }

  }
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, id, void *))(v20 + 16))(v20, v5, v7);

}

void __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)setEvaluatedPolicyDomainState:(id)a3
{
  objc_storeStrong((id *)&self->_evaluatedPolicyDomainState, a3);
}

- (id)_hashWithBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D443D0];
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = a3;
    objc_msgSend(v4, "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saltHash:withBundleID:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter_0;
}

uint64_t __53__LAContext_initWithExternalizedContext_userSession___block_invoke()
{
  return LALogSetProcessCategory();
}

- (LAContext)init
{
  return -[LAContext initWithExternalizedContext:](self, "initWithExternalizedContext:", 0);
}

- (LAContext)initWithExternalizedContext:(id)a3
{
  return -[LAContext initWithExternalizedContext:userSession:](self, "initWithExternalizedContext:userSession:", a3, 0);
}

- (void)authorizeOperation:(int64_t)a3 protectedBy:(__SecAccessControl *)a4 options:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E7087F30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, &unk_1E7087F30);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v14 = (void *)getLAContextUITrampolineClass_softClass;
  v28 = getLAContextUITrampolineClass_softClass;
  v15 = MEMORY[0x1E0C809B0];
  if (!getLAContextUITrampolineClass_softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __getLAContextUITrampolineClass_block_invoke;
    v24[3] = &unk_1E70792C0;
    v24[4] = &v25;
    __getLAContextUITrampolineClass_block_invoke((uint64_t)v24);
    v14 = (void *)v26[3];
  }
  v16 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v25, 8);
  if (-[LAContext _useModernAuthorizationSheet](self, "_useModernAuthorizationSheet")
    && v16
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke;
    v22[3] = &unk_1E7079298;
    v17 = &v23;
    v23 = v11;
    v18 = v11;
    objc_msgSend(v16, "evaluateAccessControl:context:operation:options:presentationContext:reply:", a4, self, a3, v13, v12, v22);
  }
  else
  {
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke_2;
    v20[3] = &unk_1E7079298;
    v17 = &v21;
    v21 = v11;
    v19 = v11;
    -[LAContext evaluateAccessControl:operation:options:reply:](self, "evaluateAccessControl:operation:options:reply:", a4, a3, v13, v20);
  }

}

uint64_t __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__LAContext_Authorization__authorizeOperation_protectedBy_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)evaluateRight:(id)a3 localizedReason:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "setContext:", self);
  objc_msgSend(v10, "authorizeWithLocalizedReason:completion:", v9, v8);

}

- (void)checkCanEvaluateRight:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setContext:", self);
  objc_msgSend(v7, "checkCanAuthorizeWithCompletion:", v6);

}

- (BOOL)_useModernAuthorizationSheet
{
  return 0;
}

+ (void)notifyEvent:(int64_t)a3
{
  +[LAContext notifyEvent:completionHandler:](LAContext, "notifyEvent:completionHandler:", a3, 0);
}

+ (void)notifyEvent:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t *v15;
  int64_t v16;
  unsigned int v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (notifyEvent_completionHandler__onceToken != -1)
    dispatch_once(&notifyEvent_completionHandler__onceToken, &__block_literal_global_9);
  LALogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = +[LAContext newCommandId](LAContext, "newCommandId");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = a3;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl(&dword_1B971E000, v6, OS_LOG_TYPE_DEFAULT, "notifyEvent:%d cid:%u", buf, 0xEu);
  }
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = (id)objc_opt_new();
  v8 = (void *)*((_QWORD *)v19 + 5);
  +[LAContext _optionsForEvent:](LAContext, "_optionsForEvent:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__LAContext_notifyEvent_completionHandler___block_invoke_5;
  v12[3] = &unk_1E707A570;
  v10 = v6;
  v17 = v7;
  v13 = v10;
  v15 = buf;
  v16 = a3;
  v11 = v5;
  v14 = v11;
  objc_msgSend(v8, "notifyEvent:options:reply:", a3, v9, v12);

  _Block_object_dispose(buf, 8);
}

uint64_t __43__LAContext_notifyEvent_completionHandler___block_invoke()
{
  return LALogSetProcessCategory();
}

void __43__LAContext_notifyEvent_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_DWORD *)(a1 + 64);
    v9 = CFSTR("success");
    if (!(_DWORD)a2)
      v9 = v5;
    v13[0] = 67109634;
    v13[1] = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1B971E000, v6, OS_LOG_TYPE_INFO, "notifyEvent:%d cid:%u returned %{public}@", (uint8_t *)v13, 0x18u);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);

}

+ (id)_optionsForEvent:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((a3 | 2) != 2)
    return 0;
  v6 = &unk_1E7087FD8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (LAContext)initWithUIDelegate:(id)a3
{
  return -[LAContext initWithExternalizedContext:uiDelegate:](self, "initWithExternalizedContext:uiDelegate:", 0, a3);
}

- (LAContext)initWithExternalizedContext:(id)a3 uiDelegate:(id)a4
{
  id v6;
  LAContext *v7;

  v6 = a4;
  v7 = -[LAContext initWithExternalizedContext:](self, "initWithExternalizedContext:", a3);
  -[LAContext setUiDelegate:](v7, "setUiDelegate:", v6);

  return v7;
}

- (LAContext)initWithCoder:(id)a3
{
  id v4;
  LAContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LAClient *v11;
  LAClient *client;
  NSObject *v13;
  int v14;
  int v15;
  objc_super v17[2];
  objc_super v18;
  uint8_t buf[4];
  LAContext *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LAContext;
  v5 = -[LAContext init](&v18, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_21);
    objc_msgSend(v4, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Token"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CC1330];
    if (v6)
      objc_msgSend(v6, "auditToken");
    else
      memset(v17, 0, sizeof(v17));
    objc_msgSend(v9, "auditTokenToData:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_instanceId = +[LAContext newInstanceId](LAContext, "newInstanceId");
    v11 = -[LAClient initWithUUID:token:senderAuditTokenData:context:]([LAClient alloc], "initWithUUID:token:senderAuditTokenData:context:", v7, v8, v10, v5);
    client = v5->_client;
    v5->_client = v11;

    LALogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v7, "hash");
      v15 = objc_msgSend(v8, "hash");
      *(_DWORD *)buf = 138543874;
      v20 = v5;
      v21 = 1024;
      v22 = v14;
      v23 = 1024;
      v24 = v15;
      _os_log_impl(&dword_1B971E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created with uuid: %x token: %x", buf, 0x18u);
    }

  }
  return v5;
}

uint64_t __27__LAContext_initWithCoder___block_invoke()
{
  return LALogSetProcessCategory();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  LAContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  -[LAClient invalidateWithMessage:](self->_client, "invalidateWithMessage:", CFSTR("context dealloc"));
  v4.receiver = self;
  v4.super_class = (Class)LAContext;
  -[LAContext dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)LAContext;
  if (-[LAContext isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LAClient uuid](self->_client, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4[9], "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LAClient uuid](self->_client, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  LAClient *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  LAClient *client;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  int v20;
  unsigned int v21;
  _OWORD v22[2];
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  id v26;
  unsigned int v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAClient uuid](self->_client, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UUID"));

  v10 = objc_msgSend(v8, "processIdentifier");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    v30 = 1024;
    v31 = v10;
    v32 = 1024;
    v33 = v6;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_DEFAULT, "Encoding %{public}@ for transfer to pid:%d cid:%u", buf, 0x18u);
  }
  if ((_DWORD)v10)
  {
    v11 = (void *)MEMORY[0x1E0CC1330];
    if (v8)
      objc_msgSend(v8, "auditToken");
    else
      memset(v22, 0, sizeof(v22));
    objc_msgSend(v11, "auditTokenToData:", v22);
    v14 = objc_claimAutoreleasedReturnValue();
    client = self->_client;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __29__LAContext_encodeWithCoder___block_invoke_36;
    v17[3] = &unk_1E707A600;
    v18 = v5;
    v19 = v7;
    v20 = v10;
    v21 = v6;
    v15 = v7;
    v13 = v5;
    -[LAClient allowTransferToProcess:receiverAuditTokenData:reply:](client, "allowTransferToProcess:receiverAuditTokenData:reply:", v10, v14, v17);

  }
  else
  {
    v12 = self->_client;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __29__LAContext_encodeWithCoder___block_invoke;
    v23[3] = &unk_1E707A5D8;
    v24 = v4;
    v25 = v5;
    v26 = v7;
    v27 = v6;
    v13 = v7;
    v14 = v5;
    -[LAClient tokenForTransferToUnknownProcess:](v12, "tokenForTransferToUnknownProcess:", v23);

    v15 = v24;
  }

}

void __29__LAContext_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v5, CFSTR("Token"));
    v7 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = v7;
      v10 = objc_msgSend(v5, "hash");
      v11 = *(_DWORD *)(a1 + 56);
      v12 = 138543874;
      v13 = v8;
      v14 = 1024;
      v15 = v10;
      v16 = 1024;
      v17 = v11;
      _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_INFO, "Encoded %{public}@ for transfer with token:%x cid:%u", (uint8_t *)&v12, 0x18u);

    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_cold_1();
  }

}

void __29__LAContext_encodeWithCoder___block_invoke_36(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __29__LAContext_encodeWithCoder___block_invoke_36_cold_1(a1, v6);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_36_cold_2();
  }

}

- (void)invalidate
{
  NSObject *v3;
  unsigned int v4;
  void *v5;
  LAClient *client;
  id v7;
  NSObject *v8;
  LAContext *v9;
  _QWORD v10[5];
  NSObject *v11;
  id v12;
  unsigned int v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v5;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "Invalidating %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __23__LAContext_invalidate__block_invoke;
  v10[3] = &unk_1E707A628;
  v10[4] = self;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v7 = v5;
  v8 = v3;
  v9 = self;
  -[LAClient invalidateWithReply:](client, "invalidateWithReply:", v10);

}

void __23__LAContext_invalidate__block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = 0;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversAfterInvalidation");
    v8 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v8 = OS_LOG_TYPE_ERROR;
  }
  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_DWORD *)(a1 + 56);
    v12 = CFSTR("success");
    if (!a2)
      v12 = v5;
    v13 = 138543874;
    v14 = v10;
    v15 = 1024;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_1B971E000, v9, v8, "invalidate %{public}@ cid:%u internally returned %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:](self, "_evaluatePolicy:options:log:cid:synchronous:reply:", a3, v9, LALogCategoryForPolicy(), +[LAContext newCommandId](LAContext, "newCommandId"), 0, v8);

}

- (id)evaluatePolicy:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[LAContext _evaluatePolicy:options:log:cid:error:](self, "_evaluatePolicy:options:log:cid:error:", a3, v8, LALogCategoryForPolicy(), +[LAContext newCommandId](LAContext, "newCommandId"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = localizedReason;
  v9 = reply;
  -[LAContext setEvaluatedPolicyDomainState:](self, "setEvaluatedPolicyDomainState:", 0);
  if (!-[NSString length](v8, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-empty localizedReason must be provided."));
  v17 = &unk_1E7088020;
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[LAContext newCommandId](LAContext, "newCommandId");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke;
  v14[3] = &unk_1E707A6C0;
  v15 = v10;
  v16 = v9;
  v14[4] = self;
  v12 = v10;
  v13 = v9;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:](self, "_evaluatePolicy:options:log:cid:synchronous:reply:", policy, v12, 8, v11, 0, v14);

}

void __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BOOL8 v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2 != 0;
  objc_msgSend(*(id *)(a1 + 32), "_publicErrorFromInternalError:options:", a3, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v3 + 16))(v3, v4, v5);

}

- (id)_evaluationMechanismsFromReturnedError:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:message:", -1011, CFSTR("No authentication required."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("AvailableMechanisms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v11);
LABEL_4:

  return v10;
}

- (id)evaluationMechanismsForPolicy:(int64_t)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  os_log_type_t v13;
  id v14;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  LAContext *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = +[LAContext newCommandId](LAContext, "newCommandId");
  LALogForPolicy();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v18 = a3;
    v19 = 2114;
    v20 = self;
    v21 = 1024;
    v22 = v7;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_INFO, "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  v25 = &unk_1E7088038;
  v26[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = -[LAContext _evaluatePolicy:options:log:cid:error:](self, "_evaluatePolicy:options:log:cid:error:", a3, v9, 0, v7, &v16);
  v11 = v16;

  -[LAContext _evaluationMechanismsFromReturnedError:error:](self, "_evaluationMechanismsFromReturnedError:error:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 16 * (v12 == 0);
  if (os_log_type_enabled(v8, v13))
  {
    if (v12)
      v14 = v12;
    else
      v14 = v11;
    *(_DWORD *)buf = 67109890;
    v18 = a3;
    v19 = 2114;
    v20 = self;
    v21 = 1024;
    v22 = v7;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1B971E000, v8, v13, "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v12;
}

- (id)evaluationMechanismsForAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 error:(id *)a5
{
  NSObject *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  os_log_type_t v16;
  id v17;
  id v19;
  uint8_t buf[4];
  __SecAccessControl *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  id v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v21 = a3;
    v22 = 2114;
    v23 = v11;
    v24 = 1024;
    v25 = v10;
    _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_INFO, "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u", buf, 0x1Cu);
  }
  v28 = &unk_1E7088038;
  v29[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = -[LAContext evaluateAccessControl:operation:options:error:](self, "evaluateAccessControl:operation:options:error:", a3, a4, v12, &v19);
  v14 = v19;

  -[LAContext _evaluationMechanismsFromReturnedError:error:](self, "_evaluationMechanismsFromReturnedError:error:", v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 16 * (v15 == 0);
  if (os_log_type_enabled(v9, v16))
  {
    if (v15)
      v17 = v15;
    else
      v17 = v14;
    *(_DWORD *)buf = 138413058;
    v21 = a3;
    v22 = 2114;
    v23 = v11;
    v24 = 1024;
    v25 = v10;
    v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_1B971E000, v9, v16, "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u returned %{public}@", buf, 0x26u);
  }

  return v15;
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  LAClient *client;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;
  unsigned int v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  LALogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v26 = a3;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v12;
    v31 = 1024;
    v32 = v11;
    _os_log_impl(&dword_1B971E000, v10, OS_LOG_TYPE_INFO, "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u", buf, 0x22u);
  }
  client = self->_client;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__LAContext_failProcessedEvent_failureError_reply___block_invoke;
  v18[3] = &unk_1E707A6F0;
  v22 = v9;
  v23 = a3;
  v19 = v10;
  v20 = v8;
  v24 = v11;
  v21 = v12;
  v14 = v9;
  v15 = v12;
  v16 = v8;
  v17 = v10;
  -[LAClient failProcessedEvent:failureError:reply:](client, "failProcessedEvent:failureError:reply:", a3, v16, v18);

}

void __51__LAContext_failProcessedEvent_failureError_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_DWORD *)(a1 + 72);
    v12 = CFSTR("success");
    if (!(_DWORD)a2)
      v12 = v5;
    v14[0] = 67110146;
    v14[1] = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x2Cu);
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  LAClient *client;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  int64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LALogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v21 = a3;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_INFO, "retryProcessEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__LAContext_retryProcessedEvent_reply___block_invoke;
  v14[3] = &unk_1E707A718;
  v15 = v7;
  v16 = v9;
  v19 = v8;
  v17 = v6;
  v18 = a3;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  -[LAClient retryProcessedEvent:reply:](client, "retryProcessedEvent:reply:", a3, v14);

}

void __39__LAContext_retryProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 64);
    v11 = CFSTR("success");
    if (!(_DWORD)a2)
      v11 = v5;
    v13[0] = 67109890;
    v13[1] = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1B971E000, v6, v7, "retryProcessEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);

}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  LAClient *client;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  int64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LALogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v21 = a3;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_INFO, "resetProcessedEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__LAContext_resetProcessedEvent_reply___block_invoke;
  v14[3] = &unk_1E707A718;
  v15 = v7;
  v16 = v9;
  v19 = v8;
  v17 = v6;
  v18 = a3;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  -[LAClient resetProcessedEvent:reply:](client, "resetProcessedEvent:reply:", a3, v14);

}

void __39__LAContext_resetProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 64);
    v11 = CFSTR("success");
    if (!(_DWORD)a2)
      v11 = v5;
    v13[0] = 67109890;
    v13[1] = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1B971E000, v6, v7, "resetProcessedEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);

}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  LAClient *client;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  int64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v5 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  LALogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v23 = a3;
    v24 = 1024;
    v25 = v5;
    v26 = 2114;
    v27 = v11;
    v28 = 1024;
    v29 = v10;
    _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_INFO, "pauseProcessedEvent:%d pause:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke;
  v16[3] = &unk_1E707A718;
  v17 = v9;
  v18 = v11;
  v21 = v10;
  v19 = v8;
  v20 = a3;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  -[LAClient pauseProcessedEvent:pause:reply:](client, "pauseProcessedEvent:pause:reply:", a3, v5, v16);

}

void __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 64);
    v11 = CFSTR("success");
    if (!(_DWORD)a2)
      v11 = v5;
    v13[0] = 67109890;
    v13[1] = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1B971E000, v6, v7, "pauseProcessedEvent:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);

}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  unsigned int v13;
  void *v14;
  LAClient *client;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  int64_t v23;
  int64_t v24;
  unsigned int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a3;
  LALogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v27 = a4;
    v28 = 1024;
    v29 = a5;
    v30 = 2114;
    v31 = v14;
    v32 = 1024;
    v33 = v13;
    _os_log_impl(&dword_1B971E000, v12, OS_LOG_TYPE_INFO, "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v19[3] = &unk_1E707A740;
  v23 = a4;
  v24 = a5;
  v20 = v12;
  v21 = v14;
  v25 = v13;
  v22 = v10;
  v16 = v10;
  v17 = v14;
  v18 = v12;
  -[LAClient setCredential:forProcessedEvent:credentialType:reply:](client, "setCredential:forProcessedEvent:credentialType:reply:", v11, a4, a5, v19);

}

void __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 72);
    v12 = CFSTR("success");
    if (!(_DWORD)a2)
      v12 = v5;
    v14[0] = 67110146;
    v14[1] = v8;
    v15 = 1024;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 reply:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "numberWithInteger:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:](self, "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:", a3, v13, v12, LALogCategoryForOptions(), +[LAContext newCommandId](LAContext, "newCommandId"), 0, v11);

}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 reply:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a5;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:](self, "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:", a3, a4, v11, LALogCategoryForOptions(), +[LAContext newCommandId](LAContext, "newCommandId"), 0, v10);

}

- (void)_evaluateAccessControl:(__SecAccessControl *)a3 operation:(id)a4 options:(id)a5 log:(int64_t)a6 cid:(unsigned int)a7 synchronous:(BOOL)a8 reply:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  LAClient *client;
  void *v22;
  id v23;
  id v24;
  _BOOL4 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __SecAccessControl *v29;
  int64_t v30;
  unsigned int v31;
  uint8_t buf[4];
  __SecAccessControl *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v25 = a8;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a9;
  if (a6)
  {
    -[LAContext description](self, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LALogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "async";
      *(_DWORD *)buf = 138544642;
      v33 = a3;
      if (v25)
        v19 = "sync";
      v34 = 2114;
      v35 = v14;
      v36 = 2114;
      v37 = v15;
      v38 = 2114;
      v39 = v17;
      v40 = 2082;
      v41 = v19;
      v42 = 1024;
      v43 = a7;
      _os_log_impl(&dword_1B971E000, v18, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl:%{public}@ operation:%{public}@ options:%{public}@ on %{public}@ (%{public}s) cid:%u", buf, 0x3Au);
    }

    if (a3)
      goto LABEL_7;
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v17 = 0;
  if (!a3)
    goto LABEL_9;
LABEL_7:
  v20 = (void *)SecAccessControlCopyData();
LABEL_10:
  client = self->_client;
  -[LAContext uiDelegate](self, "uiDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke;
  v26[3] = &unk_1E707A768;
  v29 = a3;
  v30 = a6;
  v31 = a7;
  v27 = v17;
  v28 = v16;
  v23 = v16;
  v24 = v17;
  -[LAClient evaluateACL:operation:options:uiDelegate:synchronous:reply:](client, "evaluateACL:operation:options:uiDelegate:synchronous:reply:", v20, v14, v15, v22, v25, v26);

}

void __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  _BYTE v13[12];
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    *(_QWORD *)v13 = 0;
    if (!LAUpdateAccessControl(*(_QWORD *)(a1 + 48), v5, v13))
    {

      v7 = *(void **)v13;
      v5 = 0;
      v6 = v7;
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    LALogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_DWORD *)(a1 + 64);
      if (v5)
        v11 = v5;
      else
        v11 = v6;
      *(_DWORD *)v13 = 138543874;
      *(_QWORD *)&v13[4] = v9;
      v14 = 1024;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl on %{public}@ cid:%u returned %{public}@", v13, 0x1Cu);
    }

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);

}

- (void)evaluateAccessControl:(SecAccessControlRef)accessControl operation:(LAAccessControlOperation)operation localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = localizedReason;
  v11 = reply;
  if (!-[NSString length](v10, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-empty localizedReason must be provided."));
  v21 = &unk_1E7088020;
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", operation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = LALogCategoryForOptions();
  v15 = +[LAContext newCommandId](LAContext, "newCommandId");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke;
  v18[3] = &unk_1E707A6C0;
  v19 = v12;
  v20 = v11;
  v18[4] = self;
  v16 = v12;
  v17 = v11;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:](self, "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:", accessControl, v13, v16, v14, v15, 0, v18);

}

void __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BOOL8 v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = a2 != 0;
    objc_msgSend(*(id *)(a1 + 32), "_publicErrorFromInternalError:options:", a3, *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, id))(v3 + 16))(v3, v4, v5);

  }
}

- (id)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = LALogCategoryForOptions();
  v13 = +[LAContext newCommandId](LAContext, "newCommandId");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke;
  v16[3] = &unk_1E707A688;
  v16[4] = &v23;
  v16[5] = &v17;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:](self, "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:", a3, v11, v10, v12, v13, 1, v16);

  if (a6)
    *a6 = objc_retainAutorelease((id)v18[5]);
  v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v11 = LALogCategoryForOptions();
  v12 = +[LAContext newCommandId](LAContext, "newCommandId");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke;
  v15[3] = &unk_1E707A688;
  v15[4] = &v22;
  v15[5] = &v16;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:](self, "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:", a3, a4, v10, v11, v12, 1, v15);
  if (a6)
    *a6 = objc_retainAutorelease((id)v17[5]);
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (LABiometryType)biometryType
{
  LABiometryType v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (_cachedBiometryType)
  {
    v2 = objc_msgSend((id)_cachedBiometryType, "integerValue");
  }
  else
  {
    -[LAContext domainState](self, "domainState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "biometry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "biometryType");

  }
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_DEFAULT, "returned biometryType: %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (LADomainState)domainState
{
  return (LADomainState *)-[LAContext domainStateWithOptions:](self, "domainStateWithOptions:", 0);
}

- (id)domainStateWithOptions:(id)a3
{
  id v4;
  LACCacheSync *domainStateCache;
  id v6;
  LACCacheSync *v7;
  LACCacheSync *v8;
  void *v9;
  void *v10;
  LADomainState *v11;
  LADomainState *v12;
  LADomainState *v13;
  _QWORD v15[5];
  id v16;
  id location;

  v4 = a3;
  domainStateCache = self->_domainStateCache;
  if (!domainStateCache)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x1E0D443B0]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __36__LAContext_domainStateWithOptions___block_invoke;
    v15[3] = &unk_1E707A790;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    v7 = (LACCacheSync *)objc_msgSend(v6, "initWithTimeout:block:", v15, 0.5);
    v8 = self->_domainStateCache;
    self->_domainStateCache = v7;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    domainStateCache = self->_domainStateCache;
  }
  -[LACCacheSync valueWithParameter:error:](domainStateCache, "valueWithParameter:error:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = [LADomainState alloc];
    v11 = -[LADomainState initWithResult:](v12, "initWithResult:", MEMORY[0x1E0C9AA70]);
  }
  v13 = v11;

  return v13;
}

id __36__LAContext_domainStateWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchDomainStateWithOptions:error:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_fetchDomainStateWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  LAClient *client;
  id v11;
  LADomainState *v12;
  LADomainState *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *, void *);
  void *v22;
  id v23;
  __int128 *p_buf;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = LALogCategoryForOptions();
  if (v7)
  {
    -[LAContext description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LALogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_DEFAULT, "DomainState on %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  v37 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v32 = 0;
  client = self->_client;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __48__LAContext__fetchDomainStateWithOptions_error___block_invoke;
  v22 = &unk_1E707A7B8;
  v26 = v7;
  v11 = v8;
  v23 = v11;
  p_buf = &buf;
  v25 = &v27;
  -[LAClient getDomainStateWithOptions:synchronous:reply:](client, "getDomainStateWithOptions:synchronous:reply:", v6, 1, &v19);
  v12 = [LADomainState alloc];
  v13 = -[LADomainState initWithResult:](v12, "initWithResult:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v19, v20, v21, v22);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[LADomainState biometry](v13, "biometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "biometryType"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_cachedBiometryType;
  _cachedBiometryType = v16;

  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __48__LAContext__fetchDomainStateWithOptions_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1[7])
  {
    LALogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      if (v5)
        v9 = v5;
      else
        v9 = v6;
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_DEFAULT, "DomainState on %{public}@ returned: %{public}@", (uint8_t *)&v15, 0x16u);
    }

  }
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (BOOL)setCredential:(NSData *)credential type:(LACredentialType)type
{
  NSData *v6;

  v6 = credential;
  LOBYTE(type) = -[LAContext _setCredential:type:log:cid:error:](self, "_setCredential:type:log:cid:error:", v6, type, 1, +[LAContext newCommandId](LAContext, "newCommandId"), 0);

  return type;
}

- (BOOL)setCredential:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8;

  v8 = a3;
  LOBYTE(a5) = -[LAContext _setCredential:type:log:cid:error:](self, "_setCredential:type:log:cid:error:", v8, a4, 16, +[LAContext newCommandId](LAContext, "newCommandId"), a5);

  return (char)a5;
}

- (BOOL)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  LAClient *client;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint8_t *v27;
  int64_t v28;
  unsigned int v29;
  uint8_t buf[8];
  __int128 v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[LAContext description](self, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LALogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = a4;
    LOWORD(v31) = 2114;
    *(_QWORD *)((char *)&v31 + 2) = v12;
    WORD5(v31) = 1024;
    HIDWORD(v31) = a6;
    _os_log_impl(&dword_1B971E000, v13, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v31 = buf;
  *((_QWORD *)&v31 + 1) = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  v14 = dispatch_semaphore_create(0);
  client = self->_client;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __47__LAContext__setCredential_type_log_cid_error___block_invoke;
  v22[3] = &unk_1E707A7E0;
  v16 = v13;
  v23 = v16;
  v17 = v11;
  v24 = v17;
  v28 = a4;
  v18 = v12;
  v29 = a6;
  v25 = v18;
  v27 = buf;
  v19 = v14;
  v26 = v19;
  -[LAClient setCredential:type:reply:](client, "setCredential:type:reply:", v17, a4, v22);
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a7)
    *a7 = objc_retainAutorelease(*(id *)(v31 + 40));
  v20 = *(_QWORD *)(v31 + 40) == 0;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __47__LAContext__setCredential_type_log_cid_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 40) != 0;
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(_DWORD *)(a1 + 80);
    v12 = CFSTR("success");
    if (!a2)
      v12 = v5;
    v16[0] = 67110146;
    v16[1] = v9;
    v17 = 1024;
    v18 = v10;
    v19 = 2114;
    v20 = v8;
    v21 = 1024;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v16, 0x28u);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;
  v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[LAContext _setCredential:type:log:cid:reply:](self, "_setCredential:type:log:cid:reply:", v9, a4, 16, +[LAContext newCommandId](LAContext, "newCommandId"), v8);

}

- (void)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 reply:(id)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  LAClient *client;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  unsigned int v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  -[LAContext description](self, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LALogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v28 = a4;
    v29 = 2114;
    v30 = v13;
    v31 = 1024;
    v32 = a6;
    _os_log_impl(&dword_1B971E000, v14, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__LAContext__setCredential_type_log_cid_reply___block_invoke;
  v20[3] = &unk_1E707A6F0;
  v21 = v14;
  v22 = v11;
  v24 = v12;
  v25 = a4;
  v26 = a6;
  v23 = v13;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  v19 = v14;
  -[LAClient setCredential:type:reply:](client, "setCredential:type:reply:", v18, a4, v20);

}

void __47__LAContext__setCredential_type_log_cid_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 40) != 0;
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_DWORD *)(a1 + 72);
    v12 = CFSTR("success");
    if (!(_DWORD)a2)
      v12 = v5;
    v14[0] = 67110146;
    v14[1] = v9;
    v15 = 1024;
    v16 = v10;
    v17 = 2114;
    v18 = v8;
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  LAClient *client;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  int64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LALogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v21 = a3;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_INFO, "credentialOfType:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__LAContext_credentialOfType_reply___block_invoke;
  v14[3] = &unk_1E707A808;
  v15 = v7;
  v16 = v9;
  v19 = v8;
  v17 = v6;
  v18 = a3;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  -[LAClient credentialOfType:reply:](client, "credentialOfType:reply:", a3, v14);

}

void __36__LAContext_credentialOfType_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 || objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v6, -1008))
  {
    v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_DWORD *)(a1 + 64);
      v11[0] = 67109634;
      v11[1] = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 1024;
      v15 = v10;
      _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_DEFAULT, "credentialOfType:%d on %{public}@ cid:%u returned", (uint8_t *)v11, 0x18u);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
  {
    __36__LAContext_credentialOfType_reply___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)credentialOfType:(int64_t)a3 error:(id *)a4
{
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__LAContext_credentialOfType_error___block_invoke;
  v11[3] = &unk_1E707A830;
  v13 = &v21;
  v14 = &v15;
  v8 = v7;
  v12 = v8;
  -[LAContext credentialOfType:reply:](self, "credentialOfType:reply:", a3, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __36__LAContext_credentialOfType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isCredentialSet:(LACredentialType)type
{
  NSObject *v5;
  unsigned int v6;
  void *v7;
  dispatch_semaphore_t v8;
  LAClient *client;
  NSObject *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t *v19;
  LACredentialType v20;
  unsigned int v21;
  uint8_t buf[8];
  __int128 v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = type;
    LOWORD(v23) = 2114;
    *(_QWORD *)((char *)&v23 + 2) = v7;
    WORD5(v23) = 1024;
    HIDWORD(v23) = v6;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_INFO, "isCredentialSet:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v23 = buf;
  *((_QWORD *)&v23 + 1) = 0x2020000000;
  v24 = 0;
  v8 = dispatch_semaphore_create(0);
  client = self->_client;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29__LAContext_isCredentialSet___block_invoke;
  v15[3] = &unk_1E707A858;
  v19 = buf;
  v10 = v8;
  v16 = v10;
  v11 = v5;
  v17 = v11;
  v20 = type;
  v12 = v7;
  v18 = v12;
  v21 = v6;
  -[LAClient isCredentialSet:reply:](client, "isCredentialSet:reply:", type, v15);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v13 = *(_BYTE *)(v23 + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v13;
}

void __29__LAContext_isCredentialSet___block_invoke(uint64_t a1, char a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v6 = *(id *)(a1 + 40);
  if ((a2 & 1) != 0)
  {
    v7 = OS_LOG_TYPE_DEFAULT;
  }
  else if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v5, -1008))
  {
    v7 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_DWORD *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v11 = CFSTR("YES");
    else
      v11 = v5;
    v12[0] = 67109890;
    v12[1] = v8;
    v13 = 2114;
    v14 = v10;
    v15 = 1024;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_1B971E000, v6, v7, "isCredentialSet:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v12, 0x22u);
  }

}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  LAClient *client;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;
  unsigned int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  LALogForCategory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v27 = objc_msgSend(v8, "hash");
    v28 = 1024;
    v29 = a4;
    v30 = 2114;
    v31 = v12;
    v32 = 1024;
    v33 = v11;
    _os_log_impl(&dword_1B971E000, v13, OS_LOG_TYPE_INFO, "setOptions:%x forInternalOperation:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }

  client = self->_client;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__LAContext_setOptions_forInternalOperation_reply___block_invoke;
  v19[3] = &unk_1E707A6F0;
  v20 = v13;
  v21 = v8;
  v23 = v9;
  v24 = a4;
  v25 = v11;
  v22 = v12;
  v15 = v9;
  v16 = v12;
  v17 = v8;
  v18 = v13;
  -[LAClient setOptions:forInternalOperation:reply:](client, "setOptions:forInternalOperation:reply:", v17, a4, v19);

}

void __51__LAContext_setOptions_forInternalOperation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  void *v6;
  os_log_type_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v6;
    v10 = objc_msgSend(v8, "hash");
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_DWORD *)(a1 + 72);
    v14 = CFSTR("success");
    if (!(_DWORD)a2)
      v14 = v5;
    v16[0] = 67110146;
    v16[1] = v10;
    v17 = 1024;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 1024;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1B971E000, v9, v7, "setOptions:%x forInternalOperation:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v16, 0x28u);

  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);

}

- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  LAClient *client;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  int64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LALogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v21 = a3;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_INFO, "optionsForInternalOperation:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__LAContext_optionsForInternalOperation_reply___block_invoke;
  v14[3] = &unk_1E707A880;
  v15 = v7;
  v16 = v9;
  v19 = v8;
  v17 = v6;
  v18 = a3;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  -[LAClient optionsForInternalOperation:reply:](client, "optionsForInternalOperation:reply:", a3, v14);

}

void __47__LAContext_optionsForInternalOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = 16 * (v5 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_DWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 64);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v6;
    }
    v13[0] = 67109890;
    v13[1] = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 1024;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1B971E000, v7, v8, "optionsForInternalOperation:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v13, 0x22u);
    if (v5)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)prearmTouchIDWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  LAClient *client;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  id v14;
  id v15;
  unsigned int v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 1024;
    v20 = v6;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_INFO, "prearmTouchIDWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__LAContext_prearmTouchIDWithReply___block_invoke;
  v12[3] = &unk_1E707A8A8;
  v12[4] = self;
  v13 = v5;
  v16 = v6;
  v14 = v7;
  v15 = v4;
  v9 = v4;
  v10 = v7;
  v11 = v5;
  -[LAClient prearmTouchIdWithReply:](client, "prearmTouchIdWithReply:", v12);

}

void __36__LAContext_prearmTouchIDWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    v8 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v8 = OS_LOG_TYPE_ERROR;
  }
  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_DWORD *)(a1 + 64);
    v12 = CFSTR("success");
    if (!v6)
      v12 = v7;
    v13 = 138543874;
    v14 = v10;
    v15 = 1024;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_1B971E000, v9, v8, "prearmTouchIDWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)resetWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  LAClient *client;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  unsigned int v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 1024;
    v20 = v6;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_INFO, "resetWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__LAContext_resetWithReply___block_invoke;
  v12[3] = &unk_1E707A8D0;
  v13 = v5;
  v14 = v7;
  v16 = v6;
  v15 = v4;
  v9 = v4;
  v10 = v7;
  v11 = v5;
  -[LAClient resetProcessedEvent:reply:](client, "resetProcessedEvent:reply:", 0, v12);

}

void __28__LAContext_resetWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_DWORD *)(a1 + 56);
    v10 = CFSTR("success");
    if (!(_DWORD)a2)
      v10 = v5;
    v12 = 138543874;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1B971E000, v6, v7, "resetWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v12, 0x1Cu);
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v11 + 16))(v11, a2, v5);

}

- (void)authMethodWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  LAClient *client;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  unsigned int v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 1024;
    v20 = v6;
    _os_log_impl(&dword_1B971E000, v5, OS_LOG_TYPE_INFO, "authMethodWithReply on %{public}@ cid:%u", buf, 0x12u);
  }
  client = self->_client;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__LAContext_authMethodWithReply___block_invoke;
  v12[3] = &unk_1E707A8F8;
  v13 = v5;
  v14 = v7;
  v16 = v6;
  v15 = v4;
  v9 = v4;
  v10 = v7;
  v11 = v5;
  -[LAClient authMethodWithReply:](client, "authMethodWithReply:", v12);

}

void __33__LAContext_authMethodWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = 16 * (v5 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 56);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v6;
    }
    v12 = 138543874;
    v13 = v9;
    v14 = 1024;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B971E000, v7, v8, "authMethodWithReply on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v12, 0x1Cu);
    if (v5)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  LAClient *client;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  int64_t v20;
  unsigned int v21;
  BOOL v22;
  uint8_t buf[4];
  _BOOL4 v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  LALogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v24 = v6;
    v25 = 1024;
    v26 = a4;
    v27 = 2114;
    v28 = v11;
    v29 = 1024;
    v30 = v10;
    _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_INFO, "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u", buf, 0x1Eu);
  }
  client = self->_client;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__LAContext_setShowingCoachingHint_event_reply___block_invoke;
  v16[3] = &unk_1E707A920;
  v22 = v6;
  v17 = v9;
  v18 = v11;
  v21 = v10;
  v19 = v8;
  v20 = a4;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  -[LAClient setShowingCoachingHint:event:reply:](client, "setShowingCoachingHint:event:reply:", v6, a4, v16);

}

void __48__LAContext_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if ((_DWORD)a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(unsigned __int8 *)(a1 + 68);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 64);
    v12 = CFSTR("success");
    if (!(_DWORD)a2)
      v12 = v5;
    v14[0] = 67110146;
    v14[1] = v8;
    v15 = 1024;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 1024;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u returned %{public}@", (uint8_t *)v14, 0x28u);
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

- (BOOL)checkContextValidWithError:(id *)a3
{
  void *v5;
  BOOL v6;

  if (a3)
  {
    -[LAClient permanentError](self->_client, "permanentError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[LAClient permanentError](self->_client, "permanentError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  return v6;
}

- (BOOL)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  unsigned int v13;
  void *v14;
  LAClient *client;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  _BYTE *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE buf[24];
  __int128 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  LALogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v35) = a5;
    WORD2(v35) = 2114;
    *(_QWORD *)((char *)&v35 + 6) = v14;
    HIWORD(v35) = 1024;
    LODWORD(v36) = v13;
    _os_log_impl(&dword_1B971E000, v12, OS_LOG_TYPE_INFO, "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ options:%u on %{public}@ cid:%u", buf, 0x2Cu);
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v35 = __Block_byref_object_copy__4;
  *((_QWORD *)&v35 + 1) = __Block_byref_object_dispose__4;
  v36 = 0;
  client = self->_client;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke;
  v22[3] = &unk_1E707A948;
  v16 = v12;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v19 = v14;
  v29 = v13;
  v26 = v19;
  v27 = &v30;
  v28 = buf;
  -[LAClient verifyFileVaultUser:volumeUuid:options:reply:](client, "verifyFileVaultUser:volumeUuid:options:reply:", v17, v18, a5, v22);
  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v20 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (a2)
    v7 = OS_LOG_TYPE_DEFAULT;
  else
    v7 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_DWORD *)(a1 + 80);
    v12 = CFSTR("success");
    if (!a2)
      v12 = v5;
    v15 = 138544386;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 1024;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_1B971E000, v6, v7, "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ on %{public}@ cid:%u returned %{public}@", (uint8_t *)&v15, 0x30u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

- (id)_serverPropertyValueForOption:(int64_t)a3
{
  return -[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", a3, 16);
}

- (id)_serverPropertyValueForOption:(int64_t)a3 log:(int64_t)a4
{
  NSObject *v6;
  unsigned int v7;
  void *v8;
  LAClient *client;
  void *v10;
  id v11;
  void *v12;
  int v13;
  os_log_type_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v19 = a3;
    v20 = 2114;
    v21 = v8;
    v22 = 1024;
    v23 = v7;
    _os_log_impl(&dword_1B971E000, v6, OS_LOG_TYPE_INFO, "serverPropertyValueForOption:%d on %{public}@ cid:%u", buf, 0x18u);
  }
  client = self->_client;
  v17 = 0;
  -[LAClient serverPropertyForOption:error:](client, "serverPropertyForOption:error:", a3, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {

    v10 = 0;
  }
  v14 = 16 * (v11 != 0);
  if (os_log_type_enabled(v6, v14))
  {
    if (v11)
      v15 = v11;
    else
      v15 = v10;
    *(_DWORD *)buf = 67109890;
    v19 = a3;
    v20 = 2114;
    v21 = v8;
    v22 = 1024;
    v23 = v7;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1B971E000, v6, v14, "serverPropertyValueForOption:%d on %{public}@ cid:%u returned %{public}@", buf, 0x22u);
  }

  return v10;
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4
{
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", a3, a4, 16);
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4 log:(int64_t)a5
{
  id v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  LAClient *client;
  void *v12;
  _BOOL4 v13;
  __CFString *v14;
  os_log_type_t v15;
  const __CFString *v16;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  LALogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v19 = a3;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v10;
    v24 = 1024;
    v25 = v9;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_INFO, "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u", buf, 0x22u);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_INFO, "Invalidating domain state cache", buf, 2u);
  }
  -[LACCacheSync invalidate](self->_domainStateCache, "invalidate");
  client = self->_client;
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0;
  v13 = -[LAClient setServerPropertyForOption:value:error:](client, "setServerPropertyForOption:value:error:", a3, v12, &v17);
  v14 = (__CFString *)v17;
  if (!v7)

  v15 = 16 * (v14 != 0);
  if (os_log_type_enabled(v8, v15))
  {
    v16 = CFSTR("success");
    *(_DWORD *)buf = 67110146;
    if (!v13)
      v16 = v14;
    v19 = a3;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v10;
    v24 = 1024;
    v25 = v9;
    v26 = 2114;
    v27 = v16;
    _os_log_impl(&dword_1B971E000, v8, v15, "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u returned %{public}@", buf, 0x2Cu);
  }

}

- (NSString)localizedFallbackTitle
{
  return (NSString *)-[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", 1, 8);
}

- (void)setLocalizedFallbackTitle:(NSString *)localizedFallbackTitle
{
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 1, localizedFallbackTitle, 8);
}

- (NSString)localizedCancelTitle
{
  return (NSString *)-[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", 1018, 8);
}

- (void)setLocalizedCancelTitle:(NSString *)localizedCancelTitle
{
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 1018, localizedCancelTitle, 8);
}

- (NSNumber)touchIDAuthenticationRetryLimit
{
  return (NSNumber *)-[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1003);
}

- (void)setTouchIDAuthenticationRetryLimit:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1003, a3);
}

- (NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  void *v2;
  double v3;
  double v4;

  -[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", 1017, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setTouchIDAuthenticationAllowableReuseDuration:(NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", touchIDAuthenticationAllowableReuseDuration);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 1017, v4, 8);

}

- (NSData)externalizedContext
{
  NSObject *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = +[LAContext newCommandId](LAContext, "newCommandId");
  -[LAContext description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = v5;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "externalizedContext on %{public}@ cid:%u", (uint8_t *)&v11, 0x12u);
  }
  -[LAClient externalizedContext](self->_client, "externalizedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  v8 = 16 * (v6 == 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = objc_msgSend(v6, "hash");
    v11 = 138543874;
    v12 = v5;
    v13 = 1024;
    v14 = v4;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_1B971E000, v7, v8, "externalizedContext on %{public}@ cid:%u returned %x", (uint8_t *)&v11, 0x18u);
  }

  return (NSData *)v6;
}

- (id)uuid
{
  return -[LAClient uuid](self->_client, "uuid");
}

- (void)setUiDelegate:(id)a3
{
  -[LAClient setUiDelegate:](self->_client, "setUiDelegate:", a3);
}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  -[LAClient bootstrapServiceType:completionHandler:](self->_client, "bootstrapServiceType:completionHandler:", a3, a4);
}

- (void)addContextObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LAContext observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAContext setObservers:](self, "setObservers:", v6);

  }
  -[LAContext observers](self, "observers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeContextObserver:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[LAContext observers](self, "observers");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[LAContext observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v9);

    if (v7)
    {
      -[LAContext observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
  }

}

- (void)_notifyObserversAfterInvalidation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  LAContext *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LAContext observers](self, "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v23 = objc_msgSend(v4, "count");
    v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "Will notify %d observers of changes in %{public}@", buf, 0x12u);

  }
  v5 = (void *)MEMORY[0x1E0C99D20];
  -[LAContext observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "contextDidBecomeInvalid:", self, (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)optionNotInteractive
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1000);
}

- (void)setOptionNotInteractive:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1000, a3);
}

- (id)optionTimeout
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1001);
}

- (void)setOptionTimeout:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1001, a3);
}

- (id)optionCallerName
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1021);
}

- (void)setOptionCallerName:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1021, a3);
}

- (id)optionCallerPID
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1027);
}

- (void)setOptionCallerPID:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1027, a3);
}

- (id)optionMaxCredentialAge
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1077);
}

- (void)setOptionMaxCredentialAge:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1077, a3);
}

- (id)optionUseShortExpirationTimer
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1061);
}

- (void)setOptionUseShortExpirationTimer:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1061, a3);
}

- (id)optionFallbackToNoAuthentication
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1062);
}

- (void)setOptionFallbackToNoAuthentication:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1062, a3);
}

- (id)optionAuthenticationCallbackReason
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1063);
}

- (void)setOptionAuthenticationCallbackReason:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1063, a3);
}

- (id)optionAuthenticationCallbackURL
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1064);
}

- (void)setOptionAuthenticationCallbackURL:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1064, a3);
}

- (id)optionAuthenticationIdentifier
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1066);
}

- (void)setOptionAuthenticationIdentifier:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1066, a3);
}

- (id)optionBeginRatchetLocalizedTitle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1069);
}

- (void)setOptionBeginRatchetLocalizedTitle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1069, a3);
}

- (id)optionBeginRatchetLocalizedText
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1070);
}

- (void)setOptionBeginRatchetLocalizedText:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1070, a3);
}

- (id)optionBeginRatchetShowsLocationWarning
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1071);
}

- (void)setOptionBeginRatchetShowsLocationWarning:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1071, a3);
}

- (id)optionCountdownLocalizedText
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1072);
}

- (void)setOptionCountdownLocalizedText:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1072, a3);
}

- (id)optionDTO
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1068);
}

- (void)setOptionDTO:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1068, a3);
}

- (id)optionNoGracePeriodUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1073);
}

- (void)setOptionNoGracePeriodUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1073, a3);
}

- (id)optionNoCountdownUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1074);
}

- (void)setOptionNoCountdownUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1074, a3);
}

- (id)optionBeginSecurityDelayImmediately
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1075);
}

- (void)setOptionBeginSecurityDelayImmediately:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1075, a3);
}

- (id)optionAllowEmptyPasscode
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1081);
}

- (void)setOptionAllowEmptyPasscode:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1081, a3);
}

- (id)optionAllowEnablementGracePeriod
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1082);
}

- (void)setOptionAllowEnablementGracePeriod:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1082, a3);
}

- (id)optionAllowUnapprovedSensor
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1085);
}

- (void)setOptionAllowUnapprovedSensor:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1085, a3);
}

- (id)optionUserFallback
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1);
}

- (void)setOptionUserFallback:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1, a3);
}

- (id)optionAuthenticationReason
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 2);
}

- (void)setOptionAuthenticationReason:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 2, a3);
}

- (id)optionMaxBiometryFailures
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1003);
}

- (void)setOptionMaxBiometryFailures:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1003, a3);
}

- (id)optionPresentationStyle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1005);
}

- (void)setOptionPresentationStyle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1005, a3);
}

- (id)optionTransitionStyle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1006);
}

- (void)setOptionTransitionStyle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1006, a3);
}

- (id)optionReturnBiometryDatabaseHash
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1015);
}

- (void)setOptionReturnBiometryDatabaseHash:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1015, a3);
}

- (id)optionCancelVisible
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1010);
}

- (void)setOptionCancelVisible:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1010, a3);
}

- (id)optionFallbackVisible
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1011);
}

- (void)setOptionFallbackVisible:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1011, a3);
}

- (id)optionPasscodeTitle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1037);
}

- (void)setOptionPasscodeTitle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1037, a3);
}

- (id)optionPINTitle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1013);
}

- (void)setOptionPINTitle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1013, a3);
}

- (id)optionPINLength
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1014);
}

- (void)setOptionPINLength:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1014, a3);
}

- (id)optionPINFirst
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1012);
}

- (void)setOptionPINFirst:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1012, a3);
}

- (id)optionSharedValidity
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1017);
}

- (void)setOptionSharedValidity:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1017, a3);
}

- (id)optionUserCancel
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1018);
}

- (void)setOptionUserCancel:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1018, a3);
}

- (id)optionTintColor
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1020);
}

- (void)setOptionTintColor:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1020, a3);
}

- (id)optionBiometryLockoutRecovery
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1024);
}

- (void)setOptionBiometryLockoutRecovery:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1024, a3);
}

- (id)optionSoftwareUpdateManifest
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1026);
}

- (void)setOptionSoftwareUpdateManifest:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1026, a3);
}

- (id)optionSoftwareUpdateStashMode
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1028);
}

- (void)setOptionSoftwareUpdateStashMode:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1028, a3);
}

- (id)optionPasswordAuthenticationReason
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1031);
}

- (void)setOptionPasswordAuthenticationReason:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1031, a3);
}

- (id)optionPasscodeScreenStyle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1033);
}

- (void)setOptionPasscodeScreenStyle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1033, a3);
}

- (id)optionPasscodeScreenBlur
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1034);
}

- (void)setOptionPasscodeScreenBlur:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1034, a3);
}

- (id)optionFaceDetectLength
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1032);
}

- (void)setOptionFaceDetectLength:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1032, a3);
}

- (id)optionCallerAuditToken
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1038);
}

- (void)setOptionCallerAuditToken:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1038, a3);
}

- (id)optionCallerAuditTokenUsage
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1080);
}

- (void)setOptionCallerAuditTokenUsage:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1080, a3);
}

- (id)optionNoFailureUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1039);
}

- (void)setOptionNoFailureUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1039, a3);
}

- (id)optionFingerMustBeOff
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1040);
}

- (void)setOptionFingerMustBeOff:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1040, a3);
}

- (id)optionPhysicalButtonTitle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1041);
}

- (void)setOptionPhysicalButtonTitle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1041, a3);
}

- (id)optionCallerIconPath
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1042);
}

- (void)setOptionCallerIconPath:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1042, a3);
}

- (id)optionCallerIconBundlePath
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1042);
}

- (void)setOptionCallerIconBundlePath:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1042, a3);
}

- (id)optionMatchForUnlock
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1043);
}

- (void)setOptionMatchForUnlock:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1043, a3);
}

- (id)optionPINMinLength
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1046);
}

- (void)setOptionPINMinLength:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1046, a3);
}

- (id)optionPINMaxLength
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1047);
}

- (void)setOptionPINMaxLength:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1047, a3);
}

- (id)optionPINCharset
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1048);
}

- (void)setOptionPINCharset:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1048, a3);
}

- (id)optionBodyText
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1050);
}

- (void)setOptionBodyText:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1050, a3);
}

- (id)optionTKAuthOperationError
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1051);
}

- (void)setOptionTKAuthOperationError:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1051, a3);
}

- (id)optionPINLabel
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1052);
}

- (void)setOptionPINLabel:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1052, a3);
}

- (id)optionCheckApplePayEnabled
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1053);
}

- (void)setOptionCheckApplePayEnabled:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1053, a3);
}

- (id)optionPresentingEmbeddedUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1056);
}

- (void)setOptionPresentingEmbeddedUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1056, a3);
}

- (id)optionPresentationContext
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1059);
}

- (void)setOptionPresentationContext:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1059, a3);
}

- (id)optionBiometryLockoutRecoveryRetries
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1067);
}

- (void)setOptionBiometryLockoutRecoveryRetries:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1067, a3);
}

- (id)optionUseModernUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1057);
}

- (void)setOptionUseModernUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1057, a3);
}

- (id)optionLightweightUI
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1079);
}

- (void)setOptionLightweightUI:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1079, a3);
}

- (id)optionLightweightUIMode
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1087);
}

- (void)setOptionLightweightUIMode:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1087, a3);
}

- (id)optionDisableMacCompanion
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1084);
}

- (void)setOptionDisableMacCompanion:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1084, a3);
}

- (NSString)localizedReason
{
  return (NSString *)-[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", 2, 8);
}

- (void)setLocalizedReason:(NSString *)localizedReason
{
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 2, localizedReason, 8);
}

- (id)optionAuthenticationTitle
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1030);
}

- (void)setOptionAuthenticationTitle:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1030, a3);
}

- (id)optionSecurePassphrase
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1044);
}

- (void)setOptionSecurePassphrase:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1044, a3);
}

- (id)optionSkipDoublePress
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1054);
}

- (void)setOptionSkipDoublePress:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1054, a3);
}

- (BOOL)interactionNotAllowed
{
  void *v2;
  char v3;

  -[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", 1000, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setInteractionNotAllowed:(BOOL)interactionNotAllowed
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", interactionNotAllowed);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 1000, v4, 8);

}

- (id)optionEventProcessing
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1007);
}

- (void)setOptionEventProcessing:(id)a3
{
  -[LAContext _setServerPropertyForOption:value:](self, "_setServerPropertyForOption:value:", 1007, a3);
}

- (NSNumber)maxBiometryFailures
{
  return self->_maxBiometryFailures;
}

- (void)setMaxBiometryFailures:(NSNumber *)maxBiometryFailures
{
  objc_storeStrong((id *)&self->_maxBiometryFailures, maxBiometryFailures);
}

- (void)setBiometryType:(int64_t)a3
{
  self->_biometryType = a3;
}

- (NSData)evaluatedPolicyDomainState
{
  return self->_evaluatedPolicyDomainState;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedContext, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (LAClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_evaluatedPolicyDomainState, 0);
  objc_storeStrong((id *)&self->_maxBiometryFailures, 0);
  objc_storeStrong((id *)&self->_domainStateCache, 0);
  objc_storeStrong((id *)&self->_prearmContext, 0);
}

void __29__LAContext_encodeWithCoder___block_invoke_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_4_0();
}

void __29__LAContext_encodeWithCoder___block_invoke_36_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 52);
  v5 = 138543874;
  v6 = v2;
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_debug_impl(&dword_1B971E000, a2, OS_LOG_TYPE_DEBUG, "Encoded %{public}@ for transfer to pid:%d cid:%u", (uint8_t *)&v5, 0x18u);
  OUTLINED_FUNCTION_4_0();
}

void __29__LAContext_encodeWithCoder___block_invoke_36_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  OUTLINED_FUNCTION_4_0();
}

void __36__LAContext_credentialOfType_reply___block_invoke_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

@end
