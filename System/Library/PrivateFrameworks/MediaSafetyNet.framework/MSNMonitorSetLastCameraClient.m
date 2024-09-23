@implementation MSNMonitorSetLastCameraClient

void __MSNMonitorSetLastCameraClient_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    free((void *)g_cameraClient);
    g_cameraClient = (uint64_t)strdup(*(const char **)(a1 + 32));
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __MSNMonitorSetLastCameraClient_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __MSNMonitorSetLastCameraClient_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1D416F000, a1, a3, "Last camera client: %s", a5, a6, a7, a8, 2u);
}

@end
