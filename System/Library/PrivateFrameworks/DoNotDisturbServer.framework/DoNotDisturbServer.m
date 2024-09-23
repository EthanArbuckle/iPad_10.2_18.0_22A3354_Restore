void sub_1CB8978E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB897B20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id _DNDSPrimaryBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "containingBundleRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v1;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_INFO, "Mapping extension bundle %@ to containing bundle %@.", (uint8_t *)&v7, 0x16u);
    }

    v2 = v3;
  }
  else
  {
    v4 = v1;
  }

  return v4;
}

void sub_1CB898688(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CB899254(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CB8993A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CB8994EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_6(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1CB8A105C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1CB8A1460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB8A1C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1CB8A5500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB8A5874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB8A5BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB8A6240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *DNDSStringFromUILockState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<invalid>");
  if (a1 == 1)
    v1 = CFSTR("UI unlocked");
  if (a1)
    return v1;
  else
    return CFSTR("UI locked");
}

void sub_1CB8A7CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB8A7E10(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1CB8AAE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(_QWORD *a1, id *a2)
{
  __copy_constructor_8_8_s0_s8_s16(a1, a2);
  __copy_constructor_8_8_s0_s8_s16_s24(a1 + 3, a2 + 3);
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(a1 + 7, a2 + 7);
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88(a1 + 13, a2 + 13);
  a1[25] = a2[25];
  a1[26] = a2[26];
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(a1 + 27, a2 + 27);
  a1[33] = a2[33];
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48(a1 + 34, a2 + 34);
  return __copy_constructor_8_8_s0_s8_s16_s24(a1 + 41, a2 + 41);
}

id __copy_constructor_8_8_s0_s8_s16(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  result = a2[2];
  a1[2] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  result = a2[3];
  a1[3] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  result = a2[5];
  a1[5] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  result = a2[11];
  a1[11] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  result = a2[6];
  a1[6] = result;
  return result;
}

void sub_1CB8AC418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *DNDOverrideSettingToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (!a1)
    v1 = CFSTR("NO");
  if (a1 == 1)
    return CFSTR("YES");
  else
    return v1;
}

void sub_1CB8AEE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
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

void sub_1CB8B0C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

const __CFString *DNDSStringFromLostModeState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<invalid>");
  if (a1 == 1)
    v1 = CFSTR("Active");
  if (a1)
    return v1;
  else
    return CFSTR("Inactive");
}

void sub_1CB8BBCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
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

void sub_1CB8C51AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

const __CFString *currentDevicePlatformString()
{
  void *v0;
  uint64_t v1;
  const __CFString *v2;
  const __CFString *v3;

  objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceClass");
  v2 = CFSTR("unknown");
  if (v1 == 3)
    v2 = CFSTR("ipados");
  if (v1 == 1)
    v3 = CFSTR("iphoneos");
  else
    v3 = v2;

  return v3;
}

unint64_t DNDResolvedPreventAutoReplySetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

uint64_t DNDResolvedModesCanImpactAvailabilitySetting(uint64_t result)
{
  if (!result)
    return 2;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t meDeviceChangedNotificationCallback(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "meDeviceChanged");
  return result;
}

uint64_t fmfDevicesChangedNotificationCallback(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "devicesChanged");
  return result;
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

void sub_1CB8CED88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  if (!a1)
    return 1;
  v1 = (void *)MEMORY[0x1E0DC60B0];
  v2 = a1;
  objc_msgSend(v1, "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSourceWithIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sourceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "authorizationStatus") == 2;

  return v7;
}

void DNDWorkoutStateObserverCallback(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Requesting workout trigger refresh due to nano preferences change", v4, 2u);
  }
  objc_msgSend(v2, "_refreshForNanoPreferenceChange");

}

void sub_1CB8D5C9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

uint64_t DNDSyncStateChanged(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "NPS has sent notification, name=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(a2, "_updateForReason:", 0);
}

uint64_t DNDAssertionStateChanged(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "NPS has sent notification, name=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(a2, "_updateGizmoAssertionSync");
}

void sub_1CB8D97AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1CB8D9964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DNDSModeConfigurationsVersionSupported()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D1D3A0]);
}

void *DNDSModeConfigurationsMinimumRequiredVersionForConfigurationVersion(void *a1)
{
  if (objc_msgSend(a1, "integerValue") >= 4)
    return &unk_1E86DE5B0;
  else
    return &unk_1E86DE598;
}

void DNDDrivingTriggerObserverCallback(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  if (v2)
  {
    v3 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Requestig driving trigger refresh due to CarKit preferences notification", v4, 2u);
    }
    objc_msgSend(v2, "refresh");
  }

}

void DNDEffectiveOverridesChanged(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateScheduleSettingsWithDate:", v4);

}

uint64_t DNDPrivilegedSenderChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateBypassSettings");
}

void sub_1CB8DF75C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1CB8E1B44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CB8E39F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void DNDSMigrateLegacySettings()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  double v44;
  DNDSModeAssertionManager *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  id v65;
  NSObject *v66;
  _BOOL4 v67;
  id v68;
  DNDSClientDetailsProvider *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "dnds_legacySettingsFileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "fileExistsAtPath:", v2);

  if (!v3)
    goto LABEL_46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  +[DNDSSettingsRecord recordWithEncodedInfo:error:](DNDSSettingsRecord, "recordWithEncodedInfo:error:", v4, &v79);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v79;
  v7 = v6;
  if (!v5)
  {
    v19 = DNDSLogDataMigrator;
    v20 = os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v20)
        DNDSMigrateLegacySettings_cold_4((uint64_t)v7, v19, v22, v23, v24, v25, v26, v27);
      _DNDSRequestRadar(CFSTR("Error loading legacy settings"), v7, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m"), 68);
    }
    else if (v20)
    {
      DNDSMigrateLegacySettings_cold_3(v19, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_21;
  }
  v70 = v6;
  objc_msgSend(MEMORY[0x1E0C99E98], "dnds_settingsBackingStoreFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSSettingsRecord backingStoreWithFileURL:](DNDSSettingsRecord, "backingStoreWithFileURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readRecordWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheduleSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v12, "setScheduleSettings:", v11);

    v5 = v12;
  }
  v78 = 0;
  v13 = objc_msgSend(v9, "writeRecord:error:", v5, &v78);
  v14 = v78;
  if (!v13)
  {
    v28 = DNDSLogDataMigrator;
    if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR))
      DNDSMigrateLegacySettings_cold_5((uint64_t)v14, v28, v29, v30, v31, v32, v33, v34);
    _DNDSRequestRadar(CFSTR("Error writing migrated settings"), v14, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m"), 63);
    goto LABEL_20;
  }
  if (v13 != 1)
  {
    if (v13 != 2)
      goto LABEL_20;
    v15 = DNDSLogDataMigrator;
    if (!os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v16 = "Successfully wrote migrated settings";
    v17 = v15;
    v18 = 2;
    goto LABEL_19;
  }
  v35 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v81 = v14;
    v16 = "Error writing migrated settings, but error can be ignored; error=%{public}@";
    v17 = v35;
    v18 = 12;
LABEL_19:
    _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
  }
LABEL_20:

  v7 = v70;
LABEL_21:
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("overrideStatus"), objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "integerValue");
  if (v37)
  {
    v38 = v37;
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_localAssertionBackingStoreFileURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v0, "fileExistsAtPath:", v40);

    if ((v41 & 1) == 0)
    {
      v42 = DNDSLogDataMigrator;
      if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v42, OS_LOG_TYPE_DEFAULT, "Legacy override status present with no pre-existing assertion store, will create", buf, 2u);
      }
      objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("overrideStatusLastCalculatedTime"), objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceNow");
      if (v44 >= 0.0)
      {
        v50 = DNDSLogDataMigrator;
        if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR))
          DNDSMigrateLegacySettings_cold_2(v50, v51, v52, v53, v54, v55, v56, v57);
      }
      else
      {
        v71 = v7;
        v69 = objc_alloc_init(DNDSClientDetailsProvider);
        v45 = -[DNDSModeAssertionManager initWithBackingStoreURL:clientDetailsProvider:]([DNDSModeAssertionManager alloc], "initWithBackingStoreURL:clientDetailsProvider:", v39, v69);
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.legacy-migration"), 0);
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __DNDSMigrateLegacySettings_block_invoke;
        v74[3] = &unk_1E86A72F0;
        v77 = v38;
        v68 = v46;
        v75 = v68;
        v76 = v43;
        v73 = 0;
        -[DNDSModeAssertionManager updateModeAssertionsWithContextHandler:error:](v45, "updateModeAssertionsWithContextHandler:error:", v74, &v73);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v73;
        v49 = DNDSLogDataMigrator;
        if (v47)
        {
          if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB895000, v49, OS_LOG_TYPE_DEFAULT, "Successfully wrote migrated assertions", buf, 2u);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR))
            DNDSMigrateLegacySettings_cold_1((uint64_t)v48, v49, v58, v59, v60, v61, v62, v63);
          _DNDSRequestRadar(CFSTR("Error writing migrated assertions"), v48, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m"), 109);
        }

        v7 = v71;
      }

    }
  }
  v72 = 0;
  v64 = objc_msgSend(v0, "removeItemAtURL:error:", v1, &v72);
  v65 = v72;
  v66 = DNDSLogDataMigrator;
  v67 = os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT);
  if (v64)
  {
    if (v67)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v66, OS_LOG_TYPE_DEFAULT, "Successfully removed legacy settings", buf, 2u);
    }
  }
  else
  {
    if (v67)
    {
      *(_DWORD *)buf = 138543362;
      v81 = v65;
      _os_log_impl(&dword_1CB895000, v66, OS_LOG_TYPE_DEFAULT, "Error removing legacy settings, will request radar: error=%{public}@", buf, 0xCu);
    }
    _DNDSRequestRadar(CFSTR("Error removing legacy settings"), v65, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m"), 123);
  }

LABEL_46:
}

void sub_1CB8E8FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

uint64_t BMUserFocusModeComputedUpdateReasonForStateUpdateReason(unint64_t a1)
{
  if (a1 > 6)
    return 1;
  else
    return dword_1CB953B08[a1];
}

unint64_t BMUserFocusModeComputedUpdateSourceForStateUpdateSource(unint64_t result)
{
  if (result >= 4)
    return 2;
  else
    return result;
}

uint64_t BMUserFocusModeComputedSemanticTypeForDNDModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 0xB)
    return (a1 + 2);
  else
    return 0;
}

const __CFString *DNDSStringFromPairedDeviceClass(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("<unhandled>");
  else
    return off_1E86A7338[a1];
}

const __CFString *DNDSStringFromSyncServiceType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unhandled>");
  if (a1 == 2)
    v1 = CFSTR("cloud");
  if (a1 == 1)
    return CFSTR("local");
  else
    return v1;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t v0;

  return v0;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1CB8F0734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB8F2B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1CB8F8DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CB8F90A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CB8F9664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t DNDSMinorBuildVersionFromBuildVersion(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v2, "rangeOfCharacterFromSet:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByRemovingCharactersFromSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntValue");
  return v8;
}

uint64_t DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v12;
  const __CFString *v13;

  v5 = a2;
  v6 = DNDSMinorBuildVersionFromBuildVersion(v5);
  switch(a3)
  {
    case 1:
      if (*a1 < 15)
      {
        if (*a1 <= 12)
          goto LABEL_32;
        goto LABEL_29;
      }
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("19")))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("19A")))
      {
        if ((objc_msgSend(v5, "hasPrefix:", CFSTR("19B")) & 1) == 0
          && (objc_msgSend(v5, "hasPrefix:", CFSTR("19C")) & 1) == 0
          && (objc_msgSend(v5, "hasPrefix:", CFSTR("19D")) & 1) == 0)
        {
          v13 = CFSTR("19E");
          goto LABEL_45;
        }
        goto LABEL_43;
      }
      v7 = 9;
      if (v6 >= 0x110 && v6 - 5261 >= 0x14)
      {
        v8 = -5281;
        goto LABEL_22;
      }
      goto LABEL_33;
    case 2:
      if (*a1 < 12)
      {
        v10 = (void *)DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
          DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion_cold_1(a1, v10);
        goto LABEL_32;
      }
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("21")))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("21A")))
      {
        if ((objc_msgSend(v5, "hasPrefix:", CFSTR("21B")) & 1) != 0
          || (objc_msgSend(v5, "hasPrefix:", CFSTR("21C")) & 1) != 0
          || (objc_msgSend(v5, "hasPrefix:", CFSTR("21D")) & 1) != 0)
        {
          goto LABEL_43;
        }
        v13 = CFSTR("21E");
LABEL_45:
        v12 = objc_msgSend(v5, "hasPrefix:", v13) == 0;
        goto LABEL_46;
      }
      v7 = 9;
      if (v6 >= 0xF9 && v6 - 5248 >= 0x14)
      {
        v8 = -5268;
        goto LABEL_22;
      }
      goto LABEL_33;
    case 3:
      v9 = *a1;
      if (*a1 < 8)
      {
        if (v9 > 5)
        {
LABEL_29:
          v7 = 8;
        }
        else
        {
          if (v9 <= 3)
            goto LABEL_32;
          v7 = 1;
        }
      }
      else
      {
        if (!objc_msgSend(v5, "hasPrefix:", CFSTR("19")))
          goto LABEL_24;
        if (objc_msgSend(v5, "hasPrefix:", CFSTR("19R")))
        {
          v7 = 9;
          if (v6 >= 0x115 && v6 - 5266 >= 0x14)
          {
            v8 = -5286;
LABEL_22:
            if (v6 + v8 >= 0xFFFFFFFFFFFFFFECLL)
              goto LABEL_32;
            goto LABEL_43;
          }
        }
        else
        {
          if ((objc_msgSend(v5, "hasPrefix:", CFSTR("19S")) & 1) != 0)
          {
LABEL_43:
            v7 = 10;
            goto LABEL_33;
          }
          v12 = (objc_msgSend(v5, "hasPrefix:", CFSTR("19T")) & (v6 < 0x217)) == 0;
LABEL_46:
          if (v12)
            v7 = 11;
          else
            v7 = 10;
        }
      }
LABEL_33:

      return v7;
    case 4:
      if (*a1 <= 0)
        goto LABEL_32;
LABEL_24:
      v7 = 11;
      goto LABEL_33;
    default:
LABEL_32:
      v7 = 0;
      goto LABEL_33;
  }
}

uint64_t DNDSConfigurationSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  v5 = a2;
  v6 = DNDSMajorBuildVersionFromBuildVersion(v5);
  switch(a3)
  {
    case 1:
      v7 = *a1 < 15;
      goto LABEL_10;
    case 2:
      if (*a1 < 12 || v6 <= 0x15)
        goto LABEL_14;
      goto LABEL_16;
    case 3:
      v7 = *a1 < 8;
LABEL_10:
      if (!v7 && v6 > 0x13)
        goto LABEL_16;
LABEL_14:
      v12 = *(_OWORD *)a1;
      v13 = a1[2];
      v10 = DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v12, v5, a3);
      break;
    case 4:
      if (*a1 <= 0)
        goto LABEL_17;
LABEL_16:
      v10 = 12;
      break;
    default:
LABEL_17:
      v10 = 0;
      break;
  }

  return v10;
}

BOOL DNDSisIOS14EraOSFromOperatingSystemVersionAndDeviceClass(_QWORD *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    if (*a1 == 14)
      return 1;
  }
  else
  {
    if (a2 != 3)
      return a2 == 2 && *a1 == 10 && a1[1] == 18;
    if (*a1 == 7)
      return 1;
  }
  return 0;
}

uint64_t DNDSsupportsSilenceListsSFromOperatingSystemVersionAndDeviceClass(uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  switch(a2)
  {
    case 1:
      if (*a1 <= 15)
        goto LABEL_7;
      goto LABEL_9;
    case 2:
      if (*a1 > 12)
        goto LABEL_9;
      goto LABEL_7;
    case 3:
      if (*a1 <= 8)
        goto LABEL_7;
      goto LABEL_9;
    case 4:
      if (*a1 <= 0)
        goto LABEL_7;
LABEL_9:
      result = 1;
      break;
    default:
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

void sub_1CB8FB518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDSMajorBuildVersionFromBuildVersion(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "rangeOfCharacterFromSet:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByRemovingCharactersFromSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntValue");
  return v8;
}

void sub_1CB90003C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CB900A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DNDSRegisterSysdiagnose()
{
  return _DNDSSysdiagnoseDataProviders();
}

id _DNDSSysdiagnoseDataProviders()
{
  if (_DNDSSysdiagnoseDataProviders_onceToken != -1)
    dispatch_once(&_DNDSSysdiagnoseDataProviders_onceToken, &__block_literal_global_22);
  return (id)_DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders;
}

void DNDSRegisterSysdiagnoseDataProvider(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  _DNDSSysdiagnoseDataProviders();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unsignedLongValue");
    os_state_remove_handler();
  }
  v7 = v1;
  v5 = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", os_state_add_handler());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);
}

uint64_t DNDSRedactSysdiagnose()
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("DNDSAllowUnredactedSysdiagnose"));

  return (v1 | os_variant_has_internal_diagnostics()) ^ 1;
}

void DNDSUnregisterSysdiagnoseDataProvider(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  _DNDSSysdiagnoseDataProviders();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "unsignedLongValue");
    os_state_remove_handler();
    objc_msgSend(v1, "removeObjectForKey:", v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);

}

id DNDSCollectSysdiagnoseState(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  _DNDSSysdiagnoseDataProviders();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138543362;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "sysdiagnoseDataIdentifier", v15, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = DNDSLogSysdiagnose;
        if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          v21 = v11;
          _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Capturing statedump from %{public}@", buf, 0xCu);
        }
        objc_msgSend(v10, "sysdiagnoseDataForDate:redacted:", v1, DNDSRedactSysdiagnose());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v11);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  return v3;
}

BOOL DNDSIsSysdiagnoseBeingCaptured()
{
  unsigned int v0;

  v0 = atomic_load((unsigned int *)&_sysdiagnoseInProgress);
  return v0 != 0;
}

void OUTLINED_FUNCTION_0_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_1_3(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void DNDSRegisterLogging()
{
  DNDRegisterLogging();
  if (DNDSRegisterLogging_onceToken != -1)
    dispatch_once(&DNDSRegisterLogging_onceToken, &__block_literal_global_23);
}

void sub_1CB906508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB90B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1CB90BDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB90C3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CB90CAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CB90D1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CB90D898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CB90E3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CB90EE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CB90F558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CB90FED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_13(id a1)
{
  return a1;
}

uint64_t DNDMirrorStateChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePairSyncPreferences");
}

void sub_1CB9186D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1CB918940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB918B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB918DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB919054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB9192B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___intersect_clientIdentifier_modeIdentifier_priority_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[28];
  _QWORD v6[29];

  v6[28] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.private.SpringBoard.focus.intents");
  v5[1] = CFSTR("com.apple.donotdisturb.control-center.module");
  v6[0] = &unk_1E86DEA90;
  v6[1] = &unk_1E86DEAB8;
  v5[2] = CFSTR("com.apple.donotdisturb.siri.assistant");
  v5[3] = CFSTR("com.apple.donotdisturb.preferences");
  v6[2] = &unk_1E86DEAE0;
  v6[3] = &unk_1E86DEB08;
  v5[4] = CFSTR("com.apple.siri.Settings");
  v5[5] = CFSTR("com.apple.springboard.donotdisturb.hid");
  v6[4] = &unk_1E86DEB30;
  v6[5] = &unk_1E86DEB58;
  v5[6] = CFSTR("com.apple.donotdisturb.DoNotDisturbAppIntents");
  v5[7] = CFSTR("com.apple.DoNotDisturb.Intents");
  v6[6] = &unk_1E86DEB80;
  v6[7] = &unk_1E86DEBA8;
  v5[8] = CFSTR("com.apple.donotdisturb.private.intents");
  v5[9] = CFSTR("com.apple.donotdisturb.private.intents.user-interactive");
  v6[8] = &unk_1E86DEBD0;
  v6[9] = &unk_1E86DEBF8;
  v5[10] = CFSTR("com.apple.private.dndtool");
  v5[11] = CFSTR("com.apple.private.dndtool.user-requested");
  v6[10] = &unk_1E86DEC20;
  v6[11] = &unk_1E86DEC48;
  v5[12] = CFSTR("com.apple.carkitd.assertion-service");
  v5[13] = CFSTR("com.apple.donotdisturb.private.driving-trigger");
  v6[12] = &unk_1E86DEC70;
  v6[13] = &unk_1E86DEC98;
  v5[14] = CFSTR("com.apple.private.Carousel.school-mode.DND.state");
  v5[15] = CFSTR("com.apple.donotdisturb.private.app-launch");
  v6[14] = &unk_1E86DECC0;
  v6[15] = &unk_1E86DECE8;
  v5[16] = CFSTR("com.apple.donotdisturb.private.gaming-trigger");
  v5[17] = CFSTR("com.apple.donotdisturb.private.mindfulness-trigger");
  v6[16] = &unk_1E86DED10;
  v6[17] = &unk_1E86DED38;
  v5[18] = CFSTR("com.apple.donotdisturb.private.workout-trigger");
  v5[19] = CFSTR("com.apple.HealthDaemon.assertion-service");
  v6[18] = &unk_1E86DED60;
  v6[19] = &unk_1E86DED88;
  v5[20] = CFSTR("com.apple.sleep.sleep-mode");
  v5[21] = CFSTR("com.apple.donotdisturb.private.sleeping-trigger");
  v6[20] = &unk_1E86DEDB0;
  v6[21] = &unk_1E86DEDD8;
  v5[22] = CFSTR("com.apple.sleep.sleep-mode-legacy");
  v5[23] = CFSTR("com.apple.mobiletimer.bedtime-mode");
  v6[22] = &unk_1E86DEE00;
  v6[23] = &unk_1E86DEE28;
  v5[24] = CFSTR("com.apple.donotdisturb.private.schedule");
  v3[0] = *MEMORY[0x1E0D1D4C8];
  v3[1] = CFSTR("*");
  v4[0] = &unk_1E86DE6A0;
  v4[1] = &unk_1E86DE6B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[24] = v0;
  v6[25] = &unk_1E86DEE50;
  v5[25] = CFSTR("com.apple.donotdisturb.private.region");
  v5[26] = CFSTR("com.apple.donotdisturb.private.smart-trigger");
  v5[27] = CFSTR("*");
  v6[26] = &unk_1E86DEE78;
  v6[27] = &unk_1E86DEEA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_intersect_clientIdentifier_modeIdentifier_priority_dict;
  _intersect_clientIdentifier_modeIdentifier_priority_dict = v1;

}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason(uint64_t a1)
{
  uint64_t v1;

  v1 = 1;
  if (a1 == 5)
    v1 = 2;
  if (a1 == 1)
    return 0;
  else
    return v1;
}

BOOL DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

unint64_t DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(unint64_t result)
{
  if (result >= 0xA)
    return -1;
  return result;
}

void DNDSPowerLogFocusStatusChangeEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v20[0] = a1;
  v19[0] = CFSTR("timestamp");
  v19[1] = CFSTR("Available");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a1;
  objc_msgSend(v11, "numberWithInteger:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  v19[3] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("SemanticType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v16;
  v19[5] = CFSTR("ExtensionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

BOOL DNDSPowerLogInterruptionSuppressionForDNDInterruptionSuppression(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

void DNDSPowerLogFocusInterruptionSuppresionEvent(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 - 1) <= 1)
  {
    v8[0] = a1;
    v7[0] = CFSTR("BundleID");
    v7[1] = CFSTR("InterruptionSuppression");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a1;
    objc_msgSend(v3, "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("Count");
    v8[1] = v5;
    v8[2] = &unk_1E86DE718;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogRegisteredEvent();
  }
}

void DNDSPowerLogFocusFilterPerformEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v17[0] = a1;
  v16[0] = CFSTR("timestamp");
  v16[1] = CFSTR("Source");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a1;
  objc_msgSend(v9, "numberWithInteger:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  v16[2] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  v16[3] = CFSTR("SemanticType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  v16[4] = CFSTR("ExtensionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

void sub_1CB91C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDSSyncEngineStateIsAvailable(unint64_t a1)
{
  uint64_t v1;

  v1 = HIDWORD(a1) & 1;
  if ((~(_DWORD)a1 & 0x1010100) != 0)
    LODWORD(v1) = 0;
  if ((a1 & 0x10000000000) != 0)
    return 1;
  else
    return v1;
}

uint64_t DNDSSyncEngineStateIsEnabled(unint64_t a1)
{
  uint64_t v1;

  v1 = HIDWORD(a1) & 1;
  if ((~(_DWORD)a1 & 0x1010101) != 0)
    LODWORD(v1) = 0;
  if ((a1 & 0x10000000000) != 0)
    return 1;
  else
    return v1;
}

BOOL DNDSSyncEngineStatePreferenceIsEnabled(uint64_t a1)
{
  return (a1 & 0x10000000001) != 0;
}

const __CFString *DNDSResolutionOutcomeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E86A8198[a1];
}

id _DNDSContainingBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "containingBundleRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v1;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_INFO, "Mapping extension bundle %@ to containing bundle %@.", (uint8_t *)&v7, 0x16u);
    }

    v2 = v3;
  }
  else
  {
    v4 = v1;
  }

  return v4;
}

void sub_1CB9312E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CB931454(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;

  return v0;
}

void _DNDSRequestRadar(void *a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[10];
  _QWORD v55[12];

  v55[10] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  if (os_variant_has_internal_content() && !DNDSIsSysdiagnoseBeingCaptured())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
    {
      objc_msgSend(v10, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR(" -- %@:%lu"), v14, objc_msgSend(v10, "code"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("[AUTO GENERATED] %@ (%@:%lu%@)"), v9, v41, a5, v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AUTO GENERATED] %@ (%@:%lu%@)"), v9, v41, a5, &stru_1E86A90B0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please describe what you were doing:\n\n\n--- Do not edit below this line ---\n\nError: %@\n\nOriginal title: %@"), v10, v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy.MM.dd_HH-mm-ss"));
    v17 = (void *)MEMORY[0x1E0C99E08];
    v54[0] = CFSTR("Title");
    v54[1] = CFSTR("Description");
    v54[2] = CFSTR("Classification");
    v54[3] = CFSTR("ComponentID");
    v55[2] = CFSTR("Serious Bug");
    v55[3] = CFSTR("960036");
    v54[4] = CFSTR("ComponentName");
    v54[5] = CFSTR("ComponentVersion");
    v55[4] = CFSTR("Do Not Disturb (iOS)");
    v55[5] = CFSTR("New Bugs");
    v54[6] = CFSTR("Reproducibility");
    v54[7] = CFSTR("IncludeDevicePrefixInTitle");
    v55[0] = v42;
    v55[1] = v39;
    v55[6] = CFSTR("Not Applicable");
    v55[7] = CFSTR("1");
    v54[8] = CFSTR("TimeOfIssue");
    objc_msgSend(v16, "stringFromDate:", v40);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[8] = v18;
    v54[9] = CFSTR("DeviceClasses");
    if (a3)
      v19 = CFSTR("iPhone,iPad,Watch,Mac");
    else
      v19 = &stru_1E86A90B0;
    v55[9] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = ___DNDSRequestRadar_block_invoke;
    v43[3] = &unk_1E86A83F8;
    v23 = v22;
    v44 = v23;
    objc_msgSend(v21, "bs_each:", v43);
    v24 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v24, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v24, "setHost:", CFSTR("new"));
    objc_msgSend(v24, "setQueryItems:", v23);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v25 = (void *)getUNUserNotificationCenterClass_softClass;
    v53 = getUNUserNotificationCenterClass_softClass;
    if (!getUNUserNotificationCenterClass_softClass)
    {
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __getUNUserNotificationCenterClass_block_invoke;
      v48 = &unk_1E86A8460;
      v49 = &v50;
      __getUNUserNotificationCenterClass_block_invoke((uint64_t)&v45);
      v25 = (void *)v51[3];
    }
    v26 = objc_retainAutorelease(v25);
    _Block_object_dispose(&v50, 8);
    v27 = (void *)objc_msgSend([v26 alloc], "initWithBundleIdentifier:", CFSTR("com.apple.donotdisturb"));
    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v28 = (void *)getUNMutableNotificationContentClass_softClass;
    v53 = getUNMutableNotificationContentClass_softClass;
    if (!getUNMutableNotificationContentClass_softClass)
    {
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __getUNMutableNotificationContentClass_block_invoke;
      v48 = &unk_1E86A8460;
      v49 = &v50;
      __getUNMutableNotificationContentClass_block_invoke((uint64_t)&v45);
      v28 = (void *)v51[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&v50, 8);
    v30 = objc_alloc_init(v29);
    objc_msgSend(v30, "setTitle:", CFSTR("Focus Radar Request (internal)"));
    objc_msgSend(v30, "setBody:", CFSTR("Focus encountered an unexpected state. Please file a Radar to help us diagnose this issue!"));
    objc_msgSend(v30, "setThreadIdentifier:", CFSTR("com.apple.donotdisturbd"));
    objc_msgSend(v30, "setInterruptionLevel:", 1);
    objc_msgSend(v24, "URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDefaultActionURL:", v31);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 36000.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setExpirationDate:", v32);

    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v33 = (void *)getUNNotificationIconClass_softClass;
    v53 = getUNNotificationIconClass_softClass;
    if (!getUNNotificationIconClass_softClass)
    {
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __getUNNotificationIconClass_block_invoke;
      v48 = &unk_1E86A8460;
      v49 = &v50;
      __getUNNotificationIconClass_block_invoke((uint64_t)&v45);
      v33 = (void *)v51[3];
    }
    v34 = objc_retainAutorelease(v33);
    _Block_object_dispose(&v50, 8);
    objc_msgSend(v34, "iconForApplicationIdentifier:", CFSTR("com.apple.TapToRadar"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIcon:", v35);

    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v36 = (void *)getUNNotificationRequestClass_softClass;
    v53 = getUNNotificationRequestClass_softClass;
    if (!getUNNotificationRequestClass_softClass)
    {
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __getUNNotificationRequestClass_block_invoke;
      v48 = &unk_1E86A8460;
      v49 = &v50;
      __getUNNotificationRequestClass_block_invoke((uint64_t)&v45);
      v36 = (void *)v51[3];
    }
    v37 = objc_retainAutorelease(v36);
    _Block_object_dispose(&v50, 8);
    objc_msgSend(v37, "requestWithIdentifier:content:trigger:", CFSTR("com.apple.donotdisturbd.blah"), v30, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addNotificationRequest:withCompletionHandler:", v38, &__block_literal_global_37);

  }
}

void sub_1CB934F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UNUserNotificationCenter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNUserNotificationCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
    UserNotificationsLibrary();
  }
}

void UserNotificationsLibrary()
{
  void *v0;

  if (!UserNotificationsLibraryCore_frameworkLibrary)
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getUNMutableNotificationContentClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserNotificationsLibrary();
  result = objc_getClass("UNMutableNotificationContent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNMutableNotificationContentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUNMutableNotificationContentClass_block_invoke_cold_1();
    return (Class)__getUNNotificationIconClass_block_invoke(v3);
  }
  return result;
}

Class __getUNNotificationIconClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserNotificationsLibrary();
  result = objc_getClass("UNNotificationIcon");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationIconClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUNNotificationIconClass_block_invoke_cold_1();
    return (Class)__getUNNotificationRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getUNNotificationRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  uint64_t v4;
  void *v5;

  UserNotificationsLibrary();
  result = objc_getClass("UNNotificationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getUNNotificationRequestClass_block_invoke_cold_1();
    return (Class)DNDSGetLifetimePhase(v3, v4, v5);
  }
  return result;
}

uint64_t DNDSGetLifetimePhase(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a1;
  v6 = a3;
  if (objc_msgSend(v5, "compare:", a2) == -1)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v5, "compare:", v6) == -1)
  {
    v7 = 1;
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

void sub_1CB9359DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDHandleSignificantTimeChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleSignificantTimeChange");
}

void DNDSHandleLostModeStateChange(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D21380];
  v3 = a2;
  objc_msgSend(v2, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lostModeIsActive");

  v6 = v5;
  v7 = (void *)DNDSLogSystemState;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    DNDSStringFromLostModeState(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Received new lost mode state: state=%@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v3, "_setLostModeState:error:", v6, 0);

}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1CB93DA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t DNDSRunServer()
{
  if (DNDSRunServer_onceToken != -1)
    dispatch_once(&DNDSRunServer_onceToken, &__block_literal_global_41);
  return 0;
}

uint64_t sub_1CB941834()
{
  uint64_t v0;

  v0 = sub_1CB94A3B0();
  __swift_allocate_value_buffer(v0, qword_1ED893BB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED893BB8);
  return sub_1CB94A3A4();
}

uint64_t sub_1CB9418B4()
{
  uint64_t v0;

  if (qword_1ED893A50 != -1)
    swift_once();
  v0 = sub_1CB94A3B0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1ED893BB8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1CB941914@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED893A50 != -1)
    swift_once();
  v2 = sub_1CB94A3B0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED893BB8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

DNDSPlatformEligibility __swiftcall DNDSPlatformEligibility.init()()
{
  return (DNDSPlatformEligibility)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id DNDSPlatformEligibility.init()()
{
  objc_super v1;

  v1.super_class = (Class)DNDSPlatformEligibility;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_1CB941A2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1CB941AFC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1CB94264C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1CB94264C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1CB941AFC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1CB94A3EC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1CB941CB4(a5, a6);
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
  v8 = sub_1CB94A404();
  if (!v8)
  {
    sub_1CB94A410();
    __break(1u);
LABEL_17:
    result = sub_1CB94A41C();
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

uint64_t sub_1CB941CB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1CB941D48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CB941F20(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1CB941F20(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CB941D48(uint64_t a1, unint64_t a2)
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
      v3 = sub_1CB941EBC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1CB94A3F8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1CB94A410();
      __break(1u);
LABEL_10:
      v2 = sub_1CB94A3BC();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1CB94A41C();
    __break(1u);
LABEL_14:
    result = sub_1CB94A410();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1CB941EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AD100);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CB941F20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AD100);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1CB94A41C();
  __break(1u);
  return result;
}

uint64_t sub_1CB94206C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint8_t *v31;
  uint64_t v32;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint8_t *v38;
  uint8_t *v39;
  uint8_t *v40;
  uint64_t v41;
  uint8_t **v42;
  char *v43;
  uint8_t **v44;
  uint8_t **v45;
  char *v46;
  uint64_t v47;
  uint64_t v48[13];

  if (MEMORY[0x1E0D26170])
    v2 = MEMORY[0x1E0D26188] == 0;
  else
    v2 = 1;
  if (v2 || MEMORY[0x1E0D26178] == 0)
    return 0;
  v48[11] = v0;
  v48[12] = v1;
  v4 = sub_1CB94A38C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CB94A368();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CB94A35C();
  sub_1CB94A380();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = sub_1CB94A350();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CB94A374();
  v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (MEMORY[0x1E0D25F78] && v16 == *MEMORY[0x1E0D25F78])
  {
    v45 = &v39;
    v46 = (char *)&v39;
    (*(void (**)(char *, uint64_t))(v13 + 96))(v15, v12);
    v17 = sub_1CB94A344();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(_QWORD *)(v18 + 64);
    MEMORY[0x1E0C80A78]();
    v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
    v21 = (char *)&v39 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)&v39 - v20, v15, v17);
    if (qword_1ED893A50 != -1)
      swift_once();
    v22 = sub_1CB94A3B0();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED893BB8);
    v44 = &v39;
    MEMORY[0x1E0C80A78]();
    v23 = (char *)&v39 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v21, v17);
    v24 = sub_1CB94A398();
    v25 = sub_1CB94A3D4();
    v43 = v21;
    v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v48[0] = v41;
      v42 = &v39;
      *(_DWORD *)v27 = 136315138;
      v39 = v27 + 4;
      v40 = v27;
      sub_1CB9425E4();
      v28 = sub_1CB94A428();
      v47 = sub_1CB941A2C(v28, v29, v48);
      sub_1CB94A3E0();
      swift_bridgeObjectRelease();
      v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v23, v17);
      v31 = v40;
      _os_log_impl(&dword_1CB895000, v24, v26, "Generative models unavailable. Info: %s", v40, 0xCu);
      v32 = v41;
      swift_arrayDestroy();
      MEMORY[0x1D17A0FE0](v32, -1, -1);
      MEMORY[0x1D17A0FE0](v31, -1, -1);

    }
    else
    {

      v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v23, v17);
    }
    v30(v43, v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    if (MEMORY[0x1E0D26080] && v16 == *MEMORY[0x1E0D26080])
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return 1;
    }
    if (qword_1ED893A50 != -1)
      swift_once();
    v34 = sub_1CB94A3B0();
    __swift_project_value_buffer(v34, (uint64_t)qword_1ED893BB8);
    v35 = sub_1CB94A398();
    v36 = sub_1CB94A3C8();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v46 = v7;
      v38 = v37;
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1CB895000, v35, v36, "Received unknown generative models availability state", v37, 2u);
      v7 = v46;
      MEMORY[0x1D17A0FE0](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return 0;
}

unint64_t type metadata accessor for DNDSPlatformEligibility()
{
  unint64_t result;

  result = qword_1EF9AD140;
  if (!qword_1EF9AD140)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF9AD140);
  }
  return result;
}

unint64_t sub_1CB9425E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED893900;
  if (!qword_1ED893900)
  {
    v1 = sub_1CB94A344();
    result = MEMORY[0x1D17A0FA4](MEMORY[0x1E0D26068], v1);
    atomic_store(result, (unint64_t *)&qword_1ED893900);
  }
  return result;
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

uint64_t sub_1CB94264C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17A0F98]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

void DNDSMigrateLegacySettings_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error writing migrated assertions, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DNDSMigrateLegacySettings_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Legacy override status' effective time is in the future. Ignoring...", a5, a6, a7, a8, 0);
}

void DNDSMigrateLegacySettings_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Error loading legacy settings but there was no error. Will ignore.", a5, a6, a7, a8, 0);
}

void DNDSMigrateLegacySettings_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error loading legacy settings, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DNDSMigrateLegacySettings_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error writing migrated settings, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion_cold_1(uint64_t *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v3, "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v8, "Unexpected macOS version: %@.%@", (uint8_t *)&v9);

}

uint64_t __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNMutableNotificationContentClass_block_invoke_cold_1(v0);
}

uint64_t __getUNMutableNotificationContentClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNNotificationIconClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationIconClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNNotificationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[DNDSServer pairedCloudDevicesForSyncManager:].cold.1(v0);
}

uint64_t sub_1CB94A344()
{
  return MEMORY[0x1E0D26050]();
}

uint64_t sub_1CB94A350()
{
  return MEMORY[0x1E0D26098]();
}

uint64_t sub_1CB94A35C()
{
  return MEMORY[0x1E0D260C0]();
}

uint64_t sub_1CB94A368()
{
  return MEMORY[0x1E0D260E0]();
}

uint64_t sub_1CB94A374()
{
  return MEMORY[0x1E0D260F0]();
}

uint64_t sub_1CB94A380()
{
  return MEMORY[0x1E0D26100]();
}

uint64_t sub_1CB94A38C()
{
  return MEMORY[0x1E0D26170]();
}

uint64_t sub_1CB94A398()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CB94A3A4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CB94A3B0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CB94A3BC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CB94A3C8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CB94A3D4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CB94A3E0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CB94A3EC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CB94A3F8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CB94A404()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CB94A410()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CB94A41C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CB94A428()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x1E0D01178]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1E0D01228]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1E0D012B0]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1E0D01458]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98030](bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1E0C94AC8]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DNDCompatibilityVersionToString()
{
  return MEMORY[0x1E0D1D3B8]();
}

uint64_t DNDEnabledSettingToString()
{
  return MEMORY[0x1E0D1D3D0]();
}

uint64_t DNDEnumerateDaysOfWeekStartingOnDay()
{
  return MEMORY[0x1E0D1D3D8]();
}

uint64_t DNDIntelligentInterruptionBehaviorToString()
{
  return MEMORY[0x1E0D1D3F8]();
}

uint64_t DNDMeDeviceStatusToString()
{
  return MEMORY[0x1E0D1D400]();
}

uint64_t DNDModeAssertionInvalidationReasonOverrideToString()
{
  return MEMORY[0x1E0D1D408]();
}

uint64_t DNDModeAssertionInvalidationReasonToString()
{
  return MEMORY[0x1E0D1D410]();
}

uint64_t DNDMostRestrictiveInterruptionSuppression()
{
  return MEMORY[0x1E0D1D428]();
}

uint64_t DNDOperatingSystemVersionCompare()
{
  return MEMORY[0x1E0D1D430]();
}

uint64_t DNDOperatingSystemVersionFromString()
{
  return MEMORY[0x1E0D1D438]();
}

uint64_t DNDPlatformForCurrentDevice()
{
  return MEMORY[0x1E0D1D448]();
}

uint64_t DNDRegisterLogging()
{
  return MEMORY[0x1E0D1D458]();
}

uint64_t DNDRemoteAppConfigurationServiceServerInterface()
{
  return MEMORY[0x1E0D1D460]();
}

uint64_t DNDRemoteAvailabilityServiceServerInterface()
{
  return MEMORY[0x1E0D1D468]();
}

uint64_t DNDRemoteMonitorServerInterface()
{
  return MEMORY[0x1E0D1D470]();
}

uint64_t DNDRemoteServiceServerInterface()
{
  return MEMORY[0x1E0D1D478]();
}

uint64_t DNDResolutionReasonToString()
{
  return MEMORY[0x1E0D1D480]();
}

uint64_t DNDResolvedBedtimeBehaviorEnabledSetting()
{
  return MEMORY[0x1E0D1D488]();
}

uint64_t DNDResolvedImmediateBypassEventSourceType()
{
  return MEMORY[0x1E0D1D498]();
}

uint64_t DNDResolvedImpactsAvailabilitySetting()
{
  return MEMORY[0x1E0D1D4A0]();
}

uint64_t DNDResolvedInterruptionBehaviorSetting()
{
  return MEMORY[0x1E0D1D4A8]();
}

uint64_t DNDResolvedModeAssertionInvalidationReason()
{
  return MEMORY[0x1E0D1D4B0]();
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSetting()
{
  return MEMORY[0x1E0D1D4B8]();
}

uint64_t DNDResolvedScheduleEnabledSetting()
{
  return MEMORY[0x1E0D1D4C0]();
}

uint64_t DNDStateUpdateReasonToString()
{
  return MEMORY[0x1E0D1D4D0]();
}

uint64_t DNDStateUpdateSourceToString()
{
  return MEMORY[0x1E0D1D4D8]();
}

uint64_t DNDStringFromBreakthroughUrgency()
{
  return MEMORY[0x1E0D1D4E0]();
}

uint64_t DNDStringFromClientEventType()
{
  return MEMORY[0x1E0D1D4E8]();
}

uint64_t DNDStringFromClientEventUrgency()
{
  return MEMORY[0x1E0D1D4F0]();
}

uint64_t DNDStringFromConfigurationType()
{
  return MEMORY[0x1E0D1D4F8]();
}

uint64_t DNDStringFromDeviceCapabilities()
{
  return MEMORY[0x1E0D1D500]();
}

uint64_t DNDStringFromDeviceClass()
{
  return MEMORY[0x1E0D1D508]();
}

uint64_t DNDStringFromInterruptionBehaviorSetting()
{
  return MEMORY[0x1E0D1D510]();
}

uint64_t DNDStringFromInterruptionSuppression()
{
  return MEMORY[0x1E0D1D518]();
}

uint64_t DNDStringFromInterruptionSuppressionMode()
{
  return MEMORY[0x1E0D1D520]();
}

uint64_t DNDStringFromOperatingSystemVersion()
{
  return MEMORY[0x1E0D1D528]();
}

uint64_t DNDSystemColorNameForModeSemanticType()
{
  return MEMORY[0x1E0D1D538]();
}

uint64_t DNDSystemColorNamesForModeSemanticType()
{
  return MEMORY[0x1E0D1D540]();
}

uint64_t DNDSystemImageNameForModeSemanticType()
{
  return MEMORY[0x1E0D1D548]();
}

uint64_t DNDWeekdaysFromDay()
{
  return MEMORY[0x1E0D1D550]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1E0D33E20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1E0D4E4A8]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1E0D4E4B0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromDNDPlatform()
{
  return MEMORY[0x1E0D1D560]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1E0DB0F90]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1E0DB0FA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1E0C85DA8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1E0C86428]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1E0C86438]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1E0C86448]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1E0C86470]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1E0C86488]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

