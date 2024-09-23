@implementation ULDarwinNotificationHelper

- (ULDarwinNotificationHelper)init
{
  ULDarwinNotificationHelper *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULDarwinNotificationHelper;
  v2 = -[ULDarwinNotificationHelper init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDarwinNotificationHelper setRegistrations:](v2, "setRegistrations:", v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.milod.ULDarwinNotificationHelper", v4);
    -[ULDarwinNotificationHelper setQueue:](v2, "setQueue:", v5);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ULDarwinNotificationHelper registrations](self, "registrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "notificationName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ULDarwinNotificationHelper removeObserverForNotificationName:](self, "removeObserverForNotificationName:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)ULDarwinNotificationHelper;
  -[ULDarwinNotificationHelper dealloc](&v10, sel_dealloc);
}

- (void)addObserverForNotificationName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ULDarwinNotificationHelper queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  -[ULDarwinNotificationHelper queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke;
  block[3] = &unk_2511EF040;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

void __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  ULDarwinNotificationRecord *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 is_valid_token;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id location;
  int out_token;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      _os_log_impl(&dword_241C0D000, v4, OS_LOG_TYPE_FAULT, "Registration already exists for notification name: %@, returning", buf, 0xCu);
    }
  }
  else
  {
    out_token = -1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke_29;
    v26 = &unk_2511EF018;
    objc_copyWeak(&v28, &location);
    v27 = *(id *)(a1 + 40);
    v8 = notify_register_dispatch(v6, &out_token, v7, &v23);

    if ((_DWORD)v8 || out_token == -1)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      v12 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8, v23, v24, v25, v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v20;
        v33 = 2112;
        v34 = v21;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_241C0D000, v12, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification: %@, status: %@, registration token: %@", buf, 0x20u);

      }
    }
    else
    {
      v9 = [ULDarwinNotificationRecord alloc];
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token, v23, v24, v25, v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ULDarwinNotificationRecord initWithNotificationName:registrationToken:handler:](v9, "initWithNotificationName:registrationToken:handler:", v10, v11, *(_QWORD *)(a1 + 48));

      if (v12)
      {
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
        v13 = (id)logObject_MicroLocation_Default;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject notificationName](v12, "notificationName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject registrationToken](v12, "registrationToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject registrationToken](v12, "registrationToken");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          is_valid_token = notify_is_valid_token(objc_msgSend(v16, "intValue"));
          v18 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v32 = v14;
          v33 = 2112;
          if (is_valid_token)
            v18 = CFSTR("YES");
          v34 = v15;
          v35 = 2112;
          v36 = v18;
          _os_log_impl(&dword_241C0D000, v13, OS_LOG_TYPE_DEFAULT, "Added registration for for notification name: %@, token: %@, valid: %@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "registrations");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

      }
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleDarwinNotificationCallback:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)removeObserverForNotificationName:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ULDarwinNotificationHelper queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULDarwinNotificationHelper queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ULDarwinNotificationHelper_removeObserverForNotificationName___block_invoke;
  block[3] = &unk_2511EF068;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __64__ULDarwinNotificationHelper_removeObserverForNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "registrationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    v6 = notify_cancel(v5);
    if ((_DWORD)v6)
    {
      v7 = v6;
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      v8 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        objc_msgSend(v3, "notificationName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_241C0D000, v9, OS_LOG_TYPE_ERROR, "Failed to cancel registration for darwin notification: %@, status: %@", (uint8_t *)&v17, 0x16u);

      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 40);
        v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_241C0D000, v14, OS_LOG_TYPE_DEFAULT, "removing registration for for notification name: %@", (uint8_t *)&v17, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "registrations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    v12 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_241C0D000, v12, OS_LOG_TYPE_ERROR, "Registration doesn't exist for notification: %@, returning", (uint8_t *)&v17, 0xCu);
    }
  }

}

- (unint64_t)stateForNotificationName:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  unint64_t v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[ULDarwinNotificationHelper queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ULDarwinNotificationHelper queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ULDarwinNotificationHelper_stateForNotificationName___block_invoke;
  block[3] = &unk_2511EF090;
  block[4] = self;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __55__ULDarwinNotificationHelper_stateForNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "registrations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registrationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (notify_get_state(v7, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      v8 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_241C0D000, v8, OS_LOG_TYPE_ERROR, "Could not get state for: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_handleDarwinNotificationCallback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULDarwinNotificationHelper queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_241C0D000, v6, OS_LOG_TYPE_DEBUG, "Darwin notification received: %@", (uint8_t *)&v12, 0xCu);
  }
  -[ULDarwinNotificationHelper registrations](self, "registrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "handler");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t))(v9 + 16))(v9);

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_241C0D000, v11, OS_LOG_TYPE_ERROR, "Failed call darwin notification handler, record nil", (uint8_t *)&v12, 2u);
    }
  }

}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end
