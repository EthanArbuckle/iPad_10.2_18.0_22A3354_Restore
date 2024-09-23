@implementation _LSSpringBoardCall

- (NSDictionary)launchOptions
{
  _LSSpringBoardCall *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_launchOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLaunchOptions:(id)a3
{
  _LSSpringBoardCall *v4;
  NSDictionary *v5;
  NSString *schemeIfNotFileURL;
  uint64_t FBSOpenApplicationOptionKeyPayloadURL;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  BSServiceConnectionEndpoint *targetServiceConnectionEndpoint;
  NSDictionary *launchOptions;
  id v17;

  v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (NSDictionary *)objc_msgSend(v17, "mutableCopy");
  schemeIfNotFileURL = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = 0;

  FBSOpenApplicationOptionKeyPayloadURL = getFBSOpenApplicationOptionKeyPayloadURL();
  v8 = objc_opt_class();
  -[NSDictionary objectForKey:](v5, "objectForKey:", FBSOpenApplicationOptionKeyPayloadURL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = v10;
      v10 = 0;
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isFileURL") & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = (NSString *)v12;

LABEL_8:
LABEL_9:
  if (getBSServiceConnectionEndpointClass())
  {
    -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("LSTargetBSServiceConnectionEndpointKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0;
    }
    targetServiceConnectionEndpoint = v4->_targetServiceConnectionEndpoint;
    v4->_targetServiceConnectionEndpoint = (BSServiceConnectionEndpoint *)v14;

    -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("LSTargetBSServiceConnectionEndpointKey"));
  }
  launchOptions = v4->_launchOptions;
  v4->_launchOptions = v5;

  objc_sync_exit(v4);
}

- (_LSSpringBoardCall)callWithCompletionHandler:(id)a3
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  NSString *schemeIfNotFileURL;
  _LSSpringBoardCall *result;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall callWithCompletionHandler:]");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSpringBoardCall.mm"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  if (self->_schemeIfNotFileURL)
  {
    _LSServer_DatabaseExecutionContext();
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v6);

    -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48___LSSpringBoardCall_callWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E10453D0;
    v12[4] = self;
    v13 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v7, v8, schemeIfNotFileURL, 0, v12);

  }
  else
  {
    -[_LSSpringBoardCall callSpringBoardWithCompletionHandler:](self, "callSpringBoardWithCompletionHandler:", v5);
  }

  return result;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "processIdentifier");
  v9 = -[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete");
  v10 = CFSTR("no");
  if (v9)
    v10 = CFSTR("yes");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> { bundleID = %@, client = %li, blocking = %@ }"), v5, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleIdentifier:", v5);

    -[_LSSpringBoardCall launchOptions](self, "launchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLaunchOptions:", v6);

    -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientXPCConnection:", v7);

    objc_msgSend(v4, "setCallCompletionHandlerWhenFullyComplete:", -[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"));
  }
  return v4;
}

- (BSServiceConnectionEndpoint)targetServiceConnectionEndpoint
{
  return (BSServiceConnectionEndpoint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetServiceConnectionEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSXPCConnection)clientXPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientXPCConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)callCompletionHandlerWhenFullyComplete
{
  return self->_callCompletionHandlerWhenFullyComplete;
}

- (void)setCallCompletionHandlerWhenFullyComplete:(BOOL)a3
{
  self->_callCompletionHandlerWhenFullyComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_targetServiceConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_schemeIfNotFileURL, 0);
}

+ (id)springBoardQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardQueue]::once != -1)
    dispatch_once(&+[_LSSpringBoardCall(Private) springBoardQueue]::once, &__block_literal_global_69);
  return (id)+[_LSSpringBoardCall(Private) springBoardQueue]::result;
}

+ (id)springBoardDeadlockPreventionQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken != -1)
    dispatch_once(&+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken, &__block_literal_global_57);
  return (id)+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result;
}

- (void)callSpringBoardWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *FBSOpenApplicationOptionsClass;
  void *v9;
  void *v10;
  void *v11;
  void *FBSProcessHandleClass;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  _LSSpringBoardCall *v30;
  id v31;
  id v32;
  id v33;

  v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSpringBoardCall.mm"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  -[_LSSpringBoardCall targetServiceConnectionEndpoint](self, "targetServiceConnectionEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend((id)getFBSOpenApplicationServiceClass(), "serviceWithEndpoint:", v6);
  else
    objc_msgSend((id)getFBSOpenApplicationServiceClass(), "serviceWithDefaultShellEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    FBSOpenApplicationOptionsClass = (void *)getFBSOpenApplicationOptionsClass();
    -[_LSSpringBoardCall launchOptions](self, "launchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(FBSOpenApplicationOptionsClass, "optionsWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      FBSProcessHandleClass = (void *)getFBSProcessHandleClass();
      -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(FBSProcessHandleClass, "processHandleForNSXPCConnection:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)getFBSProcessHandleClass(), "processHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"))
    {
      MEMORY[0x186DAF208]();
      objc_msgSend((id)objc_opt_class(), "springBoardQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke;
      block[3] = &unk_1E1045318;
      v29 = v7;
      v30 = self;
      v31 = v10;
      v32 = v14;
      v33 = v5;
      v16 = v14;
      v17 = v10;
      dispatch_async(v15, block);

      v18 = v29;
    }
    else
    {
      MEMORY[0x186DAF208]();
      objc_msgSend((id)objc_opt_class(), "springBoardDeadlockPreventionQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_3;
      v23[3] = &unk_1E1045318;
      v23[4] = self;
      v24 = v7;
      v25 = v10;
      v26 = v14;
      v27 = v5;
      v20 = v14;
      v21 = v10;
      dispatch_async(v19, v23);

      v18 = v24;
    }

  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 45, (uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]", 300, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);
  }

}

- (void)lieWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) lieWithCompletionHandler:]");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSpringBoardCall.mm"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  v5 = (void *)-[_LSSpringBoardCall copy](self, "copy");
  objc_msgSend(v5, "setCallCompletionHandlerWhenFullyComplete:", 1);
  objc_msgSend(v5, "callWithCompletionHandler:", &__block_literal_global_65_0);
  v7[2](v7, 1, 0);

}

- (void)promptAndCallSpringBoardWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSString *schemeIfNotFileURL;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) promptAndCallSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSpringBoardCall.mm"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  if (-[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"))
  {
    -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77___LSSpringBoardCall_Private__promptAndCallSpringBoardWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E10453D0;
    v10[4] = self;
    v11 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v6, v7, schemeIfNotFileURL, 3, v10);

  }
  else
  {
    -[_LSSpringBoardCall lieWithCompletionHandler:](self, "lieWithCompletionHandler:", v5);
  }

}

@end
