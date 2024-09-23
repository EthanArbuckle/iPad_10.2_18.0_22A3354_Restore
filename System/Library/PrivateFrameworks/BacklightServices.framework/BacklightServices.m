id bls_scenes_log()
{
  if (bls_scenes_log_onceToken != -1)
    dispatch_once(&bls_scenes_log_onceToken, &__block_literal_global_13_0);
  return (id)bls_scenes_log___logger;
}

void sub_1B0C77370(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __bls_scenes_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "scenes");
  v1 = (void *)bls_scenes_log___logger;
  bls_scenes_log___logger = (uint64_t)v0;

}

uint64_t BLSBacklightFBSSceneEnvironmentDeltaDescription(unsigned int a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ visualState:%u date:%u active:%u blanked:%u seed:%u }"), (a1 >> 3) & 1, (a1 >> 4) & 1, (a1 >> 1) & 1, (a1 >> 2) & 1, (a1 >> 5) & 1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

_DWORD *BLSStateDataWithTitleDescriptionAndHints(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  void *v5;
  id v6;
  _DWORD *v7;
  void *v8;
  size_t v9;
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  if (!v3 || !-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("<nil title>");
  }
  if (!v4
    || !objc_msgSend(v4, "length")
    || !objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v4, 200))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no descriptive state data or state data is not in property list format, please file a radar, description = %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;

    if (!v5)
      goto LABEL_8;
LABEL_10:
    v9 = objc_msgSend(v5, "length");
    v7 = malloc_type_calloc(1uLL, v9 + 200, 0x3693A2F2uLL);
    *v7 = 1;
    v7[1] = v9;
    -[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v9);
    goto LABEL_11;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
    goto LABEL_10;
LABEL_8:
  v7 = malloc_type_calloc(1uLL, 0xC8uLL, 0xA1CF3351uLL);
LABEL_11:

  return v7;
}

BOOL BLSBacklightStateIsActive(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

const __CFString *NSStringFromBLSBacklightState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Off");
  else
    return off_1E621A5D0[a1 - 1];
}

const __CFString *NSStringFromBLSFlipbookState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Off");
  else
    return off_1E621A5A8[a1 - 1];
}

__CFString *NSStringFromBLSBacklightChangeEvents(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v6 = objc_msgSend(v4, "count");
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "previousState");
    v10 = objc_msgSend(v8, "state");
    v11 = (void *)objc_opt_new();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke;
    v21[3] = &unk_1E621A538;
    v24 = v5;
    v25 = v9;
    v26 = v10;
    v13 = v11;
    v22 = v13;
    v23 = v3;
    objc_msgSend(v13, "appendCustomFormatWithName:block:", 0, v21);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aborted:(%u){"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_3;
      v18[3] = &unk_1E621A3B8;
      v19 = v4;
      v20 = v13;
      objc_msgSend(v20, "appendBodySectionWithOpenDelimiter:closeDelimiter:block:", v14, CFSTR("} "), v18);

    }
    objc_msgSend(v13, "description");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6)
    {
      bls_backlight_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        NSStringFromBLSBacklightChangeEvents_cold_1((uint64_t)v3, (uint64_t)v4, v16);

    }
    v15 = CFSTR("<NULL>");
  }

  return v15;
}

void sub_1B0C7BCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0C7BFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

unint64_t BLSUInt64Distance(unint64_t a1, unint64_t a2)
{
  if (a1 <= a2)
    return a2 - a1;
  else
    return a1 - a2;
}

BOOL BLSUInt64ApproximatelyEqualToUInt64(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;

  v3 = a2 - a1;
  if (a1 > a2)
    v3 = a1 - a2;
  return v3 < a3;
}

uint64_t BLSCompareUInt64(unint64_t a1, unint64_t a2)
{
  if (a1 < a2)
    return -1;
  else
    return a2 < a1;
}

uint64_t BLSCompareUInt64WithTolerance(unint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3 + a1 < a2)
    return -1;
  else
    return a3 + a2 < a1;
}

void sub_1B0C7CF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0C7D034(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B0C7D430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

unint64_t BLSMachTimeFromNSTimeInterval(double a1)
{
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1)
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_62);
  return (unint64_t)(a1 / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale);
}

id BLSLoggingStringForContinuousMachTime(double a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v3, "bls_initWithMachContinuousTime:", (unint64_t)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%lf approx:%@"), *(_QWORD *)&a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BLSShortLoggingStringForContinuousMachTime(double a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v3, "bls_initWithMachContinuousTime:", (unint64_t)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%lf approx:%@"), *(_QWORD *)&a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BLSLoggingStringForMachTime(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v3, "bls_initWithMachContinuousTime:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%llu approx:%@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BLSShortLoggingStringForMachTime(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v3, "bls_initWithMachContinuousTime:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%llu approx:%@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BLSLoggingStringForMachInterval(unint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu->%llu (%llu∆)"), a1, a2, BLSUInt64Distance(a2, a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "bls_initWithStartMachContinuousTime:endMachContinuousTime:", a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bls_shortLoggingString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ approx:%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t BLSShortLoggingStringForMachInterval(unint64_t a1, unint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu->%llu (%llu∆)"), a1, a2, BLSUInt64Distance(a2, a1));
}

uint64_t BLSMachContinuousTimeFromMachAbsoluteTime(uint64_t a1)
{
  mach_get_times();
  return a1;
}

void sub_1B0C80574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B0C8078C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B0C83044(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0C830B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0C8312C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0C831C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C83248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C83304(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C833B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0C834BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C83644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C83974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0C83C14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B0C840B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27,id a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,uint64_t a36,id a37)
{
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  BLSTimelineEntryBookkeeper::~BLSTimelineEntryBookkeeper(&a37);

  std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

void BLSTimelineEntryBookkeeper::~BLSTimelineEntryBookkeeper(id *this)
{

}

void sub_1B0C84618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1B0C849B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0C84CC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

id BLSTimelineEntriesCombiner::constructFrameSpecifiers(BLSTimelineEntriesCombiner *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  while (1)
  {
    BLSTimelineEntriesCombiner::nextSpecifier(this);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    v5 = (void *)*((_QWORD *)this + 4);
    objc_msgSend(v4, "presentationInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "compare:", v7);

    if (v8 == -1)
      break;
    v3 = v4;
    objc_msgSend(v2, "addObject:", v4);
  }

  return v2;
}

void sub_1B0C84DFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void BLSTimelineEntriesCombiner::~BLSTimelineEntriesCombiner(id *this)
{
  void **v2;

  v2 = this;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void sub_1B0C84FA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0C85100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0C851B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0C8524C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0C8579C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,void *a43,void *a44,void *a45,void *a46)
{
  void *v46;
  void *v47;

  _Unwind_Resume(a1);
}

void sub_1B0C85A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0C85B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0C85C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0C85D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0C8605C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B0C86158(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0C8623C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0C862F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0C8646C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0C86674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0C86948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0C86A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::__push_back_slow_path<BLSTimelineEntryBookkeeper>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v18[5];

  v3 = *a1;
  v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL)
    std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x1C71C71C71C71C7)
    v9 = 0x38E38E38E38E38ELL;
  else
    v9 = v5;
  v18[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](v7, v9);
  else
    v10 = 0;
  v11 = &v10[72 * v4];
  v18[0] = v10;
  v18[1] = v11;
  v18[3] = &v10[72 * v9];
  v12 = *a2;
  *a2 = 0u;
  *(_OWORD *)v11 = v12;
  v13 = a2[1];
  a2[1] = 0u;
  *((_OWORD *)v11 + 1) = v13;
  v14 = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = 0;
  *((_QWORD *)v11 + 4) = v14;
  v15 = *(__int128 *)((char *)a2 + 40);
  *(_OWORD *)(v11 + 49) = *(__int128 *)((char *)a2 + 49);
  *(_OWORD *)(v11 + 40) = v15;
  v18[2] = v11 + 72;
  std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(a1, v18);
  v16 = a1[1];
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)v18);
  return v16;
}

void sub_1B0C86B6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryBookkeeper>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6219B70, MEMORY[0x1E0DE42D0]);
}

void sub_1B0C86C44(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(72 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryBookkeeper>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t result;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  v7 = a7;
  result = a6;
  if (a3 != a5)
  {
    v9 = (_OWORD *)(a7 - 32);
    do
    {
      v10 = *(_OWORD *)(a3 - 72);
      a3 -= 72;
      *(_OWORD *)a3 = 0uLL;
      *(_OWORD *)((char *)v9 - 40) = v10;
      v11 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a3 + 16) = 0uLL;
      *(_OWORD *)((char *)v9 - 24) = v11;
      v12 = *(_QWORD *)(a3 + 32);
      *(_QWORD *)(a3 + 32) = 0;
      *((_QWORD *)v9 - 1) = v12;
      v13 = *(_OWORD *)(a3 + 40);
      *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)(a3 + 49);
      *v9 = v13;
      v9 = (_OWORD *)((char *)v9 - 72);
      v7 -= 72;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>(id *a1)
{

}

uint64_t std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 72;
    std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>((id *)(i - 72));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntrySpecifier *a2)
{
  BLSAlwaysOnTimelineEntrySpecifier *v3;
  BLSAlwaysOnTimelineEntrySpecifier *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  -[BLSAlwaysOnTimelineEntrySpecifier timelineEntry](v3, "timelineEntry");
  *((_QWORD *)this + 2) = objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnTimelineEntrySpecifier previousTimelineEntry](v3, "previousTimelineEntry");
  *((_QWORD *)this + 3) = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  *((_QWORD *)this + 4) = v4;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_BYTE *)this + 64) = 0;
  objc_msgSend(*((id *)this + 2), "presentationTime");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)this;
  *(_QWORD *)this = v5;

  v7 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;

}

void sub_1B0C86E60(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0C86F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t ___ZZ115__BLSAlwaysOnTimeline_entryBookkeepersForDateInterval_shouldConstructStartEntry_framesPerSecond_previousSpecifier__ENK3__2clEP36BLSAlwaysOnTimelineUnconfiguredEntry_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationTime");
}

id BLSTimelineEntryBookkeeper::entryFirstFramePresentationTime(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntry *a2, double a3)
{
  BLSTimelineEntryBookkeeper *v4;
  void *v5;
  double v6;
  uint64_t v7;

  v4 = this;
  -[BLSTimelineEntryBookkeeper presentationTime](v4, "presentationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BLSTimelineEntryBookkeeper isAnimated](v4, "isAnimated"))
  {
    -[BLSTimelineEntryBookkeeper duration](v4, "duration");
    objc_msgSend(v5, "dateByAddingTimeInterval:", -1.0 / a3 * (double)(vcvtad_u64_f64(v6 * a3) - 1));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

void sub_1B0C87018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___ZZ115__BLSAlwaysOnTimeline_entryBookkeepersForDateInterval_shouldConstructStartEntry_framesPerSecond_previousSpecifier__ENK3__2clEP36BLSAlwaysOnTimelineUnconfiguredEntry_block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  if (*(_QWORD *)(a1 + 48) == -1)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(**(id **)(a1 + 56), "endDate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    v1 = *(void **)(a1 + 32);
  }
  else
  {
    v1 = *(void **)(a1 + 40);
  }
  objc_msgSend(v1, "presentationTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - *a1) >> 3);
    if (v10 + 1 > 0x38E38E38E38E38ELL)
      std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
    v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v5 - *a1) >> 3);
    v12 = 2 * v11;
    if (2 * v11 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x1C71C71C71C71C7)
      v13 = 0x38E38E38E38E38ELL;
    else
      v13 = v12;
    v19 = v4;
    if (v13)
      v14 = (char *)std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](v4, v13);
    else
      v14 = 0;
    v15 = v14;
    v16 = &v14[72 * v10];
    v18 = &v14[72 * v13];
    std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>((uint64_t)v16, a2);
    v17 = v16 + 72;
    std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(a1, &v15);
    v9 = a1[1];
    result = std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    result = std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>(*(_QWORD *)(v4 - 8), a2);
    v9 = v7 + 72;
    a1[1] = v7 + 72;
  }
  a1[1] = v9;
  return result;
}

void sub_1B0C871AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntry *a2, BLSAlwaysOnTimelineEntry *a3, double a4)
{
  BLSAlwaysOnTimelineEntry *v7;
  BLSAlwaysOnTimelineEntry *v8;
  BLSAlwaysOnTimelineEntry *v9;
  BLSAlwaysOnTimelineEntry *v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v9 = v7;
  *((_QWORD *)this + 2) = v9;
  v10 = v8;
  *((_QWORD *)this + 3) = v10;
  *((_QWORD *)this + 4) = 0;
  *((double *)this + 5) = 1.0 / a4;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_BYTE *)this + 64) = 0;
  if (-[BLSAlwaysOnTimelineEntry isAnimated](v9, "isAnimated")
    && (-[BLSAlwaysOnTimelineEntry duration](v9, "duration"), v12 = vcvtad_u64_f64(v11 * a4), v12 >= 2))
  {
    *((_BYTE *)this + 64) = 1;
    *((_QWORD *)this + 6) = v12;
    *((_QWORD *)this + 7) = 1;
    BLSTimelineEntryBookkeeper::presentationTimeForIndex((id *)this, 1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)this;
    *(_QWORD *)this = v13;

    BLSTimelineEntryBookkeeper::presentationTimeForIndex((id *)this, 2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*((id *)this + 2), "presentationTime");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)this;
    *(_QWORD *)this = v16;

    v15 = 0;
  }
  v18 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v15;

}

void sub_1B0C872C8(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BLSTimelineEntryBookkeeper::presentationTimeForIndex(id *this, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(this[2], "presentationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*((_BYTE *)this + 64))
  {
    v6 = this[6];
    v7 = (unint64_t)v6 > a2;
    v8 = (unint64_t)v6 - a2;
    if (v7)
    {
      objc_msgSend(v4, "dateByAddingTimeInterval:", -(*((double *)this + 5) * (double)v8));
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }
  if ((unint64_t)this[6] >= a2)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

void sub_1B0C87390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(id *)a2;
  *(_QWORD *)(a1 + 8) = *(id *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(id *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(id *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 49);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = v4;
  return a1;
}

void std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 9;
        std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<BLSTimelineEntryIterator>::__push_back_slow_path<BLSTimelineEntryIterator>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v15[5];

  v3 = *a1;
  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x666666666666666)
    std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x333333333333333)
    v9 = 0x666666666666666;
  else
    v9 = v5;
  v15[4] = a1 + 2;
  v10 = (char *)std::allocator<BLSTimelineEntryIterator>::allocate_at_least[abi:ne180100](v7, v9);
  v11 = &v10[40 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[40 * v12];
  *v11 = *(_BYTE *)a2;
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(a2 + 8);
  *((_QWORD *)v11 + 3) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *((_QWORD *)v11 + 4) = *(_QWORD *)(a2 + 32);
  v15[2] = v11 + 40;
  std::vector<BLSTimelineEntryIterator>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer(v15);
  return v13;
}

void sub_1B0C87584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<BLSTimelineEntryIterator>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::allocator<BLSTimelineEntryIterator>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      v8 = *(_BYTE *)(a3 - 40);
      a3 -= 40;
      *(_BYTE *)(v7 - 40) = v8;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 + 8);
      *(_QWORD *)(v7 - 16) = *(_QWORD *)(a3 + 24);
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 32);
      v7 = *((_QWORD *)&v14 + 1) - 40;
      *((_QWORD *)&v14 + 1) -= 40;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = (void **)(v1 + 8);
    std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 40;
  }
}

void **std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer(void **a1)
{
  std::__split_buffer<BLSTimelineEntryIterator>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<BLSTimelineEntryIterator>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 40;
    v4 = (void **)(i - 32);
    std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

uint64_t BLSTimelineEntriesCombiner::BLSTimelineEntriesCombiner(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7;

  v7 = a3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  objc_msgSend(v7, "startDate");
  *(_QWORD *)(a1 + 24) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  *(_QWORD *)(a1 + 32) = objc_claimAutoreleasedReturnValue();
  *(double *)(a1 + 40) = 0.9 / a4;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  BLSTimelineEntriesCombiner::computeNextEntry((BLSTimelineEntriesCombiner *)a1);

  return a1;
}

void sub_1B0C878A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  void *v10;
  void **v11;

  a10 = v11;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&a10);

  _Unwind_Resume(a1);
}

void BLSTimelineEntriesCombiner::computeNextEntry(BLSTimelineEntriesCombiner *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BLSTimelineEntryIterator *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BLSTimelineEntryIterator *v9;
  void *v10;

  v1 = *(_QWORD *)this;
  v2 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 6) = *(_QWORD *)this;
  *((_QWORD *)this + 7) = v2;
  v3 = v1 + 40;
  if (v1 + 40 != v2)
  {
    v5 = (BLSTimelineEntryIterator *)(v1 + 40);
    while (1)
    {
      BLSTimelineEntryIterator::nextPresentationTime(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (!objc_msgSend(v6, "isBeforeDate:", v7))
          break;
      }
      v8 = *((_QWORD *)this + 6);
      *((_QWORD *)this + 6) = v3;
      *((_QWORD *)this + 7) = v8;
LABEL_13:

      v5 = (BLSTimelineEntryIterator *)((char *)v5 + 40);
      v3 += 40;
      if (v5 == *((BLSTimelineEntryIterator **)this + 1))
        return;
    }
    v9 = (BLSTimelineEntryIterator *)*((_QWORD *)this + 7);
    if (v9 == *((BLSTimelineEntryIterator **)this + 1))
    {
      v10 = 0;
    }
    else
    {
      BLSTimelineEntryIterator::nextPresentationTime(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && !objc_msgSend(v6, "isBeforeDate:", v10))
        goto LABEL_12;
    }
    *((_QWORD *)this + 7) = v3;
LABEL_12:

    goto LABEL_13;
  }
}

void sub_1B0C879C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BLSTimelineEntryIterator::nextPresentationTime(BLSTimelineEntryIterator *this)
{
  uint64_t v1;
  id v3;
  id *v4;

  v1 = *((_QWORD *)this + 4);
  if (v1 == *((_QWORD *)this + 2))
    goto LABEL_5;
  v3 = *(id *)(v1 + 8);
  if (!v3)
  {
    v4 = (id *)(*((_QWORD *)this + 4) + 72);
    if (v4 != *((id **)this + 2))
    {
      v3 = *v4;
      return v3;
    }
LABEL_5:
    v3 = 0;
  }
  return v3;
}

void std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void **v7;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 40;
        v7 = (void **)(v4 - 32);
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v7);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

BLSAlwaysOnFrameSpecifier *BLSTimelineEntriesCombiner::nextSpecifier(BLSTimelineEntriesCombiner *this)
{
  _BYTE *v1;
  _BYTE *i;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  BLSTimelineEntryIterator *v8;
  BLSTimelineEntryIterator *v9;
  void *v10;
  int v11;
  uint64_t v12;
  double v13;
  BLSAlwaysOnFrameSpecifier *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v1 = (_BYTE *)*((_QWORD *)this + 1);
  if (*((_BYTE **)this + 6) == v1)
  {
    v14 = 0;
    return v14;
  }
  for (i = *(_BYTE **)this; i != v1; i += 40)
    *i = 0;
  v4 = *((id *)this + 4);
  v5 = 0;
  while (1)
  {
    BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v6;
    if (!v5)
      break;
    if (!v6)
      goto LABEL_10;
    v8 = (BLSTimelineEntryIterator *)*((_QWORD *)this + 1);
    v9 = (BLSTimelineEntryIterator *)*((_QWORD *)this + 7);
    if (v9 != v8)
    {
      BLSTimelineEntryIterator::nextPresentationTime(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isAfterDate:", v10);

      if (v11)
      {
LABEL_10:
        BLSTimelineEntriesCombiner::computeNextEntry(this);
        BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v12;
        break;
      }
      v8 = (BLSTimelineEntryIterator *)*((_QWORD *)this + 1);
    }
    if (*((BLSTimelineEntryIterator **)this + 6) == v8)
    {
      v15 = v7;
      v7 = v4;
LABEL_27:

      v4 = v7;
      goto LABEL_28;
    }
LABEL_17:
    if (objc_msgSend(*((id *)this + 3), "compare:", v7) != -1)
    {
LABEL_18:
      v7 = v7;

      v5 = v7;
      goto LABEL_20;
    }
    objc_msgSend(v7, "timeIntervalSinceDate:", v5);
    if (v13 >= *((double *)this + 5))
    {
      v15 = v4;
      goto LABEL_27;
    }
LABEL_20:
    if (!BLSTimelineEntryIterator::advance(*((id ***)this + 6)))
      __assert_rtn("nextSpecifier", "BLSTimelineEntriesCombiner_Project.hpp", 271, "success == true");

  }
  if (v7 && *((_QWORD *)this + 6) != *((_QWORD *)this + 1))
  {
    if (!v5)
      goto LABEL_18;
    goto LABEL_17;
  }

  if (!v5)
  {
    v14 = 0;
    goto LABEL_30;
  }
LABEL_28:
  v16 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "laterDate:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v5, v17);

  BLSTimelineEntriesCombiner::entrySpecifiers(this);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
    __assert_rtn("nextSpecifier", "BLSTimelineEntriesCombiner_Project.hpp", 285, "[specifiers count] > 0");
  v14 = -[BLSAlwaysOnFrameSpecifier initWithTimelineEntrySpecifiers:presentationInterval:]([BLSAlwaysOnFrameSpecifier alloc], "initWithTimelineEntrySpecifiers:presentationInterval:", v19, v18);

LABEL_30:
  return v14;
}

void sub_1B0C87D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL BLSTimelineEntryIterator::advance(id **this)
{
  _BOOL8 v2;
  id v3;
  void *v4;
  id *v5;
  id *v6;

  if (BLSTimelineEntryBookkeeper::advance(this[4]))
  {
    v2 = 1;
    *(_BYTE *)this = 1;
  }
  else
  {
    v3 = *this[4];
    v4 = v3;
    v5 = this[4] + 9;
    this[4] = v5;
    v6 = this[2];
    v2 = v5 != v6;
    if (v5 != v6)
      *(_BYTE *)this = objc_msgSend(v3, "isEqual:", *v5) ^ 1;

  }
  return v2;
}

void sub_1B0C87DD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BLSTimelineEntriesCombiner::entrySpecifiers(BLSTimelineEntriesCombiner *this)
{
  void *v2;
  BLSTimelineEntryIterator *i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *(BLSTimelineEntryIterator **)this;
        i != *((BLSTimelineEntryIterator **)this + 1);
        i = (BLSTimelineEntryIterator *)((char *)i + 40))
  {
    BLSTimelineEntryIterator::entrySpecifier(i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      BLSTimelineEntryIterator::entrySpecifier(i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
  }
  return v2;
}

void sub_1B0C87E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL BLSTimelineEntryBookkeeper::advance(id *location)
{
  id v1;
  char *v3;
  char *v4;
  void *v5;
  id v6;

  v1 = location[1];
  if (v1)
  {
    v3 = (char *)location[6];
    v4 = (char *)location[7] + 1;
    location[7] = v4;
    if (v4 >= v3)
      *((_BYTE *)location + 64) = 0;
    objc_storeStrong(location, v1);
    BLSTimelineEntryBookkeeper::presentationTimeForIndex(location, (unint64_t)location[7] + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = location[1];
    location[1] = v5;

  }
  return v1 != 0;
}

BLSAlwaysOnTimelineEntrySpecifier *BLSTimelineEntryIterator::entrySpecifier(BLSTimelineEntryIterator *this)
{
  uint64_t v1;
  BLSAlwaysOnTimelineEntrySpecifier *v3;
  id v4;
  BLSAlwaysOnTimelineEntrySpecifier *v5;
  uint64_t v6;
  double v7;

  v1 = *((_QWORD *)this + 4);
  if (v1 == *((_QWORD *)this + 2))
  {
    v3 = 0;
  }
  else
  {
    v3 = (BLSAlwaysOnTimelineEntrySpecifier *)*(id *)(v1 + 32);
    if (!v3)
    {
      v4 = *(id *)(*((_QWORD *)this + 4) + 16);
      if (v4)
      {
        v5 = [BLSAlwaysOnTimelineEntrySpecifier alloc];
        v6 = *((_QWORD *)this + 4);
        if (*(_BYTE *)(v6 + 64))
          v7 = (double)*(unint64_t *)(v6 + 56) / (double)*(unint64_t *)(v6 + 48);
        else
          v7 = 1.0;
        v3 = -[BLSAlwaysOnTimelineEntrySpecifier initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:](v5, "initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:", v4, *(_QWORD *)(v6 + 24), *(unsigned __int8 *)this, v7);
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

void sub_1B0C87FD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromBLSAssertionAcquisitionState(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E621AAA0[a1];
}

id NSStringFromBLSAssertingObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __NSStringFromBLSAssertingObject_block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = v1;
  v12 = v2;
  v3 = v2;
  v4 = v1;
  objc_msgSend(v3, "appendProem:block:", v4, &v7);
  objc_msgSend(v3, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

const __CFString *NSStringFromBLSBacklightActivityState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Off/Inactive");
  if (a1 == 1)
    v1 = CFSTR("On/Active");
  if (a1 == 2)
    return CFSTR("Dimmed");
  else
    return v1;
}

const __CFString *NSStringFromBLSBacklightChangeSourceEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF)
    return CFSTR("Unknown");
  else
    return off_1E621AB00[a1 - 1];
}

const __CFString *NSStringFromBLSDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E621AB80[a1 - 1];
}

const __CFString *NSStringFromBLSAlwaysOnSuppressionType(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("Suppress");
  else
    return CFSTR("Unsuppress");
}

__CFString *NSStringFromBLSAlwaysOnSuppressionReason(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *result;
  void *v7;

  if (!a1)
  {
    v5 = CFSTR("Unknown");
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("ViewObstructed"));
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("SmartPowerNap"));
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 0x80000000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("DevicePresence"));
  if ((a1 & 0x80000000) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("ServiceStopped"));
LABEL_7:
  if ((a1 & 0xFFFFFFFF7FFFFFF8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(0x%lx)"), a1 & 0xFFFFFFFF7FFFFFF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[reasons count] > 0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSStringFromBLSAlwaysOnSuppressionReason_cold_1((uint64_t)v7);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t BLSEncode4Chars(void *a1, int a2)
{
  if ((int)(strlen((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String")) - a2) < 1)
    return 0;
  __memcpy_chk();
  return bswap32(0);
}

void sub_1B0C8DC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0C8DD88(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B0C8DF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1B0C8E584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = 2;
  if (!a1)
    v2 = a2;
  if (a1 == 2)
    return 3;
  else
    return v2;
}

uint64_t BLSBacklightActivityStateForBLSBacklightState(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  else
    return a1 == 2;
}

id bls_assertions_log()
{
  if (bls_assertions_log_onceToken != -1)
    dispatch_once(&bls_assertions_log_onceToken, &__block_literal_global_13);
  return (id)bls_assertions_log___logger;
}

void __bls_assertions_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "assertions");
  v1 = (void *)bls_assertions_log___logger;
  bls_assertions_log___logger = (uint64_t)v0;

}

id bls_backlight_log()
{
  if (bls_backlight_log_onceToken != -1)
    dispatch_once(&bls_backlight_log_onceToken, &__block_literal_global_3);
  return (id)bls_backlight_log___logger;
}

void __bls_backlight_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "backlight");
  v1 = (void *)bls_backlight_log___logger;
  bls_backlight_log___logger = (uint64_t)v0;

}

id bls_budget_log()
{
  if (bls_budget_log_onceToken != -1)
    dispatch_once(&bls_budget_log_onceToken, &__block_literal_global_5);
  return (id)bls_budget_log___logger;
}

void __bls_budget_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "budget");
  v1 = (void *)bls_budget_log___logger;
  bls_budget_log___logger = (uint64_t)v0;

}

id bls_diagnostics_log()
{
  if (bls_diagnostics_log_onceToken != -1)
    dispatch_once(&bls_diagnostics_log_onceToken, &__block_literal_global_7);
  return (id)bls_diagnostics_log___logger;
}

void __bls_diagnostics_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "diagnostics");
  v1 = (void *)bls_diagnostics_log___logger;
  bls_diagnostics_log___logger = (uint64_t)v0;

}

id bls_environment_log()
{
  if (bls_environment_log_onceToken != -1)
    dispatch_once(&bls_environment_log_onceToken, &__block_literal_global_9);
  return (id)bls_environment_log___logger;
}

void __bls_environment_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "environment");
  v1 = (void *)bls_environment_log___logger;
  bls_environment_log___logger = (uint64_t)v0;

}

id bls_flipbook_log()
{
  if (bls_flipbook_log_onceToken != -1)
    dispatch_once(&bls_flipbook_log_onceToken, &__block_literal_global_11);
  return (id)bls_flipbook_log___logger;
}

void __bls_flipbook_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "flipbook");
  v1 = (void *)bls_flipbook_log___logger;
  bls_flipbook_log___logger = (uint64_t)v0;

}

id bls_timelines_log()
{
  if (bls_timelines_log_onceToken != -1)
    dispatch_once(&bls_timelines_log_onceToken, &__block_literal_global_15);
  return (id)bls_timelines_log___logger;
}

void __bls_timelines_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BacklightServices", "timelines");
  v1 = (void *)bls_timelines_log___logger;
  bls_timelines_log___logger = (uint64_t)v0;

}

const __CFString *NSStringFromBLSAdjustedLuminance(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Off");
  if (a1 == 1)
    v1 = CFSTR("Low");
  if (a1 == 2)
    return CFSTR("Full");
  else
    return v1;
}

uint64_t BLSBacklightStateForVisuaState(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "adjustedLuminance");
  if (v2 == 2)
  {
    if (objc_msgSend(v1, "isDimmed"))
      v3 = 3;
    else
      v3 = 2;
  }
  else
  {
    v3 = v2 == 1;
  }

  return v3;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1B0C95B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 216), 8);
  _Block_object_dispose((const void *)(v40 - 184), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBLSUpdateFidelity(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 5)
    return off_1E621B128[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected fidelity value:%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringAbbreviatedFromBLSUpdateFidelity(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 5)
    return off_1E621B150[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("??%ld??"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void NSStringFromBLSBacklightChangeEvents_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "empty events array but abortedEventArray non-empty — events:%{public}@ abortedEvents:%{public}@", (uint8_t *)&v3, 0x16u);
}

void NSStringFromBLSAlwaysOnSuppressionReason_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull NSStringFromBLSAlwaysOnSuppressionReason(BLSAlwaysOnSuppressionReason)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("BLSBacklightChangeRequest.m");
  v7 = 1024;
  v8 = 571;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1B0C75000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1E0D01140]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary()
{
  return MEMORY[0x1E0D01150]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01158]();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return MEMORY[0x1E0D01170]();
}

uint64_t BSDeserializeCGPointFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011B8]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011C0]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01518]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01528]();
}

uint64_t BSSerializeCGPointToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01540]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01548]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x1E0D01640]();
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1E0C9A8A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E6219B88(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6219B90(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
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

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

