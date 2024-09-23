BOOL appSSO_willHandle(uint64_t a1, uint64_t a2)
{
  if (appSSO_init_onceToken != -1)
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
  return _useAppSSO == 1
      && +[SOAuthorizationCore _canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:](SOAuthorizationCore, "_canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", a1, a2, 0, 0);
}

id SO_LOG_SOConfigurationClient()
{
  if (SO_LOG_SOConfigurationClient_once != -1)
    dispatch_once(&SO_LOG_SOConfigurationClient_once, &__block_literal_global_26);
  return (id)SO_LOG_SOConfigurationClient_log;
}

id SO_LOG_SOConfiguration()
{
  if (SO_LOG_SOConfiguration_once != -1)
    dispatch_once(&SO_LOG_SOConfiguration_once, &__block_literal_global_9);
  return (id)SO_LOG_SOConfiguration_log;
}

id SO_LOG_SOClient()
{
  if (SO_LOG_SOClient_once != -1)
    dispatch_once(&SO_LOG_SOClient_once, &__block_literal_global_89);
  return (id)SO_LOG_SOClient_log;
}

void sub_1CF39D588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SO_LOG_SOServiceConnection()
{
  if (SO_LOG_SOServiceConnection_once != -1)
    dispatch_once(&SO_LOG_SOServiceConnection_once, &__block_literal_global_96);
  return (id)SO_LOG_SOServiceConnection_log;
}

void __appSSO_init_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SOAuthorizationPool *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  if (+[SOUtils isAppSSOServiceAvailable](SOUtils, "isAppSSOServiceAvailable"))
  {
    +[SOUtils currentProcessName](SOUtils, "currentProcessName");
    v0 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_1E8C61368, "containsObject:", v0))
    {
      SO_LOG_SOClientImpl();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        __appSSO_init_block_invoke_cold_1();
LABEL_5:

      _useAppSSO = 1;
      v2 = dispatch_queue_create("com.apple.AppSSO.client-delegate-queue", MEMORY[0x1E0C80D50]);
      v3 = (void *)_delegateQueue;
      _delegateQueue = (uint64_t)v2;

      +[SOErrorHelper silentInternalErrorWithMessage:](SOErrorHelper, "silentInternalErrorWithMessage:", CFSTR("unexpected response from the extension - check type of the extension (redirect/credential)"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)_unexpectedResponseError;
      _unexpectedResponseError = v4;

      +[SOErrorHelper silentInternalErrorWithMessage:](SOErrorHelper, "silentInternalErrorWithMessage:", CFSTR("AppSSO not permitted"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_noAppSSOError;
      _noAppSSOError = v6;

      v8 = objc_alloc_init(SOAuthorizationPool);
      v9 = (void *)_authorizationPool;
      _authorizationPool = (uint64_t)v8;

      return;
    }
    if (objc_msgSend(&unk_1E8C61380, "containsObject:", v0))
    {
      SO_LOG_SOClientImpl();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __appSSO_init_block_invoke_cold_2();
    }
    else
    {
      +[SOUtils currentProcessContainerPath](SOUtils, "currentProcessContainerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (!+[SOUtils currentProcessIsSandboxed](SOUtils, "currentProcessIsSandboxed")
          || +[SOUtils sandboxAllowsXPC:](SOUtils, "sandboxAllowsXPC:", objc_msgSend(CFSTR("com.apple.AppSSO.service-xpc"), "UTF8String")))
        {
          SO_LOG_SOClientImpl();
          v1 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
            __appSSO_init_block_invoke_cold_4();
          goto LABEL_5;
        }
        SO_LOG_SOClientImpl();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __appSSO_init_block_invoke_cold_5();
      }
      else
      {
        SO_LOG_SOClientImpl();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __appSSO_init_block_invoke_cold_3();
      }
    }

  }
  else
  {
    SO_LOG_SOClientImpl();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      __appSSO_init_block_invoke_cold_6();
  }

  _useAppSSO = 0;
}

id SO_LOG_SOClientImpl()
{
  if (SO_LOG_SOClientImpl_once != -1)
    dispatch_once(&SO_LOG_SOClientImpl_once, &__block_literal_global_83);
  return (id)SO_LOG_SOClientImpl_log;
}

void sub_1CF39E090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF39EAF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOConfigurationVersion()
{
  if (SO_LOG_SOConfigurationVersion_once != -1)
    dispatch_once(&SO_LOG_SOConfigurationVersion_once, &__block_literal_global_2);
  return (id)SO_LOG_SOConfigurationVersion_log;
}

id SO_LOG_SOUtils()
{
  if (SO_LOG_SOUtils_once != -1)
    dispatch_once(&SO_LOG_SOUtils_once, &__block_literal_global_63);
  return (id)SO_LOG_SOUtils_log;
}

void sub_1CF39F1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOAuthorizationCore()
{
  if (SO_LOG_SOAuthorizationCore_once != -1)
    dispatch_once(&SO_LOG_SOAuthorizationCore_once, &__block_literal_global_124);
  return (id)SO_LOG_SOAuthorizationCore_log;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id SO_LOG_SOErrorHelper()
{
  if (SO_LOG_SOErrorHelper_once != -1)
    dispatch_once(&SO_LOG_SOErrorHelper_once, &__block_literal_global_0);
  return (id)SO_LOG_SOErrorHelper_log;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1CF3A11EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3A135C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1CF3A2A28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3A2A88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3A2ADC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _isStaticCodeSignedBy(const __SecCode *a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v5;
  void *v6;
  OSStatus v7;
  uint64_t v9;
  CFErrorRef errors;
  SecRequirementRef requirement;

  errors = 0;
  requirement = 0;
  v5 = CFSTR("anchor apple");
  switch(a2)
  {
    case 1:
      break;
    case 2:
      v5 = CFSTR("anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.9] exists");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      v5 = CFSTR("anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.2.6] exists and certificate leaf[field.1.2.840.113635.100.6.1.13] exists");
      break;
    case 8:
      v5 = CFSTR("anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.7] exists");
      break;
    default:
      if (a2 == 16)
      {
        v5 = CFSTR("anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.4] exists");
      }
      else if (a2 == 32)
      {
        v5 = CFSTR("anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.12] exists");
      }
      else
      {
LABEL_6:
        v5 = 0;
      }
      break;
  }
  if (SecRequirementCreateWithStringAndErrors(v5, 0, &errors, &requirement))
  {
    if (!a3)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRequirementCreateWithStringAndErros(%@) failed with %@"), v5, errors);
    goto LABEL_13;
  }
  v7 = SecStaticCodeCheckValidityWithErrors(a1, 0, requirement, &errors);
  if (v7)
  {
    if (v7 == -67050)
      goto LABEL_16;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecStaticCodeCheckValidityWithErrors() failed with %@"), errors, v9);
LABEL_13:
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", v6);
      *(_QWORD *)a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
      a3 = 0;
    }
  }
  else
  {
    a3 = 1;
  }
LABEL_17:
  if (requirement)
    CFRelease(requirement);
  if (errors)
    CFRelease(errors);
  return a3;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_9()
{
  return __error();
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

int *OUTLINED_FUNCTION_11()
{
  return __error();
}

void sub_1CF3A488C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3A4A04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOFullProfile()
{
  if (SO_LOG_SOFullProfile_once != -1)
    dispatch_once(&SO_LOG_SOFullProfile_once, &__block_literal_global_6);
  return (id)SO_LOG_SOFullProfile_log;
}

void sub_1CF3A867C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF3A8EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF3A912C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void appSSO_init()
{
  if (appSSO_init_onceToken != -1)
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
}

BOOL appSSO_willPerform(uint64_t a1, uint64_t a2)
{
  if (appSSO_init_onceToken != -1)
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
  return _useAppSSO == 1
      && +[SOAuthorizationCore _canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:](SOAuthorizationCore, "_canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", a1, a2, 0, 0);
}

void appSSO_performResponse(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  id v11;
  void *v12;
  SOAuthorizationParametersCore *v13;
  SOAuthorizationCore *v14;
  SOAuthorizationResultClientImpl *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = v11;
  if ((_useAppSSO & 1) != 0)
  {
    v13 = objc_alloc_init(SOAuthorizationParametersCore);
    -[SOAuthorizationParametersCore setUrl:](v13, "setUrl:", a1);
    -[SOAuthorizationParametersCore setHttpHeaders:](v13, "setHttpHeaders:", a2);
    -[SOAuthorizationParametersCore setHttpBody:](v13, "setHttpBody:", a3);
    -[SOAuthorizationParametersCore setAuditTokenData:](v13, "setAuditTokenData:", a5);
    -[SOAuthorizationParametersCore setUseInternalExtensions:](v13, "setUseInternalExtensions:", 0);
    -[SOAuthorizationParametersCore setResponseCode:](v13, "setResponseCode:", 0);
    -[SOAuthorizationParametersCore setCfNetworkInterception:](v13, "setCfNetworkInterception:", 1);
    v14 = objc_alloc_init(SOAuthorizationCore);
    v15 = objc_alloc_init(SOAuthorizationResultClientImpl);
    -[SOAuthorizationResultClientImpl setAuthorizationHandleResponseCompletion:](v15, "setAuthorizationHandleResponseCompletion:", v12);
    if ((a4 & 1) != 0)
    {
      v17 = CFSTR("noUserInterface");
      v18[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationCore setAuthorizationOptions:](v14, "setAuthorizationOptions:", v16);

    }
    else
    {
      -[SOAuthorizationCore setAuthorizationOptions:](v14, "setAuthorizationOptions:", MEMORY[0x1E0C9AA70]);
    }
    -[SOAuthorizationCore setEnableUserInteraction:](v14, "setEnableUserInteraction:", (a4 & 2) == 0);
    -[SOAuthorizationCore setDelegate:](v14, "setDelegate:", v15);
    -[SOAuthorizationCore setDelegateDispatchQueue:](v14, "setDelegateDispatchQueue:", _delegateQueue);
    objc_msgSend((id)_authorizationPool, "addAuthorization:delegate:", v14, v15);
    -[SOAuthorizationCore beginAuthorizationWithParameters:](v14, "beginAuthorizationWithParameters:", v13);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, _noAppSSOError);
  }

}

void appSSO_performResponseCredential(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  SOAuthorizationParametersCore *v11;
  void *v12;
  SOAuthorizationCore *v13;
  SOAuthorizationResultClientImpl *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = v9;
  if ((_useAppSSO & 1) != 0)
  {
    v11 = objc_alloc_init(SOAuthorizationParametersCore);
    -[SOAuthorizationParametersCore setUrl:](v11, "setUrl:", a1);
    -[SOAuthorizationParametersCore setHttpHeaders:](v11, "setHttpHeaders:", a2);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOAuthorizationParametersCore setHttpBody:](v11, "setHttpBody:", v12);

    -[SOAuthorizationParametersCore setAuditTokenData:](v11, "setAuditTokenData:", a4);
    -[SOAuthorizationParametersCore setUseInternalExtensions:](v11, "setUseInternalExtensions:", 0);
    -[SOAuthorizationParametersCore setResponseCode:](v11, "setResponseCode:", 401);
    -[SOAuthorizationParametersCore setCfNetworkInterception:](v11, "setCfNetworkInterception:", 1);
    v13 = objc_alloc_init(SOAuthorizationCore);
    v14 = objc_alloc_init(SOAuthorizationResultClientImpl);
    -[SOAuthorizationResultClientImpl setAuthorizationHandleCredentialCompletion:](v14, "setAuthorizationHandleCredentialCompletion:", v10);
    if ((a3 & 1) != 0)
    {
      v16 = CFSTR("noUserInterface");
      v17[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationCore setAuthorizationOptions:](v13, "setAuthorizationOptions:", v15);

    }
    else
    {
      -[SOAuthorizationCore setAuthorizationOptions:](v13, "setAuthorizationOptions:", MEMORY[0x1E0C9AA70]);
    }
    -[SOAuthorizationCore setEnableUserInteraction:](v13, "setEnableUserInteraction:", (a3 & 2) == 0);
    -[SOAuthorizationCore setDelegate:](v13, "setDelegate:", v14);
    -[SOAuthorizationCore setDelegateDispatchQueue:](v13, "setDelegateDispatchQueue:", _delegateQueue);
    objc_msgSend((id)_authorizationPool, "addAuthorization:delegate:", v13, v14);
    -[SOAuthorizationCore beginAuthorizationWithParameters:](v13, "beginAuthorizationWithParameters:", v11);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, _noAppSSOError);
  }

}

void appSSO_handleResponse(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  id v11;
  void *v12;
  SOAuthorizationParametersCore *v13;
  SOAuthorizationCore *v14;
  SOAuthorizationResultClientImpl *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = v11;
  if ((_useAppSSO & 1) != 0)
  {
    v13 = objc_alloc_init(SOAuthorizationParametersCore);
    -[SOAuthorizationParametersCore setUrl:](v13, "setUrl:", a1);
    -[SOAuthorizationParametersCore setHttpHeaders:](v13, "setHttpHeaders:", a2);
    -[SOAuthorizationParametersCore setHttpBody:](v13, "setHttpBody:", a3);
    -[SOAuthorizationParametersCore setAuditTokenData:](v13, "setAuditTokenData:", a5);
    -[SOAuthorizationParametersCore setUseInternalExtensions:](v13, "setUseInternalExtensions:", 0);
    -[SOAuthorizationParametersCore setResponseCode:](v13, "setResponseCode:", 0);
    -[SOAuthorizationParametersCore setCfNetworkInterception:](v13, "setCfNetworkInterception:", 1);
    v14 = objc_alloc_init(SOAuthorizationCore);
    v15 = objc_alloc_init(SOAuthorizationResultClientImpl);
    -[SOAuthorizationResultClientImpl setAuthorizationHandleResponseCompletion:](v15, "setAuthorizationHandleResponseCompletion:", v12);
    if ((a4 & 1) != 0)
    {
      v17 = CFSTR("noUserInterface");
      v18[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationCore setAuthorizationOptions:](v14, "setAuthorizationOptions:", v16);

    }
    else
    {
      -[SOAuthorizationCore setAuthorizationOptions:](v14, "setAuthorizationOptions:", MEMORY[0x1E0C9AA70]);
    }
    -[SOAuthorizationCore setEnableUserInteraction:](v14, "setEnableUserInteraction:", (a4 & 2) == 0);
    -[SOAuthorizationCore setDelegate:](v14, "setDelegate:", v15);
    -[SOAuthorizationCore setDelegateDispatchQueue:](v14, "setDelegateDispatchQueue:", _delegateQueue);
    objc_msgSend((id)_authorizationPool, "addAuthorization:delegate:", v14, v15);
    -[SOAuthorizationCore beginAuthorizationWithParameters:](v14, "beginAuthorizationWithParameters:", v13);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, _noAppSSOError);
  }

}

void appSSO_handleResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
  appSSO_handleResponseImpersonationCredential(a1, a2, a3, a4, a5, a6, 0, a7);
}

void appSSO_handleResponseImpersonationCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  id v18;
  SOAuthorizationParametersCore *v19;
  void *v20;
  SOAuthorizationCore *v21;
  SOAuthorizationResultClientImpl *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a8;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if ((_useAppSSO & 1) != 0)
  {
    if (a4 < 3)
    {
      v19 = objc_alloc_init(SOAuthorizationParametersCore);
      -[SOAuthorizationParametersCore setUrl:](v19, "setUrl:", a1);
      -[SOAuthorizationParametersCore setHttpHeaders:](v19, "setHttpHeaders:", a2);
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationParametersCore setHttpBody:](v19, "setHttpBody:", v20);

      -[SOAuthorizationParametersCore setAuditTokenData:](v19, "setAuditTokenData:", a6);
      -[SOAuthorizationParametersCore setUseInternalExtensions:](v19, "setUseInternalExtensions:", 0);
      -[SOAuthorizationParametersCore setResponseCode:](v19, "setResponseCode:", a3);
      -[SOAuthorizationParametersCore setCfNetworkInterception:](v19, "setCfNetworkInterception:", 1);
      -[SOAuthorizationParametersCore setImpersonationBundleIdentifier:](v19, "setImpersonationBundleIdentifier:", a7);
      v21 = objc_alloc_init(SOAuthorizationCore);
      v22 = objc_alloc_init(SOAuthorizationResultClientImpl);
      -[SOAuthorizationResultClientImpl setAuthorizationHandleCredentialCompletion:](v22, "setAuthorizationHandleCredentialCompletion:", v16);
      if ((a5 & 1) != 0)
      {
        v24 = CFSTR("noUserInterface");
        v25[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationCore setAuthorizationOptions:](v21, "setAuthorizationOptions:", v23);

      }
      else
      {
        -[SOAuthorizationCore setAuthorizationOptions:](v21, "setAuthorizationOptions:", MEMORY[0x1E0C9AA70]);
      }
      -[SOAuthorizationCore setEnableUserInteraction:](v21, "setEnableUserInteraction:", (a5 & 2) == 0);
      -[SOAuthorizationCore setDelegate:](v21, "setDelegate:", v22);
      -[SOAuthorizationCore setDelegateDispatchQueue:](v21, "setDelegateDispatchQueue:", _delegateQueue);
      objc_msgSend((id)_authorizationPool, "addAuthorization:delegate:", v21, v22);
      -[SOAuthorizationCore beginAuthorizationWithParameters:](v21, "beginAuthorizationWithParameters:", v19);

    }
    else
    {
      SO_LOG_SOClientImpl();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        appSSO_handleResponseImpersonationCredential_cold_1(v17);

      if (v16)
      {
        v18 = +[SOErrorHelper errorWithCode:](SOErrorHelper, "errorWithCode:", -1);
LABEL_9:
        ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, 0, v18);
      }
    }
  }
  else if (v15)
  {
    v18 = (id)_noAppSSOError;
    goto LABEL_9;
  }

}

void __appSSO_init_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "is using AppSSO (allowList)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __appSSO_init_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "not using AppSSO (denyList)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __appSSO_init_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "not using AppSSO (no app container)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __appSSO_init_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "is using AppSSO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __appSSO_init_block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "not using AppSSO (sandbox)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __appSSO_init_block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "not using AppSSO (service not available)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void appSSO_handleResponseImpersonationCredential_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 3;
  _os_log_error_impl(&dword_1CF39B000, log, OS_LOG_TYPE_ERROR, "Authorization retry limit (%d) exceeded.", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1_0();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1E0CD61F0](code, *(_QWORD *)&flags, information);
}

OSStatus SecRequirementCreateWithStringAndErrors(CFStringRef text, SecCSFlags flags, CFErrorRef *errors, SecRequirementRef *requirement)
{
  return MEMORY[0x1E0CD65B0](text, *(_QWORD *)&flags, errors, requirement);
}

OSStatus SecStaticCodeCheckValidityWithErrors(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement, CFErrorRef *errors)
{
  return MEMORY[0x1E0CD65C8](staticCode, *(_QWORD *)&flags, requirement, errors);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1E0CD65D0](path, *(_QWORD *)&flags, staticCode);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1E0CD65E8]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C85190]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

