@implementation BLSHDefaultHandler

+ (id)handlerForKey:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:attributes:", v7, v6);

  return v8;
}

- (BLSHDefaultHandler)initWithKey:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  BLSHDefaultHandler *v9;
  BLSHDefaultHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHDefaultHandler;
  v9 = -[BLSHDefaultHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (void)dealloc
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_key, CFSTR("key"));
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BLSAssertion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  v4 = self->_lock_assertion;
  os_unfair_lock_unlock(p_lock);
  -[BLSAssertion invalidate](v4, "invalidate");

}

- (void)updateForNewValue:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 invalidated;
  BLSAssertion *lock_assertion;
  id v8;
  void *v9;
  BLSAssertion *v10;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  invalidated = self->_invalidated;
  os_unfair_lock_unlock(p_lock);
  if (!invalidated)
  {
    os_unfair_lock_lock(p_lock);
    lock_assertion = self->_lock_assertion;
    if (v3)
    {
      if (lock_assertion)
      {
        v10 = 0;
      }
      else
      {
        v8 = objc_alloc(MEMORY[0x24BE0B838]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ default set"), self->_key);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (BLSAssertion *)objc_msgSend(v8, "initWithExplanation:attributes:", v9, self->_attributes);
        objc_storeStrong((id *)&self->_lock_assertion, v10);

      }
      os_unfair_lock_unlock(p_lock);
      -[BLSAssertion acquireWithObserver:](v10, "acquireWithObserver:", 0);
    }
    else
    {
      self->_lock_assertion = 0;
      v10 = lock_assertion;

      os_unfair_lock_unlock(p_lock);
      -[BLSAssertion invalidate](v10, "invalidate");
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_assertion, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
