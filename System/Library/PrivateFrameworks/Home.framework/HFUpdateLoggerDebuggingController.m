@implementation HFUpdateLoggerDebuggingController

+ (id)_sharedInstance
{
  if (qword_1ED3791C0 != -1)
    dispatch_once(&qword_1ED3791C0, &__block_literal_global_115);
  return (id)_MergedGlobals_265;
}

void __55__HFUpdateLoggerDebuggingController__addRunningLogger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "set_queue_iteration:", objc_msgSend(*(id *)(a1 + 32), "_queue_iteration") + 1);
  objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04d %@: Started %@"), objc_msgSend(*(id *)(a1 + 32), "_queue_iteration"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

- (int64_t)_queue_iteration
{
  return self->__queue_iteration;
}

void __58__HFUpdateLoggerDebuggingController__removeRunningLogger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" -> Finished in %fs"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (NSMutableDictionary)_queue_historyStringsKeyedByLogger
{
  return self->__queue_historyStringsKeyedByLogger;
}

- (NSHashTable)_queue_runningLoggers
{
  return self->__queue_runningLoggers;
}

- (void)set_queue_iteration:(int64_t)a3
{
  self->__queue_iteration = a3;
}

- (void)_addRunningLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[HFUpdateLoggerDebuggingController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HFUpdateLoggerDebuggingController__addRunningLogger___block_invoke;
  block[3] = &unk_1EA7270A0;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(v7, block);

}

- (void)_removeRunningLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUpdateLoggerDebuggingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__HFUpdateLoggerDebuggingController__removeRunningLogger___block_invoke;
  v12[3] = &unk_1EA7271B0;
  v12[4] = self;
  v13 = v4;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v4;
  dispatch_async(v8, v12);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __52__HFUpdateLoggerDebuggingController__sharedInstance__block_invoke()
{
  HFUpdateLoggerDebuggingController *v0;
  void *v1;

  v0 = objc_alloc_init(HFUpdateLoggerDebuggingController);
  v1 = (void *)_MergedGlobals_265;
  _MergedGlobals_265 = (uint64_t)v0;

}

- (HFUpdateLoggerDebuggingController)init
{
  HFUpdateLoggerDebuggingController *v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HFUpdateLoggerDebuggingController;
  v2 = -[HFUpdateLoggerDebuggingController init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Home.HFUpdateLoggerDebuggingController", 0);
    -[HFUpdateLoggerDebuggingController setQueue:](v2, "setQueue:", v3);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUpdateLoggerDebuggingController set_queue_runningLoggers:](v2, "set_queue_runningLoggers:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HFUpdateLoggerDebuggingController set_queue_historyStringsKeyedByLogger:](v2, "set_queue_historyStringsKeyedByLogger:", v5);

    -[HFUpdateLoggerDebuggingController set_queue_iteration:](v2, "set_queue_iteration:", 0);
    objc_initWeak(&location, v2);
    +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__HFUpdateLoggerDebuggingController_init__block_invoke;
    v9[3] = &unk_1EA7266C0;
    objc_copyWeak(&v10, &location);
    v7 = (id)objc_msgSend(v6, "registerStateDumpHandler:withName:", v9, CFSTR("HFRunningUpdateLoggers"));

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)set_queue_runningLoggers:(id)a3
{
  objc_storeStrong((id *)&self->__queue_runningLoggers, a3);
}

- (void)set_queue_historyStringsKeyedByLogger:(id)a3
{
  objc_storeStrong((id *)&self->__queue_historyStringsKeyedByLogger, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

id __41__HFUpdateLoggerDebuggingController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_runningLoggerStrings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

- (id)_runningLoggers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  v12 = 0;
  -[HFUpdateLoggerDebuggingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HFUpdateLoggerDebuggingController__runningLoggers__block_invoke;
  v6[3] = &unk_1EA72B240;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__HFUpdateLoggerDebuggingController__runningLoggers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_runningLoggerStrings
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  v12 = 0;
  -[HFUpdateLoggerDebuggingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke;
  v6[3] = &unk_1EA735888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_15_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_3;
  v11[3] = &unk_1EA735860;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "na_filter:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a2);
}

uint64_t __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_historyStrings
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  v12 = 0;
  -[HFUpdateLoggerDebuggingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HFUpdateLoggerDebuggingController__historyStrings__block_invoke;
  v6[3] = &unk_1EA72B240;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__HFUpdateLoggerDebuggingController__historyStrings__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue_historyStringsKeyedByLogger, 0);
  objc_storeStrong((id *)&self->__queue_runningLoggers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
