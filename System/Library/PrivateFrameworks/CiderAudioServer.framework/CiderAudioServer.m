void sub_237B895D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_237B8970C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::GetKernel(_anonymous_namespace_ *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0)
  {
    {
    }
  }
}

void sub_237B89790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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
  __cxa_throw(exception, (struct type_info *)off_2509A2190, MEMORY[0x24BEDAAF0]);
}

void sub_237B898A4(_Unwind_Exception *a1)
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
      MEMORY[0x23B820E38](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_237B89968(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void sub_237B89AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  va_list va;

  va_start(va, a6);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void sub_237B89E38(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, __int128 buf)
{
  void *v11;
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v15;
  util *v16;
  NSObject *v17;

  if (a2)
  {

    if (a10)
    {
      p_shared_owners = (unint64_t *)&a10->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
        std::__shared_weak_count::__release_weak(a10);
      }
    }

    std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&InCider::InstanceOpt(void)::theInstance);
    v16 = (util *)__cxa_begin_catch(a1);
    util::server_log(v16);
    v17 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "InCider.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 35;
      _os_log_impl(&dword_237B88000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Couldn't launch InCider service", (uint8_t *)&buf, 0x12u);
    }
    __cxa_end_catch();
    JUMPOUT(0x237B89E04);
  }
  _Unwind_Resume(a1);
}

void sub_237B8A2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, const void *a11, const void *a12)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(&a11);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a12);

  _Unwind_Resume(a1);
}

void sub_237B8A52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, const void *a11, const void *a12)
{
  applesauce::CF::DictionaryRef::~DictionaryRef(&a11);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a12);

  _Unwind_Resume(a1);
}

void sub_237B8A660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&a9);

  _Unwind_Resume(a1);
}

void sub_237B8A800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void sub_237B8ACF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  void *v13;
  std::__shared_weak_count *v14;
  void *v16;

  std::__shared_weak_count::~__shared_weak_count(v14);
  operator delete(v16);
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&a13);

  _Unwind_Resume(a1);
}

void sub_237B8B6D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B8BFB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B8C210(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_237B8C588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B8CAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_237B8CF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_237B8D594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B8DEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B8E3D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_237B8EBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,const void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  __cxa_free_exception(v24);

  if (v22)
    operator delete(v22);
  applesauce::CF::ArrayRef::~ArrayRef(&a22);

  _Unwind_Resume(a1);
}

void sub_237B8F0F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_237B8F99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, const void *a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char *a32)
{
  void *v32;
  void *v33;

  __cxa_free_exception(v33);

  if (a18)
  {
    a32 = &a15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a32);
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a20);

  _Unwind_Resume(a1);
}

void sub_237B8FD30(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B90000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_237B9034C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_237B90468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  uint64_t v12;

  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v12 - 24));
  *(_QWORD *)(v12 - 24) = &a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v12 - 24));

  _Unwind_Resume(a1);
}

void sub_237B90B40(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B91220(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B91950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B91A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_237B91B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_237B91BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_237B922F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_237B923FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_237B92490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_237B92524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_237B926FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_237B928CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  void *v5;

  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = MEMORY[0x23B821144](a2);
  if (v3)
  {
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;

  }
  else
  {
    *(_QWORD *)a1 = v4;
    *(_BYTE *)(a1 + 8) = 1;
  }
  return a1;
}

uint64_t std::pair<int,applesauce::CF::DataRef>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  return a1;
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<std::string>(__int128 **a1)
{
  __int128 *v1;
  __int128 *v2;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  int64x2_t v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  int64x2_t v24;
  char *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  CFArrayRef CFArray;
  std::string __p;
  int64x2_t v33;
  char *v34;
  void *v35;
  int64x2_t v36;
  unint64_t v37;
  char **v38;

  v1 = *a1;
  v2 = a1[1];
  v33 = 0uLL;
  v34 = 0;
  if (v2 != v1)
  {
    v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v2 - (char *)v1) >> 3);
    if (v4 >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v38 = &v34;
    v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v4);
    v7 = (_QWORD *)v33.i64[1];
    v8 = (_QWORD *)v33.i64[0];
    if (v33.i64[1] == v33.i64[0])
    {
      v11 = vdupq_n_s64(v33.u64[1]);
      v9 = v5;
    }
    else
    {
      v9 = v5;
      do
      {
        v10 = *--v7;
        *((_QWORD *)v9 - 1) = v10;
        v9 -= 8;
        *v7 = 0;
      }
      while (v7 != v8);
      v11 = v33;
    }
    v33.i64[0] = (uint64_t)v9;
    v33.i64[1] = (uint64_t)v5;
    v36 = v11;
    v12 = v34;
    v34 = &v5[8 * v6];
    v37 = (unint64_t)v12;
    v35 = (void *)v11.i64[0];
    std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer((uint64_t)&v35);
    v1 = *a1;
    v2 = a1[1];
  }
  for (; v1 != v2; v1 = (__int128 *)((char *)v1 + 24))
  {
    if (*((char *)v1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *((_QWORD *)v1 + 1));
    }
    else
    {
      v13 = *v1;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v1 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    v14 = v33.i64[1];
    if (v33.i64[1] >= (unint64_t)v34)
    {
      v16 = (v33.i64[1] - v33.i64[0]) >> 3;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v17 = (uint64_t)&v34[-v33.i64[0]] >> 2;
      if (v17 <= v16 + 1)
        v17 = v16 + 1;
      if ((unint64_t)&v34[-v33.i64[0]] >= 0x7FFFFFFFFFFFFFF8)
        v18 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      v38 = &v34;
      if (v18)
        v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v18);
      else
        v19 = 0;
      v35 = (void *)v18;
      v36.i64[0] = v18 + 8 * v16;
      v36.i64[1] = v36.i64[0];
      v37 = v18 + 8 * v19;
      std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>((CFStringRef *)v36.i64[0], (const UInt8 *)&__p);
      v20 = v36.i64[0];
      v15 = v36.i64[1] + 8;
      v36.i64[1] += 8;
      v21 = (_QWORD *)v33.i64[1];
      v22 = (_QWORD *)v33.i64[0];
      if (v33.i64[1] == v33.i64[0])
      {
        v24 = vdupq_n_s64(v33.u64[1]);
      }
      else
      {
        do
        {
          v23 = *--v21;
          *(_QWORD *)(v20 - 8) = v23;
          v20 -= 8;
          *v21 = 0;
        }
        while (v21 != v22);
        v24 = v33;
        v15 = v36.i64[1];
      }
      v33.i64[0] = v20;
      v33.i64[1] = v15;
      v36 = v24;
      v25 = v34;
      v34 = (char *)v37;
      v37 = (unint64_t)v25;
      v35 = (void *)v24.i64[0];
      std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer((uint64_t)&v35);
    }
    else
    {
      std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>((CFStringRef *)v33.i64[1], (const UInt8 *)&__p);
      v15 = v14 + 8;
    }
    v33.i64[1] = v15;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::vector<void const*>::vector(&v35, (v33.i64[1] - v33.i64[0]) >> 3);
  v27 = (uint64_t *)v33.i64[1];
  v26 = (uint64_t *)v33.i64[0];
  if (v33.i64[0] != v33.i64[1])
  {
    v28 = v35;
    do
    {
      v29 = *v26++;
      *v28++ = v29;
    }
    while (v26 != v27);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)v35, v36.i64[0]);
  if (v35)
  {
    v36.i64[0] = (uint64_t)v35;
    operator delete(v35);
  }
  v35 = &v33;
  std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  return CFArray;
}

void sub_237B92C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  a9 = &a16;
  std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
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

CFStringRef *std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>(CFStringRef *a1, const UInt8 *a2)
{
  CFIndex v3;
  CFIndex v4;
  CFStringRef v5;
  void *exception;

  v3 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v4 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    v4 = v3;
  }
  v5 = CFStringCreateWithBytes(0, a2, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237B92DC8(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

void std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  const void *v6;

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
        v6 = (const void *)*((_QWORD *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(const void *a1)
{
  if (a1)
    CFRelease(a1);
}

void std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

uint64_t std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  const void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(const void **)(i - 8);
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::vector<void const*>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  uint64_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    *a1 = v4;
    a1[2] = &v4[8 * v5];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_237B92FA8(_Unwind_Exception *exception_object)
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

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(const void **values, uint64_t a2)
{
  CFArrayRef result;
  applesauce::CF *exception;

  result = CFArrayCreate(0, values, (a2 - (uint64_t)values) >> 3, MEMORY[0x24BDBD690]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_237B93010()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_237B93028(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
  JUMPOUT(0x23B820E38);
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
      MEMORY[0x23B820E38](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_237B930C4(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(uint64_t result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  _QWORD *v6;
  std::string *v7;
  std::string *v8;
  uint64_t v9;
  __int128 v10;
  _QWORD v11[3];
  char v12;
  std::string *v13;
  std::string *v14;

  if (a4)
  {
    if (a4 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v6 = (_QWORD *)result;
    v7 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a4);
    v8 = v7;
    *v6 = v7;
    v6[1] = v7;
    v6[2] = &v7[v9];
    v14 = v7;
    v13 = v7;
    v11[0] = v6 + 2;
    v11[1] = &v13;
    v11[2] = &v14;
    v12 = 0;
    if (a2 != a3)
    {
      do
      {
        if (*((char *)a2 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
          v7 = v14;
        }
        else
        {
          v10 = *a2;
          v7->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
          *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v10;
        }
        a2 = (__int128 *)((char *)a2 + 24);
        v14 = ++v7;
      }
      while (a2 != a3);
      v8 = v7;
    }
    v12 = 1;
    result = std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
    v6[1] = v8;
  }
  return result;
}

void sub_237B931EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *applesauce::CF::details::CFString_get_value<true>(uint64_t a1, CFStringRef theString)
{
  char *CStringPtr;
  CFIndex Length;
  UInt8 *v7;
  CFIndex maxBufLen;
  CFRange v9;
  CFRange v10;

  CStringPtr = (char *)CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
    return std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, CStringPtr);
  Length = CFStringGetLength(theString);
  maxBufLen = 0;
  v9.location = 0;
  v9.length = Length;
  CFStringGetBytes(theString, v9, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  std::string::basic_string[abi:ne180100]((_QWORD *)a1, maxBufLen);
  if (*(char *)(a1 + 23) >= 0)
    v7 = (UInt8 *)a1;
  else
    v7 = *(UInt8 **)a1;
  v10.location = 0;
  v10.length = Length;
  return (_QWORD *)CFStringGetBytes(theString, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
}

void sub_237B932F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *a1, size_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 >= 0x17)
  {
    v5 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v5 = a2 | 7;
    v6 = v5 + 1;
    v4 = operator new(v5 + 1);
    a1[1] = a2;
    a1[2] = v6 | 0x8000000000000000;
    *a1 = v4;
  }
  else
  {
    *((_BYTE *)a1 + 23) = a2;
    v4 = a1;
    if (!a2)
      goto LABEL_9;
  }
  bzero(v4, a2);
LABEL_9:
  *((_BYTE *)v4 + a2) = 0;
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0)
        operator delete(*(void **)(v3 - 24));
      v3 -= 24;
    }
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
}

double applesauce::CF::convert_as<std::string,0>(uint64_t a1, const __CFString *a2)
{
  CFTypeID TypeID;
  double result;
  char *CStringPtr;
  CFIndex Length;
  UInt8 *v8;
  __int128 v9;
  uint64_t v10;
  CFIndex maxBufLen;
  CFRange v12;
  CFRange v13;

  if (a2 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(a2)))
  {
    CStringPtr = (char *)CFStringGetCStringPtr(a2, 0x8000100u);
    if (CStringPtr)
    {
      std::string::basic_string[abi:ne180100]<0>(&v9, CStringPtr);
    }
    else
    {
      Length = CFStringGetLength(a2);
      maxBufLen = 0;
      v12.location = 0;
      v12.length = Length;
      CFStringGetBytes(a2, v12, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
      std::string::basic_string[abi:ne180100](&v9, maxBufLen);
      if (v10 >= 0)
        v8 = (UInt8 *)&v9;
      else
        v8 = (UInt8 *)v9;
      v13.location = 0;
      v13.length = Length;
      CFStringGetBytes(a2, v13, 0x8000100u, 0, 0, v8, maxBufLen, &maxBufLen);
    }
    result = *(double *)&v9;
    *(_OWORD *)a1 = v9;
    *(_QWORD *)(a1 + 16) = v10;
    *(_BYTE *)(a1 + 24) = 1;
  }
  else
  {
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 24) = 0;
  }
  return result;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::vector<std::string>::pointer begin;
  std::string *end;
  std::__split_buffer<std::string>::pointer v4;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  std::string *v8;
  std::string *value;

  begin = this->__begin_;
  end = this->__end_;
  v4 = __v->__begin_;
  if (end == this->__begin_)
  {
    v5 = __v->__begin_;
  }
  else
  {
    do
    {
      v5 = v4 - 1;
      v6 = *(_OWORD *)&end[-1].__r_.__value_.__l.__data_;
      v4[-1].__r_.__value_.__r.__words[2] = end[-1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v4[-1].__r_.__value_.__l.__data_ = v6;
      end[-1].__r_.__value_.__l.__size_ = 0;
      end[-1].__r_.__value_.__r.__words[2] = 0;
      end[-1].__r_.__value_.__r.__words[0] = 0;
      --v4;
      --end;
    }
    while (end != begin);
  }
  __v->__begin_ = v5;
  v7 = this->__begin_;
  this->__begin_ = v5;
  __v->__begin_ = v7;
  v8 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v8;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
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

void sub_237B936AC(_Unwind_Exception *exception_object)
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
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

const __CFNumber *applesauce::CF::convert_as<unsigned int,0>(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID TypeID;
  int Value;
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  double valuePtr;

  if (result)
  {
    v1 = result;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      switch(CFNumberGetType(v1))
      {
        case kCFNumberSInt8Type:
          LOBYTE(valuePtr) = 0;
          Value = CFNumberGetValue(v1, kCFNumberSInt8Type, &valuePtr);
          goto LABEL_15;
        case kCFNumberSInt16Type:
          LOWORD(valuePtr) = 0;
          v9 = CFNumberGetValue(v1, kCFNumberSInt16Type, &valuePtr);
          goto LABEL_22;
        case kCFNumberSInt32Type:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberSInt64Type:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloat32Type:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberFloat32Type, &valuePtr);
          goto LABEL_29;
        case kCFNumberFloat64Type:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberFloat64Type, &valuePtr);
          goto LABEL_35;
        case kCFNumberCharType:
          LOBYTE(valuePtr) = 0;
          Value = CFNumberGetValue(v1, kCFNumberCharType, &valuePtr);
LABEL_15:
          v11 = Value != 0;
          if (Value)
            v12 = LOBYTE(valuePtr);
          else
            v12 = 0;
          v13 = -256;
          if ((v11 & (SLOBYTE(valuePtr) < 0)) == 0)
            v13 = 0;
          v8 = v11 << 32;
          LODWORD(v5) = v13 & 0xFFFFFF00 | v12;
          v7 = v5 & 0xFFFFFF00;
          break;
        case kCFNumberShortType:
          LOWORD(valuePtr) = 0;
          v9 = CFNumberGetValue(v1, kCFNumberShortType, &valuePtr);
LABEL_22:
          if (v9)
            v5 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
          else
            v5 = 0;
          goto LABEL_38;
        case kCFNumberIntType:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongLongType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberLongLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloatType:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberFloatType, &valuePtr);
LABEL_29:
          v14 = *(float *)&valuePtr;
          goto LABEL_36;
        case kCFNumberDoubleType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberDoubleType, &valuePtr);
          goto LABEL_35;
        case kCFNumberCFIndexType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
          goto LABEL_33;
        case kCFNumberNSIntegerType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberNSIntegerType, &valuePtr);
LABEL_33:
          v14 = LODWORD(valuePtr);
          goto LABEL_36;
        case kCFNumberCGFloatType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberCGFloatType, &valuePtr);
LABEL_35:
          v14 = valuePtr;
LABEL_36:
          v5 = v14 | 0x100000000;
          if (!v10)
            v5 = 0;
LABEL_38:
          v7 = v5 & 0xFFFFFF00;
          v8 = v5 & 0x100000000;
          break;
        default:
          v7 = 0;
          v8 = 0;
          LOBYTE(v5) = 0;
          break;
      }
      v6 = v8 | v7 & 0xFFFFFF00;
      v5 = v5;
    }
    else
    {
      v4 = CFBooleanGetTypeID();
      if (v4 == CFGetTypeID(v1))
      {
        v5 = CFBooleanGetValue(v1);
        v6 = 0x100000000;
      }
      else
      {
        v5 = 0;
        v6 = 0;
      }
    }
    return (const __CFNumber *)(v6 | v5);
  }
  return result;
}

void applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>(int64x2_t *a1, const __CFArray *a2)
{
  CFTypeID TypeID;
  CFIndex Count;
  int v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  int64x2_t v13;
  char *v14;
  CFIndex v15;
  uint64_t v16;
  const void *ValueAtIndex;
  const void *v18;
  CFTypeID v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int64x2_t v31;
  char *v32;
  const void *v33;
  char v34;
  int64x2_t v35;
  char *v36;
  int64x2_t *v37;
  int64x2_t v38;
  unint64_t v39;
  char **v40;

  TypeID = CFArrayGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    Count = CFArrayGetCount(a2);
    v6 = Count;
    v35 = 0uLL;
    v36 = 0;
    if (Count << 32)
    {
      if (Count << 32 < 0)
LABEL_36:
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v40 = &v36;
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>((int)Count);
      v9 = (_QWORD *)v35.i64[1];
      v10 = (_QWORD *)v35.i64[0];
      if (v35.i64[1] == v35.i64[0])
      {
        v13 = vdupq_n_s64(v35.u64[1]);
        v11 = v7;
      }
      else
      {
        v11 = v7;
        do
        {
          v12 = *--v9;
          *((_QWORD *)v11 - 1) = v12;
          v11 -= 8;
          *v9 = 0;
        }
        while (v9 != v10);
        v13 = v35;
      }
      v35.i64[0] = (uint64_t)v11;
      v35.i64[1] = (uint64_t)v7;
      v38 = v13;
      v14 = v36;
      v36 = &v7[8 * v8];
      v39 = (unint64_t)v14;
      v37 = (int64x2_t *)v13.i64[0];
      std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v37);
    }
    if (v6 < 1)
    {
LABEL_31:
      *a1 = v35;
      a1[1].i64[0] = (uint64_t)v36;
      v36 = 0;
      v35 = 0uLL;
      a1[1].i8[8] = 1;
    }
    else
    {
      v15 = 0;
      v16 = v6;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a2, v15);
        v18 = ValueAtIndex;
        if (!ValueAtIndex)
          break;
        CFRetain(ValueAtIndex);
        v19 = CFGetTypeID(v18);
        if (v19 != CFDictionaryGetTypeID())
        {
          CFRelease(v18);
          break;
        }
        v33 = v18;
        v34 = 1;
        v20 = (_QWORD *)v35.i64[1];
        if (v35.i64[1] >= (unint64_t)v36)
        {
          v21 = (_QWORD *)v35.i64[0];
          v22 = (v35.i64[1] - v35.i64[0]) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            goto LABEL_36;
          v24 = (uint64_t)&v36[-v35.i64[0]];
          if ((uint64_t)&v36[-v35.i64[0]] >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          v40 = &v36;
          if (v25)
          {
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v25);
            v20 = (_QWORD *)v35.i64[1];
            v21 = (_QWORD *)v35.i64[0];
            v18 = v33;
          }
          else
          {
            v26 = 0;
          }
          v27 = (_QWORD *)(v25 + 8 * v22);
          v28 = v25 + 8 * v26;
          v39 = v28;
          *v27 = v18;
          v29 = v27 + 1;
          v33 = 0;
          v38.i64[1] = (uint64_t)(v27 + 1);
          if (v20 != v21)
          {
            do
            {
              v30 = *--v20;
              *--v27 = v30;
              *v20 = 0;
            }
            while (v20 != v21);
            v29 = (_QWORD *)v38.i64[1];
            v28 = v39;
          }
          v31 = v35;
          v35.i64[0] = (uint64_t)v27;
          v35.i64[1] = (uint64_t)v29;
          v38 = v31;
          v32 = v36;
          v36 = (char *)v28;
          v39 = (unint64_t)v32;
          v37 = (int64x2_t *)v31.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v37);
          v35.i64[1] = (uint64_t)v29;
        }
        else
        {
          *(_QWORD *)v35.i64[1] = v18;
          v33 = 0;
          v35.i64[1] = (uint64_t)(v20 + 1);
        }
        std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v33);
        if (++v15 == v16)
          goto LABEL_31;
      }
      LOBYTE(v33) = 0;
      v34 = 0;
      a1->i8[0] = 0;
      a1[1].i8[8] = 0;
      std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v33);
    }
    v37 = &v35;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  }
  else
  {
    a1->i8[0] = 0;
    a1[1].i8[8] = 0;
  }
}

_QWORD *std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(_QWORD *result, CFTypeRef *a2, CFTypeRef *a3, unint64_t a4)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  CFTypeRef v9;

  if (a4)
  {
    if (a4 >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v6 = result;
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a4);
    v7 = result;
    *v6 = result;
    v6[1] = result;
    v6[2] = &result[v8];
    while (a2 != a3)
    {
      v9 = *a2;
      if (*a2)
        result = CFRetain(*a2);
      *v7++ = v9;
      ++a2;
    }
    v6[1] = v7;
  }
  return result;
}

void sub_237B93D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  const void *v6;

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
        v6 = (const void *)*((_QWORD *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(const void *a1)
{
  if (a1)
    CFRelease(a1);
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

uint64_t std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  const void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(const void **)(i - 8);
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

_QWORD *std::vector<applesauce::CF::TypeRefPair>::reserve(_QWORD *result, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  if (a2 > (uint64_t)(result[2] - *result) >> 4)
  {
    if (a2 >> 60)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v2 = result;
    v3 = result[1] - *result;
    v5[4] = result + 2;
    v5[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a2);
    v5[1] = v5[0] + v3;
    v5[2] = v5[0] + v3;
    v5[3] = v5[0] + 16 * v4;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(v2, v5);
    return (_QWORD *)std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)v5);
  }
  return result;
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(void ***a1)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v5;
  void **v6;
  void **v7;
  void **v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void **v14;
  void *v15;
  void *v16;
  void **v17;
  void **v18;
  void **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void **v25;
  void *v26;
  void **v27;
  void **v28;
  CFDictionaryRef v29;
  void *exception;
  void *v32;
  void **values;
  void **v34;
  unint64_t v35;
  void **keys;
  void **v37;
  unint64_t v38;

  v2 = ((char *)a1[1] - (char *)*a1) >> 4;
  keys = 0;
  v37 = 0;
  v38 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  v34 = 0;
  v35 = 0;
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
        MEMORY[0x23B820E38](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v6 = v37;
      if ((unint64_t)v37 >= v38)
      {
        v8 = keys;
        v9 = v37 - keys;
        v10 = v9 + 1;
        if ((unint64_t)(v9 + 1) >> 61)
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        v11 = v38 - (_QWORD)keys;
        if ((uint64_t)(v38 - (_QWORD)keys) >> 2 > v10)
          v10 = v11 >> 2;
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
          v12 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v12 = v10;
        if (v12)
          v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v12);
        else
          v13 = 0;
        v14 = (void **)(v12 + 8 * v9);
        *v14 = v5;
        v7 = v14 + 1;
        if (v6 != v8)
        {
          do
          {
            v15 = *--v6;
            *--v14 = v15;
          }
          while (v6 != v8);
          v6 = keys;
        }
        keys = v14;
        v38 = v12 + 8 * v13;
        if (v6)
          operator delete(v6);
      }
      else
      {
        *v37 = v5;
        v7 = v6 + 1;
      }
      v37 = v7;
      v16 = v3[1];
      v17 = v34;
      if ((unint64_t)v34 >= v35)
      {
        v19 = values;
        v20 = v34 - values;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61)
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        v22 = v35 - (_QWORD)values;
        if ((uint64_t)(v35 - (_QWORD)values) >> 2 > v21)
          v21 = v22 >> 2;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
          v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v23);
        else
          v24 = 0;
        v25 = (void **)(v23 + 8 * v20);
        *v25 = v16;
        v18 = v25 + 1;
        if (v17 != v19)
        {
          do
          {
            v26 = *--v17;
            *--v25 = v26;
          }
          while (v17 != v19);
          v17 = values;
        }
        values = v25;
        v35 = v23 + 8 * v24;
        if (v17)
          operator delete(v17);
      }
      else
      {
        *v34 = v16;
        v18 = v17 + 1;
      }
      v34 = v18;
      v3 += 2;
    }
    while (v3 != v4);
  }
  v27 = keys;
  v28 = values;
  v29 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v29)
  {
    v32 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v32, "Could not construct");
    __cxa_throw(v32, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (v28)
    operator delete(v28);
  if (v27)
    operator delete(v27);
  return v29;
}

void sub_237B941B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  __cxa_free_exception(v12);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
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
        std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(*(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(void **__p)
{
  void **v1;
  void **v2;

  if (__p)
  {
    v1 = __p;
    do
    {
      v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0)
        operator delete(v1[2]);
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
}

CFStringRef *applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>(CFStringRef *a1, const UInt8 *a2, int *a3)
{
  CFIndex v5;
  CFIndex v6;
  CFStringRef v7;
  CFNumberRef v8;
  void *exception;
  void *v11;
  int valuePtr;

  v5 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v6 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    v6 = v5;
  }
  v7 = CFStringCreateWithBytes(0, a2, v6, 0x8000100u, 0);
  *a1 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  valuePtr = *a3;
  v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = (CFStringRef)v8;
  if (!v8)
  {
    v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237B94420(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

_QWORD *std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *(v2 - 2);
    v2 -= 2;
    *(_QWORD *)(v4 - 16) = v5;
    v4 -= 16;
    *v2 = 0;
    *(_QWORD *)(v4 + 8) = v2[1];
    v2[1] = 0;
  }
  a2[1] = v4;
  v6 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    v7 = &v4[8 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
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
      MEMORY[0x23B820E38](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_237B946AC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

applesauce::CF::ArrayRef *applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef(applesauce::CF::ArrayRef *a1, CFTypeRef *a2)
{
  CFTypeID v4;
  CFTypeRef v5;
  applesauce::CF *exception;

  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 != CFArrayGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    v5 = *a2;
    if (v5)
      CFRetain(v5);
  }
  else
  {
    v5 = 0;
  }
  return applesauce::CF::ArrayRef::ArrayRef(a1, v5);
}

void sub_237B94750()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_237B94768(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(applesauce::CF::DictionaryRef *a1, CFTypeRef *a2)
{
  CFTypeID v4;
  CFTypeRef v5;
  applesauce::CF *exception;

  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 != CFDictionaryGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    v5 = *a2;
    if (v5)
      CFRetain(v5);
  }
  else
  {
    v5 = 0;
  }
  return applesauce::CF::DictionaryRef::DictionaryRef(a1, v5);
}

void sub_237B947F8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_237B94810(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::TypeRef::operator applesauce::CF::StringRef(applesauce::CF::StringRef *a1, CFTypeRef *a2)
{
  CFTypeID v4;
  CFTypeRef v5;
  applesauce::CF *exception;

  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 != CFStringGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    v5 = *a2;
    if (v5)
      CFRetain(v5);
  }
  else
  {
    v5 = 0;
  }
  return applesauce::CF::StringRef::StringRef(a1, v5);
}

void sub_237B948A0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_237B948B8(_Unwind_Exception *a1)
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

uint64_t std::pair<int,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t std::weak_ptr<ads::Kernel>::~weak_ptr(uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void std::__shared_ptr_emplace<ads::Kernel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_2509A2450;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ads::Kernel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_2509A2450;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B820F34);
}

void std::__shared_ptr_emplace<ads::Kernel>::__on_zero_shared(uint64_t a1)
{
  ads::Kernel::~Kernel((id *)(a1 + 24));
}

void InCider::InstanceOpt(InCider *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0)
  {
    {
      __cxa_atexit((void (*)(void *))std::optional<InCider>::~optional, &InCider::InstanceOpt(void)::theInstance, &dword_237B88000);
    }
  }
}

void InCider::~InCider(id **this)
{
  NSObject *v2;
  id *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  util::server_log((util *)objc_msgSend(*this[2], "invalidate"));
  v2 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "InCider.mm";
    v6 = 1024;
    v7 = 950;
    _os_log_impl(&dword_237B88000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d InCider object destroyed", (uint8_t *)&v4, 0x12u);
  }
  v3 = this[2];
  this[2] = 0;
  if (v3)
    std::default_delete<InCider::ServiceAttributes>::operator()[abi:ne180100](v3);
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void sub_237B94AEC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::default_delete<InCider::ServiceAttributes>::operator()[abi:ne180100](id *a1)
{

  JUMPOUT(0x23B820F34);
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_2509A24A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_2509A24A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B820F34);
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::__on_zero_shared(uint64_t a1)
{
  const void *v2;
  const void *v3;

  if (*(_BYTE *)(a1 + 72))

  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
  if (*(_BYTE *)(a1 + 40))

  v3 = *(const void **)(a1 + 24);
  if (v3)
    CFRelease(v3);
}

void std::optional<InCider>::~optional(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
    InCider::~InCider((id **)a1);
}

BOOL icp::IsSimulatedDevice(icp *this)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  _DWORD *v5;
  _DWORD *v6;

  v1 = (int)this;
  ads::Kernel::getADSDevices((ads::Kernel *)&v5);
  v2 = v6;
  v3 = v5;
  if (v5 != v6)
  {
    v3 = v5;
    while (*v3 != v1)
    {
      if (++v3 == v6)
      {
        v3 = v6;
        break;
      }
    }
  }
  if (v5)
    operator delete(v5);
  return v3 != v2;
}

uint64_t ads::Kernel::getADSPluginAOID(ads::Kernel *this)
{
  unint64_t v1;
  uint64_t v2;
  __int128 v3;
  int v5;
  AudioObjectID *v6;
  void **p_p;
  AudioObjectID *v8;
  AudioObjectID *v9;
  AudioObjectID v10;
  int v11;
  void *v13;
  __int128 v14;
  char v15;
  void *__p;
  void *v17;
  __int128 v18;
  unsigned __int8 v19;
  AudioObjectID v20;

  if (!ads::Kernel::getADSPluginAOID(void)::value)
  {
    LODWORD(v13) = 1;
    __p = (void *)0x676C6F6265414453;
    LODWORD(v17) = 0;
    v1 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v13, (const AudioObjectPropertyAddress *)&__p);
    *((_QWORD *)&v3 + 1) = v2;
    *(_QWORD *)&v3 = v1;
    if (((v3 >> 32) & 0xFF00000000) != 0 && HIDWORD(v1) != 0)
    {
      v20 = 1;
      v13 = (void *)0x676C6F62706C6723;
      LODWORD(v14) = 0;
      ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, &v20, (AudioObjectPropertyAddress *)&v13);
      LOBYTE(v13) = 0;
      v5 = v19;
      if (v19)
      {
        v13 = v17;
        v14 = v18;
        v15 = 1;
        v6 = (AudioObjectID *)v18;
        p_p = &v13;
      }
      else
      {
        v6 = 0;
        p_p = &__p;
      }
      __p = 0;
      v17 = 0;
      *(_QWORD *)&v18 = 0;
      v8 = (AudioObjectID *)*p_p;
      p_p[1] = 0;
      p_p[2] = 0;
      *p_p = 0;
      if (__p)
        operator delete(__p);
      if (v5 && v13)
        operator delete(v13);
      if (v8 == v6)
        goto LABEL_19;
      v9 = v8;
      while (1)
      {
        v10 = *v9;
        if (*v9)
        {
          __p = (void *)0x676C6F626465764DLL;
          LODWORD(v17) = 0;
          if (AudioObjectHasProperty(v10, (const AudioObjectPropertyAddress *)&__p))
            break;
        }
        if (++v9 == v6)
          goto LABEL_19;
      }
      if (v9 == v6)
LABEL_19:
        v11 = 0;
      else
        v11 = *v9;
      ads::Kernel::getADSPluginAOID(void)::value = v11;
      if (v8)
        operator delete(v8);
    }
  }
  return ads::Kernel::getADSPluginAOID(void)::value;
}

BOOL ads::Device::IsConnected(ads::Device *this)
{
  void *v2;
  _DWORD *v3;
  CFTypeRef *p_cf;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  int v9;
  const void **v10;
  void **v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v18;
  _BOOL8 v19;
  void *exception;
  CFTypeRef cf;
  _BYTE v23[16];
  void *__p[2];
  unsigned __int8 v25;
  _DWORD *v26;
  _DWORD *v27;

  ads::Kernel::getADSDevices((ads::Kernel *)&v26);
  v2 = v26;
  if (v26 == v27)
  {
    v3 = v26;
  }
  else
  {
    v3 = v26;
    while (*v3 != *((_DWORD *)this + 2))
    {
      if (++v3 == v27)
      {
        v3 = v27;
        break;
      }
    }
  }
  if (v3 == v27)
  {
    v19 = 0;
    if (!v26)
      return v19;
    goto LABEL_40;
  }
  ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(v23, *((_DWORD *)this + 2), 1735159650, 0);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, "");
  if (v23[8])
    p_cf = (CFTypeRef *)v23;
  else
    p_cf = &cf;
  v5 = (const __CFString *)*p_cf;
  *p_cf = 0;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  applesauce::CF::convert_to<std::string,0>((uint64_t)__p, v5);
  v6 = *((unsigned __int8 *)this + 39);
  if ((v6 & 0x80u) == 0)
    v7 = (void *)*((unsigned __int8 *)this + 39);
  else
    v7 = (void *)*((_QWORD *)this + 3);
  v8 = v25;
  v9 = (char)v25;
  if ((v25 & 0x80u) != 0)
    v8 = (unint64_t)__p[1];
  if (v7 != (void *)v8)
  {
    v19 = 0;
    if (((char)v25 & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  v10 = (const void **)((char *)this + 16);
  if ((v25 & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  if ((v6 & 0x80) != 0)
  {
    v19 = memcmp(*v10, v11, *((_QWORD *)this + 3)) == 0;
    goto LABEL_35;
  }
  if (*((_BYTE *)this + 39))
  {
    v12 = v6 - 1;
    do
    {
      v14 = *(unsigned __int8 *)v10;
      v10 = (const void **)((char *)v10 + 1);
      v13 = v14;
      v16 = *(unsigned __int8 *)v11;
      v11 = (void **)((char *)v11 + 1);
      v15 = v16;
      v18 = v12-- != 0;
      v19 = v13 == v15;
    }
    while (v13 == v15 && v18);
LABEL_35:
    if ((v9 & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  v19 = 1;
  if ((char)v25 < 0)
LABEL_36:
    operator delete(__p[0]);
LABEL_37:
  CFRelease(v5);
  if (cf)
    CFRelease(cf);
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v23);
  if (v2)
LABEL_40:
    operator delete(v2);
  return v19;
}

void sub_237B94FC8(void *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  __clang_call_terminate(a1);
}

void ads::Kernel::getADSDevices(ads::Kernel *this)
{
  AudioObjectID ADSPluginAOID;
  int v3;
  void **p_p;
  __int128 v5;
  void *v6;
  AudioObjectPropertyAddress v7[2];
  void *__p;
  uint64_t v9;
  __int128 v10;
  unsigned __int8 v11;
  AudioObjectID v12;

  ADSPluginAOID = ads::Kernel::getADSPluginAOID(this);
  if (ADSPluginAOID)
  {
    v12 = ADSPluginAOID;
    *(_QWORD *)&v7[0].mSelector = 0x676C6F6264657623;
    v7[0].mElement = 0;
    ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, &v12, v7);
    LOBYTE(v7[0].mSelector) = 0;
    v3 = v11;
    if (v11)
    {
      *(_QWORD *)&v7[0].mSelector = v9;
      p_p = (void **)v7;
      v5 = v10;
    }
    else
    {
      v5 = 0uLL;
      p_p = &__p;
    }
    __p = 0;
    v9 = 0;
    *(_QWORD *)&v10 = 0;
    v6 = *p_p;
    p_p[1] = 0;
    p_p[2] = 0;
    *p_p = 0;
    *(_QWORD *)this = v6;
    *(_OWORD *)((char *)this + 8) = v5;
    if (__p)
      operator delete(__p);
    if (v3)
    {
      if (*(_QWORD *)&v7[0].mSelector)
        operator delete(*(void **)&v7[0].mSelector);
    }
  }
  else
  {
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
    *((_QWORD *)this + 2) = 0;
  }
}

uint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(AudioObjectID a1, const AudioObjectPropertyAddress *a2, void *inQualifierData, uint64_t a4)
{
  uint64_t inData;

  inData = a4;
  return AudioObjectSetPropertyData(a1, a2, 8u, inQualifierData, 8u, &inData);
}

uint64_t ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(_BYTE *a1, AudioObjectID a2, uint64_t a3, AudioObjectPropertyElement a4)
{
  _BYTE v6[8];
  uint64_t v7;
  char v8;
  AudioObjectPropertyAddress inAddress;
  AudioObjectID v10;

  v10 = a2;
  *(_QWORD *)&inAddress.mSelector = (a3 << 32) | 0x75696420;
  inAddress.mElement = a4;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::StringRef,void>::Get((uint64_t)v6, &v10, &inAddress, 0, 0);
  *a1 = 0;
  a1[8] = 0;
  if (v8)
  {
    *(_QWORD *)a1 = v7;
    v7 = 0;
    a1[8] = 1;
  }
  return std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
}

_QWORD *applesauce::CF::convert_to<std::string,0>(uint64_t a1, const __CFString *a2)
{
  CFTypeID TypeID;
  applesauce::CF *exception;

  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return applesauce::CF::details::CFString_get_value<true>(a1, a2);
}

void sub_237B951C4()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_237B951DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(unint64_t a1)
{
  if (a1 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(12 * a1);
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
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return this;
}

void sub_237B95320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  CFTypeRef *v15;

  if (*v15)
    CFRelease(*v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
  JUMPOUT(0x23B820E38);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::StringRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress, const AudioObjectPropertyAddress *a4, const void *a5)
{
  const void *v10;
  OSStatus PropertyData;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef v15;
  UInt32 ioDataSize;
  const void *outData;
  char v18;

  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    v18 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, a4, a5, v10);
    if (ioDataSize)
    {
      outData = 0;
      PropertyData = AudioObjectGetPropertyData(*a2, inAddress, (UInt32)a4, a5, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        v12 = outData;
        v15 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::StringRef((applesauce::CF::StringRef *)&v14, &v15);
        v13 = v14;
        *(_BYTE *)(a1 + 16) = 1;
        *(_QWORD *)(a1 + 8) = v13;
        if (v12)
          CFRelease(v12);
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    v18 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

uint64_t ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize(ca::hal::detail::HALPropertyPolicy *this, const AudioObjectPropertyAddress *a2, const AudioObjectPropertyAddress *a3, const void *a4, const void *a5)
{
  UInt32 outDataSize;

  outDataSize = 0;
  if (AudioObjectGetPropertyDataSize((AudioObjectID)this, a2, (UInt32)a3, a4, &outDataSize))
    return 0;
  else
    return outDataSize;
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>,std::back_insert_iterator<std::vector<unsigned int>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v3;
  _DWORD *v4;
  uint64_t v6;

  v3 = a1;
  v6 = a3;
  if (a1 == a2)
    return a1;
  v4 = a2;
  do
    std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  unint64_t v16;
  int v17;

  v4 = *a1;
  v6 = *(_DWORD **)(*a1 + 8);
  v5 = *(_QWORD *)(*a1 + 16);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_DWORD **)v4;
    v9 = ((uint64_t)v6 - *(_QWORD *)v4) >> 2;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL;
    v13 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13)
    {
      v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v13);
      v8 = *(_DWORD **)v4;
      v6 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = (_DWORD *)(v13 + 4 * v9);
    v16 = v13 + 4 * v14;
    *v15 = *a2;
    v7 = v15 + 1;
    while (v6 != v8)
    {
      v17 = *--v6;
      *--v15 = v17;
    }
    *(_QWORD *)v4 = v15;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v16;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  const void *v6;
  UInt32 PropertyDataSize;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  OSStatus PropertyData;
  OSStatus v12;
  uint64_t v13;
  UInt32 ioDataSize;
  int v15;
  void *__p[2];
  uint64_t v17;
  char v18;

  if (!AudioObjectHasProperty(*a2, inAddress))
  {
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 0;
    return;
  }
  v15 = 2003329396;
  LOBYTE(__p[0]) = 0;
  v18 = 0;
  PropertyDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
  ioDataSize = PropertyDataSize;
  if (!PropertyDataSize)
  {
    *(_DWORD *)a1 = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 1;
    return;
  }
  if (PropertyDataSize >= 4)
  {
    v10 = PropertyDataSize >> 2;
    v8 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v10);
    bzero(v8, 4 * v10);
    v9 = (uint64_t)v8 + 4 * v10;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, v8);
  v12 = PropertyData;
  v15 = PropertyData;
  if (PropertyData)
  {
    *(_DWORD *)a1 = PropertyData;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 0;
    if (!v8)
      goto LABEL_11;
    goto LABEL_10;
  }
  __p[0] = 0;
  __p[1] = 0;
  v17 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(__p, v8, v9, (v9 - (uint64_t)v8) >> 2);
  *(_DWORD *)a1 = v15;
  v13 = v17;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)__p;
  *(_QWORD *)(a1 + 24) = v13;
  __p[1] = 0;
  v17 = 0;
  __p[0] = 0;
  *(_BYTE *)(a1 + 32) = 1;
  if (v8)
LABEL_10:
    operator delete(v8);
LABEL_11:
  if (!v12)
  {
    if (__p[0])
      operator delete(__p[0]);
  }
}

unint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get(AudioObjectID *a1, const AudioObjectPropertyAddress *a2)
{
  const void *v4;
  unsigned int PropertyData;
  uint64_t v6;
  _DWORD outData[5];
  UInt32 ioDataSize[4];

  if (AudioObjectHasProperty(*a1, a2))
  {
    ioDataSize[0] = 2003329396;
    *(_QWORD *)&ioDataSize[1] = 0;
    PropertyData = 2003329396;
    v6 = 0;
    ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a1, a2, 0, 0, v4);
    if (ioDataSize[0])
    {
      outData[0] = 0;
      PropertyData = AudioObjectGetPropertyData(*a1, a2, 0, 0, ioDataSize, outData);
      if (PropertyData)
        v6 = 0;
      else
        v6 = outData[0];
    }
  }
  else
  {
    v6 = 0;
    PropertyData = 2003332927;
  }
  return PropertyData | (unint64_t)(v6 << 32);
}

uint64_t ads::Device::Disconnect(ads::Device *this)
{
  AudioObjectID ADSPluginAOID;
  AudioObjectID v3;
  _BOOL8 IsConnected;
  NSObject *v5;
  _QWORD *v6;
  int v7;
  const UInt8 *v8;
  char *v9;
  const UInt8 *v10;
  int v11;
  const UInt8 *v12;
  CFIndex v13;
  CFStringRef v14;
  CFStringRef v15;
  uint64_t v16;
  void *exception;
  AudioObjectPropertyAddress v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _QWORD *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  ADSPluginAOID = ads::Kernel::getADSPluginAOID(this);
  if (!ADSPluginAOID)
    return 1937010544;
  v3 = ADSPluginAOID;
  IsConnected = ads::Device::IsConnected(this);
  if (!IsConnected)
    return 1852797029;
  util::server_log((util *)IsConnected);
  v5 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (_QWORD *)((char *)this + 16);
    if (*((char *)this + 39) < 0)
      v6 = (_QWORD *)*v6;
    v7 = *((_DWORD *)this + 2);
    v19.mSelector = 136315906;
    *(_QWORD *)&v19.mScope = "ADS_Management_Kernel.mm";
    v20 = 1024;
    v21 = 140;
    v22 = 2080;
    v23 = v6;
    v24 = 1024;
    v25 = v7;
    _os_log_impl(&dword_237B88000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disconnecting device named %s with ID %u.", (uint8_t *)&v19, 0x22u);
  }
  v10 = (const UInt8 *)*((_QWORD *)this + 2);
  v9 = (char *)this + 16;
  v8 = v10;
  v11 = v9[23];
  if (v11 >= 0)
    v12 = (const UInt8 *)v9;
  else
    v12 = v8;
  if (v11 >= 0)
    v13 = v9[23];
  else
    v13 = *((_QWORD *)v9 + 1);
  v14 = CFStringCreateWithBytes(0, v12, v13, 0x8000100u, 0);
  v15 = v14;
  if (!v14)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  CFRetain(v14);
  *(_QWORD *)&v19.mSelector = 0x676C6F626465764DLL;
  v19.mElement = 0;
  v16 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v3, &v19, &ads::Device::Disconnect(void)::kDestroy, (uint64_t)v15);
  CFRelease(v15);
  CFRelease(v15);
  return v16;
}

void sub_237B95A48(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(uint64_t a1, AudioObjectPropertyElement a2, void *inData)
{
  AudioObjectPropertyAddress v4;

  *(_QWORD *)&v4.mSelector = (a1 << 32) | 0x65414453;
  v4.mElement = a2;
  return AudioObjectSetPropertyData(1u, &v4, 0, 0, 4u, inData);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>((uint64_t)(v1 + 2));
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>(uint64_t a1)
{
  ads::Device::~Device((ads::Device *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void ads::Device::~Device(ads::Device *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
  if (*(_QWORD *)this)
    CFRelease(*(CFTypeRef *)this);
}

ads::Kernel *ads::Kernel::Kernel(ads::Kernel *this)
{
  util *v2;
  NSObject *v3;
  std::logic_error *exception;
  void *v6;
  AudioObjectPropertyAddress v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *((_QWORD *)this + 7) = dispatch_queue_create("ADSKernelQueue", 0);
  *(_QWORD *)&v7.mSelector = 0x676C6F6265414453;
  v7.mElement = 0;
  if (!AudioObjectHasProperty(1u, &v7))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Device does not have ADS");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
    __cxa_throw(exception, (struct type_info *)off_2509A21A0, MEMORY[0x24BEDAB88]);
  }
  v7.mSelector = 1;
  v2 = (util *)ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(1735159650, 0, &v7);
  if ((_DWORD)v2)
  {
    v6 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v6, "Device could not enable ADS");
    __cxa_throw(v6, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  util::server_log(v2);
  v3 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7.mSelector = 136315394;
    *(_QWORD *)&v7.mScope = "ADS_Management_Kernel.mm";
    v8 = 1024;
    v9 = 177;
    _os_log_impl(&dword_237B88000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ADS enabled and ads::Kernel object constructed", (uint8_t *)&v7, 0x12u);
  }
  return this;
}

void sub_237B95D88(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  std::__shared_weak_count *v5;

  v4 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table(v2);
  v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(a1);
}

uint64_t ads::Kernel::disconnectAllADSDevices(ads::Kernel *this)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  ads::Kernel *v5;
  _QWORD block[6];
  unsigned int v7;

  v5 = this;
  v1 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23disconnectAllADSDevicesEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(v2, block);
  v3 = v7;

  return v3;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23disconnectAllADSDevicesEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t i;

  v2 = *(uint64_t **)(a1 + 40);
  v3 = *v2;
  v4 = *(_QWORD **)(*v2 + 32);
  if (!v4)
    goto LABEL_16;
  v5 = 0;
  do
  {
    v6 = ads::Device::Disconnect((ads::Device *)(v4 + 5));
    if (v6)
      v5 = v6;
    v4 = (_QWORD *)*v4;
  }
  while (v4);
  if (!v5)
  {
LABEL_16:
    if (*(_QWORD *)(v3 + 40))
    {
      std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(*(_QWORD **)(v3 + 32));
      *(_QWORD *)(v3 + 32) = 0;
      v7 = *(_QWORD *)(v3 + 24);
      if (v7)
      {
        for (i = 0; i != v7; ++i)
          *(_QWORD *)(*(_QWORD *)(v3 + 16) + 8 * i) = 0;
      }
      v5 = 0;
      *(_QWORD *)(v3 + 40) = 0;
    }
    else
    {
      v5 = 0;
    }
  }
  **(_DWORD **)(a1 + 32) = v5;
}

void ads::Kernel::~Kernel(id *this)
{
  util *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  std::__shared_weak_count *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  ads::Kernel::disconnectAllADSDevices((ads::Kernel *)this);
  v11 = 0;
  v2 = (util *)ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(1735159650, 0, &v11);
  v3 = (int)v2;
  util::server_log(v2);
  v4 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 136315394;
    v12 = "ADS_Management_Kernel.mm";
    v13 = 1024;
    v14 = 188;
    v6 = "%25s:%-5d ads::Kernel object destroyed, but could not disable ADS";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v11 = 136315394;
    v12 = "ADS_Management_Kernel.mm";
    v13 = 1024;
    v14 = 193;
    v6 = "%25s:%-5d ADS disabled and ads::Kernel object destroyed";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_237B88000, v7, v8, v6, (uint8_t *)&v11, 0x12u);
LABEL_7:
  v9 = this[7];
  this[7] = 0;

  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table((uint64_t)(this + 2));
  v10 = (std::__shared_weak_count *)this[1];
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getADSDeviceMapEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unsigned __int8 **v11;
  unsigned __int8 *i;
  unint64_t v13;
  char *v14;
  std::string *v15;
  __int128 v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD **v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *j;
  unint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void **v44;
  void *__p[2];
  __int128 v47;
  float v48;

  v2 = **(_QWORD **)(a1 + 40);
  *(_OWORD *)__p = 0u;
  v47 = 0u;
  v48 = 1.0;
  v3 = *(uint64_t **)(v2 + 32);
  if (v3)
  {
    v4 = 0;
    while (1)
    {
      v5 = *((_DWORD *)v3 + 12);
      v6 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v3 + 2));
      v7 = v6;
      v8 = (int8x8_t)__p[1];
      if (__p[1])
      {
        v9 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
        v9.i16[0] = vaddlv_u8(v9);
        v10 = v9.u32[0];
        if (v9.u32[0] > 1uLL)
        {
          v1 = v6;
          if ((void *)v6 >= __p[1])
            v1 = v6 % (unint64_t)__p[1];
        }
        else
        {
          v1 = ((unint64_t)__p[1] - 1) & v6;
        }
        v11 = (unsigned __int8 **)*((_QWORD *)__p[0] + v1);
        if (v11)
        {
          for (i = *v11; i; i = *(unsigned __int8 **)i)
          {
            v13 = *((_QWORD *)i + 1);
            if (v13 == v7)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)v3 + 16))
                goto LABEL_78;
            }
            else
            {
              if (v10 > 1)
              {
                if ((void *)v13 >= __p[1])
                  v13 %= (unint64_t)__p[1];
              }
              else
              {
                v13 &= (unint64_t)__p[1] - 1;
              }
              if (v13 != v1)
                break;
            }
          }
        }
      }
      v14 = (char *)operator new(0x30uLL);
      *(_QWORD *)v14 = 0;
      *((_QWORD *)v14 + 1) = v7;
      v15 = (std::string *)(v14 + 16);
      if (*((char *)v3 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v15, (const std::string::value_type *)v3[2], v3[3]);
        v4 = *((_QWORD *)&v47 + 1);
      }
      else
      {
        v16 = *((_OWORD *)v3 + 1);
        *((_QWORD *)v14 + 4) = v3[4];
        *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
      }
      *((_DWORD *)v14 + 10) = v5;
      v17 = (float)(unint64_t)(v4 + 1);
      if (!__p[1] || (float)(v48 * (float)(unint64_t)__p[1]) < v17)
        break;
LABEL_68:
      v33 = (_QWORD *)*((_QWORD *)__p[0] + v1);
      if (v33)
      {
        *(_QWORD *)v14 = *v33;
      }
      else
      {
        *(_QWORD *)v14 = v47;
        *(_QWORD *)&v47 = v14;
        *((_QWORD *)__p[0] + v1) = &v47;
        if (!*(_QWORD *)v14)
          goto LABEL_77;
        v34 = *(_QWORD *)(*(_QWORD *)v14 + 8);
        if ((*(_QWORD *)&v8 & (*(_QWORD *)&v8 - 1)) != 0)
        {
          if (v34 >= *(_QWORD *)&v8)
            v34 %= *(_QWORD *)&v8;
        }
        else
        {
          v34 &= *(_QWORD *)&v8 - 1;
        }
        v33 = (char *)__p[0] + 8 * v34;
      }
      *v33 = v14;
LABEL_77:
      v4 = ++*((_QWORD *)&v47 + 1);
LABEL_78:
      v3 = (uint64_t *)*v3;
      if (!v3)
        goto LABEL_89;
    }
    v18 = ((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0;
    if (__p[1] < (void *)3)
      v18 = 1;
    v19 = v18 | (2 * (uint64_t)__p[1]);
    v20 = vcvtps_u32_f32(v17 / v48);
    if (v19 <= v20)
      prime = (int8x8_t)v20;
    else
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v8 = (int8x8_t)__p[1];
    if ((void *)*(_QWORD *)&prime > __p[1])
      goto LABEL_34;
    if ((void *)*(_QWORD *)&prime < __p[1])
    {
      v28 = vcvtps_u32_f32((float)*((unint64_t *)&v47 + 1) / v48);
      if (__p[1] < (void *)3
        || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        v28 = std::__next_prime(v28);
      }
      else
      {
        v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2)
          v28 = v30;
      }
      if (*(_QWORD *)&prime <= v28)
        prime = (int8x8_t)v28;
      if ((void *)*(_QWORD *)&prime >= __p[1])
      {
        v8 = (int8x8_t)__p[1];
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = operator new(8 * *(_QWORD *)&prime);
          v23 = __p[0];
          __p[0] = v22;
          if (v23)
            operator delete(v23);
          v24 = 0;
          __p[1] = (void *)prime;
          do
            *((_QWORD *)__p[0] + v24++) = 0;
          while (*(_QWORD *)&prime != v24);
          v25 = (_QWORD **)v47;
          if ((_QWORD)v47)
          {
            v26 = *(_QWORD *)(v47 + 8);
            v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(_QWORD *)&prime)
                v26 %= *(_QWORD *)&prime;
            }
            else
            {
              v26 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)__p[0] + v26) = &v47;
            for (j = *v25; j; v26 = v32)
            {
              v32 = j[1];
              if (v27.u32[0] > 1uLL)
              {
                if (v32 >= *(_QWORD *)&prime)
                  v32 %= *(_QWORD *)&prime;
              }
              else
              {
                v32 &= *(_QWORD *)&prime - 1;
              }
              if (v32 != v26)
              {
                if (!*((_QWORD *)__p[0] + v32))
                {
                  *((_QWORD *)__p[0] + v32) = v25;
                  goto LABEL_59;
                }
                *v25 = (_QWORD *)*j;
                *j = **((_QWORD **)__p[0] + v32);
                **((_QWORD **)__p[0] + v32) = j;
                j = v25;
              }
              v32 = v26;
LABEL_59:
              v25 = (_QWORD **)j;
              j = (_QWORD *)*j;
            }
          }
          v8 = prime;
          goto LABEL_63;
        }
        v35 = __p[0];
        __p[0] = 0;
        if (v35)
          operator delete(v35);
        v8 = 0;
        __p[1] = 0;
      }
    }
LABEL_63:
    if ((*(_QWORD *)&v8 & (*(_QWORD *)&v8 - 1)) != 0)
    {
      if (v7 >= *(_QWORD *)&v8)
        v1 = v7 % *(_QWORD *)&v8;
      else
        v1 = v7;
    }
    else
    {
      v1 = (*(_QWORD *)&v8 - 1) & v7;
    }
    goto LABEL_68;
  }
LABEL_89:
  v36 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v36 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(*(void ***)(v36 + 16));
    *(_QWORD *)(v36 + 16) = 0;
    v37 = *(_QWORD *)(v36 + 8);
    if (v37)
    {
      for (k = 0; k != v37; ++k)
        *(_QWORD *)(*(_QWORD *)v36 + 8 * k) = 0;
    }
    *(_QWORD *)(v36 + 24) = 0;
  }
  v39 = *(void **)v36;
  *(void **)v36 = __p[0];
  if (v39)
    operator delete(v39);
  v40 = v47;
  *(_QWORD *)(v36 + 16) = v47;
  *(void **)(v36 + 8) = __p[1];
  v41 = *((_QWORD *)&v47 + 1);
  *(_QWORD *)(v36 + 24) = *((_QWORD *)&v47 + 1);
  *(float *)(v36 + 32) = v48;
  if (v41)
  {
    v42 = *(_QWORD *)(v40 + 8);
    v43 = *(_QWORD *)(v36 + 8);
    if ((v43 & (v43 - 1)) != 0)
    {
      if (v42 >= v43)
        v42 %= v43;
    }
    else
    {
      v42 &= v43 - 1;
    }
    v44 = 0;
    *(_QWORD *)(*(_QWORD *)v36 + 8 * v42) = v36 + 16;
    v47 = 0uLL;
  }
  else
  {
    v44 = (void **)v47;
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(v44);
}

void sub_237B965BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void **v3;
  va_list va;

  va_start(va, a3);
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](1, v3);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v2;
  BOOL v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;

  v1 = *(char *)(a1 + 23);
  v2 = *(_QWORD *)(a1 + 8);
  v3 = v1 < 0;
  if (v1 >= 0)
    v4 = (uint64_t *)a1;
  else
    v4 = *(uint64_t **)a1;
  if (!v3)
    v2 = *(unsigned __int8 *)(a1 + 23);
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      v34 = 0x9DDFEA08EB382D69;
      v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      v50 = v46 + v48;
      v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      v53 = v47 + v2 + v46 + v44;
      v54 = v53 + v43;
      v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      v57 = v56 + v45 + v48;
      v58 = __ROR8__(v57, 44);
      v59 = v57 + v49;
      v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      v62 = *v4;
      v61 = v4 + 4;
      v63 = v62 - 0x4B6D499041670D8DLL * v43;
      v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v65 = *(v61 - 3);
        v66 = v63 + v54 + v50 + v65;
        v67 = v61[2];
        v68 = v61[3];
        v69 = v61[1];
        v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        v70 = v52 + v59;
        v71 = *(v61 - 2);
        v72 = *(v61 - 1);
        v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        v74 = v73 + v59 + v72;
        v75 = v73 + v65 + v71;
        v54 = v75 + v72;
        v76 = __ROR8__(v75, 44) + v73;
        v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        v55 = v76 + __ROR8__(v74 + v77, 21);
        v78 = v63 + v60 + *v61;
        v59 = v78 + v69 + v67 + v68;
        v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        v52 = v77;
        v64 += 64;
      }
      while (v64);
      v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      v9 = (char *)v4 + v2;
      v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      v12 = v4[1];
      v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      v16 = v4 + 2;
      v14 = v4[2];
      v15 = v16[1];
      v17 = __ROR8__(v13 + v15, 52);
      v18 = __ROR8__(v13, 37);
      v19 = v13 + v12;
      v20 = __ROR8__(v19, 7);
      v21 = v19 + v14;
      v22 = v20 + v18;
      v23 = *((_QWORD *)v9 - 4) + v14;
      v24 = v11 + v15;
      v25 = __ROR8__(v24 + v23, 52);
      v26 = v22 + v17;
      v27 = __ROR8__(v23, 37);
      v28 = *((_QWORD *)v9 - 3) + v23;
      v29 = __ROR8__(v28, 7);
      v30 = v26 + __ROR8__(v21, 31);
      v31 = v28 + v10;
      v32 = v31 + v24;
      v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      v34 = 0x9AE16A3B2F90404FLL;
      v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      v36 = v4[1];
      v37 = 0xB492B66FBE98F273 * *v4;
      v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      v5 = *v4;
      v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      v82 = *(_DWORD *)v4;
      v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getAOIDForUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *DeviceForUUID;
  uint64_t *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  std::string v11;
  _BYTE v12[12];

  v2 = *(uint64_t **)(a1 + 40);
  v4 = *v2;
  v3 = v2[1];
  if (*(char *)(v3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v3, *(_QWORD *)(v3 + 8));
  else
    v11 = *(std::string *)v3;
  DeviceForUUID = ads::Kernel::findDeviceForUUID(v4, (uint64_t)&v11);
  v6 = DeviceForUUID;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v11.__r_.__value_.__l.__data_);
    if (v6)
      goto LABEL_6;
LABEL_8:
    v12[4] = 0;
    v12[8] = 0;
    v8 = 560227702;
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  if (!DeviceForUUID)
    goto LABEL_8;
LABEL_6:
  v7 = *((_DWORD *)v6 + 12);
  *(_DWORD *)v12 = 0;
  *(_DWORD *)&v12[4] = v7;
  v8 = 0;
  *(_QWORD *)&v12[4] = *(unsigned int *)&v12[4] | 0x100000000;
  v9 = HIDWORD(*(_QWORD *)&v12[4]);
LABEL_9:
  *(_DWORD *)v12 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)v10 = *(_QWORD *)v12;
  *(_BYTE *)(v10 + 8) = v9;
}

uint64_t *ads::Kernel::findDeviceForUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  char v7;
  std::string::size_type size;
  std::string *p_p;
  std::string::size_type v10;
  uint64_t v11;
  void *v12;
  int v13;
  std::string __p;
  std::string v16;

  v4 = *(void **)(a1 + 56);
  applesauce::dispatch::v1::queue::operator*(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(uint64_t **)(a1 + 32);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  if (v6)
  {
    v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    while (1)
    {
      if (*((char *)v6 + 79) < 0)
        std::string::__init_copy_ctor_external(&v16, (const std::string::value_type *)v6[7], v6[8]);
      else
        v16 = *(std::string *)(v6 + 7);
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      else
        v10 = v16.__r_.__value_.__l.__size_;
      if (v10 == size)
      {
        if ((*((_BYTE *)&v16.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          v12 = (void *)v16.__r_.__value_.__r.__words[0];
          v13 = memcmp(v16.__r_.__value_.__l.__data_, p_p, v16.__r_.__value_.__l.__size_);
          operator delete(v12);
          if (!v13)
            goto LABEL_30;
          goto LABEL_27;
        }
        if (!*((_BYTE *)&v16.__r_.__value_.__s + 23))
          goto LABEL_30;
        v11 = 0;
        while (v16.__r_.__value_.__s.__data_[v11] == p_p->__r_.__value_.__s.__data_[v11])
        {
          if (HIBYTE(v16.__r_.__value_.__r.__words[2]) == ++v11)
            goto LABEL_30;
        }
      }
      if ((*((_BYTE *)&v16.__r_.__value_.__s + 23) & 0x80) != 0)
        operator delete(v16.__r_.__value_.__l.__data_);
LABEL_27:
      v6 = (uint64_t *)*v6;
      if (!v6)
        goto LABEL_30;
    }
  }
  v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_30:
  if (v7 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

void ads::Kernel::getUUIDForAOID(ads::Kernel *this, uint64_t a2, int a3)
{
  NSObject *v4;
  _QWORD v5[2];
  int v6;
  _QWORD block[6];

  v6 = a3;
  v5[0] = a2;
  v5[1] = &v6;
  applesauce::dispatch::v1::queue::operator*(*(id *)(a2 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
  *((_BYTE *)this + 32) = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getUUIDForAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = this;
  block[5] = v5;
  dispatch_sync(v4, block);

}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getUUIDForAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  char v1;
  uint64_t DeviceForAOID;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::string v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  DeviceForAOID = ads::Kernel::findDeviceForAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(_QWORD *)(a1 + 40) + 8));
  v4 = DeviceForAOID;
  if (DeviceForAOID)
  {
    if (*(char *)(DeviceForAOID + 79) < 0)
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(DeviceForAOID + 56), *(_QWORD *)(DeviceForAOID + 64));
    else
      v11 = *(std::string *)(DeviceForAOID + 56);
    v7 = 0;
    v12[0] = v11.__r_.__value_.__l.__size_;
    v6 = (void *)v11.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)v12 + 7) = *(std::string::size_type *)((char *)&v11.__r_.__value_.__r.__words[1] + 7);
    v1 = HIBYTE(v11.__r_.__value_.__r.__words[2]);
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 560227702;
  }
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v8 = v7;
  if (*(unsigned __int8 *)(v8 + 32) == v5)
  {
    if (*(_BYTE *)(v8 + 32))
    {
      if (*(char *)(v8 + 31) < 0)
        operator delete(*(void **)(v8 + 8));
      v9 = v12[0];
      *(_QWORD *)(v8 + 8) = v6;
      *(_QWORD *)(v8 + 16) = v9;
      *(_QWORD *)(v8 + 23) = *(_QWORD *)((char *)v12 + 7);
      *(_BYTE *)(v8 + 31) = v1;
      return;
    }
  }
  else
  {
    if (!*(_BYTE *)(v8 + 32))
    {
      v10 = v12[0];
      *(_QWORD *)(v8 + 8) = v6;
      *(_QWORD *)(v8 + 16) = v10;
      *(_QWORD *)(v8 + 23) = *(_QWORD *)((char *)v12 + 7);
      *(_BYTE *)(v8 + 31) = v1;
      *(_BYTE *)(v8 + 32) = 1;
      return;
    }
    if (*(char *)(v8 + 31) < 0)
      operator delete(*(void **)(v8 + 8));
    *(_BYTE *)(v8 + 32) = 0;
  }
  if (v4 && v1 < 0)
    operator delete(v6);
}

uint64_t ads::Kernel::findDeviceForAOID(ads::Kernel *this, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t result;

  v4 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  for (result = *((_QWORD *)this + 4); result; result = *(_QWORD *)result)
  {
    if (*(_DWORD *)(result + 48) == a2)
      break;
  }
  return result;
}

uint64_t ads::Kernel::connectADSDevice(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD block[6];
  uint64_t v8;
  int v9;

  v6[0] = a1;
  v6[1] = a2;
  v2 = *(void **)(a1 + 56);
  applesauce::dispatch::v1::queue::operator*(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  BYTE4(v8) = 0;
  LOBYTE(v9) = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel16connectADSDeviceENS_2CF13DictionaryRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS8_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v8;
  block[5] = v6;
  dispatch_sync(v3, block);
  v4 = v8;

  return v4;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel16connectADSDeviceENS_2CF13DictionaryRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS8_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  CFTypeRef *v3;
  uint64_t v4;
  CFTypeRef v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  CFTypeRef v11;

  v2 = *(uint64_t **)(a1 + 40);
  v4 = *v2;
  v3 = (CFTypeRef *)v2[1];
  v5 = *v3;
  if (*v3)
  {
    CFRetain(*v3);
    v11 = v5;
    v6 = ads::Kernel::_connectADSDevice(v4, &v11);
    v8 = v7;
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
    v6 = ads::Kernel::_connectADSDevice(v4, &v11);
    v8 = v9;
  }
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)v10 = v6;
  *(_BYTE *)(v10 + 8) = v8;
}

uint64_t ads::Kernel::_connectADSDevice(uint64_t a1, CFTypeRef *a2)
{
  unint64_t v2;
  void *v5;
  NSObject *v6;
  const __CFDictionary *v7;
  const __CFString *Value;
  int v9;
  int v10;
  uint64_t *DeviceForUUID;
  uint64_t *v12;
  int v13;
  CFTypeRef v14;
  void **v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint8x8_t v19;
  unint64_t v20;
  void **v21;
  char *v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  std::string *v28;
  float v29;
  float v30;
  _BOOL8 v31;
  unint64_t v32;
  unint64_t v33;
  int8x8_t prime;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint8x8_t v40;
  unint64_t v41;
  uint8x8_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  unint64_t v48;
  ads::Kernel *v49;
  AudioObjectID ADSPluginAOID;
  AudioObjectID v51;
  CFTypeRef *v52;
  int v53;
  void **v54;
  _BYTE *v55;
  CFTypeRef v56;
  _DWORD *v57;
  int v58;
  _DWORD *v59;
  void *v60;
  _DWORD *v61;
  void **p_p;
  _DWORD *v63;
  _DWORD *v64;
  util *v65;
  NSObject *v66;
  AudioObjectID v67;
  util *v68;
  NSObject *v69;
  int v70;
  const __CFDictionary *v71;
  const __CFArray *v72;
  void *v73;
  NSObject *v74;
  char *v75;
  const __CFDictionary **v76;
  const __CFDictionary **v77;
  const __CFDictionary *v78;
  const __CFNumber *v79;
  const __CFNumber *v80;
  unsigned int v81;
  const __CFDictionary *v82;
  const __CFNumber *v83;
  unsigned int v84;
  const __CFNumber *v85;
  const __CFDictionary *v86;
  const __CFNumber *v87;
  const __CFNumber *v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  _DWORD *v99;
  _DWORD *v100;
  unint64_t v101;
  uint64_t v102;
  int v103;
  unint64_t v104;
  char *v105;
  char *v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  int v114;
  char *v115;
  _BYTE *v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  int v125;
  void *exception;
  const __CFDictionary **v128;
  std::string v129;
  std::string v130;
  std::string v131;
  char v132;
  _BYTE v133[12];
  __int128 v134;
  uint64_t v135;
  const __CFString *v136;
  char v137;
  void *__p;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  char v143;
  void **v144;
  _BYTE v145[48];
  __int128 v146;
  uint8_t buf[24];
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 56);
  applesauce::dispatch::v1::queue::operator*(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (const __CFDictionary *)*a2;
  if (!*a2)
  {
    v9 = 1852797029;
LABEL_266:
    *(_DWORD *)v133 = v9;
    v133[4] = 0;
    v133[8] = 0;
    return *(_QWORD *)v133;
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v145, "uuid");
  Value = (const __CFString *)CFDictionaryGetValue(v7, *(const void **)v145);
  if (*(_QWORD *)v145)
    CFRelease(*(CFTypeRef *)v145);
  if (!Value)
  {
    v131.__r_.__value_.__s.__data_[0] = 0;
    v132 = 0;
    goto LABEL_265;
  }
  applesauce::CF::convert_as<std::string,0>((uint64_t)&v131, Value);
  if (!v132)
  {
LABEL_265:
    v9 = 560227702;
    goto LABEL_266;
  }
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v130, v131.__r_.__value_.__l.__data_, v131.__r_.__value_.__l.__size_);
  else
    v130 = v131;
  v10 = SHIBYTE(v130.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v129, v130.__r_.__value_.__l.__data_, v130.__r_.__value_.__l.__size_);
  else
    v129 = v130;
  DeviceForUUID = ads::Kernel::findDeviceForUUID(a1, (uint64_t)&v129);
  v12 = DeviceForUUID;
  if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v129.__r_.__value_.__l.__data_);
    if (v12)
      goto LABEL_15;
LABEL_17:
    v14 = *a2;
    if (*a2)
    {
      CFRetain(*a2);
      v146 = 0u;
      memset(&v145[16], 0, 32);
      *(_QWORD *)v145 = v14;
      CFRetain(v14);
    }
    else
    {
      v146 = 0u;
      memset(&v145[16], 0, 32);
      *(_QWORD *)v145 = 0;
    }
    v15 = (void **)(a1 + 16);
    v16 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v130);
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 24);
    if (v18)
    {
      v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
      v19.i16[0] = vaddlv_u8(v19);
      v20 = v19.u32[0];
      if (v19.u32[0] > 1uLL)
      {
        v2 = v16;
        if (v16 >= v18)
          v2 = v16 % v18;
      }
      else
      {
        v2 = (v18 - 1) & v16;
      }
      v21 = (void **)*((_QWORD *)*v15 + v2);
      if (v21)
      {
        v22 = (char *)*v21;
        if (*v21)
        {
          do
          {
            v23 = *((_QWORD *)v22 + 1);
            if (v23 == v17)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v22 + 16, (unsigned __int8 *)&v130))
              {
                goto LABEL_101;
              }
            }
            else
            {
              if (v20 > 1)
              {
                if (v23 >= v18)
                  v23 %= v18;
              }
              else
              {
                v23 &= v18 - 1;
              }
              if (v23 != v2)
                break;
            }
            v22 = *(char **)v22;
          }
          while (v22);
        }
      }
    }
    v24 = operator new(0x68uLL);
    v25 = v24;
    v26 = (_QWORD *)(a1 + 32);
    v141 = v24;
    v142 = a1 + 32;
    v143 = 0;
    *v24 = 0;
    v24[1] = v17;
    if (v10 < 0)
      std::string::__init_copy_ctor_external((std::string *)(v24 + 2), v130.__r_.__value_.__l.__data_, v130.__r_.__value_.__l.__size_);
    else
      *(std::string *)(v24 + 2) = v130;
    v27 = *(_QWORD *)v145;
    if (*(_QWORD *)v145)
      CFRetain(*(CFTypeRef *)v145);
    v25[5] = v27;
    *((_DWORD *)v25 + 12) = *(_DWORD *)&v145[8];
    v28 = (std::string *)(v25 + 7);
    if ((v145[39] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)&v145[16], *(std::string::size_type *)&v145[24]);
    }
    else
    {
      *(_OWORD *)&v28->__r_.__value_.__l.__data_ = *(_OWORD *)&v145[16];
      v25[9] = *(_QWORD *)&v145[32];
    }
    v25[10] = 0;
    v25[11] = 0;
    v25[12] = 0;
    v143 = 1;
    v29 = (float)(unint64_t)(*(_QWORD *)(a1 + 40) + 1);
    v30 = *(float *)(a1 + 48);
    if (v18 && (float)(v30 * (float)v18) >= v29)
    {
LABEL_91:
      v46 = (_QWORD *)(a1 + 32);
      v47 = (_QWORD *)*((_QWORD *)*v15 + v2);
      v22 = (char *)v141;
      if (v47)
      {
        *(_QWORD *)v141 = *v47;
      }
      else
      {
        *(_QWORD *)v141 = *v46;
        *v46 = v22;
        *((_QWORD *)*v15 + v2) = v46;
        if (!*(_QWORD *)v22)
        {
LABEL_100:
          v141 = 0;
          ++*(_QWORD *)(a1 + 40);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)&v141);
LABEL_101:
          ads::Device::~Device((ads::Device *)v145);
          if (v14)
            CFRelease(v14);
          ADSPluginAOID = ads::Kernel::getADSPluginAOID(v49);
          if (!ADSPluginAOID)
          {
            v53 = 1937010544;
            goto LABEL_251;
          }
          v51 = ADSPluginAOID;
          v52 = (CFTypeRef *)(v22 + 40);
          if (ads::Device::IsConnected((ads::Device *)(v22 + 40)))
          {
            v53 = 1852797029;
            goto LABEL_251;
          }
          *((_DWORD *)v22 + 12) = 0;
          v54 = (void **)(v22 + 56);
          if (v22[79] < 0)
          {
            *((_QWORD *)v22 + 8) = 0;
            v55 = (_BYTE *)*((_QWORD *)v22 + 7);
          }
          else
          {
            v22[79] = 0;
            v55 = v22 + 56;
          }
          *v55 = 0;
          ads::Kernel::getADSDevices((ads::Kernel *)&v141);
          v56 = *v52;
          if (*v52)
          {
            CFRetain(*v52);
            strcpy(v145, "Mvedbolg");
            v145[9] = 0;
            *(_WORD *)&v145[10] = 0;
            v53 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v51, (const AudioObjectPropertyAddress *)v145, ads::Device::Connect(void)::kCreate, (uint64_t)v56);
            CFRelease(v56);
          }
          else
          {
            strcpy(v145, "Mvedbolg");
            v145[9] = 0;
            *(_WORD *)&v145[10] = 0;
            v53 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v51, (const AudioObjectPropertyAddress *)v145, ads::Device::Connect(void)::kCreate, 0);
          }
          v57 = v141;
          if (v53)
          {
LABEL_248:
            if (v57)
              operator delete(v57);
            if (!v53)
            {
              if (ads::Device::IsConnected((ads::Device *)v52))
              {
                *(_DWORD *)&v145[4] = *((_DWORD *)v22 + 12);
                *(_DWORD *)v145 = 0;
                *(_DWORD *)&v145[8] = 1;
                *(_DWORD *)v133 = 0;
                *(_QWORD *)&v133[4] = *(_QWORD *)&v145[4];
                goto LABEL_253;
              }
              std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(v15, (unsigned __int8 *)&v130);
              *(_DWORD *)v133 = 560227702;
              goto LABEL_252;
            }
LABEL_251:
            std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(v15, (unsigned __int8 *)&v130);
            *(_DWORD *)v133 = v53;
LABEL_252:
            v133[4] = 0;
            v133[8] = 0;
            goto LABEL_253;
          }
          v128 = (const __CFDictionary **)(v22 + 40);
          v58 = 0;
          __p = 0;
          v139 = 0;
          v140 = 0;
          v59 = (_DWORD *)v142;
          while (1)
          {
            usleep(0x64u);
            ads::Kernel::getADSDevices((ads::Kernel *)v145);
            v60 = *(void **)v145;
            v61 = *(_DWORD **)&v145[8];
            p_p = &__p;
            *(_QWORD *)buf = &__p;
            if (v57 == v59)
            {
              v63 = *(_DWORD **)v145;
            }
            else
            {
              v63 = v57;
              v64 = *(_DWORD **)v145;
              while (v64 != v61)
              {
                if (*v63 >= *v64)
                {
                  if (*v64 >= *v63)
                    ++v63;
                  else
                    std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100]((uint64_t *)buf, v64);
                  ++v64;
                }
                else
                {
                  std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100]((uint64_t *)buf, v63++);
                }
                if (v63 == v59)
                {
                  p_p = *(void ***)buf;
                  v63 = v64;
                  goto LABEL_128;
                }
              }
              p_p = *(void ***)buf;
              v61 = v59;
            }
LABEL_128:
            v65 = (util *)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>,std::back_insert_iterator<std::vector<unsigned int>>,0>(v63, v61, (uint64_t)p_p);
            if (__p != v139)
              break;
            if (v60)
              operator delete(v60);
            if (++v58 == 10)
              goto LABEL_137;
          }
          util::server_log(v65);
          v66 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
          v65 = (util *)os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v65)
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "ADS_Management_Kernel.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 82;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v58;
            _os_log_impl(&dword_237B88000, v66, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Caught device on diff iteration %u.", buf, 0x18u);
          }
          if (v60)
            operator delete(v60);
LABEL_137:
          if (__p == v139)
          {
            util::server_log(v65);
            v74 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
            v53 = 1852990585;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v145 = 136315394;
              *(_QWORD *)&v145[4] = "ADS_Management_Kernel.mm";
              *(_WORD *)&v145[12] = 1024;
              *(_DWORD *)&v145[14] = 89;
              _os_log_impl(&dword_237B88000, v74, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to locate device after many diff iterations", v145, 0x12u);
            }
            goto LABEL_245;
          }
          v67 = *(_DWORD *)__p;
          *((_DWORD *)v22 + 12) = *(_DWORD *)__p;
          ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(&v136, v67, 1735159650, 0);
          if (!v137)
          {
            v53 = 1970171760;
LABEL_244:
            std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v136);
LABEL_245:
            if (__p)
            {
              v139 = __p;
              operator delete(__p);
            }
            v57 = v141;
            v52 = (CFTypeRef *)(v22 + 40);
            goto LABEL_248;
          }
          if (!v136)
            goto LABEL_261;
          v68 = (util *)applesauce::CF::convert_to<std::string,0>((uint64_t)v145, v136);
          if (v22[79] < 0)
            operator delete(*v54);
          *(_OWORD *)v54 = *(_OWORD *)v145;
          *((_QWORD *)v22 + 9) = *(_QWORD *)&v145[16];
          util::server_log(v68);
          v69 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            if (v22[79] < 0)
              v54 = (void **)*v54;
            v70 = *((_DWORD *)v22 + 12);
            *(_DWORD *)v145 = 136315906;
            *(_QWORD *)&v145[4] = "ADS_Management_Kernel.mm";
            *(_WORD *)&v145[12] = 1024;
            *(_DWORD *)&v145[14] = 103;
            *(_WORD *)&v145[18] = 2080;
            *(_QWORD *)&v145[20] = v54;
            *(_WORD *)&v145[28] = 1024;
            *(_DWORD *)&v145[30] = v70;
            _os_log_impl(&dword_237B88000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connected device named %s with ID %u.", v145, 0x22u);
          }
          v71 = *v128;
          if (!*v128)
            goto LABEL_261;
          v134 = 0uLL;
          v135 = 0;
          applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v145, "custom");
          v72 = (const __CFArray *)CFDictionaryGetValue(v71, *(const void **)v145);
          if (*(_QWORD *)v145)
            CFRelease(*(CFTypeRef *)v145);
          if (v72)
          {
            applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>((int64x2_t *)v145, v72);
            if (v145[24])
            {
              memset(buf, 0, sizeof(buf));
              std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(buf, *(CFTypeRef **)v145, *(CFTypeRef **)&v145[8], (uint64_t)(*(_QWORD *)&v145[8] - *(_QWORD *)v145) >> 3);
              if (v145[24])
              {
                v144 = (void **)v145;
                std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](&v144);
              }
LABEL_171:
              *(_QWORD *)v145 = &v134;
              std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)v145);
              v75 = (char *)*((_QWORD *)v22 + 10);
              *((_QWORD *)v22 + 11) = v75;
              v76 = *(const __CFDictionary ***)buf;
              v77 = *(const __CFDictionary ***)&buf[8];
              if (*(_QWORD *)buf != *(_QWORD *)&buf[8])
              {
                while (1)
                {
                  v78 = *v76;
                  if (!*v76)
                    break;
                  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v145, "selector");
                  v79 = (const __CFNumber *)CFDictionaryGetValue(v78, *(const void **)v145);
                  if (*(_QWORD *)v145)
                    CFRelease(*(CFTypeRef *)v145);
                  if (v79)
                  {
                    v80 = applesauce::CF::convert_as<unsigned int,0>(v79);
                    v81 = (unint64_t)v80 >> 32 ? v80 : 0;
                  }
                  else
                  {
                    v81 = 0;
                  }
                  v82 = *v76;
                  if (!*v76)
                    break;
                  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v145, "scope");
                  v83 = (const __CFNumber *)CFDictionaryGetValue(v82, *(const void **)v145);
                  if (*(_QWORD *)v145)
                    CFRelease(*(CFTypeRef *)v145);
                  v84 = 1735159650;
                  if (v83)
                  {
                    v85 = applesauce::CF::convert_as<unsigned int,0>(v83);
                    if ((unint64_t)v85 >> 32)
                      v84 = v85;
                    else
                      v84 = 1735159650;
                  }
                  v86 = *v76;
                  if (!*v76)
                    break;
                  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v145, "element");
                  v87 = (const __CFNumber *)CFDictionaryGetValue(v86, *(const void **)v145);
                  if (*(_QWORD *)v145)
                    CFRelease(*(CFTypeRef *)v145);
                  if (v87)
                  {
                    v88 = applesauce::CF::convert_as<unsigned int,0>(v87);
                    if ((unint64_t)v88 <= 0x100000000)
                      LODWORD(v87) = 0;
                    else
                      LODWORD(v87) = (_DWORD)v88;
                  }
                  v89 = v81 | ((unint64_t)v84 << 32);
                  v91 = *((_QWORD *)v22 + 11);
                  v90 = *((_QWORD *)v22 + 12);
                  if (v91 >= v90)
                  {
                    v92 = *((_QWORD *)v22 + 10);
                    v93 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v91 - v92) >> 2);
                    v94 = v93 + 1;
                    if (v93 + 1 > 0x1555555555555555)
                      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                    v95 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v90 - v92) >> 2);
                    if (2 * v95 > v94)
                      v94 = 2 * v95;
                    if (v95 >= 0xAAAAAAAAAAAAAAALL)
                      v96 = 0x1555555555555555;
                    else
                      v96 = v94;
                    if (v96)
                      v96 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v96);
                    else
                      v97 = 0;
                    v98 = v96 + 12 * v93;
                    *(_QWORD *)v98 = v89;
                    *(_DWORD *)(v98 + 8) = (_DWORD)v87;
                    v100 = (_DWORD *)*((_QWORD *)v22 + 10);
                    v99 = (_DWORD *)*((_QWORD *)v22 + 11);
                    v101 = v98;
                    if (v99 != v100)
                    {
                      do
                      {
                        v102 = *(_QWORD *)(v99 - 3);
                        v99 -= 3;
                        v103 = v99[2];
                        *(_QWORD *)(v101 - 12) = v102;
                        v101 -= 12;
                        *(_DWORD *)(v101 + 8) = v103;
                      }
                      while (v99 != v100);
                      v99 = (_DWORD *)*((_QWORD *)v22 + 10);
                    }
                    v75 = (char *)(v98 + 12);
                    *((_QWORD *)v22 + 10) = v101;
                    *((_QWORD *)v22 + 11) = v98 + 12;
                    *((_QWORD *)v22 + 12) = v96 + 12 * v97;
                    if (v99)
                      operator delete(v99);
                  }
                  else
                  {
                    *(_QWORD *)v91 = v89;
                    *(_DWORD *)(v91 + 8) = (_DWORD)v87;
                    v75 = (char *)(v91 + 12);
                  }
                  *((_QWORD *)v22 + 11) = v75;
                  if (++v76 == v77)
                    goto LABEL_211;
                }
LABEL_261:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x23B820E38](exception, "Could not construct");
                __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
              }
LABEL_211:
              v104 = *((_QWORD *)v22 + 12);
              if ((unint64_t)v75 >= v104)
              {
                v106 = (char *)*((_QWORD *)v22 + 10);
                v107 = 0xAAAAAAAAAAAAAAABLL * ((v75 - v106) >> 2);
                v108 = v107 + 1;
                if (v107 + 1 > 0x1555555555555555)
                  goto LABEL_263;
                v109 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - (_QWORD)v106) >> 2);
                if (2 * v109 > v108)
                  v108 = 2 * v109;
                if (v109 >= 0xAAAAAAAAAAAAAAALL)
                  v110 = 0x1555555555555555;
                else
                  v110 = v108;
                if (v110)
                {
                  v110 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v110);
                  v106 = (char *)*((_QWORD *)v22 + 10);
                  v75 = (char *)*((_QWORD *)v22 + 11);
                }
                else
                {
                  v111 = 0;
                }
                v112 = v110 + 12 * v107;
                v104 = v110 + 12 * v111;
                *(_QWORD *)v112 = 0x696E707473746D23;
                *(_DWORD *)(v112 + 8) = 0;
                v105 = (char *)(v112 + 12);
                if (v75 != v106)
                {
                  do
                  {
                    v113 = *(_QWORD *)(v75 - 12);
                    v75 -= 12;
                    v114 = *((_DWORD *)v75 + 2);
                    *(_QWORD *)(v112 - 12) = v113;
                    v112 -= 12;
                    *(_DWORD *)(v112 + 8) = v114;
                  }
                  while (v75 != v106);
                  v106 = (char *)*((_QWORD *)v22 + 10);
                }
                *((_QWORD *)v22 + 10) = v112;
                *((_QWORD *)v22 + 11) = v105;
                *((_QWORD *)v22 + 12) = v104;
                if (v106)
                {
                  operator delete(v106);
                  v104 = *((_QWORD *)v22 + 12);
                }
              }
              else
              {
                *(_QWORD *)v75 = 0x696E707473746D23;
                *((_DWORD *)v75 + 2) = 0;
                v105 = v75 + 12;
              }
              *((_QWORD *)v22 + 11) = v105;
              if ((unint64_t)v105 < v104)
              {
                *(_QWORD *)v105 = 0x6F75747073746D23;
                *((_DWORD *)v105 + 2) = 0;
                v115 = v105 + 12;
LABEL_243:
                *((_QWORD *)v22 + 11) = v115;
                *(_QWORD *)v145 = buf;
                std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)v145);
                v53 = 0;
                goto LABEL_244;
              }
              v116 = (_BYTE *)*((_QWORD *)v22 + 10);
              v117 = 0xAAAAAAAAAAAAAAABLL * ((v105 - v116) >> 2);
              v118 = v117 + 1;
              if (v117 + 1 <= 0x1555555555555555)
              {
                v119 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - (_QWORD)v116) >> 2);
                if (2 * v119 > v118)
                  v118 = 2 * v119;
                if (v119 >= 0xAAAAAAAAAAAAAAALL)
                  v120 = 0x1555555555555555;
                else
                  v120 = v118;
                if (v120)
                {
                  v120 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v120);
                  v116 = (_BYTE *)*((_QWORD *)v22 + 10);
                  v105 = (char *)*((_QWORD *)v22 + 11);
                }
                else
                {
                  v121 = 0;
                }
                v122 = v120 + 12 * v117;
                v123 = v120 + 12 * v121;
                *(_QWORD *)v122 = 0x6F75747073746D23;
                *(_DWORD *)(v122 + 8) = 0;
                v115 = (char *)(v122 + 12);
                if (v105 != v116)
                {
                  do
                  {
                    v124 = *(_QWORD *)(v105 - 12);
                    v105 -= 12;
                    v125 = *((_DWORD *)v105 + 2);
                    *(_QWORD *)(v122 - 12) = v124;
                    v122 -= 12;
                    *(_DWORD *)(v122 + 8) = v125;
                  }
                  while (v105 != v116);
                  v116 = (_BYTE *)*((_QWORD *)v22 + 10);
                }
                *((_QWORD *)v22 + 10) = v122;
                *((_QWORD *)v22 + 11) = v115;
                *((_QWORD *)v22 + 12) = v123;
                if (v116)
                  operator delete(v116);
                goto LABEL_243;
              }
LABEL_263:
              std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
            }
          }
          else
          {
            v145[0] = 0;
            v145[24] = 0;
          }
          *(_OWORD *)buf = v134;
          *(_QWORD *)&buf[16] = v135;
          v135 = 0;
          v134 = 0uLL;
          goto LABEL_171;
        }
        v48 = *(_QWORD *)(*(_QWORD *)v22 + 8);
        if ((v18 & (v18 - 1)) != 0)
        {
          if (v48 >= v18)
            v48 %= v18;
        }
        else
        {
          v48 &= v18 - 1;
        }
        v47 = (char *)*v15 + 8 * v48;
      }
      *v47 = v22;
      goto LABEL_100;
    }
    v31 = 1;
    if (v18 >= 3)
      v31 = (v18 & (v18 - 1)) != 0;
    v32 = v31 | (2 * v18);
    v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33)
      prime = (int8x8_t)v33;
    else
      prime = (int8x8_t)v32;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v18 = *(_QWORD *)(a1 + 24);
    if (*(_QWORD *)&prime > v18)
      goto LABEL_57;
    if (*(_QWORD *)&prime < v18)
    {
      v41 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v18 < 3 || (v42 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        v41 = std::__next_prime(v41);
      }
      else
      {
        v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2)
          v41 = v43;
      }
      if (*(_QWORD *)&prime <= v41)
        prime = (int8x8_t)v41;
      if (*(_QWORD *)&prime >= v18)
      {
        v18 = *(_QWORD *)(a1 + 24);
      }
      else
      {
        if (prime)
        {
LABEL_57:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v35 = operator new(8 * *(_QWORD *)&prime);
          v36 = *v15;
          *v15 = v35;
          if (v36)
            operator delete(v36);
          v37 = 0;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *((_QWORD *)*v15 + v37++) = 0;
          while (*(_QWORD *)&prime != v37);
          v38 = (_QWORD *)*v26;
          if (*v26)
          {
            v39 = v38[1];
            v40 = (uint8x8_t)vcnt_s8(prime);
            v40.i16[0] = vaddlv_u8(v40);
            if (v40.u32[0] > 1uLL)
            {
              if (v39 >= *(_QWORD *)&prime)
                v39 %= *(_QWORD *)&prime;
            }
            else
            {
              v39 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)*v15 + v39) = v26;
            v44 = (_QWORD *)*v38;
            if (*v38)
            {
              do
              {
                v45 = v44[1];
                if (v40.u32[0] > 1uLL)
                {
                  if (v45 >= *(_QWORD *)&prime)
                    v45 %= *(_QWORD *)&prime;
                }
                else
                {
                  v45 &= *(_QWORD *)&prime - 1;
                }
                if (v45 != v39)
                {
                  if (!*((_QWORD *)*v15 + v45))
                  {
                    *((_QWORD *)*v15 + v45) = v38;
                    goto LABEL_82;
                  }
                  *v38 = *v44;
                  *v44 = **((_QWORD **)*v15 + v45);
                  **((_QWORD **)*v15 + v45) = v44;
                  v44 = v38;
                }
                v45 = v39;
LABEL_82:
                v38 = v44;
                v44 = (_QWORD *)*v44;
                v39 = v45;
              }
              while (v44);
            }
          }
          v18 = (unint64_t)prime;
          goto LABEL_86;
        }
        v73 = *v15;
        *v15 = 0;
        if (v73)
          operator delete(v73);
        v18 = 0;
        *(_QWORD *)(a1 + 24) = 0;
      }
    }
LABEL_86:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v17 >= v18)
        v2 = v17 % v18;
      else
        v2 = v17;
    }
    else
    {
      v2 = (v18 - 1) & v17;
    }
    goto LABEL_91;
  }
  if (!DeviceForUUID)
    goto LABEL_17;
LABEL_15:
  v13 = *((_DWORD *)v12 + 12);
  *(_DWORD *)v133 = 0;
  *(_DWORD *)&v133[4] = v13;
  v133[8] = 1;
LABEL_253:
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v130.__r_.__value_.__l.__data_);
  if (v132 && SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  return *(_QWORD *)v133;
}

void sub_237B98338(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *i;
  unint64_t v12;
  _BYTE v13[24];

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (v5)
  {
    v6 = v4;
    v7 = (uint8x8_t)vcnt_s8(v5);
    v7.i16[0] = vaddlv_u8(v7);
    v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL)
    {
      v9 = v4;
      if (v4 >= *(_QWORD *)&v5)
        v9 = v4 % *(_QWORD *)&v5;
    }
    else
    {
      v9 = (*(_QWORD *)&v5 - 1) & v4;
    }
    v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = *(unsigned __int8 **)i)
      {
        v12 = *((_QWORD *)i + 1);
        if (v12 == v6)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2))
          {
            std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v13, a1, i);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v13);
            return;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= *(_QWORD *)&v5)
              v12 %= *(_QWORD *)&v5;
          }
          else
          {
            v12 &= *(_QWORD *)&v5 - 1;
          }
          if (v12 != v9)
            return;
        }
      }
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)a2[1];
  v4 = a3[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*a2 + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a3);
  if (v7 == a2 + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a3)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a3 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*a2 + 8 * v4) = 0;
  }
  v10 = *a3;
  if (*a3)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*a2 + 8 * v11) = v7;
      v10 = *a3;
    }
  }
  *v7 = v10;
  *a3 = 0;
  --a2[3];
  *(_QWORD *)result = a3;
  *(_QWORD *)(result + 8) = a2 + 2;
  *(_BYTE *)(result + 16) = 1;
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

__n128 ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel17connectADSDevicesENSt3__16vectorINS_2CF13DictionaryRefENS5_9allocatorIS8_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  CFTypeRef **v3;
  CFTypeRef *v4;
  CFTypeRef *v5;
  int *v6;
  int *v7;
  unint64_t v8;
  ads::Kernel *v9;
  CFTypeRef v10;
  uint64_t v11;
  int *v12;
  int v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __n128 result;
  __n128 v25;
  __n128 v27;
  uint64_t v28;
  CFTypeRef v29;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(CFTypeRef ***)(v2 + 8);
  v4 = *v3;
  v5 = v3[1];
  if (*v3 != v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(ads::Kernel **)v2;
    while (1)
    {
      v10 = *v4;
      if (*v4)
      {
        CFRetain(*v4);
        v29 = v10;
        v11 = ads::Kernel::_connectADSDevice((uint64_t)v9, &v29);
        CFRelease(v10);
        if ((_DWORD)v11)
          goto LABEL_5;
      }
      else
      {
        v29 = 0;
        v11 = ads::Kernel::_connectADSDevice((uint64_t)v9, &v29);
        if ((_DWORD)v11)
        {
LABEL_5:
          if (v6 == v7)
          {
            v21 = 0;
            v25 = 0u;
            if (v6)
              goto LABEL_34;
            goto LABEL_35;
          }
          v12 = v6;
          do
          {
            v13 = *v12++;
            ads::Kernel::_disconnectADSDeviceByAOID(v9, v13);
          }
          while (v12 != v7);
          v14 = v6;
          v15 = (uint64_t)v7;
          v1 = v11;
          goto LABEL_9;
        }
      }
      if ((unint64_t)v7 < v8)
      {
        *v7++ = HIDWORD(v11);
        v15 = (uint64_t)v7;
        goto LABEL_11;
      }
      v16 = v7 - v6;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 62)
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v8 - (_QWORD)v6) >> 1 > v17)
        v17 = (uint64_t)(v8 - (_QWORD)v6) >> 1;
      if (v8 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
        v18 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      if (v18)
        v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v18);
      else
        v19 = 0;
      v14 = (int *)(v18 + 4 * v16);
      *v14 = HIDWORD(v11);
      v15 = (uint64_t)(v14 + 1);
      while (v7 != v6)
      {
        v20 = *--v7;
        *--v14 = v20;
      }
      v8 = v18 + 4 * v19;
      if (v6)
        operator delete(v6);
LABEL_9:
      if ((_DWORD)v11)
      {
        v21 = 0;
        v25 = 0u;
        v6 = v14;
        LODWORD(v11) = v1;
        if (!v14)
          goto LABEL_35;
        goto LABEL_34;
      }
      v6 = v14;
      v7 = (int *)v15;
LABEL_11:
      if (++v4 == v5)
        goto LABEL_31;
    }
  }
  v6 = 0;
  v15 = 0;
LABEL_31:
  v28 = 0;
  v27 = 0uLL;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v27, v6, v15, (v15 - (uint64_t)v6) >> 2);
  LODWORD(v11) = 0;
  v25 = v27;
  v21 = v28;
  if (v6)
LABEL_34:
    operator delete(v6);
LABEL_35:
  v22 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v22 = v11;
  v23 = *(void **)(v22 + 8);
  if (v23)
  {
    *(_QWORD *)(v22 + 16) = v23;
    operator delete(v23);
    *(_QWORD *)(v22 + 8) = 0;
    *(_QWORD *)(v22 + 16) = 0;
    *(_QWORD *)(v22 + 24) = 0;
  }
  result = v25;
  *(__n128 *)(v22 + 8) = v25;
  *(_QWORD *)(v22 + 24) = v21;
  return result;
}

void sub_237B9881C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ads::Kernel::_disconnectADSDeviceByAOID(ads::Kernel *this, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t DeviceForAOID;
  _QWORD *v7;
  uint64_t result;
  _BYTE v9[24];

  v4 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  DeviceForAOID = ads::Kernel::findDeviceForAOID(this, a2);
  if (!DeviceForAOID)
    return 560227702;
  v7 = (_QWORD *)DeviceForAOID;
  result = ads::Device::Disconnect((ads::Device *)(DeviceForAOID + 40));
  if (!(_DWORD)result)
  {
    std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v9, (_QWORD *)this + 2, v7);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v9);
    return 0;
  }
  return result;
}

uint64_t ads::Kernel::disconnectADSDeviceByAOID(ads::Kernel *this, int a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[2];
  int v7;
  _QWORD block[6];
  unsigned int v9;

  v7 = a2;
  v6[0] = this;
  v6[1] = &v7;
  v2 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v9 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v9;
  block[5] = v6;
  dispatch_sync(v3, block);
  v4 = v9;

  return v4;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ads::Kernel::_disconnectADSDeviceByAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(_QWORD *)(a1 + 40) + 8));
  **(_DWORD **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByAOIDsENSt3__16vectorIjNS5_9allocatorIjEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t result)
{
  uint64_t v1;
  int ***v2;
  int *v3;
  int *v4;
  ads::Kernel *v5;
  int *v6;
  int *v7;
  int v8;
  int v9;

  v1 = result;
  v2 = *(int ****)(result + 40);
  v3 = **v2;
  v4 = (*v2)[1];
  if (v3 == v4)
  {
LABEL_11:
    v8 = 0;
  }
  else
  {
    v5 = (ads::Kernel *)v2[1];
    do
    {
      result = ads::Kernel::findDeviceForAOID(v5, *v3);
      if (!result)
      {
        v8 = 560227702;
        goto LABEL_13;
      }
      ++v3;
    }
    while (v3 != v4);
    v6 = **v2;
    v7 = (*v2)[1];
    if (v6 == v7)
      goto LABEL_11;
    v8 = 0;
    do
    {
      v9 = *v6++;
      result = ads::Kernel::_disconnectADSDeviceByAOID(v5, v9);
      if ((_DWORD)result)
        v8 = result;
    }
    while (v6 != v7);
  }
LABEL_13:
  **(_DWORD **)(v1 + 32) = v8;
  return result;
}

uint64_t ads::Kernel::disconnectADSDeviceByUUID(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD block[6];
  unsigned int v8;

  v6[0] = a1;
  v6[1] = a2;
  v2 = *(void **)(a1 + 56);
  applesauce::dispatch::v1::queue::operator*(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v8;
  block[5] = v6;
  dispatch_sync(v3, block);
  v4 = v8;

  return v4;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v2 = *(uint64_t **)(a1 + 40);
  v4 = *v2;
  v3 = v2[1];
  if (*(char *)(v3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *(_QWORD *)(v3 + 8));
  else
    __p = *(std::string *)v3;
  v5 = ads::Kernel::_disconnectADSDeviceByUUID(v4, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  **(_DWORD **)(a1 + 32) = v5;
}

uint64_t ads::Kernel::_disconnectADSDeviceByUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t *DeviceForUUID;
  uint64_t *v7;
  uint64_t result;
  std::string __p;
  _BYTE v10[24];

  v4 = *(void **)(a1 + 56);
  applesauce::dispatch::v1::queue::operator*(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  DeviceForUUID = ads::Kernel::findDeviceForUUID(a1, (uint64_t)&__p);
  v7 = DeviceForUUID;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (DeviceForUUID)
      goto LABEL_6;
    return 560227702;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v7)
    return 560227702;
LABEL_6:
  result = ads::Device::Disconnect((ads::Device *)(v7 + 5));
  if (!(_DWORD)result)
  {
    std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v10, (_QWORD *)(a1 + 16), v7);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v10);
    return 0;
  }
  return result;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByUUIDsENSt3__16vectorINS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENSA_ISC_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *DeviceForUUID;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  std::string __p;
  std::string v12;

  v2 = *(uint64_t ***)(a1 + 40);
  v3 = **v2;
  v4 = (*v2)[1];
  if (v3 == v4)
  {
LABEL_21:
    v9 = 0;
  }
  else
  {
    v5 = (uint64_t)v2[1];
    do
    {
      if (*(char *)(v3 + 23) < 0)
        std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)v3, *(_QWORD *)(v3 + 8));
      else
        v12 = *(std::string *)v3;
      DeviceForUUID = ads::Kernel::findDeviceForUUID(v5, (uint64_t)&v12);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v12.__r_.__value_.__l.__data_);
      if (!DeviceForUUID)
      {
        v9 = 560227702;
        goto LABEL_23;
      }
      v3 += 24;
    }
    while (v3 != v4);
    v7 = **v2;
    v8 = (*v2)[1];
    if (v7 == v8)
      goto LABEL_21;
    v9 = 0;
    do
    {
      if (*(char *)(v7 + 23) < 0)
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *(_QWORD *)(v7 + 8));
      else
        __p = *(std::string *)v7;
      v10 = ads::Kernel::_disconnectADSDeviceByUUID(v5, (uint64_t)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v10)
        v9 = v10;
      v7 += 24;
    }
    while (v7 != v8);
  }
LABEL_23:
  **(_DWORD **)(a1 + 32) = v9;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithAOIDConnectedEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ads::Kernel::findDeviceForAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(_QWORD *)(a1 + 40) + 8));
  if (result)
    result = ads::Device::IsConnected((ads::Device *)(result + 40));
  **(_BYTE **)(a1 + 32) = result;
  return result;
}

BOOL ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithUUIDConnectedENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *DeviceForUUID;
  uint64_t *v6;
  _BOOL8 result;
  std::string __p;

  v2 = *(uint64_t **)(a1 + 40);
  v4 = *v2;
  v3 = v2[1];
  if (*(char *)(v3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *(_QWORD *)(v3 + 8));
  else
    __p = *(std::string *)v3;
  DeviceForUUID = ads::Kernel::findDeviceForUUID(v4, (uint64_t)&__p);
  v6 = DeviceForUUID;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v6)
      goto LABEL_6;
LABEL_8:
    result = 0;
    goto LABEL_9;
  }
  if (!DeviceForUUID)
    goto LABEL_8;
LABEL_6:
  result = ads::Device::IsConnected((ads::Device *)(v6 + 5));
LABEL_9:
  **(_BYTE **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel11hasPropertyEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16));
    v4 = 0;
    v5 = (_DWORD)result != 0;
    v6 = 256;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v4 = 560227702;
  }
  v7 = v6 | v5;
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v8 = v4;
  *(_WORD *)(v8 + 4) = v7;
  return result;
}

void sub_237B98E8C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x237B98E70);
}

uint64_t ads::Kernel::getPropertyDataSize(ads::Kernel *this, int a2, const AudioObjectPropertyAddress *a3, int a4, const void *a5)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[5];
  const void *v10;
  int v11;
  const AudioObjectPropertyAddress *v12;
  int v13;
  _QWORD block[6];
  uint64_t v15;
  int v16;

  v13 = a2;
  v12 = a3;
  v11 = a4;
  v9[0] = this;
  v9[1] = &v13;
  v9[2] = &v12;
  v9[3] = &v11;
  v9[4] = &v10;
  v10 = a5;
  v5 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 0;
  BYTE4(v15) = 0;
  LOBYTE(v16) = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel19getPropertyDataSizeEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v15;
  block[5] = v9;
  dispatch_sync(v6, block);
  v7 = v15;

  return v7;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel19getPropertyDataSizeEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  UInt32 outDataSize;
  _BYTE v8[12];

  v2 = *(_QWORD *)(a1 + 40);
  result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    outDataSize = 0;
    result = AudioObjectGetPropertyDataSize(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16), **(_DWORD **)(v2 + 24), **(const void ***)(v2 + 32), &outDataSize);
    if (!(_DWORD)result)
    {
      *(_DWORD *)v8 = 0;
      *(_QWORD *)&v8[4] = outDataSize | 0x100000000;
      goto LABEL_7;
    }
    *(_DWORD *)v8 = result;
  }
  else
  {
    *(_DWORD *)v8 = 560227702;
  }
  v8[4] = 0;
  v8[8] = 0;
LABEL_7:
  v4 = v8[8];
  v5 = HIDWORD(*(_QWORD *)v8);
  v6 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v6 = *(_DWORD *)v8;
  *(_DWORD *)(v6 + 4) = v5;
  *(_BYTE *)(v6 + 8) = v4;
  return result;
}

void sub_237B9902C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x237B98FB8);
}

void ads::Kernel::getPropertyData(ads::Kernel *this, uint64_t a2, const AudioObjectPropertyAddress *a3, uint64_t a4, const void *a5, uint64_t a6)
{
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  _QWORD block[6];

  v12 = (int)a3;
  v11 = a4;
  v10 = (int)a5;
  v8[0] = a2;
  v8[1] = &v12;
  v8[2] = &v11;
  v8[3] = &v10;
  v8[4] = &v9;
  v9 = a6;
  applesauce::dispatch::v1::queue::operator*(*(id *)(a2 + 56));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getPropertyDataEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = this;
  block[5] = v8;
  dispatch_sync(v7, block);

}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getPropertyDataEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  uint64_t v5;

  ads::Kernel::getPropertyData(unsigned int,AudioObjectPropertyAddress const*,unsigned int,void const*)::$_0::operator()((uint64_t)&v4, *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v2 = v4;
  v3 = *(const void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = v5;
  if (v3)
    CFRelease(v3);
}

void ads::Kernel::getPropertyData(unsigned int,AudioObjectPropertyAddress const*,unsigned int,void const*)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  OSStatus PropertyDataSize;
  uint64_t v5;
  char *v6;
  CFDataRef v7;
  CFDataRef v8;
  CFTypeID v9;
  void *exception;
  void *v11;
  uint64_t v12;
  UInt32 outDataSize;
  CFDataRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!ads::Kernel::findDeviceForAOID(*(ads::Kernel **)a2, **(_DWORD **)(a2 + 8)))
  {
    *(_DWORD *)a1 = 560227702;
    goto LABEL_6;
  }
  v14 = 0;
  outDataSize = 0;
  PropertyDataSize = AudioObjectGetPropertyDataSize(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), **(_DWORD **)(a2 + 24), **(const void ***)(a2 + 32), &outDataSize);
  if (PropertyDataSize
    || (MEMORY[0x24BDAC7A8](),
        v6 = (char *)&v12 - ((v5 + 15) & 0x1FFFFFFF0),
        (PropertyDataSize = AudioObjectGetPropertyData(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), **(_DWORD **)(a2 + 24), **(const void ***)(a2 + 32), &outDataSize, v6)) != 0))
  {
    *(_DWORD *)a1 = PropertyDataSize;
LABEL_6:
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  v7 = CFDataCreate(0, (const UInt8 *)v6, outDataSize);
  v8 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v9 = CFGetTypeID(v7);
  if (v9 != CFDataGetTypeID())
  {
    v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v14 = v8;
  CFRetain(v8);
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v8;
  CFRelease(v8);
}

void sub_237B99304(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  if (a2)
  {
    __cxa_free_exception(v4);
    CFRelease(v3);
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    v7 = *(_QWORD *)(v5 - 48);
    *(_DWORD *)v2 = 2003329396;
    *(_QWORD *)(v2 + 8) = 0;
    if (!v7)
      JUMPOUT(0x237B99218);
    JUMPOUT(0x237B9928CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B99398()
{
  uint64_t v0;

  applesauce::CF::DataRef::~DataRef((const void **)(v0 - 48));
  JUMPOUT(0x237B9933CLL);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t ads::Kernel::setPropertyDataPrivileged(ads::Kernel *this, int a2, const AudioObjectPropertyAddress *a3, int a4, const void *a5, int a6, const void *a7)
{
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[7];
  const void *v12;
  int v13;
  const void *v14;
  int v15;
  const AudioObjectPropertyAddress *v16;
  int v17;
  _QWORD block[6];
  unsigned int v19;

  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v13 = a6;
  v11[0] = this;
  v11[1] = &v17;
  v11[2] = &v16;
  v11[3] = &v15;
  v11[4] = &v14;
  v11[5] = &v13;
  v11[6] = &v12;
  v12 = a7;
  v7 = (void *)*((_QWORD *)this + 7);
  applesauce::dispatch::v1::queue::operator*(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v19 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25setPropertyDataPrivilegedEjPK26AudioObjectPropertyAddressjPKvjS9_E3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v19;
  block[5] = v11;
  dispatch_sync(v8, block);
  v9 = v19;

  return v9;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25setPropertyDataPrivilegedEjPK26AudioObjectPropertyAddressjPKvjS9_E3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  AudioObjectPropertyAddress v7;
  __int128 inData;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)(a1 + 40);
  result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16));
    if ((_DWORD)result)
    {
      v10 = 0u;
      v11 = 0u;
      inData = 0u;
      v9 = 0u;
      LODWORD(inData) = 2;
      v4 = *(_DWORD **)(v2 + 24);
      *(_QWORD *)&v9 = **(_QWORD **)(v2 + 16);
      DWORD2(v9) = *v4;
      v5 = *(_DWORD **)(v2 + 40);
      *(_QWORD *)&v10 = **(_QWORD **)(v2 + 32);
      DWORD2(v10) = *v5;
      *(_QWORD *)&v11 = **(_QWORD **)(v2 + 48);
      v7.mElement = 0;
      *(_QWORD *)&v7.mSelector = *(_QWORD *)"asvdbolg";
      result = AudioObjectSetPropertyData(**(_DWORD **)(v2 + 8), &v7, 0, 0, 0x40u, &inData);
      v6 = result;
    }
    else
    {
      v6 = 2003332927;
    }
  }
  else
  {
    v6 = 560227702;
  }
  **(_DWORD **)(a1 + 32) = v6;
  return result;
}

void sub_237B9958C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x237B99570);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23getPropertyData_TypeRefEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  uint64_t v5;

  ads::Kernel::getPropertyData_TypeRef(unsigned int,AudioObjectPropertyAddress const*)::$_0::operator()((uint64_t)&v4, *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v2 = v4;
  v3 = *(const void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = v5;
  if (v3)
    CFRelease(v3);
}

void ads::Kernel::getPropertyData_TypeRef(unsigned int,AudioObjectPropertyAddress const*)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  OSStatus PropertyDataSize;
  int v5;
  CFTypeRef v6;
  CFTypeRef v7;
  const void *v8;
  int v9;
  uint64_t v10;
  UInt32 outDataSize;
  CFTypeRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!ads::Kernel::findDeviceForAOID(*(ads::Kernel **)a2, **(_DWORD **)(a2 + 8)))
  {
    v5 = 560227702;
LABEL_9:
    *(_DWORD *)a1 = v5;
    goto LABEL_10;
  }
  v12 = 0;
  outDataSize = 0;
  PropertyDataSize = AudioObjectGetPropertyDataSize(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), 0, 0, &outDataSize);
  if (PropertyDataSize)
  {
LABEL_3:
    *(_DWORD *)a1 = PropertyDataSize;
LABEL_10:
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  if (outDataSize != 8)
  {
    v5 = 1852797029;
    goto LABEL_9;
  }
  MEMORY[0x24BDAC7A8]();
  PropertyDataSize = AudioObjectGetPropertyData(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), 0, 0, &outDataSize, &v7);
  if (PropertyDataSize)
    goto LABEL_3;
  v6 = v7;
  v12 = v7;
  if (v7)
  {
    CFRetain(v7);
    *(_DWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = v6;
    CFRelease(v6);
  }
  else
  {
    v9 = 560947818;
    v8 = 0;
    *(_DWORD *)a1 = 560947818;
    *(_QWORD *)(a1 + 8) = 0;
    v10 = 0;
    std::pair<$_3,applesauce::CF::TypeRef>::~pair((uint64_t)&v9);
    applesauce::CF::TypeRef::~TypeRef(&v8);
  }
}

void sub_237B9975C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_237B99778(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    v4 = *(_QWORD *)(v3 - 48);
    *(_DWORD *)v2 = 2003329396;
    *(_QWORD *)(v2 + 8) = 0;
    if (!v4)
      JUMPOUT(0x237B996CCLL);
    JUMPOUT(0x237B99718);
  }
  JUMPOUT(0x237B99768);
}

void sub_237B997A8()
{
  uint64_t v0;

  applesauce::CF::TypeRef::~TypeRef((const void **)(v0 - 48));
  JUMPOUT(0x237B99768);
}

uint64_t std::pair<$_3,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel33setPropertyDataPrivileged_TypeRefEjPK26AudioObjectPropertyAddressRKNS_2CF7TypeRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSD_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  AudioObjectPropertyAddress v5;
  __int128 inData;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 40);
  result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    if (**(_QWORD **)(v2 + 16))
    {
      result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 24));
      if ((_DWORD)result)
      {
        v10 = **(_QWORD **)(v2 + 16);
        v8 = 0u;
        v9 = 0u;
        inData = 0u;
        v7 = 0u;
        LODWORD(inData) = 2;
        *(_QWORD *)&v7 = **(_QWORD **)(v2 + 24);
        DWORD2(v8) = 8;
        *(_QWORD *)&v9 = &v10;
        BYTE8(v9) = 1;
        v5.mElement = 0;
        *(_QWORD *)&v5.mSelector = *(_QWORD *)"asvdbolg";
        result = AudioObjectSetPropertyData(**(_DWORD **)(v2 + 8), &v5, 0, 0, 0x40u, &inData);
        v4 = result;
      }
      else
      {
        v4 = 2003332927;
      }
    }
    else
    {
      v4 = 560947818;
    }
  }
  else
  {
    v4 = 560227702;
  }
  **(_DWORD **)(a1 + 32) = v4;
  return result;
}

void sub_237B998F8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x237B998DCLL);
}

void util::server_log(util *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0)
  {
    {
      qword_256872820 = 0;
      util::server_log(void)::sLogCat = (uint64_t)os_log_create("com.apple.coreaudio", "cider_server");
    }
  }
}

#error "237B99978: too big function (funcsize=0)"

void sub_237BAA374(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::TransformMacAddrs(std::string *a1, uint64_t a2)
{
  uint64_t v4;
  std::string::value_type *v5;
  int v6;
  int v7;
  std::string::value_type *v8;
  uint64_t v9;
  std::__wrap_iter<const char *>::iterator_type v10;
  std::string::value_type *v11;
  std::__wrap_iter<const char *>::iterator_type i;
  std::__wrap_iter<const char *>::iterator_type v13;
  std::string::value_type *v14;
  std::vector<std::ssub_match>::pointer begin;
  const char *v16;
  int v17;
  const char *v18;
  int v19;
  std::string::value_type *v20;
  std::string::value_type *v21;
  std::string::value_type *v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  std::sub_match<std::__wrap_iter<const char *>> *v27;
  BOOL v28;
  std::match_results<std::__wrap_iter<const char *>>::value_type *p_unmatched;
  std::string::value_type *v30;
  std::__wrap_iter<const char *> *v31;
  std::string::value_type *v32;
  std::string::value_type *v33;
  std::regex_constants::match_flag_type flags;
  unsigned __int32 v35;
  std::match_results<std::__wrap_iter<const char *>>::value_type *v36;
  std::__wrap_iter<const char *> *v37;
  std::sub_match<const char *> *v38;
  std::sub_match<const char *> *v39;
  char v40;
  char v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::vector<std::ssub_match>::pointer end;
  std::__wrap_iter<const char *> *p_second;
  unint64_t v47;
  std::regex_traits<char> v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  std::regex_iterator<std::__wrap_iter<const char *>, char> __x;
  std::regex_iterator<std::__wrap_iter<const char *>, char> __p;
  std::vector<std::csub_match> v54[2];
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;

  std::regex_traits<char>::regex_traits(&v48);
  v51 = 0;
  v50 = 0u;
  v49 = 0u;
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>((uint64_t)&v48, "(([0-9a-fA-F]{2}:){4})([0-9a-fA-F]{2}):([0-9a-fA-F]{2})", "") != "")std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  memset(&__p.__match_.__matches_.__end_cap_, 0, 17);
  memset(&__p.__match_.__unmatched_.matched, 0, 17);
  __p.__match_.__prefix_.matched = 0;
  __p.__match_.__suffix_.first.__i_ = 0;
  memset(&__p, 0, 41);
  v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) == 0)
    v5 = (std::string::value_type *)a2;
  else
    v5 = *(std::string::value_type **)a2;
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a2 + 8);
  v6 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)&v48, (std::sub_match<const char *> *)v5, (std::sub_match<const char *> *)&v5[v4], (std::vector<std::csub_match> *)&__p, 0);
  if (__p.__begin_.__i_)
    operator delete((void *)__p.__begin_.__i_);
  if (!v6)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(a1, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    }
    else
    {
      *(_OWORD *)&a1->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      a1->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    }
    goto LABEL_85;
  }
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  v7 = *(char *)(a2 + 23);
  if (v7 >= 0)
    v8 = (std::string::value_type *)a2;
  else
    v8 = *(std::string::value_type **)a2;
  if (v7 >= 0)
    v9 = *(unsigned __int8 *)(a2 + 23);
  else
    v9 = *(_QWORD *)(a2 + 8);
  __p.__begin_.__i_ = v8;
  __p.__end_.__i_ = &v8[v9];
  __p.__pregex_ = (const std::regex_iterator<std::__wrap_iter<const char *>, char>::regex_type *)&v48;
  __p.__flags_ = match_default;
  memset(&__p.__match_.__prefix_, 0, 17);
  memset(&__p.__match_.__suffix_, 0, 17);
  __p.__match_.__ready_ = 0;
  __p.__match_.__position_start_.__i_ = 0;
  memset(&__p.__match_, 0, 41);
  memset(&__x.__match_.__matches_.__end_cap_, 0, 17);
  memset(&__x.__match_.__unmatched_.matched, 0, 17);
  __x.__match_.__prefix_.matched = 0;
  __x.__match_.__suffix_.first.__i_ = 0;
  memset(&__x, 0, 41);
  std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)&v48, (std::sub_match<const char *> *)v8, (std::sub_match<const char *> *)&v8[v9], (std::vector<std::csub_match> *)&__x, 0);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&__p.__match_, (uint64_t)v8, (uint64_t)&v8[v9], (uint64_t *)&__x, 0);
  if (__x.__begin_.__i_)
    operator delete((void *)__x.__begin_.__i_);
  memset(&__x.__match_.__prefix_, 0, 17);
  memset(&__x.__match_.__suffix_, 0, 17);
  __x.__match_.__ready_ = 0;
  __x.__match_.__position_start_.__i_ = 0;
  memset(&__x.__match_, 0, 41);
  memset(&__x, 0, 28);
  if (!std::regex_iterator<std::__wrap_iter<char const*>,char,std::regex_traits<char>>::operator==(&__p, &__x))
  {
    v10 = 0;
    v11 = 0;
    while (1)
    {
      if (std::regex_iterator<std::__wrap_iter<char const*>,char,std::regex_traits<char>>::operator==(&__p, &__x))
      {
        while (v11 != v10)
          std::string::push_back(a1, *v11++);
        goto LABEL_82;
      }
      i = __p.__match_.__prefix_.first.__i_;
      v13 = __p.__match_.__prefix_.second.__i_;
      if (__p.__match_.__prefix_.first.__i_ != __p.__match_.__prefix_.second.__i_)
      {
        v14 = (std::string::value_type *)__p.__match_.__prefix_.first.__i_;
        do
          std::string::push_back(a1, *v14++);
        while (v14 != v13);
      }
      v11 = (std::string::value_type *)__p.__match_.__suffix_.first.__i_;
      v10 = __p.__match_.__suffix_.second.__i_;
      begin = __p.__match_.__matches_.__begin_;
      end = __p.__match_.__matches_.__end_;
      p_second = &__p.__match_.__matches_.__begin_->second;
      v47 = 0xAAAAAAAAAAAAAAABLL
          * (((char *)__p.__match_.__matches_.__end_ - (char *)__p.__match_.__matches_.__begin_) >> 3);
      v16 = "$1$4:$3";
      do
      {
        v17 = *(unsigned __int8 *)v16;
        if (v17 != 36)
          goto LABEL_58;
        v18 = v16 + 1;
        if (v16 + 1 == "")
          goto LABEL_56;
        v19 = *v18;
        v17 = *(unsigned __int8 *)v18;
        if (v19 > 38)
        {
          if (v19 == 39)
          {
            if (v11 != v10)
            {
              v33 = v11;
              do
                std::string::push_back(a1, *v33++);
              while (v33 != v10);
            }
            goto LABEL_59;
          }
          if (v19 == 96)
          {
            if (i != v13)
            {
              v22 = (std::string::value_type *)i;
              do
                std::string::push_back(a1, *v22++);
              while (v22 != v13);
            }
            goto LABEL_59;
          }
        }
        else
        {
          if (v19 == 36)
          {
            ++v16;
            goto LABEL_58;
          }
          if (v19 == 38)
          {
            v20 = (std::string::value_type *)begin->first.__i_;
            v21 = (std::string::value_type *)begin->second.__i_;
            while (v20 != v21)
              std::string::push_back(a1, *v20++);
            goto LABEL_59;
          }
        }
        if ((v17 - 48) > 9)
        {
LABEL_56:
          LOBYTE(v17) = 36;
LABEL_58:
          std::string::push_back(a1, v17);
          v18 = v16;
          goto LABEL_59;
        }
        v23 = *(unsigned __int8 *)v18 - 48;
        if (v16 + 2 != "")
        {
          v24 = *((unsigned __int8 *)v16 + 2);
          v25 = v24 - 48;
          v26 = v24 + 10 * (int)v23 - 48;
          if (v25 > 9)
          {
            v18 = v16 + 1;
          }
          else
          {
            v23 = v26;
            v18 = v16 + 2;
          }
        }
        v27 = &begin[(int)v23];
        v28 = v47 > v23;
        p_unmatched = &__p.__match_.__unmatched_;
        if (v28)
          p_unmatched = v27;
        v30 = (std::string::value_type *)p_unmatched->first.__i_;
        v31 = &v27->second;
        if (!v28)
          v31 = &__p.__match_.__unmatched_.second;
        v32 = (std::string::value_type *)v31->__i_;
        while (v30 != v32)
          std::string::push_back(a1, *v30++);
LABEL_59:
        v16 = v18 + 1;
      }
      while (v18 + 1 != "");
      flags = __p.__flags_;
      v35 = __p.__flags_ | 0x800;
      __p.__flags_ |= 0x800u;
      v37 = &__p.__match_.__unmatched_.second;
      v36 = &__p.__match_.__unmatched_;
      if (end != begin)
      {
        v36 = begin;
        v37 = p_second;
      }
      v38 = (std::sub_match<const char *> *)v37->__i_;
      v39 = (std::sub_match<const char *> *)__p.__end_.__i_;
      if (v36->first.__i_ == v37->__i_)
      {
        if ((std::sub_match<const char *> *)__p.__end_.__i_ == v38)
        {
LABEL_77:
          if (begin)
          {
            __p.__match_.__matches_.__end_ = begin;
            operator delete(begin);
          }
          __p.__match_.__ready_ = 0;
          memset(&__p.__match_, 0, 41);
          memset(&__p.__match_.__prefix_, 0, 17);
          memset(&__p.__match_.__suffix_, 0, 17);
          __p.__match_.__position_start_.__i_ = 0;
        }
        else
        {
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v61 = 0;
          v62 = 0;
          memset(v54, 0, 41);
          v41 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)__p.__pregex_, v38, (std::sub_match<const char *> *)__p.__end_.__i_, v54, flags | 0x860);
          std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&__p.__match_, (uint64_t)v38, (uint64_t)v39, (uint64_t *)v54, 1);
          if (v54[0].__begin_)
            operator delete(v54[0].__begin_);
          if ((v41 & 1) == 0)
          {
            v38 = (std::sub_match<const char *> *)((char *)v38 + 1);
            v35 = __p.__flags_;
            v39 = (std::sub_match<const char *> *)__p.__end_.__i_;
            goto LABEL_68;
          }
        }
      }
      else
      {
LABEL_68:
        __p.__flags_ = v35 | 0x80;
        v55 = 0;
        v56 = 0;
        v57 = 0;
        v58 = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0;
        v62 = 0;
        memset(v54, 0, 41);
        v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)__p.__pregex_, v38, v39, v54, v35 | 0x80);
        std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&__p.__match_, (uint64_t)v38, (uint64_t)v39, (uint64_t *)v54, (v35 & 0x800) != 0);
        if (v54[0].__begin_)
          operator delete(v54[0].__begin_);
        if ((v40 & 1) == 0)
        {
          begin = __p.__match_.__matches_.__begin_;
          goto LABEL_77;
        }
      }
    }
  }
  for (; v9; --v9)
    std::string::push_back(a1, *v8++);
LABEL_82:
  if (__p.__match_.__matches_.__begin_)
    operator delete(__p.__match_.__matches_.__begin_);
LABEL_85:
  v42 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    v43 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  std::locale::~locale(&v48.__loc_);
}

void sub_237BAF410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::locale a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p)
{
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  std::locale::~locale(&a19);
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, _QWORD *a2, _OWORD **a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  uint64_t v13;

  v5 = (void **)std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>((uint64_t)a1, &v13, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x40uLL);
    v11[1] = a1 + 1;
    v8 = *a3;
    v9 = *((_QWORD *)*a3 + 2);
    v6[2] = **a3;
    *((_QWORD *)v6 + 6) = v9;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *((_QWORD *)v6 + 7) = 0;
    v12 = 1;
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v7, (uint64_t *)v6);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11);
  }
  return v6;
}

unint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,float,void>::Get(AudioObjectID *a1, const AudioObjectPropertyAddress *a2)
{
  const void *v4;
  unsigned int PropertyData;
  uint64_t v6;
  _DWORD outData[5];
  UInt32 ioDataSize[4];

  if (AudioObjectHasProperty(*a1, a2))
  {
    ioDataSize[0] = 2003329396;
    *(_QWORD *)&ioDataSize[1] = 0;
    PropertyData = 2003329396;
    v6 = 0;
    ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a1, a2, 0, 0, v4);
    if (ioDataSize[0])
    {
      outData[0] = 0;
      PropertyData = AudioObjectGetPropertyData(*a1, a2, 0, 0, ioDataSize, outData);
      if (PropertyData)
        v6 = 0;
      else
        v6 = outData[0];
    }
  }
  else
  {
    v6 = 0;
    PropertyData = 2003332927;
  }
  return PropertyData | (unint64_t)(v6 << 32);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[9],std::string>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  int v4;
  const UInt8 *v5;
  CFIndex v6;
  CFStringRef v7;
  void *exception;

  applesauce::CF::TypeRef::TypeRef(a1, "selector");
  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (const UInt8 *)a2;
  else
    v5 = *(const UInt8 **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((_QWORD *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BAF6E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[6],std::string>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  int v4;
  const UInt8 *v5;
  CFIndex v6;
  CFStringRef v7;
  void *exception;

  applesauce::CF::TypeRef::TypeRef(a1, "scope");
  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (const UInt8 *)a2;
  else
    v5 = *(const UInt8 **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((_QWORD *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BAF7BC(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[8],unsigned int const&>(applesauce::CF::TypeRef *a1, int *a2)
{
  CFNumberRef v4;
  void *exception;
  int valuePtr;

  applesauce::CF::TypeRef::TypeRef(a1, "element");
  valuePtr = *a2;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *((_QWORD *)a1 + 1) = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BAF88C(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[5],std::string const>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  int v4;
  const UInt8 *v5;
  CFIndex v6;
  CFStringRef v7;
  void *exception;

  applesauce::CF::TypeRef::TypeRef(a1, "type");
  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (const UInt8 *)a2;
  else
    v5 = *(const UInt8 **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((_QWORD *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BAF968(_Unwind_Exception *a1)
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
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return this;
}

void sub_237BAFA58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  CFTypeRef *v15;

  if (*v15)
    CFRelease(*v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFNumberRef `anonymous namespace'::ConvertDataToTypeRef<float>(CFNumberRef *a1, float a2)
{
  CFNumberRef result;
  void *exception;
  float valuePtr;

  valuePtr = a2;
  result = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_237BAFB0C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
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
  void **v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  void *v17;
  void **v18;
  void **v19;
  void **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void **v26;
  void *v27;
  void **v28;
  void **v29;
  CFDictionaryRef v30;
  void *exception;
  void **values;
  void **v34;
  unint64_t v35;
  void **keys;
  void **v37;
  unint64_t v38;

  v2 = *(_QWORD *)(a1 + 8);
  keys = 0;
  v37 = 0;
  v38 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  v34 = 0;
  v35 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = *(void ***)a1;
    v5 = *(_QWORD *)a1 + 16 * v3;
    do
    {
      v6 = *v4;
      v7 = v37;
      if ((unint64_t)v37 >= v38)
      {
        v9 = keys;
        v10 = v37 - keys;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        v12 = v38 - (_QWORD)keys;
        if ((uint64_t)(v38 - (_QWORD)keys) >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
          v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v13);
        else
          v14 = 0;
        v15 = (void **)(v13 + 8 * v10);
        *v15 = v6;
        v8 = v15 + 1;
        if (v7 != v9)
        {
          do
          {
            v16 = *--v7;
            *--v15 = v16;
          }
          while (v7 != v9);
          v7 = keys;
        }
        keys = v15;
        v38 = v13 + 8 * v14;
        if (v7)
          operator delete(v7);
      }
      else
      {
        *v37 = v6;
        v8 = v7 + 1;
      }
      v37 = v8;
      v17 = v4[1];
      v18 = v34;
      if ((unint64_t)v34 >= v35)
      {
        v20 = values;
        v21 = v34 - values;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 61)
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        v23 = v35 - (_QWORD)values;
        if ((uint64_t)(v35 - (_QWORD)values) >> 2 > v22)
          v22 = v23 >> 2;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
          v24 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
          v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v24);
        else
          v25 = 0;
        v26 = (void **)(v24 + 8 * v21);
        *v26 = v17;
        v19 = v26 + 1;
        if (v18 != v20)
        {
          do
          {
            v27 = *--v18;
            *--v26 = v27;
          }
          while (v18 != v20);
          v18 = values;
        }
        values = v26;
        v35 = v24 + 8 * v25;
        if (v18)
          operator delete(v18);
      }
      else
      {
        *v34 = v17;
        v19 = v18 + 1;
      }
      v34 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  v28 = keys;
  v29 = values;
  v30 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v30)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (v29)
    operator delete(v29);
  if (v28)
    operator delete(v28);
  return v30;
}

void sub_237BAFD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  __cxa_free_exception(v12);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
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

void std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

uint64_t std::vector<applesauce::CF::DictionaryRef>::push_back[abi:ne180100](_QWORD *a1, CFTypeRef *a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64x2_t v21;
  char *v22;
  uint64_t v23;
  int64x2_t v24;
  char *v25;
  _QWORD *v26;

  v4 = a1 + 2;
  v5 = a1[2];
  v6 = (_QWORD *)a1[1];
  if ((unint64_t)v6 >= v5)
  {
    v9 = ((uint64_t)v6 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v26 = v4;
    if (v12)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v12);
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    v15 = &v14[8 * v9];
    v16 = &v14[8 * v13];
    v25 = v16;
    v17 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(v15, *a2);
    v8 = v17 + 1;
    v24.i64[1] = (uint64_t)(v17 + 1);
    v19 = (_QWORD *)*a1;
    v18 = (_QWORD *)a1[1];
    if (v18 == (_QWORD *)*a1)
    {
      v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        v20 = *--v18;
        *--v17 = v20;
        *v18 = 0;
      }
      while (v18 != v19);
      v21 = *(int64x2_t *)a1;
      v8 = (_QWORD *)v24.i64[1];
      v16 = v25;
    }
    *a1 = v17;
    a1[1] = v8;
    v24 = v21;
    v22 = (char *)a1[2];
    a1[2] = v16;
    v25 = v22;
    v23 = v21.i64[0];
    result = std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(v6, *a2);
    v8 = (_QWORD *)(result + 8);
  }
  a1[1] = v8;
  return result;
}

uint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,AudioValueRange,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  uint64_t result;
  const void *v7;
  __int128 outData;
  UInt32 ioDataSize;

  result = AudioObjectHasProperty(*a2, inAddress);
  if ((_DWORD)result)
  {
    *(_DWORD *)a1 = 2003329396;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 24) = 0;
    result = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v7);
    ioDataSize = result;
    if ((_DWORD)result)
    {
      result = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = result;
      if (!(_DWORD)result)
      {
        *(_OWORD *)(a1 + 8) = outData;
        *(_BYTE *)(a1 + 24) = 1;
      }
    }
  }
  else
  {
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 24) = 0;
  }
  return result;
}

void `anonymous namespace'::ConvertDataToTypeRef<AudioValueRange>(CFArrayRef *a1, __n128 a2)
{
  uint64_t v3;
  CFNumberRef *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int64x2_t v13;
  unint64_t v14;
  CFArrayRef v15;
  int64x2_t v16;
  unint64_t v17;
  int64x2_t *v18;
  int64x2_t v19;
  unint64_t v20;
  unint64_t *v21;
  __n128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v16 = 0uLL;
  v17 = 0;
  std::vector<applesauce::CF::NumberRef>::reserve(&v16, 2uLL);
  v3 = 0;
  v4 = (CFNumberRef *)v16.i64[1];
  do
  {
    if ((unint64_t)v4 >= v17)
    {
      v5 = ((uint64_t)v4 - v16.i64[0]) >> 3;
      if ((unint64_t)(v5 + 1) >> 61)
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v6 = (uint64_t)(v17 - v16.i64[0]) >> 2;
      if (v6 <= v5 + 1)
        v6 = v5 + 1;
      if (v17 - v16.i64[0] >= 0x7FFFFFFFFFFFFFF8)
        v7 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v7 = v6;
      v21 = &v17;
      if (v7)
        v7 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v7);
      else
        v8 = 0;
      v18 = (int64x2_t *)v7;
      v19.i64[0] = v7 + 8 * v5;
      v19.i64[1] = v19.i64[0];
      v20 = v7 + 8 * v8;
      std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>((CFNumberRef *)v19.i64[0], v22.n128_f64[v3]);
      v9 = v19.i64[0];
      v4 = (CFNumberRef *)(v19.i64[1] + 8);
      v19.i64[1] += 8;
      v10 = (_QWORD *)v16.i64[1];
      v11 = (_QWORD *)v16.i64[0];
      if (v16.i64[1] == v16.i64[0])
      {
        v13 = vdupq_n_s64(v16.u64[1]);
      }
      else
      {
        do
        {
          v12 = *--v10;
          *(_QWORD *)(v9 - 8) = v12;
          v9 -= 8;
          *v10 = 0;
        }
        while (v10 != v11);
        v13 = v16;
        v4 = (CFNumberRef *)v19.i64[1];
      }
      v16.i64[0] = v9;
      v16.i64[1] = (uint64_t)v4;
      v19 = v13;
      v14 = v17;
      v17 = v20;
      v20 = v14;
      v18 = (int64x2_t *)v13.i64[0];
      std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v18);
    }
    else
    {
      std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>(v4++, v22.n128_f64[v3]);
    }
    v16.i64[1] = (uint64_t)v4;
    ++v3;
  }
  while (v3 != 2);
  v15 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)&v16);
  v18 = &v16;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  CFRetain(v15);
  *a1 = v15;
  CFRelease(v15);
}

void sub_237BB0200(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

CFNumberRef `anonymous namespace'::ConvertDataToTypeRef<unsigned int>(CFNumberRef *a1, int a2)
{
  CFNumberRef result;
  void *exception;
  int valuePtr;

  valuePtr = a2;
  result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_237BB02C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::DictionaryRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  const void *v6;
  OSStatus PropertyData;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  UInt32 ioDataSize;
  const void *outData;
  char v14;

  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    v14 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      outData = 0;
      PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        v8 = outData;
        v11 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&v10, &v11);
        v9 = v10;
        *(_BYTE *)(a1 + 16) = 1;
        *(_QWORD *)(a1 + 8) = v9;
        if (v8)
          CFRelease(v8);
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    v14 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

void `anonymous namespace'::ConvertDataToTypeRef<applesauce::CF::StringRef>(CFStringRef *a1, const __CFString *a2)
{
  std::string *p_p;
  CFIndex size;
  CFStringRef v5;
  applesauce::CF *exception;
  void *v7;
  void *v8[2];
  char v9;
  std::string __p;

  if (!a2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::convert_to<std::string,0>((uint64_t)v8, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v5 = CFStringCreateWithBytes(0, (const UInt8 *)p_p, size, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    v7 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v7, "Could not construct");
    __cxa_throw(v7, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v9 < 0)
    operator delete(v8[0]);
}

void sub_237BB04E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::NumberRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  const void *v6;
  OSStatus PropertyData;
  CFTypeRef v8;
  CFTypeID v9;
  CFTypeID v10;
  void *exception;
  void *v12;
  UInt32 ioDataSize;
  CFTypeRef outData;
  char v15;

  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    v15 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      outData = 0;
      PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        v8 = outData;
        if (outData)
        {
          v9 = CFGetTypeID(outData);
          if (v9 != CFNumberGetTypeID())
          {
            exception = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x23B820E38](exception, "Could not construct");
            __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          CFRetain(v8);
          v10 = CFGetTypeID(v8);
          if (v10 != CFNumberGetTypeID())
          {
            v12 = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x23B820E38](v12, "Could not construct");
            __cxa_throw(v12, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          *(_BYTE *)(a1 + 16) = 1;
          *(_QWORD *)(a1 + 8) = v8;
          CFRelease(v8);
        }
        else
        {
          *(_BYTE *)(a1 + 16) = 1;
          *(_QWORD *)(a1 + 8) = 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    v15 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

void sub_237BB06D4(void *a1)
{
  const void *v1;
  void *v2;

  __cxa_free_exception(v2);
  CFRelease(v1);
  __clang_call_terminate(a1);
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

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::ArrayRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  const void *v6;
  OSStatus PropertyData;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  UInt32 ioDataSize;
  const void *outData;
  char v14;

  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    v14 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      outData = 0;
      PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        v8 = outData;
        v11 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef((applesauce::CF::ArrayRef *)&v10, &v11);
        v9 = v10;
        *(_BYTE *)(a1 + 16) = 1;
        *(_QWORD *)(a1 + 8) = v9;
        if (v8)
          CFRelease(v8);
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    v14 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
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

void `anonymous namespace'::AddCustomProperty<1970496630u,1735159650u,0u>(AudioObjectID a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  CFDictionaryRef CFDictionaryRef;
  uint64_t v12;
  const void *v13;
  const void *v14;
  CFDictionaryRef v15;
  CFNumberRef v16;
  void *v17[2];
  char v18;
  _QWORD v19[2];
  void *v20;
  char v21;
  _QWORD **v22;
  _QWORD *v23[2];
  Boolean outIsSettable;
  AudioObjectPropertyAddress inAddress;
  void *__p[2];
  char v27;
  void *v28[2];
  char v29;
  AudioObjectPropertyAddress v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[8];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"vdsubolg";
  inAddress.mElement = 0;
  LODWORD(v22) = a1;
  *(_QWORD *)&v30.mSelector = 0x676C6F6275736476;
  v30.mElement = 0;
  v4 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v22, &v30);
  *((_QWORD *)&v7 + 1) = v5;
  *(_QWORD *)&v7 = v4;
  v6 = v7 >> 32;
  if ((v6 & 0xFF00000000) != 0)
  {
    outIsSettable = 0;
    AudioObjectIsPropertySettable(a1, &inAddress, &outIsSettable);
    v8 = outIsSettable;
    v23[0] = 0;
    v23[1] = 0;
    v22 = v23;
    std::string::basic_string[abi:ne180100]<0>(&v20, "int");
    strcpy((char *)v28, "'usdv'");
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)v28);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[9],std::string>((applesauce::CF::TypeRef *)&v30, (uint64_t)v17);
    strcpy((char *)__p, "'glob'");
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)__p);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[6],std::string>((applesauce::CF::TypeRef *)&v31, (uint64_t)v28);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[8],unsigned int const&>((applesauce::CF::TypeRef *)&v32, (int *)&inAddress.mElement);
    std::string::basic_string[abi:ne180100]<0>(__p, "int");
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[5],std::string const>((applesauce::CF::TypeRef *)&v33, (uint64_t)__p);
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v34, "settable");
    v9 = *MEMORY[0x24BDBD270];
    v10 = *MEMORY[0x24BDBD268];
    if (v8 != 1)
      v9 = *MEMORY[0x24BDBD268];
    v34[1] = v9;
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v35, "requires set request");
    v35[1] = v10;
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v36, "data");
    v37[0] = v16;
    v16 = 0;
    v19[0] = &v30;
    v19[1] = 7;
    CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((uint64_t)v19);
    v12 = 0;
    v15 = CFDictionaryRef;
    do
    {
      v13 = (const void *)v37[v12];
      if (v13)
        CFRelease(v13);
      v14 = *(const void **)&v36[v12 * 8];
      if (v14)
        CFRelease(v14);
      v12 -= 2;
    }
    while (v12 != -14);
    if (v27 < 0)
      operator delete(__p[0]);
    if (v29 < 0)
      operator delete(v28[0]);
    if (v18 < 0)
      operator delete(v17[0]);
    if (v21 < 0)
      operator delete(v20);
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v23[0]);
    std::vector<applesauce::CF::DictionaryRef>::push_back[abi:ne180100](a2, (CFTypeRef *)&v15);
    if (CFDictionaryRef)
      CFRelease(CFDictionaryRef);
  }
}

void sub_237BB0B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,char a47)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p;
  void *v9;

  std::vector<void const*>::vector(&__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p;
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)__p, (uint64_t)v9);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  return CFArray;
}

void sub_237BB0D08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void `anonymous namespace'::GetStreams(_anonymous_namespace_ *this, int a2, uint64_t a3)
{
  int v4;
  unsigned int *v5;
  unsigned int **p_cf;
  unsigned int *v7;
  unsigned int *v8;
  ca::hal::detail::HALPropertyPolicy *v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  const void *v22;
  __int128 v23;
  uint64_t v24;
  const void *v25;
  CFTypeRef cf;
  __int128 v27;
  char v28;
  void *__p;
  _BYTE v30[24];
  char *v31;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  LODWORD(v25) = a2;
  cf = (CFTypeRef)((a3 << 32) | 0x73746D23);
  LODWORD(v27) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, (AudioObjectID *)&v25, (AudioObjectPropertyAddress *)&cf);
  LOBYTE(cf) = 0;
  v4 = v31;
  if ((_BYTE)v31)
  {
    cf = *(CFTypeRef *)v30;
    v27 = *(_OWORD *)&v30[8];
    v28 = 1;
    v5 = *(unsigned int **)&v30[8];
    p_cf = (unsigned int **)&cf;
  }
  else
  {
    v5 = 0;
    p_cf = (unsigned int **)&__p;
  }
  __p = 0;
  *(_OWORD *)v30 = 0uLL;
  v7 = *p_cf;
  p_cf[1] = 0;
  p_cf[2] = 0;
  *p_cf = 0;
  if (__p)
    operator delete(__p);
  if (v4 && cf)
    operator delete((void *)cf);
  if (v7 != v5)
  {
    v8 = v7;
    do
    {
      v9 = (ca::hal::detail::HALPropertyPolicy *)*v8;
      if (cf)
      {
        v10 = (_QWORD *)*((_QWORD *)this + 1);
        v11 = *((_QWORD *)this + 2);
        if ((unint64_t)v10 >= v11)
        {
          v12 = *(_QWORD **)this;
          v13 = ((uint64_t)v10 - *(_QWORD *)this) >> 3;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61)
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          v15 = v11 - (_QWORD)v12;
          if (v15 >> 2 > v14)
            v14 = v15 >> 2;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
            v16 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          v31 = (char *)this + 16;
          if (v16)
          {
            v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v16);
            v12 = *(_QWORD **)this;
            v10 = (_QWORD *)*((_QWORD *)this + 1);
          }
          else
          {
            v17 = 0;
          }
          v18 = (_QWORD *)(v16 + 8 * v13);
          v19 = v16 + 8 * v17;
          *(_QWORD *)&v30[16] = v19;
          *v18 = v25;
          v20 = v18 + 1;
          v25 = 0;
          *(_QWORD *)&v30[8] = v18 + 1;
          if (v10 == v12)
          {
            v22 = 0;
          }
          else
          {
            do
            {
              v21 = *--v10;
              *--v18 = v21;
              *v10 = 0;
            }
            while (v10 != v12);
            v20 = *(_QWORD **)&v30[8];
            v19 = *(_QWORD *)&v30[16];
            v22 = v25;
          }
          v23 = *(_OWORD *)this;
          *(_QWORD *)this = v18;
          *((_QWORD *)this + 1) = v20;
          *(_OWORD *)v30 = v23;
          v24 = *((_QWORD *)this + 2);
          *((_QWORD *)this + 2) = v19;
          *(_QWORD *)&v30[16] = v24;
          __p = (void *)v23;
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&__p);
          *((_QWORD *)this + 1) = v20;
          if (v22)
            CFRelease(v22);
        }
        else
        {
          *v10 = v25;
          *((_QWORD *)this + 1) = v10 + 1;
        }
        if (cf)
          CFRelease(cf);
      }
      ++v8;
    }
    while (v8 != v5);
  }
  if (v7)
    operator delete(v7);
}

void sub_237BB0F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a10);
  if (v10)
    operator delete(v10);
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::ConvertDataToTypeRef<std::string>(CFStringRef *a1, uint64_t a2)
{
  std::string *p_p;
  CFIndex size;
  CFStringRef v5;
  void *exception;
  std::string __p;

  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v5 = CFStringCreateWithBytes(0, (const UInt8 *)p_p, size, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_237BB1044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(_QWORD *a1, const UInt8 *a2, const void **a3)
{
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  CFStringRef *v17;
  CFStringRef *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = a1 + 2;
  v7 = a1[2];
  v8 = a1[1];
  if (v8 >= v7)
  {
    v11 = (uint64_t)(v8 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v20 = v6;
    if (v14)
      v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v14);
    else
      v15 = 0;
    v16 = v14;
    v17 = (CFStringRef *)(v14 + 16 * v11);
    v19 = v14 + 16 * v15;
    applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>(v17, a2, a3);
    v18 = v17 + 2;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, &v16);
    v10 = a1[1];
    result = std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v16);
  }
  else
  {
    result = (uint64_t)applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>((CFStringRef *)a1[1], a2, a3);
    v10 = v8 + 16;
    a1[1] = v8 + 16;
  }
  a1[1] = v10;
  return result;
}

void sub_237BB1170(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *this, uint64_t a2)
{
  int v3;
  char *v4;
  unint64_t v5;
  std::string *v7;
  uint64_t i;
  void **v9;
  std::string::size_type v10;
  void *__p[2];
  unsigned __int8 v13;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *(char *)(a2 + 23);
  if (v3 >= 0)
    v4 = (char *)a2;
  else
    v4 = *(char **)a2;
  if (v3 >= 0)
    v5 = *(unsigned __int8 *)(a2 + 23);
  else
    v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    if (v4 >= (char *)this && (char *)&this->__r_.__value_.__l.__data_ + 1 > v4)
    {
      std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, &v4[v5], v5);
      if ((v13 & 0x80u) == 0)
        v9 = __p;
      else
        v9 = (void **)__p[0];
      if ((v13 & 0x80u) == 0)
        v10 = v13;
      else
        v10 = (std::string::size_type)__p[1];
      std::string::append(this, (const std::string::value_type *)v9, v10);
      if ((char)v13 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v7 = this;
      if (v5 >= 0x17)
      {
        std::string::__grow_by(this, 0x16uLL, v5 - 22, 0, 0, 0, 0);
        this->__r_.__value_.__l.__size_ = 0;
        v7 = this;
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
          v7 = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      for (i = 0; i != v5; ++i)
        v7->__r_.__value_.__s.__data_[i] = v4[i];
      v7->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = v5;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = v5 & 0x7F;
    }
  }
  return this;
}

void sub_237BB1334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::string_from_4cc(caulk *this)
{
  char v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  strcpy(v2, "'nope'");
  return std::string::basic_string[abi:ne180100]<0>(this, v2);
}

void sub_237BB13CC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = result;
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v7[1] = a4;
    v7[2] = v9 | 0x8000000000000000;
    *v7 = result;
    v7 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v7 = v10;
    v7 = (_QWORD *)((char *)v7 + 1);
  }
  *(_BYTE *)v7 = 0;
  return result;
}

CFStringRef *applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>(CFStringRef *a1, const UInt8 *a2, const void **a3)
{
  CFIndex v5;
  CFIndex v6;
  CFStringRef v7;
  const __CFString *v8;
  void *exception;

  v5 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v6 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    v6 = v5;
  }
  v7 = CFStringCreateWithBytes(0, a2, v6, 0x8000100u, 0);
  *a1 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v8 = (const __CFString *)*a3;
  if (v8)
    CFRetain(v8);
  a1[1] = v8;
  return a1;
}

void sub_237BB1520(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<applesauce::CF::NumberRef>::reserve(_QWORD *result, unint64_t a2)
{
  char **v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int64x2_t v10;
  char *v11;
  uint64_t v12;
  int64x2_t v13;
  char *v14;
  _QWORD *v15;

  if (a2 > (uint64_t)(result[2] - *result) >> 3)
  {
    if (a2 >> 61)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v2 = (char **)result;
    v3 = result[1] - *result;
    v15 = result + 2;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    v7 = *v2;
    v6 = v2[1];
    if (v6 == *v2)
    {
      v10 = vdupq_n_s64((unint64_t)v6);
      v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v9 = *((_QWORD *)v6 - 1);
        v6 -= 8;
        *((_QWORD *)v8 - 1) = v9;
        v8 -= 8;
        *(_QWORD *)v6 = 0;
      }
      while (v6 != v7);
      v10 = *(int64x2_t *)v2;
    }
    *v2 = v8;
    v2[1] = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    v13 = v10;
    v11 = v2[2];
    v2[2] = &v4[8 * v5];
    v14 = v11;
    v12 = v10.i64[0];
    return (_QWORD *)std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v12);
  }
  return result;
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  CFArrayRef CFArray;
  void *__p;
  void *v9;

  std::vector<void const*>::vector(&__p, a1[1] - *a1);
  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v4 = __p;
    do
    {
      v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)__p, (uint64_t)v9);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  return CFArray;
}

void sub_237BB1684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFNumberRef *std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,unsigned int,applesauce::CF::NumberRef*>(CFNumberRef *a1, int a2)
{
  CFNumberRef v3;
  void *exception;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a1 = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BB1720(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  const void *v6;

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
        v6 = (const void *)*((_QWORD *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(const void *a1)
{
  if (a1)
    CFRelease(a1);
}

uint64_t std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  const void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(const void **)(i - 8);
    *(_QWORD *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(_QWORD *a1, CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  *a1 = cf;
  return a1;
}

void `anonymous namespace'::GetStreamInfo(_anonymous_namespace_ *this, ca::hal::detail::HALPropertyPolicy *a2)
{
  const AudioStreamRangedDescription *v2;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  BOOL v8;
  int mElement_low;
  const AudioStreamRangedDescription *i;
  Float64 mSampleRate;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  int v25;
  const AudioStreamRangedDescription *v26;
  const AudioStreamRangedDescription *j;
  Float64 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int64x2_t v40;
  char *v41;
  CFArrayRef v42;
  _OWORD *v43;
  const void *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  CFNumberRef v49;
  _OWORD *v50;
  const void *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  CFNumberRef v56;
  _OWORD *v57;
  const void *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  CFNumberRef v63;
  _OWORD *v64;
  const void *v65;
  const void *v66;
  _OWORD *v67;
  _QWORD *v68;
  _OWORD *v69;
  CFDictionaryRef CFDictionaryRef;
  _OWORD *v71;
  const void *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  CFDictionaryRef v76;
  std::logic_error *v77;
  void *exception;
  void *v79;
  void *v80;
  BOOL v81;
  _anonymous_namespace_ *v82;
  int v83;
  UInt32 ioDataSize[2];
  AudioStreamBasicDescription cf;
  _BYTE __p[24];
  int64x2_t v87;
  char *v88;
  uint64_t *v89;
  _QWORD *v90;
  unint64_t v91;
  AudioObjectPropertyAddress inAddress;
  AudioObjectPropertyAddress valuePtr[4];
  __int128 v94;
  unint64_t v95[3];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  LODWORD(cf.mSampleRate) = (_DWORD)a2;
  strcpy((char *)valuePtr, "spatbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  v5 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&cf, valuePtr);
  *((_QWORD *)&v7 + 1) = v6;
  *(_QWORD *)&v7 = v5;
  v8 = ((v7 >> 32) & 0xFF00000000) == 0 || HIDWORD(v5) == 0;
  if (!v8)
  {
    *(_QWORD *)this = 0;
    return;
  }
  v82 = this;
  v90 = 0;
  v91 = 0;
  v88 = 0;
  v89 = (uint64_t *)&v90;
  v87 = 0uLL;
  LODWORD(v94) = (_DWORD)a2;
  cf.mSampleRate = 1.58366012e190;
  cf.mFormatID = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get((uint64_t)valuePtr, (AudioObjectID *)&v94, (AudioObjectPropertyAddress *)&cf);
  __p[0] = 0;
  mElement_low = LOBYTE(valuePtr[2].mElement);
  if (LOBYTE(valuePtr[2].mElement))
  {
    v2 = *(const AudioStreamRangedDescription **)&valuePtr[0].mElement;
    *(_QWORD *)__p = *(_QWORD *)&valuePtr[0].mElement;
    *(_OWORD *)&__p[8] = *(_OWORD *)&valuePtr[1].mScope;
    for (i = *(const AudioStreamRangedDescription **)&valuePtr[1].mScope; v2 != i; ++v2)
    {
      mSampleRate = cf.mSampleRate;
      if (*(_QWORD *)&cf.mSampleRate)
      {
        if (v87.i64[1] >= (unint64_t)v88)
        {
          v12 = (v87.i64[1] - v87.i64[0]) >> 3;
          if ((unint64_t)(v12 + 1) >> 61)
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          v13 = (uint64_t)&v88[-v87.i64[0]] >> 2;
          if (v13 <= v12 + 1)
            v13 = v12 + 1;
          if ((unint64_t)&v88[-v87.i64[0]] >= 0x7FFFFFFFFFFFFFF8)
            v14 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v14 = v13;
          *(_QWORD *)&valuePtr[2].mElement = &v88;
          if (v14)
          {
            v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v14);
          }
          else
          {
            v16 = 0;
            v15 = 0;
          }
          v17 = (char *)&v16[v15];
          *(_QWORD *)&valuePtr[2].mSelector = v17;
          v18 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(&v16[v12], *(CFTypeRef *)&mSampleRate);
          v19 = v18 + 1;
          *(_QWORD *)&valuePtr[1].mScope = v18 + 1;
          v20 = (_QWORD *)v87.i64[1];
          v21 = (_QWORD *)v87.i64[0];
          if (v87.i64[1] == v87.i64[0])
          {
            v23 = vdupq_n_s64(v87.u64[1]);
          }
          else
          {
            do
            {
              v22 = *--v20;
              *--v18 = v22;
              *v20 = 0;
            }
            while (v20 != v21);
            v23 = v87;
            v17 = *(char **)&valuePtr[2].mSelector;
            v19 = *(_QWORD **)&valuePtr[1].mScope;
          }
          v87.i64[0] = (uint64_t)v18;
          v87.i64[1] = (uint64_t)v19;
          *(int64x2_t *)&valuePtr[0].mElement = v23;
          v24 = v88;
          v88 = v17;
          *(_QWORD *)&valuePtr[2].mSelector = v24;
          *(_QWORD *)&valuePtr[0].mSelector = v23.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)valuePtr);
          mSampleRate = cf.mSampleRate;
          v87.i64[1] = (uint64_t)v19;
          if (!*(_QWORD *)&cf.mSampleRate)
            continue;
        }
        else
        {
          v87.i64[1] = (uint64_t)(std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>((_QWORD *)v87.i64[1], *(CFTypeRef *)&cf.mSampleRate)+ 1);
        }
        CFRelease(*(CFTypeRef *)&mSampleRate);
      }
    }
    v83 = 1;
  }
  else
  {
    v83 = 0;
  }
  inAddress.mSelector = a2;
  *(_QWORD *)&v94 = 0x676C6F6270667461;
  DWORD2(v94) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get((uint64_t)valuePtr, &inAddress.mSelector, (AudioObjectPropertyAddress *)&v94);
  LOBYTE(cf.mSampleRate) = 0;
  if (LOBYTE(valuePtr[2].mElement))
  {
    *(_OWORD *)&cf.mSampleRate = *(_OWORD *)&valuePtr[0].mElement;
    v25 = 1;
    v2 = *(const AudioStreamRangedDescription **)&valuePtr[2].mSelector;
  }
  else
  {
    v25 = 0;
  }
  if (v83 != v25)
  {
    if (mElement_low)
    {
      if (*(_QWORD *)__p)
      {
        *(_QWORD *)&__p[8] = *(_QWORD *)__p;
        operator delete(*(void **)__p);
      }
      v83 = 0;
      if (!v25)
        goto LABEL_47;
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&cf.mSampleRate;
      *(_QWORD *)&__p[16] = v2;
      cf.mSampleRate = 0.0;
      *(_QWORD *)&cf.mFormatID = 0;
      v83 = 1;
      if (!v25)
        goto LABEL_47;
    }
LABEL_45:
    if (*(_QWORD *)&cf.mSampleRate)
      operator delete(*(void **)&cf.mSampleRate);
    goto LABEL_47;
  }
  if (!mElement_low)
  {
    v81 = 1;
    goto LABEL_68;
  }
  if (*(_QWORD *)__p)
  {
    *(_QWORD *)&__p[8] = *(_QWORD *)__p;
    operator delete(*(void **)__p);
  }
  *(_OWORD *)__p = *(_OWORD *)&cf.mSampleRate;
  *(_QWORD *)&__p[16] = v2;
  cf.mSampleRate = 0.0;
  *(_QWORD *)&cf.mFormatID = 0;
  if (v25)
    goto LABEL_45;
LABEL_47:
  v81 = v83 == 0;
  if (v83)
  {
    v26 = *(const AudioStreamRangedDescription **)__p;
    for (j = *(const AudioStreamRangedDescription **)&__p[8]; v26 != j; ++v26)
    {
      v28 = cf.mSampleRate;
      if (*(_QWORD *)&cf.mSampleRate)
      {
        if (v87.i64[1] >= (unint64_t)v88)
        {
          v29 = (v87.i64[1] - v87.i64[0]) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          v30 = (uint64_t)&v88[-v87.i64[0]] >> 2;
          if (v30 <= v29 + 1)
            v30 = v29 + 1;
          if ((unint64_t)&v88[-v87.i64[0]] >= 0x7FFFFFFFFFFFFFF8)
            v31 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          *(_QWORD *)&valuePtr[2].mElement = &v88;
          if (v31)
          {
            v33 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v31);
          }
          else
          {
            v33 = 0;
            v32 = 0;
          }
          v34 = (char *)&v33[v32];
          *(_QWORD *)&valuePtr[2].mSelector = v34;
          v35 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(&v33[v29], *(CFTypeRef *)&v28);
          v36 = v35 + 1;
          *(_QWORD *)&valuePtr[1].mScope = v35 + 1;
          v37 = (_QWORD *)v87.i64[1];
          v38 = (_QWORD *)v87.i64[0];
          if (v87.i64[1] == v87.i64[0])
          {
            v40 = vdupq_n_s64(v87.u64[1]);
          }
          else
          {
            do
            {
              v39 = *--v37;
              *--v35 = v39;
              *v37 = 0;
            }
            while (v37 != v38);
            v40 = v87;
            v34 = *(char **)&valuePtr[2].mSelector;
            v36 = *(_QWORD **)&valuePtr[1].mScope;
          }
          v87.i64[0] = (uint64_t)v35;
          v87.i64[1] = (uint64_t)v36;
          *(int64x2_t *)&valuePtr[0].mElement = v40;
          v41 = v88;
          v88 = v34;
          *(_QWORD *)&valuePtr[2].mSelector = v41;
          *(_QWORD *)&valuePtr[0].mSelector = v40.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)valuePtr);
          v28 = cf.mSampleRate;
          v87.i64[1] = (uint64_t)v36;
          if (!*(_QWORD *)&cf.mSampleRate)
            continue;
        }
        else
        {
          v87.i64[1] = (uint64_t)(std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>((_QWORD *)v87.i64[1], *(CFTypeRef *)&cf.mSampleRate)+ 1);
        }
        CFRelease(*(CFTypeRef *)&v28);
      }
    }
  }
LABEL_68:
  v42 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)&v87);
  *(_QWORD *)&cf.mSampleRate = v42;
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "supported formats");
  *(_QWORD *)&v94 = valuePtr;
  v43 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v89, valuePtr, (_OWORD **)&v94);
  v44 = (const void *)*((_QWORD *)v43 + 7);
  *((_QWORD *)v43 + 7) = v42;
  *(_QWORD *)&cf.mSampleRate = v44;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v44)
      goto LABEL_73;
    goto LABEL_72;
  }
  if (v44)
LABEL_72:
    CFRelease(v44);
LABEL_73:
  LODWORD(v94) = (_DWORD)a2;
  strcpy((char *)valuePtr, "ridsbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  v45 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v94, valuePtr);
  *((_QWORD *)&v48 + 1) = v46;
  *(_QWORD *)&v48 = v45;
  v47 = v48 >> 32;
  if ((v47 & 0xFF00000000) == 0)
    LODWORD(v47) = 0;
  valuePtr[0].mSelector = v47;
  v49 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(_QWORD *)&cf.mSampleRate = v49;
  if (!v49)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "is input");
  *(_QWORD *)&v94 = valuePtr;
  v50 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v89, valuePtr, (_OWORD **)&v94);
  v51 = (const void *)*((_QWORD *)v50 + 7);
  *((_QWORD *)v50 + 7) = v49;
  *(_QWORD *)&cf.mSampleRate = v51;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v51)
      goto LABEL_81;
    goto LABEL_80;
  }
  if (v51)
LABEL_80:
    CFRelease(v51);
LABEL_81:
  LODWORD(v94) = (_DWORD)a2;
  strcpy((char *)valuePtr, "cntlbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  v52 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v94, valuePtr);
  *((_QWORD *)&v55 + 1) = v53;
  *(_QWORD *)&v55 = v52;
  v54 = v55 >> 32;
  if ((v54 & 0xFF00000000) == 0)
    LODWORD(v54) = 0;
  valuePtr[0].mSelector = v54;
  v56 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(_QWORD *)&cf.mSampleRate = v56;
  if (!v56)
  {
    v79 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v79, "Could not construct");
    __cxa_throw(v79, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "latency");
  *(_QWORD *)&v94 = valuePtr;
  v57 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v89, valuePtr, (_OWORD **)&v94);
  v58 = (const void *)*((_QWORD *)v57 + 7);
  *((_QWORD *)v57 + 7) = v56;
  *(_QWORD *)&cf.mSampleRate = v58;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v58)
      goto LABEL_89;
    goto LABEL_88;
  }
  if (v58)
LABEL_88:
    CFRelease(v58);
LABEL_89:
  LODWORD(v94) = (_DWORD)a2;
  strcpy((char *)valuePtr, "mretbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  v59 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v94, valuePtr);
  *((_QWORD *)&v62 + 1) = v60;
  *(_QWORD *)&v62 = v59;
  v61 = v62 >> 32;
  if ((v61 & 0xFF00000000) == 0)
    LODWORD(v61) = 0;
  valuePtr[0].mSelector = v61;
  v63 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(_QWORD *)&cf.mSampleRate = v63;
  if (!v63)
  {
    v80 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v80, "Could not construct");
    __cxa_throw(v80, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "terminal type");
  *(_QWORD *)&v94 = valuePtr;
  v64 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v89, valuePtr, (_OWORD **)&v94);
  v65 = (const void *)*((_QWORD *)v64 + 7);
  *((_QWORD *)v64 + 7) = v63;
  *(_QWORD *)&cf.mSampleRate = v65;
  if ((SHIBYTE(valuePtr[1].mElement) & 0x80000000) == 0)
  {
    if (!v65)
      goto LABEL_97;
    goto LABEL_96;
  }
  operator delete(*(void **)&valuePtr[0].mSelector);
  if (v65)
LABEL_96:
    CFRelease(v65);
LABEL_97:
  *(_QWORD *)&inAddress.mSelector = 0x676C6F6273666D74;
  inAddress.mElement = 0;
  if (!AudioObjectHasProperty((AudioObjectID)a2, &inAddress)
    || (ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize(a2, &inAddress, 0, 0, v66)) == 0
    || (memset(valuePtr, 0, 40), AudioObjectGetPropertyData((AudioObjectID)a2, &inAddress, 0, 0, ioDataSize, valuePtr)))
  {
    v77 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v77, "error getting property");
    __cxa_throw(v77, MEMORY[0x24BEDB720], MEMORY[0x24BEDAAC0]);
  }
  v94 = *(_OWORD *)((char *)&valuePtr[0].mSelector + 1);
  *(_OWORD *)v95 = *(_OWORD *)((char *)&valuePtr[1].mScope + 1);
  *(unint64_t *)((char *)&v95[1] + 7) = *(_QWORD *)&valuePtr[2].mElement;
  LOBYTE(cf.mSampleRate) = valuePtr[0].mSelector;
  *(_OWORD *)((char *)&cf.mSampleRate + 1) = *(_OWORD *)((char *)&valuePtr[0].mSelector + 1);
  *(_OWORD *)((char *)&cf.mBytesPerPacket + 1) = *(_OWORD *)v95;
  *(_QWORD *)&cf.mBitsPerChannel = *(_QWORD *)&valuePtr[2].mElement;
  memset(valuePtr, 0, 24);
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, v95[0]);
  v67 = (_OWORD *)v94;
  if ((__int128 *)v94 != (__int128 *)((char *)&v94 + 8))
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v67 + 32, (const void **)v67 + 7);
      v68 = (_QWORD *)*((_QWORD *)v67 + 1);
      if (v68)
      {
        do
        {
          v69 = v68;
          v68 = (_QWORD *)*v68;
        }
        while (v68);
      }
      else
      {
        do
        {
          v69 = (_OWORD *)*((_QWORD *)v67 + 2);
          v8 = *(_QWORD *)v69 == (_QWORD)v67;
          v67 = v69;
        }
        while (!v8);
      }
      v67 = v69;
    }
    while (v69 != (__int128 *)((char *)&v94 + 8));
  }
  CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((void ***)valuePtr);
  *(_QWORD *)&inAddress.mSelector = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&inAddress);
  CFRetain(CFDictionaryRef);
  *(_QWORD *)ioDataSize = CFDictionaryRef;
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "basic description");
  *(_QWORD *)&inAddress.mSelector = valuePtr;
  v71 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v89, valuePtr, &inAddress);
  v72 = (const void *)*((_QWORD *)v71 + 7);
  *((_QWORD *)v71 + 7) = CFDictionaryRef;
  *(_QWORD *)ioDataSize = v72;
  if ((SHIBYTE(valuePtr[1].mElement) & 0x80000000) == 0)
  {
    if (!v72)
      goto LABEL_112;
    goto LABEL_111;
  }
  operator delete(*(void **)&valuePtr[0].mSelector);
  if (v72)
LABEL_111:
    CFRelease(v72);
LABEL_112:
  CFRelease(CFDictionaryRef);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(*((_QWORD **)&v94 + 1));
  memset(valuePtr, 0, 24);
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, v91);
  v73 = v89;
  if (v89 != (uint64_t *)&v90)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v73 + 32, (const void **)v73 + 7);
      v74 = (uint64_t *)v73[1];
      if (v74)
      {
        do
        {
          v75 = v74;
          v74 = (uint64_t *)*v74;
        }
        while (v74);
      }
      else
      {
        do
        {
          v75 = (uint64_t *)v73[2];
          v8 = *v75 == (_QWORD)v73;
          v73 = v75;
        }
        while (!v8);
      }
      v73 = v75;
    }
    while (v75 != (uint64_t *)&v90);
  }
  v76 = applesauce::CF::details::make_CFDictionaryRef((void ***)valuePtr);
  *(_QWORD *)&v94 = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v94);
  *(_QWORD *)v82 = v76;
  if (!v81)
  {
    if (*(_QWORD *)__p)
      operator delete(*(void **)__p);
  }
  *(_QWORD *)&valuePtr[0].mSelector = &v87;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)valuePtr);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v90);
}

void sub_237BB22A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, char a14, int a15, __int16 a16, char a17, char a18, char *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,_QWORD *a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a13)
  {
    if (__p)
      operator delete(__p);
  }
  a19 = &a29;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(a33);
  _Unwind_Resume(a1);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  const void *v6;
  UInt32 PropertyDataSize;
  char *v8;
  void *v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  OSStatus PropertyData;
  OSStatus v14;
  __int128 v15;
  int64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UInt32 ioDataSize;
  int v24;
  void *__p[2];
  uint64_t v26;
  char v27;

  if (!AudioObjectHasProperty(*a2, inAddress))
  {
    *(_DWORD *)a1 = 2003332927;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 0;
    return;
  }
  v24 = 2003329396;
  LOBYTE(__p[0]) = 0;
  v27 = 0;
  PropertyDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
  ioDataSize = PropertyDataSize;
  if (!PropertyDataSize)
  {
    *(_DWORD *)a1 = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 1;
    return;
  }
  v8 = 0;
  v9 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  if (PropertyDataSize >= 0x38)
  {
    v10 = PropertyDataSize / 0x38uLL;
    std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](&v20, v10);
    v11 = (char *)v21;
    v12 = 56 * ((56 * (unint64_t)v10 - 56) / 0x38) + 56;
    bzero(v21, v12);
    v8 = &v11[v12];
    v21 = v8;
    v9 = v20;
  }
  PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, v9);
  v14 = PropertyData;
  v24 = PropertyData;
  if (PropertyData)
  {
    *(_DWORD *)a1 = PropertyData;
    *(_BYTE *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 32) = 0;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v26 = 0;
    v15 = 0uLL;
    *(_OWORD *)__p = 0u;
    v16 = v8 - (_BYTE *)v9;
    if (v16)
    {
      std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](__p, 0x6DB6DB6DB6DB6DB7 * (v16 >> 3));
      v17 = (char *)__p[1];
      memmove(__p[1], v9, v16);
      __p[1] = &v17[8 * (v16 >> 3)];
      v18 = v24;
      v15 = *(_OWORD *)__p;
      v19 = v26;
    }
    else
    {
      v19 = 0;
      v18 = 0;
    }
    *(_DWORD *)a1 = v18;
    *(_OWORD *)(a1 + 8) = v15;
    *(_QWORD *)(a1 + 24) = v19;
    __p[1] = 0;
    v26 = 0;
    __p[0] = 0;
    *(_BYTE *)(a1 + 32) = 1;
    if (!v9)
      goto LABEL_8;
  }
  operator delete(v9);
LABEL_8:
  if (!v14)
  {
    if (__p[0])
      operator delete(__p[0]);
  }
}

void sub_237BB2640(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p)
    operator delete(__p);
  __clang_call_terminate(a1);
}

void `anonymous namespace'::GetASRDInfo(_anonymous_namespace_ *this, const AudioStreamRangedDescription *a2)
{
  __int128 v3;
  uint64_t v4;
  BOOL v5;
  CFNumberRef v8;
  _OWORD *v9;
  const void *v10;
  CFNumberRef v11;
  _OWORD *v12;
  const void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  CFDictionaryRef CFDictionaryRef;
  std::logic_error *exception;
  void *v19;
  void *v20;
  void **valuePtr[2];
  uint64_t v22;
  _OWORD *v23[3];
  AudioStreamBasicDescription v24;
  uint64_t *v25;
  _QWORD *v26[5];

  v26[4] = *(_QWORD **)MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)&a2->mFormat.mBytesPerPacket;
  *(_OWORD *)&v24.mSampleRate = *(_OWORD *)&a2->mFormat.mSampleRate;
  *(_OWORD *)&v24.mBytesPerPacket = v3;
  v4 = *(_QWORD *)&a2->mFormat.mBitsPerChannel;
  *(_QWORD *)&v24.mBitsPerChannel = v4;
  v5 = DWORD2(v3) * DWORD1(v3) != (_DWORD)v3 && v24.mFormatID == 1819304813;
  if (v5)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because (asbd.mBytesPerFrame * asbd.mFramesPerPacket == asbd.mBytesPerPacket) and asbd.mFormatID == kAudioFormatLinearPCM returned false.");
    goto LABEL_38;
  }
  if (v24.mSampleRate < 0.0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because sample rate was less than 0");
    goto LABEL_38;
  }
  if ((v24.mFormatFlags & 1) == 0 && v4 >= 0x19)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because !(asbd.mFormatFlags & kAudioFormatFlagIsFloat) && (asbd.mBitsPerChannel > 24).");
    goto LABEL_38;
  }
  if (DWORD2(v3) < (v4 * v24.mChannelsPerFrame) >> 3 && v24.mFormatID == 1819304813)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because not (asbd.mBitsPerChannel * asbd.mChannelsPerFrame / 8 == asbd.mBytesPerFrame) and asbd.mFormatID == kAudioFormatLinearPCM.");
LABEL_38:
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
    __cxa_throw(exception, (struct type_info *)off_2509A21A0, MEMORY[0x24BEDAB88]);
  }
  if (a2->mSampleRateRange.mMinimum != 0.0 || a2->mSampleRateRange.mMaximum != 0.0)
  {
    valuePtr[0] = *(void ***)&a2->mSampleRateRange.mMinimum;
    v8 = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
    if (!v8)
    {
      v19 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B820E38](v19, "Could not construct");
      __cxa_throw(v19, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    std::string::basic_string[abi:ne180100]<0>(valuePtr, "min sample rate");
    v23[0] = valuePtr;
    v9 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v25, valuePtr, v23);
    v10 = (const void *)*((_QWORD *)v9 + 7);
    *((_QWORD *)v9 + 7) = v8;
    if (SHIBYTE(v22) < 0)
    {
      operator delete(valuePtr[0]);
      if (!v10)
        goto LABEL_20;
    }
    else if (!v10)
    {
LABEL_20:
      valuePtr[0] = *(void ***)&a2->mSampleRateRange.mMaximum;
      v11 = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
      if (!v11)
      {
        v20 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B820E38](v20, "Could not construct");
        __cxa_throw(v20, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      std::string::basic_string[abi:ne180100]<0>(valuePtr, "max sample rate");
      v23[0] = valuePtr;
      v12 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v25, valuePtr, v23);
      v13 = (const void *)*((_QWORD *)v12 + 7);
      *((_QWORD *)v12 + 7) = v11;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(valuePtr[0]);
        if (!v13)
          goto LABEL_26;
      }
      else if (!v13)
      {
        goto LABEL_26;
      }
      CFRelease(v13);
      goto LABEL_26;
    }
    CFRelease(v10);
    goto LABEL_20;
  }
LABEL_26:
  valuePtr[0] = 0;
  valuePtr[1] = 0;
  v22 = 0;
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, (unint64_t)v26[1]);
  v14 = v25;
  if (v25 != (uint64_t *)v26)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v14 + 32, (const void **)v14 + 7);
      v15 = (uint64_t *)v14[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (uint64_t *)v14[2];
          v5 = *v16 == (_QWORD)v14;
          v14 = v16;
        }
        while (!v5);
      }
      v14 = v16;
    }
    while (v16 != (uint64_t *)v26);
  }
  CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef(valuePtr);
  v23[0] = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
  *(_QWORD *)this = CFDictionaryRef;
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v26[0]);
}

void sub_237BB29F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, __int128 __p, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,__int128 a24,__int128 a25,uint64_t a26)
{
  uint64_t v26;

  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(*(_QWORD **)(v26 - 88));
  _Unwind_Resume(a1);
}

void `anonymous namespace'::GetASBDInfoRaw(_anonymous_namespace_ *this, const AudioStreamBasicDescription *a2)
{
  CFNumberRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  const std::string::value_type **v14;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  BOOL v18;
  uint64_t **v19;
  uint64_t *v20;
  std::string *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t i;
  _QWORD *v25;
  const void *v26;
  void *exception;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CFNumberRef cf;
  _QWORD valuePtr[2];
  char v37;
  _QWORD *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  uint64_t v46[3];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  valuePtr[0] = *(_QWORD *)&a2->mSampleRate;
  cf = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v39, "sample rate");
  v39[3] = cf;
  LODWORD(valuePtr[0]) = a2->mFormatID;
  v4 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v4)
  {
    v28 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v28, "Could not construct");
    __cxa_throw(v28, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v40, "format id");
  v40[3] = v4;
  LODWORD(valuePtr[0]) = a2->mFormatFlags;
  v5 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v5)
  {
    v29 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v29, "Could not construct");
    __cxa_throw(v29, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v41, "format flags");
  v41[3] = v5;
  LODWORD(valuePtr[0]) = a2->mBytesPerFrame;
  v6 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v6)
  {
    v30 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v30, "Could not construct");
    __cxa_throw(v30, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v42, "bytes per frame");
  v42[3] = v6;
  LODWORD(valuePtr[0]) = a2->mFramesPerPacket;
  v7 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v7)
  {
    v31 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v31, "Could not construct");
    __cxa_throw(v31, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v43, "frames per packet");
  v43[3] = v7;
  LODWORD(valuePtr[0]) = a2->mChannelsPerFrame;
  v8 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v8)
  {
    v32 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v32, "Could not construct");
    __cxa_throw(v32, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v44, "channels per frame");
  v44[3] = v8;
  LODWORD(valuePtr[0]) = a2->mBitsPerChannel;
  v9 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v9)
  {
    v33 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v33, "Could not construct");
    __cxa_throw(v33, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v45, "bits per channel");
  v45[3] = v9;
  LODWORD(valuePtr[0]) = a2->mBytesPerPacket;
  v10 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v10)
  {
    v34 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](v34, "Could not construct");
    __cxa_throw(v34, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  std::string::basic_string[abi:ne180100]<0>(v46, "bytes per packet");
  v11 = 0;
  v12 = 0;
  v47[0] = v10;
  *((_QWORD *)this + 1) = 0;
  v13 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  while (1)
  {
    v14 = (const std::string::value_type **)&v39[4 * v12];
    v15 = (_QWORD *)((char *)this + 8);
    if (*(_QWORD **)this != v13)
    {
      v16 = v11;
      v17 = (char *)this + 8;
      if (v11)
      {
        do
        {
          v15 = v16;
          v16 = (_QWORD *)v16[1];
        }
        while (v16);
      }
      else
      {
        do
        {
          v15 = (_QWORD *)*((_QWORD *)v17 + 2);
          v18 = *v15 == (_QWORD)v17;
          v17 = (char *)v15;
        }
        while (v18);
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v15 + 4, &v39[4 * v12]) & 0x80) == 0)
      {
        v19 = (uint64_t **)std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>((uint64_t)this, &v38, &v39[4 * v12]);
        goto LABEL_19;
      }
    }
    if (v11)
    {
      v38 = v15;
      v19 = (uint64_t **)(v15 + 1);
LABEL_19:
      if (*v19)
        goto LABEL_28;
      goto LABEL_22;
    }
    v38 = (_QWORD *)((char *)this + 8);
    v19 = (uint64_t **)((char *)this + 8);
LABEL_22:
    v20 = (uint64_t *)operator new(0x40uLL);
    valuePtr[0] = v20;
    valuePtr[1] = (char *)this + 8;
    v37 = 0;
    v21 = (std::string *)(v20 + 4);
    if (*((char *)v14 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v21, *v14, (std::string::size_type)v14[1]);
    }
    else
    {
      *(_OWORD *)&v21->__r_.__value_.__l.__data_ = *(_OWORD *)v14;
      v20[6] = (uint64_t)v14[2];
    }
    v22 = &v39[4 * v12];
    v23 = v22[3];
    if (v23)
      CFRetain((CFTypeRef)v22[3]);
    v20[7] = v23;
    v37 = 1;
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at((uint64_t **)this, (uint64_t)v38, v19, v20);
    valuePtr[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)valuePtr);
LABEL_28:
    if (++v12 == 8)
      break;
    v11 = (_QWORD *)*v13;
  }
  for (i = 0; i != -32; i -= 4)
  {
    v25 = &v39[i];
    v26 = (const void *)v47[i];
    if (v26)
      CFRelease(v26);
    if (*((char *)v25 + 247) < 0)
      operator delete((void *)v25[28]);
  }
}

void sub_237BB3164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, const void *a12, const void *a13, const void *a14, const void *a15, const void *a16, const void *a17, CFTypeRef cf, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  char *v23;

  applesauce::CF::TypeRef::~TypeRef(&a12);
  applesauce::CF::TypeRef::~TypeRef(&a13);
  applesauce::CF::TypeRef::~TypeRef(&a14);
  applesauce::CF::TypeRef::~TypeRef(&a15);
  applesauce::CF::TypeRef::~TypeRef(&a16);
  applesauce::CF::TypeRef::~TypeRef(&a17);
  applesauce::CF::TypeRef::~TypeRef(&cf);
  while (v23 != &a23)
  {
    v23 -= 32;
    std::pair<std::string const,applesauce::CF::TypeRef>::~pair((uint64_t)v23);
  }
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t **std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v4 = (uint64_t *)**result;
  if (v4)
  {
    *result = v4;
    a4 = *a3;
  }
  v5 = result[1];
  *((_BYTE *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      v6 = (uint64_t *)a4[2];
      if (*((_BYTE *)v6 + 24))
        break;
      v7 = (uint64_t *)v6[2];
      v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), v9 = (_BYTE *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            v13 = (uint64_t **)a4[2];
          }
          else
          {
            v13 = (uint64_t **)v6[1];
            v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = v13;
            *v13 = v6;
            v6[2] = (uint64_t)v13;
            v7 = v13[2];
            v6 = (uint64_t *)*v7;
          }
          *((_BYTE *)v13 + 24) = 1;
          *((_BYTE *)v7 + 24) = 0;
          v17 = v6[1];
          *v7 = v17;
          if (v17)
            *(_QWORD *)(v17 + 16) = v7;
          v6[2] = v7[2];
          *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          v15 = a4[1];
          *v6 = v15;
          if (v15)
          {
            *(_QWORD *)(v15 + 16) = v6;
            v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((_BYTE *)a4 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v6 = (uint64_t *)v7[1];
        v16 = *v6;
        v7[1] = *v6;
        if (v16)
          *(_QWORD *)(v16 + 16) = v7;
        v6[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
        *v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((_BYTE *)v6 + 24) = 1;
      a4 = v7;
      *((_BYTE *)v7 + 24) = v7 == v5;
      *v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (_QWORD *)*a1;
    v3 = v2;
  }
  v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (_QWORD *)*a2;
    v5 = v4;
  }
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (v3 == v5)
      return 0;
    if (v3 >= v5)
      return 1;
  }
  return 255;
}

_QWORD *std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
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

void CA::StreamDescription::AsString(CA::StreamDescription *this, _QWORD *a2, double a3, int16x8_t a4)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  BOOL v15;
  int32x4_t v16;
  uint32x4_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  const char *v22;
  unsigned int v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  std::string *v28;
  std::string::size_type v29;
  std::string *v30;
  std::string::size_type size;
  std::string *v32;
  __int128 v33;
  void *v34;
  int v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  unsigned int v41;
  unsigned int v42;
  const char *v43;
  unsigned int v44;
  int v45;
  const char *v46;
  std::string *v48;
  std::string::size_type v49;
  std::string *v50;
  __int128 v51;
  _BOOL4 v52;
  const char *v53;
  std::string v54;
  std::string v55;
  char __str[20];
  std::string v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = *((_DWORD *)a2 + 2);
  if (v6 == 1718773105)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, 'freq'", (uint64_t)this, *((unsigned int *)a2 + 7), *a2);
    return;
  }
  if (v6 != 1819304813)
    goto LABEL_19;
  if (*((_DWORD *)a2 + 5) != 1)
    goto LABEL_19;
  v7 = *((_DWORD *)a2 + 6);
  if (v7 != *((_DWORD *)a2 + 4))
    goto LABEL_19;
  v8 = *((_DWORD *)a2 + 8);
  if (v7 < v8 >> 3)
    goto LABEL_19;
  v9 = *((unsigned int *)a2 + 7);
  if (!(_DWORD)v9)
    goto LABEL_19;
  v10 = *((_DWORD *)a2 + 3);
  if ((v10 & 0x20) == 0)
  {
    v15 = v7 == v7 / v9 * (_DWORD)v9;
    v7 /= v9;
    if (!v15)
      goto LABEL_19;
  }
  if ((v10 & 2) != 0 || 8 * v7 != v8)
    goto LABEL_19;
  if ((v10 & 1) != 0)
  {
    if ((v10 & 0x1F84) == 0)
    {
      if (v7 == 4)
      {
        v12 = 1;
        goto LABEL_163;
      }
      v15 = v7 == 8;
      v52 = v7 == 8;
      if (v15)
      {
        v12 = 4 * v52;
        goto LABEL_163;
      }
    }
LABEL_19:
    v13 = *((unsigned int *)a2 + 7);
    v14 = *(double *)a2;
    if ((_DWORD)v13)
      v15 = 0;
    else
      v15 = v6 == 0;
    if (v15 && v14 == 0.0)
    {
      caulk::make_string((caulk *)"%2u ch, %6.0f Hz", (uint64_t)this, 0, *a2);
      return;
    }
    a4.i32[0] = bswap32(v6);
    *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)&v14);
    v16.i64[0] = 0x1F0000001FLL;
    v16.i64[1] = 0x1F0000001FLL;
    v17.i64[0] = 0x5F0000005FLL;
    v17.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v17, (uint32x4_t)vsraq_n_s32(v16, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
    *((_BYTE *)&v57.__r_.__value_.__s + 23) = 4;
    LODWORD(v57.__r_.__value_.__l.__data_) = vmovn_s16(a4).u32[0];
    v57.__r_.__value_.__s.__data_[4] = 0;
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s (0x%08X) ", (uint64_t)&v55, v13, *(_QWORD *)&v14, &v57, *((unsigned int *)a2 + 3));
    if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v57.__r_.__value_.__l.__data_);
    v18 = *((_DWORD *)a2 + 2);
    if (v18 <= 1819304812)
    {
      if (v18 != 1634492771 && v18 != 1634497332 && v18 != 1718378851)
      {
LABEL_70:
        caulk::make_string((caulk *)"%u bits/channel, %u bytes/packet, %u frames/packet, %u bytes/frame", (uint64_t)&v57, *((unsigned int *)a2 + 8), *((unsigned int *)a2 + 4), *((unsigned int *)a2 + 5), *((unsigned int *)a2 + 6));
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v30 = &v55;
        else
          v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
        else
          size = v55.__r_.__value_.__l.__size_;
LABEL_62:
        v32 = std::string::insert(&v57, 0, (const std::string::value_type *)v30, size);
        v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        *((_QWORD *)this + 2) = *((_QWORD *)&v32->__r_.__value_.__l + 2);
        *(_OWORD *)this = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        if ((SHIBYTE(v57.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_65;
        v34 = (void *)v57.__r_.__value_.__r.__words[0];
LABEL_64:
        operator delete(v34);
LABEL_65:
        if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v55.__r_.__value_.__l.__data_);
        return;
      }
LABEL_45:
      v27 = *((unsigned int *)a2 + 3);
      if ((v27 - 1) < 4 || !(_DWORD)v27 && (v18 == 1634497332 || v18 == 1936487278 || v18 == 1936487267))
      {
        caulk::make_string((caulk *)"from %u-bit source, ", (uint64_t)&v57, CA::StreamDescription::AsString(void)const::kSourceBits[v27]);
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v28 = &v57;
        else
          v28 = (std::string *)v57.__r_.__value_.__r.__words[0];
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v29 = HIBYTE(v57.__r_.__value_.__r.__words[2]);
        else
          v29 = v57.__r_.__value_.__l.__size_;
        std::string::append(&v55, (const std::string::value_type *)v28, v29);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v57.__r_.__value_.__l.__data_);
      }
      else
      {
        std::string::append(&v55, "from UNKNOWN source bit depth, ", 0x1FuLL);
      }
      caulk::make_string((caulk *)"%u frames/packet", (uint64_t)&v57, *((unsigned int *)a2 + 5));
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v30 = &v55;
      else
        v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      else
        size = v55.__r_.__value_.__l.__size_;
      goto LABEL_62;
    }
    if (v18 == 1936487278 || v18 == 1936487267)
      goto LABEL_45;
    if (v18 != 1819304813)
      goto LABEL_70;
    v19 = *((_DWORD *)a2 + 3);
    v20 = *((_DWORD *)a2 + 6);
    v21 = v19 & 0x20;
    v22 = "";
    if (!v20)
      goto LABEL_37;
    if ((v19 & 0x20) != 0)
    {
      v23 = 1;
    }
    else
    {
      v23 = *((_DWORD *)a2 + 7);
      if (!v23)
      {
        v21 = 0;
LABEL_37:
        v24 = " signed";
        if ((v19 & 4) == 0)
          v24 = " unsigned";
        if ((v19 & 1) != 0)
          v25 = "float";
        else
          v25 = "integer";
        if ((v19 & 1) != 0)
          v26 = "";
        else
          v26 = v24;
LABEL_102:
        v57.__r_.__value_.__s.__data_[0] = 0;
        if (v21)
          v39 = ", deinterleaved";
        else
          v39 = "";
        v36 = "";
        v40 = "";
        goto LABEL_106;
      }
    }
    v35 = v20 / v23;
    if (v20 / v23 < 2)
    {
      v38 = " signed";
      if ((v19 & 4) == 0)
        v38 = " unsigned";
      if ((v19 & 1) != 0)
        v25 = "float";
      else
        v25 = "integer";
      if ((v19 & 1) != 0)
        v26 = "";
      else
        v26 = v38;
      if (v23 > v20)
        goto LABEL_102;
      v35 = 1;
      v36 = "";
    }
    else
    {
      if ((v19 & 2) != 0)
        v36 = " big-endian";
      else
        v36 = " little-endian";
      v37 = " unsigned";
      if ((v19 & 4) != 0)
        v37 = " signed";
      if ((v19 & 1) != 0)
        v25 = "float";
      else
        v25 = "integer";
      if ((v19 & 1) != 0)
        v26 = "";
      else
        v26 = v37;
    }
    v41 = *((_DWORD *)a2 + 7);
    if ((v19 & 0x20) != 0)
      v42 = 1;
    else
      v42 = *((_DWORD *)a2 + 7);
    if (v42)
      v42 = 8 * (v20 / v42);
    if (v42 == *((_DWORD *)a2 + 8))
    {
      v57.__r_.__value_.__s.__data_[0] = 0;
    }
    else
    {
      if ((v19 & 8) != 0)
        v43 = "";
      else
        v43 = "un";
      snprintf((char *)&v57, 0x20uLL, "%spacked in %u bytes", v43, v35);
      v20 = *((_DWORD *)a2 + 6);
      v19 = *((_DWORD *)a2 + 3);
      if (!v20)
      {
        v44 = 0;
        v21 = *((_DWORD *)a2 + 3) & 0x20;
        goto LABEL_128;
      }
      v41 = *((_DWORD *)a2 + 7);
      v21 = *((_DWORD *)a2 + 3) & 0x20;
    }
    if (v21)
      v44 = 1;
    else
      v44 = v41;
    if (v44)
      v44 = 8 * (v20 / v44);
LABEL_128:
    v45 = *((_DWORD *)a2 + 8);
    v46 = " high-aligned";
    if ((v19 & 0x10) == 0)
      v46 = " low-aligned";
    if ((v45 & 7) == 0 && v44 == v45)
      v40 = "";
    else
      v40 = v46;
    if (v21)
      v39 = ", deinterleaved";
    else
      v39 = "";
    if (v57.__r_.__value_.__s.__data_[0])
    {
      v22 = ", ";
LABEL_141:
      if (((v19 >> 7) & 0x3F) != 0)
        snprintf(__str, 0x14uLL, "%u.%u");
      else
        snprintf(__str, 0x14uLL, "%u");
      caulk::make_string((caulk *)"%s-bit%s%s %s%s%s%s%s", (uint64_t)&v54, __str, v36, v26, v25, v22, &v57, v40, v39);
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = &v55;
      else
        v48 = (std::string *)v55.__r_.__value_.__r.__words[0];
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v49 = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      else
        v49 = v55.__r_.__value_.__l.__size_;
      v50 = std::string::insert(&v54, 0, (const std::string::value_type *)v48, v49);
      v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
      *((_QWORD *)this + 2) = *((_QWORD *)&v50->__r_.__value_.__l + 2);
      *(_OWORD *)this = v51;
      v50->__r_.__value_.__l.__size_ = 0;
      v50->__r_.__value_.__r.__words[2] = 0;
      v50->__r_.__value_.__r.__words[0] = 0;
      if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_65;
      v34 = (void *)v54.__r_.__value_.__r.__words[0];
      goto LABEL_64;
    }
LABEL_106:
    if (*v40)
      v22 = ", ";
    goto LABEL_141;
  }
  if ((v10 & 4) == 0)
    goto LABEL_19;
  v11 = (v10 >> 7) & 0x3F;
  if (v11 != 24 || v7 != 4)
  {
    if (!v11 && v7 == 4)
    {
      v12 = 5;
      goto LABEL_163;
    }
    if (!v11 && v7 == 2)
    {
      v12 = 2;
      goto LABEL_163;
    }
    goto LABEL_19;
  }
  v12 = 3;
LABEL_163:
  if ((v10 & 0x20) != 0)
    v53 = ", deinterleaved";
  else
    v53 = ", interleaved";
  if (v9 <= 1)
    v53 = "";
  caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s%s", (uint64_t)this, v9, *a2, *((_QWORD *)&off_2509A2C00 + v12), v53);
}

void sub_237BB3E3C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void caulk::make_string(caulk *this@<X0>, uint64_t a2@<X8>, ...)
{
  int v5;
  int v6;
  char *v7;
  size_t v8;
  int v9;
  va_list va;

  va_start(va, a2);
  v5 = vsnprintf(0, 0, (const char *)this, va);
  if (v5 <= 0)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    std::string::resize((std::string *)a2, (v5 + 1), 0);
    v6 = *(char *)(a2 + 23);
    if (v6 >= 0)
      v7 = (char *)a2;
    else
      v7 = *(char **)a2;
    if (v6 >= 0)
      v8 = *(unsigned __int8 *)(a2 + 23);
    else
      v8 = *(_QWORD *)(a2 + 8);
    v9 = vsnprintf(v7, v8, (const char *)this, va);
    std::string::resize((std::string *)a2, v9, 0);
  }
}

char *std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0x492492492492493)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  v3 = 56 * a2;
  result = (char *)operator new(56 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[v3];
  return result;
}

CFNumberRef *std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>(CFNumberRef *a1, double a2)
{
  CFNumberRef v3;
  void *exception;
  double valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_237BB3FC4(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  int v9;
  int v10;
  const std::vector<std::csub_match>::value_type *v11;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;
  const std::vector<std::csub_match>::value_type *v14;
  std::sub_match<const char *> *first;
  std::sub_match<const char *> *second;
  uint64_t result;
  int v18;
  const char *v19;
  int v20;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0)
    this[4].__end_ = a2;
  LOBYTE(this[4].__begin_) = 1;
  if (!std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (a2 == a3 || (v9 & 0x40) != 0)
      goto LABEL_18;
    v18 = v9 | 0x80;
    v19 = (char *)&a2->first + 1;
    if (v19 != (const char *)a3)
    {
      do
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        v20 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v19, (const char *)a3, (uint64_t *)this, v18, 0);
        begin = this->__begin_;
        end = this->__end_;
        if (v20)
          goto LABEL_8;
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), v11);
      }
      while (++v19 != (const char *)a3);
    }
    std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
    if (!std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v18, 0))
    {
LABEL_18:
      result = 0;
      this->__end_ = this->__begin_;
      return result;
    }
  }
  begin = this->__begin_;
  end = this->__end_;
LABEL_8:
  if (end == begin)
    v14 = v11;
  else
    v14 = begin;
  first = (std::sub_match<const char *> *)v14->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)v14->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)v14->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

BOOL std::regex_iterator<std::__wrap_iter<char const*>,char,std::regex_traits<char>>::operator==(const std::regex_iterator<std::__wrap_iter<const char *>, char> *this, const std::regex_iterator<std::__wrap_iter<const char *>, char> *__x)
{
  std::vector<std::ssub_match>::pointer begin;
  std::sub_match<std::__wrap_iter<const char *>> *end;
  std::regex_iterator<std::__wrap_iter<const char *>, char>::value_type *p_match;
  std::vector<std::ssub_match>::pointer v7;
  std::sub_match<std::__wrap_iter<const char *>> *v8;
  std::regex_iterator<std::__wrap_iter<const char *>, char>::value_type *v9;
  BOOL v10;

  p_match = &this->__match_;
  begin = this->__match_.__matches_.__begin_;
  end = p_match->__matches_.__end_;
  v9 = &__x->__match_;
  v7 = __x->__match_.__matches_.__begin_;
  v8 = v9->__matches_.__end_;
  v10 = v8 == v7 && end == begin;
  if (end != begin && v8 != v7)
    return this->__begin_.__i_ == __x->__begin_.__i_
        && this->__end_.__i_ == __x->__end_.__i_
        && this->__pregex_ == __x->__pregex_
        && this->__flags_ == __x->__flags_
        && std::sub_match<std::__wrap_iter<char const*>>::compare[abi:ne180100]((uint64_t)begin, (uint64_t)v7) == 0;
  return v10;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v10 = a4[6];
  v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  v12 = *(char **)a1;
  v13 = *(char **)(a1 + 8);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v13[-*(_QWORD *)a1] >> 3);
  v15 = v11 - v14;
  if (v11 <= v14)
  {
    v22 = *(char **)(a1 + 8);
    if (v11 >= v14)
      goto LABEL_22;
    v22 = &v12[8 * ((a4[1] - *a4) >> 3)];
    goto LABEL_21;
  }
  v16 = *(_QWORD *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v13) >> 3) >= v15)
  {
    v22 = &v13[24 * v15];
    v27 = 8 * ((a4[1] - *a4) >> 3) - 8 * ((uint64_t)&v13[-*(_QWORD *)a1] >> 3);
    do
    {
      *(_QWORD *)v13 = 0;
      *((_QWORD *)v13 + 1) = 0;
      v13[16] = 0;
      v13 += 24;
      v27 -= 24;
    }
    while (v27);
LABEL_21:
    *(_QWORD *)(a1 + 8) = v22;
    goto LABEL_22;
  }
  if (v11 > 0xAAAAAAAAAAAAAAALL)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  v17 = 0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v12) >> 3);
  v18 = 2 * v17;
  if (2 * v17 <= v11)
    v18 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  if (v17 >= 0x555555555555555)
    v19 = 0xAAAAAAAAAAAAAAALL;
  else
    v19 = v18;
  if (v19 > 0xAAAAAAAAAAAAAAALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v20 = (char *)operator new(24 * v19);
  v21 = &v20[24 * v14];
  v22 = &v20[24 * v11];
  v23 = v21;
  v24 = 24 * v11 - 24 * v14;
  do
  {
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0;
    v23[16] = 0;
    v23 += 24;
    v24 -= 24;
  }
  while (v24);
  v25 = *(char **)a1;
  if (v13 != *(char **)a1)
  {
    do
    {
      v26 = *(_OWORD *)(v13 - 24);
      *((_QWORD *)v21 - 1) = *((_QWORD *)v13 - 1);
      *(_OWORD *)(v21 - 24) = v26;
      v21 -= 24;
      v13 -= 24;
    }
    while (v13 != v25);
    v13 = *(char **)a1;
  }
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v22;
  *(_QWORD *)(a1 + 16) = &v20[24 * v19];
  if (v13)
  {
    operator delete(v13);
    v22 = *(char **)(a1 + 8);
  }
LABEL_22:
  v28 = *(char **)a1;
  if (v22 != *(char **)a1)
  {
    v29 = 0;
    v30 = 0;
    v32 = *a4;
    v31 = a4[1];
    do
    {
      v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - v32) >> 3);
      v34 = (_QWORD *)(v32 + v29);
      if (v33 <= v30)
        v35 = a4 + 3;
      else
        v35 = v34;
      *(_QWORD *)&v28[v29] = a2 + *v35 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v30)
        v36 = a4 + 3;
      else
        v36 = (uint64_t *)(*a4 + v29);
      *(_QWORD *)(*(_QWORD *)a1 + v29 + 8) = a2 + v36[1] - v10;
      v32 = *a4;
      v31 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v31 - *a4) >> 3) <= v30)
        v37 = a4 + 3;
      else
        v37 = (uint64_t *)(*a4 + v29);
      v38 = *((_BYTE *)v37 + 16);
      v28 = *(char **)a1;
      v39 = *(_QWORD *)(a1 + 8);
      *(_BYTE *)(*(_QWORD *)a1 + v29 + 16) = v38;
      ++v30;
      v29 += 24;
    }
    while (v30 < 0xAAAAAAAAAAAAAAABLL * ((v39 - (uint64_t)v28) >> 3));
  }
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = 0;
  v40 = a2 + a4[6] - v10;
  *(_QWORD *)(a1 + 48) = v40;
  *(_QWORD *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(_QWORD *)(a1 + 72) = a2 + a4[9] - v10;
  *(_QWORD *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = v40;
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t std::sub_match<std::__wrap_iter<char const*>>::compare[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  void **v5;
  int v6;
  void *v7;
  size_t v8;
  void **v9;
  size_t v10;
  void **v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  void **v16;
  size_t v17;
  uint64_t v18;
  void *v19;
  size_t v20;
  uint64_t v21;

  if (*(_BYTE *)(a1 + 16))
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&v19, *(char **)a1, *(char **)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
  }
  if (*(_BYTE *)(a2 + 16))
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&v16, *(char **)a2, *(char **)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
    v3 = HIBYTE(v18);
    v5 = v16;
    v4 = v17;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v3 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  v6 = SHIBYTE(v21);
  v7 = v19;
  if (v21 >= 0)
    v8 = HIBYTE(v21);
  else
    v8 = v20;
  if (v21 >= 0)
    v9 = &v19;
  else
    v9 = (void **)v19;
  if ((v3 & 0x80u) == 0)
    v10 = v3;
  else
    v10 = v4;
  if ((v3 & 0x80u) == 0)
    v11 = (void **)&v16;
  else
    v11 = v5;
  if (v10 >= v8)
    v12 = v8;
  else
    v12 = v10;
  v13 = memcmp(v9, v11, v12);
  if ((v3 & 0x80) != 0)
  {
    operator delete(v5);
    if ((v6 & 0x80000000) == 0)
      goto LABEL_24;
  }
  else if ((v6 & 0x80000000) == 0)
  {
    goto LABEL_24;
  }
  operator delete(v7);
LABEL_24:
  v14 = v10 < v8;
  if (v8 < v10)
    v14 = -1;
  if (v13)
    return v13;
  else
    return v14;
}

void sub_237BB465C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  int v7;
  const char *v9;
  const char *v10;
  uint64_t v12;
  _QWORD *v13;
  const char *v14;
  unsigned int v15;
  _DWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  const char *v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  __int128 *v29;
  __int128 *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  __int128 *v39;
  char *v40;
  char *v41;
  __int128 v42;
  char *v43;
  char *v44;
  int64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  __int128 v55;
  unint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  __int128 v60;
  char *v61;
  char *v62;
  char *v63;
  _QWORD *v64;
  _QWORD *v65;
  char *v66;
  uint64_t v68;
  void *v69;
  _BYTE *v70;
  unsigned int v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  _QWORD *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  const char *v95;
  BOOL v96;
  char v97;
  BOOL v98;
  uint64_t v99;
  char *v100;
  void **v101;
  _BYTE *v102;
  const char *v103;
  _QWORD *v104;
  _QWORD *v105;
  unint64_t v106;
  _QWORD *v107;
  unint64_t v108;
  char *v109;
  char *v110;
  __int128 v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  char *v118;
  char *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  size_t v124;
  void *v125;
  char *v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  unint64_t v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t *v149;
  uint64_t *v150;
  char *v151;
  uint64_t v152;
  char *v153;
  int64_t v154;
  char *v155;
  char *v156;
  char *v157;
  char v158;
  const char *v159;
  char v160;
  const char *v161;
  const char *i;
  const char *v163;
  __int16 v164;
  const char *v165;
  void *v166[2];
  __int128 v167;
  int64x2_t v168;
  _BYTE v169[56];
  void *__p[2];
  _QWORD v171[4];
  std::vector<std::csub_match>::value_type __x;

  v7 = a5;
  v9 = a3;
  v10 = a2;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  v165 = (const char *)(a3 - a2);
  v164 = a5;
  if (*(_DWORD *)(a1 + 28))
  {
    v166[0] = 0;
    v166[1] = 0;
    *(_QWORD *)&v167 = 0;
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      __x.first = a3;
      __x.second = a3;
      __x.matched = 0;
      *(_DWORD *)v169 = 0;
      memset(&v169[8], 0, 48);
      *(_OWORD *)__p = 0u;
      memset(v171, 0, 21);
      v166[1] = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(v166, (uint64_t)v169);
      if (__p[0])
        operator delete(__p[0]);
      if (*(_QWORD *)&v169[32])
        operator delete(*(void **)&v169[32]);
      v149 = a4;
      v13 = v166[1];
      *((_DWORD *)v166[1] - 24) = 0;
      *(v13 - 11) = v10;
      *(v13 - 10) = v10;
      v161 = v9;
      *(v13 - 9) = v9;
      std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v13 - 8), *(unsigned int *)(a1 + 28), &__x);
      std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v166[1] - 40), *(unsigned int *)(a1 + 32));
      v153 = 0;
      v155 = 0;
      v151 = 0;
      v152 = 0;
      v156 = 0;
      v148 = 0;
      v14 = 0;
      v158 = 0;
      v15 = 0;
      v16 = v166[1];
      *((_QWORD *)v166[1] - 2) = v12;
      *(v16 - 2) = v7;
      *((_BYTE *)v16 - 4) = a6;
      do
      {
        v17 = (++v15 & 0xFFF) != 0 || (int)(v15 >> 12) < (int)v165;
        if (!v17)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
        v19 = v16 - 4;
        v18 = *((_QWORD *)v16 - 2);
        v20 = v16 - 24;
        if (v18)
          (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v18 + 16))(v18, v16 - 24);
        switch(*(_DWORD *)v20)
        {
          case 0xFFFFFC18:
            v21 = (const char *)*((_QWORD *)v16 - 10);
            if ((v164 & 0x20) != 0 && v21 == v10 || (v164 & 0x1000) != 0 && v21 != v161)
              goto LABEL_21;
            v28 = v153;
            if ((v158 & ((uint64_t)v14 >= (uint64_t)&v21[-*((_QWORD *)v16 - 11)])) == 0)
            {
              v159 = &v21[-*((_QWORD *)v16 - 11)];
              v30 = (__int128 *)*((_QWORD *)v16 - 8);
              v29 = (__int128 *)*((_QWORD *)v16 - 7);
              v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)v30) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((v152 - (uint64_t)v155) >> 3) >= v31)
              {
                v37 = (uint64_t)v148;
                if (0xAAAAAAAAAAAAAAABLL * ((v153 - v155) >> 3) >= v31)
                {
                  if (v30 == v29)
                  {
                    v43 = v155;
                    v44 = v155;
                  }
                  else
                  {
                    v43 = v155;
                    v44 = v155;
                    do
                    {
                      *(_OWORD *)v44 = *v30;
                      v44[16] = *((_BYTE *)v30 + 16);
                      v44 += 24;
                      v30 = (__int128 *)((char *)v30 + 24);
                    }
                    while (v30 != v29);
                  }
                  v45 = v44 - v43;
                  v28 = v43;
                }
                else
                {
                  v39 = (__int128 *)((char *)v30 + 8 * ((v153 - v155) >> 3));
                  if (v153 != v155)
                  {
                    v40 = v155;
                    do
                    {
                      *(_OWORD *)v40 = *v30;
                      v40[16] = *((_BYTE *)v30 + 16);
                      v30 = (__int128 *)((char *)v30 + 24);
                      v40 += 24;
                    }
                    while (v30 != v39);
                  }
                  v41 = v153;
                  while (v39 != v29)
                  {
                    v42 = *v39;
                    *((_QWORD *)v41 + 2) = *((_QWORD *)v39 + 2);
                    *(_OWORD *)v41 = v42;
                    v41 += 24;
                    v39 = (__int128 *)((char *)v39 + 24);
                  }
                  v45 = v41 - v153;
                }
              }
              else
              {
                if (v155)
                {
                  operator delete(v155);
                  v152 = 0;
                }
                if (v31 > 0xAAAAAAAAAAAAAAALL)
                  goto LABEL_217;
                v32 = 0x5555555555555556 * (v152 >> 3);
                if (v32 <= v31)
                  v32 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)v30) >> 3);
                v33 = 0xAAAAAAAAAAAAAAABLL * (v152 >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v32;
                if (v33 > 0xAAAAAAAAAAAAAAALL)
LABEL_217:
                  std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v33);
                v28 = v34;
                v36 = v34;
                if (v30 == v29)
                {
                  v37 = (uint64_t)v148;
                }
                else
                {
                  v37 = (uint64_t)v148;
                  do
                  {
                    v38 = *v30;
                    *((_QWORD *)v36 + 2) = *((_QWORD *)v30 + 2);
                    *(_OWORD *)v36 = v38;
                    v36 += 24;
                    v30 = (__int128 *)((char *)v30 + 24);
                  }
                  while (v30 != v29);
                }
                v152 = (uint64_t)&v34[24 * v35];
                v45 = v36 - v34;
                v155 = v34;
              }
              v47 = (char *)*((_QWORD *)v16 - 5);
              v46 = (char *)*((_QWORD *)v16 - 4);
              v48 = (v46 - v47) >> 4;
              if (v48 <= (v37 - (uint64_t)v156) >> 4)
              {
                v56 = (v151 - v156) >> 4;
                if (v56 >= v48)
                {
                  if (v47 == v46)
                  {
                    v63 = v156;
                    v62 = v156;
                  }
                  else
                  {
                    v62 = v156;
                    do
                    {
                      *(_QWORD *)v62 = *(_QWORD *)v47;
                      *((_QWORD *)v62 + 1) = *((_QWORD *)v47 + 1);
                      v62 += 16;
                      v47 += 16;
                    }
                    while (v47 != v46);
                    v63 = v156;
                  }
                  v61 = (char *)(v62 - v63);
                  v52 = v63;
                  v14 = v159;
                }
                else
                {
                  v57 = &v47[16 * v56];
                  if (v151 != v156)
                  {
                    v58 = v156;
                    do
                    {
                      *(_QWORD *)v58 = *(_QWORD *)v47;
                      *((_QWORD *)v58 + 1) = *((_QWORD *)v47 + 1);
                      v47 += 16;
                      v58 += 16;
                    }
                    while (v47 != v57);
                  }
                  if (v57 == v46)
                  {
                    v52 = v151;
                    v59 = v151;
                    v14 = v159;
                  }
                  else
                  {
                    v52 = v151;
                    v59 = v151;
                    v14 = v159;
                    do
                    {
                      v60 = *(_OWORD *)v57;
                      v57 += 16;
                      *(_OWORD *)v59 = v60;
                      v59 += 16;
                    }
                    while (v57 != v46);
                  }
                  v61 = (char *)(v59 - v52);
                }
              }
              else
              {
                v154 = v45;
                v49 = v28;
                if (v156)
                {
                  operator delete(v156);
                  v37 = 0;
                }
                if (v46 - v47 < 0)
                  goto LABEL_216;
                v50 = v37 >> 3;
                if (v37 >> 3 <= v48)
                  v50 = (v46 - v47) >> 4;
                v51 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v50;
                if (v51 >> 60)
LABEL_216:
                  std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v51);
                v54 = v52;
                while (v47 != v46)
                {
                  v55 = *(_OWORD *)v47;
                  v47 += 16;
                  *(_OWORD *)v54 = v55;
                  v54 += 16;
                }
                v148 = &v52[16 * v53];
                v61 = (char *)(v54 - v52);
                v156 = v52;
                v28 = v49;
                v14 = v159;
                v45 = v154;
              }
              v153 = &v28[v45];
              v151 = &v61[(_QWORD)v52];
            }
            v64 = v166[1];
            if (v14 == v165)
            {
              v65 = v166[0];
              while (v64 != v65)
              {
                v64 -= 12;
                std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v64);
              }
              v166[1] = v65;
              v158 = 1;
              v14 = v165;
            }
            else
            {
              v66 = (char *)v166[1] - 96;
              std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v166[1] - 12);
              v166[1] = v66;
              v158 = 1;
            }
            break;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            break;
          case 0xFFFFFC1F:
LABEL_21:
            v22 = (char *)v166[1] - 96;
            std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v166[1] - 12);
            v166[1] = v22;
            break;
          case 0xFFFFFC20:
            v23 = *((_OWORD *)v16 - 5);
            *(_OWORD *)v169 = *v20;
            *(_OWORD *)&v169[16] = v23;
            memset(&v169[32], 0, 24);
            std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v169[32], *((__int128 **)v16 - 8), *((__int128 **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v16 - 7) - *((_QWORD *)v16 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v171[0] = 0;
            std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v16 - 5), *((__int128 **)v16 - 4), (uint64_t)(*((_QWORD *)v16 - 4) - *((_QWORD *)v16 - 5)) >> 4);
            v24 = *v19;
            *(_QWORD *)((char *)&v171[1] + 5) = *(_QWORD *)((char *)v16 - 11);
            v171[1] = v24;
            (*(void (**)(_QWORD, uint64_t, _DWORD *))(*(_QWORD *)*v19 + 24))(*v19, 1, v16 - 24);
            (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v171[1] + 24))(v171[1], 0, v169);
            v25 = (char *)v166[1];
            if (v166[1] >= (void *)v167)
            {
              v166[1] = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(v166, (uint64_t)v169);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              v26 = *(_OWORD *)&v169[16];
              *(_OWORD *)v166[1] = *(_OWORD *)v169;
              *((_OWORD *)v25 + 1) = v26;
              *((_QWORD *)v25 + 4) = 0;
              *((_QWORD *)v25 + 5) = 0;
              *((_QWORD *)v25 + 6) = 0;
              *((_QWORD *)v25 + 7) = 0;
              *((_OWORD *)v25 + 2) = *(_OWORD *)&v169[32];
              *((_QWORD *)v25 + 6) = *(_QWORD *)&v169[48];
              memset(&v169[32], 0, 24);
              *((_QWORD *)v25 + 8) = 0;
              *((_QWORD *)v25 + 9) = 0;
              *(_OWORD *)(v25 + 56) = *(_OWORD *)__p;
              *((_QWORD *)v25 + 9) = v171[0];
              __p[0] = 0;
              __p[1] = 0;
              v171[0] = 0;
              v27 = v171[1];
              *(_QWORD *)(v25 + 85) = *(_QWORD *)((char *)&v171[1] + 5);
              *((_QWORD *)v25 + 10) = v27;
              v166[1] = v25 + 96;
            }
            if (*(_QWORD *)&v169[32])
            {
              *(_QWORD *)&v169[40] = *(_QWORD *)&v169[32];
              operator delete(*(void **)&v169[32]);
            }
            break;
          default:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
        }
        v16 = v166[1];
      }
      while (v166[0] != v166[1]);
      if ((v158 & 1) != 0)
      {
        v68 = *v149;
        *(_QWORD *)v68 = v10;
        *(_QWORD *)(v68 + 8) = &v14[(_QWORD)v10];
        *(_BYTE *)(v68 + 16) = 1;
        v69 = v155;
        if (v153 != v155)
        {
          v70 = v155 + 16;
          v71 = 1;
          do
          {
            v72 = v68 + 24 * v71;
            *(_OWORD *)v72 = *((_OWORD *)v70 - 1);
            v73 = *v70;
            v70 += 24;
            *(_BYTE *)(v72 + 16) = v73;
            v17 = 0xAAAAAAAAAAAAAAABLL * ((v153 - v155) >> 3) > v71++;
          }
          while (v17);
        }
        v74 = 1;
      }
      else
      {
        v74 = 0;
        v69 = v155;
      }
      if (v156)
        operator delete(v156);
      if (v69)
        operator delete(v69);
    }
    else
    {
      v74 = 0;
    }
    *(_QWORD *)v169 = v166;
    std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v169);
  }
  else
  {
    v167 = 0u;
    v168 = 0u;
    *(_OWORD *)v166 = 0u;
    v74 = *(_QWORD *)(a1 + 40);
    if (v74)
    {
      *(_DWORD *)v169 = 0;
      memset(&v169[8], 0, 48);
      *(_OWORD *)__p = 0uLL;
      memset(v171, 0, 21);
      std::deque<std::__state<char>>::push_back(v166, (uint64_t)v169);
      if (__p[0])
        operator delete(__p[0]);
      if (*(_QWORD *)&v169[32])
        operator delete(*(void **)&v169[32]);
      v150 = a4;
      v75 = v166[1];
      v76 = v168.i64[1] + v168.i64[0] - 1;
      v77 = v76 / 0x2A;
      v78 = *((_QWORD *)v166[1] + v76 / 0x2A);
      v79 = 3 * (v76 % 0x2A);
      v80 = v78 + 32 * v79;
      *(_DWORD *)v80 = 0;
      *(_QWORD *)(v80 + 8) = v10;
      *(_QWORD *)(v75[v77] + 32 * v79 + 16) = v10;
      *(_QWORD *)(v75[v77] + 32 * v79 + 24) = v9;
      std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(v75[v77] + 32 * v79 + 56), *(unsigned int *)(a1 + 32));
      v160 = 0;
      v81 = 0;
      v82 = v168.i64[1];
      v83 = v166[1];
      v84 = v168.i64[1] + v168.i64[0] - 1;
      v85 = v84 / 0x2A;
      v86 = 3 * (v84 % 0x2A);
      *(_QWORD *)(*((_QWORD *)v166[1] + v85) + 32 * v86 + 80) = v74;
      v87 = v83[v85] + 32 * v86;
      *(_DWORD *)(v87 + 88) = v7;
      *(_BYTE *)(v87 + 92) = a6;
      v157 = 0;
      while (2)
      {
        if ((++v81 & 0xFFF) == 0 && (int)(v81 >> 12) >= (int)v165)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
        v89 = v82 + v168.i64[0] - 1;
        v90 = *((_QWORD *)v166[1] + v89 / 0x2A);
        v91 = v89 % 0x2A;
        v92 = v90 + 96 * (v89 % 0x2A);
        v94 = (_QWORD *)(v92 + 80);
        v93 = *(_QWORD *)(v92 + 80);
        if (v93)
          (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v93 + 16))(v93, v90 + 96 * v91);
        switch(*(_DWORD *)v92)
        {
          case 0xFFFFFC18:
            v95 = *(const char **)(v90 + 96 * v91 + 16);
            v96 = (v7 & 0x1000) == 0 || v95 == v9;
            v97 = v96;
            v98 = v95 != v10 || (v7 & 0x20) == 0;
            if (!v98 || (v97 & 1) == 0)
              goto LABEL_200;
            v99 = (uint64_t)&v95[-*(_QWORD *)(v90 + 96 * v91 + 8)];
            v100 = v157;
            if ((v160 & ((uint64_t)v157 >= v99)) == 0)
              v100 = (char *)v99;
            if (v100 != v165)
            {
              v157 = v100;
              std::deque<std::__state<char>>::pop_back(v166);
              v160 = 1;
              goto LABEL_201;
            }
            v101 = (void **)v166[1];
            v102 = (_BYTE *)v167;
            if ((void *)v167 == v166[1])
            {
              v102 = v166[1];
            }
            else
            {
              v103 = v10;
              v104 = (char *)v166[1] + 8 * (v168.i64[0] / 0x2AuLL);
              v105 = (_QWORD *)(*v104 + 96 * (v168.i64[0] % 0x2AuLL));
              v106 = *((_QWORD *)v166[1] + (v168.i64[1] + v168.i64[0]) / 0x2AuLL)
                   + 96 * ((v168.i64[1] + v168.i64[0]) % 0x2AuLL);
              if (v105 != (_QWORD *)v106)
              {
                do
                {
                  std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v105);
                  v105 += 12;
                  if ((_QWORD *)((char *)v105 - *v104) == (_QWORD *)4032)
                  {
                    v107 = (_QWORD *)v104[1];
                    ++v104;
                    v105 = v107;
                  }
                }
                while (v105 != (_QWORD *)v106);
                v101 = (void **)v166[1];
                v102 = (_BYTE *)v167;
              }
              v10 = v103;
            }
            v168.i64[1] = 0;
            v138 = v102 - (_BYTE *)v101;
            if (v138 >= 0x11)
            {
              do
              {
                operator delete(*v101);
                v101 = (void **)((char *)v166[1] + 8);
                v166[1] = v101;
                v138 = v167 - (_QWORD)v101;
              }
              while ((_QWORD)v167 - (_QWORD)v101 > 0x10uLL);
            }
            if (v138 >> 3 == 1)
            {
              v139 = 21;
            }
            else
            {
              if (v138 >> 3 != 2)
                goto LABEL_188;
              v139 = 42;
            }
            v168.i64[0] = v139;
LABEL_188:
            v160 = 1;
            v157 = (char *)v165;
LABEL_201:
            v82 = v168.i64[1];
            if (v168.i64[1])
              continue;
            if ((v160 & 1) != 0)
            {
              v147 = *v150;
              *(_QWORD *)v147 = v10;
              *(_QWORD *)(v147 + 8) = &v157[(_QWORD)v10];
              v74 = 1;
              *(_BYTE *)(v147 + 16) = 1;
            }
            else
            {
              v74 = 0;
            }
            break;
          case 0xFFFFFC19:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_201;
          case 0xFFFFFC1D:
            v108 = v168.i64[0];
            v109 = (char *)v166[1];
            v110 = (char *)v167;
            if (!v168.i64[0])
            {
              v113 = (uint64_t)(v167 - (unint64_t)v166[1]) >> 3;
              v114 = 42 * v113 - 1;
              if ((void *)v167 == v166[1])
                v114 = 0;
              if ((unint64_t)(v114 - v168.i64[1]) < 0x2A)
              {
                if (v113 >= (uint64_t)(*((_QWORD *)&v167 + 1) - (unint64_t)v166[0]) >> 3)
                {
                  if (*((void **)&v167 + 1) == v166[0])
                    v115 = 1;
                  else
                    v115 = (uint64_t)(*((_QWORD *)&v167 + 1) - (unint64_t)v166[0]) >> 2;
                  *(_QWORD *)&v169[32] = (char *)&v167 + 8;
                  *(_QWORD *)v169 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v115);
                  *(_QWORD *)&v169[8] = *(_QWORD *)v169;
                  *(_QWORD *)&v169[16] = *(_QWORD *)v169;
                  *(_QWORD *)&v169[24] = *(_QWORD *)v169 + 8 * v116;
                  v163 = v10;
                  __x.first = (const char *)operator new(0xFC0uLL);
                  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(v169, &__x);
                  v117 = (uint64_t *)v166[1];
                  v118 = *(char **)&v169[16];
                  for (i = v9; v117 != (uint64_t *)v167; *(_QWORD *)&v169[16] += 8)
                  {
                    if (v118 == *(char **)&v169[24])
                    {
                      v119 = *(char **)&v169[8];
                      v120 = *(void **)v169;
                      if (*(_QWORD *)&v169[8] <= *(_QWORD *)v169)
                      {
                        if (v118 == *(char **)v169)
                          v127 = 1;
                        else
                          v127 = (uint64_t)&v118[-*(_QWORD *)v169] >> 2;
                        v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v127);
                        v130 = &v128[8 * (v127 >> 2)];
                        v131 = v118 - v119;
                        v96 = v118 == v119;
                        v118 = v130;
                        v9 = i;
                        if (!v96)
                        {
                          v118 = &v130[v131 & 0xFFFFFFFFFFFFFFF8];
                          v132 = 8 * (v131 >> 3);
                          v133 = v130;
                          do
                          {
                            v134 = *(_QWORD *)v119;
                            v119 += 8;
                            *(_QWORD *)v133 = v134;
                            v133 += 8;
                            v132 -= 8;
                          }
                          while (v132);
                        }
                        *(_QWORD *)v169 = v128;
                        *(_QWORD *)&v169[8] = v130;
                        *(_QWORD *)&v169[16] = v118;
                        *(_QWORD *)&v169[24] = &v128[8 * v129];
                        if (v120)
                          operator delete(v120);
                      }
                      else
                      {
                        v121 = (uint64_t)(*(_QWORD *)&v169[8] - *(_QWORD *)v169) >> 3;
                        if (v121 >= -1)
                          v122 = v121 + 1;
                        else
                          v122 = v121 + 2;
                        v123 = *(_QWORD *)&v169[8] - 8 * (v122 >> 1);
                        v124 = (size_t)&v118[-*(_QWORD *)&v169[8]];
                        if (v118 != *(char **)&v169[8])
                        {
                          v125 = (void *)(*(_QWORD *)&v169[8] - 8 * (v122 >> 1));
                          memmove(v125, *(const void **)&v169[8], v124);
                          v123 = (uint64_t)v125;
                          v118 = v119;
                        }
                        v126 = &v118[-8 * (v122 >> 1)];
                        v118 = (char *)(v123 + v124);
                        *(_QWORD *)&v169[8] = v126;
                        *(_QWORD *)&v169[16] = v123 + v124;
                        v9 = i;
                      }
                    }
                    v135 = *v117++;
                    *(_QWORD *)v118 = v135;
                    v118 = (char *)(*(_QWORD *)&v169[16] + 8);
                  }
                  v136 = v166[0];
                  *(_OWORD *)v166 = *(_OWORD *)v169;
                  *(_QWORD *)&v167 = v118;
                  *((_QWORD *)&v167 + 1) = *(_QWORD *)&v169[24];
                  v137 = 21;
                  if (&v118[-*(_QWORD *)&v169[8]] != (char *)8)
                    v137 = v168.i64[0] + 42;
                  v168.i64[0] = v137;
                  v10 = v163;
                  if (v136)
                    operator delete(v136);
                  LOWORD(v7) = v164;
                }
                else
                {
                  if (v166[1] == v166[0])
                  {
                    *(_QWORD *)v169 = operator new(0xFC0uLL);
                    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(v166, v169);
                    *(_QWORD *)v169 = *(_QWORD *)(v167 - 8);
                    *(_QWORD *)&v167 = v167 - 8;
                  }
                  else
                  {
                    *(_QWORD *)v169 = operator new(0xFC0uLL);
                  }
                  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)v166, v169);
                  v140 = 21;
                  if ((_QWORD)v167 - (unint64_t)v166[1] != 8)
                    v140 = v168.i64[0] + 42;
                  v168.i64[0] = v140;
                }
              }
              else
              {
                v168.i64[0] = 42;
                *(_QWORD *)v169 = *(_QWORD *)(v167 - 8);
                *(_QWORD *)&v167 = v167 - 8;
                std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)v166, v169);
              }
              v108 = v168.i64[0];
              v109 = (char *)v166[1];
              v110 = (char *)v167;
            }
            v141 = &v109[8 * (v108 / 0x2A)];
            v142 = *(_QWORD *)v141 + 96 * (v108 % 0x2A);
            if (v110 == v109)
              v143 = 0;
            else
              v143 = v142;
            if (v143 == *(_QWORD *)v141)
              v143 = *((_QWORD *)v141 - 1) + 4032;
            v144 = *(_OWORD *)(v92 + 16);
            *(_OWORD *)(v143 - 96) = *(_OWORD *)v92;
            *(_OWORD *)(v143 - 80) = v144;
            v145 = v90 + 96 * v91;
            *(_QWORD *)(v143 - 56) = 0;
            *(_QWORD *)(v143 - 48) = 0;
            *(_QWORD *)(v143 - 64) = 0;
            *(_OWORD *)(v143 - 64) = *(_OWORD *)(v145 + 32);
            *(_QWORD *)(v143 - 48) = *(_QWORD *)(v145 + 48);
            *(_QWORD *)(v145 + 32) = 0;
            *(_QWORD *)(v145 + 40) = 0;
            *(_QWORD *)(v145 + 48) = 0;
            *(_QWORD *)(v143 - 40) = 0;
            *(_QWORD *)(v143 - 32) = 0;
            *(_QWORD *)(v143 - 24) = 0;
            *(_OWORD *)(v143 - 40) = *(_OWORD *)(v145 + 56);
            *(_QWORD *)(v143 - 24) = *(_QWORD *)(v145 + 72);
            *(_QWORD *)(v145 + 56) = 0;
            *(_QWORD *)(v145 + 64) = 0;
            *(_QWORD *)(v145 + 72) = 0;
            v146 = *v94;
            *(_QWORD *)(v143 - 11) = *(_QWORD *)(v92 + 85);
            *(_QWORD *)(v143 - 16) = v146;
            v168 = vaddq_s64(v168, (int64x2_t)xmmword_237BC3DA0);
            goto LABEL_200;
          case 0xFFFFFC1F:
LABEL_200:
            std::deque<std::__state<char>>::pop_back(v166);
            goto LABEL_201;
          case 0xFFFFFC20:
            v111 = *(_OWORD *)(v92 + 16);
            *(_OWORD *)v169 = *(_OWORD *)v92;
            *(_OWORD *)&v169[16] = v111;
            memset(&v169[32], 0, 24);
            std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v169[32], *(__int128 **)(v90 + 96 * v91 + 32), *(__int128 **)(v90 + 96 * v91 + 40), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(v90 + 96 * v91 + 40) - *(_QWORD *)(v90 + 96 * v91 + 32)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v171[0] = 0;
            std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(__int128 **)(v90 + 96 * v91 + 56), *(__int128 **)(v90 + 96 * v91 + 64), (uint64_t)(*(_QWORD *)(v90 + 96 * v91 + 64) - *(_QWORD *)(v90 + 96 * v91 + 56)) >> 4);
            v112 = *v94;
            *(_QWORD *)((char *)&v171[1] + 5) = *(_QWORD *)(v92 + 85);
            v171[1] = v112;
            (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v94 + 24))(*v94, 1, v92);
            (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v171[1] + 24))(v171[1], 0, v169);
            std::deque<std::__state<char>>::push_back(v166, (uint64_t)v169);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            if (*(_QWORD *)&v169[32])
            {
              *(_QWORD *)&v169[40] = *(_QWORD *)&v169[32];
              operator delete(*(void **)&v169[32]);
            }
            goto LABEL_201;
          default:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
        }
        break;
      }
    }
    std::deque<std::__state<char>>::~deque[abi:ne180100]((uint64_t)v166);
  }
  return v74;
}

void sub_237BB5628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  void *v37;

  operator delete(v37);
  if (__p)
    operator delete(__p);
  std::deque<std::__state<char>>::~deque[abi:ne180100]((uint64_t)&a23);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  std::vector<std::csub_match>::pointer v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::pair<const char *, const char *> v14;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::size_type v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    end = this->__end_;
    v16 = end - begin;
    if (v16 >= __n)
      v17 = __n;
    else
      v17 = end - begin;
    if (v17)
    {
      v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      v19 = &end[__n - v16];
      v20 = 24 * __n - 24 * v16;
      do
      {
        v21 = __u->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    v11 = this->__end_;
    v12 = &v11[__n];
    v13 = 24 * __n;
    do
    {
      v14 = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v11->matched = *(_QWORD *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v12;
  signed int v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  const char *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  const char *v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  std::vector<std::csub_match>::value_type __x;
  char *v43;
  char *v44;
  unint64_t v45;

  v43 = 0;
  v44 = 0;
  v45 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v44 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v43, (uint64_t)v39);
    if (__p[0])
      operator delete(__p[0]);
    if (*(_QWORD *)&v39[32])
      operator delete(*(void **)&v39[32]);
    v36 = a4;
    v12 = v44;
    *((_DWORD *)v44 - 24) = 0;
    *((_QWORD *)v12 - 11) = a2;
    *((_QWORD *)v12 - 10) = a2;
    *((_QWORD *)v12 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 64), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(v44 - 40), *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = (_DWORD)a3 - (_DWORD)a2;
    v14 = v44;
    *((_QWORD *)v44 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *(v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v17 = v14 - 16;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 96;
      if (v16)
        (*(void (**)(uint64_t, char *))(*(_QWORD *)v16 + 16))(v16, v14 - 96);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = (const char *)*((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *((_QWORD *)v14 - 8);
          v29 = *((_QWORD *)v14 - 7) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v44 - 96;
          std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v44 - 12);
          v44 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *((_OWORD *)v14 - 5);
          *(_OWORD *)v39 = *(_OWORD *)v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v39[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = *(_QWORD *)v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)(v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, char *))(**(_QWORD **)v17 + 24))(*(_QWORD *)v17, 1, v14 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v44;
          if ((unint64_t)v44 >= v45)
          {
            v44 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v43, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *(_OWORD *)v44 = *(_OWORD *)v39;
            *((_OWORD *)v23 + 1) = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            *((_OWORD *)v23 + 2) = *(_OWORD *)&v39[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)(v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)(v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v44 = v23 + 96;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v44;
          ++v15;
          if (v43 != v44)
            continue;
          v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v43;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
  return v6;
}

void sub_237BB5C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 5);
  v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(96 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_OWORD *)(a2 + 16);
  v9 = &v7[96 * v2];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(v9 + 85) = *(_QWORD *)(a2 + 85);
  v11 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  *((_QWORD *)v9 + 9) = 0;
  *((_QWORD *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v9 + 9) = v11;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v13 = v9 + 96;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = &v15[v16];
      v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((_QWORD *)v17 - 6) = *(_QWORD *)&v15[v16 - 48];
      *((_QWORD *)v18 - 8) = 0;
      *((_QWORD *)v18 - 7) = 0;
      *((_QWORD *)v18 - 6) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((_QWORD *)v17 - 3) = *(_QWORD *)&v15[v16 - 24];
      *((_QWORD *)v18 - 5) = 0;
      *((_QWORD *)v18 - 4) = 0;
      *((_QWORD *)v18 - 3) = 0;
      v20 = *(_QWORD *)&v15[v16 - 16];
      *(_QWORD *)(v17 - 11) = *(_QWORD *)&v15[v16 - 11];
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    v15 = (char *)*a1;
    v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v21 -= 96;
      std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v21);
    }
  }
  if (v15)
    operator delete(v15);
  return v13;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v7;
  unint64_t v8;
  std::sub_match<const char *> *value;
  unint64_t v11;
  std::vector<std::csub_match>::size_type v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  std::sub_match<const char *> *v16;
  std::sub_match<const char *> *v17;
  std::pair<const char *, const char *> *v18;
  std::vector<std::csub_match>::size_type v19;
  std::pair<const char *, const char *> v20;
  std::sub_match<const char *> *v21;
  std::sub_match<const char *> *v22;
  std::vector<std::csub_match>::pointer v23;
  std::pair<const char *, const char *> v24;
  std::sub_match<const char *> *v25;
  std::vector<std::csub_match>::size_type v26;
  std::pair<const char *, const char *> v27;

  begin = this->__begin_;
  end = this->__end_;
  v7 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
  v8 = __sz - v7;
  if (__sz <= v7)
  {
    if (__sz < v7)
      this->__end_ = &begin[__sz];
  }
  else
  {
    value = this->__end_cap_.__value_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= v8)
    {
      v25 = &end[v8];
      v26 = 24 * __sz - 8 * (((char *)end - (char *)this->__begin_) >> 3);
      do
      {
        v27 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__x->matched;
        end->std::pair<const char *, const char *> = v27;
        ++end;
        v26 -= 24;
      }
      while (v26);
      this->__end_ = v25;
    }
    else
    {
      if (__sz > 0xAAAAAAAAAAAAAAALL)
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
      v12 = 2 * v11;
      if (2 * v11 <= __sz)
        v12 = __sz;
      if (v11 >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v13);
      v16 = (std::sub_match<const char *> *)&v14[24 * v7];
      v17 = (std::sub_match<const char *> *)&v14[24 * __sz];
      v18 = v16;
      v19 = 24 * __sz - 24 * v7;
      do
      {
        v20 = __x->std::pair<const char *, const char *>;
        v18[1].first = *(const char **)&__x->matched;
        *v18 = v20;
        v18 = (std::pair<const char *, const char *> *)((char *)v18 + 24);
        v19 -= 24;
      }
      while (v19);
      v21 = (std::sub_match<const char *> *)&v14[24 * v15];
      v23 = this->__begin_;
      v22 = this->__end_;
      if (v22 != this->__begin_)
      {
        do
        {
          v24 = v22[-1].std::pair<const char *, const char *>;
          *(_QWORD *)&v16[-1].matched = *(_QWORD *)&v22[-1].matched;
          v16[-1].std::pair<const char *, const char *> = v24;
          --v16;
          --v22;
        }
        while (v22 != v23);
        v22 = this->__begin_;
      }
      this->__begin_ = v16;
      this->__end_ = v17;
      this->__end_cap_.__value_ = v21;
      if (v22)
        operator delete(v22);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;
  std::vector<std::pair<unsigned long, const char *>>::pointer end;
  std::vector<std::pair<unsigned long, const char *>>::size_type v5;
  std::vector<std::pair<unsigned long, const char *>>::size_type v6;
  std::pair<unsigned long, const char *> *value;
  uint64_t v8;
  std::vector<std::pair<unsigned long, const char *>>::size_type v9;
  unint64_t v10;
  char *v11;
  std::pair<unsigned long, const char *> *v12;
  uint64_t v13;
  std::pair<unsigned long, const char *> *v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;
  std::vector<std::pair<unsigned long, const char *>>::pointer v17;
  std::pair<unsigned long, const char *> *v18;

  begin = this->__begin_;
  end = this->__end_;
  v5 = end - this->__begin_;
  if (__sz <= v5)
  {
    if (__sz >= v5)
      return;
    v18 = &begin[__sz];
    goto LABEL_17;
  }
  v6 = __sz - v5;
  value = this->__end_cap_.__value_;
  if (__sz - v5 <= value - end)
  {
    bzero(this->__end_, 16 * v6);
    v18 = &end[v6];
LABEL_17:
    this->__end_ = v18;
    return;
  }
  if (__sz >> 60)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  v8 = (char *)value - (char *)begin;
  v9 = v8 >> 3;
  if (v8 >> 3 <= __sz)
    v9 = __sz;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v10);
  v12 = (std::pair<unsigned long, const char *> *)&v11[16 * v5];
  v14 = (std::pair<unsigned long, const char *> *)&v11[16 * v13];
  bzero(v12, 16 * v6);
  v15 = &v12[v6];
  v17 = this->__begin_;
  v16 = this->__end_;
  if (v16 != this->__begin_)
  {
    do
    {
      v12[-1] = v16[-1];
      --v12;
      --v16;
    }
    while (v16 != v17);
    v16 = this->__begin_;
  }
  this->__begin_ = v12;
  this->__end_ = v15;
  this->__end_cap_.__value_ = v14;
  if (v16)
    operator delete(v16);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB6158(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::__state<char>,0>(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_237BB6250(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_237BB62C0(_Unwind_Exception *exception_object)
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB6314(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

__n128 std::deque<std::__state<char>>::push_back(_QWORD *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  BOOL v35;
  size_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  unint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  _QWORD *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  int64_t v71;
  char *v72;
  unint64_t v73;
  __int128 v74;
  __n128 result;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  _QWORD *v87;

  v4 = (char *)a1[2];
  v5 = (char *)a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = 42 * ((v4 - v5) >> 3) - 1;
  v7 = a1[4];
  v8 = a1[5] + v7;
  if (v6 == v8)
  {
    if (v7 < 0x2A)
    {
      v22 = (v4 - v5) >> 3;
      v23 = (char *)a1[3];
      v24 = (uint64_t)&v23[-*a1];
      if (v22 >= v24 >> 3)
      {
        if (v23 == (char *)*a1)
          v25 = 1;
        else
          v25 = v24 >> 2;
        v87 = a1 + 3;
        *(_QWORD *)&v85 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v25);
        *((_QWORD *)&v85 + 1) = v85 + 8 * v22;
        *(_QWORD *)&v86 = *((_QWORD *)&v85 + 1);
        *((_QWORD *)&v86 + 1) = v85 + 8 * v26;
        v84 = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(&v85, &v84);
        v27 = a1[2];
        v29 = (char *)*((_QWORD *)&v85 + 1);
        v28 = (char *)v85;
        v31 = (char *)*((_QWORD *)&v86 + 1);
        v30 = (char *)v86;
        while (v27 != a1[1])
        {
          if (v29 == v28)
          {
            if (v30 >= v31)
            {
              if (v31 == v28)
                v37 = 1;
              else
                v37 = (v31 - v28) >> 2;
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v37);
              v40 = v38;
              v29 = &v38[(2 * v37 + 6) & 0xFFFFFFFFFFFFFFF8];
              v41 = v30 - v28;
              v35 = v30 == v28;
              v30 = v29;
              if (!v35)
              {
                v30 = &v29[v41 & 0xFFFFFFFFFFFFFFF8];
                v42 = 8 * (v41 >> 3);
                v43 = v29;
                v44 = v28;
                do
                {
                  v45 = *(_QWORD *)v44;
                  v44 += 8;
                  *(_QWORD *)v43 = v45;
                  v43 += 8;
                  v42 -= 8;
                }
                while (v42);
              }
              v31 = &v38[8 * v39];
              if (v28)
                operator delete(v28);
              v28 = v40;
            }
            else
            {
              v32 = (v31 - v30) >> 3;
              if (v32 >= -1)
                v33 = v32 + 1;
              else
                v33 = v32 + 2;
              v34 = &v30[8 * (v33 >> 1)];
              v29 = &v34[-(v30 - v28)];
              v36 = v30 - v28;
              v35 = v30 == v28;
              v30 = v34;
              if (!v35)
                memmove(v29, v28, v36);
            }
          }
          v46 = *(_QWORD *)(v27 - 8);
          v27 -= 8;
          *((_QWORD *)v29 - 1) = v46;
          v29 -= 8;
        }
        *(_QWORD *)&v85 = v28;
        *((_QWORD *)&v85 + 1) = v29;
        *(_QWORD *)&v86 = v30;
        *((_QWORD *)&v86 + 1) = v31;
        v48 = v85;
        v49 = v86;
        *(_QWORD *)&v85 = *a1;
        v47 = (void *)v85;
        *((_QWORD *)&v85 + 1) = v27;
        *(_OWORD *)a1 = v48;
        *((_OWORD *)a1 + 1) = v49;
        if (v47)
          operator delete(v47);
        goto LABEL_60;
      }
      if (v23 != v4)
      {
        *(_QWORD *)&v85 = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v85);
LABEL_60:
        v5 = (char *)a1[1];
        v8 = a1[5] + a1[4];
        goto LABEL_61;
      }
      *(_QWORD *)&v85 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v85);
      v61 = (_QWORD *)a1[1];
      v4 = (char *)a1[2];
      v63 = *v61;
      v62 = (char *)(v61 + 1);
      v10 = v63;
      a1[1] = v62;
      if (v4 == (char *)a1[3])
      {
        v64 = (uint64_t)&v62[-*a1];
        if ((unint64_t)v62 > *a1)
        {
          v65 = v64 >> 3;
          v14 = v64 >> 3 < -1;
          v66 = (v64 >> 3) + 2;
          if (v14)
            v67 = v66;
          else
            v67 = v65 + 1;
          v68 = -(v67 >> 1);
          v69 = v67 >> 1;
          v70 = &v62[-8 * v69];
          v71 = v4 - v62;
          if (v4 != v62)
          {
            memmove(&v62[-8 * v69], v62, v4 - v62);
            v62 = (char *)a1[1];
          }
          v4 = &v70[v71];
          v72 = &v62[8 * v68];
          goto LABEL_58;
        }
        if (v4 == (char *)*a1)
          v77 = 1;
        else
          v77 = (uint64_t)&v4[-*a1] >> 2;
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v77);
        v52 = &v51[8 * (v77 >> 2)];
        v54 = &v51[8 * v78];
        v79 = (uint64_t *)a1[1];
        v4 = v52;
        v80 = a1[2] - (_QWORD)v79;
        if (v80)
        {
          v4 = &v52[v80 & 0xFFFFFFFFFFFFFFF8];
          v81 = 8 * (v80 >> 3);
          v82 = &v51[8 * (v77 >> 2)];
          do
          {
            v83 = *v79++;
            *(_QWORD *)v82 = v83;
            v82 += 8;
            v81 -= 8;
          }
          while (v81);
        }
LABEL_46:
        v60 = (void *)*a1;
        *a1 = v51;
        a1[1] = v52;
        a1[2] = v4;
        a1[3] = v54;
        if (v60)
        {
          operator delete(v60);
          v4 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v7 - 42;
      v11 = *(_QWORD *)v5;
      v9 = v5 + 8;
      v10 = v11;
      a1[1] = v9;
      if ((char *)a1[3] == v4)
      {
        v12 = (uint64_t)&v9[-*a1];
        if ((unint64_t)v9 > *a1)
        {
          v13 = v12 >> 3;
          v14 = v12 >> 3 < -1;
          v15 = (v12 >> 3) + 2;
          if (v14)
            v16 = v15;
          else
            v16 = v13 + 1;
          v17 = -(v16 >> 1);
          v18 = v16 >> 1;
          v19 = &v9[-8 * v18];
          v20 = v4 - v9;
          if (v4 == v9)
          {
            v21 = v4;
          }
          else
          {
            memmove(&v9[-8 * v18], v9, v4 - v9);
            v21 = (char *)a1[1];
          }
          v4 = &v19[v20];
          v72 = &v21[8 * v17];
LABEL_58:
          a1[1] = v72;
          a1[2] = v4;
          goto LABEL_59;
        }
        if (v4 == (char *)*a1)
          v50 = 1;
        else
          v50 = (uint64_t)&v4[-*a1] >> 2;
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v50);
        v52 = &v51[8 * (v50 >> 2)];
        v54 = &v51[8 * v53];
        v55 = (uint64_t *)a1[1];
        v4 = v52;
        v56 = a1[2] - (_QWORD)v55;
        if (v56)
        {
          v4 = &v52[v56 & 0xFFFFFFFFFFFFFFF8];
          v57 = 8 * (v56 >> 3);
          v58 = &v51[8 * (v50 >> 2)];
          do
          {
            v59 = *v55++;
            *(_QWORD *)v58 = v59;
            v58 += 8;
            v57 -= 8;
          }
          while (v57);
        }
        goto LABEL_46;
      }
    }
LABEL_59:
    *(_QWORD *)v4 = v10;
    a1[2] += 8;
    goto LABEL_60;
  }
LABEL_61:
  v73 = *(_QWORD *)&v5[8 * (v8 / 0x2A)] + 96 * (v8 % 0x2A);
  v74 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v73 = *(_OWORD *)a2;
  *(_OWORD *)(v73 + 16) = v74;
  *(_QWORD *)(v73 + 40) = 0;
  *(_QWORD *)(v73 + 48) = 0;
  *(_QWORD *)(v73 + 32) = 0;
  *(_OWORD *)(v73 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v73 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v73 + 56) = 0;
  *(_QWORD *)(v73 + 64) = 0;
  *(_QWORD *)(v73 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v73 + 56) = result;
  *(_QWORD *)(v73 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v76 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v73 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v73 + 80) = v76;
  ++a1[5];
  return result;
}

void sub_237BB683C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p)
{
  void *v11;

  operator delete(v11);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::deque<std::__state<char>>::pop_back(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5] + a1[4] - 1;
  std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A))
                                                                 + 96 * (v2 % 0x2A)));
  v4 = a1[1];
  v3 = a1[2];
  if (v3 == v4)
    v5 = 0;
  else
    v5 = 42 * ((v3 - v4) >> 3) - 1;
  v6 = a1[4];
  v7 = a1[5] - 1;
  a1[5] = v7;
  if ((unint64_t)(v5 - (v7 + v6)) >= 0x54)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v4 = (_QWORD *)(a1 + 40);
    v3 = *(void ***)(a1 + 8);
  }
  else
  {
    v4 = (_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = &v2[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v5) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
  }
  *v4 = 0;
  v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    v12 = 42;
LABEL_14:
    *(_QWORD *)(a1 + 32) = v12;
  }
  if (v2 != v3)
  {
    do
    {
      v13 = *v2++;
      operator delete(v13);
    }
    while (v2 != v3);
    v15 = *(_QWORD *)(a1 + 8);
    v14 = *(_QWORD *)(a1 + 16);
    if (v14 != v15)
      *(_QWORD *)(a1 + 16) = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x23B820EF8]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x24BEDB4B0]);
  return this;
}

void sub_237BB6D08(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__owns_one_state<char> *v13;
  unsigned int v14;
  char *v15;
  char *v16;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  std::__owns_one_state<char> *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  std::__owns_one_state<char> *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = (_QWORD *)operator new();
  *v6 = &off_2509A2520;
  v7 = (_QWORD *)operator new();
  v7[1] = v6;
  v8 = (_QWORD *)operator new();
  *v8 = &off_2509A2578;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  *(_QWORD *)&v9 = v7;
  *((_QWORD *)&v9 + 1) = v8;
  v10 = *(std::__shared_weak_count **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = v9;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(std::__owns_one_state<char> **)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v13;
  v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v14 > 0x3F)
  {
    switch(v14)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        v18 = (unsigned __int8 *)memchr(a2, 10, a3 - a2);
        if (v18)
          v19 = v18;
        else
          v19 = (unsigned __int8 *)a3;
        if (v19 == (unsigned __int8 *)a2)
        {
          v29 = (_QWORD *)operator new();
          v30 = *(_QWORD *)(a1 + 56);
          v31 = *(_QWORD *)(v30 + 8);
          v29[1] = v31;
          *(_QWORD *)(v30 + 8) = v29;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, (unsigned __int8 *)a2, v19);
        }
        if (v19 != (unsigned __int8 *)a3)
          ++v19;
        while (v19 != (unsigned __int8 *)a3)
        {
          v32 = (unsigned __int8 *)memchr(v19, 10, a3 - (char *)v19);
          if (v32)
            v33 = v32;
          else
            v33 = (unsigned __int8 *)a3;
          v34 = *(std::__owns_one_state<char> **)(a1 + 56);
          if (v33 == v19)
          {
            v35 = (_QWORD *)operator new();
            v36 = *(_QWORD *)(a1 + 56);
            v37 = *(_QWORD *)(v36 + 8);
            v35[1] = v37;
            *(_QWORD *)(v36 + 8) = v35;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v19, v33);
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_alternation((std::basic_regex<char> *)a1, v13, v34);
          if (v33 == (unsigned __int8 *)a3)
            v19 = v33;
          else
            v19 = v33 + 1;
        }
        break;
      case 0x100u:
        v15 = (char *)memchr(a2, 10, a3 - a2);
        if (v15)
          v16 = v15;
        else
          v16 = a3;
        if (v16 == a2)
        {
          v20 = (_QWORD *)operator new();
          v21 = *(_QWORD *)(a1 + 56);
          v22 = *(_QWORD *)(v21 + 8);
          v20[1] = v22;
          *(_QWORD *)(v21 + 8) = v20;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, v16);
        }
        if (v16 != a3)
          ++v16;
        while (v16 != a3)
        {
          v23 = (char *)memchr(v16, 10, a3 - v16);
          if (v23)
            v24 = v23;
          else
            v24 = a3;
          v25 = *(std::__owns_one_state<char> **)(a1 + 56);
          if (v24 == v16)
          {
            v26 = (_QWORD *)operator new();
            v27 = *(_QWORD *)(a1 + 56);
            v28 = *(_QWORD *)(v27 + 8);
            v26[1] = v28;
            *(_QWORD *)(v27 + 8) = v26;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, v16, v24);
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_alternation((std::basic_regex<char> *)a1, v13, v25);
          if (v24 == a3)
            v16 = v24;
          else
            v16 = v24 + 1;
        }
        break;
      default:
        goto LABEL_54;
    }
    return a3;
  }
  else if (v14)
  {
    if (v14 != 16)
    {
      if (v14 != 32)
LABEL_54:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
    }
    return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, a3);
  }
}

void sub_237BB70D0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB713C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::__owns_one_state<char> *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  std::__node<char> *v15;
  std::__owns_one_state<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v12 = a1->__end_;
    v13 = v8 + 1;
    v14 = v8 + 1;
    do
    {
      v8 = v14;
      v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, v14, a3);
    }
    while (v14 != v8);
    if (v8 == v13)
    {
      v15 = (std::__node<char> *)operator new();
      v16 = a1->__end_;
      v17 = v16->__first_;
      v15[1].__vftable = (std::__node<char>_vtbl *)v17;
      v16->__first_ = v15;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
  }
  return a3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
  {
    v6 = operator new();
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v6 = &off_2509A2670;
    *(_QWORD *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != v4)
  {
    do
    {
      v10 = v3;
      v3 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>((std::basic_regex<char> *)a1, v3, v4);
    }
    while (v3 != v10);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &off_2509A26B8;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v3;
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__owns_one_state<char> *v9;
  unsigned __int8 *v10;

  v3 = a3;
  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v9 = a1->__end_;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1)
      goto LABEL_9;
    v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB74A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  std::__node<char> *v6;
  std::__node<char> *first;
  std::__node<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;

  v6 = (std::__node<char> *)operator new();
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&off_2509A2B38;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  v8 = (std::__node<char> *)operator new();
  v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  v10 = (std::__node<char> *)operator new();
  v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&off_2509A2B80;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
  JUMPOUT(0x23B820F34);
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x23B820F34);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  JUMPOUT(0x23B820F34);
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x23B820F34);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  do
  {
    v7 = v6;
    v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB78B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  std::basic_regex<char>::value_type v13;
  char *v14;
  _BOOL4 v15;
  uint64_t v16;
  std::__node<char> *v17;
  std::__owns_one_state<char> *v18;
  std::__node<char> *first;
  int v20;
  uint64_t v21;
  BOOL v22;
  std::__owns_one_state<char> *v23;
  std::__node<char> *v24;
  uint64_t (**v25)();
  unsigned int v26;
  char *v27;
  char *v28;

  end = this->__end_;
  marked_count = this->__marked_count_;
  if (a2 == a3)
  {
LABEL_24:
    v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    goto LABEL_25;
  }
  v8 = *a2;
  v9 = (v8 - 36);
  if (v9 > 0x3A)
    goto LABEL_13;
  if (((1 << (v8 - 36)) & 0x5800000080004D1) == 0)
  {
    if (v9 == 5)
    {
      if (this->__open_count_)
        goto LABEL_4;
LABEL_14:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, *a2);
LABEL_33:
      v10 = (unsigned __int8 *)(a2 + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v10, (unsigned __int8 *)a3, end, marked_count + 1, this->__marked_count_ + 1);
    }
LABEL_13:
    if ((v8 - 123) < 2)
      goto LABEL_4;
    goto LABEL_14;
  }
LABEL_4:
  v10 = (unsigned __int8 *)(a2 + 1);
  if (a2 + 1 == a3)
    goto LABEL_21;
  v11 = *a2;
  if (v11 != 92)
    goto LABEL_22;
  v12 = (char)*v10;
  v13 = *v10;
  if ((v12 - 36) <= 0x3A && ((1 << (v12 - 36)) & 0x5800000080004F1) != 0
    || (v12 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v13);
    v10 = (unsigned __int8 *)(a2 + 2);
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v10, (unsigned __int8 *)a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
  if ((this->__flags_ & 0x1F0) == 0x40)
  {
    v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(this, a2 + 1, a3, 0);
  }
  else
  {
    v15 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, v13);
    v16 = 2;
    if (!v15)
      v16 = 0;
    v14 = &a2[v16];
  }
  if (v14 == a2)
  {
LABEL_21:
    v11 = *a2;
LABEL_22:
    if (v11 == 46)
    {
      v17 = (std::__node<char> *)operator new();
      v18 = this->__end_;
      first = v18->__first_;
      v17->__vftable = (std::__node<char>_vtbl *)&off_2509A2BC8;
      v17[1].__vftable = (std::__node<char>_vtbl *)first;
      v18->__first_ = v17;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v10, (unsigned __int8 *)a3, end, marked_count + 1, this->__marked_count_ + 1);
    }
    goto LABEL_24;
  }
LABEL_25:
  if (v14 != a2 || v14 == a3)
    goto LABEL_37;
  v20 = *a2;
  switch(v20)
  {
    case '$':
      v21 = operator new();
      v22 = (this->__flags_ & 0x5F0) == 1024;
      v23 = this->__end_;
      v24 = v23->__first_;
      v25 = &off_2509A26B8;
      goto LABEL_32;
    case '(':
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
      v26 = this->__marked_count_;
      ++this->__open_count_;
      v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(this, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, *v27 != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, v26);
      --this->__open_count_;
      v14 = v28 + 1;
LABEL_37:
      v10 = (unsigned __int8 *)v14;
      if (v14 != a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v10, (unsigned __int8 *)a3, end, marked_count + 1, this->__marked_count_ + 1);
      return (unsigned __int8 *)a2;
    case '^':
      v21 = operator new();
      v22 = (this->__flags_ & 0x5F0) == 1024;
      v23 = this->__end_;
      v24 = v23->__first_;
      v25 = &off_2509A2670;
LABEL_32:
      *(_QWORD *)v21 = v25;
      *(_QWORD *)(v21 + 8) = v24;
      *(_BYTE *)(v21 + 16) = v22;
      v23->__first_ = (std::__node<char> *)v21;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      goto LABEL_33;
  }
  return (unsigned __int8 *)a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  uint64_t v2;
  unsigned int v3;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v2 = operator new();
    v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v2 = &off_2509A29D0;
    *(_QWORD *)(v2 + 8) = first;
    *(_DWORD *)(v2 + 16) = v3;
    end->__first_ = (std::__node<char> *)v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB7C9C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  uint64_t v4;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v4 = operator new();
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v4 = &off_2509A2A18;
    *(_QWORD *)(v4 + 8) = first;
    *(_DWORD *)(v4 + 16) = a2;
    end->__first_ = (std::__node<char> *)v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  size_t v18;
  BOOL v19;
  BOOL v20;
  std::__owns_one_state<char> *v21;
  BOOL v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  size_t __max;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123)
      return a2;
    v15 = a2 + 1;
    v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = (int)__max;
LABEL_33:
              v21 = __s;
              v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = (int)__max;
LABEL_45:
            v21 = __s;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v16 + 1, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  uint64_t v17;
  unsigned int loop_count;
  std::__node<char> *v19;
  std::__node<char> *v20;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = (_QWORD *)operator new();
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new();
  loop_count = this->__loop_count_;
  v19 = __s->__first_;
  *(_QWORD *)v17 = &off_2509A2A60;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = __min;
  *(_QWORD *)(v17 + 32) = __max;
  *(_DWORD *)(v17 + 40) = loop_count;
  *(_DWORD *)(v17 + 44) = v9;
  *(_DWORD *)(v17 + 48) = v8;
  *(_BYTE *)(v17 + 52) = __greedy;
  __s->__first_ = 0;
  v20 = (std::__node<char> *)operator new();
  v20->__vftable = (std::__node<char>_vtbl *)&off_2509A2AF0;
  v20[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v20;
  this->__end_ = *(std::__owns_one_state<char> **)(v17 + 16);
  __s->__first_ = (std::__node<char> *)v17;
  ++this->__loop_count_;
}

void sub_237BB8124(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(unsigned __int8 *result, unsigned __int8 *a2, int *a3)
{
  int v3;
  int v4;
  int v5;

  if (result != a2)
  {
    v3 = *result;
    if ((v3 & 0xF8) == 0x30 || (v3 & 0xFE) == 0x38)
    {
      v4 = v3 - 48;
      *a3 = v4;
      if (++result == a2)
      {
        return a2;
      }
      else
      {
        while (1)
        {
          v5 = *result;
          if ((v5 & 0xF8) != 0x30 && (v5 & 0xFE) != 0x38)
            break;
          if (v4 >= 214748364)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          v4 = v5 + 10 * v4 - 48;
          *a3 = v4;
          if (++result == a2)
            return a2;
        }
      }
    }
  }
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB821C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB8268(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
  JUMPOUT(0x23B820F34);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2AC0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x23B820F34);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = (_BYTE *)(a2[4] + 24 * v4 + 16);
    do
    {
      *((_QWORD *)v7 - 2) = v5;
      *((_QWORD *)v7 - 1) = v5;
      *v7 = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v5;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  char *j;
  char *v15;
  unint64_t i;
  int v17;
  char *v18;
  char *v19;
  int v20;
  std::__split_buffer<std::string>::pointer end_high;
  void *p_v;
  const char *first;
  std::regex_traits<char>::char_class_type classname;
  char v25;
  unint64_t v26;
  char *v27;
  void **v28;
  std::__split_buffer<std::string>::pointer begin;
  void *v30;
  std::string::value_type *v31;
  std::string::value_type **v32;
  int v33;
  void **v34;
  _BYTE *v35;
  char *v36;
  char *v37;
  std::string::value_type *v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  std::string *v50;
  char *v51;
  unint64_t v52;
  std::__split_buffer<std::string>::pointer end;
  __int128 v54;
  char *k;
  void **v56;
  char v57;
  void **v58;
  char *m;
  void **v60;
  char v61;
  void **v62;
  void *v63;
  void *v64;
  void **v65;
  char v66;
  void **v67;
  void **v68;
  char v69;
  void **v70;
  std::__split_buffer<std::string>::pointer v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char **v79;
  uint64_t v80;
  std::vector<std::string> *v81;
  char *v82;
  void *v83[2];
  int64_t v84;
  void *v85[2];
  std::string *v86;
  void *v87[2];
  uint64_t v88;
  void *__p[2];
  std::string *v90;
  std::string::value_type *__s[2];
  int64_t v92;
  __int128 v93;
  std::string *v94;
  std::__split_buffer<std::string> __v;
  int64_t v96;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_249;
    v5 = (uint64_t)(a2[1] == 94 ? a2 + 2 : a2 + 1);
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if ((char *)v5 == a3)
      goto LABEL_249;
    v7 = (uint64_t)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(_BYTE *)v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if ((char *)v5 == a3)
      goto LABEL_249;
    v80 = v7 + 16;
    v81 = (std::vector<std::string> *)(v7 + 136);
    v79 = (char **)(v7 + 88);
    v82 = a3 - 4;
    while (1)
    {
      v8 = (char *)v5;
      v9 = a3;
      if ((char *)v5 == a3)
        goto LABEL_152;
      v10 = *(unsigned __int8 *)v5;
      v9 = (char *)v5;
      if (v10 == 93)
        goto LABEL_152;
      v11 = 0;
      __p[0] = 0;
      __p[1] = 0;
      v90 = 0;
      v12 = 0;
      v9 = (char *)v5;
      if ((char *)(v5 + 1) != a3 && v10 == 91)
      {
        v13 = *(unsigned __int8 *)(v5 + 1);
        switch(v13)
        {
          case '.':
            v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, (char *)(v5 + 2), a3, (uint64_t)__p);
            v12 = (void *)HIBYTE(v90);
            v11 = __p[1];
            break;
          case ':':
            if ((uint64_t)&a3[-v5 - 2] < 2)
              goto LABEL_248;
            for (i = 0; ; ++i)
            {
              v15 = (char *)(v5 + i + 2);
              if (*v15 == 58 && *(_BYTE *)(v5 + i + 3) == 93)
                break;
              if (&v82[-v5] == (char *)i)
                goto LABEL_248;
            }
            if (v15 == a3)
LABEL_248:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
            v20 = *(_DWORD *)(a1 + 24);
            std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__v, (char *)(v5 + 2), (char *)(v5 + i + 2), i);
            end_high = (std::__split_buffer<std::string>::pointer)HIBYTE(__v.__end_);
            if (SHIBYTE(__v.__end_) >= 0)
              p_v = &__v;
            else
              p_v = __v.__first_;
            if (SHIBYTE(__v.__end_) < 0)
              end_high = __v.__begin_;
            (*(void (**)(_QWORD, void *, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), p_v, (char *)end_high + (_QWORD)p_v);
            if (SHIBYTE(__v.__end_) >= 0)
              first = (const char *)&__v;
            else
              first = (const char *)__v.__first_;
            classname = std::__get_classname(first, v20 & 1);
            if (SHIBYTE(__v.__end_) < 0)
              operator delete(__v.__first_);
            if (!classname)
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
            v25 = 0;
            *(_DWORD *)(v7 + 160) |= classname;
            goto LABEL_148;
          case '=':
            if ((uint64_t)&a3[-v5 - 2] < 2)
              goto LABEL_248;
            for (j = 0; ; ++j)
            {
              v15 = &j[v5 + 2];
              if (*v15 == 61 && j[v5 + 3] == 93)
                break;
              if (&v82[-v5] == j)
                goto LABEL_248;
            }
            if (v15 == a3)
              goto LABEL_248;
            std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)&v93, a1, (char *)(v5 + 2), &j[v5 + 2]);
            if (SHIBYTE(v94) < 0)
            {
              v26 = *((_QWORD *)&v93 + 1);
              if (!*((_QWORD *)&v93 + 1))
LABEL_250:
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              v27 = (char *)v93;
            }
            else
            {
              v26 = HIBYTE(v94);
              if (!HIBYTE(v94))
                goto LABEL_250;
              v27 = (char *)&v93;
            }
            std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__v, v27, &v27[v26], v26);
            begin = (std::__split_buffer<std::string>::pointer)HIBYTE(__v.__end_);
            if (SHIBYTE(__v.__end_) >= 0)
              v30 = &__v;
            else
              v30 = __v.__first_;
            if (SHIBYTE(__v.__end_) < 0)
              begin = __v.__begin_;
            (*(void (**)(std::string::value_type **__return_ptr, _QWORD, void *, char *))(**(_QWORD **)(a1 + 16) + 32))(__s, *(_QWORD *)(a1 + 16), v30, (char *)begin + (_QWORD)v30);
            v31 = (std::string::value_type *)HIBYTE(v92);
            if (v92 < 0)
              v31 = __s[1];
            if (v31 != (std::string::value_type *)1)
            {
              if (v31 == (std::string::value_type *)12)
              {
                v32 = __s;
                if (v92 < 0)
                  v32 = (std::string::value_type **)__s[0];
                *((_BYTE *)v32 + 11) = *((_BYTE *)v32 + 3);
              }
              else if (SHIBYTE(v92) < 0)
              {
                *__s[0] = 0;
                __s[1] = 0;
              }
              else
              {
                LOBYTE(__s[0]) = 0;
                HIBYTE(v92) = 0;
              }
            }
            if (SHIBYTE(__v.__end_) < 0)
              operator delete(__v.__first_);
            v38 = (std::string::value_type *)HIBYTE(v92);
            v39 = HIBYTE(v92);
            if (v92 < 0)
              v38 = __s[1];
            if (v38)
            {
              v41 = *(_QWORD *)(v7 + 144);
              v40 = *(_QWORD *)(v7 + 152);
              if (v41 >= v40)
              {
                v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (unint64_t)v81->__begin_) >> 3);
                v46 = v45 + 1;
                if (v45 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (unint64_t)v81->__begin_) >> 3);
                if (2 * v47 > v46)
                  v46 = 2 * v47;
                if (v47 >= 0x555555555555555)
                  v48 = 0xAAAAAAAAAAAAAAALL;
                else
                  v48 = v46;
                __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v7 + 152);
                if (v48)
                {
                  v50 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v48);
                  v39 = HIBYTE(v92);
                }
                else
                {
                  v50 = 0;
                  v49 = 0;
                }
                end = v50 + v45;
                __v.__first_ = v50;
                __v.__begin_ = end;
                __v.__end_ = end;
                __v.__end_cap_.__value_ = &v50[v49];
                if (v39 < 0)
                {
                  std::string::__init_copy_ctor_external(end, __s[0], (std::string::size_type)__s[1]);
                  end = __v.__end_;
                }
                else
                {
                  v54 = *(_OWORD *)__s;
                  end->__r_.__value_.__r.__words[2] = v92;
                  *(_OWORD *)&end->__r_.__value_.__l.__data_ = v54;
                }
                __v.__end_ = end + 1;
                std::vector<std::string>::__swap_out_circular_buffer(v81, &__v);
                v52 = *(_QWORD *)(v7 + 144);
                std::__split_buffer<std::string>::~__split_buffer(&__v);
              }
              else
              {
                if (SHIBYTE(v92) < 0)
                {
                  std::string::__init_copy_ctor_external(*(std::string **)(v7 + 144), __s[0], (std::string::size_type)__s[1]);
                }
                else
                {
                  v42 = *(_OWORD *)__s;
                  *(_QWORD *)(v41 + 16) = v92;
                  *(_OWORD *)v41 = v42;
                }
                v52 = v41 + 24;
                *(_QWORD *)(v7 + 144) = v41 + 24;
              }
              *(_QWORD *)(v7 + 144) = v52;
            }
            else
            {
              v43 = HIBYTE(v94);
              if (SHIBYTE(v94) < 0)
                v43 = *((_QWORD *)&v93 + 1);
              if (v43 == 2)
              {
                v51 = (char *)&v93;
                if (SHIBYTE(v94) < 0)
                  v51 = (char *)v93;
                std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, *v51, v51[1]);
              }
              else
              {
                if (v43 != 1)
                  std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
                v44 = (char *)&v93;
                if (SHIBYTE(v94) < 0)
                  v44 = (char *)v93;
                std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, *v44);
              }
            }
            if (SHIBYTE(v92) < 0)
              operator delete(__s[0]);
            if (SHIBYTE(v94) < 0)
              operator delete((void *)v93);
            v25 = 0;
LABEL_148:
            v5 = (uint64_t)(v15 + 2);
            v36 = v8;
            goto LABEL_149;
          default:
            v11 = 0;
            v12 = 0;
            v9 = (char *)v5;
            break;
        }
      }
      v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
      if ((char)v12 >= 0)
        v11 = v12;
      if (!v11)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
        {
          v17 = *v9;
          if (v17 == 92)
          {
            v18 = v9 + 1;
            if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0)
              v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v18, a3, (uint64_t *)__p);
            else
              v19 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v18, (unsigned __int8 *)a3, (uint64_t)__p, v7);
            v9 = v19;
            goto LABEL_81;
          }
        }
        else
        {
          LOBYTE(v17) = *v9;
        }
        if ((char)v12 < 0)
        {
          v28 = (void **)__p[0];
          __p[1] = (void *)1;
        }
        else
        {
          HIBYTE(v90) = 1;
          v28 = __p;
        }
        *(_BYTE *)v28 = v17;
        *((_BYTE *)v28 + 1) = 0;
        ++v9;
      }
LABEL_81:
      if (v9 != a3)
      {
        v33 = *v9;
        if (v33 != 93)
        {
          v35 = v9 + 1;
          if (v9 + 1 != a3 && v33 == 45 && *v35 != 93)
          {
            v87[0] = 0;
            v87[1] = 0;
            v88 = 0;
            v36 = v9 + 2;
            if (v9 + 2 != a3 && *v35 == 91 && *v36 == 46)
            {
              v37 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v9 + 3, a3, (uint64_t)v87);
              goto LABEL_156;
            }
            if ((v5 | 0x40) == 0x40)
            {
              LODWORD(v35) = *v35;
              if ((_DWORD)v35 == 92)
              {
                if ((_DWORD)v5)
                  v37 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v9 + 2, a3, (uint64_t *)v87);
                else
                  v37 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v9 + 2, (unsigned __int8 *)a3, (uint64_t)v87, v7);
LABEL_156:
                v36 = v37;
LABEL_157:
                *(_OWORD *)v85 = *(_OWORD *)__p;
                v86 = v90;
                __p[1] = 0;
                v90 = 0;
                *(_OWORD *)v83 = *(_OWORD *)v87;
                v84 = v88;
                v87[0] = 0;
                v87[1] = 0;
                v88 = 0;
                __p[0] = 0;
                if (*(_BYTE *)(v7 + 170))
                {
                  if (*(_BYTE *)(v7 + 169))
                  {
                    for (k = 0; ; ++k)
                    {
                      if (SHIBYTE(v86) < 0)
                      {
                        if (k >= v85[1])
                        {
LABEL_169:
                          for (m = 0; ; ++m)
                          {
                            if (SHIBYTE(v84) < 0)
                            {
                              if (m >= v83[1])
                                goto LABEL_215;
                              v60 = (void **)v83[0];
                            }
                            else
                            {
                              if ((unint64_t)m >= HIBYTE(v84))
                                goto LABEL_215;
                              v60 = v83;
                            }
                            v61 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), m[(_QWORD)v60]);
                            if (v84 >= 0)
                              v62 = v83;
                            else
                              v62 = (void **)v83[0];
                            m[(_QWORD)v62] = v61;
                          }
                        }
                        v56 = (void **)v85[0];
                      }
                      else
                      {
                        if ((unint64_t)k >= HIBYTE(v86))
                          goto LABEL_169;
                        v56 = v85;
                      }
                      v57 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), k[(_QWORD)v56]);
                      if (SHIBYTE(v86) >= 0)
                        v58 = v85;
                      else
                        v58 = (void **)v85[0];
                      k[(_QWORD)v58] = v57;
                    }
                  }
                  v72 = 0;
                  if ((HIBYTE(v86) & 0x80) != 0)
                    goto LABEL_206;
                  while ((unint64_t)v72 < HIBYTE(v86))
                  {
                    while (1)
                    {
                      ++v72;
                      if ((HIBYTE(v86) & 0x80) == 0)
                        break;
LABEL_206:
                      if (v72 >= v85[1])
                        goto LABEL_209;
                    }
                  }
LABEL_209:
                  v73 = 0;
                  if (v84 < 0)
                    goto LABEL_212;
                  while ((unint64_t)v73 < HIBYTE(v84))
                  {
                    while (1)
                    {
                      ++v73;
                      if ((v84 & 0x8000000000000000) == 0)
                        break;
LABEL_212:
                      if (v73 >= v83[1])
                        goto LABEL_215;
                    }
                  }
LABEL_215:
                  v74 = (char *)HIBYTE(v86);
                  if (SHIBYTE(v86) >= 0)
                    v75 = (char *)v85;
                  else
                    v75 = (char *)v85[0];
                  if (SHIBYTE(v86) < 0)
                    v74 = (char *)v85[1];
                  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)&v93, v80, v75, &v74[(_QWORD)v75]);
                  v76 = (char *)HIBYTE(v84);
                  if (v84 >= 0)
                    v77 = (char *)v83;
                  else
                    v77 = (char *)v83[0];
                  if (v84 < 0)
                    v76 = (char *)v83[1];
                  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)__s, v80, v77, &v76[(_QWORD)v77]);
                  *(_OWORD *)&__v.__first_ = v93;
                  __v.__end_ = v94;
                  v94 = 0;
                  v93 = 0uLL;
                  __v.__end_cap_ = *(std::__compressed_pair<std::string *> *)__s;
                  v96 = v92;
                  __s[0] = 0;
                  __s[1] = 0;
                  v92 = 0;
                  std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v79, (__int128 *)&__v);
                  if (SHIBYTE(v96) < 0)
                    operator delete(__v.__end_cap_.__value_);
                  if (SHIBYTE(__v.__end_) < 0)
                    operator delete(__v.__first_);
                  if (SHIBYTE(v92) < 0)
                    operator delete(__s[0]);
                  if (SHIBYTE(v94) < 0)
                  {
                    v71 = (std::__split_buffer<std::string>::pointer)v93;
LABEL_233:
                    operator delete(v71);
                  }
                }
                else
                {
                  v63 = (void *)HIBYTE(v86);
                  if (SHIBYTE(v86) < 0)
                    v63 = v85[1];
                  if (v63 != (void *)1)
                    goto LABEL_252;
                  v64 = (void *)HIBYTE(v84);
                  if (v84 < 0)
                    v64 = v83[1];
                  if (v64 != (void *)1)
LABEL_252:
                    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
                  if (*(_BYTE *)(v7 + 169))
                  {
                    if (SHIBYTE(v86) >= 0)
                      v65 = v85;
                    else
                      v65 = (void **)v85[0];
                    v66 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)v65);
                    if (SHIBYTE(v86) >= 0)
                      v67 = v85;
                    else
                      v67 = (void **)v85[0];
                    *(_BYTE *)v67 = v66;
                    if (v84 >= 0)
                      v68 = v83;
                    else
                      v68 = (void **)v83[0];
                    v69 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)v68);
                    if (v84 >= 0)
                      v70 = v83;
                    else
                      v70 = (void **)v83[0];
                    *(_BYTE *)v70 = v69;
                  }
                  *(_OWORD *)&__v.__first_ = *(_OWORD *)v85;
                  __v.__end_ = v86;
                  v85[0] = 0;
                  v85[1] = 0;
                  v86 = 0;
                  __v.__end_cap_ = *(std::__compressed_pair<std::string *> *)v83;
                  v96 = v84;
                  v83[0] = 0;
                  v83[1] = 0;
                  v84 = 0;
                  std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v79, (__int128 *)&__v);
                  if (SHIBYTE(v96) < 0)
                    operator delete(__v.__end_cap_.__value_);
                  if (SHIBYTE(__v.__end_) < 0)
                  {
                    v71 = __v.__first_;
                    goto LABEL_233;
                  }
                }
                if (SHIBYTE(v84) < 0)
                  operator delete(v83[0]);
                if (SHIBYTE(v86) < 0)
                  operator delete(v85[0]);
                if (SHIBYTE(v88) < 0)
                  operator delete(v87[0]);
                v25 = 1;
LABEL_149:
                if (SHIBYTE(v90) < 0)
                  operator delete(__p[0]);
                v9 = v36;
                if ((v25 & 1) == 0)
                  goto LABEL_153;
                goto LABEL_152;
              }
            }
            else
            {
              LOBYTE(v35) = *v35;
            }
            HIBYTE(v88) = 1;
            LOWORD(v87[0]) = v35;
            goto LABEL_157;
          }
        }
      }
      if (SHIBYTE(v90) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            v34 = (void **)__p[0];
LABEL_90:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, *(char *)v34);
LABEL_101:
            v25 = 1;
            v36 = v9;
            goto LABEL_149;
          }
          v34 = (void **)__p[0];
LABEL_100:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, *(char *)v34, *((char *)v34 + 1));
          goto LABEL_101;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v90))
      {
        v34 = __p;
        if (HIBYTE(v90) == 1)
          goto LABEL_90;
        goto LABEL_100;
      }
LABEL_152:
      v5 = (uint64_t)v9;
LABEL_153:
      if ((char *)v5 == v8)
      {
        if (v8 != a3)
        {
          if (*v8 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, 45);
            ++v8;
          }
          if (v8 != a3 && *v8 == 93)
            return v8 + 1;
        }
LABEL_249:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
  }
  return a2;
}

void sub_237BB9348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  *(_QWORD *)(v46 + 144) = v47;
  if (a46 < 0)
    operator delete(__p);
  if (*(char *)(v48 - 145) < 0)
    operator delete(*(void **)(v48 - 168));
  if (a40 < 0)
    operator delete(a35);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BB94B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  uint64_t v4;
  std::__node<char> *first;
  unsigned int flags_low;
  char v7;
  int v8;
  std::string::size_type size;
  std::string *v10;
  BOOL v11;
  std::locale v13;
  std::string v14;

  v4 = operator new();
  first = this->__end_->__first_;
  flags_low = LOBYTE(this->__flags_);
  v7 = flags_low & 1;
  v8 = (flags_low >> 3) & 1;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_BYTE *)(v4 + 168) = __negate;
  *(_BYTE *)(v4 + 169) = v7;
  *(_BYTE *)(v4 + 170) = v8;
  std::locale::locale(&v13, (const std::locale *)(v4 + 16));
  std::locale::name(&v14, &v13);
  size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v14.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v10 = (std::string *)v14.__r_.__value_.__r.__words[0];
    if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &v14;
    v11 = v10->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v11 = 1;
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v14.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v13);
  *(_BYTE *)(v4 + 171) = v11;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)v4;
  return (std::__bracket_expression<char, std::regex_traits<char>> *)v4;
}

void sub_237BB9614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  void (__cdecl ***v10)(std::__owns_one_state<char> *__hidden);
  std::locale *v11;
  void **v12;
  void (__cdecl **v14)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v15)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v16)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v17)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v14 = v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v15 = v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))*v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  v17 = v10[1];
  if (v17)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v17 + 1))(v17);
  MEMORY[0x23B820F34](v10, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  _BYTE *v21;
  char v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  _BYTE *v28;
  char v29;
  _BYTE *v30;
  char v31;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = &v5[-v6];
      v8 = (uint64_t)&v5[-v6 + 1];
      if (v8 >= 0)
      {
        v9 = v4 - v6;
        if (2 * v9 > v8)
          v8 = 2 * v9;
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = v8;
        if (v10)
          v11 = operator new(v10);
        else
          v11 = 0;
        v19 = &v7[(_QWORD)v11];
        v20 = (char *)v11 + v10;
        v7[(_QWORD)v11] = v2;
        v18 = (uint64_t)&v7[(_QWORD)v11 + 1];
        if (v5 != (_BYTE *)v6)
        {
          v21 = &v5[~v6];
          do
          {
            v22 = *--v5;
            (v21--)[(_QWORD)v11] = v22;
          }
          while (v5 != (_BYTE *)v6);
LABEL_45:
          v5 = *(_BYTE **)(a1 + 40);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v5 = *(_BYTE **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v12)
    {
      v23 = *(_QWORD *)(a1 + 40);
      v24 = &v5[-v23];
      v25 = (uint64_t)&v5[-v23 + 1];
      if (v25 >= 0)
      {
        v26 = v12 - v23;
        if (2 * v26 > v25)
          v25 = 2 * v26;
        if (v26 >= 0x3FFFFFFFFFFFFFFFLL)
          v27 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
          v11 = operator new(v27);
        else
          v11 = 0;
        v19 = &v24[(_QWORD)v11];
        v20 = (char *)v11 + v27;
        v24[(_QWORD)v11] = v2;
        v18 = (uint64_t)&v24[(_QWORD)v11 + 1];
        if (v5 != (_BYTE *)v23)
        {
          v30 = &v5[~v23];
          do
          {
            v31 = *--v5;
            (v30--)[(_QWORD)v11] = v31;
          }
          while (v5 != (_BYTE *)v23);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v18 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v12)
    goto LABEL_22;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = &v5[-v13];
  v15 = (uint64_t)&v5[-v13 + 1];
  if (v15 < 0)
    goto LABEL_50;
  v16 = v12 - v13;
  if (2 * v16 > v15)
    v15 = 2 * v16;
  if (v16 >= 0x3FFFFFFFFFFFFFFFLL)
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v17 = v15;
  if (v17)
    v11 = operator new(v17);
  else
    v11 = 0;
  v19 = &v14[(_QWORD)v11];
  v20 = (char *)v11 + v17;
  v14[(_QWORD)v11] = v2;
  v18 = (uint64_t)&v14[(_QWORD)v11 + 1];
  if (v5 != (_BYTE *)v13)
  {
    v28 = &v5[~v13];
    do
    {
      v29 = *--v5;
      (v28--)[(_QWORD)v11] = v29;
    }
    while (v5 != (_BYTE *)v13);
    goto LABEL_45;
  }
LABEL_46:
  v11 = v19;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v20;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v18;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; ; ++i)
  {
    v6 = &a2[i];
    if (a2[i] == 46 && v6[1] == 93)
      break;
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (v6 == a3)
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)&v10, a1, a2, &a2[i]);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return v6 + 2;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v7;
  int v8;
  int v9;
  char v10;
  char v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  size_t v22;
  void *v23;
  unint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  uint64_t v30;
  char *v31;
  _BYTE *v32;
  char v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  unint64_t v37;
  size_t v38;
  char *v39;
  char *v40;
  _BYTE *v41;
  char v42;
  _BYTE *v43;
  char v44;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v7 = (char)*a2;
  if (v7 <= 97)
  {
    if (v7 <= 82)
    {
      if (!*a2)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 1) = 0;
        return a2 + 1;
      }
      if (v7 == 68)
      {
        v8 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_24:
        *(_DWORD *)(a5 + 164) = v8;
        return a2 + 1;
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
    }
    if (v7 == 83)
    {
      v8 = *(_DWORD *)(a5 + 164) | 0x4000;
      goto LABEL_24;
    }
    if (v7 != 87)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
    *(_DWORD *)(a5 + 164) |= 0x500u;
    if (*(_BYTE *)(a5 + 169))
    {
      v10 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a5 + 24) + 40))(*(_QWORD *)(a5 + 24), 95);
      v11 = v10;
      v13 = *(_BYTE **)(a5 + 72);
      v12 = *(_QWORD *)(a5 + 80);
      if ((unint64_t)v13 < v12)
      {
        *v13 = v10;
        v14 = (uint64_t)(v13 + 1);
LABEL_60:
        *(_QWORD *)(a5 + 72) = v14;
        return a2 + 1;
      }
      v24 = *(_QWORD *)(a5 + 64);
      v25 = &v13[-v24];
      v26 = (uint64_t)&v13[-v24 + 1];
      if (v26 >= 0)
      {
        v27 = v12 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v29 = operator new(v28);
        else
          v29 = 0;
        v31 = &v29[v28];
        v25[(_QWORD)v29] = v11;
        v14 = (uint64_t)&v25[(_QWORD)v29 + 1];
        if (v13 == (_BYTE *)v24)
        {
          v29 = &v25[(_QWORD)v29];
        }
        else
        {
          v32 = &v13[~v24];
          do
          {
            v33 = *--v13;
            (v32--)[(_QWORD)v29] = v33;
          }
          while (v13 != (_BYTE *)v24);
          v13 = *(_BYTE **)(a5 + 64);
        }
        *(_QWORD *)(a5 + 64) = v29;
        *(_QWORD *)(a5 + 72) = v14;
        *(_QWORD *)(a5 + 80) = v31;
        if (v13)
          operator delete(v13);
        goto LABEL_60;
      }
LABEL_85:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    v17 = *(_BYTE **)(a5 + 72);
    v16 = *(_QWORD *)(a5 + 80);
    if (*(_BYTE *)(a5 + 170))
    {
      if ((unint64_t)v17 >= v16)
      {
        v18 = *(_QWORD *)(a5 + 64);
        v19 = &v17[-v18];
        v20 = (uint64_t)&v17[-v18 + 1];
        if (v20 < 0)
          goto LABEL_85;
        v21 = v16 - v18;
        if (2 * v21 > v20)
          v20 = 2 * v21;
        if (v21 >= 0x3FFFFFFFFFFFFFFFLL)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v22 = v20;
        if (v22)
          v23 = operator new(v22);
        else
          v23 = 0;
        v39 = &v19[(_QWORD)v23];
        v40 = (char *)v23 + v22;
        v19[(_QWORD)v23] = 95;
        v30 = (uint64_t)&v19[(_QWORD)v23 + 1];
        if (v17 != (_BYTE *)v18)
        {
          v41 = &v17[~v18];
          do
          {
            v42 = *--v17;
            (v41--)[(_QWORD)v23] = v42;
          }
          while (v17 != (_BYTE *)v18);
LABEL_78:
          v17 = *(_BYTE **)(a5 + 64);
          goto LABEL_80;
        }
        goto LABEL_79;
      }
    }
    else if ((unint64_t)v17 >= v16)
    {
      v34 = *(_QWORD *)(a5 + 64);
      v35 = &v17[-v34];
      v36 = (uint64_t)&v17[-v34 + 1];
      if (v36 < 0)
        goto LABEL_85;
      v37 = v16 - v34;
      if (2 * v37 > v36)
        v36 = 2 * v37;
      if (v37 >= 0x3FFFFFFFFFFFFFFFLL)
        v38 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v38 = v36;
      if (v38)
        v23 = operator new(v38);
      else
        v23 = 0;
      v39 = &v35[(_QWORD)v23];
      v40 = (char *)v23 + v38;
      v35[(_QWORD)v23] = 95;
      v30 = (uint64_t)&v35[(_QWORD)v23 + 1];
      if (v17 != (_BYTE *)v34)
      {
        v43 = &v17[~v34];
        do
        {
          v44 = *--v17;
          (v43--)[(_QWORD)v23] = v44;
        }
        while (v17 != (_BYTE *)v34);
        goto LABEL_78;
      }
LABEL_79:
      v23 = v39;
LABEL_80:
      *(_QWORD *)(a5 + 64) = v23;
      *(_QWORD *)(a5 + 72) = v30;
      *(_QWORD *)(a5 + 80) = v40;
      if (v17)
        operator delete(v17);
      goto LABEL_82;
    }
    *v17 = 95;
    v30 = (uint64_t)(v17 + 1);
LABEL_82:
    *(_QWORD *)(a5 + 72) = v30;
    return a2 + 1;
  }
  if (v7 <= 114)
  {
    if (v7 == 98)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      return a2 + 1;
    }
    if (v7 != 100)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
    v9 = *(_DWORD *)(a5 + 160) | 0x400;
LABEL_26:
    *(_DWORD *)(a5 + 160) = v9;
    return a2 + 1;
  }
  if (v7 == 115)
  {
    v9 = *(_DWORD *)(a5 + 160) | 0x4000;
    goto LABEL_26;
  }
  if (v7 != 119)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
  *(_DWORD *)(a5 + 160) |= 0x500u;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
  return a2 + 1;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, uint64_t *a4)
{
  int v5;
  std::basic_regex<char>::value_type v6;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type v8;
  char *v9;
  char v10;
  int v11;
  std::basic_regex<char>::value_type v12;
  __int16 v13;

  if (a2 == a3)
LABEL_80:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  v6 = *a2;
  if (v5 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
        {
          v7 = 10;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 10;
        goto LABEL_77;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
        {
          v7 = 13;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 13;
        goto LABEL_77;
      case 't':
        if (!a4)
        {
          v7 = 9;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 9;
        goto LABEL_77;
      case 'v':
        if (!a4)
        {
          v7 = 11;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 11;
        goto LABEL_77;
      default:
        if (v5 == 98)
        {
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            v13 = 8;
            goto LABEL_77;
          }
          v7 = 8;
        }
        else
        {
          if (v5 != 102)
            goto LABEL_25;
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            v13 = 12;
            goto LABEL_77;
          }
          v7 = 12;
        }
        break;
    }
LABEL_62:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
    return a2 + 1;
  }
  if (v5 > 91)
  {
    if (v5 == 92)
    {
LABEL_16:
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v6;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      v7 = *a2;
      goto LABEL_62;
    }
    if (v5 != 97)
      goto LABEL_25;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      v13 = 7;
LABEL_77:
      *(_WORD *)a4 = v13;
      return a2 + 1;
    }
    v7 = 7;
    goto LABEL_62;
  }
  if (v5 == 34 || v5 == 47)
    goto LABEL_16;
LABEL_25:
  if ((v6 & 0xF8) != 0x30)
    goto LABEL_80;
  v8 = v5 - 48;
  v9 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v9 & 0xF8) != 0x30)
      goto LABEL_49;
    v8 = *v9 + 8 * v8 - 48;
    if (a2 + 2 != a3)
    {
      v10 = a2[2];
      v11 = v10 & 0xF8;
      v12 = v10 + 8 * v8 - 48;
      if (v11 == 48)
        v9 = a2 + 3;
      else
        v9 = a2 + 2;
      if (v11 == 48)
        v8 = v12;
      goto LABEL_49;
    }
  }
  v9 = a3;
LABEL_49:
  if (a4)
  {
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    *(_BYTE *)a4 = v8;
    *((_BYTE *)a4 + 1) = 0;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
  }
  return v9;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _WORD *v24;
  _WORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;

  if (!*(_BYTE *)(a1 + 169))
  {
    v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v8 = *(_WORD **)(a1 + 120);
    v16 = *(_QWORD *)(a1 + 128);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v17 = *(_QWORD *)(a1 + 112);
      v18 = (uint64_t)v8 - v17;
      if ((uint64_t)v8 - v17 > -3)
      {
        v19 = v18 >> 1;
        v20 = v16 - v17;
        if (v20 <= (v18 >> 1) + 1)
          v21 = v19 + 1;
        else
          v21 = v20;
        if (v20 >= 0x7FFFFFFFFFFFFFFELL)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
          v22 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v22);
        else
          v23 = 0;
        v25 = (_WORD *)(v22 + 2 * v19);
        v26 = v22 + 2 * v23;
        *v25 = v6;
        v24 = v25 + 1;
        v37 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v37)
          goto LABEL_46;
        do
        {
          v38 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v38;
        }
        while (v27 != v37);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v30 = *(_QWORD *)(a1 + 112);
      v31 = (uint64_t)v8 - v30;
      if ((uint64_t)v8 - v30 > -3)
      {
        v32 = v31 >> 1;
        v33 = v16 - v30;
        if (v33 <= (v31 >> 1) + 1)
          v34 = v32 + 1;
        else
          v34 = v33;
        if (v33 >= 0x7FFFFFFFFFFFFFFELL)
          v35 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v35 = v34;
        if (v35)
          v35 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v35);
        else
          v36 = 0;
        v25 = (_WORD *)(v35 + 2 * v32);
        v26 = v35 + 2 * v36;
        *v25 = v6;
        v24 = v25 + 1;
        v39 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v39)
          goto LABEL_46;
        do
        {
          v40 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v40;
        }
        while (v27 != v39);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
  v8 = *(_WORD **)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
LABEL_24:
    *v8 = v6;
    v24 = v8 + 1;
    goto LABEL_48;
  }
  v9 = *(_QWORD *)(a1 + 112);
  v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 - v9 <= -3)
    goto LABEL_49;
  v11 = v10 >> 1;
  v12 = v7 - v9;
  if (v12 <= (v10 >> 1) + 1)
    v13 = v11 + 1;
  else
    v13 = v12;
  if (v12 >= 0x7FFFFFFFFFFFFFFELL)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = v13;
  if (v14)
    v14 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v14);
  else
    v15 = 0;
  v25 = (_WORD *)(v14 + 2 * v11);
  v26 = v14 + 2 * v15;
  *v25 = v6;
  v24 = v25 + 1;
  v28 = *(char **)(a1 + 112);
  v27 = *(char **)(a1 + 120);
  if (v27 == v28)
    goto LABEL_46;
  do
  {
    v29 = *((_WORD *)v27 - 1);
    v27 -= 2;
    *--v25 = v29;
  }
  while (v27 != v28);
LABEL_45:
  v27 = *(char **)(a1 + 112);
LABEL_46:
  *(_QWORD *)(a1 + 112) = v25;
  *(_QWORD *)(a1 + 120) = v24;
  *(_QWORD *)(a1 + 128) = v26;
  if (v27)
    operator delete(v27);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v24;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_237BBA2FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](char **a1, __int128 *a2)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  unint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  int64x2_t v21;
  void *v22;
  uint64_t v23;

  v4 = (unint64_t)a1[1];
  v5 = (unint64_t)a1[2];
  if (v4 >= v5)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (_QWORD)*a1) >> 4);
    v10 = v9 + 1;
    if (v9 + 1 > 0x555555555555555)
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x2AAAAAAAAAAAAAALL)
      v12 = 0x555555555555555;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 > 0x555555555555555)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = (char *)operator new(48 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[48 * v9];
    *(_OWORD *)v14 = *a2;
    *((_QWORD *)v14 + 2) = *((_QWORD *)a2 + 2);
    v15 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)a2 + 2) = 0;
    *((_QWORD *)a2 + 3) = 0;
    *(_QWORD *)a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    *(_OWORD *)(v14 + 24) = v15;
    *((_QWORD *)v14 + 5) = *((_QWORD *)a2 + 5);
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    v17 = *a1;
    v16 = (unint64_t)a1[1];
    if ((char *)v16 == *a1)
    {
      v21 = vdupq_n_s64(v16);
      v18 = &v13[48 * v9];
    }
    else
    {
      v18 = &v13[48 * v9];
      do
      {
        v19 = *(_OWORD *)(v16 - 48);
        *((_QWORD *)v18 - 4) = *(_QWORD *)(v16 - 32);
        *((_OWORD *)v18 - 3) = v19;
        *(_QWORD *)(v16 - 40) = 0;
        *(_QWORD *)(v16 - 32) = 0;
        *(_QWORD *)(v16 - 48) = 0;
        v20 = *(_OWORD *)(v16 - 24);
        *((_QWORD *)v18 - 1) = *(_QWORD *)(v16 - 8);
        *(_OWORD *)(v18 - 24) = v20;
        v18 -= 48;
        *(_QWORD *)(v16 - 16) = 0;
        *(_QWORD *)(v16 - 8) = 0;
        *(_QWORD *)(v16 - 24) = 0;
        v16 -= 48;
      }
      while ((char *)v16 != v17);
      v21 = *(int64x2_t *)a1;
    }
    v8 = v14 + 48;
    *a1 = v18;
    a1[1] = v14 + 48;
    a1[2] = &v13[48 * v12];
    v23 = v21.i64[1];
    v22 = (void *)v21.i64[0];
    while ((void *)v23 != v22)
    {
      v23 -= 48;
      std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v23);
    }
    if (v22)
      operator delete(v22);
  }
  else
  {
    v6 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v6;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v7 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v4 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v4 + 24) = v7;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v8 = (char *)(v4 + 48);
  }
  a1[1] = v8;
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBA554(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBA5E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  uint64_t v8;
  std::__node<char> *first;
  std::__node<char> *v10;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = operator new();
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &off_2509A27D8;
    *(_QWORD *)(v8 + 8) = first;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = operator new();
    v10 = this->__end_->__first_;
    *(_QWORD *)v8 = &off_2509A2820;
    *(_QWORD *)(v8 + 8) = v10;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = v2;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &off_2509A2868;
  *(_QWORD *)(v5 + 8) = v7;
  *(_BYTE *)(v5 + 16) = v2;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_237BBA720(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  MEMORY[0x23B820F34](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A2820;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A2820;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A27D8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A27D8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  int v7;
  int v8;
  unsigned __int8 v9;
  char v10;
  unsigned __int8 v11;
  char v12;
  std::basic_regex<char>::value_type v13;
  unsigned __int8 v14;
  std::basic_regex<char>::value_type v15;
  __int16 v16;

  v4 = a2;
  if (a2 != a3)
  {
    v5 = *a2;
    v6 = v5;
    if ((char)v5 > 109)
    {
      switch((char)v5)
      {
        case 'n':
          if (!a4)
          {
            v6 = 10;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v16 = 10;
          goto LABEL_79;
        case 'r':
          if (!a4)
          {
            v6 = 13;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v16 = 13;
          goto LABEL_79;
        case 't':
          if (!a4)
          {
            v6 = 9;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v16 = 9;
          goto LABEL_79;
        case 'u':
          if (v4 + 1 != a3)
          {
            v7 = v4[1];
            if ((v7 & 0xF8) == 0x30 || (v7 & 0xFE) == 0x38 || (v7 | 0x20u) - 97 < 6)
            {
              v4 += 2;
              if (v4 != a3)
              {
                v8 = *v4;
                if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38 || (v8 | 0x20u) - 97 < 6)
                  goto LABEL_27;
              }
            }
          }
          goto LABEL_89;
        case 'v':
          if (!a4)
          {
            v6 = 11;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v16 = 11;
          break;
        case 'x':
LABEL_27:
          if (v4 + 1 == a3)
            goto LABEL_89;
          v9 = v4[1];
          v10 = -48;
          if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38)
            goto LABEL_32;
          v9 |= 0x20u;
          if ((v9 - 97) >= 6u)
            goto LABEL_89;
          v10 = -87;
LABEL_32:
          if (v4 + 2 == a3)
            goto LABEL_89;
          v11 = v4[2];
          v12 = -48;
          if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38)
            goto LABEL_37;
          v11 |= 0x20u;
          if ((v11 - 97) >= 6u)
            goto LABEL_89;
          v12 = -87;
LABEL_37:
          v13 = v12 + v11 + 16 * (v10 + v9);
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            *(_BYTE *)a4 = v13;
            *((_BYTE *)a4 + 1) = 0;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v13);
          }
          v4 += 3;
          return v4;
        default:
          goto LABEL_51;
      }
      goto LABEL_79;
    }
    if ((char)v5 == 48)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return ++v4;
      }
      v6 = 0;
      goto LABEL_67;
    }
    if ((char)v5 != 99)
    {
      if ((char)v5 == 102)
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v16 = 12;
LABEL_79:
          *(_WORD *)a4 = v16;
          return ++v4;
        }
        v6 = 12;
LABEL_67:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return ++v4;
      }
LABEL_51:
      if ((char)v5 != 95 && ((char)v5 < 0 || (a1->__traits_.__ct_->__tab_[v5] & 0x500) == 0))
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          *(_BYTE *)a4 = v5;
          *((_BYTE *)a4 + 1) = 0;
          return ++v4;
        }
        goto LABEL_67;
      }
LABEL_89:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if (v4 + 1 == a3)
      goto LABEL_89;
    v14 = v4[1];
    if (((v14 & 0xDF) - 65) > 0x19u)
      goto LABEL_89;
    v15 = v14 & 0x1F;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v15;
      *((_BYTE *)a4 + 1) = 0;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v15);
    }
    v4 += 2;
  }
  return v4;
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__s, a3, a4, a4 - a3);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a1 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v13, *(_QWORD *)(a2 + 16), v10, (char *)v10 + size);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  *(std::string *)a1 = v13;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a1 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a1 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a1, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_237BBAF84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBAFF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBB03C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v6;

  v6 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v6 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  JUMPOUT(0x23B820F34);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char *current;
  char *last;
  char v6;
  char v7;
  uint64_t v8;
  _BOOL4 negate;
  std::string::size_type size;
  int v11;
  std::string::size_type v12;
  std::string *p_s;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v15;
  uint64_t v16;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  std::string::size_type v24;
  unsigned __int8 v25;
  std::vector<char>::pointer v26;
  unint64_t v27;
  int v28;
  std::regex_traits<char>::char_class_type v29;
  int v30;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v32;
  char *v33;
  std::vector<std::pair<std::string, std::string>>::pointer v34;
  std::vector<std::pair<std::string, std::string>>::pointer v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  std::vector<std::string>::pointer v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;
  __int128 v45;
  std::string::size_type v46;
  uint64_t v47;
  BOOL v48;
  std::string *v49;
  std::string::size_type v50;
  int v51;
  std::string *v52;
  std::string *v53;
  uint64_t v54;
  std::string::size_type v55;
  int v56;
  std::regex_traits<char>::char_class_type v57;
  int v58;
  std::vector<std::string>::pointer v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;
  unint64_t v63;
  __int128 v64;
  std::string::size_type v65;
  uint64_t v66;
  BOOL v67;
  std::string *v68;
  std::string::size_type v69;
  int v70;
  std::string *v71;
  std::string *v72;
  uint64_t v73;
  int v74;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v77;
  std::regex_traits<char>::char_class_type neg_mask;
  int v79;
  std::__node<char> *first;
  int v81;
  std::string *v82;
  _BOOL4 v83;
  unint64_t v84;
  uint64_t v85;
  std::string __p;
  __int16 v87;
  std::string v88;
  std::string __s;

  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v8 = 0;
    negate = this->__negate_;
    goto LABEL_172;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_36;
  v6 = *current;
  LOBYTE(v87) = *current;
  v7 = current[1];
  HIBYTE(v87) = v7;
  if (this->__icase_)
  {
    LOBYTE(v87) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(v87) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  *((_BYTE *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = v87;
  __s.__r_.__value_.__s.__data_[2] = 0;
  memset(&__p, 0, sizeof(__p));
  std::__get_collation_name(&v88, (const char *)&__s);
  __p = v88;
  size = HIBYTE(v88.__r_.__value_.__r.__words[2]);
  v11 = SHIBYTE(v88.__r_.__value_.__r.__words[2]);
  if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v88.__r_.__value_.__l.__size_;
  if (size)
    goto LABEL_11;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v12 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_11;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      goto LABEL_16;
    p_s = &__s;
  }
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, char *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v88, this->__traits_.__col_, p_s, (char *)p_s + v12);
  if (v11 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v88;
  if ((SHIBYTE(v88.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v88.__r_.__value_.__r.__words[2]) != 12 && HIBYTE(v88.__r_.__value_.__r.__words[2]) != 1)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_11;
    }
    goto LABEL_115;
  }
  if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
  {
LABEL_115:
    std::string::operator=(&__p, &__s);
    goto LABEL_11;
  }
  *__p.__r_.__value_.__l.__data_ = 0;
  __p.__r_.__value_.__l.__size_ = 0;
LABEL_11:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_16:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v24 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v24)
      goto LABEL_18;
LABEL_36:
    negate = 0;
    v8 = 1;
    goto LABEL_37;
  }
  if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
    goto LABEL_36;
LABEL_18:
  begin = this->__digraphs_.__begin_;
  v15 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v15)
  {
    v16 = v15 >> 1;
    if ((unint64_t)(v15 >> 1) <= 1)
      v16 = 1;
    p_second = &begin->second;
    while (v87 != *(p_second - 1) || HIBYTE(v87) != *p_second)
    {
      p_second += 2;
      if (!--v16)
        goto LABEL_27;
    }
    goto LABEL_169;
  }
LABEL_27:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v87, (char *)&v88);
    v19 = this->__ranges_.__begin_;
    v20 = (char *)this->__ranges_.__end_ - (char *)v19;
    if (v20)
    {
      v21 = 0;
      v22 = 0xAAAAAAAAAAAAAAABLL * (v20 >> 4);
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v19, &__s) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__s, v19->second.__r_.__value_.__r.__words) << 24) >= 0x1000000)
      {
        ++v21;
        ++v19;
        if (v21 >= v22)
          goto LABEL_34;
      }
      negate = 1;
      v23 = 5;
    }
    else
    {
LABEL_34:
      negate = 0;
      v23 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    if (negate)
      goto LABEL_147;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_151:
    if ((char)v87 < 0)
    {
      neg_mask = this->__neg_mask_;
    }
    else
    {
      mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      v77 = tab[v87];
      if (((v77 & mask) != 0 || v87 == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(v87) & 0x80000000) == 0
        && ((tab[HIBYTE(v87)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(v87) == 95))
      {
        goto LABEL_169;
      }
      neg_mask = this->__neg_mask_;
      if ((v77 & neg_mask) != 0 || v87 == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_168:
        v79 = negate;
LABEL_170:
        negate = v79;
        goto LABEL_171;
      }
    }
    if ((SHIBYTE(v87) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(v87)] & neg_mask) == 0)
      {
        v79 = 1;
        if (HIBYTE(v87) != 95 || (neg_mask & 0x80) == 0)
          goto LABEL_170;
      }
      goto LABEL_168;
    }
LABEL_169:
    v79 = 1;
    goto LABEL_170;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v87, (char *)&v88);
  v59 = this->__equivalences_.__begin_;
  v60 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v61 = (char *)this->__equivalences_.__end_ - (char *)v59;
  if (!v61)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    goto LABEL_151;
  }
  v62 = 0;
  v63 = v61 / 24;
  v64 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v65 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v65 = __s.__r_.__value_.__l.__size_;
  if (v63 <= 1)
    v66 = 1;
  else
    v66 = v61 / 24;
  v67 = 1;
  while (1)
  {
    v68 = &v59[v62];
    v69 = HIBYTE(v68->__r_.__value_.__r.__words[2]);
    v70 = (char)v69;
    if ((v69 & 0x80u) != 0)
      v69 = v68->__r_.__value_.__l.__size_;
    if (v65 != v69)
      goto LABEL_142;
    v71 = v70 >= 0 ? &v59[v62] : (std::string *)v68->__r_.__value_.__r.__words[0];
    if ((v60 & 0x80) == 0)
      break;
    v84 = v63;
    v85 = v60;
    v74 = memcmp((const void *)v64, v71, *((size_t *)&v64 + 1));
    v63 = v84;
    v60 = v85;
    if (!v74)
    {
      v23 = 5;
      negate = 1;
      goto LABEL_145;
    }
LABEL_142:
    v67 = ++v62 < v63;
    if (v62 == v66)
    {
      v23 = 0;
      goto LABEL_144;
    }
  }
  if (!(_DWORD)v60)
  {
    negate = 1;
    if (v67)
      goto LABEL_171;
    goto LABEL_151;
  }
  v72 = &__s;
  v73 = v60;
  do
  {
    if (v72->__r_.__value_.__s.__data_[0] != v71->__r_.__value_.__s.__data_[0])
      goto LABEL_142;
    v72 = (std::string *)((char *)v72 + 1);
    v71 = (std::string *)((char *)v71 + 1);
    --v73;
  }
  while (v73);
  negate = 1;
  v23 = 5;
LABEL_144:
  if ((v60 & 0x80) != 0)
LABEL_145:
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v67)
    goto LABEL_151;
LABEL_147:
  if (v23)
  {
LABEL_171:
    v8 = 2;
    goto LABEL_172;
  }
  v8 = 2;
LABEL_37:
  v25 = *a2->__current_;
  v88.__r_.__value_.__s.__data_[0] = v25;
  if (this->__icase_)
  {
    v25 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v25);
    v88.__r_.__value_.__s.__data_[0] = v25;
  }
  v26 = this->__chars_.__begin_;
  v27 = this->__chars_.__end_ - v26;
  if (v27)
  {
    if (v27 <= 1)
      v27 = 1;
    while (1)
    {
      v28 = *v26++;
      if (v28 == v25)
        break;
      if (!--v27)
        goto LABEL_44;
    }
LABEL_104:
    negate = 1;
    goto LABEL_172;
  }
LABEL_44:
  v29 = this->__neg_mask_;
  if (v29 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v25 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v25] & v29) == 0)
      v30 = (v25 == 95) & (v29 >> 7);
    else
      LOBYTE(v30) = 1;
    end = this->__neg_chars_.__end_;
    v32 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v25, end - this->__neg_chars_.__begin_);
    v33 = v32 ? v32 : end;
    if ((v30 & 1) == 0 && v33 == end)
      goto LABEL_104;
  }
  v35 = this->__ranges_.__begin_;
  v34 = this->__ranges_.__end_;
  if (v35 != v34)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v88, &v88.__r_.__value_.__s.__data_[1]);
      v35 = this->__ranges_.__begin_;
      v34 = this->__ranges_.__end_;
    }
    else
    {
      *((_BYTE *)&__s.__r_.__value_.__s + 23) = 1;
      LOWORD(__s.__r_.__value_.__l.__data_) = v25;
    }
    v36 = (char *)v34 - (char *)v35;
    if (v36)
    {
      v37 = 0;
      v38 = 0xAAAAAAAAAAAAAAABLL * (v36 >> 4);
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v35, &__s) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__s, v35->second.__r_.__value_.__r.__words) << 24) >= 0x1000000)
      {
        ++v37;
        ++v35;
        if (v37 >= v38)
          goto LABEL_65;
      }
      v39 = 1;
      negate = 1;
    }
    else
    {
LABEL_65:
      v39 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    if ((v39 & 1) != 0)
      goto LABEL_172;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_99;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v88, &v88.__r_.__value_.__s.__data_[1]);
  v40 = this->__equivalences_.__begin_;
  v41 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v42 = (char *)this->__equivalences_.__end_ - (char *)v40;
  if (!v42)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    goto LABEL_99;
  }
  v43 = 0;
  v44 = v42 / 24;
  v45 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v46 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v46 = __s.__r_.__value_.__l.__size_;
  if (v44 <= 1)
    v47 = 1;
  else
    v47 = v42 / 24;
  v48 = 1;
  while (2)
  {
    v49 = &v40[v43];
    v50 = HIBYTE(v49->__r_.__value_.__r.__words[2]);
    v51 = (char)v50;
    if ((v50 & 0x80u) != 0)
      v50 = v49->__r_.__value_.__l.__size_;
    if (v46 != v50)
    {
LABEL_92:
      v48 = ++v43 < v44;
      if (v43 == v47)
      {
LABEL_93:
        if ((v41 & 0x80) == 0)
          goto LABEL_95;
        goto LABEL_94;
      }
      continue;
    }
    break;
  }
  if (v51 >= 0)
    v52 = &v40[v43];
  else
    v52 = (std::string *)v49->__r_.__value_.__r.__words[0];
  if ((v41 & 0x80) != 0)
  {
    v83 = negate;
    v55 = v46;
    v82 = v40;
    v56 = memcmp((const void *)v45, v52, *((size_t *)&v45 + 1));
    v40 = v82;
    v46 = v55;
    negate = v83;
    if (!v56)
    {
      negate = 1;
LABEL_94:
      operator delete(__s.__r_.__value_.__l.__data_);
      goto LABEL_95;
    }
    goto LABEL_92;
  }
  if ((_DWORD)v41)
  {
    v53 = &__s;
    v54 = v41;
    while (v53->__r_.__value_.__s.__data_[0] == v52->__r_.__value_.__s.__data_[0])
    {
      v53 = (std::string *)((char *)v53 + 1);
      v52 = (std::string *)((char *)v52 + 1);
      if (!--v54)
      {
        negate = 1;
        goto LABEL_93;
      }
    }
    goto LABEL_92;
  }
  negate = 1;
LABEL_95:
  if (!v48)
  {
LABEL_99:
    if (v88.__r_.__value_.__s.__data_[0] < 0)
      goto LABEL_172;
    v57 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v88.__r_.__value_.__s.__data_[0]] & v57) == 0)
    {
      v58 = (v57 >> 7) & 1;
      if (v88.__r_.__value_.__s.__data_[0] != 95)
        v58 = 0;
      if (v58 != 1)
        goto LABEL_172;
    }
    goto LABEL_104;
  }
LABEL_172:
  if (negate == this->__negate_)
  {
    first = 0;
    v81 = -993;
  }
  else
  {
    a2->__current_ += v8;
    first = this->__first_;
    v81 = -995;
  }
  a2->__do_ = v81;
  a2->__node_ = first;
}

void sub_237BBBAA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_237BBBB6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a1 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a1;
      else
        v10 = *(_BYTE **)a1;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_237BBBC6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBBDEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  uint64_t (**v11)();

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    v11 = &off_2509A28B0;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v11;
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    v11 = &off_2509A28F8;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &off_2509A2940;
  *(_QWORD *)(v5 + 8) = v7;
  *(_DWORD *)(v5 + 16) = __i;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A28F8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A28F8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = v6;
      v10 = *(unsigned __int8 **)(a2 + 16);
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v10++;
        if (v11 != v13)
          break;
        if (!--v9)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A28B0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A28B0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  char *v3;
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  unsigned __int8 *v9;
  char *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 *v18;
  _BOOL4 v19;
  uint64_t v20;
  size_t v21;
  int v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  int v25;
  unsigned __int8 *v26;
  size_t v27;
  size_t v28;
  std::basic_regex<char> *v29;
  int v31;
  int v32;

  v3 = (char *)a2;
  if (a2 != a3)
  {
    end = a1->__end_;
    marked_count = a1->__marked_count_;
    v9 = a2 + 1;
    v8 = *a2;
    if ((a2 + 1 != a3 || v8 != 36)
      && ((v8 - 46) > 0x2E || ((1 << (v8 - 46)) & 0x600000000001) == 0))
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
      goto LABEL_29;
    }
    v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(a1, a2, a3);
    if (v11 == v3)
    {
      if (*v3 == 46)
      {
        v12 = (std::__node<char> *)operator new();
        v13 = a1->__end_;
        first = v13->__first_;
        v12->__vftable = (std::__node<char>_vtbl *)&off_2509A2BC8;
        v12[1].__vftable = (std::__node<char>_vtbl *)first;
        v13->__first_ = v12;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        goto LABEL_29;
      }
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, v3, (char *)a3);
    }
    if (v11 == v3 && v11 != (char *)a3)
    {
      if (v9 == a3 || *v3 != 92)
        return v3;
      v15 = *v9;
      if (v15 == 40)
      {
        v16 = (uint64_t)(v3 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        v17 = a1->__marked_count_;
        do
        {
          v18 = (unsigned __int8 *)v16;
          v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v16, a3);
        }
        while ((unsigned __int8 *)v16 != v18);
        if (v18 == a3 || v18 + 1 == a3 || *v18 != 92 || v18[1] != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        v11 = (char *)(v18 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v17);
      }
      else
      {
        v19 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v15);
        v20 = 2;
        if (!v19)
          v20 = 0;
        v11 = &v3[v20];
      }
    }
    v9 = (unsigned __int8 *)v11;
    if (v11 != v3)
    {
LABEL_29:
      if (v9 == a3)
        return (char *)a3;
      v21 = a1->__marked_count_ + 1;
      v22 = *v9;
      if (v22 == 42)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, end, marked_count + 1, a1->__marked_count_ + 1, 1);
        return (char *)(v9 + 1);
      }
      if (v9 + 1 == a3 || v22 != 92 || v9[1] != 123)
        return (char *)v9;
      v32 = 0;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v9 + 2, a3, &v32);
      if (v23 == v9 + 2)
LABEL_45:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
      if (v23 != a3)
      {
        v24 = v23 + 1;
        v25 = *v23;
        if (v25 == 44)
        {
          v31 = -1;
          v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v23 + 1, a3, &v31);
          if (v26 != a3 && v26 + 1 != a3 && *v26 == 92 && v26[1] == 125)
          {
            v28 = v31;
            v27 = v32;
            if (v31 == -1)
            {
              v28 = -1;
            }
            else if (v31 < v32)
            {
              goto LABEL_45;
            }
            v3 = (char *)&v26[2 * (v26[1] == 125)];
            v29 = a1;
LABEL_53:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v29, v27, v28, end, marked_count + 1, v21, 1);
            return v3;
          }
        }
        else if (v24 != a3 && v25 == 92 && *v24 == 125)
        {
          v3 = (char *)(v23 + 2);
          v27 = v32;
          v29 = a1;
          v28 = v32;
          goto LABEL_53;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v3;
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;

  v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, char *a3)
{
  int v6;
  int v7;
  char *v8;
  BOOL v9;
  char *v10;
  int v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  uint64_t (**v19)();
  unsigned __int8 *result;
  int v21;
  BOOL v22;
  unsigned int marked_count;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  int *p_open_count;
  char *v27;
  char *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  int v32;
  unsigned int v33;
  std::__node<char> *v34;
  std::__owns_one_state<char> *v35;
  std::__node<char> *v36;
  unsigned int v37;
  char *v38;
  int v39;
  int v40;
  std::basic_regex<char> *v41;
  BOOL v42;
  std::basic_regex<char> *v43;
  BOOL v44;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  int v46;
  std::__bracket_expression<char, std::regex_traits<char>> *v47;
  unsigned __int8 *v48;
  std::basic_regex<char> *v49;
  BOOL v50;
  std::basic_regex<char> v51;

  if (a2 == (unsigned __int8 *)a3)
    return a2;
  v6 = (char)*a2;
  v7 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 == (unsigned __int8 *)a3)
        goto LABEL_32;
      v21 = a2[1];
      if (v21 == 66)
      {
        v22 = 1;
      }
      else
      {
        if (v21 != 98)
          goto LABEL_31;
        v22 = 0;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v22);
      return a2 + 2;
    }
    if (v6 != 94)
      goto LABEL_32;
    v15 = operator new();
    v16 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
    v19 = &off_2509A2670;
LABEL_21:
    *(_QWORD *)v15 = v19;
    *(_QWORD *)(v15 + 8) = first;
    *(_BYTE *)(v15 + 16) = v16;
    end->__first_ = (std::__node<char> *)v15;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return a2 + 1;
  }
  if (v6 == 36)
  {
    v15 = operator new();
    v16 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
    v19 = &off_2509A26B8;
    goto LABEL_21;
  }
  v9 = v6 == 40;
  v8 = (char *)(a2 + 1);
  v9 = !v9 || v8 == a3;
  if (!v9)
  {
    v10 = (char *)(a2 + 2);
    if (*v8 == 63 && v10 != a3)
    {
      v12 = *v10;
      if (v12 == 33)
      {
        std::regex_traits<char>::regex_traits(&v51.__traits_);
        memset(&v51.__flags_, 0, 40);
        v51.__flags_ = this->__flags_;
        v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v51, a2 + 3, a3);
        marked_count = v51.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v51, 1, this->__marked_count_);
        this->__marked_count_ += marked_count;
        if (v13 == a3 || *v13 != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_30:
        std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&v51.__start_);
        std::locale::~locale(&v51.__traits_.__loc_);
        result = (unsigned __int8 *)(v13 + 1);
        if (v13 + 1 != (char *)a2)
          return result;
        goto LABEL_31;
      }
      if (v12 == 61)
      {
        std::regex_traits<char>::regex_traits(&v51.__traits_);
        memset(&v51.__flags_, 0, 40);
        v51.__flags_ = this->__flags_;
        v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v51, a2 + 3, a3);
        v14 = v51.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v51, 0, this->__marked_count_);
        this->__marked_count_ += v14;
        if (v13 == a3 || *v13 != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        goto LABEL_30;
      }
    }
LABEL_31:
    v7 = *a2;
  }
LABEL_32:
  v24 = this->__end_;
  v25 = this->__marked_count_;
  if ((char)v7 <= 91)
  {
    result = a2;
    switch((char)v7)
    {
      case '$':
      case ')':
        return result;
      case '%':
      case '&':
      case '\'':
      case ',':
      case '-':
        goto LABEL_60;
      case '(':
        if (a2 + 1 == (unsigned __int8 *)a3)
          goto LABEL_97;
        if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
        {
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
          if (v27 == a3)
            goto LABEL_97;
          v28 = v27;
          if (*v27 != 41)
            goto LABEL_97;
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
          v37 = this->__marked_count_;
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          v38 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 1, a3);
          if (v38 == a3 || (v28 = v38, *v38 != 41))
LABEL_97:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, v37);
        }
        --*p_open_count;
        v30 = (unsigned __int8 *)(v28 + 1);
        goto LABEL_57;
      case '*':
      case '+':
        goto LABEL_64;
      case '.':
        v34 = (std::__node<char> *)operator new();
        v35 = this->__end_;
        v36 = v35->__first_;
        v34->__vftable = (std::__node<char>_vtbl *)&off_2509A2790;
        v34[1].__vftable = (std::__node<char>_vtbl *)v36;
        v35->__first_ = v34;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        goto LABEL_61;
      default:
        if ((char)v7 == 91)
        {
          v30 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, a3);
          goto LABEL_57;
        }
        if ((char)v7 != 63)
          goto LABEL_60;
        goto LABEL_64;
    }
  }
  v29 = ((char)v7 - 92);
  if (v29 > 0x21)
  {
LABEL_60:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v7);
LABEL_61:
    v30 = a2 + 1;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v30, (unsigned __int8 *)a3, v24, v25 + 1, this->__marked_count_ + 1);
  }
  if (((1 << (v7 - 92)) & 0x300000006) != 0)
    return a2;
  if ((char)v7 != 92)
  {
    if (v29 == 31)
LABEL_64:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    goto LABEL_60;
  }
  if (v7 != 92)
    return a2;
  v31 = a2 + 1;
  if (a2 + 1 == (unsigned __int8 *)a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v32 = *v31;
  v33 = v32 - 48;
  if (v32 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v33);
LABEL_96:
    v30 = a2 + 2;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v30, (unsigned __int8 *)a3, v24, v25 + 1, this->__marked_count_ + 1);
  }
  if ((v32 - 49) > 8)
    goto LABEL_76;
  v30 = a2 + 2;
  if (a2 + 2 == (unsigned __int8 *)a3)
  {
    v30 = (unsigned __int8 *)a3;
  }
  else
  {
    while (1)
    {
      v39 = *v30;
      if ((v39 - 48) > 9)
        break;
      if (v33 >= 0x19999999)
        goto LABEL_98;
      ++v30;
      v33 = v39 + 10 * v33 - 48;
      if (v30 == (unsigned __int8 *)a3)
      {
        v30 = (unsigned __int8 *)a3;
        break;
      }
    }
    if (!v33)
LABEL_98:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  if (v33 > v25)
    goto LABEL_98;
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v33);
  if (v30 == v31)
  {
LABEL_76:
    v40 = (char)*v31;
    if (v40 > 99)
    {
      if (v40 == 119)
      {
        v41 = this;
        v42 = 0;
        goto LABEL_88;
      }
      if (v40 == 115)
      {
        v49 = this;
        v50 = 0;
LABEL_94:
        started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v49, v50);
        v46 = started->__mask_ | 0x4000;
        goto LABEL_95;
      }
      if (v40 != 100)
      {
LABEL_89:
        v48 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, a2 + 1, (unsigned __int8 *)a3, 0);
        if (v48 == v31)
          v30 = a2;
        else
          v30 = v48;
        goto LABEL_57;
      }
      v43 = this;
      v44 = 0;
    }
    else
    {
      if (v40 != 68)
      {
        if (v40 != 83)
        {
          if (v40 == 87)
          {
            v41 = this;
            v42 = 1;
LABEL_88:
            v47 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v41, v42);
            v47->__mask_ |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v47, 95);
            goto LABEL_96;
          }
          goto LABEL_89;
        }
        v49 = this;
        v50 = 1;
        goto LABEL_94;
      }
      v43 = this;
      v44 = 1;
    }
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v43, v44);
    v46 = started->__mask_ | 0x400;
LABEL_95:
    started->__mask_ = v46;
    goto LABEL_96;
  }
LABEL_57:
  result = a2;
  if (v30 != a2)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v30, (unsigned __int8 *)a3, v24, v25 + 1, this->__marked_count_ + 1);
  return result;
}

void sub_237BBCCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x23B820E50](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_237BBCD5C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  uint64_t v4;
  std::__node<char> *first;

  v4 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v4 = &off_2509A2700;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_BYTE *)(v4 + 40) = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  uint64_t v8;
  std::__node<char> *first;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v8 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v8 = &off_2509A2748;
  *(_QWORD *)(v8 + 8) = first;
  std::locale::locale((std::locale *)(v8 + 16), &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *(_QWORD *)(v8 + 56) = a2->__start_.__ptr_;
  *(_QWORD *)(v8 + 64) = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *(_QWORD *)(v8 + 72) = a2->__end_;
  *(_DWORD *)(v8 + 80) = a4;
  *(_BYTE *)(v8 + 84) = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2748;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_2509A2748;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x23B820F34);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  std::vector<std::csub_match>::size_type v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  char v8;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  std::sub_match<const char *> *v15;
  uint64_t v16;
  std::vector<std::csub_match> __p;
  std::vector<std::csub_match>::value_type v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  std::vector<std::csub_match>::value_type v23;
  char v24;
  uint64_t v25;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  memset(&v23, 0, 17);
  v24 = 0;
  v25 = 0;
  memset(&__p, 0, sizeof(__p));
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v5 = *(_QWORD *)(a2 + 16);
  v19.first = *(const char **)(a2 + 24);
  v19.second = v19.first;
  v19.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v19);
  v20 = v5;
  v21 = v5;
  v22 = 0;
  v23 = v19;
  v25 = v5;
  v24 = 1;
  v6 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v7 = v6 == *(const char **)(a2 + 8);
  else
    v7 = 0;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v11 = *(_DWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a2 + 32);
  v13 = 2;
  v14 = 1;
  do
  {
    v15 = &begin[v14];
    v16 = v12 + 24 * (v11 + v13 - 2);
    *(std::pair<const char *, const char *> *)v16 = v15->std::pair<const char *, const char *>;
    *(_BYTE *)(v16 + 16) = v15->matched;
    v14 = v13;
  }
  while (v10 > v13++);
LABEL_14:
  operator delete(begin);
}

void sub_237BBD18C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A2700;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2509A2700;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B820F34);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000237BC36A5
    || ((v3 & 0x8000000237BC36A5 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x8000000237BC36A5)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000237BC36A5 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x23B820F34);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__end_state<char>::~__end_state()
{
  JUMPOUT(0x23B820F34);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void util::WriteDevicesExceptionSafe(util *this)
{
  int value_low;
  std::__split_buffer<std::string>::pointer end;
  uint64_t *p_inAddress;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 v9;
  std::vector<std::string>::pointer v10;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  std::vector<std::string> v20;
  std::vector<std::string> v21;
  uint64_t inAddress;
  uint64_t inAddress_8;
  unsigned __int8 v24;
  void *v25[2];
  std::string::size_type v26;
  std::__split_buffer<std::string> __p;

  memset(&v21, 0, sizeof(v21));
  LODWORD(v25[0]) = 1;
  inAddress = 0x676C6F6272647623;
  LODWORD(inAddress_8) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, (AudioObjectID *)v25, (AudioObjectPropertyAddress *)&inAddress);
  LOBYTE(inAddress) = 0;
  value_low = LOBYTE(__p.__end_cap_.__value_);
  if (LOBYTE(__p.__end_cap_.__value_))
  {
    end = __p.__end_;
    inAddress = (uint64_t)__p.__begin_;
    p_inAddress = &inAddress;
  }
  else
  {
    end = 0;
    p_inAddress = (uint64_t *)&__p;
  }
  memset(&__p, 0, 24);
  v5 = (unsigned int *)*p_inAddress;
  p_inAddress[1] = 0;
  p_inAddress[2] = 0;
  *p_inAddress = 0;
  if (__p.__first_)
    operator delete(__p.__first_);
  if (value_low && inAddress)
    operator delete((void *)inAddress);
  memset(&v20, 0, sizeof(v20));
  if (v5 != (unsigned int *)end)
  {
    v6 = v5;
    do
    {
      v7 = *v6;
      util::WriteDevice((util *)&inAddress, *v6);
      v8 = v24;
      v9 = v24;
      if ((v24 & 0x80u) != 0)
        v8 = inAddress_8;
      if (v8)
      {
        util::WriteDevice((util *)v25, v7);
        v10 = v20.__end_;
        if (v20.__end_ >= v20.__end_cap_.__value_)
        {
          v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v20.__end_ - (char *)v20.__begin_) >> 3);
          v13 = v12 + 1;
          if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v20.__end_cap_.__value_ - (char *)v20.__begin_) >> 3) > v13)
            v13 = 0x5555555555555556 * (((char *)v20.__end_cap_.__value_ - (char *)v20.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v20.__end_cap_.__value_ - (char *)v20.__begin_) >> 3) >= 0x555555555555555)
            v14 = 0xAAAAAAAAAAAAAAALL;
          else
            v14 = v13;
          __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v20.__end_cap_;
          if (v14)
            v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v14);
          else
            v15 = 0;
          v16 = (std::string *)(v14 + 24 * v12);
          __p.__first_ = (std::__split_buffer<std::string>::pointer)v14;
          __p.__begin_ = v16;
          __p.__end_cap_.__value_ = (std::string *)(v14 + 24 * v15);
          v17 = *(_OWORD *)v25;
          v16->__r_.__value_.__r.__words[2] = v26;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          v25[1] = 0;
          v26 = 0;
          v25[0] = 0;
          __p.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v20, &__p);
          v18 = v20.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__p);
          v20.__end_ = v18;
          if (SHIBYTE(v26) < 0)
            operator delete(v25[0]);
        }
        else
        {
          v11 = *(_OWORD *)v25;
          v20.__end_->__r_.__value_.__r.__words[2] = v26;
          *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
          v20.__end_ = v10 + 1;
        }
        v9 = v24;
      }
      if ((v9 & 0x80) != 0)
        operator delete((void *)inAddress);
      ++v6;
    }
    while (v6 != (unsigned int *)end);
  }
  if (v5)
    operator delete(v5);
  v19 = *(_OWORD *)&v20.__begin_;
  v21 = v20;
  memset(&v20, 0, sizeof(v20));
  __p.__first_ = (std::__split_buffer<std::string>::pointer)&v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 1) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)this + 8, (__int128 *)v19, *((__int128 **)&v19 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v19 + 1) - v19) >> 3));
  v25[0] = &v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v25);
}

void sub_237BBD784(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **p_p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void ***__p,uint64_t a26,uint64_t a27)
{
  uint64_t v27;
  void *v28;

  if (SHIBYTE(a27) < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  __p = &p_p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v28)
    operator delete(v28);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  *(_DWORD *)v27 = 2003329396;
  *(_QWORD *)(v27 + 16) = 0;
  *(_QWORD *)(v27 + 24) = 0;
  *(_QWORD *)(v27 + 8) = 0;
  a26 = 0;
  a27 = 0;
  __p = 0;
  p_p = (void **)&__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&p_p);
  JUMPOUT(0x237BBD74CLL);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x24BDBAF40](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, outDataSize);
}

Boolean AudioObjectHasProperty(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress)
{
  return MEMORY[0x24BDBAF48](*(_QWORD *)&inObjectID, inAddress);
}

OSStatus AudioObjectIsPropertySettable(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, Boolean *outIsSettable)
{
  return MEMORY[0x24BDBAF50](*(_QWORD *)&inObjectID, inAddress, outIsSettable);
}

OSStatus AudioObjectSetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 inDataSize, const void *inData)
{
  return MEMORY[0x24BDBAF68](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, *(_QWORD *)&inDataSize, inData);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
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

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
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

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAA90](this, a2);
}

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

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_2509A21D0(__p);
}

uint64_t operator delete()
{
  return off_2509A21D8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2509A21E0(__sz);
}

uint64_t operator new()
{
  return off_2509A21E8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

