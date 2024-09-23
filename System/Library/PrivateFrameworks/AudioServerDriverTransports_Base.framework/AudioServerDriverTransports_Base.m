BOOL ASDT::IORegistry::EntryAtPathExists(ASDT::IORegistry *this, const char *a2)
{
  io_object_t EntryForPath;
  io_object_t v3;

  v3 = EntryForPath;
  if (EntryForPath)
    IOObjectRelease(EntryForPath);
  return v3 != 0;
}

uint64_t `anonymous namespace'::GetEntryForPath(_anonymous_namespace_ *this, const char *a2)
{
  uint64_t result;
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
  mach_port_t mainPort;

  mainPort = 0;
  if (!this)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    return 0;
  }
  if (MEMORY[0x23B801D84](*MEMORY[0x24BDAD2F0], &mainPort))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    return 0;
  }
  return IORegistryEntryFromPath(mainPort, (const char *)this);
}

CFTypeRef ASDT::IORegistry::GetObjectForKey(ASDT::IORegistry *this, _anonymous_namespace_ *a2, const char *a3)
{
  io_registry_entry_t EntryForPath;
  io_registry_entry_t v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeRef CFProperty;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (this && a2)
  {
    if (EntryForPath)
    {
      v5 = EntryForPath;
      v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)this, 0x8000100u);
      if (v7)
      {
        v8 = v7;
        CFProperty = IORegistryEntryCreateCFProperty(v5, v7, v6, 0);
        CFRelease(v8);
        IOObjectRelease(v5);
        return CFProperty;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::IORegistry::GetObjectForKey((uint64_t)this, v11, v12, v13, v14, v15, v16, v17);
      IOObjectRelease(v5);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::IORegistry::GetObjectForKey();
  }
  return 0;
}

BOOL ASDT::IORegistry::GetUInt32tForKey(UInt8 *this, ASDT::IORegistry *a2, _anonymous_namespace_ *a3, const char *a4)
{
  const __CFData *ObjectForKey;
  const __CFData *v6;
  unint64_t Length;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFRange v19;

  if (!this)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      ASDT::IORegistry::GetUInt32tForKey(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  ObjectForKey = (const __CFData *)ASDT::IORegistry::GetObjectForKey(a2, a3, (const char *)a3);
  if (!ObjectForKey)
    return 0;
  v6 = ObjectForKey;
  Length = CFDataGetLength(ObjectForKey);
  v8 = Length > 3;
  if (Length > 3)
  {
    v19.location = 0;
    v19.length = 4;
    CFDataGetBytes(v6, v19, this);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::IORegistry::GetUInt32tForKey();
  }
  CFRelease(v6);
  return v8;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL CAProcess::ProcessExists(CAProcess *this)
{
  if ((int)this < 1)
    return 0;
  if (kill((pid_t)this, 0))
    return *__error() != 3;
  return 1;
}

uint64_t CAProcess::GetPID(CAProcess *this)
{
  uint64_t result;

  result = CAProcess::sPID;
  if (CAProcess::sPID == -1)
  {
    result = getpid();
    CAProcess::sPID = result;
  }
  return result;
}

ASDT::IOUserClient *ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, int a2)
{
  void **v3;
  io_object_t v4;
  CFStringRef v6;
  const __CFString *v7;
  CFTypeID v8;
  CFTypeID TypeID;
  std::string __p;
  std::string v11;
  const __CFString *v12;
  std::string v13;

  *(_QWORD *)this = &off_250841F38;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((_BYTE *)this + 16) = 1;
  *(_QWORD *)((char *)this + 20) = 0x7A12000000008;
  *((_OWORD *)this + 2) = 0u;
  v3 = (void **)((char *)this + 32);
  *((_OWORD *)this + 3) = 0u;
  *((_WORD *)this + 32) = 1;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 9) = (char *)this + 80;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_WORD *)this + 68) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)this + 144));
  *((_QWORD *)this + 39) = 850045863;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_QWORD *)this + 46) = 0;
  v4 = *((_DWORD *)this + 2);
  if (v4 && !IOObjectRetain(v4))
  {
    v6 = IOObjectCopyClass(*((_DWORD *)this + 2));
    v7 = v6;
    if (v6)
    {
      v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        v12 = v7;
        std::string::basic_string[abi:ne180100]<0>(&__p, "IOUserClient");
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v13, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          v13 = __p;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v7))
        {
          applesauce::CF::details::CFString_get_value<false>(v7, (uint64_t)&v11);
          if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v13.__r_.__value_.__l.__data_);
        }
        else
        {
          v11 = v13;
        }
        if (*((char *)this + 55) < 0)
          operator delete(*v3);
        *(std::string *)v3 = v11;
        *((_BYTE *)&v11.__r_.__value_.__s + 23) = 0;
        v11.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        CFRelease(v7);
      }
      else
      {
        CFRelease(v7);
      }
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 0;
  }
  return this;
}

void sub_236CF1334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t *v12;
  uint64_t v14;
  va_list va;

  va_start(va, a8);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  std::mutex::~mutex((std::mutex *)(v8 + 312));
  std::shared_mutex::~shared_mutex[abi:ne180100](v10);
  v14 = *v12;
  *v12 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v9, *(_QWORD **)(v8 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)(v8 + 56));
  if (*(char *)(v8 + 55) < 0)
    operator delete(*v11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::Retain(ASDT::IOUserClient *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 2);
  if ((_DWORD)result)
    return IOObjectRetain(result) == 0;
  return result;
}

_QWORD *applesauce::CF::StringRef::operator->(_QWORD *result)
{
  applesauce::CF *exception;

  if (!*result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_236CF1410()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF1428(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double applesauce::CF::StringRef_proxy::convert_or@<D0>(const __CFString ***a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  const __CFString *v4;
  CFTypeID TypeID;
  double result;
  std::string __p;

  v4 = **a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  if (v4 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v4)))
  {
    applesauce::CF::details::CFString_get_value<false>(v4, (uint64_t)a3);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    result = *(double *)&__p.__r_.__value_.__l.__data_;
    *a3 = __p;
  }
  return result;
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void std::shared_mutex::~shared_mutex[abi:ne180100](uint64_t a1)
{
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 112));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 64));
  std::mutex::~mutex((std::mutex *)a1);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

ASDT::IOUserClient *ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, CFTypeRef *a2)
{
  CFTypeRef v3;

  *((_BYTE *)this + 16) = 0;
  *(_QWORD *)this = &off_250841F38;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)((char *)this + 20) = 0x7A12000000008;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  v3 = *a2;
  if (*a2)
    CFRetain(*a2);
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 9) = (char *)this + 80;
  *((_QWORD *)this + 7) = v3;
  *((_WORD *)this + 32) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_WORD *)this + 68) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)this + 144));
  *((_QWORD *)this + 39) = 850045863;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_QWORD *)this + 46) = 0;
  return this;
}

void sub_236CF164C(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void **v2;
  uint64_t v3;
  uint64_t *v4;
  void **v5;
  uint64_t *v6;
  uint64_t v8;

  v6 = v4;
  v8 = *v6;
  *v6 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v3, *(_QWORD **)(v1 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  if (*(char *)(v1 + 55) < 0)
    operator delete(*v5);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::IOUserClient(uint64_t a1, ASDT::IOUserClient *a2)
{
  *(_QWORD *)a1 = &off_250841F38;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 20) = 0x7A12000000008;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_WORD *)(a1 + 64) = 1;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 72) = a1 + 80;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_WORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 120) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(a1 + 144));
  *(_QWORD *)(a1 + 312) = 850045863;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_QWORD *)(a1 + 368) = 0;
  ASDT::IOUserClient::MoveDataMembers((ASDT::IOUserClient *)a1, a2);
  return a1;
}

void sub_236CF1764(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void **v2;
  uint64_t v3;
  void **v4;
  uint64_t *v5;
  uint64_t v7;

  v7 = *v5;
  *v5 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(v3, *(_QWORD **)(v1 + 80));
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  if (*(char *)(v1 + 55) < 0)
    operator delete(*v4);
  _Unwind_Resume(a1);
}

__n128 ASDT::IOUserClient::MoveDataMembers(ASDT::IOUserClient *this, ASDT::IOUserClient *a2)
{
  char *v4;
  char *v5;
  __int128 v6;
  const void *v7;
  const void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  __n128 result;

  *((_BYTE *)this + 65) = *((_BYTE *)a2 + 65);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_BYTE *)this + 16) = *((_BYTE *)a2 + 16);
  v4 = (char *)a2 + 32;
  v5 = (char *)this + 32;
  if (*((char *)this + 55) < 0)
    operator delete(*(void **)v5);
  v6 = *(_OWORD *)v4;
  *((_QWORD *)v5 + 2) = *((_QWORD *)v4 + 2);
  *(_OWORD *)v5 = v6;
  *((_BYTE *)a2 + 55) = 0;
  *((_BYTE *)a2 + 32) = 0;
  v7 = (const void *)*((_QWORD *)this + 7);
  v8 = (const void *)*((_QWORD *)a2 + 7);
  *((_QWORD *)this + 7) = v8;
  if (v8)
    CFRetain(v8);
  if (v7)
    CFRelease(v7);
  *((_BYTE *)this + 64) = *((_BYTE *)a2 + 64);
  v9 = (char *)a2 + 72;
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__move_assign((uint64_t)this + 72, (_QWORD *)a2 + 9);
  *((_QWORD *)this + 16) = *((_QWORD *)a2 + 16);
  *((_WORD *)this + 68) = *((_WORD *)a2 + 68);
  v10 = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 12) = 0;
  v11 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = v10;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  *((_QWORD *)a2 + 1) = 0;
  if (*((char *)a2 + 55) < 0)
  {
    **((_BYTE **)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
  }
  else
  {
    *((_BYTE *)a2 + 32) = 0;
    *((_BYTE *)a2 + 55) = 0;
  }
  v12 = (const void *)*((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = 0;
  if (v12)
    CFRelease(v12);
  *((_BYTE *)a2 + 64) = 1;
  *((_BYTE *)a2 + 16) = 1;
  v13 = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 12) = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v15 = (_QWORD *)*((_QWORD *)a2 + 10);
  v14 = (char *)a2 + 80;
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)v9, v15);
  *((_QWORD *)v14 - 1) = v14;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 6) = 0;
  *((_WORD *)v14 + 28) = 0;
  result = *(__n128 *)(v14 + 24);
  *(__n128 *)((char *)this + 104) = result;
  *((_DWORD *)this + 30) = *((_DWORD *)v14 + 10);
  *((_DWORD *)v14 + 10) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = 0;
  return result;
}

uint64_t ASDT::IOUserClient::operator=(uint64_t a1, int a2)
{
  void **v4;
  io_object_t v5;
  CFStringRef v7;
  const __CFString *v8;
  CFTypeID v9;
  char v10;
  CFTypeID TypeID;
  int v12;
  std::string __p;
  std::string v14;
  const __CFString *v15;
  uint64_t v16;
  char v17;
  std::string v18;

  v16 = a1 + 144;
  v17 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  ASDT::IOUserClient::Clear((io_object_t *)a1);
  *(_DWORD *)(a1 + 8) = a2;
  *(_BYTE *)(a1 + 16) = 1;
  v4 = (void **)(a1 + 32);
  *(_BYTE *)(a1 + 64) = 1;
  MEMORY[0x23B801F34](a1 + 32, "");
  v5 = *(_DWORD *)(a1 + 8);
  if (!v5 || IOObjectRetain(v5))
  {
    *(_DWORD *)(a1 + 8) = 0;
    goto LABEL_4;
  }
  v7 = IOObjectCopyClass(*(_DWORD *)(a1 + 8));
  v8 = v7;
  if (v7)
  {
    v9 = CFGetTypeID(v7);
    if (v9 == CFStringGetTypeID())
    {
      v15 = v8;
      std::string::basic_string[abi:ne180100]<0>(&__p, "IOUserClient");
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v18, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v18 = __p;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v8))
      {
        applesauce::CF::details::CFString_get_value<false>(v8, (uint64_t)&v14);
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v18.__r_.__value_.__l.__data_);
      }
      else
      {
        v14 = v18;
      }
      if (*(char *)(a1 + 55) < 0)
        operator delete(*v4);
      *(_OWORD *)v4 = *(_OWORD *)&v14.__r_.__value_.__l.__data_;
      *(_QWORD *)(a1 + 48) = *((_QWORD *)&v14.__r_.__value_.__l + 2);
      *((_BYTE *)&v14.__r_.__value_.__s + 23) = 0;
      v14.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v10 = 0;
      goto LABEL_22;
    }
    v15 = 0;
    CFRelease(v8);
    v8 = 0;
  }
  else
  {
    v15 = 0;
  }
  v10 = 1;
LABEL_22:
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)a1, v12);
  if ((v10 & 1) == 0)
    CFRelease(v8);
LABEL_4:
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v16);
  return a1;
}

void sub_236CF1AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  const void *v9;
  va_list va;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, const void *);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ASDT::IOUserClient::ExclusiveLock(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_mutex_base *v2;

  v2 = (std::__shared_mutex_base *)((char *)this + 144);
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v2);
}

void ASDT::IOUserClient::Clear(io_object_t *this)
{
  io_object_t v2;
  const void *v3;
  const void *v4;

  ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)this, 0);
  (*(void (**)(io_object_t *))(*(_QWORD *)this + 40))(this);
  v2 = this[2];
  if (v2)
  {
    IOObjectRelease(v2);
    this[2] = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 16);
  if (v4)
  {
    _Block_release(v4);
    *((_QWORD *)this + 16) = 0;
  }
}

uint64_t ASDT::IOUserClient::SetInterestNotificationEnabled(ASDT::IOUserClient *this, int a2)
{
  uint64_t v4;
  IONotificationPortRef v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
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
  uint64_t v21;
  uint64_t v22;
  io_object_t v23;
  IONotificationPort *v24;
  NSObject *v25;
  mach_port_t mainPort;

  if (a2)
  {
    if (*((_DWORD *)this + 30) && *((_QWORD *)this + 14))
      return 1;
    mainPort = 0;
    if (MEMORY[0x23B801D84](*MEMORY[0x24BDAD2F0], &mainPort))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::IOUserClient::SetInterestNotificationEnabled();
      return 0;
    }
    v5 = IONotificationPortCreate(mainPort);
    *((_QWORD *)this + 14) = v5;
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::IOUserClient::SetInterestNotificationEnabled();
      return 0;
    }
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = (char *)this + 32;
    if (*((char *)this + 55) < 0)
      v8 = (const char *)*((_QWORD *)this + 4);
    v9 = dispatch_queue_create(v8, v7);
    *((_QWORD *)this + 13) = v9;
    if (v9)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 14), v9);
      v10 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 14), *((_DWORD *)this + 2), "IOGeneralInterest", (IOServiceInterestCallback)ASDT::IOUserClient::InterestNotificationCallback, this, (io_object_t *)this + 30);
      if (!(_DWORD)v10)
        return 1;
      v11 = v10;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::IOUserClient::SetInterestNotificationEnabled((uint64_t)this + 55, (uint64_t)this + 32, v11, v12, v13, v14, v15, v16);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      ASDT::IOUserClient::SetInterestNotificationEnabled((uint64_t)this + 55, (uint64_t)this + 32, v17, v18, v19, v20, v21, v22);
    }
  }
  v23 = *((_DWORD *)this + 30);
  if (v23)
  {
    IOObjectRelease(v23);
    *((_DWORD *)this + 30) = 0;
  }
  v4 = a2 ^ 1u;
  v24 = (IONotificationPort *)*((_QWORD *)this + 14);
  if (v24)
  {
    IONotificationPortDestroy(v24);
    *((_QWORD *)this + 14) = 0;
  }
  v25 = *((_QWORD *)this + 13);
  if (v25)
  {
    dispatch_release(v25);
    *((_QWORD *)this + 13) = 0;
  }
  return v4;
}

uint64_t ASDT::IOUserClient::operator=(uint64_t a1, ASDT::IOUserClient *a2)
{
  uint64_t v5;
  char v6;

  v5 = a1 + 144;
  v6 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  ASDT::IOUserClient::Clear((io_object_t *)a1);
  ASDT::IOUserClient::MoveDataMembers((ASDT::IOUserClient *)a1, a2);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
  return a1;
}

void sub_236CF1DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ASDT::IOUserClient::~IOUserClient(ASDT::IOUserClient *this)
{
  uint64_t v2;
  const void *v3;

  *(_QWORD *)this = &off_250841F38;
  ASDT::IOUserClient::Clear((io_object_t *)this);
  std::mutex::~mutex((std::mutex *)((char *)this + 312));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 256));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 208));
  std::mutex::~mutex((std::mutex *)((char *)this + 144));
  v2 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)this + 72, *((_QWORD **)this + 10));
  v3 = (const void *)*((_QWORD *)this + 7);
  if (v3)
    CFRelease(v3);
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
}

{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x23B801FF4);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL ASDT::IOUserClient::IsValid(ASDT::IOUserClient *this)
{
  _BOOL8 v2;
  char *v4;
  char v5;

  v4 = (char *)this + 144;
  v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v2 = *((_DWORD *)this + 2) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

void ASDT::IOUserClient::SharedLock(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_mutex_base *v2;

  v2 = (std::__shared_mutex_base *)((char *)this + 144);
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v2);
}

BOOL ASDT::IOUserClient::IsEqualTo(ASDT::IOUserClient *this, io_object_t a2)
{
  _BOOL8 v4;
  char *v6;
  char v7;

  v6 = (char *)this + 144;
  v7 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v4 = IOObjectIsEqualTo(*((_DWORD *)this + 2), a2) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v6);
  return v4;
}

void sub_236CF1F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConformsTo(ASDT::IOUserClient *this, const char *a2)
{
  io_object_t v4;
  _BOOL8 v5;
  char *v7;
  char v8;

  v7 = (char *)this + 144;
  v8 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v4 = *((_DWORD *)this + 2);
  if (v4)
    v5 = IOObjectConformsTo(v4, a2) != 0;
  else
    v5 = 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_236CF1FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::IsServiceAlive(ASDT::IOUserClient *this)
{
  uint64_t v2;
  char *v4;
  char v5;

  v4 = (char *)this + 144;
  v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v2 = *((unsigned __int8 *)this + 16);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::ServiceWasTerminated(ASDT::IOUserClient *this)
{
  uint64_t v2;
  char *v4;
  char v5;

  v4 = (char *)this + 144;
  v5 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((_BYTE *)this + 16) = 0;
  if (*((_QWORD *)this + 16))
  {
    std::unique_lock<std::shared_mutex>::unlock((uint64_t)&v4);
    (*(void (**)(_QWORD, uint64_t))(*((_QWORD *)this + 16) + 16))(*((_QWORD *)this + 16), v2);
  }
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v4);
}

void sub_236CF20AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::unique_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  ASDT::IOUserClient *v2;
  BOOL v3;

  if (*(_BYTE *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(v2, v3);
  }
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this, char a2)
{
  char *v5;
  char v6;

  v5 = (char *)this + 144;
  v6 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((_BYTE *)this + 65) = a2;
  if ((a2 & 1) == 0)
    *((_BYTE *)this + 64) = 1;
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
}

void ASDT::IOUserClient::CopyProperties(ASDT::IOUserClient *this@<X0>, CFMutableDictionaryRef *a2@<X8>)
{
  CFMutableDictionaryRef v3;
  CFTypeID v4;
  CFMutableDictionaryRef properties;

  *a2 = 0;
  properties = 0;
  if (!IORegistryEntryCreateCFProperties((io_registry_entry_t)this, &properties, 0, 0))
  {
    v3 = properties;
    if (properties)
    {
      v4 = CFGetTypeID(properties);
      if (v4 != CFDictionaryGetTypeID())
      {
        CFRelease(v3);
        v3 = 0;
      }
    }
    *a2 = v3;
  }
}

void sub_236CF21DC(_Unwind_Exception *a1)
{
  const void **v1;

  applesauce::CF::DictionaryRef::~DictionaryRef(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::TestForLiveness(ASDT::IOUserClient *this)
{
  CFTypeRef v1;
  CFTypeRef cf;

  ASDT::IOUserClient::CopyProperties(this, (CFMutableDictionaryRef *)&cf);
  v1 = cf;
  if (cf)
    CFRelease(cf);
  return v1 != 0;
}

uint64_t ASDT::IOUserClient::CopyProperties@<X0>(ASDT::IOUserClient *this@<X0>, _QWORD *a2@<X8>)
{
  const void *v5;
  const void *v6;
  CFMutableDictionaryRef v7[2];
  char *v8;
  char v9;

  v8 = (char *)this + 144;
  v9 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  *a2 = 0;
  if (*((_BYTE *)this + 65))
  {
    ASDT::IOUserClient::CopyProperties((ASDT::IOUserClient *)*((unsigned int *)this + 2), v7);
    *a2 = v7[0];
  }
  else if (*((_DWORD *)this + 2) && *((_BYTE *)this + 64))
  {
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v8);
    ASDT::IOUserClient::CacheProperties(this, (uint64_t)v7);
    v5 = (const void *)*((_QWORD *)this + 7);
    *a2 = v5;
    if (v5)
      CFRetain(v5);
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v7);
  }
  else
  {
    v6 = (const void *)*((_QWORD *)this + 7);
    *a2 = v6;
    if (v6)
      CFRetain(v6);
  }
  return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v8);
}

void sub_236CF22F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  const void **v11;

  applesauce::CF::DictionaryRef::~DictionaryRef(v11);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::CacheNeedsUpdate(ASDT::IOUserClient *this)
{
  return !*((_BYTE *)this + 65) && *((_DWORD *)this + 2) && *((_BYTE *)this + 64) != 0;
}

void std::shared_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  ASDT::IOUserClient *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "shared_lock::unlock: not locked");
    ASDT::IOUserClient::CacheProperties(v2);
  }
}

void ASDT::IOUserClient::CacheProperties(ASDT::IOUserClient *this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_mutex_base *v3;
  ASDT::IOUserClient *v4;
  CFTypeRef v5;
  const void *v6;
  CFTypeRef cf;

  v3 = (std::__shared_mutex_base *)((char *)this + 144);
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v3);
  if (!*((_BYTE *)this + 65))
  {
    v4 = (ASDT::IOUserClient *)*((unsigned int *)this + 2);
    if ((_DWORD)v4)
    {
      if (*((_BYTE *)this + 64))
      {
        ASDT::IOUserClient::CopyProperties(v4, (CFMutableDictionaryRef *)&cf);
        v5 = cf;
        if (cf)
        {
          v6 = (const void *)*((_QWORD *)this + 7);
          *((_QWORD *)this + 7) = cf;
          CFRetain(v5);
          if (v6)
            CFRelease(v6);
          *((_BYTE *)this + 64) = 0;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            return;
          ASDT::IOUserClient::CacheProperties();
        }
        if (cf)
          CFRelease(cf);
      }
    }
  }
}

void sub_236CF243C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

const __CFDictionary *ASDT::IOUserClient::HasProperty(ASDT::IOUserClient *this, const void **a2)
{
  const __CFDictionary *v3;
  CFTypeRef cf;

  ASDT::IOUserClient::CopyProperties(this, &cf);
  v3 = applesauce::CF::details::has_key<applesauce::CF::StringRef const&>((const __CFDictionary *)cf, a2);
  if (cf)
    CFRelease(cf);
  return v3;
}

BOOL ASDT::IOUserClient::CopyProperty(io_registry_entry_t a1, CFStringRef *a2, const void **a3)
{
  CFTypeRef CFProperty;
  const void *v5;

  CFProperty = IORegistryEntryCreateCFProperty(a1, *a2, 0, 0);
  v5 = *a3;
  if (CFProperty)
  {
    *a3 = CFProperty;
    if (v5)
      goto LABEL_5;
  }
  else
  {
    *a3 = 0;
    if (v5)
LABEL_5:
      CFRelease(v5);
  }
  return *a3 != 0;
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ASDT::IOUserClient::GuardedCopyProperty(ASDT::IOUserClient *this, const void **a2, const void **a3)
{
  const __CFDictionary *v3;
  _BOOL8 v5;
  const void *v6;
  CFTypeRef v7;
  CFTypeRef cf;
  char v10;

  v3 = (const __CFDictionary *)*((_QWORD *)this + 7);
  if (!v3)
    return 0;
  applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(v3, a2, (uint64_t)&cf);
  v5 = v10 != 0;
  if (v10)
  {
    v6 = *a3;
    v7 = cf;
    *a3 = cf;
    if (v7)
      CFRetain(v7);
    if (v6)
      CFRelease(v6);
  }
  std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  return v5;
}

BOOL ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, CFStringRef *a2, const void **a3)
{
  io_registry_entry_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BYTE v10[16];
  char *v11;
  char v12;

  v11 = (char *)this + 144;
  v12 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v6 = *((_DWORD *)this + 2);
  if (*((_BYTE *)this + 65))
  {
    v7 = ASDT::IOUserClient::CopyProperty(v6, a2, a3);
LABEL_7:
    v8 = v7;
    goto LABEL_8;
  }
  if (!v6 || !*((_BYTE *)this + 64))
  {
    v7 = ASDT::IOUserClient::GuardedCopyProperty(this, (const void **)a2, a3);
    goto LABEL_7;
  }
  std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v11);
  ASDT::IOUserClient::CacheProperties(this, (uint64_t)v10);
  v8 = ASDT::IOUserClient::GuardedCopyProperty(this, (const void **)a2, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v10);
LABEL_8:
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v11);
  return v8;
}

void sub_236CF2684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  uint64_t result;
  CFTypeID v6;
  CFTypeID v7;
  BOOL v8;
  void *exception;
  int v10;
  CFTypeRef cf;

  result = (uint64_t)*this;
  if (result)
  {
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFBooleanGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::BooleanRef(this, (applesauce::CF::BooleanRef *)&cf);
      if (!cf)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B801F1C](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      *(_BYTE *)a2 = applesauce::CF::convert_to<BOOL,0>((const __CFNumber *)cf);
      if (cf)
        CFRelease(cf);
      return 1;
    }
    result = (uint64_t)*this;
    if (*this)
    {
      v7 = CFGetTypeID((CFTypeRef)result);
      if (v7 == CFNumberGetTypeID())
      {
        v10 = 0;
        applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
        v8 = ASDT::IOUserClient::ConvertNumber<unsigned int>((const __CFNumber **)&cf, &v10);
        if (cf)
          CFRelease(cf);
        if (v8)
        {
          *(_BYTE *)a2 = v10 != 0;
          return 1;
        }
      }
      return 0;
    }
  }
  return result;
}

void sub_236CF27B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

applesauce::CF::BooleanRef *applesauce::CF::TypeRef::operator applesauce::CF::BooleanRef@<X0>(const void **a1@<X0>, applesauce::CF::BooleanRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFBooleanGetTypeID())
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
  return applesauce::CF::BooleanRef::BooleanRef(a2, v6);
}

void sub_236CF2874()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF288C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::BooleanRef::~BooleanRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ASDT::IOUserClient::ConvertNumber<unsigned int>(const __CFNumber **a1, _DWORD *a2)
{
  const __CFNumber *v2;
  uint64_t v4;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<unsigned int,0>(v2);
  if ((v4 & 0xFF00000000) != 0)
    *a2 = v4;
  return (v4 & 0xFF00000000) != 0;
}

void sub_236CF2928()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF2940(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::NumberRef *applesauce::CF::TypeRef::operator applesauce::CF::NumberRef@<X0>(const void **a1@<X0>, applesauce::CF::NumberRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFNumberGetTypeID())
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
  return applesauce::CF::NumberRef::NumberRef(a2, v6);
}

void sub_236CF29CC()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF29E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, int *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<int>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2AB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<int>(const __CFNumber **a1, _DWORD *a2)
{
  const __CFNumber *v2;
  uint64_t v4;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<int,0>(v2);
  if ((v4 & 0xFF00000000) != 0)
    *a2 = v4;
  return (v4 & 0xFF00000000) != 0;
}

void sub_236CF2B20()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF2B38(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<unsigned int>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2BD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, uint64_t *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<long long>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2C70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<long long>(const __CFNumber **a1, const __CFBoolean **a2)
{
  const __CFNumber *v2;
  const __CFBoolean *v4;
  char v5;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<long long,0>(v2);
  if (v5)
    *a2 = v4;
  return v5 != 0;
}

void sub_236CF2CDC()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF2CF4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, unint64_t *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<unsigned long long>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2D8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<unsigned long long>(const __CFNumber **a1, const __CFBoolean **a2)
{
  const __CFNumber *v2;
  const __CFBoolean *v4;
  char v5;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<unsigned long long,0>(v2);
  if (v5)
    *a2 = v4;
  return v5 != 0;
}

void sub_236CF2DF8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF2E10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const applesauce::CF::TypeRef *a2, float *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<float>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2EA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<float>(const __CFNumber **a1, _DWORD *a2)
{
  const __CFNumber *v2;
  uint64_t v4;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<float,0>(v2);
  if ((v4 & 0xFF00000000) != 0)
    *a2 = v4;
  return (v4 & 0xFF00000000) != 0;
}

void sub_236CF2F14()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF2F2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertValue(const void **this, const __CFBoolean **a2, double *a3)
{
  const void *v4;
  CFTypeID v6;
  _BOOL8 v7;
  CFTypeRef cf;

  v4 = *this;
  if (!v4)
    return 0;
  v6 = CFGetTypeID(v4);
  if (v6 != CFNumberGetTypeID())
    return 0;
  applesauce::CF::TypeRef::operator applesauce::CF::NumberRef(this, (applesauce::CF::NumberRef *)&cf);
  v7 = ASDT::IOUserClient::ConvertNumber<double>((const __CFNumber **)&cf, a2);
  if (cf)
    CFRelease(cf);
  return v7;
}

void sub_236CF2FC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::NumberRef::~NumberRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ConvertNumber<double>(const __CFNumber **a1, const __CFBoolean **a2)
{
  const __CFNumber *v2;
  const __CFBoolean *v4;
  char v5;
  applesauce::CF *exception;

  v2 = *a1;
  if (!v2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v4 = applesauce::CF::convert_as<double,0>(v2);
  if (v5)
    *a2 = v4;
  return v5 != 0;
}

void sub_236CF3030()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF3048(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::StringRef *a3)
{
  uint64_t result;
  CFTypeID v6;
  const void *v7;
  const void *v8;

  result = (uint64_t)*this;
  if (result)
  {
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFStringGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::StringRef(this, (applesauce::CF::StringRef *)&v8);
      v7 = *a2;
      *a2 = v8;
      v8 = v7;
      if (v7)
        CFRelease(v7);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::StringRef *applesauce::CF::TypeRef::operator applesauce::CF::StringRef@<X0>(const void **a1@<X0>, applesauce::CF::StringRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFStringGetTypeID())
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
  return applesauce::CF::StringRef::StringRef(a2, v6);
}

void sub_236CF315C()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF3174(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::ArrayRef *a3)
{
  uint64_t result;
  CFTypeID v6;
  const void *v7;
  const void *v8;

  result = (uint64_t)*this;
  if (result)
  {
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFArrayGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef(this, (applesauce::CF::ArrayRef *)&v8);
      v7 = *a2;
      *a2 = v8;
      v8 = v7;
      if (v7)
        CFRelease(v7);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::ArrayRef *applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef@<X0>(const void **a1@<X0>, applesauce::CF::ArrayRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFArrayGetTypeID())
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
  return applesauce::CF::ArrayRef::ArrayRef(a2, v6);
}

void sub_236CF3290()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF32A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::DictionaryRef *a3)
{
  uint64_t result;
  CFTypeID v6;
  const void *v7;
  const void *v8;

  result = (uint64_t)*this;
  if (result)
  {
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFDictionaryGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(this, (applesauce::CF::DictionaryRef *)&v8);
      v7 = *a2;
      *a2 = v8;
      v8 = v7;
      if (v7)
        CFRelease(v7);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
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

void sub_236CF33C4()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF33DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ConvertValue(const void **this, const void **a2, applesauce::CF::DataRef *a3)
{
  uint64_t result;
  CFTypeID v6;
  const void *v7;
  const void *v8;

  result = (uint64_t)*this;
  if (result)
  {
    v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFDataGetTypeID())
    {
      applesauce::CF::TypeRef::operator applesauce::CF::DataRef(this, (applesauce::CF::DataRef *)&v8);
      v7 = *a2;
      *a2 = v8;
      v8 = v7;
      if (v7)
        CFRelease(v7);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

applesauce::CF::DataRef *applesauce::CF::TypeRef::operator applesauce::CF::DataRef@<X0>(const void **a1@<X0>, applesauce::CF::DataRef *a2@<X8>)
{
  const void *v4;
  CFTypeID v5;
  const void *v6;
  applesauce::CF *exception;

  v4 = *a1;
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    if (v5 != CFDataGetTypeID())
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
  return applesauce::CF::DataRef::DataRef(a2, v6);
}

void sub_236CF34F8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF3510(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::DictionarySetValueForKey(CFDictionaryRef *a1, CFTypeRef *a2, const void **a3)
{
  uint64_t *v6;
  const __CFDictionary *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFDictionaryRef v17;
  __int128 v18;
  void *v19;
  _BYTE *v20;
  void *__p;
  void *v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CFTypeRef *v28;
  _QWORD *v29[2];

  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v23, *a1);
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v18, *a1);
  *((_QWORD *)&v18 + 1) = (v20 - (_BYTE *)v19) >> 3;
  std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(&v28, &v23, &v18);
  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  v6 = std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert_or_assign[abi:ne180100]<applesauce::CF::TypeRef&>((uint64_t)&v28, a2, a3);
  if (v29 == (_QWORD **)v6)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      ASDT::IOUserClient::DictionarySetValueForKey(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>(&v28, &v17);
    v7 = *a1;
    *a1 = v17;
    v17 = v7;
    if (v7)
      CFRelease(v7);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v28, v29[0]);
  return v29 != (_QWORD **)v6;
}

void sub_236CF3660(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(v1 - 56, *(_QWORD **)(v1 - 48));
  _Unwind_Resume(a1);
}

_QWORD *applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t *std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert_or_assign[abi:ne180100]<applesauce::CF::TypeRef&>(uint64_t a1, CFTypeRef *a2, const void **a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  CFComparisonResult v9;
  uint64_t *v10;
  const void *v11;
  const void *v12;

  v6 = (uint64_t *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  if (!v7)
    return std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>((uint64_t **)a1, v6, a2, a2, a3);
  v8 = a1 + 8;
  do
  {
    v9 = applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)(v7 + 32), (const __CFString **)a2);
    v10 = (uint64_t *)(v7 + 8);
    if (v9 != kCFCompareLessThan)
    {
      v10 = (uint64_t *)v7;
      v8 = v7;
    }
    v7 = *v10;
  }
  while (*v10);
  if ((uint64_t *)v8 == v6
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a2, (const __CFString **)(v8 + 32)) == kCFCompareLessThan)
  {
    v6 = (uint64_t *)v8;
    return std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>((uint64_t **)a1, v6, a2, a2, a3);
  }
  v11 = *(const void **)(v8 + 40);
  v12 = *a3;
  *(_QWORD *)(v8 + 40) = *a3;
  if (v12)
    CFRetain(v12);
  if (v11)
    CFRelease(v11);
  return (uint64_t *)v8;
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

void sub_236CF3868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ArraySetValueAtIndex(CFArrayRef *a1, unint64_t a2, CFTypeRef *a3, char a4)
{
  CFArrayRef v8;
  void **Count;
  CFArrayRef v10;
  CFIndex v11;
  CFTypeRef v12;
  unint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef *v22;
  uint64_t *v23;
  CFTypeRef *v24;
  uint64_t v25;
  const void *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFArrayRef v35;
  CFArrayRef v36;
  uint64_t v37;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  _QWORD v42[3];
  void **v43[3];

  v8 = *a1;
  if (*a1)
  {
    Count = (void **)CFArrayGetCount(*a1);
    v10 = *a1;
    if (*a1)
    {
      v11 = CFArrayGetCount(*a1);
      goto LABEL_6;
    }
  }
  else
  {
    Count = 0;
    v10 = 0;
  }
  v11 = 0;
LABEL_6:
  v40 = 0;
  v41 = 0;
  v39 = 0;
  v43[0] = (void **)v8;
  v43[1] = 0;
  v43[2] = Count;
  v42[0] = v10;
  v42[1] = v11;
  v42[2] = v11;
  std::vector<applesauce::CF::TypeRef>::__init_with_size[abi:ne180100]<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(&v39, (uint64_t)v43, (uint64_t)v42, (unint64_t)Count);
  v12 = *a3;
  if (*a3)
  {
    v13 = v40 - v39;
    if ((a4 & 1) != 0)
    {
      if (v13 < a2)
      {
        v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v14)
          goto LABEL_33;
        goto LABEL_34;
      }
      std::vector<applesauce::CF::TypeRef>::insert((uint64_t *)&v39, (uint64_t)&v39[a2], a3);
    }
    else
    {
      if (v13 <= a2)
      {
        v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (!v14)
          goto LABEL_34;
        goto LABEL_33;
      }
      v26 = (const void *)v39[a2];
      v39[a2] = (uint64_t)v12;
      CFRetain(v12);
      if (v26)
        CFRelease(v26);
    }
  }
  else
  {
    if ((a4 & 1) == 0)
    {
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v27)
        ASDT::IOUserClient::ArraySetValueAtIndex(v27, v28, v29, v30, v31, v32, v33, v34);
      goto LABEL_34;
    }
    v22 = (CFTypeRef *)v40;
    if (a2 >= v40 - v39)
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
LABEL_33:
        ASDT::IOUserClient::ArraySetValueAtIndex(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_34:
      v37 = 0;
      goto LABEL_35;
    }
    v23 = &v39[a2];
    v24 = (CFTypeRef *)(v23 + 1);
    if (v23 + 1 != v40)
    {
      v25 = *v23;
      do
      {
        *(v24 - 1) = *v24;
        *v24++ = (CFTypeRef)v25;
        ++v23;
      }
      while (v24 != v22);
      v22 = (CFTypeRef *)v40;
    }
    while (v22 != (CFTypeRef *)v23)
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100]((uint64_t)&v41, --v22);
    v40 = v23;
  }
  v35 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::TypeRef>(&v39);
  v36 = *a1;
  *a1 = v35;
  if (v36)
    CFRelease(v36);
  v37 = 1;
LABEL_35:
  v43[0] = (void **)&v39;
  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](v43);
  return v37;
}

void sub_236CF3AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a10;
  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

CFTypeRef *std::vector<applesauce::CF::TypeRef>::insert(uint64_t *a1, uint64_t a2, CFTypeRef *a3)
{
  CFTypeRef *v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFTypeRef *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeRef v28;
  CFTypeRef v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  int64x2_t v39;
  char *v40;
  void *v42;
  __int128 v43;
  char *v44;
  uint64_t *v45;
  void *v46;
  int64x2_t v47;
  char *v48;
  uint64_t v49;

  v3 = a3;
  v6 = *a1;
  v5 = a1[1];
  v7 = a2 - *a1;
  v8 = v7 >> 3;
  v9 = (CFTypeRef *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF8));
  v11 = (uint64_t)(a1 + 2);
  v10 = a1[2];
  if (v5 >= v10)
  {
    v16 = ((uint64_t)(v5 - v6) >> 3) + 1;
    if (v16 >> 61)
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
    v18 = v10 - v6;
    if (v18 >> 2 > v16)
      v16 = v18 >> 2;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
      v19 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v19 = v16;
    v45 = a1 + 2;
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), v19);
      v22 = v21;
    }
    else
    {
      v20 = 0;
      v22 = 0;
    }
    v23 = &v20[8 * v8];
    v42 = v20;
    *(_QWORD *)&v43 = v23;
    *((_QWORD *)&v43 + 1) = v23;
    v44 = &v20[8 * v22];
    if (v8 == v22)
    {
      if (v7 < 1)
      {
        if (v6 == a2)
          v30 = 1;
        else
          v30 = v7 >> 2;
        v49 = v11;
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v11, v30);
        v33 = (_QWORD *)v43;
        v34 = *((_QWORD *)&v43 + 1) - v43;
        if (*((_QWORD *)&v43 + 1) == (_QWORD)v43)
        {
          v39 = vdupq_n_s64(v43);
          v36 = (unint64_t)&v31[8 * (v30 >> 2)];
        }
        else
        {
          v35 = v34 >> 3;
          v36 = (unint64_t)&v31[8 * (v30 >> 2) + (v34 & 0xFFFFFFFFFFFFFFF8)];
          v37 = 8 * v35;
          v38 = &v31[8 * (v30 >> 2)];
          do
          {
            *(_QWORD *)v38 = *v33;
            v38 += 8;
            *v33++ = 0;
            v37 -= 8;
          }
          while (v37);
          v39 = (int64x2_t)v43;
        }
        v40 = v44;
        v46 = v42;
        v42 = v31;
        *(_QWORD *)&v43 = &v31[8 * (v30 >> 2)];
        v47 = v39;
        *((_QWORD *)&v43 + 1) = v36;
        v44 = &v31[8 * v32];
        v48 = v40;
        std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(&v46);
        v23 = (char *)*((_QWORD *)&v43 + 1);
        v11 = (uint64_t)v45;
      }
      else
      {
        v24 = v8 + 2;
        if (v8 >= -1)
          v24 = v8 + 1;
        v23 -= 8 * (v24 >> 1);
        *(_QWORD *)&v43 = v23;
        *((_QWORD *)&v43 + 1) = v23;
      }
    }
    std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>(v11, v23, v3);
    *((_QWORD *)&v43 + 1) += 8;
    v9 = (CFTypeRef *)std::vector<applesauce::CF::TypeRef>::__swap_out_circular_buffer(a1, &v42, v9);
    std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(&v42);
  }
  else if (v9 == (CFTypeRef *)v5)
  {
    std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>((uint64_t)(a1 + 2), v9, a3);
    a1[1] = (uint64_t)(v9 + 1);
  }
  else
  {
    v12 = v9 + 1;
    v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      v15 = (_QWORD *)a1[1];
    }
    else
    {
      v14 = (_QWORD *)(v5 - 8);
      v15 = (_QWORD *)a1[1];
      do
      {
        *v15++ = *v14;
        *v14++ = 0;
      }
      while ((unint64_t)v14 < v5);
    }
    a1[1] = (uint64_t)v15;
    if ((_QWORD *)v5 != v12)
    {
      v25 = 8 * ((uint64_t)(v5 - (_QWORD)v12) >> 3);
      v26 = v6 + 8 * v8 - 8;
      do
      {
        v27 = *v13;
        *v13-- = *(_QWORD *)(v26 + v25);
        *(_QWORD *)(v26 + v25) = v27;
        v25 -= 8;
      }
      while (v25);
    }
    if (v9 <= a3)
      v3 = &a3[a1[1] > (unint64_t)a3];
    v28 = *v9;
    v29 = *v3;
    *v9 = *v3;
    if (v29)
      CFRetain(v29);
    if (v28)
      CFRelease(v28);
  }
  return v9;
}

void sub_236CF3D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::PropertiesChanged(ASDT::IOUserClient *this)
{
  char *v3;
  char v4;

  v3 = (char *)this + 144;
  v4 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((_BYTE *)this + 64) = 1;
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3)
{
  unsigned int v6;
  io_connect_t v7;
  uint64_t v8;
  _QWORD *v10;
  const __CFString *v11;
  CFTypeID TypeID;
  std::string *p_p;
  int v14;
  int v15;
  int v16;
  int v17;
  void *exception;
  std::string v19;
  std::string __p;
  char *v21;
  char v22;
  std::string v23;
  uint8_t buf[4];
  _QWORD *v25;
  __int16 v26;
  std::string *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = 1937010544;
  v21 = (char *)this + 144;
  v22 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v7 = *((_DWORD *)this + 3);
  if (!v7 || !*((_BYTE *)this + 16) || (v6 = IOConnectSetCFProperty(v7, *a2, *a3)) != 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      v8 = 0;
      goto LABEL_6;
    }
    v10 = (_QWORD *)((char *)this + 32);
    if (*((char *)this + 55) < 0)
      v10 = (_QWORD *)*v10;
    if (!*a2)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    std::string::basic_string[abi:ne180100]<0>(&v19, "Unknown");
    v11 = *a2;
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v23, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
      if (!v11)
        goto LABEL_20;
    }
    else
    {
      v23 = v19;
      if (!v11)
        goto LABEL_20;
    }
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v11))
    {
      applesauce::CF::details::CFString_get_value<false>(v11, (uint64_t)&__p);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v23.__r_.__value_.__l.__data_);
      goto LABEL_21;
    }
LABEL_20:
    __p = v23;
LABEL_21:
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v14 = HIBYTE(v6);
    if ((v6 - 0x20000000) >> 24 >= 0x5F)
      v14 = 32;
    *(_DWORD *)buf = 136316674;
    v25 = v10;
    v15 = BYTE2(v6);
    if (BYTE2(v6) - 32 >= 0x5F)
      v15 = 32;
    v26 = 2080;
    v27 = p_p;
    v16 = BYTE1(v6);
    if (BYTE1(v6) - 32 >= 0x5F)
      v16 = 32;
    v28 = 1024;
    v29 = v6;
    v30 = 1024;
    v31 = v14;
    v32 = 1024;
    v33 = v15;
    if (v6 - 32 >= 0x5F)
      v17 = 32;
    else
      v17 = v6;
    v34 = 1024;
    v35 = v16;
    v36 = 1024;
    v37 = v17;
    _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed to set property '%s': %x '%c%c%c%c'", buf, 0x34u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    goto LABEL_5;
  }
  if (!*((_BYTE *)this + 65))
  {
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)&v21);
    (*(void (**)(ASDT::IOUserClient *))(*(_QWORD *)this + 24))(this);
  }
  v8 = 1;
LABEL_6:
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v21);
  return v8;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  v8 = v5;
  v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5)
    CFRelease(v5);
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  v8 = v5;
  v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5)
    CFRelease(v5);
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  v8 = v5;
  v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5)
    CFRelease(v5);
  return v6;
}

{
  CFTypeRef v5;
  uint64_t v6;
  CFTypeRef v8;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  v8 = v5;
  v6 = ASDT::IOUserClient::SetProperty(this, a2, &v8);
  if (v5)
    CFRelease(v5);
  return v6;
}

void sub_236CF408C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, int a3)
{
  const void **v5;
  const void *v6;
  uint64_t v7;
  CFTypeRef v9[2];

  v5 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v5 = (const void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  v9[1] = v6;
  if (v6)
    CFRetain(v6);
  v9[0] = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, v9);
  if (v6)
  {
    CFRelease(v6);
    CFRelease(v6);
  }
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFTypeRef v10[2];

  LODWORD(v10[0]) = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFTypeRef v10[2];

  LODWORD(v10[0]) = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_236CF4160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::TypeRef::~TypeRef((const void **)&a9);
  applesauce::CF::BooleanRef::~BooleanRef(&a10);
  _Unwind_Resume(a1);
}

void sub_236CF422C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF4314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const __CFNumber *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_236CF43FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF44E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, float a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFTypeRef v10[2];

  *(float *)v10 = a3;
  v5 = CFNumberCreate(0, kCFNumberFloatType, v10);
  v10[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  v10[0] = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, v10);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_236CF45CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = *(CFNumberRef *)&a3;
  v5 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr);
  CFRelease(v6);
  CFRelease(v6);
  return v7;
}

void sub_236CF46B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF475C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF47E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF4864(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF48E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::TypeRef *a4)
{
  kern_return_t v5;
  unsigned int v6;
  _BOOL8 result;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeID TypeID;
  std::string *p_p;
  int v18;
  int v19;
  int v20;
  int v21;
  applesauce::CF *exception;
  std::string v23;
  std::string __p;
  std::string v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)this)
  {
    v5 = IORegistryEntrySetCFProperty((io_registry_entry_t)this, *a2, *a3);
    if (v5)
    {
      v6 = v5;
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        if (!*a2)
        {
          exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
          applesauce::CF::construct_error(exception);
        }
        std::string::basic_string[abi:ne180100]<0>(&v23, "Unknown");
        v8 = *a2;
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v25, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
        else
          v25 = v23;
        if (v8 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v8)))
        {
          applesauce::CF::details::CFString_get_value<false>(v8, (uint64_t)&__p);
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v25.__r_.__value_.__l.__data_);
        }
        else
        {
          __p = v25;
        }
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        v18 = HIBYTE(v6);
        if ((v6 - 0x20000000) >> 24 >= 0x5F)
          v18 = 32;
        v19 = BYTE2(v6);
        if (BYTE2(v6) - 32 >= 0x5F)
          v19 = 32;
        LODWORD(v25.__r_.__value_.__l.__data_) = 136316418;
        *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
        v20 = BYTE1(v6);
        if (BYTE1(v6) - 32 >= 0x5F)
          v20 = 32;
        WORD2(v25.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = v6;
        WORD1(v25.__r_.__value_.__r.__words[2]) = 1024;
        HIDWORD(v25.__r_.__value_.__r.__words[2]) = v18;
        v26 = 1024;
        v27 = v19;
        v28 = 1024;
        if (v6 - 32 >= 0x5F)
          v21 = 32;
        else
          v21 = v6;
        v29 = v20;
        v30 = 1024;
        v31 = v21;
        _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "IOUserClient: Failed to set property '%s': %x '%c%c%c%c'", (uint8_t *)&v25, 0x2Au);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v23.__r_.__value_.__l.__data_);
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      ASDT::IOUserClient::SetProperty(result, v9, v10, v11, v12, v13, v14, v15);
      return 0;
    }
  }
  return result;
}

void sub_236CF4B30()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF4B48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, const applesauce::CF::TypeRef *a4)
{
  const void **v6;
  const void *v7;
  _BOOL8 v8;
  CFTypeRef v10[2];

  v6 = (const void **)MEMORY[0x24BDBD270];
  if (!(_DWORD)a3)
    v6 = (const void **)MEMORY[0x24BDBD268];
  v7 = *v6;
  v10[1] = v7;
  if (v7)
    CFRetain(v7);
  v10[0] = v7;
  v8 = ASDT::IOUserClient::SetProperty(this, a2, v10, a4);
  if (v7)
  {
    CFRelease(v7);
    CFRelease(v7);
  }
  return v8;
}

void sub_236CF4C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::TypeRef::~TypeRef((const void **)&a9);
  applesauce::CF::BooleanRef::~BooleanRef(&a10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  _BOOL8 v8;
  void *exception;
  CFTypeRef v11[2];

  LODWORD(v11[0]) = (_DWORD)a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, v11);
  v11[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  v11[0] = v6;
  v8 = ASDT::IOUserClient::SetProperty(this, a2, v11, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  _BOOL8 v8;
  void *exception;
  CFTypeRef v11[2];

  LODWORD(v11[0]) = (_DWORD)a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, v11);
  v11[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  v11[0] = v6;
  v8 = ASDT::IOUserClient::SetProperty(this, a2, v11, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  _BOOL8 v8;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v8 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  const applesauce::CF::TypeRef *v7;
  _BOOL8 v8;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v8 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v7);
  CFRelease(v6);
  CFRelease(v6);
  return v8;
}

void sub_236CF4CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF4DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF4EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF4F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, float a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  const applesauce::CF::TypeRef *v8;
  _BOOL8 v9;
  void *exception;
  CFTypeRef v12[2];

  *(float *)v12 = a4;
  v6 = CFNumberCreate(0, kCFNumberFloatType, v12);
  v12[1] = v6;
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v7 = v6;
  CFRetain(v6);
  v12[0] = v7;
  v9 = ASDT::IOUserClient::SetProperty(this, a2, v12, v8);
  CFRelease(v7);
  CFRelease(v7);
  return v9;
}

void sub_236CF507C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, const applesauce::CF::StringRef *a3, double a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  const applesauce::CF::TypeRef *v8;
  _BOOL8 v9;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = *(CFNumberRef *)&a4;
  v6 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v7 = v6;
  CFRetain(v6);
  valuePtr = v7;
  v9 = ASDT::IOUserClient::SetProperty(this, a2, (CFTypeRef *)&valuePtr, v8);
  CFRelease(v7);
  CFRelease(v7);
  return v9;
}

void sub_236CF5164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::ArrayRef *a4)
{
  CFTypeRef v6;
  _BOOL8 v7;
  CFTypeRef v9;

  v6 = *a3;
  if (*a3)
    CFRetain(*a3);
  v9 = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6)
    CFRelease(v6);
  return v7;
}

void sub_236CF520C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::DataRef *a4)
{
  CFTypeRef v6;
  _BOOL8 v7;
  CFTypeRef v9;

  v6 = *a3;
  if (*a3)
    CFRetain(*a3);
  v9 = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6)
    CFRelease(v6);
  return v7;
}

void sub_236CF5290(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::DictionaryRef *a4)
{
  CFTypeRef v6;
  _BOOL8 v7;
  CFTypeRef v9;

  v6 = *a3;
  if (*a3)
    CFRetain(*a3);
  v9 = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6)
    CFRelease(v6);
  return v7;
}

void sub_236CF5314(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, CFStringRef *a2, CFTypeRef *a3, const applesauce::CF::StringRef *a4)
{
  CFTypeRef v6;
  _BOOL8 v7;
  CFTypeRef v9;

  v6 = *a3;
  if (*a3)
    CFRetain(*a3);
  v9 = v6;
  v7 = ASDT::IOUserClient::SetProperty(this, a2, &v9, a4);
  if (v6)
    CFRelease(v6);
  return v7;
}

void sub_236CF5398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const void **a3, char a4)
{
  _QWORD *v7;
  std::string *v8;
  _BOOL8 v9;
  const __CFDictionary *v10;
  const void *v11;
  const void *v12;
  int v13;
  const __CFDictionary *v14;
  std::string *v15;
  const void *v16;
  const void *v17;
  CFTypeRef v18;
  CFDictionaryRef v19;
  _QWORD *v20;
  std::string *v21;
  _QWORD *v23;
  std::string *p_buf;
  void *v25[2];
  char v26;
  const __CFString **v27;
  void *v28[2];
  char v29;
  CFTypeRef cf;
  __int128 v31;
  void *v32;
  _BYTE *v33;
  void *__p;
  void *v35;
  __int128 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BYTE v41[16];
  void *v42[2];
  char v43;
  std::string v44;
  std::string buf;
  _BYTE v46[12];
  __int16 v47;
  std::string *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (!*a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::ReplaceProperty();
    return 0;
  }
  if (*a3 || (a4 & 1) != 0)
  {
    ASDT::IOUserClient::CacheProperties((ASDT::IOUserClient *)this, (uint64_t)v41);
    v10 = this[7];
    if (v10)
    {
      buf.__r_.__value_.__r.__words[0] = 0;
      applesauce::CF::at_or<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(v10, a2, &buf, &v44);
      if (buf.__r_.__value_.__r.__words[0])
        CFRelease(buf.__r_.__value_.__l.__data_);
      v11 = (const void *)v44.__r_.__value_.__r.__words[0];
      v12 = *a3;
      if (v44.__r_.__value_.__r.__words[0])
      {
        if (!v12)
          goto LABEL_29;
        v13 = CFEqual(v44.__r_.__value_.__l.__data_, v12);
        v11 = (const void *)v44.__r_.__value_.__r.__words[0];
        if (v13)
        {
          if (v44.__r_.__value_.__r.__words[0])
            CFRelease(v44.__r_.__value_.__l.__data_);
          goto LABEL_27;
        }
        if (v44.__r_.__value_.__r.__words[0])
LABEL_29:
          CFRelease(v11);
      }
      else if (!v12)
      {
LABEL_27:
        v9 = 1;
LABEL_65:
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v41);
        return v9;
      }
      v14 = this[7];
    }
    else
    {
      v14 = 0;
    }
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v36, v14);
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator((uint64_t)&v31, this[7]);
    *((_QWORD *)&v31 + 1) = (v33 - (_BYTE *)v32) >> 3;
    std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(&v44, &v36, &v31);
    if (__p)
    {
      v35 = __p;
      operator delete(__p);
    }
    if (v32)
    {
      v33 = v32;
      operator delete(v32);
    }
    if (v39)
    {
      v40 = v39;
      operator delete(v39);
    }
    if (v37)
    {
      v38 = v37;
      operator delete(v37);
    }
    v15 = (std::string *)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::find<applesauce::CF::StringRef>((uint64_t)&v44, (const __CFString **)a2);
    v16 = *a3;
    if (*a3)
    {
      if (&v44.__r_.__value_.__r.__words[1] == (std::string::size_type *)v15)
      {
        if (v15 == (std::string *)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>((uint64_t **)&v44, a2, a2, a3))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v23 = this + 4;
            if (*((char *)this + 55) < 0)
              v23 = (_QWORD *)*v23;
            cf = applesauce::CF::StringRef::operator->(a2);
            std::string::basic_string[abi:ne180100]<0>(v28, "Unknown");
            applesauce::CF::StringRef_proxy::convert_or((const __CFString ***)&cf, (uint64_t)v28, &buf);
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_buf = &buf;
            else
              p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
            *(_DWORD *)v46 = 136315394;
            *(_QWORD *)&v46[4] = v23;
            v47 = 2080;
            v48 = p_buf;
            _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) failed to insert.", v46, 0x16u);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            if (v29 < 0)
              operator delete(v28[0]);
          }
          v9 = 0;
          goto LABEL_64;
        }
      }
      else
      {
        v17 = (const void *)v15[1].__r_.__value_.__r.__words[2];
        v15[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v16;
        CFRetain(v16);
        if (v17)
          CFRelease(v17);
      }
    }
    else
    {
      if (&v44.__r_.__value_.__r.__words[1] == (std::string::size_type *)v15)
      {
        v9 = 1;
        goto LABEL_64;
      }
      std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer((uint64_t **)&v44, (uint64_t *)v15);
      std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)&v15[1].__r_.__value_.__l.__size_);
      operator delete(v15);
    }
    applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>((CFTypeRef **)&v44, (CFDictionaryRef *)&cf);
    v18 = cf;
    v9 = cf != 0;
    if (cf)
    {
      v19 = this[7];
      this[7] = (CFDictionaryRef)cf;
      CFRetain(v18);
      if (v19)
        CFRelease(v19);
LABEL_49:
      if (cf)
        CFRelease(cf);
      goto LABEL_64;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v20 = this + 4;
      if (*((char *)this + 55) < 0)
        v20 = (_QWORD *)*v20;
      v27 = (const __CFString **)applesauce::CF::StringRef::operator->(a2);
      std::string::basic_string[abi:ne180100]<0>(v25, "Unknown");
      applesauce::CF::StringRef_proxy::convert_or(&v27, (uint64_t)v25, &buf);
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = &buf;
      else
        v21 = (std::string *)buf.__r_.__value_.__r.__words[0];
      *(_DWORD *)v46 = 136315394;
      *(_QWORD *)&v46[4] = v20;
      v47 = 2080;
      v48 = v21;
      _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) failed to create new dictionary", v46, 0x16u);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v26 < 0)
        operator delete(v25[0]);
      goto LABEL_49;
    }
LABEL_64:
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v44, (_QWORD *)v44.__r_.__value_.__l.__size_);
    goto LABEL_65;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v7 = this + 4;
    if (*((char *)this + 55) < 0)
      v7 = (_QWORD *)*v7;
    *(_QWORD *)v46 = applesauce::CF::StringRef::operator->(a2);
    std::string::basic_string[abi:ne180100]<0>(v42, "Unknown");
    applesauce::CF::StringRef_proxy::convert_or((const __CFString ***)v46, (uint64_t)v42, &v44);
    if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v8 = &v44;
    else
      v8 = (std::string *)v44.__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v8;
    _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: ReplaceProperty(%s) invalid value: (null).", (uint8_t *)&buf, 0x16u);
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v44.__r_.__value_.__l.__data_);
    if (v43 < 0)
      operator delete(v42[0]);
  }
  return 0;
}

void sub_236CF58A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const void **a3)
{
  return ASDT::IOUserClient::ReplaceProperty(this, a2, a3, 0);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, int a3)
{
  const void **v5;
  const void *v6;
  _BOOL8 v7;
  CFTypeRef cf[2];

  v5 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v5 = (const void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  cf[1] = v6;
  if (v6)
    CFRetain(v6);
  cf[0] = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0])
    CFRelease(cf[0]);
  if (v6)
    CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFTypeRef cf[2];

  LODWORD(cf[0]) = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0])
    CFRelease(cf[0]);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFTypeRef cf[2];

  LODWORD(cf[0]) = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0])
    CFRelease(cf[0]);
  CFRelease(v6);
  return v7;
}

void sub_236CF59E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::TypeRef::~TypeRef((const void **)&a9);
  applesauce::CF::BooleanRef::~BooleanRef(&a10);
  _Unwind_Resume(a1);
}

void sub_236CF5AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF5BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, const __CFNumber *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr)
    CFRelease(valuePtr);
  CFRelease(v6);
  return v7;
}

{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr)
    CFRelease(valuePtr);
  CFRelease(v6);
  return v7;
}

void sub_236CF5C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void sub_236CF5D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, float a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFTypeRef cf[2];

  *(float *)cf = a3;
  v5 = CFNumberCreate(0, kCFNumberFloatType, cf);
  cf[1] = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  cf[0] = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, cf, 0);
  if (cf[0])
    CFRelease(cf[0]);
  CFRelease(v6);
  return v7;
}

void sub_236CF5E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  _BOOL8 v7;
  void *exception;
  CFNumberRef valuePtr;

  valuePtr = *(CFNumberRef *)&a3;
  v5 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B801F1C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = v5;
  CFRetain(v5);
  valuePtr = v6;
  v7 = ASDT::IOUserClient::ReplaceProperty(this, a2, (const void **)&valuePtr, 0);
  if (valuePtr)
    CFRelease(valuePtr);
  CFRelease(v6);
  return v7;
}

void sub_236CF5F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ReplaceProperty(CFDictionaryRef *this, const void **a2, CFTypeRef *a3)
{
  CFTypeRef v5;
  _BOOL8 v6;
  CFTypeRef cf;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  cf = v5;
  v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf)
    CFRelease(cf);
  return v6;
}

{
  CFTypeRef v5;
  _BOOL8 v6;
  CFTypeRef cf;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  cf = v5;
  v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf)
    CFRelease(cf);
  return v6;
}

{
  CFTypeRef v5;
  _BOOL8 v6;
  CFTypeRef cf;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  cf = v5;
  v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf)
    CFRelease(cf);
  return v6;
}

{
  CFTypeRef v5;
  _BOOL8 v6;
  CFTypeRef cf;

  v5 = *a3;
  if (*a3)
    CFRetain(*a3);
  cf = v5;
  v6 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 0);
  if (cf)
    CFRelease(cf);
  return v6;
}

void sub_236CF6010(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF6098(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF6120(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_236CF61A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::RemoveProperty(CFDictionaryRef *this, const void **a2)
{
  _BOOL8 v2;
  CFTypeRef cf;

  cf = 0;
  v2 = ASDT::IOUserClient::ReplaceProperty(this, a2, &cf, 1);
  if (cf)
    CFRelease(cf);
  return v2;
}

void sub_236CF6204(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::IsConnectionOpen(ASDT::IOUserClient *this)
{
  _BOOL8 v2;
  char *v4;
  char v5;

  v4 = (char *)this + 144;
  v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v2 = *((_DWORD *)this + 3) != 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this, uint32_t a2)
{
  uint64_t v4;
  unsigned int v6;
  int v7;
  char *v8;
  task_port_t *v9;
  NSObject *v10;
  kern_return_t v11;
  BOOL v12;
  char *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  char v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  uint32_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v18 = (char *)this + 144;
  v19 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  if (*((_DWORD *)this + 2) && *((_BYTE *)this + 16))
  {
    if (*((_DWORD *)this + 3))
    {
LABEL_4:
      v4 = 1;
    }
    else
    {
      v6 = -536870201;
      v7 = *((_DWORD *)this + 5);
      v8 = (char *)this + 32;
      v9 = (task_port_t *)MEMORY[0x24BDAEC58];
      v10 = MEMORY[0x24BDACB70];
      while (v7)
      {
        v11 = IOServiceOpen(*((_DWORD *)this + 2), *v9, a2, (io_connect_t *)this + 3);
        if (!--v7 || (v11 ? (v12 = v11 == -536870201) : (v12 = 0), !v12))
        {
          v6 = v11;
          if (!v11)
            goto LABEL_4;
          break;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v13 = (char *)this + 32;
          if (*((char *)this + 55) < 0)
            v13 = *(char **)v8;
          *(_DWORD *)buf = 136316674;
          v21 = v13;
          v22 = 1024;
          v23 = a2;
          v24 = 1024;
          v25 = -536870201;
          v26 = 1024;
          v27 = 32;
          v28 = 1024;
          v29 = 32;
          v30 = 1024;
          v31 = 32;
          v32 = 1024;
          v33 = 32;
          _os_log_debug_impl(&dword_236CEE000, v10, OS_LOG_TYPE_DEBUG, "%s: OpenConnection(%u) failed: %x (%c%c%c%c): Retring...", buf, 0x30u);
        }
        usleep(*((_DWORD *)this + 6));
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        if (*((char *)this + 55) < 0)
          v8 = *(char **)v8;
        v14 = HIBYTE(v6);
        if ((v6 - 0x20000000) >> 24 >= 0x5F)
          v14 = 32;
        *(_DWORD *)buf = 136316674;
        v21 = v8;
        v15 = BYTE2(v6);
        if (BYTE2(v6) - 32 >= 0x5F)
          v15 = 32;
        v22 = 1024;
        v23 = a2;
        v16 = BYTE1(v6);
        if (BYTE1(v6) - 32 >= 0x5F)
          v16 = 32;
        v24 = 1024;
        v25 = v6;
        v26 = 1024;
        v27 = v14;
        v28 = 1024;
        v29 = v15;
        if (v6 - 32 >= 0x5F)
          v17 = 32;
        else
          v17 = v6;
        v30 = 1024;
        v31 = v16;
        v32 = 1024;
        v33 = v17;
        _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: OpenConnection(%u) failed: %x (%c%c%c%c)", buf, 0x30u);
      }
      v4 = 0;
      *((_DWORD *)this + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v18);
  return v4;
}

void sub_236CF6500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ASDT::IOUserClient::GuardedCloseConnection(ASDT::IOUserClient *this)
{
  _QWORD *i;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t v7;
  io_connect_t v8;
  std::unique_lock<std::mutex> v9;

  v9.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 312);
  v9.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 312));
  for (i = (_QWORD *)*((_QWORD *)this + 9); i != (_QWORD *)((char *)this + 80); i = v5)
  {
    v3 = (_QWORD *)i[1];
    v4 = i;
    if (v3)
    {
      do
      {
        v5 = v3;
        v3 = (_QWORD *)*v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        v5 = (_QWORD *)v4[2];
        v6 = *v5 == (_QWORD)v4;
        v4 = v5;
      }
      while (!v6);
    }
    ASDT::IOUserClient::GuardedReleaseMemory(this, i[4]);
  }
  std::unique_lock<std::mutex>::unlock(&v9);
  v7 = *((_QWORD *)this + 12);
  if (v7)
  {
    *((_QWORD *)this + 12) = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = *((_DWORD *)this + 3);
  if (v8)
  {
    IOServiceClose(v8);
    *((_DWORD *)this + 3) = 0;
  }
  if (v9.__owns_)
    std::mutex::unlock(v9.__m_);
}

void sub_236CF65E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10)
    std::mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

void ASDT::IOUserClient::GuardedReleaseMemory(ASDT::IOUserClient *this, unint64_t a2)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t **v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  v3 = (uint64_t *)((char *)this + 80);
  v4 = (_QWORD *)*((_QWORD *)this + 10);
  if (!v4)
    goto LABEL_22;
  v5 = (uint64_t **)((char *)this + 72);
  v6 = v3;
  do
  {
    v7 = v4[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != v3 && v6[4] <= a2)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer(v5, v6);
    operator delete(v6);
    if (*((_DWORD *)this + 3)
      && *((_BYTE *)this + 16)
      && MEMORY[0x23B801D60]()
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      ASDT::IOUserClient::GuardedReleaseMemory();
    }
  }
  else
  {
LABEL_22:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::GuardedReleaseMemory();
  }
}

void std::unique_lock<std::mutex>::unlock(std::unique_lock<std::mutex> *this)
{
  ASDT::IOUserClient *v2;

  if (this->__owns_)
  {
    std::mutex::unlock(this->__m_);
    this->__owns_ = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    ASDT::IOUserClient::CloseConnection(v2);
  }
}

uint64_t ASDT::IOUserClient::CloseConnection(ASDT::IOUserClient *this)
{
  char *v3;
  char v4;

  v3 = (char *)this + 144;
  v4 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  (*(void (**)(ASDT::IOUserClient *))(*(_QWORD *)this + 40))(this);
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v3);
}

void sub_236CF6794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::GetConnectionNotificationPort(ASDT::IOUserClient *this)
{
  uint64_t v2;
  char *v4;
  char v5;

  v4 = (char *)this + 144;
  v5 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  if (*((_BYTE *)this + 16))
    v2 = *((_QWORD *)this + 12);
  else
    v2 = 0;
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  return v2;
}

uint64_t ASDT::IOUserClient::SetConnectionNotification(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  _QWORD *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = 560947818;
  v18 = a1 + 144;
  v19 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 144));
  if (*a3
    && *(_DWORD *)(*a3 + 8)
    && (v6 = 1852990585, v7 = *(unsigned int *)(a1 + 12), (_DWORD)v7)
    && *(_BYTE *)(a1 + 16)
    && (v6 = MEMORY[0x23B801D30](v7, a2)) == 0)
  {
    v10 = *a3;
    *a3 = 0;
    v11 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v10;
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    v8 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v12 = (_QWORD *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0)
        v12 = (_QWORD *)*v12;
      if (*a3)
        v13 = *(_DWORD *)(*a3 + 8);
      else
        v13 = -1;
      *(_DWORD *)buf = 136316930;
      v21 = v12;
      if ((v6 - 0x20000000) >> 24 >= 0x5F)
        v14 = 32;
      else
        v14 = HIBYTE(v6);
      v22 = 1024;
      v23 = a2;
      v15 = BYTE2(v6);
      if (BYTE2(v6) - 32 >= 0x5F)
        v15 = 32;
      v24 = 1024;
      v25 = v13;
      v16 = BYTE1(v6);
      if (BYTE1(v6) - 32 >= 0x5F)
        v16 = 32;
      v26 = 1024;
      v27 = v6;
      v28 = 1024;
      if (v6 - 32 >= 0x5F)
        v17 = 32;
      else
        v17 = v6;
      v29 = v14;
      v30 = 1024;
      v31 = v15;
      v32 = 1024;
      v33 = v16;
      v34 = 1024;
      v35 = v17;
      _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: SetConnectionNotificationPort(%u, %u, ...) failed: %x (%c%c%c%c)", buf, 0x36u);
    }
    v8 = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v18);
  return v8;
}

void sub_236CF69F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, int a2, int a3, unsigned int *a4)
{
  unsigned int v7;
  _QWORD *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char *v14;
  char v15;
  uint64_t v16;
  int v17;
  uint8_t buf[4];
  _QWORD *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  v16 = 0;
  v14 = (char *)this + 144;
  v15 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  if (*((_DWORD *)this + 3))
  {
    if (*((_BYTE *)this + 16))
    {
      v7 = MEMORY[0x23B801D18]();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v9 = (_QWORD *)((char *)this + 32);
        if (*((char *)this + 55) < 0)
          v9 = (_QWORD *)*v9;
        *(_DWORD *)buf = 136316930;
        v19 = v9;
        if ((v7 - 0x20000000) >> 24 >= 0x5F)
          v10 = 32;
        else
          v10 = HIBYTE(v7);
        v20 = 1024;
        v21 = a2;
        v11 = BYTE2(v7);
        if (BYTE2(v7) - 32 >= 0x5F)
          v11 = 32;
        v22 = 1024;
        v23 = a3;
        v12 = BYTE1(v7);
        if (BYTE1(v7) - 32 >= 0x5F)
          v12 = 32;
        v24 = 1024;
        v25 = v7;
        v26 = 1024;
        if (v7 - 32 >= 0x5F)
          v13 = 32;
        else
          v13 = v7;
        v27 = v10;
        v28 = 1024;
        v29 = v11;
        v30 = 1024;
        v31 = v12;
        v32 = 1024;
        v33 = v13;
        _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: MapMemory(%u, %u, ...) failed: %x (%c%c%c%c)", buf, 0x36u);
      }
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v14);
  return 0;
}

void sub_236CF6C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::mutex *v11;

  std::mutex::unlock(v11);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(uint64_t this, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a2)
  {
    v3 = this;
    v4 = this + 144;
    v5 = 1;
    std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(this + 144));
    std::mutex::lock((std::mutex *)(v3 + 312));
    ASDT::IOUserClient::GuardedReleaseMemory((ASDT::IOUserClient *)v3, a2);
    std::mutex::unlock((std::mutex *)(v3 + 312));
    return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v4);
  }
  return this;
}

void sub_236CF6CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::mutex *v9;

  std::mutex::unlock(v9);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t *a10)
{
  uint64_t v18;
  mach_port_t v19;
  char *v21;
  char v22;

  v18 = 1937010544;
  v21 = (char *)this + 144;
  v22 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v19 = *((_DWORD *)this + 3);
  if (!v19
    || !*((_BYTE *)this + 16)
    || (v18 = IOConnectCallMethod(v19, a2, a3, a4, a5, a6, a7, a8, outputStruct, a10), (_DWORD)v18))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::CallMethod();
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v21);
  return v18;
}

void sub_236CF6DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallTrap(ASDT::IOUserClient *this, uint32_t a2)
{
  uint64_t v4;
  io_connect_t v5;
  char *v7;
  char v8;

  v4 = 1937010544;
  v7 = (char *)this + 144;
  v8 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v5 = *((_DWORD *)this + 3);
  if (!v5 || !*((_BYTE *)this + 16) || (v4 = IOConnectTrap0(v5, a2), (_DWORD)v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::CallTrap();
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
  return v4;
}

void sub_236CF6E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallTrap3(ASDT::IOUserClient *this, uint32_t a2, uintptr_t a3, uintptr_t a4, uintptr_t a5)
{
  uint64_t v10;
  io_connect_t v11;
  char *v13;
  char v14;

  v10 = 1937010544;
  v13 = (char *)this + 144;
  v14 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v11 = *((_DWORD *)this + 3);
  if (!v11 || !*((_BYTE *)this + 16) || (v10 = IOConnectTrap3(v11, a2, a3, a4, a5), (_DWORD)v10))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::CallTrap3();
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v13);
  return v10;
}

void sub_236CF6F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CallTrap6(ASDT::IOUserClient *this, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v7;
  char v8;

  v4 = 1937010544;
  v7 = (char *)this + 144;
  v8 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 144));
  v5 = *((unsigned int *)this + 3);
  if (!(_DWORD)v5 || !*((_BYTE *)this + 16) || (v4 = MEMORY[0x23B801D54](v5, a2), (_DWORD)v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::IOUserClient::CallTrap6();
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
  return v4;
}

void sub_236CF7040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOUserClient::ShouldEnableInterestNotification(ASDT::IOUserClient *this)
{
  return *((_QWORD *)this + 16) || *((_BYTE *)this + 136) || *((_BYTE *)this + 137) != 0;
}

void ASDT::IOUserClient::InterestNotificationCallback(ASDT::IOUserClient *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (this)
  {
    if ((_DWORD)a3 == -536870896 || *((_DWORD *)this + 2) == (_DWORD)a2)
    {
      (*(void (**)(ASDT::IOUserClient *, uint64_t, uint64_t))(*(_QWORD *)this + 56))(this, a3, a4);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      ASDT::IOUserClient::InterestNotificationCallback();
    }
  }
}

uint64_t ASDT::IOUserClient::InterestNotification(uint64_t this, int a2, void *a3)
{
  uint64_t v3;

  if (a2 == -536870608)
  {
    if (!*(_BYTE *)(this + 137))
      return this;
    v3 = 3;
    return (*(uint64_t (**)(void))(*(_QWORD *)this + 8 * v3))();
  }
  if (a2 == -536870896 && (*(_QWORD *)(this + 128) || *(_BYTE *)(this + 136)))
  {
    v3 = 2;
    return (*(uint64_t (**)(void))(*(_QWORD *)this + 8 * v3))();
  }
  return this;
}

uint64_t ASDT::IOUserClient::SetTerminationBlock(ASDT::IOUserClient *a1, void *aBlock)
{
  const void *v4;
  int v5;

  v4 = (const void *)*((_QWORD *)a1 + 16);
  if (v4)
  {
    _Block_release(v4);
    *((_QWORD *)a1 + 16) = 0;
  }
  if (aBlock)
    *((_QWORD *)a1 + 16) = _Block_copy(aBlock);
  v5 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(_QWORD *)a1 + 48))(a1);
  return ASDT::IOUserClient::SetInterestNotificationEnabled(a1, v5);
}

uint64_t ASDT::IOUserClient::SetTerminationNotificationEnabled(ASDT::IOUserClient *this, char a2)
{
  int v4;
  uint64_t v5;
  char *v7;
  char v8;

  v7 = (char *)this + 144;
  v8 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((_BYTE *)this + 136) = a2;
  v4 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(_QWORD *)this + 48))(this);
  v5 = ASDT::IOUserClient::SetInterestNotificationEnabled(this, v4);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_236CF7210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::SetPropertyChangeNotificationEnabled(ASDT::IOUserClient *this, char a2)
{
  int v4;
  uint64_t v5;
  char *v7;
  char v8;

  v7 = (char *)this + 144;
  v8 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 144));
  *((_BYTE *)this + 137) = a2;
  v4 = (*(uint64_t (**)(ASDT::IOUserClient *))(*(_QWORD *)this + 48))(this);
  v5 = ASDT::IOUserClient::SetInterestNotificationEnabled(this, v4);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v7);
  return v5;
}

void sub_236CF7290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::Release(ASDT::IOUserClient *this)
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

void applesauce::CF::construct_error(applesauce::CF *this)
{
  JUMPOUT(0x23B801F1CLL);
}

_QWORD *applesauce::CF::details::CFString_get_value<false>@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  char *CStringPtr;
  CFIndex Length;
  UInt8 *v7;
  CFIndex maxBufLen;
  CFRange v9;
  CFRange v10;

  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
    return std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, CStringPtr);
  Length = CFStringGetLength(a1);
  maxBufLen = 0;
  v9.location = 0;
  v9.length = Length;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  std::string::basic_string[abi:ne180100]((_QWORD *)a2, maxBufLen, 0);
  if (*(char *)(a2 + 23) >= 0)
    v7 = (UInt8 *)a2;
  else
    v7 = *(UInt8 **)a2;
  v10.location = 0;
  v10.length = Length;
  return (_QWORD *)CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
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
  __cxa_throw(exception, (struct type_info *)off_250841710, MEMORY[0x24BEDAAF0]);
}

void sub_236CF74B4(_Unwind_Exception *a1)
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

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
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

applesauce::CF::BooleanRef *applesauce::CF::BooleanRef::BooleanRef(applesauce::CF::BooleanRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFBooleanGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF7654(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

BOOL applesauce::CF::convert_to<BOOL,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;
  int Value;
  CFTypeID v4;
  applesauce::CF *exception;

  if (!a1)
    goto LABEL_8;
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(a1))
  {
    v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(a1))
    {
      LOWORD(Value) = applesauce::CF::details::number_convert_as<BOOL>(a1);
      if ((unsigned __int16)Value > 0xFFu)
      {
        Value = Value;
        return Value != 0;
      }
    }
LABEL_8:
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  Value = CFBooleanGetValue(a1);
  return Value != 0;
}

void sub_236CF7714()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CF772C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
  JUMPOUT(0x23B801F1CLL);
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

applesauce::CF::NumberRef *applesauce::CF::NumberRef::NumberRef(applesauce::CF::NumberRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFNumberGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF79C8(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
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
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF7A74(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF7B20(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
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
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF7BCC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
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
      MEMORY[0x23B801F1C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_236CF7C78(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::DictionaryRef_iterator(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v3;
  CFIndex Count;

  *(_QWORD *)a1 = theDict;
  *(_OWORD *)(a1 + 40) = 0u;
  v3 = a1 + 40;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    std::vector<void const*>::resize(a1 + 16, Count);
    std::vector<void const*>::resize(v3, Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)a1, *(const void ***)(a1 + 16), *(const void ***)(a1 + 40));
  }
  return a1;
}

void std::vector<void const*>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<void const*>::__append((void **)a1, a2 - v2);
  }
}

void std::vector<void const*>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void std::vector<void const*>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
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

void std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  return a1;
}

void std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__move_assign(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)(a1 + 8);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  *(_QWORD *)a1 = *a2;
  v5 = a2 + 1;
  v6 = a2[1];
  *v4 = v6;
  v7 = a2[2];
  *(_QWORD *)(a1 + 16) = v7;
  if (v7)
  {
    *(_QWORD *)(v6 + 16) = v4;
    *a2 = v5;
    *v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *(_QWORD *)a1 = v4;
  }
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  return a1;
}

const __CFDictionary *applesauce::CF::details::has_key<applesauce::CF::StringRef const&>(const __CFDictionary *result, const void **a2)
{
  const void *v2;

  if (result)
  {
    v2 = *a2;
    if (v2)
      return (const __CFDictionary *)(CFDictionaryContainsKey(result, v2) != 0);
    else
      return 0;
  }
  return result;
}

const void *applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>@<X0>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  const void *result;
  const void *v5;
  char v6;

  result = applesauce::CF::details::at_key<applesauce::CF::StringRef const&>(a1, a2);
  if (result)
  {
    v5 = result;
    result = CFRetain(result);
    *(_QWORD *)a3 = v5;
    v6 = 1;
  }
  else
  {
    v6 = 0;
    *(_BYTE *)a3 = 0;
  }
  *(_BYTE *)(a3 + 8) = v6;
  return result;
}

const __CFDictionary *applesauce::CF::details::at_key<applesauce::CF::StringRef const&>(const __CFDictionary *result, const void **a2)
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

const __CFBoolean *applesauce::CF::convert_as<long long,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return (const __CFBoolean *)applesauce::CF::details::number_convert_as<long long>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(const __CFBoolean *result)
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

unint64_t applesauce::CF::details::number_convert_as<long long>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  unint64_t v4;
  uint64_t v5;
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
      v5 = (uint64_t)*(float *)&valuePtr;
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
      v5 = (uint64_t)valuePtr;
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

const __CFBoolean *applesauce::CF::convert_as<unsigned long long,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return (const __CFBoolean *)applesauce::CF::details::number_convert_as<unsigned long long>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<long long>(a1);
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

uint64_t applesauce::CF::convert_as<float,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return applesauce::CF::details::number_convert_as<float>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(const __CFBoolean *a1)
{
  CFTypeID TypeID;
  uint64_t v3;
  uint64_t v4;

  if (a1 && (TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    v4 = 0x100000000;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  return v3 | v4;
}

uint64_t applesauce::CF::details::number_convert_as<float>(const __CFNumber *a1)
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
  const __CFNumber *v15;
  CFNumberType v16;
  int Value;
  int v18;
  float v19;
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
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v11 = a1;
      v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v13 = a1;
      v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v15 = a1;
      v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberShortType;
LABEL_12:
      Value = CFNumberGetValue(v7, v8, &valuePtr);
      v18 = SLOWORD(valuePtr);
LABEL_13:
      v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberIntType;
LABEL_15:
      Value = CFNumberGetValue(v9, v10, &valuePtr);
      v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v11 = a1;
      v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v11 = a1;
      v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v13 = a1;
      v14 = kCFNumberFloatType;
LABEL_19:
      Value = CFNumberGetValue(v13, v14, &valuePtr);
      v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v15 = a1;
      v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v11 = a1;
      v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v11 = a1;
      v12 = kCFNumberNSIntegerType;
LABEL_23:
      Value = CFNumberGetValue(v11, v12, &valuePtr);
      v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v15 = a1;
      v16 = kCFNumberCGFloatType;
LABEL_25:
      Value = CFNumberGetValue(v15, v16, &valuePtr);
      v19 = valuePtr;
LABEL_26:
      v20 = LODWORD(v19);
LABEL_27:
      v6 = v20 | 0x100000000;
      if (!Value)
        v6 = 0;
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

const __CFBoolean *applesauce::CF::convert_as<double,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return (const __CFBoolean *)applesauce::CF::details::number_convert_as<double>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<double>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<double>(const __CFBoolean *result)
{
  const __CFBoolean *v1;
  CFTypeID TypeID;

  if (*(double *)&result != 0.0)
  {
    v1 = result;
    TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1))
      *(double *)&result = (double)CFBooleanGetValue(v1);
    else
      *(double *)&result = 0.0;
  }
  return result;
}

unint64_t applesauce::CF::details::number_convert_as<double>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  unint64_t v4;
  double v5;
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
  BOOL v16;
  int v17;
  double v18;
  uint64_t valuePtr;

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
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v8 = a1;
      v9 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      valuePtr = 0;
      v10 = a1;
      v11 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v12 = a1;
      v13 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      valuePtr = 0;
      v14 = a1;
      v15 = kCFNumberFloat64Type;
      goto LABEL_31;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      v16 = CFNumberGetValue(v2, v3, &valuePtr) == 0;
      v17 = (char)valuePtr;
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v6 = a1;
      v7 = kCFNumberShortType;
LABEL_12:
      v16 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      v17 = (__int16)valuePtr;
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v8 = a1;
      v9 = kCFNumberIntType;
LABEL_14:
      v16 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      v17 = valuePtr;
LABEL_15:
      v18 = (double)v17;
      goto LABEL_24;
    case kCFNumberLongType:
      valuePtr = 0;
      v10 = a1;
      v11 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      valuePtr = 0;
      v10 = a1;
      v11 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v12 = a1;
      v13 = kCFNumberFloatType;
LABEL_19:
      v16 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      v18 = *(float *)&valuePtr;
      goto LABEL_24;
    case kCFNumberDoubleType:
      valuePtr = 0;
      v14 = a1;
      v15 = kCFNumberDoubleType;
      goto LABEL_31;
    case kCFNumberCFIndexType:
      valuePtr = 0;
      v10 = a1;
      v11 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      valuePtr = 0;
      v10 = a1;
      v11 = kCFNumberNSIntegerType;
LABEL_23:
      v16 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      v18 = (double)valuePtr;
LABEL_24:
      v5 = v18;
      goto LABEL_25;
    case kCFNumberCGFloatType:
      valuePtr = 0;
      v14 = a1;
      v15 = kCFNumberCGFloatType;
LABEL_31:
      v16 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      v5 = *(double *)&valuePtr;
LABEL_25:
      if (v16)
        v5 = 0.0;
      v4 = *(_QWORD *)&v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return LOBYTE(v5) | v4;
}

_QWORD *std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::map[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(_QWORD *a1, __int128 *a2, __int128 *a3)
{
  __int128 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *__p;
  void *v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  a1[2] = 0;
  a1[1] = 0;
  *a1 = a1 + 1;
  v14 = *a2;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v15, *((const void **)a2 + 2), *((_QWORD *)a2 + 3), (uint64_t)(*((_QWORD *)a2 + 3) - *((_QWORD *)a2 + 2)) >> 3);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v18, *((const void **)a2 + 5), *((_QWORD *)a2 + 6), (uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3);
  v7 = *a3;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&v8, *((const void **)a3 + 2), *((_QWORD *)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 3);
  __p = 0;
  v12 = 0;
  v13 = 0;
  std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(&__p, *((const void **)a3 + 5), *((_QWORD *)a3 + 6), (uint64_t)(*((_QWORD *)a3 + 6) - *((_QWORD *)a3 + 5)) >> 3);
  std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t)a1, &v14, (uint64_t *)&v7);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }
  if (v15)
  {
    v16 = v15;
    operator delete(v15);
  }
  return a1;
}

void sub_236CF9298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  uint64_t v20;

  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(&a9);
  applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~DictionaryRef_iterator(&a17);
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(v20, *(_QWORD **)(v20 + 8));
  _Unwind_Resume(a1);
}

BOOL std::map<applesauce::CF::StringRef,applesauce::CF::TypeRef>::insert[abi:ne180100]<applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  _BOOL8 result;
  CFTypeRef v7;
  CFTypeRef cf;

  for (result = applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(a2, a3);
        !result;
        result = applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(a2, a3))
  {
    applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::dereference(a2, &v7);
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_impl<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t **)a1, (uint64_t *)(a1 + 8), (uint64_t)&v7);
    if (cf)
      CFRelease(cf);
    if (v7)
      CFRelease(v7);
    ++a2[1];
  }
  return result;
}

void sub_236CF93A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~pair((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  return a1;
}

BOOL applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::equal(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;

  if (*a1 && a1[1] != (uint64_t)(a1[3] - a1[2]) >> 3)
  {
    v2 = *a2;
  }
  else
  {
    v2 = *a2;
    if (!*a2 || a2[1] == (a2[3] - a2[2]) >> 3)
      return 1;
  }
  return *a1 == v2 && a1[1] == a2[1];
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_impl<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t v8;
  const __CFString **v9;
  uint64_t *v10[3];

  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__construct_node<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>((uint64_t)a1, a3, (uint64_t)v10);
  v5 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(a1, a2, &v9, &v8, (CFTypeRef *)v10[0] + 4);
  v6 = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v9, v5, v10[0]);
    v6 = v10[0];
    v10[0] = 0;
  }
  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  return v6;
}

void sub_236CF94DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__construct_node<std::pair<applesauce::CF::TypeRef,applesauce::CF::TypeRef>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  applesauce::CF::StringRef *result;

  v5 = a1 + 8;
  v6 = operator new(0x30uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = applesauce::CF::TypeRef::operator applesauce::CF::StringRef((const void **)a2, (applesauce::CF::StringRef *)(v6 + 4));
  v6[5] = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_236CF9554(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

const __CFString **std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(_QWORD *a1, uint64_t *a2, const __CFString ***a3, uint64_t *a4, CFTypeRef *a5)
{
  const __CFString **v9;
  CFTypeRef *v11;
  CFTypeRef *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString **v15;
  uint64_t *v16;
  BOOL v17;
  const __CFString **v19;

  v9 = (const __CFString **)(a1 + 1);
  if (a1 + 1 == a2
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a5, (const __CFString **)a2 + 4) == kCFCompareLessThan)
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (CFTypeRef *)a2;
    }
    else
    {
      v11 = (CFTypeRef *)*a2;
      if (*a2)
      {
        do
        {
          v12 = v11;
          v11 = (CFTypeRef *)v11[1];
        }
        while (v11);
      }
      else
      {
        v16 = a2;
        do
        {
          v12 = (CFTypeRef *)v16[2];
          v17 = *v12 == v16;
          v16 = (uint64_t *)v12;
        }
        while (v17);
      }
      if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(v12 + 4, (const __CFString **)a5) != kCFCompareLessThan)return (const __CFString **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>((uint64_t)a1, a3, a5);
    }
    if (*a2)
    {
      *a3 = (const __CFString **)v12;
      return (const __CFString **)(v12 + 1);
    }
    else
    {
      *a3 = (const __CFString **)a2;
      return (const __CFString **)a2;
    }
  }
  if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a2 + 4, (const __CFString **)a5) == kCFCompareLessThan)
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (__CFString *)a2[1];
      do
      {
        v15 = (const __CFString **)v14;
        v14 = (__CFString *)v14->isa;
      }
      while (v14);
    }
    else
    {
      v19 = (const __CFString **)a2;
      do
      {
        v15 = (const __CFString **)v19[2];
        v17 = *v15 == (const __CFString *)v19;
        v19 = v15;
      }
      while (!v17);
    }
    if (v15 == v9)
      goto LABEL_27;
    if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a5, v15 + 4) == kCFCompareLessThan)
    {
      v13 = *a4;
LABEL_27:
      if (v13)
      {
        *a3 = v15;
        return v15;
      }
      else
      {
        *a3 = (const __CFString **)a2;
      }
      return (const __CFString **)a4;
    }
    return (const __CFString **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>((uint64_t)a1, a3, a5);
  }
  *a3 = (const __CFString **)a2;
  *a4 = (uint64_t)a2;
  return (const __CFString **)a4;
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

_QWORD *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(uint64_t a1, _QWORD *a2, CFTypeRef *a3)
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

void std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
}

_QWORD *applesauce::CF::DictionaryRef_iterator<applesauce::CF::TypeRef,applesauce::CF::TypeRef>::dereference@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::logic_error *exception;

  v3 = result[1];
  if ((v3 & 0x8000000000000000) != 0 || (v4 = result, v5 = result[2], v3 >= (result[3] - v5) >> 3))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](exception, "DictionaryRef_iterator iterator out of range.");
    __cxa_throw(exception, (struct type_info *)off_250841718, MEMORY[0x24BEDAB00]);
  }
  v6 = *(_QWORD *)(v5 + 8 * v3);
  if (v6)
  {
    result = CFRetain(*(CFTypeRef *)(v5 + 8 * v3));
    v3 = v4[1];
  }
  v7 = v4[5];
  v8 = *(_QWORD *)(v7 + 8 * v3);
  if (v8)
    result = CFRetain(*(CFTypeRef *)(v7 + 8 * v3));
  *a2 = v6;
  a2[1] = v8;
  return result;
}

void sub_236CF9B50(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

_QWORD *std::vector<void const*>::__init_with_size[abi:ne180100]<void const**,void const**>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<void const*>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_236CF9BE4(_Unwind_Exception *exception_object)
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
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
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

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_hint_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef&>(uint64_t **a1, uint64_t *a2, CFTypeRef *a3, CFTypeRef *a4, const void **a5)
{
  const __CFString **v8;
  uint64_t *v9;
  uint64_t **v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;
  const __CFString **v15;

  v8 = std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>(a1, a2, &v15, &v14, a3);
  v9 = (uint64_t *)*v8;
  if (!*v8)
  {
    v10 = (uint64_t **)v8;
    v9 = (uint64_t *)operator new(0x30uLL);
    v12[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef const&,applesauce::CF::TypeRef&,0>(v9 + 4, a4, a5);
    v13 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v15, v10, v9);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v9;
}

_QWORD *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef const&,applesauce::CF::TypeRef&,0>(_QWORD *a1, CFTypeRef *a2, const void **a3)
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
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
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

void sub_236CF9E18(_Unwind_Exception *a1, uint64_t a2, ...)
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
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
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

void sub_236CF9F28(_Unwind_Exception *a1, uint64_t a2, ...)
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
        MEMORY[0x23B801F1C](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v6 = v35;
      if (v35 >= v36)
      {
        v8 = v35 - keys;
        if ((unint64_t)(v8 + 1) >> 61)
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
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
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
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
    MEMORY[0x23B801F1C](v30, "Could not construct");
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

void sub_236CFA208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
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

_QWORD *std::vector<applesauce::CF::TypeRef>::__init_with_size[abi:ne180100]<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;

  v11 = result;
  v12 = 0;
  if (a4)
  {
    v6 = (uint64_t)result;
    std::vector<void const*>::__vallocate[abi:ne180100](result, a4);
    v9 = *(_OWORD *)a2;
    v10 = *(_QWORD *)(a2 + 16);
    v7 = *(_OWORD *)a3;
    v8 = *(_QWORD *)(a3 + 16);
    return std::vector<applesauce::CF::TypeRef>::__construct_at_end<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(v6, &v9, &v7);
  }
  return result;
}

void sub_236CFA6D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 - 48));
  _Unwind_Resume(a1);
}

_QWORD *std::vector<applesauce::CF::TypeRef>::__construct_at_end<applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>>(uint64_t a1, __int128 *a2, __int128 *a3)
{
  _QWORD *v4;
  _QWORD *result;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD **)(a1 + 8);
  v8 = *a2;
  v9 = *((_QWORD *)a2 + 2);
  v6 = *a3;
  v7 = *((_QWORD *)a3 + 2);
  result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>(a1 + 16, &v8, (uint64_t *)&v6, v4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_236CFA744(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>(uint64_t a1, _QWORD *a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v6;
  uint64_t *i;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;
  _QWORD v12[3];
  char v13;
  _QWORD *v14;
  _QWORD *v15;

  v15 = a4;
  v14 = a4;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  v13 = 0;
  v6 = a2;
  for (i = a3; !applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::equal(v6, i); i = a3)
  {
    v8 = v15;
    applesauce::CF::details::at_to<applesauce::CF::TypeRef>((const __CFArray *)*a2, a2[1], &v11);
    *v8 = v11;
    ++a2[1];
    ++v15;
    v6 = a2;
  }
  v13 = 1;
  v9 = v15;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v9;
}

void sub_236CFA7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::equal(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[1];
  v3 = *a2;
  if (*a1)
    v4 = v2 == a1[2];
  else
    v4 = 1;
  if (v4 && (!v3 || a2[1] == a2[2]))
    return 1;
  if (*a1 == v3)
    return v2 == a2[1];
  return 0;
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

void sub_236CFA8D0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CFA8F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::not_found(applesauce::CF *this)
{
  JUMPOUT(0x23B801F1CLL);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>::operator()[abi:ne180100](uint64_t *a1)
{
  CFTypeRef **v1;
  CFTypeRef **v2;
  CFTypeRef *v3;
  CFTypeRef *v4;
  uint64_t v5;

  v2 = (CFTypeRef **)a1[1];
  v1 = (CFTypeRef **)a1[2];
  v3 = *v1;
  v4 = *v2;
  if (*v1 != *v2)
  {
    v5 = *a1;
    do
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v5, --v3);
    while (v3 != v4);
  }
}

void std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](uint64_t a1, CFTypeRef *a2)
{
  if (*a2)
    CFRelease(*a2);
}

void std::vector<applesauce::CF::TypeRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100]((uint64_t)(v1 + 2), --v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<applesauce::CF::TypeRef>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v6 = a2[1];
  v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (_QWORD *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*>(v7, a3, (_QWORD *)a1[1], (_QWORD *)a2[2]);
  v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  v10 = (_QWORD *)a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  v11 = (_QWORD *)a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

CFTypeRef std::allocator<applesauce::CF::TypeRef>::construct[abi:ne180100]<applesauce::CF::TypeRef,applesauce::CF::TypeRef const&>(uint64_t a1, _QWORD *a2, CFTypeRef *a3)
{
  CFTypeRef v4;
  CFTypeRef result;

  v4 = *a3;
  if (*a3)
    result = CFRetain(*a3);
  *a2 = v4;
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>,std::reverse_iterator<applesauce::CF::TypeRef*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

_QWORD *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*,applesauce::CF::TypeRef*>(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD v6[3];
  char v7;
  _QWORD *v8;
  _QWORD *v9;

  v4 = a4;
  v9 = a4;
  v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4++ = *a2;
      *a2++ = 0;
    }
    while (a2 != a3);
    v9 = v4;
  }
  v7 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,applesauce::CF::TypeRef*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRef>,std::reverse_iterator<applesauce::CF::TypeRef*>>::operator()[abi:ne180100](uint64_t *a1)
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
      std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v3, v1++);
    while (v1 != v2);
  }
}

void **std::__split_buffer<applesauce::CF::TypeRef>::~__split_buffer(void **a1)
{
  std::__split_buffer<applesauce::CF::TypeRef>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<applesauce::CF::TypeRef>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 8;
    std::allocator<applesauce::CF::TypeRef>::destroy[abi:ne180100](v4, (CFTypeRef *)(i - 8));
  }
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::TypeRef>(uint64_t **a1)
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

void sub_236CFAD90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
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

void sub_236CFADF8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_236CFAE10(_Unwind_Exception *a1)
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

void sub_236CFAE7C(_Unwind_Exception *exception_object)
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

uint64_t applesauce::CF::at_or<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>@<X0>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  CFTypeRef v6;
  CFTypeRef cf;
  char v9;

  applesauce::CF::details::find_at_key_or_optional<applesauce::CF::TypeRef,applesauce::CF::StringRef const&>(a1, a2, (uint64_t)&cf);
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
  return std::__optional_destruct_base<applesauce::CF::TypeRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
}

uint64_t std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::find<applesauce::CF::StringRef>(uint64_t a1, const __CFString **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  CFComparisonResult v6;
  uint64_t *v7;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 8;
  do
  {
    v6 = applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)(v3 + 32), a2);
    v7 = (uint64_t *)(v3 + 8);
    if (v6 != kCFCompareLessThan)
    {
      v7 = (uint64_t *)v3;
      v5 = v3;
    }
    v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>((CFTypeRef *)a2, (const __CFString **)(v5 + 32)) == kCFCompareLessThan)
  {
    return v2;
  }
  return v5;
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(uint64_t **a1, CFTypeRef *a2, CFTypeRef *a3, const void **a4)
{
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;
  _QWORD v11[2];
  char v12;
  uint64_t v13;

  v7 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>((uint64_t)a1, &v13, a2);
  v8 = *v7;
  if (!*v7)
  {
    v9 = v7;
    v8 = (uint64_t *)operator new(0x30uLL);
    v11[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<true,0>(v8 + 4, a3, a4);
    v12 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v9, v8);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

_QWORD *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<true,0>(_QWORD *a1, CFTypeRef *a2, const void **a3)
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

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::__emplace_unique_key_args<void *,void *&,unsigned int &>(uint64_t **a1, unint64_t *a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  _QWORD *v12;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = operator new(0x30uLL);
    v12[4] = *a3;
    *((_DWORD *)v12 + 10) = *a4;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return (uint64_t **)v12;
  }
  return v10;
}

void OUTLINED_FUNCTION_1_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x48u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_236CFD320(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_236CFDA2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236CFDA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236CFDC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236CFDD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_236CFDE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236CFDED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *CAStringForOSType(unsigned int a1, char *__str, int64_t __size)
{
  BOOL v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned int v13;

  if (__size)
  {
    v5 = 0;
    v6 = 0;
    v7 = &__str[__size];
    v13 = bswap32(a1);
    v8 = MEMORY[0x24BDAC740];
    do
    {
      v9 = *((unsigned __int8 *)&v13 + v6);
      if (*((char *)&v13 + v6) < 0)
      {
        if (!__maskrune(v9, 0x40000uLL))
          goto LABEL_11;
      }
      else if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x40000) == 0)
      {
        goto LABEL_11;
      }
      if (*((_BYTE *)&v13 + v6) == 92)
      {
LABEL_11:
        v10 = &__str[snprintf(__str, __size, "0x")];
        goto LABEL_12;
      }
      v5 = v6++ > 2;
    }
    while (v6 != 4);
    if (__size < 1)
    {
      v10 = __str;
    }
    else
    {
      *__str = 39;
      v10 = __str + 1;
    }
LABEL_12:
    if (v10 < v7)
    {
      v11 = 0;
      do
      {
        if (v5)
          *v10++ = *((_BYTE *)&v13 + v11);
        else
          v10 += snprintf(v10, v7 - v10, "%02X", *((unsigned __int8 *)&v13 + v11));
        if (v11 > 2)
          break;
        ++v11;
      }
      while (v10 < v7);
      if (v5 && v10 < v7)
        *v10++ = 39;
    }
    v10[-(v10 >= v7)] = 0;
  }
  return __str;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this)
{
  *((_QWORD *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

{
  *((_QWORD *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *(_OWORD *)&a2->mSampleRate;
  v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((_QWORD *)this + 4) = *(_QWORD *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

{
  __int128 v2;
  __int128 v3;

  v2 = *(_OWORD *)&a2->mSampleRate;
  v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((_QWORD *)this + 4) = *(_QWORD *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, double a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

char *CAStreamBasicDescription::AsString(CAStreamBasicDescription *this, char *a2, int a3, char a4)
{
  const char *v8;
  size_t v9;
  const char *v10;
  int v11;
  int v12;
  size_t v13;
  char *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  unsigned int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  int v23;
  char *v24;
  int v25;
  size_t v26;
  int v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  char *v34;
  const char *v35;
  char *v36;
  const char *v37;
  const char *v38;
  char *v39;
  const char *v40;
  const char *v41;
  char v42[20];
  char __str[32];
  char v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  CAStringForOSType(*((_DWORD *)this + 2), v44, 24);
  if ((a4 & 1) != 0)
  {
    *(_DWORD *)__str = 0;
    v42[0] = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat(this, __str, (BOOL *)v42)
      && *(_DWORD *)__str
      && *(_DWORD *)__str <= 5u)
    {
      if (v42[0])
        v8 = ", inter";
      else
        v8 = ", non-inter";
      if (*((_DWORD *)this + 7) <= 1u)
        v8 = "";
      v9 = a3;
      v35 = *(const char **)this;
      v34 = (char *)*((unsigned int *)this + 7);
      v36 = off_250841FF8[*(_DWORD *)__str - 1];
      v37 = v8;
      v10 = "%2d ch, %6.0f Hz, %s%s";
      goto LABEL_29;
    }
    v23 = *((_DWORD *)this + 2);
    if (v23 == 1718773105)
    {
      v9 = a3;
      v35 = *(const char **)this;
      v34 = (char *)*((unsigned int *)this + 7);
      v10 = "%2d ch, %6.0f Hz, 'freq'";
LABEL_29:
      v24 = a2;
LABEL_90:
      snprintf(v24, v9, v10, v34, v35, v36, v37, v38, v39, v40, v41);
      return a2;
    }
    v11 = *((_DWORD *)this + 7);
    if (!v11 && !v23 && *(double *)this == 0.0)
    {
      v9 = a3;
      v35 = *(const char **)this;
      v34 = 0;
      v10 = "%2d ch, %6.0f Hz";
      goto LABEL_29;
    }
  }
  else
  {
    v11 = *((_DWORD *)this + 7);
  }
  v12 = snprintf(a2, a3, "%2d ch, %6.0f Hz, %s (0x%08X) ", v11, *(double *)this, v44, *((_DWORD *)this + 3));
  v13 = (a3 - v12);
  if ((int)v13 >= 1)
  {
    v14 = &a2[v12];
    v15 = *((_DWORD *)this + 2);
    if (v15 != 1634492771 && v15 != 1718378851)
    {
      if (v15 != 1819304813)
      {
        v36 = (char *)*((unsigned int *)this + 5);
        v37 = (const char *)*((unsigned int *)this + 6);
        v34 = (char *)*((unsigned int *)this + 8);
        v35 = (const char *)*((unsigned int *)this + 4);
        v10 = "%d bits/channel, %d bytes/packet, %d frames/packet, %d bytes/frame";
LABEL_89:
        v24 = v14;
        v9 = v13;
        goto LABEL_90;
      }
      v16 = *((_DWORD *)this + 3);
      v17 = *((_DWORD *)this + 6);
      v18 = "";
      if (!v17)
        goto LABEL_19;
      if ((v16 & 0x20) != 0)
      {
        v19 = 1;
      }
      else
      {
        v19 = *((_DWORD *)this + 7);
        if (!v19)
        {
LABEL_19:
          v20 = " signed";
          if ((v16 & 4) == 0)
            v20 = " unsigned";
          if ((v16 & 1) != 0)
            v21 = "float";
          else
            v21 = "integer";
          if ((v16 & 1) != 0)
            v22 = "";
          else
            v22 = v20;
LABEL_66:
          __str[0] = 0;
          if ((v16 & 0x20) != 0)
            v31 = ", deinterleaved";
          else
            v31 = "";
          v28 = "";
          v32 = "";
          goto LABEL_70;
        }
      }
      v27 = v17 / v19;
      if ((int)(v17 / v19) < 2)
      {
        v30 = " signed";
        if ((v16 & 4) == 0)
          v30 = " unsigned";
        if ((v16 & 1) != 0)
          v21 = "float";
        else
          v21 = "integer";
        if ((v16 & 1) != 0)
          v22 = "";
        else
          v22 = v30;
        if (v27 != 1)
          goto LABEL_66;
        v28 = "";
      }
      else
      {
        if ((v16 & 2) != 0)
          v28 = " big-endian";
        else
          v28 = " little-endian";
        v29 = " unsigned";
        if ((v16 & 4) != 0)
          v29 = " signed";
        if ((v16 & 1) != 0)
          v21 = "float";
        else
          v21 = "integer";
        if ((v16 & 1) != 0)
          v22 = "";
        else
          v22 = v29;
      }
      if (CAStreamBasicDescription::PackednessIsSignificant(this))
      {
        if ((*((_BYTE *)this + 12) & 8) != 0)
          snprintf(__str, 0x20uLL, "packed in %d bytes");
        else
          snprintf(__str, 0x20uLL, "unpacked in %d bytes");
      }
      else
      {
        __str[0] = 0;
      }
      if (CAStreamBasicDescription::PackednessIsSignificant(this) || (*((_BYTE *)this + 32) & 7) != 0)
      {
        v16 = *((_DWORD *)this + 3);
        if ((v16 & 0x10) != 0)
          v32 = " high-aligned";
        else
          v32 = " low-aligned";
      }
      else
      {
        v16 = *((_DWORD *)this + 3);
        v32 = "";
      }
      if ((v16 & 0x20) != 0)
        v31 = ", deinterleaved";
      else
        v31 = "";
      if (__str[0])
      {
        v18 = ", ";
LABEL_85:
        if (((v16 >> 7) & 0x3F) != 0)
          snprintf(v42, 0x14uLL, "%d.%d");
        else
          snprintf(v42, 0x14uLL, "%d");
        v40 = v32;
        v41 = v31;
        v38 = v18;
        v39 = __str;
        v36 = (char *)v22;
        v37 = v21;
        v10 = "%s-bit%s%s %s%s%s%s%s";
        v34 = v42;
        v35 = v28;
        goto LABEL_89;
      }
LABEL_70:
      if (*v32)
        v18 = ", ";
      goto LABEL_85;
    }
    if ((*((_DWORD *)this + 3) - 1) > 3)
      v25 = snprintf(&a2[v12], v13, "from UNKNOWN source bit depth, ");
    else
      v25 = snprintf(&a2[v12], v13, "from %d-bit source, ");
    v26 = (v13 - v25);
    if ((int)v26 >= 1)
      snprintf(&v14[v25], v26, "%d frames/packet");
  }
  return a2;
}

uint64_t CAStreamBasicDescription::IdentifyCommonPCMFormat(_DWORD *a1, _DWORD *a2, BOOL *a3)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;

  result = 0;
  *a2 = 0;
  if (a1[2] != 1819304813)
    return result;
  if (a1[5] != 1)
    return 0;
  v5 = a1[6];
  if (v5 != a1[4])
    return 0;
  v6 = a1[8];
  if (v5 < v6 >> 3)
    return 0;
  v7 = a1[7];
  if (!v7)
    return 0;
  v8 = a1[3];
  if (a3)
    *a3 = (v8 & 0x20) == 0;
  if ((v8 & 0x20) == 0)
  {
    if (v5 % v7)
      return 0;
    v5 /= v7;
  }
  result = 1;
  if ((v8 & 2) != 0 || 8 * v5 != v6)
    return result;
  if ((v8 & 1) != 0)
  {
    if ((v8 & 0x1F84) == 0)
    {
      if (v5 != 4)
      {
        if (v5 != 8)
          return result;
        LODWORD(result) = 4;
      }
      goto LABEL_29;
    }
    return 0;
  }
  if ((v8 & 4) == 0)
    return result;
  v9 = (v8 >> 7) & 0x3F;
  if (v9 == 24 && v5 == 4)
  {
    LODWORD(result) = 3;
LABEL_29:
    *a2 = result;
    return 1;
  }
  if (!v9 && v5 == 4)
  {
    LODWORD(result) = 5;
    goto LABEL_29;
  }
  if (!v9 && v5 == 2)
  {
    LODWORD(result) = 2;
    goto LABEL_29;
  }
  return result;
}

BOOL CAStreamBasicDescription::PackednessIsSignificant(CAStreamBasicDescription *this)
{
  unsigned int v2;
  unsigned int v3;

  if (*((_DWORD *)this + 2) != 1819304813 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    CAStreamBasicDescription::PackednessIsSignificant();
  v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    if ((*((_BYTE *)this + 12) & 0x20) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = *((_DWORD *)this + 7);
      if (!v3)
      {
        v2 = 0;
        return v2 != *((_DWORD *)this + 8);
      }
    }
    v2 = 8 * (v2 / v3);
  }
  return v2 != *((_DWORD *)this + 8);
}

_DWORD *CAStreamBasicDescription::NormalizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  int v2;

  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    v2 = 2 * this[7];
    this[3] = 12;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 16;
  }
  return this;
}

uint64_t CAStreamBasicDescription::NormalizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  int v3;
  int v4;

  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if ((_DWORD)this)
      v3 = 9;
    else
      v3 = 11;
    v4 = 2 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 16;
  }
  return this;
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  int v2;

  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  int v3;
  int v4;

  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if ((_DWORD)this)
      v3 = 9;
    else
      v3 = 11;
    v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  double result;

  *((_DWORD *)this + 8) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0)
    *(Float64 *)this = a2->mSampleRate;
  if (!*(_DWORD *)(this + 8))
    *(_DWORD *)(this + 8) = a2->mFormatID;
  if (!*(_DWORD *)(this + 12))
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  if (!*(_DWORD *)(this + 16))
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  if (!*(_DWORD *)(this + 20))
    *(_DWORD *)(this + 20) = a2->mFramesPerPacket;
  if (!*(_DWORD *)(this + 24))
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  if (!*(_DWORD *)(this + 28))
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  if (!*(_DWORD *)(this + 32))
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  return this;
}

uint64_t CAStreamBasicDescription::GetSimpleName(uint64_t this, AudioStreamBasicDescription *__str, size_t __size, int a4, int a5)
{
  unsigned int v6;
  AudioStreamBasicDescription *v7;
  double *v8;
  int v9;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;

  v6 = __size;
  v7 = __str;
  v8 = (double *)this;
  if (a5)
  {
    this = snprintf((char *)__str, __size, "%.0f ", *(double *)this);
    v7 = (AudioStreamBasicDescription *)((char *)v7 + (int)this);
    v6 -= this;
  }
  v9 = *((_DWORD *)v8 + 2);
  if (v9 == 1633889587)
  {
    strcpy((char *)v7, "AC-3");
    return this;
  }
  if (v9 == 1667326771)
  {
    strcpy((char *)v7, "AC-3 fo");
    return this;
  }
  if (v9 != 1819304813)
  {
    LOBYTE(v7->mSampleRate) = HIBYTE(v9);
    BYTE1(v7->mSampleRate) = *((_BYTE *)v8 + 10);
    BYTE2(v7->mSampleRate) = *((_BYTE *)v8 + 9);
    *(_WORD *)((char *)&v7->mSampleRate + 3) = *((unsigned __int8 *)v8 + 8);
    return this;
  }
  v10 = *((_DWORD *)v8 + 3);
  if ((v10 & 1) != 0)
  {
    v11 = "Floating Point";
    v12 = "Float";
  }
  else if ((v10 & 4) != 0)
  {
    v11 = "Signed Integer";
    v12 = "SInt";
  }
  else
  {
    v11 = "Unsigned Integer";
    v12 = "UInt";
  }
  if (a4)
    v13 = v12;
  else
    v13 = v11;
  if ((v10 & 0x10) != 0)
    v14 = "High";
  else
    v14 = "Low";
  if ((v10 & 0x40) != 0)
    v15 = "Unmixable";
  else
    v15 = "Mixable";
  v16 = *((unsigned int *)v8 + 7);
  if (a4)
  {
    if ((v10 & 2) != 0)
    {
      if ((v10 & 8) != 0)
        return snprintf((char *)v7, v6, "%s %d Ch %s %s%d");
      else
        return snprintf((char *)v7, v6, "%s %d Ch %s %s %s%d/%s%d", v15, v16, "Big Endian");
    }
    else
    {
      if ((v10 & 8) == 0)
      {
        v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
        v23 = (const char *)*((unsigned int *)v8 + 8);
        v24 = v13;
        v21 = v14;
        v22 = v13;
        v19 = v15;
        v20 = *((unsigned int *)v8 + 7);
        v18 = "%s %d Ch %s %s%d/%s%d";
        return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
      }
      return snprintf((char *)v7, v6, "%s %d Ch %s%d");
    }
  }
  else if ((v10 & 2) != 0)
  {
    if ((v10 & 8) == 0)
    {
      v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
      v23 = v13;
      v24 = v14;
      v21 = (const char *)*((unsigned int *)v8 + 8);
      v22 = "Big Endian";
      v19 = v15;
      v20 = *((unsigned int *)v8 + 7);
      v18 = "%s %d Channel %d Bit %s %s Aligned %s in %d Bits";
      return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
    }
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s %s");
  }
  else if ((v10 & 8) != 0)
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s");
  }
  else
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s Aligned %s in %d Bits", v15);
  }
}

uint64_t CAStreamBasicDescription::GetRegularizedFormatFlags(CAStreamBasicDescription *this, int a2)
{
  uint64_t result;
  unsigned int v4;
  unsigned int v5;
  BOOL IsSignificant;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  result = *((unsigned int *)this + 3);
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    v4 = result & 0x7FFFFFFF;
    if ((result & 0x7FFFFFFF) == 0)
      v4 = result;
    if (a2)
      v5 = v4;
    else
      v5 = v4 & 0xFFFFFFBF;
    if (!CAStreamBasicDescription::PackednessIsSignificant(this))
      v5 |= 8u;
    IsSignificant = CAStreamBasicDescription::PackednessIsSignificant(this);
    v7 = *((_DWORD *)this + 8);
    if (!IsSignificant && (v7 & 7) == 0)
      v5 &= ~0x10u;
    v8 = v5 & 0xFFFFFFFB;
    if ((v5 & 1) == 0)
      v8 = v5;
    v9 = (v8 & 8) == 0 || v7 > 8;
    v10 = v8 & 2;
    if (v9)
      v10 = v8;
    if (*((_DWORD *)this + 7) == 1)
      v10 &= ~0x20u;
    if (v10)
      return v10;
    else
      return 0x80000000;
  }
  return result;
}

BOOL CAStreamBasicDescription::EquivalentFormatFlags(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3, int a4)
{
  int v4;
  int32x4_t v6;
  int RegularizedFormatFlags;

  v4 = (int)a3;
  if (a4)
  {
    v6 = *(int32x4_t *)&a2->mFormatID;
    v6.i64[1] = *((_QWORD *)this + 1);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v6))) & 1) != 0)
      return 1;
  }
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    RegularizedFormatFlags = CAStreamBasicDescription::GetRegularizedFormatFlags(this, (int)a3);
    return RegularizedFormatFlags == CAStreamBasicDescription::GetRegularizedFormatFlags((CAStreamBasicDescription *)a2, v4);
  }
  else
  {
    return *((_DWORD *)this + 3) == a2->mFormatFlags;
  }
}

BOOL CAStreamBasicDescription::IsExactlyEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  return memcmp(this, a2, 0x24uLL) == 0;
}

BOOL CAStreamBasicDescription::IsEquivalent(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  double v3;
  int v5;
  AudioFormatID mFormatID;
  int v7;
  UInt32 mBytesPerPacket;
  int v9;
  UInt32 mFramesPerPacket;
  int v11;
  UInt32 mBytesPerFrame;
  int v13;
  UInt32 mChannelsPerFrame;
  int v15;
  UInt32 mBitsPerChannel;

  v3 = *(double *)this;
  if ((a3 & 1) != 0)
  {
    if (v3 != 0.0 && a2->mSampleRate != 0.0 && v3 != a2->mSampleRate)
      return 0;
    v5 = *((_DWORD *)this + 2);
    if (v5)
    {
      mFormatID = a2->mFormatID;
      if (mFormatID)
      {
        if (v5 != mFormatID)
          return 0;
      }
    }
    v7 = *((_DWORD *)this + 4);
    if (v7)
    {
      mBytesPerPacket = a2->mBytesPerPacket;
      if (mBytesPerPacket)
      {
        if (v7 != mBytesPerPacket)
          return 0;
      }
    }
    v9 = *((_DWORD *)this + 5);
    if (v9)
    {
      mFramesPerPacket = a2->mFramesPerPacket;
      if (mFramesPerPacket)
      {
        if (v9 != mFramesPerPacket)
          return 0;
      }
    }
    v11 = *((_DWORD *)this + 6);
    if (v11)
    {
      mBytesPerFrame = a2->mBytesPerFrame;
      if (mBytesPerFrame)
      {
        if (v11 != mBytesPerFrame)
          return 0;
      }
    }
    v13 = *((_DWORD *)this + 7);
    if (v13)
    {
      mChannelsPerFrame = a2->mChannelsPerFrame;
      if (mChannelsPerFrame)
      {
        if (v13 != mChannelsPerFrame)
          return 0;
      }
    }
    v15 = *((_DWORD *)this + 8);
    if (!v15)
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
    mBitsPerChannel = a2->mBitsPerChannel;
    if (!mBitsPerChannel)
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
  }
  else
  {
    if (v3 != a2->mSampleRate
      || *((_DWORD *)this + 2) != a2->mFormatID
      || *((_DWORD *)this + 4) != a2->mBytesPerPacket
      || *((_DWORD *)this + 5) != a2->mFramesPerPacket
      || *((_DWORD *)this + 7) != a2->mChannelsPerFrame)
    {
      return 0;
    }
    v15 = *((_DWORD *)this + 8);
    mBitsPerChannel = a2->mBitsPerChannel;
  }
  if (v15 != mBitsPerChannel)
    return 0;
  return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, int a3)
{
  if (a3)
    return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
  else
    return memcmp(this, a2, 0x24uLL) == 0;
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
}

BOOL SanityCheck(const AudioStreamBasicDescription *a1)
{
  _BOOL8 result;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  AudioFormatID mFormatID;
  _BOOL4 v8;

  result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240)
      return 0;
    mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240)
      return 0;
    mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240)
      return 0;
    result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400)
      return result;
    mFormatID = a1->mFormatID;
    if (!mFormatID)
      return 0;
    v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  CAStreamBasicDescription *v5;
  int v6;
  uint64_t v7;
  int i;
  FILE **v9;
  int v10;
  CAStreamBasicDescription *v11;
  int v12;
  int v13;
  uint64_t v14;
  CAStreamBasicDescription *v15;
  int v16;
  int v17;
  uint64_t v18;
  CAStreamBasicDescription *v19;
  unsigned __int8 v20;
  int v21;
  uint64_t v22;
  FILE *v23;
  const char *v24;
  size_t v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  double v33;
  int v34;
  int v35;
  int v36;
  unsigned __int8 v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  char *v44;
  int v45;
  char *v46;
  int v47;
  int v48;
  int v49;
  uint64_t result;
  int v51;
  int __c;

  if (*(_BYTE *)this == 45)
    v5 = (CAStreamBasicDescription *)((char *)this + 1);
  else
    v5 = this;
  v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    v7 = 2 * (*((_BYTE *)v5 + 1) == 69);
    i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      i = 12;
      goto LABEL_12;
    }
    v7 = 2 * (*((_BYTE *)v5 + 1) == 69);
    if (*((_BYTE *)v5 + 1) == 69)
      i = 14;
    else
      i = 12;
  }
  v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  v6 = *(unsigned __int8 *)v5;
LABEL_12:
  v9 = (FILE **)MEMORY[0x24BDAC8D8];
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      v10 = *((unsigned __int8 *)v5 + 1);
      v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      v6 = v10;
      break;
    case 'F':
      i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      v11 = (CAStreamBasicDescription *)((char *)v5 + 1);
      if (*((char *)v5 + 1) < 0)
      {
        v13 = 0;
      }
      else
      {
        v12 = *((unsigned __int8 *)v5 + 1);
        if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)v5 + 1) + 60) & 0x400) != 0)
        {
          v13 = 0;
          v11 = (CAStreamBasicDescription *)((char *)v5 + 2);
          while (1)
          {
            v13 = v12 + 10 * v13 - 48;
            if (*(char *)v11 < 0)
              break;
            v18 = *(unsigned __int8 *)v11;
            v12 = *(unsigned __int8 *)v11;
            v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
            if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v18 + 60) & 0x400) == 0)
            {
              v5 = (CAStreamBasicDescription *)((char *)v11 - 2);
              v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
              goto LABEL_33;
            }
          }
        }
        else
        {
          v13 = 0;
LABEL_33:
          if (v12 == 46)
          {
            v21 = *((char *)v5 + 2);
            v19 = (CAStreamBasicDescription *)((char *)v5 + 2);
            v20 = v21;
            if (v21 < 0 || (v22 = v20, (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v20 + 60) & 0x400) == 0))
            {
              v23 = (FILE *)*MEMORY[0x24BDAC8D8];
              v24 = "Expected fractional bits following '.'\n";
              v25 = 39;
LABEL_37:
              fwrite(v24, v25, 1uLL, v23);
              goto LABEL_101;
            }
            v29 = 0;
            v11 = v19;
            do
            {
              if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v22 + 60) & 0x400) == 0)
                break;
              v30 = *((char *)v11 + 1);
              v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
              v29 = 10 * v29 + v22 - 48;
              v22 = v30;
            }
            while ((v30 & 0x80000000) == 0);
            v13 += v29;
            i |= v29 << 7;
          }
        }
      }
      v28 = 1819304813;
      v26 = (v13 + 7) >> 3;
      if ((v13 & 7) != 0)
        i = i & 0xFFFFFFE7 | 0x10;
      v27 = 1;
      goto LABEL_50;
  }
  v14 = 0;
  __c = 538976288;
  v15 = this;
  v11 = this;
  while (1)
  {
    v17 = *(unsigned __int8 *)v11;
    v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    v16 = v17;
    if (v17 == 92)
    {
      if (*(_BYTE *)v11 != 120)
        return 0;
      v51 = 0;
      if (sscanf((const char *)v15 + 2, "%02X", &v51) != 1)
        return 0;
      *((_BYTE *)&__c + v14) = v51;
      v11 = (CAStreamBasicDescription *)((char *)v15 + 4);
      goto LABEL_26;
    }
    *((_BYTE *)&__c + v14) = v16;
    if (!v16)
      break;
LABEL_26:
    ++v14;
    v15 = v11;
    if (v14 == 4)
      goto LABEL_40;
  }
  if (v14 != 3)
    return 0;
  HIBYTE(__c) = 32;
  v11 = v15;
LABEL_40:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
  }
  i = 0;
  v26 = 0;
  v27 = 0;
  v13 = 0;
  v28 = bswap32(__c);
LABEL_50:
  v31 = *(unsigned __int8 *)v11;
  if (v31 != 64)
  {
    v33 = 0.0;
    goto LABEL_57;
  }
  v32 = *((char *)v11 + 1);
  v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  LOBYTE(v31) = v32;
  if (v32 < 0)
    goto LABEL_100;
  v33 = 0.0;
  while ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v31 + 60) & 0x400) != 0)
  {
    v33 = (double)(v31 - 48) + v33 * 10.0;
    v34 = *((char *)v11 + 1);
    v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    LOBYTE(v31) = v34;
    if (v34 < 0)
      goto LABEL_100;
  }
LABEL_57:
  if (v31 == 47)
  {
    for (i = 0; ; i = (v36 + v35) | (16 * i))
    {
      v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
      v35 = *(char *)v11;
      if ((v35 - 48) >= 0xA)
      {
        v31 = *(unsigned __int8 *)v11;
        if ((v31 - 65) >= 6)
        {
          if ((v31 - 97) > 5)
            break;
          v36 = -87;
        }
        else
        {
          v36 = -55;
        }
      }
      else
      {
        v36 = -48;
      }
    }
  }
  if (v31 != 35)
  {
    v37 = v31;
    v39 = v27;
    goto LABEL_73;
  }
  v38 = *((char *)v11 + 1);
  v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  v37 = v38;
  if (v38 < 0)
    goto LABEL_100;
  v39 = v27;
  while ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v37 + 60) & 0x400) != 0)
  {
    v39 = 10 * v39 + v37 - 48;
    v40 = *((char *)v11 + 1);
    v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    v37 = v40;
    if (v40 < 0)
      goto LABEL_100;
  }
LABEL_73:
  if (v37 != 58)
  {
LABEL_82:
    if (v37 != 44)
      goto LABEL_99;
    v44 = (char *)v11 + 1;
    v45 = *((unsigned __int8 *)v11 + 1);
    if ((*((char *)v11 + 1) & 0x80000000) == 0
      && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)v11 + 1) + 60) & 0x400) != 0)
    {
      v27 = 0;
      v46 = (char *)v11 + 2;
      do
      {
        v44 = v46;
        v27 = v45 + 10 * v27 - 48;
        v47 = *v46;
        v45 = v47;
        if (v47 < 0)
          break;
        v48 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v47 + 60);
        v46 = v44 + 1;
      }
      while ((v48 & 0x400) != 0);
      v11 = (CAStreamBasicDescription *)(v44 - 1);
    }
    else
    {
      v27 = 0;
    }
    if (v45 == 73)
    {
      v44 = (char *)v11 + 2;
    }
    else if (v45 == 68)
    {
      if (v28 != 1819304813)
      {
        v23 = *v9;
        v24 = "non-interleaved flag invalid for non-PCM formats\n";
        v25 = 49;
        goto LABEL_37;
      }
      v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
      i |= 0x20u;
LABEL_99:
      if (*(_BYTE *)v11)
        goto LABEL_100;
      *(double *)a2 = v33;
      *((_DWORD *)a2 + 2) = v28;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v26;
      *((_DWORD *)a2 + 5) = v39;
      *((_DWORD *)a2 + 6) = v26;
      *((_DWORD *)a2 + 7) = v27;
      result = 1;
      *((_DWORD *)a2 + 8) = v13;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v28 == 1819304813)
      v49 = v27;
    else
      v49 = 1;
    v26 *= v49;
    v11 = (CAStreamBasicDescription *)v44;
    goto LABEL_99;
  }
  i &= 0xFFFFFFE7;
  v41 = *((unsigned __int8 *)v11 + 1);
  if (v41 == 76)
    goto LABEL_77;
  if (v41 == 72)
  {
    i |= 0x10u;
LABEL_77:
    v42 = *((char *)v11 + 2);
    v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
    v37 = v42;
    if ((v42 & 0x80000000) == 0)
    {
      v26 = 0;
      while ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v37 + 60) & 0x400) != 0)
      {
        v43 = *((char *)v11 + 1);
        v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
        v26 = 10 * v26 + v37 - 48;
        v37 = v43;
        if (v43 < 0)
          goto LABEL_100;
      }
      goto LABEL_82;
    }
LABEL_100:
    fprintf(*v9, "extra characters at end of format string: %s\n", (const char *)v11);
  }
LABEL_101:
  fprintf(*v9, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, *v9);
  return 0;
}

double ASDT::ValueRange::PickCommonSampleRate(ASDT::ValueRange *this, const AudioValueRange *a2)
{
  double v2;
  double v3;
  double result;

  v3 = *(double *)this;
  v2 = *((double *)this + 1);
  result = 48000.0;
  if (*(double *)this > 48000.0 || v2 < 48000.0)
  {
    result = 44100.0;
    if (v3 > 44100.0 || v2 < 44100.0)
    {
      result = 96000.0;
      if (v3 > 96000.0 || v2 < 96000.0)
      {
        result = 88200.0;
        if (v3 > 88200.0 || v2 < 88200.0)
        {
          result = 64000.0;
          if (v3 > 64000.0 || v2 < 64000.0)
          {
            result = 32000.0;
            if (v3 > 32000.0 || v2 < 32000.0)
            {
              result = 24000.0;
              if (v3 > 24000.0 || v2 < 24000.0)
              {
                result = 22050.0;
                if (v3 > 22050.0 || v2 < 22050.0)
                {
                  result = 16000.0;
                  if (v3 > 16000.0 || v2 < 16000.0)
                  {
                    result = 12000.0;
                    if (v3 > 12000.0 || v2 < 12000.0)
                    {
                      result = 11025.0;
                      if (v3 > 11025.0 || v2 < 11025.0)
                      {
                        result = 8000.0;
                        if (v2 < 8000.0 || v3 > 8000.0)
                          return *((double *)this + 1);
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
  return result;
}

uint64_t ASDT::MachPort::CreatePort(ASDT::MachPort *this, integer_t a2)
{
  int v3;
  ipc_space_t *v4;
  uint64_t result;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out;
  mach_port_name_t name;

  v3 = (int)this;
  name = 0;
  v4 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    ASDT::MachPort::CreatePort();
    return 0;
  }
  if (a2)
  {
    port_info_outCnt = 1;
    if (mach_port_get_attributes(*v4, name, 1, &port_info_out, &port_info_outCnt))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::MachPort::CreatePort();
LABEL_15:
      mach_port_deallocate(*v4, name);
      return 0;
    }
    port_info_out = a2;
    if (MEMORY[0x23B802270](*v4, name, 1, &port_info_out, 1))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::MachPort::CreatePort();
      goto LABEL_15;
    }
  }
  if (v3 && mach_port_insert_right(*v4, name, name, 0x14u))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::MachPort::CreatePort();
    goto LABEL_15;
  }
  return name;
}

uint64_t ASDT::MachPort::LookupPort(ASDT::MachPort *this, const char *a2)
{
  if (bootstrap_look_up2())
    return 0;
  else
    return 0;
}

uint64_t ASDT::MachPort::CheckInPort(ASDT::MachPort *this, const char *a2)
{
  int v2;
  uint64_t result;
  mach_port_t sp;

  v2 = (int)a2;
  sp = 0;
  if (bootstrap_check_in(*MEMORY[0x24BDAD2F0], (const char *)this, &sp))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    ASDT::MachPort::CheckInPort();
    return 0;
  }
  if (!v2 || !mach_port_insert_right(*MEMORY[0x24BDAEC58], sp, sp, 0x14u))
    return sp;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    ASDT::MachPort::CheckInPort();
    return 0;
  }
  return result;
}

void ASDT::MachPort::RetainPort(mach_port_name_t name)
{
  if (name
    && mach_port_mod_refs(*MEMORY[0x24BDAEC58], name, 0, 1)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::MachPort::RetainPort();
  }
}

uint64_t ASDT::MachPort::DestroyPort(uint64_t name, int a2, int a3)
{
  mach_port_name_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = name;
  if ((a2 & 1) == 0 && (a3 & 1) == 0)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      ASDT::MachPort::DestroyPort(v5, v6, v7, v8, v9, v10, v11, v12);
    __assert_rtn("DestroyPort", "ASDTMachPort.cpp", 179, "(inDestroySendRight || inDestroyReceiveRight)");
  }
  if ((_DWORD)name)
  {
    if (a2)
    {
      name = mach_port_deallocate(*MEMORY[0x24BDAEC58], name);
      if ((_DWORD)name)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ASDT::MachPort::DestroyPort();
        __assert_rtn("DestroyPort", "ASDTMachPort.cpp", 187, "(theError == 0)");
      }
    }
    if (a3)
      return mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
  }
  return name;
}

uint64_t ASDT::MachPort::ReceiveMessage(mach_port_name_t rcv_name, mach_msg_size_t rcv_size, mach_msg_header_t *msg, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  mach_msg_option_t v6;
  uint64_t v8;

  if (!rcv_name)
    return 268451842;
  if ((_DWORD)a4)
    v6 = 258;
  else
    v6 = 2;
  if (!(_DWORD)a4)
    a5 = 0;
  *(_QWORD *)&msg->msgh_bits = 0;
  *(_QWORD *)&msg->msgh_remote_port = 0;
  *(_QWORD *)&msg->msgh_voucher_port = 0;
  v8 = mach_msg(msg, v6, 0, rcv_size, rcv_name, a5, 0);
  if ((_DWORD)v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ASDT::MachPort::ReceiveMessage(v8);
  return v8;
}

uint64_t ASDT::MachPort::ReceiveSimpleMessage(ASDT::MachPort *this, mach_msg_id_t *a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  uint64_t result;
  mach_msg_header_t v6;

  result = ASDT::MachPort::ReceiveMessage((mach_port_name_t)this, 0x20u, &v6, a3, a4);
  if (!(_DWORD)result)
    *a2 = v6.msgh_id;
  return result;
}

uint64_t ASDT::MachPort::SendMessage(ASDT::MachPort *this, mach_msg_size_t send_size, mach_msg_header_t *msg, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  mach_msg_option_t v7;
  uint64_t v9;

  if (!(_DWORD)this)
    return 0;
  msg->msgh_bits = 19;
  msg->msgh_size = send_size;
  msg->msgh_local_port = 0;
  msg->msgh_voucher_port = 0;
  if ((_DWORD)a4)
    v7 = 17;
  else
    v7 = 1;
  if (!(_DWORD)a4)
    a5 = 0;
  msg->msgh_remote_port = this;
  v9 = mach_msg(msg, v7, send_size, 0, 0, a5, 0);
  if ((_DWORD)v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      ASDT::MachPort::SendMessage(v9);
    if ((msg->msgh_bits & 0x1F) != 0x13)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], msg->msgh_remote_port);
  }
  return v9;
}

uint64_t ASDT::MachPort::SendSimpleMessage(ASDT::MachPort *this, mach_msg_id_t a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  mach_msg_header_t msg;

  msg.msgh_id = a2;
  return ASDT::MachPort::SendMessage(this, 0x18u, &msg, a3, a4);
}

{
  ASDT::MachPort *v4;
  mach_msg_header_t msg;

  v4 = (ASDT::MachPort *)*((unsigned int *)this + 2);
  msg.msgh_id = a2;
  return ASDT::MachPort::SendMessage(v4, 0x18u, &msg, a3, a4);
}

uint64_t ASDT::MachPort::SendMessageWithReply(ASDT::MachPort *this, mach_port_name_t rcv_name, mach_msg_size_t a3, mach_msg_size_t a4, mach_msg_header_t *msg, mach_msg_header_t *a6, mach_msg_timeout_t a7)
{
  uint64_t v7;
  mach_msg_option_t v10;

  v7 = 0;
  if ((_DWORD)this && rcv_name)
  {
    msg->msgh_bits = 19;
    msg->msgh_size = a3;
    msg->msgh_local_port = 0;
    msg->msgh_voucher_port = 0;
    if ((_DWORD)a6)
      v10 = 275;
    else
      v10 = 3;
    if (!(_DWORD)a6)
      a7 = 0;
    msg->msgh_remote_port = this;
    v7 = mach_msg(msg, v10, a3, a4, rcv_name, a7, 0);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        ASDT::MachPort::SendMessageWithReply(v7);
      if ((msg->msgh_bits & 0x1F) != 0x13)
        mach_port_deallocate(*MEMORY[0x24BDAEC58], msg->msgh_remote_port);
    }
  }
  return v7;
}

uint64_t ASDT::MachPort::SendSimpleMessageWithSimpleReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_id_t a3, mach_msg_id_t *a4, mach_msg_header_t *a5, mach_msg_timeout_t a6)
{
  uint64_t result;
  mach_msg_header_t v8;

  v8.msgh_id = a3;
  result = ASDT::MachPort::SendMessageWithReply(this, a2, 0x18u, 0x20u, &v8, a5, a6);
  if (!(_DWORD)result)
    *a4 = v8.msgh_id;
  return result;
}

void ASDT::MachPort::ClearNotificationHandler(ASDT::MachPort *this)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;
  NSObject *v5;
  _QWORD handler[5];

  if (*((_QWORD *)this + 4))
  {
    v2 = dispatch_semaphore_create(0);
    v3 = *((_QWORD *)this + 4);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ___ZN4ASDT8MachPort24ClearNotificationHandlerEv_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = v2;
    dispatch_source_set_cancel_handler(v3, handler);
    dispatch_source_cancel(*((dispatch_source_t *)this + 4));
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v2);
    dispatch_release(*((dispatch_object_t *)this + 4));
    *((_QWORD *)this + 4) = 0;
  }
  v4 = (const void *)*((_QWORD *)this + 2);
  if (v4)
  {
    _Block_release(v4);
    *((_QWORD *)this + 2) = 0;
  }
  v5 = *((_QWORD *)this + 3);
  if (v5)
  {
    dispatch_release(v5);
    *((_QWORD *)this + 3) = 0;
  }
}

intptr_t ___ZN4ASDT8MachPort24ClearNotificationHandlerEv_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ASDT::MachPort::SetNotificationQueue(const void **a1, uint64_t a2)
{
  uint64_t v4;
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

  if (*(_QWORD *)a2)
  {
    if (a1[4])
    {
      *(_QWORD *)(a2 + 8) = _Block_copy(a1[2]);
      (*((void (**)(const void **))*a1 + 4))(a1);
      v4 = (*((uint64_t (**)(const void **, uint64_t))*a1 + 2))(a1, a2);
      _Block_release(*(const void **)(a2 + 8));
      return v4;
    }
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      ASDT::MachPort::SetNotificationQueue(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      ASDT::MachPort::SetNotificationQueue(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0;
}

BOOL ASDT::MachPort::SetNotificationHandler(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(_DWORD *)(a1 + 8))
    v2 = *(_QWORD *)a2 == 0;
  else
    v2 = 1;
  if (v2 || !*(_QWORD *)(a2 + 8))
    return 0;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  v5 = dispatch_source_create(MEMORY[0x24BDAC9E0], *(unsigned int *)(a1 + 8), 0, *(dispatch_queue_t *)a2);
  *(_QWORD *)(a1 + 32) = v5;
  if (v5)
  {
    v6 = _Block_copy(*(const void **)(a2 + 8));
    v7 = *(NSObject **)a2;
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v7;
    dispatch_retain(v7);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 32), *(dispatch_block_t *)(a2 + 8));
    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::MachPort::SetNotificationHandler(result, v9, v10, v11, v12, v13, v14, v15);
    return 0;
  }
  return result;
}

void ASDT::MachPort::~MachPort(ASDT::MachPort *this)
{
  ASDT::MachPort::~MachPort(this);
  JUMPOUT(0x23B801FF4);
}

{
  *(_QWORD *)this = &off_250842050;
  ASDT::MachPort::ClearNotificationHandler(this);
  ASDT::MachPort::DestroyPort(*((unsigned int *)this + 2), *((unsigned __int8 *)this + 12), *((unsigned __int8 *)this + 13));
}

uint64_t ASDT::MachPort::ReceiveMessage(ASDT::MachPort *this, mach_msg_size_t a2, mach_msg_header_t *a3, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  return ASDT::MachPort::ReceiveMessage(*((_DWORD *)this + 2), a2, a3, a4, a5);
}

uint64_t ASDT::MachPort::ReceiveSimpleMessage(ASDT::MachPort *this, int *a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  uint64_t result;
  mach_msg_header_t v6;

  result = ASDT::MachPort::ReceiveMessage(*((_DWORD *)this + 2), 0x20u, &v6, a3, a4);
  if (!(_DWORD)result)
    *a2 = v6.msgh_id;
  return result;
}

uint64_t ASDT::MachPort::SendMessage(ASDT::MachPort *this, mach_msg_size_t a2, mach_msg_header_t *a3, mach_msg_header_t *a4, mach_msg_timeout_t a5)
{
  return ASDT::MachPort::SendMessage((ASDT::MachPort *)*((unsigned int *)this + 2), a2, a3, a4, a5);
}

uint64_t ASDT::MachPort::SendMessageWithReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_size_t a3, mach_msg_size_t a4, mach_msg_header_t *a5, mach_msg_header_t *a6, mach_msg_timeout_t a7)
{
  return ASDT::MachPort::SendMessageWithReply((ASDT::MachPort *)*((unsigned int *)this + 2), a2, a3, a4, a5, a6, a7);
}

uint64_t ASDT::MachPort::SendSimpleMessageWithSimpleReply(ASDT::MachPort *this, mach_port_name_t a2, mach_msg_id_t a3, int *a4, mach_msg_header_t *a5, mach_msg_timeout_t a6)
{
  ASDT::MachPort *v7;
  uint64_t result;
  mach_msg_header_t v9;

  v7 = (ASDT::MachPort *)*((unsigned int *)this + 2);
  v9.msgh_id = a3;
  result = ASDT::MachPort::SendMessageWithReply(v7, a2, 0x18u, 0x20u, &v9, a5, a6);
  if (!(_DWORD)result)
    *a4 = v9.msgh_id;
  return result;
}

void OUTLINED_FUNCTION_1_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

char *OUTLINED_FUNCTION_10_0(mach_error_t error_value)
{
  return mach_error_string(error_value);
}

void CACFDictionary::CACFDictionary(CACFDictionary *this, const void *a2)
{
  *((_BYTE *)this + 9) = 0;
}

{
  *((_BYTE *)this + 9) = 0;
}

BOOL CACFDictionary::HasKey(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(*this, a2) != 0;
}

const __CFDictionary *CACFDictionary::Size(const __CFDictionary **this)
{
  const __CFDictionary *result;

  result = *this;
  if (result)
    return (const __CFDictionary *)CFDictionaryGetCount(result);
  return result;
}

void CACFDictionary::GetKeys(CFDictionaryRef *this, const void **a2)
{
  CFDictionaryGetKeysAndValues(*this, a2, 0);
}

void CACFDictionary::GetKeysAndValues(CFDictionaryRef *this, const void **a2, const void **a3)
{
  CFDictionaryGetKeysAndValues(*this, a2, a3);
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  uint64_t result;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeID v8;
  BOOL v9;
  int valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFBoolean *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFBooleanGetTypeID())
      {
        v7 = CFBooleanGetValue(v5) == 0;
      }
      else
      {
        v8 = CFGetTypeID(v5);
        if (v8 != CFNumberGetTypeID())
          return 0;
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        v7 = valuePtr == 0;
      }
      v9 = !v7;
      *a3 = v9;
      return 1;
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetCFType(const __CFDictionary **this, const __CFString *a2, const void **a3)
{
  const __CFDictionary *result;
  const void *Value;

  result = *this;
  if (result)
  {
    Value = CFDictionaryGetValue(result, a2);
    *a3 = Value;
    return (const __CFDictionary *)(Value != 0);
  }
  return result;
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetSInt64(CACFDictionary *this, const __CFString *a2, uint64_t *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32FromString(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;
  float DoubleValue;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        DoubleValue = CFStringGetDoubleValue(v5);
        *a3 = DoubleValue;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32FromString(CACFDictionary *this, const __CFString *a2, SInt32 *a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = CFStringGetIntValue(v5);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  float v7;
  int valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        v7 = 1.0;
        if (valuePtr < 0)
          v7 = -1.0;
        *a3 = v7
            * (float)((float)((float)(unsigned __int16)(valuePtr * (int)v7) * 0.000015259)
                    + (float)(((valuePtr * (int)v7) >> 16) & 0x7FFF));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        *a3 = (double)valuePtr * 2.32830644e-10 + (double)(valuePtr >> 32);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::Get4CC(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  CFTypeID v7;
  char buffer[4];

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, buffer, 5, 0x600u);
        *a3 = bswap32(*(unsigned int *)buffer);
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  uint64_t result;
  const __CFArray *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFArray *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFArrayGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  uint64_t result;
  const __CFDictionary *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFDictionary *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDictionaryGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetData(CACFDictionary *this, const __CFString *a2, const __CFData **a3)
{
  uint64_t result;
  const __CFData *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFData *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDataGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetURL(CACFDictionary *this, const __CFString *a2, const __CFURL **a3)
{
  uint64_t result;
  const __CFURL *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFURL *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFURLGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFDictionary::GetCFTypeWithCStringKey(CFDictionaryRef *this, const char *a2, const void **a3)
{
  CFStringRef v5;
  const void *Value;
  _BOOL8 v7;
  CFStringRef v9;
  char v10;

  if (!*this)
    return 0;
  v5 = CFStringCreateWithCString(0, a2, 0x600u);
  v9 = v5;
  v10 = 1;
  if (v5 && *this)
  {
    Value = CFDictionaryGetValue(*this, v5);
    *a3 = Value;
    v7 = Value != 0;
  }
  else
  {
    v7 = 0;
  }
  CACFString::~CACFString((CACFString *)&v9);
  return v7;
}

void sub_236D00CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

const __CFDictionary *CACFDictionary::GetCACFString(const __CFDictionary **this, const __CFString *key, CFTypeRef *a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  if (*a3)
  {
    if (*((_BYTE *)a3 + 8))
      CFRelease(*a3);
    *a3 = 0;
  }
  *((_BYTE *)a3 + 8) = 1;
  result = *this;
  if (*this)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFString::operator=((uint64_t)a3, v7);
    }
  }
  return result;
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

const __CFDictionary *CACFDictionary::GetCACFArray(const __CFDictionary **this, const __CFString *a2, CACFArray *a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  CACFArray::operator=((uint64_t)a3, 0);
  result = *this;
  if (*this)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
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

const __CFDictionary *CACFDictionary::GetCACFDictionary(const __CFDictionary **this, const __CFString *a2, CACFDictionary *a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  CACFArray::operator=((uint64_t)a3, 0);
  result = *this;
  if (*this)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFDictionaryGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *key, int a3)
{
  const void **v5;
  const void *v6;
  __CFDictionary *v7;
  BOOL v8;
  uint64_t v9;
  const void *v11;
  char v12;

  v5 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v5 = (const void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  v11 = v6;
  v12 = 1;
  if (v6)
    CFRetain(v6);
  if (!*((_BYTE *)this + 9) || ((v7 = *(__CFDictionary **)this, v6) ? (v8 = v7 == 0) : (v8 = 1), v8))
  {
    v9 = 0;
  }
  else
  {
    CFDictionarySetValue(v7, key, v6);
    v9 = 1;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v9;
}

void sub_236D00FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddCFType(CACFDictionary *this, const __CFString *a2, const void *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddSInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D010DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D0117C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddSInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D0121C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D012BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat32(CFMutableDictionaryRef *this, const __CFString *a2, float a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  float valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D0135C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat64(CFMutableDictionaryRef *this, const __CFString *a2, double a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  double valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_236D013FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddNumber(CACFDictionary *this, const __CFString *a2, const __CFNumber *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddData(CACFDictionary *this, const __CFString *a2, const __CFData *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddURL(CACFDictionary *this, const __CFString *a2, const __CFURL *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddCFTypeWithCStringKey(CFMutableDictionaryRef *this, const char *a2, const void *a3)
{
  CFStringRef v5;
  uint64_t v6;
  CFStringRef v8;
  char v9;

  if (!a2)
    return 0;
  v5 = CFStringCreateWithCString(0, a2, 0x600u);
  v8 = v5;
  v9 = 1;
  if (v5 && *((_BYTE *)this + 9))
  {
    v6 = 0;
    if (a3 && *this)
    {
      CFDictionarySetValue(*this, v5, a3);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_236D01624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddCString(CFMutableDictionaryRef *this, const __CFString *a2, const char *cStr)
{
  CFStringRef v5;
  uint64_t v6;
  CFStringRef v8;
  char v9;

  if (!cStr)
    return 0;
  v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  v8 = v5;
  v9 = 1;
  if (v5 && *((_BYTE *)this + 9) && *this)
  {
    CFDictionarySetValue(*this, a2, v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_236D016C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

void CACFDictionary::PrintToLog(CACFDictionary *this, const __CFString *a2)
{
  CFIndex Count;
  CFIndex v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString **v8;
  size_t v9;
  CFTypeRef *v10;
  CFTypeID v11;
  unsigned int v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  Count = CFDictionaryGetCount(this);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 8 * Count;
    MEMORY[0x24BDAC7A8]();
    v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    v8 = (const __CFString **)((char *)v13 - v7);
    if (v6 >= 0x200)
      v9 = 512;
    else
      v9 = v6;
    bzero((char *)v13 - v7, v9);
    MEMORY[0x24BDAC7A8]();
    v10 = (CFTypeRef *)((char *)v13 - v7);
    bzero((char *)v13 - v7, v9);
    CFDictionaryGetKeysAndValues(this, (const void **)((char *)v13 - v7), (const void **)((char *)v13 - v7));
    do
    {
      CACFString::PrintToLog(*v8, a2);
      v11 = CFGetTypeID(*v10);
      if (v11 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)*v10, (const __CFBoolean *)((_DWORD)a2 + 1));
      }
      else if (v11 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)*v10, (const __CFNumber *)((_DWORD)a2 + 1));
      }
      else if (v11 == CFStringGetTypeID())
      {
        CACFString::PrintToLog((const __CFString *)*v10, (const __CFString *)((_DWORD)a2 + 1));
      }
      else if (v11 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)*v10, (const __CFDictionary *)((_DWORD)a2 + 1), v12);
      }
      else if (v11 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)*v10, (const __CFArray *)((_DWORD)a2 + 1));
      }
      ++v10;
      ++v8;
      --v5;
    }
    while (v5);
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

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
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

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

void sub_236D0441C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D04590(_Unwind_Exception *a1)
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

void sub_236D04614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTSystemPowerNotifier;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D04880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ASDTSystemPowerInterestCallback(void *a1, unsigned int a2, uint64_t a3, void *a4)
{
  void *v7;

  v7 = (void *)MEMORY[0x23B8022E8]();
  objc_msgSend(a1, "handlePowerNotificationWithMessageType:andArgument:", a3, a4);
  objc_autoreleasePoolPop(v7);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t ASDT::Clock::GetMachTimeMaxDrift(ASDT::Clock *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result;
  unsigned int v5;

  v5 = 100;
  if (ASDT::IORegistry::GetUInt32tForKey((UInt8 *)&v5, (ASDT::IORegistry *)"mach-time-audio-max-drift", (_anonymous_namespace_ *)"IODeviceTree:/product/audio", a4))
  {
    result = v5;
  }
  else
  {
    result = 100;
  }
  return result;
}

uint64_t ASDT::Clock::GetSynchronousClockDomain(ASDT::Clock *this, uint64_t a2, uint64_t a3, const char *a4)
{
  int v4;
  _BOOL4 UInt32tForKey;
  unsigned int v6;
  int v8;

  {
  }
  else
  {
    v8 = 0;
    UInt32tForKey = ASDT::IORegistry::GetUInt32tForKey((UInt8 *)&v8, (ASDT::IORegistry *)"mach-time-audio-alignment", (_anonymous_namespace_ *)"IODeviceTree:/product/audio", a4);
    if (v8)
      v4 = 2;
    else
      v4 = 1;
    if (!UInt32tForKey)
      v4 = 0;
  }
  if (v4 == 2)
    v6 = 7567731;
  else
    v6 = 1228034925;
  if (v4 == 1)
    return 1835100526;
  else
    return v6;
}

uint64_t ASDT::Clock::GetDomainForFourCC(uint64_t this, const char *a2, uint64_t a3, const char *a4)
{
  uint64_t v4;
  uint64_t v5;

  if (this)
  {
    v4 = this;
    v5 = 0;
    this = 0;
    do
    {
      if (!*(_BYTE *)(v4 + v5))
        break;
      this = *(unsigned __int8 *)(v4 + v5++) | ((_DWORD)this << 8);
    }
    while ((_DWORD)v5 != 4);
    if ((_DWORD)this == 1937337955)
      return ASDT::Clock::GetSynchronousClockDomain((ASDT::Clock *)this, (uint64_t)a2, a3, a4);
  }
  return this;
}

const __CFString *CACFString::GetStringByteLength(const __CFString *this, const __CFString *a2)
{
  CFStringEncoding v2;
  const __CFString *v3;
  CFIndex usedBufLen;
  CFRange v5;

  usedBufLen = 0;
  if (this)
  {
    v2 = a2;
    v3 = this;
    v5.length = CFStringGetLength(this);
    v5.location = 0;
    CFStringGetBytes(v3, v5, v2, 0, 0, 0, 0x7FFFFFFFLL, &usedBufLen);
    return (const __CFString *)usedBufLen;
  }
  return this;
}

const __CFString *CACFString::GetCString(const __CFString *theString, __CFString *a2, char *a3, unsigned int *a4)
{
  const __CFString *v6;
  CFStringEncoding v7;
  int v8;
  int v9;
  CFIndex usedBufLen;
  CFRange v11;

  if (*(_DWORD *)a3)
  {
    v6 = theString;
    if (theString)
    {
      v7 = a4;
      usedBufLen = 0;
      v11.length = CFStringGetLength(theString);
      v11.location = 0;
      theString = (const __CFString *)CFStringGetBytes(v6, v11, v7, 0, 0, (UInt8 *)a2, (*(_DWORD *)a3 - 1), &usedBufLen);
      v8 = usedBufLen;
      *((_BYTE *)&a2->isa + usedBufLen) = 0;
      v9 = v8 + 1;
    }
    else
    {
      LOBYTE(a2->isa) = 0;
      v9 = 1;
    }
    *(_DWORD *)a3 = v9;
  }
  return theString;
}

void CACFString::GetUnicodeString(CFStringRef theString, __CFString *a2, unsigned __int16 *a3, unsigned int *a4)
{
  CFIndex Length;
  CFIndex v8;
  CFRange v9;

  if (*(_DWORD *)a3)
  {
    if (theString)
    {
      Length = CFStringGetLength(theString);
      if (*(_DWORD *)a3 >= Length)
        v8 = Length;
      else
        v8 = *(unsigned int *)a3;
      v9.location = 0;
      v9.length = v8;
      CFStringGetCharacters(theString, v9, (UniChar *)a2);
    }
    else
    {
      LODWORD(v8) = 0;
      LOWORD(a2->isa) = 0;
    }
    *(_DWORD *)a3 = v8;
  }
}

void CACFString::PrintToLog(const __CFString *this, const __CFString *a2)
{
  uint64_t v2;
  int v3;
  _OWORD *v4;
  __int16 v5;
  char *v6;
  _OWORD __b[16];
  char buffer[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  LODWORD(v2) = (_DWORD)a2;
  v40 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)buffer = 0u;
  v9 = 0u;
  memset(__b, 0, sizeof(__b));
  if (CFStringGetCString(this, buffer, 512, 0x600u))
  {
    if ((_DWORD)v2)
    {
      v2 = v2;
      memset(__b, 9, v2);
    }
    else
    {
      v2 = 0;
    }
    *((_BYTE *)__b + v2) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315394;
      v4 = __b;
      v5 = 2080;
      v6 = buffer;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " %s%s", (uint8_t *)&v3, 0x16u);
    }
  }
}

void sub_236D0573C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D058A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_236D0597C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D05BFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_236D05EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D05F50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D05FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D06168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D06220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D062B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D0651C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_236D065EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D06660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D066C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D0671C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D06764(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D067CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D06834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D06898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t asdtPowerTransitionForStateChange(int a1, int a2)
{
  if (a2 > 1886876268)
  {
    switch(a2)
    {
      case 1886876269:
        if (a1 <= 1886413169)
          goto LABEL_21;
        if (a1 != 1886413170)
        {
LABEL_26:
          if (a1 != 1920298606)
            goto LABEL_27;
          return 1685092205;
        }
        break;
      case 1936483696:
        if (a1 <= 1886876268)
        {
          if (a1 == 1768189029)
            return 1685286000;
          goto LABEL_37;
        }
        if (a1 == 1886876269)
          return 1685090418;
        if (a1 == 1920298606)
          return 1685092205;
        return 0;
      case 1920298606:
        if (a1 <= 1886413169)
          goto LABEL_21;
        if (a1 != 1886413170)
        {
          if (a1 == 1886876269)
            return 1970435438;
LABEL_27:
          if (a1 == 1936483696)
            return 1937008996;
          return 0;
        }
        break;
      default:
        return 0;
    }
    return 1970304877;
  }
  if (!a2)
  {
    switch(a1)
    {
      case 1886413170:
        return 1684628588;
      case 1920298606:
        return 1685092205;
      case 1886876269:
        return 1685090418;
    }
    return 0;
  }
  if (a2 == 1768189029)
  {
    if (a1 > 1886876268)
    {
LABEL_25:
      if (a1 != 1886876269)
        goto LABEL_26;
      return 1685090418;
    }
    if (!a1)
      return 1970563428;
LABEL_37:
    if (a1 != 1886413170)
      return 0;
    return 1684628588;
  }
  if (a2 != 1886413170)
    return 0;
  if (a1 > 1886876268)
    goto LABEL_25;
LABEL_21:
  if (a1)
  {
    if (a1 == 1768189029)
      return 1970303090;
    return 0;
  }
  return 1970563428;
}

uint64_t asdtNextPowerState(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = a1;
  v3 = asdtPowerTransitionForStateChange(a1, a2);
  if (v3 > 1937008995)
  {
    if (v3 > 1970304876)
    {
      if (v3 != 1970304877)
      {
        if (v3 == 1970435438)
          return 1920298606;
        if (v3 != 1970563428)
          return v2;
        return 1768189029;
      }
      return 1886876269;
    }
    if (v3 != 1937008996)
    {
      v4 = 1970303090;
LABEL_12:
      if (v3 == v4)
        return 1886413170;
      return v2;
    }
    return 1768189029;
  }
  if (v3 <= 1685092204)
  {
    if (v3 != 1684628588)
    {
      v4 = 1685090418;
      goto LABEL_12;
    }
    return 1768189029;
  }
  if (v3 == 1685092205)
    return 1886876269;
  if (v3 == 1685286000)
    return 1936483696;
  return v2;
}

uint64_t asdtPowerTransitionUpwards(int a1)
{
  uint64_t result;
  int v3;

  result = 1;
  if (a1 <= 1685090417)
  {
    if (a1)
    {
      v3 = 1684628588;
LABEL_7:
      if (a1 != v3)
        return result;
    }
  }
  else if (a1 != 1685090418 && a1 != 1685286000)
  {
    v3 = 1685092205;
    goto LABEL_7;
  }
  return 0;
}

uint64_t asdtPowerStateCompare(int a1, int a2)
{
  uint64_t result;
  int v3;

  result = asdtPowerTransitionForStateChange(a1, a2);
  if ((int)result <= 1685090417)
  {
    if (!(_DWORD)result)
      return result;
    v3 = 1684628588;
    goto LABEL_7;
  }
  if ((_DWORD)result != 1685090418 && (_DWORD)result != 1685092205)
  {
    v3 = 1685286000;
LABEL_7:
    if ((_DWORD)result != v3)
      return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t asdtPowerTransitionsInOrder(int a1, int a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  int v10;

  v3 = 1;
  if (a1 <= 1685090417)
  {
    if (a1)
    {
      v4 = 1684628588;
LABEL_7:
      if (a1 != v4)
        goto LABEL_9;
    }
  }
  else if (a1 != 1685090418 && a1 != 1685286000)
  {
    v4 = 1685092205;
    goto LABEL_7;
  }
  v3 = 0;
LABEL_9:
  v5 = 1;
  if (a2 <= 1685090417)
  {
    if (a2)
    {
      v6 = 1684628588;
LABEL_15:
      if (a2 != v6)
        goto LABEL_17;
    }
  }
  else if (a2 != 1685090418 && a2 != 1685286000)
  {
    v6 = 1685092205;
    goto LABEL_15;
  }
  v5 = 0;
LABEL_17:
  v7 = asdtPowerTransitionIndex(a1);
  v8 = asdtPowerTransitionIndex(a2);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = v3 ^ v5;
  if (v9)
    v10 = 1;
  return (v7 <= v8) & ~v10;
}

uint64_t asdtPowerTransitionIndex(int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;

  if (a1 == 1970435438)
    v1 = 4;
  else
    v1 = a1 == 1970563428;
  if (a1 == 1970304877)
    v2 = 3;
  else
    v2 = v1;
  if (a1 == 1970303090)
    v3 = 2;
  else
    v3 = 0;
  if (a1 == 1937008996)
    v4 = 1;
  else
    v4 = v3;
  if (a1 <= 1970304876)
    v5 = v4;
  else
    v5 = v2;
  if (a1 == 1685286000)
    v6 = 4;
  else
    v6 = 0;
  if (a1 == 1685092205)
    v7 = 1;
  else
    v7 = v6;
  if (a1 == 1685090418)
    v8 = 2;
  else
    v8 = 0;
  if (a1 == 1684628588)
    v9 = 3;
  else
    v9 = v8;
  if (a1 <= 1685092204)
    v10 = v9;
  else
    v10 = v7;
  if (a1 <= 1937008995)
    return v10;
  else
    return v5;
}

void sub_236D07708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D07BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D08270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_236D08448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D08664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D08808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D08C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D092B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_236D094C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D09570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D098C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_236D09B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_236D09C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D09EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D0A270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D0A388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D0A634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0A6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D0AC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_236D0B114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_236D0B298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D0B4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  void *v19;
  void *v20;
  void *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_236D0B618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0B6B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0B76C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D0B9CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0BC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0BDC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D0BE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D0C1C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0C3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D0C4E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D0C5D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0C71C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D0CA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_236D0CF78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D0CFE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D0D0D0(_Unwind_Exception *a1)
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

void sub_236D0D1E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D0D244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTUserActivityNotifier;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D0D2CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D0D518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  void *v15;

  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236D0D5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id ASDT::Acoustic::SpeakerThieleSmallV2::asDictionary(ASDT::Acoustic::SpeakerThieleSmallV2 *this)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1036831949;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*(unsigned __int16 *)this, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, kASDTAcousticKeySpeakerThieleSmallFs);

  LODWORD(v5) = 981668463;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 1), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, kASDTAcousticKeySpeakerThieleSmallQts);

  LODWORD(v7) = 981668463;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 2), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, kASDTAcousticKeySpeakerThieleSmallRe);

  LODWORD(v9) = 1008981770;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 3), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, kASDTAcousticKeySpeakerThieleSmallT);

  LODWORD(v11) = 1008981770;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 4), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v12, kASDTAcousticKeySpeakerThieleSmallLe);

  LODWORD(v13) = 1.0;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 5), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v14, kASDTAcousticKeySpeakerThieleSmallKms);

  LODWORD(v15) = 953267991;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 6), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v16, kASDTAcousticKeySpeakerThieleSmallMms);

  LODWORD(v17) = 953267991;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 7), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v18, kASDTAcousticKeySpeakerThieleSmallBI);

  LODWORD(v19) = 981668463;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*((unsigned __int16 *)this + 8), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v20, kASDTAcousticKeySpeakerThieleSmallRms);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)this + 18));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v21, kASDTAcousticKeySpeakerThieleSmallDataSourceID);

  v22 = (void *)objc_msgSend(v2, "copy");
  return v22;
}

void sub_236D0DEB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(unsigned __int8 *a1)
{
  unsigned int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  ASDT::Acoustic::SpeakerThieleSmallV2 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v11[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a1[3];
  if (!a1[3])
    v2 = (((((unint64_t)a1[2] - 6) * (unsigned __int128)0x2E8BA2E8BA2E8BA3uLL) >> 64) >> 2);
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v5 = 0;
    v6 = (ASDT::Acoustic::SpeakerThieleSmallV2 *)(a1 + 4);
    v7 = MEMORY[0x24BDACB70];
    do
    {
      ASDT::Acoustic::SpeakerThieleSmallV2::asDictionary(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(v11, v5, &v12);
      objc_msgSend(v4, "addObject:", v8);

      ++v5;
      v6 = (ASDT::Acoustic::SpeakerThieleSmallV2 *)((char *)v6 + 22);
    }
    while (v3 != v5);
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

void sub_236D0E048(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

BOOL ASDT::Acoustic::Base::valid(ASDT::Acoustic::Base *this, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7;
  _BOOL8 result;
  uint64_t v9;
  unint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned __int8 v22;
  int v23;
  ASDT::Acoustic::Base *v24;
  ASDT::Acoustic::Base *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a3 + 6 > a2 || (v7 = *((unsigned __int8 *)this + 2), v7 < a3))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ASDT::Acoustic::Base::valid((uint64_t)this, a2, v9);
    return 0;
  }
  if (*(unsigned __int16 *)this == (_DWORD)a4)
  {
    v11 = *((unsigned __int8 *)this + 3);
    if (v7 == a2 || (_DWORD)v11 == 0)
    {
      if (v7 != a2 || (v7 - 6) % a3)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          ASDT::Acoustic::Base::valid();
          return 0;
        }
        return result;
      }
      if (*((_BYTE *)this + 3))
        v13 = *((_BYTE *)this + 3);
      else
        v13 = (v7 - 6) / a3;
    }
    else
    {
      v20 = (a2 - 6) / a3;
      if (v20 != v11 || a2 - 6 != v20 * a3)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          ASDT::Acoustic::Base::valid();
          return 0;
        }
        return result;
      }
      v13 = *((_BYTE *)this + 3);
      if (v7 != a3)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          ASDT::Acoustic::Base::valid((unsigned __int8 *)this + 2, a3, v35);
          return 0;
        }
        return result;
      }
    }
    v22 = v13 * a3 + 4;
    if (v13 * (_BYTE)a3 == 0xFC)
    {
      v23 = 0;
    }
    else
    {
      v23 = 0;
      v24 = (ASDT::Acoustic::Base *)((char *)this + v22);
      v25 = this;
      do
      {
        v26 = *(unsigned __int8 *)v25;
        v25 = (ASDT::Acoustic::Base *)((char *)v25 + 1);
        v23 += v26;
      }
      while (v25 < v24);
    }
    v27 = -v23;
    if (!*((_BYTE *)this + 3))
      v11 = (v7 - 6) / a3;
    v28 = *(unsigned __int16 *)((char *)this + (v11 * a3 + 4));
    if ((_DWORD)v28 == (unsigned __int16)v27)
      return 1;
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      ASDT::Acoustic::Base::valid(v28, (unsigned __int16)v27, v29, v30, v31, v32, v33, v34);
      return 0;
    }
    return result;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::Acoustic::Base::valid((uint64_t)this, a4, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_1_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

id ASDT::Acoustic::TrimGainV2::asDictionary(ASDT::Acoustic::TrimGainV2 *this)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1036831949;
  ASDT::Acoustic::scaledValue((ASDT::Acoustic *)*(__int16 *)this, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, kASDTAcousticKeyTrimGainDb);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)((char *)this + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, kASDTAcousticKeyTrimGainDataSourceID);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

void sub_236D0E57C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ASDT::Acoustic::Data<ASDT::Acoustic::TrimGainV2,(unsigned short)2>::entries(unsigned __int8 *a1)
{
  unsigned int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  ASDT::Acoustic::TrimGainV2 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v11[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a1[3];
  if (!a1[3])
    v2 = (((((unint64_t)a1[2] - 6) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64) >> 2);
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v5 = 0;
    v6 = (ASDT::Acoustic::TrimGainV2 *)(a1 + 4);
    v7 = MEMORY[0x24BDACB70];
    do
    {
      ASDT::Acoustic::TrimGainV2::asDictionary(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(v11, v5, &v12);
      objc_msgSend(v4, "addObject:", v8);

      ++v5;
      v6 = (ASDT::Acoustic::TrimGainV2 *)((char *)v6 + 6);
    }
    while (v3 != v5);
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

void sub_236D0E700(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

ASDT::Exclaves::Sensor *ASDT::Exclaves::Sensor::Sensor(ASDT::Exclaves::Sensor *this, char *a2)
{
  const char *v2;
  const std::string *v4;
  _DWORD *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *p_p;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::string __p;
  char __dst[8];
  uint64_t v19;
  char v20;

  v2 = a2;
  *(_QWORD *)this = &off_2508421D0;
  v4 = (const std::string *)((char *)this + 16);
  *((_DWORD *)this + 2) = 0;
  v5 = (_DWORD *)((char *)this + 8);
  if (!a2)
    a2 = "";
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 2, a2);
  *((_QWORD *)this + 7) = 850045863;
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_QWORD *)this + 14) = 0;
  if (*((char *)this + 39) < 0)
  {
    if (!*((_QWORD *)this + 3))
      return this;
  }
  else if (!*((_BYTE *)this + 39))
  {
    return this;
  }
  v6 = std::string::rfind(v4, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v6 == -2)
    v7 = 0;
  else
    v7 = v6 + 1;
  std::string::basic_string(&__p, v4, v7, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v20);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  *(_QWORD *)__dst = 0;
  strlcpy(__dst, (const char *)p_p, 9uLL);
  v19 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *((_QWORD *)this + 5) = *(_QWORD *)__dst;
  if ((asdt_exclaves_available() & 1) != 0)
  {
    v9 = exclaves_sensor_create();
    if ((_DWORD)v9 || !*v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ASDT::Exclaves::Sensor::Sensor((uint64_t)v2, v9, v10, v11, v12, v13, v14, v15);
      *v5 = 0;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ASDT::Exclaves::Sensor::Sensor();
  }
  return this;
}

void sub_236D0EFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  void **v15;
  std::mutex *v16;

  std::mutex::~mutex(v16);
  if (*(char *)(v14 + 39) < 0)
    operator delete(*v15);
  _Unwind_Resume(a1);
}

void ASDT::Exclaves::Sensor::~Sensor(ASDT::Exclaves::Sensor *this)
{
  mach_port_name_t v2;

  *(_QWORD *)this = &off_2508421D0;
  v2 = *((_DWORD *)this + 2);
  if (v2)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v2);
  std::mutex::~mutex((std::mutex *)((char *)this + 56));
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

{
  ASDT::Exclaves::Sensor::~Sensor(this);
  JUMPOUT(0x23B801FF4);
}

ASDT::Exclaves::Sensor *ASDT::Exclaves::Sensor::Create@<X0>(ASDT::Exclaves::Sensor *this@<X0>, ASDT::Exclaves::Sensor **a2@<X8>)
{
  ASDT::Exclaves::Sensor *v5;
  ASDT::Exclaves::Sensor *result;

  v5 = (ASDT::Exclaves::Sensor *)operator new();
  result = ASDT::Exclaves::Sensor::Sensor(v5, (char *)this);
  *a2 = v5;
  return result;
}

void sub_236D0F0CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B801FF4](v1, 0x1093C408FC70230);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::Start(uint64_t a1, int *a2)
{
  std::mutex *v4;
  int v5;
  uint64_t Status;

  v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8))
  {
    v5 = *(_DWORD *)(a1 + 48);
    if (v5 < 1)
    {
      Status = exclaves_sensor_start();
      if ((_DWORD)Status)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ASDT::Exclaves::Sensor::Start();
      }
      else
      {
        *(_DWORD *)(a1 + 48) = 1;
      }
      kdebug_trace();
    }
    else
    {
      *(_DWORD *)(a1 + 48) = v5 + 1;
      Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
    }
  }
  else
  {
    Status = 29;
  }
  std::mutex::unlock(v4);
  return Status;
}

void sub_236D0F1EC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::DoGetStatus(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = exclaves_sensor_status();
  if ((_DWORD)v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ASDT::Exclaves::Sensor::DoGetStatus();
  }
  else
  {
  }
  kdebug_trace();
  return v5;
}

uint64_t `anonymous namespace'::ConvertStatus(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t result;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  switch((_DWORD)a2)
  {
    case 3:
      result = 0;
      v5 = 3;
      goto LABEL_7;
    case 2:
      result = 0;
      v5 = 2;
      goto LABEL_7;
    case 1:
      result = 0;
      v5 = 1;
LABEL_7:
      *a3 = v5;
      return result;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  return 18;
}

uint64_t ASDT::Exclaves::Sensor::Stop(uint64_t a1, int *a2)
{
  std::mutex *v4;
  int v5;
  uint64_t Status;

  v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8))
  {
    v5 = *(_DWORD *)(a1 + 48);
    if (v5 == 1)
    {
      Status = exclaves_sensor_stop();
      if ((_DWORD)Status)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ASDT::Exclaves::Sensor::Stop();
      }
      else
      {
        *(_DWORD *)(a1 + 48) = 0;
      }
      kdebug_trace();
    }
    else
    {
      if (v5 >= 2)
        *(_DWORD *)(a1 + 48) = v5 - 1;
      Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
    }
  }
  else
  {
    Status = 29;
  }
  std::mutex::unlock(v4);
  return Status;
}

void sub_236D0F434(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::Sensor::GetStatus(uint64_t a1, int *a2)
{
  std::mutex *v4;
  uint64_t Status;

  v4 = (std::mutex *)(a1 + 56);
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_DWORD *)(a1 + 8))
    Status = ASDT::Exclaves::Sensor::DoGetStatus(a1, a2);
  else
    Status = 29;
  std::mutex::unlock(v4);
  return Status;
}

void sub_236D0F4AC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

const char *ASDT::Exclaves::Sensor::StatusString(int a1)
{
  if ((a1 - 1) > 2)
    return "Undefined";
  else
    return off_2508421F0[a1 - 1];
}

void OUTLINED_FUNCTION_1_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_3_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

unint64_t ASDT::IOAudio2::Helpers::Fixed64FromFloat64(ASDT::IOAudio2::Helpers *this, double a2)
{
  return vcvtd_n_u64_f64(a2 - floor(a2), 0x20uLL) + (vcvtmd_u64_f64(a2) << 32);
}

double ASDT::IOAudio2::Helpers::Float64FromFixed64(uint64_t this)
{
  return (double)this * 2.32830644e-10 + (double)(this >> 32);
}

__n128 ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  __n128 result;
  uint64_t v4;

  v2 = *(_DWORD *)(a1 + 32);
  *(_QWORD *)a2 = vcvtd_n_u64_f64(*(double *)a1 - floor(*(double *)a1), 0x20uLL) + (vcvtmd_u64_f64(*(double *)a1) << 32);
  result = *(__n128 *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v2;
  return result;
}

__n128 ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  __n128 result;
  uint64_t v4;

  v2 = *(_DWORD *)(a1 + 32);
  *(double *)a2 = (double)*(_QWORD *)a1 * 2.32830644e-10 + (double)(*(uint64_t *)a1 >> 32);
  result = *(__n128 *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v2;
  return result;
}

float CACFNumber::GetFixed32(const __CFNumber **this)
{
  const __CFNumber *v1;
  int v2;
  float v3;
  int valuePtr;

  valuePtr = 0;
  v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    v2 = valuePtr;
    v3 = 1.0;
    if (valuePtr < 0)
      v3 = -1.0;
  }
  else
  {
    v2 = 0;
    v3 = 1.0;
  }
  return v3
       * (float)((float)((float)(unsigned __int16)(v2 * (int)v3) * 0.000015259)
               + (float)(((v2 * (int)v3) >> 16) & 0x7FFF));
}

double CACFNumber::GetFixed64(const __CFNumber **this)
{
  const __CFNumber *v1;
  uint64_t v2;
  double v3;
  uint64_t valuePtr;

  valuePtr = 0;
  v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
    v2 = valuePtr;
    v3 = 1.0;
    if (valuePtr < 0)
      v3 = -1.0;
  }
  else
  {
    v2 = 0;
    v3 = 1.0;
  }
  return v3
       * ((double)(v2 * (uint64_t)v3) * 2.32830644e-10
        + (double)(((unint64_t)(v2 * (uint64_t)v3) >> 32) & 0x7FFFFFFF));
}

void CACFNumber::PrintToLog(CACFNumber *this, const __CFNumber *a2)
{
  uint64_t v2;
  CFNumberType Type;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  double valuePtr;
  uint8_t buf[4];
  _BYTE *v10;
  __int16 v11;
  double v12;
  _BYTE __b[256];
  uint64_t v14;

  LODWORD(v2) = (_DWORD)a2;
  v14 = *MEMORY[0x24BDAC8D0];
  Type = CFNumberGetType(this);
  if ((_DWORD)v2)
  {
    v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    v2 = 0;
  }
  __b[v2] = 0;
  switch(Type)
  {
    case kCFNumberSInt8Type:
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 1024;
        LODWORD(v12) = SLOBYTE(valuePtr);
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt16Type:
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 1024;
        LODWORD(v12) = SLOWORD(valuePtr);
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      break;
    case kCFNumberFloat32Type:
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 2048;
        v12 = *(float *)&valuePtr;
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat64Type:
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 2048;
        v12 = valuePtr;
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      break;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 2048;
        v12 = valuePtr;
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberCFIndexType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 2048;
        v12 = valuePtr;
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%li";
LABEL_24:
        v7 = 22;
        goto LABEL_25;
      }
      break;
    default:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = __b;
        v11 = 1024;
        LODWORD(v12) = LODWORD(valuePtr);
        v5 = MEMORY[0x24BDACB70];
        v6 = " %s%i";
LABEL_15:
        v7 = 18;
LABEL_25:
        _os_log_impl(&dword_236CEE000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
      break;
  }
}

void CACFBoolean::PrintToLog(CACFBoolean *this, const __CFBoolean *a2)
{
  uint64_t v2;
  int Value;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  int v7;
  _BYTE *v8;
  _BYTE __b[256];
  uint64_t v10;

  LODWORD(v2) = (_DWORD)a2;
  v10 = *MEMORY[0x24BDAC8D0];
  Value = CFBooleanGetValue(this);
  if ((_DWORD)v2)
  {
    v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    v2 = 0;
  }
  __b[v2] = 0;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (Value)
  {
    if (!v4)
      return;
    v7 = 136315138;
    v8 = __b;
    v5 = MEMORY[0x24BDACB70];
    v6 = " %strue";
  }
  else
  {
    if (!v4)
      return;
    v7 = 136315138;
    v8 = __b;
    v5 = MEMORY[0x24BDACB70];
    v6 = " %sfalse";
  }
  _os_log_impl(&dword_236CEE000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
}

void LogError(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(4, a1, va);
}

uint64_t ASDTTime::ASDTTime(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v8 = __divti3();
  if (__CFADD__(v8, (unint64_t)(v9 >> 63) >> 48))
    v10 = v9 + 1;
  else
    v10 = v9;
  *((_QWORD *)&v11 + 1) = v10;
  *(_QWORD *)&v11 = v8 + ((unint64_t)(v9 >> 63) >> 48);
  *(_QWORD *)a1 = v11 >> 16;
  *(_QWORD *)(a1 + 8) = a2;
  *(_WORD *)(a1 + 16) = a3;
  *(_WORD *)(a1 + 18) = a4;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void ASDTTime::ASDTTime(uint64_t a1, ASDTTime *this, __int16 a3, unsigned __int16 *a4)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = this;
  *(_WORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 18) = a3;
  *(_DWORD *)(a1 + 20) = 0;
}

{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = this;
  *(_WORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 18) = a3;
  *(_DWORD *)(a1 + 20) = 0;
}

uint64_t `anonymous namespace'::NsecToHost(_anonymous_namespace_ *this, _QWORD *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t result;
  uint64_t v7;
  __int128 v8;

  result = __divti3();
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = result;
  *a2 = v8 >> 16;
  *(_WORD *)a3 = result;
  return result;
}

uint64_t ASDTTime::operator+=(_anonymous_namespace_ **a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5;
  _QWORD *v6;
  _anonymous_namespace_ *v7;

  v5 = *a2;
  v6 = a1 + 1;
  v7 = (_anonymous_namespace_ *)((char *)*a1 + v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator-=(_anonymous_namespace_ **a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5;
  _QWORD *v6;
  _anonymous_namespace_ *v7;

  v5 = *a2;
  v6 = a1 + 1;
  v7 = (_anonymous_namespace_ *)((char *)*a1 - v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator*=(_QWORD *a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5;
  _QWORD *v6;
  _anonymous_namespace_ *v7;

  v5 = *a2;
  v6 = a1 + 1;
  v7 = (_anonymous_namespace_ *)(*a1 * v5);
  *a1 = v7;
}

uint64_t ASDTTime::operator/=(uint64_t *a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v5 = *a2;
  v6 = a1 + 1;
  v7 = *a1 / v5;
  *a1 = v7;
}

uint64_t ASDTTime::machAbsoluteTime@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = mach_absolute_time();
  return ASDTTime::ASDTTime(a2, v3, 0, 1);
}

uint64_t ASDTTime::future@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int16 *v5;
  __int128 v7;
  uint64_t v8;
  ASDTTime *v9;

  v9 = this;
  v3 = mach_absolute_time();
  ASDTTime::ASDTTime((uint64_t)&v7, v3, 0, 1);
  *(_OWORD *)a2 = v7;
  *(_QWORD *)(a2 + 16) = v8;
  return ASDTTime::operator+=<unsigned long long>((_anonymous_namespace_ **)a2, (_anonymous_namespace_ **)&v9, v4, v5);
}

uint64_t ASDTTime::futureUSecs@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  return ASDTTime::future((ASDTTime *)((double)(unint64_t)this * 1000.0), a2);
}

{
  return ASDTTime::future((ASDTTime *)((double)(uint64_t)((unint64_t)this & ~((uint64_t)this >> 63)) * 1000.0), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000 * this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000 * (this & ~((int)this >> 31))), a2);
}

uint64_t ASDTTime::futureUSecs@<X0>(ASDTTime *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  double v3;
  BOOL v4;
  double v5;

  v3 = a2 * 1000.0;
  v4 = a2 < 0.0;
  v5 = 0.0;
  if (!v4)
    v5 = v3;
  return ASDTTime::future((ASDTTime *)v5, a3);
}

uint64_t ASDTTime::futureSecs@<X0>(ASDTTime *this@<X0>, uint64_t a2@<X8>)
{
  return ASDTTime::future((ASDTTime *)(1000000000 * (_QWORD)this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * ((unint64_t)this & ~((uint64_t)this >> 63))), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * this), a2);
}

{
  return ASDTTime::future((ASDTTime *)(1000000000 * (this & ~((int)this >> 31))), a2);
}

uint64_t ASDTTime::futureSecs@<X0>(ASDTTime *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  double v3;
  BOOL v4;
  double v5;

  v3 = a2 * 1000000000.0;
  v4 = a2 < 0.0;
  v5 = 0.0;
  if (!v4)
    v5 = v3;
  return ASDTTime::future((ASDTTime *)v5, a3);
}

uint64_t ___ZN12_GLOBAL__N_115GetTimebaseInfoEv_block_invoke()
{
}

uint64_t ASDTTime::operator+=<unsigned long long>(_anonymous_namespace_ **a1, _anonymous_namespace_ **a2, uint64_t a3, unsigned __int16 *a4)
{
  _anonymous_namespace_ *v5;
  unsigned __int16 *v6;
  _anonymous_namespace_ *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = *a2;
  v5 = (_anonymous_namespace_ *)((char *)v8 + (_QWORD)*a1);
  *a1 = v5;
}

double ASDT::VolumeCurve::VolumeCurve(ASDT::VolumeCurve *this)
{
  double result;

  *(_DWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_BYTE *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  result = 0.00781250186;
  *((_QWORD *)this + 5) = 0x3F80000040000000;
  return result;
}

{
  double result;

  *(_DWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_BYTE *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  result = 0.00781250186;
  *((_QWORD *)this + 5) = 0x3F80000040000000;
  return result;
}

uint64_t ASDT::VolumeCurve::GetMinimumRaw(ASDT::VolumeCurve *this)
{
  if (*((_QWORD *)this + 3))
    return *(unsigned int *)(*((_QWORD *)this + 1) + 28);
  else
    return 0;
}

uint64_t ASDT::VolumeCurve::GetMaximumRaw(ASDT::VolumeCurve *this)
{
  uint64_t v1;
  _QWORD *v3;

  v1 = *((_QWORD *)this + 3);
  if (!v1)
    return 0;
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  return *((unsigned int *)v3 + 8);
}

float ASDT::VolumeCurve::GetMinimumDB(ASDT::VolumeCurve *this)
{
  if (*((_QWORD *)this + 3))
    return *(float *)(*((_QWORD *)this + 1) + 36);
  else
    return 0.0;
}

float ASDT::VolumeCurve::GetMaximumDB(ASDT::VolumeCurve *this)
{
  uint64_t v1;
  float *v3;

  v1 = *((_QWORD *)this + 3);
  if (!v1)
    return 0.0;
  v3 = (float *)*((_QWORD *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>((_QWORD **)&v3, (int)v1 - 1);
  return v3[10];
}

uint64_t ASDT::VolumeCurve::SetTransferFunction(uint64_t this, signed int a2)
{
  char v2;
  float v3;
  float v4;

  *(_DWORD *)(this + 36) = a2;
  if (a2 > 0xF)
  {
    v4 = 1.0;
    v3 = 2.0;
    v2 = 1;
  }
  else
  {
    v2 = byte_236D2B730[a2];
    v3 = flt_236D2B740[a2];
    v4 = flt_236D2B780[a2];
  }
  *(_BYTE *)(this + 32) = v2;
  *(float *)(this + 40) = v3;
  *(float *)(this + 44) = v4;
  return this;
}

void ASDT::VolumeCurve::AddRange(ASDT::VolumeCurve *this, signed int a2, signed int a3, float a4, float a5)
{
  uint64_t **v5;
  uint64_t **v6;
  uint64_t **v7;
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

  v7 = (uint64_t **)*((_QWORD *)this + 1);
  v5 = (uint64_t **)((char *)this + 8);
  v6 = v7;
  if (v7 == v5 + 1)
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
    if (v12 == v5 + 1)
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
    std::__tree<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__map_value_compare<ASDT::RawPoint,std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::less<ASDT::RawPoint>,true>,std::allocator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>>>::__emplace_unique_key_args<ASDT::RawPoint,std::pair<ASDT::RawPoint const,ASDT::DBPoint>>(v5, (int *)&v15, (uint64_t *)&v15);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    ASDT::VolumeCurve::AddRange();
  }
}

void ASDT::VolumeCurve::ResetRange(ASDT::VolumeCurve *this)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)this + 16);
  std::__tree<std::__value_type<void *,unsigned int>,std::__map_value_compare<void *,std::__value_type<void *,unsigned int>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned int>>>::destroy((uint64_t)this + 8, *((_QWORD **)this + 2));
  *(v1 - 1) = v1;
  *v1 = 0;
  v1[1] = 0;
}

BOOL ASDT::VolumeCurve::CheckForContinuity(ASDT::VolumeCurve *this)
{
  char *v1;
  char *v2;
  int v3;
  float v4;
  char *v5;
  char *v6;
  char *v7;
  int v8;
  float v9;
  BOOL v10;
  _BOOL8 result;

  v1 = (char *)*((_QWORD *)this + 1);
  v2 = (char *)this + 16;
  if (v1 == (char *)this + 16)
    return 1;
  v3 = *((_DWORD *)v1 + 7);
  v4 = *((float *)v1 + 9);
  do
  {
    v5 = (char *)*((_QWORD *)v1 + 1);
    v6 = v1;
    if (v5)
    {
      do
      {
        v7 = v5;
        v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v7 = (char *)*((_QWORD *)v6 + 2);
        v10 = *(_QWORD *)v7 == (_QWORD)v6;
        v6 = v7;
      }
      while (!v10);
    }
    v8 = *((_DWORD *)v1 + 7);
    v9 = *((float *)v1 + 9);
    v10 = v4 == v9 && v3 == v8;
    result = v10;
    if (v7 == v2)
      break;
    v3 = v3 - v8 + *((_DWORD *)v1 + 8);
    v4 = v4 + (float)(*((float *)v1 + 10) - v9);
    v1 = v7;
  }
  while (result);
  return result;
}

uint64_t ASDT::VolumeCurve::ConvertDBToRaw(ASDT::VolumeCurve *this, float a2)
{
  float v4;
  float MaximumDB;
  float v6;
  _QWORD *v7;
  uint64_t result;
  int v9;
  float v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;

  if (*((_QWORD *)this + 3))
    v4 = *(float *)(*((_QWORD *)this + 1) + 36);
  else
    v4 = 0.0;
  MaximumDB = ASDT::VolumeCurve::GetMaximumDB(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 <= MaximumDB)
    MaximumDB = v6;
  v7 = (_QWORD *)*((_QWORD *)this + 1);
  result = *((unsigned int *)v7 + 7);
  if (v7 != (_QWORD *)((char *)this + 16))
  {
    do
    {
      v9 = *((_DWORD *)v7 + 8) - *((_DWORD *)v7 + 7);
      v10 = *((float *)v7 + 10);
      if (MaximumDB <= v10)
        v9 = llroundf((float)(MaximumDB - *((float *)v7 + 9)) / (float)((float)(v10 - *((float *)v7 + 9)) / (float)v9));
      v11 = (_QWORD *)v7[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)v7[2];
          v13 = *v12 == (_QWORD)v7;
          v7 = v12;
        }
        while (!v13);
      }
      result = (v9 + result);
      v13 = MaximumDB <= v10 || v12 == (_QWORD *)((char *)this + 16);
      v7 = v12;
    }
    while (!v13);
  }
  return result;
}

uint64_t ASDT::VolumeCurve::ConvertRawToDB(ASDT::VolumeCurve *this, int a2)
{
  int v4;
  uint64_t result;
  int v6;
  int v7;
  float *v8;
  float v9;
  float *v10;
  BOOL v11;
  int v12;
  int v13;
  float *v14;
  float *v15;
  float *v16;

  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  result = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= (int)result)
    v6 = result;
  v7 = v6 - v4;
  v8 = (float *)*((_QWORD *)this + 1);
  v9 = v8[9];
  v10 = (float *)((char *)this + 16);
  v11 = v7 < 1 || v8 == v10;
  if (!v11)
  {
    do
    {
      v12 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      if (v7 >= v12)
        v13 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      else
        v13 = v7;
      v14 = (float *)*((_QWORD *)v8 + 1);
      v15 = v8;
      if (v14)
      {
        do
        {
          v16 = v14;
          v14 = *(float **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v16 = (float *)*((_QWORD *)v15 + 2);
          v11 = *(_QWORD *)v16 == (_QWORD)v15;
          v15 = v16;
        }
        while (!v11);
      }
      v9 = v9 + (float)((float)v13 * (float)((float)(v8[10] - v8[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1)
        break;
      v8 = v16;
    }
    while (v16 != v10);
  }
  return result;
}

float ASDT::VolumeCurve::ConvertRawToScalar(ASDT::VolumeCurve *this, int a2)
{
  int v4;
  int MaximumRaw;
  int v6;
  float v7;

  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  MaximumRaw = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= MaximumRaw)
    v6 = MaximumRaw;
  v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (ASDT::VolumeCurve::GetIsApplyingTransferFunction(this))
    return powf(v7, *((float *)this + 10) / *((float *)this + 11));
  else
    return v7;
}

BOOL ASDT::VolumeCurve::GetIsApplyingTransferFunction(ASDT::VolumeCurve *this)
{
  float v2;

  if (*((_QWORD *)this + 3))
    v2 = *(float *)(*((_QWORD *)this + 1) + 36);
  else
    v2 = 0.0;
  return (float)(ASDT::VolumeCurve::GetMaximumDB(this) - v2) > 30.0 && *((_BYTE *)this + 32) != 0;
}

float ASDT::VolumeCurve::ConvertDBToScalar(ASDT::VolumeCurve *this, float a2)
{
  int v3;

  v3 = ASDT::VolumeCurve::ConvertDBToRaw(this, a2);
  return ASDT::VolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t ASDT::VolumeCurve::ConvertScalarToRaw(ASDT::VolumeCurve *this, float a2)
{
  float v3;
  int v4;
  float v5;
  int MaximumRaw;

  v3 = fmaxf(a2, 0.0);
  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  v5 = fminf(v3, 1.0);
  MaximumRaw = ASDT::VolumeCurve::GetMaximumRaw(this);
  if (ASDT::VolumeCurve::GetIsApplyingTransferFunction(this))
    v5 = powf(v5, *((float *)this + 11) / *((float *)this + 10));
  return v4 + llroundf(v5 * (float)(MaximumRaw - v4));
}

uint64_t ASDT::VolumeCurve::ConvertScalarToDB(ASDT::VolumeCurve *this, float a2)
{
  int v3;

  v3 = ASDT::VolumeCurve::ConvertScalarToRaw(this, a2);
  return ASDT::VolumeCurve::ConvertRawToDB(this, v3);
}

_QWORD **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__tree_node<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,void *> *,long>>>(_QWORD **result, uint64_t a2)
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

uint64_t *std::__tree<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::__map_value_compare<ASDT::RawPoint,std::__value_type<ASDT::RawPoint,ASDT::DBPoint>,std::less<ASDT::RawPoint>,true>,std::allocator<std::__value_type<ASDT::RawPoint,ASDT::DBPoint>>>::__emplace_unique_key_args<ASDT::RawPoint,std::pair<ASDT::RawPoint const,ASDT::DBPoint>>(uint64_t **a1, int *a2, uint64_t *a3)
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

uint64_t asdt_exclaves_available()
{
  if (asdt_exclaves_available_onceToken != -1)
    dispatch_once(&asdt_exclaves_available_onceToken, &__block_literal_global_1);
  return asdt_exclaves_available_exclaves_available;
}

uint64_t __asdt_exclaves_available_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  asdt_exclaves_available_exclaves_available = result;
  return result;
}

uint64_t ASDT::Acoustic::scaledValue(ASDT::Acoustic *this, double a2)
{
  *(float *)&a2 = (float)this * *(float *)&a2;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2);
}

{
  *(float *)&a2 = (float)(int)this * *(float *)&a2;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2);
}

void sub_236D10F68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1118C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void ASDTIOSerivceWillTerminateHandler(void *a1, io_object_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  ASDT::IOUserClient *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASDT::IOUserClient *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const std::error_category *v14;
  void *exception;
  const std::error_category *v16;
  void *v17;
  const std::error_category *v18;
  void *v19;
  const std::error_category *v20;
  io_object_t v21;
  io_object_t v22;
  CFTypeRef cf;
  io_object_t v24;
  io_object_t object;
  io_object_t v26;
  io_object_t v27;
  io_object_t v28;

  v3 = a1;
  if (a2)
  {
    v4 = IOObjectRetain(a2);
    if ((_DWORD)v4)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v16 = std::system_category();
      MEMORY[0x23B801F4C](exception, v4, v16, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
    v28 = a2;
    object = a2;
    v5 = IOObjectRetain(a2);
    if ((_DWORD)v5)
    {
      v17 = __cxa_allocate_exception(0x20uLL);
      v18 = std::system_category();
      MEMORY[0x23B801F4C](v17, v5, v18, "Error on Retain");
      __cxa_throw(v17, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
    applesauce::iokit::details::io_services_iterator::io_services_iterator(&v26, &object);
    if (object)
      IOObjectRelease(object);
    v6 = (ASDT::IOUserClient *)v27;
    v24 = v27;
    if (v27)
    {
      v7 = IOObjectRetain(v27);
      if ((_DWORD)v7)
      {
        v19 = __cxa_allocate_exception(0x20uLL);
        v20 = std::system_category();
        MEMORY[0x23B801F4C](v19, v7, v20, "Error on Retain");
        __cxa_throw(v19, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
      }
      do
      {
        if (IOObjectConformsTo((io_object_t)v6, (const char *)objc_msgSend(v3, "ioServiceClassNameCStr")))
        {
          objc_msgSend(v3, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          ASDT::IOUserClient::CopyProperties(v6, (CFMutableDictionaryRef *)&cf);
          v9 = (id)cf;
          objc_msgSend(v8, "ioServiceWillTerminate:withProperties:", v6, v9);

          if (cf)
            CFRelease(cf);

        }
        applesauce::iokit::details::io_services_iterator::operator++(&v26, (applesauce::iokit::details::io_services_iterator *)&v21);
        if (v22)
          IOObjectRelease(v22);
        if (v21)
          IOObjectRelease(v21);
        v10 = (ASDT::IOUserClient *)v27;
        if (v27)
        {
          v11 = IOObjectRetain(v27);
          if ((_DWORD)v11)
          {
            v12 = v11;
            v13 = __cxa_allocate_exception(0x20uLL);
            v14 = std::system_category();
            MEMORY[0x23B801F4C](v13, v12, v14, "Error on Retain");
            __cxa_throw(v13, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
          }
        }
        v24 = v10;
        IOObjectRelease((io_object_t)v6);
        v6 = v10;
      }
      while ((_DWORD)v10);
      if (v27)
        IOObjectRelease(v27);
    }
    if (v26)
      IOObjectRelease(v26);
    IOObjectRelease(a2);
  }

}

void sub_236D11448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, int a13, char a14, __int16 a15, char a16, char a17, __int16 a18, char a19, char a20,int a21,io_object_t a22)
{
  void *v22;
  void *v23;

  __cxa_free_exception(v23);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator((applesauce::iokit::details::io_services_iterator *)&a19);
  applesauce::iokit::io_object_holder::~io_object_holder(&a22);

  _Unwind_Resume(a1);
}

void ASDTIOServiceMatchingHandler(void *a1, io_object_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  ASDT::IOUserClient *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASDT::IOUserClient *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const std::error_category *v14;
  void *exception;
  const std::error_category *v16;
  void *v17;
  const std::error_category *v18;
  void *v19;
  const std::error_category *v20;
  io_object_t v21;
  io_object_t v22;
  CFTypeRef cf;
  io_object_t v24;
  io_object_t object;
  io_object_t v26;
  io_object_t v27;
  io_object_t v28;

  v3 = a1;
  if (a2)
  {
    v4 = IOObjectRetain(a2);
    if ((_DWORD)v4)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v16 = std::system_category();
      MEMORY[0x23B801F4C](exception, v4, v16, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
    v28 = a2;
    object = a2;
    v5 = IOObjectRetain(a2);
    if ((_DWORD)v5)
    {
      v17 = __cxa_allocate_exception(0x20uLL);
      v18 = std::system_category();
      MEMORY[0x23B801F4C](v17, v5, v18, "Error on Retain");
      __cxa_throw(v17, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
    applesauce::iokit::details::io_services_iterator::io_services_iterator(&v26, &object);
    if (object)
      IOObjectRelease(object);
    v6 = (ASDT::IOUserClient *)v27;
    v24 = v27;
    if (v27)
    {
      v7 = IOObjectRetain(v27);
      if ((_DWORD)v7)
      {
        v19 = __cxa_allocate_exception(0x20uLL);
        v20 = std::system_category();
        MEMORY[0x23B801F4C](v19, v7, v20, "Error on Retain");
        __cxa_throw(v19, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
      }
      do
      {
        if (IOObjectConformsTo((io_object_t)v6, (const char *)objc_msgSend(v3, "ioServiceClassNameCStr")))
        {
          objc_msgSend(v3, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          ASDT::IOUserClient::CopyProperties(v6, (CFMutableDictionaryRef *)&cf);
          v9 = (id)cf;
          objc_msgSend(v8, "matchedIOService:withProperties:", v6, v9);

          if (cf)
            CFRelease(cf);

        }
        applesauce::iokit::details::io_services_iterator::operator++(&v26, (applesauce::iokit::details::io_services_iterator *)&v21);
        if (v22)
          IOObjectRelease(v22);
        if (v21)
          IOObjectRelease(v21);
        v10 = (ASDT::IOUserClient *)v27;
        if (v27)
        {
          v11 = IOObjectRetain(v27);
          if ((_DWORD)v11)
          {
            v12 = v11;
            v13 = __cxa_allocate_exception(0x20uLL);
            v14 = std::system_category();
            MEMORY[0x23B801F4C](v13, v12, v14, "Error on Retain");
            __cxa_throw(v13, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
          }
        }
        v24 = v10;
        IOObjectRelease((io_object_t)v6);
        v6 = v10;
      }
      while ((_DWORD)v10);
      if (v27)
        IOObjectRelease(v27);
    }
    if (v26)
      IOObjectRelease(v26);
    IOObjectRelease(a2);
  }

}

void sub_236D117A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, int a13, char a14, __int16 a15, char a16, char a17, __int16 a18, char a19, char a20,int a21,io_object_t a22)
{
  void *v22;
  void *v23;

  __cxa_free_exception(v23);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator((applesauce::iokit::details::io_services_iterator *)&a19);
  applesauce::iokit::io_object_holder::~io_object_holder(&a22);

  _Unwind_Resume(a1);
}

void sub_236D118DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTIOServiceMatcher;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

io_object_t *applesauce::iokit::details::io_services_iterator::io_services_iterator(io_object_t *a1, io_object_t *a2)
{
  io_object_t v3;
  uint64_t v4;
  uint64_t v6;
  void *exception;
  const std::error_category *v8;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
  {
    v4 = IOObjectRetain(v3);
    if ((_DWORD)v4)
    {
      v6 = v4;
      exception = __cxa_allocate_exception(0x20uLL);
      v8 = std::system_category();
      MEMORY[0x23B801F4C](exception, v6, v8, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
    v3 = *a1;
  }
  a1[1] = IOIteratorNext(v3);
  return a1;
}

void sub_236D11B2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::iokit::io_object_holder::~io_object_holder(io_object_t *this)
{
  io_object_t v1;

  v1 = *this;
  if (v1)
    IOObjectRelease(v1);
}

uint64_t applesauce::iokit::details::io_services_iterator::operator++@<X0>(io_object_t *a1@<X0>, applesauce::iokit::details::io_services_iterator *a2@<X8>)
{
  io_object_t v3;
  uint64_t result;
  std::logic_error *exception;

  applesauce::iokit::details::io_services_iterator::io_services_iterator(a2, a1);
  if (!a1[1])
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "io_services_iterator exceeding size");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
    __cxa_throw(exception, (struct type_info *)off_250841718, MEMORY[0x24BEDAB00]);
  }
  v3 = IOIteratorNext(*a1);
  result = a1[1];
  a1[1] = v3;
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

void sub_236D11C24(_Unwind_Exception *a1)
{
  applesauce::iokit::details::io_services_iterator *v1;
  void *v2;

  __cxa_free_exception(v2);
  applesauce::iokit::details::io_services_iterator::~io_services_iterator(v1);
  _Unwind_Resume(a1);
}

void applesauce::iokit::details::io_services_iterator::~io_services_iterator(applesauce::iokit::details::io_services_iterator *this)
{
  io_object_t v2;

  v2 = *((_DWORD *)this + 1);
  if (v2)
    IOObjectRelease(v2);
  if (*(_DWORD *)this)
    IOObjectRelease(*(_DWORD *)this);
}

applesauce::iokit::details::io_services_iterator *applesauce::iokit::details::io_services_iterator::io_services_iterator(applesauce::iokit::details::io_services_iterator *this, io_object_t *a2)
{
  io_object_t v4;
  uint64_t v5;
  io_object_t v6;
  uint64_t v7;
  uint64_t v9;
  void *exception;
  const std::error_category *v11;
  void *v12;
  const std::error_category *v13;

  v4 = *a2;
  *(_DWORD *)this = *a2;
  if (v4)
  {
    v5 = IOObjectRetain(v4);
    if ((_DWORD)v5)
    {
      v9 = v5;
      exception = __cxa_allocate_exception(0x20uLL);
      v11 = std::system_category();
      MEMORY[0x23B801F4C](exception, v9, v11, "Error on Retain");
      __cxa_throw(exception, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
  }
  v6 = a2[1];
  *((_DWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = IOObjectRetain(v6);
    if ((_DWORD)v7)
    {
      v12 = __cxa_allocate_exception(0x20uLL);
      v13 = std::system_category();
      MEMORY[0x23B801F4C](v12, v7, v13, "Error on Retain");
      __cxa_throw(v12, MEMORY[0x24BEDB6E8], MEMORY[0x24BEDADC8]);
    }
  }
  return this;
}

void sub_236D11D6C(_Unwind_Exception *a1)
{
  io_object_t *v1;
  void *v2;

  __cxa_free_exception(v2);
  applesauce::iokit::io_object_holder::~io_object_holder(v1);
  _Unwind_Resume(a1);
}

void sub_236D11FBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_236D12088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D12158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_236D123B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_236D124EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D1261C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D12718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D12868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D12B50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D12D70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D13064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D13168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D134D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D13904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_236D13B28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_236D13C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D13DA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D13E5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D143A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D14634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D14704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236D1488C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D14A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D14C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D14D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D14F2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D14FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D15048(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D150F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D15200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D152A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D15330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D153E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D15494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D15554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D155E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1564C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D159E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_236D15DC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D15E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D15F04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D15FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D16164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D161B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D162A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D162F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D164D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1652C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D16594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D16694(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1676C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D167D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D16C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_236D16E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D16EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1701C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1707C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D170E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1714C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1719C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double CAAudioValueRange::BoundValue(CAAudioValueRange *this, const AudioValueRange *a2, double a3)
{
  double v3;

  v3 = *((double *)this + 1);
  if (v3 > a3)
    v3 = a3;
  if (*(double *)this >= a3)
    return *(double *)this;
  else
    return v3;
}

double CAAudioValueRange::PickCommonSampleRate(CAAudioValueRange *this, const AudioValueRange *a2)
{
  double v2;
  double v3;
  double result;

  v3 = *(double *)this;
  v2 = *((double *)this + 1);
  result = 44100.0;
  if (*(double *)this > 44100.0 || v2 < 44100.0)
  {
    result = 48000.0;
    if (v3 > 48000.0 || v2 < 48000.0)
    {
      result = 96000.0;
      if (v3 > 96000.0 || v2 < 96000.0)
      {
        result = 88200.0;
        if (v3 > 88200.0 || v2 < 88200.0)
        {
          result = 64000.0;
          if (v3 > 64000.0 || v2 < 64000.0)
          {
            result = 32000.0;
            if (v3 > 32000.0 || v2 < 32000.0)
            {
              result = 24000.0;
              if (v3 > 24000.0 || v2 < 24000.0)
              {
                result = 22050.0;
                if (v3 > 22050.0 || v2 < 22050.0)
                {
                  result = 16000.0;
                  if (v3 > 16000.0 || v2 < 16000.0)
                  {
                    result = 12000.0;
                    if (v3 > 12000.0 || v2 < 12000.0)
                    {
                      result = 11025.0;
                      if (v3 > 11025.0 || v2 < 11025.0)
                      {
                        result = 8000.0;
                        if (v2 < 8000.0 || v3 > 8000.0)
                          return *((double *)this + 1);
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
  return result;
}

uint64_t CAAudioValueRange::Intersection(CAAudioValueRange *this, const AudioValueRange *a2, const AudioValueRange *a3, AudioValueRange *a4)
{
  double mMinimum;
  uint64_t result;
  double mMaximum;

  mMinimum = a2->mMinimum;
  if (*((double *)this + 1) >= a2->mMinimum && *(double *)this <= a2->mMaximum)
  {
    if (*(double *)this >= mMinimum)
      mMinimum = *(double *)this;
    a3->mMinimum = mMinimum;
    mMaximum = a2->mMaximum;
    if (mMaximum >= *((double *)this + 1))
      mMaximum = *((double *)this + 1);
    a3->mMaximum = mMaximum;
    return 1;
  }
  else
  {
    result = 0;
    a3->mMinimum = 0.0;
    a3->mMaximum = 0.0;
  }
  return result;
}

uint64_t CAAudioValueRange::Union(CAAudioValueRange *this, const AudioValueRange *a2, const AudioValueRange *a3, AudioValueRange *a4)
{
  double mMinimum;
  double v6;
  uint64_t result;
  double mMaximum;

  mMinimum = a2->mMinimum;
  if (*((double *)this + 1) >= a2->mMinimum && (v6 = *(double *)this, *(double *)this <= a2->mMaximum))
  {
    result = 0;
    if (mMinimum >= v6)
      mMinimum = v6;
    a3->mMinimum = mMinimum;
    mMaximum = *((double *)this + 1);
    if (mMaximum < a2->mMaximum)
      mMaximum = a2->mMaximum;
    a3->mMaximum = mMaximum;
  }
  else
  {
    a3->mMinimum = 0.0;
    a3->mMaximum = 0.0;
    return 1;
  }
  return result;
}

void CAAudioValueRange_ComputeUnion(double *a1, double **a2, char **a3)
{
  char *v5;
  double *v6;
  double *v7;
  _QWORD *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  double *v20;
  double v21;
  uint64_t v22;
  double v23;
  unint64_t v24;
  char *v25;
  double v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  double *v33;
  double *v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  double *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;

  v5 = *a3;
  a3[1] = *a3;
  v7 = *a2;
  v6 = a2[1];
  if (*a2 == v6)
  {
LABEL_22:
    v23 = *a1;
    v22 = *((_QWORD *)a1 + 1);
    v24 = (unint64_t)a3[2];
    if ((unint64_t)v5 < v24)
    {
      *(double *)v5 = v23;
      *((_QWORD *)v5 + 1) = v22;
      v25 = v5 + 16;
LABEL_68:
      a3[1] = v25;
      return;
    }
    v28 = (v5 - *a3) >> 4;
    if (!((unint64_t)(v28 + 1) >> 60))
    {
      v29 = v24 - (_QWORD)*a3;
      v30 = v29 >> 3;
      if (v29 >> 3 <= (unint64_t)(v28 + 1))
        v30 = v28 + 1;
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0)
        v31 = 0xFFFFFFFFFFFFFFFLL;
      else
        v31 = v30;
      if (v31)
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v31);
      else
        v32 = 0;
      v47 = &v32[16 * v28];
      v48 = &v32[16 * v31];
      *(double *)v47 = v23;
      *((_QWORD *)v47 + 1) = v22;
      v25 = v47 + 16;
      v50 = *a3;
      v49 = a3[1];
      if (v49 != *a3)
      {
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v49 - 1);
          v47 -= 16;
          v49 -= 16;
        }
        while (v49 != v50);
        v49 = *a3;
      }
      *a3 = v47;
      a3[1] = v25;
      a3[2] = v48;
      if (v49)
        operator delete(v49);
      goto LABEL_68;
    }
LABEL_101:
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
  }
  v9 = a3 + 2;
  v10 = *a1;
  if (v7[1] < *a1)
  {
    while (1)
    {
      if ((unint64_t)v5 >= *v9)
      {
        v11 = (v5 - *a3) >> 4;
        if ((unint64_t)(v11 + 1) >> 60)
          goto LABEL_101;
        v12 = *v9 - (_QWORD)*a3;
        v13 = v12 >> 3;
        if (v12 >> 3 <= (unint64_t)(v11 + 1))
          v13 = v11 + 1;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
          v14 = 0xFFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v14);
        else
          v15 = 0;
        v16 = &v15[16 * v11];
        *(_OWORD *)v16 = *(_OWORD *)v7;
        v18 = *a3;
        v17 = a3[1];
        v19 = v16;
        if (v17 != *a3)
        {
          do
          {
            *((_OWORD *)v19 - 1) = *((_OWORD *)v17 - 1);
            v19 -= 16;
            v17 -= 16;
          }
          while (v17 != v18);
          v17 = *a3;
        }
        v5 = v16 + 16;
        *a3 = v19;
        a3[1] = v16 + 16;
        a3[2] = &v15[16 * v14];
        if (v17)
          operator delete(v17);
      }
      else
      {
        *(_OWORD *)v5 = *(_OWORD *)v7;
        v5 += 16;
      }
      a3[1] = v5;
      v20 = v7 + 2;
      v6 = a2[1];
      if (v7 + 2 == v6)
        goto LABEL_22;
      v21 = v7[3];
      v10 = *a1;
      v7 += 2;
      if (v21 >= *a1)
        goto LABEL_25;
    }
  }
  v20 = *a2;
LABEL_25:
  v26 = a1[1];
  if (*v20 <= v26)
  {
    v33 = v20 + 2;
    do
    {
      v34 = v33;
      if (v33 == v6)
        break;
      v33 += 2;
    }
    while (*v34 <= v26);
    if (v10 >= *v20)
      v35 = v20;
    else
      v35 = a1;
    v36 = *(_QWORD *)v35;
    if (*(v34 - 1) >= v26)
      v26 = *(v34 - 1);
    if ((unint64_t)v5 >= *v9)
    {
      v42 = (v5 - *a3) >> 4;
      if ((unint64_t)(v42 + 1) >> 60)
        goto LABEL_101;
      v43 = *v9 - (_QWORD)*a3;
      v44 = v43 >> 3;
      if (v43 >> 3 <= (unint64_t)(v42 + 1))
        v44 = v42 + 1;
      if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
        v45 = 0xFFFFFFFFFFFFFFFLL;
      else
        v45 = v44;
      if (v45)
        v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v45);
      else
        v46 = 0;
      v55 = &v46[16 * v42];
      v56 = &v46[16 * v45];
      *(_QWORD *)v55 = v36;
      *((double *)v55 + 1) = v26;
      v27 = v55 + 16;
      v58 = *a3;
      v57 = a3[1];
      if (v57 != *a3)
      {
        do
        {
          *((_OWORD *)v55 - 1) = *((_OWORD *)v57 - 1);
          v55 -= 16;
          v57 -= 16;
        }
        while (v57 != v58);
        v57 = *a3;
      }
      *a3 = v55;
      a3[1] = v27;
      a3[2] = v56;
      if (v57)
        operator delete(v57);
    }
    else
    {
      *(_QWORD *)v5 = v36;
      *((double *)v5 + 1) = v26;
      v27 = v5 + 16;
    }
  }
  else
  {
    if ((unint64_t)v5 >= *v9)
    {
      v37 = (v5 - *a3) >> 4;
      if ((unint64_t)(v37 + 1) >> 60)
        goto LABEL_101;
      v38 = *v9 - (_QWORD)*a3;
      v39 = v38 >> 3;
      if (v38 >> 3 <= (unint64_t)(v37 + 1))
        v39 = v37 + 1;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF0)
        v40 = 0xFFFFFFFFFFFFFFFLL;
      else
        v40 = v39;
      if (v40)
        v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v40);
      else
        v41 = 0;
      v51 = (double *)&v41[16 * v37];
      v52 = &v41[16 * v40];
      *v51 = v10;
      v51[1] = v26;
      v27 = (char *)(v51 + 2);
      v54 = *a3;
      v53 = a3[1];
      if (v53 != *a3)
      {
        do
        {
          *((_OWORD *)v51 - 1) = *((_OWORD *)v53 - 1);
          v51 -= 2;
          v53 -= 16;
        }
        while (v53 != v54);
        v53 = *a3;
      }
      *a3 = (char *)v51;
      a3[1] = v27;
      a3[2] = v52;
      if (v53)
        operator delete(v53);
    }
    else
    {
      *(double *)v5 = v10;
      *((double *)v5 + 1) = v26;
      v27 = v5 + 16;
    }
    v34 = v20;
  }
  for (a3[1] = v27; v34 != a2[1]; v34 += 2)
  {
    if ((unint64_t)v27 >= *v9)
    {
      v59 = (v27 - *a3) >> 4;
      if ((unint64_t)(v59 + 1) >> 60)
        goto LABEL_101;
      v60 = *v9 - (_QWORD)*a3;
      v61 = v60 >> 3;
      if (v60 >> 3 <= (unint64_t)(v59 + 1))
        v61 = v59 + 1;
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
        v62 = 0xFFFFFFFFFFFFFFFLL;
      else
        v62 = v61;
      if (v62)
        v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)(a3 + 2), v62);
      else
        v63 = 0;
      v64 = &v63[16 * v59];
      *(_OWORD *)v64 = *(_OWORD *)v34;
      v66 = *a3;
      v65 = a3[1];
      v67 = v64;
      if (v65 != *a3)
      {
        do
        {
          *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
          v67 -= 16;
          v65 -= 16;
        }
        while (v65 != v66);
        v65 = *a3;
      }
      v27 = v64 + 16;
      *a3 = v67;
      a3[1] = v64 + 16;
      a3[2] = &v63[16 * v62];
      if (v65)
        operator delete(v65);
    }
    else
    {
      *(_OWORD *)v27 = *(_OWORD *)v34;
      v27 += 16;
    }
    a3[1] = v27;
  }
}

void CAAudioValueRange_ComputeIntersection(unsigned int a1, uint64_t a2, double **a3, uint64_t a4)
{
  double *v4;
  uint64_t v7;
  _QWORD *v8;
  double *v9;
  double *v10;
  double *v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  double *v21;
  double *v22;
  double *v23;
  double *v24;
  uint64_t v26;

  v4 = *(double **)a4;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)a4;
  if (a1)
  {
    v7 = 0;
    v8 = (_QWORD *)(a4 + 16);
    v9 = a3[1];
    v26 = a1;
    do
    {
      v10 = *a3;
      if (*a3 != v9)
      {
        v11 = (double *)(a2 + 16 * v7);
        v12 = v11 + 1;
        do
        {
          if (*v12 >= *v10)
          {
            v13 = v10[1];
            if (*v11 <= v13)
            {
              if (*v11 >= *v10)
                v14 = *v11;
              else
                v14 = *v10;
              if (v13 >= *v12)
                v15 = *v12;
              else
                v15 = v10[1];
              if ((unint64_t)v4 >= *v8)
              {
                v16 = ((uint64_t)v4 - *(_QWORD *)a4) >> 4;
                if ((unint64_t)(v16 + 1) >> 60)
                  std::vector<void const*>::__throw_length_error[abi:ne180100]();
                v17 = *v8 - *(_QWORD *)a4;
                v18 = v17 >> 3;
                if (v17 >> 3 <= (unint64_t)(v16 + 1))
                  v18 = v16 + 1;
                if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
                  v19 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v19 = v18;
                if (v19)
                  v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)v8, v19);
                else
                  v20 = 0;
                v21 = (double *)&v20[16 * v16];
                *v21 = v14;
                v21[1] = v15;
                v23 = *(double **)a4;
                v22 = *(double **)(a4 + 8);
                v24 = v21;
                if (v22 != *(double **)a4)
                {
                  do
                  {
                    *((_OWORD *)v24 - 1) = *((_OWORD *)v22 - 1);
                    v24 -= 2;
                    v22 -= 2;
                  }
                  while (v22 != v23);
                  v22 = *(double **)a4;
                }
                v4 = v21 + 2;
                *(_QWORD *)a4 = v24;
                *(_QWORD *)(a4 + 8) = v21 + 2;
                *(_QWORD *)(a4 + 16) = &v20[16 * v19];
                if (v22)
                  operator delete(v22);
              }
              else
              {
                *v4 = v14;
                v4[1] = v15;
                v4 += 2;
              }
              *(_QWORD *)(a4 + 8) = v4;
              v9 = a3[1];
            }
          }
          v10 += 2;
        }
        while (v10 != v9);
      }
      ++v7;
    }
    while (v7 != v26);
  }
}

void sub_236D1845C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_236D18924(_Unwind_Exception *a1)
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

void sub_236D18EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_236D190E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D192A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D19334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D19400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D194DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D19818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1996C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_236D199D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D19B58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D19CC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D19E64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D19EB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D19EFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D19F48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1A7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{

  _Unwind_Resume(a1);
}

void sub_236D1AA34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1ABE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_236D1ACF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_236D1ADB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1B01C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1B1BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1B278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_236D1B530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1B6E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1B79C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1BB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1BBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1C010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_236D1C140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_236D1C3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_236D1C470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1C560(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D1CA08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D1CC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

ASDT::Exclaves::NamedBuffer *ASDT::Exclaves::NamedBuffer::NamedBuffer(ASDT::Exclaves::NamedBuffer *this, char *a2, std::string::size_type a3)
{
  char *v4;
  _DWORD *v6;
  const std::string *v7;
  int v8;
  BOOL v9;
  std::string::size_type v11;
  std::string::size_type v12;
  std::string *v13;
  std::string::size_type v14;
  std::string::size_type v15;
  int v16;
  char __dst[8];
  uint64_t v19;
  char v20;
  std::string v21;
  std::string::size_type v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a2;
  v25 = *MEMORY[0x24BDAC8D0];
  *((_DWORD *)this + 4) = 0;
  v6 = (_DWORD *)((char *)this + 16);
  *(_QWORD *)this = &off_2508423F8;
  *((_QWORD *)this + 1) = a3;
  v7 = (const std::string *)((char *)this + 24);
  if (!a2)
    a2 = "";
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 3, a2);
  *((_QWORD *)this + 6) = 0;
  v8 = *((char *)this + 47);
  if (v8 < 0)
    v9 = *((_QWORD *)this + 4) == 0;
  else
    v9 = v8 == 0;
  if (!v9 && a3 != 0)
  {
    v11 = std::string::rfind(v7, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v11 == -2)
      v12 = 0;
    else
      v12 = v11 + 1;
    std::string::basic_string(&v21, v7, v12, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v20);
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = &v21;
    else
      v13 = (std::string *)v21.__r_.__value_.__r.__words[0];
    *(_QWORD *)__dst = 0;
    strlcpy(__dst, (const char *)v13, 9uLL);
    v19 = 0;
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v21.__r_.__value_.__l.__data_);
    *((_QWORD *)this + 6) = *(_QWORD *)__dst;
    v14 = a3 / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
    if (v14 >= a3)
      v15 = a3;
    else
      v15 = *MEMORY[0x24BDB03C8] + v14;
    if ((asdt_exclaves_available() & 1) != 0)
    {
      v16 = exclaves_audio_buffer_create();
      if (v16 || !*v6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LODWORD(v21.__r_.__value_.__l.__data_) = 136315906;
          *(std::string::size_type *)((char *)v21.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
          WORD2(v21.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v21.__r_.__value_.__r.__words[1] + 6) = v15;
          HIWORD(v21.__r_.__value_.__r.__words[2]) = 2048;
          v22 = a3;
          v23 = 1024;
          v24 = v16;
          _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "NamedBuffer: Failed to create with name: %s, size: %llu (%llu): %x", (uint8_t *)&v21, 0x26u);
        }
        *v6 = 0;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      ASDT::Exclaves::Sensor::Sensor();
    }
  }
  return this;
}

void sub_236D1D004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(exception_object);
}

void ASDT::Exclaves::NamedBuffer::~NamedBuffer(ASDT::Exclaves::NamedBuffer *this)
{
  mach_port_name_t v2;

  *(_QWORD *)this = &off_2508423F8;
  v2 = *((_DWORD *)this + 4);
  if (v2)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v2);
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
}

{
  ASDT::Exclaves::NamedBuffer::~NamedBuffer(this);
  JUMPOUT(0x23B801FF4);
}

ASDT::Exclaves::NamedBuffer *ASDT::Exclaves::NamedBuffer::Create@<X0>(ASDT::Exclaves::NamedBuffer *this@<X0>, const char *a2@<X1>, ASDT::Exclaves::NamedBuffer **a3@<X8>)
{
  ASDT::Exclaves::NamedBuffer *v6;
  ASDT::Exclaves::NamedBuffer *result;

  v6 = (ASDT::Exclaves::NamedBuffer *)operator new();
  result = ASDT::Exclaves::NamedBuffer::NamedBuffer(v6, (char *)this, (std::string::size_type)a2);
  *a3 = v6;
  if (!*((_DWORD *)v6 + 4))
  {
    *a3 = 0;
    return (ASDT::Exclaves::NamedBuffer *)(*(uint64_t (**)(ASDT::Exclaves::NamedBuffer *))(*(_QWORD *)v6 + 8))(v6);
  }
  return result;
}

void sub_236D1D14C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B801FF4](v1, 0x1093C40020DE3D2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::Exclaves::NamedBuffer::Read(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v11;
  int v12;
  _QWORD *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a2 && a3)
    return 4;
  if (!*(_DWORD *)(a1 + 16))
    return 29;
  v5 = a2[1];
  v6 = a2[2];
  v7 = *a2;
  if (a3 < 2)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    if (v7 + v6 != a2[3])
      return 4;
    v8 = a2[4];
    v9 = a2[5];
  }
  kdebug_trace();
  v4 = exclaves_audio_buffer_copyout();
  if ((_DWORD)v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v11 = (_QWORD *)(a1 + 24);
    if (*(char *)(a1 + 47) < 0)
      v11 = (_QWORD *)*v11;
    v12 = 136316674;
    v13 = v11;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v6;
    v18 = 2048;
    v19 = v5;
    v20 = 2048;
    v21 = v9;
    v22 = 2048;
    v23 = v8;
    v24 = 1024;
    v25 = v4;
    _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "NamedBuffer::Read: Failed to copyout: name: %s, addr: %p, length1: %llu, offset1: %llu, length2: %llu, offset2: %llu, ret: %x", (uint8_t *)&v12, 0x44u);
  }
  kdebug_trace();
  return v4;
}

uint64_t ASDT::Exclaves::NamedBuffer::Read(ASDT::Exclaves::NamedBuffer *this, unsigned __int8 *a2, int a3, unsigned int a4, unsigned int a5, unint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  v6 = a4 * a3;
  v7 = a5 * a4 - a6 % a5 * a4;
  v8 = v7 >= v6;
  v11[0] = (uint64_t)a2;
  v11[1] = a6 % a5 * a4;
  if (v7 >= v6)
    v7 = a4 * a3;
  v11[2] = v7;
  v11[3] = (uint64_t)&a2[v7];
  if (v8)
    v9 = 1;
  else
    v9 = 2;
  v11[4] = 0;
  v11[5] = v6 - v7;
  return ASDT::Exclaves::NamedBuffer::Read((uint64_t)this, v11, v9);
}

uint64_t ASDT::Exclaves::NamedBuffer::Read(ASDT::Exclaves::NamedBuffer *this, unsigned __int8 *a2, int a3, int a4)
{
  uint64_t v5[3];

  v5[0] = (uint64_t)a2;
  v5[1] = 0;
  v5[2] = (a4 * a3);
  return ASDT::Exclaves::NamedBuffer::Read((uint64_t)this, v5, 1uLL);
}

void sub_236D1D490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::HasItem(CFArrayRef *this, const void *a2)
{
  const __CFArray *result;
  CFRange v5;

  result = *this;
  if (result)
  {
    v5.length = CFArrayGetCount(result);
    v5.location = 0;
    return (const __CFArray *)(CFArrayContainsValue(*this, v5, a2) != 0);
  }
  return result;
}

const __CFArray *CACFArray::GetIndexOfItem(CFArrayRef *this, const void *a2, unsigned int *a3)
{
  const __CFArray *result;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  *a3 = 0;
  result = *this;
  if (result)
  {
    v8.length = CFArrayGetCount(result);
    v8.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*this, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      *a3 = FirstIndexOfValue;
      return (const __CFArray *)1;
    }
  }
  return result;
}

uint64_t CACFArray::GetBool(CFArrayRef *this, unsigned int a2, BOOL *a3)
{
  uint64_t result;
  CFTypeRef v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeID v8;
  BOOL v9;
  int valuePtr;
  CFTypeRef cf;

  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (!(_DWORD)result)
    return result;
  v5 = cf;
  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  if (v6 != CFBooleanGetTypeID())
  {
    v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
      v7 = valuePtr == 0;
      goto LABEL_7;
    }
    return 0;
  }
  v7 = CFBooleanGetValue((CFBooleanRef)v5) == 0;
LABEL_7:
  v9 = !v7;
  *a3 = v9;
  return 1;
}

const __CFArray *CACFArray::GetCFType(CFArrayRef *this, unsigned int a2, const void **a3)
{
  const __CFArray *result;
  const void *ValueAtIndex;

  result = *this;
  if (result)
  {
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*this, a2);
      *a3 = ValueAtIndex;
      return (const __CFArray *)(ValueAtIndex != 0);
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt32(CFArrayRef *this, unsigned int a2, int *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt32(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt64(CFArrayRef *this, unsigned int a2, uint64_t *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt64(CFArrayRef *this, unsigned int a2, unint64_t *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat32(CFArrayRef *this, unsigned int a2, float *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat64(CFArrayRef *this, unsigned int a2, double *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::Get4CC(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  CFTypeID v7;
  unsigned int v8;
  CFTypeRef cf;

  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v5 = (const __CFNumber *)cf;
    if (cf)
    {
      v6 = CFGetTypeID(cf);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, (char *)&v8, 5, 0x600u);
        *a3 = bswap32(v8);
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t CACFArray::GetString(CFArrayRef *this, unsigned int a2, const __CFString **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFString *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFString *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFStringGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetArray(CFArrayRef *this, unsigned int a2, const __CFArray **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFArray *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFArray *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFArrayGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetDictionary(CFArrayRef *this, unsigned int a2, const __CFDictionary **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFDictionary *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFDictionary *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFDictionaryGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetData(CFArrayRef *this, unsigned int a2, const __CFData **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFData *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFData *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFDataGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUUID(CFArrayRef *this, unsigned int a2, const __CFUUID **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFUUID *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFUUID *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFUUIDGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFString(CFArrayRef *this, unsigned int a2, CFTypeRef *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  if (*a3)
  {
    if (*((_BYTE *)a3 + 8))
      CFRelease(*a3);
    *a3 = 0;
  }
  *((_BYTE *)a3 + 8) = 1;
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFStringGetTypeID();
      if (v8 == result)
        return CACFString::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFArray(CFArrayRef *this, unsigned int a2, CACFArray *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  CACFArray::operator=((uint64_t)a3, 0);
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFArrayGetTypeID();
      if (v8 == result)
        return CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFDictionary(CFArrayRef *this, unsigned int a2, CACFDictionary *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  CACFArray::operator=((uint64_t)a3, 0);
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFDictionaryGetTypeID();
      if (v8 == result)
        return CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::AppendBool(CACFArray *this, int a2)
{
  const void **v3;
  const void *v4;
  uint64_t v5;
  const void *v7;
  char v8;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a2)
    v3 = (const void **)MEMORY[0x24BDBD268];
  v4 = *v3;
  v7 = v4;
  v8 = 1;
  if (v4 && (CFRetain(v4), *(_QWORD *)this) && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  return v5;
}

void sub_236D1F7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendCFType(CACFArray *this, const void *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendSInt32(CACFArray *this, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1F878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1F91C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendSInt64(CACFArray *this, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1F9C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt64(CACFArray *this, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1FA64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat32(CACFArray *this, float a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  float valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1FB08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat64(CACFArray *this, double a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  double valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_236D1FBAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendString(CACFArray *this, const __CFString *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendArray(CACFArray *this, const __CFArray *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendData(CACFArray *this, const __CFData *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertBool(CACFArray *this, unsigned int a2, int a3)
{
  const void **v4;
  const void *v5;
  const __CFArray *inserted;
  const void *v9;
  char v10;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  v4 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v4 = (const void **)MEMORY[0x24BDBD268];
  v5 = *v4;
  v9 = v5;
  v10 = 1;
  if (v5)
  {
    CFRetain(v5);
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else
  {
    inserted = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v9);
  return inserted;
}

void sub_236D1FD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertCFType(__CFArray **this, unsigned int a2, const void *a3)
{
  const __CFArray *result;
  unsigned int Count;
  __CFArray *v8;

  result = *this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      Count = CFArrayGetCount(result);
      v8 = *this;
      if (Count <= a2)
        CFArrayAppendValue(v8, a3);
      else
        CFArrayInsertValueAtIndex(v8, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertSInt32(CACFArray *this, unsigned int a2, int a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D1FE48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt32(CACFArray *this, unsigned int a2, int a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D1FEE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertSInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D1FF88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D20028(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat32(CACFArray *this, unsigned int a2, float a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  float valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D200C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat64(CACFArray *this, unsigned int a2, double a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  double valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_236D20168(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetBool(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  const void **v9;
  const void *v10;
  const void *v11;
  char v12;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  v9 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v9 = (const void **)MEMORY[0x24BDBD268];
  v10 = *v9;
  v11 = v10;
  v12 = 1;
  if (v10)
  {
    CFRetain(v10);
    v7 = CACFArray::SetCFType(this, a2, v10);
  }
  else
  {
    v7 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v7;
}

void sub_236D20240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetCFType(CFMutableArrayRef *this, unsigned int a2, const void *a3)
{
  const __CFArray *result;

  result = *this;
  if (result)
  {
    if (*((_BYTE *)this + 9) && CFArrayGetCount(result) >= a2)
    {
      CFArraySetValueAtIndex(*this, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::SetSInt32(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  int valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D2035C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt32(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  int valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D20414(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetSInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  uint64_t valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D204CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  uint64_t valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D20584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat32(const __CFArray **this, unsigned int a2, float a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  float valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D2063C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat64(const __CFArray **this, unsigned int a2, double a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  double valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_236D206F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFArray::PrintToLog(CACFArray *this, const __CFArray *a2)
{
  CFIndex Count;
  uint64_t v5;
  CFIndex v6;
  NSObject *v7;
  __CFString *ValueAtIndex;
  CFTypeID v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint8_t buf[4];
  _BYTE *v14;
  __int16 v15;
  int v16;
  _BYTE __b[256];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  Count = CFArrayGetCount(this);
  if ((_DWORD)a2)
  {
    v5 = a2;
    memset(__b, 9, a2);
  }
  else
  {
    v5 = 0;
  }
  __b[v5] = 0;
  if (Count >= 1)
  {
    v6 = 0;
    v12 = (_DWORD)a2 + 1;
    v7 = MEMORY[0x24BDACB70];
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = __b;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_236CEE000, v7, OS_LOG_TYPE_DEFAULT, " %sitem %d", buf, 0x12u);
      }
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(this, v6);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)ValueAtIndex, a2);
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)ValueAtIndex, a2);
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(ValueAtIndex, (const __CFString *)a2);
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)ValueAtIndex, (const __CFDictionary *)v12, v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)ValueAtIndex, (const __CFArray *)v12, v11);
      }
      ++v6;
    }
    while (Count != v6);
  }
}

void sub_236D20960(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D209B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_236D20A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTCondition;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_236D20C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_236D20DA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_236D20ED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::GetEntryForPath(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: Invalid argumnents: %p\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: Failed to get IOMainPort.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::IORegistry::GetObjectForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: Failed to allocate memory for key: %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::IORegistry::GetObjectForKey()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315650;
  v1 = "GetObjectForKey";
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Invalid argumnents: %p %p\n", (uint8_t *)&v0, 0x20u);
}

void ASDT::IORegistry::GetUInt32tForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: Invalid argument.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::IORegistry::GetUInt32tForKey()
{
  uint64_t v0;
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315906;
  v2 = "GetUInt32tForKey";
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: \"%s/%s\" invalid data length: %ld", (uint8_t *)&v1, 0x2Au);
}

void ASDT::IOUserClient::SetInterestNotificationEnabled()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: IONotificationPortCreate failed.", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: IOMainPort failed: %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOUserClient::SetInterestNotificationEnabled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%s: IOServiceAddInterestNotification failed: %x", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOUserClient::CacheProperties()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: CacheProperties: Failed to get properties from the IO Registry", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOUserClient::DictionarySetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "IOUserClient: Failed to insert new value.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::IOUserClient::ArraySetValueAtIndex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "IOUserClient: ArraySetObjectAtIndex: Index out of range", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "IOUserClient: ArraySetObjectAtIndex: Bad value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::IOUserClient::SetProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "IOUserClient: SetProperty: Invalid object.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::IOUserClient::ReplaceProperty()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: ReplaceProperty - bad key", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::IOUserClient::GuardedReleaseMemory()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  v2 = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: ReleaseMemory() not tracking map at %p", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  uint8_t v5[12];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  v4 = BYTE1(v0);
  if (BYTE1(v0) - 32 >= 0x5F)
    v4 = v1;
  v6 = 1024;
  v7 = v0;
  v8 = 1024;
  v9 = v2;
  v10 = 1024;
  v11 = v3;
  v12 = 1024;
  if (v0 - 32 < 0x5F)
    v1 = v0;
  v13 = v4;
  v14 = 1024;
  v15 = v1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: ReleaseMemory() failed: %x (%c%c%c%c)", v5, 0x2Au);
}

void ASDT::IOUserClient::CallMethod()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: CallMethod %x (%c%c%c%c) failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_10();
}

void ASDT::IOUserClient::CallTrap()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: CallTrap %x (%c%c%c%c) failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_10();
}

void ASDT::IOUserClient::CallTrap3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: CallTrap3 %x (%c%c%c%c) failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_10();
}

void ASDT::IOUserClient::CallTrap6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: CallTrap6 %x (%c%c%c%c) failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_10();
}

void ASDT::IOUserClient::InterestNotificationCallback()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s: InterestNotificationHandler bad IOService", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void CAStreamBasicDescription::PackednessIsSignificant()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " PackednessIsSignificant only applies for PCM", v0, 2u);
}

void ASDT::MachPort::CreatePort()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CreatePort: failed to create the send right: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CreatePort: failed to set the port limts: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CreatePort: failed to get the port limts: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CreatePort: failed to allocate the port: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::CheckInPort()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CheckInPort: couldn't insert the send right: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::CheckInPort: checking in the service name failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::RetainPort()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::RetainPort: couldn't insert the send right: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::DestroyPort()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "MachPort::DestroyPort: deallocating the port failed: %x (%c%c%c%c)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::DestroyPort(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "MachPort::DestroyPort: not going to destroy anything this way", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::MachPort::ReceiveMessage(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_236CEE000, MEMORY[0x24BDACB70], v1, "MachPort::ReceiveMessage: mach_msg() returned error 0x%X: '%s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::SendMessage(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_236CEE000, MEMORY[0x24BDACB70], v1, "MachPort::SendMessage: mach_msg() returned error 0x%X: '%s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::SendMessageWithReply(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_236CEE000, MEMORY[0x24BDACB70], v1, "MachPort::SendMessageWithReply: mach_msg() returned error 0x%X: '%s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void ASDT::MachPort::SetNotificationQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "MachPort::SetNotificationQueue: Invalid argument.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "MachPort::SetNotificationQueue: No notification handler is installed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::MachPort::SetNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "MachPort::SetNotificationHandler: Failed to create dispatch source.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create SpeakerThieleSmall data entry at index %hhu!", buf, 8u);
}

void ASDT::Acoustic::Base::valid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a1 + 2);
  v4 = 134218240;
  v5 = a2;
  v6 = 1024;
  v7 = v3;
  OUTLINED_FUNCTION_1_7(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Input data size too small: inDataSize: %zu, mSize: %hhu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void ASDT::Acoustic::Base::valid()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Unexpected size: Found 0x%hhx, expected: 0x%zx, remainder: 0x%zx", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_2(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Unexpected number of entries: Found 0x%hhx, expected: 0x%zx, remainder: 0x%zx", v1, v2, v3, v4, v5);
}

void ASDT::Acoustic::Base::valid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Checksum mismatch: Found: 0x%hx, expected: 0x%hx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_3_2(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Unexpected version: Found: 0x%hx, expected: 0x%hx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ASDT::Acoustic::Base::valid(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_1_7(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Unexpected size: Found 0x%hhx, expected: 0x%zx", (uint8_t *)v4);
  OUTLINED_FUNCTION_2();
}

void ASDT::Exclaves::Sensor::Sensor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Sensor: Failed to create with name: %s: %x", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::Exclaves::Sensor::Sensor()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "NamedBuffer: Exclaves not available.", v0, 2u);
}

void ASDT::Exclaves::Sensor::Start()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_8(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Sensor::Start: Failed: name: %s, status: %u, ret: %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::Exclaves::Sensor::DoGetStatus()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_8(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Sensor::GetStatus: Failed: name: %s, status: %u, ret: %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void `anonymous namespace'::ConvertStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Sensor::ConvertStatus: Unsupported status: name: %s, status: %u", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ASDT::Exclaves::Sensor::Stop()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_8(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Sensor::Stop: Failed: name: %s, status: %u, ret: %x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void ASDT::VolumeCurve::AddRange()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "VolumeCurve::AddRange: new point overlaps", v0, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
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

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
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

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x24BDBC630](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x24BDBC900]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7ED8](*(_QWORD *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F20](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD7F38](*(_QWORD *)&connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return MEMORY[0x24BDD7F48](*(_QWORD *)&connect, *(_QWORD *)&index);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x24BDD7F60](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x24BDD7F78](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4, p5, p6);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F88](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
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

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x24BDD86C8](*(_QWORD *)&object);
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

uint64_t IOPMGetUserActivityLevel()
{
  return MEMORY[0x24BDD8790]();
}

uint64_t IOPMScheduleUserActivityLevelNotification()
{
  return MEMORY[0x24BDD87A0]();
}

uint64_t IOPMUnregisterNotification()
{
  return MEMORY[0x24BDD87C0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
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

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x24BEDADB0](this, *(_QWORD *)&__ev, __ecat, __what_arg);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_250841740(__p);
}

uint64_t operator delete()
{
  return off_250841748();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250841750(__sz);
}

uint64_t operator new()
{
  return off_250841758();
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

uint64_t __divti3()
{
  return MEMORY[0x24BDAC7C8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
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

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x24BDAD2E8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

uint64_t exclaves_audio_buffer_copyout()
{
  return MEMORY[0x24BDAE1E8]();
}

uint64_t exclaves_audio_buffer_create()
{
  return MEMORY[0x24BDAE1F0]();
}

uint64_t exclaves_sensor_create()
{
  return MEMORY[0x24BDAE228]();
}

uint64_t exclaves_sensor_start()
{
  return MEMORY[0x24BDAE230]();
}

uint64_t exclaves_sensor_status()
{
  return MEMORY[0x24BDAE238]();
}

uint64_t exclaves_sensor_stop()
{
  return MEMORY[0x24BDAE240]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x24BDAEBD0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
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

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

