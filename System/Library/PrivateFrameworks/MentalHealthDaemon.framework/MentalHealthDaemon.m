void sub_2416F8534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
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

void sub_2416F8A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_2416FA730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
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

void sub_2416FB318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2416FB4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, char a2, uint64_t a3, float a4)
{
  uint64_t v4;
  uint64_t v5;

  if ((a2 & 1) != 0)
    v4 = v5;
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

id OUTLINED_FUNCTION_6(id a1)
{
  return a1;
}

void sub_2416FF544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
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

void sub_241700B90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_241700C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_241700E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_241701148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a27, 8);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(v27 - 144);
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

void sub_241701268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_2417014F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

uint64_t std::unordered_map<long,_HDMHDomainCount * {__strong}>::unordered_map(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::pair<long const,_HDMHDomainCount * {__strong}> const&>(a1, i + 2, i + 2);
  return a1;
}

void sub_241701808(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::pair<long const,_HDMHDomainCount * {__strong}> const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v6;
  v13 = (void *)a3[1];
  i[2] = *a3;
  i[3] = v13;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, v19);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *v12;
  *v12 = i;
  *(_QWORD *)(v20 + 8 * v3) = v12;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7)
        v22 %= v7;
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_241701A50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_241702AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_8(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

void sub_2417054EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2417067B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_241706A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241706C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_241707044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241707434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_241707824()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  objc_class *v7;
  objc_super v9;

  v1 = sub_24170DAD4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCEF70], v1);
  v5 = v0;
  sub_24170DAE0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState] = 0;
  v6 = &v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex] = 0;

  v7 = (objc_class *)type metadata accessor for MentalHealthDemoDataGenerator();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_24170795C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;

  swift_unknownObjectWeakAssign();
  v5 = *(id *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState) = a2;
  v4 = a2;

}

void sub_241707A88(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_241709A8C(a4, a5, a2);
}

unint64_t sub_241707B70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  double *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_24170DAC8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v24 - v7;
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  if (v9 > 3)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v10 = (double *)((char *)&unk_2511A2468 + 24 * v9);
  v12 = v10[5];
  v11 = v10[6];
  result = sub_24170B744(0x20000000000001uLL);
  if (result == 0x20000000000000)
  {
    if (v12 < 1.0)
      return 0;
  }
  else if ((double)result * 1.11022302e-16 + 0.0 > v12)
  {
    return 0;
  }
  v14 = v11 * 3600.0;
  if (v14 < 0.0)
    goto LABEL_20;
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_24170B744(0x20000000000001uLL);
  sub_24170DA98();
  sub_24170DA8C();
  sub_24170B744(0x20000000000001uLL);
  v15 = sub_24170DBE8();
  v16 = v15;
  v17 = *(_QWORD *)(v15 + 16);
  if (!v17)
  {
    v18 = 0;
LABEL_13:
    swift_bridgeObjectRelease();
    v19 = sub_241707FC8();
    v21 = v20;
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v8, v1);
    if (v17)
    {
      sub_24170A088(0, &qword_257149C68, (uint64_t (*)(uint64_t))type metadata accessor for Label, MEMORY[0x24BEE3598]);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_24170F4F0;
      *(_QWORD *)(v22 + 32) = v18;
      if ((v21 & 1) != 0)
      {
LABEL_17:
        sub_24170A1BC();
        sub_241707EA4(MEMORY[0x24BEE4AF8]);
        v13 = sub_24170DBAC();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
        return v13;
      }
    }
    else if ((v21 & 1) != 0)
    {
      goto LABEL_17;
    }
    sub_24170A088(0, &qword_257149C60, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, MEMORY[0x24BEE3598]);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_24170F4F0;
    *(_QWORD *)(v23 + 32) = v19;
    goto LABEL_17;
  }
  result = sub_24170973C(*(_QWORD *)(v15 + 16));
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_22;
  if (result < *(_QWORD *)(v16 + 16))
  {
    v18 = *(_QWORD *)(v16 + 8 * result + 32);
    goto LABEL_13;
  }
LABEL_23:
  __break(1u);
  return result;
}

unint64_t sub_241707EA4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_24170A214();
  v2 = sub_24170DC9C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24170A27C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_24170913C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24170A328(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_241707FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  swift_getObjectType();
  v0 = sub_24170DB40();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2417097C4();
  if (v4 >= 1)
  {
    v6 = v4;
    result = sub_24170B744(v4);
    v8 = 0;
    v9 = 0;
    v10 = v5 + 64;
    v11 = 1 << *(_BYTE *)(v5 + 32);
    v12 = -1;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v14 = result + 1;
    v15 = (unint64_t)(v11 + 63) >> 6;
    while (1)
    {
      if (v13)
      {
        v16 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v17 = v16 | (v9 << 6);
      }
      else
      {
        v18 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_31;
        if (v18 >= v15)
        {
LABEL_25:
          sub_24170DB28();
          swift_bridgeObjectRetain();
          v24 = sub_24170DB34();
          v25 = sub_24170DBC4();
          v26 = v25;
          if (os_log_type_enabled(v24, v25))
          {
            v27 = swift_slowAlloc();
            v33 = v26;
            v28 = v27;
            v34 = swift_slowAlloc();
            v36 = v34;
            *(_DWORD *)v28 = 136446722;
            v32[1] = v28 + 4;
            v29 = sub_24170DD14();
            v35 = sub_24170B0DC(v29, v30, &v36);
            sub_24170DC0C();
            swift_bridgeObjectRelease();
            *(_WORD *)(v28 + 12) = 2048;
            v35 = v14;
            sub_24170DC0C();
            *(_WORD *)(v28 + 22) = 2048;
            swift_bridgeObjectRelease();
            v35 = v6;
            sub_24170DC0C();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2416F5000, v24, (os_log_type_t)v33, "[%{public}s] Random weight out of bounds. Weight: %ld total: %ld", (uint8_t *)v28, 0x20u);
            v31 = v34;
            swift_arrayDestroy();
            MEMORY[0x24269A4B0](v31, -1, -1);
            MEMORY[0x24269A4B0](v28, -1, -1);

            (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
            return 0;
          }

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
          return 0;
        }
        v19 = *(_QWORD *)(v10 + 8 * v18);
        ++v9;
        if (!v19)
        {
          v9 = v18 + 1;
          if (v18 + 1 >= v15)
            goto LABEL_25;
          v19 = *(_QWORD *)(v10 + 8 * v9);
          if (!v19)
          {
            v9 = v18 + 2;
            if (v18 + 2 >= v15)
              goto LABEL_25;
            v19 = *(_QWORD *)(v10 + 8 * v9);
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v15)
                goto LABEL_25;
              v19 = *(_QWORD *)(v10 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  v9 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_32;
                  if (v9 >= v15)
                    goto LABEL_25;
                  v19 = *(_QWORD *)(v10 + 8 * v9);
                  ++v20;
                  if (v19)
                    goto LABEL_20;
                }
              }
              v9 = v20;
            }
          }
        }
LABEL_20:
        v13 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v17);
      v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return result;
      }
      if (v8 >= v14)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
        swift_release();
        return v23;
      }
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_241708340(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *);
  uint64_t v23;
  unsigned int (*v24)(uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  double v33;
  char *v34;
  uint64_t v35;
  double v36;
  double v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unsigned int v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v3 = v2;
  v6 = sub_24170DA74();
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24170DB10();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170A088(0, (unint64_t *)&unk_257149E10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v48 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v40 - v15;
  v17 = sub_24170DAC8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v45 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)&v40 - v21;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex) = 0;
  v22 = *(void (**)(char *))(v9 + 104);
  v47 = *MEMORY[0x24BDCF220];
  v22(v11);
  v46 = a1;
  sub_24170DB04();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v23 = v18;
  v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  v53 = v17;
  if (v24((uint64_t)v16, 1, v17) == 1)
  {
    sub_24170A0E0((uint64_t)v16, (uint64_t)&unk_257149E10, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A088);
    sub_241708BBC(a2);
  }
  else
  {
    v43 = v23;
    v44 = v3;
    v41 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v42 = v24;
    v25 = v49;
    v26 = v53;
    v41(v49, v16, v53);
    sub_24170A088(0, &qword_257149C40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BEE3598]);
    v27 = *(_QWORD *)(v9 + 72);
    v28 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_24170F500;
    v30 = v29 + v28;
    ((void (*)(unint64_t, _QWORD, uint64_t))v22)(v30, v47, v8);
    ((void (*)(unint64_t, _QWORD, uint64_t))v22)(v30 + v27, *MEMORY[0x24BDCF250], v8);
    ((void (*)(unint64_t, _QWORD, uint64_t))v22)(v30 + 2 * v27, *MEMORY[0x24BDCF240], v8);
    sub_24170B908(v29);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v31 = v50;
    sub_24170DAEC();
    swift_bridgeObjectRelease();
    sub_24170DA68();
    v32 = (uint64_t)v48;
    sub_24170DAF8();
    if (v42(v32, 1, v26) == 1)
    {
      sub_24170A0E0(v32, (uint64_t)&unk_257149E10, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A088);
      v33 = sub_241708BBC(a2);
      (*(void (**)(char *, uint64_t, double))(v51 + 8))(v31, v52, v33);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v53);
    }
    else
    {
      v34 = v45;
      v35 = v53;
      v41(v45, (char *)v32, v53);
      sub_24170DAA4();
      v37 = v36;
      v38 = *(void (**)(char *, uint64_t))(v43 + 8);
      v38(v34, v35);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v52);
      v38(v25, v35);
      v39 = v44 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
      *(double *)v39 = v37 * 0.0000115740741 + a2;
      *(_BYTE *)(v39 + 8) = 0;
    }
  }
}

void sub_2417087B0(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(unint64_t, _QWORD, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  void (*v35)(char *, uint64_t, double);
  char *v36;
  double v37;
  double v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;

  sub_24170A088(0, (unint64_t *)&unk_257149E10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v42 - v6;
  v8 = sub_24170DAC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24170DA74();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v42 - v17;
  v19 = *(_QWORD *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  v20 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v20 > 3)
  {
    sub_241708340(a1, a2);
    return;
  }
  if (v20 < 0)
    goto LABEL_9;
  v43 = OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex;
  v44 = v11;
  v42 = v19 + 1;
  v21 = qword_2511A24E8[3 * v20 + 4];
  v45 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_calendar;
  v46 = v21;
  sub_24170A088(0, &qword_257149C40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BEE3598]);
  v51 = v12;
  v22 = sub_24170DB10();
  v47 = v2;
  v48 = v9;
  v23 = v22;
  v24 = *(_QWORD *)(v22 - 8);
  v49 = v16;
  v50 = v7;
  v25 = *(_QWORD *)(v24 + 72);
  v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_24170F500;
  v28 = v27 + v26;
  v29 = *(void (**)(unint64_t, _QWORD, uint64_t))(v24 + 104);
  v29(v28, *MEMORY[0x24BDCF220], v23);
  v30 = v49;
  v29(v28 + v25, *MEMORY[0x24BDCF250], v23);
  v31 = (uint64_t)v50;
  v29(v28 + 2 * v25, *MEMORY[0x24BDCF240], v23);
  sub_24170B908(v27);
  swift_setDeallocating();
  swift_arrayDestroy();
  v32 = v51;
  swift_deallocClassInstance();
  sub_24170DAEC();
  v33 = v48;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v30, v18, v32);
  sub_24170DA68();
  sub_24170DAF8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v31, 1, v8) == 1)
  {
    sub_24170A0E0(v31, (uint64_t)&unk_257149E10, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A088);
    v34 = sub_241708BBC(a2);
    v35 = *(void (**)(char *, uint64_t, double))(v13 + 8);
    v35(v30, v32, v34);
    ((void (*)(char *, uint64_t))v35)(v18, v32);
  }
  else
  {
    v36 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v44, v31, v8);
    sub_24170DAA4();
    v38 = v37;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v8);
    v39 = *(void (**)(char *, uint64_t))(v13 + 8);
    v39(v30, v32);
    v39(v18, v32);
    v40 = v47;
    v41 = v47 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
    *(double *)v41 = v38 * 0.0000115740741 + a2;
    *(_BYTE *)(v41 + 8) = 0;
    *(_QWORD *)(v40 + v43) = v42;
  }
}

double sub_241708BBC(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  double v16;
  double result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_24170DB40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DB28();
  v8 = sub_24170DB34();
  v9 = sub_24170DBC4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v20 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v22 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_24170DD14();
    v21 = sub_24170B0DC(v13, v14, &v22);
    sub_24170DC0C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416F5000, v8, v9, "[%{public}s] Calendar math failed! Resetting to tomorrow", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24269A4B0](v12, -1, -1);
    v15 = v11;
    v2 = v20;
    MEMORY[0x24269A4B0](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  HDDemoData_timeFromDateComponents();
  result = v16 + a1;
  v18 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
  *(double *)v18 = result;
  *(_BYTE *)(v18 + 8) = 0;
  return result;
}

uint64_t static MentalHealthDemoDataGenerator.supportsSecureCoding.getter()
{
  return 1;
}

void sub_241708DA0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime + 8) & 1) != 0)
    v3 = 0;
  else
    v3 = sub_24170DBA0();
  v4 = (void *)sub_24170DB64();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();

  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  v6 = (id)sub_24170DB64();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v5, v6);

}

id MentalHealthDemoDataGenerator.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_241709CD8(a1);

  return v4;
}

id MentalHealthDemoDataGenerator.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_241709CD8(a1);

  return v2;
}

id MentalHealthDemoDataGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MentalHealthDemoDataGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_241709008()
{
  sub_24170DCF0();
  sub_24170DCFC();
  return sub_24170DD08();
}

uint64_t sub_24170904C()
{
  return sub_24170DCFC();
}

uint64_t sub_241709074()
{
  sub_24170DCF0();
  sub_24170DCFC();
  return sub_24170DD08();
}

BOOL sub_2417090B4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_2417090C8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2417090D8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_2417090E4(uint64_t a1)
{
  uint64_t v2;

  sub_24170DCF0();
  sub_24170DCFC();
  v2 = sub_24170DD08();
  return sub_241709450(a1, v2);
}

unint64_t sub_24170913C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24170DCF0();
  sub_24170DB70();
  v4 = sub_24170DD08();
  return sub_2417094EC(a1, a2, v4);
}

uint64_t sub_2417091A0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  sub_24170A144();
  result = sub_24170DC90();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = a2;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
          goto LABEL_38;
        if (v8 >= v13)
        {
LABEL_29:
          if ((v33 & 1) == 0)
          {
            result = swift_release();
            v3 = v2;
            goto LABEL_36;
          }
          v32 = 1 << *(_BYTE *)(v5 + 32);
          if (v32 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v9 = -1 << v32;
          v3 = v2;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v20 = v9[v8];
        if (!v20)
        {
          v21 = v8 + 1;
          if (v8 + 1 >= v13)
            goto LABEL_29;
          v20 = v9[v21];
          if (!v20)
          {
            while (1)
            {
              v8 = v21 + 1;
              if (__OFADD__(v21, 1))
                break;
              if (v8 >= v13)
                goto LABEL_29;
              v20 = v9[v8];
              ++v21;
              if (v20)
                goto LABEL_19;
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      sub_24170DCF0();
      sub_24170DCFC();
      result = sub_24170DD08();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_37;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_36:
  *v3 = v7;
  return result;
}

unint64_t sub_241709450(uint64_t a1, uint64_t a2)
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

unint64_t sub_2417094EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24170DCC0() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24170DCC0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2417095CC()
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
  uint64_t v17;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_24170A144();
  v2 = *v0;
  v3 = sub_24170DC84();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    if (!v19)
      break;
LABEL_23:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_24170973C(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x24269A4BC](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x24269A4BC](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2417097C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  char v7;
  unint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t result;

  v0 = sub_24170DBF4();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = (uint64_t *)(v0 + 32);
    v3 = MEMORY[0x24BEE4B00];
    while (1)
    {
      v5 = *v2++;
      v4 = v5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v8 = sub_2417090E4(v5);
      v9 = *(_QWORD *)(v3 + 16);
      v10 = (v7 & 1) == 0;
      v11 = v9 + v10;
      if (__OFADD__(v9, v10))
      {
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
      v12 = v7;
      if (*(_QWORD *)(v3 + 24) >= v11)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_2417095CC();
      }
      else
      {
        sub_2417091A0(v11, isUniquelyReferenced_nonNull_native);
        v13 = sub_2417090E4(v4);
        if ((v12 & 1) != (v14 & 1))
          goto LABEL_48;
        v8 = v13;
      }
      if ((unint64_t)(v4 - 1) > 9)
      {
        v15 = 3;
        if ((v12 & 1) != 0)
        {
LABEL_3:
          *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v8) = v15;
          goto LABEL_4;
        }
      }
      else
      {
        v15 = qword_24170F700[v4 - 1];
        if ((v12 & 1) != 0)
          goto LABEL_3;
      }
      *(_QWORD *)(v3 + 8 * (v8 >> 6) + 64) |= 1 << v8;
      v16 = 8 * v8;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + v16) = v4;
      *(_QWORD *)(*(_QWORD *)(v3 + 56) + v16) = v15;
      v17 = *(_QWORD *)(v3 + 16);
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_46;
      *(_QWORD *)(v3 + 16) = v19;
LABEL_4:
      swift_bridgeObjectRelease();
      if (!--v1)
        goto LABEL_18;
    }
  }
  v3 = MEMORY[0x24BEE4B00];
LABEL_18:
  swift_bridgeObjectRelease();
  v20 = 0;
  v21 = 0;
  v22 = v3 + 64;
  v23 = 1 << *(_BYTE *)(v3 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & *(_QWORD *)(v3 + 64);
  v26 = (unint64_t)(v23 + 63) >> 6;
  while (v25)
  {
    v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    v28 = v27 | (v20 << 6);
LABEL_22:
    v29 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v28);
    v18 = __OFADD__(v21, v29);
    v21 += v29;
    if (v18)
    {
      __break(1u);
      goto LABEL_44;
    }
  }
  v30 = v20 + 1;
  if (__OFADD__(v20, 1))
    goto LABEL_45;
  if (v30 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v30);
  ++v20;
  if (v31)
    goto LABEL_41;
  v20 = v30 + 1;
  if (v30 + 1 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v20);
  if (v31)
    goto LABEL_41;
  v20 = v30 + 2;
  if (v30 + 2 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v20);
  if (v31)
    goto LABEL_41;
  v20 = v30 + 3;
  if (v30 + 3 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v20);
  if (v31)
    goto LABEL_41;
  v20 = v30 + 4;
  if (v30 + 4 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v20);
  if (v31)
  {
LABEL_41:
    v25 = (v31 - 1) & v31;
    v28 = __clz(__rbit64(v31)) + (v20 << 6);
    goto LABEL_22;
  }
  v32 = v30 + 5;
  if (v32 >= v26)
    return v3;
  v31 = *(_QWORD *)(v22 + 8 * v32);
  if (v31)
  {
    v20 = v32;
    goto LABEL_41;
  }
  while (1)
  {
    v20 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v20 >= v26)
      return v3;
    v31 = *(_QWORD *)(v22 + 8 * v20);
    ++v32;
    if (v31)
      goto LABEL_41;
  }
LABEL_47:
  __break(1u);
LABEL_48:
  type metadata accessor for __HKStateOfMindDomain(0);
  result = sub_24170DCD8();
  __break(1u);
  return result;
}

void sub_241709A8C(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  unint64_t v22;
  void *v23;
  uint64_t v24;

  v4 = v3;
  sub_24170A088(0, (unint64_t *)&unk_257149E10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - v9;
  v11 = sub_24170DAC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v24 - v16;
  if ((*(_BYTE *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime + 8) & 1) != 0)
  {
    sub_241708340(a1, a3);
    return;
  }
  if (*(double *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime) <= a3)
  {
    v18 = *(void **)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
    if (v18)
    {
      v19 = objc_msgSend(v18, sel_firstSampleDate);
      if (v19)
      {
        v20 = v19;
        sub_24170DABC();

        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
        {
          sub_24170DAB0();
          v21 = *(void (**)(char *, uint64_t))(v12 + 8);
          v21(v10, v11);
          v22 = sub_241707B70();
          if (v22)
          {
            v23 = (void *)v22;
            objc_msgSend(a2, sel_addObjectFromPhone_, v22);

          }
          sub_2417087B0(a1, a3);
          v21(v17, v11);
          return;
        }
LABEL_13:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_13;
  }
}

id sub_241709CD8(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  char v14;
  void *v15;
  id v16;
  objc_class *v17;
  _QWORD v19[2];
  objc_super v20;
  _OWORD v21[2];
  _BYTE v22[24];
  uint64_t v23;

  v3 = sub_24170DAD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCEF70], v3);
  v7 = v1;
  sub_24170DAE0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState] = 0;
  v8 = &v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex] = 0;
  v10 = (void *)sub_24170DB64();
  v11 = objc_msgSend(a1, sel_decodeObjectForKey_, v10);

  if (v11)
  {
    sub_24170DC24();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_24170A338((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    v12 = swift_dynamicCast();
    v13 = v19[1];
    if (!v12)
      v13 = 0;
    v14 = v12 ^ 1;
  }
  else
  {
    sub_24170A0E0((uint64_t)v22, (uint64_t)&qword_257149C80, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A3D0);
    v13 = 0;
    v14 = 1;
  }
  *(_QWORD *)v8 = v13;
  v8[8] = v14;
  v15 = (void *)sub_24170DB64();
  v16 = objc_msgSend(a1, sel_decodeIntegerForKey_, v15);

  *(_QWORD *)&v7[v9] = v16;
  v17 = (objc_class *)type metadata accessor for MentalHealthDemoDataGenerator();
  v20.receiver = v7;
  v20.super_class = v17;
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t type metadata accessor for MentalHealthDemoDataGenerator()
{
  uint64_t result;

  result = qword_257149C28;
  if (!qword_257149C28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_241709F64()
{
  return type metadata accessor for MentalHealthDemoDataGenerator();
}

uint64_t sub_241709F6C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24170DB1C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MentalHealthDemoDataGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.setDemoDataGenerationContextWith(_:generatorState:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.generateFirstRunObjects(forDemoPerson:firstDate:objectCollection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.generateObjects(forDemoPerson:fromTime:toTime:currentDate:objectCollection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

void sub_24170A088(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_24170A0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void type metadata accessor for __HKStateOfMindDomain(uint64_t a1)
{
  sub_24170A3D0(a1, &qword_257149CA0, (uint64_t)&unk_2511A2778, MEMORY[0x24BEE4D40]);
}

void sub_24170A144()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257149C48)
  {
    type metadata accessor for __HKStateOfMindDomain(255);
    sub_24170A438(&qword_257149C50, (uint64_t)&unk_24170F6BC);
    v0 = sub_24170DCA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257149C48);
  }
}

unint64_t sub_24170A1BC()
{
  unint64_t result;

  result = qword_257149C58;
  if (!qword_257149C58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257149C58);
  }
  return result;
}

void type metadata accessor for Label(uint64_t a1)
{
  sub_24170A3D0(a1, &qword_257149C98, (uint64_t)&unk_2511A2758, MEMORY[0x24BEE4D40]);
}

void sub_24170A214()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257149C70)
  {
    v0 = sub_24170DCA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257149C70);
  }
}

uint64_t sub_24170A27C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24170A2C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24170A2C0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_257149C78)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_257149C78);
  }
}

_OWORD *sub_24170A328(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24170A338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24170A3D0(0, &qword_257149C80, MEMORY[0x24BEE4AD8] + 8, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for Answer(uint64_t a1)
{
  sub_24170A3D0(a1, &qword_257149C88, (uint64_t)&unk_2511A2718, MEMORY[0x24BEE4D40]);
}

void _s3__C6AnswerOMa_0(uint64_t a1)
{
  sub_24170A3D0(a1, &qword_257149C90, (uint64_t)&unk_2511A2738, MEMORY[0x24BEE4D40]);
}

void sub_24170A3D0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_24170A414()
{
  return sub_24170A438(&qword_257149CA8, (uint64_t)&unk_24170F65C);
}

uint64_t sub_24170A438(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for __HKStateOfMindDomain(255);
    result = MEMORY[0x24269A45C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_24170A478()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  objc_class *v7;
  objc_super v9;

  v1 = sub_24170DAD4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCEF70], v1);
  v5 = v0;
  sub_24170DAE0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState] = 0;
  v6 = &v5[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;

  v7 = (objc_class *)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_24170A5A4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;

  swift_unknownObjectWeakAssign();
  v5 = *(id *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState) = a2;
  v4 = a2;

}

void sub_24170A650()
{
  sub_24170BB5C();
}

void sub_24170A71C(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_24170C454(a4, a5, a2);
}

void sub_24170A804(uint64_t a1, double a2)
{
  uint64_t v4;
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
  unint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  double v31;
  char *v32;
  double v33;
  double v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  unsigned int (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v4 = sub_24170DA74();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24170DB10();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170A088(0, (unint64_t *)&unk_257149E10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v42 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v37 - v13;
  v15 = sub_24170DAC8();
  v47 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v41 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v43 = (char *)&v37 - v18;
  v19 = sub_24170973C(0x15uLL);
  v20 = *MEMORY[0x24BDCF220];
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v21(v9, v20, v6);
  if (__OFSUB__(70, v19))
  {
    __break(1u);
  }
  else
  {
    v40 = a1;
    sub_24170DB04();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
    if (v22((uint64_t)v14, 1, v15) == 1)
    {
      sub_24170A0E0((uint64_t)v14, (uint64_t)&unk_257149E10, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A088);
      sub_24170AC80(a2);
    }
    else
    {
      v23 = v43;
      v38 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
      v38(v43, v14, v15);
      sub_24170A088(0, &qword_257149C40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BEE3598]);
      v24 = *(_QWORD *)(v7 + 72);
      v25 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v26 = swift_allocObject();
      v39 = v22;
      v27 = v26;
      *(_OWORD *)(v26 + 16) = xmmword_24170F500;
      v28 = v26 + v25;
      v21((char *)v28, v20, v6);
      v21((char *)(v28 + v24), *MEMORY[0x24BDCF250], v6);
      v21((char *)(v28 + 2 * v24), *MEMORY[0x24BDCF240], v6);
      sub_24170B908(v27);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v29 = v44;
      sub_24170DAEC();
      swift_bridgeObjectRelease();
      sub_24170DA68();
      v30 = (uint64_t)v42;
      sub_24170DAF8();
      if (v39(v30, 1, v15) == 1)
      {
        sub_24170A0E0(v30, (uint64_t)&unk_257149E10, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A088);
        v31 = sub_24170AC80(a2);
        (*(void (**)(char *, uint64_t, double))(v45 + 8))(v29, v46, v31);
        (*(void (**)(char *, uint64_t))(v47 + 8))(v23, v15);
      }
      else
      {
        v32 = v41;
        v38(v41, (char *)v30, v15);
        sub_24170DAA4();
        v34 = v33;
        v35 = *(void (**)(char *, uint64_t))(v47 + 8);
        v35(v32, v15);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v46);
        v35(v23, v15);
        v36 = v48 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime;
        *(double *)v36 = v34 * 0.0000115740741 + a2;
        *(_BYTE *)(v36 + 8) = 0;
      }
    }
  }
}

double sub_24170AC80(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  double result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_24170DB40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DB28();
  v8 = sub_24170DB34();
  v9 = sub_24170DBC4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v19 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v21 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_24170DD14();
    v20 = sub_24170B0DC(v13, v14, &v21);
    sub_24170DC0C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416F5000, v8, v9, "[%{public}s] Calendar math failed! Resetting to 60 days from now", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24269A4B0](v12, -1, -1);
    v15 = v11;
    v2 = v19;
    MEMORY[0x24269A4B0](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = a1 + 60.0;
  v17 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime;
  *(double *)v17 = a1 + 60.0;
  *(_BYTE *)(v17 + 8) = 0;
  return result;
}

uint64_t static MentalHealthAssessmentsDemoDataGenerator.supportsSecureCoding.getter()
{
  return 1;
}

void sub_24170AE5C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime + 8) & 1) != 0)
    v3 = 0;
  else
    v3 = sub_24170DBA0();
  v4 = (id)sub_24170DB64();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();

}

id MentalHealthAssessmentsDemoDataGenerator.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_24170C788(a1);

  return v4;
}

id MentalHealthAssessmentsDemoDataGenerator.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_24170C788(a1);

  return v2;
}

id MentalHealthAssessmentsDemoDataGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24170B0DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24170B1AC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24170CAF8((uint64_t)v12, *a3);
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
      sub_24170CAF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24170B1AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24170DC18();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24170B364(a5, a6);
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
  v8 = sub_24170DC54();
  if (!v8)
  {
    sub_24170DC60();
    __break(1u);
LABEL_17:
    result = sub_24170DCB4();
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

uint64_t sub_24170B364(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24170B3F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24170B5E4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24170B5E4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24170B3F8(uint64_t a1, unint64_t a2)
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
      v3 = sub_24170B56C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24170DC48();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24170DC60();
      __break(1u);
LABEL_10:
      v2 = sub_24170DB7C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24170DCB4();
    __break(1u);
LABEL_14:
    result = sub_24170DC60();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24170B56C(uint64_t a1, uint64_t a2)
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
  sub_24170A3D0(0, &qword_257149E08, MEMORY[0x24BEE4260], MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24170B5E4(char a1, int64_t a2, char a3, char *a4)
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
    sub_24170A3D0(0, &qword_257149E08, MEMORY[0x24BEE4260], MEMORY[0x24BEE3598]);
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
  result = sub_24170DCB4();
  __break(1u);
  return result;
}

uint64_t sub_24170B748(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24170B7A0(a1, a2, a3, *v3, &qword_257149E60, (uint64_t (*)(uint64_t))_s3__C6AnswerOMa_0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24170B774(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24170B7A0(a1, a2, a3, *v3, &qword_257149E68, (uint64_t (*)(uint64_t))type metadata accessor for Answer);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24170B7A0(char a1, int64_t a2, char a3, char *a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v8 = *((_QWORD *)a4 + 3);
    v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < a2)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v9 = a2;
    }
  }
  else
  {
    v9 = a2;
  }
  v10 = *((_QWORD *)a4 + 2);
  if (v9 <= v10)
    v11 = *((_QWORD *)a4 + 2);
  else
    v11 = v9;
  if (v11)
  {
    sub_24170A088(0, a5, a6, MEMORY[0x24BEE3598]);
    v12 = (char *)swift_allocObject();
    v13 = _swift_stdlib_malloc_size(v12);
    v14 = v13 - 32;
    if (v13 < 32)
      v14 = v13 - 25;
    *((_QWORD *)v12 + 2) = v10;
    *((_QWORD *)v12 + 3) = 2 * (v14 >> 3);
  }
  else
  {
    v12 = (char *)MEMORY[0x24BEE4AF8];
  }
  v15 = v12 + 32;
  v16 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v12 != a4 || v15 >= &v16[8 * v10])
      memmove(v15, v16, 8 * v10);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v16 >= &v15[8 * v10] || v15 >= &v16[8 * v10])
  {
    memcpy(v15, v16, 8 * v10);
LABEL_30:
    swift_release();
    return (uint64_t)v12;
  }
LABEL_32:
  result = sub_24170DCB4();
  __break(1u);
  return result;
}

uint64_t sub_24170B908(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_24170DB10();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_24170CB38();
    v10 = sub_24170DC30();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_24170CBA8(&qword_257149E28, MEMORY[0x24BDCF2A8]);
      v14 = sub_24170DB4C();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_24170CBA8((unint64_t *)&unk_257149E30, MEMORY[0x24BDCF2C0]);
          v20 = sub_24170DB58();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

void sub_24170BB5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  id v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  id v45[2];

  v1 = v0;
  v45[1] = *(id *)MEMORY[0x24BDAC8D0];
  ObjectType = swift_getObjectType();
  v3 = sub_24170DB40();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v40 - v8;
  v10 = MEMORY[0x24269A504](v1 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_profile);
  if (v10)
  {
    v11 = (void *)v10;
    sub_24170DB28();
    v12 = sub_24170DB34();
    v13 = sub_24170DBB8();
    v14 = os_log_type_enabled(v12, v13);
    v43 = (void (*)(char *, uint64_t))ObjectType;
    if (v14)
    {
      v15 = swift_slowAlloc();
      v42 = (char *)v3;
      v16 = (uint8_t *)v15;
      v17 = (void *)swift_slowAlloc();
      v45[0] = v17;
      v41 = v11;
      *(_DWORD *)v16 = 136446210;
      v18 = sub_24170DD14();
      v44 = sub_24170B0DC(v18, v19, (uint64_t *)v45);
      v11 = v41;
      sub_24170DC0C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2416F5000, v12, v13, "[%{public}s] Hello!", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24269A4B0](v17, -1, -1);
      v20 = v16;
      v3 = (uint64_t)v42;
      MEMORY[0x24269A4B0](v20, -1, -1);
    }

    v21 = *(void (**)(char *, uint64_t))(v4 + 8);
    v21(v9, v3);
    v22 = objc_msgSend((id)objc_opt_self(), sel_hdmh_mentalHealthSyncedDefaultsDomainWithProfile_, v11);
    sub_24170CBE8(0, (unint64_t *)&unk_257149E70);
    v23 = (void *)sub_24170DC00();
    v24 = *MEMORY[0x24BE65DA0];
    v45[0] = 0;
    v25 = objc_msgSend(v22, sel_setNumber_forKey_error_, v23, v24, v45);

    if (v25)
    {
      v26 = v45[0];

    }
    else
    {
      v27 = v45[0];
      v28 = (void *)sub_24170DA80();

      swift_willThrow();
      sub_24170DB28();
      v29 = v28;
      v30 = v28;
      v31 = sub_24170DB34();
      v32 = sub_24170DBB8();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc();
        v42 = v7;
        v34 = v33;
        v41 = (void *)swift_slowAlloc();
        v45[0] = v41;
        *(_DWORD *)v34 = 136446466;
        v35 = sub_24170DD14();
        v44 = sub_24170B0DC(v35, v36, (uint64_t *)v45);
        v43 = v21;
        sub_24170DC0C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2080;
        swift_getErrorValue();
        v37 = sub_24170DCE4();
        v44 = sub_24170B0DC(v37, v38, (uint64_t *)v45);
        sub_24170DC0C();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2416F5000, v31, v32, "[%{public}s] Couldn't set the age confirmation for mental health assessments with error: %s", (uint8_t *)v34, 0x16u);
        v39 = v41;
        swift_arrayDestroy();
        MEMORY[0x24269A4B0](v39, -1, -1);
        MEMORY[0x24269A4B0](v34, -1, -1);

        v43(v42, v3);
      }
      else
      {

        v21(v7, v3);
      }
    }
  }
}

uint64_t sub_24170BFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t j;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;

  v0 = sub_24170DAC8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v31 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v30 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v30 - v7;
  sub_24170973C(0x20000000000001uLL);
  sub_24170DA98();
  sub_24170DA8C();
  v30 = v1;
  v9 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v9(v6, v8, v0);
  v33 = MEMORY[0x24BEE4AF8];
  sub_24170B774(0, 7, 0);
  v10 = &unk_2511A2568;
  v11 = v33;
  for (i = 1; ; ++i)
  {
    v32 = 0;
    result = MEMORY[0x24269A4BC](&v32, 8);
    v14 = (v32 * (unsigned __int128)3uLL) >> 64;
    if (!(3 * v32))
    {
      do
      {
        v32 = 0;
        result = MEMORY[0x24269A4BC](&v32, 8);
      }
      while (!(3 * v32));
      v14 = (v32 * (unsigned __int128)3uLL) >> 64;
    }
    if (v14 >= 3)
    {
      __break(1u);
      __break(1u);
      goto LABEL_21;
    }
    v15 = v10[v14 + 4];
    swift_bridgeObjectRelease();
    v33 = v11;
    v17 = *(_QWORD *)(v11 + 16);
    v16 = *(_QWORD *)(v11 + 24);
    if (v17 >= v16 >> 1)
    {
      sub_24170B774(v16 > 1, v17 + 1, 1);
      v11 = v33;
    }
    *(_QWORD *)(v11 + 16) = v17 + 1;
    *(_QWORD *)(v11 + 8 * v17 + 32) = v15;
    if (i == 7)
      break;
    v10 = &unk_2511A25A0;
  }
  sub_24170CBE8(0, &qword_257149E48);
  v18 = MEMORY[0x24BEE4AF8];
  sub_241707EA4(MEMORY[0x24BEE4AF8]);
  v19 = sub_24170DBD0();
  v9(v31, v8, v0);
  v33 = v18;
  sub_24170B748(0, 9, 0);
  v20 = &unk_2511A25D8;
  v21 = v33;
  for (j = 1; ; ++j)
  {
    v32 = 0;
    result = MEMORY[0x24269A4BC](&v32, 8);
    v23 = (v32 * (unsigned __int128)3uLL) >> 64;
    if (!(3 * v32))
    {
      do
      {
        v32 = 0;
        result = MEMORY[0x24269A4BC](&v32, 8);
      }
      while (!(3 * v32));
      v23 = (v32 * (unsigned __int128)3uLL) >> 64;
    }
    if (v23 >= 3)
      break;
    v24 = v20[v23 + 4];
    swift_bridgeObjectRelease();
    v33 = v21;
    v26 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    if (v26 >= v25 >> 1)
    {
      sub_24170B748(v25 > 1, v26 + 1, 1);
      v21 = v33;
    }
    *(_QWORD *)(v21 + 16) = v26 + 1;
    *(_QWORD *)(v21 + 8 * v26 + 32) = v24;
    if (j == 9)
    {
      sub_24170CBE8(0, &qword_257149E50);
      sub_241707EA4(MEMORY[0x24BEE4AF8]);
      v27 = sub_24170DBDC();
      sub_24170A3D0(0, &qword_257149E58, MEMORY[0x24BEE4AD0] + 8, MEMORY[0x24BEE3598]);
      v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_24170F750;
      *(_QWORD *)(v28 + 32) = v27;
      *(_QWORD *)(v28 + 40) = v19;
      v33 = v28;
      sub_24170DB94();
      v29 = v33;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v0);
      return v29;
    }
    v20 = &unk_2511A2610;
  }
LABEL_21:
  __break(1u);
  __break(1u);
  return result;
}

void sub_24170C454(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  sub_24170A088(0, (unint64_t *)&unk_257149E10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - v9;
  v11 = sub_24170DAC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  if ((*(_BYTE *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime + 8) & 1) != 0)
  {
    sub_24170A804(a1, a3);
    return;
  }
  if (*(double *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime) <= a3)
  {
    v18 = *(void **)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
    if (v18)
    {
      v19 = objc_msgSend(v18, sel_firstSampleDate);
      if (v19)
      {
        v20 = v19;
        sub_24170DABC();

        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
        {
          sub_24170DAB0();
          v21 = *(void (**)(char *, uint64_t))(v12 + 8);
          v21(v10, v11);
          v22 = sub_24170BFFC();
          if (v22 >> 62)
          {
            swift_bridgeObjectRetain();
            v24 = sub_24170DC78();
            swift_bridgeObjectRelease();
            if (v24)
            {
              sub_24170CBE8(0, &qword_257149E40);
              swift_bridgeObjectRetain();
              sub_24170DC6C();
              swift_bridgeObjectRelease();
              goto LABEL_10;
            }
          }
          else if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            swift_bridgeObjectRetain();
            sub_24170DCCC();
            sub_24170CBE8(0, &qword_257149E40);
LABEL_10:
            swift_bridgeObjectRelease();
            sub_24170CBE8(0, &qword_257149E40);
            v23 = (void *)sub_24170DB88();
            swift_bridgeObjectRelease();
            objc_msgSend(a2, sel_addObjectsFromPhone_, v23);

LABEL_14:
            sub_24170A804(a1, a3);
            v21(v17, v11);
            return;
          }
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
LABEL_18:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_18;
  }
}

id sub_24170C788(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  char v13;
  objc_class *v14;
  _QWORD v16[2];
  objc_super v17;
  _OWORD v18[2];
  _BYTE v19[24];
  uint64_t v20;

  v3 = sub_24170DAD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCEF70], v3);
  v7 = v1;
  sub_24170DAE0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState] = 0;
  v8 = &v7[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (void *)sub_24170DB64();
  v10 = objc_msgSend(a1, sel_decodeObjectForKey_, v9);

  if (v10)
  {
    sub_24170DC24();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_24170A338((uint64_t)v18, (uint64_t)v19);
  if (v20)
  {
    v11 = swift_dynamicCast();
    v12 = v16[1];
    if (!v11)
      v12 = 0;
    v13 = v11 ^ 1;
  }
  else
  {
    sub_24170A0E0((uint64_t)v19, (uint64_t)&qword_257149C80, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_24170A3D0);
    v12 = 0;
    v13 = 1;
  }
  *(_QWORD *)v8 = v12;
  v8[8] = v13;

  v14 = (objc_class *)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  v17.receiver = v7;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for MentalHealthAssessmentsDemoDataGenerator()
{
  uint64_t result;

  result = qword_257149DF8;
  if (!qword_257149DF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24170C9C4()
{
  return type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
}

uint64_t sub_24170C9CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24170DB1C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MentalHealthAssessmentsDemoDataGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.setDemoDataGenerationContextWith(_:generatorState:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.generateFirstRunObjects(forDemoPerson:firstDate:objectCollection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.generateObjects(forDemoPerson:fromTime:toTime:currentDate:objectCollection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24170CAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24170CB38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257149E20)
  {
    sub_24170DB10();
    sub_24170CBA8(&qword_257149E28, MEMORY[0x24BDCF2A8]);
    v0 = sub_24170DC3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257149E20);
  }
}

uint64_t sub_24170CBA8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_24170DB10();
    result = MEMORY[0x24269A45C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24170CBE8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24170DA68()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_24170DA74()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_24170DA80()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24170DA8C()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_24170DA98()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_24170DAA4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_24170DAB0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_24170DABC()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24170DAC8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24170DAD4()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_24170DAE0()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_24170DAEC()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_24170DAF8()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_24170DB04()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_24170DB10()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_24170DB1C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24170DB28()
{
  return MEMORY[0x24BE45998]();
}

uint64_t sub_24170DB34()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24170DB40()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24170DB4C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24170DB58()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24170DB64()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24170DB70()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24170DB7C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24170DB88()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24170DB94()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24170DBA0()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_24170DBAC()
{
  return MEMORY[0x24BDD2500]();
}

uint64_t sub_24170DBB8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24170DBC4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24170DBD0()
{
  return MEMORY[0x24BDD2568]();
}

uint64_t sub_24170DBDC()
{
  return MEMORY[0x24BDD25D0]();
}

uint64_t sub_24170DBE8()
{
  return MEMORY[0x24BDD2600]();
}

uint64_t sub_24170DBF4()
{
  return MEMORY[0x24BDD2618]();
}

uint64_t sub_24170DC00()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_24170DC0C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24170DC18()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24170DC24()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24170DC30()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24170DC3C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_24170DC48()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24170DC54()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24170DC60()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24170DC6C()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_24170DC78()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24170DC84()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24170DC90()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24170DC9C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24170DCA8()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_24170DCB4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24170DCC0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24170DCCC()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_24170DCD8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24170DCE4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_24170DCF0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24170DCFC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24170DD08()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24170DD14()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t HDActivityCacheEntityPredicateForCachesInDateComponentsRange()
{
  return MEMORY[0x24BE40810]();
}

uint64_t HDDemoData_timeFromDateComponents()
{
  return MEMORY[0x24BE40880]();
}

uint64_t HDEntityCategoryForKeyValueCategory()
{
  return MEMORY[0x24BE40888]();
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

uint64_t HKCompareDoubles()
{
  return MEMORY[0x24BDD2AD0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKMHPromptedAssessmentsManagerClientInterface()
{
  return MEMORY[0x24BE65D68]();
}

uint64_t HKMHPromptedAssessmentsManagerServerInterface()
{
  return MEMORY[0x24BE65D70]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t HKStateOfMindDomainIsKnown()
{
  return MEMORY[0x24BDD3788]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void operator delete(void *__p)
{
  off_2511A1B50(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2511A1B58(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

