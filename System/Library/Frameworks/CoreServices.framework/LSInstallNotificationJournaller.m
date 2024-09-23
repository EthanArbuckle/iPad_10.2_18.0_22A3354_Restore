@implementation LSInstallNotificationJournaller

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint8_t buf[16];
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v16 = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = _LSContextInit(&v16);
    if (v7)
    {
      _LSInstallLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2(v7, v8);

    }
    else
    {
      v15 = 0;
      v14 = 0;
      v10 = *(unsigned __int8 *)(a1 + 48) << 10;
      v11 = *(void **)(a1 + 32);
      *(_OWORD *)buf = kLSVersionNumberNull;
      v18 = *(_OWORD *)algn_1829FAD90;
      if (!_LSBundleFindWithInfo((uint64_t)&v16, 0, v11, 0, buf, 2, v10, &v15, &v14))
      {
        _LSInstallLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_INFO, "Found registered application for journal entry: %@", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    _LSInstallLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1(v9);

  }
}

uint64_t __71___LSInstallNotificationJournaller_removeJournalAfterNotificationFence__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeJournalFile");
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Attempting to lookup application with nil bundle identifier", v1, 2u);
  OUTLINED_FUNCTION_33();
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "couldn't connect to database: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_33();
}

@end
