@implementation SGNotUserInitiated

void __SGNotUserInitiated_block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeDependency:", v3);

  waitGroup();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v4);

}

void __SGNotUserInitiated_block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;
  NSObject *v4;

  pthread_mutex_lock(&SGNotUserInitiated_queueCacheLock);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v2 == WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  pthread_mutex_unlock(&SGNotUserInitiated_queueCacheLock);
  waitGroup();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v4);

}

void __SGNotUserInitiated_block_invoke_5()
{
  NSObject *v0;

  waitGroup();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v0);

}

void __SGNotUserInitiated_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)SGNotUserInitiated__pasExprOnceResult_1;
  SGNotUserInitiated__pasExprOnceResult_1 = v1;

  objc_autoreleasePoolPop(v0);
}

void __SGNotUserInitiated_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)SGNotUserInitiated__pasExprOnceResult;
  SGNotUserInitiated__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
