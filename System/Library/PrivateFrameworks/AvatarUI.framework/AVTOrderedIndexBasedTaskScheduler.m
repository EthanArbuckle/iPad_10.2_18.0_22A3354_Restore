@implementation AVTOrderedIndexBasedTaskScheduler

- (AVTOrderedIndexBasedTaskScheduler)initWithEnvironment:(id)a3
{
  id v4;
  AVTOrderedIndexBasedTaskScheduler *v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  OS_dispatch_queue *stateLock;
  uint64_t v9;
  NSMutableDictionary *scheduledTasks;
  uint64_t v11;
  NSMutableDictionary *readyTasks;
  uint64_t v13;
  NSMutableArray *scheduledTasksOrder;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTOrderedIndexBasedTaskScheduler;
  v5 = -[AVTOrderedIndexBasedTaskScheduler init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "lockProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v6)[2](v6, "com.apple.AvatarUI.AVTOrderedIndexBasedScheduler.stateLock");
    v7 = objc_claimAutoreleasedReturnValue();
    stateLock = v5->_stateLock;
    v5->_stateLock = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    scheduledTasks = v5->_scheduledTasks;
    v5->_scheduledTasks = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    readyTasks = v5->_readyTasks;
    v5->_readyTasks = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    scheduledTasksOrder = v5->_scheduledTasksOrder;
    v5->_scheduledTasksOrder = (NSMutableArray *)v13;

  }
  return v5;
}

- (void)performStateWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTOrderedIndexBasedTaskScheduler stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVTOrderedIndexBasedTaskScheduler_performStateWork___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __54__AVTOrderedIndexBasedTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scheduledTasks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduledTasksOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readyTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (void)scheduleTask:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__AVTOrderedIndexBasedTaskScheduler_scheduleTask_forIndex___block_invoke;
  v8[3] = &unk_1EA51FD10;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[AVTOrderedIndexBasedTaskScheduler performStateWork:](self, "performStateWork:", v8);

}

void __59__AVTOrderedIndexBasedTaskScheduler_scheduleTask_forIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v14);

  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v16 = (void *)MEMORY[0x1DF0D0754]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v16, v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v18);

}

- (void)taskReady:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  id v16;
  AVTOrderedIndexBasedTaskScheduler *v17;
  id v18;
  id v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke;
  v15 = &unk_1EA51FD60;
  v16 = v8;
  v17 = self;
  v18 = v7;
  v19 = v6;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  -[AVTOrderedIndexBasedTaskScheduler performStateWork:](self, "performStateWork:", &v12);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_30, v12, v13, v14, v15);

}

void __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v14, "objectForKey:", *(_QWORD *)(a1 + 32));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9 && *(_QWORD *)(a1 + 56) == v9)
  {
    v11 = (void *)MEMORY[0x1DF0D0754](v9);
    objc_msgSend(v8, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));

    objc_msgSend((id)objc_opt_class(), "rowBaseIndexForIndex:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "indexesForReadyTasksToRunGivenScheduledTasks:order:readyTasks:readyRowIndex:", v14, v7, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_2;
    v15[3] = &unk_1EA51FD38;
    v16 = *(id *)(a1 + 48);
    v17 = v8;
    v18 = v14;
    v19 = v7;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
}

void __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1DF0D0754]();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v7);
  objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v7);
  objc_msgSend(*(id *)(a1 + 56), "removeObject:", v7);

}

uint64_t __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, &__block_literal_global_7_0);
}

+ (id)indexesForReadyTasksToRunGivenScheduledTasks:(id)a3 order:(id)a4 readyTasks:(id)a5 readyRowIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v12, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This should only be called when we have ready tasks"));
  objc_msgSend(v12, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v16 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke;
    v34[3] = &unk_1EA51FDE8;
    v36 = a1;
    v17 = v13;
    v35 = v17;
    if (objc_msgSend(v11, "indexOfObjectPassingTest:", v34) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke_2;
      v31[3] = &unk_1EA51FDE8;
      v33 = a1;
      v32 = v17;
      objc_msgSend(v11, "indexesOfObjectsPassingTest:", v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectsAtIndexes:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v21;
        for (i = objc_msgSend(v23, "indexOfObject:", v21) + 1; i < objc_msgSend(v23, "count"); ++i)
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", i);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {

            break;
          }
          objc_msgSend(v24, "addObject:", v26);

        }
        v28 = (id)objc_msgSend(v24, "copy");

        v21 = v30;
      }
      else
      {
        v28 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v28 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v28 = v15;
  }

  return v28;
}

BOOL __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "rowBaseIndexForIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32));
  if (!v8)
    *a4 = 1;
  return v8 == -1;
}

uint64_t __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "rowBaseIndexForIndex:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));
  return v5;
}

+ (id)rowBaseIndexForIndex:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3 * (objc_msgSend(a3, "unsignedIntegerValue") / 3uLL));
}

- (void)cancelAllTasks
{
  -[AVTOrderedIndexBasedTaskScheduler performStateWork:](self, "performStateWork:", &__block_literal_global_13);
}

void __51__AVTOrderedIndexBasedTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a2;
  objc_msgSend(a3, "removeAllObjects");
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(v7, "removeAllObjects");
}

- (void)cancelTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke;
  v6[3] = &unk_1EA51FEA0;
  v7 = v4;
  v5 = v4;
  -[AVTOrderedIndexBasedTaskScheduler performStateWork:](self, "performStateWork:", v6);

}

void __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_2;
  v13[3] = &unk_1EA51FE78;
  v14 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0D0754](v13);
  ((void (**)(_QWORD, id))v10)[2](v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "removeObject:", v11);
  v12 = (id)((uint64_t (*)(_QWORD, id))v10[2])(v10, v8);

}

id __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_3;
  v8[3] = &unk_1EA51FE50;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "keysOfEntriesPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "removeObjectForKey:", v5);
    v6 = v5;
  }

  return v5;
}

uint64_t __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)MEMORY[0x1DF0D0754](v5);
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

- (NSMutableDictionary)scheduledTasks
{
  return self->_scheduledTasks;
}

- (NSMutableArray)scheduledTasksOrder
{
  return self->_scheduledTasksOrder;
}

- (NSMutableDictionary)readyTasks
{
  return self->_readyTasks;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_readyTasks, 0);
  objc_storeStrong((id *)&self->_scheduledTasksOrder, 0);
  objc_storeStrong((id *)&self->_scheduledTasks, 0);
}

@end
