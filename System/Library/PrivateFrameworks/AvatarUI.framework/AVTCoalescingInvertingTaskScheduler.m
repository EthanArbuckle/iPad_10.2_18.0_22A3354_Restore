@implementation AVTCoalescingInvertingTaskScheduler

- (AVTCoalescingInvertingTaskScheduler)initWithBackingScheduler:(id)a3 coalescingQueue:(id)a4 delay:(double)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  AVTCoalescingInvertingTaskScheduler *v14;
  uint64_t v15;
  NSMutableArray *tasks;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  OS_dispatch_queue *stateLock;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTCoalescingInvertingTaskScheduler;
  v14 = -[AVTCoalescingInvertingTaskScheduler init](&v21, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    tasks = v14->_tasks;
    v14->_tasks = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_coalescingQueue, a4);
    v14->_coalesingDelay = a5;
    objc_msgSend(v13, "lockProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTCoalescingInvertingScheduler.stateLock");
    v18 = objc_claimAutoreleasedReturnValue();
    stateLock = v14->_stateLock;
    v14->_stateLock = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_backingScheduler, a3);
  }

  return v14;
}

- (void)performStateWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTCoalescingInvertingTaskScheduler stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVTCoalescingInvertingTaskScheduler_performStateWork___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __56__AVTCoalescingInvertingTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tasks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)scheduleTask:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x1DF0D0754](a3, a2);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke;
  v13[3] = &unk_1EA51D468;
  v6 = v4;
  v14 = v6;
  -[AVTCoalescingInvertingTaskScheduler performStateWork:](self, "performStateWork:", v13);
  -[AVTCoalescingInvertingTaskScheduler coalesingDelay](self, "coalesingDelay");
  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  -[AVTCoalescingInvertingTaskScheduler coalescingQueue](self, "coalescingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke_2;
  block[3] = &unk_1EA51D490;
  block[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_after(v8, v9, block);

}

void __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = (id)MEMORY[0x1DF0D0754](v2);
  objc_msgSend(v3, "insertObject:atIndex:", v4, 0);

}

uint64_t __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTasksFrom:", *(_QWORD *)(a1 + 40));
}

- (void)startTasksFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__AVTCoalescingInvertingTaskScheduler_startTasksFrom___block_invoke;
  v16[3] = &unk_1EA51D4B8;
  v5 = v4;
  v17 = v5;
  v18 = &v19;
  -[AVTCoalescingInvertingTaskScheduler performStateWork:](self, "performStateWork:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (id)v20[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[AVTCoalescingInvertingTaskScheduler backingScheduler](self, "backingScheduler", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheduleTask:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v19, 8);
}

void __54__AVTCoalescingInvertingTaskScheduler_startTasksFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1DF0D0754](*(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(v8, "containsObject:", v3);

  if (v4)
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v8, "removeAllObjects");
  }

}

- (void)cancelAllTasks
{
  id v3;

  -[AVTCoalescingInvertingTaskScheduler performStateWork:](self, "performStateWork:", &__block_literal_global_2);
  -[AVTCoalescingInvertingTaskScheduler backingScheduler](self, "backingScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllTasks");

}

uint64_t __53__AVTCoalescingInvertingTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)cancelTask:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This scheduler doesn't support canceling a single task."));
}

- (NSMutableArray)tasks
{
  return self->_tasks;
}

- (OS_dispatch_queue)coalescingQueue
{
  return self->_coalescingQueue;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (AVTTaskScheduler)backingScheduler
{
  return self->_backingScheduler;
}

- (double)coalesingDelay
{
  return self->_coalesingDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingScheduler, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
