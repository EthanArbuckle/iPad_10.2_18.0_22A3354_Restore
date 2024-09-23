@implementation _DKSyncToggle

+ (_DKSyncToggle)toggleWithObject:(void *)a3 name:(uint64_t)a4 enableSelector:(uint64_t)a5 disableSelector:
{
  id v8;
  id v9;
  _DKSyncToggle *v10;

  v8 = a3;
  v9 = a2;
  objc_opt_self();
  v10 = -[_DKSyncToggle initWithObject:name:enableSelector:disableSelector:]([_DKSyncToggle alloc], "initWithObject:name:enableSelector:disableSelector:", v9, v8, a4, a5);

  return v10;
}

- (_DKSyncToggle)initWithObject:(id)a3 name:(id)a4 enableSelector:(SEL)a5 disableSelector:(SEL)a6
{
  id v10;
  id v11;
  _DKSyncToggle *v12;
  _DKSyncToggle *v13;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_DKSyncToggle;
  v12 = -[_DKSyncToggle init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_object, v10);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_enableSelector = a5;
    v13->_disableSelector = a6;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_enabled)
    -[_DKSyncToggle _setEnabled:](self, "_setEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncToggle;
  -[_DKSyncToggle dealloc](&v3, sel_dealloc);
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  id WeakRetained;

  if (self->_enabled != a3)
  {
    v3 = a3;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6)
        -[_DKSyncToggle _setEnabled:].cold.1();
      v7 = 32;
    }
    else
    {
      if (v6)
        -[_DKSyncToggle _setEnabled:].cold.2();
      v7 = 40;
    }

    -[_DKSyncToggle willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEnabled"));
    self->_enabled = v3;
    -[_DKSyncToggle didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEnabled"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_object);
    objc_msgSend(WeakRetained, "performSelector:", *(Class *)((char *)&self->super.isa + v7));

  }
}

- (uint64_t)setEnabled:(uint64_t)result
{
  void *v3;
  NSObject *v4;

  if (result)
  {
    v3 = (void *)result;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    return objc_msgSend(v3, "_setEnabled:", a2);
  }
  return result;
}

- (BOOL)isEnabled
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_object);
}

- (void)_setEnabled:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Enabling '%@' toggle", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_setEnabled:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Disabling '%@' toggle", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

@end
