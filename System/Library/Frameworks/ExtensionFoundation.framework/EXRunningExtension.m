@implementation EXRunningExtension

void __37___EXRunningExtension_sharedInstance__block_invoke()
{
  char *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _EXRunningLibXPCServiceExtension *v7;
  SEL v8;

  v0 = getenv("EXTENSION_KIT_EXTENSION_TYPE");
  v1 = v0;
  if (v0)
  {
    switch(atoi(v0))
    {
      case 1:
      case 8:
        break;
      case 2:
      case 4:
      case 6:
        get_EXRunningUIViewServiceExtensionClass();
        break;
      case 3:
      case 5:
        get_EXRunningUIKitSceneHostedExtensionClass();
        break;
      case 7:
        get_EXRunningUISceneExtensionClass();
        break;
      default:
        goto LABEL_9;
    }
    v2 = objc_opt_new();
    v3 = (void *)sharedInstance_runningExtension;
    sharedInstance_runningExtension = v2;

    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_3(v1, v4);

  }
  else
  {
LABEL_9:
    _EXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_2();

    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_1();

    v7 = (_EXRunningLibXPCServiceExtension *)abort_with_reason();
    -[_EXRunningLibXPCServiceExtension init](v7, v8);
  }
}

void __65___EXRunningExtension_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setActivateOnResume");
  objc_msgSend(v2, "setFaultOnSuspend");

}

void __41___EXRunningExtension_entryPointFunction__block_invoke()
{
  const mach_header_64 *prog_image_header;
  uint8_t *v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t size;

  size = 0;
  prog_image_header = (const mach_header_64 *)_dyld_get_prog_image_header();
  if (!prog_image_header)
  {
    _EXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_3();

    goto LABEL_9;
  }
  v1 = getsectiondata(prog_image_header, "__TEXT", "__swift5_entry", &size);
  if (!v1 || size <= 3)
  {
LABEL_9:
    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2();

    goto LABEL_12;
  }
  v2 = *(int *)v1;
  if ((_DWORD)v2)
  {
    entryPointFunction_mainFunction = (uint64_t)&v1[v2];
    return;
  }
LABEL_12:
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1();

}

void __29___EXRunningExtension_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("XPCService"));
  objc_msgSend(v3, "setService:", CFSTR("MainService"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setDelegate:", WeakRetained);

}

uint64_t __29___EXRunningExtension_resume__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  uint8_t v7[16];

  _EXSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "signpost") && os_signpost_enabled(v2))
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "signpost");
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v3, OS_SIGNPOST_EVENT, v5, "extensionkit-lifecycle", "Runloop started", v7, 2u);
      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "didFinishLaunching");
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_190C25000, v0, v1, "%s - %s:%d: Unrecognized extension type: '%{public}s'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_190C25000, v0, OS_LOG_TYPE_FAULT, "Unrecognized extension type: '%{public}s'", v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_3(const char *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = atoi(a1);
  _os_log_debug_impl(&dword_190C25000, a2, OS_LOG_TYPE_DEBUG, "Extension Type: %u", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_6();
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "SwiftUI: Swift entry point address could not be determined.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "SwiftUI: Swift entry point data not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_190C25000, v0, v1, "SwiftUI: Swift entry point section not found in the current image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
