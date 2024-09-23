@implementation EXHostSessionDriver

void __51___EXHostSessionDriver_initWithHostViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51___EXHostSessionDriver_initWithHostViewController___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(WeakRetained, "invalidateDeactivatingSessions");
}

void __49___EXHostSessionDriver_hostSessionDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "retryProcessConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "retrySessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    if (v2)
      v4 = v3 == 0;
    else
      v4 = 1;
    if (!v4)
      objc_msgSend(*(id *)(a1 + 32), "startSessionWithProcessConfiguration:configuration:", v2, v3);
  }

}

void __51___EXHostSessionDriver_initWithHostViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0();
}

@end
