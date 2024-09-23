@implementation DKDiagnosticViewControllerMock

- (DKDiagnosticViewControllerMock)init
{
  DKDiagnosticViewControllerMock *v2;
  DKDiagnosticViewControllerMock *v3;
  NSLock *v4;
  NSLock *finishedLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewControllerMock;
  v2 = -[DKDiagnosticViewControllerMock init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v2->_setup = 0;
    v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;

  }
  return v3;
}

- (void)beginRequestWithInputsClass:(Class)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  DKMutableDiagnosticResult *v18;
  void *v19;
  id v20;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(a7, "copy");
  -[DKDiagnosticViewControllerMock setCompletion:](self, "setCompletion:", v15);

  v16 = (void *)objc_opt_new();
  -[DKDiagnosticViewControllerMock setContext:](self, "setContext:", v16);

  v17 = objc_alloc_init(MEMORY[0x24BDD1768]);
  -[DKDiagnosticViewControllerMock setProgress:](self, "setProgress:", v17);

  v18 = objc_alloc_init(DKMutableDiagnosticResult);
  -[DKDiagnosticViewControllerMock setResult:](self, "setResult:", v18);

  -[DKDiagnosticViewControllerMock setInputsClass:](self, "setInputsClass:", a3);
  +[DKUtilities inputsForDiagnostic:predicates:specifications:parameters:](DKUtilities, "inputsForDiagnostic:predicates:specifications:parameters:", self, v14, v13, v12);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[DKDiagnosticViewControllerMock isFinished](self, "isFinished"))
  {
    -[DKDiagnosticViewControllerMock setSetup:](self, "setSetup:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[DKDiagnosticViewControllerMock context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticViewControllerMock setupWithInputs:responder:](self, "setupWithInputs:responder:", v20, v19);

    }
    if (!-[DKDiagnosticViewControllerMock isFinished](self, "isFinished"))
      -[DKDiagnosticViewControllerMock start](self, "start");
  }

}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v7;
  void (**v8)(void);

  v3 = a3;
  -[DKDiagnosticViewControllerMock finishedLock](self, "finishedLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (self->_finished || !v3)
  {
    -[DKDiagnosticViewControllerMock finishedLock](self, "finishedLock");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");
  }
  else
  {
    self->_finished = 1;
    -[DKDiagnosticViewControllerMock finishedLock](self, "finishedLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    if (-[DKDiagnosticViewControllerMock isSetup](self, "isSetup") && (objc_opt_respondsToSelector() & 1) != 0)
      -[DKDiagnosticViewControllerMock teardown](self, "teardown");
    -[DKDiagnosticViewControllerMock completion](self, "completion");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
  }

}

- (void)setCancelled:(BOOL)a3
{
  DKDiagnosticViewControllerMock *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)isCancelled
{
  DKDiagnosticViewControllerMock *v2;
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
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, ProgressObserverContext);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("totalUnitCount"), 1, ProgressObserverContext);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("indeterminate"), 1, ProgressObserverContext);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("userInfo.NSProgressEstimatedTimeRemainingKey"), 1, ProgressObserverContext);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DKDiagnosticProgress *v7;
  void *v8;
  void *v9;
  DKDiagnosticProgress *v10;
  objc_super v11;

  if ((void *)ProgressObserverContext == a6)
  {
    v7 = [DKDiagnosticProgress alloc];
    -[DKDiagnosticViewControllerMock progress](self, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DKDiagnosticProgress initWithProgress:](v7, "initWithProgress:", v8);

    -[DKDiagnosticViewControllerMock context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateProgress:forTest:", v10, &unk_24F9A3588);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DKDiagnosticViewControllerMock;
    -[DKDiagnosticViewControllerMock observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
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

- (BOOL)shouldShowPressHomeLabel
{
  return self->_shouldShowPressHomeLabel;
}

- (void)setShouldShowPressHomeLabel:(BOOL)a3
{
  self->_shouldShowPressHomeLabel = a3;
}

- (DKDiagnosticContextMock)context
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

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (Class)inputsClass
{
  return self->_inputsClass;
}

- (void)setInputsClass:(Class)a3
{
  objc_storeStrong((id *)&self->_inputsClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputsClass, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
