uint64_t BCBrtControlSetNits(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setNits:error:", a2);
}

void sub_229A30444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229A3228C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_229A32A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _isIOKitCompatible(uint64_t a1)
{
  _BOOL8 result;
  NSObject *inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
    inited = init_default_corebrightness_log();
  result = os_log_type_enabled(inited, OS_LOG_TYPE_ERROR);
  if (result)
  {
    _isIOKitCompatible_cold_1(a1, inited, v4, v5, v6, v7, v8, v9);
    return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_229A343B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_229A3486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229A34E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229A35118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_229A3525C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BoostFactorUpdateNotificationCallback(void *a1, int a2, int a3, uint64_t a4)
{
  os_log_t inited;
  NSObject *v9;

  if (objc_msgSend(a1, "logHandle"))
  {
    inited = (os_log_t)objc_msgSend(a1, "logHandle");
LABEL_3:
    v9 = inited;
    goto LABEL_5;
  }
  v9 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    inited = init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    BoostFactorUpdateNotificationCallback_cold_1(a3, a2, v9);
  if (a3 == -536788733)
  {
    objc_msgSend(a1, "boostFactorFromIOFixed:", a4);
    objc_msgSend(a1, "setBoostFactor:");
  }
}

id _copyMatchingDict()
{
  void *v0;
  id v1;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22E2D4EA4]();
  v4[0] = CFSTR("IOHIDDevice");
  v3[0] = CFSTR("IOProviderClass");
  v3[1] = CFSTR("DeviceUsagePage");
  v4[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 128);
  v3[2] = CFSTR("DeviceUsage");
  v4[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v1 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  objc_autoreleasePoolPop(v0);
  return v1;
}

double getUserForNits(double a1)
{
  double v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = 0.0;
  if (a1 <= 0.0)
    return v1;
  v1 = 1.0;
  if (a1 >= 728.274)
    return v1;
  v2 = 0;
  v3 = 1001;
  v4 = 1001;
  do
  {
    v5 = v2 + (v3 >> 1);
    if (*((double *)&table + 2 * v5) >= a1)
      v4 = v5;
    else
      v2 = v5;
    v3 = v4 - v2;
  }
  while ((unint64_t)(v4 - v2) > 1);
  return *((double *)&table + 2 * v2 + 1)
       + (a1 - *((double *)&table + 2 * v2))
       / (*((double *)&table + 2 * v4) - *((double *)&table + 2 * v2))
       * (*((double *)&table + 2 * v4 + 1) - *((double *)&table + 2 * v2 + 1));
}

uint64_t copyNitsToUserMapping()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v0 = (void *)MEMORY[0x22E2D4EA4]();
  v1 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1002);
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1002);
  v3 = 0;
  v4 = &qword_229A38C70;
  do
  {
    objc_msgSend(v1, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 - 1)), v3);
    v5 = *(double *)v4;
    v4 += 2;
    objc_msgSend(v2, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5), v3++);
  }
  while (v3 != 1002);
  v6 = objc_alloc(MEMORY[0x24BDBCE30]);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v1);
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v2), 0);
  objc_autoreleasePoolPop(v0);
  return v8;
}

float clamp(float a1, float a2, float a3)
{
  if (a1 <= a3)
    a3 = a1;
  if (a1 >= a2)
    return a3;
  else
    return a2;
}

BOOL float_equal(float a1, float a2)
{
  return vabds_f32(a1, a2) <= (float)(fmaxf(fabsf(a1), fabsf(a2)) * 0.00000011921);
}

float linear_interpolation(float a1, float a2, float a3, float a4, float a5)
{
  return a3 + (float)((float)((float)(a5 - a3) / (float)(a4 - a2)) * (float)(a1 - a2));
}

float *find_bound(float *result, unint64_t a2, float a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;

  v5 = 0;
  v6 = 0;
  if (!result || !a2)
    goto LABEL_13;
  if (*result > a3)
  {
    v5 = 0;
    v6 = 1;
LABEL_13:
    *a4 = v5;
    *a5 = v6;
    return result;
  }
  v6 = a2 - 1;
  if (result[a2 - 1] <= a3)
  {
    v5 = a2 - 2;
    goto LABEL_13;
  }
  if (a2 >= 2)
  {
    v5 = 0;
    while (result[v5] > a3 || result[v5 + 1] <= a3)
    {
      if (v6 == ++v5)
        return result;
    }
    v6 = v5 + 1;
    goto LABEL_13;
  }
  return result;
}

float matrix_element(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(float *)(a1 + 4 * (a3 + a4 * a2));
}

float *two_dimensional_interpolation(float *result, unint64_t a2, float *a3, unint64_t a4, uint64_t a5, float a6, float a7)
{
  float v9;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  if (a4 >= 2 && a2 >= 2 && result && a3 && a5)
  {
    v9 = result[a2 - 1];
    if (v9 >= a6)
      v9 = a6;
    if (*result <= a6)
      v10 = v9;
    else
      v10 = *result;
    v11 = a3[a4 - 1];
    if (v11 >= a7)
      v11 = a7;
    if (*a3 <= a7)
      v12 = v11;
    else
      v12 = *a3;
    v15 = 0;
    v16 = 0;
    find_bound(result, a2, v10, &v16, &v15);
    v13 = 0;
    v14 = 0;
    return find_bound(a3, a4, v12, &v14, &v13);
  }
  return result;
}

float mach_time_to_nanoseconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1;
}

float __mach_time_to_nanoseconds_block_invoke()
{
  float result;
  mach_timebase_info info;

  mach_timebase_info(&info);
  result = (float)info.numer / (float)info.denom;
  *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor = result;
  return result;
}

float mach_time_to_milliseconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1) / 1000000.0;
}

float mach_time_to_seconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1) / 1000000000.0;
}

float mach_time_now_in_nanoseconds()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0;
}

float mach_time_now_in_milliseconds()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0) / 1000000.0;
}

float mach_time_now_in_seconds()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1)
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0) / 1000000000.0;
}

unint64_t create_integer_array_from_cfdata(const void *a1, UInt8 **a2)
{
  CFTypeID v4;
  unint64_t Length;
  unint64_t v6;
  UInt8 *v7;
  CFRange v9;

  if (!a1 || (v4 = CFGetTypeID(a1), v4 != CFDataGetTypeID()))
  {
    v7 = 0;
    goto LABEL_6;
  }
  Length = CFDataGetLength((CFDataRef)a1);
  v6 = Length >> 2;
  v7 = (UInt8 *)malloc_type_calloc(Length >> 2, 4uLL, 0x100004052888210uLL);
  if (!v7)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v9.length = Length & 0xFFFFFFFFFFFFFFFCLL;
  v9.location = 0;
  CFDataGetBytes((CFDataRef)a1, v9, v7);
LABEL_7:
  *a2 = v7;
  return v6;
}

uint64_t get_integer_from_cfdata(uint64_t result, _DWORD *a2)
{
  const __CFData *v3;
  CFTypeID v4;
  int v5;
  UInt8 buffer[4];
  CFRange v7;

  *(_DWORD *)buffer = 0;
  if (result)
  {
    v3 = (const __CFData *)result;
    v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFDataGetTypeID() && CFDataGetLength(v3) == 4)
    {
      v7.location = 0;
      v7.length = 4;
      CFDataGetBytes(v3, v7, buffer);
      result = 1;
      v5 = *(_DWORD *)buffer;
    }
    else
    {
      v5 = 0;
      result = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
  return result;
}

BOOL get_uint32_from_cfdata(const void *a1, unsigned int *a2)
{
  CFTypeID v4;
  CFIndex Length;
  _BOOL8 v6;
  UInt8 buffer[4];
  CFRange v9;

  if (!a1)
    return 0;
  v4 = CFGetTypeID(a1);
  if (v4 != CFDataGetTypeID())
    return 0;
  *(_DWORD *)buffer = 0;
  Length = CFDataGetLength((CFDataRef)a1);
  v6 = Length == 4;
  if (Length == 4)
  {
    v9.location = 0;
    v9.length = 4;
    CFDataGetBytes((CFDataRef)a1, v9, buffer);
    *a2 = *(_DWORD *)buffer;
  }
  return v6;
}

uint64_t get_float_from_cfdata(uint64_t result, int *a2)
{
  const __CFData *v3;
  CFTypeID v4;
  int v5;
  UInt8 buffer[4];
  CFRange v7;

  *(_DWORD *)buffer = 2143289344;
  if (!result)
    goto LABEL_6;
  v3 = (const __CFData *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  if (v4 != CFDataGetTypeID() || CFDataGetLength(v3) != 4)
  {
    result = 0;
LABEL_6:
    v5 = 2143289344;
    goto LABEL_7;
  }
  v7.location = 0;
  v7.length = 4;
  CFDataGetBytes(v3, v7, buffer);
  result = 1;
  v5 = *(_DWORD *)buffer;
LABEL_7:
  *a2 = v5;
  return result;
}

CFTypeRef load_integer_array_from_edt(io_registry_entry_t a1, CFStringRef key, UInt8 **a3)
{
  CFTypeRef result;
  CFTypeRef v5;
  unint64_t integer_array_from_cfdata;

  result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (result)
  {
    v5 = result;
    integer_array_from_cfdata = create_integer_array_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)integer_array_from_cfdata;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

unint64_t load_float_array_from_edt(io_registry_entry_t a1, CFStringRef key, _QWORD *a3)
{
  CFTypeRef v4;
  const void *v5;
  unint64_t v6;
  UInt8 *v8;

  v4 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (v4)
  {
    v5 = v4;
    v8 = 0;
    v6 = create_integer_array_from_cfdata(v4, &v8);
    *a3 = v8;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
    *a3 = 0;
  }
  return v6;
}

float load_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  CFTypeRef v2;
  const void *v3;
  float v5;

  v5 = NAN;
  v2 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (!v2)
    return NAN;
  v3 = v2;
  get_float_from_cfdata((uint64_t)v2, (int *)&v5);
  CFRelease(v3);
  return v5;
}

CFTypeRef load_int_from_edt(io_registry_entry_t a1, CFStringRef key, _DWORD *a3)
{
  CFTypeRef result;
  CFTypeRef v5;
  uint64_t integer_from_cfdata;

  result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (result)
  {
    v5 = result;
    integer_from_cfdata = get_integer_from_cfdata((uint64_t)result, a3);
    CFRelease(v5);
    return (CFTypeRef)integer_from_cfdata;
  }
  return result;
}

CFTypeRef load_uint_from_edt(io_registry_entry_t a1, CFStringRef key, unsigned int *a3)
{
  CFTypeRef result;
  CFTypeRef v5;
  _BOOL8 uint32_from_cfdata;

  result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (result)
  {
    v5 = result;
    uint32_from_cfdata = get_uint32_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)uint32_from_cfdata;
  }
  return result;
}

float load_fixed_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  CFTypeRef v2;
  const void *v3;
  float v4;
  int v6;

  v2 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (!v2)
    return NAN;
  v3 = v2;
  v6 = 0;
  if (get_integer_from_cfdata((uint64_t)v2, &v6))
    v4 = (float)v6 * 0.000015259;
  else
    v4 = NAN;
  CFRelease(v3);
  return v4;
}

double scaleForExponent(int a1)
{
  double result;
  double v2;
  int i;

  result = 1.0;
  if (a1 >= 8)
  {
    if (a1 <= 0xF)
    {
      for (i = 16; i > a1; --i)
        result = result * 10.0;
    }
  }
  else
  {
    v2 = 1.0;
    if (a1 >= 1)
    {
      do
      {
        v2 = v2 * 10.0;
        --a1;
      }
      while (a1);
    }
    return 1.0 / v2;
  }
  return result;
}

float LuminanceToPerceptual(float a1, float a2, float a3)
{
  float v5;

  v5 = logf(fmaxf(a1, a2) / a3);
  return (float)(v5 / logf(a3 / a2)) + 1.0;
}

float PerceptualToLuminance(float a1, float a2, float a3)
{
  return powf(a3 / a2, a1 + -1.0) * a3;
}

os_log_t init_default_corebrightness_log()
{
  os_log_t v0;

  v0 = os_log_create("com.apple.CoreBrightness", "default");
  _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  if (!v0)
  {
    v0 = (os_log_t)MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      init_default_corebrightness_log_cold_1();
    _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  }
  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  displays = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = +[BCBrtControl copyAllAvailableControls](BCBrtControl, "copyAllAvailableControls");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)displays, "setObject:forKeyedSubscript:", v8, objc_msgSend(v8, "ID"));
        objc_msgSend(v8, "setDisplayInvalidHandler:", &__block_literal_global_0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __main_block_invoke_2;
  v10[3] = &unk_24F2A7348;
  v10[4] = &__block_literal_global_0;
  objc_msgSend(+[BCBrtControl newMonitorForAllControlsWithHandler:error:](BCBrtControl, "newMonitorForAllControlsWithHandler:error:", v10, 0), "cancel");
  return 0;
}

uint64_t __main_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)displays, "removeObjectForKey:", objc_msgSend(a2, "ID"));
}

void __main_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)objc_msgSend((id)displays, "objectForKey:", objc_msgSend(a2, "ID"));
    if (v3)
    {
      if ((objc_msgSend(v3, "isEqual:", a2) & 1) == 0)
        __main_block_invoke_2_cold_1();

    }
    else
    {
      objc_msgSend((id)displays, "setObject:forKeyedSubscript:", a2, objc_msgSend(a2, "ID"));
      objc_msgSend(a2, "setCallbackQueue:", dispatch_get_global_queue(0, 0));
      objc_msgSend(a2, "setDisplayInvalidHandler:", *(_QWORD *)(a1 + 32));
    }
  }
}

uint64_t setBrightnessOnAllDisplays(double a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)displays;
  result = objc_msgSend((id)displays, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = 0;
        objc_msgSend(v7, "setNits:error:", &v8, a1);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void sub_229A37858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _iokitCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)a1 + 16))();
}

_QWORD *_newBlockWrapper(const void *a1)
{
  _QWORD *v2;

  if (!a1)
    _newBlockWrapper_cold_1();
  v2 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  *v2 = _Block_copy(a1);
  return v2;
}

void _freeBlockWrapper(const void **a1)
{
  _Block_release(*a1);
  free(a1);
}

id BCBrtControlNewMonitorForAllDisplaysWithHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlNewMonitorForAllDisplaysWithHandler_block_invoke;
  v4[3] = &__block_descriptor_48_e22_v16__0__BCBrtControl_8l;
  v4[4] = a1;
  v4[5] = a2;
  return +[BCBrtControl newMonitorForAllControlsWithHandler:error:](BCBrtControl, "newMonitorForAllControlsWithHandler:error:", v4, a3);
}

id BCBrtControlCopyAvailableDisplays()
{
  return +[BCBrtControl copyAllAvailableControls](BCBrtControl, "copyAllAvailableControls");
}

uint64_t BCBrtControlSetMultipleControlEnabled(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setMultipleControlEnabled:", a2);
}

uint64_t BCBrtControlSetDisplayInvalidHandler(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlSetDisplayInvalidHandler_block_invoke;
  v4[3] = &__block_descriptor_48_e22_v16__0__BCBrtControl_8l;
  v4[4] = a2;
  v4[5] = a3;
  return objc_msgSend(a1, "setDisplayInvalidHandler:", v4);
}

uint64_t BCBrtControlSetCallbackQueue(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setCallbackQueue:", a2);
}

uint64_t BCBrtControlIsEqual(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqual:", a2);
}

uint64_t BCBrtControlSetNitsAsync(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlSetNitsAsync_block_invoke;
  v4[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v4[4] = a2;
  v4[5] = a3;
  return objc_msgSend(a1, "setNitsAsync:completionHandler:", v4);
}

uint64_t BCBrtControlGetNits(void *a1, const char *a2)
{
  return objc_msgSend(a1, "getNitsWithError:", a2);
}

uint64_t BCBrtControlSetProperty(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "setProperty:value:error:", a2, a3, a4);
}

uint64_t BCBrtControlSetPropertyAync(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __BCBrtControlSetPropertyAync_block_invoke;
  v6[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v6[4] = a4;
  v6[5] = a5;
  return objc_msgSend(a1, "setPropertyAync:value:completionHandler:", a2, a3, v6);
}

uint64_t BCBrtControlCopyProperty(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "copyProperty:error:", a2, a3);
}

uint64_t BCBrtControlSetDisplayService(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setDisplayService:", a2);
}

void _isIOKitCompatible_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_229A2F000, a2, a3, "error: %@ isn't IOKit compatible (string, number, array, dictionary)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void BoostFactorUpdateNotificationCallback_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl(&dword_229A2F000, log, OS_LOG_TYPE_DEBUG, "display service message type 0x%X from service 0x%X", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_5();
}

void init_default_corebrightness_log_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_229A2F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

void __main_block_invoke_2_cold_1()
{
  __assert_rtn("main_block_invoke_2", "example.m", 34, "[originalDisp isEqual: disp]");
}

void _newBlockWrapper_cold_1()
{
  __assert_rtn("_newBlockWrapper", "utilites.m", 16, "block");
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

