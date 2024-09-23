@implementation CNTimeProfilingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1_10 != -1)
    dispatch_once(&os_log_cn_once_token_1_10, &__block_literal_global_52);
  return (id)os_log_cn_once_object_1_10;
}

void __43__CNTimeProfilingSchedulerDecorator_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.debug", "scheduler-timing");
  v1 = (void *)os_log_cn_once_object_1_10;
  os_log_cn_once_object_1_10 = (uint64_t)v0;

}

- (CNTimeProfilingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5;
  CNTimeProfilingSchedulerDecorator *v6;
  CNTimeProfilingSchedulerDecorator *v7;
  CNTimeProfilingSchedulerDecorator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTimeProfilingSchedulerDecorator;
  v6 = -[CNTimeProfilingSchedulerDecorator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v7->_blockCounter = 0;
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scheduler"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)nextBlockNumber
{
  CNTimeProfilingSchedulerDecorator *v2;
  unint64_t blockCounter;

  v2 = self;
  objc_sync_enter(v2);
  blockCounter = v2->_blockCounter;
  v2->_blockCounter = blockCounter + 1;
  objc_sync_exit(v2);

  return blockCounter;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  v8 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke;
  v12[3] = &unk_1E29BB708;
  v13 = v4;
  v14 = v8;
  v15 = v7;
  v12[4] = self;
  v11 = v4;
  objc_msgSend(v10, "performBlock:", v12);

}

void __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - *(double *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_18F80C000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);

  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  uint64_t v17;

  v6 = a3;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  v10 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__CNTimeProfilingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v14[3] = &unk_1E29BB708;
  v15 = v6;
  v16 = v10;
  v17 = v9;
  v14[4] = self;
  v13 = v6;
  objc_msgSend(v12, "performBlock:qualityOfService:", v14, a4);

}

void __67__CNTimeProfilingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - *(double *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_18F80C000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);

  }
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  v8 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__CNTimeProfilingSchedulerDecorator_performCancelableBlock___block_invoke;
  v14[3] = &unk_1E29BB730;
  v15 = v4;
  v16 = v8;
  v17 = v7;
  v14[4] = self;
  v11 = v4;
  objc_msgSend(v10, "performCancelableBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __60__CNTimeProfilingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v11 - v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v11 - *(double *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    _os_log_debug_impl(&dword_18F80C000, v12, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v16, 0x20u);

  }
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  uint64_t v19;

  v6 = a3;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  v10 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__CNTimeProfilingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E29BB730;
  v17 = v6;
  v18 = v10;
  v19 = v9;
  v16[4] = self;
  v13 = v6;
  objc_msgSend(v12, "performCancelableBlock:qualityOfService:", v16, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __77__CNTimeProfilingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v11 - v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v11 - *(double *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    _os_log_debug_impl(&dword_18F80C000, v12, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v16, 0x20u);

  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  uint64_t v19;

  v6 = a4;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  v10 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v16[3] = &unk_1E29BB708;
  v17 = v6;
  v18 = v10;
  v19 = v9;
  v16[4] = self;
  v13 = v6;
  objc_msgSend(v12, "afterDelay:performBlock:", v16, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __61__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - *(double *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_18F80C000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);

  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  unint64_t v20;
  uint64_t v21;

  v8 = a4;
  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;

  v12 = -[CNTimeProfilingSchedulerDecorator nextBlockNumber](self, "nextBlockNumber");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CNTimeProfilingSchedulerDecorator performBlock:].cold.1();

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v18[3] = &unk_1E29BB708;
  v19 = v8;
  v20 = v12;
  v21 = v11;
  v18[4] = self;
  v15 = v8;
  objc_msgSend(v14, "afterDelay:performBlock:qualityOfService:", v18, a5, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __78__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 48);
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNTimeIntervalFormatter stringForTimeInterval:](CNTimeIntervalFormatter, "stringForTimeInterval:", v8 - *(double *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_18F80C000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);

  }
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNTimeProfilingSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)blockCounter
{
  return self->_blockCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)performBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18F80C000, v0, v1, "Scheduling block %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_7();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1((uint64_t)CNTimeIntervalFormatter), "stringForTimeInterval:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_8(&dword_18F80C000, v1, v2, "Activating block %lu %{public}@ after scheduling", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
