@implementation FBProcessExecutionContext

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setWaitForDebugger:(BOOL)a3
{
  self->_waitForDebugger = a3;
}

- (void)setDisableASLR:(BOOL)a3
{
  self->_disableASLR = a3;
}

- (void)setCheckForLeaks:(BOOL)a3
{
  self->_checkForLeaks = a3;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setWatchdogProvider:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogProvider, a3);
}

- (void)setStandardOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_standardOutputURL, a3);
}

- (void)setStandardErrorURL:(id)a3
{
  objc_storeStrong((id *)&self->_standardErrorURL, a3);
}

void __43__FBProcessExecutionContext_setCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "signal");

}

- (void)setCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id completion;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)MEMORY[0x1E0D22F88];
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__FBProcessExecutionContext_setCompletion___block_invoke;
    v19[3] = &unk_1E4A12470;
    v8 = v5;
    v20 = v8;
    v9 = v4;
    v21 = v9;
    objc_msgSend(v6, "sentinelWithCompletion:", v19);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __43__FBProcessExecutionContext_setCompletion___block_invoke_3;
    v15[3] = &unk_1E4A12498;
    v16 = v8;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    v10 = v17;
    v11 = v8;
    v12 = (void *)objc_msgSend(v15, "copy");
    completion = self->_completion;
    self->_completion = v12;

  }
  else
  {
    v14 = self->_completion;
    self->_completion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_overrideExecutableSlice, 0);
  objc_storeStrong((id *)&self->_overrideExecutablePath, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);
  objc_storeStrong((id *)&self->_standardErrorURL, 0);
  objc_storeStrong((id *)&self->_standardOutputURL, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)_initWithExecutionContext:(id)a3
{
  id v4;
  void *v5;
  FBProcessExecutionContext *v6;
  void *v7;
  uint64_t v8;
  NSArray *arguments;
  void *v10;
  uint64_t v11;
  NSDictionary *environment;
  uint64_t v13;
  NSURL *standardOutputURL;
  uint64_t v15;
  NSURL *standardErrorURL;
  uint64_t v17;
  FBProcessWatchdogProviding *watchdogProvider;
  double v19;
  uint64_t v20;
  NSString *overrideExecutablePath;
  uint64_t v22;
  FBProcessExecutableSlice *overrideExecutableSlice;
  void *v24;
  uint64_t v25;
  id completion;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBProcessExecutionContext initWithIdentity:](self, "initWithIdentity:", v5);

  if (v6)
  {
    objc_msgSend(v4, "arguments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    arguments = v6->_arguments;
    v6->_arguments = (NSArray *)v8;

    objc_msgSend(v4, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    environment = v6->_environment;
    v6->_environment = (NSDictionary *)v11;

    objc_msgSend(v4, "standardOutputURL");
    v13 = objc_claimAutoreleasedReturnValue();
    standardOutputURL = v6->_standardOutputURL;
    v6->_standardOutputURL = (NSURL *)v13;

    objc_msgSend(v4, "standardErrorURL");
    v15 = objc_claimAutoreleasedReturnValue();
    standardErrorURL = v6->_standardErrorURL;
    v6->_standardErrorURL = (NSURL *)v15;

    v6->_waitForDebugger = objc_msgSend(v4, "waitForDebugger");
    v6->_disableASLR = objc_msgSend(v4, "disableASLR");
    v6->_checkForLeaks = objc_msgSend(v4, "checkForLeaks");
    v6->_launchIntent = objc_msgSend(v4, "launchIntent");
    objc_msgSend(v4, "watchdogProvider");
    v17 = objc_claimAutoreleasedReturnValue();
    watchdogProvider = v6->_watchdogProvider;
    v6->_watchdogProvider = (FBProcessWatchdogProviding *)v17;

    objc_msgSend(v4, "watchdogExtension");
    v6->_watchdogExtension = v19;
    objc_msgSend(v4, "overrideExecutablePath");
    v20 = objc_claimAutoreleasedReturnValue();
    overrideExecutablePath = v6->_overrideExecutablePath;
    v6->_overrideExecutablePath = (NSString *)v20;

    v6->_forSceneActivation = objc_msgSend(v4, "forSceneActivation");
    objc_msgSend(v4, "overrideExecutableSlice");
    v22 = objc_claimAutoreleasedReturnValue();
    overrideExecutableSlice = v6->_overrideExecutableSlice;
    v6->_overrideExecutableSlice = (FBProcessExecutableSlice *)v22;

    objc_msgSend(v4, "completion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    completion = v6->_completion;
    v6->_completion = (id)v25;

  }
  return v6;
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (int64_t)launchIntent
{
  return self->_launchIntent;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (FBProcessWatchdogProviding)watchdogProvider
{
  return self->_watchdogProvider;
}

- (BOOL)waitForDebugger
{
  return self->_waitForDebugger;
}

- (id)completion
{
  return self->_completion;
}

- (FBProcessExecutableSlice)overrideExecutableSlice
{
  return self->_overrideExecutableSlice;
}

- (NSString)overrideExecutablePath
{
  return self->_overrideExecutablePath;
}

- (NSURL)standardOutputURL
{
  return self->_standardOutputURL;
}

- (NSURL)standardErrorURL
{
  return self->_standardErrorURL;
}

- (BOOL)disableASLR
{
  return self->_disableASLR;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (FBProcessExecutionContext)initWithIdentity:(id)a3
{
  id v4;
  FBProcessExecutionContext *v5;
  uint64_t v6;
  RBSProcessIdentity *identity;

  v4 = a3;
  v5 = -[FBProcessExecutionContext init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;

  }
  return v5;
}

- (BOOL)forSceneActivation
{
  return self->_forSceneActivation;
}

- (double)watchdogExtension
{
  return self->_watchdogExtension;
}

- (BOOL)checkForLeaks
{
  return self->_checkForLeaks;
}

void __43__FBProcessExecutionContext_setCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  if (objc_msgSend(a2, "isFailed"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "signal"))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessExecutionContext"), 1, &__block_literal_global_3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

    }
  }
}

- (id)copyOrUpdateForSceneActivationWithSettings:(id)a3
{
  id v4;
  int64_t v5;
  FBProcessExecutionContext *v6;
  FBProcessExecutionContext *v7;

  v4 = a3;
  v5 = -[FBProcessExecutionContext launchIntent](self, "launchIntent");
  if (!v5)
  {
    if (objc_msgSend(v4, "isForeground"))
    {
      if (objc_msgSend(v4, "jetsamMode") == 1)
        v5 = 3;
      else
        v5 = 4;
    }
    else
    {
      v5 = 2;
    }
  }
  v6 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = -[FBProcessExecutionContext _initWithExecutionContext:]([FBProcessExecutionContext alloc], "_initWithExecutionContext:", v6);

    v6 = v7;
  }
  -[FBProcessExecutionContext setForSceneActivation:](v6, "setForSceneActivation:", 1);
  -[FBProcessExecutionContext setLaunchIntent:](v6, "setLaunchIntent:", v5);

  return v6;
}

- (void)setLaunchIntent:(int64_t)a3
{
  self->_launchIntent = a3;
}

- (void)setForSceneActivation:(BOOL)a3
{
  self->_forSceneActivation = a3;
}

uint64_t __43__FBProcessExecutionContext_setCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureReason:", CFSTR("No process execution was performed"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBProcessExecutionContext _initWithExecutionContext:](+[FBMutableProcessExecutionContext allocWithZone:](FBMutableProcessExecutionContext, "allocWithZone:", a3), "_initWithExecutionContext:", self);
}

- (void)setWatchdogExtension:(double)a3
{
  self->_watchdogExtension = a3;
}

- (void)setOverrideExecutablePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setOverrideExecutableSlice:(id)a3
{
  objc_storeStrong((id *)&self->_overrideExecutableSlice, a3);
}

@end
