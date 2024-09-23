@implementation DKDiagnosticController

- (DKDiagnosticController)init
{
  DKDiagnosticController *v2;
  DKDiagnosticController *v3;
  NSLock *v4;
  NSLock *finishedLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticController;
  v2 = -[DKDiagnosticController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_setup = 0;
    *(_WORD *)&v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;

    v3->_isXPC = 0;
  }
  return v3;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  DKMutableDiagnosticResult *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[DKDiagnosticController beginRequestWithExtensionContext:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[DKDiagnosticController setContext:](self, "setContext:", v4);
  v6 = objc_alloc_init(MEMORY[0x24BDD1768]);
  -[DKDiagnosticController setProgress:](self, "setProgress:", v6);

  v7 = objc_alloc_init(DKMutableDiagnosticResult);
  -[DKDiagnosticController setResult:](self, "setResult:", v7);

}

- (void)beginRequestWithDiagnosticContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  DKMutableDiagnosticResult *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[DKDiagnosticController beginRequestWithDiagnosticContext:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[DKDiagnosticController setIsXPC:](self, "setIsXPC:", 1);
  -[DKDiagnosticController setContext:](self, "setContext:", v4);

  v6 = objc_alloc_init(MEMORY[0x24BDD1768]);
  -[DKDiagnosticController setProgress:](self, "setProgress:", v6);

  v7 = objc_alloc_init(DKMutableDiagnosticResult);
  -[DKDiagnosticController setResult:](self, "setResult:", v7);

}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _OWORD v20[2];

  v3 = a3;
  -[DKDiagnosticController finishedLock](self, "finishedLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (self->_finished || !v3)
  {
    -[DKDiagnosticController finishedLock](self, "finishedLock");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unlock");

  }
  else
  {
    self->_finished = v3;
    -[DKDiagnosticController finishedLock](self, "finishedLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    self->_finished = v3;
    if (-[DKDiagnosticController isSetup](self, "isSetup") && (objc_opt_respondsToSelector() & 1) != 0)
      -[DKDiagnosticController teardown](self, "teardown");
    -[DKDiagnosticController result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKUtilities moveFilesToSharedContainerInMutableResult:](DKUtilities, "moveFilesToSharedContainerInMutableResult:", v8);

    if (!-[DKDiagnosticController isXPC](self, "isXPC"))
    {
      -[DKDiagnosticController result](self, "result");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "files");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticController context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "auditToken");
      else
        memset(v20, 0, sizeof(v20));
      +[DKSandboxExtension issueSandboxExtensionsForFiles:toAuditToken:](DKSandboxExtension, "issueSandboxExtensionsForFiles:toAuditToken:", v10, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticController result](self, "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFileSandboxTokens:", v13);

    }
    -[DKDiagnosticController context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDiagnosticController result](self, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__DKDiagnosticController_setFinished___block_invoke;
    v19[3] = &unk_24F99AA50;
    v19[4] = self;
    objc_msgSend(v15, "completeWithDiagnosticResult:completion:", v17, v19);

  }
}

void __38__DKDiagnosticController_setFinished___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isXPC") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], 0);

  }
}

- (void)setCancelled:(BOOL)a3
{
  DKDiagnosticController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)isCancelled
{
  DKDiagnosticController *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setProgress:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_progress, a3);
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, ProgressObserverContext_2);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("totalUnitCount"), 1, ProgressObserverContext_2);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("indeterminate"), 1, ProgressObserverContext_2);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("userInfo.NSProgressEstimatedTimeRemainingKey"), 1, ProgressObserverContext_2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DKDiagnosticProgress *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DKDiagnosticProgress *v12;
  objc_super v13;

  if ((void *)ProgressObserverContext_2 == a6)
  {
    v7 = [DKDiagnosticProgress alloc];
    -[DKDiagnosticController progress](self, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DKDiagnosticProgress initWithProgress:](v7, "initWithProgress:", v8);

    -[DKDiagnosticController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDiagnosticController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateProgress:forTest:", v12, v11);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DKDiagnosticController;
    -[DKDiagnosticController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (DKMutableDiagnosticResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (BOOL)isXPC
{
  return self->_isXPC;
}

- (void)setIsXPC:(BOOL)a3
{
  self->_isXPC = a3;
}

- (DKDiagnosticContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSLock)finishedLock
{
  return self->_finishedLock;
}

- (void)setFinishedLock:(id)a3
{
  objc_storeStrong((id *)&self->_finishedLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
