@implementation CNCallStackRecordingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1_3 != -1)
    dispatch_once(&os_log_cn_once_token_1_3, &__block_literal_global_23);
  return (id)os_log_cn_once_object_1_3;
}

void __48__CNCallStackRecordingSchedulerDecorator_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.debug", "scheduler-callstack");
  v1 = (void *)os_log_cn_once_object_1_3;
  os_log_cn_once_object_1_3 = (uint64_t)v0;

}

- (CNCallStackRecordingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5;
  CNCallStackRecordingSchedulerDecorator *v6;
  CNCallStackRecordingSchedulerDecorator *v7;
  CNCallStackRecordingSchedulerDecorator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCallStackRecordingSchedulerDecorator;
  v6 = -[CNCallStackRecordingSchedulerDecorator init](&v10, sel_init);
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
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scheduler"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)blockBecamePending
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_18F80C000, a2, OS_LOG_TYPE_DEBUG, "Scheduling block with call stack: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CNCallStackRecordingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E29B9BF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __55__CNCallStackRecordingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CNCallStackRecordingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E29B9BF8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:qualityOfService:", v9, a4);

}

uint64_t __72__CNCallStackRecordingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CNCallStackRecordingSchedulerDecorator_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E29B9C20;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__CNCallStackRecordingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__CNCallStackRecordingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E29B9C20;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "performCancelableBlock:qualityOfService:", v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __82__CNCallStackRecordingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E29B9BF8;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "afterDelay:performBlock:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __66__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  -[CNCallStackRecordingSchedulerDecorator blockBecamePending](self, "blockBecamePending");
  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E29B9BF8;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v13, a5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __83__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNCallStackRecordingSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
