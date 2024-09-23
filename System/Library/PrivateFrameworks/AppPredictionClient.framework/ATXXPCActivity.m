@implementation ATXXPCActivity

- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXXPCActivity *v9;

  v6 = a4;
  v7 = a3;
  __atxlog_handle_default();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXXPCActivity initWithActivity:name:logHandle:](self, "initWithActivity:name:logHandle:", v7, v6, v8);

  return v9;
}

- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4 logHandle:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXXPCActivity *v12;
  ATXXPCActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXXPCActivity;
  v12 = -[ATXXPCActivity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activity, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_handle, a5);
  }

  return v13;
}

- (BOOL)didDefer
{
  _BOOL4 should_defer;
  _BOOL4 v4;
  NSObject *handle;
  NSString *name;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  should_defer = xpc_activity_should_defer(self->_activity);
  if (should_defer)
  {
    v4 = xpc_activity_set_state(self->_activity, 3);
    handle = self->_handle;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)self->_handle, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v8 = 138412290;
        v9 = name;
        _os_log_impl(&dword_1A49EF000, handle, OS_LOG_TYPE_DEFAULT, "Abandoning activity %@ since we were asked to defer", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_handle, OS_LOG_TYPE_ERROR))
    {
      -[ATXXPCActivity didDefer].cold.1((uint64_t)self, handle);
    }
  }
  return should_defer;
}

- (BOOL)shouldDefer
{
  return xpc_activity_should_defer(self->_activity);
}

- (BOOL)setContinue
{
  return xpc_activity_set_state(self->_activity, 4);
}

- (BOOL)setDone
{
  return xpc_activity_set_state(self->_activity, 5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)didDefer
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Abandoning activity %@, but failed to properly defer", (uint8_t *)&v3, 0xCu);
}

@end
