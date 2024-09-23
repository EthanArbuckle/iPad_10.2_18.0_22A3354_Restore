@implementation CNUIAfterCACommitScheduler

- (CNSuspendableSchedulerDecorator)scheduler
{
  return self->_scheduler;
}

void __43__CNUIAfterCACommitScheduler_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  v3 = *(id *)(a1 + 32);
  v2(v1);

}

- (CNUIAfterCACommitScheduler)initWithSchedulerProvider:(id)a3
{
  id v4;
  CNUIAfterCACommitScheduler *v5;
  void *v6;
  uint64_t v7;
  CNSuspendableSchedulerDecorator *scheduler;
  __CFRunLoop *Main;
  CNUIAfterCACommitScheduler *v10;
  objc_super v12;
  CFRunLoopObserverContext context;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNUIAfterCACommitScheduler;
  v5 = -[CNUIAfterCACommitScheduler init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "inlineScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13BA0]), "initWithScheduler:", v6);
    scheduler = v5->_scheduler;
    v5->_scheduler = (CNSuspendableSchedulerDecorator *)v7;

    context.version = 0;
    context.info = v5;
    memset(&context.retain, 0, 24);
    v5->_runLoopObserver = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 2000001, (CFRunLoopObserverCallBack)_afterCACommitHandler, &context);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v5->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    v10 = v5;

  }
  return v5;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CNUIAfterCACommitScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E204F9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (CNUIAfterCACommitScheduler)init
{
  void *v3;
  CNUIAfterCACommitScheduler *v4;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIAfterCACommitScheduler initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (void)dealloc
{
  __CFRunLoop *Current;
  objc_super v4;

  if (self->_runLoopObserver)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
  -[CNSuspendableSchedulerDecorator resume](self->_scheduler, "resume");
  v4.receiver = self;
  v4.super_class = (Class)CNUIAfterCACommitScheduler;
  -[CNUIAfterCACommitScheduler dealloc](&v4, sel_dealloc);
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CNUIAfterCACommitScheduler_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E204F9B0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:qualityOfService:", v9, a4);

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
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CNUIAfterCACommitScheduler_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E204C448;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CNUIAfterCACommitScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E204C448;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "performCancelableBlock:qualityOfService:", v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CNUIAfterCACommitScheduler_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E204F9B0;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "afterDelay:performBlock:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CNUIAfterCACommitScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E204F9B0;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v13, a5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNUIAfterCACommitScheduler scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (__CFRunLoopObserver)runLoopObserver
{
  return self->_runLoopObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __71__CNUIAfterCACommitScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  v3 = *(id *)(a1 + 32);
  v2(v1);

}

void __54__CNUIAfterCACommitScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  v3 = *(id *)(a1 + 32);
  v2(v1);

}

void __70__CNUIAfterCACommitScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

void __53__CNUIAfterCACommitScheduler_performCancelableBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

void __60__CNUIAfterCACommitScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  v3 = *(id *)(a1 + 32);
  v2(v1);

}

@end
