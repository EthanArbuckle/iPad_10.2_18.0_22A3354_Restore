void sub_21961F104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21961F2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void sub_21962013C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_219620F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_219625DA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2196272DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_21962783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219629928(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x3B8], 8);
  _Block_object_dispose(&STACK[0x3E8], 8);
  _Block_object_dispose(&STACK[0x418], 8);
  _Block_object_dispose(&STACK[0x448], 8);
  _Block_object_dispose(&STACK[0x468], 8);
  _Block_object_dispose(&STACK[0x488], 8);
  _Unwind_Resume(a1);
}

id _UserCharacteristicOfType(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id v10;

  v3 = a2;
  objc_msgSend(a1, "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "userCharacteristicForType:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      _UserCharacteristicOfType_cold_1();
  }

  return v6;
}

uint64_t _UserCharacteristicModificationDayOfType(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "userCharacteristicsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "modificationDateForCharacteristicWithType:error:", v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
    v11 = 1;
  else
    v11 = v10 == 0;
  if (!v11)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      _UserCharacteristicModificationDayOfType_cold_1();
  }
  v12 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v6);

  return v12;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_3_1(id a1, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return a1;
}

id OUTLINED_FUNCTION_5_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_10(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t result, float a2)
{
  uint64_t v2;
  uint64_t v3;

  *(float *)v2 = a2;
  *(_QWORD *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 2114;
  *(_QWORD *)(v2 + 14) = v3;
  return result;
}

void sub_21962C4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
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

void sub_21962EEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4_0(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_7(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_12_0(void *a1)
{
  return a1;
}

id OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return a2;
}

void sub_2196347C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219634DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219636AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2196376F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

id OUTLINED_FUNCTION_4_1(uint64_t a1, void *a2)
{
  return a2;
}

void sub_21963A820(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t HDMCLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x24BDD3BA8], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("4"), CFSTR("(01)00194253312512"), CFSTR("(01)00194253312529"));
}

uint64_t HDMCHeartRateInputLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x24BDD3BA8], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("4"), CFSTR("(01)00194253312512"), CFSTR("(01)00194253312529"));
}

uint64_t HDMCWristTemperatureInputLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x24BDD3BA8], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("4"), CFSTR("(01)00194253312512"), CFSTR("(01)00194253312529"));
}

const __CFString *NSStringFromHDMCOvulationConfirmationNotificationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("FeatureOff");
  else
    return off_24DB22490[a1 - 1];
}

void sub_21963C354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21963D11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_21963DC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
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

void sub_219642B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_219642C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_219642DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_219642E60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_219643068(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2196431FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2196433A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  void *v22;

  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a22 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_21964360C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_219643780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_219643924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_219643B68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DB215A0, MEMORY[0x24BEDAAF0]);
}

void sub_219643C04(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_219643CF4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_219644E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  void *v0;

  return objc_msgSend(v0, "stateType");
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return objc_opt_class();
}

void sub_21964C110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21964D0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t HDMCPregnancyStateQueryServer.objectTypes.getter()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_219654F34(0, (unint64_t *)&qword_253E60CE0, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2196856B0;
  sub_219654DFC(0, &qword_253E60C38);
  *(_QWORD *)(inited + 32) = MEMORY[0x219A30B58]((id)*MEMORY[0x24BDD29D8]);
  sub_219681AF0();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_5:
    v2 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  if (!*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  sub_219654520(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

id HDMCPregnancyStateQueryServer.__allocating_init(uuid:configuration:client:delegate:pregnancyManager:)(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_219654878(a1, (uint64_t)a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v12;
}

id HDMCPregnancyStateQueryServer.init(uuid:configuration:client:delegate:pregnancyManager:)(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;

  v8 = sub_219654878(a1, (uint64_t)a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v8;
}

uint64_t static HDMCPregnancyStateQueryServer.queryClass()()
{
  return sub_219654DFC(0, (unint64_t *)&unk_253E60C70);
}

Swift::Void __swiftcall HDMCPregnancyStateQueryServer._queue_start()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  objc_super v21;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_2196815BC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21.receiver = v1;
  v21.super_class = ObjectType;
  objc_msgSendSuper2(&v21, sel__queue_start);
  v7 = objc_msgSend(v1, sel_clientProxy);
  if (v7
    && (v8 = objc_msgSend(v7, sel_remoteObjectProxy),
        swift_unknownObjectRelease(),
        sub_219681C70(),
        swift_unknownObjectRelease(),
        sub_219654A28(),
        (swift_dynamicCast() & 1) != 0))
  {
    v9 = (void *)v20[1];
    v10 = objc_msgSend(v1, sel_configuration);
    objc_opt_self();
    v11 = (void *)swift_dynamicCastObjCClass();
    if (v11)
    {
      v12 = objc_msgSend(v11, sel_isRunningForMaintenance);
      v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager];
      objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_registerObserver_, v1);
      if (v12)
      {
        v14 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_registerObserver_, v1);
        v14 = 1;
      }
      sub_21966FA34(v14, 4);
      swift_unknownObjectRelease();
    }
    else
    {

      sub_219681A6C();
      v15 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v16 = (void *)sub_219681A48();
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v15, sel_initWithDomain_code_userInfo_, v16, 100, 0);

      v18 = (void *)sub_2196814CC();
      v19 = objc_msgSend(v1, sel_queryUUID);
      sub_2196815A4();

      v10 = (id)sub_21968158C();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      objc_msgSend(v9, sel_client_deliverError_forQuery_, v18, v10);
      swift_unknownObjectRelease();

    }
  }
  else
  {
    sub_219681DD8();
    __break(1u);
  }
}

void static HDMCPregnancyStateQueryServer.validate(_:client:)(uint64_t a1, void *a2)
{
  sub_219654A7C(a2);
}

Swift::Bool __swiftcall HDMCPregnancyStateQueryServer._shouldExecuteWhenProtectedDataIsUnavailable()()
{
  return 1;
}

void *static HDMCPregnancyStateQueryServer.createTaskServer(with:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37[4];
  _OWORD v38[2];
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;

  v6 = sub_2196815BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a3, sel_profile);
  v11 = objc_msgSend(v10, sel_profileType);

  if (v11 != (id)1)
  {
    v14 = (void *)objc_opt_self();
    v39 = 0;
    v40 = 0xE000000000000000;
    sub_219681D48();
    sub_219681A9C();
    sub_219681F34();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    sub_219681A9C();
    v15 = objc_msgSend(a3, sel_profile);
    v16 = objc_msgSend(v15, sel_profileType);

    *(_QWORD *)&v38[0] = v16;
    sub_219681E44();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    v17 = (void *)v40;
    v18 = (void *)sub_219681A48();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v14, sel_hk_error_description_, 3, v18);
LABEL_14:
    v19;

    swift_willThrow();
    return v17;
  }
  v37[0] = v7;
  v12 = objc_msgSend(a3, sel_profile);
  v13 = objc_msgSend(v12, sel_profileExtensionWithIdentifier_, *MEMORY[0x24BE46AC8]);

  if (v13)
  {
    sub_219681C70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v38, 0, sizeof(v38));
  }
  v20 = a2;
  v21 = a1;
  sub_219654C14((uint64_t)v38, (uint64_t)&v39);
  if (!v41)
  {
    sub_219654C74((uint64_t)&v39);
    goto LABEL_13;
  }
  v22 = (uint64_t)v9;
  sub_219654DFC(0, &qword_253E60C60);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    v33 = (void *)objc_opt_self();
    v39 = 0;
    v40 = 0xE000000000000000;
    sub_219681D48();
    swift_bridgeObjectRelease();
    v39 = 0xD00000000000001FLL;
    v40 = 0x80000002196898D0;
    sub_219681F34();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    v17 = (void *)v40;
    v18 = (void *)sub_219681A48();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v33, sel_hk_error_description_, 3, v18);
    goto LABEL_14;
  }
  v23 = v42;
  v24 = objc_msgSend(v42, sel_pregnancyManager);
  v37[3] = (uint64_t)&unk_2550B15D0;
  v25 = swift_dynamicCastObjCProtocolConditional();
  if (v25)
  {
    if (v20 && (v26 = v25, objc_opt_self(), (v27 = swift_dynamicCastObjCClass()) != 0))
    {
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37[0] + 16);
      v37[0] = v27;
      v28(v22, v21, v6);
      objc_allocWithZone((Class)v37[2]);
      swift_unknownObjectRetain();
      v29 = v20;
      v30 = a3;
      v31 = v24;
      v32 = v30;
      v17 = sub_219654878(v22, v37[0], v30, v26, v31);

      swift_unknownObjectRelease();
    }
    else
    {
      v36 = (void *)objc_opt_self();
      swift_unknownObjectRetain();
      v17 = (void *)sub_219681A48();
      objc_msgSend(v36, sel_hk_error_description_, 3, v17);

      swift_willThrow();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    v35 = (void *)objc_opt_self();
    v17 = (void *)sub_219681A48();
    objc_msgSend(v35, sel_hk_error_description_, 3, v17);

    swift_willThrow();
  }
  return v17;
}

Swift::Void __swiftcall HDMCPregnancyStateQueryServer._queue_stop()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_unregisterObserver_, v0);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_unregisterObserver_, v0);
}

id HDMCPregnancyStateQueryServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void HDMCPregnancyStateQueryServer.pregnancyModelDidUpdate(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[2];

  v2 = v1;
  v4 = sub_2196815BC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v2, sel_clientProxy);
  if (v8
    && (v9 = objc_msgSend(v8, sel_remoteObjectProxy),
        swift_unknownObjectRelease(),
        sub_219681C70(),
        swift_unknownObjectRelease(),
        sub_219654A28(),
        (swift_dynamicCast() & 1) != 0))
  {
    v10 = (void *)v13[1];
    v11 = objc_msgSend(v2, sel_queryUUID);
    sub_2196815A4();

    v12 = (void *)sub_21968158C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    objc_msgSend(v10, sel_client_deliverPregnancyModel_queryUUID_, a1, v12);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_219681DD8();
    __break(1u);
  }
}

uint64_t sub_2196540D4(uint64_t a1, uint64_t a2)
{
  return sub_2196543AC(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2196540E8(uint64_t a1, uint64_t a2)
{
  return sub_2196543AC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_219654100(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_219681A54();
  *a2 = 0;
  return result;
}

uint64_t sub_219654174(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_219681A60();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2196541F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_219681A6C();
  v2 = sub_219681A48();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_219654238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_219681A48();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21965427C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_219681A6C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2196542A4()
{
  sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  sub_219654D90(&qword_255090018, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_21968595C);
  return sub_219681E08();
}

uint64_t sub_219654328()
{
  sub_219654D90(&qword_25508FFD0, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_219685828);
  sub_219654D90((unint64_t *)&unk_25508FFD8, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_2196857D0);
  return sub_219681E08();
}

uint64_t sub_2196543AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_219681A6C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2196543E8()
{
  sub_219681A6C();
  sub_219681A90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_219654428()
{
  uint64_t v0;

  sub_219681A6C();
  sub_219681ED4();
  sub_219681A90();
  v0 = sub_219681EEC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_219654498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_219681A6C();
  v2 = v1;
  if (v0 == sub_219681A6C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_219681E68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_219654520(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_219654E8C();
      v3 = sub_219681D30();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_219681DE4();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x219A30CD8](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_219681C28();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_219654DFC(0, (unint64_t *)&unk_253E60C20);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_219681C34();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_219681C34();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_219681C28();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_219654DFC(0, (unint64_t *)&unk_253E60C20);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_219681C34();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_219681C34();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

id sub_219654878(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  objc_class *ObjectType;
  char *v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  objc_super v24;
  _OWORD v25[2];
  _BYTE v26[24];
  uint64_t v27;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  v13 = v6;
  v14 = objc_msgSend(a3, sel_profile);
  v15 = objc_msgSend(v14, sel_profileExtensionWithIdentifier_, *MEMORY[0x24BE46AC8]);

  if (v15)
  {
    sub_219681C70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_219654C14((uint64_t)v25, (uint64_t)v26);
  if (v27)
  {
    sub_219654DFC(0, &qword_253E60C60);
    v16 = swift_dynamicCast();
    v17 = v23;
    if (!v16)
      v17 = 0;
  }
  else
  {
    sub_219654C74((uint64_t)v26);
    v17 = 0;
  }
  *(_QWORD *)&v13[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_profileExtension] = v17;
  *(_QWORD *)&v13[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager] = a5;
  v18 = a5;

  v19 = (void *)sub_21968158C();
  v24.receiver = v13;
  v24.super_class = ObjectType;
  v20 = objc_msgSendSuper2(&v24, sel_initWithUUID_configuration_client_delegate_, v19, a2, a3, a4);

  v21 = sub_2196815BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(a1, v21);
  return v20;
}

unint64_t sub_219654A28()
{
  unint64_t result;

  result = qword_253E60C98;
  if (!qword_253E60C98)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60C98);
  }
  return result;
}

void sub_219654A7C(void *a1)
{
  id v2;
  unsigned int v3;
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(a1, sel_entitlements);
  v3 = objc_msgSend(v2, sel_hasEntitlement_, *MEMORY[0x24BDD3310]);

  v4 = objc_msgSend(a1, sel_entitlements);
  v5 = objc_msgSend(v4, sel_hasPrivateAccessEntitlementWithIdentifier_, *MEMORY[0x24BDD3300]);

  if ((v5 & 1) == 0 && !v3)
  {
    sub_219681D48();
    swift_bridgeObjectRelease();
    sub_219681A6C();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    v6 = (void *)objc_opt_self();
    sub_219681A9C();
    sub_219681A6C();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    v7 = (void *)sub_219681A48();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_hk_error_description_, 4, v7, 0xD00000000000001DLL, 0x8000000219689AE0);

    swift_willThrow();
  }
}

uint64_t sub_219654C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219654F34(0, qword_253E60AF8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_219654C74(uint64_t a1)
{
  uint64_t v2;

  sub_219654F34(0, qword_253E60AF8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for HDMCPregnancyStateQueryServer()
{
  return objc_opt_self();
}

uint64_t method lookup function for HDMCPregnancyStateQueryServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCPregnancyStateQueryServer.__allocating_init(uuid:configuration:client:delegate:pregnancyManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_219654F34(a1, &qword_253E60AD8, (uint64_t)&unk_24DB22E68, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
  sub_219654F34(a1, &qword_25508FFB0, (uint64_t)&unk_24DB22E90, MEMORY[0x24BEE4D40]);
}

uint64_t sub_219654D38()
{
  return sub_219654D90(&qword_25508FFB8, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_219685798);
}

uint64_t sub_219654D64()
{
  return sub_219654D90(&qword_25508FFC0, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_219685770);
}

uint64_t sub_219654D90(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A318B4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_219654DD0()
{
  return sub_219654D90(&qword_25508FFC8, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_219685800);
}

uint64_t sub_219654DFC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_219654E34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253E60C30;
  if (!qword_253E60C30)
  {
    v1 = sub_219654DFC(255, (unint64_t *)&unk_253E60C20);
    result = MEMORY[0x219A318B4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_253E60C30);
  }
  return result;
}

void sub_219654E8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CC0)
  {
    sub_219654DFC(255, (unint64_t *)&unk_253E60C20);
    sub_219654E34();
    v0 = sub_219681D3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CC0);
  }
}

void type metadata accessor for HDCloudSyncStateResult(uint64_t a1)
{
  sub_219654F34(a1, &qword_25508FFE8, (uint64_t)&unk_24DB22EB8, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(uint64_t a1)
{
  sub_219654F34(a1, &qword_25508FFF0, (uint64_t)&unk_24DB22ED8, MEMORY[0x24BEE4D40]);
}

void sub_219654F34(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_219654F78()
{
  return sub_219654D90(&qword_25508FFF8, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_219685924);
}

uint64_t sub_219654FA4()
{
  return sub_219654D90(&qword_255090000, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196858FC);
}

uint64_t sub_219654FD0()
{
  return sub_219654D90(&qword_255090008, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_21968598C);
}

id HDMCPregnancyFeatureAdjustmentManager.protectedDataOperation.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation));
}

char *HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyManager:profile:experienceModelProvider:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;
  char *v8;
  char *v9;

  v7 = objc_allocWithZone(v3);
  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  v9 = sub_219657C70(a1, a2, a3, 0, 0, 0, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

char *HDMCPregnancyFeatureAdjustmentManager.init(pregnancyManager:profile:experienceModelProvider:)(void *a1, void *a2, void *a3)
{
  char *v6;
  char *v7;

  v6 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  v7 = sub_219657C70(a1, a2, a3, 0, 0, 0, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

char *HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:)(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  swift_getObjectType();
  return sub_219657BFC(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for HDMCPregnancyFeatureAdjustmentManager()
{
  return objc_opt_self();
}

char *HDMCPregnancyFeatureAdjustmentManager.init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:)(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  char *v6;

  swift_getObjectType();
  return sub_219657E90(a1, a2, a3, a4, a5, a6, v6);
}

void sub_2196552A8(void (*a1)(void), void (*a2)(void))
{
  char *v2;
  char *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v38;

  v3 = v2;
  swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_sharedBehavior);
  if (!v5)
  {
    __break(1u);
    __break(1u);
LABEL_19:
    __break(1u);
    __break(1u);
    return;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, sel_showSensitiveLogItems);

  if (v7)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v8 = sub_21968164C();
    __swift_project_value_buffer(v8, (uint64_t)qword_253E60BE8);
    v9 = sub_219681634();
    v10 = sub_219681BD4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v38 = v12;
      *(_DWORD *)v11 = 136315138;
      v13 = sub_219681F34();
      sub_21967C8D8(v13, v14, &v38);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v9, v10, "[%s] Updating adjusted features", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v12, -1, -1);
      MEMORY[0x219A3195C](v11, -1, -1);
    }

  }
  v15 = (void (*)(char *, uint64_t, uint64_t, uint64_t))objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_getCurrentPregnancyModel);
  if (v15)
  {
    v16 = v15;
    v17 = *(void **)&v3[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile];
    type metadata accessor for HDMCExperienceDaemonStore();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v19 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
    v20 = v17;
    v21 = (void *)sub_219681A48();
    v22 = objc_msgSend(v19, sel_initWithCategory_domainName_profile_, 100, v21, v20);

    *(_QWORD *)(v18 + 24) = v22;
    v33 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
    sub_21966853C();
    v34 = sub_219673B80();
    swift_release();
    v35 = v34;
    swift_retain();
    sub_2196580BC(v16, v18, v35, v33, a1, a2, v3);

    swift_release_n();
    return;
  }
  v23 = objc_msgSend(v4, sel_sharedBehavior);
  if (!v23)
    goto LABEL_19;
  v24 = v23;
  v25 = objc_msgSend(v23, sel_showSensitiveLogItems);

  if (v25)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v26 = sub_21968164C();
    __swift_project_value_buffer(v26, (uint64_t)qword_253E60BE8);
    v27 = sub_219681634();
    v28 = sub_219681BBC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v38 = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = sub_219681F34();
      sub_21967C8D8(v31, v32, &v38);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v27, v28, "[%s] Could not get pregnancy state from pregnancy manager", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v30, -1, -1);
      MEMORY[0x219A3195C](v29, -1, -1);
    }

  }
  a1();
}

id sub_219655B24(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), _QWORD *a2, void *a3, void *a4, void (*a5)(void), void (*a6)(void))
{
  char *v6;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v12 = a2[3];
  v13 = a2[4];
  v14 = __swift_project_boxed_opaque_existential_1(a2, v12);
  return sub_2196596EC(a1, (uint64_t)v14, a3, a4, a5, a6, v6, v12, v13);
}

uint64_t sub_219655BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_219681A6C();
    sub_219681ED4();
    sub_219681A90();
    v3 = sub_219681EEC();
    swift_bridgeObjectRelease();
    v4 = -1 << *(_BYTE *)(a2 + 32);
    v5 = v3 & ~v4;
    v6 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      v7 = sub_219681A6C();
      v9 = v8;
      if (v7 == sub_219681A6C() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      v12 = sub_219681E68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
LABEL_18:
        v20 = 1;
        return v20 & 1;
      }
      v13 = ~v4;
      v14 = (v5 + 1) & v13;
      if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
      {
        while (1)
        {
          v15 = sub_219681A6C();
          v17 = v16;
          if (v15 == sub_219681A6C() && v17 == v18)
            break;
          v20 = sub_219681E68();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            v14 = (v14 + 1) & v13;
            if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
              continue;
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  v20 = 0;
  return v20 & 1;
}

id sub_219655D6C()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id result;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager))
  {
    v1 = *(id *)(v0
               + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager);
LABEL_5:
    v18[0] = 0;
    swift_unknownObjectRetain();
    v4 = objc_msgSend(v1, sel_featureStatusWithError_, v18);
    v5 = v18[0];
    if (v4)
    {
      swift_unknownObjectRelease();
      return v4;
    }
    v6 = v5;
    v7 = (void *)sub_2196814D8();

    swift_willThrow();
    swift_unknownObjectRelease();

    return 0;
  }
  v2 = *(void **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile);
  v3 = objc_msgSend(v2, sel_featureAvailabilityProvidingForFeatureIdentifier_, *MEMORY[0x24BDD2DD0]);
  if (v3)
  {
    v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureAvailabilityProviding_healthDataSource_currentCountryCode_, v3, v2, 0);
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v9 = result;
    v10 = objc_msgSend(result, sel_showSensitiveLogItems);

    if (v10)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v11 = sub_21968164C();
      __swift_project_value_buffer(v11, (uint64_t)qword_253E60BE8);
      v12 = sub_219681634();
      v13 = sub_219681BD4();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = (void *)swift_slowAlloc();
        v18[0] = v15;
        *(_DWORD *)v14 = 136315138;
        v16 = sub_219681F34();
        sub_21967C8D8(v16, v17, (uint64_t *)v18);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v12, v13, "[%s] Not making LCF Feature Adjustment: Could not get cardio fitness feature availability provider", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v15, -1, -1);
        MEMORY[0x219A3195C](v14, -1, -1);
      }

    }
    return 0;
  }
  __break(1u);
  return result;
}

void sub_219656050(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  _QWORD v34[5];
  int64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;

  v2 = sub_219681574();
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  MEMORY[0x24BDAC7A8]();
  v37 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21965BFB8();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_219681CA0();
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_21965C00C();
    sub_219681B74();
    a1 = v43;
    v36 = v44;
    v6 = v45;
    v7 = v46;
    v8 = v47;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v36 = a1 + 56;
    v11 = ~v9;
    v12 = -v9;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v8 = v13 & v10;
    swift_bridgeObjectRetain();
    v6 = v11;
    v7 = 0;
  }
  v34[1] = v6;
  v34[4] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v35 = (unint64_t)(v6 + 64) >> 6;
  v38 = (id)*MEMORY[0x24BE46AD8];
  v34[3] = MEMORY[0x24BEE4AD0] + 8;
  while (a1 < 0)
  {
    v17 = sub_219681CF4();
    if (!v17)
      goto LABEL_38;
    v42 = v17;
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v18 = v48;
    swift_unknownObjectRelease();
    v16 = v7;
    v14 = v8;
    if (!v18)
      goto LABEL_38;
LABEL_33:
    v22 = objc_msgSend(v18, sel_postPregnancyFeatureAdjustmentCompletionDate);
    v41 = v16;
    if (v22)
    {
      v23 = v22;
      v24 = v37;
      sub_219681544();

      v25 = v39;
      v26 = v24;
      v27 = v40;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v5, v26, v40);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v5, 0, 1, v27);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v5, 1, v27) != 1)
      {
        sub_21965C064((uint64_t)v5);
        goto LABEL_9;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v5, 1, 1, v40);
    }
    sub_21965C064((uint64_t)v5);
    v28 = objc_msgSend(v18, sel_pregnancyAdjustedFeaturesSet);
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    v29 = v5;
    v30 = a1;
    sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
    v31 = sub_219681B44();

    v32 = v38;
    v33 = sub_219655BA8((uint64_t)v32, v31);

    a1 = v30;
    v5 = v29;
    swift_bridgeObjectRelease();
    if ((v33 & 1) != 0)
      goto LABEL_38;
LABEL_9:

    v7 = v41;
    v8 = v14;
  }
  if (v8)
  {
    v14 = (v8 - 1) & v8;
    v15 = __clz(__rbit64(v8)) | (v7 << 6);
    v16 = v7;
LABEL_32:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v15);
    if (!v18)
      goto LABEL_38;
    goto LABEL_33;
  }
  v19 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v19 >= v35)
      goto LABEL_38;
    v20 = *(_QWORD *)(v36 + 8 * v19);
    v16 = v7 + 1;
    if (!v20)
    {
      v16 = v7 + 2;
      if (v7 + 2 >= v35)
        goto LABEL_38;
      v20 = *(_QWORD *)(v36 + 8 * v16);
      if (!v20)
      {
        v16 = v7 + 3;
        if (v7 + 3 >= v35)
          goto LABEL_38;
        v20 = *(_QWORD *)(v36 + 8 * v16);
        if (!v20)
        {
          v16 = v7 + 4;
          if (v7 + 4 >= v35)
            goto LABEL_38;
          v20 = *(_QWORD *)(v36 + 8 * v16);
          if (!v20)
          {
            v16 = v7 + 5;
            if (v7 + 5 >= v35)
              goto LABEL_38;
            v20 = *(_QWORD *)(v36 + 8 * v16);
            if (!v20)
            {
              v21 = v7 + 6;
              while (v35 != v21)
              {
                v20 = *(_QWORD *)(v36 + 8 * v21++);
                if (v20)
                {
                  v16 = v21 - 1;
                  goto LABEL_31;
                }
              }
LABEL_38:
              sub_21965C0A0();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    v14 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v16 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

char *sub_2196564F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  _QWORD v9[5];

  swift_getObjectType();
  sub_21965BF28(a3, (uint64_t)v9);
  sub_21965BF6C(0, &qword_255090350);
  type metadata accessor for HDMCExperienceDaemonStore();
  if (swift_dynamicCast())
    v6 = v8;
  else
    v6 = 0;
  result = HDCodableMenstrualCyclesExperienceModel.insert(record:)(a1);
  if (v6)
  {
    swift_retain();
    HDMCExperienceDaemonStore.setModel(_:)(a2);
    return (char *)swift_release_n();
  }
  return result;
}

id sub_219656A90(char a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t (*a8)(void), uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  id result;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t (*v49)(void);
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t (*v67)(void);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v71 = a6;
  v72 = a5;
  v69 = a10;
  v70 = a4;
  sub_21965BFB8();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v65 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v65 - v22;
  v24 = sub_2196815BC();
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  v28 = result;
  if ((a1 & 1) != 0)
  {
    if (result)
    {
      v29 = objc_msgSend(result, sel_showSensitiveLogItems);

      v68 = a7;
      if (v29)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v30 = sub_21968164C();
        __swift_project_value_buffer(v30, (uint64_t)qword_253E60BE8);
        v31 = sub_219681634();
        v32 = sub_219681BD4();
        if (os_log_type_enabled(v31, v32))
        {
          v67 = a8;
          v33 = (uint8_t *)swift_slowAlloc();
          v66 = swift_slowAlloc();
          v74 = v66;
          *(_DWORD *)v33 = 136315138;
          v65 = v33 + 4;
          v34 = sub_219681F34();
          v73 = sub_21967C8D8(v34, v35, &v74);
          sub_219681C58();
          a8 = v67;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v31, v32, "[%s] Successfully adjusted Low Cardio Fitness Notification settings. Attempting to update pregnancy setup record", v33, 0xCu);
          v36 = v66;
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v36, -1, -1);
          MEMORY[0x219A3195C](v33, -1, -1);
        }

      }
      v37 = objc_msgSend(a3, sel_version);
      v38 = objc_msgSend(a3, sel_sampleUUID);
      sub_2196815A4();

      v39 = objc_msgSend(a3, sel_educationalStepsReviewDate);
      if (v39)
      {
        v40 = v39;
        sub_219681544();

        v41 = sub_219681574();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v23, 0, 1, v41);
      }
      else
      {
        v57 = sub_219681574();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v23, 1, 1, v57);
      }
      v58 = objc_msgSend(a3, sel_configurationStepsReviewDate);
      if (v58)
      {
        v59 = v58;
        sub_219681544();

        v60 = sub_219681574();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v21, 0, 1, v60);
      }
      else
      {
        v61 = sub_219681574();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v21, 1, 1, v61);
      }
      v62 = objc_msgSend(a3, sel_pregnancyAdjustedFeaturesSet);
      type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
      sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
      v63 = sub_219681B44();

      sub_21965C0C8(v70, (uint64_t)v18);
      v64 = objc_allocWithZone(MEMORY[0x24BE46BD0]);
      v46 = sub_21965B730((uint64_t)v37, (uint64_t)v26, (uint64_t)v23, (uint64_t)v21, v63, (uint64_t)v18);

      sub_2196564F4(v46, v71, v68);
      goto LABEL_23;
    }
    __break(1u);
  }
  else if (result)
  {
    v42 = objc_msgSend(result, sel_showSensitiveLogItems);

    if (!v42)
      return (id)a8();
    if (qword_253E60AC8 != -1)
      swift_once();
    v43 = sub_21968164C();
    __swift_project_value_buffer(v43, (uint64_t)qword_253E60BE8);
    v44 = a2;
    v45 = a2;
    v46 = sub_219681634();
    v47 = sub_219681BBC();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = swift_slowAlloc();
      v49 = a8;
      v50 = swift_slowAlloc();
      v74 = v50;
      *(_DWORD *)v48 = 136315394;
      v51 = sub_219681F34();
      v73 = sub_21967C8D8(v51, v52, &v74);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2080;
      v73 = (uint64_t)a2;
      v53 = a2;
      sub_21965C188();
      v54 = sub_219681A78();
      v73 = sub_21967C8D8(v54, v55, &v74);
      sub_219681C58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21961B000, v46, v47, "[%s] Error updating Low Cardio Fitness Notifications feature settings: %s", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      v56 = v50;
      a8 = v49;
      MEMORY[0x219A3195C](v56, -1, -1);
      MEMORY[0x219A3195C](v48, -1, -1);
    }
    else
    {

    }
LABEL_23:

    return (id)a8();
  }
  __break(1u);
  return result;
}

void sub_2196570EC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_21965714C()
{
  sub_219657258(2);
}

void sub_2196571A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(void))
{
  sub_21965BCC4(a4, a5);
}

void sub_219657258(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  uint8_t *v44;
  NSObject *oslog;
  id v46[2];

  v2 = v1;
  v46[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_sharedBehavior);
  if (!v5)
    __break(1u);
  v6 = v5;
  v7 = objc_msgSend(v5, sel_isiPad);

  v8 = objc_msgSend(v4, sel_sharedBehavior);
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (v8)
    {
      v17 = objc_msgSend(v8, sel_showSensitiveLogItems);

      if (v17)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v18 = sub_21968164C();
        __swift_project_value_buffer(v18, (uint64_t)qword_253E60BE8);
        v19 = sub_219681634();
        v20 = sub_219681BD4();
        if (os_log_type_enabled(v19, v20))
        {
          v21 = (uint8_t *)swift_slowAlloc();
          v22 = (void *)swift_slowAlloc();
          v46[0] = v22;
          *(_DWORD *)v21 = 136315138;
          v44 = v21 + 4;
          v23 = sub_219681F34();
          sub_21967C8D8(v23, v24, (uint64_t *)v46);
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v19, v20, "[%s] Requesting protected data operation", v21, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v22, -1, -1);
          MEMORY[0x219A3195C](v21, -1, -1);
        }

      }
      v25 = *(void **)(v2
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation);
      v46[0] = 0;
      if (objc_msgSend(v25, sel_requestWorkWithPriority_error_, a1, v46, v44))
      {
        v26 = v46[0];
        return;
      }
      v27 = v46[0];
      v28 = (void *)sub_2196814D8();

      swift_willThrow();
      v29 = objc_msgSend(v4, sel_sharedBehavior);
      if (v29)
      {
        v30 = v29;
        v31 = objc_msgSend(v29, sel_showSensitiveLogItems);

        if (v31)
        {
          if (qword_253E60AC8 != -1)
            swift_once();
          v32 = sub_21968164C();
          __swift_project_value_buffer(v32, (uint64_t)qword_253E60BE8);
          v33 = v28;
          v34 = v28;
          v35 = sub_219681634();
          v36 = sub_219681BBC();
          if (!os_log_type_enabled(v35, v36))
          {

            return;
          }
          v37 = swift_slowAlloc();
          v38 = (void *)swift_slowAlloc();
          v46[0] = v38;
          *(_DWORD *)v37 = 136315394;
          v39 = sub_219681F34();
          sub_21967C8D8(v39, v40, (uint64_t *)v46);
          sub_219681C58();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2080;
          v41 = v28;
          sub_21965BF6C(0, (unint64_t *)&qword_255090358);
          v42 = sub_219681A78();
          sub_21967C8D8(v42, v43, (uint64_t *)v46);
          sub_219681C58();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_21961B000, v35, v36, "[%s] Failed to request protected data operation error: %s", (uint8_t *)v37, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v38, -1, -1);
          MEMORY[0x219A3195C](v37, -1, -1);

        }
        return;
      }
LABEL_31:
      __break(1u);
      return;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!v8)
  {
    __break(1u);
    goto LABEL_30;
  }
  v10 = objc_msgSend(v8, sel_showSensitiveLogItems);

  if (v10)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v11 = sub_21968164C();
    __swift_project_value_buffer(v11, (uint64_t)qword_253E60BE8);
    oslog = sub_219681634();
    v12 = sub_219681BD4();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (void *)swift_slowAlloc();
      v46[0] = v14;
      *(_DWORD *)v13 = 136315138;
      v15 = sub_219681F34();
      sub_21967C8D8(v15, v16, (uint64_t *)v46);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, oslog, v12, "[%s] Should not request work since this is an iPad", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v14, -1, -1);
      MEMORY[0x219A3195C](v13, -1, -1);

    }
    else
    {

    }
  }
}

id HDMCPregnancyFeatureAdjustmentManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDMCPregnancyFeatureAdjustmentManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HDMCPregnancyFeatureAdjustmentManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HDMCPregnancyFeatureAdjustmentManager.experienceModelManagerDidUpdateModel()()
{
  id v0;
  void *v1;
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  swift_getObjectType();
  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, sel_showSensitiveLogItems);

    if (v2)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v3 = sub_21968164C();
      __swift_project_value_buffer(v3, (uint64_t)qword_253E60BE8);
      v4 = sub_219681634();
      v5 = sub_219681BD4();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        v7 = swift_slowAlloc();
        v10 = v7;
        *(_DWORD *)v6 = 136315138;
        v8 = sub_219681F34();
        sub_21967C8D8(v8, v9, &v10);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v4, v5, "[%s] Received experience model update", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v7, -1, -1);
        MEMORY[0x219A3195C](v6, -1, -1);
      }

    }
    sub_219657258(2);
  }
  else
  {
    __break(1u);
  }
}

char *sub_219657BFC(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  char *v12;

  v12 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  return sub_219657E90(a1, a2, a3, a4, a5, a6, v12);
}

char *sub_219657C70(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char *v26;
  char *result;
  char *v28;
  unsigned __int8 v29;
  objc_super v30;

  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile] = a2;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager] = a1;
  if (a4)
  {
    v14 = a7;
    v15 = a2;
    v16 = a1;
    v17 = a4;
  }
  else
  {
    v18 = objc_allocWithZone(MEMORY[0x24BE40B80]);
    v19 = a7;
    v20 = a2;
    v21 = a1;
    v22 = (void *)sub_219681A48();
    v17 = objc_msgSend(v18, sel_initWithProfile_debugIdentifier_delegate_, v20, v22, 0);

  }
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation] = v17;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager] = a5;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager] = a6;
  swift_unknownObjectRetain();
  v23 = a4;
  swift_unknownObjectRetain();

  v30.receiver = a7;
  v30.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  v24 = objc_msgSendSuper2(&v30, sel_init);
  v25 = (void *)objc_opt_self();
  v26 = (char *)v24;
  result = (char *)objc_msgSend(v25, sel_sharedBehavior);
  if (result)
  {
    v28 = result;
    v29 = objc_msgSend(result, sel_isiPad);

    if ((v29 & 1) == 0)
    {
      objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation], sel_setDelegate_, v26);
      objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_registerObserver_isUserInitiated_, v26, 0);
      objc_msgSend(a3, sel_registerWithObserver_, v26);
      sub_219657258(2);
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    return v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_219657E90(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  char *v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char *v23;
  char *result;
  char *v25;
  unsigned __int8 v26;
  objc_super v27;

  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile] = a2;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager] = a1;
  if (a4)
  {
    v13 = a7;
    v14 = a2;
    swift_unknownObjectRetain();
    v15 = a4;
  }
  else
  {
    v16 = objc_allocWithZone(MEMORY[0x24BE40B80]);
    v17 = a7;
    v18 = a2;
    swift_unknownObjectRetain();
    v19 = (void *)sub_219681A48();
    v15 = objc_msgSend(v16, sel_initWithProfile_debugIdentifier_delegate_, v18, v19, 0);

  }
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation] = v15;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager] = a5;
  *(_QWORD *)&a7[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager] = a6;
  swift_unknownObjectRetain();
  v20 = a4;
  swift_unknownObjectRetain();

  v27.receiver = a7;
  v27.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  v21 = objc_msgSendSuper2(&v27, sel_init);
  v22 = (void *)objc_opt_self();
  v23 = (char *)v21;
  result = (char *)objc_msgSend(v22, sel_sharedBehavior);
  if (result)
  {
    v25 = result;
    v26 = objc_msgSend(result, sel_isiPad);

    if ((v26 & 1) == 0)
    {
      objc_msgSend(*(id *)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation], sel_setDelegate_, v23);
      objc_msgSend(*(id *)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_registerObserver_isUserInitiated_, v23, 0);
      objc_msgSend(a3, sel_registerWithObserver_, v23);
      sub_219657258(2);
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    return v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2196580BC(void (*a1)(char *, uint64_t, uint64_t, uint64_t), uint64_t a2, id a3, void *a4, void (*a5)(void), void (*a6)(void), char *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  id v27;
  char *v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  id v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  char v56;
  id v57;
  void *v58;
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  id v76;
  void *v77;
  unsigned __int8 v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  void *v83;
  unsigned __int8 v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  id v92;
  void *v93;
  unsigned __int8 v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  const char *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  id v111;
  void *v112;
  unsigned int v113;
  uint64_t v114;
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  void *v121;
  uint64_t v122;
  char *v123;
  char v124;
  void (*v125)(char *, uint64_t);
  id v126;
  void *v127;
  uint64_t v128;
  int v129;
  id v130;
  void *v131;
  unsigned int v132;
  uint64_t v133;
  NSObject *v134;
  os_log_type_t v135;
  uint8_t *v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  id v143;
  id v144;
  void *v145;
  unsigned int v146;
  uint64_t v147;
  uint64_t v148;
  NSObject *v149;
  os_log_type_t v150;
  uint8_t *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t (*v157)(char *, uint64_t, uint64_t);
  void (*v158)(char *, uint64_t, uint64_t, uint64_t);
  id v159;
  id v160;
  char *v161;
  char *v162;
  void *v163;
  uint64_t v164;
  uint64_t ObjectType;
  void (*v166)(void);
  void (*v167)(void);
  uint64_t v168;
  id v169;
  uint64_t v170;
  uint64_t v171;

  v166 = a6;
  v167 = a5;
  v163 = a4;
  ObjectType = swift_getObjectType();
  v164 = sub_219681574();
  v11 = *(_QWORD *)(v164 - 8);
  v12 = MEMORY[0x24BDAC7A8](v164);
  v14 = (char *)&v157 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v161 = (char *)&v157 - v15;
  sub_21965BFB8();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v157 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v157 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v157 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v162 = (char *)&v157 - v26;
  v168 = a2;
  swift_retain();
  v169 = sub_219655D6C();
  if (!v169
    || (v27 = objc_msgSend(v169, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2C60]),
        v28 = (char *)objc_msgSend(v27, sel_areAllRequirementsSatisfied),
        v27,
        !(_DWORD)v28))
  {
    v40 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v40)
    {
      v41 = v40;
      v42 = objc_msgSend(v40, sel_showSensitiveLogItems);

      if (v42)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v43 = sub_21968164C();
        __swift_project_value_buffer(v43, (uint64_t)qword_253E60BE8);
        v33 = sub_219681634();
        v34 = sub_219681BD4();
        if (!os_log_type_enabled(v33, v34))
          goto LABEL_17;
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v171 = v36;
        *(_DWORD *)v35 = 136315138;
        v44 = sub_219681F34();
        v170 = sub_21967C8D8(v44, v45, &v171);
        sub_219681C58();
        swift_bridgeObjectRelease();
        v39 = "[%s] LCF Notifications are either not available or currently active. Not making adjustment";
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    __break(1u);
    goto LABEL_99;
  }
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v29 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v29)
    {
      v30 = v29;
      v31 = objc_msgSend(v29, sel_showSensitiveLogItems);

      if ((v31 & 1) != 0)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v32 = sub_21968164C();
        __swift_project_value_buffer(v32, (uint64_t)qword_253E60BE8);
        v33 = sub_219681634();
        v34 = sub_219681BD4();
        if (!os_log_type_enabled(v33, v34))
          goto LABEL_17;
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v171 = v36;
        *(_DWORD *)v35 = 136315138;
        v37 = sub_219681F34();
        v170 = sub_21967C8D8(v37, v38, &v171);
        sub_219681C58();
        swift_bridgeObjectRelease();
        v39 = "[%s] Pregnancy state is ongoing. Not making adjustment";
LABEL_16:
        _os_log_impl(&dword_21961B000, v33, v34, v39, v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v36, -1, -1);
        MEMORY[0x219A3195C](v35, -1, -1);
LABEL_17:

      }
LABEL_18:
      v167();
      swift_release();
LABEL_19:

      return;
    }
    __break(1u);
    goto LABEL_101;
  }
  if (!objc_msgSend(a1, sel_state))
  {
    v64 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_21965C00C();
    v65 = sub_219681B44();

    sub_219656050(v65);
    v67 = v66;
    swift_bridgeObjectRelease();
    if (v67)
    {
      sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
      v68 = (void *)sub_219681C1C();
      v69 = (uint64_t)v162;
      sub_219681568();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v69, 0, 1, v164);
      sub_21965AE04(v67, v168, v163, (uint64_t)v68, v69, v167, v166, a7);

      sub_21965C064(v69);
      swift_release();

      return;
    }
    v70 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v70)
    {
      v71 = v70;
      v72 = objc_msgSend(v70, sel_showSensitiveLogItems);

      if (!v72)
        goto LABEL_18;
      if (qword_253E60AC8 != -1)
        swift_once();
      v73 = sub_21968164C();
      __swift_project_value_buffer(v73, (uint64_t)qword_253E60BE8);
      v33 = sub_219681634();
      v34 = sub_219681BD4();
      if (!os_log_type_enabled(v33, v34))
        goto LABEL_17;
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v171 = v36;
      *(_DWORD *)v35 = 136315138;
      v74 = sub_219681F34();
      v170 = sub_21967C8D8(v74, v75, &v171);
      sub_219681C58();
      swift_bridgeObjectRelease();
      v39 = "[%s] Pregnancy state is in none and we don't have any setup records needing an update. Not making adjustment";
      goto LABEL_16;
    }
    __break(1u);
    goto LABEL_103;
  }
  if (objc_msgSend(a1, sel_state) != (id)2)
  {
    swift_release();

    return;
  }
  v46 = objc_msgSend(a1, sel_sample);
  if (!v46)
  {
    v76 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v76)
    {
      v77 = v76;
      v78 = objc_msgSend(v76, sel_showSensitiveLogItems);

      if ((v78 & 1) == 0)
        goto LABEL_18;
      if (qword_253E60AC8 != -1)
        swift_once();
      v79 = sub_21968164C();
      __swift_project_value_buffer(v79, (uint64_t)qword_253E60BE8);
      v33 = sub_219681634();
      v34 = sub_219681BBC();
      if (!os_log_type_enabled(v33, v34))
        goto LABEL_17;
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v171 = v36;
      *(_DWORD *)v35 = 136315138;
      v80 = sub_219681F34();
      v170 = sub_21967C8D8(v80, v81, &v171);
      sub_219681C58();
      swift_bridgeObjectRelease();
      v39 = "[%s] Pregnancy state is in post pregnancy but we do not have a sample. This should not happen. Not making adjustment";
      goto LABEL_16;
    }
LABEL_103:
    __break(1u);
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  v47 = v46;
  v48 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
  sub_219654DFC(0, (unint64_t *)&qword_253E61238);
  sub_21965C00C();
  v49 = sub_219681B44();

  v50 = v47;
  sub_21965B8F4(v49, v50);
  v52 = v51;
  swift_bridgeObjectRelease();
  v160 = v50;

  if (!v52)
  {
    v82 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v82)
    {
      v83 = v82;
      v84 = objc_msgSend(v82, sel_showSensitiveLogItems);

      if ((v84 & 1) != 0)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v85 = sub_21968164C();
        __swift_project_value_buffer(v85, (uint64_t)qword_253E60BE8);
        v86 = sub_219681634();
        v87 = sub_219681BD4();
        if (os_log_type_enabled(v86, v87))
        {
          v88 = (uint8_t *)swift_slowAlloc();
          v89 = swift_slowAlloc();
          v171 = v89;
          *(_DWORD *)v88 = 136315138;
          v90 = sub_219681F34();
          v170 = sub_21967C8D8(v90, v91, &v171);
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v86, v87, "[%s] Pregnancy state is in post pregnancy but we do not have a corresponding setup record, not making adjustment", v88, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v89, -1, -1);
          MEMORY[0x219A3195C](v88, -1, -1);
        }

      }
      v167();
      swift_release();

      return;
    }
    goto LABEL_104;
  }
  v159 = v52;
  v53 = objc_msgSend(v52, sel_pregnancyAdjustedFeaturesSet);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  v54 = sub_219681B44();

  v55 = (id)*MEMORY[0x24BE46AD8];
  v56 = sub_219655BA8((uint64_t)v55, v54);

  swift_bridgeObjectRelease();
  if ((v56 & 1) == 0)
  {
    v92 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v92)
    {
      v93 = v92;
      v94 = objc_msgSend(v92, sel_showSensitiveLogItems);

      a3 = v159;
      if ((v94 & 1) != 0)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v95 = sub_21968164C();
        __swift_project_value_buffer(v95, (uint64_t)qword_253E60BE8);
        v96 = sub_219681634();
        v97 = sub_219681BD4();
        if (!os_log_type_enabled(v96, v97))
          goto LABEL_67;
        v98 = (uint8_t *)swift_slowAlloc();
        v99 = swift_slowAlloc();
        v171 = v99;
        *(_DWORD *)v98 = 136315138;
        v100 = sub_219681F34();
        v170 = sub_21967C8D8(v100, v101, &v171);
        a3 = v159;
        sub_219681C58();
        swift_bridgeObjectRelease();
        v102 = "[%s] Did not opt into low cardio fitness pregnancy adjustment, not making adjustment";
        goto LABEL_66;
      }
      goto LABEL_68;
    }
    goto LABEL_105;
  }
  v57 = objc_msgSend(a1, sel_physiologicalWashoutEndDate);
  if (!v57)
  {
    v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v63 = v164;
    v61(v25, 1, 1, v164);
    goto LABEL_58;
  }
  v58 = v57;
  sub_219681544();

  v59 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v60 = v164;
  v59(v25, v14, v164);
  v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v61(v25, 0, 1, v60);
  v62 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v62(v25, 1, v60) == 1)
  {
    v63 = v60;
LABEL_58:
    sub_21965C064((uint64_t)v25);
    a3 = v159;
LABEL_59:
    v103 = objc_msgSend(a3, sel_postPregnancyFeatureAdjustmentCompletionDate);
    if (v103)
    {
      v104 = v103;
      sub_219681544();

      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v14, v63);
      v61(v19, 0, 1, v63);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v19, 1, v63) != 1)
      {
        sub_21965C064((uint64_t)v19);
        v105 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
        if (v105)
        {
          v106 = v105;
          v107 = objc_msgSend(v105, sel_showSensitiveLogItems);

          if (v107)
          {
            if (qword_253E60AC8 == -1)
            {
LABEL_64:
              v108 = sub_21968164C();
              __swift_project_value_buffer(v108, (uint64_t)qword_253E60BE8);
              v96 = sub_219681634();
              v97 = sub_219681BD4();
              if (!os_log_type_enabled(v96, v97))
              {
LABEL_67:

                goto LABEL_68;
              }
              v98 = (uint8_t *)swift_slowAlloc();
              v99 = swift_slowAlloc();
              v171 = v99;
              *(_DWORD *)v98 = 136315138;
              v109 = sub_219681F34();
              v170 = sub_21967C8D8(v109, v110, &v171);
              a3 = v159;
              sub_219681C58();
              swift_bridgeObjectRelease();
              v102 = "[%s] Physiological washout date has passed, and we have a post pregnancy adjustment date. No more w"
                     "ork needed here.";
LABEL_66:
              _os_log_impl(&dword_21961B000, v96, v97, v102, v98, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x219A3195C](v99, -1, -1);
              MEMORY[0x219A3195C](v98, -1, -1);
              goto LABEL_67;
            }
LABEL_99:
            swift_once();
            goto LABEL_64;
          }
LABEL_68:
          v167();
          swift_release();

          return;
        }
        goto LABEL_107;
      }
    }
    else
    {
      v61(v19, 1, 1, v63);
    }
    sub_21965C064((uint64_t)v19);
    v111 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v111)
    {
      v112 = v111;
      v113 = objc_msgSend(v111, sel_showSensitiveLogItems);

      if (v113)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v114 = sub_21968164C();
        __swift_project_value_buffer(v114, (uint64_t)qword_253E60BE8);
        v115 = sub_219681634();
        v116 = sub_219681BD4();
        if (os_log_type_enabled(v115, v116))
        {
          v117 = (uint8_t *)swift_slowAlloc();
          v118 = swift_slowAlloc();
          v171 = v118;
          *(_DWORD *)v117 = 136315138;
          v119 = sub_219681F34();
          v170 = sub_21967C8D8(v119, v120, &v171);
          a3 = v159;
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v115, v116, "[%s)] Physiological washout date has passed, but we have not yet adjusted features, making adjustment", v117, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v118, -1, -1);
          MEMORY[0x219A3195C](v117, -1, -1);
        }

      }
      sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
      v121 = (void *)sub_219681C1C();
      v122 = (uint64_t)v162;
      sub_219681568();
      v61((char *)v122, 0, 1, v63);
      sub_21965AE04(a3, v168, v163, (uint64_t)v121, v122, v167, v166, a7);

      sub_21965C064(v122);
      swift_release();

      goto LABEL_19;
    }
LABEL_106:
    __break(1u);
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v157 = (uint64_t (*)(char *, uint64_t, uint64_t))v62;
  v158 = v61;
  v123 = v161;
  v59(v161, v25, v60);
  sub_219681568();
  v124 = sub_219681520();
  v125 = *(void (**)(char *, uint64_t))(v11 + 8);
  v125(v14, v60);
  if ((v124 & 1) == 0)
  {
    v125(v123, v60);
    v61 = v158;
    a3 = v159;
    v63 = v60;
    goto LABEL_59;
  }
  v28 = (char *)v125;
  v126 = objc_msgSend(v159, sel_postPregnancyFeatureAdjustmentCompletionDate);
  if (v126)
  {
    v127 = v126;
    sub_219681544();

    v128 = v164;
    v59(v22, v14, v164);
    a1 = v158;
    v158(v22, 0, 1, v128);
    v129 = v157(v22, 1, v128);
    v19 = v161;
    if (v129 != 1)
    {
      sub_21965C064((uint64_t)v22);
      v130 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
      a3 = v159;
      if (v130)
      {
        v131 = v130;
        v132 = objc_msgSend(v130, sel_showSensitiveLogItems);

        v11 = v164;
        v22 = v28;
        if (!v132)
        {
LABEL_87:
          sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
          v141 = (void *)sub_219681C1C();
          v142 = (uint64_t)v162;
          a1(v162, 1, 1, v11);
          sub_21965AE04(a3, v168, v163, (uint64_t)v141, v142, v167, v166, a7);

          sub_21965C064(v142);
          ((void (*)(char *, uint64_t))v22)(v19, v11);
          swift_release();
          return;
        }
        if (qword_253E60AC8 == -1)
        {
LABEL_84:
          v133 = sub_21968164C();
          __swift_project_value_buffer(v133, (uint64_t)qword_253E60BE8);
          v134 = sub_219681634();
          v135 = sub_219681BD4();
          if (os_log_type_enabled(v134, v135))
          {
            v136 = (uint8_t *)swift_slowAlloc();
            v137 = swift_slowAlloc();
            v171 = v137;
            *(_DWORD *)v136 = 136315138;
            v138 = sub_219681F34();
            v170 = sub_21967C8D8(v138, v139, &v171);
            a3 = v159;
            sub_219681C58();
            v22 = v28;
            v11 = v164;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21961B000, v134, v135, "[%s)] Physiological washout date has not passed, but we have an adjustment date! We made a mistake - reverting adjustment", v136, 0xCu);
            swift_arrayDestroy();
            v140 = v137;
            v19 = v161;
            MEMORY[0x219A3195C](v140, -1, -1);
            MEMORY[0x219A3195C](v136, -1, -1);
          }

          goto LABEL_87;
        }
LABEL_101:
        swift_once();
        goto LABEL_84;
      }
      goto LABEL_109;
    }
  }
  else
  {
    v158(v22, 1, 1, v164);
    v19 = v161;
  }
  sub_21965C064((uint64_t)v22);
  v143 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  v144 = v159;
  if (!v143)
  {
LABEL_108:
    __break(1u);
LABEL_109:
    __break(1u);
    return;
  }
  v145 = v143;
  v146 = objc_msgSend(v143, sel_showSensitiveLogItems);

  v147 = v164;
  if (v146)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v148 = sub_21968164C();
    __swift_project_value_buffer(v148, (uint64_t)qword_253E60BE8);
    v149 = sub_219681634();
    v150 = sub_219681BD4();
    if (os_log_type_enabled(v149, v150))
    {
      v151 = (uint8_t *)swift_slowAlloc();
      v152 = v19;
      v153 = swift_slowAlloc();
      v171 = v153;
      *(_DWORD *)v151 = 136315138;
      v154 = sub_219681F34();
      v170 = sub_21967C8D8(v154, v155, &v171);
      v144 = v159;
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v149, v150, "[%s] Physiological washout date has not yet passed, and we do not have a post pregnancy adjustment date. No adjustment needed yet.", v151, 0xCu);
      swift_arrayDestroy();
      v156 = v153;
      v19 = v152;
      MEMORY[0x219A3195C](v156, -1, -1);
      MEMORY[0x219A3195C](v151, -1, -1);
    }

  }
  v167();

  ((void (*)(char *, uint64_t))v28)(v19, v147);
  swift_release();
}

id sub_2196596EC(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a2, id a3, void *a4, void (*a5)(void), void (*a6)(void), char *a7, uint64_t a8, uint64_t a9)
{
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(void);
  id v34;
  id v35;
  id v36;
  id v37;
  unsigned int v38;
  id v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id result;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  char v74;
  id v75;
  void *v76;
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v80)(char *, uint64_t, uint64_t);
  char *v81;
  char v82;
  void (*v83)(char *, uint64_t);
  id v84;
  void *v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  uint8_t *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void *v111;
  unsigned __int8 v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  void *v116;
  unsigned __int8 v117;
  uint64_t v118;
  NSObject *v119;
  os_log_type_t v120;
  uint8_t *v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  void *v125;
  unsigned __int8 v126;
  uint64_t v127;
  NSObject *v128;
  os_log_type_t v129;
  uint8_t *v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  const char *v134;
  uint64_t v135;
  id v136;
  void *v137;
  void *v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  void *v143;
  unsigned int v144;
  uint64_t v145;
  NSObject *v146;
  os_log_type_t v147;
  uint8_t *v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  void *v152;
  uint64_t v153;
  id v154;
  void *v155;
  unsigned int v156;
  char *v157;
  void (*v158)(char *, uint64_t);
  uint64_t v159;
  NSObject *v160;
  os_log_type_t v161;
  uint8_t *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unsigned int (*v166)(char *, uint64_t, uint64_t);
  void (*v167)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v168;
  id v169;
  id v170;
  char *v171;
  char *v172;
  void *v173;
  uint64_t v174;
  uint64_t ObjectType;
  id v176;
  void (*v177)(void);
  void (*v178)(void);
  uint64_t v179;
  void (*v180)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v181;
  uint64_t v182;
  uint64_t v183[2];

  v177 = a6;
  v178 = a5;
  v173 = a4;
  ObjectType = swift_getObjectType();
  v174 = sub_219681574();
  v13 = *(void (**)(char *, uint64_t))(v174 - 8);
  v14 = MEMORY[0x24BDAC7A8](v174);
  v16 = (char *)&v166 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v171 = (char *)&v166 - v17;
  sub_21965BFB8();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v166 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v166 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v166 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v172 = (char *)&v166 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v166 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = v32;
  v180 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))a8;
  v33 = *(void (**)(void))(v32 + 16);
  v181 = v31;
  v33();
  v34 = sub_219655D6C();
  v35 = v34;
  if (!v34
    || (v36 = objc_msgSend(v34, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2C60]),
        v176 = v35,
        v37 = v36,
        v38 = objc_msgSend(v36, sel_areAllRequirementsSatisfied),
        v37,
        v35 = v176,
        !v38))
  {
    v51 = v35;
    v52 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v52)
    {
      v53 = v52;
      v54 = objc_msgSend(v52, sel_showSensitiveLogItems);

      a1 = v180;
      v16 = v181;
      if (v54)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v55 = sub_21968164C();
        __swift_project_value_buffer(v55, (uint64_t)qword_253E60BE8);
        v56 = sub_219681634();
        v57 = sub_219681BD4();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          v59 = swift_slowAlloc();
          v183[0] = v59;
          *(_DWORD *)v58 = 136315138;
          v60 = sub_219681F34();
          v182 = sub_21967C8D8(v60, v61, v183);
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v56, v57, "[%s] LCF Notifications are either not available or currently active. Not making adjustment", v58, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v59, -1, -1);
          MEMORY[0x219A3195C](v58, -1, -1);
        }

      }
      v178();

      goto LABEL_23;
    }
    __break(1u);
    goto LABEL_103;
  }
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v39 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v39)
    {
      v40 = v39;
      v41 = objc_msgSend(v39, sel_showSensitiveLogItems);

      a1 = v180;
      v16 = v181;
      if ((v41 & 1) == 0)
      {
LABEL_12:
        v178();
LABEL_13:
        v50 = v176;
LABEL_14:

LABEL_23:
        v62 = v179;
        return (id)(*(uint64_t (**)(char *, void (*)(uint64_t, uint64_t, uint64_t, uint64_t)))(v62 + 8))(v16, a1);
      }
      if (qword_253E60AC8 != -1)
        swift_once();
      v42 = sub_21968164C();
      __swift_project_value_buffer(v42, (uint64_t)qword_253E60BE8);
      v43 = sub_219681634();
      v44 = sub_219681BD4();
      if (!os_log_type_enabled(v43, v44))
      {
LABEL_11:

        goto LABEL_12;
      }
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v183[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v47 = sub_219681F34();
      v182 = sub_21967C8D8(v47, v48, v183);
      sub_219681C58();
      swift_bridgeObjectRelease();
      v49 = "[%s] Pregnancy state is ongoing. Not making adjustment";
LABEL_10:
      _os_log_impl(&dword_21961B000, v43, v44, v49, v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v46, -1, -1);
      MEMORY[0x219A3195C](v45, -1, -1);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_105;
  }
  if (!objc_msgSend(a1, sel_state))
  {
    v100 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_21965C00C();
    v101 = sub_219681B44();

    sub_219656050(v101);
    v103 = v102;
    swift_bridgeObjectRelease();
    if (v103)
    {
      sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
      v104 = (void *)sub_219681C1C();
      v105 = (uint64_t)v172;
      sub_219681568();
      (*((void (**)(uint64_t, _QWORD, uint64_t, uint64_t))v13 + 7))(v105, 0, 1, v174);
      a1 = v180;
      v16 = v181;
      sub_21965B29C(v103, (uint64_t)v181, v173, (uint64_t)v104, v105, v178, v177, a7, (uint64_t)v180, a9);

      sub_21965C064(v105);
      goto LABEL_23;
    }
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    a1 = v180;
    v16 = v181;
    if (result)
    {
      v106 = result;
      v107 = objc_msgSend(result, sel_showSensitiveLogItems);

      if (!v107)
        goto LABEL_12;
      if (qword_253E60AC8 != -1)
        swift_once();
      v108 = sub_21968164C();
      __swift_project_value_buffer(v108, (uint64_t)qword_253E60BE8);
      v43 = sub_219681634();
      v44 = sub_219681BD4();
      if (!os_log_type_enabled(v43, v44))
        goto LABEL_11;
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v183[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v109 = sub_219681F34();
      v182 = sub_21967C8D8(v109, v110, v183);
      sub_219681C58();
      swift_bridgeObjectRelease();
      v49 = "[%s] Pregnancy state is in none and we don't have any setup records needing an update. Not making adjustment";
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_107;
  }
  if (objc_msgSend(a1, sel_state) != (id)2)
  {

    v62 = v179;
    a1 = v180;
    v16 = v181;
    return (id)(*(uint64_t (**)(char *, void (*)(uint64_t, uint64_t, uint64_t, uint64_t)))(v62 + 8))(v16, a1);
  }
  v64 = objc_msgSend(a1, sel_sample);
  if (!v64)
  {
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (result)
    {
      v111 = result;
      v112 = objc_msgSend(result, sel_showSensitiveLogItems);

      a1 = v180;
      v16 = v181;
      if ((v112 & 1) == 0)
        goto LABEL_12;
      if (qword_253E60AC8 != -1)
        swift_once();
      v113 = sub_21968164C();
      __swift_project_value_buffer(v113, (uint64_t)qword_253E60BE8);
      v43 = sub_219681634();
      v44 = sub_219681BBC();
      if (!os_log_type_enabled(v43, v44))
        goto LABEL_11;
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v183[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v114 = sub_219681F34();
      v182 = sub_21967C8D8(v114, v115, v183);
      sub_219681C58();
      swift_bridgeObjectRelease();
      v49 = "[%s] Pregnancy state is in post pregnancy but we do not have a sample. This should not happen. Not making adjustment";
      goto LABEL_10;
    }
LABEL_107:
    __break(1u);
LABEL_108:
    __break(1u);
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v65 = v64;
  v168 = a9;
  v66 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
  sub_219654DFC(0, (unint64_t *)&qword_253E61238);
  sub_21965C00C();
  v67 = sub_219681B44();

  v68 = v65;
  sub_21965B8F4(v67, v68);
  v70 = v69;
  swift_bridgeObjectRelease();
  v170 = v68;

  if (!v70)
  {
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (result)
    {
      v116 = result;
      v117 = objc_msgSend(result, sel_showSensitiveLogItems);

      a1 = v180;
      v16 = v181;
      if ((v117 & 1) != 0)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v118 = sub_21968164C();
        __swift_project_value_buffer(v118, (uint64_t)qword_253E60BE8);
        v119 = sub_219681634();
        v120 = sub_219681BD4();
        if (os_log_type_enabled(v119, v120))
        {
          v121 = (uint8_t *)swift_slowAlloc();
          v122 = swift_slowAlloc();
          v183[0] = v122;
          *(_DWORD *)v121 = 136315138;
          v123 = sub_219681F34();
          v182 = sub_21967C8D8(v123, v124, v183);
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v119, v120, "[%s] Pregnancy state is in post pregnancy but we do not have a corresponding setup record, not making adjustment", v121, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v122, -1, -1);
          MEMORY[0x219A3195C](v121, -1, -1);
        }

      }
      v178();

      v50 = v170;
      goto LABEL_14;
    }
    goto LABEL_108;
  }
  v169 = v70;
  v71 = objc_msgSend(v70, sel_pregnancyAdjustedFeaturesSet);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  v72 = sub_219681B44();

  v73 = (id)*MEMORY[0x24BE46AD8];
  v74 = sub_219655BA8((uint64_t)v73, v72);

  swift_bridgeObjectRelease();
  if ((v74 & 1) == 0)
  {
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (result)
    {
      v125 = result;
      v126 = objc_msgSend(result, sel_showSensitiveLogItems);

      a1 = v180;
      v16 = v181;
      a3 = v169;
      if ((v126 & 1) != 0)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v127 = sub_21968164C();
        __swift_project_value_buffer(v127, (uint64_t)qword_253E60BE8);
        v128 = sub_219681634();
        v129 = sub_219681BD4();
        if (!os_log_type_enabled(v128, v129))
          goto LABEL_81;
        v130 = (uint8_t *)swift_slowAlloc();
        v131 = swift_slowAlloc();
        v183[0] = v131;
        *(_DWORD *)v130 = 136315138;
        v132 = sub_219681F34();
        v182 = sub_21967C8D8(v132, v133, v183);
        a3 = v169;
        sub_219681C58();
        swift_bridgeObjectRelease();
        v134 = "[%s] Did not opt into low cardio fitness pregnancy adjustment, not making adjustment";
        goto LABEL_80;
      }
      goto LABEL_82;
    }
    goto LABEL_109;
  }
  v75 = objc_msgSend(a1, sel_physiologicalWashoutEndDate);
  if (!v75)
  {
    v79 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v13 + 7);
    v78 = v174;
    v79((uint64_t)v27, 1, 1, v174);
    goto LABEL_72;
  }
  v76 = v75;
  sub_219681544();

  v77 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v13 + 4);
  v78 = v174;
  v77(v27, v16, v174);
  v79 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v13 + 7);
  v79((uint64_t)v27, 0, 1, v78);
  v80 = (unsigned int (*)(char *, uint64_t, uint64_t))*((_QWORD *)v13 + 6);
  if (v80(v27, 1, v78) == 1)
  {
LABEL_72:
    sub_21965C064((uint64_t)v27);
    v135 = v168;
    a3 = v169;
LABEL_73:
    v136 = objc_msgSend(a3, sel_postPregnancyFeatureAdjustmentCompletionDate);
    if (v136)
    {
      v137 = v136;
      sub_219681544();

      (*((void (**)(char *, char *, uint64_t))v13 + 4))(v21, v16, v78);
      v79((uint64_t)v21, 0, 1, v78);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v13 + 6))(v21, 1, v78) != 1)
      {
        sub_21965C064((uint64_t)v21);
        result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
        v16 = v181;
        if (result)
        {
          v138 = result;
          v139 = objc_msgSend(result, sel_showSensitiveLogItems);

          a1 = v180;
          if (v139)
          {
            if (qword_253E60AC8 == -1)
            {
LABEL_78:
              v140 = sub_21968164C();
              __swift_project_value_buffer(v140, (uint64_t)qword_253E60BE8);
              v128 = sub_219681634();
              v129 = sub_219681BD4();
              if (!os_log_type_enabled(v128, v129))
              {
LABEL_81:

                goto LABEL_82;
              }
              v130 = (uint8_t *)swift_slowAlloc();
              v131 = swift_slowAlloc();
              v183[0] = v131;
              *(_DWORD *)v130 = 136315138;
              v141 = sub_219681F34();
              v182 = sub_21967C8D8(v141, v142, v183);
              a3 = v169;
              sub_219681C58();
              swift_bridgeObjectRelease();
              v134 = "[%s] Physiological washout date has passed, and we have a post pregnancy adjustment date. No more w"
                     "ork needed here.";
LABEL_80:
              _os_log_impl(&dword_21961B000, v128, v129, v134, v130, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x219A3195C](v131, -1, -1);
              MEMORY[0x219A3195C](v130, -1, -1);
              goto LABEL_81;
            }
LABEL_103:
            swift_once();
            goto LABEL_78;
          }
LABEL_82:
          v178();

          goto LABEL_23;
        }
LABEL_111:
        __break(1u);
LABEL_112:
        __break(1u);
        goto LABEL_113;
      }
    }
    else
    {
      v79((uint64_t)v21, 1, 1, v78);
    }
    sub_21965C064((uint64_t)v21);
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    v16 = v181;
    if (result)
    {
      v143 = result;
      v144 = objc_msgSend(result, sel_showSensitiveLogItems);

      if (v144)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v145 = sub_21968164C();
        __swift_project_value_buffer(v145, (uint64_t)qword_253E60BE8);
        v146 = sub_219681634();
        v147 = sub_219681BD4();
        if (os_log_type_enabled(v146, v147))
        {
          v148 = (uint8_t *)swift_slowAlloc();
          v149 = swift_slowAlloc();
          v183[0] = v149;
          *(_DWORD *)v148 = 136315138;
          v150 = sub_219681F34();
          v182 = sub_21967C8D8(v150, v151, v183);
          v135 = v168;
          a3 = v169;
          sub_219681C58();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v146, v147, "[%s)] Physiological washout date has passed, but we have not yet adjusted features, making adjustment", v148, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v149, -1, -1);
          MEMORY[0x219A3195C](v148, -1, -1);
        }

      }
      sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
      v152 = (void *)sub_219681C1C();
      v153 = (uint64_t)v172;
      sub_219681568();
      v79(v153, 0, 1, v174);
      a1 = v180;
      sub_21965B29C(a3, (uint64_t)v16, v173, (uint64_t)v152, v153, v178, v177, a7, (uint64_t)v180, v135);

      sub_21965C064(v153);
      goto LABEL_13;
    }
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v166 = v80;
  v167 = v79;
  v81 = v171;
  v77(v171, v27, v78);
  sub_219681568();
  v82 = sub_219681520();
  v83 = (void (*)(char *, uint64_t))*((_QWORD *)v13 + 1);
  v83(v16, v78);
  if ((v82 & 1) == 0)
  {
    v83(v81, v78);
    v135 = v168;
    a3 = v169;
    v79 = v167;
    goto LABEL_73;
  }
  v13 = v83;
  v84 = objc_msgSend(v169, sel_postPregnancyFeatureAdjustmentCompletionDate);
  if (!v84)
  {
    v167((uint64_t)v24, 1, 1, v174);
LABEL_94:
    sub_21965C064((uint64_t)v24);
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    v16 = v181;
    v154 = v169;
    if (result)
    {
      v155 = result;
      v156 = objc_msgSend(result, sel_showSensitiveLogItems);

      a1 = v180;
      v157 = v171;
      v158 = v83;
      if (v156)
      {
        if (qword_253E60AC8 != -1)
          swift_once();
        v159 = sub_21968164C();
        __swift_project_value_buffer(v159, (uint64_t)qword_253E60BE8);
        v160 = sub_219681634();
        v161 = sub_219681BD4();
        if (os_log_type_enabled(v160, v161))
        {
          v162 = (uint8_t *)swift_slowAlloc();
          v163 = swift_slowAlloc();
          v183[0] = v163;
          *(_DWORD *)v162 = 136315138;
          v164 = sub_219681F34();
          v182 = sub_21967C8D8(v164, v165, v183);
          v154 = v169;
          sub_219681C58();
          v16 = v181;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v160, v161, "[%s] Physiological washout date has not yet passed, and we do not have a post pregnancy adjustment date. No adjustment needed yet.", v162, 0xCu);
          swift_arrayDestroy();
          v158 = v13;
          v157 = v171;
          MEMORY[0x219A3195C](v163, -1, -1);
          MEMORY[0x219A3195C](v162, -1, -1);
        }

      }
      v178();

      v158(v157, v174);
      goto LABEL_23;
    }
    goto LABEL_112;
  }
  v85 = v84;
  sub_219681544();

  v86 = v174;
  v77(v24, v16, v174);
  a1 = v167;
  v167((uint64_t)v24, 0, 1, v86);
  if (v166(v24, 1, v86) == 1)
    goto LABEL_94;
  sub_21965C064((uint64_t)v24);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  v16 = v181;
  a3 = v169;
  if (result)
  {
    v87 = result;
    v88 = objc_msgSend(result, sel_showSensitiveLogItems);

    v89 = v168;
    if (!v88)
    {
LABEL_41:
      sub_219654DFC(0, (unint64_t *)&qword_253E60AF0);
      v97 = (void *)sub_219681C1C();
      v98 = (uint64_t)v172;
      v99 = v174;
      a1((uint64_t)v172, 1, 1, v174);
      a1 = v180;
      sub_21965B29C(a3, (uint64_t)v16, v173, (uint64_t)v97, v98, v178, v177, a7, (uint64_t)v180, v89);

      sub_21965C064(v98);
      v13(v171, v99);
      goto LABEL_23;
    }
    if (qword_253E60AC8 == -1)
    {
LABEL_38:
      v90 = sub_21968164C();
      __swift_project_value_buffer(v90, (uint64_t)qword_253E60BE8);
      v91 = sub_219681634();
      v92 = sub_219681BD4();
      if (os_log_type_enabled(v91, v92))
      {
        v93 = (uint8_t *)swift_slowAlloc();
        v94 = swift_slowAlloc();
        v183[0] = v94;
        *(_DWORD *)v93 = 136315138;
        v95 = sub_219681F34();
        v182 = sub_21967C8D8(v95, v96, v183);
        a3 = v169;
        sub_219681C58();
        v16 = v181;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v91, v92, "[%s)] Physiological washout date has not passed, but we have an adjustment date! We made a mistake - reverting adjustment", v93, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v94, -1, -1);
        MEMORY[0x219A3195C](v93, -1, -1);
      }

      v89 = v168;
      goto LABEL_41;
    }
LABEL_105:
    swift_once();
    goto LABEL_38;
  }
LABEL_113:
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id sub_21965AE04(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void), void (*a7)(void), char *a8)
{
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void (**v30)(void);
  void (*v31)(void);
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id result;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  void (*v51)(void);
  void (*v52)(void);
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t aBlock[6];
  __int128 v58[2];
  _QWORD v59[6];

  v55 = a4;
  v56 = a1;
  v53 = a3;
  ObjectType = swift_getObjectType();
  sub_21965BFB8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59[3] = type metadata accessor for HDMCExperienceDaemonStore();
  v59[4] = sub_219654D90(&qword_253E610E8, (uint64_t (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore, (uint64_t)&protocol conformance descriptor for HDMCExperienceDaemonStore);
  v59[0] = a2;
  v18 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager];
  v54 = a8;
  if (v18)
  {
    v50 = ObjectType;
    v51 = a6;
    v52 = a7;
    swift_retain();
    v49 = v18;
LABEL_5:
    v48 = (id)*MEMORY[0x24BDD2EB0];
    sub_21965C0C8(a5, (uint64_t)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_21965BF28((uint64_t)v59, (uint64_t)v58);
    v22 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v23 = (v16 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
    v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
    v26 = (v25 + 47) & 0xFFFFFFFFFFFFFFF8;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v56;
    sub_21965C110((uint64_t)v17, v27 + v22);
    v28 = v53;
    v29 = v54;
    *(_QWORD *)(v27 + v23) = v54;
    *(_QWORD *)(v27 + v24) = v28;
    sub_21965C154(v58, v27 + v25);
    v30 = (void (**)(void))(v27 + v26);
    v31 = v52;
    *v30 = v51;
    v30[1] = v31;
    *(_QWORD *)(v27 + ((v26 + 23) & 0xFFFFFFFFFFFFFFF8)) = v50;
    aBlock[4] = (uint64_t)sub_21965C16C;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2196570EC;
    aBlock[3] = (uint64_t)&block_descriptor;
    v32 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    v33 = v49;
    swift_unknownObjectRetain();
    v34 = v48;
    v35 = v56;
    v36 = v29;
    v37 = v28;
    swift_retain();
    swift_release();
    objc_msgSend(v33, sel_setFeatureSettingNumber_forKey_completion_, v55, v34, v32);
    swift_unknownObjectRelease();
    _Block_release(v32);
    swift_unknownObjectRelease();

    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  }
  v19 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile];
  v20 = *MEMORY[0x24BDD2DD0];
  swift_retain();
  v21 = objc_msgSend(v19, sel_featureAvailabilityProvidingForFeatureIdentifier_, v20);
  if (v21)
  {
    v50 = ObjectType;
    v51 = a6;
    v52 = a7;
    v49 = v21;
    goto LABEL_5;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v39 = result;
    v40 = objc_msgSend(result, sel_showSensitiveLogItems);

    if (v40)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v41 = sub_21968164C();
      __swift_project_value_buffer(v41, (uint64_t)qword_253E60BE8);
      v42 = sub_219681634();
      v43 = sub_219681BBC();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        v45 = swift_slowAlloc();
        aBlock[0] = v45;
        *(_DWORD *)v44 = 136315138;
        v46 = sub_219681F34();
        *(_QWORD *)&v58[0] = sub_21967C8D8(v46, v47, aBlock);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v42, v43, "[%s] Could not get cardio fitness feature availability provider", v44, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v45, -1, -1);
        MEMORY[0x219A3195C](v44, -1, -1);
      }

    }
    a6();
    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  }
  __break(1u);
  return result;
}

id sub_21965B29C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void), void (*a7)(void), char *a8, uint64_t a9, uint64_t a10)
{
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_1;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(void);
  void (*v33)(void);
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id result;
  void *v41;
  unsigned int v42;
  void (*v43)(void);
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void (*v55)(void);
  void (*v56)(void);
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t aBlock[6];
  __int128 v63[2];
  uint64_t v64[6];

  v57 = a5;
  v60 = a3;
  v61 = a4;
  v59 = a1;
  ObjectType = swift_getObjectType();
  sub_21965BFB8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8]();
  v58 = (uint64_t)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64[3] = a9;
  v64[4] = a10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v64);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 16))(boxed_opaque_existential_1, a2, a9);
  v19 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager];
  if (v19)
  {
    v53 = a8;
    v54 = ObjectType;
    v55 = a6;
    v56 = a7;
    v52 = v19;
LABEL_5:
    v51 = (id)*MEMORY[0x24BDD2EB0];
    v21 = v58;
    sub_21965C0C8(v57, v58);
    sub_21965BF28((uint64_t)v64, (uint64_t)v63);
    v22 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v23 = (v17 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
    v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
    v26 = (v25 + 47) & 0xFFFFFFFFFFFFFFF8;
    v27 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
    v28 = swift_allocObject();
    v29 = v59;
    *(_QWORD *)(v28 + 16) = v59;
    sub_21965C110(v21, v28 + v22);
    v30 = v53;
    *(_QWORD *)(v28 + v23) = v53;
    v31 = v60;
    *(_QWORD *)(v28 + v24) = v60;
    sub_21965C154(v63, v28 + v25);
    v32 = (void (**)(void))(v28 + v26);
    v33 = v56;
    *v32 = v55;
    v32[1] = v33;
    *(_QWORD *)(v28 + v27) = v54;
    aBlock[4] = (uint64_t)sub_21965C16C;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2196570EC;
    aBlock[3] = (uint64_t)&block_descriptor_11;
    v34 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    v35 = v52;
    swift_unknownObjectRetain();
    v36 = v51;
    v37 = v29;
    v38 = v30;
    v39 = v31;
    swift_retain();
    swift_release();
    objc_msgSend(v35, sel_setFeatureSettingNumber_forKey_completion_, v61, v36, v34);
    swift_unknownObjectRelease();
    _Block_release(v34);
    swift_unknownObjectRelease();

    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  }
  v20 = objc_msgSend(*(id *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile], sel_featureAvailabilityProvidingForFeatureIdentifier_, *MEMORY[0x24BDD2DD0]);
  if (v20)
  {
    v53 = a8;
    v54 = ObjectType;
    v55 = a6;
    v56 = a7;
    v52 = v20;
    goto LABEL_5;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v41 = result;
    v42 = objc_msgSend(result, sel_showSensitiveLogItems);

    v43 = a6;
    if (v42)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v44 = sub_21968164C();
      __swift_project_value_buffer(v44, (uint64_t)qword_253E60BE8);
      v45 = sub_219681634();
      v46 = sub_219681BBC();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = swift_slowAlloc();
        aBlock[0] = v48;
        *(_DWORD *)v47 = 136315138;
        v49 = sub_219681F34();
        *(_QWORD *)&v63[0] = sub_21967C8D8(v49, v50, aBlock);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v45, v46, "[%s] Could not get cardio fitness feature availability provider", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v48, -1, -1);
        MEMORY[0x219A3195C](v47, -1, -1);
      }

    }
    v43();
    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  }
  __break(1u);
  return result;
}

id sub_21965B730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v21;

  v9 = (void *)sub_21968158C();
  v10 = sub_219681574();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a3, 1, v10) != 1)
  {
    v13 = (void *)sub_219681514();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  }
  if (v12(a4, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_219681514();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a4, v10);
  }
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  v15 = (void *)sub_219681B38();
  swift_bridgeObjectRelease();
  v16 = 0;
  if (v12(a6, 1, v10) != 1)
  {
    v16 = (void *)sub_219681514();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a6, v10);
  }
  v17 = objc_msgSend(v21, sel_initWithVersion_sampleUUID_educationalStepsReviewDate_configurationStepsReviewDate_pregnancyAdjustedFeaturesSet_postPregnancyFeatureAdjustmentCompletionDate_, a1, v9, v13, v14, v15, v16);

  v18 = sub_2196815BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a2, v18);
  return v17;
}

void sub_21965B8F4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;

  v42 = a2;
  v4 = sub_2196815BC();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v39 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v31 - v7;
  v32 = v2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_219681CA0();
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_21965C00C();
    sub_219681B74();
    a1 = v44;
    v36 = v45;
    v8 = v46;
    v9 = v47;
    v10 = v48;
  }
  else
  {
    v11 = -1 << *(_BYTE *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 56);
    v36 = a1 + 56;
    v13 = ~v11;
    v14 = -v11;
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v10 = v15 & v12;
    swift_bridgeObjectRetain();
    v8 = v13;
    v9 = 0;
  }
  v31 = v8;
  v34 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v35 = (unint64_t)(v8 + 64) >> 6;
  v33 = MEMORY[0x24BEE4AD0] + 8;
  v16 = v38;
  if ((a1 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  v17 = sub_219681CF4();
  if (v17)
  {
    v43 = v17;
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v18 = v49;
    swift_unknownObjectRelease();
    v19 = v9;
    v20 = v10;
    while (v18)
    {
      v37 = v10;
      v25 = objc_msgSend(v18, sel_sampleUUID, v31);
      sub_2196815A4();

      v26 = objc_msgSend(v42, sel_UUID);
      v27 = v39;
      sub_2196815A4();

      LOBYTE(v26) = sub_219681598();
      v28 = *(void (**)(char *, uint64_t))(v40 + 8);
      v29 = v27;
      v30 = v41;
      v28(v29, v41);
      v28(v16, v30);
      if ((v26 & 1) != 0)
        break;

      v9 = v19;
      v10 = v20;
      if (a1 < 0)
        goto LABEL_8;
LABEL_11:
      if (v10)
      {
        v20 = (v10 - 1) & v10;
        v21 = __clz(__rbit64(v10)) | (v9 << 6);
        v19 = v9;
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          return;
        }
        if (v22 >= v35)
          break;
        v23 = *(_QWORD *)(v36 + 8 * v22);
        v19 = v9 + 1;
        if (!v23)
        {
          v19 = v9 + 2;
          if (v9 + 2 >= v35)
            break;
          v23 = *(_QWORD *)(v36 + 8 * v19);
          if (!v23)
          {
            v19 = v9 + 3;
            if (v9 + 3 >= v35)
              break;
            v23 = *(_QWORD *)(v36 + 8 * v19);
            if (!v23)
            {
              v19 = v9 + 4;
              if (v9 + 4 >= v35)
                break;
              v23 = *(_QWORD *)(v36 + 8 * v19);
              if (!v23)
              {
                v19 = v9 + 5;
                if (v9 + 5 >= v35)
                  break;
                v23 = *(_QWORD *)(v36 + 8 * v19);
                if (!v23)
                {
                  v24 = v9 + 6;
                  while (v35 != v24)
                  {
                    v23 = *(_QWORD *)(v36 + 8 * v24++);
                    if (v23)
                    {
                      v19 = v24 - 1;
                      goto LABEL_28;
                    }
                  }
                  break;
                }
              }
            }
          }
        }
LABEL_28:
        v20 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v19 << 6);
      }
      v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v21);
    }
  }
  sub_21965C0A0();
}

void sub_21965BCC4(void (*a1)(void), void (*a2)(void))
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  swift_getObjectType();
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_showSensitiveLogItems);

    if (v6)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v7 = sub_21968164C();
      __swift_project_value_buffer(v7, (uint64_t)qword_253E60BE8);
      v8 = sub_219681634();
      v9 = sub_219681BD4();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        v11 = swift_slowAlloc();
        v14 = v11;
        *(_DWORD *)v10 = 136315138;
        v12 = sub_219681F34();
        sub_21967C8D8(v12, v13, &v14);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v8, v9, "[%s] Performing requested work", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v11, -1, -1);
        MEMORY[0x219A3195C](v10, -1, -1);
      }

    }
    sub_2196552A8(a1, a2);
  }
  else
  {
    __break(1u);
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t method lookup function for HDMCPregnancyFeatureAdjustmentManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.updateCardioFitnessSettingsIfNecessary(for:experienceStore:experienceModel:codableExperienceModel:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.pregnancyModelDidUpdate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.performWork(for:profile:databaseAccessibilityAssertion:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t sub_21965BF28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21965BF6C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_21965BFB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60BE0)
  {
    sub_219681574();
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60BE0);
  }
}

unint64_t sub_21965C00C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253E61240;
  if (!qword_253E61240)
  {
    v1 = sub_219654DFC(255, (unint64_t *)&qword_253E61238);
    result = MEMORY[0x219A318B4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_253E61240);
  }
  return result;
}

uint64_t sub_21965C064(uint64_t a1)
{
  uint64_t v2;

  sub_21965BFB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21965C0A0()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21965C0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21965BFB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21965C110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21965BFB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21965C154(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
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

void sub_21965C188()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255090360)
  {
    sub_21965BF6C(255, (unint64_t *)&qword_255090358);
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255090360);
  }
}

uint64_t sub_21965C1EC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21965C210()
{
  uint64_t v0;

  return sub_21966F000(*(_QWORD *)(v0 + 16));
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  sub_21965BFB8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);

  v5 = sub_219681574();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;

  __swift_destroy_boxed_opaque_existential_1(v0 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
  swift_release();
  return swift_deallocObject();
}

id sub_21965C34C(char a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  sub_21965BFB8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_219656A90(a1, a2, *(void **)(v2 + 16), v2 + v7, *(_QWORD *)(v2 + v8), *(void **)(v2 + v9), v2 + v10, *(uint64_t (**)(void))(v2 + ((v10 + 47) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((v10 + 47) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v2 + ((((v10 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t *sub_21965C3FC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_21965C560();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_21965C5BC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    sub_21965C618();
    v16 = v15;
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v17(v13, v14, v15);
    v17((char *)a1 + a3[7], (char *)a2 + a3[7], v16);
    v18 = a3[8];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    sub_21965C6E4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = a3[9];
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    sub_21965C748();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    *(uint64_t *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_21965C560()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60DA0)
  {
    v0 = sub_2196816B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60DA0);
  }
}

void sub_21965C5BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E611D0)
  {
    sub_2196815BC();
    v0 = sub_2196816B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E611D0);
  }
}

void sub_21965C618()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E611D8)
  {
    sub_21965C698(255);
    sub_219661094((unint64_t *)&qword_253E61128, (uint64_t (*)(uint64_t))sub_21965C698, sub_21965C6C8, MEMORY[0x24BE18AE8]);
    v0 = sub_2196816B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E611D8);
  }
}

void sub_21965C698(uint64_t a1)
{
  sub_21966164C(a1, &qword_253E61120, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(uint64_t a1)
{
  return sub_21965D034(a1, (uint64_t *)&unk_253E61110);
}

uint64_t sub_21965C6C8()
{
  return sub_219654D90(&qword_253E61100, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219686024);
}

void sub_21965C6E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E61200)
  {
    v0 = sub_219681934();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E61200);
  }
}

void sub_21965C748()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E611C8)
  {
    sub_21965BFB8();
    sub_21965C7A8();
    v0 = sub_2196816B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E611C8);
  }
}

unint64_t sub_21965C7A8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_253E610D8;
  if (!qword_253E610D8)
  {
    sub_21965BFB8();
    v2 = MEMORY[0x24BE17E18];
    result = MEMORY[0x219A318B4](MEMORY[0x24BE18AE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253E610D8);
  }
  return result;
}

uint64_t sub_21965C800(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_21965C560();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  sub_21965C5BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  sub_21965C618();
  v9 = v8;
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v10(v7, v8);
  v10(a1 + a2[7], v9);
  v11 = a1 + a2[8];
  sub_21965C6E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = a1 + a2[9];
  sub_21965C748();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21965C8F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_21965C560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_21965C5BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  sub_21965C618();
  v15 = v14;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  sub_21965C6E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  sub_21965C748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21965CA30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_21965C560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_21965C5BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  sub_21965C618();
  v15 = v14;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  sub_21965C6E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  sub_21965C748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21965CB74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_21965C560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_21965C5BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  sub_21965C618();
  v15 = v14;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  sub_21965C6E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  sub_21965C748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_21965CCA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_21965C560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_21965C5BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  sub_21965C618();
  v15 = v14;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  sub_21965C6E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  sub_21965C748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21965CDE4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21965CDF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;

  sub_21965C560();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  sub_21965C5BC();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_11:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  sub_21965C618();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_11;
  }
  sub_21965C6E4();
  v12 = *(_QWORD *)(v15 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v15;
    v13 = a3[8];
    goto LABEL_11;
  }
  sub_21965C748();
  v12 = *(_QWORD *)(v16 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v16;
    v13 = a3[9];
    goto LABEL_11;
  }
  v18 = *(_QWORD *)(a1 + a3[10]);
  if (v18 >= 0xFFFFFFFF)
    LODWORD(v18) = -1;
  return (v18 + 1);
}

uint64_t sub_21965CF04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21965CF10(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_21965C560();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
LABEL_12:
    v11(v12, a2, a2, v10);
    return;
  }
  sub_21965C5BC();
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_11:
    v12 = a1 + v15;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_12;
  }
  sub_21965C618();
  v14 = *(_QWORD *)(v16 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v16;
    v15 = a4[6];
    goto LABEL_11;
  }
  sub_21965C6E4();
  v14 = *(_QWORD *)(v17 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v17;
    v15 = a4[8];
    goto LABEL_11;
  }
  sub_21965C748();
  v14 = *(_QWORD *)(v18 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v18;
    v15 = a4[9];
    goto LABEL_11;
  }
  *(_QWORD *)(a1 + a4[10]) = (a2 - 1);
}

uint64_t type metadata accessor for CoherentExperienceSetupRecord(uint64_t a1)
{
  return sub_21965D034(a1, qword_253E61150);
}

uint64_t sub_21965D034(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21965D068()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_21965C560();
  if (v0 <= 0x3F)
  {
    sub_21965C5BC();
    if (v1 <= 0x3F)
    {
      sub_21965C618();
      if (v2 <= 0x3F)
      {
        sub_21965C6E4();
        if (v3 <= 0x3F)
        {
          sub_21965C748();
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t *sub_21965D14C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_219681574();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21965D1D8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_219681574();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21965D21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_219681574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21965D27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_219681574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21965D2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_219681574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21965D344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_219681574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21965D3A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21965D3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_219681574();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21965D430()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21965D43C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_219681574();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_21965D4B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_219681574();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21965D528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, char *, uint64_t);
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  int64_t v52;
  uint64_t v53;
  uint64_t result;
  int64_t v55;
  int v56;
  int v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v77 = a6;
  v86 = a5;
  v87 = a4;
  v88 = a3;
  v89 = a2;
  v91 = a1;
  sub_21965C748();
  v79 = *(_QWORD *)(v8 - 8);
  v80 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v78 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_219681574();
  v81 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21965BFB8();
  v76 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v75 = (uint64_t)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v83 = (uint64_t)&v73 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v73 - v18;
  sub_21965C698(0);
  v92 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v85 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v73 - v23;
  sub_21965C618();
  v90 = v25;
  v82 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v84 = (char *)&v73 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v73 - v28;
  v30 = sub_2196815BC();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v73 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for CoherentExperienceSetupRecord(0);
  *(_QWORD *)(a7 + *(int *)(v34 + 40)) = MEMORY[0x24BEE4B00];
  v93 = v91;
  sub_2196816C4();
  v73 = v31;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v36 = v34;
  v35(v33, v89, v30);
  v91 = a7;
  v74 = v30;
  v37 = v81;
  sub_2196816C4();
  sub_219661478(v88, (uint64_t)v19, (uint64_t (*)(_QWORD))sub_21965BFB8);
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  if (v38(v19, 1, v10) == 1)
  {
    v39 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v24, 1, 1, v39);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v12, v19, v10);
    v40 = sub_219660934(MEMORY[0x24BEE4AF8]);
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v24, v12, v10);
    v41 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    *(_QWORD *)&v24[*(int *)(v41 + 20)] = v40;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v24, 0, 1, v41);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v10);
  }
  sub_219661094((unint64_t *)&qword_253E61128, (uint64_t (*)(uint64_t))sub_21965C698, sub_21965C6C8, MEMORY[0x24BE18AE8]);
  sub_2196816C4();
  v42 = v91 + *(int *)(v34 + 24);
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 32);
  v43(v42, v29, v90);
  v44 = v83;
  sub_219661478(v87, v83, (uint64_t (*)(_QWORD))sub_21965BFB8);
  v45 = v38((char *)v44, 1, v10);
  v46 = v86;
  if (v45 == 1)
  {
    v47 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v85, 1, 1, v47);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v12, v44, v10);
    v48 = sub_219660934(MEMORY[0x24BEE4AF8]);
    v49 = v85;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v85, v12, v10);
    v50 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    *(_QWORD *)&v49[*(int *)(v50 + 20)] = v48;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v10);
  }
  v51 = v84;
  sub_2196816C4();
  v43(v91 + *(int *)(v36 + 28), v51, v90);
  v52 = *(_QWORD *)(v46 + 16);
  if (v52)
  {
    v90 = v36;
    v93 = MEMORY[0x24BEE4AF8];
    sub_21965FEBC(0, v52, 0);
    v53 = v93;
    result = sub_2196607AC(v46);
    v55 = result;
    v57 = v56;
    v59 = v58 & 1;
    v92 = v46 + 56;
    while ((v55 & 0x8000000000000000) == 0 && v55 < 1 << *(_BYTE *)(v46 + 32))
    {
      if (((*(_QWORD *)(v92 + (((unint64_t)v55 >> 3) & 0xFFFFFFFFFFFFF8)) >> v55) & 1) == 0)
        goto LABEL_20;
      if (*(_DWORD *)(v46 + 36) != v57)
        goto LABEL_21;
      v60 = sub_219681A6C();
      v62 = v61;
      v93 = v53;
      v63 = v46;
      v65 = *(_QWORD *)(v53 + 16);
      v64 = *(_QWORD *)(v53 + 24);
      if (v65 >= v64 >> 1)
      {
        sub_21965FEBC(v64 > 1, v65 + 1, 1);
        v53 = v93;
      }
      *(_QWORD *)(v53 + 16) = v65 + 1;
      v66 = v53 + 16 * v65;
      *(_QWORD *)(v66 + 32) = v60;
      *(_QWORD *)(v66 + 40) = v62;
      result = sub_219660850(v55, v57, v59 & 1, v63);
      v55 = result;
      v57 = v67;
      v59 = v68 & 1;
      --v52;
      v46 = v63;
      if (!v52)
      {
        sub_2196611C0(result, v67, v68 & 1);
        swift_bridgeObjectRelease();
        v36 = v90;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v53 = MEMORY[0x24BEE4AF8];
LABEL_18:
    v93 = v53;
    v69 = v91;
    v70 = MEMORY[0x24BEE0D00];
    sub_219654F34(0, (unint64_t *)&qword_253E61228, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21965ED44(&qword_255090438, (unint64_t *)&qword_253E61228, v70, MEMORY[0x24BEE12C8]);
    sub_219681940();
    v71 = v77;
    sub_219661478(v77, v75, (uint64_t (*)(_QWORD))sub_21965BFB8);
    sub_21965C7A8();
    v72 = v78;
    sub_2196816C4();
    sub_2196614BC(v71, (uint64_t (*)(_QWORD))sub_21965BFB8);
    sub_2196614BC(v87, (uint64_t (*)(_QWORD))sub_21965BFB8);
    sub_2196614BC(v88, (uint64_t (*)(_QWORD))sub_21965BFB8);
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v89, v74);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v79 + 32))(v69 + *(int *)(v36 + 36), v72, v80);
  }
  return result;
}

void sub_21965DC5C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  sub_21965BFB8();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v31 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v31 - v11;
  v13 = sub_2196815BC();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(a1, sel_sampleUUID);
  sub_2196815A4();

  v17 = objc_msgSend(a1, sel_educationalStepsReviewDate);
  if (v17)
  {
    v18 = v17;
    sub_219681544();

    v19 = sub_219681574();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 0, 1, v19);
  }
  else
  {
    v20 = sub_219681574();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 1, 1, v20);
  }
  v21 = objc_msgSend(a1, sel_configurationStepsReviewDate);
  if (v21)
  {
    v22 = v21;
    sub_219681544();

    v23 = sub_219681574();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v10, 0, 1, v23);
  }
  else
  {
    v24 = sub_219681574();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
  }
  v25 = objc_msgSend(a1, sel_pregnancyAdjustedFeaturesSet);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_219654D90((unint64_t *)&qword_255090010, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  v26 = sub_219681B44();

  v27 = objc_msgSend(a1, sel_postPregnancyFeatureAdjustmentCompletionDate);
  if (v27)
  {
    v28 = v27;
    sub_219681544();

    v29 = sub_219681574();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 0, 1, v29);
  }
  else
  {
    v30 = sub_219681574();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v7, 1, 1, v30);
  }
  sub_21965D528(1, (uint64_t)v15, (uint64_t)v12, (uint64_t)v10, v26, (uint64_t)v7, a2);

}

uint64_t sub_21965DF24()
{
  uint64_t result;

  strcpy((char *)&xmmword_255091E70, "modelVersion");
  BYTE13(xmmword_255091E70) = 0;
  HIWORD(xmmword_255091E70) = -5120;
  qword_255091E80 = swift_getKeyPath();
  unk_255091E88 = 0x5555656C706D6173;
  *(_QWORD *)&xmmword_255091E90 = 0xEA00000000004449;
  *((_QWORD *)&xmmword_255091E90 + 1) = swift_getKeyPath();
  unk_255091EA0 = 0xD000000000000020;
  qword_255091EA8 = 0x8000000219689D40;
  *(_QWORD *)&xmmword_255091EB0 = swift_getKeyPath();
  *((_QWORD *)&xmmword_255091EB0 + 1) = 0xD000000000000022;
  qword_255091EC0 = 0x8000000219689D70;
  qword_255091EC8 = swift_getKeyPath();
  unk_255091ED0 = 0xD00000000000001CLL;
  qword_255091ED8 = 0x8000000219689DA0;
  qword_255091EE0 = swift_getKeyPath();
  unk_255091EE8 = 0xD00000000000002CLL;
  *(_QWORD *)&xmmword_255091EF0 = 0x8000000219689DC0;
  result = swift_getKeyPath();
  *((_QWORD *)&xmmword_255091EF0 + 1) = result;
  return result;
}

uint64_t sub_21965E044(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x6974656C706D6F63;
}

BOOL sub_21965E08C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21965E0A4()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

uint64_t sub_21965E0EC()
{
  return sub_219681EE0();
}

uint64_t sub_21965E118()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

_QWORD *sub_21965E15C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == -1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_21965E17C(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = (uint64_t)((unint64_t)*v1 << 63) >> 63;
}

uint64_t sub_21965E18C()
{
  char *v0;

  return sub_21965E044(*v0);
}

uint64_t sub_21965E194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2196612F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21965E1B8()
{
  unsigned __int8 *v0;

  return (uint64_t)((unint64_t)*v0 << 63) >> 63;
}

uint64_t sub_21965E1C8@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  if (result == -1)
    v2 = 1;
  else
    v2 = 2;
  if (!result)
    v2 = 0;
  *a2 = v2;
  return result;
}

void sub_21965E1E4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24DB22D38;
}

uint64_t sub_21965E1F4()
{
  sub_21965EBF4();
  sub_21965EC3C();
  return sub_219681F10();
}

uint64_t sub_21965E238()
{
  sub_21965EC3C();
  return sub_219681F1C();
}

uint64_t sub_21965E260()
{
  sub_21965EC3C();
  return sub_219681F28();
}

uint64_t sub_21965E288(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;

  v3 = v1;
  sub_2196614F8(0, &qword_2550904A0, MEMORY[0x24BEE3520]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21965EC3C();
  sub_219681F04();
  v13 = 0;
  sub_219681574();
  sub_219654D90(&qword_2550904A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_219681E20();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0) + 20));
    v11[15] = 1;
    sub_2196613F4(0, &qword_255090488, MEMORY[0x24BEE0460]);
    sub_219661554(&qword_2550904B0, sub_2196615D4, MEMORY[0x24BEE1770], MEMORY[0x24BEE04C0]);
    sub_219681E20();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_21965E430@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v20 = a2;
  v24 = sub_219681574();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v21 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2196614F8(0, &qword_255090478, MEMORY[0x24BEE33E0]);
  v23 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - v7;
  v9 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21965EC3C();
  v22 = v8;
  v12 = v25;
  sub_219681EF8();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = a1;
  v25 = v6;
  v13 = (uint64_t)v11;
  v28 = 0;
  sub_219654D90(&qword_255090480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v15 = v21;
  v14 = v22;
  v16 = v23;
  v17 = v24;
  sub_219681E14();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v13, v15, v17);
  sub_2196613F4(0, &qword_255090488, MEMORY[0x24BEE0460]);
  v27 = 1;
  sub_219661554(&qword_255090490, sub_21966145C, MEMORY[0x24BEE1798], MEMORY[0x24BEE04E0]);
  sub_219681E14();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v16);
  *(_QWORD *)(v13 + *(int *)(v9 + 20)) = v26;
  sub_219661478(v13, v20, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return sub_2196614BC(v13, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_21965E700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v5[4];

  sub_219681ED4();
  sub_219681574();
  sub_219654D90(&qword_255090450, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_219681A18();
  v3 = *(_QWORD *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  sub_219660414(v5, v3);
  swift_bridgeObjectRelease();
  return sub_219681EEC();
}

uint64_t sub_21965E79C(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_219681574();
  sub_219654D90(&qword_255090450, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_219681A18();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_219660414(a1, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21965E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v6[4];

  sub_219681ED4();
  sub_219681574();
  sub_219654D90(&qword_255090450, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_219681A18();
  v4 = *(_QWORD *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_219660414(v6, v4);
  swift_bridgeObjectRelease();
  return sub_219681EEC();
}

uint64_t sub_21965E8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_219681538() & 1) != 0)
    return sub_21965F9BC(*(_QWORD *)(a1 + *(int *)(a3 + 20)), *(_QWORD *)(a2 + *(int *)(a3 + 20)));
  else
    return 0;
}

uint64_t sub_21965E90C()
{
  return 0;
}

uint64_t sub_21965E914@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21965E430(a1, a2);
}

uint64_t sub_21965E928(_QWORD *a1)
{
  return sub_21965E288(a1);
}

uint64_t sub_21965E93C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_219661478(v1, a1, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_21965E960()
{
  sub_21965C6C8();
  sub_21965ED90();
  return sub_219681964();
}

uint64_t sub_21965E9C0()
{
  sub_219654D90(&qword_2550904C0, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685C44);
  return sub_2196818C8();
}

uint64_t sub_21965EA24()
{
  sub_219654D90(&qword_2550904C0, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685C44);
  return sub_2196818D4();
}

uint64_t sub_21965EA84()
{
  sub_219654D90(&qword_2550904C0, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685C44);
  return sub_2196818BC();
}

uint64_t sub_21965EAD8()
{
  return sub_219654D90(&qword_253E61108, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685B24);
}

uint64_t sub_21965EB08()
{
  return sub_219654D90(&qword_255090370, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685BF4);
}

uint64_t sub_21965EB34()
{
  return sub_219654D90(&qword_255090378, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685BCC);
}

unint64_t sub_21965EB64()
{
  unint64_t result;

  result = qword_255090380;
  if (!qword_255090380)
  {
    result = MEMORY[0x219A318B4](&unk_219685C8C, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255090380);
  }
  return result;
}

unint64_t sub_21965EBAC()
{
  unint64_t result;

  result = qword_255090388;
  if (!qword_255090388)
  {
    result = MEMORY[0x219A318B4](&unk_219685D9C, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255090388);
  }
  return result;
}

unint64_t sub_21965EBF4()
{
  unint64_t result;

  result = qword_255090390;
  if (!qword_255090390)
  {
    result = MEMORY[0x219A318B4](&unk_219685D64, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255090390);
  }
  return result;
}

unint64_t sub_21965EC3C()
{
  unint64_t result;

  result = qword_255090398;
  if (!qword_255090398)
  {
    result = MEMORY[0x219A318B4](&unk_219685CC4, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255090398);
  }
  return result;
}

unint64_t sub_21965EC84()
{
  unint64_t result;

  result = qword_2550903A0;
  if (!qword_2550903A0)
  {
    result = MEMORY[0x219A318B4](&unk_219685D3C, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550903A0);
  }
  return result;
}

unint64_t sub_21965ECCC()
{
  unint64_t result;

  result = qword_2550903A8;
  if (!qword_2550903A8)
  {
    result = MEMORY[0x219A318B4](&unk_219685D14, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550903A8);
  }
  return result;
}

uint64_t sub_21965ED10()
{
  return sub_21965ED44(&qword_2550903B0, &qword_2550903B8, (uint64_t)&type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys, MEMORY[0x24BEE12E0]);
}

uint64_t sub_21965ED44(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_219654F34(255, a2, a3, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x219A318B4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21965ED90()
{
  return sub_219654D90(&qword_2550903C0, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685C1C);
}

uint64_t sub_21965EDAC()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817E4();
}

uint64_t sub_21965EE10()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681820();
}

uint64_t sub_21965EE6C()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817A8();
}

__n128 sub_21965EEC0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[32];
  __int128 v16;
  _BYTE v17[32];
  __int128 v18;
  _BYTE v19[32];
  __int128 v20;

  if (qword_25508FE70 != -1)
    swift_once();
  *(_OWORD *)v19 = *(_OWORD *)&qword_255091ED0;
  *(_OWORD *)&v19[16] = *(_OWORD *)&qword_255091EE0;
  v20 = xmmword_255091EF0;
  v16 = xmmword_255091E90;
  *(_OWORD *)v17 = *(_OWORD *)&qword_255091EA0;
  *(_OWORD *)&v17[16] = xmmword_255091EB0;
  v18 = *(_OWORD *)&qword_255091EC0;
  *(_OWORD *)v15 = xmmword_255091E70;
  *(_OWORD *)&v15[16] = *(_OWORD *)&qword_255091E80;
  v2 = xmmword_255091E70;
  v3 = unk_255091E88;
  v4 = qword_255091EA0;
  v5 = *((_QWORD *)&xmmword_255091EB0 + 1);
  v6 = qword_255091ED0;
  v7 = unk_255091EE8;
  v9 = *(_OWORD *)&v15[8];
  v10 = xmmword_255091E90;
  v11 = *(_OWORD *)&v17[8];
  v12 = *(_OWORD *)&qword_255091EC0;
  v13 = *(_OWORD *)&v19[8];
  v14 = xmmword_255091EF0;
  sub_2196610F8((uint64_t)v15);
  *(_QWORD *)a1 = v2;
  *(_OWORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 72) = v5;
  *(_OWORD *)(a1 + 80) = v12;
  *(_QWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 104) = v13;
  *(_QWORD *)(a1 + 120) = v7;
  result = (__n128)v14;
  *(_OWORD *)(a1 + 128) = v14;
  return result;
}

uint64_t sub_21965EFE0()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681844();
}

uint64_t sub_21965F020()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21965F02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_21965F060())()
{
  return nullsub_1;
}

uint64_t sub_21965F074@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;

  sub_21965BFB8();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v17 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = sub_2196815BC();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2196815B0();
  v14 = sub_219681574();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v15(v10, 1, 1, v14);
  v15(v8, 1, 1, v14);
  v15(v5, 1, 1, v14);
  return sub_21965D528(1, (uint64_t)v13, (uint64_t)v10, (uint64_t)v8, MEMORY[0x24BEE4B08], (uint64_t)v5, a1);
}

uint64_t sub_21965F1D0()
{
  sub_219654D90(&qword_253E61140, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685E3C);
  return sub_219681958();
}

uint64_t sub_21965F210()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817C0();
}

uint64_t sub_21965F268()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817F0();
}

uint64_t sub_21965F2B8()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681838();
}

uint64_t sub_21965F308()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817FC();
}

uint64_t sub_21965F370()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_21968182C();
}

uint64_t sub_21965F3C0()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681808();
}

uint64_t sub_21965F410()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817D8();
}

uint64_t sub_21965F468()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817B4();
}

uint64_t sub_21965F4D0()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681790();
}

uint64_t sub_21965F520()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_2196817CC();
}

uint64_t sub_21965F560()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_21968179C();
}

uint64_t sub_21965F5B0()
{
  sub_219654D90(&qword_255090410, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FFC);
  return sub_219681814();
}

uint64_t sub_21965F600()
{
  sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
  return sub_219681910();
}

uint64_t sub_21965F664()
{
  sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
  return sub_21968191C();
}

uint64_t sub_21965F6D8()
{
  return sub_219654D90(&qword_253E61148, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685FB4);
}

uint64_t sub_21965F704()
{
  return sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
}

uint64_t sub_21965F730()
{
  return sub_219654D90(&qword_2550903C8, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685E9C);
}

uint64_t sub_21965F75C()
{
  return sub_219654D90(&qword_2550903D0, (uint64_t (*)(uint64_t))sub_21965C560, MEMORY[0x24BE17EB8]);
}

uint64_t sub_21965F788()
{
  return sub_219654D90(&qword_2550903D8, (uint64_t (*)(uint64_t))sub_21965C5BC, MEMORY[0x24BE17EB8]);
}

uint64_t sub_21965F7B4()
{
  return sub_219654D90(&qword_2550903E0, (uint64_t (*)(uint64_t))sub_21965C618, MEMORY[0x24BE17EB8]);
}

uint64_t sub_21965F7E0()
{
  return sub_219654D90(&qword_2550903E8, (uint64_t (*)(uint64_t))sub_21965C6E4, MEMORY[0x24BE18738]);
}

uint64_t sub_21965F80C()
{
  return sub_219654D90(&qword_2550903F0, (uint64_t (*)(uint64_t))sub_21965C748, MEMORY[0x24BE17EB8]);
}

uint64_t sub_21965F838()
{
  return sub_219654D90(&qword_2550903F8, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685EFC);
}

uint64_t sub_21965F864()
{
  return sub_219654D90(&qword_253E610F8, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219685B6C);
}

uint64_t sub_21965F890()
{
  return sub_219654D90(&qword_253E61130, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685E04);
}

uint64_t sub_21965F8BC()
{
  return sub_219654D90(&qword_253E61140, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_219685E3C);
}

uint64_t sub_21965F8E8()
{
  return sub_219654D90(&qword_255090400, (uint64_t (*)(uint64_t))sub_21965F914, MEMORY[0x24BE18618]);
}

void sub_21965F914(uint64_t a1)
{
  sub_21965F938(a1, &qword_255090408, &qword_255090410, (uint64_t)&unk_219685FFC, MEMORY[0x24BE18608]);
}

void sub_21965F938(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (!*a2)
  {
    v10 = type metadata accessor for CoherentExperienceSetupRecord(255);
    v11 = sub_219654D90(a3, type metadata accessor for CoherentExperienceSetupRecord, a4);
    v12 = a5(a1, v10, v11);
    if (!v13)
      atomic_store(v12, a2);
  }
}

uint64_t sub_21965F9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  int v35;
  _BOOL8 v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  void (*v42)(char *, uint64_t);
  int64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;

  v4 = sub_219681688();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v43 - v9;
  sub_21966164C(0, &qword_255090458, (uint64_t (*)(uint64_t))sub_219661234, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v12);
  v17 = (int64_t *)((char *)&v43 - v16);
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v47 = a2;
  v48 = 0;
  v46 = a1;
  v20 = *(_QWORD *)(a1 + 64);
  v19 = a1 + 64;
  v18 = v20;
  v21 = 1 << *(_BYTE *)(v19 - 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v18;
  v44 = v19;
  v45 = (unint64_t)(v21 + 63) >> 6;
  v43 = v45 - 1;
  while (1)
  {
    if (v23)
    {
      v24 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      v25 = v47;
      v26 = v24 | (v48 << 6);
LABEL_8:
      v27 = *(_QWORD *)(v46 + 56);
      *(_QWORD *)v14 = *(_QWORD *)(*(_QWORD *)(v46 + 48) + 8 * v26);
      v28 = v27 + *(_QWORD *)(v5 + 72) * v26;
      sub_219661234();
      v30 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(&v14[*(int *)(v29 + 48)], v28, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v14, 0, 1, v30);
      goto LABEL_30;
    }
    v25 = v47;
    v31 = v48 + 1;
    if (__OFADD__(v48, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v31 < v45)
    {
      v32 = *(_QWORD *)(v44 + 8 * v31);
      if (v32)
        goto LABEL_12;
      v33 = v48 + 2;
      ++v48;
      if (v31 + 1 < v45)
      {
        v32 = *(_QWORD *)(v44 + 8 * v33);
        if (v32)
          goto LABEL_15;
        v48 = v31 + 1;
        if (v31 + 2 < v45)
        {
          v32 = *(_QWORD *)(v44 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_12;
          }
          v48 = v31 + 2;
          if (v31 + 3 < v45)
          {
            v32 = *(_QWORD *)(v44 + 8 * (v31 + 3));
            if (v32)
            {
              v31 += 3;
              goto LABEL_12;
            }
            v33 = v31 + 4;
            v48 = v31 + 3;
            if (v31 + 4 < v45)
              break;
          }
        }
      }
    }
LABEL_29:
    sub_219661234();
    v30 = v34;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v14, 1, 1, v34);
    v23 = 0;
LABEL_30:
    sub_21966129C((uint64_t)v14, (uint64_t)v17);
    sub_219661234();
    v35 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v17, 1, v30);
    v36 = v35 == 1;
    if (v35 == 1)
      return v36;
    v37 = (char *)v17 + *(int *)(v30 + 48);
    v38 = *v17;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v37, v4);
    v39 = sub_21965FDC4(v38);
    if ((v40 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return 0;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v8, *(_QWORD *)(v25 + 56) + *(_QWORD *)(v5 + 72) * v39, v4);
    sub_219654D90(&qword_255090470, (uint64_t (*)(uint64_t))MEMORY[0x24BE17E30], MEMORY[0x24BE17E50]);
    v41 = sub_219681A3C();
    v42 = *(void (**)(char *, uint64_t))(v5 + 8);
    v42(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v42)(v10, v4);
    if ((v41 & 1) == 0)
      return v36;
  }
  v32 = *(_QWORD *)(v44 + 8 * v33);
  if (v32)
  {
LABEL_15:
    v31 = v33;
LABEL_12:
    v23 = (v32 - 1) & v32;
    v26 = __clz(__rbit64(v32)) + (v31 << 6);
    v48 = v31;
    goto LABEL_8;
  }
  while (1)
  {
    v31 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v31 >= v45)
    {
      v48 = v43;
      goto LABEL_29;
    }
    v32 = *(_QWORD *)(v44 + 8 * v31);
    ++v33;
    if (v32)
      goto LABEL_12;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_21965FDC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_219681EC8();
  return sub_21965FDF4(a1, v2);
}

unint64_t sub_21965FDF4(uint64_t a1, uint64_t a2)
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

uint64_t sub_21965FE90(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21966009C(a1, a2, a3, (_QWORD *)*v3, sub_219661630, type metadata accessor for CoherentExperienceSetupRecord);
  *v3 = result;
  return result;
}

uint64_t sub_21965FEBC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21965FF20(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21965FED8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21966009C(a1, a2, a3, (_QWORD *)*v3, sub_2196615F0, (uint64_t (*)(_QWORD))sub_21966160C);
  *v3 = result;
  return result;
}

uint64_t sub_21965FF04(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21966027C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21965FF20(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    sub_219654F34(0, &qword_253E60DD8, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_219681DFC();
  __break(1u);
  return result;
}

uint64_t sub_21966009C(char a1, int64_t a2, char a3, _QWORD *a4, void (*a5)(_QWORD), uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  a5(0);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_219681DFC();
  __break(1u);
  return result;
}

uint64_t sub_21966027C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_21966164C(0, &qword_2550904D0, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_219681DFC();
  __break(1u);
  return result;
}

uint64_t sub_219660414(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  char *v39;
  int64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v4 = sub_219681688();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966164C(0, &qword_255090458, (uint64_t (*)(uint64_t))sub_219661234, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v35 - v11;
  v13 = *(_QWORD *)(a2 + 64);
  v36 = a2 + 64;
  v14 = 1 << *(_BYTE *)(a2 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v37 = (unint64_t)(v14 + 63) >> 6;
  v38 = a2;
  v35 = v37 - 1;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  v40 = 0;
  if (!v16)
    goto LABEL_6;
LABEL_4:
  v19 = v18;
  v20 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  v21 = v20 | (v40 << 6);
LABEL_5:
  v22 = *(_QWORD *)(*(_QWORD *)(v38 + 48) + 8 * v21);
  v23 = *(_QWORD *)(v38 + 56) + *(_QWORD *)(v5 + 72) * v21;
  sub_219661234();
  v25 = v24;
  (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(&v10[*(int *)(v24 + 48)], v23, v4);
  *(_QWORD *)v10 = v22;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v10, 0, 1, v25);
  v18 = v19;
  while (1)
  {
    sub_21966129C((uint64_t)v10, (uint64_t)v12);
    sub_219661234();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v12, 1, v25) == 1)
    {
      swift_release();
      return sub_219681EE0();
    }
    v31 = v39;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v39, &v12[*(int *)(v25 + 48)], v4);
    v32 = *((_QWORD *)a1 + 8);
    v33 = a1[1];
    v41 = *a1;
    v42 = v33;
    v34 = a1[3];
    v43 = a1[2];
    v44 = v34;
    v45 = v32;
    sub_219681EE0();
    sub_219654D90(&qword_255090468, (uint64_t (*)(uint64_t))MEMORY[0x24BE17E30], MEMORY[0x24BE17E48]);
    sub_219681A18();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v31, v4);
    result = sub_219681EEC();
    v18 ^= result;
    if (v16)
      goto LABEL_4;
LABEL_6:
    v26 = v40 + 1;
    if (__OFADD__(v40, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 < v37)
    {
      v27 = *(_QWORD *)(v36 + 8 * v26);
      if (v27)
        goto LABEL_9;
      v28 = v40 + 2;
      ++v40;
      if (v26 + 1 < v37)
      {
        v27 = *(_QWORD *)(v36 + 8 * v28);
        if (v27)
        {
          ++v26;
LABEL_9:
          v19 = v18;
          v16 = (v27 - 1) & v27;
          v21 = __clz(__rbit64(v27)) + (v26 << 6);
          v40 = v26;
          goto LABEL_5;
        }
        v29 = v26 + 2;
        v40 = v26 + 1;
        if (v26 + 2 < v37)
          break;
      }
    }
LABEL_21:
    sub_219661234();
    v25 = v30;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v10, 1, 1, v30);
    v16 = 0;
  }
  v27 = *(_QWORD *)(v36 + 8 * v29);
  if (v27)
  {
    v26 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    v26 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v26 >= v37)
    {
      v40 = v35;
      goto LABEL_21;
    }
    v27 = *(_QWORD *)(v36 + 8 * v26);
    ++v29;
    if (v27)
      goto LABEL_9;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2196607AC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

int64_t sub_219660850(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

unint64_t sub_219660934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  sub_2196611CC();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    sub_2196613F4(0, &qword_255090448, MEMORY[0x24BEE30A0]);
    v8 = (_QWORD *)sub_219681DF0();
    v9 = (char *)v6 + *(int *)(v3 + 48);
    v10 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v11 = *(_QWORD *)(v4 + 72);
    while (1)
    {
      sub_219661478(v10, (uint64_t)v6, (uint64_t (*)(_QWORD))sub_2196611CC);
      v12 = *v6;
      result = sub_21965FDC4(*v6);
      if ((v14 & 1) != 0)
        break;
      v15 = result;
      *(_QWORD *)((char *)v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v8[6] + 8 * result) = v12;
      v16 = v8[7];
      v17 = sub_219681688();
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15, v9, v17);
      v18 = v8[2];
      v19 = __OFADD__(v18, 1);
      v20 = v18 + 1;
      if (v19)
        goto LABEL_10;
      v8[2] = v20;
      v10 += v11;
      if (!--v7)
        return (unint64_t)v8;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_219660AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v41 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v4 = MEMORY[0x24BDAC7A8](v41);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t)&v40 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v43 = (uint64_t)&v40 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v44 = (uint64_t)&v40 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v40 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v42 = (uint64_t)&v40 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v40 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v40 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v40 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v40 - v27;
  v29 = sub_2196816AC();
  sub_219661478(a1, (uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
  sub_219661478(a2, (uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v29 & 1) == 0)
  {
    sub_2196614BC((uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2196614BC((uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
    sub_219661478(a1, (uint64_t)v23, type metadata accessor for CoherentExperienceSetupRecord);
    sub_219661478(a2, (uint64_t)v20, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_8;
  }
  sub_2196815BC();
  v40 = v6;
  sub_219654D90(&qword_255090430, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v6 = v40;
  v30 = sub_2196816AC();
  sub_2196614BC((uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2196614BC((uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
  sub_219661478(a1, (uint64_t)v23, type metadata accessor for CoherentExperienceSetupRecord);
  sub_219661478(a2, (uint64_t)v20, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v30 & 1) == 0)
  {
LABEL_8:
    sub_2196614BC((uint64_t)v20, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2196614BC((uint64_t)v23, type metadata accessor for CoherentExperienceSetupRecord);
    v32 = v42;
    sub_219661478(a1, v42, type metadata accessor for CoherentExperienceSetupRecord);
    sub_219661478(a2, (uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_9;
  }
  sub_21965C698(0);
  sub_219661094((unint64_t *)&qword_253E61128, (uint64_t (*)(uint64_t))sub_21965C698, sub_21965C6C8, MEMORY[0x24BE18AE8]);
  sub_219661094(&qword_255090428, (uint64_t (*)(uint64_t))sub_21965C698, sub_21965ED90, MEMORY[0x24BEE4AB8]);
  v31 = sub_2196816AC();
  sub_2196614BC((uint64_t)v20, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2196614BC((uint64_t)v23, type metadata accessor for CoherentExperienceSetupRecord);
  v32 = v42;
  sub_219661478(a1, v42, type metadata accessor for CoherentExperienceSetupRecord);
  v6 = v40;
  sub_219661478(a2, (uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v31 & 1) == 0)
  {
LABEL_9:
    sub_2196614BC((uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2196614BC(v32, type metadata accessor for CoherentExperienceSetupRecord);
    v34 = v44;
    sub_219661478(a1, v44, type metadata accessor for CoherentExperienceSetupRecord);
    v35 = v43;
    sub_219661478(a2, v43, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_10;
  }
  v33 = sub_2196816AC();
  sub_2196614BC((uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2196614BC(v32, type metadata accessor for CoherentExperienceSetupRecord);
  v34 = v44;
  sub_219661478(a1, v44, type metadata accessor for CoherentExperienceSetupRecord);
  v35 = v43;
  sub_219661478(a2, v43, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v33 & 1) == 0)
  {
LABEL_10:
    sub_2196614BC(v35, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2196614BC(v34, type metadata accessor for CoherentExperienceSetupRecord);
    v37 = v45;
    sub_219661478(a1, v45, type metadata accessor for CoherentExperienceSetupRecord);
    sub_219661478(a2, (uint64_t)v6, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_11;
  }
  v36 = sub_219681928();
  sub_2196614BC(v35, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2196614BC(v34, type metadata accessor for CoherentExperienceSetupRecord);
  v37 = v45;
  sub_219661478(a1, v45, type metadata accessor for CoherentExperienceSetupRecord);
  sub_219661478(a2, (uint64_t)v6, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v36 & 1) == 0)
  {
LABEL_11:
    v38 = 0;
    goto LABEL_12;
  }
  sub_21965BFB8();
  sub_21965C7A8();
  sub_219661094(&qword_255090418, (uint64_t (*)(uint64_t))sub_21965BFB8, sub_219661078, MEMORY[0x24BEE4AB8]);
  v38 = sub_2196816AC();
LABEL_12:
  sub_2196614BC((uint64_t)v6, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2196614BC(v37, type metadata accessor for CoherentExperienceSetupRecord);
  return v38 & 1;
}

uint64_t sub_219661078()
{
  return sub_219654D90(&qword_255090420, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
}

uint64_t sub_219661094(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = a2(255);
    v9 = a3();
    result = MEMORY[0x219A318B4](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2196610F8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_2196611C0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_2196611CC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255090440)
  {
    sub_219681688();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255090440);
  }
}

void sub_219661234()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255090460)
  {
    sub_219681688();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255090460);
  }
}

uint64_t sub_21966129C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21966164C(0, &qword_255090458, (uint64_t (*)(uint64_t))sub_219661234, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2196612F8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6974656C706D6F63 && a2 == 0xEE00657461446E6FLL;
  if (v3 || (sub_219681E68() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000219689E50)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_219681E68();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_2196613F4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_219681688();
    v7 = a3(a1, MEMORY[0x24BEE1768], v6, MEMORY[0x24BEE1778]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_21966145C()
{
  return sub_219654D90(&qword_255090498, (uint64_t (*)(uint64_t))MEMORY[0x24BE17E30], MEMORY[0x24BE17E58]);
}

uint64_t sub_219661478(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2196614BC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_2196614F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21965EC3C();
    v7 = a3(a1, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_219661554(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  result = *a1;
  if (!result)
  {
    sub_2196613F4(255, &qword_255090488, MEMORY[0x24BEE0460]);
    v10 = v9;
    v11[0] = a3;
    v11[1] = a2();
    result = MEMORY[0x219A318B4](a4, v10, v11);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2196615D4()
{
  return sub_219654D90(&qword_2550904B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE17E30], MEMORY[0x24BE17E40]);
}

void sub_2196615F0(uint64_t a1)
{
  sub_21966164C(a1, &qword_2550904C8, (uint64_t (*)(uint64_t))sub_21966160C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
}

void sub_21966160C(uint64_t a1)
{
  sub_21965F938(a1, &qword_253E611F8, &qword_253E61138, (uint64_t)&unk_21968605C, MEMORY[0x24BE18658]);
}

void sub_219661630(uint64_t a1)
{
  sub_21966164C(a1, &qword_2550904D8, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
}

void sub_21966164C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_219661790 + 4 * byte_219685AE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2196617C4 + 4 * byte_219685AE0[v4]))();
}

uint64_t sub_2196617C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2196617CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2196617D4);
  return result;
}

uint64_t sub_2196617E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2196617E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2196617EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2196617F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_219661800(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_219661808(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys()
{
  return &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys;
}

unint64_t sub_219661828()
{
  unint64_t result;

  result = qword_2550904E0;
  if (!qword_2550904E0)
  {
    result = MEMORY[0x219A318B4](&unk_219686224, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550904E0);
  }
  return result;
}

void sub_21966186C(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  id v29;

  v4 = v3;
  v5 = a3;
  if ((a3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_219681CA0();
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_219665924((unint64_t *)&qword_253E61240, (unint64_t *)&qword_253E61238);
    sub_219681B74();
    v5 = v24;
    v23 = v25;
    v7 = v26;
    v8 = v27;
    v9 = v28;
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a3 + 32);
    v23 = a3 + 56;
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(a3 + 56);
    swift_bridgeObjectRetain();
    v7 = v11;
    v8 = 0;
  }
  v22 = (unint64_t)(v7 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (!sub_219681CF4())
    goto LABEL_36;
  sub_219654DFC(0, (unint64_t *)&qword_253E61238);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v14 = v29;
  swift_unknownObjectRelease();
  v15 = v8;
  v16 = v9;
  if (!v14)
    goto LABEL_36;
  while (1)
  {
    v29 = v14;
    v20 = a1(&v29);
    if (v4)
    {

      goto LABEL_36;
    }
    if ((v20 & 1) != 0)
      goto LABEL_36;

    v8 = v15;
    v9 = v16;
    if (v5 < 0)
      goto LABEL_8;
LABEL_11:
    if (!v9)
      break;
    v16 = (v9 - 1) & v9;
    v17 = __clz(__rbit64(v9)) | (v8 << 6);
    v15 = v8;
LABEL_24:
    v14 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    if (!v14)
      goto LABEL_36;
  }
  v15 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    return;
  }
  if (v15 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v15);
  if (v18)
  {
LABEL_23:
    v16 = (v18 - 1) & v18;
    v17 = __clz(__rbit64(v18)) + (v15 << 6);
    goto LABEL_24;
  }
  v19 = v8 + 2;
  if (v8 + 2 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
    goto LABEL_22;
  v19 = v8 + 3;
  if (v8 + 3 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
    goto LABEL_22;
  v19 = v8 + 4;
  if (v8 + 4 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
  {
LABEL_22:
    v15 = v19;
    goto LABEL_23;
  }
  v15 = v8 + 5;
  if (v8 + 5 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v15);
  if (v18)
    goto LABEL_23;
  v21 = v8 + 6;
  while (v22 != v21)
  {
    v18 = *(_QWORD *)(v23 + 8 * v21++);
    if (v18)
    {
      v15 = v21 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_21965C0A0();
}

uint64_t HDMCPregnancyStateFactory.init(profile:experienceDaemonStore:todayDayIndex:calendar:gregorianCalendar:)@<X0>(void *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 *v37;
  uint64_t v38;

  v38 = a4;
  v37 = a2;
  v36 = sub_219681574();
  v11 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (int *)type metadata accessor for HDMCPregnancyStateFactory();
  v15 = v14[9];
  v35 = a6;
  *(uint64_t *)((char *)a6 + v15) = 0x4167124000000000;
  v16 = (void *)objc_opt_self();
  v17 = (void *)sub_2196815EC();
  v18 = objc_msgSend(v16, sel_hk_dateOnDayIndex_atHour_calendar_, a3, 12, v17);

  sub_219681544();
  sub_219654DFC(0, &qword_253E60C68);
  _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE26predicateForOngoingSamples2onABSi_tFZ_0(a3);
  v20 = (void *)v19;
  v21 = static HDCategorySampleEntity.pregnancySamples(profile:predicate:)((uint64_t)a1, v19);
  if (v6)
  {

    v22 = sub_21968161C();
    v23 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8);
    v23(a5, v22);
    v23(v38, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v36);
  }
  else
  {
    v25 = v21;

    v26 = v35;
    *v35 = v25;
    v27 = v26;
    v28 = (void *)_sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE45predicateForSamplesThatEndedInTheTwelveMonths6beforeAB10Foundation4DateV_tFZ_0(v13);
    v29 = static HDCategorySampleEntity.pregnancySamples(profile:predicate:)((uint64_t)a1, (uint64_t)v28);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v36);
    v27[1] = v29;
    sub_21965C154(v37, (uint64_t)(v27 + 2));
    v30 = (uint64_t)v27 + v14[7];
    v31 = v27;
    v32 = sub_21968161C();
    v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 32);
    v33(v30, v38, v32);
    return ((uint64_t (*)(char *, uint64_t, uint64_t))v33)((char *)v31 + v14[8], a5, v32);
  }
}

uint64_t type metadata accessor for HDMCPregnancyStateFactory()
{
  uint64_t result;

  result = qword_253E60AB8;
  if (!qword_253E60AB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t static HDCategorySampleEntity.pregnancySamples(profile:predicate:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *ObjCClassFromMetadata;
  unint64_t inited;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  unsigned int v16;
  id v17;
  char isEscapingClosureAtFileLocation;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t (*v23)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t result;
  unint64_t v36;
  id aBlock[12];

  v4 = v2;
  aBlock[11] = *(id *)MEMORY[0x24BDAC8D0];
  v36 = MEMORY[0x24BEE4AF8];
  sub_219654DFC(0, &qword_253E60C68);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_219665044();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2196856B0;
  sub_219654DFC(0, &qword_253E60C38);
  *(_QWORD *)(inited + 32) = MEMORY[0x219A30B58]((id)*MEMORY[0x24BDD29D8]);
  sub_219681AF0();
  sub_21967D39C(inited);
  swift_bridgeObjectRelease();
  sub_219654DFC(0, (unint64_t *)&unk_253E60C20);
  sub_219665924((unint64_t *)&qword_253E60C30, (unint64_t *)&unk_253E60C20);
  v9 = (void *)sub_219681B38();
  swift_bridgeObjectRelease();
  aBlock[0] = 0;
  v10 = objc_msgSend(ObjCClassFromMetadata, sel_entityEnumeratorWithTypes_profile_error_, v9, a1, aBlock);

  if (!v10)
  {
    v21 = aBlock[0];
    v22 = (void *)sub_2196814D8();

    swift_willThrow();
    v23 = 0;
LABEL_11:
    if (qword_253E60AC8 != -1)
      swift_once();
    v24 = sub_21968164C();
    v20 = __swift_project_value_buffer(v24, (uint64_t)qword_253E60BE8);
    v25 = v22;
    v26 = v22;
    v27 = sub_219681634();
    v28 = sub_219681BBC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      aBlock[0] = v30;
      *(_DWORD *)v29 = 136446466;
      v31 = sub_219681F34();
      sub_21967C8D8(v31, v32, (uint64_t *)aBlock);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_getErrorValue();
      v33 = sub_219681E8C();
      v20 = v34;
      sub_21967C8D8(v33, v34, (uint64_t *)aBlock);
      sub_219681C58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21961B000, v27, v28, "[%{public}s] Error enumerating entities: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v30, -1, -1);
      MEMORY[0x219A3195C](v29, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_21966509C((uint64_t)v23);
    return v20;
  }
  v11 = aBlock[0];
  objc_msgSend(v10, sel_setPredicate_, a2);
  v12 = (void *)sub_219681B2C();
  objc_msgSend(v10, sel_setEncodingOption_forKey_, v12, *MEMORY[0x24BE40840]);

  objc_msgSend(v10, sel_setLimitCount_, *MEMORY[0x24BE40E68]);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &v36;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = sub_2196650BC;
  v14[3] = v13;
  aBlock[4] = sub_2196650D4;
  aBlock[5] = v14;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_21966392C;
  aBlock[3] = &block_descriptor_0;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  v16 = objc_msgSend(v10, sel_enumerateIncludingDeletedObjects_error_handler_, 0, aBlock, v15);
  _Block_release(v15);
  v17 = aBlock[0];
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (!v16)
  {
    v22 = (void *)sub_2196814D8();

    swift_willThrow();
    v23 = sub_2196650BC;
    goto LABEL_11;
  }
  v4 = v36;
  if ((v36 & 0x8000000000000000) == 0 && (v36 & 0x4000000000000000) == 0)
  {
    v19 = (void *)(v36 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRetain_n();
  v19 = sub_219663A1C(v4);
  swift_bridgeObjectRelease();
LABEL_7:
  aBlock[0] = v19;
  sub_2196639A4((uint64_t *)aBlock);
  if (!v3)
  {
    swift_bridgeObjectRelease();

    v36 = (unint64_t)aBlock[0];
    swift_bridgeObjectRelease();
    v20 = v36;
    swift_release();
    return v20;
  }
  result = swift_release();
  __break(1u);
  return result;
}

id HDMCPregnancyStateFactory.deriveState()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  id result;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  _QWORD *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v1 = v0;
  v2 = sub_2196815BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966164C(0, (unint64_t *)&qword_253E60BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v61 - v10;
  v12 = type metadata accessor for HDMCPregnancyStateFactory();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v68 = (uint64_t *)((char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v61 - v16);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v61 - v18;
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!result)
    goto LABEL_41;
  v21 = result;
  v22 = objc_msgSend(result, sel_showSensitiveLogItems);

  if (!v22)
    goto LABEL_15;
  v63 = v9;
  v64 = v5;
  if (qword_253E60AC8 != -1)
    goto LABEL_32;
  while (1)
  {
    v23 = sub_21968164C();
    __swift_project_value_buffer(v23, (uint64_t)qword_253E60BE8);
    sub_219665110((uint64_t)v1, (uint64_t)v19);
    v24 = sub_219681634();
    v25 = sub_219681BD4();
    v26 = os_log_type_enabled(v24, v25);
    v66 = v1;
    v67 = v11;
    v65 = v2;
    if (v26)
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v62 = v3;
      v29 = v28;
      v72 = v28;
      *(_DWORD *)v27 = 136446466;
      v69 = sub_21967C8D8(0xD000000000000019, 0x8000000219686250, &v72);
      sub_219681C58();
      *(_WORD *)(v27 + 12) = 2080;
      v61 = v27 + 14;
      v69 = 0;
      v70 = 0xE000000000000000;
      sub_219681D48();
      swift_bridgeObjectRelease();
      v69 = 0xD000000000000015;
      v70 = 0x8000000219689EF0;
      v30 = sub_219654DFC(0, &qword_2550904E8);
      v31 = swift_bridgeObjectRetain();
      MEMORY[0x219A30A5C](v31, v30);
      sub_219681A9C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_219681E74();
      v32 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_219681C70();
      swift_unknownObjectRelease();
      v33 = sub_219681A78();
      v69 = sub_21967C8D8(v33, v34, &v72);
      v2 = v65;
      sub_219681C58();
      v1 = v66;
      swift_bridgeObjectRelease();
      sub_219665154((uint64_t)v19);
      _os_log_impl(&dword_21961B000, v24, v25, "[%{public}s] %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      v35 = v29;
      v3 = v62;
      MEMORY[0x219A3195C](v35, -1, -1);
      MEMORY[0x219A3195C](v27, -1, -1);
    }
    else
    {
      sub_219665154((uint64_t)v19);
    }

    sub_219665110((uint64_t)v1, (uint64_t)v17);
    v36 = v68;
    sub_219665110((uint64_t)v1, (uint64_t)v68);
    v37 = sub_219681634();
    v19 = (char *)sub_219681BD4();
    if (os_log_type_enabled(v37, (os_log_type_t)v19))
    {
      v38 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v72 = v62;
      *(_DWORD *)v38 = 136446722;
      v69 = sub_21967C8D8(0xD000000000000019, 0x8000000219686250, &v72);
      sub_219681C58();
      *(_WORD *)(v38 + 12) = 2080;
      v69 = 0;
      v70 = 0xE000000000000000;
      sub_219681D48();
      swift_bridgeObjectRelease();
      v69 = 0xD00000000000001BLL;
      v70 = 0x8000000219689EA0;
      if (*v17 >> 62)
      {
        swift_bridgeObjectRetain();
        v39 = sub_219681DE4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v39 = *(_QWORD *)((*v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v71 = v39;
      sub_219681E44();
      sub_219681A9C();
      swift_bridgeObjectRelease();
      sub_219681E74();
      v40 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_219681C70();
      swift_unknownObjectRelease();
      v41 = sub_219681A78();
      v69 = sub_21967C8D8(v41, v42, &v72);
      sub_219681C58();
      swift_bridgeObjectRelease();
      sub_219665154((uint64_t)v17);
      *(_WORD *)(v38 + 22) = 2080;
      v69 = 0;
      v70 = 0xE000000000000000;
      sub_219681D48();
      swift_bridgeObjectRelease();
      v69 = 0xD000000000000022;
      v70 = 0x8000000219689EC0;
      if (*v68 >> 62)
      {
        swift_bridgeObjectRetain();
        v43 = sub_219681DE4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v43 = *(_QWORD *)((*v68 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v71 = v43;
      sub_219681E44();
      sub_219681A9C();
      swift_bridgeObjectRelease();
      sub_219681E74();
      v44 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_219681C70();
      swift_unknownObjectRelease();
      v45 = sub_219681A78();
      v69 = sub_21967C8D8(v45, v46, &v72);
      sub_219681C58();
      swift_bridgeObjectRelease();
      sub_219665154((uint64_t)v68);
      _os_log_impl(&dword_21961B000, v37, (os_log_type_t)v19, "[%{public}s] %s, %s", (uint8_t *)v38, 0x20u);
      v47 = v62;
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v47, -1, -1);
      MEMORY[0x219A3195C](v38, -1, -1);

      v1 = v66;
      v11 = v67;
      v2 = v65;
    }
    else
    {
      sub_219665154((uint64_t)v17);
      sub_219665154((uint64_t)v36);

      v11 = v67;
    }
    v9 = v63;
    v5 = v64;
LABEL_15:
    v48 = *v1;
    if (*v1 >> 62)
      break;
    v49 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v49)
      goto LABEL_22;
LABEL_17:
    if ((v48 & 0xC000000000000001) != 0)
    {
      v50 = (id)MEMORY[0x219A30CD8](0, v48);
      goto LABEL_20;
    }
    if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v50 = *(id *)(v48 + 32);
LABEL_20:
      v51 = v50;
      swift_bridgeObjectRelease();
      v52 = objc_msgSend(v51, sel_UUID);
      sub_2196815A4();

      sub_219662F40((uint64_t)v5, (uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3CA8]), sel_initWithPregnancySample_state_, v51, 1);
      v54 = sub_219681C10();

      goto LABEL_36;
    }
    __break(1u);
LABEL_32:
    swift_once();
  }
  swift_bridgeObjectRetain();
  if (sub_219681DE4())
    goto LABEL_17;
LABEL_22:
  swift_bridgeObjectRelease();
  v55 = v1[1];
  if (!(v55 >> 62))
  {
    v56 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (v56)
      goto LABEL_24;
LABEL_34:
    swift_bridgeObjectRelease();
LABEL_35:
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3CA8]), sel_initWithPregnancySample_state_, 0, 0);
    v60 = sub_219681574();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v11, 1, 1, v60);
    v54 = sub_219681C10();
    goto LABEL_36;
  }
  swift_bridgeObjectRetain();
  result = (id)sub_219681DE4();
  if (!result)
    goto LABEL_34;
LABEL_24:
  if ((v55 & 0xC000000000000001) != 0)
  {
    v57 = (id)MEMORY[0x219A30CD8](0, v55);
    goto LABEL_27;
  }
  if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v57 = *(id *)(v55 + 32);
LABEL_27:
    v58 = v57;
    swift_bridgeObjectRelease();
    v59 = objc_msgSend(v58, sel_UUID);
    sub_2196815A4();

    sub_219662F40((uint64_t)v5, (uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((sub_2196635D8(v58) & 1) == 0)
    {
      sub_21965C064((uint64_t)v9);

      goto LABEL_35;
    }
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3CA8]), sel_initWithPregnancySample_state_, v58, 2);
    v54 = sub_219681C10();

    v11 = v9;
LABEL_36:

    sub_21965C064((uint64_t)v11);
    return (id)v54;
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t String.init<A>(describingSensitive:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_219664FDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

id sub_219662F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id result;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint8_t *v43;
  uint64_t v44;
  int v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;

  v3 = v2;
  v48 = a2;
  sub_21966164C(0, (unint64_t *)&qword_253E60BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)v42 - v6;
  v7 = sub_2196815BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21968164C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v16 = result;
    v17 = objc_msgSend(result, sel_showSensitiveLogItems);

    v47 = a1;
    if (v17)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v11, (uint64_t)qword_253E60BE8);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v18, v11);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
      v19 = sub_219681634();
      v20 = sub_219681BD4();
      v21 = v20;
      if (os_log_type_enabled(v19, v20))
      {
        v45 = v21;
        v22 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v51 = v44;
        *(_DWORD *)v22 = 136315138;
        v42[1] = v22 + 12;
        v43 = v22;
        v49 = 0;
        v50 = 0xE000000000000000;
        sub_219681D48();
        v42[0] = v22 + 4;
        sub_219681A9C();
        sub_219681A9C();
        sub_219681A9C();
        sub_219681580();
        sub_219681A9C();
        swift_bridgeObjectRelease();
        sub_219681E74();
        v23 = (id)HKSensitiveLogItem();
        swift_unknownObjectRelease();
        sub_219681C70();
        swift_unknownObjectRelease();
        v24 = sub_219681A78();
        v49 = sub_21967C8D8(v24, v25, &v51);
        sub_219681C58();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        v26 = v43;
        _os_log_impl(&dword_21961B000, v19, (os_log_type_t)v45, "%s", v43, 0xCu);
        v27 = v44;
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v27, -1, -1);
        MEMORY[0x219A3195C](v26, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    v28 = v3[5];
    v29 = v3[6];
    __swift_project_boxed_opaque_existential_1(v3 + 2, v28);
    v31 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 16))(v28, v29);
    v32 = objc_msgSend(v31, sel_pregnancyModeSetupCompletionSet);
    sub_219654DFC(0, (unint64_t *)&qword_253E61238);
    sub_219665924((unint64_t *)&qword_253E61240, (unint64_t *)&qword_253E61238);
    v33 = sub_219681B44();

    MEMORY[0x24BDAC7A8](v34);
    v42[-2] = v47;
    sub_21966186C(sub_219665964, (uint64_t)&v42[-4], v33);
    v36 = v35;
    swift_bridgeObjectRelease();
    if (v36)
    {
      v37 = objc_msgSend(v36, sel_educationalStepsReviewDate);
      if (v37)
      {
        v38 = v37;
        v39 = (uint64_t)v46;
        sub_219681544();

        v40 = sub_219681574();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 0, 1, v40);
      }
      else
      {

        v41 = sub_219681574();
        v39 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v46, 1, 1, v41);
      }
      return (id)sub_21965C110(v39, v48);
    }
    else
    {

      v30 = sub_219681574();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v48, 1, 1, v30);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2196635D8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void (*v18)(char *, uint64_t);
  id v19;
  char v20;
  uint64_t v22;

  v2 = v1;
  v4 = sub_219681574();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v22 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v14 = objc_msgSend(a1, sel_endDate);
  sub_219681544();

  v15 = objc_msgSend(a1, sel_startDate);
  sub_219681544();

  sub_219681508();
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v11, v4);
  v18(v13, v4);
  if (v17 >= *(double *)(v2 + *(int *)(type metadata accessor for HDMCPregnancyStateFactory() + 36)))
  {
    v20 = 1;
  }
  else
  {
    sub_219681568();
    sub_21968155C();
    v18(v13, v4);
    v19 = objc_msgSend(a1, sel_endDate);
    sub_219681544();

    sub_219654D90(&qword_2550904F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    LOBYTE(v19) = sub_219681A30();
    v18(v13, v4);
    v18(v8, v4);
    v20 = v19 ^ 1;
  }
  return v20 & 1;
}

uint64_t sub_2196637D8(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  char v7;
  uint64_t v9;

  v2 = sub_2196815BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(*a1, sel_sampleUUID);
  sub_2196815A4();

  v7 = sub_219681598();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_219663898(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  if (a1)
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x219A30A38](a1);
      if (*(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_219681AFC();
      sub_219681B14();
      sub_219681AF0();
    }
  }
  return 1;
}

uint64_t sub_21966392C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(void *, void *, uint64_t, uint64_t);
  id v10;
  id v11;

  v9 = *(uint64_t (**)(void *, void *, uint64_t, uint64_t))(a1 + 32);
  v10 = a2;
  v11 = a3;
  LOBYTE(a5) = v9(a2, a3, a4, a5);

  return a5 & 1;
}

uint64_t sub_2196639A4(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_219664FB4();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_219663B0C(v6);
  return sub_219681D90();
}

_QWORD *sub_219663A1C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      sub_219665044();
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_219664CA4((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_219663B0C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  unint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  char v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void **v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  v133 = sub_219681574();
  v131 = *(_QWORD *)(v133 - 8);
  v2 = MEMORY[0x24BDAC7A8](v133);
  v132 = (char *)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v119 - v4;
  v6 = a1[1];
  v7 = sub_219681E38();
  if (v7 >= v6)
  {
    if (v6 < 0)
      goto LABEL_133;
    if (v6)
      sub_219664400(0, v6, 1, a1);
    return;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_141;
  v124 = v7;
  v120 = a1;
  if (v6 < 2)
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
    v135 = MEMORY[0x24BEE4AF8];
    v129 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      v15 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_100:
      v110 = v130;
      if (v15 >= 2)
      {
        v111 = *v120;
        do
        {
          v112 = v15 - 2;
          if (v15 < 2)
            goto LABEL_128;
          if (!v111)
            goto LABEL_140;
          v113 = v11;
          v114 = v11 + 32;
          v115 = *(_QWORD *)&v11[16 * v112 + 32];
          v116 = *(_QWORD *)&v11[16 * v15 + 24];
          sub_2196645C0((void **)(v111 + 8 * v115), (id *)(v111 + 8 * *(_QWORD *)&v114[16 * v15 - 16]), (id *)(v111 + 8 * v116), v129);
          if (v110)
            break;
          if (v116 < v115)
            goto LABEL_129;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v113 = sub_219664C90((uint64_t)v113);
          if (v112 >= *((_QWORD *)v113 + 2))
            goto LABEL_130;
          v117 = &v113[16 * v112 + 32];
          *(_QWORD *)v117 = v115;
          *((_QWORD *)v117 + 1) = v116;
          v118 = *((_QWORD *)v113 + 2);
          if (v15 > v118)
            goto LABEL_131;
          v11 = v113;
          memmove(&v113[16 * v15 + 16], &v113[16 * v15 + 32], 16 * (v118 - v15));
          *((_QWORD *)v113 + 2) = v118 - 1;
          v15 = v118 - 1;
        }
        while (v118 > 2);
      }
LABEL_111:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v135 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_219681AF0();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v9 = v8 >> 1;
    sub_219654DFC(0, &qword_2550904E8);
    v10 = sub_219681B08();
    *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v129 = (void **)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    v135 = v10;
  }
  v12 = 0;
  v13 = *a1;
  v14 = *a1 + 16;
  v121 = *a1 - 8;
  v122 = v14;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v127 = v6;
  v134 = v13;
  while (1)
  {
    v16 = v12 + 1;
    v126 = v12;
    if (v12 + 1 < v6)
    {
      v17 = *(void **)(v13 + 8 * v12);
      v18 = *(id *)(v13 + 8 * v16);
      v19 = v17;
      v20 = objc_msgSend(v18, sel__creationDate);
      sub_219681544();

      v21 = objc_msgSend(v19, sel__creationDate);
      v22 = v132;
      sub_219681544();

      v128 = sub_219681550();
      v23 = *(void (**)(char *, uint64_t))(v131 + 8);
      v24 = v22;
      v25 = v133;
      v23(v24, v133);
      v23(v5, v25);

      v6 = v127;
      v16 = v12 + 2;
      if (v12 + 2 < v6)
      {
        v123 = v11;
        v26 = (id *)(v122 + 8 * v12);
        while (1)
        {
          v27 = v16;
          v28 = v128 == 1;
          v29 = *(v26 - 1);
          v30 = *v26;
          v31 = v29;
          v32 = objc_msgSend(v30, sel__creationDate);
          sub_219681544();

          v33 = objc_msgSend(v31, sel__creationDate);
          v34 = v132;
          sub_219681544();

          v35 = sub_219681550();
          v36 = v34;
          v37 = v133;
          v23(v36, v133);
          v23(v5, v37);

          if (v28 == (v35 != 1))
            break;
          v16 = v27 + 1;
          ++v26;
          v6 = v127;
          if (v127 == v27 + 1)
          {
            v16 = v127;
            v11 = v123;
            goto LABEL_22;
          }
        }
        v11 = v123;
        v6 = v127;
        v16 = v27;
LABEL_22:
        v12 = v126;
      }
      v13 = v134;
      if (v128 == 1)
      {
        if (v16 < v12)
          goto LABEL_134;
        if (v12 < v16)
        {
          v38 = (uint64_t *)(v121 + 8 * v16);
          v39 = v16;
          v40 = v12;
          v41 = (uint64_t *)(v134 + 8 * v12);
          do
          {
            if (v40 != --v39)
            {
              if (!v13)
                goto LABEL_139;
              v42 = *v41;
              *v41 = *v38;
              *v38 = v42;
            }
            ++v40;
            --v38;
            ++v41;
          }
          while (v40 < v39);
        }
      }
    }
    if (v16 < v6)
    {
      if (__OFSUB__(v16, v12))
        goto LABEL_132;
      if (v16 - v12 < v124)
        break;
    }
LABEL_50:
    if (v16 < v12)
      goto LABEL_127;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_219664A34(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v59 = *((_QWORD *)v11 + 2);
    v58 = *((_QWORD *)v11 + 3);
    v15 = v59 + 1;
    v13 = v134;
    if (v59 >= v58 >> 1)
    {
      v109 = sub_219664A34((char *)(v58 > 1), v59 + 1, 1, v11);
      v13 = v134;
      v11 = v109;
    }
    *((_QWORD *)v11 + 2) = v15;
    v60 = v11 + 32;
    v61 = &v11[16 * v59 + 32];
    *(_QWORD *)v61 = v12;
    *((_QWORD *)v61 + 1) = v16;
    v128 = v16;
    if (v59)
    {
      while (1)
      {
        v62 = v15 - 1;
        if (v15 >= 4)
        {
          v67 = &v60[16 * v15];
          v68 = *((_QWORD *)v67 - 8);
          v69 = *((_QWORD *)v67 - 7);
          v73 = __OFSUB__(v69, v68);
          v70 = v69 - v68;
          if (v73)
            goto LABEL_116;
          v72 = *((_QWORD *)v67 - 6);
          v71 = *((_QWORD *)v67 - 5);
          v73 = __OFSUB__(v71, v72);
          v65 = v71 - v72;
          v66 = v73;
          if (v73)
            goto LABEL_117;
          v74 = v15 - 2;
          v75 = &v60[16 * v15 - 32];
          v77 = *(_QWORD *)v75;
          v76 = *((_QWORD *)v75 + 1);
          v73 = __OFSUB__(v76, v77);
          v78 = v76 - v77;
          if (v73)
            goto LABEL_119;
          v73 = __OFADD__(v65, v78);
          v79 = v65 + v78;
          if (v73)
            goto LABEL_122;
          if (v79 >= v70)
          {
            v97 = &v60[16 * v62];
            v99 = *(_QWORD *)v97;
            v98 = *((_QWORD *)v97 + 1);
            v73 = __OFSUB__(v98, v99);
            v100 = v98 - v99;
            if (v73)
              goto LABEL_126;
            v90 = v65 < v100;
            goto LABEL_87;
          }
        }
        else
        {
          if (v15 != 3)
          {
            v91 = *((_QWORD *)v11 + 4);
            v92 = *((_QWORD *)v11 + 5);
            v73 = __OFSUB__(v92, v91);
            v84 = v92 - v91;
            v85 = v73;
            goto LABEL_81;
          }
          v64 = *((_QWORD *)v11 + 4);
          v63 = *((_QWORD *)v11 + 5);
          v73 = __OFSUB__(v63, v64);
          v65 = v63 - v64;
          v66 = v73;
        }
        if ((v66 & 1) != 0)
          goto LABEL_118;
        v74 = v15 - 2;
        v80 = &v60[16 * v15 - 32];
        v82 = *(_QWORD *)v80;
        v81 = *((_QWORD *)v80 + 1);
        v83 = __OFSUB__(v81, v82);
        v84 = v81 - v82;
        v85 = v83;
        if (v83)
          goto LABEL_121;
        v86 = &v60[16 * v62];
        v88 = *(_QWORD *)v86;
        v87 = *((_QWORD *)v86 + 1);
        v73 = __OFSUB__(v87, v88);
        v89 = v87 - v88;
        if (v73)
          goto LABEL_124;
        if (__OFADD__(v84, v89))
          goto LABEL_125;
        if (v84 + v89 >= v65)
        {
          v90 = v65 < v89;
LABEL_87:
          if (v90)
            v62 = v74;
          goto LABEL_89;
        }
LABEL_81:
        if ((v85 & 1) != 0)
          goto LABEL_120;
        v93 = &v60[16 * v62];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v73 = __OFSUB__(v94, v95);
        v96 = v94 - v95;
        if (v73)
          goto LABEL_123;
        if (v96 < v84)
          goto LABEL_14;
LABEL_89:
        v101 = v62 - 1;
        if (v62 - 1 >= v15)
        {
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
          goto LABEL_136;
        }
        if (!v13)
          goto LABEL_138;
        v102 = v11;
        v103 = &v60[16 * v101];
        v104 = *(_QWORD *)v103;
        v105 = &v60[16 * v62];
        v106 = *((_QWORD *)v105 + 1);
        v107 = v130;
        sub_2196645C0((void **)(v13 + 8 * *(_QWORD *)v103), (id *)(v13 + 8 * *(_QWORD *)v105), (id *)(v13 + 8 * v106), v129);
        v130 = v107;
        if (v107)
          goto LABEL_111;
        if (v106 < v104)
          goto LABEL_113;
        if (v62 > *((_QWORD *)v102 + 2))
          goto LABEL_114;
        *(_QWORD *)v103 = v104;
        *(_QWORD *)&v60[16 * v101 + 8] = v106;
        v108 = *((_QWORD *)v102 + 2);
        if (v62 >= v108)
          goto LABEL_115;
        v11 = v102;
        v15 = v108 - 1;
        memmove(&v60[16 * v62], v105 + 16, 16 * (v108 - 1 - v62));
        *((_QWORD *)v102 + 2) = v108 - 1;
        v13 = v134;
        if (v108 <= 2)
          goto LABEL_14;
      }
    }
    v15 = 1;
LABEL_14:
    v6 = v127;
    v12 = v128;
    if (v128 >= v127)
      goto LABEL_100;
  }
  if (__OFADD__(v12, v124))
    goto LABEL_135;
  if (v12 + v124 >= v6)
    v43 = v6;
  else
    v43 = v12 + v124;
  if (v43 >= v12)
  {
    if (v16 != v43)
    {
      v123 = v11;
      v44 = v121 + 8 * v16;
      v125 = v43;
      do
      {
        v45 = v16;
        v46 = *(void **)(v13 + 8 * v16);
        v128 = v44;
        while (1)
        {
          v47 = *(void **)v44;
          v48 = v46;
          v49 = v47;
          v50 = objc_msgSend(v48, sel__creationDate);
          sub_219681544();

          v51 = objc_msgSend(v49, sel__creationDate);
          v52 = v132;
          sub_219681544();

          v53 = sub_219681550();
          v54 = *(void (**)(char *, uint64_t))(v131 + 8);
          v55 = v52;
          v56 = v133;
          v54(v55, v133);
          v54(v5, v56);

          if (v53 != 1)
            break;
          v13 = v134;
          if (!v134)
            goto LABEL_137;
          v57 = *(void **)v44;
          v46 = *(void **)(v44 + 8);
          *(_QWORD *)v44 = v46;
          *(_QWORD *)(v44 + 8) = v57;
          v44 -= 8;
          if (v45 == ++v12)
            goto LABEL_43;
        }
        v13 = v134;
LABEL_43:
        v16 = v45 + 1;
        v44 = v128 + 8;
        v12 = v126;
      }
      while (v45 + 1 != v125);
      v16 = v125;
      v11 = v123;
    }
    goto LABEL_50;
  }
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  sub_219681DCC();
  __break(1u);
}

void sub_219664400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a1;
  v7 = sub_219681574();
  v31 = *(_QWORD *)(v7 - 8);
  v32 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v30 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - v10;
  v27 = a2;
  if (a3 != a2)
  {
    v33 = *a4;
    v12 = v33 + 8 * a3 - 8;
LABEL_5:
    v13 = *(void **)(v33 + 8 * a3);
    v14 = v28;
    v29 = v12;
    while (1)
    {
      v15 = *(void **)v12;
      v16 = v13;
      v17 = v15;
      v18 = objc_msgSend(v16, sel__creationDate);
      sub_219681544();

      v19 = objc_msgSend(v17, sel__creationDate);
      v20 = v30;
      sub_219681544();

      v21 = sub_219681550();
      v22 = *(void (**)(char *, uint64_t))(v31 + 8);
      v23 = v20;
      v24 = v32;
      v22(v23, v32);
      v22(v11, v24);

      if (v21 != 1)
      {
LABEL_4:
        ++a3;
        v12 = v29 + 8;
        if (a3 == v27)
          return;
        goto LABEL_5;
      }
      if (!v33)
        break;
      v25 = *(void **)v12;
      v13 = *(void **)(v12 + 8);
      *(_QWORD *)v12 = v13;
      *(_QWORD *)(v12 + 8) = v25;
      v12 -= 8;
      if (a3 == ++v14)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_2196645C0(void **a1, id *a2, id *a3, void **a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id *v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  id *v28;
  void **v29;
  id *v30;
  id *v31;
  char *v32;
  unint64_t v33;
  void **v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t v47;
  void **v48;
  void **v49;
  void **v50;
  id *v51;
  id *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void **v57;
  void **v58;
  id *v59;

  v8 = sub_219681574();
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v47 - v11;
  v12 = (char *)a2 - (char *)a1;
  v13 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v13 = (char *)a2 - (char *)a1;
  v14 = v13 >> 3;
  v51 = a3;
  v15 = (char *)a3 - (char *)a2;
  v16 = v15 / 8;
  v59 = a1;
  v58 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7)
      goto LABEL_43;
    if (a4 != a2 || &a2[v16] <= a4)
      memmove(a4, a2, 8 * v16);
    v29 = &a4[v16];
    v57 = v29;
    v59 = a2;
    if (v15 < 8 || a1 >= a2)
      goto LABEL_42;
    v30 = v51 - 1;
    v31 = a2;
    v48 = a1;
    v49 = a4;
    v32 = v53;
    while (1)
    {
      v52 = a2;
      v50 = v29;
      v51 = v30 + 1;
      v34 = v29 - 1;
      v35 = *--v31;
      v36 = *(v29 - 1);
      v37 = v35;
      v38 = objc_msgSend(v36, sel__creationDate);
      sub_219681544();

      v39 = objc_msgSend(v37, sel__creationDate);
      v40 = v54;
      sub_219681544();

      v41 = sub_219681550();
      v42 = *(void (**)(char *, uint64_t))(v55 + 8);
      v43 = v40;
      v44 = v56;
      v42(v43, v56);
      v42(v32, v44);

      if (v41 == 1)
        break;
      v57 = v34;
      v31 = v52;
      if (v51 < v50 || v30 >= v50)
      {
        *v30 = *v34;
        v29 = v34;
        goto LABEL_30;
      }
      v33 = (unint64_t)v48;
      v45 = (unint64_t)v49;
      if (v51 != v50)
        *v30 = *v34;
      v29 = v34;
      if ((unint64_t)v34 <= v45)
        goto LABEL_42;
LABEL_31:
      --v30;
      a2 = v31;
      if ((unint64_t)v31 <= v33)
        goto LABEL_42;
    }
    v29 = v50;
    if (v51 != v52 || v30 >= v52)
      *v30 = *v31;
    v59 = v31;
LABEL_30:
    v33 = (unint64_t)v48;
    if (v29 <= v49)
      goto LABEL_42;
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    if (a4 != a1 || &a1[v14] <= a4)
      memmove(a4, a1, 8 * v14);
    v50 = &a4[v14];
    v57 = v50;
    if (v12 >= 8 && a2 < v51)
    {
      v17 = v53;
      do
      {
        v18 = *a4;
        v19 = (id *)*a2;
        v52 = v19;
        v20 = v18;
        v21 = objc_msgSend(v19, sel__creationDate);
        sub_219681544();

        v22 = objc_msgSend(v20, sel__creationDate);
        v23 = v54;
        sub_219681544();

        v24 = a4;
        v25 = sub_219681550();
        v26 = v56;
        v27 = *(void (**)(char *, uint64_t))(v55 + 8);
        v27(v23, v56);
        v27(v17, v26);

        if (v25 == 1)
        {
          v28 = a2 + 1;
          a4 = v24;
          if (a1 < a2 || a1 >= v28 || a1 != a2)
            *a1 = *a2;
        }
        else
        {
          if (a1 != v24)
            *a1 = *v24;
          a4 = v24 + 1;
          v58 = v24 + 1;
          v28 = a2;
        }
        v59 = ++a1;
        if (a4 >= v50)
          break;
        a2 = v28;
      }
      while (v28 < v51);
    }
LABEL_42:
    sub_219664B40((void **)&v59, (const void **)&v58, &v57);
    return 1;
  }
LABEL_43:
  result = sub_219681DFC();
  __break(1u);
  return result;
}

char *sub_219664A34(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_21966164C(0, &qword_255090508, (uint64_t (*)(uint64_t))sub_2196659E4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_219664B40(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_219681DFC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_219664BE8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_219681DFC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_219664C90(uint64_t a1)
{
  return sub_219664A34(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_219664CA4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_219665980();
        sub_219654D90(&qword_255090500, (uint64_t (*)(uint64_t))sub_219665980, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_219664EC0(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_219654DFC(0, &qword_2550904E8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_219681DFC();
  __break(1u);
  return result;
}

void (*sub_219664EC0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_219664F40(v6, a2, a3);
  return sub_219664F14;
}

void sub_219664F14(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_219664F40(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x219A30CD8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_219664FAC;
  }
  __break(1u);
  return result;
}

void sub_219664FAC(id *a1)
{

}

void sub_219664FB4()
{
  JUMPOUT(0x219A30DA4);
}

uint64_t sub_219664FC8(uint64_t a1)
{
  return sub_21965FF20(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_219664FDC()
{
  id v0;

  sub_219681E5C();
  v0 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_219681C70();
  swift_unknownObjectRelease();
  return sub_219681A78();
}

void sub_219665044()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CE0)
  {
    v0 = sub_219681E50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CE0);
  }
}

uint64_t sub_21966509C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2196650AC()
{
  return swift_deallocObject();
}

uint64_t sub_2196650BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_219663898(a1, a2, a3, a4, *(_QWORD **)(v4 + 16));
}

uint64_t sub_2196650C4()
{
  return swift_deallocObject();
}

uint64_t sub_2196650D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_219665110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HDMCPregnancyStateFactory();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_219665154(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HDMCPregnancyStateFactory();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for HDMCPregnancyStateFactory(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_QWORD *)(a1 + 8) = a2[1];
    v8 = a2 + 2;
    v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    v10 = v9;
    v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(a1 + 16, v8, v10);
    v12 = a3[7];
    v13 = a1 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = sub_21968161C();
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v16(a1 + a3[8], (uint64_t)a2 + a3[8], v15);
    *(_QWORD *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  }
  return a1;
}

uint64_t destroy for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_21968161C();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 32), v5);
}

uint64_t initializeWithCopy for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = a2 + 16;
  v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(a1 + 16, v7, v9);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_21968161C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(a1 + a3[8], a2 + a3[8], v14);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

_QWORD *assignWithCopy for HDMCPregnancyStateFactory(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  v6 = a3[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21968161C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10((char *)a1 + a3[8], (char *)a2 + a3[8], v9);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21968161C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21968161C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for HDMCPregnancyStateFactory()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_219665794(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21968161C();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for HDMCPregnancyStateFactory()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21966581C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_21968161C();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_219665890()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21968161C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_219665924(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_219654DFC(255, a2);
    result = MEMORY[0x219A318B4](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_219665964(id *a1)
{
  return sub_2196637D8(a1) & 1;
}

void sub_219665980()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550904F8)
  {
    sub_219654DFC(255, &qword_2550904E8);
    v0 = sub_219681B20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550904F8);
  }
}

void sub_2196659E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255090510)
  {
    v0 = sub_219681BB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255090510);
  }
}

id HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyManager:)(void *a1)
{
  objc_class *v1;
  id v3;
  char *v4;
  id v5;

  v3 = objc_allocWithZone(v1);
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  v5 = sub_2196668D0(a1, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id HDMCPregnancyRequirementEvaluator.init(pregnancyManager:)(void *a1)
{
  char *v2;
  id v3;

  v2 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  v3 = sub_2196668D0(a1, v2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyProvider:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_21966689C(a1);
}

uint64_t type metadata accessor for HDMCPregnancyRequirementEvaluator()
{
  return objc_opt_self();
}

id HDMCPregnancyRequirementEvaluator.init(pregnancyProvider:)(uint64_t a1)
{
  char *v1;

  swift_getObjectType();
  return sub_2196669F4(a1, v1);
}

void sub_219665BD0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *ObjCClassFromMetadata;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[4];
  uint64_t v55;

  v2 = v1;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v4 = sub_21968164C();
  __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  swift_unknownObjectRetain_n();
  v5 = sub_219681634();
  v6 = sub_219681BD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v52 = swift_slowAlloc();
    v54[0] = v52;
    *(_DWORD *)v7 = 136315394;
    v8 = sub_219681F34();
    v55 = sub_21967C8D8(v8, v9, v54);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v10 = objc_msgSend(a1, sel_description);
    v11 = sub_219681A6C();
    v13 = v12;

    v2 = v1;
    v55 = sub_21967C8D8(v11, v13, v54);
    sub_219681C58();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v5, v6, "[%s] Running requirement evaluation for %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v52, -1, -1);
    MEMORY[0x219A3195C](v7, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v14)
  {
    __break(1u);
    goto LABEL_30;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_features);

  if (!v16)
  {
LABEL_30:
    __break(1u);
    return;
  }
  v17 = objc_msgSend(v16, sel_seahorse);

  if ((v17 & 1) == 0)
  {
LABEL_15:
    sub_219666B1C();
    sub_219681C1C();
    return;
  }
  v18 = objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager), sel_getCurrentPregnancyModel);
  if (!v18)
  {
    v30 = sub_219681634();
    v31 = sub_219681BBC();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v54[0] = v33;
      *(_DWORD *)v32 = 136446210;
      v34 = sub_219681F34();
      v55 = sub_21967C8D8(v34, v35, v54);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v30, v31, "[%{public}s] Could not get pregnancy state from pregnancy manager", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v33, -1, -1);
      MEMORY[0x219A3195C](v32, -1, -1);
    }

    goto LABEL_15;
  }
  v19 = v18;
  v20 = sub_219681634();
  v21 = sub_219681BD4();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    v55 = v53;
    *(_DWORD *)v22 = 136315394;
    v23 = sub_219681F34();
    v54[0] = sub_21967C8D8(v23, v24, &v55);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v25 = v19;
    v26 = (id)HKSensitiveLogItem();
    sub_219681C70();
    swift_unknownObjectRelease();
    v27 = sub_219681A78();
    v29 = v28;

    v54[0] = sub_21967C8D8(v27, v29, &v55);
    sub_219681C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v20, v21, "[%s] Currently cached state: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v53, -1, -1);
    MEMORY[0x219A3195C](v22, -1, -1);

  }
  else
  {

  }
  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v37 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
  v38 = sub_219681A6C();
  v40 = v39;
  if (v38 == sub_219681A6C() && v40 == v41)
  {

    swift_bridgeObjectRelease_n();
LABEL_21:
    objc_msgSend(v19, sel_state);
LABEL_27:
    sub_219681B2C();

    return;
  }
  v42 = sub_219681E68();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_21;
  v43 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
  v44 = sub_219681A6C();
  v46 = v45;
  if (v44 == sub_219681A6C() && v46 == v47)
  {

    swift_bridgeObjectRelease_n();
LABEL_26:
    sub_219666B58(v19);
    goto LABEL_27;
  }
  v48 = sub_219681E68();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v48 & 1) != 0)
    goto LABEL_26;
  v49 = (void *)objc_opt_self();
  v54[0] = 0;
  v54[1] = 0xE000000000000000;
  sub_219681D48();
  sub_219681A9C();
  v50 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
  v55 = (uint64_t)v50;
  type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
  sub_219681DC0();

  v51 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_hk_error_description_, 3, v51);

  swift_willThrow();
}

id sub_21966648C(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_registerObserver_, a1);
}

id sub_2196664C0(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_unregisterObserver_, a1);
}

void sub_2196664F4(void *a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  id v7;
  _QWORD v8[6];

  v3 = *(void **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v8[4] = sub_219666D20;
  v8[5] = v4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_219666688;
  v8[3] = &block_descriptor_1;
  v5 = _Block_copy(v8);
  v6 = v1;
  v7 = a1;
  swift_release();
  objc_msgSend(v3, sel_notifyObservers_, v5);
  _Block_release(v5);
}

uint64_t sub_2196665C0(void *a1, uint64_t a2, void *a3)
{
  void *v5;

  v5 = (void *)objc_opt_self();
  objc_msgSend(a1, sel_featureAvailabilityRequirement_didUpdateSatisfaction_, objc_msgSend(v5, sel_noOngoingPregnancy), objc_msgSend(a3, sel_state) != (id)1);
  swift_unknownObjectRelease();
  objc_msgSend(a1, sel_featureAvailabilityRequirement_didUpdateSatisfaction_, objc_msgSend(v5, sel_isNotInPostPregnancy), sub_219666B58(a3) & 1);
  return swift_unknownObjectRelease();
}

uint64_t sub_219666688(uint64_t a1)
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

id HDMCPregnancyRequirementEvaluator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDMCPregnancyRequirementEvaluator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HDMCPregnancyRequirementEvaluator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21966689C(uint64_t a1)
{
  char *v2;

  v2 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  return sub_2196669F4(a1, v2);
}

id sub_2196668D0(void *a1, char *a2)
{
  void *v4;
  id v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  *(_QWORD *)&a2[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager] = a1;
  v4 = (void *)*MEMORY[0x24BDD3030];
  v5 = objc_allocWithZone(MEMORY[0x24BDD3DD0]);
  v6 = a2;
  v7 = a1;
  v8 = v4;
  v9 = (void *)sub_219681A48();
  v10 = objc_msgSend(v5, sel_initWithName_loggingCategory_, v9, v8);

  *(_QWORD *)&v6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers] = v10;
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  v11 = objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_registerObserver_isUserInitiated_, v11, 0);
  swift_unknownObjectRelease();

  return v11;
}

id sub_2196669F4(uint64_t a1, char *a2)
{
  void *v3;
  id v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  *(_QWORD *)&a2[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager] = a1;
  v3 = (void *)*MEMORY[0x24BDD3030];
  v4 = objc_allocWithZone(MEMORY[0x24BDD3DD0]);
  v5 = a2;
  swift_unknownObjectRetain();
  v6 = v3;
  v7 = (void *)sub_219681A48();
  v8 = objc_msgSend(v4, sel_initWithName_loggingCategory_, v7, v6);

  *(_QWORD *)&v5[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers] = v8;
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_registerObserver_isUserInitiated_, v9, 0);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v9;
}

unint64_t sub_219666B1C()
{
  unint64_t result;

  result = qword_253E60AF0;
  if (!qword_253E60AF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60AF0);
  }
  return result;
}

uint64_t sub_219666B58(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  sub_21965BFB8();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219681574();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  v12 = objc_msgSend(a1, sel_physiologicalWashoutEndDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  v13 = v12;
  sub_219681544();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_21965C064((uint64_t)v4);
    v15 = 1;
    return v15 & 1;
  }
  v14(v11, v4, v5);
  sub_219681568();
  v15 = sub_21968152C();
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  return v15 & 1;
}

uint64_t sub_219666CF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219666D20(void *a1)
{
  uint64_t v1;

  return sub_2196665C0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t method lookup function for HDMCPregnancyRequirementEvaluator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.isRequirementSatisfied(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.register(_:for:queue:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.unregisterObserver(_:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.pregnancyModelDidUpdate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t HDCodableMenstrualCyclesExperienceModel.getExperienceModel()()
{
  uint64_t v0;
  uint64_t result;
  id v2;

  result = sub_21966853C();
  if (!v0)
  {
    v2 = sub_219673B80();
    swift_release();
    return (uint64_t)v2;
  }
  return result;
}

char *HDCodableMenstrualCyclesExperienceModel.insert(record:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *result;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  os_log_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  id v70;
  uint64_t v71;
  char *v72;
  int v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  id v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  id v101;
  void *v102;
  char *v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v110)(uint64_t, uint64_t, uint64_t);
  id v111;
  void *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  char *v118;
  uint64_t v119;
  unsigned int (*v120)(char *, uint64_t, uint64_t);
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  void *v135;
  void *v136;
  unsigned int v137;
  uint64_t v138;
  id v139;
  NSObject *v140;
  os_log_type_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  id v145;
  id v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  char *v151;
  _QWORD v152[2];
  char *v153;
  uint64_t v154;
  os_log_t v155;
  uint64_t v156;
  id v157;
  char *v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t ObjectType;
  char *v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  id v175;
  char *v176;
  char *v177;
  id v178;
  uint64_t v179;
  void (*v180)(char *, char *, uint64_t);
  char *v181;
  char *v182;
  char *v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;

  v178 = a1;
  ObjectType = swift_getObjectType();
  v1 = sub_2196818E0();
  v171 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v170 = (char *)v152 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = sub_219681574();
  v163 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v161 = (char *)v152 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21965BFB8();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v158 = (char *)v152 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v160 = (char *)v152 - v7;
  v8 = sub_2196815BC();
  v190 = *(_QWORD *)(v8 - 8);
  v191 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v189 = (char *)v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v188 = (char *)v152 - v11;
  sub_21965C5BC();
  v186 = *(_QWORD *)(v12 - 8);
  v187 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v185 = (char *)v152 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = type metadata accessor for CoherentExperienceSetupRecord(0);
  MEMORY[0x24BDAC7A8](v184);
  v183 = (char *)v152 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966A81C(0, &qword_253E611F8, v15, sub_219669DB0, MEMORY[0x24BE18658]);
  v17 = v16;
  v195 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v152 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v169 = (char *)v152 - v21;
  sub_219669E2C(0, &qword_2550905F0, MEMORY[0x24BE182E0]);
  v193 = v22;
  v23 = *(NSObject **)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v192 = (char *)v152 - v24;
  sub_219669E2C(0, (unint64_t *)&qword_253E60DA8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BE18310]);
  v26 = v25;
  v173 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v177 = (char *)v152 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v172 = (char *)v152 - v29;
  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v194 = v30;
  v179 = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v165 = (char *)v152 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v182 = (char *)v152 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v176 = (char *)v152 - v35;
  sub_219669F00();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v168 = (uint64_t)v152 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v167 = (char *)v152 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v174 = (uint64_t)v152 - v41;
  v157 = (id)objc_opt_self();
  result = (char *)objc_msgSend(v157, sel_sharedBehavior);
  if (!result)
  {
    __break(1u);
    goto LABEL_42;
  }
  v43 = result;
  v44 = objc_msgSend(result, sel_showSensitiveLogItems);

  if (v44)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v45 = sub_21968164C();
    __swift_project_value_buffer(v45, (uint64_t)qword_253E60BE8);
    v46 = v178;
    v47 = sub_219681634();
    v48 = sub_219681BD4();
    v49 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      v50 = swift_slowAlloc();
      v159 = v1;
      v51 = v50;
      v162 = swift_slowAlloc();
      v197 = v162;
      *(_DWORD *)v51 = 136315394;
      v156 = v51 + 4;
      v52 = sub_219681F34();
      v155 = v47;
      LODWORD(v180) = v49;
      v196 = sub_21967C8D8(v52, v53, &v197);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      v156 = v51 + 14;
      v54 = v46;
      v55 = objc_msgSend(v54, sel_description);
      v154 = sub_219681A6C();
      v57 = v56;

      v196 = sub_21967C8D8(v154, v57, &v197);
      sub_219681C58();

      swift_bridgeObjectRelease();
      v58 = v155;
      _os_log_impl(&dword_21961B000, v155, (os_log_type_t)v180, "[%s] Inserting record: %s", (uint8_t *)v51, 0x16u);
      v59 = v162;
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v59, -1, -1);
      v60 = v51;
      v1 = v159;
      MEMORY[0x219A3195C](v60, -1, -1);

    }
    else
    {

    }
  }
  v61 = v181;
  result = (char *)sub_21966853C();
  if (!v61)
  {
    v62 = (uint64_t)result;
    v155 = v23;
    v154 = 0;
    v159 = v1;
    v153 = v20;
    v63 = &result[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule];
    swift_beginAccess();
    v64 = v179;
    v65 = *(void (**)(char *, char *, uint64_t))(v179 + 16);
    v66 = v176;
    v181 = v63;
    v67 = v194;
    v180 = v65;
    v65(v176, v63, v194);
    swift_getKeyPath();
    v68 = sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v69 = v172;
    v152[1] = v68;
    sub_219681994();
    swift_release();
    v179 = *(_QWORD *)(v64 + 8);
    ((void (*)(char *, uint64_t))v179)(v66, v67);
    (*(void (**)(char *, char *, uint64_t))(v173 + 16))(v177, v69, v26);
    sub_219669F74(&qword_255090600, (unint64_t *)&qword_253E60DA8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BE18310], MEMORY[0x24BE18330]);
    v70 = v178;
    v162 = v62;
    swift_retain();
    v156 = v26;
    sub_219681AB4();
    v71 = sub_219669F74(&qword_255090608, &qword_2550905F0, MEMORY[0x24BE182E0], MEMORY[0x24BE182F0]);
    v72 = v167;
    v176 = (char *)v71;
    sub_219681C4C();
    v178 = *(id *)(v195 + 48);
    v73 = ((uint64_t (*)(char *, uint64_t, uint64_t))v178)(v72, 1, v17);
    v74 = v169;
    if (v73 == 1)
    {
LABEL_13:
      ((void (*)(char *, uint64_t))v155[1].isa)(v192, v193);
      v91 = 1;
      v92 = v174;
    }
    else
    {
      v177 = *(char **)(v195 + 32);
      while (1)
      {
        ((void (*)(char *, char *, uint64_t))v177)(v74, v72, v17);
        v75 = v182;
        v76 = v194;
        v180(v182, v181, v194);
        sub_219669DB0();
        v77 = v17;
        v78 = v70;
        v80 = v183;
        v79 = v184;
        sub_2196819C4();
        ((void (*)(char *, uint64_t))v179)(v75, v76);
        v81 = v185;
        v82 = v186;
        v83 = v187;
        (*(void (**)(char *, char *, uint64_t))(v186 + 16))(v185, &v80[*(int *)(v79 + 20)], v187);
        v84 = (uint64_t)v80;
        v70 = v78;
        sub_2196614BC(v84, type metadata accessor for CoherentExperienceSetupRecord);
        v85 = v188;
        sub_219681694();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v83);
        v86 = objc_msgSend(v78, sel_sampleUUID);
        v87 = v189;
        sub_2196815A4();

        LOBYTE(v86) = sub_219681598();
        v88 = *(void (**)(char *, uint64_t))(v190 + 8);
        v89 = v87;
        v90 = v191;
        v88(v89, v191);
        v88(v85, v90);
        if ((v86 & 1) != 0)
          break;
        (*(void (**)(char *, uint64_t))(v195 + 8))(v74, v77);
        sub_219681C4C();
        v17 = v77;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v178)(v72, 1, v77) == 1)
          goto LABEL_13;
      }
      ((void (*)(char *, uint64_t))v155[1].isa)(v192, v193);
      v92 = v174;
      ((void (*)(uint64_t, char *, uint64_t))v177)(v174, v74, v77);
      v91 = 0;
      v17 = v77;
    }
    v93 = v195;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v195 + 56))(v92, v91, 1, v17);

    swift_release();
    (*(void (**)(char *, uint64_t))(v173 + 8))(v172, v156);
    v94 = v168;
    sub_219661478(v92, v168, (uint64_t (*)(_QWORD))sub_219669F00);
    v95 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v178)(v94, 1, v17);
    v96 = v171;
    v97 = v170;
    v98 = v194;
    if (v95 == 1)
    {
      sub_2196614BC(v94, (uint64_t (*)(_QWORD))sub_219669F00);
      sub_219668E80(v70);
      v99 = v154;
      v100 = v181;
LABEL_25:
      sub_2196819F4();
      v127 = (void *)sub_2196819E8();
      v128 = v159;
      (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v97, *MEMORY[0x24BE184E0], v159);
      v129 = v165;
      v180(v165, v100, v98);
      v130 = sub_2196819AC();
      v132 = v96;
      if (v99)
      {
        ((void (*)(char *, uint64_t))v179)(v129, v98);
        swift_release();

      }
      else
      {
        v133 = v130;
        v134 = v131;
        ((void (*)(char *, uint64_t))v179)(v129, v98);
        v135 = (void *)sub_2196814E4();
        sub_219669FB4(v133, v134);
        objc_msgSend(v175, sel_setMenstrualCyclesExperienceModelData_, v135);
        swift_release();

      }
      (*(void (**)(char *, uint64_t))(v132 + 8))(v97, v128);
      return (char *)sub_2196614BC(v174, (uint64_t (*)(_QWORD))sub_219669F00);
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v153, v94, v17);
    v101 = objc_msgSend(v70, sel_configurationStepsReviewDate);
    if (v101)
    {
      v102 = v101;
      v103 = v161;
      sub_219681544();

      v104 = v17;
      v105 = v70;
      v106 = v163;
      v107 = (uint64_t)v160;
      v108 = v166;
      (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v160, v103, v166);
      v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56);
      v109(v107, 0, 1, v108);
      v110 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v106 + 48);
      v70 = v105;
      v17 = v104;
      if (v110(v107, 1, v108) != 1)
        goto LABEL_24;
    }
    else
    {
      v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v163 + 56);
      v107 = (uint64_t)v160;
      v109((uint64_t)v160, 1, 1, v166);
    }
    sub_2196614BC(v107, (uint64_t (*)(_QWORD))sub_21965BFB8);
    v111 = objc_msgSend(v70, sel_postPregnancyFeatureAdjustmentCompletionDate);
    if (v111)
    {
      v112 = v111;
      v113 = v161;
      sub_219681544();

      v114 = v163;
      v115 = v93;
      v116 = v17;
      v117 = v70;
      v118 = v158;
      v119 = v166;
      (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v158, v113, v166);
      v109((uint64_t)v118, 0, 1, v119);
      v120 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v114 + 48);
      v121 = v118;
      v107 = (uint64_t)v118;
      v70 = v117;
      v17 = v116;
      v93 = v115;
      if (v120(v121, 1, v119) != 1)
      {
        v104 = v17;
        v96 = v171;
LABEL_24:
        v122 = sub_2196614BC(v107, (uint64_t (*)(_QWORD))sub_21965BFB8);
        MEMORY[0x24BDAC7A8](v122);
        v123 = v153;
        v152[-2] = v153;
        v152[-1] = v70;
        v100 = v181;
        swift_beginAccess();
        v124 = v194;
        v125 = v154;
        sub_219681988();
        v99 = v125;
        swift_endAccess();
        v126 = v104;
        v98 = v124;
        (*(void (**)(char *, uint64_t))(v195 + 8))(v123, v126);
        goto LABEL_25;
      }
    }
    else
    {
      v107 = (uint64_t)v158;
      v109((uint64_t)v158, 1, 1, v166);
    }
    sub_2196614BC(v107, (uint64_t (*)(_QWORD))sub_21965BFB8);
    result = (char *)objc_msgSend(v157, sel_sharedBehavior);
    if (result)
    {
      v136 = result;
      v137 = objc_msgSend(result, sel_showSensitiveLogItems);

      if (v137)
      {
        v194 = v17;
        if (qword_253E60AC8 != -1)
          swift_once();
        v138 = sub_21968164C();
        __swift_project_value_buffer(v138, (uint64_t)qword_253E60BE8);
        v139 = v70;
        v140 = sub_219681634();
        v141 = sub_219681BBC();
        if (os_log_type_enabled(v140, v141))
        {
          v142 = swift_slowAlloc();
          v193 = swift_slowAlloc();
          v196 = v193;
          *(_DWORD *)v142 = 136315394;
          v143 = sub_219681F34();
          v198 = sub_21967C8D8(v143, v144, &v196);
          sub_219681C58();
          swift_bridgeObjectRelease();
          *(_WORD *)(v142 + 12) = 2080;
          v145 = v139;
          v146 = objc_msgSend(v145, sel_description);
          v147 = sub_219681A6C();
          v149 = v148;

          v198 = sub_21967C8D8(v147, v149, &v196);
          sub_219681C58();

          v93 = v195;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v140, v141, "[%s] Record already exists, new record had no date, and post pregnancy adjustments not complete. No changes %s", (uint8_t *)v142, 0x16u);
          v150 = v193;
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v150, -1, -1);
          MEMORY[0x219A3195C](v142, -1, -1);
        }
        else
        {

        }
        swift_release();

        sub_2196614BC(v174, (uint64_t (*)(_QWORD))sub_219669F00);
        v17 = v194;
        v151 = v153;
      }
      else
      {
        sub_2196614BC(v174, (uint64_t (*)(_QWORD))sub_219669F00);
        swift_release();
        v151 = v153;
      }
      return (char *)(*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v151, v17);
    }
LABEL_42:
    __break(1u);
  }
  return result;
}

id HDCodableMenstrualCyclesExperienceModel.init(model:)(void *a1)
{
  id v2;

  v2 = sub_21966A320(a1);

  return v2;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.makeCopy()()
{
  void *v0;
  uint64_t result;
  uint64_t v2;

  swift_getObjectType();
  objc_msgSend(v0, sel_copy);
  sub_219681C70();
  swift_unknownObjectRelease();
  if (swift_dynamicCast())
    return v2;
  sub_219681D48();
  sub_219681A9C();
  sub_219654D90(&qword_255090610, (uint64_t (*)(uint64_t))sub_21966A5B0, MEMORY[0x24BDD0240]);
  sub_21966A588();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  result = sub_219681DD8();
  __break(1u);
  return result;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.merge(with:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  void *v31;
  void (*v32)(char *, uint64_t, uint64_t);
  id v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = a1;
  v3 = sub_2196818E0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - v13;
  result = sub_21966853C();
  if (!v2)
  {
    v34 = v12;
    v35 = v9;
    v38 = v4;
    v39 = result;
    v33 = v1;
    v36 = v14;
    v37 = v6;
    v16 = sub_21966853C()
        + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    v17 = v35;
    v18 = v36;
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    v19 = v8;
    v32(v36, v16, v8);
    swift_release();
    v20 = v39 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
    sub_219669EE4();
    sub_21968197C();
    swift_endAccess();
    sub_2196819F4();
    v21 = (void (*)(char *, uint64_t, uint64_t))sub_2196819E8();
    v22 = *MEMORY[0x24BE184E0];
    v23 = v37;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 104);
    v40 = v3;
    v24(v37, v22, v3);
    v25 = v34;
    v32(v34, v20, v19);
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v32 = v21;
    v26 = sub_2196819AC();
    v28 = v27;
    v29 = *(void (**)(char *, uint64_t))(v17 + 8);
    v29(v25, v19);
    v30 = v18;
    v31 = (void *)sub_2196814E4();
    sub_219669FB4(v26, v28);
    objc_msgSend(v33, sel_setMenstrualCyclesExperienceModelData_, v31);
    swift_release();

    (*(void (**)(char *, uint64_t))(v38 + 8))(v23, v40);
    return ((uint64_t (*)(char *, uint64_t))v29)(v30, v19);
  }
  return result;
}

uint64_t sub_21966853C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  v3 = v0;
  swift_getObjectType();
  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  v12 = objc_msgSend(v3, sel_menstrualCyclesExperienceModelData);
  if (v12)
  {
    v13 = v12;
    sub_2196814F0();

    type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    sub_2196819A0();
    if (!v1)
    {
      v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v14(v9, v11, v5);
      type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
      v2 = swift_allocObject();
      v14((char *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule), v9, v5);
    }
  }
  else
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v15 = sub_21968164C();
    __swift_project_value_buffer(v15, (uint64_t)qword_253E60BE8);
    v16 = sub_219681634();
    v17 = sub_219681BBC();
    v2 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v24 = v19;
      *(_DWORD *)v18 = 136446466;
      v20 = sub_219681F34();
      v23 = sub_21967C8D8(v20, v21, &v24);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      v23 = sub_21967C8D8(0xD000000000000044, 0x800000021968A210, &v24);
      sub_219681C58();
      _os_log_impl(&dword_21961B000, v16, (os_log_type_t)v2, "[%{public}s] Underlying model data is missing, error: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v19, -1, -1);
      MEMORY[0x219A3195C](v18, -1, -1);
    }

    sub_21966A91C();
    swift_allocError();
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_219668870(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  void *v32;
  uint64_t v33;
  char *v34;
  int v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(_BYTE *, _QWORD);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t result;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  void (*v55)(void);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(_BYTE *, _QWORD);
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t (*v66)(char *, uint64_t, uint64_t);
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[40];
  uint64_t v80;

  v77 = a2;
  v74 = a3;
  v4 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
  v75 = *(_QWORD *)(v4 - 8);
  v76 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v65 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_219681574();
  v78 = *(_QWORD *)(v80 - 8);
  v6 = MEMORY[0x24BDAC7A8](v80);
  v67 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v64 = (char *)&v63 - v8;
  sub_21965C698(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v63 = (uint64_t)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v63 - v12;
  sub_21966A81C(0, (unint64_t *)&qword_253E611C8, (uint64_t (*)(uint64_t))sub_21965BFB8, (uint64_t (*)(void))sub_21965C7A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BE17EA0]);
  v15 = v14;
  v70 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v72 = (char *)&v63 - v16;
  sub_21965BFB8();
  v71 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v73 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v69 = (char *)&v63 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v63 - v22;
  v24 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v63 - v28;
  sub_21966A81C(0, &qword_253E611F8, v30, sub_219669DB0, MEMORY[0x24BE18658]);
  v32 = v31;
  sub_219681904();
  sub_219681694();
  v33 = (uint64_t)v29;
  v34 = (char *)v24;
  sub_2196614BC(v33, type metadata accessor for CoherentExperienceSetupRecord);
  v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v78 + 48);
  v35 = v66(v23, 1, v80);
  sub_2196614BC((uint64_t)v23, (uint64_t (*)(_QWORD))sub_21965BFB8);
  if (v35 == 1)
  {
    v68 = a1;
    v36 = v69;
    v37 = v70;
    v38 = v15;
    v39 = objc_msgSend(v74, sel_postPregnancyFeatureAdjustmentCompletionDate);
    if (v39)
    {
      v40 = v39;
      sub_219681544();

      v41 = v36;
      v42 = 0;
      v43 = v37;
    }
    else
    {
      v42 = 1;
      v43 = v37;
      v41 = v36;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v41, v42, 1, v80);
    sub_21965C7A8();
    v44 = v72;
    sub_2196816C4();
    a1 = v68;
    v45 = (void (*)(_BYTE *, _QWORD))sub_2196818F8();
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 24))(v46 + *((int *)v34 + 9), v44, v38);
    v45(v79, 0);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v38);
  }
  sub_219681904();
  sub_21966A81C(0, (unint64_t *)&qword_253E611D8, (uint64_t (*)(uint64_t))sub_21965C698, (uint64_t (*)(void))sub_21966A88C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BE17EA0]);
  sub_219681694();
  sub_2196614BC((uint64_t)v27, type metadata accessor for CoherentExperienceSetupRecord);
  v48 = v75;
  v47 = v76;
  v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48))(v13, 1, v76);
  result = sub_2196614BC((uint64_t)v13, (uint64_t (*)(_QWORD))sub_21965C698);
  if (v49 == 1)
  {
    v51 = v47;
    v72 = v34;
    v52 = objc_msgSend(v74, sel_configurationStepsReviewDate);
    if (v52)
    {
      v53 = v52;
      v74 = v32;
      v68 = a1;
      sub_219681544();

      v54 = v78;
      v55 = *(void (**)(void))(v78 + 32);
      v56 = (uint64_t)v73;
      v57 = v80;
      v55();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v56, 0, 1, v57);
      if (v66((char *)v56, 1, v57) != 1)
      {
        v58 = v64;
        ((void (*)(char *, uint64_t, uint64_t))v55)(v64, v56, v57);
        v59 = sub_219660934(MEMORY[0x24BEE4AF8]);
        v60 = (uint64_t)v65;
        (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v65, v58, v57);
        *(_QWORD *)(v60 + *(int *)(v51 + 20)) = v59;
        v61 = v63;
        sub_219661478(v60, v63, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56))(v61, 0, 1, v51);
        v62 = (void (*)(_BYTE *, _QWORD))sub_2196818F8();
        sub_2196816A0();
        v62(v79, 0);
        sub_2196614BC(v60, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
        return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v58, v57);
      }
    }
    else
    {
      v56 = (uint64_t)v73;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v73, 1, 1, v80);
    }
    return sub_2196614BC(v56, (uint64_t (*)(_QWORD))sub_21965BFB8);
  }
  return result;
}

uint64_t sub_219668E80(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17[2];

  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  v3 = a1;
  v4 = sub_219681634();
  v5 = sub_219681BD4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v17[0] = v7;
    *(_DWORD *)v6 = 136315394;
    v8 = sub_219681F34();
    v16 = sub_21967C8D8(v8, v9, v17);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    v10 = objc_msgSend(v3, sel_debugDescription, v16);
    sub_219681A6C();

    sub_219681E74();
    v11 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_219681C70();
    swift_unknownObjectRelease();
    v12 = sub_219681A78();
    sub_21967C8D8(v12, v13, v17);
    sub_219681C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v4, v5, "[%s] Will insert new record %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v7, -1, -1);
    MEMORY[0x219A3195C](v6, -1, -1);

  }
  else
  {

  }
  MEMORY[0x24BDAC7A8](v14);
  swift_beginAccess();
  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  sub_219681988();
  return swift_endAccess();
}

uint64_t sub_219669188(uint64_t a1, void *a2)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[32];

  sub_21966A7D0(0, &qword_253E61210, (void (*)(uint64_t))MEMORY[0x24BE18A58]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - v4;
  sub_21966A81C(0, &qword_253E611F8, type metadata accessor for CoherentExperienceSetupRecord, sub_219669DB0, MEMORY[0x24BE18658]);
  v20 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - v8;
  v10 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - v14;
  sub_21965DC5C(a2, (uint64_t)&v19 - v14);
  sub_219661478((uint64_t)v15, (uint64_t)v13, type metadata accessor for CoherentExperienceSetupRecord);
  v16 = sub_219681A0C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 1, 1, v16);
  sub_219669DB0();
  swift_retain();
  sub_2196818EC();
  swift_getKeyPath();
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  v17 = (void (*)(_BYTE *, _QWORD))sub_219681970();
  sub_219669E2C(0, (unint64_t *)&qword_253E60DA8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BE18310]);
  sub_219681874();
  v17(v21, 0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  return sub_2196614BC((uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
}

void sub_2196693C4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - v5;
  v7 = sub_2196818E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21966853C();
  if (!v1)
  {
    v24 = v0;
    v12 = v7;
    v25 = v11;
    v13 = v11 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    sub_219681988();
    swift_endAccess();
    sub_2196819F4();
    v14 = sub_2196819E8();
    v15 = *MEMORY[0x24BE184E0];
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
    v26 = v12;
    v17 = v12;
    v18 = (void *)v14;
    v16(v10, v15, v17);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v19 = sub_2196819AC();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v22 = (void *)sub_2196814E4();
    sub_219669FB4(v19, v21);
    objc_msgSend(v24, sel_setMenstrualCyclesExperienceModelData_, v22);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
    swift_release();

  }
}

uint64_t sub_219669618()
{
  void (*v0)(uint64_t *, _QWORD);
  uint64_t v2;

  swift_getKeyPath();
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  v0 = (void (*)(uint64_t *, _QWORD))sub_219681970();
  sub_219669E2C(0, (unint64_t *)&qword_253E60DA8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BE18310]);
  sub_219681880();
  v0(&v2, 0);
  return swift_release();
}

BOOL HDCodableMenstrualCyclesExperienceModel.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  id v30;
  id v31;
  void *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[24];
  uint64_t v40;

  sub_219669E2C(0, (unint64_t *)&qword_253E60DA8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BE18310]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - v9;
  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - v17;
  sub_219661478(a1, (uint64_t)v39, (uint64_t (*)(_QWORD))sub_21966A5EC);
  if (v40)
  {
    sub_21966A5B0();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v36 = v5;
      v37 = v4;
      v19 = v38;
      v20 = sub_21966853C();
      v34 = v1;
      v35 = v20;
      v22 = sub_21966853C();
      v23 = v35 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
      swift_beginAccess();
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      v33(v18, v23, v12);
      swift_getKeyPath();
      sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
      v32 = v19;
      sub_219681994();
      swift_release();
      v24 = *(void (**)(char *, uint64_t))(v13 + 8);
      v24(v18, v12);
      v25 = v22 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
      swift_beginAccess();
      v33(v16, v25, v12);
      swift_getKeyPath();
      v26 = v32;
      sub_219681994();
      swift_release();
      v24(v16, v12);
      sub_21966A81C(0, &qword_253E611F8, type metadata accessor for CoherentExperienceSetupRecord, sub_219669DB0, MEMORY[0x24BE18658]);
      sub_219669DCC(&qword_253E611E8, MEMORY[0x24BE18690]);
      sub_219669DCC(&qword_253E611F0, MEMORY[0x24BE186A0]);
      v27 = sub_219681850();
      v28 = v37;
      v29 = *(void (**)(char *, uint64_t))(v36 + 8);
      v29(v8, v37);
      v29(v10, v28);
      if ((v27 & 1) != 0)
      {
        v30 = objc_msgSend(v34, sel_epoch);
        v31 = objc_msgSend(v26, sel_epoch);

        swift_release();
        swift_release();
        return v30 == v31;
      }

      swift_release();
      swift_release();
    }
  }
  else
  {
    sub_2196614BC((uint64_t)v39, (uint64_t (*)(_QWORD))sub_21966A5EC);
  }
  return 0;
}

BOOL sub_219669A8C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_219681C70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = HDCodableMenstrualCyclesExperienceModel.isEqual(_:)((uint64_t)v8);

  sub_2196614BC((uint64_t)v8, (uint64_t (*)(_QWORD))sub_21966A5EC);
  return v6;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodableMenstrualCyclesExperienceModel.purgeCoherentMetadataAndIncrementEpoch()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - v5;
  v7 = sub_2196818E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966853C();
  if (!v1)
  {
    v28 = v0;
    swift_retain();
    v11 = sub_21967386C();
    v29 = v4;
    v12 = v7;
    v13 = v11;
    swift_release_n();
    sub_2196819F4();
    swift_retain();
    v14 = sub_2196819E8();
    v15 = *MEMORY[0x24BE184E0];
    v30 = v8;
    v31 = v12;
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
    v17 = (void *)v14;
    v18 = v12;
    v19 = v29;
    v16(v10, v15, v18);
    v32 = v13;
    v20 = v13 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v6, v20, v3);
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v21 = sub_2196819AC();
    v23 = v22;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v3);
    v24 = (void *)sub_2196814E4();
    sub_219669FB4(v21, v23);
    v25 = v28;
    objc_msgSend(v28, sel_setMenstrualCyclesExperienceModelData_, v24);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
    swift_release();
    v26 = (char *)objc_msgSend(v25, sel_epoch);
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v25, sel_setEpoch_, v26 + 1);
      swift_release();
    }
  }
}

uint64_t sub_219669DB0()
{
  return sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
}

uint64_t sub_219669DCC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_21966A81C(255, &qword_253E611F8, type metadata accessor for CoherentExperienceSetupRecord, sub_219669DB0, MEMORY[0x24BE18658]);
    result = MEMORY[0x219A318B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_219669E2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    sub_21966A81C(255, &qword_253E611F8, type metadata accessor for CoherentExperienceSetupRecord, sub_219669DB0, MEMORY[0x24BE18658]);
    v7 = v6;
    v8 = sub_219669DCC(&qword_253E611E8, MEMORY[0x24BE18690]);
    v9 = sub_219669DCC(&qword_253E611F0, MEMORY[0x24BE186A0]);
    v10 = a3(a1, v7, v8, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

uint64_t sub_219669EE4()
{
  return sub_219654D90(&qword_253E61198, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686A28);
}

void sub_219669F00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550905F8)
  {
    sub_21966A81C(255, &qword_253E611F8, type metadata accessor for CoherentExperienceSetupRecord, sub_219669DB0, MEMORY[0x24BE18658]);
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550905F8);
  }
}

uint64_t sub_219669F74(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_219669E2C(255, a2, a3);
    result = MEMORY[0x219A318B4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_219669FB4(uint64_t a1, unint64_t a2)
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

unint64_t HDCodableMenstrualCyclesExperienceModel.Failure.debugDescription.getter()
{
  return 0xD000000000000044;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.logDescription.getter()
{
  uint64_t v1;

  swift_getObjectType();
  sub_21966853C();
  type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
  swift_retain();
  sub_219681A78();
  sub_219681A9C();
  swift_release();
  swift_bridgeObjectRelease();
  v1 = sub_219681F34();
  sub_219681A9C();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static HDCodableMenstrualCyclesExperienceModel.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.Failure.hash(into:)()
{
  return sub_219681EE0();
}

uint64_t HDCodableMenstrualCyclesExperienceModel.Failure.hashValue.getter()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

uint64_t sub_21966A18C()
{
  return 1;
}

uint64_t sub_21966A194()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

uint64_t sub_21966A1D4()
{
  return sub_219681EE0();
}

uint64_t sub_21966A1F8()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

unint64_t sub_21966A244()
{
  return 0xD000000000000044;
}

id sub_21966A260()
{
  void *v0;

  return objc_msgSend(v0, sel_epoch);
}

id sub_21966A270(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setEpoch_, a1);
}

id (*sub_21966A284(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_epoch);
  return sub_21966A2C4;
}

id sub_21966A2C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setEpoch_, *(_QWORD *)a1);
}

uint64_t sub_21966A2DC(uint64_t a1)
{
  return HDCodableMenstrualCyclesExperienceModel.merge(with:)(a1);
}

void sub_21966A2F0()
{
  HDCodableMenstrualCyclesExperienceModel.purgeCoherentMetadataAndIncrementEpoch()();
}

uint64_t sub_21966A308(uint64_t a1)
{
  uint64_t v1;

  return sub_219668870(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

id sub_21966A320(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id result;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  sub_21966A81C(0, &qword_253E61208, type metadata accessor for CoherentExperienceSetupRecordDatabase, sub_219669EE4, MEMORY[0x24BE188F8]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v20 - v6;
  v23 = sub_2196818E0();
  v22 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (result)
  {
    v21 = result;
    v11 = sub_219675908(a1);
    sub_2196819F4();
    v12 = (void *)sub_2196819E8();
    (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v9, *MEMORY[0x24BE184E0], v23);
    v13 = v11 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v14 = sub_2196819AC();
    if (v1)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();

      v16 = v21;
    }
    else
    {
      v17 = v14;
      v18 = v15;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v19 = (void *)sub_2196814E4();
      sub_219669FB4(v17, v18);
      v16 = v21;
      objc_msgSend(v21, sel_setMenstrualCyclesExperienceModelData_, v19);
      swift_release();

    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21966A588()
{
  return sub_219681E44();
}

unint64_t sub_21966A5B0()
{
  unint64_t result;

  result = qword_253E60DD0;
  if (!qword_253E60DD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60DD0);
  }
  return result;
}

void sub_21966A5EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60AF8[0])
  {
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, qword_253E60AF8);
  }
}

unint64_t sub_21966A644()
{
  unint64_t result;

  result = qword_255090358;
  if (!qword_255090358)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255090358);
  }
  return result;
}

unint64_t sub_21966A69C()
{
  unint64_t result;

  result = qword_255090618;
  if (!qword_255090618)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDCodableMenstrualCyclesExperienceModel.Failure, &type metadata for HDCodableMenstrualCyclesExperienceModel.Failure);
    atomic_store(result, (unint64_t *)&qword_255090618);
  }
  return result;
}

uint64_t _s7FailureOwet(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s7FailureOwst(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_21966A774 + 4 * byte_219686300[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21966A794 + 4 * byte_219686305[v4]))();
}

_BYTE *sub_21966A774(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21966A794(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21966A79C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21966A7A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21966A7AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21966A7B4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HDCodableMenstrualCyclesExperienceModel.Failure()
{
  return &type metadata for HDCodableMenstrualCyclesExperienceModel.Failure;
}

void sub_21966A7D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_219681C40();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_21966A81C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

unint64_t sub_21966A88C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_253E61128;
  if (!qword_253E61128)
  {
    sub_21965C698(255);
    v2 = v1;
    v3 = sub_219654D90(&qword_253E61100, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, (uint64_t)&unk_219686024);
    result = MEMORY[0x219A318B4](MEMORY[0x24BE18AE8], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_253E61128);
  }
  return result;
}

uint64_t sub_21966A904(uint64_t a1)
{
  uint64_t v1;

  return sub_219669188(a1, *(void **)(v1 + 16));
}

unint64_t sub_21966A91C()
{
  unint64_t result;

  result = qword_255090620;
  if (!qword_255090620)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDCodableMenstrualCyclesExperienceModel.Failure, &type metadata for HDCodableMenstrualCyclesExperienceModel.Failure);
    atomic_store(result, (unint64_t *)&qword_255090620);
  }
  return result;
}

uint64_t sub_21966A960()
{
  uint64_t v0;

  v0 = sub_21968164C();
  __swift_allocate_value_buffer(v0, qword_253E60BE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_253E60BE8);
  return sub_219681640();
}

uint64_t static Logger.menstrualCycles.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

id HDMCExperienceStoreServer.__allocating_init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v9 = objc_allocWithZone(v4);
  v10 = (void *)sub_21968158C();
  v11 = objc_msgSend(v9, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  v12 = sub_2196815BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id HDMCExperienceStoreServer.init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v4;
  char *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v19;
  objc_super v20;
  _OWORD v21[2];
  _BYTE v22[24];
  uint64_t v23;

  swift_unknownObjectWeakInit();
  v9 = v4;
  v10 = objc_msgSend(a3, sel_profile);
  v11 = objc_msgSend(v10, sel_profileExtensionWithIdentifier_, *MEMORY[0x24BE46AC8]);

  if (v11)
  {
    sub_219681C70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_219654C14((uint64_t)v21, (uint64_t)v22);
  if (!v23)
  {
    sub_219654C74((uint64_t)v22);
    goto LABEL_8;
  }
  sub_219654DFC(0, &qword_253E60C60);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v14 = 0;
    v12 = 0;
    *(_QWORD *)&v9[OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager] = 0;
    goto LABEL_9;
  }
  v12 = v19;
  v13 = objc_msgSend(v19, sel_experienceModelManager);
  *(_QWORD *)&v9[OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager] = v13;
  v14 = objc_msgSend(v19, sel_pregnancyManager);
LABEL_9:
  swift_unknownObjectWeakAssign();

  v15 = (void *)sub_21968158C();
  v20.receiver = v9;
  v20.super_class = (Class)type metadata accessor for HDMCExperienceStoreServer();
  v16 = objc_msgSendSuper2(&v20, sel_initWithUUID_configuration_client_delegate_, v15, a2, a3, a4);

  swift_unknownObjectRelease();
  v17 = sub_2196815BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
  return v16;
}

uint64_t type metadata accessor for HDMCExperienceStoreServer()
{
  return objc_opt_self();
}

uint64_t sub_21966AF6C(uint64_t (*a1)(uint64_t, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  v2 = v1;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v4 = sub_21968164C();
  __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  v5 = sub_219681634();
  v6 = sub_219681BD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_219681F34();
    sub_21967C8D8(v9, v10, &v13);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v5, v6, "[%{public}s] Starting observation", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v8, -1, -1);
    MEMORY[0x219A3195C](v7, -1, -1);
  }

  v11 = *(void **)(v2 + OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager);
  if (v11)
    objc_msgSend(v11, sel_registerWithObserver_, v2);
  return a1(1, 0);
}

void sub_21966B148(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2196814CC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

id sub_21966B1A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id result;
  uint64_t v10;

  v1 = v0;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  v3 = sub_219681634();
  v4 = sub_219681BD4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_219681F34();
    sub_21967C8D8(v7, v8, &v10);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v3, v4, "[%{public}s] Stopping observation", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v6, -1, -1);
    MEMORY[0x219A3195C](v5, -1, -1);
  }

  result = *(id *)(v1 + OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager);
  if (result)
    return objc_msgSend(result, sel_removeWithObserver_, v1);
  return result;
}

void sub_21966B374(void (*a1)(id, _QWORD))
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t inited;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v2 = v1;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v4 = sub_21968164C();
  __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  v5 = sub_219681634();
  v6 = sub_219681BD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v21 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_219681F34();
    sub_21967C8D8(v9, v10, &v21);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v5, v6, "[%{public}s] Fetching experience model", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v8, -1, -1);
    MEMORY[0x219A3195C](v7, -1, -1);
  }

  v11 = objc_msgSend(v2, sel_client);
  v12 = objc_msgSend(v11, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = v12;
  v14 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v15 = v12;
  v16 = (void *)sub_219681A48();
  v17 = objc_msgSend(v14, sel_initWithCategory_domainName_profile_, 100, v16, v15);

  *(_QWORD *)(inited + 24) = v17;
  v18 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  sub_21966853C();
  v19 = sub_219673B80();
  swift_release();
  v20 = v19;
  a1(v19, 0);

}

void sub_21966B824(void *a1, void (*a2)(uint64_t, _QWORD))
{
  void *v2;
  void *v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t inited;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;

  v3 = v2;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v5 = sub_21968164C();
  __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
  v6 = sub_219681634();
  v7 = sub_219681BD4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v21 = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = sub_219681F34();
    sub_21967C8D8(v10, v11, &v21);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v6, v7, "[%{public}s] Writing to experience model", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v9, -1, -1);
    MEMORY[0x219A3195C](v8, -1, -1);
  }

  v12 = objc_msgSend(v3, sel_client);
  v13 = objc_msgSend(v12, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = v13;
  v15 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v16 = v13;
  v17 = (void *)sub_219681A48();
  v18 = objc_msgSend(v15, sel_initWithCategory_domainName_profile_, 100, v17, v16);

  *(_QWORD *)(inited + 24) = v18;
  v19 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  HDCodableMenstrualCyclesExperienceModel.insert(record:)(a1);
  HDMCExperienceDaemonStore.setModel(_:)(v19);
  a2(1, 0);

}

void sub_21966BD34(void (*a1)(id, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v2 = v1;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v4 = sub_21968164C();
  __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  v5 = sub_219681634();
  v6 = sub_219681BD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v15 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_219681F34();
    sub_21967C8D8(v9, v10, &v15);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v5, v6, "[%{public}s] Getting cached model", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v8, -1, -1);
    MEMORY[0x219A3195C](v7, -1, -1);
  }

  v11 = MEMORY[0x219A319C8](v2 + OBJC_IVAR___HDMCExperienceStoreServer_pregnancyManager);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = HDMCPregnancyManager.getCurrentPregnancyModel()();

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE46B50]), sel_initWithModel_, v13);
  a1(v14, 0);

}

void sub_21966BF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2196814CC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_21966BF98(void (*a1)(uint64_t, _QWORD))
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t inited;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;

  v2 = v1;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v4 = sub_21968164C();
  __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  v5 = sub_219681634();
  v6 = sub_219681BD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_219681F34();
    sub_21967C8D8(v9, v10, &v19);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v5, v6, "[%{public}s] Deleting all setup records", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v8, -1, -1);
    MEMORY[0x219A3195C](v7, -1, -1);
  }

  v11 = objc_msgSend(v2, sel_client);
  v12 = objc_msgSend(v11, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = v12;
  v14 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v15 = v12;
  v16 = (void *)sub_219681A48();
  v17 = objc_msgSend(v14, sel_initWithCategory_domainName_profile_, 100, v16, v15);

  *(_QWORD *)(inited + 24) = v17;
  v18 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  sub_2196693C4();
  HDMCExperienceDaemonStore.setModel(_:)(v18);
  a1(1, 0);

}

uint64_t sub_21966C434(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

id HDMCExperienceStoreServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCExperienceStoreServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HDMCExperienceStoreServer.experienceModelManagerDidUpdateModel()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t inited;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35[4];

  v1 = v0;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  v3 = sub_219681634();
  v4 = sub_219681BD4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v35[0] = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_219681F34();
    v34 = (void *)sub_21967C8D8(v7, v8, v35);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v3, v4, "[%{public}s] Received an update for the experience model", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v6, -1, -1);
    MEMORY[0x219A3195C](v5, -1, -1);
  }

  v9 = objc_msgSend(v1, sel_client);
  v10 = objc_msgSend(v9, sel_connection);

  if (v10
    && (v11 = objc_msgSend(v10, sel_remoteObjectProxy),
        v10,
        sub_219681C70(),
        swift_unknownObjectRelease(),
        sub_21966CD78(),
        (swift_dynamicCast() & 1) != 0))
  {
    v12 = objc_msgSend(v1, sel_client);
    v13 = objc_msgSend(v12, sel_profile);

    type metadata accessor for HDMCExperienceDaemonStore();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = v13;
    v15 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
    v16 = v13;
    v17 = (void *)sub_219681A48();
    v18 = objc_msgSend(v15, sel_initWithCategory_domainName_profile_, 100, v17, v16);

    *(_QWORD *)(inited + 24) = v18;
    v19 = HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
    v26 = v19;
    if (v19)
    {
      sub_21966853C();
      v33 = sub_219673B80();
      swift_release();
      objc_msgSend(v34, sel_client_experienceModelDidUpdate_, v33);

      swift_unknownObjectRelease();
    }
    else
    {
      v27 = sub_219681634();
      v28 = sub_219681BD4();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v35[0] = v30;
        *(_DWORD *)v29 = 136315138;
        v31 = sub_219681F34();
        sub_21967C8D8(v31, v32, v35);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v27, v28, "[%s] Nil experience model", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v30, -1, -1);
        MEMORY[0x219A3195C](v29, -1, -1);
        swift_unknownObjectRelease();

      }
      else
      {

        swift_unknownObjectRelease();
      }
      swift_release();
    }
  }
  else
  {
    v20 = sub_219681634();
    v21 = sub_219681BC8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v35[0] = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = sub_219681F34();
      sub_21967C8D8(v24, v25, v35);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v20, v21, "[%s] Unexpected client interface", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v23, -1, -1);
      MEMORY[0x219A3195C](v22, -1, -1);
    }

  }
}

void sub_21966CC5C(void *a1)
{
  id v1;
  unsigned int v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, sel_entitlements);
  v2 = objc_msgSend(v1, sel_hasEntitlement_, *MEMORY[0x24BDD3310]);

  if (!v2)
  {
    v3 = (void *)objc_opt_self();
    sub_219681D48();
    swift_bridgeObjectRelease();
    sub_219681A6C();
    sub_219681A9C();
    swift_bridgeObjectRelease();
    v4 = (void *)sub_219681A48();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_hk_error_description_, 4, v4, 0xD00000000000001DLL, 0x8000000219689AE0);

    swift_willThrow();
  }
}

unint64_t sub_21966CD78()
{
  unint64_t result;

  result = qword_255090650;
  if (!qword_255090650)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255090650);
  }
  return result;
}

uint64_t method lookup function for HDMCExperienceStoreServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_startObservingChanges(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_stopObservingChanges()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_getExperienceModel(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_persistSetupRecord(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_getCachedPregnancyModel(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_deleteAllPregnancySetupRecords(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_21966CE80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21966CEA4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_21966B148(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_21966CEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21966BF40(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_21966CEE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, _QWORD, uint64_t);
  void (*v18)(char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v21 = a1;
  v22 = a2;
  v3 = sub_219681610();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21965BFB8();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_219681574();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - v15;
  v17 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v17(v6, *MEMORY[0x24BDCF220], v3);
  v21 = v2;
  sub_219681604();
  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_21965C064((uint64_t)v9);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v22, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    sub_2196815E0();
    v17(v6, *MEMORY[0x24BDCF260], v3);
    sub_219681604();
    v18(v6, v3);
    v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v14, v10);
    return ((uint64_t (*)(char *, uint64_t))v20)(v16, v10);
  }
}

void _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE26predicateForOngoingSamples2onABSi_tFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;

  v2 = sub_219681574();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_hk_latestPossibleDateWithDayIndex_, a1);
  v7 = (id)HDSampleEntityPredicateForStartDate();
  sub_2196814FC();
  v8 = (void *)sub_219681514();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = (id)HDSampleEntityPredicateForEndDate();

  sub_21966D780();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_219686510;
  v11 = sub_21966D7D8();
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 88) = v11;
  *(_QWORD *)(v10 + 56) = v11;
  *(_QWORD *)(v10 + 64) = v9;
  v12 = v7;
  v13 = v9;
  v14 = (void *)sub_219681ACC();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend((id)objc_opt_self(), sel_predicateMatchingAllPredicates_, v14);

  if (v15)
  {

  }
  else
  {
    __break(1u);
  }
}

uint64_t _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE45predicateForSamplesThatEndedInTheTwelveMonths6beforeAB10Foundation4DateV_tFZ_0(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  char *v31;
  void *v32;
  id v33;
  unint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t result;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;

  v43 = a1;
  v1 = sub_219681610();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21965BFB8();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v44 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v40 - v8;
  v10 = sub_219681574();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v40 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v45 = (char *)&v40 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v40 - v19;
  v21 = sub_21968161C();
  v41 = *(_QWORD *)(v21 - 8);
  v42 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = objc_msgSend((id)objc_opt_self(), sel_latestTimeZoneCalendar);
  sub_2196815F8();

  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCF250], v1);
  sub_219681604();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v25((uint64_t)v9, 1, v10) != 1)
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v26(v20, v9, v10);
    v43 = v20;
    v27 = (void *)sub_219681514();
    v28 = (id)HDSampleEntityPredicateForEndDate();

    sub_219681568();
    v29 = v44;
    sub_21966CEE4((uint64_t)v16, v44);
    v11 = *(_QWORD *)(v11 + 8);
    ((void (*)(char *, uint64_t))v11)(v16, v10);
    if (v25(v29, 1, v10) == 1)
    {
      sub_21965C064(v29);
      goto LABEL_8;
    }
    v30 = v23;
    v31 = v45;
    v26(v45, (char *)v29, v10);
    v32 = (void *)sub_219681514();
    v33 = (id)HDSampleEntityPredicateForEndDate();

    sub_21966D780();
    v9 = (char *)swift_allocObject();
    *((_OWORD *)v9 + 1) = xmmword_219686510;
    v34 = sub_21966D7D8();
    *((_QWORD *)v9 + 4) = v28;
    *((_QWORD *)v9 + 11) = v34;
    *((_QWORD *)v9 + 7) = v34;
    *((_QWORD *)v9 + 8) = v33;
    v35 = v28;
    v36 = v33;
    v37 = (void *)sub_219681ACC();
    swift_bridgeObjectRelease();
    v38 = objc_msgSend((id)objc_opt_self(), sel_predicateMatchingAllPredicates_, v37);

    if (v38)
    {

      ((void (*)(char *, uint64_t))v11)(v31, v10);
      ((void (*)(char *, uint64_t))v11)(v43, v10);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v42);
      return (uint64_t)v38;
    }
    __break(1u);
  }
  sub_21965C064((uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v40, v43, v10);
  v46 = 0;
  v47 = 0xE000000000000000;
  sub_219681D48();
  swift_bridgeObjectRelease();
  v46 = 0xD000000000000021;
  v47 = 0x800000021968A350;
  sub_21966D738();
  sub_219681E44();
  sub_219681A9C();
  swift_bridgeObjectRelease();
LABEL_8:
  result = sub_219681DD8();
  __break(1u);
  return result;
}

unint64_t sub_21966D738()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550906C0;
  if (!qword_2550906C0)
  {
    v1 = sub_219681574();
    result = MEMORY[0x219A318B4](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_2550906C0);
  }
  return result;
}

void sub_21966D780()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CE8)
  {
    v0 = sub_219681E50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CE8);
  }
}

unint64_t sub_21966D7D8()
{
  unint64_t result;

  result = qword_253E60C40;
  if (!qword_253E60C40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60C40);
  }
  return result;
}

uint64_t ExperienceModelSyncStateUpdaterDelegate.__allocating_init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];

  v18[1] = a6;
  v18[2] = a8;
  v11 = sub_21968164C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18[3] = a7;
  v16 = sub_219681628();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v16;
}

uint64_t ExperienceModelSyncStateUpdaterDelegate.init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v15[1] = a8;
  v10 = sub_21968164C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v15[3] = a7;
  v13 = sub_219681628();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v13;
}

id ExperienceModelSyncStateUpdaterDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ExperienceModelSyncStateUpdaterDelegate()
{
  uint64_t result;

  result = qword_2550906C8;
  if (!qword_2550906C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21966DA60()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21966DA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  objc_class *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];

  v19[1] = a6;
  v19[2] = a8;
  v11 = sub_21968164C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a7;
  v16 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v19[3] = v15;
  v17 = sub_219681628();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v17;
}

uint64_t sub_21966DB90()
{
  return type metadata accessor for ExperienceModelSyncStateUpdaterDelegate();
}

uint64_t sub_21966DB98(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v18 = MEMORY[0x24BEE4AF8];
  sub_21965FEBC(0, v1, 0);
  v2 = v18;
  result = sub_2196607A8(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_19;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v7)
      goto LABEL_20;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + v5))
      v10 = 0xD000000000000014;
    else
      v10 = 0xD000000000000010;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + v5))
      v11 = 0x800000021968A400;
    else
      v11 = 0x800000021968A420;
    v13 = *(_QWORD *)(v18 + 16);
    v12 = *(_QWORD *)(v18 + 24);
    if (v13 >= v12 >> 1)
    {
      v17 = v9;
      sub_21965FEBC(v12 > 1, v13 + 1, 1);
      v9 = v17;
    }
    *(_QWORD *)(v18 + 16) = v13 + 1;
    v14 = v18 + 16 * v13;
    *(_QWORD *)(v14 + 32) = v10;
    *(_QWORD *)(v14 + 40) = v11;
    result = sub_21966084C(v5, v7, v9 & 1, a1);
    v5 = result;
    v7 = v15;
    v9 = v16 & 1;
    if (!--v1)
    {
      sub_2196611C0(result, v15, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

void sub_21966DD40(uint64_t a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = sub_21966EE24(a1);
  v6 = v5;
  if (qword_253E60AC8 != -1)
    swift_once();
  v7 = sub_21968164C();
  __swift_project_value_buffer(v7, (uint64_t)qword_253E60BE8);
  swift_bridgeObjectRetain();
  v8 = sub_219681634();
  v9 = sub_219681BD4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136446466;
    sub_21967C8D8(0xD00000000000001ALL, 0x8000000219686610, &v13);
    sub_219681C58();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21967C8D8(v4, v6, &v13);
    sub_219681C58();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21961B000, v8, v9, "[%{public}s] reloading widgets with reason: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v11, -1, -1);
    MEMORY[0x219A3195C](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_21966EE24(a1);
  v12 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();

}

unint64_t HDMCWidgetReloadReason.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0xD000000000000010;
}

void sub_21966DFAC(uint64_t a1)
{
  void **v1;

  sub_21966DD40(a1, *v1);
}

BOOL static HDMCWidgetReloadReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t HDMCWidgetReloadReason.hash(into:)()
{
  return sub_219681EE0();
}

uint64_t HDMCWidgetReloadReason.hashValue.getter()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

unint64_t sub_21966E038()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0xD000000000000010;
}

uint64_t sub_21966E078()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

uint64_t sub_21966E0BC()
{
  return sub_219681EE0();
}

uint64_t sub_21966E0E4()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

unint64_t sub_21966E128()
{
  unint64_t result;

  result = qword_253E60D98;
  if (!qword_253E60D98)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDMCWidgetReloadReason, &type metadata for HDMCWidgetReloadReason);
    atomic_store(result, (unint64_t *)&qword_253E60D98);
  }
  return result;
}

uint64_t dispatch thunk of HDMCWidgetTimelineReloading.reloadWidgets(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t storeEnumTagSinglePayload for HDMCWidgetReloadReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21966E1C0 + 4 * byte_219686555[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21966E1F4 + 4 * asc_219686550[v4]))();
}

uint64_t sub_21966E1F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21966E1FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21966E204);
  return result;
}

uint64_t sub_21966E210(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21966E218);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21966E21C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21966E224(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HDMCWidgetReloadReason()
{
  return &type metadata for HDMCWidgetReloadReason;
}

uint64_t sub_21966E240(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_219664FC8(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_21966E2A8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21966E2A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_219681E38();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_21966E990(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_21966EA5C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_219664C90((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_219681B08();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_219681E68();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_219681E68()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_219664A34(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_219664A34((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_21966EA5C((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_219681E68() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_219681DCC();
  __break(1u);
  return result;
}

uint64_t sub_21966E990(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_219681E68(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21966EA5C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_219681E68() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_219681E68() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_219664BE8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_219681DFC();
  __break(1u);
  return result;
}

id sub_21966ECF4(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = objc_msgSend(a1, sel_daemon);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_behavior);

    objc_msgSend(v3, sel_isAppleWatch);
  }
  sub_219681A6C();
  sub_219681A6C();
  v4 = objc_allocWithZone(MEMORY[0x24BE16A10]);
  v5 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithExtensionBundleIdentifier_kind_, v5, v6);

  return v7;
}

ValueMetadata *type metadata accessor for HDMCWidgetTimelineReloader()
{
  return &type metadata for HDMCWidgetTimelineReloader;
}

uint64_t sub_21966EE24(uint64_t a1)
{
  uint64_t v2[2];

  v2[0] = sub_21966DB98(a1);
  swift_bridgeObjectRetain();
  sub_21966E240(v2);
  swift_bridgeObjectRelease();
  v2[0] = 91;
  v2[1] = 0xE100000000000000;
  sub_21966EEFC();
  sub_21966EF50();
  sub_219681A24();
  swift_release();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  return v2[0];
}

void sub_21966EEFC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E61228)
  {
    v0 = sub_219681B20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E61228);
  }
}

unint64_t sub_21966EF50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253E61230;
  if (!qword_253E61230)
  {
    sub_21966EEFC();
    result = MEMORY[0x219A318B4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_253E61230);
  }
  return result;
}

void HDMCPregnancyManager.register(_:isUserInitiated:)(uint64_t a1, char a2)
{
  uint64_t v2;

  swift_getObjectType();
  sub_219671FB8(a1, a2, v2);
}

id HDMCPregnancyManager.unregisterObserver(_:)(uint64_t a1)
{
  uint64_t v1;

  swift_getObjectType();
  return sub_219672030(a1, v1);
}

uint64_t sub_21966F000(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void *HDMCPregnancyManager.getCurrentPregnancyModel()()
{
  uint64_t v0;
  uint64_t ObjectType;
  os_unfair_lock_s *v2;
  void **v3;
  os_unfair_lock_s *v4;
  void *v6;

  ObjectType = swift_getObjectType();
  v2 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel);
  v3 = (void **)&v2[4];
  v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_219671A84(v3, ObjectType, &v6);
  os_unfair_lock_unlock(v4);
  return v6;
}

uint64_t HDMCPregnancyManager.DeriveOperationState.hash(into:)()
{
  return sub_219681EE0();
}

BOOL static HDMCPregnancyManager.DeriveOperationState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HDMCPregnancyManager.DeriveOperationState.hashValue.getter()
{
  sub_219681ED4();
  sub_219681EE0();
  return sub_219681EEC();
}

BOOL sub_21966F0F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id HDMCPregnancyManager.protectedDataOperation.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation));
}

uint64_t HDMCPregnancyManager.lockedOperationState.getter()
{
  return swift_retain();
}

char *HDMCPregnancyManager.__allocating_init(profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  objc_class *v5;
  id v11;
  id v12;
  char *v13;

  v11 = objc_allocWithZone(v5);
  v12 = objc_allocWithZone(v5);
  v13 = HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(1, a1, a2, a3, a4, a5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

char *HDMCPregnancyManager.init(profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  char *v11;

  v10 = objc_allocWithZone((Class)swift_getObjectType());
  v11 = HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(1, a1, a2, a3, a4, a5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

char *HDMCPregnancyManager.__allocating_init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(a1, a2, a3, a4, a5, a6);
}

char *HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void **v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  objc_class *v39;
  id v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  objc_class *ObjectType;
  int v64;
  void *v65;
  uint64_t v66;
  objc_super v67;
  uint64_t v68;

  v61 = a6;
  v62 = a5;
  v65 = a4;
  v59 = a3;
  v60 = a2;
  v64 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_219681BEC();
  v57 = *(_QWORD *)(v7 - 8);
  v58 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_219681BF8();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v10);
  v12 = sub_219681664();
  MEMORY[0x24BDAC7A8](v12);
  swift_unknownObjectWeakInit();
  v13 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState;
  sub_219672088();
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 20) = 0;
  *(_BYTE *)(v14 + 16) = 0;
  *(_QWORD *)&v6[v13] = v14;
  v15 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel;
  sub_2196720E4();
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)&v6[v15] = v16;
  v56 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_queue;
  sub_219654DFC(0, (unint64_t *)&qword_253E60C88);
  v17 = v6;
  sub_219681658();
  v68 = MEMORY[0x24BEE4AF8];
  sub_219654D90(&qword_253E60C80, v11, MEMORY[0x24BEE5940]);
  sub_219672160();
  sub_219654D90((unint64_t *)&unk_253E60C10, (uint64_t (*)(uint64_t))sub_219672160, MEMORY[0x24BEE12C8]);
  v18 = v59;
  sub_219681C7C();
  (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v9, *MEMORY[0x24BEE5758], v58);
  v19 = v60;
  *(_QWORD *)&v6[v56] = sub_219681C04();
  v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork] = 0;
  swift_unknownObjectWeakAssign();
  v20 = v62;
  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider] = v62;
  v21 = v20;
  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken] = swift_slowAlloc();
  if (v18)
  {
    v22 = v18;
  }
  else
  {
    v23 = objc_allocWithZone(MEMORY[0x24BE40B80]);
    v24 = v19;
    v25 = (void *)sub_219681A48();
    v22 = objc_msgSend(v23, sel_initWithProfile_debugIdentifier_delegate_, v24, v25, 0);

  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation] = v22;
  v26 = (void **)MEMORY[0x24BDD3030];
  v27 = (void *)*MEMORY[0x24BDD3030];
  v28 = objc_allocWithZone(MEMORY[0x24BDD3DD0]);
  v62 = v18;
  v29 = v27;
  v30 = (void *)sub_219681A48();
  v31 = objc_msgSend(v28, sel_initWithName_loggingCategory_, v30, v29);

  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers] = v31;
  v32 = *v26;
  v33 = objc_allocWithZone(MEMORY[0x24BDD3DD0]);
  v34 = v32;
  v35 = (void *)sub_219681A48();
  v36 = objc_msgSend(v33, sel_initWithName_loggingCategory_, v35, v34);

  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers] = v36;
  v37 = v61;
  *(_QWORD *)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_calendarCache] = v61;
  v38 = v37;

  v39 = ObjectType;
  v67.receiver = v17;
  v67.super_class = ObjectType;
  v40 = objc_msgSendSuper2(&v67, sel_init);
  v41 = qword_253E60AC8;
  v42 = (char *)v40;
  if (v41 != -1)
    swift_once();
  v43 = sub_21968164C();
  __swift_project_value_buffer(v43, (uint64_t)qword_253E60BE8);
  v44 = sub_219681634();
  v45 = sub_219681BD4();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v66 = v47;
    v59 = v38;
    *(_DWORD *)v46 = 136315138;
    v61 = v21;
    v68 = (uint64_t)v39;
    swift_getMetatypeMetadata();
    v48 = sub_219664FDC();
    v68 = sub_21967C8D8(v48, v49, &v66);
    v21 = v61;
    v38 = v59;
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v44, v45, "[%s] Initializing", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v47, -1, -1);
    MEMORY[0x219A3195C](v46, -1, -1);
  }

  v50 = v65;
  objc_msgSend(*(id *)&v42[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation], sel_setDelegate_, v42);
  objc_msgSend(v50, sel_registerWithObserver_, v42);
  v51 = (void *)MEMORY[0x219A319C8](&v42[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile]);
  if (v51)
  {
    v52 = v51;
    v53 = objc_msgSend(v51, sel_dataManager);

    sub_219654DFC(0, &qword_253E60C38);
    v54 = (void *)MEMORY[0x219A30B58]((id)*MEMORY[0x24BDD29D8]);
    objc_msgSend(v53, sel_addObserver_forDataType_, v42, v54);

  }
  sub_219670204();
  if ((v64 & 1) != 0)
    sub_21966FA34(2, 0);

  swift_unknownObjectRelease();
  return v42;
}

void sub_21966FA34(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44[2];

  v3 = v2;
  v44[1] = *MEMORY[0x24BDAC8D0];
  ObjectType = (void *)swift_getObjectType();
  v7 = sub_21968164C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253E60AC8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_253E60BE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_219681634();
  v13 = sub_219681BD4();
  if (os_log_type_enabled(v12, v13))
  {
    v39 = v11;
    v40 = a1;
    v42 = v3;
    v14 = a2;
    v15 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    v43 = ObjectType;
    v44[0] = v38;
    *(_DWORD *)v15 = 136315394;
    v41 = ObjectType;
    swift_getMetatypeMetadata();
    v16 = sub_219664FDC();
    v43 = (id)sub_21967C8D8(v16, v17, v44);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    __asm { BR              X10 }
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v18 = *(void **)(v3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation);
  v43 = 0;
  if (objc_msgSend(v18, sel_requestWorkWithPriority_error_, a1, &v43))
  {
    v19 = *(_QWORD *)(v3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState);
    v20 = v43;
    os_unfair_lock_lock((os_unfair_lock_t)(v19 + 20));
    *(_BYTE *)(v19 + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 20));
  }
  else
  {
    v21 = v43;
    v22 = (void *)sub_2196814D8();

    swift_willThrow();
    v23 = v22;
    v24 = v22;
    v25 = sub_219681634();
    v26 = sub_219681BBC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v30 = ObjectType;
      v31 = v29;
      v43 = v30;
      v44[0] = v29;
      *(_DWORD *)v27 = 136315394;
      swift_getMetatypeMetadata();
      v32 = sub_219664FDC();
      v43 = (id)sub_21967C8D8(v32, v33, v44);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2112;
      v34 = v22;
      v35 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v43 = v35;
      sub_219681C58();
      *v28 = v35;

      _os_log_impl(&dword_21961B000, v25, v26, "[%s] Failed to request protected data operation error: %@", (uint8_t *)v27, 0x16u);
      sub_219672B78(0, (unint64_t *)&qword_253E60CB0, (unint64_t *)&qword_253E60CA8);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v28, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v31, -1, -1);
      MEMORY[0x219A3195C](v27, -1, -1);
    }
    else
    {

    }
    v36 = *(_QWORD *)(v3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState);
    os_unfair_lock_lock((os_unfair_lock_t)(v36 + 20));
    *(_BYTE *)(v36 + 16) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v36 + 20));

  }
}

id HDMCPregnancyManager.__deallocating_deinit()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = (void *)MEMORY[0x219A319C8](&v0[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile]);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_dataManager);

    sub_219654DFC(0, &qword_253E60C38);
    v6 = (void *)*MEMORY[0x24BDD29D8];
    v7 = v1;
    v8 = (void *)MEMORY[0x219A30B58](v6);
    objc_msgSend(v5, sel_removeObserver_forDataType_, v7, v8);

  }
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider], sel_removeObserver_, v1);
  v9 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken;
  if (notify_is_valid_token(**(_DWORD **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken]))
  {
    notify_cancel(**(_DWORD **)&v1[v9]);
    MEMORY[0x219A3195C](*(_QWORD *)&v1[v9], -1, -1);
  }
  v11.receiver = v1;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_dealloc);
}

id sub_219670204()
{
  uint64_t v0;
  int *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v1 = *(int **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken);
  v2 = *(NSObject **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_queue);
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6[4] = sub_219672BF0;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21967105C;
  v6[3] = &block_descriptor_15;
  v4 = _Block_copy(v6);
  swift_release();
  notify_register_dispatch("SignificantTimeChangeNotification", v1, v2, v4);
  _Block_release(v4);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider), sel_addObserver_selector_name_object_, v0, sel_significantTimeChangeDidOccur, *MEMORY[0x24BDBC9E8], 0);
}

void sub_219670308(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  char *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  id v50;
  void *v51;
  id v52;
  char **v53;
  id v54;
  void *v55;
  char **v56;
  unsigned int v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  unsigned int v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  os_unfair_lock_s *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t *v91;
  char *v92;
  uint64_t ObjectType;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v92 = a1;
  ObjectType = swift_getObjectType();
  v1 = type metadata accessor for HDMCPregnancyStateFactory();
  MEMORY[0x24BDAC7A8](v1);
  v91 = (uint64_t *)((char *)&v84 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = sub_2196815C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_21968161C();
  v90 = *(_QWORD *)(v88 - 8);
  v7 = MEMORY[0x24BDAC7A8](v88);
  v9 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v87 = (char *)&v84 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v84 - v12;
  if (qword_253E60AC8 != -1)
    swift_once();
  v14 = sub_21968164C();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_253E60BE8);
  v16 = sub_219681634();
  v17 = sub_219681BD4();
  v18 = os_log_type_enabled(v16, v17);
  v89 = v13;
  if (v18)
  {
    v19 = swift_slowAlloc();
    v85 = v3;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v86 = v15;
    v22 = v21;
    v98 = v21;
    *(_DWORD *)v20 = 136315138;
    *(_QWORD *)&v95 = ObjectType;
    swift_getMetatypeMetadata();
    v23 = sub_219664FDC();
    *(_QWORD *)&v95 = sub_21967C8D8(v23, v24, &v98);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v16, v17, "[%s] Starting derivation work", v20, 0xCu);
    swift_arrayDestroy();
    v25 = v22;
    v15 = v86;
    MEMORY[0x219A3195C](v25, -1, -1);
    v26 = v20;
    v3 = v85;
    MEMORY[0x219A3195C](v26, -1, -1);
  }

  v27 = MEMORY[0x219A319C8](v94 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile);
  if (!v27)
  {
    v43 = sub_219681634();
    v44 = sub_219681BD4();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v98 = v46;
      *(_DWORD *)v45 = 136315138;
      *(_QWORD *)&v95 = ObjectType;
      swift_getMetatypeMetadata();
      v47 = sub_219664FDC();
      *(_QWORD *)&v95 = sub_21967C8D8(v47, v48, &v98);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v43, v44, "[%s] Profile not available", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v46, -1, -1);
      MEMORY[0x219A3195C](v45, -1, -1);
    }

    v49 = 5;
    goto LABEL_22;
  }
  v28 = (void *)v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCEF70], v3);
  v29 = v89;
  sub_2196815D4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v30 = type metadata accessor for HDMCExperienceDaemonStore();
  v31 = (uint64_t)v9;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v28;
  v33 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v34 = v28;
  v35 = (void *)sub_219681A48();
  v36 = objc_msgSend(v33, sel_initWithCategory_domainName_profile_, 100, v35, v34);

  *(_QWORD *)(v32 + 24) = v36;
  v96 = v30;
  v97 = sub_219654D90(&qword_253E610E8, (uint64_t (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore, (uint64_t)&protocol conformance descriptor for HDMCExperienceDaemonStore);
  *(_QWORD *)&v95 = v32;
  v37 = (char *)v34;
  swift_retain();
  v38 = (void *)sub_2196815EC();
  v39 = HKMCTodayIndex();

  v40 = objc_msgSend(*(id *)(v94 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_calendarCache), sel_currentCalendar);
  v41 = (uint64_t)v87;
  sub_2196815F8();

  v42 = v88;
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 16))(v31, v29, v88);
  HDMCPregnancyStateFactory.init(profile:experienceDaemonStore:todayDayIndex:calendar:gregorianCalendar:)(v37, &v95, v39, v41, v31, v91);
  v50 = HDMCPregnancyStateFactory.deriveState()();
  v51 = (void *)objc_opt_self();
  v52 = v50;
  v53 = &selRef_ovulationTestResult;
  v54 = objc_msgSend(v51, sel_sharedBehavior);
  if (v54)
  {
    v55 = v54;
    v56 = &selRef_ovulationTestResult;
    v57 = objc_msgSend(v54, sel_showSensitiveLogItems);

    if (v57)
    {
      v58 = sub_219681634();
      v59 = sub_219681BD4();
      if (os_log_type_enabled(v58, v59))
      {
        v86 = v15;
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        v87 = v37;
        v62 = v61;
        v98 = v61;
        *(_DWORD *)v60 = 136315138;
        *(_QWORD *)&v95 = ObjectType;
        swift_getMetatypeMetadata();
        v63 = sub_219664FDC();
        *(_QWORD *)&v95 = sub_21967C8D8(v63, v64, &v98);
        v53 = &selRef_ovulationTestResult;
        sub_219681C58();
        v56 = &selRef_ovulationTestResult;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v58, v59, "[%s] Updating pregnancy state", v60, 0xCu);
        swift_arrayDestroy();
        v65 = v62;
        v37 = v87;
        MEMORY[0x219A3195C](v65, -1, -1);
        MEMORY[0x219A3195C](v60, -1, -1);
      }
      swift_release();

      sub_219665154((uint64_t)v91);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v88);
    }
    else
    {
      swift_release();
      sub_219665154((uint64_t)v91);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v42);
    }
    v66 = objc_msgSend(v51, v53[250]);
    if (v66)
    {
      v67 = v66;
      v68 = objc_msgSend(v66, v56[255]);

      if (v68)
      {
        v69 = v52;
        v70 = sub_219681634();
        v71 = sub_219681BD4();
        if (os_log_type_enabled(v70, v71))
        {
          v72 = swift_slowAlloc();
          v91 = (uint64_t *)swift_slowAlloc();
          *(_QWORD *)&v95 = v91;
          *(_DWORD *)v72 = 136446466;
          v73 = sub_219681F34();
          v98 = sub_21967C8D8(v73, v74, (uint64_t *)&v95);
          sub_219681C58();
          swift_bridgeObjectRelease();
          *(_WORD *)(v72 + 12) = 2080;
          ObjectType = v72 + 14;
          v75 = objc_msgSend(v69, sel_description);
          v76 = sub_219681A6C();
          v77 = v37;
          v79 = v78;

          v98 = sub_21967C8D8(v76, v79, (uint64_t *)&v95);
          sub_219681C58();

          v37 = v77;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21961B000, v70, v71, "[%{public}s] Updating model: %s", (uint8_t *)v72, 0x16u);
          v80 = v91;
          swift_arrayDestroy();
          MEMORY[0x219A3195C](v80, -1, -1);
          MEMORY[0x219A3195C](v72, -1, -1);

        }
        else
        {

        }
      }
      v81 = *(_QWORD *)(v94 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel);
      v82 = (os_unfair_lock_s *)(v81 + 24);
      os_unfair_lock_lock((os_unfair_lock_t)(v81 + 24));

      *(_QWORD *)(v81 + 16) = v52;
      v83 = v52;
      os_unfair_lock_unlock(v82);

      v49 = 3;
LABEL_22:
      *v92 = v49;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_219670E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x219A319C8](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_219670E9C();

  }
}

void sub_219670E9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  ObjectType = swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v3 = sub_21968164C();
  __swift_project_value_buffer(v3, (uint64_t)qword_253E60BE8);
  v4 = sub_219681634();
  v5 = sub_219681BD4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    v12 = ObjectType;
    *(_DWORD *)v6 = 136315138;
    swift_getMetatypeMetadata();
    v8 = sub_219664FDC();
    v12 = sub_21967C8D8(v8, v9, &v11);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v4, v5, "[%s] Received a significant time change notification", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v7, -1, -1);
    MEMORY[0x219A3195C](v6, -1, -1);
  }

  if ((uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count) >= 1)v10 = 1;
  else
    v10 = 2;
  sub_21966FA34(v10, 3);
}

uint64_t sub_21967105C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id HDMCPregnancyManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDMCPregnancyManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void HDMCPregnancyManager.performWork(for:profile:databaseAccessibilityAssertion:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  sub_2196721B4(a4);
}

void sub_219671150(id *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD aBlock[6];
  uint64_t v27;

  if (*a1)
  {
    v3 = qword_253E60AC8;
    v4 = *a1;
    if (v3 != -1)
      swift_once();
    v5 = sub_21968164C();
    __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
    v6 = a2;
    v7 = sub_219681634();
    v8 = sub_219681BD4();
    v9 = &qword_255090000;
    if (os_log_type_enabled(v7, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v27 = v11;
      *(_DWORD *)v10 = 136315394;
      swift_getMetatypeMetadata();
      v12 = sub_219664FDC();
      aBlock[0] = sub_21967C8D8(v12, v13, &v27);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2048;
      v14 = objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers], sel_count);

      aBlock[0] = v14;
      v9 = &qword_255090000;
      sub_219681C58();

      _os_log_impl(&dword_21961B000, v7, v8, "[%s] Notifying %ld observers", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v11, -1, -1);
      MEMORY[0x219A3195C](v10, -1, -1);

    }
    else
    {

    }
    v22 = *(void **)&v6[v9[236]];
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v4;
    aBlock[4] = sub_219672B68;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_219666688;
    aBlock[3] = &block_descriptor_9;
    v24 = _Block_copy(aBlock);
    v25 = v4;
    swift_release();
    objc_msgSend(v22, sel_notifyObservers_, v24);
    _Block_release(v24);

  }
  else
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v15 = sub_21968164C();
    __swift_project_value_buffer(v15, (uint64_t)qword_253E60BE8);
    v16 = sub_219681634();
    v17 = sub_219681BBC();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v27 = v19;
      *(_DWORD *)v18 = 136315138;
      swift_getMetatypeMetadata();
      v20 = sub_219664FDC();
      aBlock[0] = sub_21967C8D8(v20, v21, &v27);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v16, v17, "[%s] Not notifying clients due to nil model with .complete state", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v19, -1, -1);
      MEMORY[0x219A3195C](v18, -1, -1);
    }

  }
}

void sub_21967154C(void *a1)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3CB0]), sel_initWithState_pregnancyStartDate_pregnancyEndDate_estimatedDueDate_pregnancyDuration_physiologicalWashoutEndDate_behavioralWashoutEndDate_trimesters_sample_educationalStepsCompletedDate_, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(a1, sel_pregnancyModelDidUpdate_, v2);

}

id HKMCPregnancyModel.init(state:)(uint64_t a1)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithState_pregnancyStartDate_pregnancyEndDate_estimatedDueDate_pregnancyDuration_physiologicalWashoutEndDate_behavioralWashoutEndDate_trimesters_sample_educationalStepsCompletedDate_, a1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

Swift::String __swiftcall HDMCPregnancyManager.diagnosticDescription()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  void *v3;
  Swift::String result;
  _QWORD v5[2];

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState)
                          + 20);
  os_unfair_lock_lock(v1);
  sub_2196717C8(v0, v5);
  os_unfair_lock_unlock(v1);
  v2 = v5[0];
  v3 = (void *)v5[1];
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_2196717C8@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  sub_219681D48();
  sub_219681A9C();
  sub_219681A78();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  v4 = *(void **)(a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers);
  objc_msgSend(v4, sel_count);
  sub_219681E44();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count);
  sub_219681E44();
  sub_219681A9C();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  v5 = objc_msgSend(v4, sel_allObservers);
  v6 = sub_219672AD8();
  v7 = sub_219681AD8();

  MEMORY[0x219A30A5C](v7, v6);
  sub_219681A9C();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  return result;
}

id sub_219671A84@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_253E60AC8 != -1)
    swift_once();
  v6 = sub_21968164C();
  __swift_project_value_buffer(v6, (uint64_t)qword_253E60BE8);
  v7 = sub_219681634();
  v8 = sub_219681BD4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    v16 = a2;
    swift_getMetatypeMetadata();
    v11 = sub_219664FDC();
    v16 = sub_21967C8D8(v11, v12, &v15);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v7, v8, "[%s] Returning currently cached model", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v10, -1, -1);
    MEMORY[0x219A3195C](v9, -1, -1);
  }

  v13 = *a1;
  *a3 = *a1;
  return v13;
}

Swift::Void __swiftcall HDMCPregnancyManager.experienceModelManagerDidUpdateModel()()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  swift_getObjectType();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_showSensitiveLogItems);

    if (v4)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v5 = sub_21968164C();
      __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
      v6 = sub_219681634();
      v7 = sub_219681BD4();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = swift_slowAlloc();
        v14 = v9;
        *(_DWORD *)v8 = 136315138;
        v10 = sub_219681F34();
        v13 = sub_21967C8D8(v10, v11, &v14);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v6, v7, "[%s] Received experience model update", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v9, -1, -1);
        MEMORY[0x219A3195C](v8, -1, -1);
      }

    }
    if ((uint64_t)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v13, v14) >= 1)v12 = 1;
    else
      v12 = 2;
    sub_21966FA34(v12, 5);
  }
  else
  {
    __break(1u);
  }
}

void sub_219671FB8(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;

  objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_registerObserver_, a1);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_registerObserver_, a1);
    v6 = 1;
  }
  else
  {
    v6 = 2;
  }
  sub_21966FA34(v6, 4);
}

id sub_219672030(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_unregisterObserver_, a1);
  return objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_unregisterObserver_, a1);
}

void sub_219672088()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CD0)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_219681D6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CD0);
  }
}

void sub_2196720E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CD8)
  {
    sub_219672B78(255, (unint64_t *)&unk_253E60C50, &qword_253E60C48);
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_219681D6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CD8);
  }
}

void sub_219672160()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60C08)
  {
    sub_219681BF8();
    v0 = sub_219681B20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60C08);
  }
}

void sub_2196721B4(void (*a1)(void))
{
  char *v1;
  void *v2;
  uint64_t ObjectType;
  uint64_t v5;
  int v6;
  os_unfair_lock_s *v7;
  id *v8;
  os_unfair_lock_s *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD aBlock[7];

  v2 = v1;
  ObjectType = swift_getObjectType();
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState];
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 20));
  *(_BYTE *)(v5 + 16) = 2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 20));
  sub_219670308((char *)aBlock);
  v6 = LOBYTE(aBlock[0]);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 20));
  *(_BYTE *)(v5 + 16) = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 20));
  if (v6 == 3)
  {
    v7 = *(os_unfair_lock_s **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel];
    v8 = (id *)&v7[4];
    v9 = v7 + 6;
    os_unfair_lock_lock(v7 + 6);
    sub_219671150(v8, v2);
    os_unfair_lock_unlock(v9);
  }
  else
  {
    v10 = *(void **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers];
    aBlock[4] = sub_21967154C;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_219666688;
    aBlock[3] = &block_descriptor_2;
    v11 = _Block_copy(aBlock);
    objc_msgSend(v10, sel_notifyObservers_, v11);
    _Block_release(v11);
  }
  a1();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 20));
  if (!*(_BYTE *)(v5 + 16))
    *((_BYTE *)v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 20));
  v12 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork;
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork) == 1)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v13 = sub_21968164C();
    __swift_project_value_buffer(v13, (uint64_t)qword_253E60BE8);
    v14 = sub_219681634();
    v15 = sub_219681BD4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v20 = v17;
      aBlock[0] = ObjectType;
      *(_DWORD *)v16 = 136315138;
      swift_getMetatypeMetadata();
      v18 = sub_219664FDC();
      aBlock[0] = sub_21967C8D8(v18, v19, &v20);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v14, v15, "[%s] Re-requesting work", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v17, -1, -1);
      MEMORY[0x219A3195C](v16, -1, -1);
    }

    sub_21966FA34(1, 6);
    *((_BYTE *)v2 + v12) = 0;
  }
}

void _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC12samplesAdded_6anchorySaySo8HKSampleCG_So8NSNumberCtF_0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  swift_getObjectType();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_showSensitiveLogItems);

    if (v4)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v5 = sub_21968164C();
      __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
      v6 = sub_219681634();
      v7 = sub_219681BD4();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = swift_slowAlloc();
        v14 = v9;
        *(_DWORD *)v8 = 136315138;
        v10 = sub_219681F34();
        v13 = sub_21967C8D8(v10, v11, &v14);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v6, v7, "[%s] Pregnancy samples added, requesting work", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v9, -1, -1);
        MEMORY[0x219A3195C](v8, -1, -1);
      }

    }
    if ((uint64_t)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v13, v14) >= 1)v12 = 1;
    else
      v12 = 2;
    sub_21966FA34(v12, 1);
  }
  else
  {
    __break(1u);
  }
}

void _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC7samples18ofTypesWereRemoved6anchorySaySo12HKSampleTypeCG_So8NSNumberCtF_0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  swift_getObjectType();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_showSensitiveLogItems);

    if (v4)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v5 = sub_21968164C();
      __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
      v6 = sub_219681634();
      v7 = sub_219681BD4();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = swift_slowAlloc();
        v14 = v9;
        *(_DWORD *)v8 = 136315138;
        v10 = sub_219681F34();
        v13 = sub_21967C8D8(v10, v11, &v14);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v6, v7, "[%s] Pregnancy samples deleted, requesting work", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v9, -1, -1);
        MEMORY[0x219A3195C](v8, -1, -1);
      }

    }
    if ((uint64_t)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v13, v14) >= 1)v12 = 1;
    else
      v12 = 2;
    sub_21966FA34(v12, 2);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21967289C()
{
  unint64_t result;

  result = qword_255090780;
  if (!qword_255090780)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDMCPregnancyManager.DeriveOperationState, &type metadata for HDMCPregnancyManager.DeriveOperationState);
    atomic_store(result, (unint64_t *)&qword_255090780);
  }
  return result;
}

uint64_t type metadata accessor for HDMCPregnancyManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HDMCPregnancyManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCPregnancyManager.__allocating_init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t getEnumTagSinglePayload for HDMCPregnancyManager.DeriveOperationState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HDMCPregnancyManager.DeriveOperationState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_2196729F0 + 4 * byte_219686673[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_219672A24 + 4 * byte_21968666E[v4]))();
}

uint64_t sub_219672A24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_219672A2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x219672A34);
  return result;
}

uint64_t sub_219672A40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x219672A48);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_219672A4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_219672A54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_219672A60(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HDMCPregnancyManager.DeriveOperationState()
{
  return &type metadata for HDMCPregnancyManager.DeriveOperationState;
}

id sub_219672A78@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2;

  return sub_219671A84(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_219672A90@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2196717C8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_219672AA8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_219672ACC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_219672AD8()
{
  unint64_t result;

  result = qword_255090850;
  if (!qword_255090850)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255090850);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_219672B44()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_219672B68(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_pregnancyModelDidUpdate_, *(_QWORD *)(v1 + 16));
}

void sub_219672B78(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_219654DFC(255, a3);
    v4 = sub_219681C40();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_219672BCC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_219672BF0(uint64_t a1)
{
  uint64_t v1;

  sub_219670E4C(a1, v1);
}

unint64_t static ExperienceModelStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000023;
}

void sub_219672C24()
{
  void *v0;
  void *v1;
  id v2;

  sub_21967D544((uint64_t)&unk_24DB22D60);
  swift_arrayDestroy();
  v0 = (void *)sub_219681A48();
  v1 = (void *)sub_219681B38();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_253E60D20 = (uint64_t)v2;
}

id static ExperienceModelStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_253E60D30 != -1)
    swift_once();
  return (id)qword_253E60D20;
}

id ExperienceModelStateSyncEntity.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ExperienceModelStateSyncEntity.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ExperienceModelStateSyncEntity()
{
  return objc_opt_self();
}

id ExperienceModelStateSyncEntity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ExperienceModelStateSyncEntity.SyncSchemaVersion.v1.getter()
{
  return 1;
}

void static ExperienceModelStateSyncEntity.updateData(withStateStorage:profile:transaction:)(uint64_t a1, void *a2, uint64_t a3)
{
  sub_219672F8C(a1, a2, a3);
}

void static ExperienceModelStateSyncEntity.syncDidFinish(with:stateStore:profile:)(uint64_t a1, uint64_t a2, void *a3)
{
  sub_219673218(a1, a3);
}

void sub_219672F8C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  _QWORD *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26[2];

  v24 = a1;
  v25 = a3;
  v26[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_21968164C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v23 - v9;
  if (qword_253E60AC8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v4, (uint64_t)qword_253E60BE8);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  type metadata accessor for HDMCExperienceDaemonStore();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v14 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v15 = a2;
  v16 = (void *)sub_219681A48();
  v17 = objc_msgSend(v14, sel_initWithCategory_domainName_profile_, 100, v16, v15);

  v13[3] = v17;
  v18 = objc_allocWithZone((Class)type metadata accessor for ExperienceModelSyncStateUpdaterDelegate());
  v12(v8, (uint64_t)v10, v4);
  v26[0] = v13;
  v19 = (void *)sub_219681628();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  v20 = (void *)objc_opt_self();
  v26[0] = 0;
  if ((objc_msgSend(v20, sel_updateDataWithStateStore_delegate_profile_transaction_error_, v24, v19, v15, v25, v26) & 1) != 0)
  {
    v21 = v26[0];
  }
  else
  {
    v22 = v26[0];
    sub_2196814D8();

    swift_willThrow();
  }

}

void sub_219673218(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  if (a1 == 1)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v12 = sub_21968164C();
    __swift_project_value_buffer(v12, (uint64_t)qword_253E60BE8);
    v25 = a2;
    v4 = sub_219681634();
    v5 = sub_219681BBC();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = swift_slowAlloc();
      v7 = (_QWORD *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v28 = v8;
      *(_DWORD *)v6 = 136446466;
      v13 = sub_219681F34();
      sub_21967C8D8(v13, v14, &v28);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      v27 = objc_msgSend(v25, sel_profileIdentifier);
      sub_219681C58();
      *v7 = v27;

      v11 = "[%{public}s] %@ Unable to sync";
      goto LABEL_11;
    }
  }
  else if (a1)
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v16 = sub_21968164C();
    __swift_project_value_buffer(v16, (uint64_t)qword_253E60BE8);
    v25 = a2;
    v4 = sub_219681634();
    v17 = sub_219681BBC();
    if (os_log_type_enabled(v4, v17))
    {
      v6 = swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v28 = v19;
      *(_DWORD *)v6 = 136446722;
      v20 = sub_219681F34();
      sub_21967C8D8(v20, v21, &v28);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      v22 = objc_msgSend(v25, sel_profileIdentifier);
      sub_219681C58();
      *v18 = v22;

      *(_WORD *)(v6 + 22) = 2080;
      type metadata accessor for HDCloudSyncStateResult(0);
      v23 = sub_219681A78();
      sub_21967C8D8(v23, v24, &v28);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v4, v17, "[%{public}s] %@ Unknown sync result: %s", (uint8_t *)v6, 0x20u);
      sub_2196737DC();
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v18, -1, -1);
      swift_arrayDestroy();
      v15 = v19;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_253E60AC8 != -1)
      swift_once();
    v3 = sub_21968164C();
    __swift_project_value_buffer(v3, (uint64_t)qword_253E60BE8);
    v25 = a2;
    v4 = sub_219681634();
    v5 = sub_219681BD4();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = swift_slowAlloc();
      v7 = (_QWORD *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v28 = v8;
      *(_DWORD *)v6 = 136446466;
      v9 = sub_219681F34();
      sub_21967C8D8(v9, v10, &v28);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      v26 = objc_msgSend(v25, sel_profileIdentifier);
      sub_219681C58();
      *v7 = v26;

      v11 = "[%{public}s] %@ Sync complete!";
LABEL_11:
      _os_log_impl(&dword_21961B000, v4, v5, v11, (uint8_t *)v6, 0x16u);
      sub_2196737DC();
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v7, -1, -1);
      swift_arrayDestroy();
      v15 = v8;
LABEL_16:
      MEMORY[0x219A3195C](v15, -1, -1);
      MEMORY[0x219A3195C](v6, -1, -1);

      return;
    }
  }

}

ValueMetadata *type metadata accessor for ExperienceModelStateSyncEntity.SyncSchemaVersion()
{
  return &type metadata for ExperienceModelStateSyncEntity.SyncSchemaVersion;
}

void sub_2196737DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60CB0)
  {
    sub_219673830();
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60CB0);
  }
}

unint64_t sub_219673830()
{
  unint64_t result;

  result = qword_253E60CA8;
  if (!qword_253E60CA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60CA8);
  }
  return result;
}

uint64_t sub_21967386C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19[1] = *v0;
  v1 = sub_219681A0C();
  MEMORY[0x24BDAC7A8](v1);
  v21 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
  MEMORY[0x24BDAC7A8](v20);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219674824();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v19 - v13;
  v15 = (char *)v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_getKeyPath();
  v19[0] = sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  sub_219681994();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  type metadata accessor for CoherentExperienceSetupRecord(0);
  v16 = sub_21968185C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = swift_allocObject();
  sub_21966160C(0);
  sub_219654D90(&qword_253E611E8, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE18690]);
  sub_219654D90(&qword_253E611F0, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE186A0]);
  sub_21968188C();
  *(_QWORD *)&v4[*(int *)(v20 + 20)] = MEMORY[0x24BEE4B00];
  sub_219681A00();
  sub_2196819B8();
  v22 = v16;
  sub_219681988();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v17 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule, v14, v11);
  return v17;
}

id sub_219673B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v1 = v0;
  v2 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219674824();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v25 - v13;
  v15 = v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_getKeyPath();
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  sub_219681994();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v16 = sub_21968185C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    v28 = MEMORY[0x24BEE4AF8];
    sub_219681D9C();
    v18 = v16 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    v19 = *(_QWORD *)(v26 + 72);
    do
    {
      sub_219676344(v18, (uint64_t)v4);
      sub_2196740EC((uint64_t)v4, &v27);
      sub_2196614BC((uint64_t)v4, type metadata accessor for CoherentExperienceSetupRecord);
      sub_219681D84();
      sub_219681DA8();
      sub_219681DB4();
      sub_219681D90();
      v18 += v19;
      --v17;
    }
    while (v17);
    v20 = v28;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
  }
  sub_21967CF10(v20);
  swift_bridgeObjectRelease();
  v21 = objc_allocWithZone(MEMORY[0x24BE46B88]);
  sub_219676388();
  sub_219654D90((unint64_t *)&qword_253E61240, (uint64_t (*)(uint64_t))sub_219676388, MEMORY[0x24BEE5BD8]);
  v22 = (void *)sub_219681B38();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v21, sel_initWithPregnancyModeSetupCompletionSet_, v22);

  return v23;
}

uint64_t sub_219673EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v7[32];
  uint64_t v8;

  swift_retain();
  v4 = sub_2196760EC(a2, a1);
  swift_release();
  swift_getKeyPath();
  v8 = v4;
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  v5 = (void (*)(_BYTE *, _QWORD))sub_219681970();
  sub_219674824();
  sub_219676328(0);
  sub_219654D90(&qword_253E61220, (uint64_t (*)(uint64_t))sub_219676328, MEMORY[0x24BEE12C8]);
  sub_219681868();
  v5(v7, 0);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_219673FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v10 - v6;
  v8 = a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  type metadata accessor for CoherentExperienceSetupRecord(0);
  sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
  sub_2196819C4();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_2196740EC(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, _QWORD);
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  uint64_t v59;

  sub_21965C698(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v45 - v7;
  sub_21966164C(0, (unint64_t *)&qword_253E60BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)&v45 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v55 = (uint64_t)&v45 - v14;
  v15 = sub_2196815BC();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2196763C4(0, &qword_2550908D0, MEMORY[0x24BE186F8]);
  v46 = *(v18 - 1);
  v47 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v45 - v19;
  v56 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v52 = a1;
  sub_2196763C4(0, (unint64_t *)&qword_253E61200, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BE18720]);
  sub_219676420();
  v21 = sub_219681B8C();
  v57 = MEMORY[0x24BEE4AF8];
  v53 = a2;
  v51 = v11;
  v54 = v17;
  if (v21)
  {
    v22 = v21;
    v59 = MEMORY[0x24BEE4AF8];
    sub_21965FF04(0, v21 & ~(v21 >> 63), 0);
    v23 = v59;
    sub_219681B80();
    if (v22 < 0)
    {
      __break(1u);
      return;
    }
    do
    {
      v24 = (void (*)(_QWORD *, _QWORD))sub_219681BA4();
      swift_bridgeObjectRetain();
      v24(v58, 0);
      v57 = sub_219681A48();
      swift_bridgeObjectRelease();
      v59 = v23;
      v26 = *(_QWORD *)(v23 + 16);
      v25 = *(_QWORD *)(v23 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_21965FF04(v25 > 1, v26 + 1, 1);
        v23 = v59;
      }
      *(_QWORD *)(v23 + 16) = v26 + 1;
      *(_QWORD *)(v23 + 8 * v26 + 32) = v57;
      sub_219681B98();
      --v22;
    }
    while (v22);
    (*(void (**)(char *, id))(v46 + 8))(v20, v47);
    v57 = v59;
    v17 = v54;
  }
  sub_21965C560();
  sub_219681694();
  v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v58[0]);
  sub_21965C5BC();
  sub_219681694();
  sub_21965C618();
  v27 = (uint64_t)v48;
  sub_219681694();
  v28 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
  v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48);
  if (v29(v27, 1, v28) == 1)
  {
    sub_2196614BC(v27, (uint64_t (*)(_QWORD))sub_21965C698);
    v30 = sub_219681574();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v55, 1, 1, v30);
  }
  else
  {
    v31 = sub_219681574();
    v32 = *(_QWORD *)(v31 - 8);
    v33 = v55;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v55, v27, v31);
    sub_2196614BC(v27, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
    v34 = v33;
    v17 = v54;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v31);
  }
  v35 = (uint64_t)v49;
  sub_219681694();
  if (v29(v35, 1, v28) == 1)
  {
    sub_2196614BC(v35, (uint64_t (*)(_QWORD))sub_21965C698);
    v36 = sub_219681574();
    v37 = (uint64_t)v50;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v50, 1, 1, v36);
  }
  else
  {
    v38 = sub_219681574();
    v39 = *(_QWORD *)(v38 - 8);
    v37 = (uint64_t)v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v50, v35, v38);
    sub_2196614BC(v35, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v37, 0, 1, v38);
  }
  v40 = (uint64_t)v51;
  v41 = sub_21967D2F8(v57);
  swift_bridgeObjectRelease();
  sub_21965C748();
  sub_219681694();
  v42 = objc_allocWithZone(MEMORY[0x24BE46BD0]);
  v43 = v47;
  v44 = sub_21965B730((uint64_t)v47, (uint64_t)v17, v55, v37, v41, v40);

  *v53 = v44;
}

uint64_t sub_21967466C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2196746DC()
{
  return type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
}

uint64_t type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(uint64_t a1)
{
  return sub_21965D034(a1, (uint64_t *)&unk_253E611B8);
}

void sub_2196746F8()
{
  unint64_t v0;

  sub_219675588(319, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for CoherentExperienceSetupRecordDatabase(uint64_t a1)
{
  return sub_21965D034(a1, (uint64_t *)&unk_253E611A8);
}

uint64_t *sub_219674798(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_219674824();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_219674824()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60DA8)
  {
    sub_21966160C(255);
    sub_219654D90(&qword_253E611E8, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE18690]);
    sub_219654D90(&qword_253E611F0, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE186A0]);
    v0 = sub_219681898();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60DA8);
  }
}

uint64_t sub_2196748C8(uint64_t a1)
{
  uint64_t v2;

  sub_219674824();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21967490C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219674824();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21967496C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219674824();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2196749D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219674824();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_219674A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219674824();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_219674A98()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_219674AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  sub_219674824();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_219674B20()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_219674B2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  sub_219674824();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
}

void sub_219674BA4()
{
  unint64_t v0;

  sub_219674824();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_219674C18(uint64_t *a1, uint64_t *a2)
{
  return sub_219675E20(*a1, *a2);
}

uint64_t sub_219674C24()
{
  uint64_t result;

  strcpy((char *)&qword_253E61B50, "setupRecords");
  algn_253E61B58[5] = 0;
  *(_WORD *)&algn_253E61B58[6] = -5120;
  result = swift_getKeyPath();
  qword_253E61B60 = result;
  return result;
}

uint64_t sub_219674C74()
{
  uint64_t v0;

  if (qword_253E61168 != -1)
    swift_once();
  v0 = qword_253E61B50;
  swift_bridgeObjectRetain();
  swift_retain();
  return v0;
}

uint64_t sub_219674CE8()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681784();
}

uint64_t sub_219674D28()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_219674D34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_219674D68())()
{
  return nullsub_1;
}

uint64_t sub_219674D7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  sub_21966160C(0);
  sub_219654D90(&qword_253E611E8, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE18690]);
  sub_219654D90(&qword_253E611F0, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE186A0]);
  result = sub_21968188C();
  *(_QWORD *)(a2 + *(int *)(a1 + 20)) = MEMORY[0x24BEE4B00];
  return result;
}

uint64_t sub_219674E18()
{
  sub_219654D90(&qword_253E61198, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686A28);
  return sub_219681958();
}

uint64_t sub_219674E58()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681700();
}

uint64_t sub_219674EB0()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681730();
}

uint64_t sub_219674F00()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681778();
}

uint64_t sub_219674F50()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_21968173C();
}

uint64_t sub_219674FB8()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_21968176C();
}

uint64_t sub_219675008()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681748();
}

uint64_t sub_219675058()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681718();
}

uint64_t sub_2196750B0()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_2196816F4();
}

uint64_t sub_219675118()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_2196816D0();
}

uint64_t sub_219675168()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_21968170C();
}

uint64_t sub_2196751A8()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_2196816DC();
}

uint64_t sub_2196751F8()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681754();
}

uint64_t sub_219675248()
{
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  return sub_219681910();
}

uint64_t sub_2196752AC()
{
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  return sub_21968191C();
}

uint64_t sub_219675320()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681724();
}

uint64_t sub_219675384()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_219681760();
}

uint64_t sub_2196753E0()
{
  sub_219654D90(&qword_253E61170, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686958);
  return sub_2196816E8();
}

uint64_t sub_219675430()
{
  return sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
}

uint64_t sub_21967545C()
{
  return sub_219654D90(&qword_253E61180, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196868B8);
}

uint64_t sub_219675488()
{
  return sub_219654D90(&qword_253E611E0, (uint64_t (*)(uint64_t))sub_219674824, MEMORY[0x24BE18328]);
}

uint64_t sub_2196754B4()
{
  return sub_219654D90(&qword_253E61188, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686918);
}

uint64_t sub_2196754E0()
{
  return sub_219654D90(&qword_253E61178, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686880);
}

uint64_t sub_21967550C()
{
  return sub_219654D90(&qword_253E61198, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686A28);
}

uint64_t sub_219675538()
{
  return sub_219654D90(&qword_2550908C0, (uint64_t (*)(uint64_t))sub_219675564, MEMORY[0x24BE185B8]);
}

void sub_219675564(uint64_t a1)
{
  sub_219675588(a1, &qword_2550908C8, &qword_253E61170, (uint64_t)&unk_219686958, MEMORY[0x24BE185A8]);
}

void sub_219675588(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (!*a2)
  {
    v10 = type metadata accessor for CoherentExperienceSetupRecordDatabase(255);
    v11 = sub_219654D90(a3, type metadata accessor for CoherentExperienceSetupRecordDatabase, a4);
    v12 = a5(a1, v10, v11);
    if (!v13)
      atomic_store(v12, a2);
  }
}

uint64_t sub_21967560C()
{
  return sub_219654D90(&qword_253E611A0, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_219686838);
}

void sub_219675638(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_219681CB8() == *(_DWORD *)(a4 + 36))
      {
        sub_219681CC4();
        sub_219676388();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_219681C28();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_219681C34();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_219681C34();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x219A30C60](a1, a2, v7);
  sub_219676388();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_219675880(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_219675908(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void (*v32)(char *, _QWORD);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47[32];
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;

  v2 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_219681A0C();
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v38 - v10;
  v11 = objc_msgSend(a1, sel_pregnancyModeSetupCompletionSet);
  sub_219676388();
  sub_219654D90((unint64_t *)&qword_253E61240, (uint64_t (*)(uint64_t))sub_219676388, MEMORY[0x24BEE5BD8]);
  v12 = sub_219681B44();

  v46 = v12 & 0xC000000000000001;
  if ((v12 & 0xC000000000000001) != 0)
  {
    v13 = sub_219681CD0();
    if (v13)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
LABEL_23:
    type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
    v33 = swift_allocObject();
    sub_21966160C(0);
    sub_219654D90(&qword_253E611E8, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE18690]);
    sub_219654D90(&qword_253E611F0, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE186A0]);
    v34 = v39;
    sub_21968188C();
    *(_QWORD *)&v34[*(int *)(v40 + 20)] = MEMORY[0x24BEE4B00];
    sub_219681A00();
    sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
    v35 = v41;
    v36 = sub_2196819B8();
    MEMORY[0x24BDAC7A8](v36);
    *(&v38 - 2) = v17;
    v37 = v44;
    sub_219681988();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v33 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule, v35, v37);
    return v33;
  }
  v13 = *(_QWORD *)(v12 + 16);
  if (!v13)
    goto LABEL_6;
LABEL_3:
  v51 = MEMORY[0x24BEE4AF8];
  sub_21965FE90(0, v13 & ~(v13 >> 63), 0);
  if (v46)
  {
    result = sub_219681C94();
    v16 = 1;
  }
  else
  {
    result = sub_219675880(v12);
    v16 = v18 & 1;
  }
  v48 = result;
  v49 = v15;
  v50 = v16;
  if ((v13 & 0x8000000000000000) == 0)
  {
    v19 = v12 & 0xFFFFFFFFFFFFFF8;
    if (v12 < 0)
      v19 = v12;
    v45 = v19;
    do
    {
      while (1)
      {
        v26 = v48;
        v25 = v49;
        v27 = v50;
        sub_219675638(v48, v49, v50, v12);
        sub_21965DC5C(v28, (uint64_t)v5);
        v29 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21965FE90(0, *(_QWORD *)(v29 + 16) + 1, 1);
          v29 = v51;
        }
        v31 = *(_QWORD *)(v29 + 16);
        v30 = *(_QWORD *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          sub_21965FE90(v30 > 1, v31 + 1, 1);
          v29 = v51;
        }
        *(_QWORD *)(v29 + 16) = v31 + 1;
        result = sub_219676478((uint64_t)v5, v29+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v31);
        if (v46)
          break;
        v20 = sub_21966084C(v26, v25, v27, v12);
        v22 = v21;
        v24 = v23;
        sub_2196611C0(v26, v25, v27);
        v48 = v20;
        v49 = v22;
        v50 = v24 & 1;
        if (!--v13)
          goto LABEL_22;
      }
      if ((v27 & 1) == 0)
        goto LABEL_25;
      if (sub_219681CAC())
        swift_isUniquelyReferenced_nonNull_native();
      sub_2196764BC();
      v32 = (void (*)(char *, _QWORD))sub_219681B5C();
      sub_219681D00();
      v32(v47, 0);
      --v13;
    }
    while (v13);
LABEL_22:
    sub_2196611C0(v48, v49, v50);
    swift_bridgeObjectRelease();
    v17 = v51;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_219675E20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a2;
  sub_219674824();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  sub_219675588(0, &qword_253E61208, &qword_253E61198, (uint64_t)&unk_219686A28, MEMORY[0x24BE188F8]);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v16, v17, v10);
  swift_getKeyPath();
  sub_219654D90(&qword_253E61190, type metadata accessor for CoherentExperienceSetupRecordDatabase, (uint64_t)&unk_2196869A8);
  sub_219681994();
  swift_release();
  v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  v19(v16, v10);
  v20 = v26 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  v18(v14, v20, v10);
  swift_getKeyPath();
  sub_219681994();
  swift_release();
  v19(v14, v10);
  sub_21966160C(0);
  sub_219654D90(&qword_253E611E8, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE18690]);
  sub_219654D90(&qword_253E611F0, (uint64_t (*)(uint64_t))sub_21966160C, MEMORY[0x24BE186A0]);
  LOBYTE(v20) = sub_219681850();
  v21 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22 = v6;
  v23 = v28;
  v21(v22, v28);
  v21(v8, v23);
  return v20 & 1;
}

uint64_t sub_2196760BC(uint64_t a1)
{
  uint64_t v1;

  return sub_219673FC4(a1, v1);
}

uint64_t sub_2196760D4(uint64_t a1)
{
  uint64_t v1;

  return sub_219673EB0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2196760EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  sub_21966164C(0, &qword_253E61210, (uint64_t (*)(uint64_t))MEMORY[0x24BE18A58], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v21 - v5;
  v24 = type metadata accessor for CoherentExperienceSetupRecord(0);
  v7 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21966160C(0);
  v23 = v10;
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = MEMORY[0x24BEE4AF8];
  if (v14)
  {
    v21[1] = v2;
    v26 = MEMORY[0x24BEE4AF8];
    sub_21965FED8(0, v14, 0);
    v15 = v26;
    v16 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v22 = *(_QWORD *)(v7 + 72);
    do
    {
      sub_219676344(v16, (uint64_t)v9);
      v17 = sub_219681A0C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v6, 1, 1, v17);
      sub_219654D90(&qword_253E61138, type metadata accessor for CoherentExperienceSetupRecord, (uint64_t)&unk_21968605C);
      swift_retain();
      sub_2196818EC();
      v26 = v15;
      v19 = *(_QWORD *)(v15 + 16);
      v18 = *(_QWORD *)(v15 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_21965FED8(v18 > 1, v19 + 1, 1);
        v15 = v26;
      }
      *(_QWORD *)(v15 + 16) = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v19, v13, v23);
      v16 += v22;
      --v14;
    }
    while (v14);
  }
  return v15;
}

void sub_219676328(uint64_t a1)
{
  sub_21966164C(a1, &qword_253E61218, (uint64_t (*)(uint64_t))sub_21966160C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
}

uint64_t sub_219676344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoherentExperienceSetupRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_219676388()
{
  unint64_t result;

  result = qword_253E61238;
  if (!qword_253E61238)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E61238);
  }
  return result;
}

void sub_2196763C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE0D00], MEMORY[0x24BE18AB8], MEMORY[0x24BEE0D10]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_219676420()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550908D8;
  if (!qword_2550908D8)
  {
    sub_2196763C4(255, (unint64_t *)&qword_253E61200, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BE18720]);
    result = MEMORY[0x219A318B4](MEMORY[0x24BE18748], v1);
    atomic_store(result, (unint64_t *)&qword_2550908D8);
  }
  return result;
}

uint64_t sub_219676478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoherentExperienceSetupRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2196764BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550908E0)
  {
    sub_219676388();
    sub_219654D90((unint64_t *)&qword_253E61240, (uint64_t (*)(uint64_t))sub_219676388, MEMORY[0x24BEE5BD8]);
    v0 = sub_219681B68();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550908E0);
  }
}

uint64_t sub_219676534(uint64_t a1)
{
  return sub_2196760D4(a1);
}

uint64_t sub_219676548()
{
  uint64_t v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile), sel_profileExtensionWithIdentifier_, *MEMORY[0x24BE46AC8]))
  {
    sub_219681C70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_219654C14((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_219654DFC(0, &qword_253E60C60);
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_219654C74((uint64_t)v4);
    return 0;
  }
}

char *HDMCWidgetSchedulingManager.__allocating_init(profile:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  char *v9;

  v3 = objc_allocWithZone(v1);
  v4 = a1;
  v5 = sub_21966ECF4(v4);

  v6 = v5;
  v7 = (void *)sub_219681A48();
  v8 = (id)HKCreateSerialDispatchQueue();

  v9 = sub_21967A6A4(v4, (uint64_t)v6, v8, 0, 0, (char *)objc_allocWithZone(v1), 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

char *HDMCWidgetSchedulingManager.init(profile:)(void *a1)
{
  objc_class *ObjectType;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  char *v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = a1;
  v4 = sub_21966ECF4(v3);

  v5 = v4;
  v6 = (void *)sub_219681A48();
  v7 = (id)HKCreateSerialDispatchQueue();

  v8 = sub_21967A6A4(v3, (uint64_t)v5, v7, 0, 0, (char *)objc_allocWithZone(ObjectType), 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

char *HDMCWidgetSchedulingManager.__allocating_init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v13 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = __swift_mutable_project_boxed_opaque_existential_1(a2, v13);
  v16 = sub_21967AB50(a1, v15, a3, a4, a5, a6, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v16;
}

char *HDMCWidgetSchedulingManager.init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6)
{
  char *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;

  v13 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = __swift_mutable_project_boxed_opaque_existential_1(a2, v13);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  v19 = sub_21967A8E0(a1, (uint64_t)v17, a3, a4, a5, v6, v13, v14, a6);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v19;
}

void sub_219676980(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x219A319C8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_2196769D0();

  }
}

uint64_t sub_2196769D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22[3];

  v1 = v0;
  swift_getObjectType();
  v2 = sub_219681670();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5610], v2);
  v7 = v6;
  LOBYTE(v6) = sub_21968167C();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    if (qword_253E60AC8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v8 = sub_21968164C();
  __swift_project_value_buffer(v8, (uint64_t)qword_253E60BE8);
  v9 = sub_219681634();
  v10 = sub_219681BD4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v22[0] = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = sub_219681F34();
    v21 = sub_21967C8D8(v13, v14, v22);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v9, v10, "[%s] requesting widgets reload", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v12, -1, -1);
    MEMORY[0x219A3195C](v11, -1, -1);
  }

  v15 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader + 24);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader), v15);
  v17 = (_QWORD *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons);
  swift_beginAccess();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 8);
  v19 = swift_bridgeObjectRetain();
  v18(v19, v15, v16);
  swift_bridgeObjectRelease();
  *v17 = MEMORY[0x24BEE4B08];
  return swift_bridgeObjectRelease();
}

id HDMCWidgetSchedulingManager.__deallocating_deinit()
{
  void *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)sub_219676548();
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel__bridging_analysisProviding);

    if (v4)
    {
      v5 = v0;
      objc_msgSend(v4, sel_unregisterObserver_, v5);

      swift_unknownObjectRelease();
    }
  }
  v7.receiver = v0;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t HDMCWidgetSchedulingManager.profileDidBecomeReady(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (*v20)(void);
  uint64_t aBlock[6];

  v2 = v1;
  ObjectType = swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v5 = sub_21968164C();
  __swift_project_value_buffer(v5, (uint64_t)qword_253E60BE8);
  v6 = sub_219681634();
  v7 = sub_219681BD4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_219681F34();
    sub_21967C8D8(v10, v11, aBlock);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v6, v7, "[%s] profileDidBecomeReady", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v9, -1, -1);
    MEMORY[0x219A3195C](v8, -1, -1);
  }

  v12 = (void *)sub_219676548();
  if (v12)
  {
    v13 = v12;
    v14 = objc_msgSend(v12, sel__bridging_analysisProviding);

    if (v14)
      objc_msgSend(v14, sel_registerObserver_queue_userInitiated_, v2, *(_QWORD *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue), 0);
  }
  v15 = objc_msgSend(a1, sel_database);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = ObjectType;
  aBlock[4] = (uint64_t)sub_21967AC70;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21967757C;
  aBlock[3] = (uint64_t)&block_descriptor_3;
  v19 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block_, v16, v19);
  _Block_release(v19);

  v20 = *(void (**)(void))(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady);
  if (v20)
    v20();
  return swift_unknownObjectRelease();
}

void sub_2196770F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12[3];

  v1 = a1 + 16;
  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  v3 = sub_219681634();
  v4 = sub_219681BD4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12[0] = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_219681F34();
    v11 = sub_21967C8D8(v7, v8, v12);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v3, v4, "[%{public}s] first unlock occurred", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v6, -1, -1);
    MEMORY[0x219A3195C](v5, -1, -1);
  }

  swift_beginAccess();
  v9 = MEMORY[0x219A319C8](v1);
  if (v9)
  {
    v10 = (void *)v9;
    LOBYTE(v11) = 0;
    sub_2196772A4((unsigned __int8 *)&v11);

  }
}

id sub_2196772A4(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id result;
  uint64_t v21;
  uint64_t v22[3];

  v2 = v1;
  swift_getObjectType();
  v4 = sub_219681670();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v22[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  v9 = *a1;
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v10 = v8;
  LOBYTE(a1) = sub_21968167C();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((a1 & 1) != 0)
  {
    if (qword_253E60AC8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v11 = sub_21968164C();
  __swift_project_value_buffer(v11, (uint64_t)qword_253E60BE8);
  v12 = sub_219681634();
  v13 = sub_219681BD4();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v22[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v16 = sub_219681F34();
    v21 = sub_21967C8D8(v16, v17, v22);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    if (v9)
      v18 = 0xD000000000000014;
    else
      v18 = 0xD000000000000010;
    if (v9)
      v19 = 0x800000021968A400;
    else
      v19 = 0x800000021968A420;
    v21 = sub_21967C8D8(v18, v19, v22);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v12, v13, "[%s] running reload operation with reason: %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v15, -1, -1);
    MEMORY[0x219A3195C](v14, -1, -1);
  }

  swift_beginAccess();
  sub_219677FD4(&v21, v9);
  swift_endAccess();
  result = *(id *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation);
  if (result)
    return objc_msgSend(result, sel_execute);
  return result;
}

uint64_t sub_21967757C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id HDMCWidgetSchedulingManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDMCWidgetSchedulingManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void HDMCWidgetSchedulingManager.didUpdate(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v2 = v1;
  swift_getObjectType();
  v4 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis);
  if (v5)
  {
    sub_219654DFC(0, (unint64_t *)&unk_253E60DB8);
    v6 = a1;
    v7 = v5;
    v8 = sub_219681C34();

    if ((v8 & 1) != 0)
      return;
    v9 = *(void **)(v2 + v4);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v2 + v4) = a1;

  v10 = qword_253E60AC8;
  v11 = a1;
  if (v10 != -1)
    swift_once();
  v12 = sub_21968164C();
  __swift_project_value_buffer(v12, (uint64_t)qword_253E60BE8);
  v13 = sub_219681634();
  v14 = sub_219681BD4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v19 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = sub_219681F34();
    sub_21967C8D8(v17, v18, &v19);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v13, v14, "[%s] Received cycle analysis update", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v16, -1, -1);
    MEMORY[0x219A3195C](v15, -1, -1);
  }

  LOBYTE(v19) = 1;
  sub_2196772A4((unsigned __int8 *)&v19);
}

uint64_t sub_2196778D0(_QWORD *a1, void *a2)
{
  return sub_219677918(a1, a2, (unint64_t *)&qword_253E61238, 0x24BE46BD0, &qword_255090950, (unint64_t *)&qword_253E61240);
}

uint64_t sub_2196778F4(_QWORD *a1, void *a2)
{
  return sub_219677918(a1, a2, (unint64_t *)&unk_253E60C20, 0x24BDD3DC0, (unint64_t *)&qword_253E60CC0, (unint64_t *)&qword_253E60C30);
}

uint64_t sub_219677918(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, unint64_t *a5, unint64_t *a6)
{
  uint64_t *v6;
  uint64_t *v11;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  char isUniquelyReferenced_nonNull_native;
  id v34;
  unint64_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v11 = v6;
  v14 = *v6;
  if ((*v6 & 0xC000000000000001) != 0)
  {
    if (v14 < 0)
      v15 = *v6;
    else
      v15 = v14 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v16 = a2;
    v17 = sub_219681CDC();

    if (v17)
    {
      swift_bridgeObjectRelease();

      sub_219654DFC(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v42;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_219681CD0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v29 = sub_21967810C(v15, result + 1, a5, a3, a4, a6);
    v43 = v29;
    v30 = *(_QWORD *)(v29 + 16);
    if (*(_QWORD *)(v29 + 24) <= v30)
    {
      v35 = a5;
      v36 = v30 + 1;
      v37 = v16;
      sub_219678330(v36, v35, a3, a4, a6);
      v31 = v43;
    }
    else
    {
      v31 = v29;
      v32 = v16;
    }
    sub_219678E50((uint64_t)v16, v31);
    *v11 = v31;
    swift_bridgeObjectRelease();
    *a1 = v16;
  }
  else
  {
    swift_bridgeObjectRetain();
    v19 = sub_219681C28();
    v20 = -1 << *(_BYTE *)(v14 + 32);
    v21 = v19 & ~v20;
    v40 = a4;
    if (((*(_QWORD *)(v14 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
    {
      sub_219654DFC(0, a3);
      v22 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v21);
      v23 = sub_219681C34();

      if ((v23 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v27 = *(void **)(*(_QWORD *)(*v6 + 48) + 8 * v21);
        *a1 = v27;
        v28 = v27;
        return 0;
      }
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v14 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v21);
        v26 = sub_219681C34();

        if ((v26 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v44 = *v6;
    *v6 = 0x8000000000000000;
    v34 = a2;
    sub_219678ED0((uint64_t)v34, v21, isUniquelyReferenced_nonNull_native, a5, a3, v40, a6);
    *v6 = v44;
    swift_bridgeObjectRelease();
    *a1 = v34;
  }
  return 1;
}

uint64_t sub_219677C00(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_219681ED4();
  swift_bridgeObjectRetain();
  sub_219681A90();
  v8 = sub_219681EEC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_219681E68() & 1) != 0)
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
      if (v19 || (sub_219681E68() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_219679084(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_219677DAC(_QWORD *a1, void *a2)
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
  sub_219681A6C();
  sub_219681ED4();
  swift_bridgeObjectRetain();
  sub_219681A90();
  v7 = sub_219681EEC();
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
    sub_21967921C((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = sub_219681A6C();
  v12 = v11;
  if (v10 == sub_219681A6C() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_219681E68();
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
        v17 = sub_219681A6C();
        v19 = v18;
        if (v17 == sub_219681A6C() && v19 == v20)
          goto LABEL_16;
        v22 = sub_219681E68();
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

uint64_t sub_219677FD4(_BYTE *a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v4 = a2 & 1;
  v5 = *v2;
  sub_219681ED4();
  sub_219681EE0();
  v6 = sub_219681EEC();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_219679448(v4, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (((((_DWORD)v4 == 0) ^ *(unsigned __int8 *)(v9 + v8)) & 1) == 0)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (((((_DWORD)v4 == 0) ^ *(unsigned __int8 *)(v9 + v8)) & 1) == 0);
  }
  result = 0;
  LOBYTE(v4) = *(_BYTE *)(*(_QWORD *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = v4;
  return result;
}

uint64_t sub_21967810C(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, unint64_t *a6)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_21967AE7C(0, a3, a4, a5, a6);
    v10 = sub_219681D24();
    v23 = v10;
    sub_219681CA0();
    if (sub_219681CF4())
    {
      sub_219654DFC(0, a4);
      do
      {
        swift_dynamicCast();
        v10 = v23;
        v17 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v17)
        {
          sub_219678330(v17 + 1, a3, a4, a5, a6);
          v10 = v23;
        }
        result = sub_219681C28();
        v12 = v10 + 56;
        v13 = -1 << *(_BYTE *)(v10 + 32);
        v14 = result & ~v13;
        v15 = v14 >> 6;
        if (((-1 << v14) & ~*(_QWORD *)(v10 + 56 + 8 * (v14 >> 6))) != 0)
        {
          v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v10 + 56 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v18 = 0;
          v19 = (unint64_t)(63 - v13) >> 6;
          do
          {
            if (++v15 == v19 && (v18 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v20 = v15 == v19;
            if (v15 == v19)
              v15 = 0;
            v18 |= v20;
            v21 = *(_QWORD *)(v12 + 8 * v15);
          }
          while (v21 == -1);
          v16 = __clz(__rbit64(~v21)) + (v15 << 6);
        }
        *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v16) = v22;
        ++*(_QWORD *)(v10 + 16);
      }
      while (sub_219681CF4());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v10;
}

uint64_t sub_219678330(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;

  v6 = v5;
  v7 = *v5;
  sub_21967AE7C(0, a2, a3, a4, a5);
  v8 = sub_219681D18();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v33 = v5;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = (_QWORD *)(v7 + 56);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v7 + 56);
    v14 = (unint64_t)(v10 + 63) >> 6;
    v15 = v8 + 56;
    result = swift_retain();
    v17 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v17 << 6);
      }
      else
      {
        v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v21 >= v14)
          goto LABEL_33;
        v22 = v11[v21];
        ++v17;
        if (!v22)
        {
          v17 = v21 + 1;
          if (v21 + 1 >= v14)
            goto LABEL_33;
          v22 = v11[v17];
          if (!v22)
          {
            v17 = v21 + 2;
            if (v21 + 2 >= v14)
              goto LABEL_33;
            v22 = v11[v17];
            if (!v22)
            {
              v23 = v21 + 3;
              if (v23 >= v14)
              {
LABEL_33:
                swift_release();
                v6 = v33;
                v32 = 1 << *(_BYTE *)(v7 + 32);
                if (v32 > 63)
                  bzero((void *)(v7 + 56), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v11 = -1 << v32;
                *(_QWORD *)(v7 + 16) = 0;
                break;
              }
              v22 = v11[v23];
              if (!v22)
              {
                while (1)
                {
                  v17 = v23 + 1;
                  if (__OFADD__(v23, 1))
                    goto LABEL_39;
                  if (v17 >= v14)
                    goto LABEL_33;
                  v22 = v11[v17];
                  ++v23;
                  if (v22)
                    goto LABEL_23;
                }
              }
              v17 = v23;
            }
          }
        }
LABEL_23:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      v24 = *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v20);
      result = sub_219681C28();
      v25 = -1 << *(_BYTE *)(v9 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v15 + 8 * v27);
        }
        while (v31 == -1);
        v18 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v18) = v24;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release();
  *v6 = v9;
  return result;
}

uint64_t sub_2196785C8()
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
  sub_21967AD78();
  v3 = sub_219681D18();
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
      sub_219681ED4();
      sub_219681A90();
      result = sub_219681EEC();
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

uint64_t sub_2196788A0()
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
  sub_21967ADD4();
  v3 = sub_219681D18();
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
      sub_219681A6C();
      sub_219681ED4();
      sub_219681A90();
      v18 = sub_219681EEC();
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

uint64_t sub_219678BAC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
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
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  sub_21967ACC4();
  result = sub_219681D18();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
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
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
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
      v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
      sub_219681ED4();
      sub_219681EE0();
      result = sub_219681EEC();
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
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_219678E50(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_219681C28();
  result = sub_219681C88();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_219678ED0(uint64_t a1, unint64_t a2, char a3, unint64_t *a4, unint64_t *a5, uint64_t a6, unint64_t *a7)
{
  uint64_t *v7;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v11 = *(_QWORD *)(*v7 + 16);
  v12 = *(_QWORD *)(*v7 + 24);
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_14;
  v13 = v11 + 1;
  if ((a3 & 1) != 0)
  {
    sub_219678330(v13, a4, a5, a6, a7);
  }
  else
  {
    if (v12 > v11)
    {
      sub_2196795AC(a4, a5, a6, a7);
      goto LABEL_14;
    }
    sub_219679C3C(v13, a4, a5, a6, a7);
  }
  v14 = *v7;
  v15 = sub_219681C28();
  v16 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_219654DFC(0, a5);
    v17 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * a2);
    v18 = sub_219681C34();

    if ((v18 & 1) != 0)
    {
LABEL_13:
      sub_219681E80();
      __break(1u);
    }
    else
    {
      v19 = ~v16;
      while (1)
      {
        a2 = (a2 + 1) & v19;
        if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * a2);
        v21 = sub_219681C34();

        if ((v21 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v22 = *v7;
  *(_QWORD *)(*v7 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v22 + 48) + 8 * a2) = a1;
  v23 = *(_QWORD *)(v22 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (v24)
    __break(1u);
  else
    *(_QWORD *)(v22 + 16) = v25;
}

uint64_t sub_219679084(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2196785C8();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_219679760();
      goto LABEL_22;
    }
    sub_219679EB0();
  }
  v11 = *v4;
  sub_219681ED4();
  sub_219681A90();
  result = sub_219681EEC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_219681E68(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_219681E80();
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
          result = sub_219681E68();
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

uint64_t sub_21967921C(uint64_t result, unint64_t a2, char a3)
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
    sub_2196788A0();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_21967990C();
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
    sub_21967A158();
  }
  v9 = *v3;
  sub_219681A6C();
  sub_219681ED4();
  sub_219681A90();
  v10 = sub_219681EEC();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = sub_219681A6C();
  v14 = v13;
  if (v12 == sub_219681A6C() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = sub_219681E68();
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
      v19 = sub_219681A6C();
      v21 = v20;
      if (v19 == sub_219681A6C() && v21 == v22)
        goto LABEL_25;
      v24 = sub_219681E68();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  result = sub_219681E80();
  __break(1u);
  return result;
}

uint64_t sub_219679448(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  int v5;
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

  v5 = result & 1;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_219678BAC();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_219679AB0();
      goto LABEL_14;
    }
    sub_21967A430();
  }
  v8 = *v3;
  sub_219681ED4();
  sub_219681EE0();
  result = sub_219681EEC();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if ((((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2)) & 1) != 0)
    {
LABEL_13:
      result = sub_219681E80();
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
        if ((((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2)) & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v12 + 48) + a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

id sub_2196795AC(unint64_t *a1, unint64_t *a2, uint64_t a3, unint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v5 = v4;
  sub_21967AE7C(0, a1, a2, a3, a4);
  v6 = *v4;
  v7 = sub_219681D0C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v5 = v8;
    return result;
  }
  result = (id)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v17)
      goto LABEL_28;
    v23 = *(_QWORD *)(v10 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v17)
        goto LABEL_28;
      v23 = *(_QWORD *)(v10 + 8 * v13);
      if (!v23)
      {
        v13 = v22 + 2;
        if (v22 + 2 >= v17)
          goto LABEL_28;
        v23 = *(_QWORD *)(v10 + 8 * v13);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v16 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v20 = 8 * v19;
    v21 = *(void **)(*(_QWORD *)(v6 + 48) + v20);
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v21;
    result = v21;
  }
  v24 = v22 + 3;
  if (v24 >= v17)
    goto LABEL_28;
  v23 = *(_QWORD *)(v10 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v23 = *(_QWORD *)(v10 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_219679760()
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
  sub_21967AD78();
  v2 = *v0;
  v3 = sub_219681D0C();
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

id sub_21967990C()
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
  sub_21967ADD4();
  v2 = *v0;
  v3 = sub_219681D0C();
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

void *sub_219679AB0()
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
  sub_21967ACC4();
  v2 = *v0;
  v3 = sub_219681D0C();
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
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
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

uint64_t sub_219679C3C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;

  v6 = v5;
  v7 = *v5;
  sub_21967AE7C(0, a2, a3, a4, a5);
  v8 = sub_219681D18();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
LABEL_35:
    *v6 = v9;
    return result;
  }
  v32 = v5;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = v7 + 56;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & *(_QWORD *)(v7 + 56);
  v14 = (unint64_t)(v10 + 63) >> 6;
  v15 = v8 + 56;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v13)
    {
      v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v14)
      goto LABEL_33;
    v22 = *(_QWORD *)(v11 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v14)
        goto LABEL_33;
      v22 = *(_QWORD *)(v11 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v14)
          goto LABEL_33;
        v22 = *(_QWORD *)(v11 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_23:
    v13 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    v24 = *(id *)(*(_QWORD *)(v7 + 48) + 8 * v20);
    result = sub_219681C28();
    v25 = -1 << *(_BYTE *)(v9 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v15 + 8 * v27);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v18) = v24;
    ++*(_QWORD *)(v9 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v14)
  {
LABEL_33:
    result = swift_release_n();
    v6 = v32;
    goto LABEL_35;
  }
  v22 = *(_QWORD *)(v11 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v22 = *(_QWORD *)(v11 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_219679EB0()
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
  sub_21967AD78();
  v3 = sub_219681D18();
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
    sub_219681ED4();
    swift_bridgeObjectRetain();
    sub_219681A90();
    result = sub_219681EEC();
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

uint64_t sub_21967A158()
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
  sub_21967ADD4();
  v3 = sub_219681D18();
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
    sub_219681A6C();
    sub_219681ED4();
    v18 = v17;
    sub_219681A90();
    v19 = sub_219681EEC();
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

uint64_t sub_21967A430()
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
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  sub_21967ACC4();
  result = sub_219681D18();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
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
    v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
    sub_219681ED4();
    sub_219681EE0();
    result = sub_219681EEC();
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
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
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

char *sub_21967A6A4(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char *a6, double a7)
{
  objc_class *ObjectType;
  uint64_t *v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD aBlock[6];
  objc_super v26;
  _QWORD v27[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v27[4] = &off_24DB23840;
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = 0;
  v27[3] = &type metadata for HDMCWidgetTimelineReloader;
  v27[0] = a2;
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile] = a1;
  sub_21965BF28((uint64_t)v27, (uint64_t)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader]);
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue] = a3;
  v15 = (uint64_t *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady];
  *v15 = a4;
  v15[1] = a5;
  v16 = a1;
  v17 = a3;
  sub_21967AD60(a4);
  v26.receiver = a6;
  v26.super_class = ObjectType;
  v18 = (char *)objc_msgSendSuper2(&v26, sel_init);
  objc_msgSend(v16, sel_registerProfileReadyObserver_queue_, v18, 0);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v20 = objc_allocWithZone(MEMORY[0x24BDD41D0]);
  aBlock[4] = sub_21967AD70;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21967757C;
  aBlock[3] = &block_descriptor_13;
  v21 = _Block_copy(aBlock);
  swift_retain();
  v22 = objc_msgSend(v20, sel_initWithMode_clock_queue_delay_block_, 1, 1, v17, v21, a7);

  _Block_release(v21);
  swift_release();
  sub_21966509C(a4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  swift_release();
  v23 = *(void **)&v18[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation];
  *(_QWORD *)&v18[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = v22;

  return v18;
}

char *sub_21967A8E0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, double a9)
{
  objc_class *ObjectType;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD aBlock[6];
  objc_super v31;
  uint64_t v32[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v32[3] = a7;
  v32[4] = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(boxed_opaque_existential_1, a2, a7);
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile] = a1;
  sub_21965BF28((uint64_t)v32, (uint64_t)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader]);
  *(_QWORD *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue] = a3;
  v20 = (uint64_t *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady];
  *v20 = a4;
  v20[1] = a5;
  v21 = a1;
  v22 = a3;
  sub_21967AD60(a4);
  v31.receiver = a6;
  v31.super_class = ObjectType;
  v23 = (char *)objc_msgSendSuper2(&v31, sel_init);
  objc_msgSend(v21, sel_registerProfileReadyObserver_queue_, v23, 0);
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = objc_allocWithZone(MEMORY[0x24BDD41D0]);
  aBlock[4] = sub_21967AD70;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21967757C;
  aBlock[3] = &block_descriptor_8_0;
  v26 = _Block_copy(aBlock);
  swift_retain();
  v27 = objc_msgSend(v25, sel_initWithMode_clock_queue_delay_block_, 1, 1, v22, v26, a9);

  _Block_release(v26);
  swift_release();
  sub_21966509C(a4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  swift_release();
  v28 = *(void **)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation];
  *(_QWORD *)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = v27;

  return v23;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

char *sub_21967AB50(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  Class v20;
  char *v21;
  uint64_t v23;

  v17 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (char *)objc_allocWithZone(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a2, a8);
  return sub_21967A8E0(a1, (uint64_t)v19, a3, a4, a5, v21, a8, a9, a6);
}

uint64_t sub_21967AC28()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21967AC4C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21967AC70()
{
  uint64_t v0;

  sub_2196770F8(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t type metadata accessor for HDMCWidgetSchedulingManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HDMCWidgetSchedulingManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCWidgetSchedulingManager.__allocating_init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

void sub_21967ACC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E61248)
  {
    sub_21967AD1C();
    v0 = sub_219681D3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E61248);
  }
}

unint64_t sub_21967AD1C()
{
  unint64_t result;

  result = qword_253E610F0;
  if (!qword_253E610F0)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDMCWidgetReloadReason, &type metadata for HDMCWidgetReloadReason);
    atomic_store(result, (unint64_t *)&qword_253E610F0);
  }
  return result;
}

uint64_t sub_21967AD60(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_21967AD70()
{
  uint64_t v0;

  sub_219676980(v0);
}

void sub_21967AD78()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255090938)
  {
    v0 = sub_219681D3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255090938);
  }
}

void sub_21967ADD4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255090948)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    sub_21967AE34();
    v0 = sub_219681D3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255090948);
  }
}

unint64_t sub_21967AE34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255090010;
  if (!qword_255090010)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    result = MEMORY[0x219A318B4](&unk_2196859FC, v1);
    atomic_store(result, (unint64_t *)&qword_255090010);
  }
  return result;
}

void sub_21967AE7C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    sub_219654DFC(255, a3);
    sub_219665924(a5, a3);
    v8 = sub_219681D3C();
    if (!v9)
      atomic_store(v8, a2);
  }
}

char *HDMCExperienceModelManager.__allocating_init(notificationProvider:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return HDMCExperienceModelManager.init(notificationProvider:)(a1);
}

char *HDMCExperienceModelManager.init(notificationProvider:)(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  objc_class *v17;
  char *v18;
  void *v19;
  char *v20;
  void *v21;
  _QWORD v23[3];
  uint64_t v24;
  void *v25;
  objc_super v26;
  uint64_t v27;

  v25 = a1;
  v2 = sub_219681BEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_219681BF8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_219681664();
  MEMORY[0x24BDAC7A8](v8);
  v24 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue;
  v23[1] = sub_21967B234();
  v9 = v1;
  sub_219681658();
  v27 = MEMORY[0x24BEE4AF8];
  sub_219654D90(&qword_253E60C80, v7, MEMORY[0x24BEE5940]);
  sub_219672160();
  sub_219654D90((unint64_t *)&unk_253E60C10, (uint64_t (*)(uint64_t))sub_219672160, MEMORY[0x24BEE12C8]);
  sub_219681C7C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5758], v2);
  *(_QWORD *)(v23[2] + v24) = sub_219681C04();
  v10 = v25;
  *(_QWORD *)&v9[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider] = v25;
  v11 = (void *)*MEMORY[0x24BDD3030];
  v12 = objc_allocWithZone(MEMORY[0x24BDD3DD0]);
  v13 = v10;
  v14 = v11;
  v15 = (void *)sub_219681A48();
  v16 = objc_msgSend(v12, sel_initWithName_loggingCategory_, v15, v14);

  *(_QWORD *)&v9[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers] = v16;
  v17 = (objc_class *)type metadata accessor for HDMCExperienceModelManager();
  v26.receiver = v9;
  v26.super_class = v17;
  v18 = (char *)objc_msgSendSuper2(&v26, sel_init);
  v19 = *(void **)&v18[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider];
  v20 = v18;
  v21 = (void *)sub_219681A48();
  objc_msgSend(v19, sel_addObserver_selector_name_object_, v20, sel_didReceiveExperienceModelUpdateNotification, v21, 0);

  return v20;
}

unint64_t sub_21967B234()
{
  unint64_t result;

  result = qword_253E60C88;
  if (!qword_253E60C88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E60C88);
  }
  return result;
}

uint64_t type metadata accessor for HDMCExperienceModelManager()
{
  return objc_opt_self();
}

id HDMCExperienceModelManager.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider], sel_removeObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCExperienceModelManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21967B3A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t aBlock[6];

  v1 = v0;
  swift_getObjectType();
  if (qword_253E60AC8 != -1)
    swift_once();
  v2 = sub_21968164C();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E60BE8);
  v3 = sub_219681634();
  v4 = sub_219681BD4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_219681F34();
    sub_21967C8D8(v7, v8, aBlock);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v3, v4, "[%s] Received a experience model update notification, notifying clients", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v6, -1, -1);
    MEMORY[0x219A3195C](v5, -1, -1);
  }

  v9 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers);
  aBlock[4] = (uint64_t)sub_21967B594;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_219666688;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  v10 = _Block_copy(aBlock);
  objc_msgSend(v9, sel_notifyObservers_, v10);
  _Block_release(v10);
}

id sub_21967B594(void *a1)
{
  return objc_msgSend(a1, sel_experienceModelManagerDidUpdateModel);
}

id HDMCExperienceModelManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDMCExperienceModelManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HDMCExperienceModelManager.register(observer:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_registerObserver_queue_, a1, *(_QWORD *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue));
}

id HDMCExperienceModelManager.remove(observer:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_unregisterObserver_, a1);
}

uint64_t method lookup function for HDMCExperienceModelManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCExperienceModelManager.__allocating_init(notificationProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t HDMCExperienceDaemonStore.__allocating_init(profile:)(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  v3 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v4 = a1;
  v5 = (void *)sub_219681A48();
  v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, 100, v5, v4);

  *(_QWORD *)(v2 + 24) = v6;
  return v2;
}

id HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()()
{
  uint64_t v0;
  id v1;
  id v2;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
  if (!v0)
  {
    v1 = v2;
    if (!v2)
    {
      sub_21967D3C0(MEMORY[0x24BEE4AF8], (unint64_t *)&qword_253E61238, 0x24BE46BD0, (unint64_t *)&qword_253E61240, (void (*)(id *, uint64_t))sub_2196778D0);
      v4 = objc_allocWithZone(MEMORY[0x24BE46B88]);
      sub_219654DFC(0, (unint64_t *)&qword_253E61238);
      sub_21967D0F0((unint64_t *)&qword_253E61240, (unint64_t *)&qword_253E61238, 0x24BE46BD0, MEMORY[0x24BEE5BD8]);
      v5 = (void *)sub_219681B38();
      swift_bridgeObjectRelease();
      v6 = objc_msgSend(v4, sel_initWithPregnancyModeSetupCompletionSet_, v5);

      sub_219654DFC(0, (unint64_t *)&qword_253E60DD0);
      v1 = sub_21966A320(v6);

      if (qword_253E60AC8 != -1)
        swift_once();
      v7 = sub_21968164C();
      __swift_project_value_buffer(v7, (uint64_t)qword_253E60BE8);
      v8 = sub_219681634();
      v9 = sub_219681BD4();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        v11 = swift_slowAlloc();
        v14 = v11;
        *(_DWORD *)v10 = 136446210;
        v12 = sub_219681F34();
        sub_21967C8D8(v12, v13, &v14);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v8, v9, "[%{public}s] No model persisted locally, returning default model", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v11, -1, -1);
        MEMORY[0x219A3195C](v10, -1, -1);
      }

    }
  }
  return v1;
}

void HDMCExperienceDaemonStore.setModel(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  char *v28;
  void *v29;
  id v30;
  _QWORD v31[2];
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD v36[2];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = sub_2196814C0();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253E60AC8 != -1)
    swift_once();
  v6 = sub_21968164C();
  __swift_project_value_buffer(v6, (uint64_t)qword_253E60BE8);
  v7 = a1;
  v8 = sub_219681634();
  v9 = sub_219681BD4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v31[1] = v2;
    v11 = v10;
    v12 = swift_slowAlloc();
    *(_QWORD *)&v36[0] = v12;
    *(_DWORD *)v11 = 136446466;
    v13 = sub_219681F34();
    v35 = sub_21967C8D8(v13, v14, (uint64_t *)v36);
    sub_219681C58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v15 = HDCodableMenstrualCyclesExperienceModel.logDescription.getter();
    v35 = sub_21967C8D8(v15, v16, (uint64_t *)v36);
    sub_219681C58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v8, v9, "[%{public}s] Setting state to %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v12, -1, -1);
    MEMORY[0x219A3195C](v11, -1, -1);

  }
  else
  {

  }
  v17 = *(void **)(v1 + 24);
  v18 = objc_msgSend(v7, sel_data);
  if (v18)
  {
    v19 = sub_2196814F0();
    v21 = v20;

    v18 = (id)sub_2196814E4();
    sub_219669FB4(v19, v21);
  }
  v22 = (void *)sub_219681A48();
  *(_QWORD *)&v36[0] = 0;
  v23 = objc_msgSend(v17, sel_setData_forKey_error_, v18, v22, v36);

  v24 = *(void **)&v36[0];
  if ((v23 & 1) != 0)
  {
    v25 = (void *)objc_opt_self();
    v26 = v24;
    v27 = objc_msgSend(v25, sel_defaultCenter);
    sub_219681A48();
    memset(v36, 0, sizeof(v36));
    v28 = v32;
    sub_2196814B4();
    v29 = (void *)sub_2196814A8();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v34);
    objc_msgSend(v27, sel_postNotification_, v29);

  }
  else
  {
    v30 = *(id *)&v36[0];
    sub_2196814D8();

    swift_willThrow();
  }
}

id HDMCExperienceDaemonStore.fetchLocallyPersistedData()()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  _OWORD *v52;
  void *v54;
  id v55[3];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v0 + 24);
  v3 = (void *)sub_219681A48();
  v55[0] = 0;
  v4 = objc_msgSend(v2, sel_dataForKey_error_, v3, v55);

  v56 = v55[0];
  if (v4)
  {
    v5 = v55[0];
    v6 = sub_2196814F0();
    v8 = v7;

    v9 = objc_allocWithZone(MEMORY[0x24BE40A68]);
    sub_21967CFDC(v6, v8);
    v10 = (void *)sub_2196814E4();
    sub_219669FB4(v6, v8);
    v1 = objc_msgSend(v9, sel_initWithData_, v10);

    if (v1)
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v11 = sub_21968164C();
      __swift_project_value_buffer(v11, (uint64_t)qword_253E60BE8);
      v12 = v1;
      v13 = sub_219681634();
      v14 = sub_219681BD4();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = swift_slowAlloc();
        v54 = (void *)swift_slowAlloc();
        v55[0] = v54;
        *(_DWORD *)v15 = 136446466;
        v16 = sub_219681F34();
        sub_21967C8D8(v16, v17, (uint64_t *)v55);
        sub_219681C58();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        v18 = HDCodableMenstrualCyclesExperienceModel.logDescription.getter();
        sub_21967C8D8(v18, v19, (uint64_t *)v55);
        sub_219681C58();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v13, v14, "[%{public}s] Fetched content from local store: %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v54, -1, -1);
        MEMORY[0x219A3195C](v15, -1, -1);

        sub_219669FB4(v6, v8);
      }
      else
      {
        sub_219669FB4(v6, v8);

      }
    }
    else
    {
      if (qword_253E60AC8 != -1)
        swift_once();
      v38 = sub_21968164C();
      __swift_project_value_buffer(v38, (uint64_t)qword_253E60BE8);
      v39 = sub_219681634();
      v40 = sub_219681BBC();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v1 = (id)swift_slowAlloc();
        v55[0] = v1;
        *(_DWORD *)v41 = 136446210;
        v42 = sub_219681F34();
        sub_21967C8D8(v42, v43, (uint64_t *)v55);
        sub_219681C58();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21961B000, v39, v40, "[%{public}s] Error decoding persisted state", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A3195C](v1, -1, -1);
        MEMORY[0x219A3195C](v41, -1, -1);
      }

      sub_21967CF34();
      swift_allocError();
      *v44 = 0;
      v44[1] = 0;
      swift_willThrow();
      sub_219669FB4(v6, v8);
    }
LABEL_27:

    return v1;
  }
  v20 = qword_253E60AC8;
  if (v55[0])
  {
    v21 = v55[0];
    if (v20 != -1)
      swift_once();
    v22 = sub_21968164C();
    __swift_project_value_buffer(v22, (uint64_t)qword_253E60BE8);
    v23 = sub_219681634();
    v24 = sub_219681BBC();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v26 = (void *)swift_slowAlloc();
      v55[0] = v26;
      *(_DWORD *)v25 = 136446466;
      v27 = sub_219681F34();
      sub_21967C8D8(v27, v28, (uint64_t *)v55);
      sub_219681C58();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      swift_beginAccess();
      v29 = v56;
      sub_21967CF78();
      v30 = v29;
      v31 = sub_219681A78();
      v1 = (id)v32;
      sub_21967C8D8(v31, v32, (uint64_t *)v55);
      sub_219681C58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21961B000, v23, v24, "[%{public}s] Error trying to fetch data from local kvd: %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A3195C](v26, -1, -1);
      MEMORY[0x219A3195C](v25, -1, -1);
    }

    swift_beginAccess();
    if (v56)
    {
      v33 = objc_msgSend(v56, sel_localizedDescription);
      v34 = sub_219681A6C();
      v36 = v35;

      sub_21967CF34();
      swift_allocError();
      *v37 = v34;
      v37[1] = v36;
    }
    else
    {
      sub_21967CF34();
      swift_allocError();
      *v52 = xmmword_219686B60;
    }
    swift_willThrow();
    goto LABEL_27;
  }
  if (qword_253E60AC8 != -1)
    swift_once();
  v45 = sub_21968164C();
  __swift_project_value_buffer(v45, (uint64_t)qword_253E60BE8);
  v46 = sub_219681634();
  v47 = sub_219681BD4();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = (void *)swift_slowAlloc();
    v55[0] = v49;
    *(_DWORD *)v48 = 136446210;
    v50 = sub_219681F34();
    sub_21967C8D8(v50, v51, (uint64_t *)v55);
    sub_219681C58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21961B000, v46, v47, "[%{public}s] No data persisted locally", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A3195C](v49, -1, -1);
    MEMORY[0x219A3195C](v48, -1, -1);
  }

  return 0;
}

uint64_t static HDMCExperienceDaemonStore.experienceModelDidChangeNotificationName.getter()
{
  return sub_219681A48();
}

id HDMCExperienceDaemonStore.profile.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id HDMCExperienceDaemonStore.keyValueDomain.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t HDMCExperienceDaemonStore.init(profile:)(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  id v6;

  *(_QWORD *)(v1 + 16) = a1;
  v3 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v4 = a1;
  v5 = (void *)sub_219681A48();
  v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, 100, v5, v4);

  *(_QWORD *)(v1 + 24) = v6;
  return v1;
}

id HDMCExperienceDaemonStore.fetchPersistedOrDefaultExperienceModel()()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;

  result = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  if (!v0)
  {
    v2 = result;
    sub_21966853C();
    v3 = sub_219673B80();

    swift_release();
    return v3;
  }
  return result;
}

unint64_t HDMCExperienceDaemonStore.Failure.debugDescription.getter()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 8))
    return 0xD000000000000021;
  sub_219681D48();
  swift_bridgeObjectRelease();
  sub_219681A9C();
  return 0xD00000000000001BLL;
}

uint64_t HDMCExperienceDaemonStore.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HDMCExperienceDaemonStore.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_21967C828()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;

  result = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  if (!v0)
  {
    v2 = result;
    sub_21966853C();
    v3 = sub_219673B80();

    swift_release();
    return v3;
  }
  return result;
}

void sub_21967C898(void *a1)
{
  HDMCExperienceDaemonStore.setModel(_:)(a1);
}

id sub_21967C8B8()
{
  return HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
}

uint64_t sub_21967C8D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21967C9A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21967D5D8((uint64_t)v12, *a3);
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
      sub_21967D5D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21967C9A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_219681C64();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21967CB60(a5, a6);
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
  v8 = sub_219681D78();
  if (!v8)
  {
    sub_219681DCC();
    __break(1u);
LABEL_17:
    result = sub_219681DFC();
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

uint64_t sub_21967CB60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21967CBF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21967CDC8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21967CDC8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21967CBF4(uint64_t a1, unint64_t a2)
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
      v3 = sub_21967CD68(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_219681D54();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_219681DCC();
      __break(1u);
LABEL_10:
      v2 = sub_219681AA8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_219681DFC();
    __break(1u);
LABEL_14:
    result = sub_219681DCC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21967CD68(uint64_t a1, uint64_t a2)
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
  sub_21967D614();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21967CDC8(char a1, int64_t a2, char a3, char *a4)
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
    sub_21967D614();
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
  result = sub_219681DFC();
  __break(1u);
  return result;
}

uint64_t sub_21967CF10(unint64_t a1)
{
  return sub_21967D3C0(a1, (unint64_t *)&qword_253E61238, 0x24BE46BD0, (unint64_t *)&qword_253E61240, (void (*)(id *, uint64_t))sub_2196778D0);
}

unint64_t sub_21967CF34()
{
  unint64_t result;

  result = qword_255090970;
  if (!qword_255090970)
  {
    result = MEMORY[0x219A318B4](&protocol conformance descriptor for HDMCExperienceDaemonStore.Failure, &type metadata for HDMCExperienceDaemonStore.Failure);
    atomic_store(result, (unint64_t *)&qword_255090970);
  }
  return result;
}

void sub_21967CF78()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255090978)
  {
    sub_219654DFC(255, &qword_255090980);
    v0 = sub_219681C40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255090978);
  }
}

uint64_t sub_21967CFDC(uint64_t a1, unint64_t a2)
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

uint64_t sub_21967D020(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_21967D05C(&qword_253E60D90, a2, (uint64_t (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore, (uint64_t)&protocol conformance descriptor for HDMCExperienceDaemonStore);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_21967D05C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x219A318B4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for HDMCExperienceDaemonStore()
{
  return objc_opt_self();
}

uint64_t sub_21967D0BC()
{
  return sub_21967D0F0(&qword_255090988, (unint64_t *)&qword_253E60DD0, 0x24BE40A68, (uint64_t)&protocol conformance descriptor for HDCodableMenstrualCyclesExperienceModel);
}

uint64_t sub_21967D0F0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_219654DFC(255, a2);
    result = MEMORY[0x219A318B4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of ExperienceModelDaemonStorageProvider.fetchPersistedOrDefaultExperienceModel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for HDMCExperienceDaemonStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDMCExperienceDaemonStore.__allocating_init(profile:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *initializeBufferWithCopyOfBuffer for HDMCExperienceDaemonStore.Failure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HDMCExperienceDaemonStore.Failure()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for HDMCExperienceDaemonStore.Failure(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HDMCExperienceDaemonStore.Failure(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HDMCExperienceDaemonStore.Failure(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HDMCExperienceDaemonStore.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_21967D2B0(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_21967D2C8(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HDMCExperienceDaemonStore.Failure()
{
  return &type metadata for HDMCExperienceDaemonStore.Failure;
}

uint64_t sub_21967D2F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_21967D05C((unint64_t *)&qword_255090010, 255, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, (uint64_t)&unk_2196859FC);
  result = sub_219681B50();
  v7 = result;
  if (v2)
  {
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_219677DAC(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_21967D39C(unint64_t a1)
{
  return sub_21967D3C0(a1, (unint64_t *)&unk_253E60C20, 0x24BDD3DC0, (unint64_t *)&qword_253E60C30, (void (*)(id *, uint64_t))sub_2196778F4);
}

uint64_t sub_21967D3C0(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, void (*a5)(id *, uint64_t))
{
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void **v15;
  void *v16;
  id v17;
  uint64_t v18;

  v10 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_219681DE4();
    swift_bridgeObjectRelease();
  }
  sub_219654DFC(0, a2);
  sub_21967D0F0(a4, a2, a3, MEMORY[0x24BEE5BD8]);
  result = sub_219681B50();
  v18 = result;
  if (v10)
  {
    swift_bridgeObjectRetain();
    v12 = sub_219681DE4();
    result = swift_bridgeObjectRelease();
    if (!v12)
      return v18;
  }
  else
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v12)
      return v18;
  }
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v12; ++i)
      {
        v14 = MEMORY[0x219A30CD8](i, a1);
        a5(&v17, v14);

      }
    }
    else
    {
      v15 = (void **)(a1 + 32);
      do
      {
        v16 = *v15++;
        a5(&v17, (uint64_t)v16);

        --v12;
      }
      while (v12);
    }
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_21967D544(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_219681B50();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_219677C00(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21967D5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_21967D614()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E60DE0)
  {
    v0 = sub_219681E50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E60DE0);
  }
}

void _UserCharacteristicOfType_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, (uint64_t)v0, "Error retrieving user characteristic of type: %{public}@, error: %{public}@", v1);
}

void _UserCharacteristicModificationDayOfType_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, (uint64_t)v0, "Error retrieving user characteristic modification date of type: %{public}@, error: %{public}@", v1);
}

uint64_t sub_2196814A8()
{
  return MEMORY[0x24BDCB8D8]();
}

uint64_t sub_2196814B4()
{
  return MEMORY[0x24BDCB8F0]();
}

uint64_t sub_2196814C0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2196814CC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2196814D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2196814E4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2196814F0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2196814FC()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_219681508()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_219681514()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_219681520()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21968152C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_219681538()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_219681544()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_219681550()
{
  return MEMORY[0x24BDCE898]();
}

uint64_t sub_21968155C()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_219681568()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_219681574()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_219681580()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21968158C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_219681598()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_2196815A4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2196815B0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2196815BC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2196815C8()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2196815D4()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2196815E0()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_2196815EC()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_2196815F8()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_219681604()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_219681610()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21968161C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_219681628()
{
  return MEMORY[0x24BE407D8]();
}

uint64_t sub_219681634()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_219681640()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21968164C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_219681658()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_219681664()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_219681670()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_21968167C()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_219681688()
{
  return MEMORY[0x24BE17E30]();
}

uint64_t sub_219681694()
{
  return MEMORY[0x24BE17E88]();
}

uint64_t sub_2196816A0()
{
  return MEMORY[0x24BE17E90]();
}

uint64_t sub_2196816AC()
{
  return MEMORY[0x24BE17E98]();
}

uint64_t sub_2196816B8()
{
  return MEMORY[0x24BE17EA0]();
}

uint64_t sub_2196816C4()
{
  return MEMORY[0x24BE17EB0]();
}

uint64_t sub_2196816D0()
{
  return MEMORY[0x24BE17EC0]();
}

uint64_t sub_2196816DC()
{
  return MEMORY[0x24BE17EC8]();
}

uint64_t sub_2196816E8()
{
  return MEMORY[0x24BE17ED0]();
}

uint64_t sub_2196816F4()
{
  return MEMORY[0x24BE17ED8]();
}

uint64_t sub_219681700()
{
  return MEMORY[0x24BE17EE0]();
}

uint64_t sub_21968170C()
{
  return MEMORY[0x24BE17EE8]();
}

uint64_t sub_219681718()
{
  return MEMORY[0x24BE17EF0]();
}

uint64_t sub_219681724()
{
  return MEMORY[0x24BE17EF8]();
}

uint64_t sub_219681730()
{
  return MEMORY[0x24BE17F00]();
}

uint64_t sub_21968173C()
{
  return MEMORY[0x24BE17F08]();
}

uint64_t sub_219681748()
{
  return MEMORY[0x24BE17F10]();
}

uint64_t sub_219681754()
{
  return MEMORY[0x24BE17F18]();
}

uint64_t sub_219681760()
{
  return MEMORY[0x24BE17F20]();
}

uint64_t sub_21968176C()
{
  return MEMORY[0x24BE17F28]();
}

uint64_t sub_219681778()
{
  return MEMORY[0x24BE17F30]();
}

uint64_t sub_219681784()
{
  return MEMORY[0x24BE17F38]();
}

uint64_t sub_219681790()
{
  return MEMORY[0x24BE18140]();
}

uint64_t sub_21968179C()
{
  return MEMORY[0x24BE18148]();
}

uint64_t sub_2196817A8()
{
  return MEMORY[0x24BE18150]();
}

uint64_t sub_2196817B4()
{
  return MEMORY[0x24BE18158]();
}

uint64_t sub_2196817C0()
{
  return MEMORY[0x24BE18160]();
}

uint64_t sub_2196817CC()
{
  return MEMORY[0x24BE18168]();
}

uint64_t sub_2196817D8()
{
  return MEMORY[0x24BE18170]();
}

uint64_t sub_2196817E4()
{
  return MEMORY[0x24BE18178]();
}

uint64_t sub_2196817F0()
{
  return MEMORY[0x24BE18180]();
}

uint64_t sub_2196817FC()
{
  return MEMORY[0x24BE18188]();
}

uint64_t sub_219681808()
{
  return MEMORY[0x24BE18190]();
}

uint64_t sub_219681814()
{
  return MEMORY[0x24BE18198]();
}

uint64_t sub_219681820()
{
  return MEMORY[0x24BE181A0]();
}

uint64_t sub_21968182C()
{
  return MEMORY[0x24BE181A8]();
}

uint64_t sub_219681838()
{
  return MEMORY[0x24BE181B0]();
}

uint64_t sub_219681844()
{
  return MEMORY[0x24BE181B8]();
}

uint64_t sub_219681850()
{
  return MEMORY[0x24BE18288]();
}

uint64_t sub_21968185C()
{
  return MEMORY[0x24BE18290]();
}

uint64_t sub_219681868()
{
  return MEMORY[0x24BE182B0]();
}

uint64_t sub_219681874()
{
  return MEMORY[0x24BE182B8]();
}

uint64_t sub_219681880()
{
  return MEMORY[0x24BE18300]();
}

uint64_t sub_21968188C()
{
  return MEMORY[0x24BE18308]();
}

uint64_t sub_219681898()
{
  return MEMORY[0x24BE18310]();
}

uint64_t sub_2196818A4()
{
  return MEMORY[0x24BE183A0]();
}

uint64_t sub_2196818B0()
{
  return MEMORY[0x24BE183A8]();
}

uint64_t sub_2196818BC()
{
  return MEMORY[0x24BE183B8]();
}

uint64_t sub_2196818C8()
{
  return MEMORY[0x24BE183C0]();
}

uint64_t sub_2196818D4()
{
  return MEMORY[0x24BE183C8]();
}

uint64_t sub_2196818E0()
{
  return MEMORY[0x24BE184E8]();
}

uint64_t sub_2196818EC()
{
  return MEMORY[0x24BE18668]();
}

uint64_t sub_2196818F8()
{
  return MEMORY[0x24BE18678]();
}

uint64_t sub_219681904()
{
  return MEMORY[0x24BE18680]();
}

uint64_t sub_219681910()
{
  return MEMORY[0x24BE186C0]();
}

uint64_t sub_21968191C()
{
  return MEMORY[0x24BE186C8]();
}

uint64_t sub_219681928()
{
  return MEMORY[0x24BE186F0]();
}

uint64_t sub_219681934()
{
  return MEMORY[0x24BE18720]();
}

uint64_t sub_219681940()
{
  return MEMORY[0x24BE18730]();
}

uint64_t sub_21968194C()
{
  return MEMORY[0x24BE18758]();
}

uint64_t sub_219681958()
{
  return MEMORY[0x24BE18768]();
}

uint64_t sub_219681964()
{
  return MEMORY[0x24BE18820]();
}

uint64_t sub_219681970()
{
  return MEMORY[0x24BE18848]();
}

uint64_t sub_21968197C()
{
  return MEMORY[0x24BE18898]();
}

uint64_t sub_219681988()
{
  return MEMORY[0x24BE188A0]();
}

uint64_t sub_219681994()
{
  return MEMORY[0x24BE188B8]();
}

uint64_t sub_2196819A0()
{
  return MEMORY[0x24BE188C0]();
}

uint64_t sub_2196819AC()
{
  return MEMORY[0x24BE188C8]();
}

uint64_t sub_2196819B8()
{
  return MEMORY[0x24BE188E8]();
}

uint64_t sub_2196819C4()
{
  return MEMORY[0x24BE18908]();
}

uint64_t sub_2196819D0()
{
  return MEMORY[0x24BE189A8]();
}

uint64_t sub_2196819DC()
{
  return MEMORY[0x24BE189B0]();
}

uint64_t sub_2196819E8()
{
  return MEMORY[0x24BDD2020]();
}

uint64_t sub_2196819F4()
{
  return MEMORY[0x24BE189D0]();
}

uint64_t sub_219681A00()
{
  return MEMORY[0x24BE18A38]();
}

uint64_t sub_219681A0C()
{
  return MEMORY[0x24BE18A58]();
}

uint64_t sub_219681A18()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_219681A24()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_219681A30()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_219681A3C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_219681A48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_219681A54()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_219681A60()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_219681A6C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_219681A78()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_219681A84()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_219681A90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_219681A9C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_219681AA8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_219681AB4()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_219681AC0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_219681ACC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_219681AD8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_219681AE4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_219681AF0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_219681AFC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_219681B08()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_219681B14()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_219681B20()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_219681B2C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_219681B38()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_219681B44()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_219681B50()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_219681B5C()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_219681B68()
{
  return MEMORY[0x24BEE1610]();
}

uint64_t sub_219681B74()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_219681B80()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_219681B8C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_219681B98()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_219681BA4()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_219681BB0()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_219681BBC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_219681BC8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_219681BD4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_219681BE0()
{
  return MEMORY[0x24BDD2520]();
}

uint64_t sub_219681BEC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_219681BF8()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_219681C04()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_219681C10()
{
  return MEMORY[0x24BDD2668]();
}

uint64_t sub_219681C1C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_219681C28()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_219681C34()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_219681C40()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_219681C4C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_219681C58()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_219681C64()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_219681C70()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_219681C7C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_219681C88()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_219681C94()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_219681CA0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_219681CAC()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_219681CB8()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_219681CC4()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_219681CD0()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_219681CDC()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_219681CE8()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_219681CF4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_219681D00()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_219681D0C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_219681D18()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_219681D24()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_219681D30()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_219681D3C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_219681D48()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_219681D54()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_219681D60()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_219681D6C()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_219681D78()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_219681D84()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_219681D90()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_219681D9C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_219681DA8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_219681DB4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_219681DC0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_219681DCC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_219681DD8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_219681DE4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_219681DF0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_219681DFC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_219681E08()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_219681E14()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_219681E20()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_219681E2C()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_219681E38()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_219681E44()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_219681E50()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_219681E5C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_219681E68()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_219681E74()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_219681E80()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_219681E8C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_219681E98()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_219681EA4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_219681EB0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_219681EBC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_219681EC8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_219681ED4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_219681EE0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_219681EEC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_219681EF8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_219681F04()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_219681F10()
{
  return MEMORY[0x24BE18AE0]();
}

uint64_t sub_219681F1C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_219681F28()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_219681F34()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x24BE1A1A8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

uint64_t HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor()
{
  return MEMORY[0x24BE46808]();
}

uint64_t HDAnalyticsCountOfSleepDaysWithStandHoursPriorToDate()
{
  return MEMORY[0x24BE40818]();
}

uint64_t HDCategorySampleEntityPredicateEqualToValues()
{
  return MEMORY[0x24BE40820]();
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return MEMORY[0x24BE40848]();
}

uint64_t HDDataEntityPredicateForSourceEntitySet()
{
  return MEMORY[0x24BE40858]();
}

uint64_t HDIsUnitTesting()
{
  return MEMORY[0x24BE40D40]();
}

uint64_t HDMenstrualCyclesDiagnosticsServerInterface()
{
  return MEMORY[0x24BE46810]();
}

uint64_t HDMenstrualCyclesPluginServerInterface()
{
  return MEMORY[0x24BE46818]();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return MEMORY[0x24BE40DA0]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x24BE40DA8]();
}

uint64_t HDSQLiteColumnAsUUID()
{
  return MEMORY[0x24BE40DC0]();
}

uint64_t HDSampleEntityOrderingTermsForRecentness()
{
  return MEMORY[0x24BE40908]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x24BE40910]();
}

uint64_t HDSampleEntityPredicateForDataTypes()
{
  return MEMORY[0x24BE40918]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x24BE40920]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x24BE40928]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x24BE40930]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x24BDD27F0]();
}

uint64_t HKCategoryTypeFromDeviationType()
{
  return MEMORY[0x24BE46820]();
}

NSSet *HKCategoryValueSleepAnalysisAsleepValues(void)
{
  return (NSSet *)MEMORY[0x24BDD2A68]();
}

uint64_t HKCompareDoubles()
{
  return MEMORY[0x24BDD2AD0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKFeatureSettingsKeyForDeviationDetectionTypeEnabled()
{
  return MEMORY[0x24BE46830]();
}

uint64_t HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier()
{
  return MEMORY[0x24BE46838]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x24BDD2F40]();
}

uint64_t HKIntersectionDayIndexRange()
{
  return MEMORY[0x24BDD2F58]();
}

uint64_t HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()
{
  return MEMORY[0x24BDD2FA0]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x24BDD2FB0]();
}

uint64_t HKMCAllDeviationTypes()
{
  return MEMORY[0x24BE46848]();
}

uint64_t HKMCAllDisplayTypeIdentifiers()
{
  return MEMORY[0x24BE46850]();
}

uint64_t HKMCAllNotificationCategories()
{
  return MEMORY[0x24BE46858]();
}

uint64_t HKMCAppendCycleFactorsPhaseFromDaySummary()
{
  return MEMORY[0x24BE46860]();
}

uint64_t HKMCBackgroundAndSedentaryHeartRateContextSet()
{
  return MEMORY[0x24BE46868]();
}

uint64_t HKMCCycleChartMainTypes()
{
  return MEMORY[0x24BE46870]();
}

uint64_t HKMCCycleFactorsTypes()
{
  return MEMORY[0x24BE46890]();
}

uint64_t HKMCCycleTrackingSampleTypes()
{
  return MEMORY[0x24BE468A0]();
}

uint64_t HKMCDataTypeCodeFromMenstrualSymptom()
{
  return MEMORY[0x24BE468A8]();
}

uint64_t HKMCDaySummaryBleedingFlowHasFlow()
{
  return MEMORY[0x24BE468B8]();
}

uint64_t HKMCDaySummaryCategoryTypes()
{
  return MEMORY[0x24BE468C0]();
}

uint64_t HKMCDaySummaryQuantityTypes()
{
  return MEMORY[0x24BE468C8]();
}

uint64_t HKMCDaySummarySampleTypes()
{
  return MEMORY[0x24BE468D0]();
}

uint64_t HKMCDaySummarySymptomArrayFromSymptoms()
{
  return MEMORY[0x24BE468D8]();
}

uint64_t HKMCDeviationDetectionAnalyticsKeyFromDeviationType()
{
  return MEMORY[0x24BE468E8]();
}

uint64_t HKMCDeviationSampleTypes()
{
  return MEMORY[0x24BE468F0]();
}

uint64_t HKMCDisplayTypeIdentifierForSampleType()
{
  return MEMORY[0x24BE46928]();
}

uint64_t HKMCExperienceStoreClientInterface()
{
  return MEMORY[0x24BE46968]();
}

uint64_t HKMCExperienceStoreServerInterface()
{
  return MEMORY[0x24BE46970]();
}

uint64_t HKMCFertileWindowNotificationCategories()
{
  return MEMORY[0x24BE46978]();
}

uint64_t HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples()
{
  return MEMORY[0x24BE46980]();
}

uint64_t HKMCHeartRateContextIsSedentary()
{
  return MEMORY[0x24BE46988]();
}

uint64_t HKMCIsAlgorithmsVersionSameOnPairedDevice()
{
  return MEMORY[0x24BE46990]();
}

uint64_t HKMCNotificationCategoryBeforePeriodStartForDays()
{
  return MEMORY[0x24BE46A40]();
}

uint64_t HKMCNotificationDateComponentScalarFromCategory()
{
  return MEMORY[0x24BE46A70]();
}

uint64_t HKMCPeriodNotificationCategories()
{
  return MEMORY[0x24BE46AC0]();
}

uint64_t HKMCSensorBasedFertileWindowNotificationCategories()
{
  return MEMORY[0x24BE46AE0]();
}

uint64_t HKMCSymptomSampleTypes()
{
  return MEMORY[0x24BE46AE8]();
}

uint64_t HKMCTodayIndex()
{
  return MEMORY[0x24BE46AF0]();
}

uint64_t HKMenstrualCyclesDiagnosticsInterface()
{
  return MEMORY[0x24BE46B10]();
}

uint64_t HKMenstrualCyclesStoreInterface()
{
  return MEMORY[0x24BE46B18]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x24BDD3708]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x24BDD3800]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromDeviationType()
{
  return MEMORY[0x24BE46B20]();
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x24BDD38A0]();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return MEMORY[0x24BDD38B8]();
}

uint64_t NSStringFromPredictionPrimarySource()
{
  return MEMORY[0x24BE46B28]();
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

uint64_t _HKCategoryValueSleepAnalysisAsleepValues()
{
  return MEMORY[0x24BDD42B8]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x24BDD4348]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x24BDD4350]();
}

uint64_t _HKMCAppleSleepingWristTemperatureType()
{
  return MEMORY[0x24BE46C40]();
}

uint64_t _HKStatisticsOptionBaselineRelativeQuantities()
{
  return MEMORY[0x24BDD44D0]();
}

uint64_t _HKStatisticsOptionPercentile()
{
  return MEMORY[0x24BDD44D8]();
}

uint64_t _HKStatisticsOptionPresence()
{
  return MEMORY[0x24BDD44E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x24BEDB3A0]();
}

void operator delete(void *__p)
{
  off_24DB215B8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DB215C0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
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

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x24BDB0600]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

