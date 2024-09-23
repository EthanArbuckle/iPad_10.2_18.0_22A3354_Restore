@implementation BLSHPendingUpdatePresentation

- (BLSHPendingUpdatePresentation)initWithPresentation:(id)a3
{
  id v6;
  BLSHPendingUpdatePresentation *v7;
  BLSHPendingUpdatePresentation *v8;
  BLSHPendingUpdatePresentation *result;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHPendingUpdatePresentation;
  v7 = -[BLSHPendingUpdatePresentation init](&v11, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  if (v6)
  {
    objc_storeStrong((id *)&v7->_presentation, a3);
LABEL_4:

    return v8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("created BLSHPendingUpdatePresentation with nil presentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHPendingUpdatePresentation initWithPresentation:].cold.1(a2, (uint64_t)v8, (uint64_t)v10);
  objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  result = (BLSHPendingUpdatePresentation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (int64_t)type
{
  return 2;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdatePresentation isStarted](self, "isStarted"), CFSTR("started"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdatePresentation isCompleted](self, "isCompleted"), CFSTR("completed"));
  -[BLSHPendingUpdatePresentation targetBacklightState](self, "targetBacklightState");
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("target"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_presentation, CFSTR("presentation"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
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

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return (BLSHBacklightEnvironmentPresentation *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)targetBacklightState
{
  return self->_targetBacklightState;
}

- (void)setTargetBacklightState:(int64_t)a3
{
  self->_targetBacklightState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
}

- (void)initWithPresentation:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHPendingUpdatePresentation.m");
  v16 = 1024;
  v17 = 19;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
