@implementation ACNotifyReader

- (ACNotifyReader)initWithKey:(id)a3 updateQueue:(id)a4 updateBlock:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  ACNotifyReader *v11;
  ACNotifyReader *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  _QWORD handler[4];
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACNotifyReader;
  v11 = -[ACNotifyReader init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ACNotifyReader setCachedValue:](v11, "setCachedValue:", 0);
    v12->_notifierToken = -1;
    -[ACNotifyReader setKey:](v12, "setKey:", v8);
    v13 = objc_retainAutorelease(v8);
    if (notify_register_check((const char *)objc_msgSend(v13, "UTF8String"), &v12->_notifierToken))
    {
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ACNotifyReader initWithKey:updateQueue:updateBlock:].cold.1();

    }
    v12->_dispatchToken = -1;
    if (v9 && v10)
    {
      v15 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __54__ACNotifyReader_initWithKey_updateQueue_updateBlock___block_invoke;
      handler[3] = &unk_1E48942B0;
      v18 = v10;
      notify_register_dispatch(v15, &v12->_dispatchToken, v9, handler);

    }
  }

  return v12;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unint64_t)currentValue
{
  int notifierToken;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint32_t state;
  int v11;
  NSObject *v12;
  int check;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint32_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  notifierToken = self->_notifierToken;
  if (notifierToken != -1)
  {
    check = 0;
    v4 = notify_check(notifierToken, &check);
    if (v4)
    {
      v5 = v4;
      _ACLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[ACNotifyReader key](self, "key");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v7;
        v16 = 1024;
        v17 = v5;
        _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Failed to check for %@ change: notify_check failed: %u\", buf, 0x12u);

      }
    }
    else if (check != 1)
    {
      return self->_cachedValue;
    }
    state = notify_get_state(self->_notifierToken, &self->_cachedValue);
    if (state)
    {
      v11 = state;
      _ACLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ACNotifyReader currentValue].cold.2(self, v11, v12);

      self->_cachedValue = 0;
    }
    return self->_cachedValue;
  }
  _ACLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ACNotifyReader currentValue].cold.1(self, v8);

  return 0;
}

- (void)setCachedValue:(unint64_t)a3
{
  self->_cachedValue = a3;
}

uint64_t __54__ACNotifyReader_initWithKey_updateQueue_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  int notifierToken;
  int dispatchToken;
  objc_super v5;

  notifierToken = self->_notifierToken;
  if (notifierToken != -1)
    notify_cancel(notifierToken);
  dispatchToken = self->_dispatchToken;
  if (dispatchToken != -1)
    notify_cancel(dispatchToken);
  v5.receiver = self;
  v5.super_class = (Class)ACNotifyReader;
  -[ACNotifyReader dealloc](&v5, sel_dealloc);
}

- (unint64_t)cachedValue
{
  return self->_cachedValue;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithKey:updateQueue:updateBlock:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  v3 = v0;
  OUTLINED_FUNCTION_0_3(&dword_1A2BCD000, v1, (uint64_t)v1, "\"Failed to register for %@ notifications: notify_register_check failed: %u\", v2);
}

- (void)currentValue
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  v8 = a2;
  OUTLINED_FUNCTION_0_3(&dword_1A2BCD000, a3, v6, "\"Failed to get %@ number: notify_get_state failed: %u\", v7);

}

@end
