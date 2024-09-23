@implementation FCTaskScheduler

void __44__FCTaskScheduler_lowPriorityOperationQueue__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v3 = (void *)qword_1ED0F7E08;
  qword_1ED0F7E08 = (uint64_t)v2;

  objc_msgSend((id)qword_1ED0F7E08, "setQualityOfService:", 9);
  objc_msgSend((id)qword_1ED0F7E08, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)qword_1ED0F7E08, "setName:", CFSTR("com.apple.news.lowpriority"));
  objc_msgSend(*(id *)(a1 + 32), "lowPriorityQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0F7E08, "setUnderlyingQueue:", v4);

}

+ (void)pushHighPriorityTaskInFlight
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ED0F7DF4);
  v3 = ++qword_1ED0F7E30;
  v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "TaskScheduler: pushed high-priority task depth to %ld", (uint8_t *)&v10, 0xCu);
    v3 = qword_1ED0F7E30;
  }
  if (v3 == 1)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "TaskScheduler: suspending low-priority queues", (uint8_t *)&v10, 2u);
    }
    objc_msgSend(a1, "postLaunchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v6);

    objc_msgSend(a1, "lowPriorityQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v7);

    objc_msgSend(a1, "lowPriorityOperationQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "setSuspended:", 1);

    LOBYTE(v8) = _MergedGlobals_145;
    objc_msgSend(a1, "backgroundDownloadOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSuspended:", (v8 & 1) == 0);

  }
  os_unfair_lock_unlock(&stru_1ED0F7DF4);
}

+ (void)popHighPriorityTaskInFlight
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ED0F7DF4);
  v3 = --qword_1ED0F7E30;
  v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "TaskScheduler: popped high-priority task depth to %ld", (uint8_t *)&v10, 0xCu);
    v3 = qword_1ED0F7E30;
  }
  if (!v3)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "TaskScheduler: resuming low-priority queues", (uint8_t *)&v10, 2u);
    }
    objc_msgSend(a1, "postLaunchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v6);

    objc_msgSend(a1, "lowPriorityQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v7);

    objc_msgSend(a1, "lowPriorityOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSuspended:", 0);

    objc_msgSend(a1, "backgroundDownloadOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSuspended:", 0);

  }
  os_unfair_lock_unlock(&stru_1ED0F7DF4);
}

+ (void)scheduleLowPriorityBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(a1, "lowPriorityQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

+ (id)lowPriorityQueue
{
  if (qword_1ED0F7E00 != -1)
    dispatch_once(&qword_1ED0F7E00, &__block_literal_global_22);
  return (id)qword_1ED0F7DF8;
}

+ (id)backgroundDownloadOperationQueue
{
  if (qword_1ED0F7E28 != -1)
    dispatch_once(&qword_1ED0F7E28, &__block_literal_global_5_0);
  return (id)qword_1ED0F7E20;
}

+ (void)scheduleLowPriorityBlockForMainThread:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "lowPriorityOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke;
  v7[3] = &unk_1E463DD48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_addAsyncOperationWithBlock:", v7);

}

+ (id)lowPriorityOperationQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FCTaskScheduler_lowPriorityOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F7E10 != -1)
    dispatch_once(&qword_1ED0F7E10, block);
  return (id)qword_1ED0F7E08;
}

void __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E463CD58;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35__FCTaskScheduler_lowPriorityQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, -5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.news.lowpriority", v0);
  v2 = (void *)qword_1ED0F7DF8;
  qword_1ED0F7DF8 = (uint64_t)v1;

}

uint64_t __51__FCTaskScheduler_backgroundDownloadOperationQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  id v4;
  void *v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.news.backgrounddownload", v1);
  v3 = (void *)qword_1ED0F7E18;
  qword_1ED0F7E18 = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v5 = (void *)qword_1ED0F7E20;
  qword_1ED0F7E20 = (uint64_t)v4;

  objc_msgSend((id)qword_1ED0F7E20, "setQualityOfService:", 9);
  objc_msgSend((id)qword_1ED0F7E20, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)qword_1ED0F7E20, "setUnderlyingQueue:", qword_1ED0F7E18);
  return objc_msgSend((id)qword_1ED0F7E20, "setName:", CFSTR("com.apple.news.backgrounddownload"));
}

+ (void)scheduleLowPriorityOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "lowPriorityOperationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

+ (void)scheduleLowPriorityAsyncBlock:(id)a3
{
  id v4;

  +[FCAsyncBlockOperation asyncBlockOperationWithBlock:](FCAsyncBlockOperation, "asyncBlockOperationWithBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheduleLowPriorityOperation:", v4);

}

+ (void)scheduleBackgroundDownloadOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "backgroundDownloadOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", objc_msgSend(v5, "qualityOfService"));

  objc_msgSend(a1, "backgroundDownloadOperationQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v4);

}

+ (void)enableBackgroundDownloadsInSpiteOfHighPriorityTasks
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  os_unfair_lock_lock(&stru_1ED0F7DF4);
  if ((_MergedGlobals_145 & 1) == 0)
  {
    v3 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "TaskScheduler: permitting background downloads regardless of high-priority task depth", v5, 2u);
    }
    _MergedGlobals_145 = 1;
    objc_msgSend(a1, "backgroundDownloadOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSuspended:", 0);

  }
  os_unfair_lock_unlock(&stru_1ED0F7DF4);
}

+ (void)boostBackgroundDownloads
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "TaskScheduler: boosting priority of background downloads", v7, 2u);
  }
  objc_msgSend(a1, "enableBackgroundDownloadsInSpiteOfHighPriorityTasks");
  objc_msgSend(a1, "backgroundDownloadOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", 25);
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_10);

  objc_msgSend(v4, "underlyingQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCDispatchAsyncWithQualityOfService(v6, 25, &__block_literal_global_11);

}

uint64_t __43__FCTaskScheduler_boostBackgroundDownloads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setQualityOfService:", 25);
}

+ (void)scheduleOptionalPrefetchBlock:(id)a3
{
  if ((s_disableOptionalPrefetching & 1) == 0)
    objc_msgSend(a1, "scheduleLowPriorityBlock:", a3);
}

+ (void)executeOptionalPrefetchBlock:(id)a3
{
  if ((s_disableOptionalPrefetching & 1) == 0)
    (*((void (**)(id))a3 + 2))(a3);
}

+ (void)disableOptionalPrefetching
{
  s_disableOptionalPrefetching = 1;
}

+ (id)postLaunchQueue
{
  if (qword_1ED0F7E40 != -1)
    dispatch_once(&qword_1ED0F7E40, &__block_literal_global_14_0);
  return (id)qword_1ED0F7E38;
}

void __34__FCTaskScheduler_postLaunchQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.news.postlaunch", v0);
  v2 = (void *)qword_1ED0F7E38;
  qword_1ED0F7E38 = (uint64_t)v1;

}

+ (void)schedulePostLaunchBlockForMainThread:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "postLaunchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__FCTaskScheduler_schedulePostLaunchBlockForMainThread___block_invoke;
  block[3] = &unk_1E463B598;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __56__FCTaskScheduler_schedulePostLaunchBlockForMainThread___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

@end
