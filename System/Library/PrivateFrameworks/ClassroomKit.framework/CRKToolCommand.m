@implementation CRKToolCommand

+ (BOOL)supportsJSON
{
  return 0;
}

+ (BOOL)supportsVerboseOutput
{
  return 0;
}

+ (BOOL)supportsDMFRequest
{
  return 0;
}

+ (id)subcommandPath
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)aliases
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKToolCommand.m"), 52, CFSTR("%@: -aliases must be implemented"), a1);

  return 0;
}

+ (id)description
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKToolCommand.m"), 57, CFSTR("%@: -description must be implemented"), a1);

  return 0;
}

+ (id)help
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "supportsJSON"))
    objc_msgSend(v3, "appendFormat:", CFSTR("     [%@] - outputs in JSON format\n"), CFSTR("-json"));
  if (objc_msgSend(a1, "supportsVerboseOutput"))
    objc_msgSend(v3, "appendFormat:", CFSTR("     [%@] - displays verbose output\n"), CFSTR("-v"));
  if (objc_msgSend(a1, "supportsDMFRequest"))
    objc_msgSend(v3, "appendFormat:", CFSTR("     [%@] - uses a deprecated DMF request instead of a CRK request\n"), CFSTR("-dmf"));
  objc_msgSend(v3, "crk_deleteSuffix:", CFSTR("\n"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (void)printHelp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CRTLog(CFSTR("%@ -- %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v25);

  objc_msgSend(a1, "help");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    CRTLog(CFSTR("Usage: %@ %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);
  else
    CRTLog(CFSTR("No usage help available."), v16, v17, v18, v19, v20, v21, v22, v23);

}

+ (BOOL)instructorCommand
{
  return 0;
}

+ (BOOL)handlesProgress
{
  return 0;
}

- (CRKToolCommand)init
{
  CRKToolCommand *v2;
  uint64_t v3;
  CATOperationQueue *mOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKToolCommand;
  v2 = -[CRKToolCommand init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mOperationQueue = v2->mOperationQueue;
    v2->mOperationQueue = (CATOperationQueue *)v3;

  }
  return v2;
}

- (void)runWithArguments:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__CRKToolCommand_runWithArguments___block_invoke;
  v7[3] = &unk_24D9CA8B8;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  -[CRKToolCommand connectToTaskClientWithCompletionBlock:](self, "connectToTaskClientWithCompletionBlock:", v7);
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "run");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __35__CRKToolCommand_runWithArguments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (!v15 || v5)
  {
    objc_msgSend(v5, "verboseDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CRTLogError(CFSTR("Could not connect: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

    exit(1);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "runWithClient:arguments:", v15, *(_QWORD *)(a1 + 32));

}

- (void)runWithClient:(id)a3 arguments:(id)a4
{
  id v5;

  -[CRKToolCommand operationWithClient:arguments:](self, "operationWithClient:arguments:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKToolCommand executeOperation:](self, "executeOperation:", v5);

}

- (id)arrayByParsingAndRemovingArgumentFlags:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend((id)objc_opt_class(), "supportsJSON"))
    v5 = objc_msgSend(v4, "crk_pluckFlag:", CFSTR("-json"));
  else
    v5 = 0;
  -[CRKToolCommand setPrintJSON:](self, "setPrintJSON:", v5);
  if (objc_msgSend((id)objc_opt_class(), "supportsVerboseOutput"))
    v6 = objc_msgSend(v4, "crk_pluckFlag:", CFSTR("-v"));
  else
    v6 = 0;
  -[CRKToolCommand setPrintVerbose:](self, "setPrintVerbose:", v6);
  if (objc_msgSend((id)objc_opt_class(), "supportsDMFRequest"))
    v7 = objc_msgSend(v4, "crk_pluckFlag:", CFSTR("-dmf"));
  else
    v7 = 0;
  -[CRKToolCommand setUseDMFRequest:](self, "setUseDMFRequest:", v7);
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (id)operationWithClient:(id)a3 arguments:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[CRKToolCommand arrayByParsingAndRemovingArgumentFlags:](self, "arrayByParsingAndRemovingArgumentFlags:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRKToolCommand shouldUseDMFRequest](self, "shouldUseDMFRequest"))
    -[CRKToolCommand DMFRequestWithArguments:](self, "DMFRequestWithArguments:", v7);
  else
    -[CRKToolCommand requestWithArguments:](self, "requestWithArguments:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "prepareTaskOperationForRequest:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)requestWithArguments:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKToolCommand.m"), 146, CFSTR("%@: -requestWithArguments: must be implemented"), self);

  return 0;
}

- (id)DMFRequestWithArguments:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKToolCommand.m"), 151, CFSTR("%@: -DMFRequestWithArguments: must be implemented"), self);

  return 0;
}

- (void)remoteTaskDidFinish:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v22, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verboseDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CRTLogError(CFSTR("Error: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

LABEL_5:
    v14 = v22;
    goto LABEL_6;
  }
  objc_msgSend(v22, "resultObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v22;
  if (v13)
  {
    objc_msgSend(v22, "resultObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CRTLog(CFSTR("%@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)transportProvider
{
  void *v3;
  CRKCurrentPlatformInstructordTransportProvider *v4;
  void *v5;
  void *v6;
  CRKCurrentPlatformInstructordTransportProvider *v7;

  if (objc_msgSend((id)objc_opt_class(), "instructorCommand"))
  {
    -[CRKToolCommand targetClassroomInstallation](self, "targetClassroomInstallation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [CRKCurrentPlatformInstructordTransportProvider alloc];
    objc_msgSend(v3, "classroomURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "instructordBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CRKCurrentPlatformInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:](v4, "initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:", 0, v5, v6);

  }
  else
  {
    v7 = (CRKCurrentPlatformInstructordTransportProvider *)objc_opt_new();
  }
  return v7;
}

- (void)connectToTaskClientWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKToolCommand.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[CRKToolCommand transportProvider](self, "transportProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__CRKToolCommand_connectToTaskClientWithCompletionBlock___block_invoke;
  v9[3] = &unk_24D9CA8E0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchTransportWithCompletion:", v9);

}

void __57__CRKToolCommand_connectToTaskClientWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CRKToolCommandUserInfo *v8;
  void *v9;
  CRKToolCommandUserInfo *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (!a3)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
    v8 = [CRKToolCommandUserInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRKToolCommandUserInfo initWithSessionIdentifier:](v8, "initWithSessionIdentifier:", v9);
    -[CRKToolCommandUserInfo dictionaryValue](v10, "dictionaryValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUserInfo:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "connectWithTransport:", v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)executeOperation:(id)a3
{
  id v5;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *mSIGINTSource;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  sigaction v22;
  _QWORD handler[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "printHelp");
    exit(1);
  }
  v6 = v5;
  objc_storeStrong((id *)&self->mOperation, a3);
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA08], 2uLL, 0, MEMORY[0x24BDAC9B8]);
  mSIGINTSource = self->mSIGINTSource;
  self->mSIGINTSource = v7;

  v9 = self->mSIGINTSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __35__CRKToolCommand_executeOperation___block_invoke;
  handler[3] = &unk_24D9C7020;
  v10 = v6;
  v24 = v10;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->mSIGINTSource);
  v22.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v22.sa_mask = 0;
  sigaction(2, &v22, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "handlesProgress"))
      objc_msgSend(v10, "addTarget:selector:forOperationEvents:", self, sel__remoteTaskDidProgress_, 8);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    objc_msgSend(v10, "addTarget:selector:forOperationEvents:", self, sel__remoteTaskDidFinish_, 6);
    goto LABEL_17;
  }
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v10;
  objc_msgSend(v17, "remoteTaskOperations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "handlesProgress"))
          objc_msgSend(v16, "addTarget:selector:forOperationEvents:", self, sel__remoteTaskDidProgress_, 8);
        objc_msgSend(v16, "addTarget:selector:forOperationEvents:", self, sel__remoteTaskDidFinish_, 6);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v13);
  }

LABEL_17:
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v10);

}

uint64_t __35__CRKToolCommand_executeOperation___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    exit(1);
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_remoteTaskDidFinish:(id)a3
{
  -[CRKToolCommand remoteTaskDidFinish:](self, "remoteTaskDidFinish:", a3);
  -[CRKToolCommand cleanupAndExitIfNeeded](self, "cleanupAndExitIfNeeded");
}

- (void)cleanupAndExitIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (-[CRKToolCommand isCommandFinished](self, "isCommandFinished"))
  {
    v3 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke;
    v9[3] = &unk_24D9C7020;
    v9[4] = self;
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke_2;
    v8[3] = &unk_24D9C7020;
    v8[4] = self;
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDependency:", v4);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v4);

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperation:", v5);

  }
}

uint64_t __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "disconnect");
}

void __40__CRKToolCommand_cleanupAndExitIfNeeded__block_invoke_2(uint64_t a1)
{
  exit(objc_msgSend(*(id *)(a1 + 32), "didCommandSucceed") ^ 1);
}

- (BOOL)isCommandFinished
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return -[CATOperation isFinished](self->mOperation, "isFinished");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CATOperation remoteTaskOperations](self->mOperation, "remoteTaskOperations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isFinished"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)didCommandSucceed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return -[CRKToolCommand didOperationSucceed:](self, "didOperationSucceed:", self->mOperation);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CATOperation remoteTaskOperations](self->mOperation, "remoteTaskOperations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!-[CRKToolCommand didOperationSucceed:](self, "didOperationSucceed:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)didOperationSucceed:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFinished"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x24BDD16D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", v9, v10, v8);

}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a4, "verboseDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CRTLogError(CFSTR("Client failed with error: %@ %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v13);

  objc_msgSend(v13, "invalidate");
}

- (BOOL)shouldPrintJSON
{
  return self->_printJSON;
}

- (void)setPrintJSON:(BOOL)a3
{
  self->_printJSON = a3;
}

- (BOOL)shouldPrintVerbose
{
  return self->_printVerbose;
}

- (void)setPrintVerbose:(BOOL)a3
{
  self->_printVerbose = a3;
}

- (BOOL)shouldUseDMFRequest
{
  return self->_useDMFRequest;
}

- (void)setUseDMFRequest:(BOOL)a3
{
  self->_useDMFRequest = a3;
}

- (CRKToolCommandDelegate)delegate
{
  return (CRKToolCommandDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CRKClassroomInstallation)targetClassroomInstallation
{
  return self->_targetClassroomInstallation;
}

- (void)setTargetClassroomInstallation:(id)a3
{
  objc_storeStrong((id *)&self->_targetClassroomInstallation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClassroomInstallation, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOperation, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->mTaskClient, 0);
  objc_storeStrong((id *)&self->mSIGINTSource, 0);
}

@end
