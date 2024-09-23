void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void _populateBacklightChangeEventStruct(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a1;
  *(_BYTE *)a2 = *(_BYTE *)a2 & 0xFE | (v3 != 0);
  v7 = v3;
  if (v3)
  {
    *(_QWORD *)(a2 + 8) = objc_msgSend(v3, "eventID");
    *(_DWORD *)(a2 + 16) = objc_msgSend(v7, "state");
    *(_DWORD *)(a2 + 20) = objc_msgSend(v7, "previousState");
    v3 = v7;
  }
  objc_msgSend(v3, "changeRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  *(_BYTE *)(a2 + 24) = *(_BYTE *)(a2 + 24) & 0xFE | (v4 != 0);
  if (v4)
  {
    *(_DWORD *)(a2 + 28) = objc_msgSend(v4, "requestedActivityState");
    objc_msgSend(v5, "explanation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a2 + 32) = +[BLSHBacklightTransitionStateMachineAbortContext backlightChangeRequestExplanationIdentifierFromString:](BLSHBacklightTransitionStateMachineAbortContext, "backlightChangeRequestExplanationIdentifierFromString:", v6);

    *(_QWORD *)(a2 + 40) = objc_msgSend(v5, "timestamp");
    *(_DWORD *)(a2 + 48) = objc_msgSend(v5, "sourceEvent");
  }

}

uint64_t BLSBacklightFactorFromCBDisplayMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_21462C210[a1 - 1];
}

const __CFString *NSStringFromCBDisplayMode_bls(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Invalid");
  else
    return off_24D1BC1B0[a1];
}

const __CFString *NSStringFromCBFlipbookState_bls(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("WillTurnOn");
  else
    return off_24D1BC1D8[a1 - 1];
}

void sub_2145B35A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_2145B4DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

const __CFString *NSStringFromBLSHOnSystemSleepActionState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Idle");
  if (a1 == 1)
    v1 = CFSTR("Performing");
  if (a1 == 2)
    return CFSTR("Completed");
  else
    return v1;
}

void sub_2145B5CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void sub_2145BAF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location)
{
  int v24;
  id *v25;
  uint64_t v26;

  if (v24)
    objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 208));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2145BCDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

const __CFString *NSStringFromBLSHAlwaysOnPresentationEngineState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Stopped");
  else
    return off_24D1BC958[a1 - 1];
}

BOOL BLSHAlwaysOnPresentationEngineStateIsFlipbook(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

BOOL BLSHAlwaysOnPresentationEngineStateIsPredictiveFlipbook(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

void sub_2145BE800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145BEF70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
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

void sub_2145C3204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145C3D28(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 184));
  _Block_object_dispose((const void *)(v3 - 176), 8);
  _Block_object_dispose((const void *)(v3 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2145C4224(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2145C7CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145C7DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t _triggerTestCriticalAssert(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_triggerTestCriticalAssert:");
}

void sub_2145D0180(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2145D0590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2145D1DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2145D2D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_14_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringFromBLSBacklightDisplayMode(unint64_t a1)
{
  if (a1 < 7)
    return off_24D1BD108[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected display mode:%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t BLSBacklightStateForBLSBacklightDisplayMode(unint64_t a1)
{
  NSObject *v3;

  if (a1 < 7)
    return qword_21462C340[a1];
  bls_backlight_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    BLSBacklightStateForBLSBacklightDisplayMode_cold_1(a1, v3);

  return 0;
}

BOOL IsBlankedForBLSBacklightDisplayMode(uint64_t a1)
{
  return (unint64_t)(a1 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t IsOffForBLSBacklightDisplayMode(unint64_t a1)
{
  return (a1 > 6) | (3u >> a1) & 1;
}

BOOL CanRenderFlipbookForBLSBacklightDisplayMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL IsAlwaysOnBrightnessForBLSBacklightDisplayMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

uint64_t IsActiveOnBrightnessForBLSBacklightDisplayMode(unint64_t a1)
{
  return (a1 < 7) & (0x70u >> a1);
}

BOOL IsDisplayModeTransitionToAlwaysOn(uint64_t a1, uint64_t a2)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2 && (unint64_t)(a2 - 4) < 3;
}

uint64_t IsDisplayModeTransitionToActiveOn(unint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 2 || a1 > 6)
    return 0;
  else
    return (0x70u >> a1) & 1;
}

BOOL WillBlankForDisplayModeTransition(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(a1 - 3) < 4 && (unint64_t)(a2 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

BOOL WillUnblankForDisplayModeTransition(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(a1 - 7) < 0xFFFFFFFFFFFFFFFCLL && (unint64_t)(a2 - 3) < 4;
}

void _springboardDidFinishStartup(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 120000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___springboardDidFinishStartup_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

void ___springboardDidFinishStartup_block_invoke(uint64_t a1)
{
  _QWORD block[5];

  +[BLSHWatchdogProvider checkForWatchdogDidFire:](BLSHWatchdogProvider, "checkForWatchdogDidFire:", 0);
  BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___springboardDidFinishStartup_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_classLock_block_invoke_onceToken != -1)
    dispatch_once(&_classLock_block_invoke_onceToken, block);
}

void ___springboardDidFinishStartup_block_invoke_2(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_criticalAssertDidFail, CFSTR("BLSHCriticalAssertDidFailNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void _criticalAssertDidFail()
{
  dispatch_time_t v0;

  v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x24BDAC9B8], &__block_literal_global_9);
}

BOOL ___criticalAssertDidFail_block_invoke()
{
  return BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
}

void sub_2145DE54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145DEBC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2145DEC28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2145DF3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
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

void _blsAlertCallback(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = (id)__dialog;
  v4 = v3;
  if (a2 == 2)
  {
    v5 = 2;
  }
  else if (a2 == 1)
  {
    v5 = 0;
  }
  else if (a2)
  {
    v6 = v3[2];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      _blsAlertCallback_cold_1(a2, v6, v7, v8, v9, v10, v11, v12);
    v3 = v4;
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }
  objc_msgSend(v3, "_alertDidDismiss:", v5);

}

void sub_2145E3514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_2145E5534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_2145E7838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _blsWatchdogLockStatusDidChange()
{
  NSObject *v0;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v2;

  bls_diagnostics_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    _blsWatchdogLockStatusDidChange_cold_1();

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v2 = (const void *)objc_opt_class();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v2, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  return +[BLSHWatchdogProvider checkForWatchdogDidFire:](BLSHWatchdogProvider, "checkForWatchdogDidFire:", 0);
}

void sub_2145E9634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2145EB338(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2145EC04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_2145ED028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145ED18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145ED344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145ED5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145F0D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2145F3478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void BLSHGetRequestedFidelityForBacklightState(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if ((unint64_t)(a1 - 2) < 2)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 3);
    goto LABEL_9;
  }
  if (!a1)
    goto LABEL_8;
  if (a1 != 1)
    goto LABEL_9;
  if ((objc_msgSend(v5, "isAlwaysOnEnabledForEnvironment") & 1) == 0)
  {
LABEL_8:
    v7[2](v7, 0);
    goto LABEL_9;
  }
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars();
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BLSEncode4Chars();
    kdebug_trace();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __BLSHGetRequestedFidelityForBacklightState_block_invoke;
    v10[3] = &unk_24D1BDB78;
    v11 = v7;
    objc_msgSend(v5, "requestedFidelityForInactiveContentWithCompletion:", v10);

  }
  else
  {
    v7[2](v7, 1);
  }
LABEL_9:

}

void sub_2145F69EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2145F81CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_2145FA03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_15_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x22u);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x22u);
}

id BLSHSubhostedEnvironmentIdentifierForEnvironment(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("subhosted: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_214603BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214603EE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2146066A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t BLSIs1HzFlipbookForEnvironment(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "is1HzFlipbook");
  else
    v2 = 0;

  return v2;
}

uint64_t BLSCacheFlipbookOnDisplayWakeForEnvironment(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "cacheFlipbookOnDisplayWake");
  else
    v2 = 0;

  return v2;
}

uint64_t BLSDefaultFidelityForBacklightState(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  char v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "isAlwaysOnEnabledForEnvironment");
  v5 = objc_msgSend(v3, "isLiveUpdating");
  v6 = objc_msgSend(v3, "hasUnrestrictedFramerateUpdates");
  v7 = BLSIs1HzFlipbookForEnvironment(v3);

  v8 = v4;
  if (a1 != 1)
    v8 = a1;
  v9 = v8 - 2;
  v10 = 2;
  v11 = 1;
  if (v6 | v7)
    v11 = 2;
  if ((v5 & 1) == 0)
    v10 = v11;
  if (v8 == 1)
    v12 = v10;
  else
    v12 = 0;
  if (v9 >= 2)
    return v12;
  else
    return 3;
}

id BLSVisualStateForBacklightState(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  char v13;
  int v14;
  int v15;
  void *v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(v11, "isAlwaysOnEnabledForEnvironment");
  v13 = objc_msgSend(v11, "isLiveUpdating");
  v14 = objc_msgSend(v11, "hasUnrestrictedFramerateUpdates");
  v15 = BLSIs1HzFlipbookForEnvironment(v11);
  BLSVisualStateForBacklightStateAndExplictOptions(a1, a2, v12, v13, v14, v15, v11, v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id BLSVisualStateForBacklightStateAndExplictOptions(uint64_t a1, uint64_t a2, unsigned int a3, char a4, int a5, int a6, void *a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = v18;
  v20 = a3;
  if (a1 != 1)
    v20 = a1;
  v21 = v20 - 2;
  v22 = 2;
  v23 = 1;
  if (a5 | a6)
    v23 = 2;
  if ((a4 & 1) == 0)
    v22 = v23;
  v24 = v20 - 1;
  if (v20 == 1)
    v25 = v22;
  else
    v25 = 0;
  if (v21 >= 2)
    v26 = v25;
  else
    v26 = 3;
  if (v17)
  {
    if (!v18)
      v18 = (id)MEMORY[0x24BDBCE60];
    objc_msgSend(v18, "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v17, "allowedFidelityAtDate:forEnvironment:expectedFidelity:", v27, v16, v26);

  }
  if (v24 > 2)
  {
    v29 = 0;
    v28 = 1;
  }
  else
  {
    v28 = qword_21462C438[v24];
    v29 = qword_21462C450[v24];
  }
  if (v26 < a2)
    a2 = v26;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B898]), "initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:", v28, a2, v29, a1 == 3);

  return v30;
}

id BLSVisualStateForBacklightStateAndSettings(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  char v14;
  int v15;
  int v16;
  void *v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = objc_msgSend(v12, "bls_isAlwaysOnEnabledForEnvironment");
  v14 = objc_msgSend(v12, "bls_isLiveUpdating");
  v15 = objc_msgSend(v12, "bls_hasUnrestrictedFramerateUpdates");

  v16 = BLSIs1HzFlipbookForEnvironment(v11);
  BLSVisualStateForBacklightStateAndExplictOptions(a1, 3, v13, v14, v15, v16, v11, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_21460AE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *NSStringFromBLSBacklightBrightnessCurve(uint64_t a1)
{
  if (a1)
    return CFSTR("AlwaysOn");
  else
    return CFSTR("Normal");
}

void sub_21460C15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return BSTimeDifferenceFromMachTimeToMachTime();
}

void sub_214611DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
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

void sub_214612374(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_9_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return objc_opt_class();
}

void BLSHRecordCriticalAssertFailure(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v9[0] = CFSTR("BLSHCriticalAssertDidFailDate");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = v1;
  v9[1] = CFSTR("BLSHCriticalAssertDidFailDescription");
  v9[2] = CFSTR("BLSHCriticalAssertDidFailBuildVersion");
  v3 = (void *)MGCopyAnswer();
  v10[2] = v3;
  v9[3] = CFSTR("BLSHCriticalAssertDidFailProcess");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("BLSHCriticalAssertDidFail"));

  bls_diagnostics_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    BLSHRecordCriticalAssertFailure_cold_1((uint64_t)v1, v8);

}

BOOL BLSHCheckForCriticalAssertFailureAndPrompt(int a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  BLSHCriticalAssertDidFailDetails *v6;
  BLSHCriticalAssertDidFailDetails *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("BLSHCriticalAssertDidFail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[BLSHCriticalAssertDidFailDetails initWithCriticalAssertDidFailDictionary:]([BLSHCriticalAssertDidFailDetails alloc], "initWithCriticalAssertDidFailDictionary:", v5);
    v7 = v6;
    if (a2)
    {
      -[BLSHCriticalAssertDidFailDetails explanation](v6, "explanation");
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    bls_diagnostics_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      BLSHCheckForCriticalAssertFailureAndPrompt_cold_4(v7, v8);

    if (!os_variant_has_internal_diagnostics() || !a1)
      goto LABEL_18;
    if (+[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:](BLSHInternalTapToRadarIgnorer, "shouldIgnoreDesignation:", 2))
    {
      BLSHResetCriticalAssertFailure();
      bls_diagnostics_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        BLSHCheckForCriticalAssertFailureAndPrompt_cold_1(v9, v10, v11);
    }
    else
    {
      -[BLSHCriticalAssertDidFailDetails date](v7, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceNow");
      v14 = v13;

      if (v14 >= -86400.0)
      {
        bls_diagnostics_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          BLSHCheckForCriticalAssertFailureAndPrompt_cold_3(v15, v16, v17, v18, v19, v20, v21, v22);

        _BLSHShowCriticalAssertFailureAlert(v7);
        goto LABEL_18;
      }
      BLSHResetCriticalAssertFailure();
      bls_diagnostics_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        BLSHCheckForCriticalAssertFailureAndPrompt_cold_2(v7, v9);
    }

LABEL_18:
  }

  return v5 != 0;
}

void _BLSHShowCriticalAssertFailureAlert(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BLSHTapToRadarDescriptor *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v1 = a1;
  objc_msgSend(v1, "processName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v33 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "debugLogsEnabled"))
    v9 = CFSTR("with");
  else
    v9 = CFSTR("without");
  objc_msgSend(v1, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bls_loggingString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@: BacklightServices %@ critical assert failed in %@ %@ debug logs at %@"), v6, v7, v8, v33, v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v12;

  v13 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend(v1, "debugLogsEnabled"))
    v14 = CFSTR("with");
  else
    v14 = CFSTR("without");
  objc_msgSend(v1, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bls_loggingString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buildVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "explanation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("BacklightServices critical assert failed in %@ %@ debug logs at %@ on %@\n\nExplanation: %@"), v33, v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[BLSHTapToRadarDescriptor initWithDesignation:radarTitle:radarDescription:]([BLSHTapToRadarDescriptor alloc], "initWithDesignation:radarTitle:radarDescription:", 2, v12, v19);
  objc_msgSend(v1, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTapToRadarDescriptor setTimeOfIssue:](v20, "setTimeOfIssue:", v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend(v1, "debugLogsEnabled"))
    v23 = CFSTR("with");
  else
    v23 = CFSTR("without");
  objc_msgSend(v1, "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bls_loggingString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buildVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "explanation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ abort: BacklightServices critical assert failed %@ debug logs at %@ on %@:\"%@\".\nPlease file a radar against BacklightServices | All with a sysdiagnose.\n\nTo disable this prompt from CLI:\n\nlogin -f mobile defaults write com.apple.BacklightServices IgnoredTapToRadarDesignations -array -int 0"), v33, v23, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTapToRadarDescriptor setTtrPromptMessage:](v20, "setTtrPromptMessage:", v28);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BacklightServices critical assert failed in %@"), v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTapToRadarDescriptor setTtrDisplayReason:](v20, "setTtrDisplayReason:", v29);

  +[BLSHInternalTapToRadarManager sharedTapToRadarManager](BLSHInternalTapToRadarManager, "sharedTapToRadarManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  bls_diagnostics_log();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "requestTapToRadar:log:completion:", v20, v31, &__block_literal_global_28);

}

void BLSHResetCriticalAssertFailure()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("BLSHCriticalAssertDidFail"));

}

BOOL _blsCriticalAssertLockStatusDidChange()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v9;

  bls_diagnostics_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    _blsCriticalAssertLockStatusDidChange_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v9 = (const void *)objc_opt_class();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v9, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  return BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
}

BOOL BLSHIsUnitTestRunning()
{
  Class v0;
  void *v1;
  _BOOL8 v2;

  v0 = NSClassFromString(CFSTR("XCTestProbe"));
  if (!v0)
    return 0;
  -[objc_class valueForKey:](v0, "valueForKey:", CFSTR("isTesting"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

void sub_214614EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
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

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t _triggerTestWatchdog(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_triggerTestWatchdog:");
}

void sub_214616E40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
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

void BLSBacklightStateForBLSBacklightDisplayMode_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "Unexpected display mode:%ld", (uint8_t *)&v2, 0xCu);
}

void _blsAlertCallback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_2145AC000, a2, a3, "Got unpexpected response in _blsAlertCallback(): %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void _blsWatchdogLockStatusDidChange_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, v0, v1, "_blsWatchdogLockStatusDidChange: will stop listening for kMobileKeyBagLockStatusNotificationID and check for BLS watchdog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_3();
}

void BLSHRecordCriticalAssertFailure_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "BLSHCriticalAssert failure: %{public}@", (uint8_t *)&v2, 0xCu);
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("BLSHCriticalAssertDidFail");
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a1, a3, "not prompting to file radars for BLS critical assert failures on this device due to user preferences so clearing %@{public}@", (uint8_t *)&v3);
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a2, v5, "not prompting to file radar for BLS critical assert failure from %{public}@ because it's too old", (uint8_t *)&v6);

}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, a1, a3, "prompting to file a radar for the BLS critical assert failure", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_3();
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_4(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "explanation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "BLSH Critical Assert did fail at %{public}@ on build %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

void _blsCriticalAssertLockStatusDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, a1, a3, "_blsCriticalAssertLockStatusDidChange: will stop listening for kMobileKeyBagLockStatusNotificationID and check for critical assert", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_3();
}

uint64_t BKSDisplayServicesNotifyDisplayBlanked()
{
  return MEMORY[0x24BE0B520]();
}

uint64_t BKSHIDServicesGetBacklightFactor()
{
  return MEMORY[0x24BE0B5B0]();
}

uint64_t BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync()
{
  return MEMORY[0x24BE0B5F0]();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationAsync()
{
  return MEMORY[0x24BE0B618]();
}

uint64_t BLSBacklightActivityStateForBLSBacklightState()
{
  return MEMORY[0x24BE0B748]();
}

uint64_t BLSBacklightFBSSceneEnvironmentDeltaDescription()
{
  return MEMORY[0x24BE0B750]();
}

uint64_t BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable()
{
  return MEMORY[0x24BE0B758]();
}

uint64_t BLSBacklightStateForVisuaState()
{
  return MEMORY[0x24BE0B760]();
}

uint64_t BLSBacklightStateIsActive()
{
  return MEMORY[0x24BE0B768]();
}

uint64_t BLSEncode4Chars()
{
  return MEMORY[0x24BE0B770]();
}

uint64_t BLSLoggingStringForContinuousMachTime()
{
  return MEMORY[0x24BE0B780]();
}

uint64_t BLSLoggingStringForMachTime()
{
  return MEMORY[0x24BE0B788]();
}

uint64_t BLSMachContinuousTimeFromMachAbsoluteTime()
{
  return MEMORY[0x24BE0B790]();
}

uint64_t BLSMachTimeFromNSTimeInterval()
{
  return MEMORY[0x24BE0B798]();
}

uint64_t BLSShortLoggingStringForContinuousMachTime()
{
  return MEMORY[0x24BE0B7A0]();
}

uint64_t BLSShortLoggingStringForMachTime()
{
  return MEMORY[0x24BE0B7A8]();
}

uint64_t BLSStateDataWithTitleDescriptionAndHints()
{
  return MEMORY[0x24BE0B7B0]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x24BE0BAD0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSIsBeingDebugged()
{
  return MEMORY[0x24BE0BC50]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x24BE0BD60]();
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B38](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSStringFromBLSAlwaysOnSuppressionReason()
{
  return MEMORY[0x24BE0B7C0]();
}

uint64_t NSStringFromBLSAlwaysOnSuppressionType()
{
  return MEMORY[0x24BE0B7C8]();
}

uint64_t NSStringFromBLSAssertingObject()
{
  return MEMORY[0x24BE0B7D0]();
}

uint64_t NSStringFromBLSBacklightActivityState()
{
  return MEMORY[0x24BE0B7D8]();
}

uint64_t NSStringFromBLSBacklightChangeEvents()
{
  return MEMORY[0x24BE0B7E0]();
}

uint64_t NSStringFromBLSBacklightChangeSourceEvent()
{
  return MEMORY[0x24BE0B7E8]();
}

uint64_t NSStringFromBLSBacklightState()
{
  return MEMORY[0x24BE0B7F0]();
}

uint64_t NSStringFromBLSFlipbookState()
{
  return MEMORY[0x24BE0B7F8]();
}

uint64_t NSStringFromBLSUpdateFidelity()
{
  return MEMORY[0x24BE0B800]();
}

uint64_t NSStringFromCADisplayState()
{
  return MEMORY[0x24BDE5620]();
}

uint64_t NSStringFromCADisplayStateTransitionStatus()
{
  return MEMORY[0x24BDE5628]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OSLogFlushBuffers()
{
  return MEMORY[0x24BE60CA0]();
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

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
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

uint64_t abort_with_payload()
{
  return MEMORY[0x24BDAD018]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x24BDAD020]();
}

uint64_t bls_assertions_log()
{
  return MEMORY[0x24BE0B9D8]();
}

uint64_t bls_backlight_log()
{
  return MEMORY[0x24BE0B9E0]();
}

uint64_t bls_budget_log()
{
  return MEMORY[0x24BE0B9E8]();
}

uint64_t bls_diagnostics_log()
{
  return MEMORY[0x24BE0B9F0]();
}

uint64_t bls_environment_log()
{
  return MEMORY[0x24BE0B9F8]();
}

uint64_t bls_flipbook_log()
{
  return MEMORY[0x24BE0BA00]();
}

uint64_t bls_scenes_log()
{
  return MEMORY[0x24BE0BA08]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x24BDAE048]();
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x24BDAE080](__path);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

int reboot_np(int howto, const char *message)
{
  return MEMORY[0x24BDAFAD8](*(_QWORD *)&howto, message);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x24BEDE490]();
}

