@implementation ACNotifyWriter

- (void)write:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  NSObject *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  ACNotifyWriter *v10;
  unint64_t v11;

  if (self->notifierToken == -1)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACNotifyWriter write:].cold.1(self, v6);

  }
  else
  {
    p_lock = &self->lock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v8 = __24__ACNotifyWriter_write___block_invoke;
    v9 = &unk_1E4894AA8;
    v10 = self;
    v11 = a3;
    v5 = v7;
    os_unfair_lock_lock(p_lock);
    v8((uint64_t)v5);
    os_unfair_lock_unlock(p_lock);

  }
}

void __24__ACNotifyWriter_write___block_invoke(uint64_t a1)
{
  id *v2;
  uint32_t v3;
  uint32_t v4;
  NSObject *v5;
  void *v6;
  uint32_t v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint32_t v13;
  int check;
  uint8_t buf[4];
  _BYTE v16[14];
  __int16 v17;
  uint32_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  check = 0;
  v2 = (id *)(a1 + 32);
  v3 = notify_check(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &check);
  if (v3)
  {
    v4 = v3;
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v16 = v6;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v4;
      _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"Failed to check for %@ number change: notify_check failed: %u\", buf, 0x12u);

    }
  }
  v7 = notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
  if (v7)
  {
    v8 = v7;
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v16 = v11;
      *(_WORD *)&v16[4] = 2048;
      *(_QWORD *)&v16[6] = v10;
      v17 = 1024;
      v18 = v8;
      _os_log_error_impl(&dword_1A2BCD000, v9, OS_LOG_TYPE_ERROR, "\"notify_set_state(%d, %llu) failed: %d\", buf, 0x18u);
    }
  }
  else
  {
    objc_msgSend(*v2, "key");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = notify_post((const char *)objc_msgSend(v12, "UTF8String"));

    if (!v13)
      return;
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __24__ACNotifyWriter_write___block_invoke_cold_1(v2, v13, v9);
  }

}

- (NSString)key
{
  return self->_key;
}

- (ACNotifyWriter)initWithKey:(id)a3
{
  id v4;
  ACNotifyWriter *v5;
  ACNotifyWriter *v6;
  id v7;
  uint32_t v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACNotifyWriter;
  v5 = -[ACNotifyWriter init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ACNotifyWriter setKey:](v5, "setKey:", v4);
    v6->notifierToken = -1;
    -[ACNotifyWriter key](v6, "key");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = notify_register_check((const char *)objc_msgSend(v7, "UTF8String"), &v6->notifierToken);

    if (v8)
    {
      _ACLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ACNotifyReader initWithKey:updateQueue:updateBlock:].cold.1();

    }
  }

  return v6;
}

- (void)dealloc
{
  int notifierToken;
  objc_super v4;

  notifierToken = self->notifierToken;
  if (notifierToken != -1)
    notify_cancel(notifierToken);
  v4.receiver = self;
  v4.super_class = (Class)ACNotifyWriter;
  -[ACNotifyWriter dealloc](&v4, sel_dealloc);
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)write:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to get %@ number: libnotify registration failed\", (uint8_t *)&v4, 0xCu);

}

void __24__ACNotifyWriter_write___block_invoke_cold_1(id *a1, int a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  v8 = a2;
  OUTLINED_FUNCTION_0_3(&dword_1A2BCD000, a3, v6, "\"notify_post(%{public}@) failed: %d\", v7);

}

@end
