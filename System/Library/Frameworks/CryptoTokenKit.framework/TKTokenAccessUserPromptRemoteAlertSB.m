@implementation TKTokenAccessUserPromptRemoteAlertSB

+ (BOOL)isAvailable
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (getBSAuditTokenClass() && getBSProcessHandleClass())
  {
    if (getSBSRemoteAlertConfigurationContextClass()
      && getSBSRemoteAlertDefinitionClass()
      && getSBSRemoteAlertHandleClass()
      && getSBSRemoteAlertPresentationTargetClass()
      && getSBSRemoteAlertActivationContextClass())
    {
      return 1;
    }
    TK_LOG_user_prompt();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[TKTokenAccessUserPromptRemoteAlertSB isAvailable].cold.2(v3, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    TK_LOG_user_prompt();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[TKTokenAccessUserPromptRemoteAlertSB isAvailable].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

- (int64_t)preflightStatus
{
  return 2;
}

- (int64_t)promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  SBSRemoteAlertHandle *v10;
  SBSRemoteAlertHandle *remoteAlertHandle;
  id BSAuditTokenClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  TKTokenAccessUserPromptInfo *v18;
  void *v19;
  void *v20;
  OS_dispatch_semaphore *v21;
  OS_dispatch_semaphore *remoteAlertSemaphore;
  NSObject *v23;
  dispatch_time_t v24;
  intptr_t v25;
  id v26;
  BOOL v27;
  int64_t grantedAccess;
  const __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  int64_t v33;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  id location;
  _OWORD v42[2];
  uint64_t v43;
  __CFString *v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  self->_grantedAccess = 0;
  objc_storeStrong((id *)&self->_accessRequest, a3);
  if (self->_remoteAlertHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 78, CFSTR("Concurrent remote alerts are not yet supported"));

  }
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "resume");
  v39 = objc_alloc_init((Class)getSBSRemoteAlertConfigurationContextClass());
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setXpcEndpoint:", v9);

  v36 = (void *)objc_msgSend(objc_alloc((Class)getSBSRemoteAlertDefinitionClass()), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ctkui"), CFSTR("TKUITokenAccessPromptVC"));
  v10 = (SBSRemoteAlertHandle *)objc_msgSend(getSBSRemoteAlertHandleClass(), "newHandleWithDefinition:configurationContext:", v36, v39);
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v10;

  -[SBSRemoteAlertHandle registerObserver:](self->_remoteAlertHandle, "registerObserver:", self);
  BSAuditTokenClass = getBSAuditTokenClass();
  objc_msgSend(v40, "clientConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "auditToken");
  else
    memset(v42, 0, sizeof(v42));
  objc_msgSend(BSAuditTokenClass, "tokenFromAuditToken:", v42);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getBSProcessHandleClass(), "processHandleForAuditToken:", v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)getSBSRemoteAlertPresentationTargetClass()), "initWithTargetProcess:", v15);
  objc_msgSend(v16, "setShouldDismissOnUILock:", 1);
  v17 = objc_alloc_init((Class)getSBSRemoteAlertActivationContextClass());
  objc_msgSend(v17, "setPresentationTarget:", v16);
  v18 = -[TKTokenAccessUserPromptInfo initWithTokenAccessRequest:]([TKTokenAccessUserPromptInfo alloc], "initWithTokenAccessRequest:", v40);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = CFSTR("kTKTokenAccessUserPromptInfo");
  v46[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUserInfo:", v20);

  -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", v17);
  v21 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  remoteAlertSemaphore = self->_remoteAlertSemaphore;
  self->_remoteAlertSemaphore = v21;

  objc_initWeak(&location, self);
  v23 = self->_remoteAlertSemaphore;
  v24 = dispatch_time(0, 600000000000);
  v25 = dispatch_semaphore_wait(v23, v24);
  if (v25 && (v26 = objc_loadWeakRetained(&location), v27 = v26 == 0, v26, v27))
  {
    v33 = 0;
  }
  else
  {
    if (a4)
    {
      grantedAccess = self->_grantedAccess;
      if (grantedAccess != 1)
      {
        v29 = CFSTR("Access request timed out");
        if (!v25)
          v29 = CFSTR("Access request was cancelled");
        if (grantedAccess == 2)
          v30 = CFSTR("User denied access");
        else
          v30 = (__CFString *)v29;
        v31 = v30;
        v43 = *MEMORY[0x1E0CB2938];
        v44 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v32);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v7, "suspend");
    objc_msgSend(v7, "invalidate");
    v33 = self->_grantedAccess;
  }
  objc_destroyWeak(&location);

  return v33;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EF2351C8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  SBSRemoteAlertHandle *remoteAlertHandle;
  BOOL v5;
  void *v7;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
    v5 = remoteAlertHandle == a3;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 150, CFSTR("Received message for unexpected alert handle"));

  }
  self->_grantedAccess = 0;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  SBSRemoteAlertHandle *remoteAlertHandle;
  BOOL v5;
  void *v7;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
    v5 = remoteAlertHandle == a3;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 156, CFSTR("Received message for unexpected alert handle"));

    remoteAlertHandle = self->_remoteAlertHandle;
  }
  -[SBSRemoteAlertHandle invalidate](remoteAlertHandle, "invalidate", a3);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  SBSRemoteAlertHandle *remoteAlertHandle;
  BOOL v6;
  void *v8;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
    v6 = remoteAlertHandle == a3;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 162, CFSTR("Received message for unexpected alert handle"));

    remoteAlertHandle = self->_remoteAlertHandle;
  }
  self->_remoteAlertHandle = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_remoteAlertSemaphore);
}

- (void)registerTokenAccessRequestCorrelationID:(id)a3 access:(int64_t)a4 reply:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  char v12;
  void *v13;
  int v14;
  TKTokenAccessUserPromptInfo *v15;
  NSObject *v16;
  void *v17;

  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  -[TKTokenAccessRequest correlationID](self->_accessRequest, "correlationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 173, CFSTR("Received user response for an unexpected request"));

  }
  -[TKTokenAccessRequest correlationID](self->_accessRequest, "correlationID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isEqual:", v13);

  if (v14)
  {
    self->_grantedAccess = a4;
    v15 = -[TKTokenAccessUserPromptInfo initWithTokenAccessRequest:]([TKTokenAccessUserPromptInfo alloc], "initWithTokenAccessRequest:", self->_accessRequest);
    TK_LOG_user_prompt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessUserPromptRemoteAlertSB registerTokenAccessRequestCorrelationID:access:reply:].cold.1(v15, &self->_grantedAccess, v16);

  }
  v10[2](v10);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_remoteAlertSemaphore);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertSemaphore, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_accessRequest, 0);
}

+ (void)isAvailable
{
  OUTLINED_FUNCTION_0_2(&dword_1B9768000, a1, a3, "TKTokenAccessUserPrompt creation failure. Missing framework: 'SpringBoardServices.framework'", a5, a6, a7, a8, 0);
}

- (void)registerTokenAccessRequestCorrelationID:(void *)a1 access:(uint64_t *)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "clientDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerDisplayName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("unknown");
  v10 = *a2;
  if (*a2 == 2)
    v9 = CFSTR("denied");
  v11 = 138412802;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  if (v10 == 1)
    v9 = CFSTR("granted");
  v15 = 2112;
  v16 = v9;
  _os_log_debug_impl(&dword_1B9768000, a3, OS_LOG_TYPE_DEBUG, "Request to allow '%@' access to token provided by '%@' was '%@'", (uint8_t *)&v11, 0x20u);

}

@end
