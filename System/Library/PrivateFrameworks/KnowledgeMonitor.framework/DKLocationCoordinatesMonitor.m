@implementation DKLocationCoordinatesMonitor

void __36___DKLocationCoordinatesMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKLocationCoordinatesMonitor");
  v1 = (void *)log_log_1;
  log_log_1 = (uint64_t)v0;

}

uint64_t __37___DKLocationCoordinatesMonitor_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"), v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDesiredAccuracy:", *MEMORY[0x24BDBFB50]);
}

uint64_t __37___DKLocationCoordinatesMonitor_init__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAndCacheLOIs");
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_INFO, "Cached Routine Home LOI", v10, 2u);
    }

    objc_msgSend(v6, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setHome:", v8);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_cold_1();
  }

}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_INFO, "Cached Routine Work LOI", v10, 2u);
    }

    objc_msgSend(v6, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setWork:", v8);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_18_cold_1();
  }

}

uint64_t __38___DKLocationCoordinatesMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "startUpdatingLocation");
}

void __37___DKLocationCoordinatesMonitor_stop__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "stopUpdatingLocation");
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_219056000, v0, v1, "No Routine Home LOIs: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_219056000, v0, v1, "No Routine Work LOIs: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
