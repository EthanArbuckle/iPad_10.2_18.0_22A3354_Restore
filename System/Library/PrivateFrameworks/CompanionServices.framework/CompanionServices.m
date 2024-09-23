void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id CPSErrorGetCustomAuthenticationMethod(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeStringForKey:", CFSTR("CPSCustomAuthenticationMethodErrorKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t CPSErrorGetCancellationReason(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeNumberForKey:", CFSTR("CPSCancellationReasonErrorKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

id CPSErrorMake(uint64_t a1, void *a2)
{
  return CPSErrorUnderlyingMake(a1, 0, a2);
}

id CPSErrorUnderlyingMake(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (!v6)
    {
      v8 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
  if (v7)
  {
    if (v8)
    {
LABEL_7:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0BA0]);
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CompanionServices.CPSErrorDomain"), a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CPSErrorMultipleUnderlyingMake(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    if (!v6)
    {
      v7 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD10D8]);
  if (v6)
  {
    if (v7)
    {
LABEL_7:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0BA0]);
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CompanionServices.CPSErrorDomain"), a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id cps_daemon_log()
{
  if (DaemonLog_token != -1)
    dispatch_once(&DaemonLog_token, &__block_literal_global);
  return (id)DaemonLog_log;
}

id cps_service_log()
{
  if (ServiceLog_token != -1)
    dispatch_once(&ServiceLog_token, &__block_literal_global_3);
  return (id)ServiceLog_log;
}

id cps_session_log()
{
  if (SessionLog_token != -1)
    dispatch_once(&SessionLog_token, &__block_literal_global_5);
  return (id)SessionLog_log;
}

id cps_service_connection_log()
{
  if (ServiceConnectionLog_token != -1)
    dispatch_once(&ServiceConnectionLog_token, &__block_literal_global_7);
  return (id)ServiceConnectionLog_log;
}

id cps_service_listener_log()
{
  if (ServiceListenerLog_token != -1)
    dispatch_once(&ServiceListenerLog_token, &__block_literal_global_9);
  return (id)ServiceListenerLog_log;
}

id ClientSessionLog()
{
  if (ClientSessionLog_token != -1)
    dispatch_once(&ClientSessionLog_token, &__block_literal_global_0);
  return (id)ClientSessionLog_log;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2383E9294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASAuthorizationAppleIDRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthenticationServicesLibrary();
  result = objc_getClass("ASAuthorizationAppleIDRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getASAuthorizationAppleIDRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASAuthorizationAppleIDRequestClass_block_invoke_cold_1();
    return (Class)AuthenticationServicesLibrary();
  }
  return result;
}

uint64_t AuthenticationServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getASAuthorizationPasswordRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AuthenticationServicesLibrary();
  result = objc_getClass("ASAuthorizationPasswordRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getASAuthorizationPasswordRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getASAuthorizationPasswordRequestClass_block_invoke_cold_1();
    return (Class)+[CPSDedicatedCameraResponse supportsSecureCoding](v3, v4);
  }
  return result;
}

uint64_t CPSMetricsSessionResultWithCustomMethod(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("other")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("restore_purchase")) & 1) != 0)
  {
    v2 = 8;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("video_subscriber_account")))
  {
    v2 = 9;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2383EB5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{

}

uint64_t AppleMediaServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AppleMediaServicesLibraryCore_frameworkLibrary;
  v6 = AppleMediaServicesLibraryCore_frameworkLibrary;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_250A11A70;
    v8 = *(_OWORD *)&off_250A11A80;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AppleMediaServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2383EC7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleMediaServicesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AppleMediaServicesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAMSDelegatePurchaseRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAMSDelegatePurchaseRequestClass_softClass;
  v7 = getAMSDelegatePurchaseRequestClass_softClass;
  if (!getAMSDelegatePurchaseRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegatePurchaseRequestClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getAMSDelegatePurchaseRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383EC8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegatePurchaseRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSDelegatePurchaseRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSDelegatePurchaseRequestClass_block_invoke_cold_1();
  getAMSDelegatePurchaseRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegatePurchaseResultClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAMSDelegatePurchaseResultClass_softClass;
  v7 = getAMSDelegatePurchaseResultClass_softClass;
  if (!getAMSDelegatePurchaseResultClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegatePurchaseResultClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getAMSDelegatePurchaseResultClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383EC9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegatePurchaseResultClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSDelegatePurchaseResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSDelegatePurchaseResultClass_block_invoke_cold_1();
  getAMSDelegatePurchaseResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegateAuthenticateRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAMSDelegateAuthenticateRequestClass_softClass;
  v7 = getAMSDelegateAuthenticateRequestClass_softClass;
  if (!getAMSDelegateAuthenticateRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegateAuthenticateRequestClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getAMSDelegateAuthenticateRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ECB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegateAuthenticateRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSDelegateAuthenticateRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSDelegateAuthenticateRequestClass_block_invoke_cold_1();
  getAMSDelegateAuthenticateRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegateAuthenticateResultClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAMSDelegateAuthenticateResultClass_softClass;
  v7 = getAMSDelegateAuthenticateResultClass_softClass;
  if (!getAMSDelegateAuthenticateResultClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegateAuthenticateResultClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getAMSDelegateAuthenticateResultClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ECC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegateAuthenticateResultClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSDelegateAuthenticateResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1();
  getAMSDelegateAuthenticateResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getACAccountStoreClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACAccountStoreClass_softClass;
  v7 = getACAccountStoreClass_softClass;
  if (!getACAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getACAccountStoreClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getACAccountStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ECD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("ACAccountStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACAccountStoreClass_block_invoke_cold_1();
  getACAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getAMSAccountMediaTypeProductionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAMSAccountMediaTypeProductionSymbolLoc_ptr;
  v6 = getAMSAccountMediaTypeProductionSymbolLoc_ptr;
  if (!getAMSAccountMediaTypeProductionSymbolLoc_ptr)
  {
    v1 = (void *)AppleMediaServicesLibrary();
    v0 = dlsym(v1, "AMSAccountMediaTypeProduction");
    v4[3] = (uint64_t)v0;
    getAMSAccountMediaTypeProductionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2383ECE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAMSAccountMediaTypeProduction()
{
  id *AMSAccountMediaTypeProductionSymbolLoc;

  AMSAccountMediaTypeProductionSymbolLoc = (id *)getAMSAccountMediaTypeProductionSymbolLoc();
  if (AMSAccountMediaTypeProductionSymbolLoc)
    return *AMSAccountMediaTypeProductionSymbolLoc;
  ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
  return (id)AuthenticationServicesLibraryCore();
}

uint64_t AuthenticationServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AuthenticationServicesLibraryCore_frameworkLibrary_0;
  v6 = AuthenticationServicesLibraryCore_frameworkLibrary_0;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary_0)
  {
    v7 = xmmword_250A11A90;
    v8 = *(_OWORD *)&off_250A11AA0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AuthenticationServicesLibraryCore_frameworkLibrary_0 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2383ECEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AuthenticationServicesLibrary_0()
{
  uint64_t v0;
  void *v2;

  v0 = AuthenticationServicesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getASPasswordCredentialClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getASPasswordCredentialClass_softClass;
  v7 = getASPasswordCredentialClass_softClass;
  if (!getASPasswordCredentialClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getASPasswordCredentialClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getASPasswordCredentialClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ECFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASPasswordCredentialClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthenticationServicesLibrary_0();
  result = objc_getClass("ASPasswordCredential");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getASPasswordCredentialClass_block_invoke_cold_1();
  getASPasswordCredentialClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PassKitCoreLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PassKitCoreLibraryCore_frameworkLibrary;
  v6 = PassKitCoreLibraryCore_frameworkLibrary;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_250A11AB0;
    v8 = *(_OWORD *)&off_250A11AC0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PassKitCoreLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2383ED114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PassKitCoreLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = PassKitCoreLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPKPaymentRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKPaymentRequestClass_softClass;
  v7 = getPKPaymentRequestClass_softClass;
  if (!getPKPaymentRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentRequestClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getPKPaymentRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ED224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPaymentRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  PassKitCoreLibrary();
  result = objc_getClass("PKPaymentRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPKPaymentRequestClass_block_invoke_cold_1();
  getPKPaymentRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitLibraryCore_frameworkLibrary;
  v6 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_250A11AD0;
    v8 = *(_OWORD *)&off_250A11AE0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2383ED340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = UIKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUIImageClass_softClass;
  v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_250A11810;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2383ED450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIImageClass_block_invoke_cold_1();
  getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

unint64_t static CPSConstants.logSubsystem.getter()
{
  return 0xD00000000000001BLL;
}

ValueMetadata *type metadata accessor for CPSConstants()
{
  return &type metadata for CPSConstants;
}

uint64_t __getASAuthorizationAppleIDRequestClass_block_invoke_cold_1()
{
  abort_report_np();
  return ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
}

uint64_t __getASAuthorizationPasswordRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:].cold.1(v0);
}

void __getAMSDelegatePurchaseRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSDelegatePurchaseResultClass_block_invoke_cold_1(v0);
}

void __getAMSDelegatePurchaseResultClass_block_invoke_cold_1()
{
  abort_report_np();
  __getAMSDelegateAuthenticateRequestClass_block_invoke_cold_1();
}

void __getAMSDelegateAuthenticateRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1(v0);
}

void __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1()
{
  abort_report_np();
  __getACAccountStoreClass_block_invoke_cold_1();
}

void __getACAccountStoreClass_block_invoke_cold_1()
{
  abort_report_np();
  __getASPasswordCredentialClass_block_invoke_cold_1();
}

void __getASPasswordCredentialClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentRequestClass_block_invoke_cold_1(v0);
}

void __getPKPaymentRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getUIImageClass_block_invoke_cold_1(v0);
}

void __getUIImageClass_block_invoke_cold_1()
{
  abort_report_np();
  AnalyticsSendEvent();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x24BE291B8]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x24BE291E8]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x24BE29388]();
}

uint64_t GestaltGetBoolean()
{
  return MEMORY[0x24BE29390]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x24BE293A8]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x24BEB0C98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

