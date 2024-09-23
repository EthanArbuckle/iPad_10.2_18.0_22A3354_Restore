void sub_20D6F6374(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Unwind_Resume(a1);
}

id CarPlayFrameworkACCNavLogging()
{
  if (CarPlayFrameworkACCNavLogging_onceToken != -1)
    dispatch_once(&CarPlayFrameworkACCNavLogging_onceToken, &__block_literal_global_2_0);
  return (id)CarPlayFrameworkACCNavLogging_facility;
}

id CPSanitizeImage(void *a1, objc_class *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1;
  objc_msgSend(v3, "images");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CPSanitizeImage_cold_1(a2);
    objc_msgSend(v3, "images");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

void sub_20D6F7DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_20D6F8354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

void sub_20D6FEAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D6FFF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D7000EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7002EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7011D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D702B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D703C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CPQuickOrderingTemplateClasses()
{
  if (CPQuickOrderingTemplateClasses_onceToken != -1)
    dispatch_once(&CPQuickOrderingTemplateClasses_onceToken, &__block_literal_global_542);
  return (id)CPQuickOrderingTemplateClasses_classes;
}

id CPPublicSafetyTemplateClasses()
{
  if (CPPublicSafetyTemplateClasses_onceToken != -1)
    dispatch_once(&CPPublicSafetyTemplateClasses_onceToken, &__block_literal_global_543);
  return (id)CPPublicSafetyTemplateClasses_classes;
}

id CPFuelingTemplateClasses()
{
  if (CPFuelingTemplateClasses_onceToken != -1)
    dispatch_once(&CPFuelingTemplateClasses_onceToken, &__block_literal_global_544);
  return (id)CPFuelingTemplateClasses_classes;
}

id CPDrivingTaskTemplateClasses()
{
  if (CPDrivingTaskTemplateClasses_onceToken != -1)
    dispatch_once(&CPDrivingTaskTemplateClasses_onceToken, &__block_literal_global_545);
  return (id)CPDrivingTaskTemplateClasses_classes;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_20D705A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_20D706D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_20D7070EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromAccNavLaneGuidanceInfoUpdateInfoType(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("DisplayComponentID");
  else
    return off_24C77D160[(__int16)(a1 - 1)];
}

const __CFString *NSStringFromAccNavLaneGuidanceInfoUpdateLaneInfoInfoType(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("Index");
  else
    return off_24C77D178[(__int16)(a1 - 1)];
}

const __CFString *NSStringFromAccNavManeuverInfoUpdateInfoType(int a1)
{
  if ((a1 - 1) > 0xC)
    return CFSTR("DisplayComponentID");
  else
    return off_24C77D190[(__int16)(a1 - 1)];
}

const __CFString *NSStringFromAccNavRouteGuidanceUpdateInfoType(int a1)
{
  if ((a1 - 1) > 0x14)
    return CFSTR("DisplayComponentID");
  else
    return off_24C77D1F8[(__int16)(a1 - 1)];
}

const __CFString *NSStringFromCPAccNavType(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("Unknown");
  else
    return off_24C77D2E8[a1];
}

id NSNumberForCPAccNavTypeFromDouble(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (int)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", (int)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", (int)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (int)a2, v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

uint64_t NotSetFromCPAccNavType(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return (uint64_t)*(&off_24C77D358 + a1);
}

void *NotSetFromCPNavEnum(int a1, unint64_t a2)
{
  if (a1 == 6)
    return &unk_24C79E050;
  if (a2 > 7)
    return 0;
  return *(&off_24C77D358 + a2);
}

void sub_20D70CDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_20D70D1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D70E48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D70EDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D70F62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D70FFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7127E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CPAssertAllowedClass(void *a1, uint64_t a2, const char *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if ((objc_msgSend(v6, "containsObject:", object_getClass(v10)) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v10, v9, v6, 0);

  }
}

void sub_20D715E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_20D7167EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7197B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D719A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_20D71B224(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D71BDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D71C09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D71EABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D71EE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_20D7239BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CarPlayFrameworkGeneralLogging()
{
  if (CarPlayFrameworkGeneralLogging_onceToken != -1)
    dispatch_once(&CarPlayFrameworkGeneralLogging_onceToken, &__block_literal_global_18);
  return (id)CarPlayFrameworkGeneralLogging_facility;
}

void sub_20D725AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double luminanceComponent(double a1)
{
  float v1;

  if (a1 <= 0.03928)
    return a1 / 12.9200001;
  v1 = (a1 + 0.0549999997) / 1.05499995;
  return powf(v1, 2.4);
}

double CPLuminanceForColor(void *a1)
{
  float v1;
  double v2;
  float v3;
  double v4;
  float v5;
  double v6;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0;
  v9 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);
  if (v11 <= 0.03928)
  {
    v2 = v11 / 12.9200001;
  }
  else
  {
    v1 = (v11 + 0.0549999997) / 1.05499995;
    v2 = powf(v1, 2.4);
  }
  if (v10 <= 0.03928)
  {
    v4 = v10 / 12.9200001;
  }
  else
  {
    v3 = (v10 + 0.0549999997) / 1.05499995;
    v4 = powf(v3, 2.4);
  }
  if (v9 <= 0.03928)
  {
    v6 = v9 / 12.9200001;
  }
  else
  {
    v5 = (v9 + 0.0549999997) / 1.05499995;
    v6 = powf(v5, 2.4);
  }
  return v4 * 0.715200007 + v2 * 0.212599993 + v6 * 0.0722000003;
}

double CPContrastRatioForColors(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a2;
  v4 = CPLuminanceForColor(a1);
  v5 = CPLuminanceForColor(v3);

  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v4 <= v5)
    v7 = v4;
  else
    v7 = v5;
  return (v6 + 0.0500000007) / (v7 + 0.0500000007);
}

id CPContrastingColorForColor(void *a1)
{
  id v1;
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CPContrastRatioForColors(v2, v1);

  if (v3 <= 7.0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CPContrastRatioForColors(v5, v1);

    if (v6 <= 7.0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;
LABEL_7:

  return v7;
}

BOOL CPColorMeetsContrastRequirement(void *a1)
{
  void *v1;
  _BOOL8 v2;

  CPContrastingColorForColor(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t CPGuidanceStyleForColor(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BDF6F30];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "_currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v4);

  v7 = (void *)MEMORY[0x24BDF6950];
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "CGColor");

  objc_msgSend(v7, "colorWithCGColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v6);
  CPContrastingColorForColor(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
    v14 = 2;
  else
    v14 = 1;

  return v14;
}

id CPImageByScalingImageToSize(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  double v32;
  double v33;

  v5 = a1;
  objc_msgSend(MEMORY[0x24BDF6D38], "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if (objc_msgSend(v5, "isSymbolImage"))
  {
    objc_msgSend(v10, "displayScale");
    if (v11 < 1.0)
      v11 = 2.0;
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", a2 / v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithSymbolConfiguration:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "size");
    if (v14 <= a2 && (objc_msgSend(v5, "size"), v15 <= a3))
    {
      v13 = v5;
    }
    else
    {
      objc_msgSend(v5, "size");
      v17 = a2 / v16;
      objc_msgSend(v5, "size");
      if (v17 >= a3 / v18)
        v19 = a3 / v18;
      else
        v19 = v17;
      objc_msgSend(v5, "size");
      v21 = v20 * v19;
      objc_msgSend(v5, "size");
      v23 = v22 * v19;
      v24 = objc_alloc(MEMORY[0x24BDF6A98]);
      objc_msgSend(MEMORY[0x24BDF6AA0], "formatForTraitCollection:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithSize:format:", v25, v21, v23);

      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __CPImageByScalingImageToSize_block_invoke;
      v30[3] = &unk_24C77DCD0;
      v27 = v5;
      v31 = v27;
      v32 = v21;
      v33 = v23;
      objc_msgSend(v26, "imageWithActions:", v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageWithRenderingMode:", objc_msgSend(v27, "renderingMode"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

id CPSanitizedBackgroundColor(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDF6F30];
  v2 = a1;
  objc_msgSend(v1, "_currentTraitCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceIdiom:", 3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6F30];
  v44[0] = v4;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollectionWithTraitsFromCollections:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF6F30];
  v38 = (void *)v4;
  v43[0] = v4;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionWithTraitsFromCollections:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v8);
  objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF6950];
  v15 = objc_retainAutorelease(v2);
  objc_msgSend(v14, "colorWithCGColor:", objc_msgSend(v15, "CGColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v12);
  objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDF6950];
  v20 = objc_retainAutorelease(v15);
  v21 = objc_msgSend(v20, "CGColor");

  objc_msgSend(v19, "colorWithCGColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v3);
  if (CPColorMeetsContrastRequirement(v17))
  {
    v24 = objc_msgSend(v17, "copy");

    v13 = (void *)v24;
  }
  if (CPColorMeetsContrastRequirement(v23))
  {
    v25 = objc_msgSend(v23, "copy");

    v18 = (void *)v25;
  }
  v26 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v27;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceIdiom:", -1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v28;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayGamut:", -1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "traitCollectionWithTraitsFromCollections:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x24BDF6950];
  v40[0] = v37;
  v40[1] = v36;
  v41[0] = v13;
  v41[1] = v18;
  v40[2] = v31;
  v41[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_dynamicColorWithColorsByTraitCollection:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

__CFString *CPSStringFromBOOL(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

id CPFrameworkBundle()
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
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Frameworks/CarPlay.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CPLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CPFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24C77F1E0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CPCurrentProcessHasTemplateEntitlement()
{
  if ((CPCurrentProcessHasMapsEntitlement() & 1) != 0
    || (CPCurrentProcessHasAudioEntitlement() & 1) != 0
    || (CPCurrentProcessHasCommunicationEntitlement() & 1) != 0
    || (CPCurrentProcessHasChargingEntitlement() & 1) != 0
    || (CPCurrentProcessHasParkingEntitlement() & 1) != 0
    || (CPCurrentProcessHasQuickOrderingEntitlement() & 1) != 0
    || (CPCurrentProcessHasPublicSafetyEntitlement() & 1) != 0
    || (CPCurrentProcessHasFuelingEntitlement() & 1) != 0)
  {
    return 1;
  }
  else
  {
    return CPCurrentProcessHasDrivingTaskEntitlement();
  }
}

uint64_t CPCurrentProcessHasMapsEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-maps"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-maps"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares maps entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasAudioEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-audio"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-audio"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares audio entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasCommunicationEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-communication"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-communication"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares communications entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasChargingEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-charging"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-charging"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares charging entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasParkingEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-parking"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-parking"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares parking entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasQuickOrderingEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-quick-ordering"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-quick-ordering"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares quick ordering entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasPublicSafetyEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-public-safety"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-public-safety"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares public safety entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasFuelingEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-fueling"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-fueling"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares fueling entitlement.", v6, 2u);
    }

  }
  return v3;
}

uint64_t CPCurrentProcessHasDrivingTaskEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.developer.carplay-driving-task"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitlementValuesForKeys:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.developer.carplay-driving-task"));
  if ((_DWORD)v3)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Application declares driving task entitlement.", v6, 2u);
    }

  }
  return v3;
}

__CFString *NSStringFromCPManeuverType(unint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (a1 >= 0x36)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24C77DD38[a1];
  }
  return v5;
}

__CFString *NSStringFromCPJunctionType(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      v5 = CFSTR("Roundabout");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("Intersection");
  }
  return v5;
}

__CFString *NSStringFromCPTrafficSide(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      v5 = CFSTR("Left");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("Right");
  }
  return v5;
}

__CFString *NSStringFromCPLaneStatus(unint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (a1 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24C77DEE8[a1];
  }
  return v5;
}

__CFString *NSStringFromCPDistanceUnits(uint64_t a1)
{
  unsigned int v1;
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (v1 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), v1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24C77DF00[(char)v1];
  }
  return v5;
}

id NSUnitLengthFromCPDistanceUnits(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    switch(v1)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_msgSend(MEMORY[0x24BDD1928], "miles");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDD1928], "meters");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1928], "yards");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1928], "feet");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1928], "millimeters");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return v5;
}

uint64_t CPDistanceUnitsFromNSUnitLength(void *a1)
{
  id v1;
  void *v2;
  char v3;
  unsigned __int8 v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1928], "miles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1928], "meters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1928], "yards");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = 3;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1928], "feet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v1, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = 4;
          }
          else
          {
            NotSetFromCPAccNavType(3uLL);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v13, "integerValue");

          }
        }
      }
    }
  }

  return v4;
}

__CFString *NSStringFromCPGuidanceState(uint64_t a1)
{
  unsigned int v1;
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (v1 >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), v1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24C77DF28[(char)v1];
  }
  return v5;
}

__CFString *NSStringFromCPManeuverState(unint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotSetFromCPAccNavType(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else if (a1 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24C77DF60[a1];
  }
  return v5;
}

const __CFString *NSStringFromCPRerouteReason(char a1)
{
  if ((a1 - 1) > 3u)
    return CFSTR("Unknown");
  else
    return off_24C77DF80[(char)(a1 - 1)];
}

__CFString *NSStringFromCPNavEnum(unsigned int a1)
{
  if (a1 < 8)
    return off_24C77DFA0[(char)a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_20D729208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D72BD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D72C76C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D72C7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void CPSanitizeImage_cold_1(objc_class *a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412546;
  v4 = v1;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_20D6F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Animated images are not supported by %@. Using the first image instead.\n%@", (uint8_t *)&v3, 0x16u);

}

uint64_t BSEqualArrays()
{
  return MEMORY[0x24BE0BB80]();
}

uint64_t CRNavigationClientInterface()
{
  return MEMORY[0x24BE15288]();
}

uint64_t CRNavigationServiceInterface()
{
  return MEMORY[0x24BE15290]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UISceneSettingsDiffActionPerformActionsWithDelayForTransitionContext()
{
  return MEMORY[0x24BDF8188]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x24BDF8190]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x24BEDCEC8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x24BEDD4A8](property, attributeName);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

