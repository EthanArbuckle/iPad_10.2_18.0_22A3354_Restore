@implementation BLSHIndividualSystemActivityAssertion

- (BLSHIndividualSystemActivityAssertion)initWithWithIdentifier:(id)a3 aggregator:(id)a4
{
  id v7;
  id v8;
  BLSHIndividualSystemActivityAssertion *v9;
  BLSHIndividualSystemActivityAssertion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHIndividualSystemActivityAssertion;
  v9 = -[BLSHIndividualSystemActivityAssertion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_lock_aggregator, a4);
  }

  return v10;
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

- (BOOL)isActive
{
  BLSHIndividualSystemActivityAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BLSHIndividualSystemActivityAssertionAggregator isActive](v2->_lock_aggregator, "isActive");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  id v6;
  BLSHIndividualSystemActivityAssertionAggregator *v7;
  void *v8;
  id v9;

  v6 = a4;
  if (a3 == 0.0)
  {
    v9 = v6;
    os_unfair_lock_lock(&self->_lock);
    v7 = self->_lock_aggregator;
    os_unfair_lock_unlock(&self->_lock);
    -[BLSHIndividualSystemActivityAssertionAggregator acquireIndividualAssertion:handler:](v7, "acquireIndividualAssertion:handler:", self, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("timeout must be 0 to use BLSHAggregatedSystemActivityAssertionFactory timeout:%lf"), *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHIndividualSystemActivityAssertion acquireWithTimeout:handler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BLSHIndividualSystemActivityAssertionAggregator *lock_aggregator;
  BLSHIndividualSystemActivityAssertionAggregator *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_aggregator = self->_lock_aggregator;
  self->_lock_aggregator = 0;
  v5 = lock_aggregator;

  os_unfair_lock_unlock(p_lock);
  -[BLSHIndividualSystemActivityAssertionAggregator invalidateIndividualAssertion:](v5, "invalidateIndividualAssertion:", self);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock_aggregator, 0);
}

- (void)acquireWithTimeout:handler:.cold.1()
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

@end
