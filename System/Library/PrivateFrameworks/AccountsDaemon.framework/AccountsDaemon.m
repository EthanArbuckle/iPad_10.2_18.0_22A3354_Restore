void sub_20D8CE4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id obj, id *a12, id *a13, id *a14, id *location)
{
  objc_sync_exit(obj);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)&STACK[0x260]);
  objc_destroyWeak((id *)&STACK[0x268]);
  _Unwind_Resume(a1);
}

id _ACDConnectionLogSystem()
{
  if (_ACDConnectionLogSystem_onceToken != -1)
    dispatch_once(&_ACDConnectionLogSystem_onceToken, &__block_literal_global_3);
  return (id)_ACDConnectionLogSystem_log;
}

id ac_unfair_lock_perform_with_result(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_20D8CF0E4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8CF0F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id ac_unfair_lock_perform_with_result_0(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_20D8CF164(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8CF178(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id ac_unfair_lock_perform_with_result_1(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_20D8CF1E4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8CF1F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8CFC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D8D01C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D03C4()
{
  objc_end_catch();
  JUMPOUT(0x20D8D03D0);
}

void sub_20D8D0898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8D0DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D0F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _ACDEntitlementLogSystem()
{
  if (_ACDEntitlementLogSystem_onceToken != -1)
    dispatch_once(&_ACDEntitlementLogSystem_onceToken, &__block_literal_global_13);
  return (id)_ACDEntitlementLogSystem_log;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D8D13A8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D13BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8D2BBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ACDLogSystem()
{
  if (_ACDLogSystem_onceToken != -1)
    dispatch_once(&_ACDLogSystem_onceToken, &__block_literal_global_3);
  return (id)_ACDLogSystem_log;
}

void sub_20D8D3360(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D3370()
{
  __break(1u);
}

void sub_20D8D3398()
{
  objc_end_catch();
  JUMPOUT(0x20D8D33A0);
}

void sub_20D8D3518(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D352C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8D362C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D3640(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8D38F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D8D3A24(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D3A38(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8D3D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D42B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D4550(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20D8D5794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D5CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D5DE4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D5DF4()
{
  __break(1u);
}

void sub_20D8D5E1C()
{
  objc_end_catch();
  JUMPOUT(0x20D8D5E24);
}

id _ACDKeychainLogSystem()
{
  if (_ACDKeychainLogSystem_onceToken != -1)
    dispatch_once(&_ACDKeychainLogSystem_onceToken, &__block_literal_global_5);
  return (id)_ACDKeychainLogSystem_log;
}

void sub_20D8D69B8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D69CC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8D6E90(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D6EA0()
{
  __break(1u);
}

void sub_20D8D6EC8()
{
  objc_end_catch();
  JUMPOUT(0x20D8D6ED0);
}

void sub_20D8D7004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D8D72CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8D811C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

#error "20D8D89D8: call analysis failed (funcsize=37)"

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_0_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_4(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 56));
}

void OUTLINED_FUNCTION_2_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return objc_opt_class();
}

const char *OUTLINED_FUNCTION_3_3()
{
  const char *v0;

  return sel_getName(v0);
}

void sub_20D8D9060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D92B0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8D92C4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

__CFString *tetheredSyncSourceTypeForDataType()
{
  uint64_t v0;
  const __CFDictionary *v1;
  CFTypeID TypeID;
  void *v3;
  void *v4;
  __CFString *v5;

  if (lockdown_connect())
  {
    v0 = lockdown_copy_value();
    if (v0)
    {
      v1 = (const __CFDictionary *)v0;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v1))
      {
        CFDictionaryGetValue(v1, CFSTR("SyncingOS"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        if (v3)
          v5 = v3;
        else
          v5 = CFSTR("iPhone");

      }
      else
      {
        v5 = CFSTR("iPhone");
      }
      CFRelease(v1);
    }
    else
    {
      v5 = CFSTR("iPhone");
    }
    lockdown_disconnect();
  }
  else
  {
    v5 = CFSTR("iPhone");
  }
  return v5;
}

uint64_t syncDataTypeForDataclass(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB45E0]))
  {
    v2 = kACDSyncDataTypeMailAccounts;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB4598]))
  {
    v2 = kACDSyncDataTypeContacts;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB4580]) & 1) != 0
         || objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB4620]))
  {
    v2 = kACDSyncDataTypeCalendars;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB4560]))
  {
    v2 = kACDSyncDataTypeBookmarks;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB4608]))
  {
    v2 = kACDSyncDataTypeNotes;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_20D8D98DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8D9D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8DAF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20D8DB678(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20D8DBBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8DC10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8DC75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8DCD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8DD888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_20D8DDF78(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8DDF8C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8DE0FC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8DE110(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8DE2D0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8DE2E0()
{
  __break(1u);
}

void sub_20D8DE308()
{
  objc_end_catch();
  JUMPOUT(0x20D8DE310);
}

void sub_20D8DE8AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DE940(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEA04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEAA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEB30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEBB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEC24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8DEE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8E9000(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8E9014(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8E9140(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D8E920C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8E9220(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8E97DC(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20D8E9938(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D8E9A08(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8E9A1C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8E9EE8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8E9EFC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8EA07C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8EA090(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8EA358(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_20D8EA36C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _ACDManagedObjectModel()
{
  if (_ACDManagedObjectModel_onceToken != -1)
    dispatch_once(&_ACDManagedObjectModel_onceToken, &__block_literal_global);
  return (id)_ACDManagedObjectModel_managedObjectModel;
}

void sub_20D8EB304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8EB4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20D8EB658(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const __CFString *a11, id a12, const __CFString *a13, id a14, __int128 buf)
{
  _QWORD *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_DEFAULT, "\"Caught an exception during the first attempt to open the Accounts DB: %@\"", (uint8_t *)&buf, 0xCu);
    }

    if (v15)
    {
      objc_msgSend(v16, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDBB568];
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDBB568]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD1540];
      if (v20)
      {
        v21 = objc_msgSend(v20, "integerValue");
        a13 = CFSTR("TriggeringException");
        a14 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a14, &a13, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v19, v21, v22);
      }
      else
      {
        a11 = CFSTR("TriggeringException");
        a12 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, v22);
      }
      *v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_end_catch();
    JUMPOUT(0x20D8EB608);
  }
  _Unwind_Resume(a1);
}

void sub_20D8EBCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D8EC4C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const __CFString *a11, id a12, const __CFString *a13, id a14, __int128 buf)
{
  _QWORD *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_DEFAULT, "\"Caught an exception during the first attempt to open the Accounts DB: %@\"", (uint8_t *)&buf, 0xCu);
    }

    if (v15)
    {
      objc_msgSend(v16, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDBB568];
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDBB568]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD1540];
      if (v20)
      {
        v21 = objc_msgSend(v20, "integerValue");
        a13 = CFSTR("TriggeringException");
        a14 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a14, &a13, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v19, v21, v22);
      }
      else
      {
        a11 = CFSTR("TriggeringException");
        a12 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, v22);
      }
      *v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_end_catch();
    JUMPOUT(0x20D8EC470);
  }
  _Unwind_Resume(a1);
}

void sub_20D8ECDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8ED334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F1C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F1FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F2270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F2420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F27C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F301C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F3370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F36D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F3BF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F3FB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F4188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F4728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F49CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F4CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F51A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F54F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F57CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F5984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F5C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_20D8F61CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F65A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F6998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F72F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D8F7530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20D8F7BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F9164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8F94F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8FA168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8FA6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8FBEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20D8FC6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_26(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_29(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_31(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2112;
  *(_QWORD *)(a4 + 14) = v4;
  return result;
}

id OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return objc_loadWeakRetained((id *)(a1 + v1));
}

id ExplicitAllowedPluginsByChangeType()
{
  if (ExplicitAllowedPluginsByChangeType_onceToken != -1)
    dispatch_once(&ExplicitAllowedPluginsByChangeType_onceToken, &__block_literal_global_2);
  return (id)ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType;
}

const __CFString *ACDStringFromChangeType(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_24C7E2A80[a1 - 1];
}

void sub_20D8FF1B8(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8FF1E0(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x20D8FF1ECLL);
}

void sub_20D8FFBDC(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D8FFC04(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x20D8FFC10);
}

void sub_20D90036C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D90038C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x20D900398);
}

void sub_20D900AF4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20D900B14(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x20D900B20);
}

void sub_20D901EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20D902248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _ACDNotificationLogSystem()
{
  if (_ACDNotificationLogSystem_onceToken != -1)
    dispatch_once(&_ACDNotificationLogSystem_onceToken, &__block_literal_global_7);
  return (id)_ACDNotificationLogSystem_log;
}

id _ACDPluginLogSystem()
{
  if (_ACDPluginLogSystem_onceToken != -1)
    dispatch_once(&_ACDPluginLogSystem_onceToken, &__block_literal_global_9);
  return (id)_ACDPluginLogSystem_log;
}

id _ACDSaveLogSystem()
{
  if (_ACDSaveLogSystem_onceToken != -1)
    dispatch_once(&_ACDSaveLogSystem_onceToken, &__block_literal_global_11);
  return (id)_ACDSaveLogSystem_log;
}

id _ACDNotificationSignpostSystem()
{
  if (_ACDNotificationSignpostSystem_onceToken != -1)
    dispatch_once(&_ACDNotificationSignpostSystem_onceToken, &__block_literal_global_15);
  return (id)_ACDNotificationSignpostSystem_log;
}

void ACDLogAccessRequest(void *a1, void *a2, int a3, uint64_t a4, double a5)
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v9 = a2;
  v10 = (objc_class *)MEMORY[0x24BDBCED8];
  v11 = a1;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", 5);
  +[ACDTCCUtilities _TCCServiceForAccountTypeID:](ACDTCCUtilities, "_TCCServiceForAccountTypeID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v13)
  {
    objc_msgSend(v12, "setObject:forKey:", &unk_24C7EF1E8, v9);
    objc_msgSend(v12, "setObject:forKey:", &unk_24C7EF1E8, v13);
    if (a3)
      v14 = &unk_24C7EF1E8;
    else
      v14 = &unk_24C7EF200;
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("response"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("jitVisible"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)-a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("jitVisibleTime"));

    if (ACDLogAccessRequest_onceToken != -1)
      dispatch_once(&ACDLogAccessRequest_onceToken, &__block_literal_global_26);
    if (ACDLogAccessRequest__loadedCRLogStructuredData)
    {
      ACDLogAccessRequest__loadedCRLogStructuredData(167, v12);
    }
    else
    {
      _ACDLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        ACDLogAccessRequest_cold_1(v17);

    }
  }

}

void _ACDLazyArrayInitializeIfNecessary(void *a1)
{
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;

  v1 = a1;
  v8 = v1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _ACDLazyArrayInitializeIfNecessary(ACDLazyArray * _Nonnull __strong)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ACDLazyArray.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self"));

    v1 = 0;
  }
  os_unfair_lock_lock(v1 + 2);
  v2 = *(_QWORD *)&v8[4]._os_unfair_lock_opaque;
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)&v8[6]._os_unfair_lock_opaque;
    *(_QWORD *)&v8[6]._os_unfair_lock_opaque = v3;

    v5 = *(void **)&v8[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v8[4]._os_unfair_lock_opaque = 0;

  }
  os_unfair_lock_unlock(v8 + 2);

}

void sub_20D9077DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(int a1, uint64_t a2, void *a3, const char *a4)
{
  id v7;
  NSObject *v8;

  v7 = a3;
  if (!a2 && a1)
  {
    _ACDPluginLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE_cold_1(v7, a4, v8);

  }
}

void sub_20D908AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D909BC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_20D90A92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D90AE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_20D90B0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D90B3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id decodeString(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v11 - v3;
  v5 = objc_retainAutorelease(v1);
  v6 = objc_msgSend(v5, "UTF8String");
  if (v2 < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = v2;
    do
    {
      v4[v7] = *(_BYTE *)(v6 + v7) - ((v7 + 1) & 1);
      ++v7;
    }
    while (v2 != v7);
  }
  v4[v8] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_20D90E254(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E318(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E460(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E6BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E76C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E834(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D90E8FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __HandleLanguageChangeNotification(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __HandleLanguageChangeNotification_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "_handleLanguageChangedDarwinNotification");

}

void sub_20D90F33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D9112F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20D911820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D911C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D912124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
}

void sub_20D912F10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D91492C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D914C20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D9151F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D9154E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D91574C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D916F58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D917288(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D917418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C7E34D8;
    v5 = 0;
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
    __getSimulateCrashSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CrashReporterSupportLibraryCore_frameworkLibrary, "SimulateCrash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20D918070(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;

  if (a2 == 1)
  {
    v22 = objc_begin_catch(exc_buf);
    _ACDLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseMigrator runReturningError:].cold.3();

    v24 = (void *)MEMORY[0x24BDD1540];
    *(_QWORD *)(v20 - 72) = CFSTR("TriggeringException");
    *(_QWORD *)(v20 - 64) = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20 - 64, v20 - 72, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 10000, v25);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v18)
      JUMPOUT(0x20D917FE8);
    JUMPOUT(0x20D917FDCLL);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose((const void *)(v20 - 104), 8);
  _Unwind_Resume(exc_buf);
}

void sub_20D918CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D918E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D919124(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D919000);
  }
  _Unwind_Resume(a1);
}

void sub_20D91EF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D91F0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D91F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D91F570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D91F800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D91FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D91FD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D921214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a25, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D92146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ACDAccountSyncEnabled()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncEnabled_cold_1();

  return 0;
}

uint64_t ACDAccountSyncAccountIsSyncable()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncEnabled_cold_1();

  return 0;
}

uint64_t ACDAccountSyncDevices()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncDevices_cold_1();

  return MEMORY[0x24BDBD1A8];
}

uint64_t ACDAccountSyncRemoveTombstones()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncRemoveTombstones_cold_1();

  return MEMORY[0x24BDBD1A8];
}

uint64_t ACDAccountSyncMarkAccountCreated()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncMarkAccountCreated_cold_1();

  return 0;
}

uint64_t ACDAccountSyncMarkAccountDeleted()
{
  NSObject *v0;

  _ACDLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ACDAccountSyncMarkAccountDeleted_cold_1();

  return 0;
}

uint64_t SetTetheredSyncingDisabledForDatatype(uint64_t a1, char a2, CFStringRef *a3)
{
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  CFTypeID TypeID;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *Mutable;
  const __CFNumber *v11;
  const __CFNumber *Value;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char valuePtr;

  valuePtr = a2;
  v5 = lockdown_connect();
  if (v5 && (v6 = lockdown_copy_value()) != 0)
  {
    v7 = (const __CFDictionary *)v6;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v7) && CFDictionaryGetCount(v7) >= 1)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Mutable = MutableCopy;
    CFRelease(v7);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  v11 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("DisableTethered"));
  if (Value && CFNumberCompare(v11, Value, 0) == kCFCompareEqualTo)
  {
    v13 = 0;
    if (!v11)
      goto LABEL_13;
    goto LABEL_12;
  }
  CFDictionarySetValue(Mutable, CFSTR("DisableTethered"), v11);
  v13 = 1;
  if (v11)
LABEL_12:
    CFRelease(v11);
LABEL_13:
  if (!v13 || (v14 = lockdown_set_value(), !(_DWORD)v14))
  {
    v16 = 0;
    if (!v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  v15 = v14;
  NSLog(CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a1, Mutable, CFSTR("com.apple.mobile.tethered_sync"), v14);
  if (a3)
    *a3 = CFStringCreateWithFormat(0, 0, CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a1, Mutable, CFSTR("com.apple.mobile.tethered_sync"), v15);
  v16 = 0xFFFFFFFFLL;
  if (v5)
LABEL_20:
    lockdown_disconnect();
LABEL_21:
  if (Mutable)
    CFRelease(Mutable);
  return v16;
}

uint64_t GetTetheredSyncingDisabledForDataType(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  uint64_t v4;
  const __CFDictionary *v5;
  CFTypeID TypeID;
  const __CFNumber *Value;

  if (a2)
  {
    *a2 = 0;
    result = lockdown_connect();
    if (result)
    {
      v4 = lockdown_copy_value();
      if (v4)
      {
        v5 = (const __CFDictionary *)v4;
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v5))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v5, CFSTR("DisableTethered"));
          if (Value)
            CFNumberGetValue(Value, kCFNumberCharType, a2);
        }
        lockdown_disconnect();
        CFRelease(v5);
      }
      else
      {
        lockdown_disconnect();
      }
      return 0;
    }
  }
  else
  {
    NSLog(CFSTR("No out disabled BOOLean passed to GetTetheredSyncingDisabledForDataType. What did you expect us to do?"));
    return 4294967293;
  }
  return result;
}

uint64_t SetAccountNameEnabledForDataType(const __CFString *a1, uint64_t a2, int a3, CFStringRef *a4)
{
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CFTypeID TypeID;
  CFMutableDictionaryRef MutableCopy;
  uint64_t v13;
  const __CFDictionary *Mutable;
  const __CFArray *Value;
  const __CFArray *v16;
  __CFArray *v17;
  CFIndex v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    return 0xFFFFFFFFLL;
  v8 = lockdown_connect();
  if (v8 && (v9 = lockdown_copy_value()) != 0)
  {
    v10 = (const __CFDictionary *)v9;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v10) && CFDictionaryGetCount(v10) >= 1)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v10);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Mutable = MutableCopy;
    CFRelease(v10);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("AccountNames"));
  if (Value)
    v16 = CFArrayCreateMutableCopy(0, 0, Value);
  else
    v16 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v17 = v16;
  v18 = _externalSourcesArrayIndexOfExternalSource(v16, a1);
  if (a3 || v18 < 0)
  {
    v13 = 0;
    if (a3 != 1 || v18 != -1)
      goto LABEL_24;
    CFArrayAppendValue(v17, a1);
  }
  else
  {
    CFArrayRemoveValueAtIndex(v17, v18);
  }
  CFDictionarySetValue(Mutable, CFSTR("AccountNames"), v17);
  v19 = lockdown_set_value();
  if (!(_DWORD)v19)
  {
    v13 = 0;
    if (!v8)
      goto LABEL_26;
    goto LABEL_25;
  }
  v20 = v19;
  NSLog(CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a2, Mutable, CFSTR("com.apple.mobile.data_sync"), v19);
  if (a4)
    *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a2, Mutable, CFSTR("com.apple.mobile.data_sync"), v20);
  v13 = 0xFFFFFFFFLL;
LABEL_24:
  if (v8)
LABEL_25:
    lockdown_disconnect();
LABEL_26:
  if (v17)
    CFRelease(v17);
  if (Mutable)
    CFRelease(Mutable);
  return v13;
}

uint64_t _externalSourcesArrayIndexOfExternalSource(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFString *ValueAtIndex;

  if (!a1)
    return -1;
  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return -1;
  v5 = Count;
  v6 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
    if (ValueAtIndex)
    {
      if (CFStringCompare(a2, ValueAtIndex, 0) == kCFCompareEqualTo)
        break;
    }
    if (v5 == ++v6)
      return -1;
  }
  return v6;
}

uint64_t SetExternalSourceEnabledForDataType(const __CFString *a1, uint64_t a2, int a3, CFStringRef *a4)
{
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CFTypeID TypeID;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *Mutable;
  const __CFArray *Value;
  const __CFArray *v15;
  __CFArray *v16;
  CFIndex v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = lockdown_connect();
  if (v8 && (v9 = lockdown_copy_value()) != 0)
  {
    v10 = (const __CFDictionary *)v9;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v10) && CFDictionaryGetCount(v10) >= 1)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v10);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Mutable = MutableCopy;
    CFRelease(v10);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("Sources"));
  if (Value)
    v15 = CFArrayCreateMutableCopy(0, 0, Value);
  else
    v15 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v16 = v15;
  v17 = _externalSourcesArrayIndexOfExternalSource(v15, a1);
  if (a3 || v17 < 0)
  {
    v18 = 0;
    if (a3 != 1 || v17 != -1)
      goto LABEL_22;
    CFArrayAppendValue(v16, a1);
  }
  else
  {
    CFArrayRemoveValueAtIndex(v16, v17);
  }
  CFDictionarySetValue(Mutable, CFSTR("Sources"), v16);
  v19 = lockdown_set_value();
  if ((_DWORD)v19)
  {
    v20 = v19;
    NSLog(CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a2, Mutable, CFSTR("com.apple.mobile.data_sync"), v19);
    if (a4)
      *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not set the lockdown key %@ with %@ for %@: %d"), a2, Mutable, CFSTR("com.apple.mobile.data_sync"), v20);
    v18 = 0xFFFFFFFFLL;
LABEL_22:
    if (!v8)
      goto LABEL_24;
    goto LABEL_23;
  }
  v18 = 0;
  if (v8)
LABEL_23:
    lockdown_disconnect();
LABEL_24:
  if (v16)
    CFRelease(v16);
  if (Mutable)
    CFRelease(Mutable);
  return v18;
}

uint64_t CopyExternalSourcesEnabledForDataType(const void *a1, _QWORD *a2, _QWORD *a3)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const void *Value;

  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  v4 = (const __CFDictionary *)_copyLockdownDataSourceDictForDataType(a1);
  if (v4)
  {
    v5 = v4;
    if (a2)
    {
      Value = CFDictionaryGetValue(v4, CFSTR("Sources"));
      *a2 = Value;
      if (Value)
        CFRetain(Value);
    }
    CFRelease(v5);
  }
  return 0;
}

const void *_copyLockdownDataSourceDictForDataType(const void *a1)
{
  uint64_t v2;
  const void *v3;
  CFTypeID TypeID;
  const void *Value;
  const void *v6;

  if (!lockdown_connect())
    return 0;
  v2 = lockdown_copy_value();
  if (!v2)
  {
LABEL_9:
    lockdown_disconnect();
    return 0;
  }
  v3 = (const void *)v2;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3) || CFDictionaryGetCount((CFDictionaryRef)v3) <= 0)
  {
    CFRelease(v3);
    goto LABEL_9;
  }
  lockdown_disconnect();
  Value = CFDictionaryGetValue((CFDictionaryRef)v3, a1);
  v6 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v3);
  return v6;
}

uint64_t CopyAccountNamesEnabledForDataType(const void *a1, _QWORD *a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const void *Value;

  v3 = (const __CFDictionary *)_copyLockdownDataSourceDictForDataType(a1);
  if (v3)
  {
    v4 = v3;
    if (a2)
    {
      Value = CFDictionaryGetValue(v3, CFSTR("AccountNames"));
      *a2 = Value;
      if (Value)
        CFRetain(Value);
    }
    CFRelease(v4);
  }
  return 0;
}

void sub_20D92296C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ACDSetForKeyInBundle(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForInfoDictionaryKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }

    v8 = objc_alloc(MEMORY[0x24BDBCF20]);
    v9 = (void *)objc_msgSend(v8, "initWithArray:", v3, v11);
  }
  else
  {
LABEL_12:
    v9 = 0;
  }

  return v9;
}

void sub_20D922B4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D922BC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D922C34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D922F90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  v2 = sub_20D9373E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BEE4B08];
  v11 = MEMORY[0x24BEE4B08];
  v7 = MEMORY[0x212BAC3E0](v1);
  if (v7 == sub_20D937360())
  {
    swift_unknownObjectRetain();
    v8 = sub_20D9373F0();
    MEMORY[0x24BDAC7A8](v8);
    *(&v10 - 2) = (uint64_t)v5;
    *(&v10 - 1) = (uint64_t)&v11;
    sub_20D9373D8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v11;
  }
  return v6;
}

uint64_t sub_20D923084(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = MEMORY[0x212BAC3E0](a2);
  result = sub_20D937378();
  if (v2 == result)
  {
    result = sub_20D9373FC();
    if (v4)
    {
      sub_20D927C0C(&v5, result, v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t XPCEventSubscriberFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t XPCEventSubscriberFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static XPCEventSubscriberFlags.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static XPCEventSubscriberFlags.entitled.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

_QWORD *sub_20D923138@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_20D923144(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_20D92314C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_20D923160@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_20D923174@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_20D923188(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_20D9231B8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_20D9231E4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_20D923208(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_20D92321C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_20D923230(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_20D923244@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_20D923258(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_20D92326C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_20D923280(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_20D923294()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_20D9232A4()
{
  return sub_20D9375AC();
}

_QWORD *sub_20D9232BC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_20D9232D0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20D9232E0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_20D9232EC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D923304@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

id XPCEventSubscriber.init(handle:descriptor:flags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  id result;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  BOOL v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  _QWORD *v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54D98);
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20D93739C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a3;
  swift_unknownObjectRetain();
  sub_20D9373B4();
  v53 = v13;
  v15 = sub_20D937390();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v45 = v14;
    v46 = v11;
    v47 = v10;
    v48 = a2;
    v49 = a1;
    v50 = a4;
    v17 = (void *)objc_opt_self();
    v18 = 0;
    v44 = v15;
    v19 = v15 + 32;
    v54 = MEMORY[0x24BEE4B00];
    v52 = v15 + 32;
    while (1)
    {
      v20 = (uint64_t *)(v19 + 16 * v18);
      v22 = *v20;
      v21 = v20[1];
      swift_bridgeObjectRetain();
      result = objc_msgSend(v17, sel_allIdentifiers, v44);
      if (!result)
        break;
      v24 = result;
      v25 = sub_20D937528();

      if (*(_QWORD *)(v25 + 16)
        && (sub_20D93769C(),
            sub_20D93748C(),
            v26 = sub_20D9376A8(),
            v27 = -1 << *(_BYTE *)(v25 + 32),
            v28 = v26 & ~v27,
            ((*(_QWORD *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) != 0))
      {
        v29 = v17;
        v30 = *(_QWORD *)(v25 + 48);
        v31 = (_QWORD *)(v30 + 16 * v28);
        v32 = *v31 == v22 && v31[1] == v21;
        if (v32 || (sub_20D937660() & 1) != 0)
        {
LABEL_13:
          swift_bridgeObjectRelease();
          v33 = (uint64_t)v51;
          sub_20D9373A8();
          sub_20D923774(v33, (uint64_t)v56);
          v34 = v56[0];
          v36 = v57;
          v35 = v58;
          v37 = v59;
          v38 = v54;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v55 = v38;
          sub_20D92A360(v34, v36, v35, v37, v22, v21, isUniquelyReferenced_nonNull_native);
          v54 = v55;
          swift_bridgeObjectRelease();
        }
        else
        {
          v40 = ~v27;
          while (1)
          {
            v28 = (v28 + 1) & v40;
            if (((*(_QWORD *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
              break;
            v41 = (_QWORD *)(v30 + 16 * v28);
            v42 = *v41 == v22 && v41[1] == v21;
            if (v42 || (sub_20D937660() & 1) != 0)
              goto LABEL_13;
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        v17 = v29;
        v19 = v52;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      if (++v18 == v16)
      {
        swift_bridgeObjectRelease();
        a1 = v49;
        a4 = v50;
        v10 = v47;
        v14 = v45;
        v11 = v46;
        v43 = v54;
        goto LABEL_26;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v43 = MEMORY[0x24BEE4B00];
LABEL_26:
    swift_unknownObjectRelease();
    result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v53, v10);
    *a4 = a1;
    a4[1] = v14;
    a4[2] = v43;
  }
  return result;
}

BOOL sub_20D9236A8(unsigned int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = MEMORY[0x212BAB7A4](*(_QWORD *)(a2 + 40), a1, 4);
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_DWORD *)(v8 + 4 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_20D923774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v40 = a2;
  v3 = sub_20D9373E4();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54D98);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v37 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v37 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v37 - v16;
  sub_20D92DBF4(a1, (uint64_t)v37 - v16, (uint64_t *)&unk_253E54D98);
  v18 = sub_20D93739C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v20(v17, 1, v18) == 1)
  {
    sub_20D92D068((uint64_t)v17, (uint64_t *)&unk_253E54D98);
    v21 = 0;
  }
  else
  {
    v22 = sub_20D9373C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
    v21 = v22 & 1;
  }
  v42 = v21;
  v41 = MEMORY[0x24BEE4B08];
  sub_20D92DBF4(a1, (uint64_t)v15, (uint64_t *)&unk_253E54D98);
  if (v20(v15, 1, v18) == 1)
  {
    sub_20D92D068((uint64_t)v15, (uint64_t *)&unk_253E54D98);
  }
  else
  {
    v23 = sub_20D9373CC();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v18);
    if (v23)
    {
      v24 = MEMORY[0x212BAC3E0](v23);
      if (v24 == sub_20D937360())
      {
        swift_unknownObjectRetain();
        v36 = sub_20D9373F0();
        v37[1] = v37;
        MEMORY[0x24BDAC7A8](v36);
        v37[-2] = v5;
        v37[-1] = &v41;
        sub_20D9373D8();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  v25 = v19;
  v26 = v41;
  sub_20D92DBF4(a1, (uint64_t)v12, (uint64_t *)&unk_253E54D98);
  v27 = v20(v12, 1, v18);
  swift_bridgeObjectRetain();
  if (v27 == 1)
  {
    sub_20D92D068((uint64_t)v12, (uint64_t *)&unk_253E54D98);
  }
  else
  {
    v28 = sub_20D9373CC();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v18);
    if (v28)
    {
      v29 = sub_20D922F90();
      swift_unknownObjectRelease();
      goto LABEL_14;
    }
  }
  v29 = MEMORY[0x24BEE4B08];
LABEL_14:
  v30 = sub_20D924334(v29);
  swift_bridgeObjectRelease();
  v31 = sub_20D92C8B0(v30);
  swift_bridgeObjectRelease();
  sub_20D92DBF4(a1, (uint64_t)v9, (uint64_t *)&unk_253E54D98);
  if (v20(v9, 1, v18) == 1)
  {
    sub_20D92D068((uint64_t)v9, (uint64_t *)&unk_253E54D98);
LABEL_18:
    v33 = MEMORY[0x24BEE4B08];
    goto LABEL_19;
  }
  v32 = sub_20D9373CC();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v18);
  if (!v32)
    goto LABEL_18;
  v33 = sub_20D922F90();
  swift_unknownObjectRelease();
LABEL_19:
  v34 = v40;
  sub_20D92D068(a1, (uint64_t *)&unk_253E54D98);
  result = swift_bridgeObjectRelease();
  *(_BYTE *)v34 = v42;
  *(_QWORD *)(v34 + 8) = v26;
  *(_QWORD *)(v34 + 16) = v33;
  *(_QWORD *)(v34 + 24) = v31;
  return result;
}

void XPCEventSubscriber.caresAbout(account:changeType:)(void *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = objc_msgSend(a1, sel_accountType);
  if (!v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, sel_identifier);

  if (!v8)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v9 = sub_20D937468();
  v11 = v10;

  if (*(_QWORD *)(v5 + 16) && (sub_20D929B10(v9, v11), (v12 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_20D923D04(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_20D923D04(void *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t result;
  int64_t v23;
  char v24;
  id v25;
  unint64_t v26;
  unint64_t i;
  id v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;

  if ((*(_BYTE *)v2 & 1) != 0)
    return 1;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  if (sub_20D9236A8(a2, *(_QWORD *)(v2 + 8)))
    return 1;
  v6 = objc_msgSend(a1, sel_dirtyProperties);
  if (v6)
  {
    v7 = v6;
    v8 = sub_20D937528();

    v9 = *(_QWORD *)(sub_20D92ABE0(v4, v8, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_20D92B3F0)+ 16);
    swift_release();
    if (v9)
      return 1;
  }
  v10 = objc_msgSend(a1, sel_dirtyAccountProperties);
  if (v10)
  {
    v11 = v10;
    v12 = sub_20D937528();

    v13 = *(_QWORD *)(sub_20D92ABE0(v4, v12, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_20D92B3F0)+ 16);
    swift_release();
    if (v13)
      return 1;
  }
  v14 = objc_msgSend(a1, sel_dirtyDataclassProperties);
  if (v14)
  {
    v15 = v14;
    type metadata accessor for Dataclass(0);
    sub_20D92D6A0((unint64_t *)&unk_253E54E30, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BB5C);
    v16 = sub_20D937528();

    v17 = *(_QWORD *)(sub_20D92ABE0(v5, v16, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_20D92AD6C)+ 16);
    swift_release();
    if (v17)
      return 1;
  }
  v49 = v5 + 56;
  v18 = 1 << *(_BYTE *)(v5 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & *(_QWORD *)(v5 + 56);
  v50 = (unint64_t)(v18 + 63) >> 6;
  v21 = (void *)*MEMORY[0x24BDB4198];
  result = swift_bridgeObjectRetain();
  v23 = 0;
  v51 = v5;
  if (v20)
    goto LABEL_15;
LABEL_17:
  v29 = v23 + 1;
  if (!__OFADD__(v23, 1))
  {
    if (v29 < v50)
    {
      v30 = *(_QWORD *)(v49 + 8 * v29);
      ++v23;
      if (v30)
        goto LABEL_30;
      v23 = v29 + 1;
      if (v29 + 1 >= v50)
        goto LABEL_45;
      v30 = *(_QWORD *)(v49 + 8 * v23);
      if (v30)
        goto LABEL_30;
      v23 = v29 + 2;
      if (v29 + 2 >= v50)
        goto LABEL_45;
      v30 = *(_QWORD *)(v49 + 8 * v23);
      if (v30)
      {
LABEL_30:
        v20 = (v30 - 1) & v30;
        for (i = __clz(__rbit64(v30)) + (v23 << 6); ; i = v26 | (v23 << 6))
        {
          v32 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * i);
          v33 = objc_msgSend(a1, sel_changeTypeForEnabledDataclass_, v32);
          if (!v33)
            goto LABEL_43;
          v34 = v33;
          v35 = sub_20D937468();
          v37 = v36;
          if (v35 == sub_20D937468() && v37 == v38)
          {
            v42 = v21;

            swift_bridgeObjectRelease_n();
          }
          else
          {
            v40 = sub_20D937660();
            v41 = v21;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v40 & 1) == 0)
              goto LABEL_43;
          }
          v43 = objc_msgSend(a1, sel_changeTypeForProvisionedDataclass_, v32);
          if (!v43)
          {
LABEL_43:
            swift_release();

            return 1;
          }
          v44 = v43;
          v45 = sub_20D937468();
          v47 = v46;
          if (v45 == sub_20D937468() && v47 == v48)
          {
            v28 = v21;

            result = swift_bridgeObjectRelease_n();
            v5 = v51;
            if (!v20)
              goto LABEL_17;
          }
          else
          {
            v24 = sub_20D937660();
            v25 = v21;

            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease();
            v5 = v51;
            if ((v24 & 1) == 0)
            {
              swift_release();
              return 1;
            }
            if (!v20)
              goto LABEL_17;
          }
LABEL_15:
          v26 = __clz(__rbit64(v20));
          v20 &= v20 - 1;
        }
      }
      v31 = v29 + 3;
      if (v31 < v50)
      {
        v30 = *(_QWORD *)(v49 + 8 * v31);
        if (v30)
        {
          v23 = v31;
          goto LABEL_30;
        }
        while (1)
        {
          v23 = v31 + 1;
          if (__OFADD__(v31, 1))
            goto LABEL_48;
          if (v23 >= v50)
            break;
          v30 = *(_QWORD *)(v49 + 8 * v23);
          ++v31;
          if (v30)
            goto LABEL_30;
        }
      }
    }
LABEL_45:
    swift_release();
    return 0;
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t XPCEventSubscriber.description.getter()
{
  sub_20D9375F4();
  swift_bridgeObjectRelease();
  sub_20D937654();
  sub_20D937498();
  swift_bridgeObjectRelease();
  sub_20D937498();
  XPCEventSubscriberFlags.description.getter();
  sub_20D937498();
  swift_bridgeObjectRelease();
  sub_20D937498();
  swift_bridgeObjectRetain();
  sub_20D93742C();
  sub_20D937498();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x203A656C646E6168;
}

uint64_t static XPCEventSubscriberAccountType.keys.allChanges.getter()
{
  return 0x676E6168436C6C41;
}

uint64_t static XPCEventSubscriberAccountType.keys.changeTypes.getter()
{
  return 0x795465676E616843;
}

unint64_t static XPCEventSubscriberAccountType.keys.accountProperties.getter()
{
  return 0xD000000000000011;
}

uint64_t static XPCEventSubscriberAccountType.keys.dataclasses.getter()
{
  return 0x73616C6361746144;
}

uint64_t sub_20D924334(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  _QWORD *v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v1 = a1 + 56;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 56);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v4)
    goto LABEL_5;
LABEL_4:
  for (v4 &= v4 - 1; ; v4 = (v10 - 1) & v10)
  {
    swift_bridgeObjectRetain();
    v12 = sub_20D937444();
    swift_bridgeObjectRelease();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_20D927400(0, v8[2] + 1, 1, v8, (uint64_t *)&unk_2549CC3B0, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92C7AC);
      v8 = (_QWORD *)result;
    }
    v14 = v8[2];
    v13 = v8[3];
    if (v14 >= v13 >> 1)
    {
      result = (uint64_t)sub_20D927400((_QWORD *)(v13 > 1), v14 + 1, 1, v8, (uint64_t *)&unk_2549CC3B0, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92C7AC);
      v8 = (_QWORD *)result;
    }
    v8[2] = v14 + 1;
    v8[v14 + 4] = v12;
    if (v4)
      goto LABEL_4;
LABEL_5:
    v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v9 >= v5)
      goto LABEL_27;
    v10 = *(_QWORD *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      v7 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_27;
      v10 = *(_QWORD *)(v1 + 8 * v7);
      if (!v10)
      {
        v7 = v9 + 2;
        if (v9 + 2 >= v5)
          goto LABEL_27;
        v10 = *(_QWORD *)(v1 + 8 * v7);
        if (!v10)
        {
          v7 = v9 + 3;
          if (v9 + 3 >= v5)
            goto LABEL_27;
          v10 = *(_QWORD *)(v1 + 8 * v7);
          if (!v10)
            break;
        }
      }
    }
LABEL_20:
    ;
  }
  v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v8;
  }
  v10 = *(_QWORD *)(v1 + 8 * v11);
  if (v10)
  {
    v7 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    v7 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v7 >= v5)
      goto LABEL_27;
    v10 = *(_QWORD *)(v1 + 8 * v7);
    ++v11;
    if (v10)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t XPCEventSubscriberAccountType.description.getter()
{
  sub_20D9375F4();
  sub_20D937498();
  sub_20D937498();
  swift_bridgeObjectRelease();
  sub_20D937498();
  swift_bridgeObjectRetain();
  sub_20D937534();
  sub_20D937498();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D937498();
  swift_bridgeObjectRetain();
  sub_20D937534();
  sub_20D937498();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D937498();
  type metadata accessor for Dataclass(0);
  sub_20D92D6A0((unint64_t *)&unk_253E54E30, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BB5C);
  swift_bridgeObjectRetain();
  sub_20D937534();
  sub_20D937498();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t XPCEventSubscriberFlags.description.getter()
{
  _BYTE *v0;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  if ((*v0 & 2) != 0)
  {
    v1 = sub_20D9272F4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v3 = v1[2];
    v2 = v1[3];
    if (v3 >= v2 >> 1)
      v1 = sub_20D9272F4((_QWORD *)(v2 > 1), v3 + 1, 1, v1);
    v1[2] = v3 + 1;
    v4 = &v1[2 * v3];
    v4[4] = 0x64656C7469746E65;
    v4[5] = 0xE800000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54DF8);
  sub_20D92DD08(&qword_253E54E00, &qword_253E54DF8, MEMORY[0x24BEE12B0]);
  v5 = sub_20D937438();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D92484C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_20D937354();
  v0[17] = v1;
  v0[18] = *(_QWORD *)(v1 - 8);
  v0[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D9248A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v0[18];
  v1 = v0[19];
  v3 = v0[17];
  v4 = sub_20D92DF8C();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_20D93733C();
  v6 = sub_20D93754C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D8CB000, v5, v6, "ACDXPCEventPublisher: registering in task", v7, 2u);
    MEMORY[0x212BAC23C](v7, -1, -1);
  }
  v9 = v0[18];
  v8 = v0[19];
  v10 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (qword_253E54F20 != -1)
    swift_once();
  v0[20] = qword_253E54FF8;
  return swift_task_switch();
}

uint64_t sub_20D9249DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = v0[20];
  if ((*(_BYTE *)(v1 + 128) & 1) == 0)
  {
    *(_BYTE *)(v1 + 128) = 1;
    v0[6] = sub_20D92524C;
    v0[7] = 0;
    v2 = MEMORY[0x24BDAC760];
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_20D925390;
    v0[5] = &block_descriptor_25;
    v3 = _Block_copy(v0 + 2);
    xpc_event_publisher_set_error_handler();
    _Block_release(v3);
    v0[8] = v2;
    v0[12] = sub_20D92DDB0;
    v0[13] = v1;
    v0[9] = 1107296256;
    v0[10] = sub_20D92564C;
    v0[11] = &block_descriptor_28;
    v4 = _Block_copy(v0 + 8);
    swift_retain();
    swift_release();
    xpc_event_publisher_set_handler();
    _Block_release(v4);
    xpc_event_publisher_activate();
  }
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_20D924AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D92DBF4(a1, (uint64_t)v7, (uint64_t *)&unk_253E54DA8);
  v8 = sub_20D93751C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_20D92D068((uint64_t)v7, (uint64_t *)&unk_253E54DA8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_20D937504();
      v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_20D937510();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v10 = 0;
  v12 = 0;
LABEL_6:
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t static ACDXPCEventPublisherWrapper.notifySubscribersOfAccountChange(_:type:)(void *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  result = MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = sub_20D93751C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)(v8 + 24) = 0;
    *(_QWORD *)(v8 + 32) = a1;
    *(_DWORD *)(v8 + 40) = a2;
    v9 = a1;
    sub_20D924AF4((uint64_t)v6, (uint64_t)&unk_2549CC298, v8);

    swift_release();
    return sub_20D92D068((uint64_t)v6, (uint64_t *)&unk_253E54DA8);
  }
  return result;
}

uint64_t sub_20D924D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  *(_DWORD *)(v5 + 32) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_20D924D9C()
{
  uint64_t v0;

  if (qword_253E54F20 != -1)
    swift_once();
  *(_QWORD *)(v0 + 24) = qword_253E54FF8;
  return swift_task_switch();
}

uint64_t sub_20D924E00()
{
  uint64_t v0;

  sub_20D9264D4(*(void **)(v0 + 16), *(_DWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id ACDXPCEventPublisherWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ACDXPCEventPublisherWrapper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ACDXPCEventPublisherWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20D924FEC()
{
  uint64_t v0;
  id result;

  type metadata accessor for ACDXPCEventPublisher();
  v0 = swift_allocObject();
  result = sub_20D925028();
  qword_253E54FF8 = v0;
  return result;
}

id sub_20D925028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  id result;
  _QWORD v9[2];

  v9[0] = sub_20D93757C();
  v1 = *(_QWORD *)(v9[0] - 8);
  MEMORY[0x24BDAC7A8](v9[0]);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20D937570();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_20D937420();
  MEMORY[0x24BDAC7A8](v6);
  swift_defaultActor_initialize();
  *(_BYTE *)(v0 + 128) = 0;
  *(_BYTE *)(v0
           + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_initialBarrierRecieved) = 0;
  v7 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0
            + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0
            + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers) = MEMORY[0x24BEE4B00];
  sub_20D92DCCC();
  sub_20D937414();
  v9[1] = v7;
  sub_20D92D6A0(&qword_253E54E20, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E08);
  sub_20D92DD08((unint64_t *)&unk_253E54E10, &qword_253E54E08, MEMORY[0x24BEE12C8]);
  sub_20D9375B8();
  (*(void (**)(char *, _QWORD, _QWORD))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v9[0]);
  *(_QWORD *)(v0 + 120) = sub_20D937588();
  result = (id)xpc_event_publisher_create();
  if (result)
  {
    *(_QWORD *)(v0 + 112) = result;
    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D92524C(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _DWORD v11[2];

  v2 = sub_20D937354();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20D92DF8C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_20D93733C();
  v8 = sub_20D937558();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v11[1] = a1;
    sub_20D937594();
    _os_log_impl(&dword_20D8CB000, v7, v8, "ACDXPCEventPublisher: error %d", v9, 8u);
    MEMORY[0x212BAC23C](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_20D925390(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_20D9253CC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D937354();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_20D92DF8C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = sub_20D93733C();
  v17 = sub_20D93754C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v27 = a3;
    v28 = a2;
    v19 = a4;
    v20 = a1;
    v21 = v18;
    *(_DWORD *)v18 = 134217984;
    sub_20D937594();
    _os_log_impl(&dword_20D8CB000, v16, v17, "ACDXPCEventPublisher: Pending subscriber %llu", v21, 0xCu);
    v22 = v21;
    a1 = v20;
    a4 = v19;
    a3 = v27;
    MEMORY[0x212BAC23C](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v23 = sub_20D93751C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v10, 1, 1, v23);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = 0;
  *(_QWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 32) = a4;
  *(_DWORD *)(v24 + 40) = a1;
  *(_QWORD *)(v24 + 48) = a2;
  *(_QWORD *)(v24 + 56) = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_20D924AF4((uint64_t)v10, (uint64_t)&unk_2549CC390, v24);
  swift_release();
  return sub_20D92D068((uint64_t)v10, (uint64_t *)&unk_253E54DA8);
}

uint64_t sub_20D9255F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 + 24) = a6;
  *(_QWORD *)(v7 + 32) = a7;
  *(_DWORD *)(v7 + 40) = a5;
  *(_QWORD *)(v7 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_20D925614()
{
  uint64_t v0;

  sub_20D9256B4(*(_DWORD *)(v0 + 40), *(_QWORD *)(v0 + 24), *(uint64_t ***)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D92564C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v7(a2, a3, a4);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D9256B4(int a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  xpc_object_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  _QWORD aBlock[6];
  uint64_t v42;
  uint64_t v43;

  v4 = v3;
  v8 = sub_20D937354();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    *(_BYTE *)(v4
             + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_initialBarrierRecieved) = 1;
    return result;
  }
  if (a1 != 1)
  {
    if (a1)
      return result;
    v13 = (uint64_t *)(v4
                    + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
    swift_beginAccess();
    v14 = *v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v13 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_5;
    goto LABEL_49;
  }
  v21 = sub_20D92DF8C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v21, v8);
  v22 = sub_20D93733C();
  v23 = sub_20D937564();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 134217984;
    v43 = a2;
    sub_20D937594();
    _os_log_impl(&dword_20D8CB000, v22, v23, "ACDXPCEventPublisher: Removing subscriber %llu", v24, 0xCu);
    MEMORY[0x212BAC23C](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  a3 = (uint64_t **)(v4
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
  result = swift_beginAccess();
  v13 = *a3;
  v25 = (*a3)[2];
  if (!v25)
    goto LABEL_18;
  if (v13[4] == a2)
  {
    v14 = 0;
  }
  else
  {
    if (v25 == 1)
    {
      v14 = 1;
      goto LABEL_38;
    }
    v33 = 5;
    while (1)
    {
      v14 = v33 - 4;
      if (v13[v33] == a2)
        break;
      v34 = v33 - 3;
      if (__OFADD__(v14, 1))
        goto LABEL_47;
      ++v33;
      if (v34 == v25)
      {
        v14 = (*a3)[2];
        goto LABEL_38;
      }
    }
  }
  v26 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    return result;
  }
  if (v26 != v25)
  {
    v27 = v14 + 5;
    while ((v26 & 0x8000000000000000) == 0)
    {
      if (v27 - 4 >= v25)
        goto LABEL_45;
      v30 = v13[v27];
      if (v30 != a2)
      {
        if (v27 - 4 != v14)
        {
          if (v14 >= v25)
            goto LABEL_48;
          v31 = v13[v14 + 4];
          v32 = swift_isUniquelyReferenced_nonNull_native();
          *a3 = v13;
          if ((v32 & 1) == 0)
          {
            v13 = sub_20D92C778(v13);
            *a3 = v13;
          }
          v13[v14 + 4] = v30;
          (*a3)[v27] = v31;
          v13 = *a3;
        }
        if (__OFADD__(v14++, 1))
          goto LABEL_46;
        v25 = v13[2];
      }
      v29 = v27 - 3;
      ++v27;
      if (v29 == v25)
        goto LABEL_16;
    }
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    v14 = (uint64_t)sub_20D927400(0, *(_QWORD *)(v14 + 16) + 1, 1, (_QWORD *)v14, &qword_253E54E80, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92D820);
    *v13 = v14;
LABEL_5:
    v17 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      v14 = (uint64_t)sub_20D927400((_QWORD *)(v16 > 1), v17 + 1, 1, (_QWORD *)v14, &qword_253E54E80, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92D820);
      *v13 = v14;
    }
    *(_QWORD *)(v14 + 16) = v17 + 1;
    *(_QWORD *)(v14 + 8 * v17 + 32) = a2;
    swift_endAccess();
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "MessageType", "ping");
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v4;
    v19[3] = a3;
    v19[4] = a2;
    aBlock[4] = sub_20D92DA9C;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D925D1C;
    aBlock[3] = &block_descriptor;
    v20 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    xpc_event_publisher_fire_with_reply();
    _Block_release(v20);
    return swift_unknownObjectRelease_n();
  }
LABEL_16:
  if ((uint64_t)v25 < v14)
  {
    __break(1u);
LABEL_18:
    v14 = 0;
  }
LABEL_38:
  sub_20D92D908(v14, v25);
  swift_endAccess();
  v35 = (uint64_t *)(v4
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers);
  swift_beginAccess();
  v36 = sub_20D929B74(a2);
  if ((v37 & 1) != 0)
  {
    v38 = v36;
    v39 = swift_isUniquelyReferenced_nonNull_native();
    v40 = *v35;
    v42 = *v35;
    *v35 = 0x8000000000000000;
    if ((v39 & 1) == 0)
    {
      sub_20D92AA28();
      v40 = v42;
    }
    sub_20D92A1B8(v38, v40);
    *v35 = v40;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D925BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D93751C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_20D924AF4((uint64_t)v10, (uint64_t)&unk_2549CC358, (uint64_t)v12);
  swift_release();
  return sub_20D92D068((uint64_t)v10, (uint64_t *)&unk_253E54DA8);
}

uint64_t sub_20D925CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return swift_task_switch();
}

uint64_t sub_20D925CE8()
{
  uint64_t v0;

  sub_20D925D64(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D925D1C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D925D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  uint64_t v42;
  BOOL value;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68[3];
  _QWORD v69[3];
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v4 = v3;
  v72 = *MEMORY[0x24BDAC8D0];
  v8 = sub_20D937354();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (uint64_t *)((char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v60 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v66 = (char *)&v60 - v16;
  v17 = (uint64_t *)(v3
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
  swift_beginAccess();
  if ((sub_20D926470(a2, *v17) & 1) == 0)
  {
LABEL_8:
    v20 = sub_20D92DF8C();
    swift_beginAccess();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 16))(v12, v20, v8);
    v21 = sub_20D93733C();
    v22 = sub_20D937564();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = v8;
      v24 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v24 = 134217984;
      v69[0] = a2;
      sub_20D937594();
      _os_log_impl(&dword_20D8CB000, v21, v22, "ACDXPCEventPublisher: Unexpected reply from previously pending subscriber %llu", v24, 0xCu);
      v25 = v24;
      v8 = v23;
      MEMORY[0x212BAC23C](v25, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD *, uint64_t))(v9 + 8))(v12, v8);
  }
  swift_beginAccess();
  v12 = (_QWORD *)*v17;
  v18 = *(_QWORD *)(*v17 + 16);
  v65 = v9;
  if (!v18)
  {
    v9 = 0;
    goto LABEL_31;
  }
  if (v12[4] == a2)
  {
    v62 = v8;
    v9 = 0;
    v19 = 1;
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    v9 = 1;
    goto LABEL_31;
  }
  v33 = 5;
  do
  {
    v9 = v33 - 4;
    if (v12[v33] == a2)
    {
      v62 = v8;
      v19 = v33 - 3;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_48;
      }
LABEL_5:
      v63 = v4;
      v64 = a1;
      if (v19 == v18)
      {
LABEL_6:
        v8 = v62;
        v4 = v63;
        a1 = v64;
        if ((uint64_t)v18 >= v9)
          goto LABEL_31;
        __break(1u);
        goto LABEL_8;
      }
      v27 = v9 + 5;
      while ((v19 & 0x8000000000000000) == 0)
      {
        if (v27 - 4 >= v18)
          goto LABEL_49;
        v30 = v12[v27];
        if (v30 != a2)
        {
          if (v27 - 4 != v9)
          {
            if (v9 >= v18)
              goto LABEL_52;
            v31 = v12[v9 + 4];
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *v17 = (uint64_t)v12;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v12 = sub_20D92C778(v12);
              *v17 = (uint64_t)v12;
            }
            v12[v9 + 4] = v30;
            *(_QWORD *)(*v17 + 8 * v27) = v31;
            v12 = (_QWORD *)*v17;
          }
          if (__OFADD__(v9++, 1))
            goto LABEL_50;
          v18 = v12[2];
        }
        v29 = v27 - 3;
        ++v27;
        if (v29 == v18)
          goto LABEL_6;
      }
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
    }
    v34 = v33 - 3;
    if (__OFADD__(v9, 1))
      goto LABEL_51;
    ++v33;
  }
  while (v34 != v18);
  v9 = v18;
LABEL_31:
  sub_20D92D908(v9, v18);
  swift_endAccess();
  v35 = MEMORY[0x212BAC3E0](a3);
  if (v35 == sub_20D937384())
  {
    v70 = 0u;
    v71 = 0u;
    xpc_dictionary_get_audit_token();
    sub_20D937468();
    sub_20D937474();
    swift_bridgeObjectRelease();
    v41 = (void *)xpc_copy_entitlement_for_token();
    result = swift_release();
    v42 = v65;
    if (v41 && (value = xpc_BOOL_get_value(v41), result = swift_unknownObjectRelease(), value))
    {
      v44 = 2;
      v45 = v66;
      if (!a1)
        return result;
    }
    else
    {
      v44 = 0;
      v45 = v66;
      if (!a1)
        return result;
    }
    v63 = v4;
    v68[0] = v44;
    swift_unknownObjectRetain_n();
    v64 = a1;
    XPCEventSubscriber.init(handle:descriptor:flags:)(a2, a1, v68, v69);
    v46 = v69[0];
    v47 = v69[1];
    v48 = v69[2];
    v49 = sub_20D92DF8C();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v45, v49, v8);
    v62 = v48;
    swift_bridgeObjectRetain_n();
    v50 = sub_20D93733C();
    v51 = sub_20D937564();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = swift_slowAlloc();
      v61 = v47;
      v53 = v52;
      v54 = swift_slowAlloc();
      v67 = v54;
      v68[0] = a2;
      *(_DWORD *)v53 = 134218242;
      sub_20D937594();
      *(_WORD *)(v53 + 12) = 2080;
      v68[0] = v46;
      v68[1] = v61;
      v68[2] = v62;
      v55 = XPCEventSubscriber.description.getter();
      v68[0] = sub_20D927554(v55, v56, &v67);
      sub_20D937594();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20D8CB000, v50, v51, "ACDXPCEventPublisher: Added new subscriber %llu\n%s", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x212BAC23C](v54, -1, -1);
      v57 = v53;
      v47 = v61;
      MEMORY[0x212BAC23C](v57, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v8);
    }
    v58 = (uint64_t *)(v63
                    + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers);
    swift_beginAccess();
    v59 = swift_isUniquelyReferenced_nonNull_native();
    v67 = *v58;
    *v58 = 0x8000000000000000;
    sub_20D92A4E0(v46, v47, v62, a2, v59);
    *v58 = v67;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_unknownObjectRelease();
  }
  else
  {
    v36 = sub_20D92DF8C();
    swift_beginAccess();
    v37 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v15, v36, v8);
    v38 = sub_20D93733C();
    v39 = sub_20D937564();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_20D8CB000, v38, v39, "Invalid object type received from subscriber", v40, 2u);
      MEMORY[0x212BAC23C](v40, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v15, v8);
  }
}

uint64_t sub_20D926470(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D9264D4(void *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  xpc_object_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  char v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  unsigned int v73;
  void *v74;
  int64_t v75;
  uint64_t v76;
  id bytes[12];

  bytes[10] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_20D937354();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v68 - v10;
  v70 = v2;
  v12 = (uint64_t *)(v2
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers);
  swift_beginAccess();
  v13 = *(_QWORD *)(*v12 + 16);
  v14 = sub_20D92DF8C();
  if (v13)
  {
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v14, v5);
    v15 = a1;
    v16 = sub_20D93733C();
    v17 = v6;
    v18 = sub_20D93754C();
    v19 = os_log_type_enabled(v16, v18);
    v74 = v15;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v75 = v5;
      v21 = v20;
      v22 = (_QWORD *)swift_slowAlloc();
      v71 = (void *)swift_slowAlloc();
      bytes[0] = v71;
      *(_DWORD *)v21 = 138412546;
      v76 = (uint64_t)v74;
      v69 = v12;
      v23 = v74;
      v72 = v17;
      v24 = v23;
      sub_20D937594();
      *v22 = v74;

      *(_WORD *)(v21 + 12) = 2080;
      v25 = sub_20D92DFEC(a2);
      v76 = sub_20D927554(v25, v26, (uint64_t *)bytes);
      v12 = v69;
      sub_20D937594();
      v15 = v74;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20D8CB000, v16, v18, "ACDXPCEventPublisher: Publishing changes for account %@, type: %s", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E50);
      swift_arrayDestroy();
      MEMORY[0x212BAC23C](v22, -1, -1);
      v27 = v71;
      swift_arrayDestroy();
      MEMORY[0x212BAC23C](v27, -1, -1);
      MEMORY[0x212BAC23C](v21, -1, -1);

      (*(void (**)(char *, int64_t))(v72 + 8))(v9, v75);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v5);
    }
    v32 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v32, "MessageType", "AccountChange");
    xpc_dictionary_set_uint64(v32, "ChangeType", a2);
    v33 = (void *)objc_opt_self();
    bytes[0] = 0;
    v34 = objc_msgSend(v33, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v15, 1, bytes);
    v35 = bytes[0];
    v73 = a2;
    v71 = v32;
    if (v34)
    {
      sub_20D937330();
      v37 = v36;

      __asm { BR              X10 }
    }
    v38 = v35;
    v39 = (void *)sub_20D937324();

    swift_willThrow();
    v69 = 0;
    v40 = *v12;
    v41 = *v12 + 64;
    v42 = 1 << *(_BYTE *)(*v12 + 32);
    v43 = -1;
    if (v42 < 64)
      v43 = ~(-1 << v42);
    v44 = v43 & *(_QWORD *)(*v12 + 64);
    v75 = (unint64_t)(v42 + 63) >> 6;
    swift_bridgeObjectRetain();
    v45 = 0;
    v72 = v40;
    while (1)
    {
      if (v44)
      {
        v46 = __clz(__rbit64(v44));
        v44 &= v44 - 1;
        v47 = v46 | (v45 << 6);
      }
      else
      {
        if (__OFADD__(v45++, 1))
        {
          __break(1u);
          goto LABEL_41;
        }
        if (v45 >= v75)
          goto LABEL_38;
        v49 = *(_QWORD *)(v41 + 8 * v45);
        if (!v49)
        {
          v50 = v45 + 1;
          if (v45 + 1 >= v75)
            goto LABEL_38;
          v49 = *(_QWORD *)(v41 + 8 * v50);
          if (!v49)
          {
            v50 = v45 + 2;
            if (v45 + 2 >= v75)
              goto LABEL_38;
            v49 = *(_QWORD *)(v41 + 8 * v50);
            if (!v49)
            {
              v50 = v45 + 3;
              if (v45 + 3 >= v75)
              {
LABEL_38:
                swift_unknownObjectRelease();
                return swift_release();
              }
              v49 = *(_QWORD *)(v41 + 8 * v50);
              if (!v49)
              {
                while (1)
                {
                  v45 = v50 + 1;
                  if (__OFADD__(v50, 1))
                    break;
                  if (v45 >= v75)
                    goto LABEL_38;
                  v49 = *(_QWORD *)(v41 + 8 * v45);
                  ++v50;
                  if (v49)
                    goto LABEL_26;
                }
LABEL_41:
                __break(1u);
                JUMPOUT(0x20D926DB0);
              }
            }
          }
          v45 = v50;
        }
LABEL_26:
        v44 = (v49 - 1) & v49;
        v47 = __clz(__rbit64(v49)) + (v45 << 6);
      }
      v51 = *(_QWORD *)(v40 + 56) + 24 * v47;
      if ((*(_BYTE *)(v51 + 8) & 2) != 0)
      {
        v52 = *(_QWORD *)(v51 + 16);
        swift_bridgeObjectRetain();
        v53 = objc_msgSend(v15, sel_accountType);
        if (!v53)
        {
          __break(1u);
LABEL_43:
          __break(1u);
        }
        v54 = v53;
        v55 = objc_msgSend(v53, sel_identifier);

        if (!v55)
          goto LABEL_43;
        v56 = sub_20D937468();
        v58 = v57;

        if (*(_QWORD *)(v52 + 16) && (v59 = sub_20D929B10(v56, v58), (v60 & 1) != 0))
        {
          v61 = *(_QWORD *)(v52 + 56) + 32 * v59;
          v62 = *(_BYTE *)v61;
          v63 = *(void **)(v61 + 8);
          v64 = *(void **)(v61 + 16);
          v65 = v41;
          v66 = *(void **)(v61 + 24);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          LOBYTE(bytes[0]) = v62;
          bytes[1] = v63;
          bytes[2] = v64;
          bytes[3] = v66;
          v67 = sub_20D923D04(v74, v73);
          swift_bridgeObjectRelease();
          v41 = v65;
          v40 = v72;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v15 = v74;
          swift_bridgeObjectRelease();
          if ((v67 & 1) != 0)
            xpc_event_publisher_fire();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, v14, v5);
  v28 = sub_20D93733C();
  v29 = sub_20D93754C();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_20D8CB000, v28, v29, "ACDXPCEventPublisher: no subscribers, not publishing change", v30, 2u);
    MEMORY[0x212BAC23C](v30, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_20D926E10()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_20D926E5C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_20D926E68(uint64_t a1, uint64_t a2)
{
  return sub_20D926F30(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20D926E74()
{
  sub_20D937468();
  sub_20D93748C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D926EB4()
{
  uint64_t v0;

  sub_20D937468();
  sub_20D93769C();
  sub_20D93748C();
  v0 = sub_20D9376A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D926F24(uint64_t a1, uint64_t a2)
{
  return sub_20D926F30(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20D926F30(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20D937468();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D926F6C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20D937450();
  *a2 = 0;
  return result;
}

uint64_t sub_20D926FE0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20D93745C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20D92705C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20D937468();
  v2 = sub_20D937444();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_20D92709C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D9270B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20D937468();
  v2 = v1;
  if (v0 == sub_20D937468() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20D937660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_DWORD *sub_20D927138@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_20D927148(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20D927154@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20D937444();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D927198@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20D937468();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D9271C0()
{
  sub_20D92D6A0((unint64_t *)&unk_253E54E30, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BB5C);
  sub_20D92D6A0(&qword_2549CC2E8, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BA94);
  return sub_20D937648();
}

uint64_t sub_20D927244(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D9272A8;
  return v6(a1);
}

uint64_t sub_20D9272A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_20D9272F4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54E68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_20D92CD58(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_20D927400(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, void (*a6)(_QWORD, int64_t, _QWORD *, _QWORD *))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v15 = v14 - 32;
      if (v14 < 32)
        v15 = v14 - 25;
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      v16 = v13 + 4;
      if ((v8 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4])
          memmove(v16, a4 + 4, 8 * v11);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    a6(0, v11, v16, a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BAC1D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D927554(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20D927624(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20D92D7E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_20D92D7E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_20D927624(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_20D9375A0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20D9277DC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_20D93760C();
  if (!v8)
  {
    sub_20D937618();
    __break(1u);
LABEL_17:
    result = sub_20D93763C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_20D9277DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20D927870(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20D927AC0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20D927AC0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20D927870(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_20D9279E4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20D937600();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20D937618();
      __break(1u);
LABEL_10:
      v2 = sub_20D9374A4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20D93763C();
    __break(1u);
LABEL_14:
    result = sub_20D937618();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20D9279E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E78);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20D927A48(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_20D9374E0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x212BAB5DC](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_20D927AC0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_20D93763C();
  __break(1u);
  return result;
}

uint64_t sub_20D927C0C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_20D93769C();
  swift_bridgeObjectRetain();
  sub_20D93748C();
  v8 = sub_20D9376A8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_20D937660() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_20D937660() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_20D928950(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_20D927DB8(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  sub_20D937468();
  sub_20D93769C();
  swift_bridgeObjectRetain();
  sub_20D93748C();
  v7 = sub_20D9376A8();
  swift_bridgeObjectRelease();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    v24 = a2;
    sub_20D928AE8((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = sub_20D937468();
  v12 = v11;
  if (v10 == sub_20D937468() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_20D937660();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      v16 = ~v8;
      do
      {
        v9 = (v9 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_15;
        v17 = sub_20D937468();
        v19 = v18;
        if (v17 == sub_20D937468() && v19 == v20)
          goto LABEL_16;
        v22 = sub_20D937660();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  v26 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  v27 = v26;
  return 0;
}

uint64_t sub_20D927FE0(_DWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = MEMORY[0x212BAB7A4](*(_QWORD *)(v6 + 40), a2, 4);
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_20D928D14(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_DWORD *)(v10 + 4 * v9) != (_DWORD)a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_DWORD *)(v10 + 4 * v9) != (_DWORD)a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_20D9280E0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A0);
  v3 = sub_20D9375DC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_20D93769C();
      sub_20D93748C();
      result = sub_20D9376A8();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20D9283BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A8);
  v3 = sub_20D9375DC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v29 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28)
          goto LABEL_33;
        v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v28)
            goto LABEL_33;
          v15 = v29[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v28)
              goto LABEL_33;
            v15 = v29[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                v1 = v27;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v28)
                    goto LABEL_33;
                  v15 = v29[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      sub_20D937468();
      sub_20D93769C();
      sub_20D93748C();
      v18 = sub_20D9376A8();
      result = swift_bridgeObjectRelease();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = v18 & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20D9286CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E88);
  result = sub_20D9375DC();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
      result = MEMORY[0x212BAB7A4](*(_QWORD *)(v4 + 40), v18, 4);
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20D928950(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_20D9280E0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_20D928E38();
      goto LABEL_22;
    }
    sub_20D929324();
  }
  v11 = *v4;
  sub_20D93769C();
  sub_20D93748C();
  result = sub_20D9376A8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_20D937660(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_20D93766C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_20D937660();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_20D928AE8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    sub_20D9283BC();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_20D928FE8();
LABEL_22:
      v25 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * a2) = v6;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (!v27)
      {
        *(_QWORD *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_20D9295D0();
  }
  v9 = *v3;
  sub_20D937468();
  sub_20D93769C();
  sub_20D93748C();
  v10 = sub_20D9376A8();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = sub_20D937468();
  v14 = v13;
  if (v12 == sub_20D937468() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = sub_20D937660();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v19 = sub_20D937468();
      v21 = v20;
      if (v19 == sub_20D937468() && v21 == v22)
        goto LABEL_25;
      v24 = sub_20D937660();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for Dataclass(0);
  result = sub_20D93766C();
  __break(1u);
  return result;
}

uint64_t sub_20D928D14(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_20D9286CC();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_20D929190();
      goto LABEL_14;
    }
    sub_20D9298AC();
  }
  v8 = *v3;
  result = MEMORY[0x212BAB7A4](*(_QWORD *)(*v3 + 40), v5, 4);
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      result = sub_20D93766C();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_DWORD *)(v10 + 4 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(_QWORD *)(v12 + 48) + 4 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_20D928E38()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A0);
  v2 = *v0;
  v3 = sub_20D9375D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_20D928FE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A8);
  v2 = *v0;
  v3 = sub_20D9375D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_20D929190()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E88);
  v2 = *v0;
  v3 = sub_20D9375D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20D929324()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A0);
  v3 = sub_20D9375DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_20D93769C();
    swift_bridgeObjectRetain();
    sub_20D93748C();
    result = sub_20D9376A8();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20D9295D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A8);
  v3 = sub_20D9375DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v27 = v0;
  v28 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v13);
    sub_20D937468();
    sub_20D93769C();
    v18 = v17;
    sub_20D93748C();
    v19 = sub_20D9376A8();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20D9298AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E54E88);
  result = sub_20D9375DC();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
    result = MEMORY[0x212BAB7A4](*(_QWORD *)(v4 + 40), v18, 4);
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_20D929B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20D93769C();
  sub_20D93748C();
  v4 = sub_20D9376A8();
  return sub_20D92A6BC(a1, a2, v4);
}

unint64_t sub_20D929B74(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D937690();
  return sub_20D92A79C(a1, v2);
}

uint64_t sub_20D929BA4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54E58);
  v40 = a2;
  v6 = sub_20D937630();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v37 = v2;
  v38 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v38)
        goto LABEL_33;
      v24 = *(_QWORD *)(v39 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v38)
              goto LABEL_33;
            v24 = *(_QWORD *)(v39 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 32 * v21;
    v34 = *(_BYTE *)v33;
    v41 = *(_OWORD *)(v33 + 8);
    v35 = *(_QWORD *)(v33 + 24);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_20D93769C();
    sub_20D93748C();
    result = sub_20D9376A8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 32 * v17;
    *(_BYTE *)v19 = v34;
    *(_OWORD *)(v19 + 8) = v41;
    *(_QWORD *)(v19 + 24) = v35;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v37;
  v23 = (_QWORD *)(v5 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20D929EF0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t *v33;
  __int128 v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DB8);
  result = sub_20D937630();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (uint64_t *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v30 = -1 << v9;
    v31 = v9;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v31 >= 64)
                  bzero(v33, 8 * v32);
                else
                  *v33 = v30;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = *(_QWORD *)(v5 + 56) + 24 * v19;
      v34 = *(_OWORD *)v28;
      v29 = *(_QWORD *)(v28 + 16);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_20D937690();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = *(_QWORD *)(v7 + 56) + 24 * v16;
      *(_OWORD *)v17 = v34;
      *(_QWORD *)(v17 + 16) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_20D92A1B8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_20D9375C4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        result = sub_20D937690();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1)
              *v15 = *v11;
            v16 = *(_QWORD *)(a2 + 56);
            v17 = v16 + 24 * v3;
            v18 = (__int128 *)(v16 + 24 * v6);
            if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 24))
            {
              v9 = *v18;
              *(_QWORD *)(v17 + 16) = *((_QWORD *)v18 + 2);
              *(_OWORD *)v17 = v9;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_20D92A360(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  _QWORD *v7;
  _QWORD **v8;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v8 = (_QWORD **)v7;
  v15 = (_QWORD *)*v7;
  v17 = sub_20D929B10(a5, a6);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
  }
  else
  {
    v21 = v16;
    v22 = v15[3];
    if (v22 >= v20 && (a7 & 1) != 0)
    {
LABEL_7:
      v23 = *v8;
      if ((v21 & 1) != 0)
      {
LABEL_8:
        v24 = v23[7] + 32 * v17;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *(_BYTE *)v24 = a1 & 1;
        *(_QWORD *)(v24 + 8) = a2;
        *(_QWORD *)(v24 + 16) = a3;
        *(_QWORD *)(v24 + 24) = a4;
        return result;
      }
      goto LABEL_11;
    }
    if (v22 >= v20 && (a7 & 1) == 0)
    {
      sub_20D92A838();
      goto LABEL_7;
    }
    sub_20D929BA4(v20, a7 & 1);
    v26 = sub_20D929B10(a5, a6);
    if ((v21 & 1) == (v27 & 1))
    {
      v17 = v26;
      v23 = *v8;
      if ((v21 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_20D92A618(v17, a5, a6, a1 & 1, a2, a3, a4, v23);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_20D937678();
  __break(1u);
  return result;
}

uint64_t sub_20D92A4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_20D929B74(a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (uint64_t *)(v20[7] + 24 * v14);
        result = swift_bridgeObjectRelease();
        *v21 = a1;
        v21[1] = a2;
        v21[2] = a3;
        return result;
      }
      return sub_20D92A66C(v14, a4, a1, a2, a3, v20);
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_20D92AA28();
      goto LABEL_7;
    }
    sub_20D929EF0(v17, a5 & 1);
    v23 = sub_20D929B74(a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
      return sub_20D92A66C(v14, a4, a1, a2, a3, v20);
    }
  }
  result = sub_20D937678();
  __break(1u);
  return result;
}

unint64_t sub_20D92A618(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a8[(result >> 6) + 8] |= 1 << result;
  v8 = (_QWORD *)(a8[6] + 16 * result);
  *v8 = a2;
  v8[1] = a3;
  v9 = a8[7] + 32 * result;
  *(_BYTE *)v9 = a4;
  *(_QWORD *)(v9 + 8) = a5;
  *(_QWORD *)(v9 + 16) = a6;
  *(_QWORD *)(v9 + 24) = a7;
  v10 = a8[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a8[2] = v12;
  return result;
}

unint64_t sub_20D92A66C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a6[6] + 8 * result) = a2;
  v6 = (_QWORD *)(a6[7] + 24 * result);
  *v6 = a3;
  v6[1] = a4;
  v6[2] = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

unint64_t sub_20D92A6BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_20D937660() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_20D937660() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20D92A79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_20D92A838()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54E58);
  v2 = *v0;
  v3 = sub_20D937624();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_BYTE *)v21;
    v23 = *(_QWORD *)(v21 + 24);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v25 = *(_OWORD *)(v21 + 8);
    *v24 = v19;
    v24[1] = v18;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_BYTE *)v26 = v22;
    *(_OWORD *)(v26 + 8) = v25;
    *(_QWORD *)(v26 + 24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_20D92AA28()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DB8);
  v2 = *v0;
  v3 = sub_20D937624();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 24 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_QWORD *)(v19 + 16);
    v21 = *(_OWORD *)v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = *(_QWORD *)(v4 + 56) + v18;
    *(_OWORD *)v22 = v21;
    *(_QWORD *)(v22 + 16) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_20D92ABE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, unint64_t, uint64_t, uint64_t))
{
  char v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a2 + 32);
  v7 = (unint64_t)((1 << v6) + 63) >> 6;
  v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x24BDAC7A8]();
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = a3((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a2, a1);
    swift_release();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    v9 = a3((char *)v10, v7, a2, a1);
    swift_release();
    MEMORY[0x212BAC23C](v10, -1, -1);
  }
  return v9;
}

void sub_20D92AD6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  BOOL v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v65;
  uint64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  int64_t v73;
  uint64_t v74;
  id v75;
  int64_t v76;
  int64_t v77;

  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v68 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v69 = (unint64_t)(v7 + 63) >> 6;
    v71 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v74 = (v9 - 1) & v9;
          v76 = v6;
          v11 = __clz(__rbit64(v9)) | (v6 << 6);
        }
        else
        {
          v12 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_85;
          }
          if (v12 >= v69)
            goto LABEL_83;
          v13 = *(_QWORD *)(v68 + 8 * v12);
          v14 = v6 + 1;
          if (!v13)
          {
            v14 = v6 + 2;
            if (v6 + 2 >= v69)
              goto LABEL_83;
            v13 = *(_QWORD *)(v68 + 8 * v14);
            if (!v13)
            {
              v14 = v6 + 3;
              if (v6 + 3 >= v69)
                goto LABEL_83;
              v13 = *(_QWORD *)(v68 + 8 * v14);
              if (!v13)
              {
                v15 = v6 + 4;
                if (v6 + 4 >= v69)
                  goto LABEL_83;
                v13 = *(_QWORD *)(v68 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_87;
                    if (v14 >= v69)
                      goto LABEL_83;
                    v13 = *(_QWORD *)(v68 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_22;
                  }
                }
                v14 = v6 + 4;
              }
            }
          }
LABEL_22:
          v74 = (v13 - 1) & v13;
          v76 = v14;
          v11 = __clz(__rbit64(v13)) + (v14 << 6);
        }
        v16 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v11);
        sub_20D937468();
        sub_20D93769C();
        v72 = v16;
        sub_20D93748C();
        v17 = sub_20D9376A8();
        swift_bridgeObjectRelease();
        v18 = -1 << *(_BYTE *)(v5 + 32);
        v19 = v17 & ~v18;
        v20 = v19 >> 6;
        v21 = 1 << v19;
        if (((1 << v19) & *(_QWORD *)(v10 + 8 * (v19 >> 6))) != 0)
          break;
LABEL_6:

        v6 = v76;
        v5 = a3;
        v4 = a4;
        v9 = v74;
      }
      v22 = sub_20D937468();
      v24 = v23;
      if (v22 == sub_20D937468() && v24 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v27 = sub_20D937660();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
        {
          v28 = ~v18;
          for (i = v19 + 1; ; i = v30 + 1)
          {
            v30 = i & v28;
            if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
              break;
            v5 = a3;
            v31 = sub_20D937468();
            v33 = v32;
            if (v31 == sub_20D937468() && v33 == v34)
            {
              swift_bridgeObjectRelease_n();
LABEL_38:

              v20 = v30 >> 6;
              v21 = 1 << v30;
              goto LABEL_39;
            }
            v36 = sub_20D937660();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v36 & 1) != 0)
              goto LABEL_38;
          }
          goto LABEL_6;
        }
      }

      v5 = a3;
LABEL_39:
      a1[v20] |= v21;
      v37 = __OFADD__(v71++, 1);
      v4 = a4;
      v9 = v74;
      v6 = v76;
      if (v37)
        goto LABEL_86;
    }
  }
  v38 = 0;
  v70 = a3 + 56;
  v71 = 0;
  v39 = 1 << *(_BYTE *)(a3 + 32);
  if (v39 < 64)
    v40 = ~(-1 << v39);
  else
    v40 = -1;
  v41 = v40 & *(_QWORD *)(a3 + 56);
  v73 = (unint64_t)(v39 + 63) >> 6;
  v42 = a4 + 56;
  while (1)
  {
    if (v41)
    {
      v43 = __clz(__rbit64(v41));
      v41 &= v41 - 1;
      v77 = v38;
      v44 = v43 | (v38 << 6);
      goto LABEL_65;
    }
    v45 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
    if (v45 >= v73)
      goto LABEL_83;
    v46 = *(_QWORD *)(v70 + 8 * v45);
    v47 = v38 + 1;
    if (!v46)
    {
      v47 = v38 + 2;
      if (v38 + 2 >= v73)
        goto LABEL_83;
      v46 = *(_QWORD *)(v70 + 8 * v47);
      if (!v46)
      {
        v47 = v38 + 3;
        if (v38 + 3 >= v73)
          goto LABEL_83;
        v46 = *(_QWORD *)(v70 + 8 * v47);
        if (!v46)
          break;
      }
    }
LABEL_64:
    v41 = (v46 - 1) & v46;
    v77 = v47;
    v44 = __clz(__rbit64(v46)) + (v47 << 6);
LABEL_65:
    v49 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v44);
    sub_20D937468();
    sub_20D93769C();
    v75 = v49;
    sub_20D93748C();
    v50 = sub_20D9376A8();
    swift_bridgeObjectRelease();
    v51 = -1 << *(_BYTE *)(a4 + 32);
    v52 = v50 & ~v51;
    if (((*(_QWORD *)(v42 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8)) >> v52) & 1) == 0)
      goto LABEL_48;
    v53 = sub_20D937468();
    v55 = v54;
    if (v53 == sub_20D937468() && v55 == v56)
    {
LABEL_79:
      swift_bridgeObjectRelease_n();
      goto LABEL_80;
    }
    v58 = sub_20D937660();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) != 0)
    {
LABEL_80:

      *(unint64_t *)((char *)a1 + ((v44 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v44;
      v37 = __OFADD__(v71++, 1);
      v38 = v77;
      v5 = a3;
      if (v37)
      {
        __break(1u);
LABEL_83:
        swift_retain();
        sub_20D92B92C(a1, a2, v71, v5);
        return;
      }
    }
    else
    {
      v59 = ~v51;
      while (1)
      {
        v52 = (v52 + 1) & v59;
        if (((*(_QWORD *)(v42 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8)) >> v52) & 1) == 0)
          break;
        v60 = sub_20D937468();
        v62 = v61;
        if (v60 == sub_20D937468() && v62 == v63)
          goto LABEL_79;
        v65 = sub_20D937660();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v65 & 1) != 0)
          goto LABEL_80;
      }
LABEL_48:

      v38 = v77;
      v5 = a3;
    }
  }
  v48 = v38 + 4;
  if (v38 + 4 >= v73)
    goto LABEL_83;
  v46 = *(_QWORD *)(v70 + 8 * v48);
  if (v46)
  {
    v47 = v38 + 4;
    goto LABEL_64;
  }
  while (1)
  {
    v47 = v48 + 1;
    if (__OFADD__(v48, 1))
      break;
    if (v47 >= v73)
      goto LABEL_83;
    v46 = *(_QWORD *)(v70 + 8 * v47);
    ++v48;
    if (v46)
      goto LABEL_64;
  }
LABEL_88:
  __break(1u);
}

uint64_t sub_20D92B3F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_20D93769C();
        swift_bridgeObjectRetain();
        sub_20D93748C();
        v20 = sub_20D9376A8();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_20D937660() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_20D937660() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_20D93769C();
    swift_bridgeObjectRetain();
    sub_20D93748C();
    v47 = sub_20D9376A8();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_20D937660() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_20D92BBC4(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_20D937660() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_20D92B92C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t *v30;
  uint64_t v31;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A8);
  result = sub_20D9375E8();
  v9 = result;
  v30 = a1;
  v31 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= v31)
      goto LABEL_36;
    v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_36;
      v16 = v30[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_36;
        v16 = v30[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v14);
    sub_20D937468();
    sub_20D93769C();
    v19 = v18;
    sub_20D93748C();
    v20 = sub_20D9376A8();
    result = swift_bridgeObjectRelease();
    v21 = -1 << *(_BYTE *)(v9 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v24) = v19;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= v31)
    goto LABEL_36;
  v16 = v30[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_36;
    v16 = v30[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_20D92BBC4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549CC3A0);
  result = sub_20D9375E8();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_20D93769C();
    swift_bridgeObjectRetain();
    sub_20D93748C();
    result = sub_20D9376A8();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_20D92BE58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_20D9374EC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_20D92C1BC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_20D93760C();
  }
LABEL_7:
  v11 = sub_20D92BF3C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_20D92BF3C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20D92C1BC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_20D9374F8();
  v4 = sub_20D92C238(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_20D92C238(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_20D92C37C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_20D9279E4(v9, 0);
      v12 = sub_20D92C468((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x212BAB5A0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x212BAB5A0);
LABEL_9:
      sub_20D93760C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x212BAB5A0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_20D92C37C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_20D927A48(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_20D927A48(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_20D9374C8();
  }
  __break(1u);
  return result;
}

unint64_t sub_20D92C468(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_20D927A48(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_20D9374D4();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_20D93760C();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_20D927A48(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_20D9374B0();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_20D92C678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (sub_20D937300())
  {
    if (!__OFSUB__(a1, sub_20D937318()))
    {
      sub_20D93730C();
      __asm { BR              X10 }
    }
    __break(1u);
    JUMPOUT(0x20D92C760);
  }
  sub_20D93730C();
  swift_unknownObjectRelease();
  return sub_20D92D77C(a5, a6);
}

_QWORD *sub_20D92C778(_QWORD *a1)
{
  return sub_20D927400(0, a1[2], 0, a1, &qword_253E54E80, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92D820);
}

uint64_t sub_20D92C7AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for Dataclass(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_20D93763C();
  __break(1u);
  return result;
}

uint64_t sub_20D92C8B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for Dataclass(0);
  sub_20D92D6A0((unint64_t *)&unk_253E54E30, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BB5C);
  result = sub_20D937540();
  v7 = result;
  if (v2)
  {
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_20D927DB8(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_20D92C950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  v4 = MEMORY[0x212BAC3E0](a2);
  if (v4 == sub_20D93736C())
  {
    v16 = sub_20D92DE64();
    MEMORY[0x212BAB528](&v35, a1, MEMORY[0x24BEE4008], v16);
    if ((v36 & 1) == 0)
    {
      v17 = v35;
      if (v35 <= 5)
      {
        if ((v35 & 0x8000000000000000) == 0)
          return sub_20D927FE0(&v35, v17);
LABEL_72:
        result = sub_20D937618();
        __break(1u);
        return result;
      }
    }
  }
  v5 = MEMORY[0x212BAC3E0](a2);
  result = sub_20D937378();
  if (v5 == result)
  {
    result = sub_20D9373FC();
    if (v7)
    {
      v8 = v7;
      v9 = HIBYTE(v7) & 0xF;
      v10 = result & 0xFFFFFFFFFFFFLL;
      if ((v8 & 0x2000000000000000) != 0)
        v11 = v9;
      else
        v11 = result & 0xFFFFFFFFFFFFLL;
      if (!v11)
        return swift_bridgeObjectRelease();
      if ((v8 & 0x1000000000000000) == 0)
      {
        if ((v8 & 0x2000000000000000) == 0)
        {
          if ((result & 0x1000000000000000) != 0)
            v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
          else
            v12 = (unsigned __int8 *)sub_20D93760C();
          v13 = sub_20D92BF3C(v12, v10, 10);
          v37 = BYTE4(v13) & 1;
          v14 = BYTE4(v13) & 1;
          v15 = (uint64_t)v13;
LABEL_44:
          result = swift_bridgeObjectRelease();
          if ((v14 & 1) != 0)
            return result;
          goto LABEL_45;
        }
        v35 = result;
        v36 = v8 & 0xFFFFFFFFFFFFFFLL;
        if (result == 43)
        {
          if (v9)
          {
            if (v9 != 1)
            {
              v15 = (BYTE1(result) - 48);
              if (v15 <= 9)
              {
                if (v9 == 2)
                  goto LABEL_43;
                if ((BYTE2(result) - 48) <= 9u)
                {
                  v15 = 10 * (_DWORD)v15 + (BYTE2(result) - 48);
                  v21 = v9 - 3;
                  if (v21)
                  {
                    v22 = (unsigned __int8 *)&v35 + 3;
                    while (1)
                    {
                      v23 = *v22 - 48;
                      if (v23 > 9)
                        goto LABEL_40;
                      v24 = 10 * v15;
                      if ((v24 & 0xFFFFFFFF00000000) != 0)
                        goto LABEL_40;
                      v15 = v24 + v23;
                      if (__CFADD__((_DWORD)v24, v23))
                        goto LABEL_40;
                      v14 = 0;
                      ++v22;
                      if (!--v21)
                        goto LABEL_44;
                    }
                  }
                  goto LABEL_43;
                }
              }
            }
            goto LABEL_40;
          }
        }
        else
        {
          if (result != 45)
          {
            if (v9)
            {
              v15 = (result - 48);
              if (v15 <= 9)
              {
                if (v9 == 1)
                  goto LABEL_43;
                if ((BYTE1(result) - 48) <= 9u)
                {
                  v15 = 10 * (_DWORD)v15 + (BYTE1(result) - 48);
                  v25 = v9 - 2;
                  if (v25)
                  {
                    v26 = (unsigned __int8 *)&v35 + 2;
                    while (1)
                    {
                      v27 = *v26 - 48;
                      if (v27 > 9)
                        goto LABEL_40;
                      v28 = 10 * v15;
                      if ((v28 & 0xFFFFFFFF00000000) != 0)
                        goto LABEL_40;
                      v15 = v28 + v27;
                      if (__CFADD__((_DWORD)v28, v27))
                        goto LABEL_40;
                      v14 = 0;
                      ++v26;
                      if (!--v25)
                        goto LABEL_44;
                    }
                  }
                  goto LABEL_43;
                }
              }
            }
LABEL_40:
            v15 = 0;
LABEL_41:
            v14 = 1;
            goto LABEL_44;
          }
          if (v9)
          {
            if (v9 != 1)
            {
              v18 = BYTE1(result) - 48;
              if ((BYTE1(result) - 48) <= 9u)
              {
                v15 = 0;
                v19 = v18 == 0;
                v20 = -v18;
                if (!v19)
                  goto LABEL_41;
                if (v9 == 2)
                {
                  v14 = 0;
                  v15 = v20;
                  goto LABEL_44;
                }
                v29 = BYTE2(result) - 48;
                if ((BYTE2(result) - 48) <= 9u)
                {
                  v30 = 10 * v20;
                  if ((v30 & 0xFFFFFFFF00000000) == 0)
                  {
                    v15 = v30 - v29;
                    if (v30 >= v29)
                    {
                      v31 = v9 - 3;
                      if (v31)
                      {
                        v32 = (unsigned __int8 *)&v35 + 3;
                        while (1)
                        {
                          v33 = *v32 - 48;
                          if (v33 > 9)
                            goto LABEL_40;
                          v34 = 10 * v15;
                          if ((v34 & 0xFFFFFFFF00000000) != 0)
                            goto LABEL_40;
                          v15 = v34 - v33;
                          if (v34 < v33)
                            goto LABEL_40;
                          v14 = 0;
                          ++v32;
                          if (!--v31)
                            goto LABEL_44;
                        }
                      }
LABEL_43:
                      v14 = 0;
                      goto LABEL_44;
                    }
                  }
                }
              }
            }
            goto LABEL_40;
          }
          __break(1u);
        }
        __break(1u);
        goto LABEL_72;
      }
      v15 = sub_20D92BE58(result, v8, 10);
      result = swift_bridgeObjectRelease();
      if ((v15 & 0x100000000) == 0)
      {
LABEL_45:
        v17 = v15;
        return sub_20D927FE0(&v35, v17);
      }
    }
  }
  return result;
}

void type metadata accessor for Dataclass(uint64_t a1)
{
  sub_20D92DEBC(a1, &qword_253E54E48);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BAC1DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D92CD58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_20D93763C();
  __break(1u);
  return result;
}

uint64_t _s14AccountsDaemon27ACDXPCEventPublisherWrapperC26registerSubscriberListeneryyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E54DA8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_20D937354();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D92DF8C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_20D93733C();
  v9 = sub_20D93754C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_20D8CB000, v8, v9, "ACDXPCEventPublisher: registering", v10, 2u);
    MEMORY[0x212BAC23C](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = sub_20D93751C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v2, 1, 1, v11);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  sub_20D924AF4((uint64_t)v2, (uint64_t)&unk_2549CC380, v12);
  swift_release();
  return sub_20D92D068((uint64_t)v2, (uint64_t *)&unk_253E54DA8);
}

uint64_t sub_20D92D000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v4 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_20D92DF04;
  *(_DWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = v2;
  return swift_task_switch();
}

uint64_t sub_20D92D068(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ACDXPCEventPublisherWrapper()
{
  return objc_opt_self();
}

unint64_t sub_20D92D0C8()
{
  unint64_t result;

  result = qword_2549CC2A0;
  if (!qword_2549CC2A0)
  {
    result = MEMORY[0x212BAC1E8](&protocol conformance descriptor for XPCEventSubscriberFlags, &type metadata for XPCEventSubscriberFlags);
    atomic_store(result, (unint64_t *)&qword_2549CC2A0);
  }
  return result;
}

unint64_t sub_20D92D110()
{
  unint64_t result;

  result = qword_2549CC2A8;
  if (!qword_2549CC2A8)
  {
    result = MEMORY[0x212BAC1E8](&protocol conformance descriptor for XPCEventSubscriberFlags, &type metadata for XPCEventSubscriberFlags);
    atomic_store(result, (unint64_t *)&qword_2549CC2A8);
  }
  return result;
}

unint64_t sub_20D92D158()
{
  unint64_t result;

  result = qword_2549CC2B0;
  if (!qword_2549CC2B0)
  {
    result = MEMORY[0x212BAC1E8](&protocol conformance descriptor for XPCEventSubscriberFlags, &type metadata for XPCEventSubscriberFlags);
    atomic_store(result, (unint64_t *)&qword_2549CC2B0);
  }
  return result;
}

unint64_t sub_20D92D1A0()
{
  unint64_t result;

  result = qword_2549CC2B8;
  if (!qword_2549CC2B8)
  {
    result = MEMORY[0x212BAC1E8](&protocol conformance descriptor for XPCEventSubscriberFlags, &type metadata for XPCEventSubscriberFlags);
    atomic_store(result, (unint64_t *)&qword_2549CC2B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberFlags()
{
  return &type metadata for XPCEventSubscriberFlags;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCEventSubscriber(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCEventSubscriber()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for XPCEventSubscriber(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for XPCEventSubscriber(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEventSubscriber(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCEventSubscriber(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriber()
{
  return &type metadata for XPCEventSubscriber;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCEventSubscriberAccountType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for XPCEventSubscriberAccountType()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEventSubscriberAccountType(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCEventSubscriberAccountType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberAccountType()
{
  return &type metadata for XPCEventSubscriberAccountType;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberAccountType.keys()
{
  return &type metadata for XPCEventSubscriberAccountType.keys;
}

ValueMetadata *type metadata accessor for AccountsXPCPublisherFirer()
{
  return &type metadata for AccountsXPCPublisherFirer;
}

uint64_t sub_20D92D5A4()
{
  return type metadata accessor for ACDXPCEventPublisher();
}

uint64_t type metadata accessor for ACDXPCEventPublisher()
{
  uint64_t result;

  result = qword_253E55000;
  if (!qword_253E55000)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D92D5E8()
{
  return swift_updateClassMetadata2();
}

void type metadata accessor for ACAccountChangeType(uint64_t a1)
{
  sub_20D92DEBC(a1, (unint64_t *)&unk_2549CC2C0);
}

uint64_t sub_20D92D674()
{
  return sub_20D92D6A0(&qword_2549CC2D0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BA5C);
}

uint64_t sub_20D92D6A0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BAC1E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20D92D6E0()
{
  return sub_20D92D6A0((unint64_t *)&unk_2549CC2D8, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BA34);
}

uint64_t sub_20D92D70C()
{
  return sub_20D92D6A0(&qword_253E54E40, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_20D93BAC4);
}

uint64_t sub_20D92D738(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_20D92D77C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_20D92D7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_20D92D820(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_20D93763C();
  __break(1u);
  return result;
}

char *sub_20D92D908(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_20D927400(result, v11, 1, v4, &qword_253E54E80, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_20D92D820);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[8 * a1 + 32];
    v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14])
      result = (char *)memmove(result, v15, 8 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_20D93763C();
  __break(1u);
  return result;
}

uint64_t sub_20D92DA70()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D92DA9C(uint64_t a1)
{
  uint64_t *v1;

  return sub_20D925BC8(a1, v1[2], v1[3], v1[4]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_20D92DAC0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D92DAFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_20D92DB7C;
  *(_QWORD *)(v4 + 40) = v3;
  *(_OWORD *)(v4 + 24) = v6;
  *(_QWORD *)(v4 + 16) = v2;
  return swift_task_switch();
}

uint64_t sub_20D92DB7C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20D92DBF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D92DC38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D92DC5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20D92DB7C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549CC368 + dword_2549CC368))(a1, v4);
}

unint64_t sub_20D92DCCC()
{
  unint64_t result;

  result = qword_253E54E28;
  if (!qword_253E54E28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E54E28);
  }
  return result;
}

uint64_t sub_20D92DD08(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BAC1E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20D92DD48()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D92DD6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20D92DF04;
  return sub_20D92484C();
}

uint64_t sub_20D92DDB0(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_20D9253CC(a1, a2, a3, v3);
}

uint64_t sub_20D92DDB8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D92DDEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v6 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *(_QWORD *)v6 = v1;
  *(_QWORD *)(v6 + 8) = sub_20D92DF04;
  *(_QWORD *)(v6 + 24) = v5;
  *(_QWORD *)(v6 + 32) = v4;
  *(_DWORD *)(v6 + 40) = v3;
  *(_QWORD *)(v6 + 16) = v2;
  return swift_task_switch();
}

unint64_t sub_20D92DE64()
{
  unint64_t result;

  result = qword_253E54E90;
  if (!qword_253E54E90)
  {
    result = MEMORY[0x212BAC1E8](MEMORY[0x24BEE4030], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_253E54E90);
  }
  return result;
}

void type metadata accessor for xpc_event_publisher_action_t(uint64_t a1)
{
  sub_20D92DEBC(a1, (unint64_t *)&unk_2549CC3C0);
}

void sub_20D92DEBC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_20D92DF1C()
{
  uint64_t v0;

  v0 = sub_20D937354();
  __swift_allocate_value_buffer(v0, qword_253E55238);
  __swift_project_value_buffer(v0, (uint64_t)qword_253E55238);
  return sub_20D937348();
}

uint64_t sub_20D92DF8C()
{
  uint64_t v0;

  if (qword_253E54F18 != -1)
    swift_once();
  v0 = sub_20D937354();
  return __swift_project_value_buffer(v0, (uint64_t)qword_253E55238);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20D92DFEC(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0x6465646461;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6465696669646F6DLL;
      break;
    case 2:
      result = 0x646574656C6564;
      break;
    case 3:
      result = 0x64656C696166;
      break;
    case 4:
      result = 0x55676E696D726177;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountsDaemonLogging()
{
  return &type metadata for AccountsDaemonLogging;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void ACDLogAccessRequest_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"ACDLogAccessRequest failed, probably because our dynamic lookup failed.\"", v1, 2u);
}

void _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE_cold_1(void *a1, const char *a2, NSObject *a3)
{
  int v5;
  const char *ClassName;
  __int16 v7;
  const char *Name;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 136315394;
  ClassName = object_getClassName(a1);
  v7 = 2080;
  Name = sel_getName(a2);
  _os_log_fault_impl(&dword_20D8CB000, a3, OS_LOG_TYPE_FAULT, "Authentication plugin '%s' indicated failure but provided no error! (selector: %s)", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __HandleLanguageChangeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "\"Notified of language change.\"", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __getSimulateCrashSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CrashReporterSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ACDEventLedger.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void ACDAccountSyncEnabled_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - ACDAccountSyncAccountIsSyncable is deprecated, returning NO\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void ACDAccountSyncDevices_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - ACDAccountSyncAccountIsSyncable is deprecated, returning empty array\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void ACDAccountSyncRemoveTombstones_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - ACDAccountSyncRemoveTombstones is deprecated, returning empty array\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void ACDAccountSyncMarkAccountCreated_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - ACDAccountSyncMarkAccountCreated is deprecated, returning NO\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void ACDAccountSyncMarkAccountDeleted_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - ACDAccountSyncMarkAccountDeleted is deprecated, returning NO\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

uint64_t sub_20D937300()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20D93730C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20D937318()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20D937324()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20D937330()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20D93733C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20D937348()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20D937354()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20D937360()
{
  return MEMORY[0x24BEE6468]();
}

uint64_t sub_20D93736C()
{
  return MEMORY[0x24BEE6478]();
}

uint64_t sub_20D937378()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_20D937384()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_20D937390()
{
  return MEMORY[0x24BEE6698]();
}

uint64_t sub_20D93739C()
{
  return MEMORY[0x24BEE66A8]();
}

uint64_t sub_20D9373A8()
{
  return MEMORY[0x24BEE66C0]();
}

uint64_t sub_20D9373B4()
{
  return MEMORY[0x24BEE66C8]();
}

uint64_t sub_20D9373C0()
{
  return MEMORY[0x24BEE66D0]();
}

uint64_t sub_20D9373CC()
{
  return MEMORY[0x24BEE66D8]();
}

uint64_t sub_20D9373D8()
{
  return MEMORY[0x24BEE6778]();
}

uint64_t sub_20D9373E4()
{
  return MEMORY[0x24BEE6780]();
}

uint64_t sub_20D9373F0()
{
  return MEMORY[0x24BEE6790]();
}

uint64_t sub_20D9373FC()
{
  return MEMORY[0x24BEE6798]();
}

uint64_t sub_20D937408()
{
  return MEMORY[0x24BEE67B0]();
}

uint64_t sub_20D937414()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20D937420()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20D93742C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_20D937438()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_20D937444()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D937450()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20D93745C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D937468()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D937474()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_20D937480()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_20D93748C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D937498()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20D9374A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20D9374B0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_20D9374BC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_20D9374C8()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_20D9374D4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_20D9374E0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_20D9374EC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_20D9374F8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20D937504()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20D937510()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20D93751C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20D937528()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_20D937534()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_20D937540()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_20D93754C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20D937558()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20D937564()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20D937570()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_20D93757C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_20D937588()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_20D937594()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20D9375A0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20D9375AC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_20D9375B8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20D9375C4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20D9375D0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_20D9375DC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_20D9375E8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_20D9375F4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20D937600()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20D93760C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D937618()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20D937624()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20D937630()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20D93763C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20D937648()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20D937654()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20D937660()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D93766C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_20D937678()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20D937684()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_20D937690()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_20D93769C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D9376A8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ACDGetAdamOrDisplayIDForPID()
{
  return MEMORY[0x24BDB41E8]();
}

uint64_t ACDGetProcNameForPID()
{
  return MEMORY[0x24BDB41F0]();
}

uint64_t ACIsInternal()
{
  return MEMORY[0x24BDB4258]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A0](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x24BE2B610]();
}

uint64_t DMPerformMigrationReturningAfterPlugin()
{
  return MEMORY[0x24BE2B618]();
}

uint64_t GSSRuleAddMatch()
{
  return MEMORY[0x24BDD1A40]();
}

uint64_t GSSRuleGetMatch()
{
  return MEMORY[0x24BDD1A48]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x24BDE87B0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

CFTypeID SecTrustGetTypeID(void)
{
  return MEMORY[0x24BDE8E10]();
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x24BDE8E20]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x24BEB3770]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x24BEB37C0]();
}

uint64_t TCCAccessResetForBundle()
{
  return MEMORY[0x24BEB37C8]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x24BEB37E8]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x24BDB4428]();
}

uint64_t _ACSignpostCreate()
{
  return MEMORY[0x24BDB4430]();
}

uint64_t _ACSignpostGetNanoseconds()
{
  return MEMORY[0x24BDB4438]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x24BEDDF00]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t lockdown_connect()
{
  return MEMORY[0x24BEDC4E0]();
}

uint64_t lockdown_copy_value()
{
  return MEMORY[0x24BEDC4F8]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x24BEDC510]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x24BEDC538]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

uint64_t serializeSecCertificates()
{
  return MEMORY[0x24BDB4670]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t unserializeSecCertificates()
{
  return MEMORY[0x24BDB4678]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x24BDB0900]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x24BDB0A10]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x24BDB0A18]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x24BDB0A20]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x24BDB0A28]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x24BDB0A30]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x24BDB0A38]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x24BDB0BC0]();
}

