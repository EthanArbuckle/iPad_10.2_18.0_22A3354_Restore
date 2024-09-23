const __CFString *typeToKey(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 0:
      result = CFSTR("Default");
      break;
    case 1:
      result = CFSTR("Variant1.SingleClick.Normal");
      break;
    case 2:
      result = CFSTR("Variant1.SingleClick.Soft");
      break;
    case 3:
      result = CFSTR("Variant1.SecondClick.Normal");
      break;
    case 4:
      result = CFSTR("Variant1.SecondClick.Soft");
      break;
    case 5:
      result = CFSTR("Variant2.SingleClick.Normal");
      break;
    case 6:
      result = CFSTR("Variant2.SingleClick.Soft");
      break;
    case 7:
      result = CFSTR("Variant2.SecondClick.Normal");
      break;
    case 8:
      result = CFSTR("Variant2.SecondClick.Soft");
      break;
    case 9:
      result = CFSTR("Variant3.SingleClick.Normal");
      break;
    case 10:
      result = CFSTR("Variant3.SingleClick.Soft");
      break;
    case 11:
      result = CFSTR("Variant3.SecondClick.Normal");
      break;
    case 12:
      result = CFSTR("Variant3.SecondClick.Soft");
      break;
    case 13:
      result = CFSTR("Variant1.SingleClick.SemiSoft");
      break;
    case 14:
      result = CFSTR("Variant1.SecondClick.SemiSoft");
      break;
    case 15:
      result = CFSTR("Variant2.SingleClick.SemiSoft");
      break;
    case 16:
      result = CFSTR("Variant2.SecondClick.SemiSoft");
      break;
    case 17:
      result = CFSTR("Variant3.SingleClick.SemiSoft");
      break;
    case 18:
      result = CFSTR("Variant3.SecondClick.SemiSoft");
      break;
    default:
      if (a1 == 100)
        result = CFSTR("Latch");
      else
        result = 0;
      break;
  }
  return result;
}

const void *getDictionary(const __CFDictionary *a1, const __CFString *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFDictionaryGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

const void *getString(const __CFDictionary *a1, const __CFString *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFStringGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t getFloat64(const __CFDictionary *a1, const __CFString *a2, double *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = (uint64_t)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v5 = (const __CFNumber *)result;
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberDoubleType, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t dictForType(uint64_t a1, _QWORD *a2)
{
  PlatformUtilities *v4;
  uint64_t TuningInSubdirs;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  NSObject *AUPListByName;
  const __CFDictionary *Dictionary;
  const __CFString *v11;
  const void *v12;
  CFStringRef v14;
  char v15;
  CFStringRef v16;
  char v17;
  CFMutableStringRef v18;
  char v19;
  uint8_t v20[56];
  uint8_t buf[8];
  CFStringRef *v22;
  CFStringRef *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  TuningPListMgr::TuningPListMgr((TuningPListMgr *)v20, "/Library/Audio/Tunings");
  v18 = PlatformUtilities::CopyHardwareModelShortName(v4);
  v19 = 1;
  v16 = CFStringCreateWithCString(0, "ButtonHaptics", 0x600u);
  v17 = 1;
  v14 = CFStringCreateWithCString(0, "buttonhapticsconfig", 0x600u);
  v15 = 1;
  *(_QWORD *)buf = &v18;
  v22 = &v16;
  v23 = &v14;
  TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_((uint64_t)v20, (const __CFString ***)buf, 3u, 2);
  CACFString::~CACFString((CACFString *)&v14);
  CACFString::~CACFString((CACFString *)&v16);
  if (!(_DWORD)TuningInSubdirs)
  {
    AUPListByName = TuningPListMgr::getAUPListByName((TuningPListMgr *)v20, "buttonhapticsconfig");
    if (AUPListByName)
    {
      Dictionary = (const __CFDictionary *)getDictionary((const __CFDictionary *)AUPListByName, CFSTR("States"));
      if (Dictionary)
      {
        v11 = typeToKey(a1);
        if (v11)
        {
          v12 = getDictionary(Dictionary, v11);
          *a2 = v12;
          if (v12)
          {
            CFRetain(v12);
            TuningInSubdirs = 0;
            goto LABEL_19;
          }
          TuningInSubdirs = 1886155636;
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          *(_WORD *)buf = 0;
          v6 = MEMORY[0x24BDACB70];
          v7 = "get typeDictionary failed";
        }
        else
        {
          TuningInSubdirs = 1954115617;
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          *(_WORD *)buf = 0;
          v6 = MEMORY[0x24BDACB70];
          v7 = "bad typeKey";
        }
      }
      else
      {
        TuningInSubdirs = 1886155636;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v6 = MEMORY[0x24BDACB70];
        v7 = "get statesDictionary failed";
      }
    }
    else
    {
      TuningInSubdirs = 1886155636;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "getAUPListByName failed";
    }
    v8 = 2;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = TuningInSubdirs;
    v6 = MEMORY[0x24BDACB70];
    v7 = "loadTuning failed %d";
    v8 = 8;
LABEL_18:
    _os_log_impl(&dword_215E8C000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
  }
LABEL_19:
  CACFString::~CACFString((CACFString *)&v18);
  TuningPListMgr::~TuningPListMgr((TuningPListMgr *)v20);
  return TuningInSubdirs;
}

void sub_215E8D7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  CACFString::~CACFString((CACFString *)va);
  TuningPListMgr::~TuningPListMgr((TuningPListMgr *)va1);
  _Unwind_Resume(a1);
}

void sub_215E8D814()
{
  JUMPOUT(0x215E8D80CLL);
}

void MatchingNotificationHandler(void *a1, io_iterator_t iterator)
{
  uint64_t v2;
  io_service_t v3;
  unsigned int *v4;
  kern_return_t v5;
  kern_return_t v6;
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  kern_return_t v15;
  _OWORD v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = IOIteratorNext(iterator);
  if ((_DWORD)v2)
  {
    v3 = v2;
    memset(v16, 0, sizeof(v16));
    MEMORY[0x2199F3618](v2, v16);
    v4 = (unsigned int *)MEMORY[0x24BDAEC58];
    v5 = IOServiceOpen(v3, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&gButtonServiceConnection);
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "void MatchingNotificationHandler(void *, io_iterator_t)";
        v14 = 1024;
        v15 = v6;
        _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s Unable to open user client err %d", buf, 0x12u);
      }
    }
    else if (!MEMORY[0x2199F35E8](gButtonServiceConnection, 0, *v4, &_sharedMemoryAddress, &_sharedMemorySize, 1))
    {
      _sharedMemoryPtr = _sharedMemoryAddress;
      output = -999;
      outputCnt = 1;
      v7 = IOConnectCallScalarMethod(gButtonServiceConnection, 1u, 0, 0, &output, &outputCnt);
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v13 = "void MatchingNotificationHandler(void *, io_iterator_t)";
          v14 = 1024;
          v15 = v8;
          _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to send GetNumberOfSupportedAssets err %d", buf, 0x12u);
        }
      }
      else
      {
        gNumberOfSlots = output;
      }
      gServiceAvailable = 1;
      dispatch_get_global_queue(17, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_async_f(v9, 0, (dispatch_function_t)serviceCameUp);

    }
  }
}

void serviceCameUp(void *a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[HAButtonHapticsLoader sharedInstance](HAButtonHapticsLoader, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HAButtonHapticsLoaderServiceIsAvailableNotification"), v1);

}

void sub_215E8DA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_215E8DD80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_215E8E8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);

  _Unwind_Resume(a1);
}

void sub_215E8EB40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215E8EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_215E8EC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_215E8ECF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_215E8ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void TuningPListMgr::TuningPListMgr(TuningPListMgr *this, const char *a2)
{
  const __CFAllocator *v3;
  uint64_t v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;

  *(_QWORD *)this = CFStringCreateWithCString(0, a2, 0x600u);
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 6) = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = 16;
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  do
  {
    *(_QWORD *)((char *)this + v4) = CFDictionaryCreateMutable(v3, 0, v5, v6);
    v4 += 8;
  }
  while (v4 != 48);
}

void sub_215E8EE34(_Unwind_Exception *a1)
{
  CACFString *v1;

  CACFString::~CACFString(v1);
  _Unwind_Resume(a1);
}

void CACFString::~CACFString(CACFString *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void applesauce::CF::TypeRefPair::~TypeRefPair(applesauce::CF::TypeRefPair *this)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)this)
    CFRelease(*(CFTypeRef *)this);
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  void *v6;
  void **v7;
  void **v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  void **v13;
  void **v14;
  void **v15;
  void *v16;
  void *v17;
  void **v18;
  void **v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  void **v24;
  void **v25;
  void **v26;
  void *v27;
  CFDictionaryRef v28;
  void *exception;
  void **values;
  void **v32;
  void **v33;
  void **keys;
  void **v35;
  void **v36;

  v2 = *(_QWORD *)(a1 + 8);
  keys = 0;
  v35 = 0;
  v36 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  v32 = 0;
  v33 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = *(void ***)a1;
    v5 = *(_QWORD *)a1 + 16 * v3;
    do
    {
      v6 = *v4;
      v7 = v35;
      if (v35 >= v36)
      {
        v9 = v35 - keys;
        if ((unint64_t)(v9 + 1) >> 61)
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
        v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1)
          v10 = v9 + 1;
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8)
          v11 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v11 = v10;
        if (v11)
          v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v36, v11);
        else
          v12 = 0;
        v13 = (void **)&v12[8 * v9];
        *v13 = v6;
        v8 = v13 + 1;
        v15 = keys;
        v14 = v35;
        if (v35 != keys)
        {
          do
          {
            v16 = *--v14;
            *--v13 = v16;
          }
          while (v14 != v15);
          v14 = keys;
        }
        keys = v13;
        v35 = v8;
        v36 = (void **)&v12[8 * v11];
        if (v14)
          operator delete(v14);
      }
      else
      {
        *v35 = v6;
        v8 = v7 + 1;
      }
      v35 = v8;
      v17 = v4[1];
      v18 = v32;
      if (v32 >= v33)
      {
        v20 = v32 - values;
        if ((unint64_t)(v20 + 1) >> 61)
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
        v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1)
          v21 = v20 + 1;
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8)
          v22 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v33, v22);
        else
          v23 = 0;
        v24 = (void **)&v23[8 * v20];
        *v24 = v17;
        v19 = v24 + 1;
        v26 = values;
        v25 = v32;
        if (v32 != values)
        {
          do
          {
            v27 = *--v25;
            *--v24 = v27;
          }
          while (v25 != v26);
          v25 = values;
        }
        values = v24;
        v32 = v19;
        v33 = (void **)&v23[8 * v22];
        if (v25)
          operator delete(v25);
      }
      else
      {
        *v32 = v17;
        v19 = v18 + 1;
      }
      v32 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  v28 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v28)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2199F3660](exception, "Could not construct");
  }
  if (values)
  {
    v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    v35 = keys;
    operator delete(keys);
  }
  return v28;
}

void sub_215E8F158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  void *v13;

  __cxa_free_exception(v13);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<void const*>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_215E8F294(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
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
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[31],int>(applesauce::CF::TypeRef *a1, char *a2, int *a3)
{
  CFNumberRef v5;
  void *exception;
  int valuePtr;

  applesauce::CF::TypeRef::TypeRef(a1, a2);
  valuePtr = *a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *((_QWORD *)a1 + 1) = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2199F3660](exception, "Could not construct");
  }
  return a1;
}

void sub_215E8F3B4(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRef::TypeRef(applesauce::CF::TypeRef *this, char *a2)
{
  void **v3;
  CFIndex v4;
  CFStringRef v5;
  void *exception;
  void *__p[2];
  unsigned __int8 v9;

  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  if ((v9 & 0x80u) == 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if ((v9 & 0x80u) == 0)
    v4 = v9;
  else
    v4 = (CFIndex)__p[1];
  v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *(_QWORD *)this = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2199F3660](exception, "Could not construct");
  }
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return this;
}

void sub_215E8F4A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  CFTypeRef *v15;

  if (*v15)
    CFRelease(*v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[16],applesauce::CF::DictionaryRef &>(applesauce::CF::TypeRef *a1, char *a2, const void **a3)
{
  const void *v5;

  applesauce::CF::TypeRef::TypeRef(a1, a2);
  v5 = *a3;
  if (v5)
    CFRetain(v5);
  *((_QWORD *)a1 + 1) = v5;
  return a1;
}

void CFDictionaryReleaser::~CFDictionaryReleaser(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  const void *v3;
  BOOL v5;
  int v6;
  BOOL v7;

  v3 = *(const void **)a2;
  if (*(_QWORD *)a2 != *(_QWORD *)a1)
  {
    if (*(_QWORD *)a1)
      v5 = *(_BYTE *)(a1 + 8) == 0;
    else
      v5 = 1;
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      v3 = *(const void **)a2;
    }
    *(_QWORD *)a1 = v3;
    v6 = *(unsigned __int8 *)(a2 + 8);
    *(_BYTE *)(a1 + 8) = v6;
    if (v6)
      v7 = v3 == 0;
    else
      v7 = 1;
    if (!v7)
      CFRetain(v3);
  }
  return a1;
}

uint64_t PListLogger::log(PListLogger *this, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return vdprintf(*(_DWORD *)this, a2, va);
}

void TuningPListMgr::~TuningPListMgr(TuningPListMgr *this)
{
  uint64_t i;
  const void *v3;
  int *v4;

  for (i = 16; i != 48; i += 8)
  {
    v3 = *(const void **)((char *)this + i);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)((char *)this + i) = 0;
    }
  }
  v4 = (int *)*((_QWORD *)this + 6);
  if (v4)
  {
    if (*v4 != -1)
    {
      PListLogger::log(*((PListLogger **)this + 6), "*** done.\n");
      close(*v4);
      *v4 = -1;
    }
    MEMORY[0x2199F36A8](v4, 0x1000C4005A209FELL);
  }
  CACFString::~CACFString(this);
}

os_log_t std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.coreaudio.utility", "TPLM");
  *v0 = result;
  logSubsystem(void)::scope = (uint64_t)v0;
  return result;
}

uint64_t TuningPListMgr::loadTuningInSubdirs_(uint64_t a1, const __CFString ***a2, unsigned int a3, int a4)
{
  const __CFString *v8;
  __CFString *MutableCopy;
  const __CFString *v10;
  uint64_t v11;
  CFStringRef **v12;
  uint64_t v13;
  const __CFAllocator *v14;
  CFIndex v15;
  const __CFString *v16;
  const __CFString *v17;
  CFMutableStringRef Mutable;
  const __CFURL *v19;
  __CFReadStream *v20;
  const __CFDictionary *v21;
  const void **v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFString *v28;
  CFIndex Count;
  const __CFString *Value;
  CFTypeID TypeID;
  CFIndex v32;
  const void **v33;
  const void **v34;
  uint64_t i;
  const __CFDictionary *v36;
  CFTypeID v37;
  const __CFString *v38;
  CFTypeID v39;
  uint64_t v40;
  const __CFString **v41;
  __CFDictionary *v42;
  void *v43;
  char *v44;
  CFDictionaryRef *v46;
  CFMutableStringRef v47;
  CFMutableStringRef theString;
  uint64_t v50;
  __CFDictionary *v51;

  if (a3 && (v8 = **a2) != 0 && CFStringHasPrefix(v8, CFSTR("/")))
  {
    v50 = 1;
    MutableCopy = CFStringCreateMutableCopy(0, 0, &stru_24D4AFB30);
    theString = MutableCopy;
  }
  else
  {
    v10 = *(const __CFString **)a1;
    v50 = 1;
    MutableCopy = CFStringCreateMutableCopy(0, 0, v10);
    theString = MutableCopy;
    if (!a3)
      goto LABEL_12;
  }
  v11 = a3 - 1;
  v12 = a2;
  if (!MutableCopy)
    goto LABEL_9;
LABEL_7:
  CFStringAppend(MutableCopy, CFSTR("/"));
  if (theString)
    CFStringAppend(theString, **v12);
LABEL_9:
  while (v11)
  {
    MutableCopy = theString;
    --v11;
    ++v12;
    if (theString)
      goto LABEL_7;
  }
LABEL_12:
  if (a4 <= 4)
    v13 = a4;
  else
    v13 = 0;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = strlen(TuningPListMgr::kTuningFileTypeSuffixMap[v13]);
  v16 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)TuningPListMgr::kTuningFileTypeSuffixMap[v13], v15, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (theString)
  {
    v17 = theString;
    if (!CFStringHasSuffix(theString, v16))
    {
      CFStringAppend(theString, v16);
      v17 = theString;
    }
  }
  else
  {
    v17 = 0;
  }
  Mutable = CFStringCreateMutable(v14, 512);
  v19 = CFURLCreateWithFileSystemPath(v14, v17, kCFURLPOSIXPathStyle, 0);
  if (v19
    && (v20 = CFReadStreamCreateWithFile(v14, v19), CFRelease(v19), v20)
    && (CFReadStreamOpen(v20),
        v21 = (const __CFDictionary *)CFPropertyListCreateWithStream(v14, v20, 0, 0, 0, 0),
        CFReadStreamClose(v20),
        CFRelease(v20),
        v21))
  {
    CFRelease(Mutable);
    v22 = (const void **)a2[a3 - 1];
    v23 = *v22;
    if ((_DWORD)v13)
    {
      v47 = (CFMutableStringRef)*v22;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v47 = theString;
      v51 = 0;
      do
      {
        v28 = kLegacyStripNameKeys[v25];
        if (!CFDictionaryContainsKey(v21, v28))
        {
          if (!v27)
          {
            Count = CFDictionaryGetCount(v21);
            v26 = CFDictionaryCreateMutableCopy(v14, Count + 2, v21);
            v51 = v26;
          }
          CFDictionaryAddValue(v26, v28, v23);
          v27 = v26;
        }
        ++v25;
      }
      while (v25 != 2);
      if (v26)
        CFRelease(v21);
      else
        v26 = v21;
      v21 = v26;
    }
    Value = (const __CFString *)CFDictionaryGetValue(v21, CFSTR("name"));
    if (Value)
    {
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(Value))
      {
        v46 = (CFDictionaryRef *)(a1 + 8 * v13 + 16);
        v32 = CFDictionaryGetCount(*v46);
        if (v32 >= 1)
        {
          v33 = (const void **)operator new[]();
          v34 = (const void **)operator new[]();
          CFDictionaryGetKeysAndValues(*v46, v33, v34);
          for (i = 0; v32 != i; ++i)
          {
            if (!v33[i])
              break;
            v36 = (const __CFDictionary *)v34[i];
            if (!v36)
              break;
            v37 = CFDictionaryGetTypeID();
            if (v37 == CFGetTypeID(v36))
            {
              v38 = (const __CFString *)CFDictionaryGetValue(v36, CFSTR("name"));
              if (v38)
              {
                v39 = CFStringGetTypeID();
                if (v39 == CFGetTypeID(v38) && CFStringCompare(v38, Value, 0) == kCFCompareEqualTo)
                {
                  CFDictionaryRemoveValue(*v46, v33[i]);
                  break;
                }
              }
            }
          }
          MEMORY[0x2199F3690](v33, 0xC0C80B8AA526DLL);
          MEMORY[0x2199F3690](v34, 0xC0C80B8AA526DLL);
        }
      }
    }
    v40 = a1 + 8 * v13;
    v42 = *(__CFDictionary **)(v40 + 16);
    v41 = (const __CFString **)(v40 + 16);
    CFDictionarySetValue(v42, v47, v21);
    v44 = *(char **)(a1 + 48);
    if (v44)
      PListLogger::logItemEntry(*v41, "@@ Strips Aug  3 2024 07:31:34", v44, v43);
    v24 = 0;
    if (v16)
      goto LABEL_53;
  }
  else
  {
    if (Mutable)
    {
      CFStringAppend(Mutable, CFSTR("Error loading plist file "));
      CFStringAppend(Mutable, v17);
      CFStringAppend(Mutable, CFSTR("\n"));
    }
    CFRelease(Mutable);
    v21 = 0;
    v24 = 0xFFFFFFFFLL;
    if (v16)
LABEL_53:
      CFRelease(v16);
  }
  if (v21)
    CFRelease(v21);
  CACFMutableString::~CACFMutableString((CACFMutableString *)&theString);
  return v24;
}

void sub_215E8FC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef((const void **)va1);
  CACFMutableString::~CACFMutableString((CACFMutableString *)va);
  _Unwind_Resume(a1);
}

void CACFMutableString::~CACFMutableString(CACFMutableString *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

void PListLogger::logItemEntry(const __CFString *this, const char *a2, char *a3, void *a4)
{
  CFTypeID v7;
  int v8;
  size_t v9;
  CFNumberType Type;
  int v11;
  size_t v12;
  int v13;
  size_t v14;
  int v15;
  int Count;
  CFIndex v17;
  int v18;
  size_t v19;
  int v20;
  int v21;
  CFIndex i;
  PListLogger *ValueAtIndex;
  void *v24;
  int v25;
  size_t v26;
  int v27;
  size_t v28;
  CFIndex v29;
  __int128 valuePtr;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = CFGetTypeID(this);
  if (CFStringGetTypeID() == v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    valuePtr = 0u;
    v31 = 0u;
    v8 = *((_DWORD *)a3 + 1);
    if (v8 >= 127)
      v9 = 127;
    else
      v9 = v8;
    if ((_DWORD)v9)
      memset((char *)&valuePtr + (int)v9 - (v9 - 1) - 1, 32, v9);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    CFGetRetainCount(this);
    CFStringGetCStringPtr(this, 0);
    PListLogger::log((PListLogger *)a3, "'%s' | String{%d} | \"%s\"\n");
  }
  else if (CFNumberGetTypeID() == v7)
  {
    Type = CFNumberGetType((CFNumberRef)this);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    valuePtr = 0u;
    v31 = 0u;
    v11 = *((_DWORD *)a3 + 1);
    if (v11 >= 127)
      v12 = 127;
    else
      v12 = v11;
    if ((_DWORD)v12)
      memset((char *)&valuePtr + (int)v12 - (v12 - 1) - 1, 32, v12);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    if ((unint64_t)Type <= kCFNumberDoubleType)
    {
      if (((1 << Type) & 0x3060) != 0)
      {
        *(_QWORD *)&valuePtr = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(float){%d} | %f\n");
        return;
      }
      if (((1 << Type) & 0x82) != 0)
      {
        LOBYTE(valuePtr) = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt8){%d} | 0x%02x\n");
        return;
      }
      if (((1 << Type) & 0x104) != 0)
      {
        LOWORD(valuePtr) = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt16){%d} | 0x%04x\n");
        return;
      }
    }
    LODWORD(valuePtr) = 0;
    CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
    v29 = CFGetRetainCount(this);
    PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt32){%d} | %-6d 0x%08x %c%c%c%c\n", a2, v29);
  }
  else if (CFDictionaryGetTypeID() == v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    valuePtr = 0u;
    v31 = 0u;
    v13 = *((_DWORD *)a3 + 1);
    if (v13 >= 127)
      v14 = 127;
    else
      v14 = v13;
    if ((_DWORD)v14)
      memset((char *)&valuePtr + (int)v14 - (v14 - 1) - 1, 32, v14);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    v15 = CFGetRetainCount(this);
    Count = CFDictionaryGetCount((CFDictionaryRef)this);
    PListLogger::log((PListLogger *)a3, "'%s' | Dictionary{%d} | %d key/value pairs\n", a2, v15, Count);
    if (!strcmp("aupreset", a2))
      a3[8] = 1;
    *((_DWORD *)a3 + 1) += 4;
    CFDictionaryApplyFunction((CFDictionaryRef)this, (CFDictionaryApplierFunction)PListLogger::logDictEntry, a3);
    *((_DWORD *)a3 + 1) -= 4;
    a3[8] = 0;
  }
  else if (CFArrayGetTypeID() == v7)
  {
    v17 = CFArrayGetCount((CFArrayRef)this);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    valuePtr = 0u;
    v31 = 0u;
    v18 = *((_DWORD *)a3 + 1);
    if (v18 >= 127)
      v19 = 127;
    else
      v19 = v18;
    if ((_DWORD)v19)
      memset((char *)&valuePtr + (int)v19 - (v19 - 1) - 1, 32, v19);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    v20 = CFGetRetainCount(this);
    PListLogger::log((PListLogger *)a3, "'%s' | Array{%d} | %d ordered objects\n", a2, v20, v17);
    v21 = *((_DWORD *)a3 + 1);
    *((_DWORD *)a3 + 1) = v21 + 4;
    if (v17 >= 1)
    {
      for (i = 0; i != v17; ++i)
      {
        ValueAtIndex = (PListLogger *)CFArrayGetValueAtIndex((CFArrayRef)this, i);
        valuePtr = 0uLL;
        snprintf((char *)&valuePtr, 0x10uLL, "[%u]", i);
        PListLogger::logItemEntry(ValueAtIndex, &valuePtr, a3, v24);
      }
      v21 = *((_DWORD *)a3 + 1) - 4;
    }
    *((_DWORD *)a3 + 1) = v21;
  }
  else if (CFDataGetTypeID() == v7)
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    valuePtr = 0uLL;
    v31 = 0uLL;
    v25 = *((_DWORD *)a3 + 1);
    if (v25 >= 127)
      v26 = 127;
    else
      v26 = v25;
    if ((_DWORD)v26)
      memset((char *)&valuePtr + (int)v26 - (v26 - 1) - 1, 32, v26);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    CFGetRetainCount(this);
    CFDataGetLength((CFDataRef)this);
    PListLogger::log((PListLogger *)a3, "'%s' | %sData{%d} | %d bytes\n");
  }
  else
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    valuePtr = 0uLL;
    v31 = 0uLL;
    v27 = *((_DWORD *)a3 + 1);
    if (v27 >= 127)
      v28 = 127;
    else
      v28 = v27;
    if ((_DWORD)v28)
      memset((char *)&valuePtr + (int)v28 - (v28 - 1) - 1, 32, v28);
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    PListLogger::log((PListLogger *)a3, "'%s' | <unknown type id: %d)>\n");
  }
}

uint64_t PListLogger::logDictEntry(const __CFString *this, PListLogger *a2, const char *a3, void *a4)
{
  const char *CStringPtr;
  void *v7;

  CStringPtr = CFStringGetCStringPtr(this, 0);
  return PListLogger::logItemEntry(a2, CStringPtr, a3, v7);
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

NSObject *TuningPListMgr::getAUPListByName(TuningPListMgr *this, const char *a2)
{
  CFStringRef v3;
  CFStringRef v4;
  NSObject *Value;
  NSObject *v6;
  CFTypeID TypeID;
  unint64_t v8;
  char v10;
  _BYTE *v11;
  _BYTE buf[12];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!*((_QWORD *)this + 4))
    return 0;
  v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v3)
    return 0;
  v4 = v3;
  Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 4), v3);
  if (!Value || (v6 = Value, TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(v6)))
  {
    CFRelease(v4);
    v8 = atomic_load(&logSubsystem(void)::onceflag);
    if (v8 != -1)
    {
      *(_QWORD *)buf = &v10;
      v11 = buf;
      std::__call_once(&logSubsystem(void)::onceflag, &v11, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>);
    }
    if (logSubsystem(void)::scope)
    {
      v6 = *(NSObject **)logSubsystem(void)::scope;
      if (!*(_QWORD *)logSubsystem(void)::scope)
        return v6;
    }
    else
    {
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "TuningPListMgr.cpp";
      v13 = 1024;
      v14 = 435;
      _os_log_impl(&dword_215E8C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d return dictionary is null", buf, 0x12u);
    }
    return 0;
  }
  CFRelease(v4);
  return v6;
}

CFMutableStringRef PlatformUtilities::CopyHardwareModelShortName(PlatformUtilities *this)
{
  const __CFAllocator *v1;
  CFMutableStringRef Mutable;
  __CFString *v3;
  CFMutableStringRef MutableCopy;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  CFIndex Length;
  size_t v10;
  char v11;
  char cStr[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!Mutable)
    return 0;
  v3 = Mutable;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)cStr = 0u;
  v13 = 0u;
  v10 = 64;
  sysctlbyname("hw.model", cStr, &v10, 0, 0);
  CFStringAppendCString(v3, cStr, 0);
  MutableCopy = CFStringCreateMutableCopy(v1, 0, v3);
  CFRelease(v3);
  if (MutableCopy)
  {
    v5 = CFSTR("AP");
    if (CFStringHasSuffix(MutableCopy, CFSTR("AP"))
      || (v5 = CFSTR("DEV"), CFStringHasSuffix(MutableCopy, CFSTR("DEV")))
      || (v5 = CFSTR("ap"), CFStringHasSuffix(MutableCopy, CFSTR("ap")))
      || (v5 = CFSTR("dev"), CFStringHasSuffix(MutableCopy, CFSTR("dev"))))
    {
      CFStringTrim(MutableCopy, v5);
    }
    *(_QWORD *)cStr = 0;
    *(_QWORD *)&cStr[8] = 1;
    v6 = MGGetProductType();
    if (v6 == 952317141)
    {
      v10 = (size_t)CFStringCreateWithCString(0, "u", 0x600u);
      v11 = 1;
      CACFString::operator=((uint64_t)cStr, (uint64_t)&v10);
    }
    else
    {
      if (v6 != 2081274472 && v6 != 2468178735)
        goto LABEL_16;
      v10 = (size_t)CFStringCreateWithCString(0, "m", 0x600u);
      v11 = 1;
      CACFString::operator=((uint64_t)cStr, (uint64_t)&v10);
    }
    CACFString::~CACFString((CACFString *)&v10);
LABEL_16:
    v7 = *(const __CFString **)cStr;
    if (*(_QWORD *)cStr && CFStringHasSuffix(MutableCopy, *(CFStringRef *)cStr))
    {
      Length = CFStringGetLength(MutableCopy);
      v17.length = CFStringGetLength(v7);
      v17.location = Length - v17.length;
      CFStringFindAndReplace(MutableCopy, v7, &stru_24D4AFB30, v17, 1uLL);
    }
    CACFString::~CACFString((CACFString *)cStr);
  }
  return MutableCopy;
}

void sub_215E90760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  CACFString::~CACFString((CACFString *)&a9);
  CACFString::~CACFString((CACFString *)&a11);
  _Unwind_Resume(a1);
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x24BDB6830](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6850](inAudioFile, *(_QWORD *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x24BDB6880](inFileRef, inPermissions, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadBytes(AudioFileID inAudioFile, Boolean inUseCache, SInt64 inStartingByte, UInt32 *ioNumBytes, void *outBuffer)
{
  return MEMORY[0x24BDB6890](inAudioFile, inUseCache, inStartingByte, ioNumBytes, outBuffer);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
  MEMORY[0x24BDBC738](theString, trimString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24D4AF490();
}

void operator delete(void *__p)
{
  off_24D4AF498(__p);
}

uint64_t operator delete()
{
  return off_24D4AF4A0();
}

uint64_t operator new[]()
{
  return off_24D4AF4A8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D4AF4B0(__sz);
}

uint64_t operator new()
{
  return off_24D4AF4B8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0368](*(_QWORD *)&a1, a2, a3);
}

