@implementation ProcessCanAccessUM

void ___ProcessCanAccessUM_block_invoke()
{
  int v0;
  id v1;
  int v2;
  id v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  id v29;
  id v30;
  _BYTE error[12];
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v0 = _ClientProcessLookupMachPortName((uint64_t)"com.apple.mobile.usermanagerd.xpc", &v30);
  v1 = v30;
  v29 = 0;
  v2 = _ClientProcessLookupMachPortName((uint64_t)"com.apple.mobile.keybagd.UserManager.xpc", &v29);
  v3 = v29;
  *(_QWORD *)error = 0;
  v4 = SecTaskCreateFromSelf(0);
  if (!v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      ___ProcessCanAccessUM_block_invoke_cold_1();

    _CreateError((uint64_t)"_ProcessHasUMEntitlement", 272, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement"), v12, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = v4;
  v6 = (void *)SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.usermanagerd.persona.fetch"), (CFErrorRef *)error);
  if (!v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      ___ProcessCanAccessUM_block_invoke_cold_2((void **)error);

    v15 = *(void **)error;
    _CreateError((uint64_t)"_ProcessHasUMEntitlement", 278, CFSTR("IXErrorDomain"), 1uLL, *(void **)error, 0, CFSTR("SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process."), v16, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v5);
LABEL_14:
    v9 = objc_retainAutorelease(v13);

    v10 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  v8 = IXBooleanValue(v6, 0);

  if (v8)
  {
    CFRelease(v5);
    v9 = 0;
    v10 = 1;
    goto LABEL_15;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    ___ProcessCanAccessUM_block_invoke_cold_3();

  v10 = 1;
  _CreateError((uint64_t)"_ProcessHasUMEntitlement", 284, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\"."), v18, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v5);
  v13 = 0;
  v9 = 0;
  if (!v19)
    goto LABEL_14;
LABEL_15:
  v20 = v9;
  if (v0)
  {
    _ProcessCanAccessUM_canQueryUM = v2 & v10;
    if ((v2 & v10 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    _ProcessCanAccessUM_canQueryUM = 0;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)error = 136316930;
    *(_QWORD *)&error[4] = "_ProcessCanAccessUM_block_invoke";
    v32 = 1024;
    if (v0)
      v22 = 89;
    else
      v22 = 78;
    v33 = v22;
    if (v2)
      v26 = 89;
    else
      v26 = 78;
    v34 = 1024;
    if (v10)
      v27 = 89;
    else
      v27 = 78;
    v35 = v26;
    v36 = 1024;
    v37 = v27;
    v38 = 2112;
    v39 = v1;
    v40 = 2112;
    v41 = v3;
    v42 = 2112;
    v43 = v20;
    v44 = 2112;
    v45 = 0;
    _os_log_error_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_ERROR, "%s: This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@) : %@", error, 0x46u);
  }
  else if (v0)
  {
    v22 = 89;
  }
  else
  {
    v22 = 78;
  }

  _CreateError((uint64_t)"_ProcessCanAccessUM_block_invoke", 344, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@)"), v23, v22);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)_ProcessCanAccessUM_error;
  _ProcessCanAccessUM_error = v24;

LABEL_24:
}

void ___ProcessCanAccessUM_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void ___ProcessCanAccessUM_block_invoke_cold_2(void **a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v2, v3, "%s: SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process. : %@", v4, v5, v6, v7, 2u);

}

void ___ProcessCanAccessUM_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\". : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
