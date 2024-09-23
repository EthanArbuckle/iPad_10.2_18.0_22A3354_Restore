@implementation FBSSceneTransitionContextCore

+ (id)protocol
{
  return &unk_1EE3B0420;
}

- (BKSAnimationFenceHandle)animationFence
{
  return (BKSAnimationFenceHandle *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (void)setUpdateContext:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setAnimationFence:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setAnimationSettings:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (BSAnimationSettings)animationSettings
{
  return (BSAnimationSettings *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (FBWatchdogTransitionContext)watchdogTransitionContext
{
  return (FBWatchdogTransitionContext *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, NSClassFromString(CFSTR("FBWatchdogTransitionContext")));
}

- (void)setOriginatingProcess:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (BOOL)isRunningBoardAssertionDisabled
{
  void *v2;
  char v3;

  -[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (FBSceneUpdateContext)updateContext
{
  return (FBSceneUpdateContext *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, NSClassFromString(CFSTR("FBSceneUpdateContext")));
}

- (BOOL)allowCPUThrottling
{
  void *v2;
  char v3;

  -[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BSProcessHandle)originatingProcess
{
  return (BSProcessHandle *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (FBProcessExecutionContext)executionContext
{
  return (FBProcessExecutionContext *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, NSClassFromString(CFSTR("FBProcessExecutionContext")));
}

- (RBSProcessHandle)clientProcessHandle
{
  return (RBSProcessHandle *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (void)setClientProcessHandle:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setExecutionContext:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setWatchdogTransitionContext:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setAllowCPUThrottling:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (void)setRunningBoardAssertionDisabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = *MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", v3, a2);
}

- (NSError)error
{
  return (NSError *)-[FBSSceneTransitionContextCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (void)setError:(id)a3
{
  -[FBSSceneTransitionContextCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

@end
