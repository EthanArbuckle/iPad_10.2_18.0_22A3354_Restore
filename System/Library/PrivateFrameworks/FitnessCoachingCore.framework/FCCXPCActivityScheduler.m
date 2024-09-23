@implementation FCCXPCActivityScheduler

- (FCCXPCActivityScheduler)init
{
  FCCDateProvider *v3;
  FCCXPCActivityScheduler *v4;

  v3 = objc_alloc_init(FCCDateProvider);
  v4 = -[FCCXPCActivityScheduler initWithDateProvider:dispatchQueue:](self, "initWithDateProvider:dispatchQueue:", v3, MEMORY[0x1E0C80D38]);

  return v4;
}

- (FCCXPCActivityScheduler)initWithDateProvider:(id)a3 dispatchQueue:(id)a4
{
  id v7;
  id v8;
  FCCXPCActivityScheduler *v9;
  FCCXPCActivityScheduler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCXPCActivityScheduler;
  v9 = -[FCCXPCActivityScheduler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateProvider, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
  }

  return v10;
}

- (void)scheduleActivityWithName:(id)a3 scheduledDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD handler[4];
  id v14;
  FCCXPCActivityScheduler *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __66__FCCXPCActivityScheduler_scheduleActivityWithName_scheduledDate___block_invoke;
  handler[3] = &unk_1E62101E0;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v8;
  xpc_activity_register(v9, v10, handler);

}

void __66__FCCXPCActivityScheduler_scheduleActivityWithName_scheduledDate___block_invoke(_QWORD *a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v6 = (void *)a1[5];
    v8 = v5;
    objc_msgSend(v6, "_stringForXPCActivityState:", state);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B0C58000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity %@ fired with state: %@", (uint8_t *)&v12, 0x16u);

  }
  v11 = a1[4];
  v10 = (void *)a1[5];
  if (state)
    objc_msgSend(v10, "_runActivity:name:", v3, v11);
  else
    objc_msgSend(v10, "_checkInActivity:name:scheduledDate:", v3, v11, a1[6]);

}

- (void)cancelActivityWithName:(id)a3
{
  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)_checkInActivity:(id)a3 name:(id)a4 scheduledDate:(id)a5
{
  _xpc_activity_s *v8;
  id v9;
  FCCDateProvider *dateProvider;
  id v11;
  void *v12;
  double v13;
  double v14;
  xpc_object_t v15;
  xpc_object_t v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (_xpc_activity_s *)a3;
  v9 = a4;
  dateProvider = self->_dateProvider;
  v11 = a5;
  -[FCCDateProvider coachingDate](dateProvider, "coachingDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C808A8], 1);
  xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v14 & ~((uint64_t)v14 >> 63));
  xpc_dictionary_set_string(v15, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v16 = xpc_activity_copy_criteria(v8);
  v17 = v16;
  if (!v16 || !xpc_equal(v16, v15))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1B0C58000, v18, OS_LOG_TYPE_DEFAULT, "Updated criteria for xpc activity: %@", (uint8_t *)&v19, 0xCu);
    }
    xpc_activity_set_criteria(v8, v15);
  }

}

- (void)_runActivity:(id)a3 name:(id)a4
{
  _xpc_activity_s *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *dispatchQueue;
  _xpc_activity_s *v16;
  id v17;
  _QWORD block[4];
  id v19;
  FCCXPCActivityScheduler *v20;
  _xpc_activity_s *v21;

  v6 = (_xpc_activity_s *)a3;
  v7 = a4;
  if (!xpc_activity_set_state(v6, 4))
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCCXPCActivityScheduler _runActivity:name:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FCCXPCActivityScheduler__runActivity_name___block_invoke;
  block[3] = &unk_1E6210230;
  v19 = v7;
  v20 = self;
  v21 = v6;
  v16 = v6;
  v17 = v7;
  dispatch_async(dispatchQueue, block);

}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1B0C58000, v2, OS_LOG_TYPE_DEFAULT, "Running xpc activity: %@", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_184;
  v7[3] = &unk_1E6210208;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "scheduler:performActivityWithName:completion:", v6, v8, v7);

}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_184(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5298];
  v3 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1B0C58000, v3, OS_LOG_TYPE_DEFAULT, "Setting xpc activity to done: %@", (uint8_t *)&v12, 0xCu);
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    _HKInitializeLogging();
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_184_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (id)_stringForXPCActivityState:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_1E6210250[a3];
}

- (FCCXPCActivitySchedulerDelegate)delegate
{
  return (FCCXPCActivitySchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

- (void)_runActivity:(uint64_t)a3 name:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0C58000, a2, a3, "failed to set xpc activity state to continue: %@", a5, a6, a7, a8, 2u);
}

void __45__FCCXPCActivityScheduler__runActivity_name___block_invoke_184_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0C58000, a2, a3, "Failed to set xpc activity state to done: %@", a5, a6, a7, a8, 2u);
}

@end
