void sub_236D441D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D44284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)ASDTIOA2BlockControl;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_236D443D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D44618(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  std::mutex *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  std::mutex::unlock(v3);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_236D44838(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D44A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  std::mutex *v4;
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  std::mutex::unlock(v4);
  _Unwind_Resume(a1);
}

void sub_236D44BB8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236D44DCC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

ASDT::IOA2UserClient *ASDT::IOA2UserClient::IOA2UserClient(ASDT::IOA2UserClient *this)
{
  ASDT::IOUserClient *v2;

  v2 = (ASDT::IOUserClient *)ASDT::IOUserClient::IOUserClient(this);
  *(_QWORD *)v2 = &unk_25084B368;
  if ((ASDT::IOUserClient::ConformsTo(v2, "IOAudio2Device") & 1) == 0)
  {
    ASDT::IOUserClient::operator=();
  }
  return this;
}

void sub_236D44E54(_Unwind_Exception *a1)
{
  ASDT::IOUserClient *v1;

  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::LogBadDevice(_anonymous_namespace_ *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  IOObjectGetClass((io_object_t)this, (char *)v8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
}

uint64_t ASDT::IOA2UserClient::operator=(uint64_t a1, _anonymous_namespace_ *object)
{
  if ((_DWORD)object && !IOObjectConformsTo((io_object_t)object, "IOAudio2Device"))
  ASDT::IOUserClient::operator=();
  return a1;
}

_QWORD *ASDT::IOA2UserClient::IOA2UserClient(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  _QWORD *result;

  result = (_QWORD *)ASDT::IOUserClient::IOUserClient(this, a2);
  *result = &unk_25084B368;
  return result;
}

{
  _QWORD *result;

  result = (_QWORD *)ASDT::IOUserClient::IOUserClient(this, a2);
  *result = &unk_25084B368;
  return result;
}

void ASDT::IOA2UserClient::CopyDeviceUID(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("device UID"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

{
  applesauce::CF::TypeRef *v4;
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("device UID"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (uint64_t)&cf, a2, v4);
  if (cf)
    CFRelease(cf);
}

void sub_236D44FE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  applesauce::CF::StringRef *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D45068(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::make_StringRef@<X0>(CFStringRef format@<X0>, applesauce::CF::StringRef *a2@<X8>, ...)
{
  CFStringRef v4;
  applesauce::CF *exception;
  va_list va;

  va_start(va, a2);
  v4 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (!v4)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return applesauce::CF::StringRef::StringRef(a2, v4);
}

void sub_236D450E0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D450F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void ASDT::IOA2UserClient::CopyDeviceName(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("device name"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D45198(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyDeviceManufacturer(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("device manufacturer"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D45218(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetTransportType(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned int v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("transport type"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D45298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<unsigned int>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  unsigned int *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D4530C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetClockDomain(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned int v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("clock domain"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D4537C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetLatency(ASDT::IOA2UserClient *this, int a2)
{
  const __CFString *v3;
  uint64_t v4;
  CFTypeRef cf;
  unsigned int v7;

  v7 = 0;
  if (a2)
    v3 = CFSTR("input latency");
  else
    v3 = CFSTR("output latency");
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  v4 = v7;
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D45400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetRingBufferSize(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned int v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("io buffer frame size"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D45470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetSafetyOffset(ASDT::IOA2UserClient *this, int a2)
{
  const __CFString *v3;
  uint64_t v4;
  CFTypeRef cf;
  unsigned int v7;

  v7 = 0;
  if (a2)
    v3 = CFSTR("input safety offset");
  else
    v3 = CFSTR("output safety offset");
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  v4 = v7;
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D454F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::SupportsPreWarming(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned __int8 v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("supports prewarming"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D45564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<BOOL>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  BOOL *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D455D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetNominalSampleRate(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  ASDT::IOAudio2::Helpers *v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("sample rate"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<long long>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return ASDT::IOAudio2::Helpers::Float64FromFixed64(v4);
}

void sub_236D4564C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<long long>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  uint64_t *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D456C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetNominalSampleRate(ASDT::IOA2UserClient *this, double a2)
{
  int v3;
  uint64_t v5;

  v5 = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a2);
  v3 = ASDT::IOUserClient::CallMethod(this, 4, 0, 0, &v5, 8, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::SetNominalSampleRate();
  return v3 == 0;
}

uint64_t ASDT::IOA2UserClient::IsRunning(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned __int8 v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("is running"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D457BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyDefaultChannelLayout(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, const applesauce::CF::TypeRef *a3@<X8>)
{
  const __CFString *v5;
  CFTypeRef cf;

  if (a2)
    v5 = CFSTR("input channel layout");
  else
    v5 = CFSTR("output channel layout");
  applesauce::CF::make_StringRef(v5, (applesauce::CF::StringRef *)&cf);
  *(_QWORD *)a3 = 0;
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a3);
  if (cf)
    CFRelease(cf);
}

void sub_236D4583C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  const void **v10;

  applesauce::CF::ArrayRef::~ArrayRef(v10);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  applesauce::CF::ArrayRef *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D458B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void ASDT::IOA2UserClient::CopyDefaultChannelLayoutData(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DataRef *a3@<X8>)
{
  unsigned int Count;
  unsigned int v5;
  unsigned int v6;
  std::vector<char>::pointer begin;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  CFDataRef v15;
  void *v16;
  void *v17;
  void *exception;
  std::logic_error *v19;
  std::logic_error *v20;
  void *v21;
  CFTypeRef cf;
  std::vector<char>::value_type __x[8];
  std::vector<char> v24;
  CFArrayRef theArray;
  int valuePtr;

  ASDT::IOA2UserClient::CopyDefaultChannelLayout(this, a2, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    v5 = Count;
    if (Count <= 1)
      v6 = 1;
    else
      v6 = Count;
    __x[0] = 0;
    std::vector<char>::vector(&v24, 20 * v6 + 12, __x);
    begin = v24.__begin_;
    *(_QWORD *)v24.__begin_ = 0;
    *((_DWORD *)begin + 2) = v5;
    v8 = (char *)(v24.__end_ - begin);
    if ((v24.__end_ - begin - 12) / 0x14uLL < v5)
      __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
    if (v5)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        if (!theArray)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        valuePtr = -1;
        cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        if (!cf)
        {
          v17 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](v17, "Could not construct");
          __cxa_throw(v17, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::at_or<applesauce::CF::NumberRef>(theArray, v10, &cf, __x);
        if (!*(_QWORD *)__x)
        {
          v16 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](v16, "Could not construct");
          __cxa_throw(v16, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        v11 = applesauce::CF::convert_to<unsigned int,0>(*(const __CFNumber **)__x);
        v12 = *((unsigned int *)v24.__begin_ + 2);
        if (v12 > (v24.__end_ - v24.__begin_ - 12) / 0x14uLL)
          __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
        if (v10 >= v12)
        {
          v19 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v19, "accessing a CA::ChannelLayout with an out-of-range index");
          v19->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
          __cxa_throw(v19, (struct type_info *)off_25084AF38, MEMORY[0x24BEDAB00]);
        }
        *(_DWORD *)&v24.__begin_[v9 + 12] = v11;
        if (*(_QWORD *)__x)
          CFRelease(*(CFTypeRef *)__x);
        if (cf)
          CFRelease(cf);
        begin = v24.__begin_;
        v13 = *((unsigned int *)v24.__begin_ + 2);
        v8 = (char *)(v24.__end_ - v24.__begin_);
        if (v13 > (v24.__end_ - v24.__begin_ - 12) / 0x14uLL)
          __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
        if (v10 >= v13)
        {
          v20 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v20, "accessing a CA::ChannelLayout with an out-of-range index");
          v20->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
          __cxa_throw(v20, (struct type_info *)off_25084AF38, MEMORY[0x24BEDAB00]);
        }
        ++v10;
        v14 = &v24.__begin_[v9];
        *((_QWORD *)v14 + 2) = 0;
        *((_QWORD *)v14 + 3) = 0;
        v9 += 20;
      }
      while (v10 < v13);
    }
    v15 = CFDataCreate(0, (const UInt8 *)begin, (CFIndex)v8);
    if (!v15)
    {
      v21 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](v21, "Could not construct");
      __cxa_throw(v21, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    applesauce::CF::DataRef::DataRef(a3, v15);
    if (v24.__begin_)
    {
      v24.__end_ = v24.__begin_;
      operator delete(v24.__begin_);
    }
    if (theArray)
      CFRelease(theArray);
  }
  else
  {
    *(_QWORD *)a3 = 0;
  }
}

void sub_236D45C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf, char a11, void *__p, uint64_t a13, uint64_t a14, const void *a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (__p)
    operator delete(__p);
  applesauce::CF::ArrayRef::~ArrayRef(&a15);
  _Unwind_Resume(a1);
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ASDT::IOA2UserClient::WantsDoIOTrapCall(ASDT::IOA2UserClient *this, int a2)
{
  const __CFString *v3;
  int v4;
  unsigned __int8 v6;
  CFTypeRef cf;

  if (a2)
    v3 = CFSTR("wants input trap");
  else
    v3 = CFSTR("wants output trap");
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  v6 = 0;
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  v4 = v6;
  if (cf)
    CFRelease(cf);
  return v4 != 0;
}

void sub_236D45DE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetHogModeOwner(ASDT::IOA2UserClient *this)
{
  int v2;
  CFTypeRef v4;
  CFTypeRef cf[2];
  char v6;
  unsigned int v7;

  v7 = -1;
  applesauce::CF::make_StringRef(CFSTR("exclusive access owner"), (applesauce::CF::StringRef *)cf);
  v2 = ASDT::IOUserClient::CopyProperty<int>(this, (const applesauce::CF::StringRef *)cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf[0])
    CFRelease(cf[0]);
  if (v2)
  {
    caulk::platform::process_name((caulk::platform *)v7);
    if (v6 < 0)
    {
      v4 = cf[1];
      operator delete((void *)cf[0]);
      if (v4)
        return v7;
      goto LABEL_6;
    }
    if (!v6)
    {
LABEL_6:
      v7 = -1;
      ASDT::IOA2UserClient::SetHogModeOwner(this);
    }
  }
  return v7;
}

void sub_236D45E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<int>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  int *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D45F0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::SetHogModeOwner(ASDT::IOA2UserClient *this)
{
  uint64_t v2;
  CFTypeRef cf;

  applesauce::CF::make_StringRef(CFSTR("exclusive access owner"), (applesauce::CF::StringRef *)&cf);
  v2 = ASDT::IOUserClient::SetProperty(this, (const applesauce::CF::StringRef *)&cf);
  if (cf)
    CFRelease(cf);
  return v2;
}

void sub_236D45F80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyHeadsetInfo(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("headset info"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D45FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  applesauce::CF::DictionaryRef *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D46074(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyCustomPropertyInfo(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("custom property info"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D460E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::SupportsClientDescription(ASDT::IOA2UserClient *this)
{
  CFTypeRef cf;
  unsigned __int8 v4;

  v4 = 0;
  applesauce::CF::make_StringRef(CFSTR("supports client description"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D46164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetClientDescription(ASDT::IOA2UserClient *this, unint64_t a2, double a3)
{
  int v4;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a3);
  v4 = ASDT::IOUserClient::CallMethod(this, 12, v6, 2, 0, 0, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::SetClientDescription();
  return v4 == 0;
}

void sub_236D46288(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  applesauce::CF::StringRef *v5;
  uint64_t v6;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4) & 1) != 0)
    v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  else
    v6 = 0;
  if (cf)
    CFRelease(cf);
  return v6;
}

void sub_236D4630C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::IsPrivate(ASDT::IOA2UserClient *this)
{
  applesauce::CF::TypeRef *v2;
  CFTypeRef cf;
  unsigned __int8 v5;

  v5 = 0;
  applesauce::CF::make_StringRef(CFSTR("is private"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (uint64_t)&cf, (const applesauce::CF::TypeRef *)&v5, v2);
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D4637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<BOOL>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  BOOL *v5;
  uint64_t v6;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4) & 1) != 0)
    v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  else
    v6 = 0;
  if (cf)
    CFRelease(cf);
  return v6;
}

void sub_236D463F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyStreamList(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, const applesauce::CF::TypeRef *a3@<X8>)
{
  const __CFString *v5;
  CFTypeRef cf;

  *(_QWORD *)a3 = 0;
  if (a2)
    v5 = CFSTR("input streams");
  else
    v5 = CFSTR("output streams");
  applesauce::CF::make_StringRef(v5, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a3);
  if (cf)
    CFRelease(cf);
}

void sub_236D46470(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

CFIndex ASDT::IOA2UserClient::GetNumberStreams(ASDT::IOA2UserClient *this, int a2)
{
  CFIndex Count;
  CFArrayRef theArray;

  ASDT::IOA2UserClient::CopyStreamList(this, a2, (const applesauce::CF::TypeRef *)&theArray);
  if (!theArray)
    return 0;
  Count = CFArrayGetCount(theArray);
  if (theArray)
    CFRelease(theArray);
  return Count;
}

void ASDT::IOA2UserClient::CopyStreamDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, unsigned int a3@<W2>, _QWORD *a4@<X8>)
{
  CFTypeRef v6;
  CFTypeRef cf;
  char v8;
  CFTypeRef v9;
  uint64_t v10;

  v10 = 0;
  ASDT::IOA2UserClient::CopyStreamList(this, a2, (const applesauce::CF::TypeRef *)&v9);
  if (v9)
  {
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>((const __CFArray *)v9, a3, &cf);
    if (v8)
    {
      v6 = cf;
      if (cf)
        CFRetain(cf);
      *a4 = v6;
    }
    else
    {
      *a4 = 0;
      v10 = 0;
    }
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
    if (v9)
      CFRelease(v9);
  }
  else
  {
    *a4 = 0;
  }
}

void sub_236D46580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyStreamDictionaryByID(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  CFTypeRef v6;
  CFArrayRef v7;
  CFTypeRef cf;
  unsigned int v9;
  CFTypeRef v10;

  v10 = 0;
  v9 = 0;
  ASDT::IOA2UserClient::CopyStreamList(this, 1, (const applesauce::CF::TypeRef *)&v7);
  CopyStreamDictionaryByIDFromList(&v7, &v9, a2, (applesauce::CF::DictionaryRef *)&cf);
  v6 = cf;
  v10 = cf;
  cf = 0;
  if (v7)
    CFRelease(v7);
  if (v6)
  {
    *(_QWORD *)a3 = v6;
  }
  else
  {
    ASDT::IOA2UserClient::CopyStreamList(this, 0, (const applesauce::CF::TypeRef *)&cf);
    CopyStreamDictionaryByIDFromList((CFArrayRef *)&cf, &v9, a2, a3);
    if (cf)
      CFRelease(cf);
  }
}

void sub_236D46644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  v5 = va_arg(va1, _QWORD);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

const __CFArray *CopyStreamDictionaryByIDFromList@<X0>(CFArrayRef *a1@<X0>, unsigned int *a2@<X2>, int a3@<W1>, applesauce::CF::DictionaryRef *a4@<X8>)
{
  const __CFArray *result;
  unsigned int v9;
  const __CFArray *v10;
  CFTypeID v13;
  BOOL v14;
  uint64_t v15;
  void *exception;
  void *v17;
  CFTypeRef v18;
  CFTypeRef cf;
  char v20;
  const __CFArray *v21;
  const __CFArray *v22;
  CFIndex Count;
  uint64_t v24;

  v24 = 0;
  *a2 = -1;
  result = *a1;
  if (result)
  {
    v21 = result;
    v22 = 0;
    v9 = 0;
    Count = CFArrayGetCount(result);
    while (1)
    {
      v10 = *a1;
      result = *a1 ? (const __CFArray *)CFArrayGetCount(*a1) : 0;
      if (!v21 || v22 == (const __CFArray *)Count)
        break;
      if (v21 == v10 && v22 == result)
        break;
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v21, &cf);
      v14 = 0;
      if (cf)
      {
        v13 = CFGetTypeID(cf);
        if (v13 == CFDictionaryGetTypeID())
          v14 = 1;
      }
      if (cf)
        CFRelease(cf);
      if (v14)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v21, (unint64_t)v22, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a4);
        if (cf)
          CFRelease(cf);
        if (!*(_QWORD *)a4)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::make_StringRef(CFSTR("stream ID"), (applesauce::CF::StringRef *)&v18);
        applesauce::CF::details::find_at_key_or_optional<applesauce::CF::NumberRef,applesauce::CF::StringRef>(*(const __CFDictionary **)a4, &v18, &cf);
        if (v18)
          CFRelease(v18);
        if (v20)
        {
          if (!cf)
          {
            v17 = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x23B802BE8](v17, "Could not construct");
            __cxa_throw(v17, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          v15 = applesauce::CF::convert_as<unsigned int,0>((const __CFNumber *)cf);
          if ((v15 & 0xFF00000000) != 0 && (_DWORD)v15 == a3)
          {
            *a2 = v9;
            return (const __CFArray *)std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
          }
        }
        std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
        if (*(_QWORD *)a4)
          CFRelease(*(CFTypeRef *)a4);
      }
      v22 = (const __CFArray *)((char *)v22 + 1);
      ++v9;
    }
  }
  *(_QWORD *)a4 = 0;
  return result;
}

void sub_236D4688C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  const void **v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::DictionaryRef::~DictionaryRef(v3);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_ID(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  CFTypeRef cf;
  const __CFDictionary **v7;

  if (!*this)
    return 0;
  v7 = this;
  applesauce::CF::make_StringRef(CFSTR("stream ID"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v7, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) == 0)
    return 0;
  *(_DWORD *)a2 = (_DWORD)v4;
  return 1;
}

_QWORD *applesauce::CF::DictionaryRef::operator->(_QWORD *result)
{
  applesauce::CF *exception;

  if (!*result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_236D469C0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D469D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const __CFDictionary *applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(const __CFDictionary ***a1, const void **a2)
{
  const __CFDictionary *result;

  result = applesauce::CF::details::at_key<applesauce::CF::StringRef>(**a1, a2);
  if (result)
    return (const __CFDictionary *)applesauce::CF::convert_as<unsigned int,0>(result);
  return result;
}

void ASDT::IOA2UserClient::ConstructDictionaryFromASBD(ASDT::IOA2UserClient *this@<X0>, CFDictionaryRef *a2@<X8>)
{
  const void *v5;
  int v6;
  int v7;
  int v8;
  void *exception;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFTypeRef cf;
  CFTypeRef v18;
  uint64_t *v19;
  _QWORD *v20[2];
  CFTypeRef valuePtr;

  v20[0] = 0;
  v20[1] = 0;
  v19 = (uint64_t *)v20;
  v5 = (const void *)ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, *(double *)this);
  applesauce::CF::make_StringRef(CFSTR("sample rate"), (applesauce::CF::StringRef *)&v18);
  valuePtr = v5;
  cf = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &v18, &v18, &cf);
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);
  applesauce::CF::make_StringRef(CFSTR("format ID"), (applesauce::CF::StringRef *)&valuePtr, cf);
  LODWORD(cf) = *((_DWORD *)this + 2);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v10 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v10, "Could not construct");
    __cxa_throw(v10, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  v7 = *((_DWORD *)this + 2);
  v6 = *((_DWORD *)this + 3);
  applesauce::CF::make_StringRef(CFSTR("format flags"), (applesauce::CF::StringRef *)&valuePtr);
  v8 = v6 | 0x40;
  if (v7 != 1819304813)
    v8 = v6;
  LODWORD(cf) = v8;
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_StringRef(CFSTR("bytes per packet"), (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 4);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v12 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v12, "Could not construct");
    __cxa_throw(v12, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_StringRef(CFSTR("frames per packet"), (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 5);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v13 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v13, "Could not construct");
    __cxa_throw(v13, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_StringRef(CFSTR("bytes per frame"), (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 6);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v14 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v14, "Could not construct");
    __cxa_throw(v14, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_StringRef(CFSTR("channels per frame"), (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 7);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v15 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v15, "Could not construct");
    __cxa_throw(v15, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_StringRef(CFSTR("bits per channel"), (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 8);
  v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v16, "Could not construct");
    __cxa_throw(v16, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18)
    CFRelease(v18);
  if (valuePtr)
    CFRelease(valuePtr);
  applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>((CFTypeRef **)&v19, a2);
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v19, v20[0]);
}

void sub_236D46F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef a9, CFTypeRef cf, char a11, _QWORD *a12, uint64_t a13, const void *a14)
{
  applesauce::CF::StringRef::~StringRef(&a14);
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&a11, a12);
  _Unwind_Resume(a1);
}

void applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>(CFTypeRef **a1@<X0>, CFDictionaryRef *a2@<X8>)
{
  CFTypeRef **v4;
  CFTypeRef *v5;
  CFTypeRef *v6;
  CFTypeRef *v7;
  CFTypeRef **v8;
  BOOL v9;
  CFDictionaryRef CFDictionaryRef;
  void **v11[3];
  void ***v12;

  memset(v11, 0, sizeof(v11));
  std::vector<applesauce::CF::TypeRefPair>::reserve((uint64_t *)v11, (unint64_t)a1[2]);
  v6 = *a1;
  v4 = a1 + 1;
  v5 = v6;
  if (v6 != (CFTypeRef *)v4)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>((uint64_t *)v11, v5 + 4, v5 + 5);
      v7 = (CFTypeRef *)v5[1];
      if (v7)
      {
        do
        {
          v8 = (CFTypeRef **)v7;
          v7 = (CFTypeRef *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (CFTypeRef **)v5[2];
          v9 = *v8 == v5;
          v5 = (CFTypeRef *)v8;
        }
        while (!v9);
      }
      v5 = (CFTypeRef *)v8;
    }
    while (v8 != v4);
  }
  CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef(v11);
  v12 = v11;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  *a2 = CFDictionaryRef;
}

void sub_236D471D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ConstructASBDFromDictionary(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamBasicDescription *a3)
{
  ASDT::IOAudio2::Helpers *v5;
  char v6;
  char v7;
  uint64_t v8;
  applesauce::CF *exception;
  CFTypeRef cf;

  if (!*this)
    return 0;
  *((_QWORD *)a2 + 4) = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (!*this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(CFSTR("sample rate"), (applesauce::CF::StringRef *)&cf);
  v5 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  v7 = v6;
  if (cf)
    CFRelease(cf);
  if (!v7)
    return 0;
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v5);
  *(_QWORD *)a2 = v8;
  return FillBasicFormatInfoFromDict(this, (AudioStreamBasicDescription *)a2);
}

void sub_236D472AC()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D472C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t FillBasicFormatInfoFromDict(const __CFDictionary **a1, AudioStreamBasicDescription *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  applesauce::CF *exception;
  applesauce::CF *v13;
  applesauce::CF *v14;
  applesauce::CF *v15;
  applesauce::CF *v16;
  applesauce::CF *v17;
  CFTypeRef cf;
  const __CFDictionary **v19;

  if (!*a1)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("format ID"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) == 0)
    return 0;
  a2->mFormatID = v4;
  if (!*a1)
  {
    v13 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v13);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("format flags"), (applesauce::CF::StringRef *)&cf);
  v5 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v5 & 0xFF00000000) == 0)
    return 0;
  a2->mFormatFlags = v5;
  if (!*a1)
  {
    v14 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v14);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("bytes per packet"), (applesauce::CF::StringRef *)&cf);
  v6 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v6 & 0xFF00000000) == 0)
    return 0;
  a2->mBytesPerPacket = v6;
  if (!*a1)
  {
    v15 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v15);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("frames per packet"), (applesauce::CF::StringRef *)&cf);
  v7 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v7 & 0xFF00000000) == 0)
    return 0;
  a2->mFramesPerPacket = v7;
  if (!*a1)
  {
    v16 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v16);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("bytes per frame"), (applesauce::CF::StringRef *)&cf);
  v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v8 & 0xFF00000000) == 0)
    return 0;
  a2->mBytesPerFrame = v8;
  if (!*a1)
  {
    v17 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v17);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(CFSTR("channels per frame"), (applesauce::CF::StringRef *)&cf);
  v9 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v9 & 0xFF00000000) == 0)
    return 0;
  a2->mChannelsPerFrame = v9;
  v19 = (const __CFDictionary **)applesauce::CF::DictionaryRef::operator->(a1);
  applesauce::CF::make_StringRef(CFSTR("bits per channel"), (applesauce::CF::StringRef *)&cf);
  v10 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  applesauce::CF::StringRef::~StringRef(&cf);
  if (((unint64_t)v10 & 0xFF00000000) == 0)
    return 0;
  a2->mBitsPerChannel = v10;
  if (a2->mFormatID == 1819304813)
    a2->mFormatFlags &= ~0x40u;
  return 1;
}

void sub_236D475B4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ConstructASRDFromDictionary(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamRangedDescription *a3)
{
  ASDT::IOAudio2::Helpers *v5;
  char v6;
  char v7;
  uint64_t v8;
  ASDT::IOAudio2::Helpers *v9;
  char v10;
  char v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  applesauce::CF *exception;
  applesauce::CF *v17;
  CFTypeRef cf;

  if (!*this)
    return 0;
  *((_QWORD *)a2 + 6) = 0;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *(_OWORD *)a2 = 0u;
  if (!*this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(CFSTR("min sample rate"), (applesauce::CF::StringRef *)&cf);
  v5 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  v7 = v6;
  if (cf)
    CFRelease(cf);
  if (!v7)
    return 0;
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v5);
  *((_QWORD *)a2 + 5) = v8;
  if (!*this)
  {
    v17 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v17);
  }
  applesauce::CF::make_StringRef(CFSTR("max sample rate"), (applesauce::CF::StringRef *)&cf);
  v9 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  v11 = v10;
  if (cf)
    CFRelease(cf);
  if (!v11)
    return 0;
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v9);
  *((double *)a2 + 6) = v12;
  v13 = *((double *)a2 + 5) == v12;
  v14 = 0;
  if (v13)
    v14 = *((_QWORD *)a2 + 5);
  *(_QWORD *)a2 = v14;
  return FillBasicFormatInfoFromDict(this, (AudioStreamBasicDescription *)a2);
}

void sub_236D47740(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::BestMatchForFormat(CFArrayRef *this, const applesauce::CF::ArrayRef *a2, AudioStreamRangedDescription *a3, AudioStreamBasicDescription *a4)
{
  __int128 v6;
  double mSampleRate;
  const __CFArray *Count;
  char v9;
  const __CFArray *v10;
  CFIndex v11;
  CFTypeID v14;
  BOOL v15;
  AudioStreamRangedDescription *v16;
  __int128 v17;
  const AudioValueRange *v18;
  __int128 v19;
  Float64 v20;
  uint64_t v21;
  AudioStreamBasicDescription cf;
  double v24[2];
  CFTypeRef v25;
  const __CFArray *v26;
  const __CFArray *v27;
  const __CFArray *v28;
  CFTypeRef v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v6 = *(_OWORD *)&a3->mFormat.mBytesPerPacket;
  v30 = *(_OWORD *)&a3->mFormat.mSampleRate;
  v31 = v6;
  v32 = *(_QWORD *)&a3->mFormat.mBitsPerChannel;
  v29 = 0;
  *(_QWORD *)&v30 = 0;
  if (a3->mFormat.mSampleRate == 0.0)
    mSampleRate = *(double *)a2;
  else
    mSampleRate = a3->mFormat.mSampleRate;
  Count = *this;
  v26 = Count;
  v27 = 0;
  if (Count)
    Count = (const __CFArray *)CFArrayGetCount(Count);
  v9 = 0;
  v28 = Count;
  while (1)
  {
    v10 = *this;
    v11 = *this ? CFArrayGetCount(*this) : 0;
    if (!v26 || v27 == v28)
      break;
    if (v26 == v10 && v27 == (const __CFArray *)v11)
      break;
    applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v26, &cf);
    v15 = 0;
    if (*(_QWORD *)&cf.mSampleRate)
    {
      v14 = CFGetTypeID(*(CFTypeRef *)&cf.mSampleRate);
      if (v14 == CFDictionaryGetTypeID())
        v15 = 1;
    }
    if (*(_QWORD *)&cf.mSampleRate)
      CFRelease(*(CFTypeRef *)&cf.mSampleRate);
    if (v15)
    {
      applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v26, (unint64_t)v27, &cf);
      applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((const void **)&cf, (applesauce::CF::DictionaryRef *)&v25);
      if (*(_QWORD *)&cf.mSampleRate)
        CFRelease(*(CFTypeRef *)&cf.mSampleRate);
      if ((ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&v25, (const applesauce::CF::DictionaryRef *)&cf, v16) & 1) != 0)
      {
        if (!v29)
        {
          v29 = v25;
          if (v25)
            CFRetain(v25);
        }
        if ((*(double *)&v30 == 0.0 || cf.mSampleRate == 0.0 || *(double *)&v30 == cf.mSampleRate)
          && (!DWORD2(v30) || !cf.mFormatID || DWORD2(v30) == cf.mFormatID)
          && (!(_DWORD)v31 || !cf.mBytesPerPacket || (_DWORD)v31 == cf.mBytesPerPacket)
          && (!DWORD1(v31) || !cf.mFramesPerPacket || DWORD1(v31) == cf.mFramesPerPacket)
          && (!DWORD2(v31) || !cf.mBytesPerFrame || DWORD2(v31) == cf.mBytesPerFrame)
          && (!HIDWORD(v31) || !cf.mChannelsPerFrame || HIDWORD(v31) == cf.mChannelsPerFrame)
          && (!(_DWORD)v32 || !cf.mBitsPerChannel || (_DWORD)v32 == cf.mBitsPerChannel)
          && CA::Implementation::EquivalentFormatFlags((CA::Implementation *)&v30, &cf, 0, 1)
          && v24[0] <= mSampleRate
          && v24[1] >= mSampleRate)
        {
          v17 = *(_OWORD *)&cf.mBytesPerPacket;
          *(_OWORD *)&a3->mFormat.mSampleRate = *(_OWORD *)&cf.mSampleRate;
          *(_OWORD *)&a3->mFormat.mBytesPerPacket = v17;
          *(_QWORD *)&a3->mFormat.mBitsPerChannel = *(_QWORD *)&cf.mBitsPerChannel;
          a3->mFormat.mSampleRate = mSampleRate;
          v9 = 1;
        }
      }
      if (v25)
        CFRelease(v25);
    }
    v27 = (const __CFArray *)((char *)v27 + 1);
  }
  if ((v9 & 1) != 0)
    goto LABEL_62;
  if ((ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&v29, (const applesauce::CF::DictionaryRef *)&cf, a3) & 1) != 0)
  {
    v19 = *(_OWORD *)&cf.mBytesPerPacket;
    *(_OWORD *)&a3->mFormat.mSampleRate = *(_OWORD *)&cf.mSampleRate;
    *(_OWORD *)&a3->mFormat.mBytesPerPacket = v19;
    *(_QWORD *)&a3->mFormat.mBitsPerChannel = *(_QWORD *)&cf.mBitsPerChannel;
    ASDT::ValueRange::PickCommonSampleRate((ASDT::ValueRange *)v24, v18);
    a3->mFormat.mSampleRate = v20;
LABEL_62:
    v21 = 1;
    goto LABEL_64;
  }
  v21 = 0;
LABEL_64:
  if (v29)
    CFRelease(v29);
  return v21;
}

void sub_236D47A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  CFTypeRef cf;

  applesauce::CF::details::at_to<applesauce::CF::TypeRef>(*(const __CFArray **)a1, *(_QWORD *)(a1 + 8), &cf);
  applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::iterator_proxy::iterator_proxy(a2, &cf);
  if (cf)
    CFRelease(cf);
}

applesauce::CF::DictionaryRef *applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef@<X0>(const void **a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFDictionaryGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    v6 = *a1;
    if (v6)
      CFRetain(v6);
  }
  else
  {
    v6 = 0;
  }
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v6);
}

void sub_236D47B2C()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D47B44(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamBasicDescription *a3)
{
  AudioStreamBasicDescription *v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFTypeRef cf;
  const __CFDictionary *v25;
  char v26;

  if (*this)
  {
    applesauce::CF::make_StringRef(CFSTR("current format"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(*this, &cf, &v25);
    if (cf)
      CFRelease(cf);
    if (v26)
    {
      if ((ASDT::IOA2UserClient::ConstructASBDFromDictionary(&v25, a2, v5) & 1) != 0)
      {
        v6 = 1;
LABEL_13:
        std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v25);
        return v6;
      }
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    v6 = 0;
    goto LABEL_13;
  }
  return 0;
}

void sub_236D47C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v15;
  char v16;
  uint64_t v17;

  v17 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("available formats"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v15);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      v5 = v15;
      if (v15)
        CFRetain(v15);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v15);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D47D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFDictionary *ASDT::IOA2UserClient::GetStreamInfo_StartingChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  const __CFDictionary **v13;

  if (!*this)
    return 0;
  v13 = this;
  applesauce::CF::make_StringRef(CFSTR("starting channel"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v13, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      ASDT::IOA2UserClient::GetStreamInfo_StartingChannel(v3, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_Latency(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  return 0;
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_TerminalType(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  CFTypeRef cf;
  const __CFDictionary **v5;

  if (!*this)
    return 0;
  v5 = this;
  applesauce::CF::make_StringRef(CFSTR("terminal type"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) != 0)
    return v2;
  else
    return 0;
}

BOOL ASDT::IOA2UserClient::GetStreamInfo_UsesIsolatedIO(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v3;
  unsigned __int16 v5;
  applesauce::CF *exception;
  CFTypeRef cf;
  CFTypeRef v9;

  if (!*(_QWORD *)this)
    return 0;
  v9 = this;
  applesauce::CF::make_StringRef(CFSTR("uses isolated IO"), (applesauce::CF::StringRef *)&cf);
  v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v9, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v3 & 0xFF00000000) != 0)
    return (_DWORD)v3 != 0;
  if (!*(_QWORD *)this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(CFSTR("uses isolated IO"), (applesauce::CF::StringRef *)&v9);
  v5 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v9);
  if (v9)
    CFRelease(v9);
  return (_BYTE)v5 && v5 > 0xFFu;
}

void sub_236D47F10()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D47F28(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapIOBufferForStream(ASDT::IOA2UserClient *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  _BOOL8 v10;
  CFTypeRef cf;
  unsigned int v13;
  CFTypeRef v14;

  ASDT::IOA2UserClient::CopyStreamDictionaryByID(this, a2, (applesauce::CF::DictionaryRef *)&v14);
  if (v14)
  {
    v13 = 1;
    applesauce::CF::make_StringRef(CFSTR("buffer mapping options"), (applesauce::CF::StringRef *)&cf);
    v8 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)v14, &cf, &v13);
    v13 = v8;
    if (cf)
    {
      CFRelease(cf);
      v8 = v13;
    }
    v9 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, (a2 + 0x10000000), v8, a3);
    *a4 = v9;
    v10 = v9 != 0;
    if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::MapIOBufferForStream();
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    ASDT::IOA2UserClient::MapIOBufferForStream();
    v10 = 0;
  }
  if (v14)
    CFRelease(v14);
  return v10;
}

void sub_236D4805C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetStreamActive(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3)
{
  int v3;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = ASDT::IOUserClient::CallMethod(this, 6, v5, 2, 0, 0, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::SetStreamActive();
  return v3 == 0;
}

void ASDT::IOA2UserClient::CopyControlList(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("controls"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D48198(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyControlDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, _QWORD *a3@<X8>)
{
  CFTypeRef cf;

  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&cf);
  ASDT::IOA2UserClient::CopyControlDictionaryByIndex((const __CFArray **)&cf, a2, a3);
  if (cf)
    CFRelease(cf);
}

void sub_236D4820C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFArray *ASDT::IOA2UserClient::CopyControlDictionaryByIndex@<X0>(const __CFArray **this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, _QWORD *a3@<X8>)
{
  const __CFArray *result;
  unsigned int v6;
  CFTypeRef v7;
  void *exception;
  CFTypeRef cf;
  char v10;
  uint64_t v11;

  v11 = 0;
  result = *this;
  if (result
    && (v6 = a2, result = (const __CFArray *)CFArrayGetCount(result), (unint64_t)result > v6))
  {
    if (!*this)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(*this, v6, &cf);
    if (v10)
    {
      v7 = cf;
      if (cf)
        CFRetain(cf);
    }
    else
    {
      v7 = 0;
    }
    *a3 = v7;
    return (const __CFArray *)std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

void sub_236D482EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyControlDictionaryByID(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  CFTypeRef cf;
  int v6;

  v6 = 0;
  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&cf);
  ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&cf, a2, &v6, a3);
  if (cf)
    CFRelease(cf);
}

void sub_236D4836C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::ArrayRef::~ArrayRef(&a9);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyControlDictionaryByID(CFArrayRef *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, _DWORD *a3@<X2>, applesauce::CF::DictionaryRef *a4@<X8>)
{
  const __CFArray *v7;
  int v9;
  int v10;
  const __CFArray *v11;
  CFIndex v12;
  CFTypeID v15;
  BOOL v16;
  const __CFDictionary *v17;
  void *exception;
  CFTypeRef v19;
  CFTypeRef cf;
  const __CFArray *v21;
  unint64_t v22;
  CFIndex Count;
  uint64_t v24;

  v24 = 0;
  *a3 = 0x7FFFFFFF;
  v7 = *this;
  if (v7)
  {
    v9 = (int)a2;
    v21 = v7;
    v22 = 0;
    v10 = 0;
    Count = CFArrayGetCount(v7);
    while (1)
    {
      v11 = *this;
      v12 = *this ? CFArrayGetCount(*this) : 0;
      if (!v21 || v22 == Count)
        break;
      if (v21 == v11 && v22 == v12)
        break;
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v21, &cf);
      v16 = 0;
      if (cf)
      {
        v15 = CFGetTypeID(cf);
        if (v15 == CFDictionaryGetTypeID())
          v16 = 1;
      }
      if (cf)
        CFRelease(cf);
      if (v16)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v21, v22, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a4);
        if (cf)
          CFRelease(cf);
        if (!*(_QWORD *)a4)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        cf = a4;
        applesauce::CF::make_StringRef(CFSTR("control ID"), (applesauce::CF::StringRef *)&v19);
        v17 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
        if (v19)
          CFRelease(v19);
        if (((unint64_t)v17 & 0xFF00000000) != 0 && (_DWORD)v17 == v9)
        {
          *a3 = v10;
          return;
        }
        if (*(_QWORD *)a4)
          CFRelease(*(CFTypeRef *)a4);
      }
      ++v22;
      ++v10;
    }
  }
  *(_QWORD *)a4 = 0;
}

void sub_236D4853C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  const void **v6;
  va_list va;

  va_start(va, a6);
  applesauce::CF::DictionaryRef::~DictionaryRef(v6);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetControlDictionaryIndexByID(CFArrayRef *this, const applesauce::CF::ArrayRef *a2, _DWORD *a3, unsigned int *a4)
{
  CFTypeRef v4;
  CFTypeRef cf;

  ASDT::IOA2UserClient::CopyControlDictionaryByID(this, a2, a3, (applesauce::CF::DictionaryRef *)&cf);
  v4 = cf;
  if (cf)
    CFRelease(cf);
  return v4 != 0;
}

const __CFDictionary *ASDT::IOA2UserClient::GetControlInfo_BaseClass(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  const __CFDictionary **v13;

  if (!*this)
    return 0;
  v13 = this;
  applesauce::CF::make_StringRef(CFSTR("base class"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v13, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      ASDT::IOA2UserClient::GetControlInfo_BaseClass(v3, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  return v2;
}

const __CFDictionary *ASDT::IOA2UserClient::GetControlInfo_Class(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  const __CFDictionary **v13;

  if (!*this)
    return 0;
  v13 = this;
  applesauce::CF::make_StringRef(CFSTR("class"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v13, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      ASDT::IOA2UserClient::GetControlInfo_Class(v3, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Scope(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  uint64_t v2;
  const __CFDictionary *v3;
  CFTypeRef cf;
  const __CFDictionary **v6;

  v2 = 1735159650;
  if (*this)
  {
    v6 = this;
    applesauce::CF::make_StringRef(CFSTR("scope"), (applesauce::CF::StringRef *)&cf);
    v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v6, &cf);
    if (cf)
      CFRelease(cf);
    if (((unint64_t)v3 & 0xFF00000000) != 0)
      return v3;
    else
      return 1735159650;
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Element(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  CFTypeRef cf;
  const __CFDictionary **v5;

  if (!*this)
    return 0;
  v5 = this;
  applesauce::CF::make_StringRef(CFSTR("element"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) != 0)
    return v2;
  else
    return 0;
}

BOOL ASDT::IOA2UserClient::GetControlInfo_IsReadOnly(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v3;
  unsigned __int16 v5;
  applesauce::CF *exception;
  CFTypeRef cf;
  CFTypeRef v9;

  if (!*(_QWORD *)this)
    return 0;
  v9 = this;
  applesauce::CF::make_StringRef(CFSTR("read only"), (applesauce::CF::StringRef *)&cf);
  v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v9, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v3 & 0xFF00000000) != 0)
    return (_DWORD)v3 != 0;
  if (!*(_QWORD *)this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(CFSTR("read only"), (applesauce::CF::StringRef *)&v9);
  v5 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v9);
  if (v9)
    CFRelease(v9);
  return (_BYTE)v5 && v5 > 0xFFu;
}

void sub_236D488A8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D488C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Variant(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  CFTypeRef cf;
  const __CFDictionary **v5;

  if (!*this)
    return 0;
  v5 = this;
  applesauce::CF::make_StringRef(CFSTR("variant"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) != 0)
    return v2;
  else
    return 0;
}

const __CFDictionary **ASDT::IOA2UserClient::CopyControlInfo_Name@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  CFTypeRef cf;
  CFTypeRef v7;
  char v8;
  uint64_t v9;

  v9 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("name"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::StringRef,applesauce::CF::StringRef>(*v4, &cf, &v7);
    if (cf)
      CFRelease(cf);
    if (v8)
    {
      v5 = v7;
      if (v7)
        CFRetain(v7);
    }
    else
    {
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D489E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Value(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v5;
  unsigned __int16 v6;
  applesauce::CF *exception;
  CFTypeRef cf;
  CFTypeRef v10;

  if (!*(_QWORD *)this)
    return 0;
  v10 = this;
  applesauce::CF::make_StringRef(CFSTR("value"), (applesauce::CF::StringRef *)&cf);
  v5 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v10, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v5 & 0xFF00000000) == 0)
  {
    if (!*(_QWORD *)this)
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    applesauce::CF::make_StringRef(CFSTR("value"), (applesauce::CF::StringRef *)&v10);
    v6 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v10);
    if (v10)
      CFRelease(v10);
    if (v6 < 0x100u)
      return 0;
    LODWORD(v5) = v6;
  }
  *(_DWORD *)a2 = (_DWORD)v5;
  return 1;
}

void sub_236D48AD0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D48AE8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopyControlInfo_PropertySelectors@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  CFTypeRef cf;
  CFTypeRef v7;
  char v8;
  uint64_t v9;

  v9 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("property selectors"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v7);
    if (cf)
      CFRelease(cf);
    if (v8)
    {
      v5 = v7;
      if (v7)
        CFRetain(v7);
    }
    else
    {
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D48BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("minimum value"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("maximum value"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

const __CFDictionary **ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v15;
  char v16;
  uint64_t v17;

  v17 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("range map"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v15);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      v5 = v15;
      if (v15)
        CFRetain(v15);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v15);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D48D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetLevelControlInfo_TransferFunction(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  const __CFDictionary *v2;
  CFTypeRef cf;
  const __CFDictionary **v5;

  if (!*this)
    return 0;
  v5 = this;
  applesauce::CF::make_StringRef(CFSTR("transfer function"), (applesauce::CF::StringRef *)&cf);
  v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v2 & 0xFF00000000) != 0)
    return v2;
  else
    return 0;
}

BOOL ASDT::IOA2UserClient::SetupVolumeCurve(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, ASDT::VolumeCurve *a3)
{
  const __CFArray *v5;
  const applesauce::CF::DictionaryRef *v6;
  CFTypeID v7;
  BOOL v8;
  const __CFBoolean *v9;
  char v10;
  ASDT::IOAudio2::Helpers *v11;
  const __CFBoolean *v12;
  char v13;
  ASDT::IOAudio2::Helpers *v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  void *v21;
  void *v22;
  void *exception;
  void *v24;
  uint64_t v25;
  CFTypeRef v26;
  CFTypeRef cf;
  const __CFArray *v28;
  int64_t v29;
  CFIndex Count;
  CFArrayRef theArray;

  ASDT::VolumeCurve::ResetRange(a2);
  ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap(this, &theArray);
  v5 = theArray;
  if (theArray)
  {
    v28 = theArray;
    v29 = 0;
    Count = CFArrayGetCount(theArray);
    while (1)
    {
      CFArrayGetCount(v5);
      if (Count <= v29)
        break;
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v28, &cf);
      v8 = 0;
      if (cf)
      {
        v7 = CFGetTypeID(cf);
        if (v7 == CFDictionaryGetTypeID())
          v8 = 1;
      }
      if (cf)
        CFRelease(cf);
      if (v8)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v28, v29, &v26);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&v26, (applesauce::CF::DictionaryRef *)&cf);
        if (v26)
          CFRelease(v26);
        v25 = 0;
        if (!cf)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::make_StringRef(CFSTR("start int value"), (applesauce::CF::StringRef *)&v26);
        HIDWORD(v25) = applesauce::CF::at_or<int &,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26, (unsigned int *)&v25 + 1);
        if (v26)
          CFRelease(v26);
        if (!cf)
        {
          v24 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](v24, "Could not construct");
          __cxa_throw(v24, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::make_StringRef(CFSTR("start db value"), (applesauce::CF::StringRef *)&v26);
        v9 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26);
        if (v10)
          v11 = v9;
        else
          v11 = 0;
        if (v26)
          CFRelease(v26);
        if (!cf)
        {
          v21 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](v21, "Could not construct");
          __cxa_throw(v21, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::make_StringRef(CFSTR("integer steps"), (applesauce::CF::StringRef *)&v26);
        LODWORD(v25) = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26, (unsigned int *)&v25);
        if (v26)
          CFRelease(v26);
        if (!cf)
        {
          v22 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](v22, "Could not construct");
          __cxa_throw(v22, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        applesauce::CF::make_StringRef(CFSTR("db per step"), (applesauce::CF::StringRef *)&v26);
        v12 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26);
        if (v13)
          v14 = v12;
        else
          v14 = 0;
        if (v26)
          CFRelease(v26);
        ASDT::IOAudio2::Helpers::Float64FromFixed64(v11);
        v16 = v15;
        ASDT::IOAudio2::Helpers::Float64FromFixed64(v14);
        v17 = v16;
        v19 = v16 + (double)v25 * v18;
        ASDT::VolumeCurve::AddRange(a2, v17, v19);
        if (cf)
          CFRelease(cf);
      }
      ++v29;
    }
    ASDT::IOA2UserClient::GetLevelControlInfo_TransferFunction(this, v6);
    ASDT::VolumeCurve::SetTransferFunction(a2);
    CFRelease(v5);
  }
  return v5 != 0;
}

void sub_236D49148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v15;
  char v16;
  uint64_t v17;

  v17 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("value"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v15);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      v5 = v15;
      if (v15)
        CFRetain(v15);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v15);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D492A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v15;
  char v16;
  uint64_t v17;

  v17 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("selectors"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v15);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      v5 = v15;
      if (v15)
        CFRetain(v15);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v15);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D49370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("left value"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("center value"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("right value"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("left channel"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  const __CFDictionary **v14;

  if (!*this)
    return 0;
  v14 = this;
  applesauce::CF::make_StringRef(CFSTR("right channel"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v14, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = (_DWORD)v4;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel(result, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

const __CFDictionary **ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor@<X0>(const __CFDictionary **this@<X0>, _QWORD *a2@<X8>)
{
  const __CFDictionary **v4;
  CFTypeRef v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v15;
  char v16;
  uint64_t v17;

  v17 = 0;
  if (*this)
  {
    v4 = this;
    applesauce::CF::make_StringRef(CFSTR("descriptor"), (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(*v4, &cf, &v15);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      v5 = v15;
      if (v15)
        CFRetain(v15);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v15);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_236D4970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapBlockControlBuffer(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3, unsigned __int8 **a4)
{
  const __CFDictionary *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _BOOL8 v11;
  applesauce::CF *exception;
  CFTypeRef cf;
  CFTypeRef v15;

  if (!*(_QWORD *)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::MapBlockControlBuffer();
    return 0;
  }
  v15 = a2;
  applesauce::CF::make_StringRef(CFSTR("control ID"), (applesauce::CF::StringRef *)&cf);
  v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v15, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v8 & 0xFF00000000) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::MapBlockControlBuffer();
    return 0;
  }
  LODWORD(cf) = 1;
  if (!*(_QWORD *)a2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(CFSTR("mapping options"), (applesauce::CF::StringRef *)&v15, cf);
  v9 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>(*(const __CFDictionary **)a2, &v15, (unsigned int *)&cf);
  LODWORD(cf) = v9;
  if (v15)
  {
    CFRelease(v15);
    v9 = cf;
  }
  v10 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, v8 & 0xFFFFFFF | 0x30000000, v9, a3);
  *a4 = v10;
  v11 = v10 != 0;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::MapBlockControlBuffer();
  return v11;
}

void sub_236D4988C()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D498A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MoveBlockControlData(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  int v4;
  unint64_t v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v4 = ASDT::IOUserClient::CallMethod(this, 9, v6, 3, 0, 0, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::MoveBlockControlData();
  return v4 == 0;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockList(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  CFTypeRef cf;

  *(_QWORD *)a2 = 0;
  applesauce::CF::make_StringRef(CFSTR("data exchange blocks"), (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
}

void sub_236D499D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

CFIndex ASDT::IOA2UserClient::GetNumberDataExchangeBlocks(ASDT::IOA2UserClient *this)
{
  CFIndex Count;
  CFArrayRef theArray;

  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (!theArray)
    return 0;
  Count = CFArrayGetCount(theArray);
  if (theArray)
    CFRelease(theArray);
  return Count;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, unsigned int a2@<W1>, _QWORD *a3@<X8>)
{
  CFTypeRef v5;
  void *exception;
  CFTypeRef cf;
  char v8;
  CFArrayRef theArray;
  uint64_t v10;

  v10 = 0;
  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray && CFArrayGetCount(theArray) > (unint64_t)a2)
  {
    if (!theArray)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(theArray, a2, &cf);
    if (v8)
    {
      v5 = cf;
      if (cf)
        CFRetain(cf);
      *a3 = v5;
    }
    else
    {
      *a3 = 0;
      v10 = 0;
    }
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  }
  else
  {
    *a3 = 0;
    v10 = 0;
  }
  if (theArray)
    CFRelease(theArray);
}

void sub_236D49B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  const void *v4;
  va_list va;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, const void *);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetDataExchangeBlockID(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  CFTypeRef cf;
  const __CFDictionary **v7;

  if (!*this)
    return 0;
  v7 = this;
  applesauce::CF::make_StringRef(CFSTR("block ID"), (applesauce::CF::StringRef *)&cf);
  v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v7, &cf);
  if (cf)
    CFRelease(cf);
  if (((unint64_t)v4 & 0xFF00000000) == 0)
    return 0;
  *(_DWORD *)a2 = (_DWORD)v4;
  return 1;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByID(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  const __CFArray *v5;
  CFIndex v6;
  CFTypeID v9;
  BOOL v10;
  const __CFDictionary *v11;
  void *exception;
  CFTypeRef v13;
  CFTypeRef cf;
  CFArrayRef v15;
  unint64_t v16;
  CFIndex Count;
  CFArrayRef theArray;
  uint64_t v19;

  v19 = 0;
  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray)
  {
    v15 = theArray;
    v16 = 0;
    Count = CFArrayGetCount(theArray);
    while (1)
    {
      v5 = theArray;
      v6 = theArray ? CFArrayGetCount(theArray) : 0;
      if (!v15 || v16 == Count)
        break;
      if (v15 == v5 && v16 == v6)
        break;
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v15, &cf);
      v10 = 0;
      if (cf)
      {
        v9 = CFGetTypeID(cf);
        if (v9 == CFDictionaryGetTypeID())
          v10 = 1;
      }
      if (cf)
        CFRelease(cf);
      if (v10)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v15, v16, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a3);
        if (cf)
          CFRelease(cf);
        if (!*(_QWORD *)a3)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x23B802BE8](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
        }
        cf = a3;
        applesauce::CF::make_StringRef(CFSTR("block ID"), (applesauce::CF::StringRef *)&v13);
        v11 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v13);
        if (v13)
          CFRelease(v13);
        if (((unint64_t)v11 & 0xFF00000000) != 0 && (_DWORD)v11 == a2)
          goto LABEL_32;
        if (*(_QWORD *)a3)
          CFRelease(*(CFTypeRef *)a3);
      }
      ++v16;
    }
    *(_QWORD *)a3 = 0;
    v19 = 0;
LABEL_32:
    if (theArray)
      CFRelease(theArray);
  }
  else
  {
    *(_QWORD *)a3 = 0;
  }
}

void sub_236D49D90(_Unwind_Exception *a1)
{
  uint64_t v1;

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)(v1 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapDataExchangeBlockBuffer(ASDT::IOA2UserClient *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  _BOOL8 v10;
  CFTypeRef cf;
  unsigned int v13;
  CFTypeRef v14;

  ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByID(this, a2, (applesauce::CF::DictionaryRef *)&v14);
  if (v14)
  {
    v13 = 1;
    applesauce::CF::make_StringRef(CFSTR("buffer mapping options"), (applesauce::CF::StringRef *)&cf);
    v8 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)v14, &cf, &v13);
    v13 = v8;
    if (cf)
    {
      CFRelease(cf);
      v8 = v13;
    }
    v9 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, (a2 + 0x20000000), v8, a3);
    *a4 = v9;
    v10 = v9 != 0;
    if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::MapDataExchangeBlockBuffer();
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    ASDT::IOA2UserClient::MapDataExchangeBlockBuffer();
    v10 = 0;
  }
  if (v14)
    CFRelease(v14);
  return v10;
}

void sub_236D49F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MoveDataExchangeBlockData(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  int v4;
  unint64_t v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = a4;
  v6[2] = a3;
  v4 = ASDT::IOUserClient::CallMethod(this, 7, v6, 3, 0, 0, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::MoveDataExchangeBlockData();
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::StartIO(ASDT::IOA2UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::StartIO();
  return v1 == 0;
}

BOOL ASDT::IOA2UserClient::StartIOWithFlags(ASDT::IOA2UserClient *this, unint64_t a2, unint64_t *a3)
{
  int v4;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  v7 = 0;
  v8 = a2;
  v6 = 1;
  v4 = ASDT::IOUserClient::CallMethod(this, 10, &v8, 1, 0, 0, &v7, &v6, 0, 0);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::StartIOWithFlags();
  }
  else
  {
    *a3 = v7;
  }
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::StopIO(ASDT::IOA2UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::StopIO();
  return v1 == 0;
}

BOOL ASDT::IOA2UserClient::StopIOWithFlags(ASDT::IOA2UserClient *this, unint64_t a2, unint64_t *a3)
{
  int v4;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  v7 = 0;
  v8 = a2;
  v6 = 1;
  v4 = ASDT::IOUserClient::CallMethod(this, 11, &v8, 1, 0, 0, &v7, &v6, 0, 0);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::StopIOWithFlags();
  }
  else
  {
    *a3 = v7;
  }
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::DoIO(ASDT::IOA2UserClient *this, int a2, int a3, uint64_t a4, uint64_t a5)
{
  int v10;
  _QWORD *v12;
  int v13;
  _QWORD *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = ASDT::IOUserClient::CallTrap6(this);
  if (v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v12 = (_QWORD *)((char *)this + 32);
    if (*((char *)this + 55) < 0)
      v12 = (_QWORD *)*v12;
    v13 = 136316162;
    v14 = v12;
    v15 = 1024;
    v16 = a2;
    v17 = 1024;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: DoIO(%hhu, %u, %llu, %llu) failed", (uint8_t *)&v13, 0x2Cu);
  }
  return v10 == 0;
}

BOOL ASDT::IOA2UserClient::SetupForIsolatedIO(ASDT::IOA2UserClient *this, unsigned int a2, unint64_t a3, unsigned int a4)
{
  int v8;
  _QWORD *v10;
  uint8_t buf[4];
  _QWORD *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unsigned int v18;
  unint64_t v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v19[0] = a2;
  v19[1] = a3;
  v19[2] = a4;
  v8 = ASDT::IOUserClient::CallMethod(this, 13, v19, 3, 0, 0, 0, 0, 0, 0);
  if (v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v10 = (_QWORD *)((char *)this + 32);
    if (*((char *)this + 55) < 0)
      v10 = (_QWORD *)*v10;
    *(_DWORD *)buf = 136315906;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2048;
    v16 = a3;
    v17 = 1024;
    v18 = a4;
    _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: SetupForIsolatedIO(%u, %llu, %u) failed", buf, 0x22u);
  }
  return v8 == 0;
}

BOOL ASDT::IOA2UserClient::TeardownForIsolatedIO(ASDT::IOA2UserClient *this, unsigned int a2, unint64_t a3)
{
  int v3;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = ASDT::IOUserClient::CallMethod(this, 14, v5, 2, 0, 0, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::TeardownForIsolatedIO();
  return v3 == 0;
}

uint64_t ASDT::IOA2UserClient::DoIsolatedIO(ASDT::IOA2UserClient *this, int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14;
  uint64_t v15;
  _QWORD *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint8_t buf[4];
  _QWORD *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  ASDT::IOUserClient::SharedLock(this);
  v14 = 1937010544;
  if (*((_DWORD *)this + 3) && *((_BYTE *)this + 16) && (v14 = MEMORY[0x23B802774]()) == 0)
  {
    v15 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v17 = (_QWORD *)((char *)this + 32);
      if (*((char *)this + 55) < 0)
        v17 = (_QWORD *)*v17;
      v18 = HIBYTE(a4);
      *(_DWORD *)buf = 136318722;
      v28 = v17;
      v29 = 1024;
      if ((a4 - 0x20000000) >> 24 >= 0x5F)
        v18 = 32;
      v30 = a2;
      v19 = BYTE2(a4);
      v31 = 2048;
      v32 = a3;
      if (BYTE2(a4) - 32 >= 0x5F)
        v19 = 32;
      v33 = 1024;
      v34 = v18;
      if (BYTE1(a4) - 32 >= 0x5F)
        v20 = 32;
      else
        v20 = BYTE1(a4);
      v35 = 1024;
      v36 = v19;
      if (a4 - 32 >= 0x5F)
        v21 = 32;
      else
        v21 = a4;
      v37 = 1024;
      v38 = v20;
      if ((v14 - 0x20000000) >> 24 >= 0x5F)
        v22 = 32;
      else
        v22 = HIBYTE(v14);
      v39 = 1024;
      v23 = BYTE2(v14);
      v40 = v21;
      if (BYTE2(v14) - 32 >= 0x5F)
        v23 = 32;
      v41 = 1024;
      v24 = BYTE1(v14);
      v42 = a5;
      if (BYTE1(v14) - 32 >= 0x5F)
        v24 = 32;
      v43 = 2048;
      v44 = a6;
      if (v14 - 32 >= 0x5F)
        v25 = 32;
      else
        v25 = v14;
      v45 = 2048;
      v46 = a7;
      v47 = 1024;
      v48 = v14;
      v49 = 1024;
      v50 = v22;
      v51 = 1024;
      v52 = v23;
      v53 = 1024;
      v54 = v24;
      v55 = 1024;
      v56 = v25;
      _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: DoIsolatedIO(%u, %llu, %c%c%c%c, %u, %llu, %llu) failed: %x (%c%c%c%c)", buf, 0x6Cu);
    }
    v15 = 0;
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v26);
  return v15;
}

void sub_236D4A788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetStreamCurrentFormat(ASDT::IOA2UserClient *this, unsigned int a2, const AudioStreamBasicDescription *a3)
{
  int v6;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  UInt32 mBitsPerChannel;
  unint64_t v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v8 = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a3->mSampleRate);
  v9 = *(_OWORD *)&a3->mFormatID;
  v10 = *(_QWORD *)&a3->mBytesPerFrame;
  mBitsPerChannel = a3->mBitsPerChannel;
  v12[0] = a2;
  v6 = ASDT::IOUserClient::CallMethod(this, 5, v12, 1, &v8, 40, 0, 0, 0, 0);
  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::SetStreamCurrentFormat();
  return v6 == 0;
}

BOOL ASDT::IOA2UserClient::SetControlValue(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int *a3)
{
  unint64_t v4;
  int v5;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = *a3;
  v9[0] = a2;
  v9[1] = v4;
  v8 = 0;
  v7 = 1;
  v5 = ASDT::IOUserClient::CallMethod(this, 2, v9, 2, 0, 0, &v8, &v7, 0, 0);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::SetControlValue();
  }
  else
  {
    *a3 = v8;
  }
  return v5 == 0;
}

BOOL ASDT::IOA2UserClient::SetMultiControlValue(ASDT::IOA2UserClient *this, unsigned int a2, const unsigned int *a3, int a4, unsigned int *a5, unsigned int *a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  unsigned int v13;
  const void *v14;
  uint64_t v15;
  unint64_t *v16;
  int v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v9 = (a4 + 1);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v19 - v10;
  *(_DWORD *)((char *)v19 - v10) = v12;
  memcpy((char *)v19 - v10 + 4, v14, 4 * v13);
  if (a6)
  {
    v15 = 4 * *a6;
    v16 = v19;
  }
  else
  {
    v16 = 0;
    v15 = 0;
  }
  v19[0] = v15;
  v17 = ASDT::IOUserClient::CallMethod(this, 8, 0, 0, v11, 4 * v9, 0, 0, a5, v16);
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::SetMultiControlValue();
  }
  else if (a6)
  {
    *a6 = v19[0] >> 2;
  }
  return v17 == 0;
}

uint64_t ASDT::IOA2UserClient::UpdateControlInfo(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  CFTypeRef v3;
  uint64_t v4;

  v3 = *a3;
  if (*a3)
  {
    CFRetain(*a3);
    CFRetain(v3);
  }
  v4 = ASDT::IOUserClient::ArraySetValueAtIndex();
  if (v3)
  {
    CFRelease(v3);
    CFRelease(v3);
  }
  return v4;
}

void sub_236D4AB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::TypeRef::~TypeRef((const void **)&a9);
  applesauce::CF::TypeRef::~TypeRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceControlInfo(ASDT::IOUserClient *a1, const applesauce::CF::ArrayRef *a2, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef v7;
  char updated;
  uint64_t v9;
  CFTypeRef cf;
  CFTypeRef v12;

  v7 = *a4;
  if (*a4)
    CFRetain(*a4);
  v12 = v7;
  updated = ASDT::IOA2UserClient::UpdateControlInfo((uint64_t)a2, a3, &v12);
  if (v7)
    CFRelease(v7);
  if ((updated & 1) == 0)
    return 0;
  applesauce::CF::make_StringRef(CFSTR("controls"), (applesauce::CF::StringRef *)&cf);
  v9 = ASDT::IOUserClient::ReplaceProperty(a1, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v9;
}

void sub_236D4AC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::UpdateControlValue(uint64_t a1, const void **a2)
{
  const void *v3;
  uint64_t v4;
  CFTypeRef v6;

  applesauce::CF::make_StringRef(CFSTR("value"), (applesauce::CF::StringRef *)&v6);
  v3 = *a2;
  if (v3)
    CFRetain(v3);
  v4 = ASDT::IOUserClient::DictionarySetValueForKey();
  if (v3)
    CFRelease(v3);
  if (v6)
    CFRelease(v6);
  return v4;
}

void sub_236D4ACD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::TypeRef::~TypeRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceControlValue(ASDT::IOUserClient *a1, const applesauce::CF::ArrayRef *a2, uint64_t a3, const void **a4, CFTypeRef *a5)
{
  CFTypeRef v9;
  char updated;
  const void *v11;
  uint64_t v12;
  CFTypeRef v14;
  const void *v15;

  v9 = *a5;
  if (*a5)
    CFRetain(*a5);
  v15 = v9;
  updated = ASDT::IOA2UserClient::UpdateControlValue((uint64_t)a4, &v15);
  if (v9)
    CFRelease(v9);
  if ((updated & 1) == 0)
    return 0;
  v11 = *a4;
  if (v11)
    CFRetain(v11);
  v14 = v11;
  v12 = ASDT::IOA2UserClient::ReplaceControlInfo(a1, a2, a3, &v14);
  if (v11)
    CFRelease(v11);
  return v12;
}

void sub_236D4ADB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetUpdatedControlValue(const __CFDictionary **a1, const applesauce::CF::DictionaryRef *a2, const void **a3, _BYTE *a4)
{
  int v6;
  signed int ControlInfo_BaseClass;
  unsigned int *v9;
  int ControlInfo_Value;
  _BOOL8 result;
  int v12;
  CFNumberRef v13;
  CFNumberRef v14;
  const void *v15;
  void *exception;
  int v17;
  int valuePtr;

  v6 = (int)a2;
  ControlInfo_BaseClass = ASDT::IOA2UserClient::GetControlInfo_BaseClass(a1, a2);
  v17 = 0;
  ControlInfo_Value = ASDT::IOA2UserClient::GetControlInfo_Value((ASDT::IOA2UserClient *)a1, (const applesauce::CF::DictionaryRef *)&v17, v9);
  result = 0;
  if (!ControlInfo_Value)
    return result;
  *a4 = 0;
  if (ControlInfo_BaseClass <= 1936483441)
  {
    if (ControlInfo_BaseClass == 1818588780)
      goto LABEL_9;
    v12 = 1936483188;
  }
  else
  {
    if (ControlInfo_BaseClass == 1936483442)
      goto LABEL_9;
    if (ControlInfo_BaseClass == 1953458028)
    {
      result = 1;
      if ((v6 != 0) != (v17 == 0))
        return result;
      v6 = v6 != 0;
      goto LABEL_13;
    }
    v12 = 1936744814;
  }
  if (ControlInfo_BaseClass == v12)
  {
LABEL_9:
    result = 1;
    if (v17 == v6)
      return result;
LABEL_13:
    *a4 = 1;
    valuePtr = v6;
    v13 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (!v13)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v14 = v13;
    CFRetain(v13);
    v15 = *a3;
    *a3 = v14;
    if (v15)
      CFRelease(v15);
    CFRelease(v14);
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetUpdatedControlValue(ControlInfo_BaseClass);
    return 0;
  }
  return result;
}

void sub_236D4AF74(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceControlValue(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2, const applesauce::CF::DictionaryRef *a3)
{
  CFTypeRef v6;
  uint64_t UpdatedControlValue;
  CFTypeRef v8;
  uint64_t v9;
  CFTypeRef v11;
  CFTypeRef v12;
  char v13;
  CFTypeRef v14;
  CFTypeRef cf;
  unsigned int v16;
  CFArrayRef v17;

  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v17);
  v16 = -1;
  ASDT::IOA2UserClient::CopyControlDictionaryByID(&v17, a2, &v16, (applesauce::CF::DictionaryRef *)&cf);
  v6 = cf;
  if (cf)
  {
    v14 = 0;
    v13 = 0;
    CFRetain(cf);
    v12 = v6;
    UpdatedControlValue = ASDT::IOA2UserClient::GetUpdatedControlValue((const __CFDictionary **)&v12, a3, &v14, &v13);
    if (v12)
      CFRelease(v12);
    if ((UpdatedControlValue & 1) != 0)
    {
      v8 = v14;
      if (v13)
      {
        v9 = v16;
        if (v14)
          CFRetain(v14);
        v11 = v8;
        UpdatedControlValue = ASDT::IOA2UserClient::ReplaceControlValue(this, (const applesauce::CF::ArrayRef *)&v17, v9, &cf, &v11);
        if (!v8)
          goto LABEL_15;
        CFRelease(v8);
LABEL_14:
        CFRelease(v8);
        goto LABEL_15;
      }
    }
    else
    {
      v8 = v14;
    }
    if (!v8)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    UpdatedControlValue = 0;
    goto LABEL_17;
  }
  ASDT::IOA2UserClient::ReplaceControlValue();
  UpdatedControlValue = 0;
LABEL_15:
  if (cf)
    CFRelease(cf);
LABEL_17:
  if (v17)
    CFRelease(v17);
  return UpdatedControlValue;
}

void sub_236D4B0E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  const void *v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  va_list va1;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, const void *);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v8 = va_arg(va2, const void *);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  applesauce::CF::TypeRef::~TypeRef((const void **)va1);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetUpdatedMultiControlValue(const __CFDictionary **a1, const void *a2, unsigned int a3, const void **a4, _BYTE *a5)
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  const __CFArray *v18;
  std::vector<unsigned int>::size_type Count;
  unint64_t i;
  unint64_t v21;
  CFArrayRef CFArray;
  CFArrayRef v23;
  const void *v24;
  std::vector<unsigned int> v26;
  void *__p;
  void *v28;
  uint64_t v29;
  void *v30;
  _BYTE *v31;
  uint64_t v32;
  const __CFArray *v33;

  if (a2 || !a3)
  {
    ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue(a1, &v33);
    v18 = v33;
    v17 = v33 != 0;
    if (v33)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v30, a2, (uint64_t)a2 + 4 * a3, a3);
      __p = 0;
      v28 = 0;
      v29 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 2);
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
      Count = CFArrayGetCount(v18);
      std::vector<unsigned int>::vector(&v26, Count);
      if (Count)
      {
        for (i = 0; i != Count; ++i)
        {
          v21 = applesauce::CF::details::at_as<unsigned int>(v18, i);
          if ((v21 & 0xFF00000000) != 0)
            v26.__begin_[i] = v21;
        }
      }
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
      if ((char *)v26.__end_ - (char *)v26.__begin_ == v31 - (_BYTE *)v30
        && !memcmp(v26.__begin_, v30, (char *)v26.__end_ - (char *)v26.__begin_))
      {
        *a5 = 0;
      }
      else
      {
        *a5 = 1;
        CFArray = applesauce::CF::details::make_CFArrayRef<unsigned int>(&__p);
        v23 = CFArray;
        if (CFArray)
          CFRetain(CFArray);
        v24 = *a4;
        *a4 = v23;
        if (v24)
          CFRelease(v24);
        if (v23)
          CFRelease(v23);
      }
      if (v26.__begin_)
      {
        v26.__end_ = v26.__begin_;
        operator delete(v26.__begin_);
      }
      if (__p)
      {
        v28 = __p;
        operator delete(__p);
      }
      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }
      CFRelease(v18);
    }
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      ASDT::IOA2UserClient::GetUpdatedMultiControlValue(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  return v17;
}

void sub_236D4B300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  uint64_t v17;

  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v17 - 64));
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceMultiControlValue(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2, const unsigned int *a3, unsigned int a4)
{
  const __CFDictionary *v8;
  uint64_t UpdatedMultiControlValue;
  CFTypeRef v10;
  uint64_t v11;
  CFTypeRef v13;
  const __CFDictionary *v14;
  char v15;
  CFTypeRef v16;
  CFTypeRef cf;
  unsigned int v18;
  CFTypeRef v19;

  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v19);
  v18 = -1;
  ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v19, a2, &v18, (applesauce::CF::DictionaryRef *)&cf);
  v8 = (const __CFDictionary *)cf;
  if (cf)
  {
    v16 = 0;
    v15 = 0;
    CFRetain(cf);
    v14 = v8;
    UpdatedMultiControlValue = ASDT::IOA2UserClient::GetUpdatedMultiControlValue(&v14, a3, a4, &v16, &v15);
    CFRelease(v8);
    if ((UpdatedMultiControlValue & 1) != 0)
    {
      v10 = v16;
      if (v15)
      {
        v11 = v18;
        if (v16)
          CFRetain(v16);
        v13 = v10;
        UpdatedMultiControlValue = ASDT::IOA2UserClient::ReplaceControlValue(this, (const applesauce::CF::ArrayRef *)&v19, v11, &cf, &v13);
        if (!v10)
          goto LABEL_13;
        CFRelease(v10);
LABEL_12:
        CFRelease(v10);
        goto LABEL_13;
      }
    }
    else
    {
      v10 = v16;
    }
    if (!v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    UpdatedMultiControlValue = 0;
    goto LABEL_15;
  }
  ASDT::IOA2UserClient::ReplaceMultiControlValue();
  UpdatedMultiControlValue = 0;
LABEL_13:
  if (cf)
    CFRelease(cf);
LABEL_15:
  if (v19)
    CFRelease(v19);
  return UpdatedMultiControlValue;
}

void sub_236D4B4C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  va_list va1;
  const void *v9;
  va_list va2;
  uint64_t v11;
  va_list va3;

  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v9 = va_arg(va3, const void *);
  v11 = va_arg(va3, _QWORD);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  applesauce::CF::TypeRef::~TypeRef((const void **)va1);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va3);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::RefreshControlList(ASDT::IOA2UserClient *this)
{
  applesauce::CF::TypeRef *v2;
  uint64_t v3;
  CFTypeRef cf;
  CFTypeRef v6;

  applesauce::CF::make_StringRef(CFSTR("controls"), (applesauce::CF::StringRef *)&v6);
  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>((ASDT::IOUserClient *)*((unsigned int *)this + 2), (uint64_t)&v6, (const applesauce::CF::TypeRef *)&cf, v2) & 1) != 0)
  {
    v3 = ASDT::IOUserClient::ReplaceProperty(this, (const applesauce::CF::StringRef *)&v6, (const applesauce::CF::ArrayRef *)&cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::RefreshControlList();
    v3 = 0;
  }
  if (cf)
    CFRelease(cf);
  if (v6)
    CFRelease(v6);
  return v3;
}

void sub_236D4B5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::ArrayRef::~ArrayRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  applesauce::CF::ArrayRef *v5;
  uint64_t v6;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4) & 1) != 0)
    v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  else
    v6 = 0;
  if (cf)
    CFRelease(cf);
  return v6;
}

void sub_236D4B644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::RefreshControlInfo(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2)
{
  applesauce::CF::TypeRef *v4;
  uint64_t v5;
  CFTypeRef v6;
  uint64_t v7;
  CFTypeRef v9;
  CFTypeRef v10;
  CFTypeRef v11;
  unsigned int v12;
  CFTypeRef cf;
  int v14;
  CFTypeRef v15;
  CFTypeRef v16;

  applesauce::CF::make_StringRef(CFSTR("controls"), (applesauce::CF::StringRef *)&v16);
  v15 = 0;
  if ((ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>((ASDT::IOUserClient *)*((unsigned int *)this + 2), (uint64_t)&v16, (const applesauce::CF::TypeRef *)&v15, v4) & 1) != 0)
  {
    v14 = -1;
    ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v15, a2, &v14, (applesauce::CF::DictionaryRef *)&cf);
    v12 = -1;
    ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v11);
    ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v11, a2, &v12, (applesauce::CF::DictionaryRef *)&v10);
    v5 = v12;
    v6 = cf;
    if (cf)
      CFRetain(cf);
    v9 = v6;
    v7 = ASDT::IOA2UserClient::ReplaceControlInfo(this, (const applesauce::CF::ArrayRef *)&v11, v5, &v9);
    if (v6)
      CFRelease(v6);
    if (v10)
      CFRelease(v10);
    if (v11)
      CFRelease(v11);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UserClient::RefreshControlInfo();
    v7 = 0;
  }
  if (v15)
    CFRelease(v15);
  if (v16)
    CFRelease(v16);
  return v7;
}

void sub_236D4B7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, const void *a11, uint64_t a12, const void *a13, uint64_t a14, const void *a15)
{
  uint64_t v15;

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a10);
  applesauce::CF::ArrayRef::~ArrayRef(&a11);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a13);
  applesauce::CF::ArrayRef::~ArrayRef(&a15);
  applesauce::CF::StringRef::~StringRef((const void **)(v15 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::PerformConfigChange(ASDT::IOA2UserClient *this, const IOAudio2Notification *a2)
{
  int v2;

  v2 = ASDT::IOUserClient::CallMethod(this, 3, 0, 0, a2, 32, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UserClient::PerformConfigChange();
  return v2 == 0;
}

BOOL ASDT::IOA2UserClient::MapEngineStatus(ASDT::IOA2UserClient *this, IOAudio2EngineStatus **a2)
{
  IOAudio2EngineStatus *v4;
  _BOOL8 result;
  unsigned int v6;

  v6 = 0;
  v4 = (IOAudio2EngineStatus *)ASDT::IOUserClient::MapMemory(this, 0, 1, &v6);
  if (!v4)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    goto LABEL_6;
  }
  if (v6 <= 0x27)
  {
    ASDT::IOUserClient::ReleaseMemory(this, v4);
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
LABEL_6:
    ASDT::IOA2UserClient::MapEngineStatus();
    return 0;
  }
  *a2 = v4;
  return 1;
}

void ASDT::IOA2UserClient::~IOA2UserClient(ASDT::IOA2UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B802D68);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
  JUMPOUT(0x23B802BE8);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236D4B9DC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  std::vector<char>::size_type v5;
  std::vector<char>::pointer end;
  char *v7;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    v5 = __n;
    std::vector<char>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[v5];
    do
    {
      *end++ = *__x;
      --v5;
    }
    while (v5);
    this->__end_ = v7;
  }
  return this;
}

void sub_236D4BA6C(_Unwind_Exception *exception_object)
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

char *std::vector<char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25084AF30, MEMORY[0x24BEDAAF0]);
}

void sub_236D4BB18(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

applesauce::CF::DataRef *applesauce::CF::DataRef::DataRef(applesauce::CF::DataRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFDataGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B802BE8](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236D4BBF4(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::NumberRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, _BYTE *a3@<X8>)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  char v7;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  CFRetain(v4);
  v6 = CFGetTypeID(v5);
  if (v6 != CFNumberGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(_QWORD *)a3 = v5;
  v7 = 1;
LABEL_6:
  a3[8] = v7;
}

const __CFDictionary *applesauce::CF::details::at_key<applesauce::CF::StringRef>(const __CFDictionary *result, const void **a2)
{
  const void *v2;

  if (result)
  {
    v2 = *a2;
    if (v2)
      return (const __CFDictionary *)CFDictionaryGetValue(result, v2);
    else
      return 0;
  }
  return result;
}

uint64_t applesauce::CF::convert_as<unsigned int,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return applesauce::CF::details::number_convert_as<unsigned int>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(const __CFBoolean *a1)
{
  CFTypeID TypeID;
  uint64_t Value;
  uint64_t v4;

  if (a1 && (TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    Value = CFBooleanGetValue(a1);
    v4 = 0x100000000;
  }
  else
  {
    Value = 0;
    v4 = 0;
  }
  return v4 | Value;
}

uint64_t applesauce::CF::details::number_convert_as<unsigned int>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const __CFNumber *v7;
  CFNumberType v8;
  const __CFNumber *v9;
  CFNumberType v10;
  const __CFNumber *v11;
  CFNumberType v12;
  const __CFNumber *v13;
  CFNumberType v14;
  int Value;
  uint64_t v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  uint64_t v20;
  double valuePtr;

  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      v16 = Value != 0;
      if (Value)
        v17 = LOBYTE(valuePtr);
      else
        v17 = 0;
      v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0)
        v18 = 0;
      v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr))
        v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      else
        v6 = 0;
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloatType;
LABEL_24:
      v19 = CFNumberGetValue(v11, v12, &valuePtr);
      v20 = *(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberNSIntegerType;
LABEL_28:
      v19 = CFNumberGetValue(v9, v10, &valuePtr);
      v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberCGFloatType;
LABEL_30:
      v19 = CFNumberGetValue(v13, v14, &valuePtr);
      v20 = valuePtr;
LABEL_31:
      v6 = v20 | 0x100000000;
      if (!v19)
        v6 = 0;
LABEL_33:
      v4 = v6 & 0xFFFFFF00;
      v5 = v6 & 0x100000000;
      break;
    default:
      v4 = 0;
      v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

uint64_t std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

BOOL CA::Implementation::EquivalentFormatFlags(CA::Implementation *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3, int a4)
{
  int32x4_t v4;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  BOOL v14;
  BOOL v16;
  unsigned int v17;
  BOOL v18;
  int v19;
  unsigned int v20;
  AudioFormatFlags mFormatFlags;
  AudioFormatFlags v22;
  unsigned int v23;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  UInt32 v26;
  UInt32 mBitsPerChannel;
  int v28;
  BOOL v29;
  BOOL v30;
  unsigned int v31;
  BOOL v32;
  int v33;
  unsigned int v34;

  if (a4)
  {
    v4 = *(int32x4_t *)&a2->mFormatID;
    v4.i64[1] = *((_QWORD *)this + 1);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v4))) & 1) != 0)
      return 1;
  }
  v6 = *((_DWORD *)this + 3);
  if (*((_DWORD *)this + 2) != 1819304813)
    return v6 == a2->mFormatFlags;
  v7 = v6 & 0x7FFFFFFF;
  if ((v6 & 0x7FFFFFFF) == 0)
    v7 = *((_DWORD *)this + 3);
  if ((_DWORD)a3)
    v8 = v7;
  else
    v8 = v7 & 0xFFFFFFBF;
  v9 = *((_DWORD *)this + 6);
  if (v9)
  {
    v10 = *((_DWORD *)this + 7);
    if ((v6 & 0x20) != 0)
      v11 = 1;
    else
      v11 = *((_DWORD *)this + 7);
    if (v11)
    {
      v9 = 8 * (v9 / v11);
      v12 = *((_DWORD *)this + 8);
      v13 = v8 | 8;
      v14 = v9 == v12;
      goto LABEL_20;
    }
    v9 = 0;
    v12 = *((_DWORD *)this + 8);
    v13 = v8 | 8;
  }
  else
  {
    v13 = v8 | 8;
    v10 = *((_DWORD *)this + 7);
    v12 = *((_DWORD *)this + 8);
  }
  v14 = v12 == 0;
LABEL_20:
  if (v14)
    v8 = v13;
  v16 = (v12 & 7) == 0 && v9 == v12;
  v17 = v8 & 0xFFFFFFEF;
  if (!v16)
    v17 = v8;
  if ((v17 & 1) != 0)
    v17 &= ~4u;
  v18 = (v17 & 8) == 0 || v12 > 8;
  v19 = v17 & 2;
  if (v18)
    v19 = v17;
  if (v10 == 1)
    v20 = v19 & 0xFFFFFFDF;
  else
    v20 = v19;
  if (!v20)
    v20 = 0x80000000;
  mFormatFlags = a2->mFormatFlags;
  if (a2->mFormatID != 1819304813)
    return v20 == mFormatFlags;
  v22 = mFormatFlags & 0x7FFFFFFF;
  if ((mFormatFlags & 0x7FFFFFFF) == 0)
    v22 = a2->mFormatFlags;
  if ((_DWORD)a3)
    v23 = v22;
  else
    v23 = v22 & 0xFFFFFFBF;
  mBytesPerFrame = a2->mBytesPerFrame;
  if (!mBytesPerFrame)
  {
    v28 = v23 | 8;
    mChannelsPerFrame = a2->mChannelsPerFrame;
    mBitsPerChannel = a2->mBitsPerChannel;
LABEL_53:
    v29 = mBitsPerChannel == 0;
    goto LABEL_54;
  }
  mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((mFormatFlags & 0x20) != 0)
    v26 = 1;
  else
    v26 = a2->mChannelsPerFrame;
  if (!v26)
  {
    mBytesPerFrame = 0;
    mBitsPerChannel = a2->mBitsPerChannel;
    v28 = v23 | 8;
    goto LABEL_53;
  }
  mBytesPerFrame = 8 * (mBytesPerFrame / v26);
  mBitsPerChannel = a2->mBitsPerChannel;
  v28 = v23 | 8;
  v29 = mBytesPerFrame == mBitsPerChannel;
LABEL_54:
  if (v29)
    v23 = v28;
  v30 = (mBitsPerChannel & 7) == 0 && mBytesPerFrame == mBitsPerChannel;
  v31 = v23 & 0xFFFFFFEF;
  if (!v30)
    v31 = v23;
  if ((v31 & 1) != 0)
    v31 &= ~4u;
  v32 = (v31 & 8) == 0 || mBitsPerChannel > 8;
  v33 = v31 & 2;
  if (v32)
    v33 = v31;
  if (mChannelsPerFrame == 1)
    v34 = v33 & 0xFFFFFFDF;
  else
    v34 = v33;
  if (v34)
    mFormatFlags = v34;
  else
    mFormatFlags = 0x80000000;
  return v20 == mFormatFlags;
}

uint64_t std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

uint64_t std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

CFTypeRef applesauce::CF::details::at_to<applesauce::CF::TypeRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  const void *ValueAtIndex;
  const void *v7;
  CFTypeRef result;
  applesauce::CF *exception;

  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (v7 = ValueAtIndex) == 0))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::not_found(exception);
  }
  result = CFRetain(ValueAtIndex);
  *a3 = v7;
  return result;
}

void sub_236D4C2B4()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D4C2D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::not_found(applesauce::CF *this)
{
  JUMPOUT(0x23B802BE8);
}

uint64_t applesauce::CF::at_or<applesauce::CF::NumberRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  CFTypeRef v6;
  CFTypeRef cf;
  char v9;

  applesauce::CF::details::at_as<applesauce::CF::NumberRef>(a1, a2, &cf);
  if (v9)
  {
    v6 = cf;
    if (cf)
      CFRetain(cf);
    *a4 = v6;
  }
  else
  {
    *a4 = *a3;
    *a3 = 0;
  }
  return std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
}

void applesauce::CF::details::at_as<applesauce::CF::NumberRef>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  const void *ValueAtIndex;
  const void *v7;
  CFTypeID v8;
  char v9;

  if (!a1)
    goto LABEL_7;
  if (CFArrayGetCount(a1) <= a2)
    goto LABEL_7;
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  v7 = ValueAtIndex;
  if (!ValueAtIndex)
    goto LABEL_7;
  CFRetain(ValueAtIndex);
  v8 = CFGetTypeID(v7);
  if (v8 != CFNumberGetTypeID())
  {
    CFRelease(v7);
LABEL_7:
    v9 = 0;
    *a3 = 0;
    goto LABEL_8;
  }
  *(_QWORD *)a3 = v7;
  v9 = 1;
LABEL_8:
  a3[8] = v9;
}

uint64_t applesauce::CF::convert_to<unsigned int,0>(const __CFNumber *a1)
{
  uint64_t result;
  applesauce::CF *exception;

  result = applesauce::CF::convert_as<unsigned int,0>(a1);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return result;
}

void sub_236D4C444()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D4C45C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
  JUMPOUT(0x23B802BE8);
}

void applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  const void *ValueAtIndex;
  const void *v7;
  CFTypeID v8;
  char v9;

  if (!a1)
    goto LABEL_7;
  if (CFArrayGetCount(a1) <= a2)
    goto LABEL_7;
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  v7 = ValueAtIndex;
  if (!ValueAtIndex)
    goto LABEL_7;
  CFRetain(ValueAtIndex);
  v8 = CFGetTypeID(v7);
  if (v8 != CFDictionaryGetTypeID())
  {
    CFRelease(v7);
LABEL_7:
    v9 = 0;
    *a3 = 0;
    goto LABEL_8;
  }
  *(_QWORD *)a3 = v7;
  v9 = 1;
LABEL_8:
  a3[8] = v9;
}

_QWORD *applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::iterator_proxy::iterator_proxy(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;

  v3 = *a2;
  if (*a2)
    CFRetain(*a2);
  *a1 = v3;
  return a1;
}

void std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(uint64_t **a1, CFTypeRef *a2, _QWORD *a3, CFTypeRef *a4)
{
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;
  _QWORD v11[2];
  char v12;
  uint64_t v13;

  v7 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<applesauce::CF::StringRef>((uint64_t)a1, &v13, a2);
  v8 = *v7;
  if (!*v7)
  {
    v9 = v7;
    v8 = (uint64_t *)operator new(0x30uLL);
    v11[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef,applesauce::CF::NumberRef,0>(v8 + 4, a3, a4);
    v12 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v9, v8);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

_QWORD *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<applesauce::CF::StringRef>(uint64_t a1, _QWORD *a2, CFTypeRef *a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  CFTypeRef *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = (_QWORD *)v4;
        v8 = (CFTypeRef *)(v4 + 32);
        if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a3, (const __CFString **)(v4 + 32)) != kCFCompareLessThan)break;
        v4 = *v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(v8, (const __CFString **)a3) != kCFCompareLessThan)
        break;
      v5 = v7 + 1;
      v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

CFComparisonResult applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(CFTypeRef *a1, const __CFString **a2)
{
  const __CFString *v3;
  const __CFString *v4;
  CFComparisonResult v5;

  v3 = (const __CFString *)*a1;
  if (*a1)
  {
    CFRetain(*a1);
    v4 = *a2;
    if (!v4)
    {
      v5 = kCFCompareGreaterThan;
LABEL_9:
      CFRelease(v3);
      return v5;
    }
  }
  else
  {
    v4 = *a2;
    if (!*a2)
      return 0;
  }
  CFRetain(v4);
  if (v3)
    v5 = CFStringCompare(v3, v4, 0);
  else
    v5 = kCFCompareLessThan;
  CFRelease(v4);
  if (v3)
    goto LABEL_9;
  return v5;
}

_QWORD *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef,applesauce::CF::NumberRef,0>(_QWORD *a1, _QWORD *a2, CFTypeRef *a3)
{
  CFTypeRef v4;

  *a1 = *a2;
  *a2 = 0;
  v4 = *a3;
  if (*a3)
    CFRetain(*a3);
  a1[1] = v4;
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void **std::vector<applesauce::CF::TypeRefPair>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 16 * v6;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(v7);
  }
  return result;
}

void sub_236D4CAC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(uint64_t *a1, CFTypeRef *a2, const void **a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  void *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v21 = v6;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v6, v14);
    else
      v15 = 0;
    v17 = v15;
    v18 = &v15[16 * v11];
    v20 = &v15[16 * v14];
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(v18, a2, a3);
    v19 = v18 + 16;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, &v17);
    v10 = a1[1];
    std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(&v17);
  }
  else
  {
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(*(_QWORD **)(v6 - 8), a2, a3);
    v10 = v9 + 16;
    a1[1] = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void sub_236D4CBD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(void ***a1)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v5;
  void **v6;
  void **v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  void *v16;
  void **v17;
  void **v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  void **v23;
  void **v24;
  void **v25;
  void *v26;
  CFDictionaryRef v27;
  void *exception;
  void *v30;
  void **values;
  void **v32;
  void **v33;
  void **keys;
  void **v35;
  void **v36;

  v2 = ((char *)a1[1] - (char *)*a1) >> 4;
  keys = 0;
  v35 = 0;
  v36 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  v32 = 0;
  v33 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  v3 = *a1;
  v4 = a1[1];
  if (*a1 != v4)
  {
    do
    {
      v5 = *v3;
      if (!*v3 || !v3[1])
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B802BE8](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v6 = v35;
      if (v35 >= v36)
      {
        v8 = v35 - keys;
        if ((unint64_t)(v8 + 1) >> 61)
          std::vector<char>::__throw_length_error[abi:ne180100]();
        v9 = ((char *)v36 - (char *)keys) >> 2;
        if (v9 <= v8 + 1)
          v9 = v8 + 1;
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8)
          v10 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v10 = v9;
        if (v10)
          v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v36, v10);
        else
          v11 = 0;
        v12 = (void **)&v11[8 * v8];
        *v12 = v5;
        v7 = v12 + 1;
        v14 = keys;
        v13 = v35;
        if (v35 != keys)
        {
          do
          {
            v15 = *--v13;
            *--v12 = v15;
          }
          while (v13 != v14);
          v13 = keys;
        }
        keys = v12;
        v35 = v7;
        v36 = (void **)&v11[8 * v10];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *v35 = v5;
        v7 = v6 + 1;
      }
      v35 = v7;
      v16 = v3[1];
      v17 = v32;
      if (v32 >= v33)
      {
        v19 = v32 - values;
        if ((unint64_t)(v19 + 1) >> 61)
          std::vector<char>::__throw_length_error[abi:ne180100]();
        v20 = ((char *)v33 - (char *)values) >> 2;
        if (v20 <= v19 + 1)
          v20 = v19 + 1;
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v33, v21);
        else
          v22 = 0;
        v23 = (void **)&v22[8 * v19];
        *v23 = v16;
        v18 = v23 + 1;
        v25 = values;
        v24 = v32;
        if (v32 != values)
        {
          do
          {
            v26 = *--v24;
            *--v23 = v26;
          }
          while (v24 != v25);
          v24 = values;
        }
        values = v23;
        v32 = v18;
        v33 = (void **)&v22[8 * v21];
        if (v24)
          operator delete(v24);
      }
      else
      {
        *v32 = v16;
        v18 = v17 + 1;
      }
      v32 = v18;
      v3 += 2;
    }
    while (v3 != v4);
  }
  v27 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v27)
  {
    v30 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](v30, "Could not construct");
    __cxa_throw(v30, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
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
  return v27;
}

void sub_236D4CEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  void *v13;

  __cxa_free_exception(v13);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(a3 - 2);
      a3 -= 2;
      *(_QWORD *)(v8 - 16) = v9;
      v8 -= 16;
      *a3 = 0;
      *(_QWORD *)(v8 + 8) = a3[1];
      a3[1] = 0;
      v7 -= 16;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v3, v1);
      v1 += 16;
    }
    while (v1 != v2);
  }
}

void std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  const void *v3;

  v3 = *(const void **)(a2 + 8);
  if (v3)
    CFRelease(v3);
  if (*(_QWORD *)a2)
    CFRelease(*(CFTypeRef *)a2);
}

void **std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(void **a1)
{
  std::__split_buffer<applesauce::CF::TypeRefPair>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<applesauce::CF::TypeRefPair>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v4, i - 16);
  }
}

_QWORD *applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(_QWORD *a1, CFTypeRef *a2, const void **a3)
{
  CFTypeRef v5;
  const void *v6;

  v5 = *a2;
  if (*a2)
    CFRetain(*a2);
  *a1 = v5;
  v6 = *a3;
  if (v6)
    CFRetain(v6);
  a1[1] = v6;
  return a1;
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
      std::vector<char>::__throw_length_error[abi:ne180100]();
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

const __CFBoolean *applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2)
{
  const __CFBoolean *result;

  result = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (result)
    return applesauce::CF::convert_as<unsigned long long,0>(result);
  return result;
}

const __CFBoolean *applesauce::CF::convert_as<unsigned long long,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return (const __CFBoolean *)applesauce::CF::details::number_convert_as<unsigned long long>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned long long>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned long long>(const __CFBoolean *result)
{
  const __CFBoolean *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = result;
    TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1))
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    else
      return 0;
  }
  return result;
}

unint64_t applesauce::CF::details::number_convert_as<unsigned long long>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  unint64_t v4;
  unint64_t v5;
  const __CFNumber *v6;
  CFNumberType v7;
  const __CFNumber *v8;
  CFNumberType v9;
  const __CFNumber *v10;
  CFNumberType v11;
  const __CFNumber *v12;
  CFNumberType v13;
  const __CFNumber *v14;
  CFNumberType v15;
  int Value;
  char v17;
  BOOL v18;
  unsigned __int8 v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  double valuePtr;

  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      v6 = a1;
      v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v8 = a1;
      v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v10 = a1;
      v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v12 = a1;
      v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v14 = a1;
      v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value)
        v17 = LOBYTE(valuePtr);
      else
        v17 = 0;
      if (Value != 0 && SLOBYTE(valuePtr) < 0)
        v4 = -256;
      else
        v4 = 0;
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v6 = a1;
      v7 = kCFNumberShortType;
LABEL_18:
      v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      v19 = LOBYTE(valuePtr);
      v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v8 = a1;
      v9 = kCFNumberIntType;
LABEL_20:
      v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      v19 = LOBYTE(valuePtr);
      v20 = SLODWORD(valuePtr);
LABEL_21:
      v21 = v20 & 0xFFFFFFFFFFFFFF00 | v19;
      if (v18)
        v5 = 0;
      else
        v5 = v21;
      goto LABEL_37;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v10 = a1;
      v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v10 = a1;
      v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v12 = a1;
      v13 = kCFNumberFloatType;
LABEL_27:
      v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      v5 = (unint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v14 = a1;
      v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v10 = a1;
      v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v10 = a1;
      v11 = kCFNumberNSIntegerType;
LABEL_31:
      v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      v5 = *(_QWORD *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v14 = a1;
      v15 = kCFNumberCGFloatType;
LABEL_33:
      v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      v5 = (unint64_t)valuePtr;
LABEL_34:
      if (v22)
        v5 = 0;
LABEL_37:
      v4 = v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return v5 | v4;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, _BYTE *a3@<X8>)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  char v7;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  CFRetain(v4);
  v6 = CFGetTypeID(v5);
  if (v6 != CFDictionaryGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(_QWORD *)a3 = v5;
  v7 = 1;
LABEL_6:
  a3[8] = v7;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, _BYTE *a3@<X8>)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  char v7;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  CFRetain(v4);
  v6 = CFGetTypeID(v5);
  if (v6 != CFArrayGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(_QWORD *)a3 = v5;
  v7 = 1;
LABEL_6:
  a3[8] = v7;
}

uint64_t applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2)
{
  const __CFDictionary *v2;
  int v3;

  v2 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (v2)
  {
    LOWORD(v2) = applesauce::CF::convert_as<BOOL,0>(v2);
    v3 = BYTE1(v2);
  }
  else
  {
    v3 = 0;
  }
  return v2 | (v3 << 8);
}

uint64_t applesauce::CF::convert_as<BOOL,0>(const __CFNumber *a1)
{
  const __CFNumber *v1;
  CFTypeID TypeID;
  int v3;
  CFTypeID v4;

  if (!a1)
    goto LABEL_7;
  v1 = a1;
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v1))
  {
    v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(v1))
    {
      LOWORD(a1) = applesauce::CF::details::number_convert_as<BOOL>(v1);
      v3 = BYTE1(a1);
      return a1 | (v3 << 8);
    }
    LOBYTE(a1) = 0;
LABEL_7:
    v3 = 0;
    return a1 | (v3 << 8);
  }
  LOBYTE(a1) = CFBooleanGetValue(v1) != 0;
  v3 = 1;
  return a1 | (v3 << 8);
}

uint64_t applesauce::CF::details::number_convert_as<BOOL>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  int v4;
  const __CFNumber *v5;
  CFNumberType v6;
  const __CFNumber *v7;
  CFNumberType v8;
  const __CFNumber *v9;
  CFNumberType v10;
  const __CFNumber *v11;
  CFNumberType v12;
  const __CFNumber *v13;
  CFNumberType v14;
  int Value;
  BOOL v16;
  int v17;
  BOOL v18;
  BOOL v19;
  int v20;
  double valuePtr;

  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      v5 = a1;
      v6 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberSInt64Type;
      goto LABEL_25;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloat32Type;
      goto LABEL_21;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberFloat64Type;
      goto LABEL_29;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      v16 = Value == 0;
      v17 = LOBYTE(valuePtr);
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v5 = a1;
      v6 = kCFNumberShortType;
LABEL_12:
      Value = CFNumberGetValue(v5, v6, &valuePtr);
      v16 = Value == 0;
      v17 = LOWORD(valuePtr);
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberIntType;
LABEL_14:
      Value = CFNumberGetValue(v7, v8, &valuePtr);
      v16 = Value == 0;
      v17 = LODWORD(valuePtr);
LABEL_15:
      v18 = v16 || v17 == 0;
      goto LABEL_33;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongType;
      goto LABEL_25;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongLongType;
      goto LABEL_25;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloatType;
LABEL_21:
      Value = CFNumberGetValue(v11, v12, &valuePtr);
      v19 = *(float *)&valuePtr == 0.0;
      goto LABEL_30;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberDoubleType;
      goto LABEL_29;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberCFIndexType;
      goto LABEL_25;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberNSIntegerType;
LABEL_25:
      Value = CFNumberGetValue(v9, v10, &valuePtr);
      if (Value)
        v18 = *(_QWORD *)&valuePtr == 0;
      else
        v18 = 1;
      goto LABEL_33;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberCGFloatType;
LABEL_29:
      Value = CFNumberGetValue(v13, v14, &valuePtr);
      v19 = valuePtr == 0.0;
LABEL_30:
      v18 = v19 || Value == 0;
LABEL_33:
      v4 = !v18;
      if (!Value)
        goto LABEL_38;
      v20 = 256;
      break;
    default:
      v4 = 0;
LABEL_38:
      v20 = 0;
      break;
  }
  return v20 | v4;
}

uint64_t applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  uint64_t result;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    return *a3;
  result = applesauce::CF::convert_as<unsigned int,0>(v4);
  if ((result & 0xFF00000000) != 0)
    return result;
  else
    return *a3;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::StringRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, _BYTE *a3@<X8>)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  char v7;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  CFRetain(v4);
  v6 = CFGetTypeID(v5);
  if (v6 != CFStringGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(_QWORD *)a3 = v5;
  v7 = 1;
LABEL_6:
  a3[8] = v7;
}

uint64_t applesauce::CF::at_or<int &,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2, unsigned int *a3)
{
  const __CFDictionary *v4;
  uint64_t result;

  v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4)
    return *a3;
  result = applesauce::CF::convert_as<int,0>(v4);
  if ((result & 0xFF00000000) != 0)
    return result;
  else
    return *a3;
}

uint64_t applesauce::CF::convert_as<int,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return applesauce::CF::details::number_convert_as<int>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::number_convert_as<int>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const __CFNumber *v7;
  CFNumberType v8;
  const __CFNumber *v9;
  CFNumberType v10;
  const __CFNumber *v11;
  CFNumberType v12;
  const __CFNumber *v13;
  CFNumberType v14;
  int Value;
  uint64_t v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  uint64_t v20;
  double valuePtr;

  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      v16 = Value != 0;
      if (Value)
        v17 = LOBYTE(valuePtr);
      else
        v17 = 0;
      v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0)
        v18 = 0;
      v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr))
        v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      else
        v6 = 0;
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloatType;
LABEL_24:
      v19 = CFNumberGetValue(v11, v12, &valuePtr);
      v20 = (int)*(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberNSIntegerType;
LABEL_28:
      v19 = CFNumberGetValue(v9, v10, &valuePtr);
      v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberCGFloatType;
LABEL_30:
      v19 = CFNumberGetValue(v13, v14, &valuePtr);
      v20 = (int)valuePtr;
LABEL_31:
      v6 = v20 | 0x100000000;
      if (!v19)
        v6 = 0;
LABEL_33:
      v4 = v6 & 0xFFFFFF00;
      v5 = v6 & 0x100000000;
      break;
    default:
      v4 = 0;
      v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  return a1;
}

_QWORD *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_236D4DE04(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

_QWORD *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_236D4DEF0(_Unwind_Exception *exception_object)
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

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_236D4DF64(_Unwind_Exception *exception_object)
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

unint64_t applesauce::CF::details::at_as<unsigned int>(const __CFArray *a1, unint64_t a2)
{
  const __CFNumber *ValueAtIndex;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 && CFArrayGetCount(a1) > a2 && (ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2)) != 0)
  {
    v5 = applesauce::CF::convert_as<unsigned int,0>(ValueAtIndex);
    v6 = v5 & 0xFFFFFF0000000000;
    v7 = v5 & 0xFF00000000;
    v8 = v5 & 0xFFFFFF00;
    v9 = v5;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v7 = 0;
    v9 = 0;
  }
  return v6 | v8 | v7 | v9;
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<unsigned int>(_QWORD *a1)
{
  unint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  CFArrayRef v5;
  uint64_t *v7[3];
  void **v8;

  v2 = (uint64_t)(a1[1] - *a1) >> 2;
  memset(v7, 0, sizeof(v7));
  std::vector<applesauce::CF::NumberRef>::reserve((uint64_t *)v7, v2);
  v4 = (_DWORD *)*a1;
  v3 = (_DWORD *)a1[1];
  while (v4 != v3)
  {
    LODWORD(v8) = *v4;
    std::vector<applesauce::CF::NumberRef>::emplace_back<unsigned int>((uint64_t *)v7, (int *)&v8);
    ++v4;
  }
  v5 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(v7);
  v8 = (void **)v7;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v5;
}

void sub_236D4E084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void **std::vector<applesauce::CF::NumberRef>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 8 * v6;
    std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(v7);
  }
  return result;
}

void sub_236D4E120(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

CFNumberRef *std::vector<applesauce::CF::NumberRef>::emplace_back<unsigned int>(uint64_t *a1, int *a2)
{
  unint64_t v4;
  uint64_t v5;
  CFNumberRef *v6;
  CFNumberRef *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  void *v14;
  CFNumberRef *v15;
  CFNumberRef *v16;
  char *v17;
  uint64_t *v18;

  v5 = (uint64_t)(a1 + 2);
  v4 = a1[2];
  v6 = (CFNumberRef *)a1[1];
  if ((unint64_t)v6 >= v4)
  {
    v8 = ((uint64_t)v6 - *a1) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v9 = v4 - *a1;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    v18 = a1 + 2;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), v11);
    else
      v12 = 0;
    v14 = v12;
    v15 = (CFNumberRef *)&v12[8 * v8];
    v17 = &v12[8 * v11];
    std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>(v5, v15, a2);
    v16 = v15 + 1;
    std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(a1, &v14);
    v7 = (CFNumberRef *)a1[1];
    std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(&v14);
  }
  else
  {
    std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>((uint64_t)(a1 + 2), v6, a2);
    v7 = v6 + 1;
    a1[1] = (uint64_t)(v6 + 1);
  }
  a1[1] = (uint64_t)v7;
  return v7 - 1;
}

void sub_236D4E238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p[3];

  std::vector<void const*>::vector(__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p[0];
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_236D4E2D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *--a3;
      *(_QWORD *)(v8 - 8) = v9;
      v8 -= 8;
      *a3 = 0;
      v7 -= 8;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>::operator()[abi:ne180100](uint64_t *a1)
{
  CFTypeRef *v1;
  CFTypeRef *v2;
  uint64_t v3;

  v1 = *(CFTypeRef **)(a1[2] + 8);
  v2 = *(CFTypeRef **)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
      std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](v3, v1++);
    while (v1 != v2);
  }
}

void std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](uint64_t a1, CFTypeRef *a2)
{
  if (*a2)
    CFRelease(*a2);
}

void **std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(void **a1)
{
  std::__split_buffer<applesauce::CF::NumberRef>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<applesauce::CF::NumberRef>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 8;
    std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](v4, (CFTypeRef *)(i - 8));
  }
}

CFNumberRef std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>(uint64_t a1, CFNumberRef *a2, int *a3)
{
  CFNumberRef result;
  void *exception;
  int valuePtr;

  valuePtr = *a3;
  result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a2 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B802BE8](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_236D4E584(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(uint64_t a1)
{
  CFArrayRef result;
  applesauce::CF *exception;

  result = CFArrayCreate(0, *(const void ***)a1, (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3, MEMORY[0x24BDBD690]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_236D4E5FC()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D4E614(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<void const*>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_236D4E680(_Unwind_Exception *exception_object)
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

char *std::vector<void const*>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  CFTypeRef *v2;
  CFTypeRef *v4;
  void *v5;

  v1 = *a1;
  v2 = (CFTypeRef *)**a1;
  if (v2)
  {
    v4 = (CFTypeRef *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100]((uint64_t)(v1 + 2), --v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_236D4E900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_236D4E96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2Stream;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D4EA10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D4EC24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D4EDAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D4F184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_236D4F2FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D4F408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a6);

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236D4F720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_236D4F8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_236D4F9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D4FB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236D4FB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D4FC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D4FD44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D4FE18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D4FF38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D500A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_236D50590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_236D50B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_236D50D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D50E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D50F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D50FC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B802D68](v1, 0x10F3C4052DED294);
  _Unwind_Resume(a1);
}

void sub_236D5164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_236D51828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_236D518D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2Device;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D51C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  void *v25;

  _Block_object_dispose(&a15, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_236D51CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D51DC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  _Unwind_Resume(exception_object);
}

void sub_236D51EE4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D51FD0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_236D520EC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D522B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_236D52334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D52548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236D5295C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_236D52B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D52CFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  const void *v6;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v6 = va_arg(va1, const void *);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_236D52FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t v21;
  void *v22;

  v21 = 0;
  while (1)
  {
    v22 = *(void **)(v19 + v21 + 24);
    if (v22)
    {
      *(_QWORD *)(v19 + v21 + 32) = v22;
      operator delete(v22);
    }
    v21 -= 24;
    if (v21 == -48)
      _Unwind_Resume(exception_object);
  }
}

void sub_236D5319C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D532F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5353C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D536CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D538EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D53AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;

  v20 = 0;
  while (1)
  {
    v21 = *(void **)(&a15 + v20 + 24);
    if (v21)
    {
      *(_QWORD *)(&a15 + v20 + 32) = v21;
      operator delete(v21);
    }
    v20 -= 24;
    if (v20 == -48)
      _Unwind_Resume(a1);
  }
}

void clearMark(NSArray *a1)
{
  NSArray *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "setMarked:", 0, (_QWORD)v6);
        ++v4;
      }
      while (v2 != v4);
      v2 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

{
  NSArray *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "setMarked:", 0, (_QWORD)v6);
        ++v4;
      }
      while (v2 != v4);
      v2 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

void sub_236D53C90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D541D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_236D54604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>(uint64_t a1, uint64_t a2, double *a3)
{
  std::__shared_weak_count *v6;
  std::mutex *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BOOL8 v10;
  double v11;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v12;
  unint64_t *v13;
  unint64_t v14;
  std::unique_lock<std::mutex> v16;
  std::mutex *v17;
  std::__shared_weak_count *v18;

  v7 = *(std::mutex **)(a1 + 48);
  v6 = *(std::__shared_weak_count **)(a1 + 56);
  v17 = v7;
  v18 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v16.__m_ = v7;
  v16.__owns_ = 1;
  std::mutex::lock(v7);
  std::unique_lock<std::shared_mutex>::unlock(a2);
  if (*a3 > (double)std::chrono::system_clock::now().__d_.__rep_)
  {
    v11 = *a3 * 1000.0;
    if (v11 >= 9.22337204e18)
    {
      v12.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (v11 <= -9.22337204e18)
    {
      v12.__d_.__rep_ = 0x8000000000000000;
    }
    else
    {
      v12.__d_.__rep_ = (uint64_t)v11;
    }
    std::condition_variable::__do_timed_wait((std::condition_variable *)a1, &v16, v12);
    v10 = *a3 <= (double)std::chrono::system_clock::now().__d_.__rep_;
  }
  else
  {
    v10 = 1;
  }
  std::unique_lock<std::mutex>::unlock(&v16);
  std::unique_lock<std::shared_mutex>::lock(a2);
  if (v16.__owns_)
    std::mutex::unlock(v16.__m_);
  if (v6)
  {
    v13 = (unint64_t *)&v6->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v10;
}

void sub_236D54794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::mutex *v11;

  std::mutex::unlock(v11);
  std::shared_ptr<std::mutex>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void std::unique_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  ASDTIOA2Device *v2;
  SEL v3;
  unsigned int v4;

  if (*(_BYTE *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    -[ASDTIOA2Device _getCurrentFormatForStream:](v2, v3, v4);
  }
}

void sub_236D548D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236D54C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236D54EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D55068(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B802D68](v1, 0x1081C40DA68619CLL);
  _Unwind_Resume(a1);
}

void sub_236D552DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  if (a15)
    (*(void (**)(uint64_t))(*(_QWORD *)a15 + 8))(a15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236D55398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D554A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D555B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D556D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D557E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D55900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D55A18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D55D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_236D55E10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D55EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  void *v10;

  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a10);

  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::from_ns_noexcept(applesauce::CF::StringRef *this@<X0>, applesauce::CF::StringRef **a2@<X8>)
{
  applesauce::CF::StringRef *v4;
  CFTypeID v5;
  BOOL v6;
  applesauce::CF::StringRef *cf;

  v4 = this;
  if (!v4 || (cf = v4, CFRetain(v4), v5 = CFGetTypeID(cf), v6 = v5 == CFStringGetTypeID(), v4 = cf, v6))
  {
    *a2 = v4;
  }
  else
  {
    *a2 = 0;
    CFRelease(cf);
    v4 = cf;
  }

}

void sub_236D55FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  void *v9;

  applesauce::CF::StringRef::~StringRef(&a9);

  _Unwind_Resume(a1);
}

void sub_236D56094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  void *v10;

  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DataRef::~DataRef(&a10);

  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::DataRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  applesauce::CF::DataRef *v4;
  uint64_t v5;
  CFTypeRef cf;

  cf = 0;
  if ((ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf) & 1) != 0)
    v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  else
    v5 = 0;
  if (cf)
    CFRelease(cf);
  return v5;
}

void sub_236D56114(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_236D56290(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D563FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5668C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10)
    std::mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

void std::unique_lock<std::mutex>::unlock(std::unique_lock<std::mutex> *this)
{
  ASDTIOA2Device *v2;
  SEL v3;
  int v4;

  if (this->__owns_)
  {
    std::mutex::unlock(this->__m_);
    this->__owns_ = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    -[ASDTIOA2Device performPowerStatePrepare:](v2, v3, v4);
  }
}

void sub_236D569C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(exception_object);
}

void sub_236D56A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236D56BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D56DC0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D57108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D571E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D574D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D575E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D57728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  va_list va;

  va_start(va, a10);

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236D577A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D57B68(_Unwind_Exception *a1)
{
  std::condition_variable *v1;

  std::condition_variable::~condition_variable(v1);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::mutex>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void std::__shared_ptr_emplace<std::mutex>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_25084B578;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::mutex>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_25084B578;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B802D68);
}

void std::__shared_ptr_emplace<std::mutex>::__on_zero_shared(uint64_t a1)
{
  std::mutex::~mutex((std::mutex *)(a1 + 24));
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  return a1;
}

applesauce::CF::DictionaryRef *applesauce::CF::details::at_to<applesauce::CF::DictionaryRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  const void *ValueAtIndex;
  const void *v7;
  applesauce::CF *exception;

  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (v7 = ValueAtIndex) == 0))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::not_found(exception);
  }
  CFRetain(ValueAtIndex);
  return applesauce::CF::DictionaryRef::DictionaryRef(a3, v7);
}

void sub_236D57CD0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D57CF4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::unique_lock<std::shared_mutex>::lock(uint64_t a1)
{
  std::__shared_mutex_base *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;

  v2 = *(std::__shared_mutex_base **)a1;
  if (v2)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      std::__shared_mutex_base::lock(v2);
      *(_BYTE *)(a1 + 8) = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  OUTLINED_FUNCTION_0_1(v3, v4, v5, v6, v7);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X2>, int a2@<W8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 14) = v2;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = a2;
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2080;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this)
{
  *(_QWORD *)this = &off_25084B5C8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((_BYTE *)this + 34) = 1;
  return this;
}

{
  *(_QWORD *)this = &off_25084B5C8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((_BYTE *)this + 34) = 1;
  return this;
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this, int a2)
{
  *(_QWORD *)this = &off_25084B5C8;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((_BYTE *)this + 34) = 1;
  return this;
}

{
  *(_QWORD *)this = &off_25084B5C8;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((_BYTE *)this + 34) = 1;
  return this;
}

uint64_t ASDT::UCObject::UCObject(uint64_t this, const __CFDictionary *a2)
{
  *(_QWORD *)this = &off_25084B5C8;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a2;
  *(_WORD *)(this + 24) = 1;
  *(_WORD *)(this + 32) = 0;
  *(_BYTE *)(this + 34) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_25084B5C8;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a2;
  *(_WORD *)(this + 24) = 1;
  *(_WORD *)(this + 32) = 0;
  *(_BYTE *)(this + 34) = 0;
  return this;
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this, const ASDT::UCObject *a2)
{
  void (**v4)(ASDT::UCObject *__hidden);
  const void *v5;
  int v6;

  v4 = &off_25084B5C8;
  *(_QWORD *)this = &off_25084B5C8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 3) = 0;
  v5 = (const void *)*((_QWORD *)a2 + 2);
  *((_QWORD *)this + 2) = v5;
  v6 = *((unsigned __int8 *)a2 + 24);
  *((_BYTE *)this + 24) = v6;
  *((_BYTE *)this + 25) = *((_BYTE *)a2 + 25);
  if (v6 && v5)
  {
    CFRetain(v5);
    v4 = *(void (***)(ASDT::UCObject *__hidden))this;
  }
  *((_WORD *)this + 16) = *((_WORD *)a2 + 16);
  *((_BYTE *)this + 34) = *((_BYTE *)a2 + 34);
  v4[4](this);
  return this;
}

void sub_236D58034(_Unwind_Exception *a1)
{
  CACFDictionary *v1;

  CACFDictionary::~CACFDictionary(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::operator=(uint64_t a1, int a2)
{
  io_connect_t v4;

  v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = a2;
  *(_BYTE *)(a1 + 34) = 1;
  *(_BYTE *)(a1 + 32) = 1;
  return a1;
}

uint64_t ASDT::UCObject::CloseConnection(ASDT::UCObject *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 3);
  if ((_DWORD)result)
  {
    result = IOServiceClose(result);
    *((_DWORD *)this + 3) = 0;
  }
  return result;
}

uint64_t ASDT::UCObject::operator=(uint64_t a1, uint64_t a2)
{
  io_connect_t v4;
  const void *v5;

  v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  CACFDictionary::operator=(a1 + 16, a2 + 16);
  v5 = *(const void **)(a1 + 16);
  if (v5)
    CFRelease(v5);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  return a1;
}

uint64_t CACFDictionary::operator=(uint64_t a1, uint64_t a2)
{
  const void *v4;
  const void *v5;
  int v6;
  BOOL v7;

  if (*(_BYTE *)(a1 + 8))
  {
    v4 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v4);
  }
  v5 = *(const void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(unsigned __int8 *)(a2 + 8);
  *(_BYTE *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
    CFRetain(v5);
  return a1;
}

void ASDT::UCObject::~UCObject(ASDT::UCObject *this)
{
  void (**v2)(ASDT::UCObject *__hidden);
  io_connect_t v3;

  v2 = &off_25084B5C8;
  *(_QWORD *)this = &off_25084B5C8;
  v3 = *((_DWORD *)this + 3);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 3) = 0;
    v2 = *(void (***)(ASDT::UCObject *__hidden))this;
  }
  v2[6](this);
  CACFDictionary::~CACFDictionary((CACFDictionary *)this + 1);
}

{
  ASDT::UCObject::~UCObject(this);
  JUMPOUT(0x23B802D68);
}

uint64_t ASDT::UCObject::GetObject(ASDT::UCObject *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t ASDT::UCObject::CopyObject(ASDT::UCObject *this)
{
  (*(void (**)(ASDT::UCObject *))(*(_QWORD *)this + 32))(this);
  return *((unsigned int *)this + 2);
}

BOOL ASDT::UCObject::IsValid(ASDT::UCObject *this)
{
  return *((_DWORD *)this + 2) != 0;
}

BOOL ASDT::UCObject::IsEqualTo(ASDT::UCObject *this, io_object_t a2)
{
  return IOObjectIsEqualTo(*((_DWORD *)this + 2), a2) != 0;
}

BOOL ASDT::UCObject::ConformsTo(ASDT::UCObject *this, const char *a2)
{
  return IOObjectConformsTo(*((_DWORD *)this + 2), a2) != 0;
}

uint64_t ASDT::UCObject::IsServiceAlive(ASDT::UCObject *this)
{
  return *((unsigned __int8 *)this + 34);
}

uint64_t ASDT::UCObject::ServiceWasTerminated(uint64_t this)
{
  *(_BYTE *)(this + 34) = 0;
  return this;
}

BOOL ASDT::UCObject::TestForLiveness(_BOOL8 this)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;

  if (this)
  {
    properties = 0;
    v1 = IORegistryEntryCreateCFProperties(this, &properties, 0, 0);
    if (properties)
      CFRelease(properties);
    return v1 == 0;
  }
  return this;
}

CFMutableDictionaryRef ASDT::UCObject::CopyProperties(ASDT::UCObject *this)
{
  kern_return_t v2;
  CFMutableDictionaryRef result;
  _DWORD *exception;
  kern_return_t v5;
  CFMutableDictionaryRef properties;

  properties = 0;
  if (*((_BYTE *)this + 33))
  {
    v2 = IORegistryEntryCreateCFProperties(*((_DWORD *)this + 2), &properties, 0, 0);
    if (v2)
    {
      v5 = v2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::UCObject::CopyProperties();
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v5;
    }
    return properties;
  }
  else
  {
    (*(void (**)(ASDT::UCObject *))(*(_QWORD *)this + 24))(this);
    result = (CFMutableDictionaryRef)*((_QWORD *)this + 2);
    if (result)
    {
      CFRetain(result);
      return (CFMutableDictionaryRef)*((_QWORD *)this + 2);
    }
  }
  return result;
}

uint64_t ASDT::UCObject::HasProperty(ASDT::UCObject *this, const __CFString *a2)
{
  uint64_t HasKey;
  CACFDictionary v5;

  v5.var0 = ASDT::UCObject::CopyProperties(this);
  *(_WORD *)&v5.var1 = 1;
  HasKey = CACFDictionary::HasKey(&v5, a2);
  CACFDictionary::~CACFDictionary(&v5);
  return HasKey;
}

void sub_236D5842C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CACFDictionary a9)
{
  CACFDictionary::~CACFDictionary(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::CopyProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, BOOL *a3)
{
  CFTypeID v4;
  uint64_t v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeRef v9;
  char v10;
  CFTypeRef cf;
  int valuePtr;

  cf = 0;
  if (ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFBooleanGetTypeID())
    {
      *a3 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
    }
    else
    {
      v6 = CFGetTypeID(cf);
      if (v6 != CFNumberGetTypeID())
      {
        v5 = 0;
LABEL_12:
        CFRelease(cf);
        return v5;
      }
      v9 = cf;
      v10 = 0;
      valuePtr = 0;
      if (cf)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        v7 = valuePtr != 0;
      }
      else
      {
        v7 = 0;
      }
      *a3 = v7;
      CACFNumber::~CACFNumber((CACFNumber *)&v9);
    }
    v5 = 1;
    goto LABEL_12;
  }
  return 0;
}

void sub_236D5851C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFNumber::~CACFNumber((CACFNumber *)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_CFType(ASDT::UCObject *this, CFStringRef key, const void **a3)
{
  CFTypeRef CFProperty;
  uint64_t CFType;
  CACFDictionary *v7;

  if (*((_BYTE *)this + 33))
  {
    CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 2), key, 0, 0);
    *a3 = CFProperty;
    return CFProperty != 0;
  }
  else
  {
    v7 = (CACFDictionary *)((char *)this + 16);
    (*(void (**)(ASDT::UCObject *))(*(_QWORD *)this + 24))(this);
    CFType = CACFDictionary::GetCFType(v7, key, a3);
    if (*a3)
      CFRetain(*a3);
  }
  return CFType;
}

BOOL ASDT::UCObject::CopyProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, int *a3)
{
  CFTypeID v4;
  BOOL v5;
  _BOOL8 v6;
  int v7;
  CFTypeRef v9;
  char v10;
  CFTypeRef cf;
  int valuePtr;

  cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
    return 0;
  v4 = CFGetTypeID(cf);
  v5 = v4 == CFNumberGetTypeID();
  v6 = v5;
  if (v5)
  {
    v9 = cf;
    v10 = 0;
    valuePtr = 0;
    if (cf)
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      v7 = valuePtr;
    }
    else
    {
      v7 = 0;
    }
    *a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_236D58654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFNumber::~CACFNumber((CACFNumber *)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, unsigned int *a3)
{
  CFTypeID v4;
  BOOL v5;
  _BOOL8 v6;
  unsigned int v7;
  CFTypeRef v9;
  char v10;
  CFTypeRef cf;
  unsigned int valuePtr;

  cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
    return 0;
  v4 = CFGetTypeID(cf);
  v5 = v4 == CFNumberGetTypeID();
  v6 = v5;
  if (v5)
  {
    v9 = cf;
    v10 = 0;
    valuePtr = 0;
    if (cf)
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      v7 = valuePtr;
    }
    else
    {
      v7 = 0;
    }
    *a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_236D58704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFNumber::~CACFNumber((CACFNumber *)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_Fixed32(ASDT::UCObject *this, const __CFString *a2, float *a3)
{
  CFTypeID v4;
  BOOL v5;
  _BOOL8 v6;
  int v7;
  CFTypeRef v9;
  char v10;
  CFTypeRef cf;

  cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
    return 0;
  v4 = CFGetTypeID(cf);
  v5 = v4 == CFNumberGetTypeID();
  v6 = v5;
  if (v5)
  {
    v9 = cf;
    v10 = 0;
    CACFNumber::GetFixed32((CACFNumber *)&v9);
    *(_DWORD *)a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_236D5879C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_Fixed64(ASDT::UCObject *this, const __CFString *a2, double *a3)
{
  CFTypeID v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;
  CFTypeRef v9;
  char v10;
  CFTypeRef cf;

  cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
    return 0;
  v4 = CFGetTypeID(cf);
  v5 = v4 == CFNumberGetTypeID();
  v6 = v5;
  if (v5)
  {
    v9 = cf;
    v10 = 0;
    CACFNumber::GetFixed64((CACFNumber *)&v9);
    *(_QWORD *)a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_236D58834(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_CFString(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  _BOOL8 result;
  CFTypeID v5;
  CFTypeRef cf;

  cf = 0;
  result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFStringGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFArray(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  _BOOL8 result;
  CFTypeID v5;
  CFTypeRef cf;

  cf = 0;
  result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFArrayGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFDictionary(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  _BOOL8 result;
  CFTypeID v5;
  CFTypeRef cf;

  cf = 0;
  result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFDictionaryGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFData(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  _BOOL8 result;
  CFTypeID v5;
  CFTypeRef cf;

  cf = 0;
  result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFDataGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

void ASDT::UCObject::CopyProperty_CACFString(ASDT::UCObject *this, const __CFString *a2, CACFString *a3)
{
  CFTypeRef v4;
  CFTypeRef cf;

  cf = 0;
  if (ASDT::UCObject::CopyProperty_CFString(this, a2, &cf))
  {
    v4 = cf;
    CACFString::operator=((uint64_t)a3, cf);
    if (v4)
      CFRelease(v4);
  }
}

uint64_t CACFString::operator=(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4;
  BOOL v5;

  v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4)
      v5 = *(_BYTE *)(a1 + 8) == 0;
    else
      v5 = 1;
    if (!v5)
      CFRelease(v4);
    *(_QWORD *)a1 = cf;
  }
  *(_BYTE *)(a1 + 8) = 1;
  if (cf)
    CFRetain(cf);
  return a1;
}

void ASDT::UCObject::CopyProperty_CACFArray(ASDT::UCObject *this, const __CFString *a2, CACFArray *a3)
{
  __CFArray *v4;
  __CFArray *v5;

  v5 = 0;
  if (ASDT::UCObject::CopyProperty_CFArray(this, a2, (CFTypeRef *)&v5))
  {
    v4 = v5;
    CACFArray::operator=((uint64_t)a3, v5);
    if (v4)
      CFRelease(v4);
  }
}

uint64_t CACFArray::operator=(uint64_t a1, const void *a2)
{
  const void *v4;
  int v5;

  if (!*(_BYTE *)(a1 + 8))
  {
    *(_QWORD *)a1 = a2;
    *(_BYTE *)(a1 + 9) = 0;
    return a1;
  }
  v4 = *(const void **)a1;
  if (!*(_QWORD *)a1)
  {
    *(_QWORD *)a1 = a2;
    *(_BYTE *)(a1 + 9) = 0;
    if (!a2)
      return a1;
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  v5 = *(unsigned __int8 *)(a1 + 8);
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 9) = 0;
  if (a2 && v5)
    goto LABEL_8;
  return a1;
}

void ASDT::UCObject::CopyProperty_CACFDictionary(ASDT::UCObject *this, const __CFString *a2, CACFDictionary *a3)
{
  __CFDictionary *v4;
  __CFDictionary *v5;

  v5 = 0;
  if (ASDT::UCObject::CopyProperty_CFDictionary(this, a2, (CFTypeRef *)&v5))
  {
    v4 = v5;
    CACFArray::operator=((uint64_t)a3, v5);
    if (v4)
      CFRelease(v4);
  }
}

uint64_t ASDT::UCObject::CopyProperty_CACFType(CACFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  CACFDictionary *v5;
  uint64_t result;
  CFTypeRef cf;

  v5 = a1 + 1;
  (*((void (**)(CACFDictionary *))a1->var0 + 3))(a1);
  cf = 0;
  result = CACFDictionary::GetCFType(v5, a2, &cf);
  if ((_DWORD)result)
    return CACFObject<void const*>::operator=(a3, cf);
  return result;
}

uint64_t CACFObject<void const*>::operator=(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (*(_BYTE *)(a1 + 8))
  {
    v4 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v4);
  }
  *(_QWORD *)a1 = cf;
  *(_BYTE *)(a1 + 8) = 1;
  if (cf)
    CFRetain(cf);
  return a1;
}

uint64_t ASDT::UCObject::SetProperty(ASDT::UCObject *this, const __CFString *a2, const void *a3)
{
  uint64_t result;
  _DWORD *exception;
  int v5;

  result = IORegistryEntrySetCFProperty(*((_DWORD *)this + 2), a2, a3);
  if ((_DWORD)result)
  {
    v5 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::UCObject::SetProperty();
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = v5;
  }
  return result;
}

void ASDT::UCObject::SetProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  char v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_236D58D54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  char v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_236D58DC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  char v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_236D58E3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::PropertiesChanged(uint64_t this)
{
  *(_BYTE *)(this + 32) = 1;
  return this;
}

void ASDT::UCObject::CacheProperties(ASDT::UCObject *this)
{
  io_registry_entry_t v2;
  kern_return_t v3;
  kern_return_t v4;
  _DWORD *exception;
  CFMutableDictionaryRef properties;

  if (!*((_BYTE *)this + 33))
  {
    v2 = *((_DWORD *)this + 2);
    if (v2)
    {
      if (*((_BYTE *)this + 32))
      {
        properties = 0;
        v3 = IORegistryEntryCreateCFProperties(v2, &properties, 0, 0);
        if (v3)
        {
          v4 = v3;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ASDT::UCObject::CacheProperties();
          exception = __cxa_allocate_exception(0x10uLL);
          *(_QWORD *)exception = &unk_25084B660;
          exception[2] = v4;
        }
        CACFDictionary::SetCFMutableDictionaryFromCopy((CACFDictionary *)this + 1, properties, 1);
        if (properties)
          CFRelease(properties);
        *((_BYTE *)this + 32) = 0;
      }
    }
  }
}

__CFDictionary *CACFDictionary::SetCFMutableDictionaryFromCopy(CACFDictionary *this, CFDictionaryRef theDict, BOOL a3)
{
  __CFDictionary *var0;
  __CFDictionary *result;

  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0)
      CFRelease(var0);
  }
  result = CFDictionaryCreateMutableCopy(0, 0, theDict);
  this->var0 = result;
  this->var2 = 1;
  this->var1 = a3;
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, BOOL *a4)
{
  const __CFBoolean *CFProperty;
  const __CFBoolean *v6;
  CFTypeID v7;
  uint64_t v8;
  CFTypeID v9;
  const __CFBoolean *v11;
  char v12;
  int valuePtr;

  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFBooleanGetTypeID())
    {
      LOBYTE(a3->isa) = CFBooleanGetValue(v6) != 0;
    }
    else
    {
      v9 = CFGetTypeID(v6);
      if (v9 != CFNumberGetTypeID())
      {
        v8 = 0;
        goto LABEL_9;
      }
      v11 = v6;
      v12 = 0;
      valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      LOBYTE(a3->isa) = valuePtr != 0;
      CACFNumber::~CACFNumber((CACFNumber *)&v11);
    }
    v8 = 1;
LABEL_9:
    CFRelease(v6);
    return v8;
  }
  return 0;
}

void sub_236D5905C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, int *a4)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  CFTypeID v7;
  BOOL v8;
  _BOOL8 v9;
  const __CFNumber *v11;
  char v12;
  int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty)
    return 0;
  v6 = CFProperty;
  v7 = CFGetTypeID(CFProperty);
  v8 = v7 == CFNumberGetTypeID();
  v9 = v8;
  if (v8)
  {
    v11 = v6;
    v12 = 0;
    valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    CACFNumber::~CACFNumber((CACFNumber *)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_236D59108(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, unsigned int *a4)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  CFTypeID v7;
  BOOL v8;
  _BOOL8 v9;
  const __CFNumber *v11;
  char v12;
  int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty)
    return 0;
  v6 = CFProperty;
  v7 = CFGetTypeID(CFProperty);
  v8 = v7 == CFNumberGetTypeID();
  v9 = v8;
  if (v8)
  {
    v11 = v6;
    v12 = 0;
    valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    CACFNumber::~CACFNumber((CACFNumber *)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_236D591B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::CopyProperty_CFString(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFString **a4)
{
  uint64_t result;
  void *v6;
  CFTypeID v7;

  result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    v6 = (void *)result;
    v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFStringGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_CFArray(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFArray **a4)
{
  uint64_t result;
  void *v6;
  CFTypeID v7;

  result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    v6 = (void *)result;
    v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFArrayGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_CFDictionary(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFDictionary **a4)
{
  uint64_t result;
  void *v6;
  CFTypeID v7;

  result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    v6 = (void *)result;
    v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFDictionaryGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

void ASDT::UCObject::CopyProperty_CACFString(io_registry_entry_t a1, const __CFString *a2, uint64_t a3)
{
  CFTypeRef CFProperty;
  const void *v5;
  CFTypeID v6;

  CFProperty = IORegistryEntryCreateCFProperty(a1, a2, 0, 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 == CFStringGetTypeID())
    {
      CACFString::operator=(a3, v5);
      CFRelease(v5);
      return;
    }
    CFRelease(v5);
  }
  if (*(_QWORD *)a3)
  {
    if (*(_BYTE *)(a3 + 8))
      CFRelease(*(CFTypeRef *)a3);
    *(_QWORD *)a3 = 0;
  }
  *(_BYTE *)(a3 + 8) = 1;
}

uint64_t ASDT::UCObject::SetProperty(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  uint64_t result;
  _DWORD *exception;
  int v6;

  result = IORegistryEntrySetCFProperty((io_registry_entry_t)this, a2, a3);
  if ((_DWORD)result)
  {
    v6 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::UCObject::SetProperty();
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = v6;
  }
  return result;
}

void ASDT::UCObject::SetProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  const void *v5;
  const __CFString *v6;
  char v7;
  int valuePtr;

  valuePtr = (int)a3;
  v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_236D5945C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  const void *v5;
  const __CFString *v6;
  char v7;
  int valuePtr;

  valuePtr = (int)a3;
  v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_236D594D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  const void *v5;
  const __CFString *v6;
  char v7;
  int valuePtr;

  valuePtr = (int)a3;
  v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_236D59544(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::CopyMatchingObjectWithPropertyValue(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  uint64_t v4;
  int v8;
  io_object_t v9;
  io_object_t v10;
  int v12;
  _DWORD *exception;
  CFTypeRef cf1;
  char v15;
  CACFDictionary v16;
  CFMutableDictionaryRef v17;
  __int16 v18;
  __int16 v19;
  char v20;
  io_iterator_t iterator;
  char v22;
  io_iterator_t existing;
  void (**v24)(ASDT::UCObject *__hidden);
  uint64_t v25;
  CFMutableDictionaryRef Mutable;
  __int16 v27;
  __int16 v28;
  char v29;
  mach_port_t v30;

  v4 = 0;
  if (this && a2 && a3)
  {
    v30 = 0;
    v8 = MEMORY[0x23B802798](*MEMORY[0x24BDAD2F0], &v30, a3, a4);
    if (v8)
    {
      v12 = v8;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::UCObject::CopyMatchingObjectWithPropertyValue();
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v12;
    }
    CFRetain(this);
    v24 = &off_25084B5C8;
    v25 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v27 = 257;
    v28 = 1;
    v29 = 1;
    existing = 0;
    if (!IOServiceGetMatchingServices(v30, this, &existing) && existing)
    {
      iterator = existing;
      v22 = 1;
      v9 = IOIteratorNext(existing);
      v16.var0 = (__CFDictionary *)&off_25084B5C8;
      *(_DWORD *)&v16.var1 = v9;
      *(_DWORD *)(&v16.var2 + 3) = 0;
      v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v18 = 257;
      v19 = 1;
      v20 = 1;
      while (!(_DWORD)v25 && *(_DWORD *)&v16.var1)
      {
        cf1 = 0;
        v15 = 1;
        ASDT::UCObject::CopyProperty_CACFType(&v16, a2, (uint64_t)&cf1);
        if (cf1 && CFEqual(cf1, a3))
        {
          (*((void (**)(ASDT::UCObject *))v16.var0 + 4))((ASDT::UCObject *)&v16);
          ASDT::UCObject::operator=((uint64_t)&v24, *(int *)&v16.var1);
        }
        v10 = IOIteratorNext(iterator);
        ASDT::UCObject::operator=((uint64_t)&v16, v10);
        CACFObject<void const*>::~CACFObject((uint64_t)&cf1);
      }
      ASDT::UCObject::~UCObject((ASDT::UCObject *)&v16);
      ASDT::UCIterator::~UCIterator(&iterator);
    }
    v24[4]((ASDT::UCObject *)&v24);
    v4 = v25;
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v24);
  }
  return v4;
}

void sub_236D59774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, io_object_t a18, uint64_t a19, char a20)
{
  ASDT::UCIterator::~UCIterator(&a18);
  ASDT::UCObject::~UCObject((ASDT::UCObject *)&a20);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCIterator::UCIterator(uint64_t this, int a2, char a3)
{
  *(_DWORD *)this = a2;
  *(_BYTE *)(this + 4) = a3;
  return this;
}

{
  *(_DWORD *)this = a2;
  *(_BYTE *)(this + 4) = a3;
  return this;
}

uint64_t ASDT::UCIterator::Next(io_iterator_t *this)
{
  return IOIteratorNext(*this);
}

uint64_t ASDT::UCObject::CopyChildWithIntegerPropertyValues(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  uint64_t v5;
  int v8;
  int v9;
  io_object_t v11;
  _BOOL4 v12;
  io_object_t v15;
  unsigned int v17;
  unsigned int v18;
  void (**v19)(ASDT::UCObject *__hidden);
  io_object_t v20;
  int v21;
  CFMutableDictionaryRef v22;
  __int16 v23;
  __int16 v24;
  char v25;
  io_iterator_t iterator;
  char v27;
  void (**v28)(ASDT::UCObject *__hidden);
  uint64_t v29;
  CFMutableDictionaryRef Mutable;
  __int16 v31;
  __int16 v32;
  char v33;

  v5 = 0;
  if ((_DWORD)this && a2 && a4)
  {
    v8 = (int)a5;
    v9 = (int)a3;
    v28 = &off_25084B5C8;
    v29 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v31 = 257;
    v32 = 1;
    v33 = 1;
    iterator = 0;
    v27 = 1;
    if (MEMORY[0x23B8027F8](this, "IOService", &iterator))
    {
      iterator = 0;
    }
    else if (iterator)
    {
      v11 = IOIteratorNext(iterator);
      v19 = &off_25084B5C8;
      v20 = v11;
      v21 = 0;
      v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v23 = 257;
      v24 = 1;
      v25 = 1;
      while (!(_DWORD)v29 && v20)
      {
        v18 = 0;
        v12 = ASDT::UCObject::CopyProperty_UInt32((ASDT::UCObject *)&v19, a2, &v18);
        v17 = 0;
        if ((v12 & ASDT::UCObject::CopyProperty_UInt32((ASDT::UCObject *)&v19, a4, &v17)) == 1
          && v18 == v9
          && v17 == v8)
        {
          v19[4]((ASDT::UCObject *)&v19);
          ASDT::UCObject::operator=((uint64_t)&v28, v20);
        }
        v15 = IOIteratorNext(iterator);
        ASDT::UCObject::operator=((uint64_t)&v19, v15);
      }
      ASDT::UCObject::~UCObject((ASDT::UCObject *)&v19);
    }
    v28[4]((ASDT::UCObject *)&v28);
    v5 = v29;
    ASDT::UCIterator::~UCIterator(&iterator);
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v28);
  }
  return v5;
}

void sub_236D59990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  ASDT::UCIterator::~UCIterator((io_object_t *)va);
  ASDT::UCObject::~UCObject((ASDT::UCObject *)va1);
  _Unwind_Resume(a1);
}

ASDT::UCIterator *ASDT::UCIterator::UCIterator(ASDT::UCIterator *this, uint64_t a2, const char *a3)
{
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 4) = 1;
  if (MEMORY[0x23B8027F8](a2, a3, this))
    *(_DWORD *)this = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 4) = 1;
  if (MEMORY[0x23B802804](a2, a3, this))
    *(_DWORD *)this = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 4) = 1;
  if (MEMORY[0x23B8027F8](a2, a3, this))
    *(_DWORD *)this = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 4) = 1;
  if (MEMORY[0x23B802804](a2, a3, this))
    *(_DWORD *)this = 0;
  return this;
}

BOOL ASDT::UCIterator::IsValid(ASDT::UCIterator *this)
{
  return *(_DWORD *)this != 0;
}

uint64_t ASDT::UCObject::CopyParentByClassName(ASDT::UCObject *this, const char *a2, const char *a3, const char *a4)
{
  uint64_t v5;
  io_object_t v6;
  void (**v8)(ASDT::UCObject *__hidden);
  io_object_t object;
  int v10;
  CFMutableDictionaryRef Mutable;
  __int16 v12;
  __int16 v13;
  char v14;
  io_object_t v15;
  char v16;

  v15 = 0;
  v16 = 1;
  if (MEMORY[0x23B802804](this, a3, &v15, a4))
  {
    v5 = 0;
    v15 = 0;
  }
  else if (v15)
  {
    v8 = &off_25084B5C8;
    object = IOIteratorNext(v15);
    v10 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v12 = 257;
    v13 = 1;
    v14 = 1;
    while (1)
    {
      if (!object)
      {
        v5 = 0;
        goto LABEL_11;
      }
      if (IOObjectConformsTo(object, a2))
        break;
      v6 = IOIteratorNext(v15);
      ASDT::UCObject::operator=((uint64_t)&v8, v6);
    }
    v8[4]((ASDT::UCObject *)&v8);
    v5 = object;
LABEL_11:
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v8);
  }
  else
  {
    v5 = 0;
  }
  ASDT::UCIterator::~UCIterator(&v15);
  return v5;
}

void sub_236D59B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  ASDT::UCObject::~UCObject((ASDT::UCObject *)&a9);
  ASDT::UCIterator::~UCIterator((io_object_t *)(v9 - 24));
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::IsConnectionOpen(ASDT::UCObject *this)
{
  return *((_DWORD *)this + 3) != 0;
}

uint64_t ASDT::UCObject::OpenConnection(ASDT::UCObject *this, uint32_t type)
{
  uint64_t result;
  io_connect_t *v4;
  int v5;
  _DWORD *exception;
  int v7;

  result = *((unsigned int *)this + 2);
  if ((_DWORD)result)
  {
    v5 = *((_DWORD *)this + 3);
    v4 = (io_connect_t *)((char *)this + 12);
    if (!v5)
    {
      result = IOServiceOpen(result, *MEMORY[0x24BDAEC58], type, v4);
      if ((_DWORD)result)
      {
        v7 = result;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ASDT::UCObject::OpenConnection();
        exception = __cxa_allocate_exception(0x10uLL);
        *(_QWORD *)exception = &unk_25084B660;
        exception[2] = v7;
      }
    }
  }
  return result;
}

uint64_t ASDT::UCObject::SetConnectionNotificationPort(ASDT::UCObject *this, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  int v5;
  _DWORD *exception;
  int v7;

  result = *((unsigned int *)this + 3);
  if ((_DWORD)result)
  {
    v5 = a3;
    result = MEMORY[0x23B80275C](result, a2, a3, a4);
    if (v5)
    {
      if ((_DWORD)result)
      {
        v7 = result;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ASDT::UCObject::SetConnectionNotificationPort();
        exception = __cxa_allocate_exception(0x10uLL);
        *(_QWORD *)exception = &unk_25084B660;
        exception[2] = v7;
      }
    }
  }
  return result;
}

uint64_t ASDT::UCObject::MapMemory(ASDT::UCObject *this, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  int v4;
  int v6;
  _DWORD *exception;

  if (*((_DWORD *)this + 3) && *((_BYTE *)this + 34))
  {
    v4 = MEMORY[0x23B802750]();
    if (v4)
    {
      v6 = v4;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::UCObject::MapMemory();
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v6;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::UCObject::MapMemory();
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
  }
  return 0;
}

uint64_t ASDT::UCObject::ReleaseMemory(uint64_t this, void *a2)
{
  if (a2)
  {
    this = *(unsigned int *)(this + 12);
    if ((_DWORD)this)
      JUMPOUT(0x23B802780);
  }
  return this;
}

uint64_t ASDT::UCObject::CallMethod(ASDT::UCObject *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t *a10)
{
  mach_port_t v11;

  v11 = *((_DWORD *)this + 3);
  if (v11 && *((_BYTE *)this + 34))
    return IOConnectCallMethod(v11, a2, a3, a4, a5, a6, a7, a8, outputStruct, a10);
  else
    return 1937010544;
}

uint64_t ASDT::UCObject::CallTrap(ASDT::UCObject *this, uint32_t a2)
{
  io_connect_t v3;

  v3 = *((_DWORD *)this + 3);
  if (v3 && *((_BYTE *)this + 34))
    return IOConnectTrap0(v3, a2);
  else
    return 1937010544;
}

uint64_t ASDT::UCObject::Retain(ASDT::UCObject *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 2);
  if ((_DWORD)result)
    return IOObjectRetain(result);
  return result;
}

uint64_t ASDT::UCObject::Release(ASDT::UCObject *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 2);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 2) = 0;
  }
  return result;
}

__CFDictionary *ASDT::UCObject::Clear(ASDT::UCObject *this)
{
  CACFDictionary *v1;

  v1 = (CACFDictionary *)((char *)this + 16);
  (*(void (**)(ASDT::UCObject *))(*(_QWORD *)this + 48))(this);
  return CACFDictionary::SetCFMutableDictionaryToEmpty(v1, 1);
}

__CFDictionary *CACFDictionary::SetCFMutableDictionaryToEmpty(CACFDictionary *this, BOOL a2)
{
  __CFDictionary *var0;
  __CFDictionary *result;

  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0)
      CFRelease(var0);
  }
  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  this->var0 = result;
  this->var2 = 1;
  this->var1 = a2;
  return result;
}

uint64_t ASDT::UCIterator::UCIterator(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(_BYTE *)(this + 4) = 1;
  return this;
}

{
  *(_DWORD *)this = 0;
  *(_BYTE *)(this + 4) = 1;
  return this;
}

ASDT::UCIterator *ASDT::UCIterator::UCIterator(ASDT::UCIterator *this, io_object_t *a2)
{
  io_object_t v3;

  v3 = *a2;
  *(_DWORD *)this = *a2;
  *((_BYTE *)this + 4) = *((_BYTE *)a2 + 4);
  if (v3)
    IOObjectRetain(v3);
  return this;
}

{
  io_object_t v3;

  v3 = *a2;
  *(_DWORD *)this = *a2;
  *((_BYTE *)this + 4) = *((_BYTE *)a2 + 4);
  if (v3)
    IOObjectRetain(v3);
  return this;
}

uint64_t ASDT::UCIterator::Retain(ASDT::UCIterator *this)
{
  uint64_t result;

  result = *(unsigned int *)this;
  if ((_DWORD)result)
    return IOObjectRetain(result);
  return result;
}

io_iterator_t *ASDT::UCIterator::UCIterator(io_iterator_t *existing, __CFDictionary *a2)
{
  *existing = 0;
  *((_BYTE *)existing + 4) = 1;
  if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], a2, existing))
    *existing = 0;
  return existing;
}

{
  *existing = 0;
  *((_BYTE *)existing + 4) = 1;
  if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], a2, existing))
    *existing = 0;
  return existing;
}

uint64_t ASDT::UCIterator::operator=(uint64_t a1, io_object_t object)
{
  io_object_t v4;

  if (*(_BYTE *)(a1 + 4))
  {
    v4 = *(_DWORD *)a1;
    if (v4)
      IOObjectRelease(v4);
  }
  *(_DWORD *)a1 = object;
  if (object)
    IOObjectRetain(object);
  return a1;
}

uint64_t ASDT::UCIterator::Release(uint64_t this)
{
  _DWORD *v1;

  if (*(_BYTE *)(this + 4))
  {
    v1 = (_DWORD *)this;
    this = *(unsigned int *)this;
    if ((_DWORD)this)
    {
      this = IOObjectRelease(this);
      *v1 = 0;
    }
  }
  return this;
}

uint64_t ASDT::UCIterator::operator=(uint64_t a1, io_object_t *a2)
{
  io_object_t v4;
  io_object_t v5;

  if (*(_BYTE *)(a1 + 4))
  {
    v4 = *(_DWORD *)a1;
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)a1 = 0;
    }
  }
  v5 = *a2;
  *(_DWORD *)a1 = *a2;
  if (v5)
    IOObjectRetain(v5);
  return a1;
}

void ASDT::UCIterator::~UCIterator(io_object_t *this)
{
  io_object_t v2;

  if (*((_BYTE *)this + 4))
  {
    v2 = *this;
    if (v2)
    {
      IOObjectRelease(v2);
      *this = 0;
    }
  }
}

uint64_t ASDT::UCIterator::GetIterator(ASDT::UCIterator *this)
{
  return *(unsigned int *)this;
}

uint64_t ASDT::UCIterator::SetWillRelease(uint64_t this, char a2)
{
  *(_BYTE *)(this + 4) = a2;
  return this;
}

void CACFDictionary::~CACFDictionary(CACFDictionary *this)
{
  __CFDictionary *var0;

  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0)
      CFRelease(var0);
  }
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x23B802D68);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

void CACFNumber::~CACFNumber(CACFNumber *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

uint64_t CACFObject<void const*>::~CACFObject(uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
    {
      CFRelease(v2);
      *(_QWORD *)a1 = 0;
    }
  }
  return a1;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_236D5A3EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D5A4E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5A604(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D5A908(_Unwind_Exception *a1)
{
  std::mutex *v1;
  void *v2;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D5A9E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5B0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location,std::recursive_mutex *a23,char a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;

  objc_destroyWeak(v28);

  objc_destroyWeak(&location);
  if (a24)
    std::recursive_mutex::unlock(a23);

  _Unwind_Resume(a1);
}

uint64_t ASDT::exceptionBarrierReturnSuccess(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

  return 1;
}

void sub_236D5B27C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, __int128 buf, int *a13)
{
  void *v14;
  uint64_t v15;
  int *v16;
  int v17;

  if (a2)
  {
    if (a2 == 4)
    {
      ASDT::exceptionBarrierReturnSuccess(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        v14 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 16))(v14);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v16 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          v17 = *v16;
          a11 = *v16;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v17;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    JUMPOUT(0x236D5B244);
  }
  _Unwind_Resume(a1);
}

void sub_236D5B4B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c63_ZTSKZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__E3__0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_ea8_32c63_ZTSKZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__E3__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));

}

void sub_236D5B564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2LegacyDevice;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D5B874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  _Unwind_Resume(exception_object);
}

void sub_236D5B998(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D5BB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10)
    std::mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

void sub_236D5BCC4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D5BE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_236D5BF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_236D5C16C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, char a12)
{
  if (a12)
    std::recursive_mutex::unlock(a11);
  _Unwind_Resume(exception_object);
}

void sub_236D5C560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  void *v10;

  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(a1);
}

void std::unique_lock<std::recursive_mutex>::unlock(uint64_t a1)
{
  ASDTIOA2LegacyDevice *v2;
  SEL v3;
  IOAudio2Notification *v4;

  if (*(_BYTE *)(a1 + 8))
  {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)a1);
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    -[ASDTIOA2LegacyDevice handleTransportChanged:](v2, v3, v4);
  }
}

void sub_236D5C6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D5C834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D5CA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14)
{
  uint64_t v14;
  uint64_t v16;
  void *v17;

  CACFArray::~CACFArray((CACFArray *)&a14);
  v16 = 0;
  while (1)
  {
    v17 = *(void **)(v14 + v16 + 24);
    if (v17)
    {
      *(_QWORD *)(v14 + v16 + 32) = v17;
      operator delete(v17);
    }
    v16 -= 24;
    if (v16 == -48)
      _Unwind_Resume(a1);
  }
}

void sub_236D5CC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D5CD6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5CF68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D5D0E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D5D2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;

  v20 = 0;
  while (1)
  {
    v21 = *(void **)(&a15 + v20 + 24);
    if (v21)
    {
      *(_QWORD *)(&a15 + v20 + 32) = v21;
      operator delete(v21);
    }
    v20 -= 24;
    if (v20 == -48)
      _Unwind_Resume(a1);
  }
}

void sub_236D5D484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5D684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D5D974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void std::unique_lock<std::recursive_mutex>::lock(uint64_t a1)
{
  std::recursive_mutex *v2;
  ASDTIOA2LegacyDevice *v3;
  SEL v4;

  v2 = *(std::recursive_mutex **)a1;
  if (v2)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      std::recursive_mutex::lock(v2);
      *(_BYTE *)(a1 + 8) = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  -[ASDTIOA2LegacyDevice deviceName](v3, v4);
}

void sub_236D5DB1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c47_ZTSKZ34__ASDTIOA2LegacyDevice_deviceName_E3__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5DC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c45_ZTSKZ32__ASDTIOA2LegacyDevice_modelUID_E3__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5DD00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_manufacturerName_E3__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5DE08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v20;
  uint64_t v21;

  v20 = a19;
  if (a19 == &a16)
  {
    v21 = 4;
    v20 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5DEB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_samplingRate_E3__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5DFB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5E404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,std::mutex *a37,char a38,void *__p,char a40,int a41,int a42,__int16 a43,char a44,char a45)
{
  void *v45;
  int v46;

  if (a45 < 0)
    operator delete(__p);
  if (a16 < 0)
    operator delete(a11);
  if (a35 < 0)
    operator delete(a30);
  if (a28 < 0)
    operator delete(a23);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v46 & 1) == 0)
    {
LABEL_14:
      if (a38)
        std::mutex::unlock(a37);
      _Unwind_Resume(a1);
    }
  }
  else if (!v46)
  {
    goto LABEL_14;
  }
  __cxa_free_exception(v45);
  goto LABEL_14;
}

__n128 __copy_helper_block_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_setSamplingRate__E3__6(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

void sub_236D5E6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_236D5E814(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, std::recursive_mutex *a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  int v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  uint32_t v27;
  void *v28;
  uint64_t v29;
  int *v30;
  int v31;

  if (!a2)
    _Unwind_Resume(exception_object);
  if (a13)
    std::recursive_mutex::unlock(a12);
  if (a2 == 4)
  {
    v23 = *((_DWORD *)__cxa_begin_catch(exception_object) + 2);
    a11 = v23;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)(v20 - 48) = 67109634;
    *(_DWORD *)(v20 - 44) = v23;
    *(_WORD *)(v20 - 40) = 1040;
    *(_DWORD *)(v20 - 38) = 4;
    *(_WORD *)(v20 - 34) = 2080;
    *(_QWORD *)(v20 - 32) = &a11;
    v24 = MEMORY[0x24BDACB70];
    v25 = "Caught CAException %d %4.4s";
    v26 = (uint8_t *)(v20 - 48);
    v27 = 24;
  }
  else if (a2 == 3)
  {
    v28 = __cxa_begin_catch(exception_object);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v29 = (*(uint64_t (**)(void *))(*(_QWORD *)v28 + 16))(v28);
    *(_DWORD *)(v20 - 48) = 136315138;
    *(_QWORD *)(v20 - 44) = v29;
    v24 = MEMORY[0x24BDACB70];
    v25 = "std::exception caught: %s.";
    v26 = (uint8_t *)(v20 - 48);
    v27 = 12;
  }
  else
  {
    v30 = (int *)__cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      v31 = *v30;
      a11 = *v30;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)(v20 - 48) = 67109634;
        *(_DWORD *)(v20 - 44) = v31;
        *(_WORD *)(v20 - 40) = 1040;
        *(_DWORD *)(v20 - 38) = 4;
        *(_WORD *)(v20 - 34) = 2080;
        *(_QWORD *)(v20 - 32) = &a11;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)(v20 - 48), 0x18u);
      }
LABEL_17:
      __cxa_end_catch();
      if (a20)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)a20 + 48))(a20);
        JUMPOUT(0x236D5E7B4);
      }
      std::__throw_bad_function_call[abi:ne180100]();
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_WORD *)(v20 - 48) = 0;
    v24 = MEMORY[0x24BDACB70];
    v25 = "Unknown exception caught!";
    v26 = (uint8_t *)(v20 - 48);
    v27 = 2;
  }
  _os_log_impl(&dword_236D43000, v24, OS_LOG_TYPE_DEFAULT, v25, v26, v27);
  goto LABEL_17;
}

void sub_236D5EB38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5EBD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_inputLatency_E3__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5ECDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5ED7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c50_ZTSKZ37__ASDTIOA2LegacyDevice_outputLatency_E3__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5EE80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5EF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c55_ZTSKZ41__ASDTIOA2LegacyDevice_inputSafetyOffset_E4__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5F024(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5F0C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c56_ZTSKZ42__ASDTIOA2LegacyDevice_outputSafetyOffset_E4__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5F1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5F264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c51_ZTSKZ37__ASDTIOA2LegacyDevice_transportType_E4__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5F368(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a19;
  if (a19 == v19)
  {
    v22 = 4;
    v21 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_236D5F404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10)
    std::recursive_mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ35__ASDTIOA2LegacyDevice_clockDomain_E4__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D5F630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5F760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5F890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5F9A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5FABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5FBD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5FCEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5FE04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D5FF1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6021C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_236D602E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D604F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D60644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c47_ZTSKZ33__ASDTIOA2LegacyDevice_doStartIO_E4__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

uint64_t __copy_helper_block_ea8_32c46_ZTSKZ32__ASDTIOA2LegacyDevice_doStopIO_E4__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_236D60A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14)
    std::mutex::unlock(a13);
  _Unwind_Resume(exception_object);
}

void std::unique_lock<std::mutex>::lock(std::unique_lock<std::mutex> *this)
{
  std::unique_lock<std::mutex>::mutex_type *m;
  ASDTIOA2LegacyDevice *v3;
  SEL v4;

  m = this->__m_;
  if (m)
  {
    if (!this->__owns_)
    {
      std::mutex::lock(m);
      this->__owns_ = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  -[ASDTIOA2LegacyDevice performStopIO](v3, v4);
}

void sub_236D60CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14)
    std::mutex::unlock(a13);
  _Unwind_Resume(exception_object);
}

void sub_236D60E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D60FE0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c66_ZTSKZ52__ASDTIOA2LegacyDevice__setControlValue_forControl__E4__16(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void sub_236D61508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D61610(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D61740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D617A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__ENK3__0clEv_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleMachPortMessage");

}

void sub_236D61AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CACFArray::~CACFArray(CACFArray *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

id ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(void *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v8[0] = &off_25084B9B8;
  v8[1] = v3;
  v9 = v8;
  ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_5;
  }
  if (v9)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }

  return v4;
}

void sub_236D61BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  char *v14;
  char *v16;
  uint64_t v17;

  v16 = a13;
  if (a13 == v14)
  {
    v17 = 4;
    v16 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:

  _Unwind_Resume(a1);
}

id ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(void *a1)
{
  void (**v1)(void);
  void *v2;

  v1 = a1;
  v1[2]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_236D61C8C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, __int128 buf, int *a13)
{
  uint64_t v13;
  void *v15;
  uint64_t v16;
  int *v17;
  int v18;
  uint64_t v19;

  if (a2)
  {
    if (a2 == 4)
    {
      ASDT::exceptionBarrierReturnSuccess(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = (*(uint64_t (**)(void *))(*(_QWORD *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v17 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          v18 = *v17;
          a11 = *v17;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v18;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    v19 = *(_QWORD *)(v13 + 24);
    if (v19)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 48))(v19);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x236D61C50);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(a1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x23B802D68);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{

  JUMPOUT(0x23B802D68);
}

_QWORD *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_25084B9B8;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  id result;

  *a2 = &off_25084B9B8;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy(uint64_t a1)
{

}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

id std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::operator()(uint64_t a1)
{
  return std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>((id *)(a1 + 8));
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::target_type()
{
}

id std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>(id *a1)
{
  return *a1;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

double ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(void *a1)
{
  double (**v1)(void);
  double v2;

  v1 = a1;
  v2 = v1[2]();

  return v2;
}

void sub_236D620C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, __int128 buf, int *a13)
{
  uint64_t v13;
  void *v15;
  uint64_t v16;
  int *v17;
  int v18;
  uint64_t v19;

  if (a2)
  {
    if (a2 == 4)
    {
      ASDT::exceptionBarrierReturnSuccess(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = (*(uint64_t (**)(void *))(*(_QWORD *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v17 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          v18 = *v17;
          a11 = *v17;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v18;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    v19 = *(_QWORD *)(v13 + 24);
    if (v19)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 48))(v19);
      JUMPOUT(0x236D62080);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(a1);
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::~__func()
{
  JUMPOUT(0x23B802D68);
}

_QWORD *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_25084BA48;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_25084BA48;
  a2[1] = v2;
  return result;
}

double std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::operator()(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::target_type()
{
}

void ASDT::exceptionBarrier<void({block_pointer} {__strong})(void)>(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

}

void sub_236D62390(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, __int128 buf, int *a13)
{
  uint64_t v13;
  void *v15;
  uint64_t v16;
  int *v17;
  int v18;
  uint64_t v19;

  if (a2)
  {
    if (a2 == 4)
    {
      ASDT::exceptionBarrierReturnSuccess(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = (*(uint64_t (**)(void *))(*(_QWORD *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v17 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          v18 = *v17;
          a11 = *v17;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v18;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    v19 = *(_QWORD *)(v13 + 24);
    if (v19)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 48))(v19);
      JUMPOUT(0x236D6235CLL);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(a1);
}

void std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::~__func()
{
  JUMPOUT(0x23B802D68);
}

_QWORD *std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_25084BAD8;
  return result;
}

void std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_25084BAD8;
}

uint64_t std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

uint64_t ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t (**v1)(void);
  uint64_t v2;

  v1 = a1;
  v2 = v1[2]();

  return v2;
}

void sub_236D62650(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, __int128 buf, int *a13)
{
  uint64_t v13;
  void *v15;
  uint64_t v16;
  int *v17;
  int v18;
  uint64_t v19;

  if (a2)
  {
    if (a2 == 4)
    {
      ASDT::exceptionBarrierReturnSuccess(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = (*(uint64_t (**)(void *))(*(_QWORD *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v17 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          v18 = *v17;
          a11 = *v17;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v18;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    v19 = *(_QWORD *)(v13 + 24);
    if (v19)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 48))(v19);
      JUMPOUT(0x236D62614);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(a1);
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::~__func()
{
  JUMPOUT(0x23B802D68);
}

_DWORD *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t a1)
{
  _DWORD *result;

  result = operator new(0x10uLL);
  *(_QWORD *)result = &off_25084BB68;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(_QWORD *)a2 = &off_25084BB68;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::operator()(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::target_type()
{
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x18u);
}

BOOL OUTLINED_FUNCTION_9_0(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void *OUTLINED_FUNCTION_10_0(void *a1)
{
  return __cxa_begin_catch(a1);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t result)
{
  _DWORD *v1;

  *v1 = *(_DWORD *)(result + 8);
  return result;
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2, NSObject *a3)
{
  dispatch_queue_t *v6;
  dispatch_queue_t v7;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *exception;

  *(_QWORD *)this = &off_25084BC78;
  *(_OWORD *)((char *)this + 8) = 0u;
  v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  v7 = dispatch_queue_create(a2, a3);
  *v6 = v7;
  if (!v7)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      CADeprecated::CADispatchQueue::CADispatchQueue(v9, v10, v11, v12, v13, v14, v15, v16);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 2003329396;
  }
  return this;
}

void sub_236D62AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  CADeprecated::CAMutex *v11;
  CADeprecated::CAMutex *v12;

  CADeprecated::CAMutex::~CAMutex(v12);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  CADeprecated::CAMutex::~CAMutex(v11);
  a10 = v10 + 16;
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  _Unwind_Resume(a1);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, __CFString *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, __CFString *a2, NSObject *a3)
{
  dispatch_queue_t *v6;
  dispatch_queue_t v7;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *exception;
  char v18[4];
  __CFString *v19;
  char v20;
  __CFString label[8];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_25084BC78;
  *(_OWORD *)((char *)this + 8) = 0u;
  v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  v19 = a2;
  v20 = 0;
  *(_DWORD *)v18 = 256;
  CACFString::GetCString((CACFString *)a2, label, v18, (unsigned int *)0x8000100);
  v7 = dispatch_queue_create((const char *)label, a3);
  *v6 = v7;
  if (!v7)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      CADeprecated::CADispatchQueue::CADispatchQueue(v9, v10, v11, v12, v13, v14, v15, v16);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 2003329396;
  }
  CACFString::~CACFString((CACFString *)&v19);
  return this;
}

void sub_236D62C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  _Unwind_Resume(exception_object);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2, const __CFString *a3)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, a3, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, a3, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2, const __CFString *a3, NSObject *a4)
{
  dispatch_queue_t *v8;
  dispatch_queue_t v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *exception;
  char v20[4];
  CACFString *v21;
  char v22;
  __CFString label[8];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_25084BC78;
  *(_OWORD *)((char *)this + 8) = 0u;
  v8 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  v21 = (CACFString *)CFStringCreateWithFormat(0, 0, a2, a3);
  v22 = 1;
  *(_DWORD *)v20 = 256;
  CACFString::GetCString(v21, label, v20, (unsigned int *)0x8000100);
  v9 = dispatch_queue_create((const char *)label, a4);
  *v8 = v9;
  if (!v9)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      CADeprecated::CADispatchQueue::CADispatchQueue(v11, v12, v13, v14, v15, v16, v17, v18);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 2003329396;
  }
  CACFString::~CACFString((CACFString *)&v21);
  return this;
}

void sub_236D62E84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  _Unwind_Resume(exception_object);
}

void CADeprecated::CADispatchQueue::~CADispatchQueue(CADeprecated::CADispatchQueue *this)
{
  void **v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;

  *(_QWORD *)this = &off_25084BC78;
  v2 = (void **)((char *)this + 16);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)this + 2);
  if (*((_QWORD *)this + 17) != *((_QWORD *)this + 16))
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      CADeprecated::CADispatchQueue::~CADispatchQueue(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)this + 16);
  dispatch_release(*((dispatch_object_t *)this + 1));
  CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152));
  v11 = (void **)((char *)this + 128);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](&v11);
  CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40));
  v11 = v2;
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](&v11);
}

{
  CADeprecated::CADispatchQueue::~CADispatchQueue(this);
  JUMPOUT(0x23B802D68);
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, int a2, dispatch_block_t block)
{
  NSObject *v3;

  v3 = *(NSObject **)(a1 + 8);
  if (a2)
    dispatch_sync(v3, block);
  else
    dispatch_async(v3, block);
}

void CADeprecated::CADispatchQueue::DispatchBarrier(uint64_t a1, int a2, dispatch_block_t block)
{
  NSObject *v3;

  v3 = *(NSObject **)(a1 + 8);
  if (a2)
    dispatch_barrier_sync(v3, block);
  else
    dispatch_barrier_async(v3, block);
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, uint64_t a2, dispatch_block_t block)
{
  int64_t v5;
  dispatch_time_t v6;

  if (a2)
  {
    v5 = __udivti3();
    v6 = dispatch_time(0, v5);
    dispatch_after(v6, *(dispatch_queue_t *)(a1 + 8), block);
  }
  else
  {
    dispatch_async(*(dispatch_queue_t *)(a1 + 8), block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  NSObject *v4;

  v4 = *((_QWORD *)this + 1);
  if (a2)
    dispatch_sync_f(v4, context, work);
  else
    dispatch_async_f(v4, context, work);
}

void CADeprecated::CADispatchQueue::DispatchBarrier(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  NSObject *v4;

  v4 = *((_QWORD *)this + 1);
  if (a2)
    dispatch_barrier_sync_f(v4, context, work);
  else
    dispatch_barrier_async_f(v4, context, work);
}

void CADeprecated::CADispatchQueue::Dispatch(dispatch_queue_t *this, uint64_t a2, void *context, dispatch_function_t work)
{
  int64_t v7;
  dispatch_time_t v8;

  if (a2)
  {
    v7 = __udivti3();
    v8 = dispatch_time(0, v7);
    dispatch_after_f(v8, this[1], context, work);
  }
  else
  {
    dispatch_async_f(this[1], context, work);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(intptr_t a1, int a2, void *a3)
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(a1, 0);
  if (a2)
    dispatch_sync(global_queue, a3);
  else
    dispatch_async(global_queue, a3);
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(intptr_t a1, uint64_t a2, void *a3)
{
  NSObject *global_queue;
  NSObject *v6;
  int64_t v7;
  dispatch_time_t v8;

  global_queue = dispatch_get_global_queue(a1, 0);
  v6 = global_queue;
  if (a2)
  {
    v7 = __udivti3();
    v8 = dispatch_time(0, v7);
    dispatch_after(v8, v6, a3);
  }
  else
  {
    dispatch_async(global_queue, a3);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(CADeprecated::CADispatchQueue *this, int a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  if (a2)
    dispatch_sync_f(global_queue, a3, a4);
  else
    dispatch_async_f(global_queue, a3, a4);
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(CADeprecated::CADispatchQueue *this, uint64_t a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  NSObject *global_queue;
  NSObject *v9;
  int64_t v10;
  dispatch_time_t v11;

  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  v9 = global_queue;
  if (a2)
  {
    v10 = __udivti3();
    v11 = dispatch_time(0, v10);
    dispatch_after_f(v11, v9, a3, a4);
  }
  else
  {
    dispatch_async_f(global_queue, a3, a4);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(int a1, void *a2)
{
  if (a1)
    dispatch_sync(MEMORY[0x24BDAC9B8], a2);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], a2);
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(uint64_t a1, dispatch_block_t block)
{
  int64_t v3;
  dispatch_time_t v4;

  if (a1)
  {
    v3 = __udivti3();
    v4 = dispatch_time(0, v3);
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(CADeprecated::CADispatchQueue *this, void *a2, void (__cdecl *a3)(void *), void (*a4)(void *))
{
  if ((_DWORD)this)
    dispatch_sync_f(MEMORY[0x24BDAC9B8], a2, a3);
  else
    dispatch_async_f(MEMORY[0x24BDAC9B8], a2, a3);
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(CADeprecated::CADispatchQueue *this, void *context, dispatch_function_t work, void (*a4)(void *))
{
  int64_t v6;
  dispatch_time_t v7;

  if (this)
  {
    v6 = __udivti3();
    v7 = dispatch_time(0, v6);
    dispatch_after_f(v7, MEMORY[0x24BDAC9B8], context, work);
  }
  else
  {
    dispatch_async_f(MEMORY[0x24BDAC9B8], context, work);
  }
}

void CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *exception;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  _QWORD v42[5];

  if (!a2)
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(v24, v25, v26, v27, v28, v29, v30, v31);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  v6 = a1 + 40;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 16))(a1 + 40);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = (_QWORD *)(a1 + 16);
  while (v9 != *(_QWORD *)(a1 + 24))
  {
    v11 = *(_DWORD *)(v9 + 8);
    v9 += 16;
    if (v11 == a2)
    {
      if (!v7)
        return;
      goto LABEL_18;
    }
  }
  v12 = dispatch_source_create(MEMORY[0x24BDAC9E8], a2, 1uLL, *(dispatch_queue_t *)(a1 + 8));
  if (!v12)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(v33, v34, v35, v36, v37, v38, v39, v40);
    v41 = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)v41 = &unk_25084B660;
    v41[2] = 2003329396;
  }
  v13 = v12;
  dispatch_source_set_event_handler(v12, a3);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 24);
  if (v15 >= v14)
  {
    v17 = (uint64_t)(v15 - *v10) >> 4;
    if ((unint64_t)(v17 + 1) >> 60)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v18 = v14 - *v10;
    v19 = v18 >> 3;
    if (v18 >> 3 <= (unint64_t)(v17 + 1))
      v19 = v17 + 1;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
      v20 = 0xFFFFFFFFFFFFFFFLL;
    else
      v20 = v19;
    v42[4] = a1 + 32;
    v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a1 + 32, v20);
    v22 = &v21[16 * v17];
    v42[0] = v21;
    v42[1] = v22;
    v42[3] = &v21[16 * v23];
    *(_QWORD *)v22 = v13;
    *((_DWORD *)v22 + 2) = a2;
    dispatch_retain(v13);
    v42[2] = v22 + 16;
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer((uint64_t *)(a1 + 16), v42);
    v16 = *(_QWORD *)(a1 + 24);
    std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)v42);
  }
  else
  {
    *(_QWORD *)v15 = v13;
    *(_DWORD *)(v15 + 8) = a2;
    dispatch_retain(v13);
    v16 = v15 + 16;
  }
  *(_QWORD *)(a1 + 24) = v16;
  dispatch_release(v13);
  dispatch_resume(v13);
  if (v8)
LABEL_18:
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
}

void sub_236D635F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  va_list va;

  va_start(va, a2);
  std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)va);
  dispatch_release(v4);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::RemoveMachPortDeathNotification(CADeprecated::CADispatchQueue *this, int a2)
{
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  char v17;

  v4 = (char *)this + 40;
  v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 5) + 16))((char *)this + 40);
  v6 = 0;
  v8 = *((_QWORD *)v4 - 3);
  v7 = *((_QWORD *)v4 - 2);
  while (v8 + v6 != v7)
  {
    v9 = *(_DWORD *)(v8 + v6 + 8);
    v6 += 16;
    if (v9 == a2)
    {
      v10 = *(NSObject **)(v8 + v6 - 16);
      if (v10)
      {
        dispatch_source_cancel(v10);
        v7 = *((_QWORD *)this + 3);
      }
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>((uint64_t)&v17, v8 + 16 * (v9 != a2) + v6, v7, v8 + 16 * (v9 != a2) + v6 - 16);
      v12 = v11;
      v13 = *((_QWORD *)this + 3);
      if (v13 != v11)
      {
        v14 = *((_QWORD *)this + 3);
        do
        {
          v16 = *(NSObject **)(v14 - 16);
          v14 -= 16;
          v15 = v16;
          if (v16)
          {
            dispatch_release(v15);
            *(_QWORD *)(v13 - 16) = 0;
          }
          v13 = v14;
        }
        while (v14 != v12);
      }
      *((_QWORD *)this + 3) = v12;
      break;
    }
  }
  if (v5)
    (*(void (**)(char *))(*(_QWORD *)v4 + 24))(v4);
}

void sub_236D63748(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::CADispatchQueue::InstallMachPortReceiver(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *exception;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  _QWORD v42[5];

  if (!a2)
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      CADeprecated::CADispatchQueue::InstallMachPortReceiver(v24, v25, v26, v27, v28, v29, v30, v31);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  v6 = a1 + 152;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 152) + 16))(a1 + 152);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 128);
  v10 = (_QWORD *)(a1 + 128);
  while (v9 != *(_QWORD *)(a1 + 136))
  {
    v11 = *(_DWORD *)(v9 + 8);
    v9 += 16;
    if (v11 == a2)
    {
      if (!v7)
        return;
      goto LABEL_18;
    }
  }
  v12 = dispatch_source_create(MEMORY[0x24BDAC9E0], a2, 0, *(dispatch_queue_t *)(a1 + 8));
  if (!v12)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      CADeprecated::CADispatchQueue::InstallMachPortReceiver(v33, v34, v35, v36, v37, v38, v39, v40);
    v41 = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)v41 = &unk_25084B660;
    v41[2] = 2003329396;
  }
  v13 = v12;
  dispatch_source_set_event_handler(v12, a3);
  v14 = *(_QWORD *)(a1 + 144);
  v15 = *(_QWORD *)(a1 + 136);
  if (v15 >= v14)
  {
    v17 = (uint64_t)(v15 - *v10) >> 4;
    if ((unint64_t)(v17 + 1) >> 60)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v18 = v14 - *v10;
    v19 = v18 >> 3;
    if (v18 >> 3 <= (unint64_t)(v17 + 1))
      v19 = v17 + 1;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
      v20 = 0xFFFFFFFFFFFFFFFLL;
    else
      v20 = v19;
    v42[4] = a1 + 144;
    v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a1 + 144, v20);
    v22 = &v21[16 * v17];
    v42[0] = v21;
    v42[1] = v22;
    v42[3] = &v21[16 * v23];
    *(_QWORD *)v22 = v13;
    *((_DWORD *)v22 + 2) = a2;
    dispatch_retain(v13);
    v42[2] = v22 + 16;
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer((uint64_t *)(a1 + 128), v42);
    v16 = *(_QWORD *)(a1 + 136);
    std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)v42);
  }
  else
  {
    *(_QWORD *)v15 = v13;
    *(_DWORD *)(v15 + 8) = a2;
    dispatch_retain(v13);
    v16 = v15 + 16;
  }
  *(_QWORD *)(a1 + 136) = v16;
  dispatch_release(v13);
  dispatch_resume(v13);
  if (v8)
LABEL_18:
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
}

void sub_236D639A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  va_list va;

  va_start(va, a2);
  std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)va);
  dispatch_release(v4);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::RemoveMachPortReceiver(uint64_t a1, int a2, void *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  char v19;

  v6 = a1 + 152;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 152) + 16))(a1 + 152);
  v8 = 0;
  v10 = *(_QWORD *)(v6 - 24);
  v9 = *(_QWORD *)(v6 - 16);
  while (v10 + v8 != v9)
  {
    v11 = *(_DWORD *)(v10 + v8 + 8);
    v8 += 16;
    if (v11 == a2)
    {
      v12 = *(NSObject **)(v10 + v8 - 16);
      if (v12)
      {
        if (a3)
        {
          dispatch_source_set_cancel_handler(v12, a3);
          v12 = *(NSObject **)(v10 + v8 - 16);
        }
        dispatch_source_cancel(v12);
        v9 = *(_QWORD *)(a1 + 136);
      }
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>((uint64_t)&v19, v10 + 16 * (v11 != a2) + v8, v9, v10 + 16 * (v11 != a2) + v8 - 16);
      v14 = v13;
      v15 = *(_QWORD *)(a1 + 136);
      if (v15 != v13)
      {
        v16 = *(_QWORD *)(a1 + 136);
        do
        {
          v18 = *(NSObject **)(v16 - 16);
          v16 -= 16;
          v17 = v18;
          if (v18)
          {
            dispatch_release(v17);
            *(_QWORD *)(v15 - 16) = 0;
          }
          v15 = v16;
        }
        while (v16 != v14);
      }
      *(_QWORD *)(a1 + 136) = v14;
      break;
    }
  }
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
}

void sub_236D63B10(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::CADispatchQueue::RemoveMachPortReceiver(CADeprecated::CADispatchQueue *this, int a2, char a3, char a4)
{
  _QWORD v4[4];
  int v5;
  char v6;
  char v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke;
  v4[3] = &__block_descriptor_tmp;
  v6 = a3;
  v5 = a2;
  v7 = a4;
  CADeprecated::CADispatchQueue::RemoveMachPortReceiver((uint64_t)this, a2, v4);
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke(uint64_t a1)
{
  ipc_space_t *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (*(_BYTE *)(a1 + 36))
  {
    v3 = mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 32));
    if ((_DWORD)v3)
    {
      v4 = v3;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if (*(_BYTE *)(a1 + 37))
  {
    v12 = mach_port_mod_refs(*v2, *(_DWORD *)(a1 + 32), 1u, -1);
    if ((_DWORD)v12)
    {
      v13 = v12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

uint64_t CADeprecated::CADispatchQueue::GetGlobalSerialQueue(CADeprecated::CADispatchQueue *this)
{
  uint64_t result;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *exception;

  if (CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized != -1)
    dispatch_once_f(&CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized, 0, (dispatch_function_t)CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue);
  result = CADeprecated::CADispatchQueue::sGlobalSerialQueue;
  if (!CADeprecated::CADispatchQueue::sGlobalSerialQueue)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      CADeprecated::CADispatchQueue::GetGlobalSerialQueue(v2, v3, v4, v5, v6, v7, v8, v9);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  return result;
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue(CADeprecated::CADispatchQueue *this, void *a2)
{
  CADeprecated::CADispatchQueue *v2;
  CADeprecated::CADispatchQueue *result;

  v2 = (CADeprecated::CADispatchQueue *)operator new();
  result = CADeprecated::CADispatchQueue::CADispatchQueue(v2, "com.apple.audio.CADispatchQueue.SerialQueue", 0);
  CADeprecated::CADispatchQueue::sGlobalSerialQueue = (uint64_t)v2;
  return result;
}

void sub_236D63D1C(void *a1)
{
  uint64_t v1;

  MEMORY[0x23B802D68](v1, 0x10F1C40885B0CF0);
  __cxa_begin_catch(a1);
  CADeprecated::CADispatchQueue::sGlobalSerialQueue = 0;
  __cxa_end_catch();
}

void CADeprecated::CADispatchQueue::EventSource::Retain(NSObject **this)
{
  NSObject *v1;

  v1 = *this;
  if (v1)
    dispatch_retain(v1);
}

void CADeprecated::CADispatchQueue::EventSource::Release(NSObject **this)
{
  NSObject *v2;

  v2 = *this;
  if (v2)
  {
    dispatch_release(v2);
    *this = 0;
  }
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

void std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  v2 = *a1;
  v3 = a1[1];
  if (v3 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(NSObject **)(v4 - 16);
      v4 -= 16;
      v5 = v6;
      if (v6)
      {
        dispatch_release(v5);
        *(_QWORD *)(v3 - 16) = 0;
      }
      v3 = v4;
    }
    while (v4 != v2);
  }
  a1[1] = v2;
}

uint64_t std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v14[3];
  char v15;
  __int128 v16;
  __int128 v17;

  v7 = a7;
  *(_QWORD *)&v17 = a6;
  *((_QWORD *)&v17 + 1) = a7;
  v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v11 = *(NSObject **)(v9 - 16);
      v9 -= 16;
      v10 = v11;
      *(_QWORD *)(v7 - 16) = v11;
      *(_DWORD *)(v7 - 8) = *(_DWORD *)(v9 + 8);
      if (v11)
      {
        dispatch_retain(v10);
        v7 = *((_QWORD *)&v17 + 1);
      }
      v7 -= 16;
      *((_QWORD *)&v17 + 1) = v7;
    }
    while (v9 != a5);
    v12 = v17;
  }
  v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>::operator()[abi:ne180100](uint64_t a1)
{
  dispatch_object_t *v1;
  dispatch_object_t *v2;

  v1 = *(dispatch_object_t **)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(dispatch_object_t **)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*v1)
    {
      dispatch_release(*v1);
      *v1 = 0;
    }
    v1 += 2;
  }
}

uint64_t std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::__destruct_at_end[abi:ne180100](a1, *(_QWORD **)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::__destruct_at_end[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  NSObject *v5;
  NSObject *v6;

  v2 = *(_QWORD **)(a1 + 16);
  while (v2 != a2)
  {
    v6 = *(v2 - 2);
    v2 -= 2;
    v5 = v6;
    *(_QWORD *)(a1 + 16) = v2;
    if (v6)
    {
      dispatch_release(v5);
      *v2 = 0;
      v2 = *(_QWORD **)(a1 + 16);
    }
  }
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v7;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(_QWORD *)a4)
      {
        dispatch_release(*(dispatch_object_t *)a4);
        *(_QWORD *)a4 = 0;
      }
      v7 = *(NSObject **)v5;
      *(_QWORD *)a4 = *(_QWORD *)v5;
      *(_DWORD *)(a4 + 8) = *(_DWORD *)(v5 + 8);
      if (v7)
        dispatch_retain(v7);
      a4 += 16;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_236D6420C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D64374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D643D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2SelectorControl;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D6454C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D64C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, std::recursive_mutex *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;

  std::recursive_mutex::unlock(a11);
  _Unwind_Resume(a1);
}

void sub_236D65208(_Unwind_Exception *a1)
{
  std::recursive_mutex *v1;
  void *v2;

  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D6570C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  void *v10;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_236D6588C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D65A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  void *v18;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_236D65C1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D65D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D65DB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D65F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D6665C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n)
{
  std::vector<char>::pointer end;
  char *v5;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<char>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v5 = &end[__n];
    bzero(end, __n);
    this->__end_ = v5;
  }
  return this;
}

void sub_236D666F0(_Unwind_Exception *exception_object)
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

void sub_236D669B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D66B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D66C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, char a12)
{
  void *v12;

  if (a12)
    std::recursive_mutex::unlock(a11);
  _Unwind_Resume(a1);
}

void sub_236D66F20(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_236D66FFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::recursive_mutex *a10, char a11)
{
  if (a11)
    std::recursive_mutex::unlock(a10);
  _Unwind_Resume(exception_object);
}

void sub_236D67358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14, uint64_t a15, CACFDictionary a16)
{
  void *v16;
  uint64_t v17;

  CACFArray::~CACFArray((CACFArray *)&a14);
  CACFDictionary::~CACFDictionary(&a16);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(v17 + 8, *(_QWORD **)(v17 + 16));

  _Unwind_Resume(a1);
}

void sub_236D67580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D67770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::recursive_mutex *a15, char a16)
{
  void *v16;

  if (a16)
    std::recursive_mutex::unlock(a15);
  _Unwind_Resume(a1);
}

void sub_236D67A70(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_236D67B68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::recursive_mutex *a10, char a11)
{
  if (a11)
    std::recursive_mutex::unlock(a10);
  _Unwind_Resume(exception_object);
}

void sub_236D67D30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D68424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::recursive_mutex *a68;
  char a69;
  void *v69;

  if (a69)
    std::recursive_mutex::unlock(a68);
  _Unwind_Resume(a1);
}

void sub_236D68974(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_236D68AC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, std::recursive_mutex *a13, char a14)
{
  if (a14)
    std::recursive_mutex::unlock(a13);
  _Unwind_Resume(exception_object);
}

void sub_236D68BFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D68D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  void *v18;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_236D68EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D68F90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D69034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D69190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t getValueAndRangeFromControlDict(NSDictionary *a1, const applesauce::CF::DictionaryRef *a2, _ASDSliderRange *a3)
{
  NSDictionary *v5;
  NSDictionary *v6;
  unsigned int *v7;
  unsigned int *v8;
  uint64_t ControlInfo_Value;
  unsigned int *v10;
  CFTypeRef cf;

  v5 = a1;
  v6 = v5;
  if (v5)
    CFRetain(v5);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v6);

  ControlInfo_Value = ASDT::IOA2UserClient::GetControlInfo_Value((ASDT::IOA2UserClient *)&cf, a2, v7);
  if ((ControlInfo_Value & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    getValueAndRangeFromControlDict();
  if (!ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)&a3->mMaximum, v8))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      getValueAndRangeFromControlDict();
    ControlInfo_Value = 0;
  }
  if (!ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)a3, v10))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      getValueAndRangeFromControlDict();
    ControlInfo_Value = 0;
  }
  if (cf)
    CFRelease(cf);

  return ControlInfo_Value;
}

void sub_236D692C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void sub_236D69324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2SliderControl;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D6945C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D695A0(_Unwind_Exception *a1)
{
  void *v1;
  std::recursive_mutex *v2;

  std::recursive_mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void sub_236D69898(_Unwind_Exception *a1)
{
  std::recursive_mutex *v1;
  void *v2;

  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D6995C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D69BBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D69D04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(v3 + 8, *(_QWORD **)(v3 + 16));

  _Unwind_Resume(a1);
}

void sub_236D69F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D69F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2LevelControl;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D6A1A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_236D6A370(_Unwind_Exception *a1)
{
  void *v1;
  std::recursive_mutex *v2;

  std::recursive_mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void sub_236D6A6C0(_Unwind_Exception *a1)
{
  std::recursive_mutex *v1;
  void *v2;

  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D6A7B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6AC0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D6AC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D6AD6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6AE2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6AEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6B040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D6B13C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6B1E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D6B2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_236D6B420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D6B4F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CADeprecated::CAMutex *CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  int v3;
  int v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *exception;

  *(_QWORD *)this = &off_25084BD10;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = 0;
  v3 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v3)
  {
    v5 = v3;
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      CADeprecated::CAMutex::CAMutex(v6, v7, v8, v9, v10, v11, v12, v13);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = v5;
  }
  return this;
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  *(_QWORD *)this = &off_25084BD10;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_25084BD10;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_25084BD10;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
  JUMPOUT(0x23B802D68);
}

BOOL CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  int v5;
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *exception;

  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  v4 = pthread_equal(v2, v3);
  if (!v4)
  {
    v5 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    if (v5)
    {
      v7 = v5;
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v8)
        CADeprecated::CAMutex::Lock(v8, v9, v10, v11, v12, v13, v14, v15);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v7;
    }
    atomic_store((unint64_t)v2, (unint64_t *)this + 2);
  }
  return v4 == 0;
}

void CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  int v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *exception;
  uint8_t v15[16];

  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (pthread_equal(v2, v3))
  {
    atomic_store(0, (unint64_t *)this + 2);
    v4 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (v4)
    {
      v5 = v4;
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        CADeprecated::CAMutex::Unlock(v6, v7, v8, v9, v10, v11, v12, v13);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v5;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v15, 2u);
  }
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  _opaque_pthread_t *v4;
  _opaque_pthread_t *v5;
  BOOL v6;
  int v7;
  uint64_t result;
  int v9;
  _DWORD *exception;
  _BYTE v11[5];

  *a2 = 0;
  v4 = pthread_self();
  v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (pthread_equal(v4, v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v7 == 16)
    {
      v6 = 0;
      result = 0;
      goto LABEL_7;
    }
    if (v7)
    {
      v11[0] = HIBYTE(v7);
      v11[1] = BYTE2(v7);
      v11[2] = BYTE1(v7);
      v9 = v7;
      v11[3] = v7;
      v11[4] = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CADeprecated::CAMutex::Try((uint64_t)v11, v9);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = v9;
    }
    atomic_store((unint64_t)v4, (unint64_t *)this + 2);
    v6 = 1;
  }
  result = 1;
LABEL_7:
  *a2 = v6;
  return result;
}

BOOL CADeprecated::CAMutex::IsFree(CADeprecated::CAMutex *this)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)this + 2);
  return v1 == 0;
}

BOOL CADeprecated::CAMutex::IsOwnedByCurrentThread(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;

  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  return pthread_equal(v2, v3) != 0;
}

CADeprecated::CAMutex::Unlocker *CADeprecated::CAMutex::Unlocker::Unlocker(CADeprecated::CAMutex::Unlocker *this, CADeprecated::CAMutex *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)this = a2;
  *((_BYTE *)this + 8) = 0;
  if (((*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)a2 + 48))(a2) & 1) == 0)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      CADeprecated::CAMutex::Unlocker::Unlocker(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  (*(void (**)(_QWORD))(**(_QWORD **)this + 24))(*(_QWORD *)this);
  *((_BYTE *)this + 8) = 1;
  return this;
}

void CADeprecated::CAMutex::Unlocker::~Unlocker(CADeprecated::CAMutex::Unlocker *this)
{
  if (*((_BYTE *)this + 8))
    (*(void (**)(void))(**(_QWORD **)this + 16))();
}

{
  if (*((_BYTE *)this + 8))
    (*(void (**)(void))(**(_QWORD **)this + 16))();
}

ASDT::UCObject *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this)
{
  ASDT::UCObject *result;

  result = ASDT::UCObject::UCObject(this);
  *(_QWORD *)result = &off_25084BD68;
  return result;
}

{
  ASDT::UCObject *result;

  result = ASDT::UCObject::UCObject(this);
  *(_QWORD *)result = &off_25084BD68;
  return result;
}

ASDT::IOA2UCDevice *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, ASDT::UCObject *a2)
{
  BOOL *v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *exception;
  _BYTE var11[33];

  *(_QWORD *)ASDT::UCObject::UCObject(this, (int)a2) = &off_25084BD68;
  var11[0] = 0;
  ASDT::UCObject::CopyProperty_BOOL(a2, CFSTR("supports prewarming"), (const __CFString *)var11, v4);
  *((_BYTE *)this + 35) = var11[0];
  if (ASDT::UCObject::IsValid(this) && !ASDT::UCObject::ConformsTo(this, "IOAudio2Device"))
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      ASDT::IOA2UCDevice::IOA2UCDevice(v6, v7, v8, v9, v10, v11, v12, v13);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  return this;
}

void sub_236D6BB30(_Unwind_Exception *a1)
{
  ASDT::UCObject *v1;

  ASDT::UCObject::~UCObject(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::SupportsPreWarming(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, BOOL *a4)
{
  unsigned __int8 v5;

  v5 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, CFSTR("supports prewarming"), (const __CFString *)&v5, a4);
  return v5;
}

uint64_t ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t result;

  result = ASDT::UCObject::UCObject((uint64_t)this, a2);
  *(_QWORD *)result = &off_25084BD68;
  *(_BYTE *)(result + 35) = 0;
  return result;
}

{
  uint64_t result;

  result = ASDT::UCObject::UCObject((uint64_t)this, a2);
  *(_QWORD *)result = &off_25084BD68;
  *(_BYTE *)(result + 35) = 0;
  return result;
}

ASDT::UCObject *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, const ASDT::IOA2UCDevice *a2)
{
  ASDT::UCObject *result;

  result = ASDT::UCObject::UCObject(this, a2);
  *(_QWORD *)result = &off_25084BD68;
  *((_BYTE *)result + 35) = 0;
  return result;
}

{
  ASDT::UCObject *result;

  result = ASDT::UCObject::UCObject(this, a2);
  *(_QWORD *)result = &off_25084BD68;
  *((_BYTE *)result + 35) = 0;
  return result;
}

uint64_t ASDT::IOA2UCDevice::operator=(uint64_t a1, io_object_t object)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *exception;

  if (!IOObjectConformsTo(object, "IOAudio2Device"))
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      ASDT::IOA2UCDevice::operator=(v5, v6, v7, v8, v9, v10, v11, v12);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  ASDT::UCObject::operator=(a1, object);
  return a1;
}

uint64_t ASDT::IOA2UCDevice::operator=(uint64_t a1, uint64_t a2)
{
  ASDT::UCObject::operator=(a1, a2);
  return a1;
}

void ASDT::IOA2UCDevice::~IOA2UCDevice(ASDT::IOA2UCDevice *this)
{
  ASDT::UCObject::~UCObject(this);
  JUMPOUT(0x23B802D68);
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceUID(ASDT::IOA2UCDevice *this)
{
  __CFString *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, CFSTR("device UID"), (CFTypeRef *)&v2);
  return v2;
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceName(ASDT::IOA2UCDevice *this)
{
  __CFString *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, CFSTR("device name"), (CFTypeRef *)&v2);
  return v2;
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceManufacturer(ASDT::IOA2UCDevice *this)
{
  __CFString *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, CFSTR("device manufacturer"), (CFTypeRef *)&v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelCategoryName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelNumberName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyResourceBundlePath(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyConfigurationApplicationBundleID(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetTransportType(ASDT::IOA2UCDevice *this)
{
  unsigned int v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, CFSTR("transport type"), &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CopyModelUID(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetClockDomain(ASDT::IOA2UCDevice *this)
{
  unsigned int v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, CFSTR("clock domain"), &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CanBeDefaultDevice(ASDT::IOA2UCDevice *this)
{
  return 1;
}

uint64_t ASDT::IOA2UCDevice::GetLatency(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  unsigned int v4;

  v4 = 0;
  if (a2)
    v2 = CFSTR("input latency");
  else
    v2 = CFSTR("output latency");
  ASDT::UCObject::CopyProperty_UInt32(this, v2, &v4);
  return v4;
}

uint64_t ASDT::IOA2UCDevice::GetRingBufferSize(ASDT::IOA2UCDevice *this)
{
  unsigned int v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, CFSTR("io buffer frame size"), &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::GetSafetyOffset(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  unsigned int v4;

  v4 = 0;
  if (a2)
    v2 = CFSTR("input safety offset");
  else
    v2 = CFSTR("output safety offset");
  ASDT::UCObject::CopyProperty_UInt32(this, v2, &v4);
  return v4;
}

double ASDT::IOA2UCDevice::GetNominalSampleRate(ASDT::IOA2UCDevice *this)
{
  double v2;

  v2 = 0.0;
  ASDT::UCObject::CopyProperty_Fixed64(this, CFSTR("sample rate"), &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::SetNominalSampleRate(ASDT::IOA2UCDevice *this, double a2)
{
  uint64_t result;
  _DWORD *exception;
  int v4;
  unint64_t v5;

  v5 = vcvtd_n_s64_f64(a2 - (double)(uint64_t)floor(a2), 0x20uLL) + (vcvtmd_s64_f64(a2) << 32);
  result = ASDT::UCObject::CallMethod(this, 4u, 0, 0, &v5, 8uLL, 0, 0, 0, 0);
  if ((_DWORD)result)
  {
    v4 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::SetNominalSampleRate();
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = v4;
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::IsHidden(ASDT::IOA2UCDevice *this)
{
  return 0;
}

BOOL ASDT::IOA2UCDevice::IsRunning(ASDT::IOA2UCDevice *this)
{
  BOOL v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, CFSTR("is running"), &v2);
  return v2;
}

__CFArray *ASDT::IOA2UCDevice::CopyDefaultChannelLayout(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  __CFArray *v4;

  if (a2)
    v2 = CFSTR("input channel layout");
  else
    v2 = CFSTR("output channel layout");
  v4 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&v4);
  return v4;
}

BOOL ASDT::IOA2UCDevice::WantsDoIOTrapCall(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  BOOL v4;

  if (a2)
    v2 = CFSTR("wants input trap");
  else
    v2 = CFSTR("wants output trap");
  v4 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, v2, &v4);
  return v4;
}

uint64_t ASDT::IOA2UCDevice::GetHogModeOwner(ASDT::IOA2UCDevice *this)
{
  _BOOL8 v2;
  int v3;
  CAProcess *v5;

  LODWORD(v5) = -1;
  v2 = ASDT::UCObject::CopyProperty_SInt32(this, CFSTR("exclusive access owner"), (int *)&v5);
  v3 = (int)v5;
  if ((_DWORD)v5 != -1
    && v3 != CAProcess::GetPID((CAProcess *)v2)
    && (CAProcess::ProcessExists((CAProcess *)v5) & 1) == 0)
  {
    LODWORD(v5) = -1;
    ASDT::UCObject::SetProperty_SInt32(this, CFSTR("exclusive access owner"), -1);
  }
  return v5;
}

void ASDT::IOA2UCDevice::SetHogModeOwner(ASDT::IOA2UCDevice *this, int a2)
{
  ASDT::UCObject::SetProperty_SInt32(this, CFSTR("exclusive access owner"), a2);
}

const __CFAllocator *ASDT::IOA2UCDevice::CopyHeadsetInfo(ASDT::IOA2UCDevice *this)
{
  const __CFAllocator *result;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *exception;
  CFAllocatorRef allocator;

  allocator = 0;
  ASDT::UCObject::CopyProperty_CFDictionary(this, CFSTR("headset info"), (CFTypeRef *)&allocator);
  result = allocator;
  if (!allocator)
  {
    result = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    allocator = result;
    if (!result)
    {
      v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v2)
        ASDT::IOA2UCDevice::CopyHeadsetInfo(v2, v3, v4, v5, v6, v7, v8, v9);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 2003329396;
    }
  }
  return result;
}

__CFArray *ASDT::IOA2UCDevice::CopyCustomPropertyInfo(ASDT::IOA2UCDevice *this)
{
  __CFArray *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("custom property info"), (CFTypeRef *)&v2);
  return v2;
}

BOOL ASDT::IOA2UCDevice::SupportsClientDescription(ASDT::IOA2UCDevice *this)
{
  BOOL v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, CFSTR("supports client description"), &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::SetClientDescription(ASDT::IOA2UCDevice *this, unint64_t a2, double a3)
{
  uint64_t result;
  _DWORD *exception;
  int v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = vcvtd_n_u64_f64(a3 - (double)(unint64_t)floor(a3), 0x20uLL) + (vcvtmd_u64_f64(a3) << 32);
  result = ASDT::UCObject::CallMethod(this, 0xCu, v6, 2u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
  {
    v5 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::SetClientDescription();
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = v5;
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::CopyDeviceUID(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, const __CFString **a4)
{
  uint64_t v5;

  v5 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, CFSTR("device UID"), (const __CFString *)&v5, a4);
  return v5;
}

uint64_t ASDT::IOA2UCDevice::IsPrivate(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, BOOL *a4)
{
  unsigned __int8 v5;

  v5 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, CFSTR("is private"), (const __CFString *)&v5, a4);
  return v5;
}

__CFArray *ASDT::IOA2UCDevice::CopyStreamList(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  __CFArray *v4;

  v4 = 0;
  if (a2)
    v2 = CFSTR("input streams");
  else
    v2 = CFSTR("output streams");
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&v4);
  return v4;
}

CFIndex ASDT::IOA2UCDevice::GetNumberStreams(ASDT::IOA2UCDevice *this, int a2)
{
  const __CFString *v2;
  CFIndex Count;
  CFArrayRef v5;
  __int16 v6;
  CFArrayRef theArray;

  theArray = 0;
  if (a2)
    v2 = CFSTR("input streams");
  else
    v2 = CFSTR("output streams");
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&theArray);
  v5 = theArray;
  v6 = 1;
  if (theArray)
    Count = CFArrayGetCount(theArray);
  else
    Count = 0;
  CACFArray::~CACFArray((CACFArray *)&v5);
  return Count;
}

void sub_236D6C3F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  const __CFString *v4;
  CFTypeRef v5;
  CFArrayRef v7;
  __int16 v8;
  CFTypeRef cf;
  CFArrayRef theArray;

  cf = 0;
  theArray = 0;
  if (a2)
    v4 = CFSTR("input streams");
  else
    v4 = CFSTR("output streams");
  ASDT::UCObject::CopyProperty_CFArray(this, v4, (CFTypeRef *)&theArray);
  v7 = theArray;
  v8 = 1;
  if (theArray
    && CFArrayGetCount(theArray) > a3
    && (CACFArray::GetDictionary((CACFArray *)&v7, a3, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    v5 = cf;
  }
  else
  {
    v5 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v7);
  return v5;
}

void sub_236D6C4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFArray::~CACFArray((CACFArray *)&a9);
  _Unwind_Resume(a1);
}

__CFDictionary *ASDT::IOA2UCDevice::CopyStreamDictionaryByID(ASDT::IOA2UCDevice *this, int a2)
{
  char v4;
  const __CFString *v5;
  unsigned int Count;
  unsigned int v7;
  int UInt32;
  int v9;
  __CFDictionary *v10;
  char v12;
  unsigned int v14;
  CACFDictionary theArray;
  __CFDictionary *var0;
  __int16 v17;

  v4 = 1;
  do
  {
    theArray.var0 = 0;
    if ((v4 & 1) != 0)
      v5 = CFSTR("output streams");
    else
      v5 = CFSTR("input streams");
    ASDT::UCObject::CopyProperty_CFArray(this, v5, (CFTypeRef *)&theArray.var0);
    var0 = theArray.var0;
    v17 = 1;
    if (theArray.var0 && (Count = CFArrayGetCount(theArray.var0)) != 0)
    {
      v7 = 1;
      do
      {
        theArray.var0 = 0;
        *(_WORD *)&theArray.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&var0, v7 - 1, &theArray);
        if (theArray.var0
          && ((v14 = 0, UInt32 = CACFDictionary::GetUInt32(&theArray, CFSTR("stream ID"), &v14), v14 == a2)
            ? (v9 = UInt32)
            : (v9 = 0),
              v9 == 1 && theArray.var0))
        {
          CFRetain(theArray.var0);
          v10 = theArray.var0;
        }
        else
        {
          v10 = 0;
        }
        CACFDictionary::~CACFDictionary(&theArray);
        if (v10)
          break;
      }
      while (v7++ < Count);
    }
    else
    {
      v10 = 0;
    }
    CACFArray::~CACFArray((CACFArray *)&var0);
    v12 = (v10 == 0) & v4;
    v4 = 0;
  }
  while ((v12 & 1) != 0);
  return v10;
}

void sub_236D6C5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
  CACFArray::~CACFArray((CACFArray *)&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  uint64_t v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *exception;
  CACFDictionary v14;
  unsigned int v15;

  v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetUInt32(&v14, CFSTR("stream ID"), &v15))
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(v5, v6, v7, v8, v9, v10, v11, v12);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v3 = v15;
  }
  else
  {
    v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_236D6C6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

__CFDictionary *ASDT::IOA2UCDevice::ConstructDictionaryFromASBD(ASDT::IOA2UCDevice *this, const AudioStreamBasicDescription *a2)
{
  __CFDictionary *var0;
  CACFDictionary v4;

  v4.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_WORD *)&v4.var1 = 256;
  CACFDictionary::AddUInt64(&v4, CFSTR("sample rate"));
  CACFDictionary::AddUInt32(&v4, CFSTR("format ID"));
  CACFDictionary::AddUInt32(&v4, CFSTR("format flags"));
  CACFDictionary::AddUInt32(&v4, CFSTR("bytes per packet"));
  CACFDictionary::AddUInt32(&v4, CFSTR("frames per packet"));
  CACFDictionary::AddUInt32(&v4, CFSTR("bytes per frame"));
  CACFDictionary::AddUInt32(&v4, CFSTR("channels per frame"));
  CACFDictionary::AddUInt32(&v4, CFSTR("bits per channel"));
  var0 = v4.var0;
  CACFDictionary::~CACFDictionary(&v4);
  return var0;
}

void sub_236D6C81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CACFDictionary a9)
{
  CACFDictionary::~CACFDictionary(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ConstructASBDFromDictionary(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, AudioStreamBasicDescription *a3)
{
  uint64_t UInt32;
  unint64_t v6;
  CACFDictionary v7;

  v6 = 0;
  v7.var0 = this;
  *(_WORD *)&v7.var1 = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_QWORD *)a2 + 4) = 0;
  if (CACFDictionary::GetUInt64(&v7, CFSTR("sample rate"), &v6)
    && (*(double *)a2 = (double)v6 * 2.32830644e-10 + (double)HIDWORD(v6),
        CACFDictionary::GetUInt32(&v7, CFSTR("format ID"), (unsigned int *)a2 + 2))
    && CACFDictionary::GetUInt32(&v7, CFSTR("format flags"), (unsigned int *)a2 + 3)
    && CACFDictionary::GetUInt32(&v7, CFSTR("bytes per packet"), (unsigned int *)a2 + 4)
    && CACFDictionary::GetUInt32(&v7, CFSTR("frames per packet"), (unsigned int *)a2 + 5)
    && CACFDictionary::GetUInt32(&v7, CFSTR("bytes per frame"), (unsigned int *)a2 + 6)
    && CACFDictionary::GetUInt32(&v7, CFSTR("channels per frame"), (unsigned int *)a2 + 7))
  {
    UInt32 = CACFDictionary::GetUInt32(&v7, CFSTR("bits per channel"), (unsigned int *)a2 + 8);
  }
  else
  {
    UInt32 = 0;
  }
  if (*((_DWORD *)a2 + 2) == 1819304813)
    *((_DWORD *)a2 + 3) &= ~0x40u;
  CACFDictionary::~CACFDictionary(&v7);
  return UInt32;
}

void sub_236D6C984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ConstructASRDFromDictionary(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, AudioStreamRangedDescription *a3)
{
  double v4;
  BOOL v5;
  uint64_t v6;
  uint64_t UInt32;
  double v8;
  unint64_t v10;
  CACFDictionary v11;

  v10 = 0;
  v11.var0 = this;
  *(_WORD *)&v11.var1 = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_QWORD *)a2 + 6) = 0;
  if (CACFDictionary::GetUInt64(&v11, CFSTR("min sample rate"), &v10)
    && (*((double *)a2 + 5) = (double)v10 * 2.32830644e-10 + (double)HIDWORD(v10),
        CACFDictionary::GetUInt64(&v11, CFSTR("max sample rate"), &v10)))
  {
    v4 = (double)v10 * 2.32830644e-10 + (double)HIDWORD(v10);
    *((double *)a2 + 6) = v4;
    v5 = *((double *)a2 + 5) == v4;
    v6 = 0;
    if (v5)
      v6 = *((_QWORD *)a2 + 5);
    *(_QWORD *)a2 = v6;
    if (CACFDictionary::GetUInt32(&v11, CFSTR("format ID"), (unsigned int *)a2 + 2)
      && CACFDictionary::GetUInt32(&v11, CFSTR("format flags"), (unsigned int *)a2 + 3)
      && CACFDictionary::GetUInt32(&v11, CFSTR("bytes per packet"), (unsigned int *)a2 + 4)
      && CACFDictionary::GetUInt32(&v11, CFSTR("frames per packet"), (unsigned int *)a2 + 5)
      && CACFDictionary::GetUInt32(&v11, CFSTR("bytes per frame"), (unsigned int *)a2 + 6)
      && CACFDictionary::GetUInt32(&v11, CFSTR("channels per frame"), (unsigned int *)a2 + 7))
    {
      UInt32 = CACFDictionary::GetUInt32(&v11, CFSTR("bits per channel"), (unsigned int *)a2 + 8);
    }
    else
    {
      UInt32 = 0;
    }
  }
  else
  {
    UInt32 = 0;
    v8 = *((double *)a2 + 5);
    if (v8 != *((double *)a2 + 6))
      v8 = 0.0;
    *(double *)a2 = v8;
  }
  if (*((_DWORD *)a2 + 2) == 1819304813)
    *((_DWORD *)a2 + 3) &= ~0x40u;
  CACFDictionary::~CACFDictionary(&v11);
  return UInt32;
}

void sub_236D6CB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::BestMatchForFormat(ASDT::IOA2UCDevice *this, const __CFArray *a2, const AudioStreamBasicDescription *a3, AudioStreamBasicDescription *a4)
{
  uint64_t v5;
  __int128 v6;
  double mSampleRate;
  unsigned int Count;
  AudioStreamRangedDescription *v9;
  AudioStreamRangedDescription *v11;
  __int128 v12;
  const AudioValueRange *v13;
  Float64 v14;
  __int128 v15;
  AudioStreamBasicDescription v16;
  double v17[2];
  __CFDictionary *v18;
  CFArrayRef theArray;
  __int16 v20;
  _OWORD v21[2];
  uint64_t v22;

  v5 = 0;
  v6 = *(_OWORD *)&a3->mBytesPerPacket;
  v21[0] = *(_OWORD *)&a3->mSampleRate;
  v21[1] = v6;
  v22 = *(_QWORD *)&a3->mBitsPerChannel;
  *(_QWORD *)&v21[0] = 0;
  if (a3->mSampleRate == 0.0)
    mSampleRate = *(double *)a2;
  else
    mSampleRate = a3->mSampleRate;
  theArray = this;
  v20 = 0;
  while (1)
  {
    Count = theArray;
    if (theArray)
      Count = CFArrayGetCount(theArray);
    if (v5 >= Count)
      break;
    v18 = 0;
    CACFArray::GetDictionary((CACFArray *)&theArray, v5, &v18);
    ASDT::IOA2UCDevice::ConstructASRDFromDictionary(v18, (const __CFDictionary *)&v16, v9);
    if (CAStreamBasicDescription::IsEquivalent((CAStreamBasicDescription *)v21, &v16, (const AudioStreamBasicDescription *)3))
    {
      if (v17[0] <= mSampleRate && v17[1] >= mSampleRate)
      {
        v15 = *(_OWORD *)&v16.mBytesPerPacket;
        *(_OWORD *)&a3->mSampleRate = *(_OWORD *)&v16.mSampleRate;
        *(_OWORD *)&a3->mBytesPerPacket = v15;
        *(_QWORD *)&a3->mBitsPerChannel = *(_QWORD *)&v16.mBitsPerChannel;
        a3->mSampleRate = mSampleRate;
        goto LABEL_16;
      }
    }
    v5 = (v5 + 1);
  }
  v18 = 0;
  CACFArray::GetDictionary((CACFArray *)&theArray, 1, &v18);
  ASDT::IOA2UCDevice::ConstructASRDFromDictionary(v18, (const __CFDictionary *)&v16, v11);
  v12 = *(_OWORD *)&v16.mBytesPerPacket;
  *(_OWORD *)&a3->mSampleRate = *(_OWORD *)&v16.mSampleRate;
  *(_OWORD *)&a3->mBytesPerPacket = v12;
  *(_QWORD *)&a3->mBitsPerChannel = *(_QWORD *)&v16.mBitsPerChannel;
  CAAudioValueRange::PickCommonSampleRate((CAAudioValueRange *)v17, v13);
  a3->mSampleRate = v14;
LABEL_16:
  CACFArray::~CACFArray((CACFArray *)&theArray);
}

void sub_236D6CC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(ASDT::IOA2UCDevice *this, int a2, uint64_t a3, AudioStreamBasicDescription *a4)
{
  AudioStreamBasicDescription *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *exception;
  __CFDictionary *v23;
  CACFDictionary v24;

  v24.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v24.var1 = 1;
  if (v24.var0)
  {
    v23 = 0;
    if ((CACFDictionary::GetDictionary(&v24, CFSTR("current format"), &v23) & 1) != 0)
    {
      if ((ASDT::IOA2UCDevice::ConstructASBDFromDictionary(v23, (const __CFDictionary *)a4, v5) & 1) != 0)
        goto LABEL_4;
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
LABEL_4:
  CACFDictionary::~CACFDictionary(&v24);
}

void sub_236D6CD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

__CFArray *ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  __CFArray *v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *exception;
  CACFDictionary v14;
  __CFArray *v15;

  v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetArray(&v14, CFSTR("available formats"), &v15))
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(v5, v6, v7, v8, v9, v10, v11, v12);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v3 = v15;
  }
  else
  {
    v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_236D6CE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  uint64_t v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *exception;
  CACFDictionary v14;
  unsigned int v15;

  v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetUInt32(&v14, CFSTR("starting channel"), &v15))
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(v5, v6, v7, v8, v9, v10, v11, v12);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v3 = v15;
  }
  else
  {
    v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_236D6CF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_Latency(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_TerminalType(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  uint64_t v3;
  CACFDictionary v5;
  unsigned int v6;

  v6 = 0;
  v5.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v5.var1 = 1;
  if (v5.var0)
  {
    CACFDictionary::GetUInt32(&v5, CFSTR("terminal type"), &v6);
    v3 = v6;
  }
  else
  {
    v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v5);
  return v3;
}

void sub_236D6CFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_Index(ASDT::IOA2UCDevice *this, int a2)
{
  char v4;
  const __CFString *v5;
  unsigned int Count;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 UInt32;
  char v11;
  unsigned int v13;
  CACFDictionary theArray;
  __CFDictionary *var0;
  __int16 v16;

  v4 = 1;
  do
  {
    theArray.var0 = 0;
    if ((v4 & 1) != 0)
      v5 = CFSTR("output streams");
    else
      v5 = CFSTR("input streams");
    ASDT::UCObject::CopyProperty_CFArray(this, v5, (CFTypeRef *)&theArray.var0);
    var0 = theArray.var0;
    v16 = 1;
    if (theArray.var0 && (Count = CFArrayGetCount(theArray.var0)) != 0)
    {
      v7 = 1;
      do
      {
        LODWORD(v8) = v7 - 1;
        theArray.var0 = 0;
        *(_WORD *)&theArray.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&var0, v7 - 1, &theArray);
        if (theArray.var0)
        {
          v13 = 0;
          UInt32 = CACFDictionary::GetUInt32(&theArray, CFSTR("stream ID"), &v13);
          if ((UInt32 & (v13 == a2)) != 0)
            v8 = v8;
          else
            v8 = 0xFFFFFFFFLL;
        }
        else
        {
          v8 = 0xFFFFFFFFLL;
        }
        CACFDictionary::~CACFDictionary(&theArray);
        if ((_DWORD)v8 != -1)
          break;
      }
      while (v7++ < Count);
    }
    else
    {
      v8 = 0xFFFFFFFFLL;
    }
    CACFArray::~CACFArray((CACFArray *)&var0);
    v11 = ((_DWORD)v8 == -1) & v4;
    v4 = 0;
  }
  while ((v11 & 1) != 0);
  return v8;
}

void sub_236D6D100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
  CACFArray::~CACFArray((CACFArray *)&a12);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(ASDT::IOA2UCDevice *this, int a2, AudioStreamBasicDescription *a3)
{
  AudioStreamBasicDescription *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *exception;
  __CFDictionary *v22;
  CACFDictionary v23;

  v23.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v23.var1 = 1;
  if (v23.var0)
  {
    v22 = 0;
    if ((CACFDictionary::GetDictionary(&v23, CFSTR("current format"), &v22) & 1) != 0)
    {
      if ((ASDT::IOA2UCDevice::ConstructASBDFromDictionary(v22, (const __CFDictionary *)a3, v4) & 1) != 0)
        goto LABEL_4;
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
LABEL_4:
  CACFDictionary::~CACFDictionary(&v23);
}

void sub_236D6D204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(ASDT::IOA2UCDevice *this, int a2)
{
  CFTypeRef v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  CFTypeRef cf;

  cf = 0;
  v13.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v13.var1 = 1;
  if (!v13.var0)
    goto LABEL_5;
  if ((CACFDictionary::GetArray(&v13, CFSTR("available formats"), (const __CFArray **)&cf) & 1) == 0)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(v4, v5, v6, v7, v8, v9, v10, v11);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  if (cf)
  {
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
LABEL_5:
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6D2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(ASDT::IOA2UCDevice *this, int a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v13.var1 = 1;
  if (v13.var0)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("starting channel"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6D3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_Latency(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_TerminalType(ASDT::IOA2UCDevice *this, int a2)
{
  uint64_t v2;
  CACFDictionary v4;
  unsigned int v5;

  v5 = 0;
  v4.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v4.var1 = 1;
  if (v4.var0)
  {
    CACFDictionary::GetUInt32(&v4, CFSTR("terminal type"), &v5);
    v2 = v5;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6D430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::MapIOBufferForStream(ASDT::IOA2UCDevice *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *exception;
  unsigned int v17;
  CACFDictionary v18;

  v18.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v18.var1 = 1;
  if (!v18.var0)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      ASDT::IOA2UCDevice::MapIOBufferForStream(v8, v9, v10, v11, v12, v13, v14, v15);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  v17 = 1;
  CACFDictionary::GetUInt32(&v18, CFSTR("buffer mapping options"), &v17);
  *a4 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a2 + 0x10000000, v17, a3);
  CACFDictionary::~CACFDictionary(&v18);
}

void sub_236D6D520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ReleaseIOBufferForStream(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

void ASDT::IOA2UCDevice::SetStreamActive(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3)
{
  unint64_t v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  v3[1] = a3;
  if (ASDT::UCObject::CallMethod(this, 6u, v3, 2u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::SetStreamActive();
  }
}

__CFArray *ASDT::IOA2UCDevice::CopyControlList(ASDT::IOA2UCDevice *this)
{
  __CFArray *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("controls"), (CFTypeRef *)&v2);
  return v2;
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlDictionaryByIndex(ASDT::IOA2UCDevice *this, const __CFArray *a2)
{
  CFTypeRef v3;
  __CFArray *v5;
  __int16 v6;
  __CFArray *v7;

  v7 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("controls"), (CFTypeRef *)&v7);
  v5 = v7;
  v6 = 1;
  v3 = ASDT::IOA2UCDevice::CopyControlDictionaryByIndex(v7, a2);
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

{
  CFTypeRef v3;
  ASDT::IOA2UCDevice *v5;
  __int16 v6;
  CFTypeRef cf;

  cf = 0;
  v5 = this;
  v6 = 0;
  if (this
    && CFArrayGetCount(this) > a2
    && (CACFArray::GetDictionary((CACFArray *)&v5, (uint64_t)a2, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    v3 = cf;
  }
  else
  {
    v3 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

void sub_236D6D684(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void sub_236D6D70C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

__CFDictionary *ASDT::IOA2UCDevice::CopyControlDictionaryByID(ASDT::IOA2UCDevice *this, const __CFArray *a2)
{
  __CFDictionary *v3;
  __CFArray *v5;
  __int16 v6;
  __CFArray *v7;

  v7 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("controls"), (CFTypeRef *)&v7);
  v5 = v7;
  v6 = 1;
  v3 = ASDT::IOA2UCDevice::CopyControlDictionaryByID(v7, a2);
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

{
  int v2;
  unsigned int Count;
  unsigned int v4;
  int UInt32;
  int v6;
  __CFDictionary *var0;
  unsigned int v10;
  CACFDictionary cf;
  ASDT::IOA2UCDevice *v12;
  __int16 v13;

  v12 = this;
  v13 = 0;
  if (this && (v2 = (int)a2, (Count = CFArrayGetCount(this)) != 0))
  {
    v4 = 1;
    do
    {
      cf.var0 = 0;
      *(_WORD *)&cf.var1 = 0;
      CACFArray::GetCACFDictionary((CACFArray *)&v12, v4 - 1, &cf);
      if (cf.var0
        && ((v10 = 0, UInt32 = CACFDictionary::GetUInt32(&cf, CFSTR("control ID"), &v10), v10 == v2)
          ? (v6 = UInt32)
          : (v6 = 0),
            v6 == 1 && cf.var0))
      {
        CFRetain(cf.var0);
        var0 = cf.var0;
      }
      else
      {
        var0 = 0;
      }
      CACFDictionary::~CACFDictionary(&cf);
      if (var0)
        break;
    }
    while (v4++ < Count);
  }
  else
  {
    var0 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v12);
  return var0;
}

void sub_236D6D780(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void sub_236D6D87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
  CACFArray::~CACFArray((CACFArray *)&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlDictionaryIndexByID(ASDT::IOA2UCDevice *this, const __CFArray *a2, _DWORD *a3, unsigned int *a4)
{
  int v5;
  unsigned int Count;
  uint64_t v7;
  int UInt32;
  int v9;
  unsigned int v11;
  CACFDictionary v12;
  ASDT::IOA2UCDevice *v13;
  __int16 v14;

  *a3 = 0;
  v13 = this;
  v14 = 0;
  if (this)
  {
    v5 = (int)a2;
    Count = CFArrayGetCount(this);
    if (Count)
    {
      v7 = 0;
      do
      {
        v12.var0 = 0;
        *(_WORD *)&v12.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&v13, v7, &v12);
        if (v12.var0)
        {
          v11 = 0;
          UInt32 = CACFDictionary::GetUInt32(&v12, CFSTR("control ID"), &v11);
          if (v11 == v5)
            v9 = UInt32;
          else
            v9 = 0;
          if (v9 == 1)
            *a3 = v7;
        }
        else
        {
          LOBYTE(v9) = 0;
        }
        CACFDictionary::~CACFDictionary(&v12);
        if ((v9 & 1) != 0)
          break;
        v7 = (v7 + 1);
      }
      while (v7 < Count);
    }
  }
  CACFArray::~CACFArray((CACFArray *)&v13);
  return 0;
}

void sub_236D6D97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
  CACFArray::~CACFArray((CACFArray *)&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_BaseClass(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("base class"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetControlInfo_BaseClass(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6DA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Class(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("class"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetControlInfo_Class(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6DB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Scope(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("scope"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetControlInfo_Scope(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6DBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Element(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("element"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetControlInfo_Element(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6DCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UCDevice::GetControlInfo_IsReadOnly(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  _BOOL8 v2;
  CACFDictionary v4;
  BOOL v5;

  v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetBool(&v4, CFSTR("read only"), &v5);
    v2 = v5;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6DD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Variant(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  CACFDictionary v4;
  unsigned int v5;

  v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetUInt32(&v4, CFSTR("variant"), &v5);
    v2 = v5;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlInfo_Name(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  CACFDictionary v4;
  CFTypeRef cf;

  cf = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this && (CACFDictionary::GetString(&v4, CFSTR("name"), (const __CFString **)&cf), cf))
  {
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6DE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Value(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetControlInfo_Value(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6DEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlInfo_PropertySelectors(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  CACFDictionary v4;
  CFTypeRef cf;

  cf = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this && (CACFDictionary::GetArray(&v4, CFSTR("property selectors"), (const __CFArray **)&cf), cf))
  {
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6DF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("minimum value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("maximum value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  CFTypeRef cf;

  cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, CFSTR("range map"), (const __CFArray **)&cf) & 1) == 0)
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetLevelControlInfo_TransferFunction(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  CACFDictionary v4;
  unsigned int v5;

  v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetUInt32(&v4, CFSTR("transfer function"), &v5);
    v2 = v5;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_236D6E228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::SetupVolumeCurve(ASDT::IOA2UCDevice *this, CAVolumeCurve *a2, CAVolumeCurve *a3)
{
  const __CFArray *v5;
  uint64_t v6;
  float v7;
  float v8;
  double v9;
  unsigned int v10;
  double v11;
  int v12;
  CACFDictionary v13;
  CFArrayRef theArray;
  __int16 v15;
  CACFDictionary v16;

  CAVolumeCurve::ResetRange(a2);
  v16.var0 = this;
  *(_WORD *)&v16.var1 = 0;
  if (this)
  {
    theArray = 0;
    v15 = 1;
    CACFDictionary::GetCACFArray(&v16, CFSTR("range map"), (CACFArray *)&theArray);
    v5 = theArray;
    if (theArray)
    {
      v6 = 0;
LABEL_4:
      LODWORD(v5) = CFArrayGetCount(v5);
      while (v6 < v5)
      {
        v13.var0 = 0;
        *(_WORD *)&v13.var1 = 1;
        CACFArray::GetCACFDictionary((CACFArray *)&theArray, v6, &v13);
        if (v13.var0)
        {
          v12 = 0;
          v11 = 0.0;
          v10 = 0;
          v9 = 0.0;
          CACFDictionary::GetSInt32(&v13, CFSTR("start int value"), &v12);
          CACFDictionary::GetFixed64(&v13, CFSTR("start db value"), &v11);
          CACFDictionary::GetUInt32(&v13, CFSTR("integer steps"), &v10);
          CACFDictionary::GetFixed64(&v13, CFSTR("db per step"), &v9);
          v7 = v11;
          v8 = v11 + (double)v10 * v9;
          CAVolumeCurve::AddRange(a2, v12, v10 + v12, v7, v8);
        }
        CACFDictionary::~CACFDictionary(&v13);
        v6 = (v6 + 1);
        v5 = theArray;
        if (theArray)
          goto LABEL_4;
      }
    }
    LODWORD(v13.var0) = 0;
    if (CACFDictionary::GetUInt32(&v16, CFSTR("transfer function"), (unsigned int *)&v13))
      CAVolumeCurve::SetTransferFunction(a2, (signed int)v13.var0);
    CACFArray::~CACFArray((CACFArray *)&theArray);
  }
  CACFDictionary::~CACFDictionary(&v16);
}

void sub_236D6E3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14, uint64_t a15, CACFDictionary a16)
{
  CACFArray::~CACFArray((CACFArray *)&a14);
  CACFDictionary::~CACFDictionary(&a16);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  CFTypeRef cf;

  cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, CFSTR("value"), (const __CFArray **)&cf) & 1) == 0)
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  CFTypeRef cf;

  cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, CFSTR("selectors"), (const __CFArray **)&cf) & 1) == 0)
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("left value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("center value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("right value"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("left channel"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  unsigned int v14;

  v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, CFSTR("right channel"), &v14))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &unk_25084B660;
      exception[2] = 1852797029;
    }
    v2 = v14;
  }
  else
  {
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6E988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  CACFDictionary v13;
  CFTypeRef cf;

  cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (!this)
    goto LABEL_5;
  if ((CACFDictionary::GetDictionary(&v13, CFSTR("descriptor"), (const __CFDictionary **)&cf) & 1) == 0)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(v4, v5, v6, v7, v8, v9, v10, v11);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  if (cf)
  {
    CFRetain(cf);
    v2 = cf;
  }
  else
  {
LABEL_5:
    v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_236D6EA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
  CACFDictionary::~CACFDictionary(&a10);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::MapBlockControlBuffer(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, int a3, unsigned int *a4, unsigned __int8 **a5)
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *exception;
  unsigned int v18;
  CACFDictionary v19;

  v19.var0 = a2;
  *(_WORD *)&v19.var1 = 0;
  if (!a2)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      ASDT::IOA2UCDevice::MapBlockControlBuffer(v9, v10, v11, v12, v13, v14, v15, v16);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  v18 = 1;
  CACFDictionary::GetUInt32(&v19, CFSTR("mapping options"), &v18);
  *a5 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a3 & 0xFFFFFFF | 0x30000000u, v18, a4);
  CACFDictionary::~CACFDictionary(&v19);
}

void sub_236D6EB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ReleaseBlockControlBuffer(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

void ASDT::IOA2UCDevice::MoveBlockControlData(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  if (ASDT::UCObject::CallMethod(this, 9u, v4, 3u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::MoveBlockControlData();
  }
}

__CFArray *ASDT::IOA2UCDevice::CopyDataExchangeBlockList(ASDT::IOA2UCDevice *this)
{
  __CFArray *v2;

  v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("data exchange blocks"), (CFTypeRef *)&v2);
  return v2;
}

CFIndex ASDT::IOA2UCDevice::GetNumberDataExchangeBlocks(ASDT::IOA2UCDevice *this)
{
  CFIndex Count;
  CFArrayRef v3;
  __int16 v4;
  CFArrayRef theArray;

  theArray = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("data exchange blocks"), (CFTypeRef *)&theArray);
  v3 = theArray;
  v4 = 1;
  if (theArray)
    Count = CFArrayGetCount(theArray);
  else
    Count = 0;
  CACFArray::~CACFArray((CACFArray *)&v3);
  return Count;
}

void sub_236D6ECB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByIndex(ASDT::IOA2UCDevice *this, uint64_t a2)
{
  CFTypeRef v3;
  CFArrayRef v5;
  __int16 v6;
  CFTypeRef cf;
  CFArrayRef theArray;

  cf = 0;
  theArray = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("data exchange blocks"), (CFTypeRef *)&theArray);
  v5 = theArray;
  v6 = 1;
  if (theArray
    && CFArrayGetCount(theArray) > a2
    && (CACFArray::GetDictionary((CACFArray *)&v5, a2, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    v3 = cf;
  }
  else
  {
    v3 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

void sub_236D6ED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFArray::~CACFArray((CACFArray *)&a9);
  _Unwind_Resume(a1);
}

__CFDictionary *ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByID(ASDT::IOA2UCDevice *this, int a2)
{
  unsigned int Count;
  unsigned int v4;
  int UInt32;
  int v6;
  __CFDictionary *v7;
  unsigned int v10;
  CACFDictionary theArray;
  __CFDictionary *var0;
  __int16 v13;

  theArray.var0 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("data exchange blocks"), (CFTypeRef *)&theArray.var0);
  var0 = theArray.var0;
  v13 = 1;
  if (theArray.var0 && (Count = CFArrayGetCount(theArray.var0)) != 0)
  {
    v4 = 1;
    do
    {
      theArray.var0 = 0;
      *(_WORD *)&theArray.var1 = 0;
      CACFArray::GetCACFDictionary((CACFArray *)&var0, v4 - 1, &theArray);
      if (theArray.var0
        && ((v10 = 0, UInt32 = CACFDictionary::GetUInt32(&theArray, CFSTR("block ID"), &v10), v10 == a2)
          ? (v6 = UInt32)
          : (v6 = 0),
            v6 == 1 && theArray.var0))
      {
        CFRetain(theArray.var0);
        v7 = theArray.var0;
      }
      else
      {
        v7 = 0;
      }
      CACFDictionary::~CACFDictionary(&theArray);
      if (v7)
        break;
    }
    while (v4++ < Count);
  }
  else
  {
    v7 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&var0);
  return v7;
}

void sub_236D6EE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
  CACFArray::~CACFArray((CACFArray *)&a12);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(ASDT::IOA2UCDevice *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *exception;
  unsigned int v17;
  CACFDictionary v18;

  v18.var0 = ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByID(this, a2);
  *(_WORD *)&v18.var1 = 1;
  if (!v18.var0)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(v8, v9, v10, v11, v12, v13, v14, v15);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 1852797029;
  }
  v17 = 1;
  CACFDictionary::GetUInt32(&v18, CFSTR("buffer mapping options"), &v17);
  *a4 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a2 + 0x20000000, v17, a3);
  CACFDictionary::~CACFDictionary(&v18);
}

void sub_236D6EF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ReleaseDataExchangeBlockBuffer(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

uint64_t ASDT::IOA2UCDevice::MoveDataExchangeBlockData(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;
  unint64_t v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = a4;
  v6[2] = a3;
  v4 = ASDT::UCObject::CallMethod(this, 7u, v6, 3u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UCDevice::MoveDataExchangeBlockData();
  return v4;
}

uint64_t ASDT::IOA2UCDevice::StartIO(ASDT::IOA2UCDevice *this)
{
  uint64_t result;
  _DWORD *exception;
  int v3;

  result = ASDT::UCObject::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
  {
    v3 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::StartIO();
    exception = __cxa_allocate_exception(4uLL);
    *exception = v3;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::StartIOWithFlags(ASDT::IOA2UCDevice *this, unint64_t a2)
{
  uint64_t v2;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;

  v6 = a2;
  v5 = 0;
  v4 = 1;
  v2 = ASDT::UCObject::CallMethod(this, 0xAu, &v6, 1u, 0, 0, &v5, &v4, 0, 0);
  if ((_DWORD)v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UCDevice::StartIOWithFlags();
  return v2;
}

uint64_t ASDT::IOA2UCDevice::StopIO(ASDT::IOA2UCDevice *this)
{
  uint64_t result;
  _DWORD *exception;
  int v3;

  result = ASDT::UCObject::CallMethod(this, 1u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
  {
    v3 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::StopIO();
    exception = __cxa_allocate_exception(4uLL);
    *exception = v3;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::StopIOWithFlags(ASDT::IOA2UCDevice *this, unint64_t a2)
{
  uint64_t v2;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;

  v6 = a2;
  v5 = 0;
  v4 = 1;
  v2 = ASDT::UCObject::CallMethod(this, 0xBu, &v6, 1u, 0, 0, &v5, &v4, 0, 0);
  if ((_DWORD)v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UCDevice::StopIOWithFlags();
  return v2;
}

uint64_t ASDT::IOA2UCDevice::DoIO(ASDT::IOA2UCDevice *this)
{
  if (*((_DWORD *)this + 3) && *((_BYTE *)this + 34))
    JUMPOUT(0x23B802774);
  return 1937010544;
}

uint64_t ASDT::IOA2UCDevice::SetStreamCurrentFormat(ASDT::IOA2UCDevice *this, unsigned int a2, const AudioStreamBasicDescription *a3)
{
  uint64_t v3;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  UInt32 mBitsPerChannel;
  unint64_t v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v5 = vcvtd_n_s64_f64(a3->mSampleRate - floor(a3->mSampleRate), 0x20uLL) | (vcvtmd_s64_f64(a3->mSampleRate) << 32);
  v6 = *(_OWORD *)&a3->mFormatID;
  v7 = *(_QWORD *)&a3->mBytesPerFrame;
  mBitsPerChannel = a3->mBitsPerChannel;
  v9[0] = a2;
  v3 = ASDT::UCObject::CallMethod(this, 5u, v9, 1u, &v5, 0x28uLL, 0, 0, 0, 0);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UCDevice::SetStreamCurrentFormat();
  return v3;
}

uint64_t ASDT::IOA2UCDevice::SetControlValue(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int *a3)
{
  unint64_t v4;
  int v5;
  int v7;
  _DWORD *exception;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = *a3;
  v11[0] = a2;
  v11[1] = v4;
  v10 = 0;
  v9 = 1;
  v5 = ASDT::UCObject::CallMethod(this, 2u, v11, 2u, 0, 0, &v10, &v9, 0, 0);
  if (v5)
  {
    v7 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::SetControlValue();
    exception = __cxa_allocate_exception(4uLL);
    *exception = v7;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  *a3 = v10;
  return 0;
}

uint64_t ASDT::IOA2UCDevice::SetMultiControlValue(ASDT::IOA2UCDevice *this, unsigned int a2, const unsigned int *a3, int a4, unsigned int *a5, unsigned int *a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  unsigned int v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v9 = (a4 + 1);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v18 - v10;
  *(_DWORD *)((char *)v18 - v10) = v12;
  memcpy((char *)v18 - v10 + 4, v14, 4 * v13);
  if (a6)
    v15 = 4 * *a6;
  else
    v15 = 0;
  v18[0] = v15;
  v16 = ASDT::UCObject::CallMethod(this, 8u, 0, 0, v11, 4 * v9, 0, 0, a5, v18);
  if ((_DWORD)v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOA2UCDevice::SetMultiControlValue();
  }
  else if (a6)
  {
    *a6 = v18[0] >> 2;
  }
  return v16;
}

uint64_t ASDT::IOA2UCDevice::ReplaceControlValue(ASDT::IOA2UCDevice *this, int a2, int a3)
{
  uint64_t v6;
  CACFDictionary *v7;
  unsigned int Count;
  int UInt32;
  int v10;
  uint64_t v11;
  unsigned int v12;
  const __CFArray *v13;
  CFIndex v14;
  __CFArray *MutableCopy;
  __int16 v17;
  CACFDictionary v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  CACFDictionary theDict;
  CFArrayRef theArray;
  __int16 v24;

  theDict.var0 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("controls"), (CFTypeRef *)&theDict.var0);
  v6 = 0;
  theArray = theDict.var0;
  v24 = 1;
  v7 = (CACFDictionary *)((char *)this + 16);
  while (1)
  {
    Count = theArray;
    if (theArray)
      Count = CFArrayGetCount(theArray);
    if (v6 >= Count)
    {
      v11 = 0;
      goto LABEL_26;
    }
    theDict.var0 = 0;
    *(_WORD *)&theDict.var1 = 0;
    CACFArray::GetCACFDictionary((CACFArray *)&theArray, v6, &theDict);
    if (theDict.var0)
    {
      v21 = 0;
      UInt32 = CACFDictionary::GetUInt32(&theDict, CFSTR("control ID"), &v21);
      v10 = v21 == a2 ? UInt32 : 0;
      if (v10 == 1)
        break;
    }
    CACFDictionary::~CACFDictionary(&theDict);
    v6 = (v6 + 1);
  }
  v20 = 0;
  CACFDictionary::GetUInt32(&theDict, CFSTR("base class"), &v20);
  v19 = 0;
  CACFDictionary::GetSInt32(&theDict, CFSTR("value"), &v19);
  v11 = 0;
  if ((int)v20 <= 1936483441)
  {
    if (v20 != 1818588780 && v20 != 1936483188)
      goto LABEL_25;
    goto LABEL_21;
  }
  if (v20 == 1936483442 || v20 == 1936744814)
  {
LABEL_21:
    if (v19 != a3)
      goto LABEL_17;
LABEL_22:
    v11 = 0;
    goto LABEL_25;
  }
  if (v20 == 1953458028)
  {
    if ((a3 != 0) == (v19 == 0))
    {
LABEL_17:
      v18.var0 = CFDictionaryCreateMutableCopy(0, 0, theDict.var0);
      *(_WORD *)&v18.var1 = 257;
      CACFDictionary::AddSInt32(&v18, CFSTR("value"));
      if (theArray)
      {
        v12 = CFArrayGetCount(theArray);
        v13 = theArray;
        v14 = v12;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      MutableCopy = CFArrayCreateMutableCopy(0, v14, v13);
      v17 = 257;
      MEMORY[0x23B802A68](&MutableCopy, v6, v18.var0);
      CACFDictionary::AddArray(v7, CFSTR("controls"), MutableCopy);
      CACFArray::~CACFArray((CACFArray *)&MutableCopy);
      CACFDictionary::~CACFDictionary(&v18);
      v11 = 1;
      goto LABEL_25;
    }
    goto LABEL_22;
  }
LABEL_25:
  CACFDictionary::~CACFDictionary(&theDict);
LABEL_26:
  CACFArray::~CACFArray((CACFArray *)&theArray);
  return v11;
}

void sub_236D6F7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, uint64_t a12, uint64_t a13, CACFDictionary a14, char a15)
{
  CACFDictionary::~CACFDictionary(&a11);
  CACFDictionary::~CACFDictionary(&a14);
  CACFArray::~CACFArray((CACFArray *)&a15);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::ReplaceMultiControlValue(ASDT::IOA2UCDevice *this, int a2, const unsigned int *a3, unsigned int a4)
{
  int v7;
  uint64_t v8;
  const unsigned int *v9;
  uint64_t v10;
  unsigned int Count;
  int UInt32;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  _BYTE *v20;
  const __CFArray *Mutable;
  uint64_t v22;
  const unsigned int *v23;
  uint64_t v25;
  _BYTE v26[4];
  int v27;
  const unsigned int *v28;
  int v29;
  uint64_t v30;
  const __CFArray *v31;
  __int16 v32;
  CACFDictionary v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  __CFArray *v37;
  __int16 v38;
  __CFArray *v39;
  __CFArray *v40;
  __CFArray *v41;
  uint64_t v42;
  unsigned int v43;
  CACFDictionary v44;
  CFArrayRef v45;
  __int16 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, CFSTR("controls"), (CFTypeRef *)&v40);
  v7 = 0;
  v8 = 0;
  v45 = v40;
  v46 = 1;
  v9 = &a3[a4 >> 2];
  if (a4 >> 2 <= 1)
    v10 = 1;
  else
    v10 = a4 >> 2;
  v30 = v10;
  while (1)
  {
    Count = v45;
    if (v45)
      Count = CFArrayGetCount(v45);
    if (v8 >= Count)
      break;
    v44.var0 = 0;
    *(_WORD *)&v44.var1 = 0;
    CACFArray::GetCACFDictionary((CACFArray *)&v45, v8, &v44);
    if (v44.var0)
    {
      v43 = 0;
      UInt32 = CACFDictionary::GetUInt32(&v44, CFSTR("control ID"), &v43);
      if (v43 == a2)
        v13 = UInt32;
      else
        v13 = 0;
      if (v13 == 1)
      {
        v40 = 0;
        v41 = 0;
        v42 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v40, a3, (uint64_t)v9, a4 >> 2);
        std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
        v39 = 0;
        CACFDictionary::GetArray(&v44, CFSTR("value"), &v39);
        v37 = v39;
        v38 = 0;
        v29 = a2;
        v28 = v9;
        if (v39)
        {
          CFArrayGetCount(v39);
          v14 = MEMORY[0x24BDAC7A8]();
          v16 = (uint64_t *)&v26[-v15];
          v17 = v14;
          if (v14)
          {
            v27 = v7;
            v18 = 0;
            v19 = (unsigned int *)&v26[-v15];
            do
              CACFArray::GetUInt32((CACFArray *)&v37, v18++, v19++);
            while (v17 != v18);
            v7 = v27;
          }
        }
        else
        {
          MEMORY[0x24BDAC7A8]();
          v16 = &v25;
          v17 = 0;
        }
        v34 = 0;
        v35 = 0;
        v36 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v34, v16, (uint64_t)v16 + 4 * v17, v17);
        std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
        v20 = v34;
        if (v35 - v34 != v41 - v40 || memcmp(v34, v40, v35 - v34))
        {
          v33.var0 = CFDictionaryCreateMutableCopy(0, 0, v44.var0);
          *(_WORD *)&v33.var1 = 257;
          Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
          v31 = Mutable;
          v32 = 257;
          v22 = v30;
          v23 = a3;
          if (a4 >= 4)
          {
            do
            {
              ++v23;
              CACFArray::AppendUInt32((CACFArray *)&v31);
              --v22;
            }
            while (v22);
            Mutable = v31;
          }
          CACFDictionary::AddArray(&v33, CFSTR("value"), Mutable);
          MEMORY[0x23B802A68](&v45, v8, v33.var0);
          CACFArray::~CACFArray((CACFArray *)&v31);
          CACFDictionary::~CACFDictionary(&v33);
          v7 = 1;
          v20 = v34;
        }
        if (v20)
        {
          v35 = v20;
          operator delete(v20);
        }
        CACFArray::~CACFArray((CACFArray *)&v37);
        if (v40)
        {
          v41 = v40;
          operator delete(v40);
        }
        a2 = v29;
        v9 = v28;
      }
      CACFDictionary::~CACFDictionary(&v44);
      v8 = (v8 + 1);
      if ((v13 & 1) != 0)
        break;
    }
    else
    {
      CACFDictionary::~CACFDictionary(&v44);
      v8 = (v8 + 1);
    }
  }
  CACFArray::~CACFArray((CACFArray *)&v45);
  return v7 & 1;
}

void sub_236D6FBA4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  CACFArray::~CACFArray((CACFArray *)(v1 - 184));
  v3 = *(void **)(v1 - 160);
  if (v3)
  {
    *(_QWORD *)(v1 - 152) = v3;
    operator delete(v3);
  }
  CACFDictionary::~CACFDictionary((CACFDictionary *)(v1 - 128));
  CACFArray::~CACFArray((CACFArray *)(v1 - 112));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UCDevice::ReplaceMultiControlValue(ASDT::IOA2UCDevice *this, __CFDictionary *a2, const unsigned int *a3)
{
  uint64_t v4;
  __CFArray *Mutable;
  __CFArray *v8;
  __int16 v9;
  CACFDictionary v10;

  v10.var0 = this;
  *(_WORD *)&v10.var1 = 256;
  if (this)
  {
    LODWORD(v4) = (_DWORD)a3;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v8 = Mutable;
    v9 = 257;
    if ((_DWORD)v4)
    {
      v4 = v4;
      do
      {
        a2 = (__CFDictionary *)((char *)a2 + 4);
        CACFArray::AppendUInt32((CACFArray *)&v8);
        --v4;
      }
      while (v4);
      Mutable = v8;
    }
    CACFDictionary::AddArray(&v10, CFSTR("value"), Mutable);
    CACFArray::~CACFArray((CACFArray *)&v8);
  }
  CACFDictionary::~CACFDictionary(&v10);
  return this != 0;
}

void sub_236D6FD00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
  CACFArray::~CACFArray((CACFArray *)&a9);
  CACFDictionary::~CACFDictionary(&a11);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::ReplaceControlList(CFDictionaryRef *this, uint64_t a2, uint64_t a3, const __CFArray **a4)
{
  CACFDictionary v5;
  __CFArray *isa;
  __int16 v7;
  __CFString var18;

  var18.isa = 0;
  if (ASDT::UCObject::CopyProperty_CFArray((ASDT::UCObject *)*((unsigned int *)this + 2), CFSTR("controls"), &var18, a4))
  {
    isa = (__CFArray *)var18.isa;
    v7 = 1;
    v5.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_WORD *)&v5.var1 = 257;
    CACFDictionary::SetCFMutableDictionaryFromCopy(&v5, this[2], 1);
    CACFDictionary::AddArray(&v5, CFSTR("controls"), isa);
    CACFDictionary::operator=((uint64_t)(this + 2), (uint64_t)&v5);
    CACFDictionary::~CACFDictionary(&v5);
    CACFArray::~CACFArray((CACFArray *)&isa);
  }
}

void sub_236D6FDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10, char a11)
{
  CACFArray::~CACFArray((CACFArray *)&a11);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::ReplaceControlInfo(ASDT::IOA2UCDevice *this, const __CFArray *a2, uint64_t a3, const __CFArray **a4)
{
  CACFDictionary *v6;
  unsigned int *v7;
  CACFDictionary v8;
  int v9;
  CFArrayRef theArray;
  __CFArray *Mutable;
  __int16 v12;
  CACFDictionary v13;
  void *isa;
  __int16 v15;
  __CFString v16;

  v16.isa = 0;
  if (ASDT::UCObject::CopyProperty_CFArray((ASDT::UCObject *)*((unsigned int *)this + 2), CFSTR("controls"), &v16, a4))
  {
    isa = v16.isa;
    v15 = 1;
    v13.var0 = ASDT::IOA2UCDevice::CopyControlDictionaryByID((ASDT::IOA2UCDevice *)v16.isa, a2);
    *(_WORD *)&v13.var1 = 1;
    theArray = 0;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v12 = 257;
    v6 = (CACFDictionary *)((char *)this + 16);
    CACFDictionary::GetArray(v6, CFSTR("controls"), &theArray);
    if (theArray)
      CACFArray::SetCFMutableArrayFromCopy((CACFArray *)&Mutable, theArray, 1);
    ASDT::IOA2UCDevice::GetControlDictionaryIndexByID(Mutable, a2, &v9, v7);
    if (v13.var0)
      CACFArray::AppendDictionary((CACFArray *)&Mutable, v13.var0);
    v8.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_WORD *)&v8.var1 = 257;
    CACFDictionary::SetCFMutableDictionaryFromCopy(&v8, v6->var0, 1);
    CACFDictionary::AddArray(&v8, CFSTR("controls"), Mutable);
    CACFDictionary::operator=((uint64_t)v6, (uint64_t)&v8);
    CACFDictionary::~CACFDictionary(&v8);
    CACFArray::~CACFArray((CACFArray *)&Mutable);
    CACFDictionary::~CACFDictionary(&v13);
    CACFArray::~CACFArray((CACFArray *)&isa);
  }
}

void sub_236D6FF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, CACFDictionary a15)
{
  uint64_t v15;

  CACFArray::~CACFArray((CACFArray *)&a13);
  CACFDictionary::~CACFDictionary(&a15);
  CACFArray::~CACFArray((CACFArray *)(v15 - 56));
  _Unwind_Resume(a1);
}

CFMutableArrayRef CACFArray::SetCFMutableArrayFromCopy(CACFArray *this, CFArrayRef theArray, char a3)
{
  const void *v6;
  CFMutableArrayRef result;

  if (*((_BYTE *)this + 8))
  {
    v6 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v6);
  }
  result = CFArrayCreateMutableCopy(0, 0, theArray);
  *(_QWORD *)this = result;
  *((_BYTE *)this + 9) = 1;
  *((_BYTE *)this + 8) = a3;
  return result;
}

uint64_t ASDT::IOA2UCDevice::PerformConfigChange(ASDT::IOA2UCDevice *this, const IOAudio2Notification *a2)
{
  uint64_t v2;

  v2 = ASDT::UCObject::CallMethod(this, 3u, 0, 0, a2, 0x20uLL, 0, 0, 0, 0);
  if ((_DWORD)v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOA2UCDevice::PerformConfigChange();
  return v2;
}

IOAudio2EngineStatus *ASDT::IOA2UCDevice::MapEngineStatus(ASDT::IOA2UCDevice *this, IOAudio2EngineStatus **a2)
{
  IOAudio2EngineStatus *result;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *exception;
  unsigned int v13;

  v13 = 0;
  result = (IOAudio2EngineStatus *)ASDT::UCObject::MapMemory(this, 0, 1u, &v13);
  if (v13 <= 0x27)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      ASDT::IOA2UCDevice::MapEngineStatus(v4, v5, v6, v7, v8, v9, v10, v11);
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &unk_25084B660;
    exception[2] = 2003329396;
  }
  *a2 = result;
  return result;
}

uint64_t ASDT::IOA2UCDevice::ReleaseEngineStatus(uint64_t this, void *a2)
{
  return ASDT::UCObject::ReleaseMemory(this, a2);
}

uint64_t ASDT::IOA2UCDevice::SupportsPreWarming(ASDT::IOA2UCDevice *this)
{
  return *((unsigned __int8 *)this + 35);
}

void CAVolumeCurve::CAVolumeCurve(CAVolumeCurve *this)
{
  this->mTag = 0;
  this->mCurveMap.__tree_.__pair3_.__value_ = 0;
  this->mCurveMap.__tree_.__pair1_.__value_.__left_ = 0;
  this->mCurveMap.__tree_.__begin_node_ = &this->mCurveMap.__tree_.__pair1_;
  this->mIsApplyingTransferFunction = 1;
  this->mTransferFunction = 5;
  *(_QWORD *)&this->mRawToScalarExponentNumerator = 0x3F80000040000000;
}

{
  this->mTag = 0;
  this->mCurveMap.__tree_.__pair3_.__value_ = 0;
  this->mCurveMap.__tree_.__pair1_.__value_.__left_ = 0;
  this->mCurveMap.__tree_.__begin_node_ = &this->mCurveMap.__tree_.__pair1_;
  this->mIsApplyingTransferFunction = 1;
  this->mTransferFunction = 5;
  *(_QWORD *)&this->mRawToScalarExponentNumerator = 0x3F80000040000000;
}

uint64_t CAVolumeCurve::GetMinimumRaw(CAVolumeCurve *this)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_)
    return *((unsigned int *)this->mCurveMap.__tree_.__begin_node_ + 7);
  else
    return 0;
}

uint64_t CAVolumeCurve::GetMaximumRaw(CAVolumeCurve *this)
{
  unint64_t value;
  _QWORD *begin_node;

  value = this->mCurveMap.__tree_.__pair3_.__value_;
  if (!value)
    return 0;
  begin_node = this->mCurveMap.__tree_.__begin_node_;
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&begin_node, (int)value - 1);
  return *((unsigned int *)begin_node + 8);
}

float CAVolumeCurve::GetMinimumDB(CAVolumeCurve *this)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_)
    return *((float *)this->mCurveMap.__tree_.__begin_node_ + 9);
  else
    return 0.0;
}

float CAVolumeCurve::GetMaximumDB(CAVolumeCurve *this)
{
  unint64_t value;
  float *begin_node;

  value = this->mCurveMap.__tree_.__pair3_.__value_;
  if (!value)
    return 0.0;
  begin_node = (float *)this->mCurveMap.__tree_.__begin_node_;
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>((_QWORD **)&begin_node, (int)value - 1);
  return begin_node[10];
}

CAVolumeCurve *CAVolumeCurve::SetTransferFunction(CAVolumeCurve *this, signed int a2)
{
  char v2;
  float v3;
  float v4;

  this->mTransferFunction = a2;
  if (a2 > 0xF)
  {
    v4 = 1.0;
    v3 = 2.0;
    v2 = 1;
  }
  else
  {
    v2 = byte_236D7B980[a2];
    v3 = flt_236D7B990[a2];
    v4 = flt_236D7B9D0[a2];
  }
  this->mIsApplyingTransferFunction = v2;
  this->mRawToScalarExponentNumerator = v3;
  this->mRawToScalarExponentDenominator = v4;
  return this;
}

void CAVolumeCurve::AddRange(CAVolumeCurve *this, signed int a2, signed int a3, float a4, float a5)
{
  uint64_t **p_mCurveMap;
  uint64_t **v6;
  uint64_t **begin_node;
  int v8;
  BOOL v9;
  char v10;
  uint64_t *v11;
  uint64_t **v12;
  BOOL v13;
  char v14;
  unint64_t v15;
  float v16;
  float v17;

  begin_node = (uint64_t **)this->mCurveMap.__tree_.__begin_node_;
  p_mCurveMap = (uint64_t **)&this->mCurveMap;
  v6 = begin_node;
  if (begin_node == p_mCurveMap + 1)
    goto LABEL_25;
  do
  {
    v8 = *((_DWORD *)v6 + 7);
    v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    v10 = v9;
    if (v9 || v8 <= a2)
    {
      v12 = v6;
    }
    else
    {
      v11 = v6[1];
      if (v11)
      {
        do
        {
          v12 = (uint64_t **)v11;
          v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (uint64_t **)v6[2];
          v13 = *v12 == (uint64_t *)v6;
          v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == p_mCurveMap + 1)
      v14 = 1;
    else
      v14 = v10;
    if ((v14 & 1) != 0)
      break;
    v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    v15 = __PAIR64__(a3, a2);
    v16 = a4;
    v17 = a5;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::__emplace_unique_key_args<CARawPoint,std::pair<CARawPoint const,CADBPoint>>(p_mCurveMap, (int *)&v15, (uint64_t *)&v15);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " CAVolumeCurve::AddRange: new point overlaps", (uint8_t *)&v15, 2u);
  }
}

void CAVolumeCurve::ResetRange(CAVolumeCurve *this)
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *p_pair1;

  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&this->mCurveMap, (_QWORD *)this->mCurveMap.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

BOOL CAVolumeCurve::CheckForContinuity(CAVolumeCurve *this)
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *p_pair1;
  int left_high;
  float v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *v7;
  int v8;
  float v9;
  BOOL v10;
  _BOOL8 result;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)this->mCurveMap.__tree_.__begin_node_;
  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  if (begin_node == &this->mCurveMap.__tree_.__pair1_)
    return 1;
  left_high = HIDWORD(begin_node[3].__value_.__left_);
  v4 = *((float *)&begin_node[4].__value_.__left_ + 1);
  do
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[1].__value_.__left_;
    v6 = begin_node;
    if (left)
    {
      do
      {
        v7 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
      }
      while (left);
    }
    else
    {
      do
      {
        v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)v6[2].__value_.__left_;
        v10 = v7->__value_.__left_ == v6;
        v6 = v7;
      }
      while (!v10);
    }
    v8 = HIDWORD(begin_node[3].__value_.__left_);
    v9 = *((float *)&begin_node[4].__value_.__left_ + 1);
    v10 = v4 == v9 && left_high == v8;
    result = v10;
    if (v7 == p_pair1)
      break;
    left_high = left_high - v8 + LODWORD(begin_node[4].__value_.__left_);
    v4 = v4 + (float)(*(float *)&begin_node[5].__value_.__left_ - v9);
    begin_node = v7;
  }
  while (result);
  return result;
}

uint64_t CAVolumeCurve::ConvertDBToRaw(CAVolumeCurve *this, float a2)
{
  float v4;
  float MaximumDB;
  float v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *begin_node;
  uint64_t result;
  int v9;
  float v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *v12;
  BOOL v13;

  if (this->mCurveMap.__tree_.__pair3_.__value_)
    v4 = *((float *)this->mCurveMap.__tree_.__begin_node_ + 9);
  else
    v4 = 0.0;
  MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 <= MaximumDB)
    MaximumDB = v6;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)this->mCurveMap.__tree_.__begin_node_;
  result = HIDWORD(begin_node[3].__value_.__left_);
  if (begin_node != &this->mCurveMap.__tree_.__pair1_)
  {
    do
    {
      v9 = LODWORD(begin_node[4].__value_.__left_) - HIDWORD(begin_node[3].__value_.__left_);
      v10 = *(float *)&begin_node[5].__value_.__left_;
      if (MaximumDB <= v10)
        v9 = llroundf((float)(MaximumDB - *((float *)&begin_node[4].__value_.__left_ + 1))/ (float)((float)(v10 - *((float *)&begin_node[4].__value_.__left_ + 1)) / (float)v9));
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v12 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[2].__value_.__left_;
          v13 = v12->__value_.__left_ == begin_node;
          begin_node = v12;
        }
        while (!v13);
      }
      result = (v9 + result);
      v13 = MaximumDB <= v10 || v12 == &this->mCurveMap.__tree_.__pair1_;
      begin_node = v12;
    }
    while (!v13);
  }
  return result;
}

uint64_t CAVolumeCurve::ConvertRawToDB(CAVolumeCurve *this, int a2)
{
  int v4;
  uint64_t result;
  int v6;
  int v7;
  float *begin_node;
  float v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *p_pair1;
  BOOL v11;
  int v12;
  int v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *left;
  float *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *v16;

  if (this->mCurveMap.__tree_.__pair3_.__value_)
    v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  else
    v4 = 0;
  result = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= (int)result)
    v6 = result;
  v7 = v6 - v4;
  begin_node = (float *)this->mCurveMap.__tree_.__begin_node_;
  v9 = begin_node[9];
  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  v11 = v7 < 1 || begin_node == (float *)p_pair1;
  if (!v11)
  {
    do
    {
      v12 = *((_DWORD *)begin_node + 8) - *((_DWORD *)begin_node + 7);
      if (v7 >= v12)
        v13 = *((_DWORD *)begin_node + 8) - *((_DWORD *)begin_node + 7);
      else
        v13 = v7;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)*((_QWORD *)begin_node + 1);
      v15 = begin_node;
      if (left)
      {
        do
        {
          v16 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)*((_QWORD *)v15 + 2);
          v11 = v16->__value_.__left_ == v15;
          v15 = (float *)v16;
        }
        while (!v11);
      }
      v9 = v9 + (float)((float)v13 * (float)((float)(begin_node[10] - begin_node[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1)
        break;
      begin_node = (float *)v16;
    }
    while (v16 != p_pair1);
  }
  return result;
}

float CAVolumeCurve::ConvertRawToScalar(CAVolumeCurve *this, int a2)
{
  int v4;
  int MaximumRaw;
  int v6;
  float v7;

  if (this->mCurveMap.__tree_.__pair3_.__value_)
    v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  else
    v4 = 0;
  MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= MaximumRaw)
    v6 = MaximumRaw;
  v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this))
    return powf(v7, this->mRawToScalarExponentNumerator / this->mRawToScalarExponentDenominator);
  else
    return v7;
}

BOOL CAVolumeCurve::GetIsApplyingTransferFunction(CAVolumeCurve *this)
{
  float v2;

  if (this->mCurveMap.__tree_.__pair3_.__value_)
    v2 = *((float *)this->mCurveMap.__tree_.__begin_node_ + 9);
  else
    v2 = 0.0;
  return (float)(CAVolumeCurve::GetMaximumDB(this) - v2) > 30.0 && this->mIsApplyingTransferFunction;
}

float CAVolumeCurve::ConvertDBToScalar(CAVolumeCurve *this, float a2)
{
  int v3;

  v3 = CAVolumeCurve::ConvertDBToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t CAVolumeCurve::ConvertScalarToRaw(CAVolumeCurve *this, float a2)
{
  float v3;
  int v4;
  float v5;
  int MaximumRaw;

  v3 = fmaxf(a2, 0.0);
  if (this->mCurveMap.__tree_.__pair3_.__value_)
    v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  else
    v4 = 0;
  v5 = fminf(v3, 1.0);
  MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this))
    v5 = powf(v5, this->mRawToScalarExponentDenominator / this->mRawToScalarExponentNumerator);
  return v4 + llroundf(v5 * (float)(MaximumRaw - v4));
}

uint64_t CAVolumeCurve::ConvertScalarToDB(CAVolumeCurve *this, float a2)
{
  int v3;

  v3 = CAVolumeCurve::ConvertScalarToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToDB(this, v3);
}

_QWORD **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(_QWORD **result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  _QWORD *v7;
  _QWORD *v8;

  if (a2 < 0)
  {
    v7 = *result;
    do
    {
      v8 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v4 = v8;
          v8 = (_QWORD *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v7[2];
          v5 = *v4 == (_QWORD)v7;
          v7 = v4;
        }
        while (v5);
      }
      v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2)
      return result;
    v2 = *result;
    do
    {
      v3 = (_QWORD *)v2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v2[2];
          v5 = *v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
    }
    while (a2-- > 1);
  }
  *result = v4;
  return result;
}

uint64_t *std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::__emplace_unique_key_args<CARawPoint,std::pair<CARawPoint const,CADBPoint>>(uint64_t **a1, int *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x30uLL);
    v11 = a3[1];
    *(uint64_t *)((char *)v10 + 28) = *a3;
    *(uint64_t *)((char *)v10 + 36) = v11;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void `anonymous namespace'::LogBadDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: '%s' is not an IOAudio2Device!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::SetNominalSampleRate()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetNominalSampleRate", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::SetClientDescription()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetClientDescription", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStreamInfo_CurrentFormat: there is no current format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStreamInfo_CurrentFormat: bad format dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: CopyStreamInfo_AvailableFormats: there are no available formats", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStreamInfo_StartingChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStreamInfo_StartingChannel: there is no starting channel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::MapIOBufferForStream()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapIOBufferForStream: no stream for the given ID: %u", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapIOBufferForStream(%u) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::SetStreamActive()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetStreamActive(%u, %hhu)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::GetControlInfo_BaseClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetControlInfo_BaseClass: there is no control base class", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetControlInfo_Class(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetControlInfo_Class: there is no control class", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetSliderControlInfo_MinimumValue: there is no minimum value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetSliderControlInfo_MaximumValue: there is no maximum value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: CopyLevelControlInfo_RangeMap: there is no range map", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: CopySelectorControlInfo_MultiSelectorValue: there is no selector value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: CopySelectorControlInfo_SelectorMap: there is no selector map", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStereoPanControlInfo_LeftValue: there is no left value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStereoPanControlInfo_CenterValue: there is no center value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStereoPanControlInfo_RightValue: there is no right value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStereoPanControlInfo_LeftChannel: there is no left channel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetStereoPanControlInfo_RightChannel: there is no right channel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: CopyBlockControlInfo_Descriptor: there is no descriptor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::MapBlockControlBuffer()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapBlockControlBuffer: no control info", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapBlockControlBuffer: control ID missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapBlockControlBuffer(%u) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::MoveBlockControlData()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MoveBlockControlData failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::MapDataExchangeBlockBuffer()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapDataExchangeBlockBuffer: no data exchange block for the given ID", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapDataExchangeBlockBuffer(%u) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::MoveDataExchangeBlockData()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MoveDataExchangeBlockData(%u) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::StartIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: StartIO failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::StartIOWithFlags()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: StartIOWithFlags(%llu) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::StopIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: StopIO failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::StopIOWithFlags()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: StopIOWithFlags(%llu) failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::TeardownForIsolatedIO()
{
  uint64_t v0;
  uint8_t v1[18];
  __int16 v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  v2 = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: TeardownForIsolatedIO(%u, %llu) failed", v1, 0x1Cu);
}

void ASDT::IOA2UserClient::SetStreamCurrentFormat()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetStreamCurrentFormat(%u): got an error when telling the hardware to set the stream format", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::SetControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetControlValue(%u, %u): got an error when telling the hardware to change a control value", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::SetMultiControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: SetMultiControlValue(%u): Failed to set control multi-value", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::GetUpdatedControlValue(unsigned int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = HIBYTE(a1);
  if ((a1 - 0x20000000) >> 24 >= 0x5F)
    v1 = 32;
  v2 = BYTE2(a1);
  if (BYTE2(a1) - 32 >= 0x5F)
    v2 = 32;
  v3 = BYTE1(a1);
  if (BYTE1(a1) - 32 >= 0x5F)
    v3 = 32;
  v5[0] = 67110144;
  v5[1] = v1;
  v4 = a1;
  v6 = 1024;
  v7 = v2;
  v8 = 1024;
  v9 = v3;
  v10 = 1024;
  if (a1 - 32 >= 0x5F)
    v4 = 32;
  v11 = v4;
  v12 = 1024;
  v13 = a1;
}

void ASDT::IOA2UserClient::ReplaceControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: ReplaceControlValue: No control with ID %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::GetUpdatedMultiControlValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "IOA2UserClient: GetUpdatedMultiControlValue: Invalid arguments.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UserClient::ReplaceMultiControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: ReplaceMultiControlValue: No control with ID %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::RefreshControlList()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: RefreshControlList: Failed to copy property", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::RefreshControlInfo()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: RefreshControlInfo: Failed to copy property", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::PerformConfigChange()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: PerformConfigChange failed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::IOA2UserClient::MapEngineStatus()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: MapEngineStatus memory not large enough", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void ASDT::UCObject::CopyProperties()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::CopyProperties: failed to get the properties from the IO Registry, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::SetProperty()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::SetProperty: got an error from the IORegistry, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::CacheProperties()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::CacheProperties: failed to get the properties from the IO Registry, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::CopyMatchingObjectWithPropertyValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::CopyMatchingObjectWithPropertyValue: IOMainPort failed, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::OpenConnection()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::OpenConnection: failed to open a connection, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::SetConnectionNotificationPort()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::SetConnectionNotificationPort: Cannot set the connection's's notification port., Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::UCObject::MapMemory()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " UCObject::MapMemory: mapped in a NULL pointer", v0, 2u);
  OUTLINED_FUNCTION_6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " UCObject::MapMemory: failed to map in the memory, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::exceptionBarrierReturnSuccess(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_11_0((uint64_t)v1);
  if (OUTLINED_FUNCTION_9_0(MEMORY[0x24BDACB70]))
  {
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_1_2(&dword_236D43000, MEMORY[0x24BDACB70], v2, "Caught CAException %d %4.4s", v3, v4, v5, v6, v7);
  }
  OUTLINED_FUNCTION_2_3();
}

void CADeprecated::CADispatchQueue::CADispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::CADispatchQueue: failed to create the dispatch queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CADispatchQueue::~CADispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::~CADispatchQueue: Implicitly removing the mach port receviers. It is best to explicitly call RemoveMachPortRecevier().", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::InstallMachPortDeathNotification: a mach port is required", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::InstallMachPortDeathNotification: failed to create the mach port event source", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CADispatchQueue::InstallMachPortReceiver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::InstallMachPortReceiver: a mach port is required", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::InstallMachPortReceiver: failed to create the mach port event source", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::RemoveMachPortReceiver: deallocating the receive right failed, Error: 0x%X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::RemoveMachPortReceiver: deallocating the send right failed, Error: 0x%X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CADispatchQueue::GetGlobalSerialQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CADispatchQueue::GetGlobalSerialQueue: there is no global serial queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void getValueAndRangeFromControlDict()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: Missing range min from control dict: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: Missing range max from control dict: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_236D43000, MEMORY[0x24BDACB70], v0, "%s: Missing value from control dict: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void CADeprecated::CAMutex::CAMutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CAMutex::CAMutex: Could not init the mutex", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CAMutex::Lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CAMutex::Lock: Could not lock the mutex", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CAMutex::Unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " CAMutex::Unlock: Could not unlock the mutex", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void CADeprecated::CAMutex::Try(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a2;
  v3 = 2080;
  v4 = a1;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

void CADeprecated::CAMutex::Unlocker::Unlocker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " Major problem: Unlocker attempted to unlock a mutex not owned by the current thread!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::IOA2UCDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::IOA2UCDevice: this is not an IOAudio2Device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::operator=(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::operator=: this is not an IOAudio2Device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetNominalSampleRate()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::SetNominalSampleRate: got an error when telling the hardware to change a control value, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopyHeadsetInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopyHeadsetInfo: could not allocate an empty dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetClientDescription()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::SetClientDescription: got an error when telling the hardware to change client description, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByIndex_ID: there is no stream ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat: the current format is not formatted correctly", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat: there is no current format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats: there are no available formats", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByIndex_StartingChannel: there is no starting channel number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByID_CurrentFormat: the current format is not formatted correctly", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByID_CurrentFormat: there is no current format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopyStreamInfoByID_AvailableFormats: there are no available formats", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStreamInfoByID_StartingChannel: there is no starting channel number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MapIOBufferForStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::MapIOBufferForStream: no stream for the given ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetStreamActive()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::SetStreamActive: got an error when telling the hardware to turn a stream on or off, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetControlInfo_BaseClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetControlInfoByIndex_BaseClass: there is no control base class", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetControlInfo_Class(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetControlInfoByIndex_Class: there is no control class", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetControlInfo_Scope(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetControlInfoByIndex_Class: there is no control scope", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetControlInfo_Element(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetControlInfoByIndex_Element: there is no control scope", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetControlInfo_Value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetControlInfoByIndex_Value: there is no control value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetSliderControlInfoByIndex_MinimumValue: there is no minimum control value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetSliderControlInfoByIndex_MaximumValue: there is no maximum control value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopyLevelControlInfoByIndex_RangeMap: there is no range map", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue: there is no selector value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::CopySelectorControlInfoByIndex_SelectorMap: there is no selector map", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStereoPanControlInfoByIndex_LeftValue: there is no left value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStereoPanControlInfoByIndex_CenterValue: there is no center value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStereoPanControlInfoByIndex_RightValue: there is no right value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStereoPanControlInfoByIndex_LeftChannel: there is no left channel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetStereoPanControlInfoByIndex_LeftChannel: there is no right channel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::GetBlockControlInfoByID_Descriptor: there is no descriptor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MapBlockControlBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::MapBlockControlBuffer: no control for the given ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MoveBlockControlData()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::MoveBlockControlData: got an error when telling the hardware to move the block control data, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::MapDataExchangeBlockBuffer: no data exchange block for the given ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MoveDataExchangeBlockData()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::MoveDataExchangeBlockData: got an error when telling the hardware to move the block control data, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::StartIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::StartIO: got an error when telling the hardware to start, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::StartIOWithFlags()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::StartIOWithFlags: got an error when telling the hardware to start, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::StopIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::StopIO: got an error when telling the hardware to stop, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::StopIOWithFlags()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::StopIOWithFlags: got an error when telling the hardware to stop, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetStreamCurrentFormat()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::SetStreamCurrentFormat: got an error when telling the hardware to set the stream format, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::SetControlValue: got an error when telling the hardware to change a control value, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::SetMultiControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " HAL_IOA2PhysicalDevice::SetMultiControlValue: got an error when telling the hardware to change a multi control value, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::PerformConfigChange()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_236D43000, MEMORY[0x24BDACB70], v0, " IOA2UCDevice::PerformConfigChange: got an error from the call down to the driver, Error: 0x%X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void ASDT::IOA2UCDevice::MapEngineStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, " IOA2UCDevice::MapEngineStatus: Mapped engine status is not large enough.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
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

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F20](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return MEMORY[0x24BDD7F48](*(_QWORD *)&connect, *(_QWORD *)&index);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x24BDD7F78](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4, p5, p6);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F88](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x24BDD86D8](*(_QWORD *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x24BDD86F0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88F8](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t CACFString::GetCString(CACFString *this, const __CFString *a2, char *a3, unsigned int *a4)
{
  return MEMORY[0x24BE0A290](this, a2, a3, a4);
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  return MEMORY[0x24BE0A298](this, a2, a3);
}

uint64_t CACFDictionary::AddSInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BE0A2A0](this, a2);
}

uint64_t CACFDictionary::AddUInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BE0A2A8](this, a2);
}

uint64_t CACFDictionary::AddUInt64(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BE0A2B0](this, a2);
}

uint64_t CAAudioValueRange::PickCommonSampleRate(CAAudioValueRange *this, const AudioValueRange *a2)
{
  return MEMORY[0x24BE0A2B8](this, a2);
}

uint64_t CAStreamBasicDescription::IsEquivalent(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  return MEMORY[0x24BE0A2C0](this, a2, a3);
}

uint64_t ASDT::ValueRange::PickCommonSampleRate(ASDT::ValueRange *this, const AudioValueRange *a2)
{
  return MEMORY[0x24BE0A2C8](this, a2);
}

uint64_t ASDT::VolumeCurve::ResetRange(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A2D0](this);
}

uint64_t ASDT::VolumeCurve::SetTransferFunction(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A2D8](this);
}

uint64_t ASDT::VolumeCurve::AddRange(ASDT::VolumeCurve *this, float a2, float a3)
{
  return MEMORY[0x24BE0A2E0](this, a2, a3);
}

uint64_t ASDT::VolumeCurve::VolumeCurve(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A2E8](this);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2)
{
  return MEMORY[0x24BE0A2F8](this, a2);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x24BE0A300](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DataRef *a3)
{
  return MEMORY[0x24BE0A308](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::ArrayRef *a3)
{
  return MEMORY[0x24BE0A310](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::StringRef *a3)
{
  return MEMORY[0x24BE0A318](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  return MEMORY[0x24BE0A320](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, int *a3)
{
  return MEMORY[0x24BE0A328](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  return MEMORY[0x24BE0A330](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, uint64_t *a3)
{
  return MEMORY[0x24BE0A338](this, a2, a3);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, uint64_t a2, const applesauce::CF::StringRef *a3, applesauce::CF::TypeRef *a4)
{
  return MEMORY[0x24BE0A340](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(ASDT::IOUserClient *this, void *a2)
{
  return MEMORY[0x24BE0A348](this, a2);
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A350](this);
}

uint64_t ASDT::IOUserClient::ReplaceProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, const applesauce::CF::ArrayRef *a3)
{
  return MEMORY[0x24BE0A358](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ArraySetValueAtIndex()
{
  return MEMORY[0x24BE0A360]();
}

uint64_t ASDT::IOUserClient::DictionarySetValueForKey()
{
  return MEMORY[0x24BE0A370]();
}

uint64_t ASDT::IOUserClient::SetConnectionNotification()
{
  return MEMORY[0x24BE0A378]();
}

uint64_t ASDT::IOUserClient::GetConnectionNotificationPort(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A380](this);
}

uint64_t ASDT::IOUserClient::SetTerminationNotificationEnabled(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A390](this);
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A398](this);
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x24BE0A3A0](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  return MEMORY[0x24BE0A3B0](this, a2);
}

uint64_t ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A3B8](this);
}

void ASDT::IOUserClient::~IOUserClient(ASDT::IOUserClient *this)
{
  MEMORY[0x24BE0A3C0](this);
}

uint64_t ASDT::IOUserClient::operator=()
{
  return MEMORY[0x24BE0A3D0]();
}

uint64_t ASDT::Exclaves::NamedBuffer::Read(ASDT::Exclaves::NamedBuffer *this, unsigned __int8 *a2)
{
  return MEMORY[0x24BE0A3D8](this, a2);
}

uint64_t ASDT::IOAudio2::Helpers::Fixed64FromFloat64(ASDT::IOAudio2::Helpers *this, double a2)
{
  return MEMORY[0x24BE0A3E0](this, a2);
}

uint64_t ASDT::IOAudio2::Helpers::Float64FromFixed64(ASDT::IOAudio2::Helpers *this)
{
  return MEMORY[0x24BE0A3E8](this);
}

uint64_t ASDT::MachPort::CreatePort(ASDT::MachPort *this)
{
  return MEMORY[0x24BE0A400](this);
}

uint64_t caulk::platform::process_name(caulk::platform *this)
{
  return MEMORY[0x24BEC6F00](this);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this)
{
  return MEMORY[0x24BE0A408](this);
}

uint64_t CACFArray::SetDictionary(CACFArray *this, uint64_t a2, const __CFDictionary *a3)
{
  return MEMORY[0x24BE0A410](this, a2, a3);
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BE0A418](this, a2);
}

uint64_t CAProcess::ProcessExists(CAProcess *this)
{
  return MEMORY[0x24BE0A420](this);
}

uint64_t CAProcess::GetPID(CAProcess *this)
{
  return MEMORY[0x24BE0A428](this);
}

uint64_t CACFNumber::GetFixed32(CACFNumber *this)
{
  return MEMORY[0x24BE0A430](this);
}

uint64_t CACFNumber::GetFixed64(CACFNumber *this)
{
  return MEMORY[0x24BE0A438](this);
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  return MEMORY[0x24BE0A440](this, a2, a3);
}

uint64_t CACFDictionary::GetCACFArray(CACFDictionary *this, const __CFString *a2, CACFArray *a3)
{
  return MEMORY[0x24BE0A448](this, a2, a3);
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  return MEMORY[0x24BE0A450](this, a2, a3);
}

uint64_t CACFDictionary::HasKey(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BE0A458](this, a2);
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  return MEMORY[0x24BE0A460](this, a2, a3);
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  return MEMORY[0x24BE0A468](this, a2, a3);
}

uint64_t CACFDictionary::GetCFType(CACFDictionary *this, const __CFString *a2, const void **a3)
{
  return MEMORY[0x24BE0A470](this, a2, a3);
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  return MEMORY[0x24BE0A478](this, a2, a3);
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  return MEMORY[0x24BE0A480](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  return MEMORY[0x24BE0A488](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  return MEMORY[0x24BE0A490](this, a2, a3);
}

uint64_t ASDT::VolumeCurve::GetMaximumDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A498](this);
}

uint64_t ASDT::VolumeCurve::GetMinimumDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A4A0](this);
}

uint64_t ASDT::VolumeCurve::ConvertDBToRaw(ASDT::VolumeCurve *this, float a2)
{
  return MEMORY[0x24BE0A4A8](this, a2);
}

uint64_t ASDT::VolumeCurve::ConvertRawToDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x24BE0A4B0](this);
}

uint64_t ASDT::VolumeCurve::ConvertScalarToDB(ASDT::VolumeCurve *this, float a2)
{
  return MEMORY[0x24BE0A4B8](this, a2);
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t *a10)
{
  return MEMORY[0x24BE0A4C0](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ASDT::IOUserClient::ConformsTo(ASDT::IOUserClient *this, const char *a2)
{
  return MEMORY[0x24BE0A4C8](this, a2);
}

uint64_t ASDT::IOUserClient::SharedLock(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A4D0](this);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, applesauce::CF::TypeRef *a3)
{
  return MEMORY[0x24BE0A4D8](this, a2, a3);
}

uint64_t ASDT::IOUserClient::IsServiceAlive(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A4E8](this);
}

uint64_t ASDT::IOUserClient::CallTrap6(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A508](this);
}

uint64_t CACFArray::GetDictionary(CACFArray *this, uint64_t a2, const __CFDictionary **a3)
{
  return MEMORY[0x24BE0A510](this, a2, a3);
}

uint64_t CACFArray::GetCACFDictionary(CACFArray *this, uint64_t a2, CACFDictionary *a3)
{
  return MEMORY[0x24BE0A518](this, a2, a3);
}

uint64_t CACFArray::GetUInt32(CACFArray *this, uint64_t a2, unsigned int *a3)
{
  return MEMORY[0x24BE0A520](this, a2, a3);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB088](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB090](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x24BEDB0A0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB0A8](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB148](this);
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB150](this);
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB160](this);
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB168](this);
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x24BEDB178](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x24BEDB3B8]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_25084AF78(__p);
}

uint64_t operator delete()
{
  return off_25084AF80();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25084AF88(__sz);
}

uint64_t operator new()
{
  return off_25084AF90();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
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

uint64_t asdtPowerStateCompare()
{
  return MEMORY[0x24BE0A530]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADC68](when, queue, context, work);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADD00](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

