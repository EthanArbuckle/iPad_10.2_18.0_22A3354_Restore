void sub_236D8999C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D89B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D89D4C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D89E68(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_236D89EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTIOPAudioVTDevice;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_236D8A1FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void sub_236D8A290(_Unwind_Exception *a1)
{
  void *v1;

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
      MEMORY[0x23B8033EC](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236D8A3AC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

ASDT::IOPAudio::VoiceTrigger::UserClient *ASDT::IOPAudio::VoiceTrigger::UserClient::UserClient(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  uint64_t v2;

  v2 = ASDT::IOUserClient::IOUserClient(this);
  *(_QWORD *)v2 = &off_2508509E8;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v2 + 376));
  *((_BYTE *)this + 544) = 0;
  *((_QWORD *)this + 69) = 0;
  return this;
}

void sub_236D8A420(_Unwind_Exception *a1)
{
  ASDT::IOUserClient *v1;

  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_236D8A6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::IsolatedIOBuffer::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "identifier");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8A908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
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

void sub_236D8A98C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, char *a2)
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
    MEMORY[0x23B8033EC](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return this;
}

void sub_236D8AA54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  CFTypeRef *v15;

  if (*v15)
    CFRelease(*v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, const AudioStreamBasicDescription *a2, unsigned int a3)
{
  int v4;
  _BYTE v6[40];
  unint64_t v7;

  v7 = a3;
  ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2();
  v4 = ASDT::IOUserClient::CallMethod(this, 0, &v7, 1, v6, 40, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription();
  return v4 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, AudioStreamBasicDescription *a2)
{
  _BOOL8 result;
  unint64_t v3;
  _BYTE v4[40];

  v3 = 40;
  if (ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, v4, &v3))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription();
    return 0;
  }
  if (v3 <= 0x27)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription();
    return 0;
  }
  ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2();
  return 1;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 2, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO();
  return v1 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 3, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO();
  return v1 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, unint64_t a2, unsigned int a3)
{
  int v3;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = ASDT::IOUserClient::CallMethod(this, 4, v5, 2, 0, 0, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO();
  return v3 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, unint64_t a2)
{
  int v2;
  unint64_t v4;

  v4 = a2;
  v2 = ASDT::IOUserClient::CallMethod(this, 5, &v4, 1, 0, 0, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO();
  return v2 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallTrap3(this);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput();
  return v1 == 0;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2508506C0, MEMORY[0x24BEDAAF0]);
}

void sub_236D8AF98(_Unwind_Exception *a1)
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

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::LPMic::UserClient::CopyIdentifier(ASDT::IOPAudio::LPMic::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "identifier");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8BC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription(ASDT::IOPAudio::LPMic::UserClient *this, StreamDescription *a2)
{
  char v4;
  const void *v5;
  char v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  uint64_t v14;
  void *exception;
  void *v17;
  void *v18;
  CFTypeRef v19;
  CFTypeRef cf;
  const void *v21;

  v21 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "input stream description");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v21);
  if (cf)
    CFRelease(cf);
  v5 = v21;
  if (v21)
    v6 = v4;
  else
    v6 = 0;
  if ((v6 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v14 = 0;
      if (!v5)
        return v14;
      goto LABEL_34;
    }
    ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription();
    goto LABEL_32;
  }
  *(_OWORD *)&a2->var0 = 0u;
  *(_OWORD *)&a2->var3 = 0u;
  *(_OWORD *)&a2->var7 = 0u;
  a2->var1 = 1819304813;
  a2->var4 = 1;
  cf = &v21;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "sample rate");
  v7 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  if (v19)
    CFRelease(v19);
  if (((unint64_t)v7 & 0xFF00000000) == 0)
    goto LABEL_32;
  a2->var0 = (double)v7;
  if (!v21)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B8033EC](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  cf = &v21;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "format flags");
  v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  if (v19)
    CFRelease(v19);
  if (((unint64_t)v8 & 0xFF00000000) == 0)
    goto LABEL_32;
  a2->var2 = v8 & 0x1F;
  if (!v21)
  {
    v17 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B8033EC](v17, "Could not construct");
    __cxa_throw(v17, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  cf = &v21;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "channels per frame");
  v9 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  if (v19)
    CFRelease(v19);
  if (((unint64_t)v9 & 0xFF00000000) == 0)
    goto LABEL_32;
  a2->var6 = v9;
  if (!v21)
  {
    v18 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B8033EC](v18, "Could not construct");
    __cxa_throw(v18, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  cf = &v21;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "bits per channel");
  v10 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  if (v19)
    CFRelease(v19);
  if (((unint64_t)v10 & 0xFF00000000) == 0
    || (a2->var7 = v10,
        cf = applesauce::CF::DictionaryRef::operator->(&v21),
        applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "bytes per frame"),
        v11 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19), applesauce::CF::StringRef::~StringRef(&v19), ((unint64_t)v11 & 0xFF00000000) == 0))
  {
LABEL_32:
    v14 = 0;
    goto LABEL_33;
  }
  a2->var5 = v11;
  a2->var3 = a2->var4 * (_DWORD)v11;
  cf = applesauce::CF::DictionaryRef::operator->(&v21);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "latency in frames");
  v12 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  applesauce::CF::StringRef::~StringRef(&v19);
  if (((unint64_t)v12 & 0xFF00000000) != 0)
    a2->var9 = v12;
  cf = applesauce::CF::DictionaryRef::operator->(&v21);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v19, "driver safety offset in frames");
  v13 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
  applesauce::CF::StringRef::~StringRef(&v19);
  if (((unint64_t)v13 & 0xFF00000000) != 0)
    a2->var10 = v13;
  v14 = 1;
LABEL_33:
  v5 = v21;
  if (v21)
LABEL_34:
    CFRelease(v5);
  return v14;
}

void sub_236D8BF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
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

void sub_236D8C070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
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

void sub_236D8C0B8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236D8C0D0(_Unwind_Exception *a1)
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

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetClockDomain(ASDT::IOPAudio::LPMic::UserClient *this)
{
  char v2;
  uint64_t result;
  CFTypeRef cf;
  unsigned int v5;

  v5 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "clock domain");
  v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v5);
  if (cf)
    CFRelease(cf);
  if ((v2 & 1) != 0)
    return v5;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetClockDomain();
    return 0;
  }
  return result;
}

void sub_236D8C198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
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

void sub_236D8C20C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval(ASDT::IOPAudio::LPMic::UserClient *this)
{
  char v2;
  uint64_t result;
  CFTypeRef cf;
  unsigned int v5;

  v5 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "zero timestamp wrap frames");
  v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v5);
  if (cf)
    CFRelease(cf);
  if ((v2 & 1) != 0)
    return v5;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval();
    return 0;
  }
  return result;
}

void sub_236D8C2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize(ASDT::IOPAudio::LPMic::UserClient *this)
{
  char v2;
  uint64_t result;
  CFTypeRef cf;
  unsigned int v5;

  v5 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "io buffer frame size");
  v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v5);
  if (cf)
    CFRelease(cf);
  if ((v2 & 1) != 0)
    return v5;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize();
    return 0;
  }
  return result;
}

void sub_236D8C34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported(ASDT::IOPAudio::LPMic::UserClient *this)
{
  char v2;
  _BOOL8 result;
  CFTypeRef cf;
  char v5;

  v5 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "historic data supported");
  v2 = ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v5);
  if (cf)
    CFRelease(cf);
  if ((v2 & 1) != 0)
    return v5 != 0;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported();
    return 0;
  }
  return result;
}

void sub_236D8C3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
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

void sub_236D8C468(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::StartIO(ASDT::IOPAudio::LPMic::UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::LPMic::UserClient::StartIO();
  return v1 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::StopIO(ASDT::IOPAudio::LPMic::UserClient *this)
{
  int v1;

  v1 = ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::LPMic::UserClient::StopIO();
  return v1 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetControlValue(ASDT::IOUserClient *a1, unsigned int a2, _DWORD *a3)
{
  _BOOL8 result;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;

  v7 = a2;
  v6 = 0;
  v5 = 1;
  if (ASDT::IOUserClient::CallMethod(a1, 2, &v7, 1, 0, 0, &v6, &v5, 0, 0))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
    return 0;
  }
  if (v5 == 1)
  {
    *a3 = v6;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetControlValue(ASDT::IOUserClient *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = ASDT::IOUserClient::CallMethod(a1, 3, v5, 2, 0, 0, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::LPMic::UserClient::SetControlValue();
  return v3 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetSampleRate(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::SetControlValue(this, 0x53724368u, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetSupportedChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int *a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::GetControlValue(this, 0x5375436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetEnabledChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int *a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::GetControlValue(this, 0x456E436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetEnabledChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::SetControlValue(this, 0x456E436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus(ASDT::IOPAudio::LPMic::UserClient *this, ASDT::IOPAudio::LPMic::EngineStatus **a2)
{
  ASDT::IOPAudio::LPMic::EngineStatus *v3;
  _BOOL8 result;
  unsigned int v5;

  v5 = 0;
  v3 = (ASDT::IOPAudio::LPMic::EngineStatus *)ASDT::IOUserClient::MapMemory(this, 1098208116, 1, &v5);
  if (!v3)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus();
    return 0;
  }
  if (v5 == 32)
  {
    *a2 = v3;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus();
    return 0;
  }
  return result;
}

uint64_t ASDT::IOPAudio::LPMic::EngineStatus::Snapshot@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(this + 8);
  v3 = *(_QWORD *)(this + 16);
  v4 = *(_QWORD *)(this + 24);
  do
  {
    do
    {
      v5 = *(_OWORD *)(this + 16);
      *(_OWORD *)a2 = *(_OWORD *)this;
      *(_OWORD *)(a2 + 16) = v5;
    }
    while (*(_OWORD *)(a2 + 8) != __PAIR128__(v3, v2));
  }
  while (*(_QWORD *)(a2 + 24) != v4);
  return this;
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
  JUMPOUT(0x23B8033ECLL);
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

void sub_236D8D174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D8D35C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D8D450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::IOBuffer::UserClient::~UserClient(ASDT::IOPAudio::IOBuffer::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B80347CLL);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::UserClient(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ASDT::IOUserClient::IOUserClient();
  *(_QWORD *)v4 = &off_2508509E8;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v4 + 376));
  *(_BYTE *)(a1 + 544) = 0;
  *(_BYTE *)(a1 + 544) = *(_BYTE *)(a2 + 544);
  *(_QWORD *)(a1 + 552) = *(_QWORD *)(a2 + 552);
  *(_BYTE *)(a2 + 544) = 0;
  *(_QWORD *)(a2 + 552) = 0;
  return a1;
}

void sub_236D8D644(_Unwind_Exception *a1)
{
  ASDT::IOUserClient *v1;

  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::MoveDataMembers(uint64_t this, UserClient *a2)
{
  *(_BYTE *)(this + 544) = *((_BYTE *)a2 + 544);
  *(_QWORD *)(this + 552) = *((_QWORD *)a2 + 69);
  *((_BYTE *)a2 + 544) = 0;
  *((_QWORD *)a2 + 69) = 0;
  return this;
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::~UserClient(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  const void *v2;

  *(_QWORD *)this = &off_2508509E8;
  v2 = (const void *)*((_QWORD *)this + 69);
  if (v2)
    _Block_release(v2);
  ASDT::IOPAudio::VoiceTrigger::UserClient::Close(this);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 488));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 440));
  std::mutex::~mutex((std::mutex *)((char *)this + 376));
  ASDT::IOUserClient::~IOUserClient(this);
}

{
  ASDT::IOPAudio::VoiceTrigger::UserClient::~UserClient(this);
  JUMPOUT(0x23B80347CLL);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::Close(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  char *v3;
  char v4;

  v3 = (char *)this + 376;
  v4 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 376));
  if (*((_BYTE *)this + 544))
  {
    if (ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      ASDT::IOPAudio::VoiceTrigger::UserClient::Close();
    }
    *((_BYTE *)this + 544) = 0;
  }
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

void sub_236D8D770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::operator=(uint64_t a1, uint64_t a2)
{
  ASDT::IOUserClient::operator=();
  *(_BYTE *)(a1 + 544) = *(_BYTE *)(a2 + 544);
  *(_QWORD *)(a1 + 552) = *(_QWORD *)(a2 + 552);
  *(_BYTE *)(a2 + 544) = 0;
  *(_QWORD *)(a2 + 552) = 0;
  return a1;
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::VTExclusiveLock(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_mutex_base *v2;

  v2 = (std::__shared_mutex_base *)((char *)this + 376);
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v2);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::VTSharedLock(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_mutex_base *v2;

  v2 = (std::__shared_mutex_base *)((char *)this + 376);
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v2);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "identifier");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8D8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  int v2;
  int v3;
  int v4;
  _BOOL8 result;
  CFTypeRef cf;
  int v7;
  unsigned __int8 v8;

  v8 = 0;
  v7 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "VTConfigured");
  v2 = ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf)
    CFRelease(cf);
  if (v2)
  {
    v3 = v8;
    return v3 != 0;
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "VTConfigured");
  v4 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    v3 = v7;
    return v3 != 0;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured();
    return 0;
  }
  return result;
}

void sub_236D8D9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "VTConfiguration");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8DAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::SetConfigurationInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  uint64_t v4;
  CFTypeRef cf;

  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "VTConfiguration");
  v4 = ASDT::IOUserClient::SetProperty(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v4;
}

void sub_236D8DB28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyEventInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "VTEventInfo");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8DBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::Open(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  uint64_t v2;
  char *v4;
  char v5;

  v4 = (char *)this + 376;
  v2 = 1;
  v5 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 376));
  if (!*((_BYTE *)this + 544))
  {
    if (ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::IOPAudio::VoiceTrigger::UserClient::Open();
      v2 = 0;
    }
    else
    {
      *((_BYTE *)this + 544) = 1;
    }
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

void sub_236D8DCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(ASDT::IOUserClient *a1, unsigned int a2, _DWORD *a3)
{
  int v4;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  v7 = 0;
  v8 = a2;
  v6 = 1;
  v4 = ASDT::IOUserClient::CallMethod(a1, 2, &v8, 1, 0, 0, &v7, &v6, 0, 0);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
  }
  else
  {
    *a3 = v7;
  }
  return v4 == 0;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(ASDT::IOUserClient *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = ASDT::IOUserClient::CallMethod(a1, 3, v5, 2, 0, 0, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::LPMic::UserClient::SetControlValue();
  return v3 == 0;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  _BOOL8 ControlValue;
  int v5;

  v5 = 0;
  ControlValue = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 0, &v5);
  if (ControlValue)
  {
    *a2 = v5 != 0;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled();
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, int a2)
{
  _BOOL8 v2;

  v2 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(this, 0, a2 != 0);
  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled();
  return v2;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  _BOOL8 ControlValue;

  ControlValue = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 1u, a2);
  if (!ControlValue && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask();
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  _BOOL8 ControlValue;

  ControlValue = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 2u, a2);
  if (!ControlValue && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC();
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  _BOOL8 ControlValue;
  int v5;

  v5 = 0;
  ControlValue = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 3u, &v5);
  if (ControlValue)
  {
    *a2 = v5 != 0;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled();
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, int a2)
{
  _BOOL8 v2;

  v2 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(this, 3u, a2 != 0);
  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled();
  return v2;
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::SetPhraseDetectEventBlock(uint64_t a1, const void *a2)
{
  const void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v9 = a1 + 376;
  v10 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 376));
  v4 = *(const void **)(a1 + 552);
  if (v4)
    _Block_release(v4);
  if (a2)
    v5 = _Block_copy(a2);
  else
    v5 = 0;
  *(_QWORD *)(a1 + 552) = v5;
  ASDT::IOUserClient::ExclusiveLock((ASDT::IOUserClient *)a1);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  v6 = ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)a1);
  if ((v6 & 1) == 0)
  {
    _Block_release(*(const void **)(a1 + 552));
    *(_QWORD *)(a1 + 552) = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v8);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v9);
  return v6;
}

void sub_236D8E118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::ShouldEnableInterestNotification(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  if (*((_QWORD *)this + 69))
    return 1;
  else
    return ASDT::IOUserClient::ShouldEnableInterestNotification(this);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::InterestNotification(ASDT::IOPAudio::VoiceTrigger::UserClient *this, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v7;
  char v8;

  if ((_DWORD)a2 != -469794559)
    return ASDT::IOUserClient::InterestNotification(this, a2, a3);
  v7 = (char *)this + 376;
  v8 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 376));
  v5 = *((_QWORD *)this + 69);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
}

void sub_236D8E1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  return a1;
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  return a1;
}

uint64_t ASDT::IOPAudio::IOBuffer::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier(ASDT::IOPAudio::IOBuffer::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef cf;
  CFTypeRef v13;

  v13 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "identifier");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v13);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier((uint64_t)this, v5, v6, v7, v8, v9, v10, v11);
    *a2 = 0;
    if (v13)
      CFRelease(v13);
  }
}

void sub_236D8E7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer(ASDT::IOPAudio::IOBuffer::UserClient *this, BufferDescriptor *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v14 = 0;
  v4 = (char *)ASDT::IOUserClient::MapMemory(this, 1768907381, 1, &v14);
  v5 = v4;
  if (v4)
  {
    a2->mBuffer = v4;
    a2->mSizeBytes = v14;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer((uint64_t)this, v6, v7, v8, v9, v10, v11, v12);
  }
  return v5 != 0;
}

uint64_t ASDT::IOPAudio::ClientManager::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::ClientManager::UserClient::CopyIdentifier(ASDT::IOPAudio::ClientManager::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  char v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v6 = 0;
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "identifier");
  v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  if (cf)
    CFRelease(cf);
  if ((v4 & 1) != 0)
  {
    *a2 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier();
    *a2 = 0;
    if (v6)
      CFRelease(v6);
  }
}

void sub_236D8EFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::Enable(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2)
{
  int v2;
  unint64_t v4;

  v4 = a2;
  v2 = ASDT::IOUserClient::CallMethod(this, 0, &v4, 1, 0, 0, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::ClientManager::UserClient::Enable();
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::Disable(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2)
{
  int v2;
  unint64_t v4;

  v4 = a2;
  v2 = ASDT::IOUserClient::CallMethod(this, 1, &v4, 1, 0, 0, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::ClientManager::UserClient::Enable();
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetEnableState(ASDT::IOPAudio::ClientManager::UserClient *this, BOOL *a2)
{
  int v3;
  unsigned int v5;
  unint64_t v6;

  v6 = 0;
  v5 = 1;
  v3 = ASDT::IOUserClient::CallMethod(this, 2, 0, 0, 0, 0, &v6, &v5, 0, 0);
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::ClientManager::UserClient::GetEnableState();
  }
  else
  {
    *a2 = v6 != 0;
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetCurrentPowerState(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int *a2)
{
  int v3;
  unsigned int v5;
  unint64_t v6;

  v6 = 0;
  v5 = 1;
  v3 = ASDT::IOUserClient::CallMethod(this, 4, 0, 0, 0, 0, &v6, &v5, 0, 0);
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::ClientManager::UserClient::GetEnableState();
  }
  else
  {
    *a2 = v6;
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::MakePowerRequest(ASDT::IOUserClient *a1, void *a2)
{
  int v2;

  v2 = ASDT::IOUserClient::CallMethod(a1, 3, 0, 0, a2, 8, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::ClientManager::UserClient::Enable();
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2, unsigned int *a3, void *a4)
{
  int v5;
  unint64_t v7;
  unint64_t v8;

  v7 = *a3;
  v8 = a2;
  v5 = ASDT::IOUserClient::CallMethod(this, 6, &v8, 1, 0, 0, 0, 0, a4, &v7);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty();
  }
  else
  {
    *a3 = v7;
  }
  return v5 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2, unsigned int a3, const void *a4)
{
  int v4;
  unint64_t v6;

  v6 = a2;
  v4 = ASDT::IOUserClient::CallMethod(this, 5, &v6, 1, a4, a3, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty();
  return v4 == 0;
}

void sub_236D8F3F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D8F5E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D8F6D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::~UserClient(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B80347CLL);
}

void sub_236D8F91C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D8FB08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D8FBFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D8FF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D900BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::ClientManager::UserClient::~UserClient(ASDT::IOPAudio::ClientManager::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B80347CLL);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_236D90254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_236D90340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D90744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_236D90A88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D90CB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D91174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D911EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::LPMic::UserClient::~UserClient(ASDT::IOPAudio::LPMic::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B80347CLL);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_236D91A4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D92020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_236D923B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D9273C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D9283C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92C04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92D14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92DBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D92E14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetIdentifier: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetStreamDescription", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Bad Data Size GetStreamDescription", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetStreamDescription", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetupIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed TeardownIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetupClientIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed TeardownClientIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed ReadInput", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetStreamDescription: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetClockDomain()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetInputClockDomain: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetZeroTimeStampInterval: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetRingBufferSize: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetHistoricDataSupported: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::StartIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed StartIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::StopIO()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed StopIO", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::GetControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetControlValue: Bad valueCount.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetControlValue", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::SetControlValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetControlValue", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed MapStreamStatus", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  int v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  v2 = 1024;
  v3 = v0;
  v4 = 2048;
  v5 = 32;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Unexpected EngineStatus memory map size: %u (expected %zu)", v1, 0x1Cu);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::Close()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed Close", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: CopyIdentifier: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: GetIsConfigured: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: CopyConfiguration: Property missing", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::Open()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed Open", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetVoiceTriggerEnabled", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetVoiceTriggerEnabled", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetActiveChannelMask", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetModelCRC", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetDebugEnabled", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetDebugEnabled", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%s: GetIdentifier: Property missing", a5, a6, a7, a8, 2u);
}

void ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%s: Failed MapIOBuffer", a5, a6, a7, a8, 2u);
}

void ASDT::IOPAudio::ClientManager::UserClient::Enable()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed PowerRequest", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::ClientManager::UserClient::GetEnableState()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetCurrentPowerState", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed GetNodeProperty", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%s: Failed SetNodeProperty", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, const applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x24BE0A2F0](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x24BE0A300](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::StringRef *a3)
{
  return MEMORY[0x24BE0A318](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  return MEMORY[0x24BE0A320](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  return MEMORY[0x24BE0A330](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(ASDT::IOUserClient *this, void *a2)
{
  return MEMORY[0x24BE0A348](this, a2);
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A350](this);
}

uint64_t ASDT::IOUserClient::InterestNotification(ASDT::IOUserClient *this, uint64_t a2, void *a3)
{
  return MEMORY[0x24BE0A368](this, a2, a3);
}

uint64_t ASDT::IOUserClient::SetInterestNotificationEnabled(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A388](this);
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A398](this);
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x24BE0A3A0](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::IOUserClient()
{
  return MEMORY[0x24BE0A3A8]();
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
  return MEMORY[0x24BE0A3C8]();
}

{
  return MEMORY[0x24BE0A3D0]();
}

uint64_t ASDT::Exclaves::NamedBuffer::Read(ASDT::Exclaves::NamedBuffer *this, unsigned __int8 *a2)
{
  return MEMORY[0x24BE0A3D8](this, a2);
}

uint64_t ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2()
{
  return MEMORY[0x24BE0A3F0]();
}

uint64_t ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2()
{
  return MEMORY[0x24BE0A3F8]();
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t *a10)
{
  return MEMORY[0x24BE0A4C0](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, applesauce::CF::TypeRef *a3)
{
  return MEMORY[0x24BE0A4D8](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ExclusiveLock(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A4E0](this);
}

uint64_t ASDT::IOUserClient::ShouldEnableInterestNotification(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A4F0](this);
}

uint64_t ASDT::IOUserClient::IsValid(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A4F8](this);
}

uint64_t ASDT::IOUserClient::CallTrap3(ASDT::IOUserClient *this)
{
  return MEMORY[0x24BE0A500](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_2508506D8(__p);
}

uint64_t operator delete()
{
  return off_2508506E0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2508506E8(__sz);
}

uint64_t operator new()
{
  return off_2508506F0();
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

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

