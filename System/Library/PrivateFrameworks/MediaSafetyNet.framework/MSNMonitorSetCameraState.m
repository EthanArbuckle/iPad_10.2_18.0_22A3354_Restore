@implementation MSNMonitorSetCameraState

void __MSNMonitorSetCameraState_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;

  switch(g_cameraState)
  {
    case 1:
      if (!*(_BYTE *)(a1 + 32))
        MSNMonitorStoppingCamera();
      break;
    case 2:
      if (*(_BYTE *)(a1 + 32))
        MSNMonitorStartingCamera();
      break;
    case 3:
      MSNLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __MSNMonitorSetCameraState_block_invoke_cold_1();

      return;
  }
  if (*(_BYTE *)(a1 + 32))
    v3 = 1;
  else
    v3 = 2;
  g_cameraState = v3;
}

void __MSNMonitorSetCameraState_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D416F000, v0, v1, "Camera status should not be set when cam process is broken out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
