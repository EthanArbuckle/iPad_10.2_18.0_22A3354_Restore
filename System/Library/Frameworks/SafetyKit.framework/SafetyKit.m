void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_23457C340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

id sa_default_log()
{
  if (sa_default_log_onceToken != -1)
    dispatch_once(&sa_default_log_onceToken, &__block_literal_global_3);
  return (id)sa_default_log___logger;
}

void sub_23457CAA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23457CFDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id SAServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256168B68);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_dialVoiceCallToPhoneNumber_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_dialVoiceCallToPhoneNumber_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestCrashDetectionAuthorization_, 1, 1);

  return v0;
}

id SAClientInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256167BE0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_updateMostRecentCrashDetectionEvent_, 0, 0);

  return v0;
}

void sub_23457E34C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23457E3F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23457E524(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23457EA10(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_23457F494(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_23458141C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23458160C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234582024(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234582398(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234582BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234582CFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __sa_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SafetyKit", "default");
  v1 = (void *)sa_default_log___logger;
  sa_default_log___logger = (uint64_t)v0;

}

void authorizationPromptResponseHandler(const void *a1, char a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  NSObject *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  BOOL v39;
  NSObject *v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  uint64_t v43;
  void *v44;
  int v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  +[SAAuthorizationInFlight sharedInstance](SAAuthorizationInFlight, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isInFlight") & 1) != 0)
  {
    if ((unint64_t)(a2 & 3) - 2 < 2)
    {
      sa_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        authorizationPromptResponseHandler_cold_5(v5, v6, v7, v8, v9, v10, v11, v12);

      objc_msgSend(v4, "completionHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "preflightAuthorizationStatus");
      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v13)[2](v13, v14, v15);

      objc_msgSend(v4, "reset");
      goto LABEL_39;
    }
    if ((a2 & 3) != 0)
    {
      sa_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "toBundleId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 136315394;
        v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
        v47 = 2112;
        v48 = v36;
        _os_log_impl(&dword_23457A000, v35, OS_LOG_TYPE_DEFAULT, "%s - Authorization not granted, denying permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);

      }
      objc_msgSend(v4, "completionHandler");
      v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v37[2](v37, 1, 0);

      objc_msgSend(v4, "reset");
      goto LABEL_33;
    }
    objc_msgSend(v4, "fromApp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_14;
    sa_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v45 = 136315394;
      v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
      v47 = 2112;
      v48 = v25;
      _os_log_impl(&dword_23457A000, v26, OS_LOG_TYPE_DEFAULT, "%s - Authorization granted, revoking permissions from previous app, bundleId: %@", (uint8_t *)&v45, 0x16u);
    }

    if (!+[SAAuthorization setAccess:forBundleId:](SAAuthorization, "setAccess:forBundleId:", 0, v25))
    {
      sa_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        authorizationPromptResponseHandler_cold_4();
    }
    else
    {
LABEL_14:
      sa_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "toBundleId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 136315394;
        v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
        v47 = 2112;
        v48 = v28;
        _os_log_impl(&dword_23457A000, v27, OS_LOG_TYPE_DEFAULT, "%s - Authorization granted, granting permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);

      }
      objc_msgSend(v4, "toBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = +[SAAuthorization setAccess:forBundleId:](SAAuthorization, "setAccess:forBundleId:", 1, v29);

      sa_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "toBundleId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 136315394;
          v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
          v47 = 2112;
          v48 = v33;
          _os_log_impl(&dword_23457A000, v32, OS_LOG_TYPE_DEFAULT, "%s - Successfully granted permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);

        }
        objc_msgSend(v4, "completionHandler");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v34[2](v34, 2, 0);

        objc_msgSend(v4, "reset");
        goto LABEL_32;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        authorizationPromptResponseHandler_cold_3(v4, v32);

      if (!v25)
        goto LABEL_32;
      objc_msgSend(v4, "toBundleId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = +[SAAuthorization setAccess:forBundleId:](SAAuthorization, "setAccess:forBundleId:", 1, v38);

      if (v39)
        goto LABEL_32;
      sa_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        authorizationPromptResponseHandler_cold_2();
    }

LABEL_32:
LABEL_33:
    if (objc_msgSend(v4, "isInFlight"))
    {
      sa_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        authorizationPromptResponseHandler_cold_1(v4, v41);

      objc_msgSend(v4, "completionHandler");
      v42 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v4, "preflightAuthorizationStatus");
      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v42)[2](v42, v43, v44);

      objc_msgSend(v4, "reset");
    }
    if (a1)
      CFRelease(a1);
    goto LABEL_39;
  }
  sa_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    authorizationPromptResponseHandler_cold_6(v16, v17, v18, v19, v20, v21, v22, v23);

LABEL_39:
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t localMGGetBoolAnswer(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getMGGetBoolAnswerSymbolLoc_ptr;
  v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_2505B3A70;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    localMGGetBoolAnswer_cold_1();
  return v2(a1);
}

void sub_234586040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_2505B3A90;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MGGetBoolAnswer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_234586190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void authorizationPromptResponseHandler_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "toBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23457A000, a2, v4, "%s - Failed to successfully apply permissions to app, bundleId: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_10();
}

void authorizationPromptResponseHandler_cold_2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_23457A000, v0, OS_LOG_TYPE_FAULT, "%s - Failed to reinstate permissions to app, no app is authorized, bundleId: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void authorizationPromptResponseHandler_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "toBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23457A000, a2, v4, "%s - Failed to grant permissions to app, bundleId: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_10();
}

void authorizationPromptResponseHandler_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_23457A000, v0, v1, "%s - Failed to revoke permissions from previous app, bundleId: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void authorizationPromptResponseHandler_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a1, a3, "%s - No button was pressed and the notification timed out.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void authorizationPromptResponseHandler_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a1, a3, "%s - Authorization not in flight, this shouldn't be called.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void localMGGetBoolAnswer_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool localMGGetBoolAnswer(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SAGestalt.m"), 18, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;
  CFBundleRef v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *libMobileGestaltLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SAGestalt.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
  CFBundleGetIdentifier(v4);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x24BEB3758]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x24BEB3770]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x24BEB3790]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x24BEB37A8]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x24BEB37F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x24BEB39B0]();
}

uint64_t tcc_authorization_record_get_last_modified_date()
{
  return MEMORY[0x24BEB39B8]();
}

uint64_t tcc_authorization_record_get_subject_attributed_entity()
{
  return MEMORY[0x24BEB39C8]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x24BEB39D0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x24BEB39F8]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x24BEB3A00]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x24BEB3A08]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x24BEB3A10]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x24BEB3A18]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x24BEB3A20]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x24BEB3A30]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x24BEB3A40]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x24BEB3A50]();
}

