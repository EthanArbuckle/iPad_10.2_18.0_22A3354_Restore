@implementation BLSHPendingUpdateDisplayMode

+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4 withPendingOperation:(id)a5 isNullOperationAllowed:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BLSHPendingUpdateDisplayMode *v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  BLSHPendingDirectRampDisplayMode *v18;
  BLSHPendingDirectRampDisplayMode *v19;
  BLSHPendingTwoPhaseUpdateDisplayMode *p_super;
  BLSHPendingTwoPhaseUpdateDisplayMode *v21;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isFullyCompleted") & 1) == 0)
  {
    objc_msgSend(v10, "last");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "targetDisplayMode") == a4)
    {
      bls_backlight_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:isNullOperationAllowed:].cold.1((uint64_t)v10, v12);

      v13 = v10;
      goto LABEL_30;
    }

  }
  v14 = IsDisplayModeTransitionToAlwaysOn(a3, a4);
  v15 = IsDisplayModeTransitionToActiveOn(a3, a4);
  objc_msgSend(v10, "inProgressOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    bls_backlight_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightDisplayMode(a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightDisplayMode(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v11;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_debug_impl(&dword_2145AC000, v16, OS_LOG_TYPE_DEBUG, "TSM: pendingIsStartedButIncomplete: %{public}@ targetDisplayMode:%{public}@ currentDisplayMode:%{public}@", (uint8_t *)&v25, 0x20u);

    }
    v17 = objc_msgSend(v11, "currentDisplayMode");
    if (v14 && IsDisplayModeTransitionToAlwaysOn(v17, objc_msgSend(v11, "targetDisplayMode")))
    {
      a3 = v17;
    }
    else if (v15 && IsDisplayModeTransitionToActiveOn(v17, objc_msgSend(v11, "targetDisplayMode")))
    {
      a3 = v17;
    }
  }
  else if (a3 == a4 && a6)
  {
    v18 = 0;
    goto LABEL_34;
  }
  if (IsActiveOnBrightnessForBLSBacklightDisplayMode(a4)
    && IsAlwaysOnBrightnessForBLSBacklightDisplayMode(a3))
  {
    v19 = -[BLSHPendingDirectRampDisplayMode initWithRampBeginDisplayMode:targetDisplayMode:]([BLSHPendingDirectRampDisplayMode alloc], "initWithRampBeginDisplayMode:targetDisplayMode:", 3, 4);
    p_super = &v19->super;
    if (a3 == 3)
    {
      v18 = v19;
LABEL_33:

      goto LABEL_34;
    }
    v21 = -[BLSHPendingUpdateDisplayMode initWithCurrentDisplayMode:targetDisplayMode:]([BLSHPendingTwoPhaseUpdateDisplayMode alloc], "initWithCurrentDisplayMode:targetDisplayMode:", a3, 3);
    v18 = (BLSHPendingDirectRampDisplayMode *)v21;
LABEL_32:
    -[BLSHPendingTwoPhaseUpdateDisplayMode setNext:](v21, "setNext:", p_super);
    -[BLSHPendingTwoPhaseUpdateDisplayMode setPrevious:](p_super, "setPrevious:", v18);
    goto LABEL_33;
  }
  if (!IsActiveOnBrightnessForBLSBacklightDisplayMode(a3)
    || !IsAlwaysOnBrightnessForBLSBacklightDisplayMode(a4))
  {
    v13 = -[BLSHPendingUpdateDisplayMode initWithCurrentDisplayMode:targetDisplayMode:]([BLSHPendingUpdateDisplayMode alloc], "initWithCurrentDisplayMode:targetDisplayMode:", a3, a4);
LABEL_30:
    v18 = (BLSHPendingDirectRampDisplayMode *)v13;
    goto LABEL_34;
  }
  v18 = -[BLSHPendingDirectRampDisplayMode initWithRampBeginDisplayMode:targetDisplayMode:]([BLSHPendingDirectRampDisplayMode alloc], "initWithRampBeginDisplayMode:targetDisplayMode:", 4, 3);
  if (a4 != 3)
  {
    p_super = -[BLSHPendingUpdateDisplayMode initWithCurrentDisplayMode:targetDisplayMode:]([BLSHPendingTwoPhaseUpdateDisplayMode alloc], "initWithCurrentDisplayMode:targetDisplayMode:", 3, a4);
    v21 = &v18->super;
    goto LABEL_32;
  }
LABEL_34:

  return v18;
}

+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4
{
  return +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:isNullOperationAllowed:](BLSHPendingUpdateDisplayMode, "operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:isNullOperationAllowed:", a3, a4, 0, 0);
}

- (BLSHPendingUpdateDisplayMode)initWithCurrentDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4
{
  BLSHPendingUpdateDisplayMode *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSHPendingUpdateDisplayMode;
  result = -[BLSHPendingUpdateDisplayMode init](&v7, sel_init);
  if (result)
  {
    result->_currentDisplayMode = a3;
    result->_targetDisplayMode = a4;
  }
  return result;
}

- (BLSHPendingUpdateDisplayMode)inProgressOperation
{
  BLSHPendingUpdateDisplayMode *v3;

  if (-[BLSHPendingUpdateDisplayMode isStarted](self, "isStarted")
    && !-[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"))
  {
    v3 = self;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isStartedButIncomplete
{
  void *v2;
  BOOL v3;

  -[BLSHPendingUpdateDisplayMode inProgressOperation](self, "inProgressOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isTwoPhaseUpdate
{
  return 0;
}

- (BOOL)isDirectRamp
{
  return 0;
}

- (BLSHPendingDirectRampDisplayMode)rampOperation
{
  return 0;
}

- (int64_t)type
{
  return 4;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isStarted](self, "isStarted"), CFSTR("started"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), CFSTR("completed"));
  NSStringFromBLSBacklightDisplayMode(self->_targetDisplayMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("target"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (int64_t)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (int64_t)targetDisplayMode
{
  return self->_targetDisplayMode;
}

+ (void)operationForUpdateFromCurrentDisplayMode:(uint64_t)a1 toTargetDisplayMode:(NSObject *)a2 withPendingOperation:isNullOperationAllowed:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "TSM: using existing pending:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
