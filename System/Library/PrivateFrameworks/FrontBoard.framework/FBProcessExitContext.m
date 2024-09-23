@implementation FBProcessExitContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateBeforeExiting, 0);
  objc_storeStrong((id *)&self->_watchdogContext, 0);
  objc_storeStrong((id *)&self->_terminationRequest, 0);
  objc_storeStrong((id *)&self->_terminationError, 0);
  objc_storeStrong((id *)&self->_launchError, 0);
  objc_storeStrong((id *)&self->_underlyingContext, 0);
}

- (FBProcessExitContext)initWithUnderlyingContext:(id)a3
{
  id v5;
  FBProcessExitContext *v6;
  FBProcessExitContext *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBProcessExitContext;
  v6 = -[FBProcessExitContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingContext, a3);
    v8 = objc_msgSend(v5, "type");
    if (v8 == 1)
    {
      v7->_exitReason = 1;
    }
    else if (v8 == 2)
    {
      objc_msgSend(v5, "status");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isValid"))
      {
        if (objc_msgSend(v9, "domain") == 10 && objc_msgSend(v9, "code") == 2343432205)
        {
          v10 = 2;
        }
        else if (objc_msgSend(v9, "isCrash"))
        {
          v10 = 4;
        }
        else if (objc_msgSend(v9, "isJetsam"))
        {
          v10 = 16;
        }
        else if (objc_msgSend(v9, "isSignal"))
        {
          v10 = 8;
        }
        else if (objc_msgSend(v9, "isFairPlayFailure"))
        {
          v10 = 32;
        }
        else
        {
          v10 = 128;
        }
        v7->_exitReason = v10;
      }
      else
      {
        v7->_exitReason = 0;
      }

    }
    else
    {
      v7->_exitReason = 0;
    }
  }

  return v7;
}

- (FBProcessExitContext)initWithLaunchError:(id)a3
{
  id v6;
  void *v7;
  FBProcessExitContext *v8;
  FBProcessExitContext *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("error != ((void *)0)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessExitContext initWithLaunchError:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35EDE88);
  }
  v7 = v6;
  v8 = -[FBProcessExitContext initWithUnderlyingContext:](self, "initWithUnderlyingContext:", 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_launchError, a3);
    v9->_exitReason = 64;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v7, "underlyingErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      v14 = *MEMORY[0x1E0CB2FE0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqual:", v14))
          {
            v18 = objc_msgSend(v16, "code");

            if (v18 == 80)
            {
              v9->_exitReason = 32;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }
LABEL_14:

  }
  return v9;
}

- (FBProcessExitContext)initWithTerminationError:(id)a3
{
  id v6;
  void *v7;
  FBProcessExitContext *v8;
  FBProcessExitContext *v9;
  FBProcessExitContext *result;
  void *v11;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = -[FBProcessExitContext initWithUnderlyingContext:](self, "initWithUnderlyingContext:", 0);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_terminationError, a3);
      v9->_exitReason = 128;
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("error != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessExitContext initWithTerminationError:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (FBProcessExitContext *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)createError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSError *launchError;
  int64_t exitReason;
  __CFString *v9;
  void *v10;
  FBProcessWatchdogEventContext *watchdogContext;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  int64_t terminationReason;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NSStringFromFBProcessExitReason(self->_exitReason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D22A98]);

  -[RBSProcessExitContext status](self->_underlyingContext, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  launchError = self->_launchError;
  if (launchError || (launchError = self->_terminationError) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", launchError, *MEMORY[0x1E0CB3388]);
  }
  else if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x1E0CB3388]);

  }
  exitReason = self->_exitReason;
  if (exitReason <= 15)
  {
    v9 = CFSTR("The process exited.");
    switch(exitReason)
    {
      case 0:
        goto LABEL_28;
      case 1:
        v9 = CFSTR("The process exited voluntarily.");
        goto LABEL_28;
      case 2:
        watchdogContext = self->_watchdogContext;
        if (!watchdogContext)
        {
          v9 = CFSTR("The process was watchdogged.");
          goto LABEL_28;
        }
        v12 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromProcessWatchdogEvent(-[FBProcessWatchdogEventContext event](watchdogContext, "event"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("The process was watchdogged during a %@ event."), v13);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_28;
        break;
      case 4:
        v9 = CFSTR("The process crashed.");
        goto LABEL_28;
      case 8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The process exited with signal %llu."), objc_msgSend(v6, "code"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          break;
        goto LABEL_28;
      default:
        break;
    }
LABEL_24:
    v9 = CFSTR("The process exited.");
    goto LABEL_28;
  }
  if (exitReason > 63)
  {
    if (exitReason == 64)
    {
      v9 = CFSTR("The process failed to launch.");
      goto LABEL_28;
    }
    if (exitReason != 128)
      goto LABEL_24;
    if (self->_terminationError)
    {
      v9 = CFSTR("The process failed to terminate as expected.");
    }
    else
    {
      v16 = objc_msgSend(v6, "code");
      if (v16 <= 3735883979)
      {
        if (v16 != 732775916)
        {
          if (v16 == 3221229823)
          {
            v9 = CFSTR("The process exited due to thermal pressure.");
            goto LABEL_28;
          }
          goto LABEL_24;
        }
        if (self->_terminationReason == 8)
          v9 = CFSTR("The process was terminated for rendering insecurely.");
        else
          v9 = CFSTR("The process was terminated due to a security violation.");
      }
      else
      {
        if (v16 == 3735883980)
        {
          v9 = CFSTR("The process suspended while holding a shared file lock.");
          goto LABEL_28;
        }
        if (v16 == 3735943697)
        {
          v9 = CFSTR("The process was quit by the user.");
          goto LABEL_28;
        }
        if (v16 != 4227595259)
          goto LABEL_24;
        terminationReason = self->_terminationReason;
        if (terminationReason == 9 || terminationReason == 6)
          v9 = CFSTR("The process was quit because the system is shutting down or logging out.");
        else
          v9 = CFSTR("The process was force quit by the system.");
      }
    }
  }
  else
  {
    if (exitReason == 16)
    {
      v9 = CFSTR("The process was jettisoned.");
      goto LABEL_28;
    }
    if (exitReason != 32)
      goto LABEL_24;
    v9 = CFSTR("The process was unable to launch due to a FairPlay failure.");
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBProcessExit"), self->_exitReason, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (self->_exitReason == 2 && self->_terminationRequest)
  {
    objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBProcessExitReason(self->_exitReason);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSProcessTerminationRequest label](self->_terminationRequest, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (\"%@\")"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, 0);
    objc_msgSend(v3, "build");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RBSProcessExitContext description](self->_underlyingContext, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v8;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBProcessExitContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBProcessExitContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromFBProcessExitReason(self->_exitReason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("exitReason"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBProcessExitContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  FBProcessExitContext *v10;

  -[FBProcessExitContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__FBProcessExitContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E4A11FD0;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v8);
  v6 = v5;

  return v6;
}

id __62__FBProcessExitContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("underlying"), 1);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(uint64_t *)(v3 + 64) >= 1)
  {
    v4 = *(void **)(a1 + 32);
    FBSApplicationTerminationReasonDescription();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("terminationReason"));

    v3 = *(_QWORD *)(a1 + 40);
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 24), "descriptionWithMultilinePrefix:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:skipIfNil:", v8, CFSTR("launchError"), 1);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "descriptionWithMultilinePrefix:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:skipIfNil:", v11, CFSTR("launchError"), 1);

  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("stateAtExit"), 1);
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("terminationRequest"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("watchdogContext"), 1);
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (RBSProcessExitContext)underlyingContext
{
  return self->_underlyingContext;
}

- (NSError)launchError
{
  return self->_launchError;
}

- (NSError)terminationError
{
  return self->_terminationError;
}

- (FBSProcessTerminationRequest)terminationRequest
{
  return self->_terminationRequest;
}

- (void)setTerminationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_terminationRequest, a3);
}

- (FBProcessWatchdogEventContext)watchdogContext
{
  return self->_watchdogContext;
}

- (void)setWatchdogContext:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogContext, a3);
}

- (FBProcessState)stateBeforeExiting
{
  return self->_stateBeforeExiting;
}

- (void)setStateBeforeExiting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)terminationReason
{
  return self->_terminationReason;
}

- (void)setTerminationReason:(int64_t)a3
{
  self->_terminationReason = a3;
}

- (int64_t)exitStatus
{
  return 0;
}

- (BOOL)exitedNormally
{
  return self->_exitReason == 1;
}

- (int)exitCode
{
  return !-[FBProcessExitContext exitedNormally](self, "exitedNormally");
}

- (int)terminationSignal
{
  void *v2;
  int v3;

  if (self->_exitReason != 8)
    return 0;
  -[RBSProcessExitContext status](self->_underlyingContext, "status");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  return v3;
}

- (BOOL)consideredJetsam
{
  return self->_exitReason == 16;
}

- (BOOL)fairPlayFailure
{
  return self->_exitReason == 32;
}

+ (id)descriptionForExitReason:(unint64_t)a3
{
  return (id)NSStringFromFBProcessExitReason(a3);
}

- (void)initWithLaunchError:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTerminationError:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
