@implementation DESBitacoraEventManager

+ (void)initialize
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "LighthouseBitacoraFramework.framework is not loaded.", v1, 2u);
}

+ (BOOL)allowEventForBundleID:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (allowEventForBundleID__onceToken_0 != -1)
  {
    dispatch_once(&allowEventForBundleID__onceToken_0, &__block_literal_global_7);
    if (v4)
      goto LABEL_3;
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)allowEventForBundleID__disalllowedBundles_0, "containsObject:", v4) ^ 1;
LABEL_6:

  return v5;
}

void __49__DESBitacoraEventManager_allowEventForBundleID___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.dodml.TestPlugin");
  v4[1] = CFSTR("com.apple.MLRuntime.ExtensionXCTestHigh");
  v4[2] = CFSTR("com.apple.MLRuntime.ExtensionXCTestOnDemand");
  v4[3] = CFSTR("com.apple.MLRuntime.ExtensionXCTestRestricted");
  v4[4] = CFSTR("com.apple.MLRuntime.XCTest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowEventForBundleID__disalllowedBundles_0;
  allowEventForBundleID__disalllowedBundles_0 = v2;

}

+ (void)_sendBitacoraEventForEvent:(id)a3 identifiers:(id)a4
{
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  v4 = objc_msgSend((id)bitacoraManager, "addMLRuntimedEvent:identifiers:error:", a3, a4, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DESBitacoraEventManager _sendBitacoraEventForEvent:identifiers:].cold.1((uint64_t)v5, v6);

  }
}

+ (void)_sendBitacoraEventForBundleID:(id)a3 event:(id)a4 identifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(a1, "allowEventForBundleID:", v8) & 1) != 0)
  {
    objc_msgSend(a1, "_sendBitacoraEventForEvent:identifiers:", v9, v10);
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[DESBitacoraEventManager _sendBitacoraEventForBundleID:event:identifiers:].cold.1((uint64_t)v8, v11);

  }
}

+ (void)sendEventActivityScheduled
{
  id v3;

  if (objc_opt_class())
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43800]), "initWithScheduleStatus:", 1);
    objc_msgSend(a1, "_sendBitacoraEventForEvent:identifiers:", v3, 0);

  }
}

+ (void)sendEventTaskFetchedForBundleID:(id)a3 identifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_opt_class())
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43800]), "initWithTaskFetched:error:", 1, 0);
    objc_msgSend(a1, "_sendBitacoraEventForBundleID:event:identifiers:", v8, v7, v6);

  }
}

+ (void)sendEventTaskSchedulingSucceededForBundleID:(id)a3 identifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_opt_class())
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43800]), "initWithTaskScheduled:error:", 1, 0);
    objc_msgSend(a1, "_sendBitacoraEventForBundleID:event:identifiers:", v8, v7, v6);

  }
}

+ (void)sendEventTaskSchedulingFailedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_opt_class())
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43800]), "initWithTaskScheduled:error:", 0, v9);
    objc_msgSend(a1, "_sendBitacoraEventForBundleID:event:identifiers:", v11, v10, v8);

  }
}

+ (void)sendEventTaskCompletedForBundleID:(id)a3 identifiers:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_opt_class())
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43800]), "initWithTaskCompleted:error:", v9 == 0, v9);
    objc_msgSend(a1, "_sendBitacoraEventForBundleID:event:identifiers:", v11, v10, v8);

  }
}

+ (void)_sendBitacoraEventForEvent:(uint64_t)a1 identifiers:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "Failed to send Bitacora event: addMLRuntimedEvent with error=%@", (uint8_t *)&v2, 0xCu);
}

+ (void)_sendBitacoraEventForBundleID:(uint64_t)a1 event:(NSObject *)a2 identifiers:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_DEBUG, "Telemetry is prohibited for plugin: %@", (uint8_t *)&v2, 0xCu);
}

@end
