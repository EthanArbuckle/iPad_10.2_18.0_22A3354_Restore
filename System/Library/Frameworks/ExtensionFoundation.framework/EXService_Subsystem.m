@implementation EXService_Subsystem

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EXService_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, block);
  return (id)sharedInstance___instance_0;
}

+ (id)initForPlugInKit
{
  NSObject *v2;
  uint8_t v4[16];

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "Initializing 'EXService_Subsystem'", v4, 2u);
  }

  +[EXService_Subsystem sharedInstance](EXService_Subsystem, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v16;
  EXService_Subsystem *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _EXLegacyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_190C25000, v8, OS_LOG_TYPE_DEFAULT, "Begin using %{public}@ for bundle %{public}@", (uint8_t *)&v16, 0x16u);
  }

  +[_EXRunningExtensionInfo extensionInfoForCurrentProcess](_EXRunningExtensionInfo, "extensionInfoForCurrentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[EXService_Subsystem beginUsing:withBundle:].cold.1(v15);

    __break(1u);
  }
  v10 = v9;
  objc_msgSend(v9, "runLoopType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("NSRunLoop"));

  _EXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v12)
  {
    if (v14)
      -[EXService_Subsystem beginUsing:withBundle:].cold.2(v13);
  }
  else if (v14)
  {
    -[EXService_Subsystem beginUsing:withBundle:].cold.3(v10, v13);
  }

  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening:", v12);
}

- (void)beginUsing:(os_log_t)log withBundle:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = "info";
  v3 = 2080;
  v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/PK Subsystems/EX"
       "Service_Subsystem.m";
  v5 = 1024;
  v6 = 36;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to get extension info  for current process", (uint8_t *)&v1, 0x1Cu);
}

- (void)beginUsing:(os_log_t)log withBundle:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_190C25000, log, OS_LOG_TYPE_DEBUG, "NSRunLoop type detected. Start listening with imediate launchd checkin.", v1, 2u);
}

- (void)beginUsing:(void *)a1 withBundle:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "runLoopType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_190C25000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ (non-NSRunLoop) type detected. Start listening with delayed launchd checkin.", (uint8_t *)&v4, 0xCu);

}

@end
