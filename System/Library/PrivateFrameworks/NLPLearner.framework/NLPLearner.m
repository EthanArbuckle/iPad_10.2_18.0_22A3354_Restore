void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_226312784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_226312904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_226312AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  uint64_t v26;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Block_object_dispose((const void *)(v26 - 80), 8);

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

void sub_226312DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22631302C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;
  void *v13;
  void *v14;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2263132C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2263133B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2263135D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  void *v14;
  uint64_t v15;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_226313774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226313804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226313ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<void *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_226313BF4(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EDB8CD0, MEMORY[0x24BEDAAF0]);
}

void sub_226313CD4(_Unwind_Exception *a1)
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

void sub_226313E38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_226313F14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226313FB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2263141C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_2263144A0(_Unwind_Exception *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  void *v14;
  va_list va;

  va_start(va, a14);

  nlp::CFScopedPtr<void *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void sub_226314654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_226315B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

void sub_226315E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_226316888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226316C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_226316E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  void *v9;
  void *v10;

  nlp::CFScopedPtr<__CFData const*>::reset(&a9, 0);
  _Unwind_Resume(a1);
}

void sub_226316FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  void *v25;
  void *v26;

  _Block_object_dispose(&a18, 8);
  if (__p)
  {
    a25 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__0(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void std::vector<unsigned int>::reserve(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *value;
  int64_t v5;
  char *v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  std::vector<unsigned int>::pointer begin;
  unsigned int *end;
  unsigned int *v12;
  unsigned int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    v7 = (unsigned int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (unsigned int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

void sub_226317480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  uint64_t v24;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v24 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_2263176B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226317910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, const void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  __cxa_free_exception(v16);
  applesauce::CF::ArrayRef::~ArrayRef(&a13);

  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_226317B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226317C14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226317F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{

}

void sub_226318134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22631825C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226318320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2263185B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void ___ZL16tokenIDForStringPK10_LXLexiconPK10__CFString_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  __CFString *v5;
  uint64_t TokenID;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = (__CFString *)LXEntryCopyString();
  TokenID = LXEntryGetTokenID();
  if (a3 && CFStringCompare(*(CFStringRef *)(a1 + 48), v5, 0) == kCFCompareEqualTo)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = TokenID;
    *a3 = 1;
    if (!v5)
      return;
    goto LABEL_8;
  }
  -[__CFString decomposedStringWithCanonicalMapping](v5, "decomposedStringWithCanonicalMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "decomposedStringWithCanonicalMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "length");
  if (v9 == objc_msgSend(v8, "length"))
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", TokenID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v5)
LABEL_8:
    CFRelease(v5);
}

void sub_226318754(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
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
      MEMORY[0x227694FA4](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_226318848(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<_LXLexicon const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFData const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void applesauce::CF::convert_to<std::vector<float>,0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeID TypeID;
  applesauce::CF *exception;

  if (!a1 || (TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  applesauce::CF::details::CFArray_get_value_to<std::vector<float>>((const __CFArray *)a1, a2);
}

void sub_226318940()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_226318958(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
  JUMPOUT(0x227694FA4);
}

void applesauce::CF::details::CFArray_get_value_to<std::vector<float>>(const __CFArray *a1@<X0>, uint64_t a2@<X8>)
{
  int Count;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  float v7;
  float v8;
  unint64_t v9;
  float *v10;
  float *v11;
  float *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  float *v18;
  int v19;

  Count = CFArrayGetCount(a1);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  std::vector<float>::reserve((void **)a2, Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, i);
      v7 = applesauce::CF::convert_to<float,0>(ValueAtIndex);
      v8 = v7;
      v10 = *(float **)(a2 + 8);
      v9 = *(_QWORD *)(a2 + 16);
      if ((unint64_t)v10 >= v9)
      {
        v12 = *(float **)a2;
        v13 = ((uint64_t)v10 - *(_QWORD *)a2) >> 2;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v15 = v9 - (_QWORD)v12;
        if (v15 >> 1 > v14)
          v14 = v15 >> 1;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
          v16 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v16);
          v12 = *(float **)a2;
          v10 = *(float **)(a2 + 8);
        }
        else
        {
          v17 = 0;
        }
        v18 = (float *)&v17[4 * v13];
        *v18 = v8;
        v11 = v18 + 1;
        while (v10 != v12)
        {
          v19 = *((_DWORD *)v10-- - 1);
          *((_DWORD *)v18-- - 1) = v19;
        }
        *(_QWORD *)a2 = v18;
        *(_QWORD *)(a2 + 8) = v11;
        *(_QWORD *)(a2 + 16) = &v17[4 * v16];
        if (v12)
          operator delete(v12);
      }
      else
      {
        *v10 = v7;
        v11 = v10 + 1;
      }
      *(_QWORD *)(a2 + 8) = v11;
    }
  }
}

void sub_226318ABC(_Unwind_Exception *exception_object)
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

void std::vector<float>::reserve(void **a1, unint64_t a2)
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
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

float applesauce::CF::convert_to<float,0>(const __CFNumber *a1)
{
  uint64_t v1;
  applesauce::CF *exception;

  v1 = applesauce::CF::convert_as<float,0>(a1);
  if ((v1 & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return *(float *)&v1;
}

void sub_226318BB0()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_226318BC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
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

id trainMLPModelForDES(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  QuickTypePFLTrainerMLP *v50;
  void *v51;
  QuickTypePFLTrainerMLP *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  float v92;
  float v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  float v98;
  float v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  _QWORD v122[2];

  v122[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  objc_msgSend(v7, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NLPLearnerUtils getAttachmentURLByName:attachments:error:](NLPLearnerUtils, "getAttachmentURLByName:attachments:error:", CFSTR("nlmodel"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "recipeUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("iCloudAggServiceKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 1);
      if (!v13)
      {
        if (a4)
        {
          v14 = (void *)MEMORY[0x24BDD1540];
          v15 = &unk_24EDBC920;
LABEL_39:
          objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 5, v15);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

          goto LABEL_83;
        }
        goto LABEL_40;
      }
    }
    else
    {
      if (objc_msgSend(v7, "pluginShouldAddNoiseAndEncryptResult"))
      {
        objc_msgSend(v7, "recipeUserInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("noEncryption"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          if (a4)
          {
            v14 = (void *)MEMORY[0x24BDD1540];
            v15 = &unk_24EDBC948;
            goto LABEL_39;
          }
LABEL_40:
          v16 = 0;
          goto LABEL_82;
        }
      }
      v13 = 0;
    }
    v19 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v7, "recipeUserInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("locales"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localeWithLocaleIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 1, &unk_24EDBC970);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_81;
    }
    v113 = a3;
    v120 = v22;
    objc_msgSend(v7, "recipeUserInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("task"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[NLPLearnerTaskWrapper taskFromRecipe:](NLPLearnerTaskWrapper, "taskFromRecipe:", v24);

    +[NLPLearnerTextData dataForPFL:andLocale:](NLPLearnerTextData, "dataForPFL:andLocale:", v25, v22);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    switch(v25)
    {
      case 1:
        v119 = v12;
        v28 = (void *)v26;
        objc_msgSend(v7, "attachments");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("emojiClasses.plist");
        break;
      case 3:
        v119 = v12;
        v116 = v13;
        objc_msgSend(v7, "attachments");
        v117 = v10;
        v33 = v8;
        v34 = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "URLByDeletingLastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v34;
        v37 = v34;
        v8 = v33;
        v10 = v117;
        objc_msgSend(v37, "addResource:", v36);

        goto LABEL_21;
      case 2:
        v119 = v12;
        v28 = (void *)v26;
        objc_msgSend(v7, "attachments");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("montrealidmap.dat");
        break;
      default:
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 6, &unk_24EDBC998);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        goto LABEL_80;
    }
    +[NLPLearnerUtils getAttachmentURLByName:attachments:error:](NLPLearnerUtils, "getAttachmentURLByName:attachments:error:", v30, v29, a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v16 = 0;
      v27 = v28;
      v12 = v119;
LABEL_80:

LABEL_81:
      goto LABEL_82;
    }
    v116 = v13;
    objc_msgSend(v31, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addResource:", v32);
LABEL_21:

    objc_msgSend(v7, "recipeUserInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", CFSTR("maxSeqLength"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "intValue");

    v41 = v40 < 1;
    v27 = v28;
    if (!v41)
    {
      objc_msgSend(v7, "recipeUserInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKey:", CFSTR("maxSeqLength"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMaxSequenceLength:", (int)objc_msgSend(v43, "intValue"));

    }
    objc_msgSend(v8, "coreDuetEvents");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "loadFromCoreDuet:limitSamplesTo:", v44, 0);

    objc_msgSend(v7, "recipeUserInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", CFSTR("numberOfEpochs"));
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    v48 = &unk_24EDBC838;
    if (v46)
      v48 = (void *)v46;
    v118 = v48;

    objc_msgSend(v7, "recipeUserInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKey:", CFSTR("noSDP"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = [QuickTypePFLTrainerMLP alloc];
    +[NLPLearnerTaskWrapper privacyIdentifierForTask:](NLPLearnerTaskWrapper, "privacyIdentifierForTask:", v25);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[QuickTypePFLTrainerMLP initWithSeedModelPath:andPrivacyIdentifier:](v50, "initWithSeedModelPath:andPrivacyIdentifier:", v10, v51);

    objc_msgSend(v7, "recipeUserInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectForKey:", CFSTR("batchSize"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v119;
    if (v54)
      -[QuickTypePFLTrainerMLP setBatchSize:](v52, "setBatchSize:", objc_msgSend(v54, "unsignedIntegerValue"));
    v115 = v54;
    objc_msgSend(v7, "recipeUserInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKey:", CFSTR("minTrainingSamples"));
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v56;
    v58 = &unk_24EDBC850;
    if (v56)
      v58 = (void *)v56;
    v59 = v58;

    v60 = objc_msgSend(v27, "numSamples");
    v114 = v59;
    if (v60 < (int)objc_msgSend(v59, "intValue")
      || (v61 = objc_msgSend(v27, "numSamples"), v61 < -[QuickTypePFLTrainerMLP batchSize](v52, "batchSize")))
    {
      v13 = v116;
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 2, &unk_24EDBC9C0);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v22 = v120;
      v62 = v114;
      goto LABEL_79;
    }
    objc_msgSend(v7, "recipeUserInfo");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKey:", CFSTR("learningRate"));
    v64 = objc_claimAutoreleasedReturnValue();

    if (v64)
      -[QuickTypePFLTrainerMLP setLearningRate:](v52, "setLearningRate:", v64);
    v110 = (void *)v64;
    objc_msgSend(v7, "recipeUserInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKey:", CFSTR("gradientClipMin"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickTypePFLTrainerMLP setGradientClipMin:](v52, "setGradientClipMin:", v66);

    objc_msgSend(v7, "recipeUserInfo");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKey:", CFSTR("gradientClipMax"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickTypePFLTrainerMLP setGradientClipMax:](v52, "setGradientClipMax:", v68);

    objc_msgSend(v7, "recipeUserInfo");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKey:", CFSTR("maxNorm"));
    v70 = objc_claimAutoreleasedReturnValue();

    if (v70)
      -[QuickTypePFLTrainerMLP setClippingNorm:](v52, "setClippingNorm:", v70);
    v109 = (void *)v70;
    objc_msgSend(v7, "recipeUserInfo");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKey:", CFSTR("normBinCount"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
      v73 = -[QuickTypePFLTrainerMLP setNormBinCount:](v52, "setNormBinCount:", objc_msgSend(v72, "unsignedIntegerValue"));
    v108 = v72;
    v74 = (void *)MEMORY[0x227695148](v73);
    v75 = -[QuickTypePFLTrainerMLP trainOn:forNEpochs:](v52, "trainOn:forNEpochs:", v27, objc_msgSend(v118, "unsignedIntegerValue"));
    objc_autoreleasePoolPop(v74);
    if (!v75)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 4, &unk_24EDBC9E8);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v13 = v116;
      v22 = v120;
      v62 = v114;
LABEL_78:

LABEL_79:
      goto LABEL_80;
    }
    v76 = v8;
    v77 = v27;
    objc_msgSend(v7, "recipeUserInfo");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectForKey:", CFSTR("storeUpdatedModel"));
    v79 = objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      v80 = (void *)v79;
      v81 = +[NLPLearnerUtils isInternalInstall](NLPLearnerUtils, "isInternalInstall");

      if (!v81)
      {
LABEL_54:
        v85 = (void *)MEMORY[0x227695148]();
        -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:](v52, "getWeightUpdatesAddNoise:encryptionKey:recipe:", v111 == 0, v116, v7);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v85);
        v112 = v86;
        if (v86)
        {
          objc_msgSend(v86, "weightUpdates");
          *v113 = (id)objc_claimAutoreleasedReturnValue();
          v121 = CFSTR("NumberOfTrainingSamples");
          v27 = v77;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v77, "numSamples"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v122[0] = v87;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v88, "mutableCopy");

          -[QuickTypePFLTrainerMLP initialLoss](v52, "initialLoss");
          v89 = objc_claimAutoreleasedReturnValue();
          if (v89)
          {
            v90 = (void *)v89;
            -[QuickTypePFLTrainerMLP initialLoss](v52, "initialLoss");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "floatValue");
            v93 = fabsf(v92);

            if (v93 != INFINITY)
            {
              -[QuickTypePFLTrainerMLP initialLoss](v52, "initialLoss");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v94, CFSTR("InitialLoss"));

            }
          }
          -[QuickTypePFLTrainerMLP trainingLoss](v52, "trainingLoss");
          v95 = objc_claimAutoreleasedReturnValue();
          v8 = v76;
          v62 = v114;
          if (v95)
          {
            v96 = (void *)v95;
            -[QuickTypePFLTrainerMLP trainingLoss](v52, "trainingLoss");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "floatValue");
            v99 = fabsf(v98);

            if (v99 != INFINITY)
            {
              -[QuickTypePFLTrainerMLP trainingLoss](v52, "trainingLoss");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v100, CFSTR("TrainingLoss"));

            }
          }
          objc_msgSend(v112, "privacyDiagnosticReport");
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v119;
          if (v101)
          {
            objc_msgSend(v112, "privacyDiagnosticReport");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v102, CFSTR("localPrivacyParameters"));

          }
          objc_msgSend(v112, "weightUpdatesDiagnosticReport");
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v116;
          if (v103)
          {
            objc_msgSend(v112, "weightUpdatesDiagnosticReport");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v104, CFSTR("$local_only.QuickTypeModelUpdate"));

          }
          if (+[NLPLearnerUtils isInternalInstall](NLPLearnerUtils, "isInternalInstall"))
          {
            objc_msgSend(v112, "l2Norm");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v105, CFSTR("L2Norm"));

            objc_msgSend(v112, "maxNorm");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v106, CFSTR("MaxNorm"));

          }
          v22 = v120;
        }
        else
        {
          v27 = v77;
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 5, &unk_24EDBCA10);
            v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
          v13 = v116;
          v8 = v76;
          v12 = v119;
          v22 = v120;
          v62 = v114;
        }

        goto LABEL_78;
      }
      v82 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v7, "recipeUserInfo");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKey:", CFSTR("storeUpdatedModel"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "URLWithString:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[QuickTypePFLTrainerMLP writeModelToURL:](v52, "writeModelToURL:", v84);

    }
    goto LABEL_54;
  }
  v16 = 0;
LABEL_83:

  return v16;
}

void sub_226319CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  nlp::CFScopedPtr<__CFArray const*>::reset(&a9, 0);
  _Unwind_Resume(a1);
}

void sub_226319F00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22631A07C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_22631A5B4(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  void *v14;
  const void *v16;
  va_list va;
  va_list va1;

  va_start(va1, a14);
  va_start(va, a14);
  v16 = va_arg(va1, const void *);
  nlp::CFScopedPtr<MLPModelTrainer *>::reset((const void **)va, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)va1, 0);

  _Unwind_Resume(a1);
}

void sub_22631AE40(_Unwind_Exception *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, ...)
{
  void *v6;
  void *v7;
  const void *v9;
  va_list va;
  const void *v11;
  va_list va1;
  va_list va2;

  va_start(va2, a6);
  va_start(va1, a6);
  va_start(va, a6);
  v9 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v11 = va_arg(va2, const void *);

  nlp::CFScopedPtr<__CFData *>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFData const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)va2, 0);

  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFData *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void sub_22631B0D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void nlp::CFScopedPtr<MLPModelTrainer *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_22631BF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id supportedMetrics()
{
  if (supportedMetrics_onceToken != -1)
    dispatch_once(&supportedMetrics_onceToken, &__block_literal_global_3);
  return (id)supportedMetrics_supportedMetrics;
}

void sub_22631D68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void __supportedMetrics_block_invoke()
{
  void *v0;

  v0 = (void *)supportedMetrics_supportedMetrics;
  supportedMetrics_supportedMetrics = (uint64_t)&unk_24EDBCA60;

}

void __overrideWordErrorCountForMetrics_block_invoke()
{
  void *v0;

  v0 = (void *)overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics;
  overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics = (uint64_t)&unk_24EDBCA78;

}

void __reporterKeysToKeep_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEB5AC8];
  v4[0] = *MEMORY[0x24BEB5AC0];
  v4[1] = v0;
  v1 = *MEMORY[0x24BEB5AD8];
  v4[2] = *MEMORY[0x24BEB5AD0];
  v4[3] = v1;
  v4[4] = *MEMORY[0x24BEB5AE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)reporterKeysToKeep_keysForCASchema;
  reporterKeysToKeep_keysForCASchema = v2;

}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x24BE1B278]();
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

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t CoreLMCopyConditionalProbabilities()
{
  return MEMORY[0x24BE1E4B0]();
}

uint64_t CoreLMCopyPredictions()
{
  return MEMORY[0x24BE1E4B8]();
}

uint64_t CoreLMCopyTokenIdsForText()
{
  return MEMORY[0x24BE1E4C0]();
}

uint64_t CoreLMCreate()
{
  return MEMORY[0x24BE1E4C8]();
}

uint64_t CoreLMGetSpecialTokenId()
{
  return MEMORY[0x24BE1E4D0]();
}

uint64_t CoreLMReset()
{
  return MEMORY[0x24BE1E4D8]();
}

uint64_t CoreLMUpdateWithContext()
{
  return MEMORY[0x24BE1E4E0]();
}

uint64_t INTypedInteractionWithInteraction()
{
  return MEMORY[0x24BDD9AF8]();
}

uint64_t LMCreateMontrealIDsFromLMTokenIDSequence()
{
  return MEMORY[0x24BE5EB08]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x24BE5EB50]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x24BE5EB58]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x24BE5EC80]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x24BE5EC88]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x24BE5EC90]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x24BE5EC98]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x24BE5ECA0]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x24BE5ECA8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x24BE5F080]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x24BE5F098]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x24BE5F0D8]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x24BE5F0F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MLPModelTrainerCreateWithModel()
{
  return MEMORY[0x24BE68EF8]();
}

uint64_t MLPModelTrainerEvaluateModel()
{
  return MEMORY[0x24BE68F00]();
}

uint64_t MLPModelTrainerTrainModel()
{
  return MEMORY[0x24BE68F30]();
}

uint64_t MRLNeuralNetworkCopyEvaluationResults()
{
  return MEMORY[0x24BE68F40]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x24BE68F48]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x24BE68F60]();
}

uint64_t MRLNeuralNetworkGetOutputDimension()
{
  return MEMORY[0x24BE68F68]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x24BE68F70]();
}

uint64_t MRLNeuralNetworkSetInput()
{
  return MEMORY[0x24BE68F78]();
}

uint64_t NLModelContainerCopySplitContainerData()
{
  return MEMORY[0x24BE1E508]();
}

uint64_t NLModelContainerCreateWithContentsOfURL()
{
  return MEMORY[0x24BE1E510]();
}

uint64_t NLModelContainerWriteToURL()
{
  return MEMORY[0x24BE1E518]();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return MEMORY[0x24BE1E530]();
}

uint64_t NLStringEmbeddingFillWordVectors()
{
  return MEMORY[0x24BE1E538]();
}

uint64_t NLStringEmbeddingGetDimension()
{
  return MEMORY[0x24BE1E540]();
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EDB8CF0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EDB8CF8(__sz);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

