@implementation BLSHPendingTwoPhaseUpdateDisplayMode

- (BOOL)isFullyCompleted
{
  void *v3;
  void *v4;
  char v5;

  -[BLSHPendingTwoPhaseUpdateDisplayMode first](self, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCompleted"))
  {
    -[BLSHPendingTwoPhaseUpdateDisplayMode last](self, "last");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCompleted");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_inProgressOperation:(NSObject *)a1
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  objc_super v7;
  objc_super v8;

  if (!a1)
    return 0;
  if (a2)
  {
    -[NSObject first](a1, "first");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3 == a1)
    {
      -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperationFromSelfFirst:](a1, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = a1;
      v8.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
      -[NSObject inProgressOperation](&v8, sel_inProgressOperation);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:].cold.1();

    }
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
    -[NSObject inProgressOperation](&v7, sel_inProgressOperation);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    bls_backlight_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:].cold.2();
  }

  return v4;
}

- (id)_inProgressOperationFromSelfFirst:(id)a1
{
  id v2;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v2 = a1;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
    objc_msgSendSuper2(&v13, sel_inProgressOperation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      bls_backlight_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        v15 = a2;
        v16 = 2048;
        v17 = v5;
        v18 = 2114;
        v19 = v2;
        _os_log_debug_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEBUG, "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from super self:%{public}@", buf, 0x1Cu);
      }

      v2 = v5;
      goto LABEL_16;
    }
    objc_msgSend(v2, "last");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      bls_backlight_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperationFromSelfFirst:].cold.1(a2, (uint64_t)v2, v11);

      v2 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:](v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        v15 = a2;
        v16 = 2048;
        v17 = v8;
        v18 = 2114;
        v19 = v2;
        v10 = "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from [last _inProgressOperation:NO] self:%{public}@";
LABEL_19:
        _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 0x1Cu);
      }
    }
    else
    {
      objc_msgSend(v7, "inProgressOperation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        v15 = a2;
        v16 = 2048;
        v17 = v8;
        v18 = 2114;
        v19 = v2;
        v10 = "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from last self:%{public}@";
        goto LABEL_19;
      }
    }

    v2 = v8;
LABEL_15:

LABEL_16:
  }
  return v2;
}

- (id)inProgressOperation
{
  return -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:](&self->super.super, 1);
}

- (BOOL)isTwoPhaseUpdate
{
  return 1;
}

- (BOOL)isStarted
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
  if (!-[BLSHPendingUpdateDisplayMode isStarted](&v7, sel_isStarted))
    return 0;
  if (!-[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"))
    return 1;
  -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = v3;
  v5 = objc_msgSend(v3, "isStarted");

  return v5;
}

- (id)first
{
  void *v3;
  void *v4;
  id v5;

  -[BLSHPendingTwoPhaseUpdateDisplayMode previous](self, "previous");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (id)last
{
  void *v3;
  void *v4;
  id v5;

  -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (id)rampOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BLSHPendingTwoPhaseUpdateDisplayMode previous](self, "previous");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)description
{
  void *v3;
  id WeakRetained;
  _BOOL8 v5;
  const __CFString *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  v5 = -[BLSHPendingTwoPhaseUpdateDisplayMode isStarted](self, "isStarted");
  if (WeakRetained)
    v6 = CFSTR("started");
  else
    v6 = CFSTR("bothStarted");
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", v5, v6);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), CFSTR("completed"));
  NSStringFromBLSBacklightDisplayMode(-[BLSHPendingUpdateDisplayMode targetDisplayMode](self, "targetDisplayMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("target"));

  v10 = (id)objc_msgSend(v3, "appendPointer:withName:", WeakRetained, CFSTR("previous"));
  -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("next"));

  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BLSHPendingTwoPhaseUpdateDisplayMode)previous
{
  return (BLSHPendingTwoPhaseUpdateDisplayMode *)objc_loadWeakRetained((id *)&self->_previous);
}

- (void)setPrevious:(id)a3
{
  objc_storeWeak((id *)&self->_previous, a3);
}

- (BLSHPendingTwoPhaseUpdateDisplayMode)next
{
  return (BLSHPendingTwoPhaseUpdateDisplayMode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_destroyWeak((id *)&self->_previous);
}

- (void)_inProgressOperation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_2145AC000, v0, v1, "_inProgressOperation: checkFirst:%{BOOL}u first!=self returning %p from super self:%{public}@", 0x104000302);
  OUTLINED_FUNCTION_2_2();
}

- (void)_inProgressOperation:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_2145AC000, v0, v1, "_inProgressOperation: checkFirst:%{BOOL}u returning %p from super self:%{public}@", 67109634);
  OUTLINED_FUNCTION_2_2();
}

- (void)_inProgressOperationFromSelfFirst:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;

  LODWORD(v3) = 67109634;
  HIDWORD(v3) = a1 & 1;
  LODWORD(v4) = 138543104;
  HIDWORD(v4) = a2;
  OUTLINED_FUNCTION_0_4(&dword_2145AC000, a2, a3, "_inProgressOperation: checkFirst:%{BOOL}u first==self last==nil returning %p from super self:%{public}@", v3, 2048, v4, HIDWORD(a2));
  OUTLINED_FUNCTION_2_2();
}

@end
