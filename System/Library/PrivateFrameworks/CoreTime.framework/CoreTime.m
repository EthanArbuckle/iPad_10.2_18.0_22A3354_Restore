double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v7;

  v2 = *(double *)&TMConvertTicksToSeconds_ticksPerSecond;
  if (*(double *)&TMConvertTicksToSeconds_ticksPerSecond == 0.0)
  {
    v7 = 0;
    TMGetMachTimebase((uint32_t *)&v7 + 1, (uint32_t *)&v7);
    v3 = 1000000000;
    v4 = HIDWORD(v7);
    do
    {
      v5 = v4;
      v4 = v3;
      v3 = v5 % v3;
    }
    while (v3);
    v2 = (double)(HIDWORD(v7) / v4) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v4));
    *(double *)&TMConvertTicksToSeconds_ticksPerSecond = v2;
  }
  return v2 * (double)a1;
}

void TMSetSourceTimeZone(void *a1, void *a2)
{
  double v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v4 = _TMGetKernelMonotonicClock();
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = _os_activity_create(&dword_1B39B6000, "TMSetSourceTimeZone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetSourceTimeZone");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
  xpc_dictionary_set_string(v7, "TMTimeZone", (const char *)objc_msgSend(a2, "UTF8String"));
  xpc_dictionary_set_double(v7, "TMRtcTime", v4);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceTimeZone(CFStringRef, CFStringRef)"), CFSTR("TMClient.m"), 268, CFSTR("Invalid RTC bear trap."));
  }
  v8 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v10);

}

double _TMGetKernelMonotonicClock()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  size_t v11;
  unint64_t v12;

  if (TMDeviceHasPMU_token != -1)
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  if (!TMDeviceHasPMU_hasPMU)
  {
    v9 = mach_continuous_time();
    return TMConvertTicksToSeconds(v9);
  }
  v12 = 0;
  if ((_TMGetKernelMonotonicClock_init & 1) != 0)
    goto LABEL_12;
  if (!sysctlnametomib("kern.monotonicclock_usecs", _TMGetKernelMonotonicClock_mib, (size_t *)&_TMGetKernelMonotonicClock_miblen))
  {
    if (TMGetKernelMonotonicClockResolution_onceToken != -1)
      dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_162);
    *(double *)&_TMGetKernelMonotonicClock_halfResolution = *(double *)&TMGetKernelMonotonicClockResolution_sInterval
                                                          * 0.5;
    _TMGetKernelMonotonicClock_readScale = 0x412E848000000000;
    _TMGetKernelMonotonicClock_init = 1;
LABEL_12:
    v11 = 8;
    if (!sysctl(_TMGetKernelMonotonicClock_mib, _TMGetKernelMonotonicClock_miblen, &v12, &v11, 0, 0))
      return (double)v12 / *(double *)&_TMGetKernelMonotonicClock_readScale
           + *(double *)&_TMGetKernelMonotonicClock_halfResolution;
    v8 = -1.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _TMGetKernelMonotonicClock_cold_1();
    return v8;
  }
  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v8 = -1.0;
  if (v0)
    _TMGetKernelMonotonicClock_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
  return v8;
}

BOOL TMGetReferenceTime(double *a1, double *a2, _DWORD *a3)
{
  NSObject *v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  _BOOL8 v10;
  os_activity_scope_state_s v12;

  if (a1)
    *a1 = NAN;
  if (a2)
    *a2 = NAN;
  if (a3)
    *a3 = -1;
  v6 = _os_activity_create(&dword_1B39B6000, "TMGetReferenceTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMGetReferenceTime");
  v8 = (_xpc_connection_s *)_TMCopyConnection(0);
  v9 = xpc_connection_send_message_with_reply_sync(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v12);

  if (!v9)
    return 0;
  if (MEMORY[0x1B5E2AE70](v9) != MEMORY[0x1E0C812F8])
    goto LABEL_9;
  if (a1)
    *a1 = xpc_dictionary_get_double(v9, "TMCurrentTime");
  if (a2)
    *a2 = xpc_dictionary_get_double(v9, "TMTimeError");
  if (a3)
    *a3 = xpc_dictionary_get_BOOL(v9, "TMReliability");
  if (xpc_dictionary_get_value(v9, "TMCurrentTime") && xpc_dictionary_get_value(v9, "TMTimeError"))
    v10 = xpc_dictionary_get_value(v9, "TMReliability") != 0;
  else
LABEL_9:
    v10 = 0;
  xpc_release(v9);
  return v10;
}

BOOL TMGetTrustedInterval(double *a1, double *a2)
{
  NSObject *v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  _BOOL8 v8;
  double v9;
  double v10;
  os_activity_scope_state_s v12;

  v4 = _os_activity_create(&dword_1B39B6000, "TMGetTrustedInterval", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "TMCommand", "TMGetTrustedInterval");
  v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  v7 = xpc_connection_send_message_with_reply_sync(v6, v5);
  xpc_release(v5);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&v12);

  if (v7)
  {
    if (MEMORY[0x1B5E2AE70](v7) == MEMORY[0x1E0C812F8])
    {
      v10 = xpc_dictionary_get_double(v7, "TMCurrentTime");
      v9 = xpc_dictionary_get_double(v7, "TMTimeError");
      if (xpc_dictionary_get_value(v7, "TMCurrentTime"))
        v8 = xpc_dictionary_get_value(v7, "TMTimeError") != 0;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
      v9 = NAN;
      v10 = NAN;
    }
    xpc_release(v7);
    if (!a1)
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = 0;
  v9 = NAN;
  v10 = NAN;
  if (a1)
LABEL_10:
    *a1 = v10;
LABEL_11:
  if (a2)
    *a2 = v9;
  return v8;
}

uint64_t _TMCopyConnection(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  if (_TMConnectionQueue_sPred != -1)
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___TMCopyConnection_block_invoke;
  v4[3] = &unk_1E664F578;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_TMConnectionQueue_sConnectionQueue, v4);
  v2 = v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void TMSetSourceTime(void *a1, double a2, double a3)
{
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  xpc_object_t v13;
  long double v14;
  long double v15;
  _xpc_connection_s *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_activity_scope_state_s block;
  void (*v25)(uint64_t);
  void *v26;
  void *v27;
  double *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double __y;
  double *p_y;
  uint64_t v35;
  char v36;

  v6 = mach_absolute_time();
  v7 = _TMGetKernelMonotonicClock();
  if ((v6 & 0x8000000000000000) != 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), CFSTR("TMClient.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machTimestamp <= INT64_MAX"));
  }
  if (a3 <= 0.0)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), CFSTR("TMClient.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uncertainty > 0.0"));
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (a1)
  {
    v9 = 0x40D5180000000000;
    if ((objc_msgSend(a1, "isEqualToString:", CFSTR("LocationServer")) & 1) != 0
      || (objc_msgSend(a1, "isEqualToString:", CFSTR("HarvestServer")) & 1) != 0
      || (objc_msgSend(a1, "isEqualToString:", CFSTR("iTunesStoreServer")) & 1) != 0
      || (objc_msgSend(a1, "isEqualToString:", CFSTR("GPS")) & 1) != 0
      || (v9 = 0x40AC200000000000, (objc_msgSend(a1, "isEqualToString:", CFSTR("NITZ")) & 1) != 0)
      || (objc_msgSend(a1, "isEqualToString:", CFSTR("CDMA")) & 1) != 0)
    {
      __y = 0.0;
      p_y = &__y;
      v35 = 0x2020000000;
      v36 = 0;
      v10 = _TMConnectionQueue();
      block.opaque[0] = MEMORY[0x1E0C809B0];
      block.opaque[1] = 3221225472;
      v25 = ___shouldThrottle_block_invoke;
      v26 = &unk_1E664F0D0;
      v29 = v7;
      v30 = a2;
      v31 = a3;
      v32 = v9;
      v27 = a1;
      v28 = &__y;
      dispatch_sync(v10, &block);
      v11 = *((unsigned __int8 *)p_y + 24);
      _Block_object_dispose(&__y, 8);
      if (v11)
        goto LABEL_25;
    }
    else
    {
      __y = 0.0;
      p_y = &__y;
      v35 = 0x2020000000;
      v36 = 0;
      _Block_object_dispose(&__y, 8);
    }
    v12 = _os_activity_create(&dword_1B39B6000, "TMSetSourceTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v12, &block);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v13, "TMCommand", "TMSetSourceTime");
    xpc_dictionary_set_string(v13, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
    xpc_dictionary_set_double(v13, "TMCurrentTime", a2);
    xpc_dictionary_set_double(v13, "TMTimeError", a3);
    xpc_dictionary_set_int64(v13, "TMMachTime", v6);
    if (a2 >= 9223372040.0)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
    }
    if (a2 <= -9223372040.0)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
    }
    __y = 0.0;
    v14 = modf(a2, &__y);
    xpc_dictionary_set_int64(v13, "TMAbsoluteNanoTime", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y);
    if (a3 >= 9223372040.0)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
    }
    if (a3 <= -9223372040.0)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
    }
    __y = 0.0;
    v15 = modf(a3, &__y);
    xpc_dictionary_set_int64(v13, "TMNanoTimeError", llround(v15 * 1000000000.0) + 1000000000 * (uint64_t)__y);
    if (xpc_dictionary_get_value(v13, "TMRtcTime") && xpc_dictionary_get_double(v13, "TMRtcTime") <= 0.5)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), CFSTR("TMClient.m"), 169, CFSTR("Invalid RTC bear trap."));
    }
    v16 = (_xpc_connection_s *)_TMCopyConnection(0);
    xpc_connection_send_message(v16, v13);
    xpc_release(v13);
    _TMReleaseConnection(v16);
    os_activity_scope_leave(&block);

  }
LABEL_25:

}

void sub_1B39B8508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TMSetAuthenticatedSourceTime(__CFString *a1, double a2, double a3)
{
  NSObject *v6;
  xpc_object_t v7;
  uint64_t v8;
  long double v9;
  long double v10;
  _xpc_connection_s *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_activity_scope_state_s state;
  double __y;

  if (CFStringCompare(a1, CFSTR("APNS"), 0) == kCFCompareEqualTo)
    a3 = a3 + 5.0;
  v6 = _os_activity_create(&dword_1B39B6000, "TMSetAuthenticatedSourceTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetAuthenticatedSourceTime");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)-[__CFString UTF8String](a1, "UTF8String"));
  xpc_dictionary_set_double(v7, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v7, "TMTimeError", a3);
  v8 = mach_absolute_time();
  xpc_dictionary_set_int64(v7, "TMMachTime", v8);
  if (a2 >= 9223372040.0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  }
  if (a2 <= -9223372040.0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  }
  __y = 0.0;
  v9 = modf(a2, &__y);
  xpc_dictionary_set_int64(v7, "TMAbsoluteNanoTime", llround(v9 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (a3 >= 9223372040.0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  __y = 0.0;
  v10 = modf(a3, &__y);
  xpc_dictionary_set_int64(v7, "TMNanoTimeError", llround(v10 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetAuthenticatedSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), CFSTR("TMClient.m"), 188, CFSTR("Invalid RTC bear trap."));
  }
  v11 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v11, v7);
  xpc_release(v7);
  _TMReleaseConnection(v11);
  os_activity_scope_leave(&state);

}

void TMSetTestSourceTime(void *a1, double a2, double a3, double a4)
{
  uint64_t v8;
  double v9;
  id v10;
  NSObject *v11;
  xpc_object_t v12;
  long double v13;
  long double v14;
  _xpc_connection_s *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_activity_scope_state_s state;
  double __y;

  v8 = mach_absolute_time();
  v9 = _TMGetKernelMonotonicClock();
  if ((v8 & 0x8000000000000000) != 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), CFSTR("TMClient.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machTimestamp <= INT64_MAX"));
  }
  if (a3 <= 0.0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), CFSTR("TMClient.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uncertainty > 0.0"));
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v11 = _os_activity_create(&dword_1B39B6000, "TMSetSourceTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "TMCommand", "TMSetSourceTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
  xpc_dictionary_set_double(v12, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v12, "TMTimeError", a3);
  xpc_dictionary_set_double(v12, "TMRtcTime", v9 + a4);
  if (a2 >= 9223372040.0)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  }
  if (a2 <= -9223372040.0)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  }
  __y = 0.0;
  v13 = modf(a2, &__y);
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (a3 >= 9223372040.0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  __y = 0.0;
  v14 = modf(a3, &__y);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), CFSTR("TMClient.m"), 212, CFSTR("Invalid RTC bear trap."));
  }
  v15 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v15, v12);
  xpc_release(v12);
  _TMReleaseConnection(v15);
  os_activity_scope_leave(&state);

}

void TMSetSourceAvailable(void *a1)
{
  double v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  xpc_object_t v6;
  _xpc_connection_s *v7;
  void *v8;
  os_activity_scope_state_s state;
  _QWORD block[5];

  v2 = _TMGetKernelMonotonicClock();
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __TMSetSourceAvailable_block_invoke;
  block[3] = &unk_1E664EF58;
  block[4] = a1;
  dispatch_sync(v4, block);
  v5 = _os_activity_create(&dword_1B39B6000, "TMSetSourceAvailable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceAvailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceAvailable(CFStringRef)"), CFSTR("TMClient.m"), 232, CFSTR("Invalid RTC bear trap."));
  }
  v7 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);

}

void TMSetSourceUnavailable(void *a1)
{
  double v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  xpc_object_t v6;
  _xpc_connection_s *v7;
  void *v8;
  os_activity_scope_state_s state;
  _QWORD block[5];

  v2 = _TMGetKernelMonotonicClock();
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __TMSetSourceUnavailable_block_invoke;
  block[3] = &unk_1E664EF58;
  block[4] = a1;
  dispatch_sync(v4, block);
  v5 = _os_activity_create(&dword_1B39B6000, "TMSetSourceUnavailable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceUnavailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetSourceUnavailable(CFStringRef)"), CFSTR("TMClient.m"), 253, CFSTR("Invalid RTC bear trap."));
  }
  v7 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);

}

void TMSetManualTime(double a1)
{
  uint64_t v2;
  NSObject *v3;
  xpc_object_t v4;
  long double v5;
  _xpc_connection_s *v6;
  void *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s state;
  double __y;

  v2 = mach_absolute_time();
  v3 = _os_activity_create(&dword_1B39B6000, "TMSetManualTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetManualTime");
  xpc_dictionary_set_double(v4, "TMCurrentTime", a1);
  xpc_dictionary_set_int64(v4, "TMMachTime", v2);
  if (a1 >= 9223372040.0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a1);
  }
  if (a1 <= -9223372040.0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a1);
  }
  __y = 0.0;
  v5 = modf(a1, &__y);
  xpc_dictionary_set_int64(v4, "TMAbsoluteNanoTime", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetManualTime(CFAbsoluteTime)"), CFSTR("TMClient.m"), 279, CFSTR("Invalid RTC bear trap."));
  }
  v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v6, v4);
  xpc_release(v4);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&state);

}

void TMSetAutomaticTimeEnabled(int a1)
{
  double v2;
  NSObject *v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v2 = _TMGetKernelMonotonicClock();
  v3 = _os_activity_create(&dword_1B39B6000, "TMSetAutomaticTimeEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetAutomaticTimeEnabled(Boolean)"), CFSTR("TMClient.m"), 289, CFSTR("Invalid RTC bear trap."));
  }
  v5 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);

}

void TMFetchNTP()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  void *v3;
  os_activity_scope_state_s v4;

  v0 = _os_activity_create(&dword_1B39B6000, "TMFetchNTP", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v0, &v4);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMFetchNTP");
  if (xpc_dictionary_get_value(v1, "TMRtcTime") && xpc_dictionary_get_double(v1, "TMRtcTime") <= 0.5)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMFetchNTP(void)"), CFSTR("TMClient.m"), 293, CFSTR("Invalid RTC bear trap."));
  }
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v4);

}

BOOL TMIsAutomaticTimeEnabled()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  _BOOL8 v4;
  os_activity_scope_state_s v6;

  v0 = _os_activity_create(&dword_1B39B6000, "TMIsAutomaticTimeEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeEnabled");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3)
    return 0;
  v4 = MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeEnabled");
  xpc_release(v3);
  return v4;
}

void TMSetAutomaticTimeZoneEnabled(int a1)
{
  double v2;
  NSObject *v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v2 = _TMGetKernelMonotonicClock();
  v3 = _os_activity_create(&dword_1B39B6000, "TMSetAutomaticTimeZoneEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeZoneEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeZoneEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMSetAutomaticTimeZoneEnabled(Boolean)"), CFSTR("TMClient.m"), 317, CFSTR("Invalid RTC bear trap."));
  }
  v5 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);

}

BOOL TMIsAutomaticTimeZoneEnabled()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  _BOOL8 v4;
  os_activity_scope_state_s v6;

  v0 = _os_activity_create(&dword_1B39B6000, "TMIsAutomaticTimeZoneEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeZoneEnabled");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3)
    return 0;
  v4 = MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeZoneEnabled");
  xpc_release(v3);
  return v4;
}

BOOL TMIsTimeZoneConfirmed()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  _BOOL8 v4;
  os_activity_scope_state_s v6;

  v0 = _os_activity_create(&dword_1B39B6000, "TMIsTimeZoneConfirmed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsTimeZoneConfirmed");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3)
    return 0;
  v4 = MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v3, "TMTimeZoneConfirmed");
  xpc_release(v3);
  return v4;
}

void TMConfirmTimeZone()
{
  double v0;
  NSObject *v1;
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  os_activity_scope_state_s v5;

  v0 = _TMGetKernelMonotonicClock();
  v1 = _os_activity_create(&dword_1B39B6000, "TMConfirmTimeZone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v1, &v5);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "TMCommand", "TMConfirmTimeZone");
  xpc_dictionary_set_double(v2, "TMRtcTime", v0);
  if (xpc_dictionary_get_value(v2, "TMRtcTime") && xpc_dictionary_get_double(v2, "TMRtcTime") <= 0.5)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMConfirmTimeZone(void)"), CFSTR("TMClient.m"), 357, CFSTR("Invalid RTC bear trap."));
  }
  v3 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v3, v2);
  xpc_release(v2);
  _TMReleaseConnection(v3);
  os_activity_scope_leave(&v5);

}

double TMGetBAFinderTime()
{
  double v0;
  NSObject *v1;
  xpc_object_t v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  os_activity_scope_state_s v6;

  v0 = 0.0;
  if (!TMIsAutomaticTimeEnabled())
  {
    v1 = _os_activity_create(&dword_1B39B6000, "TMGetBAFinderTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v1, &v6);
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "TMCommand", "TMGetBAFinderTime");
    v3 = (_xpc_connection_s *)_TMCopyConnection(0);
    v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
    xpc_release(v2);
    _TMReleaseConnection(v3);
    os_activity_scope_leave(&v6);

    if (v4)
    {
      if (MEMORY[0x1B5E2AE70](v4) == MEMORY[0x1E0C812F8])
        v0 = xpc_dictionary_get_double(v4, "TMCurrentTime");
      xpc_release(v4);
    }
  }
  return v0;
}

uint64_t TMGetRTCResetCount()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t uint64;
  os_activity_scope_state_s v6;

  v0 = _os_activity_create(&dword_1B39B6000, "TMGetRTCResetCount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetRTCResetCount");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3)
    return 0;
  if (MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8])
    uint64 = xpc_dictionary_get_uint64(v3, "TMRTCResetCount");
  else
    uint64 = 0;
  xpc_release(v3);
  return uint64;
}

BOOL TMIsBBTimeActive()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  _BOOL8 v4;
  os_activity_scope_state_s v6;

  v0 = _os_activity_create(&dword_1B39B6000, "TMIsBBTimeActive", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsBBTimeActive");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3)
    return 0;
  v4 = MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v3, "TMBBTimeActive");
  xpc_release(v3);
  return v4;
}

void TMProvideBBTime(unint64_t a1, uint64_t a2, int64_t a3, int64_t a4, void *a5)
{
  void *v10;
  NSObject *v11;
  xpc_object_t v12;
  _xpc_connection_s *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_activity_scope_state_s state;

  v10 = (void *)MEMORY[0x1B5E2ACB4]();
  if (a1 > a2)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), CFSTR("TMClient.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("apMachTimeBefore <= apMachTimeAfter"));
  }
  if (mach_absolute_time() < a2)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), CFSTR("TMClient.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("apMachTimeAfter <= mach_absolute_time()"));
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_10:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), CFSTR("TMClient.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("apMachTimeAfter <= INT64_MAX"));
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_10;
LABEL_5:
  v11 = _os_activity_create(&dword_1B39B6000, "TMProvideBBTime", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "TMCommand", "TMProvideBBTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)objc_msgSend(a5, "UTF8String"));
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", a3);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", a4);
  xpc_dictionary_set_int64(v12, "TMMachTime", a1);
  xpc_dictionary_set_int64(v12, "TMMachTimeAfter", a2);
  xpc_dictionary_set_double(v12, "TMCurrentTime", (double)(a3 % 1000000000) / 1000000000.0 + (double)(a3 / 1000000000));
  xpc_dictionary_set_double(v12, "TMTimeError", (double)(a4 % 1000000000) / 1000000000.0 + (double)(a4 / 1000000000));
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), CFSTR("TMClient.m"), 498, CFSTR("Invalid RTC bear trap."));
  }
  v13 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v13, v12);
  xpc_release(v12);
  _TMReleaseConnection(v13);
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v10);
}

void TMSetupTime(NSObject *a1, uint64_t a2, double a3)
{
  _xpc_connection_s *v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD block[7];
  _QWORD handler[8];
  _QWORD v14[3];
  char v15;

  v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTime");
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  dispatch_retain(a1);
  v8 = _TMConnectionQueue();
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __TMSetupTime_block_invoke;
  handler[3] = &unk_1E664EFA8;
  handler[6] = a2;
  handler[7] = v14;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v11 = _TMConnectionQueue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __TMSetupTime_block_invoke_3;
  block[3] = &unk_1E664EFF8;
  block[5] = a2;
  block[6] = v14;
  block[4] = a1;
  dispatch_after(v10, v11, block);
  _Block_object_dispose(v14, 8);
}

void sub_1B39BA320(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void TMSetupTimeZone(NSObject *a1, uint64_t a2, double a3)
{
  _xpc_connection_s *v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD block[7];
  _QWORD handler[8];
  _QWORD v14[3];
  char v15;

  v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTimeZone");
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  dispatch_retain(a1);
  v8 = _TMConnectionQueue();
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __TMSetupTimeZone_block_invoke;
  handler[3] = &unk_1E664EFA8;
  handler[6] = a2;
  handler[7] = v14;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v11 = _TMConnectionQueue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __TMSetupTimeZone_block_invoke_3;
  block[3] = &unk_1E664EFF8;
  block[5] = a2;
  block[6] = v14;
  block[4] = a1;
  dispatch_after(v10, v11, block);
  _Block_object_dispose(v14, 8);
}

void sub_1B39BA708(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void TMProvideCellularTimeZone(void *a1, int a2, int a3, unsigned int a4, unsigned int a5, double a6)
{
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  double v16;
  id v17;
  NSObject *v18;
  xpc_object_t v19;
  long double v20;
  _xpc_connection_s *v21;
  void *v22;
  void *v23;
  void *v24;
  os_activity_scope_state_s state;
  long double __y[13];

  if (a4 <= 2)
  {
    __y[1] = v9;
    __y[2] = v8;
    __y[11] = v6;
    __y[12] = v7;
    if (a5 <= 0x3E7)
    {
      v16 = _TMGetKernelMonotonicClock();
      v17 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v18 = _os_activity_create(&dword_1B39B6000, "TMProvideCellularTimeZone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v18, &state);
      v19 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v19, "TMCommand", "TMProvideCellularTimeZone");
      xpc_dictionary_set_string(v19, "TMSource", (const char *)objc_msgSend(a1, "UTF8String"));
      xpc_dictionary_set_double(v19, "TMCurrentTime", a6);
      if (a6 >= 9223372040.0)
      {
        v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a6);
      }
      if (a6 <= -9223372040.0)
      {
        v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a6);
      }
      __y[0] = 0.0;
      v20 = modf(a6, __y);
      xpc_dictionary_set_int64(v19, "TMAbsoluteNanoTime", llround(v20 * 1000000000.0) + 1000000000 * (uint64_t)__y[0]);
      xpc_dictionary_set_int64(v19, "TMTzOffset", a3);
      xpc_dictionary_set_int64(v19, "TMDstActive", a4);
      xpc_dictionary_set_int64(v19, "TMMcc", a5);
      xpc_dictionary_set_int64(v19, "TMCellSlot", a2);
      xpc_dictionary_set_double(v19, "TMRtcTime", v16);
      if (xpc_dictionary_get_value(v19, "TMRtcTime"))
      {
        if (xpc_dictionary_get_double(v19, "TMRtcTime") <= 0.5)
        {
          v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TMProvideCellularTimeZone(CFStringRef, int, CFAbsoluteTime, int, int, int)"), CFSTR("TMClient.m"), 638, CFSTR("Invalid RTC bear trap."));
        }
      }
      v21 = (_xpc_connection_s *)_TMCopyConnection(0);
      xpc_connection_send_message(v21, v19);
      xpc_release(v19);
      _TMReleaseConnection(v21);
      os_activity_scope_leave(&state);

    }
  }
}

CFStringRef TMCopyComputedTimeZone()
{
  NSObject *v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  CFStringRef v4;
  const char *string;
  os_activity_scope_state_s v7;

  v0 = _os_activity_create(&dword_1B39B6000, "TMGetComputedTimeZone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v0, &v7);
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetComputedTimeZone");
  v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v7);

  if (!v3)
    return 0;
  if (MEMORY[0x1B5E2AE70](v3) == MEMORY[0x1E0C812F8] && (string = xpc_dictionary_get_string(v3, "TMTimeZone")) != 0)
    v4 = CFStringCreateWithCString(0, string, 0x8000100u);
  else
    v4 = 0;
  xpc_release(v3);
  return v4;
}

uint64_t TMResetToFirstLaunch()
{
  NSObject *v0;
  _xpc_connection_s *mach_service;
  uint64_t v2;
  xpc_object_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[7];
  _QWORD handler[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[3];
  char v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v0 = _TMConnectionQueue();
  mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", v0, 0);
  v2 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __TMResetToFirstLaunch_block_invoke;
  handler[3] = &unk_1E664F020;
  handler[4] = &v9;
  handler[5] = &v13;
  handler[6] = v17;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "TMCommand", "TMResetToFirstLaunch");
  v4 = _TMConnectionQueue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __TMResetToFirstLaunch_block_invoke_2;
  v7[3] = &unk_1E664F048;
  v7[4] = mach_service;
  v7[5] = v3;
  v7[6] = v17;
  dispatch_async(v4, v7);
  while (!*((_BYTE *)v10 + 24) && !*((_BYTE *)v14 + 24))
    sleep(1u);
  xpc_release(mach_service);
  v5 = *((unsigned __int8 *)v14 + 24) ^ 1u;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v5;
}

void sub_1B39BAF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void ___shouldThrottle_block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  BOOL v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v14;
  double v15;

  if (_lastMessages)
  {
    v2 = (void *)objc_msgSend((id)_lastMessages, "objectForKey:", *(_QWORD *)(a1 + 32));
    if (v2)
    {
      v14 = 0uLL;
      v15 = 0.0;
      objc_msgSend(v2, "getValue:", &v14);
      v3 = *(double *)(a1 + 48) - *(double *)&v14;
      v4 = TMPropagateError(v15, v3);
      v5 = *((double *)&v14 + 1);
      v6 = TMGetKernelMonotonicClockResolution();
      if (*(double *)(a1 + 48) >= *(double *)&v14)
      {
        v7 = *(double *)(a1 + 64);
        v8 = v7 < v4 + -0.1 || v7 > v4 + 0.1;
        if (!v8 && v3 <= *(double *)(a1 + 72))
        {
          v9 = *(double *)(a1 + 56);
          v10 = vabdd_f64(v9, *((double *)&v14 + 1));
          v11 = v9 > v3 + v5 + v6 || v9 < v3 + v5 - v6;
          if (!v11 || v10 < 2.22044605e-16)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
  }
  else
  {
    _lastMessages = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    TMCFNotificationCenterAddObserver(DarwinNotifyCenter, CFSTR("TimedResetNotification"), 0, (CFNotificationSuspensionBehavior)0, &__block_literal_global);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = *(_OWORD *)(a1 + 48);
    v15 = *(double *)(a1 + 64);
    objc_msgSend((id)_lastMessages, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v14, "{?=ddd}"), *(_QWORD *)(a1 + 32));
  }
}

uint64_t ___shouldThrottle_block_invoke_2()
{
  NSObject *v0;

  v0 = _TMConnectionQueue();
  dispatch_async(v0, &__block_literal_global_77);
  return 1;
}

uint64_t ___shouldThrottle_block_invoke_3()
{
  return objc_msgSend((id)_lastMessages, "removeAllObjects");
}

uint64_t type metadata for __ObjC(unint64_t a1)
{
  if (a1 >= 0x1C)
    TMSourceNameFromSrc_cold_1();
  return (uint64_t)*off_1E664F270[a1];
}

uint64_t type metadata for UnsafeMutableBufferPointer(uint64_t a1)
{
  void *v2;

  if (TMSrcFromName_onceToken != -1)
    dispatch_once(&TMSrcFromName_onceToken, &__block_literal_global_0);
  v2 = (void *)objc_msgSend((id)TMSrcFromName_sMap, "objectForKeyedSubscript:", a1);
  if (v2)
    return objc_msgSend(v2, "unsignedIntegerValue");
  else
    return 27;
}

uint64_t TMCmdFromName(uint64_t a1)
{
  void *v2;

  if (TMCmdFromName_onceToken != -1)
    dispatch_once(&TMCmdFromName_onceToken, &__block_literal_global_86);
  v2 = (void *)objc_msgSend((id)TMCmdFromName_sMap, "objectForKeyedSubscript:", a1);
  if (v2)
    return objc_msgSend(v2, "unsignedIntegerValue");
  else
    return 23;
}

uint64_t TMDeviceHasPMU()
{
  if (TMDeviceHasPMU_token != -1)
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  return TMDeviceHasPMU_hasPMU;
}

double TMGetKernelMonotonicClockResolution()
{
  if (TMGetKernelMonotonicClockResolution_onceToken != -1)
    dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_162);
  return *(double *)&TMGetKernelMonotonicClockResolution_sInterval;
}

double _TMSyncKernelMonotonicClock(uint64_t *a1, double *a2)
{
  size_t v4;
  int v5;
  NSObject *v6;
  int *v7;
  int v8;
  char *v9;
  double v10;
  double v11;
  size_t v14;
  _BYTE buf[12];
  __int16 v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (TMDeviceHasPMU_token != -1)
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  if (TMDeviceHasPMU_hasPMU)
  {
    if (_TMSyncKernelMonotonicClock_onceToken != -1)
      dispatch_once(&_TMSyncKernelMonotonicClock_onceToken, &__block_literal_global_164);
    v4 = 16;
    if (!a1)
      v4 = 8;
    v14 = v4;
    v5 = 3;
    v6 = MEMORY[0x1E0C81028];
    while (sysctl((int *)&_TMSyncKernelMonotonicClock_mib, _TMSyncKernelMonotonicClock_miblen, &v18, &v14, 0, 0))
    {
      v7 = __error();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = *v7;
        v9 = strerror(v8);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v9;
        v16 = 1024;
        v17 = v8;
        _os_log_error_impl(&dword_1B39B6000, v6, OS_LOG_TYPE_ERROR, "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n", buf, 0x12u);
      }
      if (!--v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          _TMSyncKernelMonotonicClock_cold_1();
          if (a1)
LABEL_26:
            *a1 = 0;
        }
        else if (a1)
        {
          goto LABEL_26;
        }
        v10 = -1.0;
        if (a2)
          *a2 = -1.0;
        return v10;
      }
    }
    v11 = (double)v18;
    if (a2)
      *a2 = 0.0005;
    v10 = v11 / 1000000.0;
    if (v14 != 16)
    {
      v19 = mach_absolute_time();
      v10 = v10 + *(double *)&_TMSyncKernelMonotonicClock_halfResolution;
      if (a2)
        *a2 = *(double *)&_TMSyncKernelMonotonicClock_halfResolution + *a2;
    }
    if (a1)
      *a1 = v19;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v18 = 0;
    mach_get_times();
    if (a1)
      *a1 = *(_QWORD *)buf;
    return TMConvertTicksToSeconds(v18);
  }
  return v10;
}

uint64_t _TMKernelMonotonicClockOffset(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (TMDeviceHasPMU_token != -1)
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  if (!TMDeviceHasPMU_hasPMU)
  {
    mach_get_times();
    return -(uint64_t)TMConvertTicksToNanoTime(0);
  }
  if (a1 < 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    _TMKernelMonotonicClockOffset_cold_3(a1);
  v6 = a1 / 1000;
  if (_TMKernelMonotonicClockOffset_onceToken != -1)
    dispatch_once(&_TMKernelMonotonicClockOffset_onceToken, &__block_literal_global_165);
  v7 = 0;
  v5 = 8;
  if ((unint64_t)(a1 + 999) >= 0x7CF)
    v2 = &v6;
  else
    v2 = 0;
  if (sysctl((int *)&_TMKernelMonotonicClockOffset_mib, _TMKernelMonotonicClockOffset_miblen, &v7, (size_t *)&v5, v2, 8 * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _TMKernelMonotonicClockOffset_cold_2();
  }
  else
  {
    v4 = v5;
    if (v5 == 8)
      return 1000 * v7;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _TMKernelMonotonicClockOffset_cold_1(v4);
  }
  return 0;
}

unint64_t TMConvertTicksToNanoTime(unint64_t a1)
{
  unsigned int v2;
  unint64_t v3;
  uint8_t v5[16];

  v2 = TMConvertTicksToNanoTime_numer;
  if (!TMConvertTicksToNanoTime_numer)
  {
    TMGetMachTimebase((uint32_t *)&TMConvertTicksToNanoTime_numer, (uint32_t *)&TMConvertTicksToNanoTime_denom);
    v2 = TMConvertTicksToNanoTime_numer;
    if (!TMConvertTicksToNanoTime_numer)
      TMConvertTicksToNanoTime_cold_1();
    if (!TMConvertTicksToNanoTime_denom)
      TMConvertTicksToNanoTime_cold_2();
  }
  if (is_mul_ok(v2, a1))
  {
    v3 = v2 * a1 / TMConvertTicksToNanoTime_denom;
    if ((v3 & 0x8000000000000000) != 0)
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B39B6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio", v5, 2u);
      v2 = TMConvertTicksToNanoTime_numer;
    }
    return a1 / (TMConvertTicksToNanoTime_denom / v2);
  }
  return v3;
}

BOOL TMIsValidTime(double a1)
{
  BOOL v2;

  if (a1 >= -1.0 && a1 <= 1.0)
    return 0;
  v2 = -1.0 - *MEMORY[0x1E0C9ADF8] > a1 || 1.0 - *MEMORY[0x1E0C9ADF8] < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10)
    return 0;
  if (1.0 - *MEMORY[0x1E0C9ADE8] < a1)
    return 1;
  return -1.0 - *MEMORY[0x1E0C9ADE8] > a1;
}

BOOL TMIsValidNetworkOffset(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL TMIsValidMcc(unsigned int a1)
{
  return a1 < 0x3E8;
}

double TMCFAbsoluteTimeToTimeval(uint64_t *a1, long double a2)
{
  double result;

  TMCFTimeIntervalToTimeval((uint64_t)a1, a2);
  result = *MEMORY[0x1E0C9ADF8] + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t TMCFTimeIntervalToTimeval(uint64_t a1, long double a2)
{
  double v3;
  uint64_t result;
  BOOL v5;
  BOOL v6;
  double __y;

  __y = 0.0;
  v3 = modf(a2, &__y);
  result = 0;
  if (fabs(__y) != INFINITY)
  {
    if (__y < 9.22337204e18)
    {
      v6 = __y == -9.22337204e18;
      v5 = __y >= -9.22337204e18;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    if (!v6 && v5)
    {
      *(_QWORD *)a1 = (uint64_t)__y;
      *(_DWORD *)(a1 + 8) = (int)(v3 * 1000000.0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double TMTimevalToCFAbsoluteTime(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)*MEMORY[0x1E0C9ADF8]);
}

double TMPropagateError(double a1, double a2)
{
  if (a2 < 0.0)
    a2 = -a2;
  return a1 + a2 * 0.00002;
}

uint64_t TMCalculateGCD(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (!(_DWORD)a2)
    return a1;
  do
  {
    v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while ((_DWORD)a2);
  return v2;
}

uint64_t TMGetMachTimebase(uint32_t *a1, uint32_t *a2)
{
  uint64_t result;
  uint32_t denom;
  uint32_t v6;
  uint32_t numer;
  uint32_t v8;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
    TMGetMachTimebase_cold_1();
  denom = info.denom;
  if (info.denom)
  {
    v6 = info.denom;
    numer = info.numer;
    do
    {
      v8 = v6;
      v6 = numer % v6;
      numer = v8;
    }
    while (v6);
  }
  else
  {
    v8 = info.numer;
  }
  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double TMElapsedIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 >= a1)
    return TMConvertTicksToSeconds(a2 - a1);
  else
    return -TMConvertTicksToSeconds(a1 - a2);
}

double TMCalculateMachTimeIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1)
    return TMConvertTicksToSeconds(a1 - a2);
  else
    return TMConvertTicksToSeconds(a2 - a1);
}

void TMCFNotificationCenterAddObserver(__CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  void *v9;
  void *v10;

  v9 = _Block_copy(aBlock);
  v10 = _Block_copy(v9);
  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)_notificationHandlerCallback, a2, a3, a4);
}

void _notificationHandlerCallback(__CFNotificationCenter *a1, uint64_t (**a2)(_QWORD, _QWORD), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(_QWORD, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_5()
{
  return __error();
}

int *OUTLINED_FUNCTION_6()
{
  return __error();
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

uint64_t _TMConnectionQueue()
{
  if (_TMConnectionQueue_sPred != -1)
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  return _TMConnectionQueue_sConnectionQueue;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void TMSourceNameFromSrc_cold_1()
{
  __assert_rtn("TMSourceNameFromSrc", "TMUtilities.m", 76, "0 && \"input not a valid enumerant\"");
}

void _TMGetKernelMonotonicClock_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1B39B6000, MEMORY[0x1E0C81028], v1, "Error occurred %d %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _TMGetKernelMonotonicClock_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B39B6000, MEMORY[0x1E0C81028], a3, "CoreTime: error occurred, no mib to monotonicclock_usecs conversion\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void _TMSyncKernelMonotonicClock_cold_1()
{
  _DWORD v0[2];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl(&dword_1B39B6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n", (uint8_t *)v0, 8u);
  OUTLINED_FUNCTION_4();
}

void _TMKernelMonotonicClockOffset_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 134218240;
  v2 = 8;
  v3 = 2048;
  v4 = a1;
  _os_log_error_impl(&dword_1B39B6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n", (uint8_t *)&v1, 0x16u);
}

void _TMKernelMonotonicClockOffset_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1B39B6000, MEMORY[0x1E0C81028], v1, "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _TMKernelMonotonicClockOffset_cold_3(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_1B39B6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Applying unlikely time offset: %lld", (uint8_t *)&v1, 0xCu);
}

void TMConvertTicksToNanoTime_cold_1()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void TMConvertTicksToNanoTime_cold_2()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void TMGetMachTimebase_cold_1()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

void panic(const char *a1, ...)
{
  MEMORY[0x1E0C84AD0](a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1E0C857B0](a1, a2, a3);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

