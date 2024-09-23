@implementation GEOSystemMonitorPowerNotification

void ___GEOSystemMonitorPowerNotification_block_invoke(uint64_t a1, int a2)
{
  intptr_t v3;
  IOReturn v4;
  IOReturn v5;
  NSObject *v6;
  const char *v7;
  IOReturn v8;
  IOReturn v9;
  int v10;
  IOReturn v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v4 = IOAllowPowerChange(_rootPort, v3);
    if (!v4)
      return;
    v5 = v4;
    GEOGetSystemMonitorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v10 = 67240192;
    v11 = v5;
    v7 = "IOAllowPowerChange failed: %{public}d";
    goto LABEL_8;
  }
  v8 = IOCancelPowerChange(_rootPort, v3);
  if (!v8)
    return;
  v9 = v8;
  GEOGetSystemMonitorLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 67240192;
    v11 = v9;
    v7 = "IOCancelPowerChange failed: %{public}d";
LABEL_8:
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, 8u);
  }
LABEL_9:

}

void ___GEOSystemMonitorPowerNotification_block_invoke_119(uint64_t a1)
{
  IOReturn v1;
  IOReturn v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = IOAllowPowerChange(_rootPort, *(_QWORD *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    GEOGetSystemMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4[0] = 67240192;
      v4[1] = v2;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_FAULT, "IOAllowPowerChange failed: %{public}d", (uint8_t *)v4, 8u);
    }

  }
}

@end
