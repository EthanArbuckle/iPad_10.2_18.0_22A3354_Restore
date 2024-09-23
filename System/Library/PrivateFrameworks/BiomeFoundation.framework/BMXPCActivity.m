@implementation BMXPCActivity

- (BMXPCActivity)initWithActivity:(id)a3
{
  return -[BMXPCActivity initWithActivity:activityName:](self, "initWithActivity:activityName:", a3, 0);
}

- (BMXPCActivity)initWithActivity:(id)a3 activityName:(id)a4
{
  id v7;
  id v8;
  BMXPCActivity *v9;
  BMXPCActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMXPCActivity;
  v9 = -[BMXPCActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeStrong((id *)&v10->_activityName, a4);
  }

  return v10;
}

- (BOOL)shouldDefer
{
  return xpc_activity_should_defer(self->_activity);
}

- (BOOL)didDefer
{
  NSObject *v3;
  BOOL v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSString *activityName;
  int v11;
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[BMXPCActivity _state](self, "_state") == 3)
  {
    __biome_log_for_category(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[BMXPCActivity didDefer].cold.1();
LABEL_4:
    v4 = 1;
    goto LABEL_12;
  }
  if (-[BMXPCActivity shouldDefer](self, "shouldDefer"))
  {
    v5 = -[BMXPCActivity _setDefer](self, "_setDefer");
    __biome_log_for_category(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        activityName = self->_activityName;
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = activityName;
        _os_log_impl(&dword_1AEB31000, v3, OS_LOG_TYPE_DEFAULT, "%@ successfully deferred activity with name: %@, didDefer returning YES", (uint8_t *)&v11, 0x16u);

      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[BMXPCActivity didDefer].cold.2((uint64_t)self, v3);
    }
    goto LABEL_4;
  }
  __biome_log_for_category(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[BMXPCActivity didDefer].cold.3();
  v4 = 0;
LABEL_12:

  return v4;
}

- (BOOL)setContinue
{
  return xpc_activity_set_state(self->_activity, 4);
}

- (BOOL)setDone
{
  return xpc_activity_set_state(self->_activity, 5);
}

- (BOOL)_setDefer
{
  return xpc_activity_set_state(self->_activity, 3);
}

- (int64_t)_state
{
  return xpc_activity_get_state(self->_activity);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityName, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)didDefer
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_3(&dword_1AEB31000, v2, v3, "%@ with name: %@ has not been deferred, didDefer returning NO", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
