@implementation StartVPWirelessChargingMatStateListener

uint64_t __StartVPWirelessChargingMatStateListener_block_invoke()
{
  CFDictionaryRef v0;
  CFDictionaryRef v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = IOPSCopyExternalPowerAdapterDetails();
  v1 = v0;
  if (v0)
  {
    -[__CFDictionary objectForKey:](v0, "objectForKey:", CFSTR("IsWireless"));
    v2 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject BOOLValue](v2, "BOOLValue"))
    {
      if (VPLogScope(void)::once != -1)
        dispatch_once(&VPLogScope(void)::once, &__block_literal_global_19930);
      if (VPLogScope(void)::scope)
      {
        v3 = *(id *)VPLogScope(void)::scope;
        if (!v3)
        {
LABEL_22:
          v4 = 1;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        v3 = MEMORY[0x1E0C81028];
        v6 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v8 = 136315394;
        v9 = "vpWirelessCharging.mm";
        v10 = 1024;
        v11 = 55;
        _os_log_impl(&dword_1B5ED0000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d wireless charging mat is attached", (uint8_t *)&v8, 0x12u);
      }

      goto LABEL_22;
    }

  }
  if (VPLogScope(void)::once != -1)
    dispatch_once(&VPLogScope(void)::once, &__block_literal_global_19930);
  if (!VPLogScope(void)::scope)
  {
    v2 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  v2 = *(id *)VPLogScope(void)::scope;
  if (v2)
  {
LABEL_15:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "vpWirelessCharging.mm";
      v10 = 1024;
      v11 = 60;
      _os_log_impl(&dword_1B5ED0000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d wireless charging mat is not attached", (uint8_t *)&v8, 0x12u);
    }
    v4 = 0;
    goto LABEL_23;
  }
  v4 = 0;
LABEL_24:

  return v4;
}

uint64_t __StartVPWirelessChargingMatStateListener_block_invoke_6(uint64_t result, int a2)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gNotifyToken == a2)
  {
    v2 = result;
    if (VPLogScope(void)::once != -1)
      dispatch_once(&VPLogScope(void)::once, &__block_literal_global_19930);
    if (VPLogScope(void)::scope)
    {
      v3 = *(id *)VPLogScope(void)::scope;
      if (!v3)
      {
LABEL_11:
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
        atomic_store(result, gWirelessChargingMatIsAttached);
        return result;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315394;
      v6 = "vpWirelessCharging.mm";
      v7 = 1024;
      v8 = 68;
      _os_log_impl(&dword_1B5ED0000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d wireless charging mat state changed", (uint8_t *)&v5, 0x12u);
    }

    goto LABEL_11;
  }
  return result;
}

@end
