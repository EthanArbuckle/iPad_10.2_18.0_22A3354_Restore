@implementation BLSHAggregatedProcessAssertion

- (BLSHAggregatedProcessAssertion)initWithExplanation:(id)a3 processIdentity:(id)a4 duration:(double)a5
{
  id v9;
  id v10;
  BLSHAggregatedProcessAssertion *v11;
  BLSHAggregatedProcessAssertion *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHAggregatedProcessAssertion;
  v11 = -[BLSHAggregatedProcessAssertion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processIdentity, a4);
    objc_storeStrong((id *)&v12->_explanation, a3);
    v12->_duration = a5;
  }

  return v12;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_explanation, CFSTR("explanation"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_processIdentity, CFSTR("processIdentity"));
  if (self->_duration != 1.79769313e308)
    v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 3);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)acquireWithCompletion:(id)a3
{
  +[BLSHAggregateProcessAssertion acquireAggregatedAssertion:completion:](BLSHAggregateProcessAssertion, "acquireAggregatedAssertion:completion:", self, a3);
}

- (void)invalidate
{
  +[BLSHAggregateProcessAssertion invalidateAggregatedAssertion:](BLSHAggregateProcessAssertion, "invalidateAggregatedAssertion:", self);
  self->_invalidated = 1;
}

- (id)createRBSAssertion
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  double duration;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  bls_scenes_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[BLSHAggregatedProcessAssertion createRBSAssertion].cold.1((uint64_t)self, v3, v4);

  objc_msgSend(MEMORY[0x24BE80D38], "targetWithProcessIdentity:", self->_processIdentity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  duration = self->_duration;
  if (duration == 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x24BE80BA8], "grant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B40], "grantUserInitiated", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x24BE80BE0], "grantWithBackgroundPriority");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE80B90], "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 1, 1, duration, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BE80BA8], "grant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x24BE80B40], "grantUserInitiated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v9;
    objc_msgSend(MEMORY[0x24BE80BE0], "grantWithBackgroundPriority");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80B10]), "initWithExplanation:target:attributes:", self->_explanation, v5, v11);

  return v12;
}

- (BOOL)shouldFaultOnFailureToAcquire
{
  return self->_shouldFaultOnFailureToAcquire;
}

- (void)setShouldFaultOnFailureToAcquire:(BOOL)a3
{
  self->_shouldFaultOnFailureToAcquire = a3;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_aggregate, 0);
}

- (void)createRBSAssertion
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218242;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a2, a3, "%p:createRBSAssertion, creating new RBS assertion for %{public}@", (uint8_t *)&v4);
}

@end
