@implementation BMAccessClient

- (id)_requestAccessToResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  _BMAccessAssertionNotApplicable *v23;
  void *v24;
  __CFString **v25;
  __CFString *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  BMAccessDescriptor *v46;
  _QWORD v48[7];
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  unint64_t v62;
  os_activity_scope_state_s state;
  uint8_t v64[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "type");
  v9 = "BMAccessClient.requestAccessToResource: Unknown";
  switch(v8)
  {
    case 0:
      break;
    case 1:
      v9 = "BMAccessClient.requestAccessToResource: Stream";
      break;
    case 2:
      v9 = "BMAccessClient.requestAccessToResource: View";
      break;
    case 3:
      v9 = "BMAccessClient.requestAccessToResource: Database";
      break;
    case 4:
      v9 = "BMAccessClient.requestAccessToResource: Set";
      break;
    case 5:
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", CFSTR("BMSyncResource"));

      if ((v11 & 1) != 0)
      {
        v9 = "BMAccessClient.requestAccessToResource: Sync";
      }
      else
      {
        objc_msgSend(v7, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", CFSTR("BMSharedSyncResource"));

        if ((v13 & 1) != 0)
        {
          v9 = "BMAccessClient.requestAccessToResource: SharedSync";
        }
        else
        {
          objc_msgSend(v7, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", CFSTR("BMFlexibleStorageResource"));

          if ((v15 & 1) != 0)
          {
            v9 = "BMAccessClient.requestAccessToResource: BFS";
          }
          else
          {
            objc_msgSend(v7, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqual:", CFSTR("BMSetsResource"));

            if (v17)
              v9 = "BMAccessClient.requestAccessToResource: Sets";
            else
              v9 = "BMAccessClient.requestAccessToResource: Other";
          }
        }
      }
      break;
    default:
      v9 = "BMAccessClient.requestAccessToResource: Unhandled";
      break;
  }
  v18 = _os_activity_create(&dword_1AEB31000, v9, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v45 = v18;
  os_activity_scope_enter(v18, &state);
  v19 = BMServiceDomainForResource(v7);
  +[BMProcess current](BMProcess, "current");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "processType") == 5;

  if (v21)
  {
LABEL_19:
    v46 = -[BMAccessDescriptor initWithDomain:accessMode:resource:]([BMAccessDescriptor alloc], "initWithDomain:accessMode:resource:", v19, a4, v7);
    -[BMAccessAssertionCache assertionForAccessDescriptor:](self->_accessAssertionCache, "assertionForAccessDescriptor:");
    v23 = (_BMAccessAssertionNotApplicable *)objc_claimAutoreleasedReturnValue();
    if (v23)
      goto LABEL_45;
    +[BMPaths pathForResource:](BMPaths, "pathForResource:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = &BMSandboxWriteOperation;
    if ((a4 & 2) == 0)
      v25 = BMSandboxReadOperation;
    v26 = *v25;
    +[BMProcess current](BMProcess, "current");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "canPerformFileOperation:onPath:report:", v26, v24, 0);

    if (v28)
    {
      __biome_log_for_category(6);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        BMAccessModePrintableDescription(a4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        _os_log_impl(&dword_1AEB31000, v29, OS_LOG_TYPE_INFO, "Process already has %@ access to %@", buf, 0x16u);

      }
      v23 = -[_BMAccessAssertionNotApplicable initWithDescriptor:]([_BMAccessAssertionNotApplicable alloc], "initWithDescriptor:", v46);

      goto LABEL_45;
    }

    if (-[BMAccessClient _currentProcessIsSandboxed](self, "_currentProcessIsSandboxed"))
    {
      +[BMProcess current](BMProcess, "current");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "processType") == 2;

      if (!v34)
      {
        v61 = 0;
        v62 = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v71 = __Block_byref_object_copy_;
        v72 = __Block_byref_object_dispose_;
        v73 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy_;
        v60 = __Block_byref_object_dispose_;
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy_;
        v54 = __Block_byref_object_dispose_;
        v55 = 0;
        v35 = MEMORY[0x1E0C809B0];
        do
        {
          v49[0] = v35;
          v49[1] = 3221225472;
          v49[2] = __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke;
          v49[3] = &unk_1E5E3CAE8;
          v49[4] = &v50;
          -[BMAccessClient _synchronousRemoteObjectProxyForDomain:errorHandler:](self, "_synchronousRemoteObjectProxyForDomain:errorHandler:", v19, v49, v45);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = v35;
          v48[1] = 3221225472;
          v48[2] = __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_80;
          v48[3] = &unk_1E5E3CB10;
          v48[4] = buf;
          v48[5] = &v56;
          v48[6] = &v50;
          objc_msgSend(v36, "requestAccessToResource:withMode:reply:", v7, a4, v48);

        }
        while ((BMShouldRetry((void *)v51[5], &v62, 2uLL, 1) & 1) != 0);
        v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        if (v37)
        {
          -[BMAccessAssertionCache createAssertionForAccessDescriptor:extensionToken:path:](self->_accessAssertionCache, "createAssertionForAccessDescriptor:extensionToken:path:", v46, v37, v57[5]);
          v23 = (_BMAccessAssertionNotApplicable *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
LABEL_44:
            _Block_object_dispose(&v50, 8);

            _Block_object_dispose(&v56, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_45;
          }
          __biome_log_for_category(6);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            BMAccessModePrintableDescription(a4);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v51[5];
            *(_DWORD *)v64 = 138543874;
            v65 = v39;
            v66 = 2114;
            v67 = v7;
            v68 = 2114;
            v69 = v40;
            _os_log_error_impl(&dword_1AEB31000, v38, OS_LOG_TYPE_ERROR, "Failed to create assertion for %{public}@ access to %{public}@ with error %{public}@", v64, 0x20u);

          }
        }
        else
        {
          __biome_log_for_category(6);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            BMAccessModePrintableDescription(a4);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v51[5];
            *(_DWORD *)v64 = 138543874;
            v65 = v43;
            v66 = 2114;
            v67 = v7;
            v68 = 2114;
            v69 = v44;
            _os_log_error_impl(&dword_1AEB31000, v38, OS_LOG_TYPE_ERROR, "Failed to acquire extension token for %{public}@ access to %{public}@ with error %{public}@", v64, 0x20u);

          }
        }

        v23 = 0;
        goto LABEL_44;
      }
    }
    else
    {
      __biome_log_for_category(6);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AEB31000, v41, OS_LOG_TYPE_INFO, "Process not sandboxed, skipping access request", buf, 2u);
      }

    }
    v23 = -[_BMAccessAssertionNotApplicable initWithDescriptor:]([_BMAccessAssertionNotApplicable alloc], "initWithDescriptor:", v46);
    goto LABEL_45;
  }
  +[BMProcess current](BMProcess, "current", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](BMAccessControlPolicy, "policyForProcess:connectionFlags:useCase:", v22, 0, self->_useCase);
  v46 = (BMAccessDescriptor *)objc_claimAutoreleasedReturnValue();

  if ((-[BMAccessDescriptor allowsAccessToResource:withMode:](v46, "allowsAccessToResource:withMode:", v7, a4) & 1) != 0)
  {

    goto LABEL_19;
  }
  -[BMAccessTracker logMissingEntitlementsForAccessToResource:domain:withMode:useCase:](self->_accessTracker, "logMissingEntitlementsForAccessToResource:domain:withMode:useCase:", v7, v19, a4, self->_useCase);
  if (a5)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v74 = *MEMORY[0x1E0CB2D50];
    v75[0] = CFSTR("Not entitled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 3, v32);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
LABEL_45:

  os_activity_scope_leave(&state);
  return v23;
}

- (id)_newConnectionForDomain:(unint64_t)a3
{
  uint64_t v5;

  if (a3 == 1)
    v5 = 0;
  else
    v5 = geteuid();
  +[BMAccessConnectionFactory connectionToAccessServerInDomain:user:useCase:](BMAccessConnectionFactory, "connectionToAccessServerInDomain:user:useCase:", a3, v5, self->_useCase);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_currentProcessIsSandboxed
{
  void *v2;
  char v3;

  +[BMProcess current](BMProcess, "current");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSandboxed");

  return v3;
}

- (BMAccessClient)initWithUseCase:(id)a3
{
  return -[BMAccessClient initWithUseCase:sandboxExtensionCache:accessTracker:](self, "initWithUseCase:sandboxExtensionCache:accessTracker:", a3, 0, 0);
}

- (id)requestAccessToResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BMAccessDescriptor *v9;
  _BMAccessAssertionNotApplicable *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    if (+[BMPaths isTestPathOverridden](BMPaths, "isTestPathOverridden"))
    {
      v9 = -[BMAccessDescriptor initWithDomain:accessMode:resource:]([BMAccessDescriptor alloc], "initWithDomain:accessMode:resource:", BMServiceDomainForResource(v8), a4, v8);
      v10 = -[_BMAccessAssertionNotApplicable initWithDescriptor:]([_BMAccessAssertionNotApplicable alloc], "initWithDescriptor:", v9);

    }
    else
    {
      -[BMAccessClient _requestAccessToResource:mode:error:](self, "_requestAccessToResource:mode:error:", v8, a4, a5);
      v10 = (_BMAccessAssertionNotApplicable *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (*a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("nil resource");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 12, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

- (BMAccessClient)initWithUseCase:(id)a3 sandboxExtensionCache:(id)a4 accessTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMAccessClient *v11;
  uint64_t v12;
  NSString *useCase;
  BMAccessAssertionCache *v14;
  BMAccessAssertionCache *accessAssertionCache;
  BMAccessTracker *v16;
  BMAccessTracker *accessTracker;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMAccessClient;
  v11 = -[BMAccessClient init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    useCase = v11->_useCase;
    v11->_useCase = (NSString *)v12;

    if (v9)
    {
      v14 = (BMAccessAssertionCache *)v9;
    }
    else
    {
      +[BMAccessAssertionCache sharedCache](BMAccessAssertionCache, "sharedCache");
      v14 = (BMAccessAssertionCache *)objc_claimAutoreleasedReturnValue();
    }
    accessAssertionCache = v11->_accessAssertionCache;
    v11->_accessAssertionCache = v14;

    if (v10)
    {
      v16 = (BMAccessTracker *)v10;
    }
    else
    {
      +[BMAccessTracker sharedInstance](BMAccessTracker, "sharedInstance");
      v16 = (BMAccessTracker *)objc_claimAutoreleasedReturnValue();
    }
    accessTracker = v11->_accessTracker;
    v11->_accessTracker = v16;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessTracker, 0);
  objc_storeStrong((id *)&self->_accessAssertionCache, 0);
  objc_storeStrong((id *)&self->_connectionWrapper, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

- (BMAccessClient)init
{
  return -[BMAccessClient initWithUseCase:sandboxExtensionCache:accessTracker:](self, "initWithUseCase:sandboxExtensionCache:accessTracker:", CFSTR("__legacy__"), 0, 0);
}

- (id)_synchronousRemoteObjectProxyForDomain:(unint64_t)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  BMXPCConnectionWrapper *v7;
  BMXPCConnectionWrapper *v8;
  void *v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  BMXPCConnectionWrapper *v21;
  void (**v22)(id, void *);
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = self->_connectionWrapper;
  if (!-[BMXPCConnectionWrapper isValid](v7, "isValid"))
  {
    v8 = -[BMAccessClient _newConnectionForDomain:](self, "_newConnectionForDomain:", a3);

    objc_storeStrong((id *)&self->_connectionWrapper, v8);
    v7 = v8;
  }
  if (!v7)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Failed to get or create BMXPCConnectionWrapper");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 0, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v15);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  -[BMXPCConnectionWrapper connection](v7, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Failed to get connection from BMXPCConnectionWrapper");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 0, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v18);

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__BMAccessClient__synchronousRemoteObjectProxyForDomain_errorHandler___block_invoke;
  v20[3] = &unk_1E5E3CAC0;
  v21 = v7;
  v10 = v6;
  v22 = v10;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Failed to create remote object proxy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);

  }
  v15 = v21;
LABEL_11:

  return v11;
}

void __70__BMAccessClient__synchronousRemoteObjectProxyForDomain_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CB28A8]))
  {
    if (objc_msgSend(v5, "code") == 4099)
    {

LABEL_6:
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      goto LABEL_7;
    }
    v4 = objc_msgSend(v5, "code");

    if (v4 == 4097)
      goto LABEL_6;
  }
  else
  {

  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  __biome_log_for_category(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_80(_QWORD *a1, void *a2, void *a3, void *a4)
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

- (id)requestEndpointForDomain:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  unint64_t v26;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v11 = _os_activity_create(&dword_1AEB31000, "BMAccessClient.requestEndpointForDomain:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  v26 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke;
    v13[3] = &unk_1E5E3CAE8;
    v13[4] = &v14;
    -[BMAccessClient _synchronousRemoteObjectProxyForDomain:errorHandler:](self, "_synchronousRemoteObjectProxyForDomain:errorHandler:", a3, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke_102;
    v12[3] = &unk_1E5E3CB38;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v7, "requestBiomeEndpoint:reply:", a3 == 1, v12);

  }
  while ((BMShouldRetry((void *)v15[5], &v26, 2uLL, 1) & 1) != 0);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  __biome_log_for_category(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke_102(uint64_t a1, void *a2, void *a3)
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

- (BOOL)removeResource:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  os_activity_scope_state_s state;

  v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v12 = _os_activity_create(&dword_1AEB31000, "BMAccessClient.removeResource:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);
  v6 = BMServiceDomainForResource(v5);
  v25 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __50__BMAccessClient_Deletions__removeResource_error___block_invoke;
    v14[3] = &unk_1E5E3CAE8;
    v14[4] = &v15;
    -[BMAccessClient _synchronousRemoteObjectProxyForDomain:errorHandler:](self, "_synchronousRemoteObjectProxyForDomain:errorHandler:", v6, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __50__BMAccessClient_Deletions__removeResource_error___block_invoke_107;
    v13[3] = &unk_1E5E3CB60;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v8, "removeResource:reply:", v5, v13);

  }
  while ((BMShouldRetry((void *)v16[5], &v25, 2uLL, 1) & 1) != 0);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __50__BMAccessClient_Deletions__removeResource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  __biome_log_for_category(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __50__BMAccessClient_Deletions__removeResource_error___block_invoke_107(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __54__BMAccessClient__requestAccessToResource_mode_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Error extending sandbox token - unable to establish XPC connection: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
