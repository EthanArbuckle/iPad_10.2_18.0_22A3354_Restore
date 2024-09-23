@implementation AVTSerialTaskScheduler

+ (id)lifoScheduler
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D00860], "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lifoSchedulerWithEnvironment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fifoScheduler
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D00860], "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fifoSchedulerWithEnvironment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lifoSchedulerWithEnvironment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEnvironment:order:", v4, 1);

  return v5;
}

+ (id)fifoSchedulerWithEnvironment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEnvironment:order:", v4, 0);

  return v5;
}

- (AVTSerialTaskScheduler)initWithEnvironment:(id)a3 order:(int64_t)a4
{
  id v6;
  AVTSerialTaskScheduler *v7;
  uint64_t v8;
  NSMutableArray *priorityTasks;
  uint64_t v10;
  NSMutableArray *backlogTasks;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  OS_dispatch_queue *stateLock;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTSerialTaskScheduler;
  v7 = -[AVTSerialTaskScheduler init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    priorityTasks = v7->_priorityTasks;
    v7->_priorityTasks = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    backlogTasks = v7->_backlogTasks;
    v7->_backlogTasks = (NSMutableArray *)v10;

    v7->_order = a4;
    objc_msgSend(v6, "lockProvider");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v12)[2](v12, "com.apple.AvatarUI.AVTLIFOScheduler.stateLock");
    v13 = objc_claimAutoreleasedReturnValue();
    stateLock = v7->_stateLock;
    v7->_stateLock = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (void)performStateWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTSerialTaskScheduler stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVTSerialTaskScheduler_performStateWork___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __43__AVTSerialTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "priorityTasks");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backlogTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)scheduleTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = (void *)objc_msgSend(v4, "copy");
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __39__AVTSerialTaskScheduler_scheduleTask___block_invoke;
  v10 = &unk_1EA51E820;
  v6 = v5;
  v11 = v6;
  v12 = &v13;
  -[AVTSerialTaskScheduler performStateWork:](self, "performStateWork:", &v7);
  if (*((_BYTE *)v14 + 24))
    -[AVTSerialTaskScheduler startTask:](self, "startTask:", v6, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __39__AVTSerialTaskScheduler_scheduleTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  id v10;

  v10 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v7 = (void *)MEMORY[0x1DF0D0754](v5);
  objc_msgSend(v6, "addObject:", v7);

  v8 = objc_msgSend(v6, "count");
  v9 = v8 == 1 && objc_msgSend(v10, "count") == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

}

- (void)startTask:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  void (**v10)(void);
  id v11;
  id location;

  v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __36__AVTSerialTaskScheduler_startTask___block_invoke;
  v9 = &unk_1EA51D838;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v4[2]();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __36__AVTSerialTaskScheduler_startTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didCompleteTask:", *(_QWORD *)(a1 + 32));

}

- (void)didCompleteTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke;
  v6[3] = &unk_1EA51E870;
  v5 = v4;
  v7 = v5;
  v8 = &v9;
  v6[4] = self;
  -[AVTSerialTaskScheduler performStateWork:](self, "performStateWork:", v6);
  if (v10[5])
    -[AVTSerialTaskScheduler startTask:](self, "startTask:");

  _Block_object_dispose(&v9, 8);
}

void __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke_2;
  v13[3] = &unk_1EA51E848;
  v14 = *(id *)(a1 + 40);
  v7 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF0D0754](v13);
  v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v5);
  v9 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v6);
  if ((v8 & 1) != 0 || v9)
  {
    objc_msgSend((id)objc_opt_class(), "nextTaskToRunForPriorityTasks:backlogTasks:order:", v5, v6, objc_msgSend(*(id *)(a1 + 32), "order"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

BOOL __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x1DF0D0754](*(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "removeObjectAtIndex:", v5);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)cancelAllTasks
{
  -[AVTSerialTaskScheduler performStateWork:](self, "performStateWork:", &__block_literal_global_12);
}

void __40__AVTSerialTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "removeAllObjects");
  objc_msgSend(v4, "removeAllObjects");

}

- (void)lowerTaskPriority:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AVTSerialTaskScheduler_lowerTaskPriority___block_invoke;
  v6[3] = &unk_1EA51E8D8;
  v7 = v4;
  v5 = v4;
  -[AVTSerialTaskScheduler performStateWork:](self, "performStateWork:", v6);

}

void __44__AVTSerialTaskScheduler_lowerTaskPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1DF0D0754](*(_QWORD *)(a1 + 32));
  v7 = objc_msgSend(v10, "indexOfObject:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", v7);
    v9 = (void *)MEMORY[0x1DF0D0754](v8);
    objc_msgSend(v5, "addObject:", v9);

  }
}

+ (id)nextTaskToRunForPriorityTasks:(id)a3 backlogTasks:(id)a4 order:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
    v9 = v7;
  else
    v9 = v8;
  v10 = v9;
  if (objc_msgSend(v10, "count"))
  {
    if (a5)
    {
      if (a5 != 1)
      {
        v13 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v10, "lastObject");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v11;
LABEL_12:
    v12 = (void *)MEMORY[0x1DF0D0754](v13);

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (NSMutableArray)priorityTasks
{
  return self->_priorityTasks;
}

- (NSMutableArray)backlogTasks
{
  return self->_backlogTasks;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (int64_t)order
{
  return self->_order;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_backlogTasks, 0);
  objc_storeStrong((id *)&self->_priorityTasks, 0);
}

@end
