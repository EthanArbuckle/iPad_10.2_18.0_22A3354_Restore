@implementation KSRequestThrottle

float __26___KSRequestThrottle_init__block_invoke(uint64_t a1, char a2)
{
  return (float)(1 << a2);
}

_DWORD *__34___KSRequestThrottle_postRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _DWORD *result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  result = *(_DWORD **)(a1 + 32);
  if (!result[8])
    return (_DWORD *)objc_msgSend(result, "_launch");
  return result;
}

void __29___KSRequestThrottle__launch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29___KSRequestThrottle__launch__block_invoke_2;
    v8[3] = &unk_24E2058F0;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
  }

}

void __29___KSRequestThrottle__launch__block_invoke_2(uint64_t a1)
{
  id *v2;
  char *WeakRetained;
  id v4;
  _DWORD *v5;
  float v6;
  double v7;
  float v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v18;

  v2 = (id *)(a1 + 40);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_25;
  v5 = WeakRetained + 32;
  v6 = (*(float (**)(void))(*((_QWORD *)WeakRetained + 1) + 16))();
  v7 = *((double *)v4 + 2);
  if (v7 <= v6)
    v8 = v7;
  else
    v8 = v6;
  v9 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v10 = *(_QWORD *)(a1 + 32);
  if (!v10 && *((double *)v4 + 2) <= v8)
  {
    if (!*((_QWORD *)v4 + 6))
    {
LABEL_24:
      *((_DWORD *)v4 + 8) = 0;
      v16 = (void *)*((_QWORD *)v4 + 3);
      *((_QWORD *)v4 + 3) = 0;

      goto LABEL_25;
    }
    KSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __29___KSRequestThrottle__launch__block_invoke_2_cold_3();

    v10 = *(_QWORD *)(a1 + 32);
LABEL_18:
    if (v10 && *v5 && *((_QWORD *)v4 + 6))
    {
      KSCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __29___KSRequestThrottle__launch__block_invoke_2_cold_1((uint64_t *)v4 + 6, (int *)v4 + 8, v15);

    }
    goto LABEL_24;
  }
  if (v9)
    goto LABEL_18;
  if (*((_QWORD *)v4 + 6) && (*(_BYTE *)v5 & 0x7F) == 0)
  {
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __29___KSRequestThrottle__launch__block_invoke_2_cold_2();

  }
  v12 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
  objc_msgSend(v4, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29___KSRequestThrottle__launch__block_invoke_16;
  block[3] = &unk_24E2057C0;
  objc_copyWeak(&v18, v2);
  dispatch_after(v12, v13, block);

  objc_destroyWeak(&v18);
LABEL_25:

}

void __29___KSRequestThrottle__launch__block_invoke_16(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_launch");

}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_1(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 136315650;
  v6 = "-[_KSRequestThrottle _launch]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  Throttle(%@): success after %i tries", (uint8_t *)&v5, 0x1Cu);
}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Throttle(%@): 128 attempts counted", v2, v3, v4, v5, 2u);
}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Throttle(%@): giving up", v2, v3, v4, v5, 2u);
}

@end
