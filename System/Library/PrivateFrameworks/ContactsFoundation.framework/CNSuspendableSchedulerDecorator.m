@implementation CNSuspendableSchedulerDecorator

- (id)_nts_enqueueCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  CNCancelationToken *v7;
  uint64_t v8;
  id v9;
  CNCancelationToken *v10;
  _QWORD *v11;
  void *v12;
  dispatch_qos_class_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CNCancelationToken *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id from;
  id location;
  _QWORD v27[4];
  CNCancelationToken *v28;
  id v29;

  v6 = a3;
  v7 = objc_alloc_init(CNCancelationToken);
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke;
  v27[3] = &unk_1E29B8D88;
  v9 = v6;
  v29 = v9;
  v10 = v7;
  v28 = v10;
  v11 = v27;
  v12 = v11;
  v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v14 = _Block_copy(v11);
      goto LABEL_9;
    case 2uLL:
      v13 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v13 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v13 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      goto LABEL_8;
    default:
      v13 = QOS_CLASS_DEFAULT;
LABEL_7:
      v15 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v13, 0, v11);
LABEL_8:
      v16 = v15;
      objc_opt_self();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v17 = (void *)objc_msgSend(v14, "copy");

      -[CNSuspendableSchedulerDecorator queue](self, "queue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = _Block_copy(v17);
      objc_msgSend(v18, "enqueue:", v19);

      objc_initWeak(&location, self);
      objc_initWeak(&from, v17);
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_2;
      v22[3] = &unk_1E29BB608;
      objc_copyWeak(&v23, &location);
      objc_copyWeak(&v24, &from);
      -[CNCancelationToken addCancelationBlock:](v10, "addCancelationBlock:", v22);
      v20 = v10;
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      return v20;
  }
}

- (void)suspend
{
  void *v3;
  id v4;

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockWithCondition:", 0);

}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__CNSuspendableSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v14[3] = &unk_1E29BB5E0;
  v14[4] = self;
  v16 = &v19;
  v17 = &v23;
  v8 = v6;
  v15 = v8;
  v18 = a4;
  CNRunWithLock(v7, v14);

  if (*((_BYTE *)v20 + 24))
  {
    -[CNSuspendableSchedulerDecorator scheduler](self, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performCancelableBlock:qualityOfService:", v8, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v24[5];
    v24[5] = v10;

  }
  v12 = (id)v24[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockWithCondition:", 1);

  -[CNSuspendableSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CNSuspendableSchedulerDecorator_resume__block_invoke;
  v6[3] = &unk_1E29B9358;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void)_performFirstQueuedTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[CNSuspendableSchedulerDecorator lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  if (v5)
  {
    -[CNSuspendableSchedulerDecorator queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeue");
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    -[CNSuspendableSchedulerDecorator lock](self, "lock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v7)
    {
      objc_msgSend(v8, "unlockWithCondition:", 1);

      v7[2](v7);
      -[CNSuspendableSchedulerDecorator scheduler](self, "scheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__CNSuspendableSchedulerDecorator__performFirstQueuedTask__block_invoke;
      v12[3] = &unk_1E29B9358;
      v12[4] = self;
      objc_msgSend(v9, "performBlock:", v12);

    }
    else
    {
      objc_msgSend(v8, "unlockWithCondition:", 2);

    }
  }
  else
  {
    -[CNSuspendableSchedulerDecorator lock](self, "lock");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlock");

  }
}

- (NSConditionLock)lock
{
  return self->_lock;
}

- (CNQueue)queue
{
  return self->_queue;
}

void __75__CNSuspendableSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition");

  if (v3 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nts_enqueueCancelableBlock:qualityOfService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __65__CNSuspendableSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__CNSuspendableSchedulerDecorator_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performFirstQueuedTask");
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CNSuspendableSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E29B9C20;
  v10 = v6;
  v7 = v6;
  v8 = -[CNSuspendableSchedulerDecorator performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", v9, a4);

}

uint64_t __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__CNSuspendableSchedulerDecorator__performFirstQueuedTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performFirstQueuedTask");
}

- (void)performBlock:(id)a3
{
  -[CNSuspendableSchedulerDecorator performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

void __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id aBlock;

  aBlock = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _Block_copy(aBlock);
  objc_msgSend(v2, "dequeueObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_3;
  v4[3] = &unk_1E29B9758;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4[4] = WeakRetained;
  CNRunWithLock(v3, v4);

  objc_destroyWeak(&v5);
}

+ (id)suspendedSchedulerWithScheduler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduler:", v4);

  return v5;
}

- (CNSuspendableSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5;
  CNSuspendableSchedulerDecorator *v6;
  CNSuspendableSchedulerDecorator *v7;
  CNQueue *v8;
  CNQueue *queue;
  uint64_t v10;
  NSConditionLock *lock;
  CNSuspendableSchedulerDecorator *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSuspendableSchedulerDecorator;
  v6 = -[CNSuspendableSchedulerDecorator init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v8 = objc_alloc_init(CNQueue);
    queue = v7->_queue;
    v7->_queue = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    lock = v7->_lock;
    v7->_lock = (NSConditionLock *)v10;

    v12 = v7;
  }

  return v7;
}

+ (id)resumedSchedulerWithScheduler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduler:", v4);

  objc_msgSend(v5, "resume");
  return v5;
}

- (id)performCancelableBlock:(id)a3
{
  return -[CNSuspendableSchedulerDecorator performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  CNCancelationToken *v9;
  void *v10;
  CNCancelationToken *v11;
  id v12;
  void *v13;
  CNCancelationToken *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  CNSuspendableSchedulerDecorator *v20;
  CNCancelationToken *v21;
  id v22;
  unint64_t v23;

  v8 = a4;
  v9 = objc_alloc_init(CNCancelationToken);
  -[CNSuspendableSchedulerDecorator scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v19 = &unk_1E29BB630;
  v20 = self;
  v22 = v8;
  v23 = a5;
  v11 = v9;
  v21 = v11;
  v12 = v8;
  objc_msgSend(v10, "afterDelay:performBlock:", &v16, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v11, "addCancelable:", v13, v16, v17, v18, v19, v20);
  v14 = v11;

  return v14;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[CNSuspendableSchedulerDecorator afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (NSString)description
{
  void *v3;
  id v4;
  NSInteger v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scheduler"), self->_scheduler);
  v5 = -[NSConditionLock condition](self->_lock, "condition");
  v6 = CFSTR("CNSuspendableSchedulerConditionBuffering");
  if (v5 == 1)
    v6 = CFSTR("CNSuspendableSchedulerConditionDraining");
  if (v5 == 2)
    v7 = CFSTR("CNSuspendableSchedulerConditionRelaying");
  else
    v7 = v6;
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("status"), v7);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

void __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v4[3] = &unk_1E29B9C20;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performCancelableBlock:qualityOfService:", v4, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addCancelable:", v3);

}

uint64_t __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNSuspendableSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

@end
