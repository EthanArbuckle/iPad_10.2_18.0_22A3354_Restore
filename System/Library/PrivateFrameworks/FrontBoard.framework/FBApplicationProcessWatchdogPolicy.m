@implementation FBApplicationProcessWatchdogPolicy

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  double *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  NSObject *queue;
  NSDictionary *watchdogPolicyExceptions;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  _BYTE v43[24];
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  _QWORD block[5];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "event");
  if ((objc_msgSend(v6, "isApplicationProcess") & 1) == 0 && v8 == 1)
  {
    objc_msgSend(v6, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "forSceneActivation");

    if (!v10)
    {
      v16 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v6, "applicationInfo");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v51 = (double *)&v50;
    v52 = 0x2020000000;
    v53 = 0xBFF0000000000000;
    goto LABEL_8;
  }
  objc_msgSend(v6, "applicationInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0xBFF0000000000000;
  if ((unint64_t)(v8 - 2) < 2)
  {
    objc_msgSend(v7, "sceneSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "isForeground");
    objc_msgSend(v7, "sceneUpdateContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "settingsDiff");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsProperty:", sel_isForeground);

    if ((v17 | v20) == 1)
    {
      v21 = v51;
      v22 = 0x4024000000000000;
    }
    else
    {
      objc_msgSend(v7, "sceneTransitionContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "allowCPUThrottling");

      v21 = v51;
      if (v27)
        v22 = 0x404E000000000000;
      else
        v22 = 0x403E000000000000;
    }
    *((_QWORD *)v21 + 3) = v22;
    v12 = -1.0;
    if (v17)
    {
      queue = self->_queue;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke_2;
      v44[3] = &unk_1E4A12D10;
      v46 = &v50;
      v44[4] = self;
      v11 = v11;
      v45 = v11;
      dispatch_sync(queue, v44);

    }
    goto LABEL_26;
  }
  if (v8 == 4)
  {
    objc_msgSend(v7, "sceneTransitionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_uiApplicationSceneTransitionContextShim");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23 && (objc_msgSend(v23, "waitForBackgroundTaskCompletion") & 1) != 0)
      v25 = 60.0;
    else
      v25 = 5.0;
    v51[3] = v25;

    v12 = -1.0;
LABEL_26:

    goto LABEL_27;
  }
  v12 = -1.0;
  if (v8 == 1)
  {
LABEL_8:
    objc_msgSend(v6, "executionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "launchIntent");
    v12 = -1.0;
    if ((unint64_t)(v14 - 3) >= 3)
    {
      if (v14 == 2)
      {
        v51[3] = 30.0;
        v12 = 10.0;
      }
    }
    else
    {
      v51[3] = 20.0;
      if ((unint64_t)(v14 - 3) <= 1)
      {
        v15 = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke;
        block[3] = &unk_1E4A12D10;
        v49 = &v50;
        block[4] = self;
        v11 = v11;
        v48 = v11;
        dispatch_sync(v15, block);

      }
    }
    goto LABEL_26;
  }
LABEL_27:
  watchdogPolicyExceptions = self->_watchdogPolicyExceptions;
  objc_msgSend(v6, "bundleIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](watchdogPolicyExceptions, "objectForKey:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "doubleValue");
    v51[3] = v32 + v51[3];
  }
  if (v51[3] <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    v33 = (void *)MEMORY[0x1E0D23190];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    objc_msgSend(v33, "provisionWithAllowance:", v43);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v12 <= 0.0)
    {
      v40 = (void *)MEMORY[0x1E0D231A0];
      v54 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "policyWithProvisions:", v37);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0D23190];
      FBSProcessResourceAllowanceMakeWithScheduledTimeInterval();
      objc_msgSend(v36, "provisionWithAllowance:", &v42);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0D231A0];
      v55[0] = v35;
      v55[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "policyWithProvisions:", v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  _Block_object_dispose(&v50, 8);
LABEL_36:

  return v16;
}

double __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_watchdogScalingFactorForAppInfo:isResume:", *(_QWORD *)(a1 + 40), 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v3 * *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  return result;
}

- (double)_queue_watchdogScalingFactorForAppInfo:(id)a3 isResume:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "type");
    if (objc_msgSend(v7, "type") == 2 && !self->_enableThirdPartyPre9)
    {
      v10 = 1.0;
      if (!objc_msgSend(v7, "builtOnOrAfterSDKVersion:", CFSTR("10.0")) || !v8)
        goto LABEL_13;
    }
    else if (!v8)
    {
      v10 = 1.0;
      goto LABEL_13;
    }
    v9 = 8;
    if (v4)
      v9 = 16;
    v10 = *(double *)((char *)&self->super.isa + v9);
    if (objc_msgSend(v7, "type") == 1)
      v10 = v10 * self->_additionalFirstPartyScale;
  }
  else
  {
    v11 = 8;
    if (v4)
      v11 = 16;
    v10 = *(double *)((char *)&self->super.isa + v11);
  }
LABEL_13:

  return v10;
}

double __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_watchdogScalingFactorForAppInfo:isResume:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v3 * *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  return result;
}

- (FBApplicationProcessWatchdogPolicy)init
{
  char *v2;
  FBApplicationProcessWatchdogPolicy *v3;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  NSObject *v11;
  uint64_t v12;
  int *v13;
  NSObject *v14;
  _QWORD handler[4];
  id v17;
  id location;
  _QWORD block[4];
  int *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)FBApplicationProcessWatchdogPolicy;
  v2 = -[FBApplicationProcessWatchdogPolicy init](&v21, sel_init);
  v3 = (FBApplicationProcessWatchdogPolicy *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((_QWORD *)v2 + 3) = 0x3FF0000000000000;
    v2[32] = 0;
    Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    v11 = v3->_queue;
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__FBApplicationProcessWatchdogPolicy_init__block_invoke;
    block[3] = &unk_1E4A12348;
    v13 = v3;
    v20 = v13;
    dispatch_async(v11, block);
    objc_initWeak(&location, v13);
    v14 = v3->_queue;
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = __42__FBApplicationProcessWatchdogPolicy_init__block_invoke_2;
    handler[3] = &unk_1E4A136A8;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.da.tasking_changed", v13 + 9, v14, handler);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v3;
}

uint64_t __42__FBApplicationProcessWatchdogPolicy_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadDefaultSettings");
}

void __42__FBApplicationProcessWatchdogPolicy_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadDefaultSettings");

}

- (void)dealloc
{
  int daNotificationToken;
  NSObject *queue;
  objc_super v5;
  _QWORD block[4];
  int v7;

  daNotificationToken = self->_daNotificationToken;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FBApplicationProcessWatchdogPolicy_dealloc__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v7 = daNotificationToken;
  dispatch_sync(queue, block);
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationProcessWatchdogPolicy;
  -[FBApplicationProcessWatchdogPolicy dealloc](&v5, sel_dealloc);
}

uint64_t __45__FBApplicationProcessWatchdogPolicy_dealloc__block_invoke(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 32));
}

+ (id)defaultPolicy
{
  if (defaultPolicy_onceToken != -1)
    dispatch_once(&defaultPolicy_onceToken, &__block_literal_global_16);
  return (id)defaultPolicy___DefaultPolicy;
}

void __51__FBApplicationProcessWatchdogPolicy_defaultPolicy__block_invoke()
{
  FBApplicationProcessWatchdogPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(FBApplicationProcessWatchdogPolicy);
  v1 = (void *)defaultPolicy___DefaultPolicy;
  defaultPolicy___DefaultPolicy = (uint64_t)v0;

}

+ (double)_scaleForGestaltKey:(__CFString *)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 1.0;
  if (BSSystemHasCapability())
  {
    v4 = (void *)MGCopyAnswer();
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      v3 = v5;
    }
    fbs_release();
  }
  return v3;
}

+ (double)_defaultLaunchScale
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double result;

  if (MEMORY[0x1A85907B4]("+[FBApplicationProcessWatchdogPolicy _defaultLaunchScale]", a2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleForKey:", CFSTR("FBLaunchWatchdogScaleOverride"));
    v5 = v4;

    if (v5 > 0.0)
      return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("FBLaunchWatchdogScale"));
  v5 = v7;

  if (v5 > 0.0)
    return v5;
  objc_msgSend(a1, "_scaleForGestaltKey:", CFSTR("emXA9B552rnSoI7xXE91DA"));
  return result;
}

+ (double)_defaultResumeScale
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double result;

  if (MEMORY[0x1A85907B4]("+[FBApplicationProcessWatchdogPolicy _defaultResumeScale]", a2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleForKey:", CFSTR("FBLaunchWatchdogResumeScaleOverride"));
    v5 = v4;

    if (v5 > 0.0)
      return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("FBLaunchWatchdogResumeScale"));
  v5 = v7;

  if (v5 > 0.0)
    return v5;
  objc_msgSend(a1, "_scaleForGestaltKey:", CFSTR("QbQzuIbef01P4JeoL9EmKg"));
  return result;
}

+ (double)_defaultFirstPartyAdditionalScale
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double result;

  if (MEMORY[0x1A85907B4]("+[FBApplicationProcessWatchdogPolicy _defaultFirstPartyAdditionalScale]", a2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleForKey:", CFSTR("FBLaunchWatchdogFirstPartyScaleOverride"));
    v5 = v4;

    if (v5 > 0.0)
      return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("FBLaunchWatchdogFirstPartyScale"));
  v5 = v7;

  if (v5 > 0.0)
    return v5;
  objc_msgSend(a1, "_scaleForGestaltKey:", CFSTR("NUYAz1eq3Flzt7ZQxXC/ng"));
  return result;
}

- (void)_queue_reloadDefaultSettings
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *watchdogPolicyExceptions;
  id v10;

  objc_msgSend((id)objc_opt_class(), "_defaultLaunchScale");
  self->_deviceLaunchScale = v3;
  objc_msgSend((id)objc_opt_class(), "_defaultResumeScale");
  self->_deviceResumeScale = v4;
  objc_msgSend((id)objc_opt_class(), "_defaultFirstPartyAdditionalScale");
  self->_additionalFirstPartyScale = v5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_enableThirdPartyPre9 = objc_msgSend(v6, "BOOLForKey:", CFSTR("FBLaunchWatchdogEnableThirdPartyPre9"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryForKey:", CFSTR("FBLaunchWatchdogExceptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSDictionary *)objc_msgSend(v7, "copy");
  watchdogPolicyExceptions = self->_watchdogPolicyExceptions;
  self->_watchdogPolicyExceptions = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_watchdogPolicyExceptions, 0);
}

@end
