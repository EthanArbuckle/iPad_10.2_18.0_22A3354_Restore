@implementation BKSProcess

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1)
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_0);
  return (id)currentProcess___currentProcess;
}

uint64_t __28__BKSProcess_currentProcess__block_invoke()
{
  BKSProcess *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = [BKSProcess alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[BKSProcess initWithBundleIdentifier:](v0, "initWithBundleIdentifier:", v2);
  v4 = (void *)currentProcess___currentProcess;
  currentProcess___currentProcess = v3;

  return objc_msgSend((id)currentProcess___currentProcess, "bootstrapCurrentProcess");
}

- (void)bootstrapCurrentProcess
{
  BSProcessHandle *v3;
  BSProcessHandle *handle;
  RBSProcessHandle *v5;
  RBSProcessHandle *processHandle;

  objc_msgSend(MEMORY[0x1E0D01830], "processHandle");
  v3 = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  self->_handle = v3;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v5 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
  processHandle = self->_processHandle;
  self->_processHandle = v5;

  self->_bootstrapped = 1;
}

- (BKSProcess)init
{
  return -[BKSProcess initWithBundleIdentifier:](self, "initWithBundleIdentifier:", 0);
}

- (BKSProcess)initWithBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BKSProcess *v10;
  void *v12;
  void *v13;

  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 71, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 71, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:NSStringClass]"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
  else
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:", v5, v5, getuid(), 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKSProcess initWithProcessIdentity:](self, "initWithProcessIdentity:", v9);

  return v10;
}

- (BKSProcess)initWithProcessIdentity:(id)a3
{
  id v5;
  BKSProcess *v6;
  BKSProcess *v7;
  uint64_t v8;
  RBSProcessIdentity *identity;
  uint64_t v10;
  RBSProcessMonitor *monitor;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a3;
  NSClassFromString(CFSTR("RBSProcessIdentity"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 82, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 82, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:RBSProcessIdentityClass]"));

  }
  v15.receiver = self;
  v15.super_class = (Class)BKSProcess;
  v6 = -[BKSProcess init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(v5, "copy");
    identity = v7->_identity;
    v7->_identity = (RBSProcessIdentity *)v8;

    objc_msgSend(MEMORY[0x1E0D87D90], "monitor");
    v10 = objc_claimAutoreleasedReturnValue();
    monitor = v7->_monitor;
    v7->_monitor = (RBSProcessMonitor *)v10;

  }
  return v7;
}

- (BOOL)bootstrapWithProcessHandle:(id)a3 error:(id *)a4
{
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  if (self->_handle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_handle == nil"));

  }
  if (objc_opt_class())
  {
    v9 = v8;
    NSClassFromString(CFSTR("BSProcessHandle"));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 100, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 100, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:BSProcessHandleClass]"));

    }
    objc_storeStrong((id *)&self->_handle, a3);
    v10 = -[BKSProcess _bootstrapWithError:](self, "_bootstrapWithError:", a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  RBSProcessHandle *processHandle;
  RBSAssertion *assertion;
  BKSProcessAssertion *audioAssertion;
  BKSProcessAssertion *mediaAssertion;
  RBSProcessMonitor *monitor;
  int v10;
  BKSProcess *v11;
  __int16 v12;
  RBSProcessHandle *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  rbs_shim_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    processHandle = self->_processHandle;
    v10 = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = processHandle;
    _os_log_impl(&dword_1B0792000, v4, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] Invalidating BKSProcess for %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[RBSAssertion invalidate](self->_assertion, "invalidate");
  assertion = self->_assertion;
  self->_assertion = 0;

  -[BKSProcessAssertion invalidate](self->_audioAssertion, "invalidate");
  audioAssertion = self->_audioAssertion;
  self->_audioAssertion = 0;

  -[BKSProcessAssertion invalidate](self->_mediaAssertion, "invalidate");
  mediaAssertion = self->_mediaAssertion;
  self->_mediaAssertion = 0;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

+ (double)backgroundTimeRemaining
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(a1, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundTimeRemaining");
  v4 = v3;

  result = 1.79769313e308;
  if (v4 != *MEMORY[0x1E0D87E30])
    return v4;
  return result;
}

- (double)backgroundTimeRemaining
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[RBSProcessHandle activeLimitations](self->_processHandle, "activeLimitations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runTime");
  v4 = v3;

  result = 1.79769313e308;
  if (v4 != *MEMORY[0x1E0D87E30])
    return v4;
  return result;
}

- (BKSProcessExitContext)lastExitContext
{
  os_unfair_lock_s *p_lock;
  BKSProcessExitContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastExitContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNowPlayingWithAudio:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  RBSProcessHandle *processHandle;
  BKSProcessAssertion *v8;
  BKSProcessAssertion *audioAssertion;
  BKSProcessAssertion *v10;
  int v11;
  BKSProcess *v12;
  __int16 v13;
  RBSProcessHandle *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_nowPlayingWithAudio != v3)
  {
    self->_nowPlayingWithAudio = v3;
    rbs_shim_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      v11 = 134218498;
      v12 = self;
      v13 = 2114;
      v14 = processHandle;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1B0792000, v6, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ now playing with audio: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_nowPlayingWithAudio)
    {
      v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]([BKSProcessAssertion alloc], "initWithPID:flags:reason:name:", -[RBSProcessHandle pid](self->_processHandle, "pid"), 13, 1, CFSTR("-[BKSProcess setNowPlayingWithAudio:YES]"));
      audioAssertion = self->_audioAssertion;
      self->_audioAssertion = v8;

      -[BKSProcessAssertion acquire](self->_audioAssertion, "acquire");
    }
    else
    {
      -[BKSProcessAssertion invalidate](self->_audioAssertion, "invalidate");
      v10 = self->_audioAssertion;
      self->_audioAssertion = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setRecordingAudio:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  RBSProcessHandle *processHandle;
  BKSProcessAssertion *v8;
  BKSProcessAssertion *mediaAssertion;
  BKSProcessAssertion *v10;
  int v11;
  BKSProcess *v12;
  __int16 v13;
  RBSProcessHandle *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_recordingAudio != v3)
  {
    self->_recordingAudio = v3;
    rbs_shim_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      v11 = 134218498;
      v12 = self;
      v13 = 2114;
      v14 = processHandle;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1B0792000, v6, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ now recording audio: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_recordingAudio)
    {
      v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]([BKSProcessAssertion alloc], "initWithPID:flags:reason:name:", -[RBSProcessHandle pid](self->_processHandle, "pid"), 13, 23, CFSTR("-[BKSProcess setRecordingAudio:YES]"));
      mediaAssertion = self->_mediaAssertion;
      self->_mediaAssertion = v8;

      -[BKSProcessAssertion acquire](self->_mediaAssertion, "acquire");
    }
    else
    {
      -[BKSProcessAssertion invalidate](self->_mediaAssertion, "invalidate");
      v10 = self->_mediaAssertion;
      self->_mediaAssertion = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
}

+ (id)busyExtensionInstances:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "busyExtensionInstancesFromSet:error:", v3, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v21 = CFSTR("ExtensionBundleID");
        v22 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v10);
  }

  return v4;
}

- (BOOL)_bootstrapWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSProcessHandle *handle;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  BSProcessHandle *v28;
  BSProcessHandle *v29;
  dispatch_time_t v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *lastExitContext;
  uint64_t v41;
  BKSProcessExitContext *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v50;
  id v51;
  void *v52;
  id *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[5];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t v65[128];
  uint8_t buf[4];
  BKSProcess *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  _QWORD v72[8];

  v72[5] = *MEMORY[0x1E0C80C00];
  if (!self->_identity)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSProcess.m"), 205, CFSTR("cannot bootstrap without an identity"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_bootstrapped = 1;
  objc_msgSend(MEMORY[0x1E0D87D30], "grant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v6;
  objc_msgSend(MEMORY[0x1E0D87CE0], "invalidateAfterInterval:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v7;
  objc_msgSend(MEMORY[0x1E0D87D08], "grantWithBackgroundPriority");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v8;
  objc_msgSend(MEMORY[0x1E0D87CB0], "grant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v9;
  objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  handle = self->_handle;
  if (handle)
  {
    v13 = -[BSProcessHandle pid](handle, "pid");
    v14 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(v14, "handleForIdentifier:error:", v15, &v62);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v62;

    if (v16)
    {
      v18 = objc_alloc(MEMORY[0x1E0D87C98]);
      v19 = (void *)MEMORY[0x1E0D87DF8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetWithProcessIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v18, "initWithExplanation:target:attributes:", CFSTR("BKSProcessLaunch"), v21, v11);

      objc_msgSend(v22, "acquireWithError:", 0);
LABEL_7:
      rbs_shim_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v67 = self;
        v68 = 2114;
        v69 = v16;
        v70 = 2114;
        v71 = v27;
        _os_log_impl(&dword_1B0792000, v26, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ bootstrapped successfully as %{public}@", buf, 0x20u);

      }
      objc_storeStrong((id *)&self->_processHandle, v16);
      objc_storeStrong((id *)&self->_assertion, v22);
      if (!self->_handle)
      {
        objc_msgSend(v16, "legacyHandle");
        v28 = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();
        v29 = self->_handle;
        self->_handle = v28;

      }
      if (self->_assertion)
      {
        v30 = dispatch_time(0, 1000000000);
        v31 = objc_msgSend(MEMORY[0x1E0D87E18], "sharedBackgroundWorkloop");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34__BKSProcess__bootstrapWithError___block_invoke;
        block[3] = &unk_1E6169688;
        block[4] = self;
        dispatch_after(v30, v31, block);

      }
      v32 = 1;
      goto LABEL_31;
    }
    v53 = a3;
    v22 = 0;
  }
  else
  {
    v53 = a3;
    v23 = objc_alloc_init(MEMORY[0x1E0D87D10]);
    objc_msgSend(v23, "setIdentity:", self->_identity);
    objc_msgSend(v23, "setExplanation:", CFSTR("BKSProcessLaunch"));
    objc_msgSend(v23, "setAttributes:", v11);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87D18]), "initWithContext:", v23);
    v60 = 0;
    v61 = 0;
    v59 = 0;
    v25 = objc_msgSend(v24, "execute:assertion:error:", &v61, &v60, &v59);
    v16 = v61;
    v22 = v60;
    v17 = v59;

    if (v25)
      goto LABEL_7;
  }
  v51 = v22;
  v52 = v11;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v17, "underlyingErrors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (!v34)
    goto LABEL_26;
  v35 = v34;
  v36 = *(_QWORD *)v55;
  v37 = *MEMORY[0x1E0CB2FE0];
  do
  {
    for (i = 0; i != v35; ++i)
    {
      if (*(_QWORD *)v55 != v36)
        objc_enumerationMutation(v33);
      v39 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(v39, "domain");
      lastExitContext = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(lastExitContext, "isEqual:", v37))
      {
        v41 = objc_msgSend(v39, "code");

        if (v41 != 80)
          continue;
        v42 = objc_alloc_init(BKSProcessExitContext);
        -[BKSProcessExitContext setExitReason:]((uint64_t)v42, 16);
        lastExitContext = self->_lastExitContext;
        self->_lastExitContext = v42;
      }

    }
    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  }
  while (v35);
LABEL_26:

  rbs_shim_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v67 = self;
    v68 = 2114;
    v69 = v48;
    v70 = 2114;
    v71 = v17;
    _os_log_error_impl(&dword_1B0792000, v43, OS_LOG_TYPE_ERROR, "[BKSProcess:%p] Bootstrap failed for %{public}@ with error: <%{public}@>", buf, 0x20u);

  }
  v11 = v52;
  p_lock = &self->_lock;
  if (v53)
  {
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB3388];
    v63[0] = *MEMORY[0x1E0CB2D68];
    v63[1] = v45;
    v64[0] = CFSTR("Bootstrap failed");
    v64[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("BKSProcessErrorDomain"), 1, v46);
    *v53 = (id)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0;
  v22 = v51;
LABEL_31:
  os_unfair_lock_unlock(p_lock);

  return v32;
}

void __34__BKSProcess__bootstrapWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| %@>"), v5, v6);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (int64_t)terminationReason
{
  return self->_terminationReason;
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

- (BOOL)nowPlayingWithAudio
{
  return self->_nowPlayingWithAudio;
}

- (BOOL)recordingAudio
{
  return self->_recordingAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_audioAssertion, 0);
  objc_storeStrong((id *)&self->_mediaAssertion, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
