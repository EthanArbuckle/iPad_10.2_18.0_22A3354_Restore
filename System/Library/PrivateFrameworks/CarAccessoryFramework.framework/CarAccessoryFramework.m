void sub_2377199F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_237719A7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

__CFString *NSStringFromPlaybackState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FD260[(char)a1];
}

void sub_23771ED34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromButtonAction(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("PerformAction");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Ready");
}

__CFString *NSStringFromEqualizerType(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_2508FD2F8[(char)a1];
}

void sub_237727A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_237727A94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23772929C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

__CFString *NSStringFromMediaSourceSemanticType(unsigned int a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_2508FD430[(char)a1];
}

__CFString *NSStringFromVolumeType(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_2508FD478[(char)a1];
}

const __CFString *NSStringFromUIInputDeviceButtonEvent(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("ButtonDown");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("ButtonUp");
}

const __CFString *NSStringFromRotationalSpeedState(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Redline");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Normal");
}

uint64_t CAFPreferencesGetBoolean(const __CFString *a1, unsigned int a2)
{
  _BOOL4 v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue(a1, CFSTR("com.apple.CarAccessoryFramework"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v3;
  else
    return a2;
}

id CAFPreferencesGetArray(const __CFString *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  v4 = (void *)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.CarAccessoryFramework"));
  objc_opt_class();
  v5 = v4;
  if (!v5 || (v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = v3;
  }

  return v6;
}

BOOL CAFDefaultsHasValue(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF50];
  v2 = a1;
  objc_msgSend(v1, "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

uint64_t CAFDefaultsGetBoolean(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a1;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    a2 = objc_msgSend(v6, "BOOLValue");

  return a2;
}

__CFString *NSStringFromTargetSpeedState(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_2508FD4C8[(char)a1];
}

__CFString *NSStringFromPairedDeviceState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FD4F0[(char)a1];
}

__CFString *NSStringFromSettingsCategory(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_2508FD508[(char)a1];
}

__CFString *NSStringFromAutoModeIntensity(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_2508FD528[(char)a1];
}

__CFString *NSStringFromImageColor(unsigned int a1)
{
  if (a1 > 0xF)
    return 0;
  else
    return off_2508FDD40[(char)a1];
}

__CFString *NSStringFromTemperatureState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FDDC0[(char)a1];
}

__CFString *NSStringFromLockState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FDDD8[(char)a1];
}

const __CFString *NSStringFromCharacteristicMetadataFormat(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("unknown");
  else
    return off_2508FDE68[a1];
}

void sub_237757D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

__CFString *NSStringFromSeatBeltIndicator(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FE4D8[(char)a1];
}

void sub_2377641DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237764520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

__CFString *NSStringFromPressureState(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_2508FE568[(char)a1];
}

void sub_2377672EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a34);
  _Unwind_Resume(a1);
}

void sub_237767C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237767F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_237769BA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

uint64_t OUTLINED_FUNCTION_21(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

__CFString *NSStringFromUISceneState(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_2508FE800[(char)a1];
}

id CAFFrameworkBundle()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/CarAccessoryFramework.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CAFAppIdentifier()
{
  if (CAFAppIdentifier_onceToken != -1)
    dispatch_once(&CAFAppIdentifier_onceToken, &__block_literal_global_9);
  return (id)CAFAppIdentifier_appIdentifier;
}

id CAFAppInfo()
{
  if (CAFAppInfo_onceToken != -1)
    dispatch_once(&CAFAppInfo_onceToken, &__block_literal_global_3);
  return (id)CAFAppInfo_appInfo;
}

void CAFSignpostEmit_Launched()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CARSignpostLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    CAFAppInfo();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v1;
    _os_signpost_emit_with_name_impl(&dword_237717000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Launched", "%{public}@", (uint8_t *)&v4, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CAFAppLaunchedDate;
  CAFAppLaunchedDate = v2;

}

void CAFSignpostEmit_Scene(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  CARSignpostLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    CAFAppInfo();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v1;
    v8 = 2114;
    v9 = v3;
    _os_signpost_emit_with_name_impl(&dword_237717000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Scene", "%{public}@ %{public}@", (uint8_t *)&v6, 0x16u);

  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Center")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleCarPlay")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)CAFAppSceneDate;
    CAFAppSceneDate = v4;

  }
}

void CAFSignpostEmit_InstantOn()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  CARSignpostLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    CAFAppInfo();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138543362;
    v3 = v1;
    _os_signpost_emit_with_name_impl(&dword_237717000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InstantOn", "%{public}@", (uint8_t *)&v2, 0xCu);

  }
}

void CAFSignpostEmit_Rendered()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  CARSignpostLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    CAFAppInfo();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138543362;
    v3 = v1;
    _os_signpost_emit_with_name_impl(&dword_237717000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Rendered", "%{public}@", (uint8_t *)&v2, 0xCu);

  }
}

void CAFSignpostEmit_Finalized(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  CARSignpostLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    CAFAppInfo();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 138543362;
    *(_QWORD *)((char *)&v29 + 4) = v3;
    _os_signpost_emit_with_name_impl(&dword_237717000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Finalized", "%{public}@", (uint8_t *)&v29, 0xCu);

  }
  if (v1)
  {
    objc_msgSend(v1, "car");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

    objc_msgSend(v5, "ppid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("ppid"));

    objc_msgSend(v5, "firmwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("vehicleFirmwareVersion"));

    objc_msgSend(v5, "hardwareVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("vehicleHardwareVersion"));

    objc_msgSend(v5, "manufacturer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("vehicleManufacturer"));

    objc_msgSend(v5, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("vehicleModel"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "supportsBluetoothLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("supportsBluetoothLE"));

    if (!CAFAppLaunchedDate)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v29 = CFSTR("com.apple.CarClimate");
    *((_QWORD *)&v29 + 1) = CFSTR("com.apple.CarRadio");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v15);

    if (!v17)
    {
      v19 = 1;
      v18 = &CAFAppLaunchedDate;
    }
    else
    {
LABEL_6:
      v18 = &CAFAppSceneDate;
      if (!CAFAppSceneDate)
      {
LABEL_11:
        AnalyticsSendEvent();

        goto LABEL_12;
      }
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", *v18);
    v22 = v21;

    v23 = (void *)*v18;
    *v18 = 0;

    if (v22 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("launchTime"));

      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("bundleIdentifier"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("isColdLaunch"));

    }
    goto LABEL_11;
  }
LABEL_12:

}

void sub_237773314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_237773680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_237773704(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2377749E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id NSStringFromSettingProminenceLevel(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 1);
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("appHomeTile=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  +[CAFBitMaskUtilities description:optionCount:](CAFBitMaskUtilities, "description:optionCount:", a1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@) %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

const __CFString *NSStringFromUIInputDevicePurpose(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Back");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Select");
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id NSStringFromDefrostTypes(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 1))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("blownAir=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 2))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("filament=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  +[CAFBitMaskUtilities description:optionCount:](CAFBitMaskUtilities, "description:optionCount:", a1, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@) %@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_237783C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237783E00(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromUnitType(int a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  const __CFString *v11;

  result = 0;
  if (a1 > 600)
  {
    if (a1 > 880)
    {
      if (a1 > 1030)
      {
        if (a1 <= 1130)
        {
          if (a1 > 1080)
          {
            v3 = CFSTR("fahrenheit");
            v4 = CFSTR("celsius");
            v9 = CFSTR("kelvin");
            if (a1 != 1083)
              v9 = 0;
            if (a1 != 1082)
              v4 = v9;
            v6 = a1 == 1081;
            goto LABEL_73;
          }
          switch(a1)
          {
            case 1031:
              result = CFSTR("metersPerSecond");
              break;
            case 1032:
              result = CFSTR("kilometersPerHour");
              break;
            case 1033:
              result = CFSTR("milesPerHour");
              break;
            case 1034:
              result = CFSTR("metersPerHour");
              break;
            default:
              return result;
          }
        }
        else
        {
          if (a1 > 1204)
          {
            v3 = CFSTR("percent");
            v4 = CFSTR("newtonMeter");
            v8 = CFSTR("footPound");
            if (a1 != 1252)
              v8 = 0;
            if (a1 != 1251)
              v4 = v8;
            v6 = a1 == 1205;
            goto LABEL_73;
          }
          switch(a1)
          {
            case 1131:
              result = CFSTR("liters");
              break;
            case 1132:
              result = CFSTR("cubicMeters");
              break;
            case 1133:
              result = CFSTR("cubicFeet");
              break;
            case 1134:
              result = CFSTR("fluidOunces");
              break;
            case 1135:
              result = CFSTR("gallons");
              break;
            case 1136:
              result = CFSTR("milliliters");
              break;
            default:
              return result;
          }
        }
      }
      else if (a1 > 930)
      {
        switch(a1)
        {
          case 931:
            result = CFSTR("newtonsPerMetersSquared");
            break;
          case 932:
            result = CFSTR("kilopascals");
            break;
          case 933:
            result = CFSTR("poundsForcePerSquareInch");
            break;
          case 934:
            result = CFSTR("bars");
            break;
          default:
            v3 = CFSTR("revolutionsPerMinute");
            v4 = CFSTR("degreesPerSecond");
            if (a1 != 982)
              v4 = 0;
            v6 = a1 == 981;
            goto LABEL_73;
        }
      }
      else
      {
        switch(a1)
        {
          case 881:
            result = CFSTR("terawatts");
            break;
          case 882:
            result = CFSTR("gigawatts");
            break;
          case 883:
            result = CFSTR("megawatts");
            break;
          case 884:
            result = CFSTR("kilowatts");
            break;
          case 885:
            result = CFSTR("watts");
            break;
          case 886:
            result = CFSTR("milliwatts");
            break;
          case 887:
            result = CFSTR("microwatts");
            break;
          case 888:
            result = CFSTR("nanowatts");
            break;
          case 889:
            result = CFSTR("picowatts");
            break;
          case 890:
            result = CFSTR("femtowatts");
            break;
          case 891:
            result = CFSTR("horsepower");
            break;
          default:
            return result;
        }
      }
    }
    else if (a1 > 720)
    {
      switch(a1)
      {
        case 741:
          result = CFSTR("kilobits");
          break;
        case 742:
          result = CFSTR("megabits");
          break;
        case 743:
          result = CFSTR("gigabits");
          break;
        case 744:
          result = CFSTR("terabits");
          break;
        case 745:
          result = CFSTR("kilobytes");
          break;
        case 746:
          result = CFSTR("megabytes");
          break;
        case 747:
          result = CFSTR("gigabytes");
          break;
        case 748:
          result = CFSTR("terabytes");
          break;
        default:
          switch(a1)
          {
            case 781:
              result = CFSTR("kilograms");
              break;
            case 782:
              result = CFSTR("grams");
              break;
            case 783:
              result = CFSTR("milligrams");
              break;
            case 784:
              result = CFSTR("ounces");
              break;
            case 785:
              result = CFSTR("poundsMass");
              break;
            case 786:
              result = CFSTR("metricTons");
              break;
            case 787:
              result = CFSTR("slugs");
              break;
            default:
              v10 = a1 == 721;
              v11 = CFSTR("lux");
LABEL_174:
              if (v10)
                result = v11;
              else
                result = 0;
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 601:
          result = CFSTR("wattHoursPerKilometer");
          break;
        case 602:
          result = CFSTR("milliwattHoursPerKilometer");
          break;
        case 603:
          result = CFSTR("wattHoursPerMile");
          break;
        case 604:
          result = CFSTR("kilowattHoursPer100Kilometers");
          break;
        case 605:
          result = CFSTR("kilowattHoursPer100Miles");
          break;
        case 606:
          result = CFSTR("milesPerKilowattHour");
          break;
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
          return result;
        case 621:
          result = CFSTR("terahertz");
          break;
        case 622:
          result = CFSTR("gigahertz");
          break;
        case 623:
          result = CFSTR("megahertz");
          break;
        case 624:
          result = CFSTR("kilohertz");
          break;
        case 625:
          result = CFSTR("hertz");
          break;
        case 626:
          result = CFSTR("millihertz");
          break;
        case 627:
          result = CFSTR("microhertz");
          break;
        case 628:
          result = CFSTR("nanohertz");
          break;
        default:
          switch(a1)
          {
            case 671:
              result = CFSTR("litersPer100Kilometers");
              break;
            case 672:
              result = CFSTR("milesPerGallon");
              break;
            case 673:
              result = CFSTR("milesPerImperialGallon");
              break;
            case 674:
              result = CFSTR("millilitersPer100Kilometers");
              break;
            default:
              return result;
          }
          break;
      }
    }
  }
  else if (a1 > 225)
  {
    if (a1 <= 400)
    {
      if (a1 <= 252)
      {
        v3 = CFSTR("partsPerMillion");
        v4 = CFSTR("seconds");
        v5 = CFSTR("minutes");
        if (a1 != 252)
          v5 = 0;
        if (a1 != 251)
          v4 = v5;
        v6 = a1 == 226;
        goto LABEL_73;
      }
      switch(a1)
      {
        case 301:
          result = CFSTR("coulombs");
          break;
        case 302:
          result = CFSTR("megaampereHours");
          break;
        case 303:
          result = CFSTR("kiloampereHours");
          break;
        case 304:
          result = CFSTR("ampereHours");
          break;
        case 305:
          result = CFSTR("milliampereHours");
          break;
        case 306:
          result = CFSTR("microampereHours");
          break;
        default:
          switch(a1)
          {
            case 351:
              result = CFSTR("megaamperes");
              break;
            case 352:
              result = CFSTR("kiloamperes");
              break;
            case 353:
              result = CFSTR("amperes");
              break;
            case 354:
              result = CFSTR("milliamperes");
              break;
            case 355:
              result = CFSTR("microamperes");
              break;
            default:
              v10 = a1 == 253;
              v11 = CFSTR("hours");
              goto LABEL_174;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 551:
          result = CFSTR("kilojoules");
          break;
        case 552:
          result = CFSTR("joules");
          break;
        case 553:
          result = CFSTR("kilocalories");
          break;
        case 554:
          result = CFSTR("calories");
          break;
        case 555:
          result = CFSTR("kilowattHours");
          break;
        case 556:
          result = CFSTR("wattHours");
          break;
        case 557:
          result = CFSTR("milliwattHours");
          break;
        default:
          switch(a1)
          {
            case 401:
              result = CFSTR("megavolts");
              break;
            case 402:
              result = CFSTR("kilovolts");
              break;
            case 403:
              result = CFSTR("volts");
              break;
            case 404:
              result = CFSTR("millivolts");
              break;
            case 405:
              result = CFSTR("microvolts");
              break;
            default:
              switch(a1)
              {
                case 451:
                  result = CFSTR("megaohms");
                  break;
                case 452:
                  result = CFSTR("kiloohms");
                  break;
                case 453:
                  result = CFSTR("ohms");
                  break;
                case 454:
                  result = CFSTR("milliohms");
                  break;
                case 455:
                  result = CFSTR("microohms");
                  break;
                default:
                  return result;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 120)
    {
      if (a1 > 25)
      {
        switch(a1)
        {
          case '.':
            result = CFSTR("degrees");
            break;
          case '/':
            result = CFSTR("arcMinutes");
            break;
          case '0':
            result = CFSTR("arcSeconds");
            break;
          case '1':
            result = CFSTR("radians");
            break;
          case '2':
            result = CFSTR("gradians");
            break;
          case '3':
            result = CFSTR("revolutions");
            break;
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
          case ':':
          case ';':
          case '<':
          case '=':
          case '>':
          case '?':
          case '@':
          case 'A':
          case 'B':
          case 'C':
          case 'D':
          case 'E':
          case 'F':
            return result;
          case 'G':
            result = CFSTR("squareKilometers");
            break;
          case 'H':
            result = CFSTR("squareMeters");
            break;
          case 'I':
            result = CFSTR("squareCentimeters");
            break;
          case 'J':
            result = CFSTR("squareMillimeters");
            break;
          case 'K':
            result = CFSTR("squareMicrometers");
            break;
          case 'L':
            result = CFSTR("squareNanometers");
            break;
          case 'M':
            result = CFSTR("squareInches");
            break;
          case 'N':
            result = CFSTR("squareFeet");
            break;
          case 'O':
            result = CFSTR("squareYards");
            break;
          case 'P':
            result = CFSTR("squareMiles");
            break;
          case 'Q':
            result = CFSTR("acres");
            break;
          case 'R':
            result = CFSTR("ares");
            break;
          case 'S':
            result = CFSTR("hectares");
            break;
          default:
            v10 = a1 == 26;
            v11 = CFSTR("aqi");
            goto LABEL_174;
        }
        return result;
      }
      v3 = CFSTR("undefined");
      v4 = CFSTR("metersPerSecondSquared");
      v7 = CFSTR("gravity");
      if (a1 != 2)
        v7 = 0;
      if (a1 != 1)
        v4 = v7;
      v6 = a1 == 0;
LABEL_73:
      if (v6)
        return v3;
      else
        return v4;
    }
    switch(a1)
    {
      case 151:
        result = CFSTR("kilometers");
        break;
      case 152:
        result = CFSTR("hectometers");
        break;
      case 153:
        result = CFSTR("decameters");
        break;
      case 154:
        result = CFSTR("meters");
        break;
      case 155:
        result = CFSTR("decimeters");
        break;
      case 156:
        result = CFSTR("centimeters");
        break;
      case 157:
        result = CFSTR("millimeters");
        break;
      case 158:
        result = CFSTR("micrometers");
        break;
      case 159:
        result = CFSTR("nanometers");
        break;
      case 160:
        result = CFSTR("picometers");
        break;
      case 161:
        result = CFSTR("inches");
        break;
      case 162:
        result = CFSTR("feet");
        break;
      case 163:
        result = CFSTR("yards");
        break;
      case 164:
        result = CFSTR("miles");
        break;
      default:
        v3 = CFSTR("gramsPerLiter");
        v4 = CFSTR("milligramsPerDeciliter");
        if (a1 != 122)
          v4 = 0;
        v6 = a1 == 121;
        goto LABEL_73;
    }
  }
  return result;
}

id NSUnitFromCAFUnitType(int a1)
{
  void *v2;

  v2 = 0;
  if (a1 > 600)
  {
    if (a1 > 880)
    {
      if (a1 > 1030)
      {
        if (a1 <= 1130)
        {
          if (a1 > 1080)
          {
            switch(a1)
            {
              case 1081:
                objc_msgSend(MEMORY[0x24BDD1950], "fahrenheit");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1082:
                objc_msgSend(MEMORY[0x24BDD1950], "celsius");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1083:
                objc_msgSend(MEMORY[0x24BDD1950], "kelvin");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
          else
          {
            switch(a1)
            {
              case 1031:
                objc_msgSend(MEMORY[0x24BDD1948], "metersPerSecond");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1032:
                objc_msgSend(MEMORY[0x24BDD1948], "kilometersPerHour");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1033:
                objc_msgSend(MEMORY[0x24BDD1948], "milesPerHour");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1034:
                objc_msgSend(MEMORY[0x24BDD1948], "metersPerHour");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              default:
                return v2;
            }
          }
        }
        else if (a1 > 1204)
        {
          switch(a1)
          {
            case 1205:
              +[CAFUnitPercent percent](CAFUnitPercent, "percent");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1251:
              +[CAFUnitTorque newtonMeter](CAFUnitTorque, "newtonMeter");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1252:
              +[CAFUnitTorque footPound](CAFUnitTorque, "footPound");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 1131:
              objc_msgSend(MEMORY[0x24BDD1958], "liters");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1132:
              objc_msgSend(MEMORY[0x24BDD1958], "cubicMeters");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1133:
              objc_msgSend(MEMORY[0x24BDD1958], "cubicFeet");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1134:
              objc_msgSend(MEMORY[0x24BDD1958], "fluidOunces");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1135:
              objc_msgSend(MEMORY[0x24BDD1958], "gallons");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1136:
              objc_msgSend(MEMORY[0x24BDD1958], "milliliters");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            default:
              return v2;
          }
        }
      }
      else if (a1 > 930)
      {
        switch(a1)
        {
          case 931:
            objc_msgSend(MEMORY[0x24BDD1940], "newtonsPerMetersSquared");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 932:
            objc_msgSend(MEMORY[0x24BDD1940], "kilopascals");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 933:
            objc_msgSend(MEMORY[0x24BDD1940], "poundsForcePerSquareInch");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 934:
            objc_msgSend(MEMORY[0x24BDD1940], "bars");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            if (a1 == 981)
            {
              +[CAFUnitRotationalSpeed revolutionsPerMinute](CAFUnitRotationalSpeed, "revolutionsPerMinute");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else if (a1 == 982)
            {
              +[CAFUnitRotationalSpeed degreesPerSecond](CAFUnitRotationalSpeed, "degreesPerSecond");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 881:
            objc_msgSend(MEMORY[0x24BDD1938], "terawatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 882:
            objc_msgSend(MEMORY[0x24BDD1938], "gigawatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 883:
            objc_msgSend(MEMORY[0x24BDD1938], "megawatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 884:
            objc_msgSend(MEMORY[0x24BDD1938], "kilowatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 885:
            objc_msgSend(MEMORY[0x24BDD1938], "watts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 886:
            objc_msgSend(MEMORY[0x24BDD1938], "milliwatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 887:
            objc_msgSend(MEMORY[0x24BDD1938], "microwatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 888:
            objc_msgSend(MEMORY[0x24BDD1938], "nanowatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 889:
            objc_msgSend(MEMORY[0x24BDD1938], "picowatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 890:
            objc_msgSend(MEMORY[0x24BDD1938], "femtowatts");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 891:
            objc_msgSend(MEMORY[0x24BDD1938], "horsepower");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            return v2;
        }
      }
    }
    else if (a1 > 720)
    {
      switch(a1)
      {
        case 741:
          objc_msgSend(MEMORY[0x24BDD1920], "kilobits");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 742:
          objc_msgSend(MEMORY[0x24BDD1920], "megabits");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 743:
          objc_msgSend(MEMORY[0x24BDD1920], "gigabits");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 744:
          objc_msgSend(MEMORY[0x24BDD1920], "terabits");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 745:
          objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 746:
          objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 747:
          objc_msgSend(MEMORY[0x24BDD1920], "gigabytes");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 748:
          objc_msgSend(MEMORY[0x24BDD1920], "terabytes");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          switch(a1)
          {
            case 781:
              objc_msgSend(MEMORY[0x24BDD1930], "kilograms");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 782:
              objc_msgSend(MEMORY[0x24BDD1930], "grams");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 783:
              objc_msgSend(MEMORY[0x24BDD1930], "milligrams");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 784:
              objc_msgSend(MEMORY[0x24BDD1930], "ounces");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 785:
              objc_msgSend(MEMORY[0x24BDD1930], "poundsMass");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 786:
              objc_msgSend(MEMORY[0x24BDD1930], "metricTons");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 787:
              objc_msgSend(MEMORY[0x24BDD1930], "slugs");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            default:
              if (a1 == 721)
              {
                objc_msgSend(MEMORY[0x24BDD1918], "lux");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 601:
          +[CAFUnitEnergyEfficiency wattHoursPerKilometer](CAFUnitEnergyEfficiency, "wattHoursPerKilometer");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 602:
          +[CAFUnitEnergyEfficiency milliwattHoursPerKilometer](CAFUnitEnergyEfficiency, "milliwattHoursPerKilometer");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 603:
          +[CAFUnitEnergyEfficiency wattHoursPerMile](CAFUnitEnergyEfficiency, "wattHoursPerMile");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 604:
          +[CAFUnitEnergyEfficiency kilowattHoursPer100Kilometers](CAFUnitEnergyEfficiency, "kilowattHoursPer100Kilometers");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 605:
          +[CAFUnitEnergyEfficiency kilowattHoursPer100Miles](CAFUnitEnergyEfficiency, "kilowattHoursPer100Miles");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 606:
          +[CAFUnitEnergyEfficiency milesPerKilowattHour](CAFUnitEnergyEfficiency, "milesPerKilowattHour");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
          return v2;
        case 621:
          objc_msgSend(MEMORY[0x24BDD1908], "terahertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 622:
          objc_msgSend(MEMORY[0x24BDD1908], "gigahertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 623:
          objc_msgSend(MEMORY[0x24BDD1908], "megahertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 624:
          objc_msgSend(MEMORY[0x24BDD1908], "kilohertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 625:
          objc_msgSend(MEMORY[0x24BDD1908], "hertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 626:
          objc_msgSend(MEMORY[0x24BDD1908], "millihertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 627:
          objc_msgSend(MEMORY[0x24BDD1908], "microhertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 628:
          objc_msgSend(MEMORY[0x24BDD1908], "nanohertz");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          switch(a1)
          {
            case 671:
              objc_msgSend(MEMORY[0x24BDD1910], "litersPer100Kilometers");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 672:
              objc_msgSend(MEMORY[0x24BDD1910], "milesPerGallon");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 673:
              objc_msgSend(MEMORY[0x24BDD1910], "milesPerImperialGallon");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 674:
              objc_msgSend(MEMORY[0x24BDD1910], "millilitersPer100Kilometers");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            default:
              return v2;
          }
          break;
      }
    }
  }
  else if (a1 > 225)
  {
    if (a1 <= 400)
    {
      if (a1 > 252)
      {
        switch(a1)
        {
          case 301:
            objc_msgSend(MEMORY[0x24BDD18E0], "coulombs");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 302:
            objc_msgSend(MEMORY[0x24BDD18E0], "megaampereHours");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 303:
            objc_msgSend(MEMORY[0x24BDD18E0], "kiloampereHours");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 304:
            objc_msgSend(MEMORY[0x24BDD18E0], "ampereHours");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 305:
            objc_msgSend(MEMORY[0x24BDD18E0], "milliampereHours");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 306:
            objc_msgSend(MEMORY[0x24BDD18E0], "microampereHours");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            switch(a1)
            {
              case 351:
                objc_msgSend(MEMORY[0x24BDD18E8], "megaamperes");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 352:
                objc_msgSend(MEMORY[0x24BDD18E8], "kiloamperes");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 353:
                objc_msgSend(MEMORY[0x24BDD18E8], "amperes");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 354:
                objc_msgSend(MEMORY[0x24BDD18E8], "milliamperes");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 355:
                objc_msgSend(MEMORY[0x24BDD18E8], "microamperes");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              default:
                if (a1 == 253)
                {
                  objc_msgSend(MEMORY[0x24BDD18D8], "hours");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                }
                break;
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 226:
            objc_msgSend(MEMORY[0x24BDD18D0], "partsPerMillion");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 251:
            objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 252:
            objc_msgSend(MEMORY[0x24BDD18D8], "minutes");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 551:
          objc_msgSend(MEMORY[0x24BDD1900], "kilojoules");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 552:
          objc_msgSend(MEMORY[0x24BDD1900], "joules");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 553:
          objc_msgSend(MEMORY[0x24BDD1900], "kilocalories");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 554:
          objc_msgSend(MEMORY[0x24BDD1900], "calories");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 555:
          objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 556:
          objc_msgSend(MEMORY[0x24BDD1900], "wattHours");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 557:
          objc_msgSend(MEMORY[0x24BDD1900], "milliwattHours");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          switch(a1)
          {
            case 401:
              objc_msgSend(MEMORY[0x24BDD18F0], "megavolts");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 402:
              objc_msgSend(MEMORY[0x24BDD18F0], "kilovolts");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 403:
              objc_msgSend(MEMORY[0x24BDD18F0], "volts");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 404:
              objc_msgSend(MEMORY[0x24BDD18F0], "millivolts");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 405:
              objc_msgSend(MEMORY[0x24BDD18F0], "microvolts");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            default:
              switch(a1)
              {
                case 451:
                  objc_msgSend(MEMORY[0x24BDD18F8], "megaohms");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  break;
                case 452:
                  objc_msgSend(MEMORY[0x24BDD18F8], "kiloohms");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  break;
                case 453:
                  objc_msgSend(MEMORY[0x24BDD18F8], "ohms");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  break;
                case 454:
                  objc_msgSend(MEMORY[0x24BDD18F8], "milliohms");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  break;
                case 455:
                  objc_msgSend(MEMORY[0x24BDD18F8], "microohms");
                  v2 = (void *)objc_claimAutoreleasedReturnValue();
                  break;
                default:
                  return v2;
              }
              break;
          }
          break;
      }
    }
  }
  else if (a1 > 120)
  {
    switch(a1)
    {
      case 151:
        objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 152:
        objc_msgSend(MEMORY[0x24BDD1928], "hectometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 153:
        objc_msgSend(MEMORY[0x24BDD1928], "decameters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 154:
        objc_msgSend(MEMORY[0x24BDD1928], "meters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 155:
        objc_msgSend(MEMORY[0x24BDD1928], "decimeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 156:
        objc_msgSend(MEMORY[0x24BDD1928], "centimeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 157:
        objc_msgSend(MEMORY[0x24BDD1928], "millimeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 158:
        objc_msgSend(MEMORY[0x24BDD1928], "micrometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 159:
        objc_msgSend(MEMORY[0x24BDD1928], "nanometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 160:
        objc_msgSend(MEMORY[0x24BDD1928], "picometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 161:
        objc_msgSend(MEMORY[0x24BDD1928], "inches");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 162:
        objc_msgSend(MEMORY[0x24BDD1928], "feet");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 163:
        objc_msgSend(MEMORY[0x24BDD1928], "yards");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 164:
        objc_msgSend(MEMORY[0x24BDD1928], "miles");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        if (a1 == 121)
        {
          objc_msgSend(MEMORY[0x24BDD18C0], "gramsPerLiter");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (a1 == 122)
        {
          objc_msgSend(MEMORY[0x24BDD18C0], "milligramsPerDeciliter");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
  }
  else if (a1 <= 45)
  {
    switch(a1)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD18A8], "metersPerSecondSquared");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDD18A8], "gravity");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 26:
        +[CAFUnitAirQuality aqi](CAFUnitAirQuality, "aqi");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case '.':
        objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case '/':
        objc_msgSend(MEMORY[0x24BDD18B0], "arcMinutes");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case '0':
        objc_msgSend(MEMORY[0x24BDD18B0], "arcSeconds");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case '1':
        objc_msgSend(MEMORY[0x24BDD18B0], "radians");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case '2':
        objc_msgSend(MEMORY[0x24BDD18B0], "gradians");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case '3':
        objc_msgSend(MEMORY[0x24BDD18B0], "revolutions");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'G':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareKilometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'H':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareMeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'I':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareCentimeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'J':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareMillimeters");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'K':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareMicrometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'L':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareNanometers");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'M':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareInches");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'N':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareFeet");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'O':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareYards");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'P':
        objc_msgSend(MEMORY[0x24BDD18B8], "squareMiles");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'Q':
        objc_msgSend(MEMORY[0x24BDD18B8], "acres");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'R':
        objc_msgSend(MEMORY[0x24BDD18B8], "ares");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 'S':
        objc_msgSend(MEMORY[0x24BDD18B8], "hectares");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        return v2;
    }
  }
  return v2;
}

uint64_t CAFUnitTypeFromNSUnit(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  void *v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  char v80;
  void *v81;
  char v82;
  void *v83;
  char v84;
  void *v85;
  char v86;
  void *v87;
  char v88;
  void *v89;
  char v90;
  void *v91;
  char v92;
  void *v93;
  char v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  void *v101;
  char v102;
  void *v103;
  char v104;
  void *v105;
  char v106;
  void *v107;
  char v108;
  void *v109;
  char v110;
  void *v111;
  char v112;
  void *v113;
  char v114;
  void *v115;
  char v116;
  void *v117;
  char v118;
  void *v119;
  char v120;
  void *v121;
  char v122;
  void *v123;
  char v124;
  void *v125;
  char v126;
  void *v127;
  char v128;
  void *v129;
  char v130;
  void *v131;
  char v132;
  void *v133;
  char v134;
  void *v135;
  char v136;
  void *v137;
  char v138;
  void *v139;
  char v140;
  void *v141;
  char v142;
  void *v143;
  char v144;
  void *v145;
  char v146;
  void *v147;
  char v148;
  void *v149;
  char v150;
  void *v151;
  char v152;
  void *v153;
  char v154;
  void *v155;
  char v156;
  void *v157;
  char v158;
  void *v159;
  char v160;
  void *v161;
  char v162;
  void *v163;
  char v164;
  void *v165;
  char v166;
  void *v167;
  char v168;
  void *v169;
  char v170;
  void *v171;
  char v172;
  void *v173;
  char v174;
  void *v175;
  char v176;
  void *v177;
  char v178;
  void *v179;
  char v180;
  void *v181;
  char v182;
  void *v183;
  char v184;
  void *v185;
  char v186;
  void *v187;
  char v188;
  void *v189;
  char v190;
  void *v191;
  char v192;
  void *v193;
  char v194;
  void *v195;
  char v196;
  void *v197;
  char v198;
  void *v199;
  char v200;
  void *v201;
  char v202;
  void *v203;
  char v204;
  void *v205;
  char v206;
  void *v207;
  char v208;
  void *v209;
  char v210;
  void *v211;
  char v212;
  void *v213;
  char v214;
  void *v215;
  char v216;
  void *v217;
  char v218;
  void *v219;
  char v220;
  void *v221;
  char v222;
  void *v223;
  char v224;
  void *v225;
  char v226;
  void *v227;
  char v228;
  void *v229;
  char v230;
  void *v231;
  char v232;
  void *v233;
  char v234;
  void *v235;
  char v236;
  void *v237;
  char v238;
  void *v239;
  char v240;
  void *v241;
  char v242;
  void *v243;
  char v244;
  void *v245;
  char v246;
  void *v247;
  char v248;
  void *v249;
  char v250;
  void *v251;
  char v252;
  void *v253;
  char v254;
  void *v255;
  char v256;
  void *v257;
  char v258;
  void *v259;
  char v260;
  void *v261;
  char v262;
  void *v263;
  char v264;
  void *v265;
  char v266;
  void *v267;
  char v268;
  void *v269;
  char v270;
  void *v271;
  char v272;
  void *v273;
  char v274;
  void *v275;
  int v276;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD18A8], "metersPerSecondSquared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD18A8], "gravity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 2;
    }
    else
    {
      +[CAFUnitAirQuality aqi](CAFUnitAirQuality, "aqi");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 26;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = 46;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD18B0], "arcMinutes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v1, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = 47;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD18B0], "arcSeconds");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v1, "isEqual:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = 48;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD18B0], "radians");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v1, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                v4 = 49;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD18B0], "gradians");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v1, "isEqual:", v17);

                if ((v18 & 1) != 0)
                {
                  v4 = 50;
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDD18B0], "revolutions");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v1, "isEqual:", v19);

                  if ((v20 & 1) != 0)
                  {
                    v4 = 51;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDD18B8], "squareKilometers");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v1, "isEqual:", v21);

                    if ((v22 & 1) != 0)
                    {
                      v4 = 71;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BDD18B8], "squareMeters");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(v1, "isEqual:", v23);

                      if ((v24 & 1) != 0)
                      {
                        v4 = 72;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x24BDD18B8], "squareCentimeters");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(v1, "isEqual:", v25);

                        if ((v26 & 1) != 0)
                        {
                          v4 = 73;
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x24BDD18B8], "squareMillimeters");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          v28 = objc_msgSend(v1, "isEqual:", v27);

                          if ((v28 & 1) != 0)
                          {
                            v4 = 74;
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x24BDD18B8], "squareMicrometers");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = objc_msgSend(v1, "isEqual:", v29);

                            if ((v30 & 1) != 0)
                            {
                              v4 = 75;
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x24BDD18B8], "squareNanometers");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = objc_msgSend(v1, "isEqual:", v31);

                              if ((v32 & 1) != 0)
                              {
                                v4 = 76;
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x24BDD18B8], "squareInches");
                                v33 = (void *)objc_claimAutoreleasedReturnValue();
                                v34 = objc_msgSend(v1, "isEqual:", v33);

                                if ((v34 & 1) != 0)
                                {
                                  v4 = 77;
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x24BDD18B8], "squareFeet");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  v36 = objc_msgSend(v1, "isEqual:", v35);

                                  if ((v36 & 1) != 0)
                                  {
                                    v4 = 78;
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x24BDD18B8], "squareYards");
                                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                                    v38 = objc_msgSend(v1, "isEqual:", v37);

                                    if ((v38 & 1) != 0)
                                    {
                                      v4 = 79;
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x24BDD18B8], "squareMiles");
                                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                                      v40 = objc_msgSend(v1, "isEqual:", v39);

                                      if ((v40 & 1) != 0)
                                      {
                                        v4 = 80;
                                      }
                                      else
                                      {
                                        objc_msgSend(MEMORY[0x24BDD18B8], "acres");
                                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                                        v42 = objc_msgSend(v1, "isEqual:", v41);

                                        if ((v42 & 1) != 0)
                                        {
                                          v4 = 81;
                                        }
                                        else
                                        {
                                          objc_msgSend(MEMORY[0x24BDD18B8], "ares");
                                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                                          v44 = objc_msgSend(v1, "isEqual:", v43);

                                          if ((v44 & 1) != 0)
                                          {
                                            v4 = 82;
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x24BDD18B8], "hectares");
                                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                                            v46 = objc_msgSend(v1, "isEqual:", v45);

                                            if ((v46 & 1) != 0)
                                            {
                                              v4 = 83;
                                            }
                                            else
                                            {
                                              objc_msgSend(MEMORY[0x24BDD18C0], "gramsPerLiter");
                                              v47 = (void *)objc_claimAutoreleasedReturnValue();
                                              v48 = objc_msgSend(v1, "isEqual:", v47);

                                              if ((v48 & 1) != 0)
                                              {
                                                v4 = 121;
                                              }
                                              else
                                              {
                                                objc_msgSend(MEMORY[0x24BDD18C0], "milligramsPerDeciliter");
                                                v49 = (void *)objc_claimAutoreleasedReturnValue();
                                                v50 = objc_msgSend(v1, "isEqual:", v49);

                                                if ((v50 & 1) != 0)
                                                {
                                                  v4 = 122;
                                                }
                                                else
                                                {
                                                  objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
                                                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v52 = objc_msgSend(v1, "isEqual:", v51);

                                                  if ((v52 & 1) != 0)
                                                  {
                                                    v4 = 151;
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(MEMORY[0x24BDD1928], "hectometers");
                                                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v54 = objc_msgSend(v1, "isEqual:", v53);

                                                    if ((v54 & 1) != 0)
                                                    {
                                                      v4 = 152;
                                                    }
                                                    else
                                                    {
                                                      objc_msgSend(MEMORY[0x24BDD1928], "decameters");
                                                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v56 = objc_msgSend(v1, "isEqual:", v55);

                                                      if ((v56 & 1) != 0)
                                                      {
                                                        v4 = 153;
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(MEMORY[0x24BDD1928], "meters");
                                                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v58 = objc_msgSend(v1, "isEqual:", v57);

                                                        if ((v58 & 1) != 0)
                                                        {
                                                          v4 = 154;
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(MEMORY[0x24BDD1928], "decimeters");
                                                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v60 = objc_msgSend(v1, "isEqual:", v59);

                                                          if ((v60 & 1) != 0)
                                                          {
                                                            v4 = 155;
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(MEMORY[0x24BDD1928], "centimeters");
                                                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v62 = objc_msgSend(v1, "isEqual:", v61);

                                                            if ((v62 & 1) != 0)
                                                            {
                                                              v4 = 156;
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(MEMORY[0x24BDD1928], "millimeters");
                                                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v64 = objc_msgSend(v1, "isEqual:", v63);

                                                              if ((v64 & 1) != 0)
                                                              {
                                                                v4 = 157;
                                                              }
                                                              else
                                                              {
                                                                objc_msgSend(MEMORY[0x24BDD1928], "micrometers");
                                                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v66 = objc_msgSend(v1, "isEqual:", v65);

                                                                if ((v66 & 1) != 0)
                                                                {
                                                                  v4 = 158;
                                                                }
                                                                else
                                                                {
                                                                  objc_msgSend(MEMORY[0x24BDD1928], "nanometers");
                                                                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v68 = objc_msgSend(v1, "isEqual:", v67);

                                                                  if ((v68 & 1) != 0)
                                                                  {
                                                                    v4 = 159;
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_msgSend(MEMORY[0x24BDD1928], "picometers");
                                                                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v70 = objc_msgSend(v1, "isEqual:", v69);

                                                                    if ((v70 & 1) != 0)
                                                                    {
                                                                      v4 = 160;
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_msgSend(MEMORY[0x24BDD1928], "inches");
                                                                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v72 = objc_msgSend(v1, "isEqual:", v71);

                                                                      if ((v72 & 1) != 0)
                                                                      {
                                                                        v4 = 161;
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_msgSend(MEMORY[0x24BDD1928], "feet");
                                                                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v74 = objc_msgSend(v1, "isEqual:", v73);

                                                                        if ((v74 & 1) != 0)
                                                                        {
                                                                          v4 = 162;
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_msgSend(MEMORY[0x24BDD1928], "yards");
                                                                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v76 = objc_msgSend(v1, "isEqual:", v75);

                                                                          if ((v76 & 1) != 0)
                                                                          {
                                                                            v4 = 163;
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_msgSend(MEMORY[0x24BDD1928], "miles");
                                                                            v77 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v78 = objc_msgSend(v1, "isEqual:", v77);

                                                                            if ((v78 & 1) != 0)
                                                                            {
                                                                              v4 = 164;
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_msgSend(MEMORY[0x24BDD18D0], "partsPerMillion");
                                                                              v79 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v80 = objc_msgSend(v1, "isEqual:", v79);

                                                                              if ((v80 & 1) != 0)
                                                                              {
                                                                                v4 = 226;
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
                                                                                v81 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v82 = objc_msgSend(v1, "isEqual:", v81);

                                                                                if ((v82 & 1) != 0)
                                                                                {
                                                                                  v4 = 251;
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_msgSend(MEMORY[0x24BDD18D8], "minutes");
                                                                                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v84 = objc_msgSend(v1, "isEqual:", v83);

                                                                                  if ((v84 & 1) != 0)
                                                                                  {
                                                                                    v4 = 252;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(MEMORY[0x24BDD18D8], "hours");
                                                                                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v86 = objc_msgSend(v1, "isEqual:", v85);

                                                                                    if ((v86 & 1) != 0)
                                                                                    {
                                                                                      v4 = 253;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_msgSend(MEMORY[0x24BDD18E0], "coulombs");
                                                                                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v88 = objc_msgSend(v1, "isEqual:", v87);

                                                                                      if ((v88 & 1) != 0)
                                                                                      {
                                                                                        v4 = 301;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(MEMORY[0x24BDD18E0], "megaampereHours");
                                                                                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v90 = objc_msgSend(v1, "isEqual:", v89);

                                                                                        if ((v90 & 1) != 0)
                                                                                        {
                                                                                          v4 = 302;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_msgSend(MEMORY[0x24BDD18E0], "kiloampereHours");
                                                                                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v92 = objc_msgSend(v1, "isEqual:", v91);

                                                                                          if ((v92 & 1) != 0)
                                                                                          {
                                                                                            v4 = 303;
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_msgSend(MEMORY[0x24BDD18E0], "ampereHours");
                                                                                            v93 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v94 = objc_msgSend(v1, "isEqual:", v93);

                                                                                            if ((v94 & 1) != 0)
                                                                                            {
                                                                                              v4 = 304;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              objc_msgSend(MEMORY[0x24BDD18E0], "milliampereHours");
                                                                                              v95 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v96 = objc_msgSend(v1, "isEqual:", v95);

                                                                                              if ((v96 & 1) != 0)
                                                                                              {
                                                                                                v4 = 305;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                objc_msgSend(MEMORY[0x24BDD18E0], "microampereHours");
                                                                                                v97 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v98 = objc_msgSend(v1, "isEqual:", v97);

                                                                                                if ((v98 & 1) != 0)
                                                                                                {
                                                                                                  v4 = 306;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  objc_msgSend(MEMORY[0x24BDD18E8], "megaamperes");
                                                                                                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v100 = objc_msgSend(v1, "isEqual:", v99);

                                                                                                  if ((v100 & 1) != 0)
                                                                                                  {
                                                                                                    v4 = 351;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    objc_msgSend(MEMORY[0x24BDD18E8], "kiloamperes");
                                                                                                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v102 = objc_msgSend(v1, "isEqual:", v101);

                                                                                                    if ((v102 & 1) != 0)
                                                                                                    {
                                                                                                      v4 = 352;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      objc_msgSend(MEMORY[0x24BDD18E8], "amperes");
                                                                                                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      v104 = objc_msgSend(v1, "isEqual:", v103);

                                                                                                      if ((v104 & 1) != 0)
                                                                                                      {
                                                                                                        v4 = 353;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_msgSend(MEMORY[0x24BDD18E8], "milliamperes");
                                                                                                        v105 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v106 = objc_msgSend(v1, "isEqual:", v105);

                                                                                                        if ((v106 & 1) != 0)
                                                                                                        {
                                                                                                          v4 = 354;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          objc_msgSend(MEMORY[0x24BDD18E8], "microamperes");
                                                                                                          v107 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v108 = objc_msgSend(v1, "isEqual:", v107);

                                                                                                          if ((v108 & 1) != 0)
                                                                                                          {
                                                                                                            v4 = 355;
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            objc_msgSend(MEMORY[0x24BDD18F0], "megavolts");
                                                                                                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v110 = objc_msgSend(v1, "isEqual:", v109);

                                                                                                            if ((v110 & 1) != 0)
                                                                                                            {
                                                                                                              v4 = 401;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              objc_msgSend(MEMORY[0x24BDD18F0], "kilovolts");
                                                                                                              v111 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v112 = objc_msgSend(v1, "isEqual:", v111);

                                                                                                              if ((v112 & 1) != 0)
                                                                                                              {
                                                                                                                v4 = 402;
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                objc_msgSend(MEMORY[0x24BDD18F0], "volts");
                                                                                                                v113 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                v114 = objc_msgSend(v1, "isEqual:", v113);

                                                                                                                if ((v114 & 1) != 0)
                                                                                                                {
                                                                                                                  v4 = 403;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  objc_msgSend(MEMORY[0x24BDD18F0], "millivolts");
                                                                                                                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                  v116 = objc_msgSend(v1, "isEqual:", v115);

                                                                                                                  if ((v116 & 1) != 0)
                                                                                                                  {
                                                                                                                    v4 = 404;
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    objc_msgSend(MEMORY[0x24BDD18F0], "microvolts");
                                                                                                                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                    v118 = objc_msgSend(v1, "isEqual:", v117);

                                                                                                                    if ((v118 & 1) != 0)
                                                                                                                    {
                                                                                                                      v4 = 405;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      objc_msgSend(MEMORY[0x24BDD18F8], "megaohms");
                                                                                                                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      v120 = objc_msgSend(v1, "isEqual:", v119);

                                                                                                                      if ((v120 & 1) != 0)
                                                                                                                      {
                                                                                                                        v4 = 451;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        objc_msgSend(MEMORY[0x24BDD18F8], "kiloohms");
                                                                                                                        v121 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        v122 = objc_msgSend(v1, "isEqual:", v121);

                                                                                                                        if ((v122 & 1) != 0)
                                                                                                                        {
                                                                                                                          v4 = 452;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          objc_msgSend(MEMORY[0x24BDD18F8], "ohms");
                                                                                                                          v123 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                          v124 = objc_msgSend(v1, "isEqual:", v123);

                                                                                                                          if ((v124 & 1) != 0)
                                                                                                                          {
                                                                                                                            v4 = 453;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            objc_msgSend(MEMORY[0x24BDD18F8], "milliohms");
                                                                                                                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                            v126 = objc_msgSend(v1, "isEqual:", v125);

                                                                                                                            if ((v126 & 1) != 0)
                                                                                                                            {
                                                                                                                              v4 = 454;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              objc_msgSend(MEMORY[0x24BDD18F8], "microohms");
                                                                                                                              v127 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                              v128 = objc_msgSend(v1, "isEqual:", v127);

                                                                                                                              if ((v128 & 1) != 0)
                                                                                                                              {
                                                                                                                                v4 = 455;
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                objc_msgSend(MEMORY[0x24BDD1900], "kilojoules");
                                                                                                                                v129 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                v130 = objc_msgSend(v1, "isEqual:", v129);

                                                                                                                                if ((v130 & 1) != 0)
                                                                                                                                {
                                                                                                                                  v4 = 551;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1900], "joules");
                                                                                                                                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                  v132 = objc_msgSend(v1, "isEqual:", v131);

                                                                                                                                  if ((v132 & 1) != 0)
                                                                                                                                  {
                                                                                                                                    v4 = 552;
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1900], "kilocalories");
                                                                                                                                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                    v134 = objc_msgSend(v1, "isEqual:", v133);

                                                                                                                                    if ((v134 & 1) != 0)
                                                                                                                                    {
                                                                                                                                      v4 = 553;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1900], "calories");
                                                                                                                                      v135 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                      v136 = objc_msgSend(v1, "isEqual:", v135);

                                                                                                                                      if ((v136 & 1) != 0)
                                                                                                                                      {
                                                                                                                                        v4 = 554;
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
                                                                                                                                        v137 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                        v138 = objc_msgSend(v1, "isEqual:", v137);

                                                                                                                                        if ((v138 & 1) != 0)
                                                                                                                                        {
                                                                                                                                          v4 = 555;
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1900], "wattHours");
                                                                                                                                          v139 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                          v140 = objc_msgSend(v1, "isEqual:", v139);

                                                                                                                                          if ((v140 & 1) != 0)
                                                                                                                                          {
                                                                                                                                            v4 = 556;
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1900], "milliwattHours");
                                                                                                                                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                            v142 = objc_msgSend(v1, "isEqual:", v141);

                                                                                                                                            if ((v142 & 1) != 0)
                                                                                                                                            {
                                                                                                                                              v4 = 557;
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              +[CAFUnitEnergyEfficiency wattHoursPerKilometer](CAFUnitEnergyEfficiency, "wattHoursPerKilometer");
                                                                                                                                              v143 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                              v144 = objc_msgSend(v1, "isEqual:", v143);

                                                                                                                                              if ((v144 & 1) != 0)
                                                                                                                                              {
                                                                                                                                                v4 = 601;
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                +[CAFUnitEnergyEfficiency milliwattHoursPerKilometer](CAFUnitEnergyEfficiency, "milliwattHoursPerKilometer");
                                                                                                                                                v145 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                v146 = objc_msgSend(v1, "isEqual:", v145);

                                                                                                                                                if ((v146 & 1) != 0)
                                                                                                                                                {
                                                                                                                                                  v4 = 602;
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  +[CAFUnitEnergyEfficiency wattHoursPerMile](CAFUnitEnergyEfficiency, "wattHoursPerMile");
                                                                                                                                                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                  v148 = objc_msgSend(v1, "isEqual:", v147);

                                                                                                                                                  if ((v148 & 1) != 0)
                                                                                                                                                  {
                                                                                                                                                    v4 = 603;
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    +[CAFUnitEnergyEfficiency kilowattHoursPer100Kilometers](CAFUnitEnergyEfficiency, "kilowattHoursPer100Kilometers");
                                                                                                                                                    v149 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                    v150 = objc_msgSend(v1, "isEqual:", v149);

                                                                                                                                                    if ((v150 & 1) != 0)
                                                                                                                                                    {
                                                                                                                                                      v4 = 604;
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      +[CAFUnitEnergyEfficiency kilowattHoursPer100Miles](CAFUnitEnergyEfficiency, "kilowattHoursPer100Miles");
                                                                                                                                                      v151 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                      v152 = objc_msgSend(v1, "isEqual:", v151);

                                                                                                                                                      if ((v152 & 1) != 0)
                                                                                                                                                      {
                                                                                                                                                        v4 = 605;
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        +[CAFUnitEnergyEfficiency milesPerKilowattHour](CAFUnitEnergyEfficiency, "milesPerKilowattHour");
                                                                                                                                                        v153 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                        v154 = objc_msgSend(v1, "isEqual:", v153);

                                                                                                                                                        if ((v154 & 1) != 0)
                                                                                                                                                        {
                                                                                                                                                          v4 = 606;
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1908], "terahertz");
                                                                                                                                                          v155 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                          v156 = objc_msgSend(v1, "isEqual:", v155);

                                                                                                                                                          if ((v156 & 1) != 0)
                                                                                                                                                          {
                                                                                                                                                            v4 = 621;
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1908], "gigahertz");
                                                                                                                                                            v157 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                            v158 = objc_msgSend(v1, "isEqual:", v157);

                                                                                                                                                            if ((v158 & 1) != 0)
                                                                                                                                                            {
                                                                                                                                                              v4 = 622;
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1908], "megahertz");
                                                                                                                                                              v159 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                              v160 = objc_msgSend(v1, "isEqual:", v159);

                                                                                                                                                              if ((v160 & 1) != 0)
                                                                                                                                                              {
                                                                                                                                                                v4 = 623;
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1908], "kilohertz");
                                                                                                                                                                v161 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                v162 = objc_msgSend(v1, "isEqual:", v161);

                                                                                                                                                                if ((v162 & 1) != 0)
                                                                                                                                                                {
                                                                                                                                                                  v4 = 624;
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1908], "hertz");
                                                                                                                                                                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                  v164 = objc_msgSend(v1, "isEqual:", v163);

                                                                                                                                                                  if ((v164 & 1) != 0)
                                                                                                                                                                  {
                                                                                                                                                                    v4 = 625;
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1908], "millihertz");
                                                                                                                                                                    v165 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                    v166 = objc_msgSend(v1, "isEqual:", v165);

                                                                                                                                                                    if ((v166 & 1) != 0)
                                                                                                                                                                    {
                                                                                                                                                                      v4 = 626;
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1908], "microhertz");
                                                                                                                                                                      v167 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                      v168 = objc_msgSend(v1, "isEqual:", v167);

                                                                                                                                                                      if ((v168 & 1) != 0)
                                                                                                                                                                      {
                                                                                                                                                                        v4 = 627;
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1908], "nanohertz");
                                                                                                                                                                        v169 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                        v170 = objc_msgSend(v1, "isEqual:", v169);

                                                                                                                                                                        if ((v170 & 1) != 0)
                                                                                                                                                                        {
                                                                                                                                                                          v4 = 628;
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1910], "litersPer100Kilometers");
                                                                                                                                                                          v171 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                          v172 = objc_msgSend(v1, "isEqual:", v171);

                                                                                                                                                                          if ((v172 & 1) != 0)
                                                                                                                                                                          {
                                                                                                                                                                            v4 = 671;
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1910], "milesPerGallon");
                                                                                                                                                                            v173 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                            v174 = objc_msgSend(v1, "isEqual:", v173);

                                                                                                                                                                            if ((v174 & 1) != 0)
                                                                                                                                                                            {
                                                                                                                                                                              v4 = 672;
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1910], "milesPerImperialGallon");
                                                                                                                                                                              v175 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                              v176 = objc_msgSend(v1, "isEqual:", v175);

                                                                                                                                                                              if ((v176 & 1) != 0)
                                                                                                                                                                              {
                                                                                                                                                                                v4 = 673;
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1910], "millilitersPer100Kilometers");
                                                                                                                                                                                v177 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                v178 = objc_msgSend(v1, "isEqual:", v177);

                                                                                                                                                                                if ((v178 & 1) != 0)
                                                                                                                                                                                {
                                                                                                                                                                                  v4 = 674;
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1918], "lux");
                                                                                                                                                                                  v179 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                  v180 = objc_msgSend(v1, "isEqual:", v179);

                                                                                                                                                                                  if ((v180 & 1) != 0)
                                                                                                                                                                                  {
                                                                                                                                                                                    v4 = 721;
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1920], "kilobits");
                                                                                                                                                                                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                    v182 = objc_msgSend(v1, "isEqual:", v181);

                                                                                                                                                                                    if ((v182 & 1) != 0)
                                                                                                                                                                                    {
                                                                                                                                                                                      v4 = 741;
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1920], "megabits");
                                                                                                                                                                                      v183 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                      v184 = objc_msgSend(v1, "isEqual:", v183);

                                                                                                                                                                                      if ((v184 & 1) != 0)
                                                                                                                                                                                      {
                                                                                                                                                                                        v4 = 742;
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1920], "gigabits");
                                                                                                                                                                                        v185 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                        v186 = objc_msgSend(v1, "isEqual:", v185);

                                                                                                                                                                                        if ((v186 & 1) != 0)
                                                                                                                                                                                        {
                                                                                                                                                                                          v4 = 743;
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1920], "terabits");
                                                                                                                                                                                          v187 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                          v188 = objc_msgSend(v1, "isEqual:", v187);

                                                                                                                                                                                          if ((v188 & 1) != 0)
                                                                                                                                                                                          {
                                                                                                                                                                                            v4 = 744;
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
                                                                                                                                                                                            v189 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                            v190 = objc_msgSend(v1, "isEqual:", v189);

                                                                                                                                                                                            if ((v190 & 1) != 0)
                                                                                                                                                                                            {
                                                                                                                                                                                              v4 = 745;
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
                                                                                                                                                                                              v191 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                              v192 = objc_msgSend(v1, "isEqual:", v191);

                                                                                                                                                                                              if ((v192 & 1) != 0)
                                                                                                                                                                                              {
                                                                                                                                                                                                v4 = 746;
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1920], "gigabytes");
                                                                                                                                                                                                v193 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                v194 = objc_msgSend(v1, "isEqual:", v193);

                                                                                                                                                                                                if ((v194 & 1) != 0)
                                                                                                                                                                                                {
                                                                                                                                                                                                  v4 = 747;
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1920], "terabytes");
                                                                                                                                                                                                  v195 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                  v196 = objc_msgSend(v1, "isEqual:", v195);

                                                                                                                                                                                                  if ((v196 & 1) != 0)
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v4 = 748;
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1930], "kilograms");
                                                                                                                                                                                                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                    v198 = objc_msgSend(v1, "isEqual:", v197);

                                                                                                                                                                                                    if ((v198 & 1) != 0)
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v4 = 781;
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1930], "grams");
                                                                                                                                                                                                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                      v200 = objc_msgSend(v1, "isEqual:", v199);

                                                                                                                                                                                                      if ((v200 & 1) != 0)
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v4 = 782;
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1930], "milligrams");
                                                                                                                                                                                                        v201 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                        v202 = objc_msgSend(v1, "isEqual:", v201);

                                                                                                                                                                                                        if ((v202 & 1) != 0)
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v4 = 783;
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1930], "ounces");
                                                                                                                                                                                                          v203 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                          v204 = objc_msgSend(v1, "isEqual:", v203);

                                                                                                                                                                                                          if ((v204 & 1) != 0)
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v4 = 784;
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1930], "poundsMass");
                                                                                                                                                                                                            v205 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                            v206 = objc_msgSend(v1, "isEqual:", v205);

                                                                                                                                                                                                            if ((v206 & 1) != 0)
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v4 = 785;
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1930], "metricTons");
                                                                                                                                                                                                              v207 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                              v208 = objc_msgSend(v1, "isEqual:", v207);

                                                                                                                                                                                                              if ((v208 & 1) != 0)
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v4 = 786;
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1930], "slugs");
                                                                                                                                                                                                                v209 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                v210 = objc_msgSend(v1, "isEqual:", v209);

                                                                                                                                                                                                                if ((v210 & 1) != 0)
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v4 = 787;
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1938], "terawatts");
                                                                                                                                                                                                                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                  v212 = objc_msgSend(v1, "isEqual:", v211);

                                                                                                                                                                                                                  if ((v212 & 1) != 0)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v4 = 881;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1938], "gigawatts");
                                                                                                                                                                                                                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                    v214 = objc_msgSend(v1, "isEqual:", v213);

                                                                                                                                                                                                                    if ((v214 & 1) != 0)
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v4 = 882;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1938], "megawatts");
                                                                                                                                                                                                                      v215 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                      v216 = objc_msgSend(v1, "isEqual:", v215);

                                                                                                                                                                                                                      if ((v216 & 1) != 0)
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v4 = 883;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1938], "kilowatts");
                                                                                                                                                                                                                        v217 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                        v218 = objc_msgSend(v1, "isEqual:", v217);

                                                                                                                                                                                                                        if ((v218 & 1) != 0)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v4 = 884;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1938], "watts");
                                                                                                                                                                                                                          v219 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                          v220 = objc_msgSend(v1, "isEqual:", v219);

                                                                                                                                                                                                                          if ((v220 & 1) != 0)
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v4 = 885;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1938], "milliwatts");
                                                                                                                                                                                                                            v221 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                            v222 = objc_msgSend(v1, "isEqual:", v221);

                                                                                                                                                                                                                            if ((v222 & 1) != 0)
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v4 = 886;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1938], "microwatts");
                                                                                                                                                                                                                              v223 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                              v224 = objc_msgSend(v1, "isEqual:", v223);

                                                                                                                                                                                                                              if ((v224 & 1) != 0)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v4 = 887;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1938], "nanowatts");
                                                                                                                                                                                                                                v225 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                v226 = objc_msgSend(v1, "isEqual:", v225);

                                                                                                                                                                                                                                if ((v226 & 1) != 0)
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v4 = 888;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1938], "picowatts");
                                                                                                                                                                                                                                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                  v228 = objc_msgSend(v1, "isEqual:", v227);

                                                                                                                                                                                                                                  if ((v228 & 1) != 0)
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v4 = 889;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1938], "femtowatts");
                                                                                                                                                                                                                                    v229 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                    v230 = objc_msgSend(v1, "isEqual:", v229);

                                                                                                                                                                                                                                    if ((v230 & 1) != 0)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v4 = 890;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1938], "horsepower");
                                                                                                                                                                                                                                      v231 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                      v232 = objc_msgSend(v1, "isEqual:", v231);

                                                                                                                                                                                                                                      if ((v232 & 1) != 0)
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v4 = 891;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1940], "newtonsPerMetersSquared");
                                                                                                                                                                                                                                        v233 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                        v234 = objc_msgSend(v1, "isEqual:", v233);

                                                                                                                                                                                                                                        if ((v234 & 1) != 0)
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v4 = 931;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1940], "kilopascals");
                                                                                                                                                                                                                                          v235 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                          v236 = objc_msgSend(v1, "isEqual:", v235);

                                                                                                                                                                                                                                          if ((v236 & 1) != 0)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v4 = 932;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1940], "poundsForcePerSquareInch");
                                                                                                                                                                                                                                            v237 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                            v238 = objc_msgSend(v1, "isEqual:", v237);

                                                                                                                                                                                                                                            if ((v238 & 1) != 0)
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v4 = 933;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1940], "bars");
                                                                                                                                                                                                                                              v239 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                              v240 = objc_msgSend(v1, "isEqual:", v239);

                                                                                                                                                                                                                                              if ((v240 & 1) != 0)
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v4 = 934;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                +[CAFUnitRotationalSpeed revolutionsPerMinute](CAFUnitRotationalSpeed, "revolutionsPerMinute");
                                                                                                                                                                                                                                                v241 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                v242 = objc_msgSend(v1, "isEqual:", v241);

                                                                                                                                                                                                                                                if ((v242 & 1) != 0)
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v4 = 981;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  +[CAFUnitRotationalSpeed degreesPerSecond](CAFUnitRotationalSpeed, "degreesPerSecond");
                                                                                                                                                                                                                                                  v243 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                  v244 = objc_msgSend(v1, "isEqual:", v243);

                                                                                                                                                                                                                                                  if ((v244 & 1) != 0)
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v4 = 982;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1948], "metersPerSecond");
                                                                                                                                                                                                                                                    v245 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                    v246 = objc_msgSend(v1, "isEqual:", v245);

                                                                                                                                                                                                                                                    if ((v246 & 1) != 0)
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v4 = 1031;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1948], "kilometersPerHour");
                                                                                                                                                                                                                                                      v247 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                      v248 = objc_msgSend(v1, "isEqual:", v247);

                                                                                                                                                                                                                                                      if ((v248 & 1) != 0)
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v4 = 1032;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1948], "milesPerHour");
                                                                                                                                                                                                                                                        v249 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                        v250 = objc_msgSend(v1, "isEqual:", v249);

                                                                                                                                                                                                                                                        if ((v250 & 1) != 0)
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v4 = 1033;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1948], "metersPerHour");
                                                                                                                                                                                                                                                          v251 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                          v252 = objc_msgSend(v1, "isEqual:", v251);

                                                                                                                                                                                                                                                          if ((v252 & 1) != 0)
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v4 = 1034;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1950], "fahrenheit");
                                                                                                                                                                                                                                                            v253 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                            v254 = objc_msgSend(v1, "isEqual:", v253);

                                                                                                                                                                                                                                                            if ((v254 & 1) != 0)
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v4 = 1081;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              objc_msgSend(MEMORY[0x24BDD1950], "celsius");
                                                                                                                                                                                                                                                              v255 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                              v256 = objc_msgSend(v1, "isEqual:", v255);

                                                                                                                                                                                                                                                              if ((v256 & 1) != 0)
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v4 = 1082;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                objc_msgSend(MEMORY[0x24BDD1950], "kelvin");
                                                                                                                                                                                                                                                                v257 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                v258 = objc_msgSend(v1, "isEqual:", v257);

                                                                                                                                                                                                                                                                if ((v258 & 1) != 0)
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v4 = 1083;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  objc_msgSend(MEMORY[0x24BDD1958], "liters");
                                                                                                                                                                                                                                                                  v259 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                  v260 = objc_msgSend(v1, "isEqual:", v259);

                                                                                                                                                                                                                                                                  if ((v260 & 1) != 0)
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v4 = 1131;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    objc_msgSend(MEMORY[0x24BDD1958], "cubicMeters");
                                                                                                                                                                                                                                                                    v261 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                    v262 = objc_msgSend(v1, "isEqual:", v261);

                                                                                                                                                                                                                                                                    if ((v262 & 1) != 0)
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v4 = 1132;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      objc_msgSend(MEMORY[0x24BDD1958], "cubicFeet");
                                                                                                                                                                                                                                                                      v263 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                      v264 = objc_msgSend(v1, "isEqual:", v263);

                                                                                                                                                                                                                                                                      if ((v264 & 1) != 0)
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v4 = 1133;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        objc_msgSend(MEMORY[0x24BDD1958], "fluidOunces");
                                                                                                                                                                                                                                                                        v265 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                        v266 = objc_msgSend(v1, "isEqual:", v265);

                                                                                                                                                                                                                                                                        if ((v266 & 1) != 0)
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v4 = 1134;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          objc_msgSend(MEMORY[0x24BDD1958], "gallons");
                                                                                                                                                                                                                                                                          v267 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                          v268 = objc_msgSend(v1, "isEqual:", v267);

                                                                                                                                                                                                                                                                          if ((v268 & 1) != 0)
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v4 = 1135;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            objc_msgSend(MEMORY[0x24BDD1958], "milliliters");
                                                                                                                                                                                                                                                                            v269 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                            v270 = objc_msgSend(v1, "isEqual:", v269);

                                                                                                                                                                                                                                                                            if ((v270 & 1) != 0)
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v4 = 1136;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              +[CAFUnitPercent percent](CAFUnitPercent, "percent");
                                                                                                                                                                                                                                                                              v271 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                              v272 = objc_msgSend(v1, "isEqual:", v271);

                                                                                                                                                                                                                                                                              if ((v272 & 1) != 0)
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v4 = 1205;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                +[CAFUnitTorque newtonMeter](CAFUnitTorque, "newtonMeter");
                                                                                                                                                                                                                                                                                v273 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                                v274 = objc_msgSend(v1, "isEqual:", v273);

                                                                                                                                                                                                                                                                                if ((v274 & 1) != 0)
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v4 = 1251;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  +[CAFUnitTorque footPound](CAFUnitTorque, "footPound");
                                                                                                                                                                                                                                                                                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                                  v276 = objc_msgSend(v1, "isEqual:", v275);

                                                                                                                                                                                                                                                                                  if (v276)
                                                                                                                                                                                                                                                                                    v4 = 1252;
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                    v4 = 0;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

__CFString *NSStringFromMediaCategory(unsigned int a1)
{
  if (a1 > 0x2B)
    return 0;
  else
    return off_2508FEAD0[(char)a1];
}

id CAFGeneralLogging()
{
  if (CAFGeneralLogging_onceToken != -1)
    dispatch_once(&CAFGeneralLogging_onceToken, &__block_literal_global_14);
  return (id)CAFGeneralLogging_facility;
}

id CAFCarManagerLogging()
{
  if (CAFCarManagerLogging_onceToken != -1)
    dispatch_once(&CAFCarManagerLogging_onceToken, &__block_literal_global_2);
  return (id)CAFCarManagerLogging_facility;
}

id CAFDataClientLogging()
{
  if (CAFDataClientLogging_onceToken != -1)
    dispatch_once(&CAFDataClientLogging_onceToken, &__block_literal_global_4);
  return (id)CAFDataClientLogging_facility;
}

id CAFRequestResponseLogging()
{
  if (CAFRequestResponseLogging_onceToken != -1)
    dispatch_once(&CAFRequestResponseLogging_onceToken, &__block_literal_global_6);
  return (id)CAFRequestResponseLogging_facility;
}

id CAFRegistrationLogging()
{
  if (CAFRegistrationLogging_onceToken != -1)
    dispatch_once(&CAFRegistrationLogging_onceToken, &__block_literal_global_8);
  return (id)CAFRegistrationLogging_facility;
}

id CAFCarLogging()
{
  if (CAFCarLogging_onceToken != -1)
    dispatch_once(&CAFCarLogging_onceToken, &__block_literal_global_10);
  return (id)CAFCarLogging_facility;
}

id CAFPositionManagerLogging()
{
  if (CAFPositionManagerLogging_onceToken != -1)
    dispatch_once(&CAFPositionManagerLogging_onceToken, &__block_literal_global_12);
  return (id)CAFPositionManagerLogging_facility;
}

id CAFAccessoryLogging()
{
  if (CAFAccessoryLogging_onceToken != -1)
    dispatch_once(&CAFAccessoryLogging_onceToken, &__block_literal_global_14);
  return (id)CAFAccessoryLogging_facility;
}

id CAFServiceLogging()
{
  if (CAFServiceLogging_onceToken != -1)
    dispatch_once(&CAFServiceLogging_onceToken, &__block_literal_global_16);
  return (id)CAFServiceLogging_facility;
}

id CAFCharacteristicLogging()
{
  if (CAFCharacteristicLogging_onceToken != -1)
    dispatch_once(&CAFCharacteristicLogging_onceToken, &__block_literal_global_18);
  return (id)CAFCharacteristicLogging_facility;
}

id CAFControlLogging()
{
  if (CAFControlLogging_onceToken != -1)
    dispatch_once(&CAFControlLogging_onceToken, &__block_literal_global_20_0);
  return (id)CAFControlLogging_facility;
}

id CAFCachedDescriptionLogging()
{
  if (CAFCachedDescriptionLogging_onceToken != -1)
    dispatch_once(&CAFCachedDescriptionLogging_onceToken, &__block_literal_global_22);
  return (id)CAFCachedDescriptionLogging_facility;
}

id CAFGroupRequestLogging()
{
  if (CAFGroupRequestLogging_onceToken != -1)
    dispatch_once(&CAFGroupRequestLogging_onceToken, &__block_literal_global_24);
  return (id)CAFGroupRequestLogging_facility;
}

id CAFValueMonitorLogging()
{
  if (CAFValueMonitorLogging_onceToken != -1)
    dispatch_once(&CAFValueMonitorLogging_onceToken, &__block_literal_global_26_0);
  return (id)CAFValueMonitorLogging_facility;
}

id CAFAssetVariantsLogging()
{
  if (CAFAssetVariantsLogging_onceToken != -1)
    dispatch_once(&CAFAssetVariantsLogging_onceToken, &__block_literal_global_28);
  return (id)CAFAssetVariantsLogging_facility;
}

id CAFDLogging()
{
  if (CAFDLogging_onceToken != -1)
    dispatch_once(&CAFDLogging_onceToken, &__block_literal_global_30);
  return (id)CAFDLogging_facility;
}

id CAFDDataLogging()
{
  if (CAFDDataLogging_onceToken != -1)
    dispatch_once(&CAFDDataLogging_onceToken, &__block_literal_global_32);
  return (id)CAFDDataLogging_facility;
}

id CAFDAssertionLogging()
{
  if (CAFDAssertionLogging_onceToken != -1)
    dispatch_once(&CAFDAssertionLogging_onceToken, &__block_literal_global_34);
  return (id)CAFDAssertionLogging_facility;
}

id CAFDChannelLogging()
{
  if (CAFDChannelLogging_onceToken != -1)
    dispatch_once(&CAFDChannelLogging_onceToken, &__block_literal_global_36);
  return (id)CAFDChannelLogging_facility;
}

id CAFDClientLogging()
{
  if (CAFDClientLogging_onceToken != -1)
    dispatch_once(&CAFDClientLogging_onceToken, &__block_literal_global_38);
  return (id)CAFDClientLogging_facility;
}

id CAFToolLogging()
{
  if (CAFToolLogging_onceToken != -1)
    dispatch_once(&CAFToolLogging_onceToken, &__block_literal_global_40_0);
  return (id)CAFToolLogging_facility;
}

id CAFNowPlayingLogging()
{
  if (CAFNowPlayingLogging_onceToken != -1)
    dispatch_once(&CAFNowPlayingLogging_onceToken, &__block_literal_global_42);
  return (id)CAFNowPlayingLogging_facility;
}

id CAFStateCaptureLogging()
{
  if (CAFStateCaptureLogging_onceToken != -1)
    dispatch_once(&CAFStateCaptureLogging_onceToken, &__block_literal_global_44);
  return (id)CAFStateCaptureLogging_facility;
}

uint64_t NSStringFromPortSideIndicator(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return (uint64_t)*(&off_2508FEF60 + (char)a1);
}

const __CFString *NSStringFromCharacteristicState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Initialization");
  else
    return off_2508FEF88[a1 - 1];
}

uint64_t CAFCharacteristicStateFromString(void *a1)
{
  unint64_t v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = -1;
  v3 = 7;
  while (1)
  {
    v4 = CFSTR("Initialization");
    if (v2 <= 5)
      v4 = off_2508FEFC0[v2];
    if (!objc_msgSend(a1, "caseInsensitiveCompare:", v4))
      break;
    if (++v2 == 6)
      return v3;
  }
  return v2 + 1;
}

uint64_t CAFCompareObjects(void *a1, void *a2)
{
  if (a1 == a2)
    return 0;
  if (a1 && a2)
    return objc_msgSend(a1, "compare:", a2);
  if (a1)
    return a2 == 0;
  return -1;
}

uint64_t CAFEntityCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_256811950))
    v4 = v3;
  else
    v4 = 0;

  v5 = a2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_256811950))
    v6 = v5;
  else
    v6 = 0;

  v7 = 1;
  if (v4 && v6)
  {
    v8 = objc_msgSend(v4, "baseCAFClass");
    if (v8 == objc_msgSend(v6, "baseCAFClass"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "comparisonKeys", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v7 = 0;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            if (!v7)
            {
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              objc_msgSend(v4, "valueForKeyPath:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "valueForKeyPath:", v14);
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = (void *)v16;
              if (v15 == (void *)v16)
              {
                v7 = 0;
              }
              else
              {
                if (v15)
                  v18 = v16 == 0;
                else
                  v18 = 1;
                if (v18)
                {
                  if (v15)
                    v7 = v16 == 0;
                  else
                    v7 = -1;
                }
                else
                {
                  v7 = objc_msgSend(v15, "compare:", v16);
                }
              }

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

uint64_t CAFCharacteristicStateIsCurrent(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) < 3 || a1 == 0)
    return 0;
  if (a1 == 7)
    CAFCharacteristicStateIsCurrent_cold_1();
  return 1;
}

uint64_t CAFCharacteristicStateIsInitializing(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5)
    return 0;
  if (a1 == 7)
    CAFCharacteristicStateIsInitializing_cold_1();
  return 1;
}

__CFString *NSStringFromFuelLevelState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FF2C0[(char)a1];
}

void sub_237794640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void sub_23779536C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromTransmissionMode(int a1)
{
  int v1;
  const __CFString *result;

  v1 = a1 - 68;
  result = 0;
  switch(v1)
  {
    case 0:
      result = CFSTR("D");
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 11:
    case 13:
      return result;
    case 8:
      result = CFSTR("L");
      break;
    case 9:
      result = CFSTR("M");
      break;
    case 10:
      result = CFSTR("N");
      break;
    case 12:
      result = CFSTR("P");
      break;
    case 14:
      result = CFSTR("R");
      break;
    case 15:
      result = CFSTR("S");
      break;
    default:
      result = CFSTR("None");
      break;
  }
  return result;
}

__CFString *NSStringFromNotificationSeverity(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508FF348[(char)a1];
}

void sub_23779E5C8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_23779E65C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23779F410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23779FE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NSStringFromCableState(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return (uint64_t)*(&off_2508FF3D8 + (char)a1);
}

uint64_t NSStringFromDeviceAction(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return (uint64_t)*(&off_2508FF400 + (char)a1);
}

id CAFCarDataServiceInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25682EA08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchCurrentCarConfigWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_, 0, 0);

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_, 0, 0);

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_readFromPluginID_instanceIDs_priority_withResponse_, 0, 0);

  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_readFromPluginID_instanceIDs_priority_withResponse_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_readFromPluginID_instanceIDs_priority_withResponse_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_readFromPluginID_instanceIDs_priority_withResponse_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_writeToPluginID_values_priority_withResponse_, 0, 0);

  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_writeToPluginID_values_priority_withResponse_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_writeToPluginID_values_priority_withResponse_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_writeToPluginID_values_priority_withResponse_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_requestPluginID_instanceID_value_priority_withResponse_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_requestPluginID_instanceID_value_priority_withResponse_, 1, 0);

  v34 = (void *)MEMORY[0x24BDBCF20];
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_requestPluginID_instanceID_value_priority_withResponse_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_requestPluginID_instanceID_value_priority_withResponse_, 3, 0);

  v42 = (void *)MEMORY[0x24BDBCF20];
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, v47, v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_requestPluginID_instanceID_value_priority_withResponse_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_notifyPluginID_instanceID_value_priority_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_notifyPluginID_instanceID_value_priority_, 1, 0);

  v52 = (void *)MEMORY[0x24BDBCF20];
  v53 = objc_opt_class();
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  objc_msgSend(v52, "setWithObjects:", v53, v54, v55, v56, v57, objc_opt_class(), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v58, sel_notifyPluginID_instanceID_value_priority_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_notifyPluginID_instanceID_value_priority_, 3, 0);

  return v0;
}

id CAFCarDataClientInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25681E318);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_didUpdateCurrentCarConfig_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_didUpdateConfig_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_didUpdatePluginID_values_, 0, 0);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_didUpdatePluginID_values_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_didNotifyPluginID_instanceID_value_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_didNotifyPluginID_instanceID_value_, 1, 0);

  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_didNotifyPluginID_instanceID_value_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_didRequestPluginID_instanceID_value_withResponse_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_didRequestPluginID_instanceID_value_withResponse_, 1, 0);

  v30 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_didRequestPluginID_instanceID_value_withResponse_, 2, 0);

  v37 = (void *)MEMORY[0x24BDBCF20];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, v40, v41, v42, v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_didRequestPluginID_instanceID_value_withResponse_, 0, 1);

  return v0;
}

uint64_t NSStringFromSensorState(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return (uint64_t)*(&off_2508FF608 + (char)a1);
}

uint64_t NSStringFromChargingState(unsigned int a1)
{
  if (a1 > 0xA)
    return 0;
  else
    return (uint64_t)*(&off_2508FF630 + (char)a1);
}

const __CFString *NSStringFromControlSender(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("accessory");
  if (a1)
    return v1;
  else
    return CFSTR("device");
}

uint64_t NSStringFromBatteryLevelState(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return (uint64_t)*(&off_2508FF6A8 + (char)a1);
}

uint64_t NSStringFromSeatOccupancy(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return (uint64_t)*(&off_2508FF6C0 + (char)a1);
}

id NSStringFromVentTypes(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 1))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("window=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 2))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("upper=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 4))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("lower=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 8))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("neck=%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v14 = (void *)MEMORY[0x24BDD17C8];
  if (+[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", a1, 16))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("middle=%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD17C8];
  +[CAFBitMaskUtilities description:optionCount:](CAFBitMaskUtilities, "description:optionCount:", a1, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("(%@) %@"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

const __CFString *NSStringFromFillLevelLabel(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("ZeroToOne");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("EmptyToFull");
}

void CAFCharacteristicStateIsCurrent_cold_1()
{
  __assert_rtn("CAFCharacteristicStateIsCurrent", "CAFEntity.m", 92, "NO");
}

void CAFCharacteristicStateIsInitializing_cold_1()
{
  __assert_rtn("CAFCharacteristicStateIsInitializing", "CAFEntity.m", 112, "NO");
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t CARSignpostLogForCategory()
{
  return MEMORY[0x24BE151D0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x24BE29880]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
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

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

