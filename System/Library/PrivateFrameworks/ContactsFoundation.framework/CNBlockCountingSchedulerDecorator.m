@implementation CNBlockCountingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_14);
  return (id)os_log_cn_once_object_1;
}

void __43__CNBlockCountingSchedulerDecorator_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.debug", "scheduler-counting");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

- (CNBlockCountingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5;
  CNBlockCountingSchedulerDecorator *v6;
  CNBlockCountingSchedulerDecorator *v7;
  CNBlockCountingSchedulerDecorator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNBlockCountingSchedulerDecorator;
  v6 = -[CNBlockCountingSchedulerDecorator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
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
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scheduler"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)blockBecamePending
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = 134218752;
  v7 = a1;
  v8 = 2048;
  v9 = v3;
  v10 = 2048;
  v11 = v4;
  v12 = 2048;
  v13 = v5;
  _os_log_debug_impl(&dword_18F80C000, log, OS_LOG_TYPE_DEBUG, "Scheduler %p has new pending block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v6, 0x2Au);
}

- (void)blockBecameActive
{
  CNBlockCountingSchedulerDecorator *v2;
  NSObject *v3;
  unint64_t pendingBlockCount;
  unint64_t activeBlockCount;
  unint64_t completedBlockCount;
  int v7;
  CNBlockCountingSchedulerDecorator *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  *(int64x2_t *)&v2->_pendingBlockCount = vaddq_s64(*(int64x2_t *)&v2->_pendingBlockCount, (int64x2_t)xmmword_18F890EF0);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pendingBlockCount = v2->_pendingBlockCount;
    activeBlockCount = v2->_activeBlockCount;
    completedBlockCount = v2->_completedBlockCount;
    v7 = 134218752;
    v8 = v2;
    v9 = 2048;
    v10 = pendingBlockCount;
    v11 = 2048;
    v12 = activeBlockCount;
    v13 = 2048;
    v14 = completedBlockCount;
    _os_log_debug_impl(&dword_18F80C000, v3, OS_LOG_TYPE_DEBUG, "Scheduler %p has new active block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v7, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (void)blockBecameCompleted
{
  CNBlockCountingSchedulerDecorator *v2;
  NSObject *v3;
  unint64_t pendingBlockCount;
  unint64_t activeBlockCount;
  unint64_t completedBlockCount;
  int v7;
  CNBlockCountingSchedulerDecorator *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  *(int64x2_t *)&v2->_activeBlockCount = vaddq_s64(*(int64x2_t *)&v2->_activeBlockCount, (int64x2_t)xmmword_18F890EF0);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pendingBlockCount = v2->_pendingBlockCount;
    activeBlockCount = v2->_activeBlockCount;
    completedBlockCount = v2->_completedBlockCount;
    v7 = 134218752;
    v8 = v2;
    v9 = 2048;
    v10 = pendingBlockCount;
    v11 = 2048;
    v12 = activeBlockCount;
    v13 = 2048;
    v14 = completedBlockCount;
    _os_log_debug_impl(&dword_18F80C000, v3, OS_LOG_TYPE_DEBUG, "Scheduler %p has new completed block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v7, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNBlockCountingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E29B9380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __50__CNBlockCountingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CNBlockCountingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E29B9380;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:qualityOfService:", v9, a4);

}

uint64_t __67__CNBlockCountingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CNBlockCountingSchedulerDecorator_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E29B9850;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__CNBlockCountingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__CNBlockCountingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E29B9850;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "performCancelableBlock:qualityOfService:", v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __77__CNBlockCountingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CNBlockCountingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E29B9380;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "afterDelay:performBlock:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __61__CNBlockCountingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a4;
  -[CNBlockCountingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__CNBlockCountingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E29B9380;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v13, a5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __78__CNBlockCountingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "blockBecameActive");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "blockBecameCompleted");
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNBlockCountingSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)pendingBlockCount
{
  return self->_pendingBlockCount;
}

- (unint64_t)activeBlockCount
{
  return self->_activeBlockCount;
}

- (unint64_t)completedBlockCount
{
  return self->_completedBlockCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
