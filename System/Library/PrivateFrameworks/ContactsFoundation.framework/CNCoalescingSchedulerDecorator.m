@implementation CNCoalescingSchedulerDecorator

- (CNCoalescingSchedulerDecorator)initWithScheduler:(id)a3 coalescingWindow:(double)a4
{
  id v7;
  CNCoalescingSchedulerDecorator *v8;
  CNCoalescingSchedulerDecorator *v9;
  CNStack *v10;
  CNStack *delayedBlocks;
  CNCoalescingSchedulerDecorator *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNCoalescingSchedulerDecorator;
  v8 = -[CNCoalescingSchedulerDecorator init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scheduler, a3);
    v9->_coalescingWindow = a4;
    v9->_state = 0;
    v10 = objc_alloc_init(CNStack);
    delayedBlocks = v9->_delayedBlocks;
    v9->_delayedBlocks = v10;

    v12 = v9;
  }

  return v9;
}

- (unint64_t)getAndIncrementState
{
  CNCoalescingSchedulerDecorator *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[CNCoalescingSchedulerDecorator state](v2, "state"))
  {
    v3 = 1;
  }
  else
  {
    -[CNCoalescingSchedulerDecorator setState:](v2, "setState:", 1);
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)flushDelayedBlock
{
  CNCoalescingSchedulerDecorator *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v2 = self;
  objc_sync_enter(v2);
  -[CNCoalescingSchedulerDecorator delayedBlocks](v2, "delayedBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CNCoalescingSchedulerDecorator delayedBlocks](v2, "delayedBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pop");
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    -[CNCoalescingSchedulerDecorator delayedBlocks](v2, "delayedBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popAll");

    -[CNCoalescingSchedulerDecorator scheduler](v2, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCoalescingSchedulerDecorator coalescingWindow](v2, "coalescingWindow");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__CNCoalescingSchedulerDecorator_flushDelayedBlock__block_invoke;
    v11[3] = &unk_1E29B9358;
    v11[4] = v2;
    v10 = (id)objc_msgSend(v9, "afterDelay:performBlock:", v11);

  }
  else
  {
    -[CNCoalescingSchedulerDecorator setState:](v2, "setState:", 0);
    v6 = 0;
  }
  objc_sync_exit(v2);

  if (v6)
    v6[2](v6);

}

uint64_t __51__CNCoalescingSchedulerDecorator_flushDelayedBlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushDelayedBlock");
}

- (void)removeDelayedBlock:(id)a3
{
  CNCoalescingSchedulerDecorator *v4;
  void *v5;
  void *v6;
  id aBlock;

  aBlock = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNCoalescingSchedulerDecorator delayedBlocks](v4, "delayedBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CNCoalescingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E29B9850;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = -[CNCoalescingSchedulerDecorator performCancelableBlock:](self, "performCancelableBlock:", v7);

}

void __47__CNCoalescingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", *(_QWORD *)(a1 + 40));

}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CNCoalescingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E29BBAA0;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v7 = v6;
  v8 = -[CNCoalescingSchedulerDecorator performCancelableBlock:](self, "performCancelableBlock:", v9);

}

void __64__CNCoalescingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:qualityOfService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)performCancelableBlock:(id)a3
{
  return -[CNCoalescingSchedulerDecorator performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  CNCancelationToken *v7;
  unint64_t v8;
  void *v9;
  CNCoalescingSchedulerDecorator *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  id from;
  id location;
  _QWORD v28[5];

  v6 = a3;
  v7 = objc_alloc_init(CNCancelationToken);
  v8 = -[CNCoalescingSchedulerDecorator getAndIncrementState](self, "getAndIncrementState");
  if (v8 == 1)
  {
    v10 = self;
    objc_sync_enter(v10);
    objc_initWeak(&location, v10);
    objc_initWeak(&from, v7);
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_2;
    v22[3] = &unk_1E29BBAC8;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(v25, &from);
    v23 = v6;
    v25[1] = (id)a4;
    v14 = (void *)objc_msgSend(v22, "copy");
    -[CNCoalescingSchedulerDecorator delayedBlocks](v10, "delayedBlocks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _Block_copy(v14);
    objc_msgSend(v15, "push:", v16);

    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_3;
    v19[3] = &unk_1E29BB050;
    objc_copyWeak(&v21, &location);
    v17 = v14;
    v20 = v17;
    -[CNCancelationToken addCancelationBlock:](v7, "addCancelationBlock:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_sync_exit(v10);
    goto LABEL_5;
  }
  if (!v8)
  {
    -[CNCoalescingSchedulerDecorator scheduler](self, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performCancelableBlock:qualityOfService:", v6, a4);
    v10 = (CNCoalescingSchedulerDecorator *)objc_claimAutoreleasedReturnValue();

    -[CNCoalescingSchedulerDecorator scheduler](self, "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCoalescingSchedulerDecorator coalescingWindow](self, "coalescingWindow");
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
    v28[3] = &unk_1E29B9358;
    v28[4] = self;
    objc_msgSend(v11, "afterDelay:performBlock:", v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNCancelationToken addCancelable:](v7, "addCancelable:", v10);
    -[CNCancelationToken addCancelable:](v7, "addCancelable:", v12);

LABEL_5:
  }

  return v7;
}

uint64_t __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushDelayedBlock");
}

void __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(v2, "isCanceled") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "scheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performCancelableBlock:qualityOfService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addCancelable:", v4);
  }

}

void __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeDelayedBlock:", *(_QWORD *)(a1 + 32));

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
  -[CNCoalescingSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CNCoalescingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E29B9380;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "afterDelay:performBlock:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __58__CNCoalescingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBlock:", *(_QWORD *)(a1 + 40));
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a4;
  -[CNCoalescingSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__CNCoalescingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E29BBAF0;
  v13[4] = self;
  v14 = v8;
  v15 = a5;
  v10 = v8;
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v13, a5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __75__CNCoalescingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBlock:qualityOfService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNCoalescingSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (double)coalescingWindow
{
  return self->_coalescingWindow;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CNStack)delayedBlocks
{
  return self->_delayedBlocks;
}

- (void)setDelayedBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedBlocks, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
