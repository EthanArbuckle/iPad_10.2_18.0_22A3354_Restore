@implementation CNBlockFutureImpl

uint64_t __43___CNBlockFutureImpl_implicitlyResumeQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "workBlockScheduled");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "nts_mayResumeQueue");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __33___CNBlockFutureImpl_resumeQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_resumeQueue");
}

void __38___CNBlockFutureImpl_addFailureBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "futureResult");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject result](v4, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      -[NSObject error](v4, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    +[_CNBlockFutureImpl log](_CNBlockFutureImpl, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __38___CNBlockFutureImpl_addFailureBlock___block_invoke_cold_1();
  }

}

void __38___CNBlockFutureImpl_addSuccessBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "futureResult");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject result](v4, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      -[NSObject result](v4, "result");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    +[_CNBlockFutureImpl log](_CNBlockFutureImpl, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __38___CNBlockFutureImpl_addSuccessBlock___block_invoke_cold_1();
  }

}

void __37___CNBlockFutureImpl_addWriterBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    +[_CNBlockFutureImpl log](_CNBlockFutureImpl, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_cold_1();
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "lockWhenCondition:beforeDate:", 1, *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v3, "futureResultFromImmediateLookup");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v3, "stateLock");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject unlock](v8, "unlock");
LABEL_6:

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __25___CNBlockFutureImpl_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "futures");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

void __54___CNBlockFutureImpl_implWithSchedulerProvider_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v4);

}

void __58___CNBlockFutureImpl_lazyImplWithSchedulerProvider_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "finishWithResult:error:", v3, v4);

}

uint64_t __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, v0, v1, "The result cannot be looked up because the future has deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __38___CNBlockFutureImpl_addSuccessBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, v0, v1, "A success block was registered and might have run, depending on the result, but the result is not available because the future has deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __38___CNBlockFutureImpl_addFailureBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, v0, v1, "A failure block was registered and might have run, depending on the result, but the result is not available because the future has deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
