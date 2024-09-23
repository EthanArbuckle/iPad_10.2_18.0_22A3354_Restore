void sub_1B3FA7A88(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

unint64_t CHHash(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  unint64_t v10;
  unint64_t i;
  uint64_t *v12;
  uint64_t *v13;

  if (result)
  {
    v10 = result;
    v13 = &a10;
    result = a9;
    if (v10 != 1)
    {
      for (i = 2; i <= v10; ++i)
      {
        v12 = v13++;
        result ^= __ROR8__(*v12, -(0x40 / i));
      }
    }
  }
  return result;
}

const __CFString *CHCallerIdAvailabilityAsString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E67474F0[a1];
}

void sub_1B3FABC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B3FAD6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FAD81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FADA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FADD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FAE91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FAF0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FAF200(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FAF36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FAF6E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1B3FAF7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FAFB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

id getMobileUserLibraryDirectoryPath()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/var/mobile"), 1);
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("Library"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t getDBDirCreateOptions()
{
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB2AE0], *MEMORY[0x1E0CB2AD8], 0);
}

uint64_t createDirectoryAtPath(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = *MEMORY[0x1E0C999D0];
  v20[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "resourceValuesForKeys:error:", v6, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) != 0)
    {
      v11 = 1;
      goto LABEL_11;
    }
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "SharedUtilities");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      createDirectoryAtPath_cold_2((uint64_t)v3, v15);
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "code") != 260)
    goto LABEL_6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v11 = 1;
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, v4, &v18);
  v8 = v18;

  if ((v13 & 1) == 0)
  {
LABEL_6:
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logHandleForDomain:", "SharedUtilities");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      createDirectoryAtPath_cold_1((uint64_t)v3, (uint64_t)v8, v15);
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

void sub_1B3FB0E84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *getBoolAsString(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

void sub_1B3FB19FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FB2198(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void __maybeLogVersionInfo_block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  char *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logHandleForDomain:", "SharedUtilities");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (char *)MGCopyAnswer();
    v3 = v13;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "OS version:     %{public}@", (uint8_t *)&v12, 0xCu);

  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "SharedUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CHGetRootVersionString();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Version:        %{public}@", (uint8_t *)&v12, 0xCu);

  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logHandleForDomain:", "SharedUtilities");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446210;
    v13 = "16.100.1.2.6~1";
    _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Build revision: %{public}s", (uint8_t *)&v12, 0xCu);
  }

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandleForDomain:", "SharedUtilities");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446210;
    v13 = "stock";
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "Build reason:   %{public}s", (uint8_t *)&v12, 0xCu);
  }

}

id CHGetRootVersionString()
{
  if (CHGetRootVersionString_sOnce != -1)
    dispatch_once(&CHGetRootVersionString_sOnce, &__block_literal_global_6);
  return (id)CHGetRootVersionString_version;
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

void sub_1B3FB2FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const __CFString *getBootUpResultAsString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Undefined");
  else
    return off_1E6746568[(char)a1];
}

void sub_1B3FB91C0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B3FB92A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FB9360(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FB9930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FB9B58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ch_allEmails_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ch_allPhoneNumbers_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByApplyingSelector:", sel_stringValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ch_allPhoneNumberLastFourDigits_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByApplyingSelector:", sel_lastFourDigits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *getCHNotifyDataStoreChangeReasonAsString(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("Undefined");
  else
    return off_1E6746678[(char)a1];
}

void sub_1B3FBA2DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ch_framework_log()
{
  if (ch_framework_log_onceToken != -1)
    dispatch_once(&ch_framework_log_onceToken, &__block_literal_global_5);
  return ch_framework_log_sLog;
}

os_log_t __ch_framework_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.callhistory", "CallHistory.framework");
  ch_framework_log_sLog = (uint64_t)result;
  return result;
}

uint64_t ch_security_log()
{
  if (ch_security_log_onceToken != -1)
    dispatch_once(&ch_security_log_onceToken, &__block_literal_global_4_0);
  return ch_security_log_sLog;
}

os_log_t __ch_security_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.callhistory", "Security");
  ch_security_log_sLog = (uint64_t)result;
  return result;
}

void sub_1B3FBB02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary()
{
  void *v0;

  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

id CHPhoneNumberNormalizedPhoneNumberString(uint64_t a1, void *a2)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  const void *v6;
  void *String;

  v2 = a2;
  v3 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses();
  if (v3)
  {
    v4 = v3;
    if (CFStringGetLength(v3) < 1)
    {
      String = 0;
    }
    else
    {
      v5 = CFPhoneNumberCreate();
      if (!v5 || (v6 = (const void *)v5, String = (void *)CFPhoneNumberCreateString(), CFRelease(v6), !String))
      {
        CFRetain(v4);
        String = (void *)v4;
      }
    }
    CFRelease(v4);
  }
  else
  {
    String = 0;
  }

  return String;
}

void sub_1B3FBC2B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FBC328(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FBC4AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FBE114(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC1234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC1780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC1928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC1AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC1F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC21A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC266C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1B3FC2A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC2C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC2F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *CHGetDataStoreFileExtension()
{
  return CFSTR("storedata");
}

id CHGetUserCallHistoryDataStoreDirectoryURL()
{
  if (CHGetUserCallHistoryDataStoreDirectoryURL_onceToken != -1)
    dispatch_once(&CHGetUserCallHistoryDataStoreDirectoryURL_onceToken, &__block_literal_global_8);
  return (id)CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL;
}

id CHGetUserCallHistoryDataStoreClassCFileURL()
{
  if (CHGetUserCallHistoryDataStoreClassCFileURL_onceToken != -1)
    dispatch_once(&CHGetUserCallHistoryDataStoreClassCFileURL_onceToken, &__block_literal_global_10);
  return (id)CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL;
}

id CHGetUserCallHistoryDataStoreClassDFileURL()
{
  if (CHGetUserCallHistoryDataStoreClassDFileURL_onceToken != -1)
    dispatch_once(&CHGetUserCallHistoryDataStoreClassDFileURL_onceToken, &__block_literal_global_11);
  return (id)CHGetUserCallHistoryDataStoreClassDFileURL_sFileURL;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const __CFString *getDBMErrorCodeAsString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("undefined");
  else
    return off_1E6746CD8[a1];
}

void sub_1B3FC9BB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B3FC9DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC9F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FCA1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FCB7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

id DeserializeTransactions(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  DeserializedTransaction *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "record");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "record");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        +[CHRecentCall unarchivedObjectFromData:error:](CHRecentCall, "unarchivedObjectFromData:error:", v9, &v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v24;

        if (v10)
        {
          v12 = objc_msgSend(v7, "transactionType");
          objc_msgSend(v10, "uniqueId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            if (v12 <= 2)
            {
              v14 = -[DeserializedTransaction initWithCall:andType:]([DeserializedTransaction alloc], "initWithCall:andType:", v10, v12);
              objc_msgSend(v23, "addObject:", v14);
              goto LABEL_17;
            }
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logHandleForDomain:", "intent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v21;
            if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
              DeserializeTransactions_cold_1(v33, v12, &v34, &v14->super);
          }
          else
          {
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "logHandleForDomain:", "intent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v17;
            if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
            {
              +[CHTransaction toString:](CHTransaction, "toString:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "remoteParticipantHandles");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v30 = v18;
              v31 = 2112;
              v32 = v19;
              _os_log_impl(&dword_1B3FA4000, &v14->super, OS_LOG_TYPE_DEFAULT, "Dropping %{public}@ transaction for recent call with remote participant handles %@ since it has a nil unique ID", buf, 0x16u);

            }
          }

        }
        else
        {
          +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logHandleForDomain:", "intent");
          v14 = (DeserializedTransaction *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v8;
            v31 = 2114;
            v32 = v11;
            _os_log_error_impl(&dword_1B3FA4000, &v14->super, OS_LOG_TYPE_ERROR, "Failing to unarchive the specified value: %{public}@ %{public}@", buf, 0x16u);
          }
        }
LABEL_17:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v4);
  }

  return v23;
}

void HandleInteractionsForDeserializedTransactions(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type", (_QWORD)v15);
        if (v12 == 2)
        {
          objc_msgSend(v11, "call");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uniqueId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        else
        {
          if (v12)
            continue;
          objc_msgSend(v11, "call");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "donateCallHistoryInteractionWithCall:", v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "deleteInteractionWithCalls:", v5);
}

void sub_1B3FD03C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSharedGEOPhoneNumberResolver()
{
  if (getSharedGEOPhoneNumberResolver_onceToken != -1)
    dispatch_once(&getSharedGEOPhoneNumberResolver_onceToken, &__block_literal_global_10);
  return (id)getSharedGEOPhoneNumberResolver_instance;
}

void __getSharedGEOPhoneNumberResolver_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D27328]);
  v1 = (void *)getSharedGEOPhoneNumberResolver_instance;
  getSharedGEOPhoneNumberResolver_instance = (uint64_t)v0;

}

void sub_1B3FD1F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1B3FD4384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B3FD4494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void notifyClientsOfEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandleForDomain:", "SharedUtilities");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Firing %{public}@ notification: %{public}@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __notifyClientsOfEvent_block_invoke;
  v10[3] = &unk_1E6746520;
  v11 = v3;
  v12 = v4;
  v8 = v4;
  v9 = v3;
  dispatch_async(v7, v10);

}

void __notifyClientsOfEvent_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

id getLoggedInUserName()
{
  size_t v0;
  char *v1;
  uid_t v2;
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v7;
  passwd *v8;
  passwd v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = sysconf(71);
  v1 = (char *)&v7 - ((MEMORY[0x1E0C80A78]() + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(&v9, 0, sizeof(v9));
  v8 = 0;
  v2 = getuid();
  v3 = getpwuid_r(v2, &v9, v1, v0, &v8);
  v4 = 0;
  if (v3)
    v5 = 1;
  else
    v5 = v8 == 0;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9.pw_name);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

const __CFString *getDBLErrorCodeAsString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("undefined");
  else
    return off_1E6747320[(char)a1];
}

void maybeLogVersionInfo()
{
  if (maybeLogVersionInfo_sLogVersion != -1)
    dispatch_once(&maybeLogVersionInfo_sLogVersion, &__block_literal_global_12);
}

uint64_t getOperatingSystemVersion()
{
  return MGCopyAnswer();
}

id maybeAppendStringWithSeparator(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v6;
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

id getMobileUserDirectoryPath()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/var/mobile"), 1);
}

uint64_t isInternalBuild()
{
  if (_QueryBuildInformation_once != -1)
    dispatch_once(&_QueryBuildInformation_once, &__block_literal_global_51);
  return _IsInternalBuildCached;
}

uint64_t isCarrierBuild()
{
  if (_QueryBuildInformation_once != -1)
    dispatch_once(&_QueryBuildInformation_once, &__block_literal_global_51);
  return _IsCarrierBuildCached;
}

uint64_t createBackgroundTaskAssertion()
{
  getpid();
  return SBSProcessAssertionCreateForPID();
}

uint64_t CHSchemaGetCurrentVersion()
{
  return 34;
}

void sub_1B3FD6A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getCNContactFetchRequestClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNContactFetchRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactFetchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactFetchRequestClass_block_invoke_cold_1();
    ContactsLibrary();
  }
}

void ContactsLibrary()
{
  void *v0;

  if (!ContactsLibraryCore_frameworkLibrary)
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

NSString *__getCNContactClass_block_invoke(uint64_t a1)
{
  NSString *result;
  CHRecentCall *v3;
  SEL v4;

  ContactsLibrary();
  result = (NSString *)objc_getClass("CNContact");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CHRecentCall *)__getCNContactClass_block_invoke_cold_1();
    return -[CHRecentCall notificationThreadIdentifier](v3, v4);
  }
  return result;
}

void sub_1B3FD7634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B3FD7948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void DeserializeTransactions_cold_1(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  +[CHTransaction toString:](CHTransaction, "toString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B3FA4000, a4, OS_LOG_TYPE_ERROR, "Transaction type %{public}@ not supported (yet)", a1, 0xCu);

}

void createDirectoryAtPath_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "CallHistory: Directory creation failed at location %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void createDirectoryAtPath_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_ERROR, "CallHistory: Expected a directory at location %{public}@ but found a file", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCNContactFetchRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[EncryptionTransformer transformedValue:].cold.1(v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1E0DE2B40]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1E0D17860]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x1E0DAB8F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _PNCopyStrippedNumberWithoutPauses()
{
  return MEMORY[0x1E0D178C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1E0DDFE90]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

