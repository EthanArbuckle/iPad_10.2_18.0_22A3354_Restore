@implementation EXSwiftUI_Subsystem

+ (BOOL)initialized
{
  return __instance != 0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EXSwiftUI_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)__instance;
}

+ (id)initForPlugInKit
{
  return +[EXSwiftUI_Subsystem sharedInstance](EXSwiftUI_Subsystem, "sharedInstance");
}

- (EXSwiftUI_Subsystem)init
{
  EXSwiftUI_Subsystem *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const mach_header_64 *prog_image_header;
  uint8_t *v11;
  uint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  char ***v26;
  uint64_t v27;
  char **v28;
  NSObject *v29;
  objc_super v31;
  unint64_t size;

  v31.receiver = self;
  v31.super_class = (Class)EXSwiftUI_Subsystem;
  v2 = -[EXSwiftUI_Subsystem init](&v31, sel_init);
  if (!v2)
    return v2;
  _EXLegacyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[EXSwiftUI_Subsystem init].cold.8((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  size = 0;
  prog_image_header = (const mach_header_64 *)_dyld_get_prog_image_header();
  if (!prog_image_header)
  {
    _EXLegacyLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[EXSwiftUI_Subsystem init].cold.7();

    goto LABEL_13;
  }
  v11 = getsectiondata(prog_image_header, "__TEXT", "__swift5_entry", &size);
  if (!v11 || size <= 3)
  {
LABEL_13:
    _EXLegacyLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2();

    goto LABEL_16;
  }
  v12 = *(int *)v11;
  if ((_DWORD)v12)
  {
    v13 = &v11[v12];
    if (&v11[v12])
      goto LABEL_22;
    goto LABEL_19;
  }
LABEL_16:
  _EXLegacyLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1();

LABEL_19:
  _EXLegacyLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[EXSwiftUI_Subsystem init].cold.4();

  v13 = (uint8_t *)dlsym((void *)0xFFFFFFFFFFFFFFFBLL, "main");
  if (!v13)
  {
    _EXLegacyLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[EXSwiftUI_Subsystem init].cold.1();
    goto LABEL_34;
  }
LABEL_22:
  _EXLegacyLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[EXSwiftUI_Subsystem init].cold.3((uint64_t)v13, v18, v19, v20, v21, v22, v23, v24);

  v25 = _NSGetArgc();
  v26 = _NSGetArgv();
  if (v25)
  {
    v27 = *v25;
    if (v26)
    {
LABEL_26:
      v28 = *v26;
      goto LABEL_31;
    }
  }
  else
  {
    v27 = 0;
    if (v26)
      goto LABEL_26;
  }
  v28 = 0;
LABEL_31:
  if (((unsigned int (*)(uint64_t, char **))v13)(v27, v28) == 1)
  {
    _EXLegacyLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[EXSwiftUI_Subsystem init].cold.2();
LABEL_34:

  }
  return v2;
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  EXSwiftUI_Subsystem *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _EXLegacyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_190C25000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - Begin using bunde %@ with personality: %@ personality.", (uint8_t *)&v9, 0x20u);
  }

  +[EXConcreteExtensionContextVendor _startListening](EXConcreteExtensionContextVendor, "_startListening");
}

- (void)init
{
  OUTLINED_FUNCTION_13(&dword_190C25000, a2, a3, "Initializing %{public}@.", a5, a6, a7, a8, 2u);
}

@end
