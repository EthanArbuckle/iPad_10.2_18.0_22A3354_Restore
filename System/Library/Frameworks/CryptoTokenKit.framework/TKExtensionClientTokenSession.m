@implementation TKExtensionClientTokenSession

- (TKExtensionClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKExtensionClientTokenSession;
  return (TKExtensionClientTokenSession *)-[TKClientTokenSession _initWithToken:LAContext:parameters:error:](&v7, sel__initWithToken_LAContext_parameters_error_, a3, a4, a5, a6);
}

- (void)terminate
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[TKExtensionClientTokenSession sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__TKExtensionClientTokenSession_terminate__block_invoke;
    v5[3] = &unk_1E708A700;
    v5[4] = self;
    v4 = -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", 0, 0, v5);
  }
}

uint64_t __42__TKExtensionClientTokenSession_terminate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSession:reply:", v4, &__block_literal_global_138);

  return MEMORY[0x1E0C9AAB0];
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v3;
  char v4;

  -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", a3, 0, &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t __50__TKExtensionClientTokenSession_isValidWithError___block_invoke()
{
  return MEMORY[0x1E0C9AAB0];
}

- (BOOL)ensureSessionWithClient:(id)a3 connectionIdentifier:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSNumber *sessionID;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  if (self->_connectionIdentifier == a4)
    goto LABEL_7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  -[TKClientTokenSession LAContext](self, "LAContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenSession parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke;
  v14[3] = &unk_1E708A768;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v8, "startSessionWithLAContext:parameters:reply:", v9, v10, v14);

  sessionID = self->_sessionID;
  if (sessionID)
  {
    self->_connectionIdentifier = a4;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease((id)v16[5]);
  }
  _Block_object_dispose(&v15, 8);

  if (sessionID)
LABEL_7:
    v12 = 1;
  else
    v12 = 0;

  return v12;
}

void __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 104);
  *(_QWORD *)(v7 + 104) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)withError:(id *)a3 accessControl:(__SecAccessControl *)a4 invoke:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  __SecAccessControl *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[TKClientTokenSession token](self, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke;
  v14[3] = &unk_1E708A790;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v16 = &v23;
  v17 = &v19;
  v18 = a4;
  objc_msgSend(v9, "withError:invoke:", a3, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v24[5];
  if (v12)
  {
    if ((objc_msgSend(v12, "isEqual:", self->_sessionID) & 1) == 0)
    {
      -[TKExtensionClientTokenSession terminate](self, "terminate");
      objc_storeStrong((id *)&self->_sessionID, (id)v24[5]);
      self->_connectionIdentifier = v20[3];
    }
    -[TKClientTokenSession setLAContext:](self, "setLAContext:", 0);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

id __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = 0;
  v31 = CFSTR("CryptoTokenKit");
  v9 = 16;
  do
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "ensureSessionWithClient:connectionIdentifier:error:", v7, a3, a4, v31))
    {
      v10 = 0;
      goto LABEL_31;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = v11;
    if (v10)
      goto LABEL_23;
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", v31)
      || objc_msgSend(v12, "code") != -9
      || !*(_QWORD *)(a1 + 64))
    {

LABEL_21:
      if (a4)
        *a4 = objc_retainAutorelease(v12);
LABEL_23:
      v24 = v10;
LABEL_30:

      goto LABEL_31;
    }
    v14 = objc_msgSend(*(id *)(a1 + 32), "authenticateWhenNeeded");

    if ((v14 & 1) == 0)
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 32), "LAContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      objc_msgSend(*(id *)(a1 + 32), "setLAContext:", v16);

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      if (!objc_msgSend(*(id *)(a1 + 32), "ensureSessionWithClient:connectionIdentifier:error:", v7, a3, a4))goto LABEL_30;
    }
    objc_msgSend(v12, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("operation"));
    v18 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      TK_LOG_client_1();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke_cold_1((uint64_t)v12, v25, v26);

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v31, -5, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_29:
      v8 = (void *)v18;
      goto LABEL_30;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_testing_AuthenticateInternally"))
    {
      v19 = (void *)SecAccessControlCopyData();
      v20 = objc_msgSend(*(id *)(a1 + 32), "evaluateAccessControl:forOperation:error:", v19, v18, a4);

      if ((v20 & 1) == 0)
        goto LABEL_29;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "LAContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "evaluateAccessControl:aksOperation:options:error:", *(_QWORD *)(a1 + 64), v18, MEMORY[0x1E0C9AA70], a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_29;
    }

    v8 = (void *)v18;
    --v9;
  }
  while (v9);
  TK_LOG_client_1();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "token");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tokenID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v33 = v29;
    v34 = 2114;
    v35 = v30;
    v36 = 2114;
    v37 = v18;
    _os_log_fault_impl(&dword_1B9768000, v23, OS_LOG_TYPE_FAULT, "authentication failed repeatedly: tkid=%{public}@, ac=%{public}@, op=%{public}@", buf, 0x20u);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v31, -5, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v8 = (void *)v18;
LABEL_31:

  return v10;
}

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_1B9768000, "ExtClientObject: evaluateAccessControl", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke;
  v15[3] = &unk_1E708A7B8;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", a5, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v13, "BOOLValue");

  os_activity_scope_leave(&state);
  return (char)a5;
}

id __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2;
  v12[3] = &unk_1E708A160;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v5, "session:evaluateAccessControl:forOperation:reply:", v6, v7, v8, v12);

  v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = (void *)v20[5];
  }
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
    v6 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  TKExtensionClientTokenObject *v10;
  TKExtensionClientTokenObject *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *, _QWORD *);
  void *v16;
  TKExtensionClientTokenSession *v17;
  id v18;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_1B9768000, "ExtClientObject: getObject", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke;
  v16 = &unk_1E708A6B8;
  v17 = self;
  v8 = v6;
  v18 = v8;
  -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", a4, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [TKExtensionClientTokenObject alloc];
    v11 = -[TKClientTokenObject initWithSession:objectID:attributes:](v10, "initWithSession:objectID:attributes:", self, v8, v9, v13, v14, v15, v16, v17);
  }
  else
  {
    v11 = 0;
  }

  os_activity_scope_leave(&state);
  return v11;
}

id __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2;
  v11[3] = &unk_1E708A0C0;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v5, "session:getAttributesOfObjectID:reply:", v6, v7, v11);

  v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v8 = (void *)v19[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  TKExtensionClientTokenObject *v11;
  TKExtensionClientTokenObject *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *, _QWORD *);
  void *v17;
  TKExtensionClientTokenSession *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_1B9768000, "ExtClientObject: createObject", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  v25 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke;
  v17 = &unk_1E708A808;
  v20 = v24;
  v18 = self;
  v8 = v6;
  v19 = v8;
  v21 = &v36;
  v22 = &v32;
  v23 = &v26;
  -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", a4, 0, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v37[5];
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqual:", self->_sessionID, v14, v15, v16, v17, v18) & 1) == 0)
    {
      -[TKExtensionClientTokenSession terminate](self, "terminate");
      objc_storeStrong((id *)&self->_sessionID, (id)v37[5]);
      self->_connectionIdentifier = v33[3];
    }
    -[TKClientTokenSession setLAContext:](self, "setLAContext:", 0);
  }
  if (v27[5])
  {
    v11 = [TKExtensionClientTokenObject alloc];
    v12 = -[TKClientTokenObject initWithSession:objectID:attributes:](v11, "initWithSession:objectID:attributes:", self, v27[5], v9);
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  os_activity_scope_leave(&state);
  return v12;
}

id __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;

  v5 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v31 = 0;
    objc_msgSend(v6, "processObjectCreationAttributes:authContext:error:", v7, &v31, a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v31;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v8;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 32), "LAContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "setLAContext:", v9);
      }
      else
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
        objc_msgSend(*(id *)(a1 + 32), "setLAContext:", v13);

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      if (!objc_msgSend(*(id *)(a1 + 32), "ensureSessionWithClient:connectionIdentifier:error:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), a3))
      {
LABEL_14:

        v16 = 0;
        goto LABEL_13;
      }
    }

  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2;
  v18[3] = &unk_1E708A7E0;
  v18[4] = *(_QWORD *)(a1 + 72);
  v18[5] = &v25;
  v18[6] = &v19;
  objc_msgSend(v5, "session:createObjectWithAttributes:reply:", v14, v15, v18);

  if (a3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    *a3 = objc_retainAutorelease((id)v20[5]);
  v16 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
LABEL_13:

  return v16;
}

void __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

- (void)dealloc
{
  objc_super v3;

  -[TKExtensionClientTokenSession terminate](self, "terminate");
  v3.receiver = self;
  v3.super_class = (Class)TKExtensionClientTokenSession;
  -[TKExtensionClientTokenSession dealloc](&v3, sel_dealloc);
}

- (id)advertisedItems
{
  NSArray *advertisedItems;
  NSObject *v4;
  id v5;
  _QWORD v7[5];
  os_activity_scope_state_s state;

  advertisedItems = self->_advertisedItems;
  if (!advertisedItems)
  {
    v4 = _os_activity_create(&dword_1B9768000, "ExtClientObject: advertisedItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke;
    v7[3] = &unk_1E708A700;
    v7[4] = self;
    v5 = -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", 0, 0, v7);
    os_activity_scope_leave(&state);

    advertisedItems = self->_advertisedItems;
  }
  return advertisedItems;
}

id __48__TKExtensionClientTokenSession_advertisedItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2;
  v7[3] = &unk_1E70898C8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "session:getAdvertisedItemsWithReply:", v5, v7);

  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

void __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
}

- (id)itemsOfClass:(id)a3
{
  id v4;
  TKExtensionClientTokenSession *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  TKClientTokenAdvertisedItem *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self;
  -[TKExtensionClientTokenSession advertisedItems](self, "advertisedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x1E0CD6C98];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          v15 = -[TKClientTokenAdvertisedItem initWithSession:keychainAttributes:secRef:]([TKClientTokenAdvertisedItem alloc], "initWithSession:keychainAttributes:secRef:", v5, v12, 0);
          objc_msgSend(v18, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

- (id)keys
{
  return -[TKExtensionClientTokenSession itemsOfClass:](self, "itemsOfClass:", *MEMORY[0x1E0CD6CC0]);
}

- (id)certificates
{
  return -[TKExtensionClientTokenSession itemsOfClass:](self, "itemsOfClass:", *MEMORY[0x1E0CD6CA0]);
}

- (id)identities
{
  uint64_t i;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TKClientTokenAdvertisedItem *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  TKExtensionClientTokenSession *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = self;
  -[TKExtensionClientTokenSession keys](self, "keys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v40;
    v33 = *MEMORY[0x1E0CD6B30];
    v32 = *MEMORY[0x1E0CD6900];
    v26 = *MEMORY[0x1E0CD6CB0];
    v24 = *MEMORY[0x1E0CD6A90];
    v25 = *MEMORY[0x1E0CD6C98];
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        -[TKExtensionClientTokenSession certificates](v30, "certificates");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v5)
        {
          v6 = v5;
          v31 = i;
          v7 = *(_QWORD *)v36;
LABEL_8:
          v8 = 0;
          while (1)
          {
            if (*(_QWORD *)v36 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
            objc_msgSend(v9, "keychainAttributes");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v33);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "keychainAttributes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v32);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v11, "isEqual:", v13);

            if ((v14 & 1) != 0)
              break;
            if (v6 == ++v8)
            {
              v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v6)
                goto LABEL_8;
              v15 = v4;
              i = v31;
              goto LABEL_23;
            }
          }
          v15 = v9;

          i = v31;
          if (!v15)
            continue;
          objc_msgSend(v34, "keychainAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");

          objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, v25);
          objc_msgSend(v15, "localizedName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v24);

          if (objc_msgSend(v34, "keyRef") && objc_msgSend(v15, "certificateRef"))
          {
            objc_msgSend(v15, "certificateRef");
            objc_msgSend(v34, "keyRef");
            v19 = (void *)SecIdentityCreate();
            if (v19)
            {
              v20 = -[TKClientTokenAdvertisedItem initWithSession:keychainAttributes:secRef:]([TKClientTokenAdvertisedItem alloc], "initWithSession:keychainAttributes:secRef:", v30, v17, v19);
              objc_msgSend(v23, "addObject:", v20);

            }
          }

        }
        else
        {
          v15 = v4;
        }
LABEL_23:

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v29);
  }

  v21 = (void *)objc_msgSend(v23, "copy");
  return v21;
}

- (id)slotName
{
  NSString *slotName;
  NSObject *v4;
  id v5;
  _QWORD v7[5];
  os_activity_scope_state_s state;

  slotName = self->_slotName;
  if (!slotName)
  {
    v4 = _os_activity_create(&dword_1B9768000, "ExtClientObject: slotName", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke;
    v7[3] = &unk_1E708A700;
    v7[4] = self;
    v5 = -[TKExtensionClientTokenSession withError:accessControl:invoke:](self, "withError:accessControl:invoke:", 0, 0, v7);
    os_activity_scope_leave(&state);

    slotName = self->_slotName;
  }
  return slotName;
}

id __41__TKExtensionClientTokenSession_slotName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke_2;
  v7[3] = &unk_1E708A830;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "session:slotNameWithReply:", v5, v7);

  return *(id *)(*(_QWORD *)(a1 + 32) + 96);
}

void __41__TKExtensionClientTokenSession_slotName__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), a2);
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_advertisedItems, 0);
}

void __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1B9768000, a2, a3, "TKErrorCodeAuthenticationNeeded does not have operation set: %{public}@", (uint8_t *)&v3);
}

@end
