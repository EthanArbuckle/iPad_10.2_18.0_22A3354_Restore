@implementation CNInhibitingSchedulerDecorator

- (CNInhibitingSchedulerDecorator)initWithScheduler:(id)a3 inhibitorFactory:(id)a4
{
  id v7;
  id v8;
  CNInhibitingSchedulerDecorator *v9;
  CNInhibitingSchedulerDecorator *v10;
  uint64_t v11;
  id inhibitorFactory;
  CNInhibitingSchedulerDecorator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNInhibitingSchedulerDecorator;
  v9 = -[CNInhibitingSchedulerDecorator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scheduler, a3);
    v11 = objc_msgSend(v8, "copy");
    inhibitorFactory = v10->_inhibitorFactory;
    v10->_inhibitorFactory = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void)performBlock:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  id v7;

  v4 = a3;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:", v4);

  objc_msgSend(v7, "stop");
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void (**v7)(void);
  void *v8;
  id v9;

  v6 = a3;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:qualityOfService:", v6, a4);

  objc_msgSend(v9, "stop");
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__CNInhibitingSchedulerDecorator_performCancelableBlock___block_invoke;
  v12[3] = &unk_1E29B9A70;
  v13 = v6;
  v14 = v4;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v7, "performCancelableBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __57__CNInhibitingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CNInhibitingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v14[3] = &unk_1E29B9A70;
  v15 = v8;
  v16 = v6;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "performCancelableBlock:qualityOfService:", v14, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__CNInhibitingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__CNInhibitingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v14[3] = &unk_1E29B8D88;
  v15 = v8;
  v16 = v6;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "afterDelay:performBlock:", v14, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __58__CNInhibitingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a4;
  -[CNInhibitingSchedulerDecorator inhibitorFactory](self, "inhibitorFactory");
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "start");
  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__CNInhibitingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E29B8D88;
  v17 = v10;
  v18 = v8;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v11, "afterDelay:performBlock:qualityOfService:", v16, a5, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __75__CNInhibitingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNInhibitingSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (id)inhibitorFactory
{
  return self->_inhibitorFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inhibitorFactory, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
