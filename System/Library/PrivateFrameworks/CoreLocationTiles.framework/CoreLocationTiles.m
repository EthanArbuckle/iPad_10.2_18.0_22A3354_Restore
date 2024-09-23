void sub_239257DA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B839A54](v1, 0x10B2C40D4E86D64);
  _Unwind_Resume(a1);
}

void sub_239257F88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_239258054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CLConnectionMessage>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_23925816C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2392588AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<CLConnectionMessage>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23925895C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<CLConnectionMessage>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_239258C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  os_activity_scope_leave(&state);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_239258E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

os_log_t ___ZL46_CLLogObjectForCategory_TilesFramework_Defaultv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreLocationTiles", "TilesFramework");
  logObject_TilesFramework_Default = (uint64_t)result;
  return result;
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250AC10B0, MEMORY[0x24BEDAAF0]);
}

void sub_239258F64(_Unwind_Exception *a1)
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

CLConnection *std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](CLConnection **a1, CLConnection *a2)
{
  CLConnection *result;

  result = *a1;
  *a1 = a2;
  if (result)
    return (CLConnection *)CLConnection::deferredDelete(result);
  return result;
}

uint64_t std::shared_ptr<CLConnectionMessage>::~shared_ptr[abi:ne180100](uint64_t a1)
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

_QWORD *std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[35],NSDictionary *&,void>@<X0>(char *a1@<X1>, _QWORD *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x70uLL);
  result = std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[35],NSDictionary *&,std::allocator<CLConnectionMessage>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_239259078(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[35],NSDictionary *&,std::allocator<CLConnectionMessage>,0>(_QWORD *a1, char *a2, _QWORD *a3)
{
  a1[2] = 0;
  *a1 = &unk_250AC1308;
  a1[1] = 0;
  std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[35],NSDictionary *&,CLConnectionMessage*>((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_2392590C4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_250AC1308;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_250AC1308;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B839A54);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::__on_zero_shared()
{
  JUMPOUT(0x23B8399E8);
}

uint64_t std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[35],NSDictionary *&,CLConnectionMessage*>(uint64_t a1, char *a2, _QWORD *a3)
{
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  MEMORY[0x23B8399DC](a1, __p, *a3);
  if (v7 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_239259180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

_QWORD *std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[41],void>@<X0>(char *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x70uLL);
  result = std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[41],std::allocator<CLConnectionMessage>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_239259290(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[41],std::allocator<CLConnectionMessage>,0>(_QWORD *a1, char *a2)
{
  a1[2] = 0;
  *a1 = &unk_250AC1308;
  a1[1] = 0;
  std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[41],CLConnectionMessage*>((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_2392592DC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[41],CLConnectionMessage*>(uint64_t a1, char *a2)
{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  MEMORY[0x23B8399D0](a1, __p);
  if (v5 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_23925933C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x24BDE8C20]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8E08](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t CLConnection::sendMessage()
{
  return MEMORY[0x24BE60B98]();
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return MEMORY[0x24BE60BA8](this);
}

uint64_t CLConnection::setInterruptionHandler()
{
  return MEMORY[0x24BE60BB0]();
}

uint64_t CLConnection::setDisconnectionHandler()
{
  return MEMORY[0x24BE60BB8]();
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return MEMORY[0x24BE60BC0]();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return MEMORY[0x24BE60BC8](this);
}

uint64_t CLConnection::CLConnection()
{
  return MEMORY[0x24BE60BD0]();
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return MEMORY[0x24BE60BD8]();
}

{
  return MEMORY[0x24BE60BE0]();
}

void CLConnectionMessage::~CLConnectionMessage(CLConnectionMessage *this)
{
  MEMORY[0x24BE60BE8](this);
}

uint64_t CLConnectionMessage::getObjectOfClass(CLConnectionMessage *this, objc_class *a2)
{
  return MEMORY[0x24BE60BF0](this, a2);
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  return MEMORY[0x24BE60BF8](this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return MEMORY[0x24BE60C00](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_250AC10C0(__p);
}

uint64_t operator delete()
{
  return off_250AC10C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250AC10D0(__sz);
}

uint64_t operator new()
{
  return off_250AC10D8();
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

