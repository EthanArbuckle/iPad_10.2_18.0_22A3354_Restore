void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double _interiorPointForCorner(uint64_t a1, double result, double a3, double a4)
{
  double v4;

  switch(a1)
  {
    case 1:
      v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      result = a4 - result;
      break;
    case 4:
      result = result + a4;
      break;
    case 8:
      v4 = a4 - a3;
LABEL_6:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1BD798CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1BD798EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1BD799294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD799C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD799FC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

Class __getLARatchetViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary)
    LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("LARatchetViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getLARatchetViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1BD79B280(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1BD79B6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD79B880(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BD79BA20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t CoreFollowUpLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreFollowUpLibraryCore_frameworkLibrary;
  v6 = CoreFollowUpLibraryCore_frameworkLibrary;
  if (!CoreFollowUpLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7678B50;
    v8 = *(_OWORD *)&off_1E7678B60;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreFollowUpLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79F4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreFollowUpLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = CoreFollowUpLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getFLFollowUpActionClass()
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
  v0 = (void *)getFLFollowUpActionClass_softClass;
  v7 = getFLFollowUpActionClass_softClass;
  if (!getFLFollowUpActionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpActionClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLFollowUpActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79F600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpActionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreFollowUpLibrary();
  result = objc_getClass("FLFollowUpAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFLFollowUpActionClass_block_invoke_cold_1();
    return (Class)getFLFollowUpControllerClass(v3);
  }
  return result;
}

id getFLFollowUpControllerClass()
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
  v0 = (void *)getFLFollowUpControllerClass_softClass;
  v7 = getFLFollowUpControllerClass_softClass;
  if (!getFLFollowUpControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpControllerClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLFollowUpControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79F70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreFollowUpLibrary();
  result = objc_getClass("FLFollowUpController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFLFollowUpControllerClass_block_invoke_cold_1();
    return (Class)getFLFollowUpItemClass(v3);
  }
  return result;
}

id getFLFollowUpItemClass()
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
  v0 = (void *)getFLFollowUpItemClass_softClass;
  v7 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpItemClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLFollowUpItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79F818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpItemClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreFollowUpLibrary();
  result = objc_getClass("FLFollowUpItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFLFollowUpItemClass_block_invoke_cold_1();
    return (Class)getFLFollowUpNotificationClass();
  }
  return result;
}

id getFLFollowUpNotificationClass()
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
  v0 = (void *)getFLFollowUpNotificationClass_softClass;
  v7 = getFLFollowUpNotificationClass_softClass;
  if (!getFLFollowUpNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpNotificationClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLFollowUpNotificationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79F924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpNotificationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreFollowUpLibrary();
  result = objc_getClass("FLFollowUpNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpNotificationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFLFollowUpNotificationClass_block_invoke_cold_1();
    return (Class)getFLHSA2LoginNotificationClass(v3);
  }
  return result;
}

id getFLHSA2LoginNotificationClass()
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
  v0 = (void *)getFLHSA2LoginNotificationClass_softClass;
  v7 = getFLHSA2LoginNotificationClass_softClass;
  if (!getFLHSA2LoginNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLHSA2LoginNotificationClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLHSA2LoginNotificationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79FA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLHSA2LoginNotificationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreFollowUpLibrary();
  result = objc_getClass("FLHSA2LoginNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLHSA2LoginNotificationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFLHSA2LoginNotificationClass_block_invoke_cold_1();
    return (Class)getFLHSA2PasswordResetNotificationClass(v3);
  }
  return result;
}

id getFLHSA2PasswordResetNotificationClass()
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
  v0 = (void *)getFLHSA2PasswordResetNotificationClass_softClass;
  v7 = getFLHSA2PasswordResetNotificationClass_softClass;
  if (!getFLHSA2PasswordResetNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFLHSA2PasswordResetNotificationClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getFLHSA2PasswordResetNotificationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD79FB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLHSA2PasswordResetNotificationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreFollowUpLibrary();
  result = objc_getClass("FLHSA2PasswordResetNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFLHSA2PasswordResetNotificationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1();
    return (Class)getFLGroupIdentifierAccountSymbolLoc(v3);
  }
  return result;
}

void *getFLGroupIdentifierAccountSymbolLoc()
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
  v0 = (void *)getFLGroupIdentifierAccountSymbolLoc_ptr;
  v6 = getFLGroupIdentifierAccountSymbolLoc_ptr;
  if (!getFLGroupIdentifierAccountSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLGroupIdentifierAccount");
    v4[3] = (uint64_t)v0;
    getFLGroupIdentifierAccountSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLGroupIdentifierAccount()
{
  id *FLGroupIdentifierAccountSymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLGroupIdentifierAccountSymbolLoc = (id *)getFLGroupIdentifierAccountSymbolLoc();
  if (FLGroupIdentifierAccountSymbolLoc)
    return *FLGroupIdentifierAccountSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionForceSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionForceSymbolLoc()
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
  v0 = (void *)getFLNotificationOptionForceSymbolLoc_ptr;
  v6 = getFLNotificationOptionForceSymbolLoc_ptr;
  if (!getFLNotificationOptionForceSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionForce");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionForceSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionForce()
{
  id *FLNotificationOptionForceSymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLNotificationOptionForceSymbolLoc = (id *)getFLNotificationOptionForceSymbolLoc();
  if (FLNotificationOptionForceSymbolLoc)
    return *FLNotificationOptionForceSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionSpringboardAlertSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionSpringboardAlertSymbolLoc()
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
  v0 = (void *)getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  v6 = getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionSpringboardAlertSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionSpringboardAlert");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionSpringboardAlertSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionSpringboardAlert()
{
  id *FLNotificationOptionSpringboardAlertSymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLNotificationOptionSpringboardAlertSymbolLoc = (id *)getFLNotificationOptionSpringboardAlertSymbolLoc();
  if (FLNotificationOptionSpringboardAlertSymbolLoc)
    return *FLNotificationOptionSpringboardAlertSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc()
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
  v0 = (void *)getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr;
  v6 = getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr;
  if (!getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionSpringboardAlertActionOnly");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionSpringboardAlertActionOnly()
{
  id *FLNotificationOptionSpringboardAlertActionOnlySymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLNotificationOptionSpringboardAlertActionOnlySymbolLoc = (id *)getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc();
  if (FLNotificationOptionSpringboardAlertActionOnlySymbolLoc)
    return *FLNotificationOptionSpringboardAlertActionOnlySymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLHSA2ActionChangePasswordSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLHSA2ActionChangePasswordSymbolLoc()
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
  v0 = (void *)getFLHSA2ActionChangePasswordSymbolLoc_ptr;
  v6 = getFLHSA2ActionChangePasswordSymbolLoc_ptr;
  if (!getFLHSA2ActionChangePasswordSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLHSA2ActionChangePassword");
    v4[3] = (uint64_t)v0;
    getFLHSA2ActionChangePasswordSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLHSA2ActionChangePassword()
{
  id *v0;
  uint64_t FLGroupIdentifierAccount_cold_1;

  v0 = (id *)getFLHSA2ActionChangePasswordSymbolLoc();
  if (v0)
    return *v0;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionExtensionForNotificationSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionExtensionForNotificationSymbolLoc()
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
  v0 = (void *)getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr;
  v6 = getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr;
  if (!getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionExtensionForNotification");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD79FF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionExtensionForNotification()
{
  id *FLNotificationOptionExtensionForNotificationSymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLNotificationOptionExtensionForNotificationSymbolLoc = (id *)getFLNotificationOptionExtensionForNotificationSymbolLoc();
  if (FLNotificationOptionExtensionForNotificationSymbolLoc)
    return *FLNotificationOptionExtensionForNotificationSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionExtensionActionsSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionExtensionActionsSymbolLoc()
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
  v0 = (void *)getFLNotificationOptionExtensionActionsSymbolLoc_ptr;
  v6 = getFLNotificationOptionExtensionActionsSymbolLoc_ptr;
  if (!getFLNotificationOptionExtensionActionsSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionExtensionActions");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionExtensionActionsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7A0040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionExtensionActions()
{
  id *FLNotificationOptionExtensionActionsSymbolLoc;
  uint64_t FLGroupIdentifierAccount_cold_1;

  FLNotificationOptionExtensionActionsSymbolLoc = (id *)getFLNotificationOptionExtensionActionsSymbolLoc();
  if (FLNotificationOptionExtensionActionsSymbolLoc)
    return *FLNotificationOptionExtensionActionsSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
  return (id)getFLNotificationOptionBannerAlertSymbolLoc(FLGroupIdentifierAccount_cold_1);
}

void *getFLNotificationOptionBannerAlertSymbolLoc()
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
  v0 = (void *)getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  v6 = getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionBannerAlertSymbolLoc_ptr)
  {
    v1 = (void *)CoreFollowUpLibrary();
    v0 = dlsym(v1, "FLNotificationOptionBannerAlert");
    v4[3] = (uint64_t)v0;
    getFLNotificationOptionBannerAlertSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7A00F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionBannerAlert()
{
  id *FLNotificationOptionBannerAlertSymbolLoc;
  void *FLGroupIdentifierAccount_cold_1;
  SEL v3;

  FLNotificationOptionBannerAlertSymbolLoc = (id *)getFLNotificationOptionBannerAlertSymbolLoc();
  if (FLNotificationOptionBannerAlertSymbolLoc)
    return *FLNotificationOptionBannerAlertSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = (void *)getFLGroupIdentifierAccount_cold_1();
  return +[AKAuthorizationBiometricImage biometricImage](FLGroupIdentifierAccount_cold_1, v3);
}

uint64_t ProximityAppleIDSetupUILibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ProximityAppleIDSetupUILibraryCore_frameworkLibrary;
  v6 = ProximityAppleIDSetupUILibraryCore_frameworkLibrary;
  if (!ProximityAppleIDSetupUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7678B70;
    v8 = *(_OWORD *)&off_1E7678B80;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ProximityAppleIDSetupUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7A0488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ProximityAppleIDSetupUILibrary()
{
  uint64_t v0;
  void *v2;

  v0 = ProximityAppleIDSetupUILibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPASUIDependentViewPresenterClass()
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
  v0 = (void *)getPASUIDependentViewPresenterClass_softClass;
  v7 = getPASUIDependentViewPresenterClass_softClass;
  if (!getPASUIDependentViewPresenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPASUIDependentViewPresenterClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getPASUIDependentViewPresenterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7A0598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPASUIDependentViewPresenterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  ProximityAppleIDSetupUILibrary();
  result = objc_getClass("PASUIDependentViewPresenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPASUIDependentViewPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPASUIDependentViewPresenterClass_block_invoke_cold_1();
    return (Class)+[NSLayoutConstraint(AuthKitUI) ak_constraintsForView:equalToView:](v3, v4, v5, v6);
  }
  return result;
}

void sub_1BD7A19F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BD7A2140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double AKSizeAlignedInRectWithScale(uint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;

  switch(a1)
  {
    case 0:
    case 3:
      v18 = a5;
      break;
    case 1:
      AKFloatRoundToPixelWithScale(a5 + (a7 - a3) * 0.5, a9);
      v18 = v17;
      break;
    case 2:
      v20.origin.x = a5;
      v20.origin.y = a6;
      v20.size.width = a7;
      v20.size.height = a8;
      v18 = CGRectGetMaxX(v20) - a3;
      break;
    default:
      v18 = 0.0;
      break;
  }
  switch(a2)
  {
    case 1:
      AKFloatRoundToPixelWithScale(a6 + (a8 - a4) * 0.5, a9);
      break;
    case 2:
      v21.origin.x = a5;
      v21.origin.y = a6;
      v21.size.width = a7;
      v21.size.height = a8;
      CGRectGetMaxY(v21);
      break;
    default:
      return v18;
  }
  return v18;
}

void AKFloatRoundToPixelWithScale(double a1, double a2)
{
  void *v2;

  if (a2 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");

  }
}

double AKSizeScaleAspectFit(double result, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a3 / result;
  if (result == 0.0)
    v4 = 1.0;
  v5 = a4 / a2;
  if (a2 == 0.0)
    v5 = 1.0;
  if (fmin(v4, v5) != 1.0)
  {
    if (v4 >= v5)
      return a4 * (result / a2);
    else
      return a3;
  }
  return result;
}

double AKRectRoundToPixelWithScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9;
  double v10;

  AKFloatRoundToPixelWithScale(a1, a5);
  v10 = v9;
  AKFloatRoundToPixelWithScale(a2, a5);
  AKFloatRoundToPixelWithScale(a3, a5);
  AKFloatRoundToPixelWithScale(a4, a5);
  return v10;
}

double AKPointRoundToPixelWithScale(double a1, double a2, double a3)
{
  double v5;
  double v6;

  AKFloatRoundToPixelWithScale(a1, a3);
  v6 = v5;
  AKFloatRoundToPixelWithScale(a2, a3);
  return v6;
}

double AKSizeRoundToPixelWithScale(double a1, double a2, double a3)
{
  double v5;
  double v6;

  AKFloatRoundToPixelWithScale(a1, a3);
  v6 = v5;
  AKFloatRoundToPixelWithScale(a2, a3);
  return v6;
}

uint64_t BridgePreferencesLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = BridgePreferencesLibraryCore_frameworkLibrary;
  v6 = BridgePreferencesLibraryCore_frameworkLibrary;
  if (!BridgePreferencesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7678C80;
    v8 = *(_OWORD *)&off_1E7678C90;
    v1 = _sl_dlopen();
    v4[3] = v1;
    BridgePreferencesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7A6A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t BridgePreferencesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = BridgePreferencesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getBPSRemoteUISetupStyleClass()
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
  v0 = (void *)getBPSRemoteUISetupStyleClass_softClass;
  v7 = getBPSRemoteUISetupStyleClass_softClass;
  if (!getBPSRemoteUISetupStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBPSRemoteUISetupStyleClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getBPSRemoteUISetupStyleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7A6B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBPSRemoteUISetupStyleClass_block_invoke(uint64_t a1)
{
  Class result;

  BridgePreferencesLibrary();
  result = objc_getClass("BPSRemoteUISetupStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBPSRemoteUISetupStyleClass_block_invoke_cold_1();
  getBPSRemoteUISetupStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getBPSApplyStyleToNavBarSymbolLoc()
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
  v0 = (void *)getBPSApplyStyleToNavBarSymbolLoc_ptr;
  v6 = getBPSApplyStyleToNavBarSymbolLoc_ptr;
  if (!getBPSApplyStyleToNavBarSymbolLoc_ptr)
  {
    v1 = (void *)BridgePreferencesLibrary();
    v0 = dlsym(v1, "BPSApplyStyleToNavBar");
    v4[3] = (uint64_t)v0;
    getBPSApplyStyleToNavBarSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7A6C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void SBPSApplyStyleToNavBar(void *a1)
{
  void (*BPSApplyStyleToNavBarSymbolLoc)(id);
  AKAppleIDAuthenticationWatchBuddyContext *FLGroupIdentifierAccount_cold_1;
  SEL v3;
  id v4;
  id v5;

  v5 = a1;
  BPSApplyStyleToNavBarSymbolLoc = (void (*)(id))getBPSApplyStyleToNavBarSymbolLoc();
  if (BPSApplyStyleToNavBarSymbolLoc)
  {
    BPSApplyStyleToNavBarSymbolLoc(v5);

  }
  else
  {
    FLGroupIdentifierAccount_cold_1 = (AKAppleIDAuthenticationWatchBuddyContext *)getFLGroupIdentifierAccount_cold_1();
    -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:](FLGroupIdentifierAccount_cold_1, v3, v4);
  }
}

uint64_t SafariFoundationLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SafariFoundationLibraryCore_frameworkLibrary;
  v6 = SafariFoundationLibraryCore_frameworkLibrary;
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7678E08;
    v8 = *(_OWORD *)&off_1E7678E18;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SafariFoundationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7AC018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SafariFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = SafariFoundationLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getSFStrongPasswordGeneratorClass()
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
  v0 = (void *)getSFStrongPasswordGeneratorClass_softClass;
  v7 = getSFStrongPasswordGeneratorClass_softClass;
  if (!getSFStrongPasswordGeneratorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSFStrongPasswordGeneratorClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getSFStrongPasswordGeneratorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7AC128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKPasswordGeneratorHook *__getSFStrongPasswordGeneratorClass_block_invoke(uint64_t a1)
{
  AKPasswordGeneratorHook *result;
  AKPasswordGeneratorHook *v3;
  SEL v4;

  SafariFoundationLibrary();
  result = (AKPasswordGeneratorHook *)objc_getClass("SFStrongPasswordGenerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFStrongPasswordGeneratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AKPasswordGeneratorHook *)__getSFStrongPasswordGeneratorClass_block_invoke_cold_1();
    return -[AKPasswordGeneratorHook init](v3, v4);
  }
  return result;
}

uint64_t AVKitLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AVKitLibraryCore_frameworkLibrary;
  v6 = AVKitLibraryCore_frameworkLibrary;
  if (!AVKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7678E70;
    v8 = *(_OWORD *)&off_1E7678E80;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AVKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7AE4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AVKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AVKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAVPlayerViewControllerClass()
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
  v0 = (void *)getAVPlayerViewControllerClass_softClass;
  v7 = getAVPlayerViewControllerClass_softClass;
  if (!getAVPlayerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVPlayerViewControllerClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getAVPlayerViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7AE5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKBasicLoginOptionsViewController *__getAVPlayerViewControllerClass_block_invoke(uint64_t a1)
{
  AKBasicLoginOptionsViewController *result;
  AKBasicLoginOptionsViewController *v3;
  SEL v4;
  id v5;

  AVKitLibrary();
  result = (AKBasicLoginOptionsViewController *)objc_getClass("AVPlayerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVPlayerViewControllerClass_block_invoke_cold_1();
    return -[AKBasicLoginOptionsViewController initWithContext:](v3, v4, v5);
  }
  return result;
}

void sub_1BD7AE7A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BD7B08F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BD7B41D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7B4280(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BD7B7BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v11 - 152));
  _Unwind_Resume(a1);
}

void sub_1BD7B9EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  void *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to copy AKUIMicaPlayer. Error = %@"));

    objc_end_catch();
    JUMPOUT(0x1BD7B9ED0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BD7BAAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  v6 = AuthenticationServicesLibraryCore_frameworkLibrary;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7679078;
    v8 = *(_OWORD *)&off_1E7679088;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AuthenticationServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7BBB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AuthenticationServicesLibrary()
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

id getASWebAuthenticationSessionClass()
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
  v0 = (void *)getASWebAuthenticationSessionClass_softClass;
  v7 = getASWebAuthenticationSessionClass_softClass;
  if (!getASWebAuthenticationSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getASWebAuthenticationSessionClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getASWebAuthenticationSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7BBC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASWebAuthenticationSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthenticationServicesLibrary();
  result = objc_getClass("ASWebAuthenticationSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getASWebAuthenticationSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASWebAuthenticationSessionClass_block_invoke_cold_1();
    return (Class)getASWebAuthenticationSessionErrorDomainSymbolLoc();
  }
  return result;
}

void *getASWebAuthenticationSessionErrorDomainSymbolLoc()
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
  v0 = (void *)getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr;
  v6 = getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr;
  if (!getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)AuthenticationServicesLibrary();
    v0 = dlsym(v1, "ASWebAuthenticationSessionErrorDomain");
    v4[3] = (uint64_t)v0;
    getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7BBCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getASWebAuthenticationSessionErrorDomain()
{
  id *ASWebAuthenticationSessionErrorDomainSymbolLoc;
  void *FLGroupIdentifierAccount_cold_1;
  SEL v3;
  id v4;

  ASWebAuthenticationSessionErrorDomainSymbolLoc = (id *)getASWebAuthenticationSessionErrorDomainSymbolLoc();
  if (ASWebAuthenticationSessionErrorDomainSymbolLoc)
    return *ASWebAuthenticationSessionErrorDomainSymbolLoc;
  FLGroupIdentifierAccount_cold_1 = (void *)getFLGroupIdentifierAccount_cold_1();
  return +[AKIDPUtility convertError:](FLGroupIdentifierAccount_cold_1, v3, v4);
}

void sub_1BD7C55BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BD7C61DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1BD7CA3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD7CCF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t VisualPairingLibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = VisualPairingLibraryCore_frameworkLibrary;
  v6 = VisualPairingLibraryCore_frameworkLibrary;
  if (!VisualPairingLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7679430;
    v8 = *(_OWORD *)&off_1E7679440;
    v1 = _sl_dlopen();
    v4[3] = v1;
    VisualPairingLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7CEF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t VisualPairingLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = VisualPairingLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVPPresenterViewClass()
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
  v0 = (void *)getVPPresenterViewClass_softClass;
  v7 = getVPPresenterViewClass_softClass;
  if (!getVPPresenterViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVPPresenterViewClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getVPPresenterViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7CF010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVPPresenterViewClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  VisualPairingLibrary();
  result = objc_getClass("VPPresenterView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVPPresenterViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVPPresenterViewClass_block_invoke_cold_1();
    return (Class)+[UIColor(AuthKit) ak_colorWithServerRGBRepresentation:](v3, v4, v5);
  }
  return result;
}

uint64_t AppleAccountUILibraryCore()
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AppleAccountUILibraryCore_frameworkLibrary;
  v6 = AppleAccountUILibraryCore_frameworkLibrary;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E7679450;
    v8 = *(_OWORD *)&off_1E7679460;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AppleAccountUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BD7CF288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleAccountUILibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AppleAccountUILibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAAUICDPStingrayRemoteUIControllerClass()
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
  v0 = (void *)getAAUICDPStingrayRemoteUIControllerClass_softClass;
  v7 = getAAUICDPStingrayRemoteUIControllerClass_softClass;
  if (!getAAUICDPStingrayRemoteUIControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAAUICDPStingrayRemoteUIControllerClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __getAAUICDPStingrayRemoteUIControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7CF398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKInAppAuthenticationRemoteUIProvider *__getAAUICDPStingrayRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  AKInAppAuthenticationRemoteUIProvider *result;
  AKInAppAuthenticationRemoteUIProvider *v3;
  SEL v4;
  id v5;

  AppleAccountUILibrary();
  result = (AKInAppAuthenticationRemoteUIProvider *)objc_getClass("AAUICDPStingrayRemoteUIController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAAUICDPStingrayRemoteUIControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAAUICDPStingrayRemoteUIControllerClass_block_invoke_cold_1();
    return -[AKInAppAuthenticationRemoteUIProvider initWithContext:](v3, v4, v5);
  }
  return result;
}

void sub_1BD7D0324(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1BD7D404C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1BD7D40A8()
{
  JUMPOUT(0x1BD7D4098);
}

void sub_1BD7D47C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DA70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DABE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DB154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DB608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DBB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1BD7DC0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1BD7DC454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7DD1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7E08F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _AKUIMainBundle()
{
  if (_AKUIMainBundle_onceToken != -1)
    dispatch_once(&_AKUIMainBundle_onceToken, &__block_literal_global_6);
  return (id)_AKUIMainBundle_mainBundle;
}

uint64_t _ColorSpaceStandardRGB()
{
  if (_InitializeRGBColorSpace_onceToken != -1)
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  return StandardRGB;
}

CGImageRef AKCreateAppleIDButtonImage(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6)
{
  return AKCreateAppleIDButtonImageWithCornerRadius(a1, a2, a3, a4, a5, a6, 4.0);
}

CGImageRef AKCreateAppleIDButtonImageWithCornerRadius(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  id v14;
  CGColorSpace *v15;
  double v16;
  double v17;
  CGFloat v18;
  CGContext *v19;
  CGImageRef Image;

  v13 = _InitializeRGBColorSpace_onceToken;
  v14 = a3;
  if (v13 != -1)
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  v15 = (CGColorSpace *)StandardRGB;
  v16 = AKSizeRoundToPixelWithScale(a4 * a6, a5 * a6, 1.0);
  v18 = v17;
  v19 = CGBitmapContextCreate(0, (unint64_t)v16, (unint64_t)v17, 8uLL, 0, v15, 1u);
  CGContextTranslateCTM(v19, 0.0, v18);
  CGContextScaleCTM(v19, 1.0, -1.0);
  AKDrawAppleIDButtonWithCornerRadius(v19, a1, a2, 0.0, 0.0, v16, v18, a6, a7);

  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

void AKDrawAppleIDButtonWithCornerRadius(CGContext *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  _BOOL8 v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __CFString *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double width;
  const __CFAttributedString *AttributedStringWithFontSize;
  const __CFAttributedString *v61;
  const __CTLine *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double height;
  const __CTLine *v76;
  uint64_t v77;
  CGFloat v78;
  CGFloat v79;
  id v80;
  CGRect BoundsWithOptions;
  CGRect v82;

  v9 = a3;
  _DrawBorder(a1, a3, a4, a5, a6, a7, a8, a9);
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("SIGN_UP_WITH_APPLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2 == 2)
    {
      v18 = v17;
      v19 = CFSTR("CONTINUE_WITH_APPLE");
    }
    else
    {
      v18 = v17;
      v19 = CFSTR("SIGN_IN_WITH_APPLE");
    }
  }
  objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E7679C68, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredLocalizations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localeWithLocaleIdentifier:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "languageCode");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v21, "rangeOfString:", CFSTR("%@"));
  v28 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v80);
  if (v28 == 2)
    v29 = objc_msgSend(v21, "length") - 2;
  else
    v29 = 0;
  objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("%@"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count") == 2)
  {
    v31 = v28 == 2;
    v32 = v28 != 2;
    v33 = v31;
    objc_msgSend(v30, "objectAtIndex:", v33);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", v32);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v30, "firstObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v27 == v29)
      v35 = (__CFString *)v36;
    else
      v35 = &stru_1E7679C68;
    if (v27 == v29)
      v34 = &stru_1E7679C68;
    else
      v34 = (__CFString *)v36;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v35, "length"))
  {
    -[__CFString stringByTrimmingCharactersInSet:](v35, "stringByTrimmingCharactersInSet:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\u200E %@"), v38);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v78 = a4;
  v79 = a5;
  if (-[__CFString length](v34, "length"))
  {
    -[__CFString stringByTrimmingCharactersInSet:](v34, "stringByTrimmingCharactersInSet:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\u200E "), v39);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v40 = a6 + a6 * -0.16;
  v41 = AKSizeScaleAspectFit(477.0, 658.0, v40, a7 * 0.34);
  v43 = AKSizeRoundToPixelWithScale(v41, v42, 1.0);
  v45 = v44;
  -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v35);
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v46, "length")
    && (v47 = AKRectRoundToPixelWithScale(0.0, 0.0, v40 - v43, v45 * 1.38, 1.0),
        v51 = _MaximumFontSizeForStringInRect(v46, v47, v48, v49, v50, a8),
        v51 != 0.0))
  {
    v57 = v51;
    width = *MEMORY[0x1E0C9D820];
    v58 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v77 = v9;
    v74 = *MEMORY[0x1E0C9D820];
    if (-[__CFString length](v35, "length"))
    {
      AttributedStringWithFontSize = _CreateAttributedStringWithFontSize(v35, v9, v57);
      v76 = CTLineCreateWithAttributedString(AttributedStringWithFontSize);
      BoundsWithOptions = CTLineGetBoundsWithOptions(v76, 0);
      width = BoundsWithOptions.size.width;
      height = BoundsWithOptions.size.height;
      CFRelease(AttributedStringWithFontSize);
    }
    else
    {
      v76 = 0;
      height = v58;
    }
    if (-[__CFString length](v34, "length"))
    {
      v61 = _CreateAttributedStringWithFontSize(v34, v77, v57);
      v62 = CTLineCreateWithAttributedString(v61);
      v82 = CTLineGetBoundsWithOptions(v62, 0);
      v63 = v82.size.width;
      v58 = v82.size.height;
      CFRelease(v61);
    }
    else
    {
      v62 = 0;
      v63 = v74;
    }
    v64 = height;
    if (height < v58)
      v64 = v58;
    if (v45 * 1.38 > v64)
    {
      v65 = AKSizeScaleAspectFit(v43, v45, v43, v64 / 1.38);
      v43 = AKSizeRoundToPixelWithScale(v65, v66, 1.0);
      v45 = v67;
    }
    v68 = AKSizeAlignedInRectWithScale(1, 1, width + v63 + v43, v45, v78, v79, a6, a7, 1.0);
    v70 = v69;
    AKFloatRoundToPixelWithScale(v45 * 0.085 * 0.5, 1.0);
    v54 = v70 - v71;
    if (v62)
    {
      AKFloatRoundToPixelWithScale(v54 + v45 * 0.135, 1.0);
      CGContextSetTextPosition(a1, v68, v72);
      CTLineDraw(v62, a1);
      CFRelease(v62);
    }
    v52 = v63 + v68;
    if (v76)
    {
      AKFloatRoundToPixelWithScale(v54 + v45 * 0.135, 1.0);
      CGContextSetTextPosition(a1, v43 + v52, v73);
      CTLineDraw(v76, a1);
      CFRelease(v76);
    }
    v9 = v77;
  }
  else
  {
    v52 = AKSizeAlignedInRectWithScale(1, 1, a7 * 0.34 / 1.37945493, a7 * 0.34, v78, a5, a6, a7, 1.0);
    v54 = v53;
    v43 = v55;
    v45 = v56;
  }
  _DrawLogoPDFIntoContext(v9, a1, v52, v54, v43, v45);

}

void AKDrawAppleIDButton(CGContext *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8)
{
  AKDrawAppleIDButtonWithCornerRadius(a1, a2, a3, a4, a5, a6, a7, a8, 4.0);
}

void _DrawBorder(CGContext *a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v16;
  double v17;
  void *v18;
  const CGPath *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;

  AKFloatRoundToPixelWithScale(a7 * 0.5, 1.0);
  v17 = v16;
  v26.origin.x = AKRectRoundToPixelWithScale(a3, a4, a5, a6, 1.0);
  v27 = CGRectInset(v26, v17 * 0.5, v17 * 0.5);
  +[AKRoundedPath pathWithRoundedRect:cornerRadius:](AKRoundedPath, "pathWithRoundedRect:cornerRadius:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, a7 * a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (const CGPath *)objc_msgSend(v18, "CGPath");

  CGContextBeginPath(a1);
  CGContextAddPath(a1, v19);
  CGContextClosePath(a1);
  switch(a2)
  {
    case 0:
      CGContextSetRGBFillColor(a1, 1.0, 1.0, 1.0, 1.0);
      v23 = 1.0;
      v24 = 1.0;
      v25 = 1.0;
LABEL_8:
      CGContextSetRGBStrokeColor(a1, v23, v24, v25, 1.0);
      break;
    case 2:
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      goto LABEL_7;
    case 1:
      v20 = 1.0;
      v21 = 1.0;
      v22 = 1.0;
LABEL_7:
      CGContextSetRGBFillColor(a1, v20, v21, v22, 1.0);
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      goto LABEL_8;
  }
  CGContextSetLineWidth(a1, v17);
  CGContextDrawPath(a1, kCGPathFillStroke);
}

double _MaximumFontSizeForStringInRect(const __CFString *a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9;
  double v10;
  double v11;
  const __CFAttributedString *AttributedStringWithFontSize;
  const __CTLine *v13;
  double width;
  double height;
  double v17;
  CGRect BoundsWithOptions;

  v9 = a6 * 10.0;
  v10 = a6 * 10.0;
  do
  {
    v11 = v10;
    AttributedStringWithFontSize = _CreateAttributedStringWithFontSize(a1, 2, v10);
    v13 = CTLineCreateWithAttributedString(AttributedStringWithFontSize);
    BoundsWithOptions = CTLineGetBoundsWithOptions(v13, 0);
    width = BoundsWithOptions.size.width;
    height = BoundsWithOptions.size.height;
    v10 = v10 + 1.0;
    CFRelease(v13);
    CFRelease(AttributedStringWithFontSize);
  }
  while (width <= a4 && height <= a5);
  v17 = 0.0;
  if (v11 != v9)
    v17 = v11;
  return floor(v17);
}

void _DrawLogoPDFIntoContext(uint64_t a1, CGContextRef c, CGFloat a3, CGFloat a4, double a5, double a6)
{
  const __CFString *v13;
  void *v14;
  const __CFURL *v15;
  CGPDFDocument *v16;
  CGPDFDocument *v17;
  CGPDFPage *Page;
  CGPDFPage *v19;
  CGPDFPage *v20;
  double v21;
  CGAffineTransform v22;
  CGRect BoxRect;

  CGContextSaveGState(c);
  if (a1 == 2 || a1 == 100)
    v13 = CFSTR("AKAppleLogoWhite");
  else
    v13 = CFSTR("AKAppleLogoBlack");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLForResource:withExtension:", v13, CFSTR("pdf"));
  v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v16 = CGPDFDocumentCreateWithURL(v15);
  if (!v16
    || (v17 = v16, !CGPDFDocumentGetNumberOfPages(v16))
    || (Page = CGPDFDocumentGetPage(v17, 1uLL), (v19 = CGPDFPageRetain(Page)) == 0))
  {
    _DrawLogoPDFIntoContext_cold_1();
  }
  v20 = v19;
  BoxRect = CGPDFPageGetBoxRect(v19, kCGPDFCropBox);
  if (a5 / BoxRect.size.width >= a6 / BoxRect.size.height)
    v21 = a6 / BoxRect.size.height;
  else
    v21 = a5 / BoxRect.size.width;
  CGContextTranslateCTM(c, a3, a4);
  CGAffineTransformMakeScale(&v22, v21, v21);
  CGContextConcatCTM(c, &v22);
  CGContextDrawPDFPage(c, v20);
  CGPDFDocumentRelease(v17);
  CGPDFPageRelease(v20);
  CGContextRestoreGState(c);

}

CFAttributedStringRef _CreateAttributedStringWithFontSize(const __CFString *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  const __CTFontDescriptor *v12;
  CTFontRef v13;
  __int128 *v14;
  __int128 v15;
  CGColorRef v16;
  CGFloat v17;
  const __CFDictionary *v18;
  CFAttributedStringRef v19;
  const void *v21[2];
  CGFloat components[2];
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0CA8418];
  v6 = *MEMORY[0x1E0CA8450];
  v25[0] = *MEMORY[0x1E0CA8430];
  v7 = *MEMORY[0x1E0CA84E8];
  v24[0] = v6;
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA84C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v26[1] = *MEMORY[0x1E0CA83D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = CTFontDescriptorCreateWithAttributes(v11);
  v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);
  if (_InitializeRGBColorSpace_onceToken != -1)
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  if (a2 == 100 || a2 == 2)
    v14 = &xmmword_1BD7FA648;
  else
    v14 = &xmmword_1BD7FA668;
  v15 = v14[1];
  *(_OWORD *)components = *v14;
  v23 = v15;
  v16 = CGColorCreate((CGColorSpaceRef)StandardRGB, components);
  v17 = *MEMORY[0x1E0CA8550];
  components[0] = *(CGFloat *)MEMORY[0x1E0CA8188];
  components[1] = v17;
  v21[0] = v13;
  v21[1] = v16;
  v18 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)components, v21, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v19 = CFAttributedStringCreate(0, a1, v18);
  CFRelease(v12);
  CFRelease(v18);
  CFRelease(v13);
  CGColorRelease(v16);

  return v19;
}

void sub_1BD7E9248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD7E986C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

id get_ASAccountSharingGroupMemberDataManagerClass()
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
  v0 = (void *)get_ASAccountSharingGroupMemberDataManagerClass_softClass;
  v7 = get_ASAccountSharingGroupMemberDataManagerClass_softClass;
  if (!get_ASAccountSharingGroupMemberDataManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke;
    v3[3] = &unk_1E7678A50;
    v3[4] = &v4;
    __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD7EEC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD7EF004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1BD7EF2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_1BD7EF534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_1BD7EF7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 112));
  _Unwind_Resume(a1);
}

uint64_t __getFLFollowUpActionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFLFollowUpControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFLFollowUpControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFLFollowUpItemClass_block_invoke_cold_1(v0);
}

uint64_t __getFLFollowUpItemClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getFLFollowUpNotificationClass_block_invoke_cold_1();
}

uint64_t __getFLFollowUpNotificationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFLHSA2LoginNotificationClass_block_invoke_cold_1(v0);
}

uint64_t __getFLHSA2LoginNotificationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1(v0);
}

uint64_t __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return getFLGroupIdentifierAccount_cold_1(v0);
}

uint64_t getFLGroupIdentifierAccount_cold_1()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return -[AKAppleIDProximityAuthenticationContext presentBasicLoginUIWithCompletion:].cold.1(v0);
}

void __getPASUIDependentViewPresenterClass_block_invoke_cold_1()
{
  void *v0;
  NSObject *v1;

  v0 = (void *)abort_report_np();
  -[AKFidoHook _startFidoRegistrationWithAttributes:completion:].cold.1(v0, v1);
}

void __getBPSRemoteUISetupStyleClass_block_invoke_cold_1()
{
  abort_report_np();
  -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:].cold.1();
}

uint64_t __getSFStrongPasswordGeneratorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AKPasswordGeneratorHook processElement:attributes:objectModel:completion:].cold.1(v0);
}

void __getAVPlayerViewControllerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  -[AKBasicLoginOptionsViewController _setupPrivacyLinkControllerWithContext:].cold.1(v0);
}

void __getASWebAuthenticationSessionClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  +[AKBiometricRatchetUtility setRatchetIdentifier:].cold.1(v0);
}

void __getVPPresenterViewClass_block_invoke_cold_1()
{
  abort_report_np();
  __getAAUICDPStingrayRemoteUIControllerClass_block_invoke_cold_1();
}

void __getAAUICDPStingrayRemoteUIControllerClass_block_invoke_cold_1()
{
  abort_report_np();
  -[AKInAppAuthenticationRemoteUIProvider presentProximityBroadcastUIWithCompletion:].cold.1();
}

void _DrawLogoPDFIntoContext_cold_1()
{
  __assert_rtn("_DrawLogoPDFIntoContext", "AKAuthorizationAppleIDButtonDrawing.m", 365, "page");
}

uint64_t AKErrorUnderlyingError()
{
  return MEMORY[0x1E0D00008]();
}

uint64_t AKLocStringFromServiceType()
{
  return MEMORY[0x1E0D00028]();
}

uint64_t AKSharedDevicePasscodePromptAlertMessageWithServiceType()
{
  return MEMORY[0x1E0D000B0]();
}

uint64_t AKSignInStringFromServiceType()
{
  return MEMORY[0x1E0D000B8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15418]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x1E0C9C1A0](c, page);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF60](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF98](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9CFA0](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x1E0C9CFC8](document);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D090](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGPDFPageRelease(CGPDFPageRef page)
{
  MEMORY[0x1E0C9D0E0](page);
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9D0F8](page);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0CEBAE8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

uint64_t _AKLogFido()
{
  return MEMORY[0x1E0D002D8]();
}

uint64_t _AKLogSiwa()
{
  return MEMORY[0x1E0D002E0]();
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x1E0D002E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

