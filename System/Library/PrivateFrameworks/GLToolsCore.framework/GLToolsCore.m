_QWORD *GPUTools::SM::GL::operator<<(_QWORD *a1, int *a2)
{
  int v3;
  const char *v4;
  _QWORD *v5;
  size_t v6;
  const char *v7;

  v3 = *a2;
  if (*a2 == 1)
  {
    v4 = "GL_ONE";
    v5 = a1;
    v6 = 6;
  }
  else if (v3)
  {
    v7 = dy_string_from_enum(v3);
    v6 = strlen(v7);
    v5 = a1;
    v4 = v7;
  }
  else
  {
    v4 = "GL_ZERO";
    v5 = a1;
    v6 = 7;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v4, v6);
  return a1;
}

{
  const char *v3;
  size_t v4;

  v3 = dy_string_from_enum(*a2);
  v4 = strlen(v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  return a1;
}

{
  _QWORD *v2;
  const char *v3;
  size_t v4;
  const char *v5;

  v2 = a1;
  if (*a2)
  {
    v3 = dy_string_from_enum(*a2);
    v4 = strlen(v3);
    a1 = v2;
    v5 = v3;
  }
  else
  {
    v5 = "GL_NO_ERROR";
    v4 = 11;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v4);
  return v2;
}

_QWORD *GPUTools::SM::GL::operator<<(_QWORD *a1, _DWORD *a2)
{
  const char *v3;
  uint64_t v4;

  if (*a2)
  {
    v3 = "GL_TRUE";
    v4 = 7;
  }
  else
  {
    v3 = "GL_FALSE";
    v4 = 8;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x242621A18](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x242621A24](v13);
  return a1;
}

void sub_23C63C510(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x242621A24](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23C63C4F0);
}

void sub_23C63C558(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_23C63C68C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
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
}

void sub_23C63C7B0(_Unwind_Exception *a1)
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

_QWORD *GPUTools::SM::GL::BindingPoint::BindingPoint(_QWORD *this)
{
  *this = 0;
  return this;
}

{
  *this = 0;
  return this;
}

uint64_t GPUTools::SM::GL::BindingPoint::getInternalID(GPUTools::SM::GL::BindingPoint *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t GPUTools::SM::GL::BindingPoint::getExternalID(GPUTools::SM::GL::BindingPoint *this)
{
  return *(unsigned int *)this;
}

uint64_t GPUTools::SM::GL::operator<<()
{
  return std::ostream::operator<<();
}

void sub_23C63D320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  MEMORY[0x242621A90](v8, 0x10B0C40F47DA5FCLL);
  std::unique_ptr<GPUTools::FD::Function>::reset[abi:ne180100]((GPUTools::FD::Function **)va, 0);
  _Unwind_Resume(a1);
}

GPUTools::FD::Function *std::unique_ptr<GPUTools::FD::Function>::reset[abi:ne180100](GPUTools::FD::Function **a1, GPUTools::FD::Function *a2)
{
  GPUTools::FD::Function *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    GPUTools::FD::Function::~Function(result);
    JUMPOUT(0x242621A90);
  }
  return result;
}

_QWORD *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
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
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_23C63D7E8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

uint64_t *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

uint64_t std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
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
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
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
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
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
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
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
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

const char *dy_string_from_error(int a1)
{
  if (!a1)
    return "no error";
  if (a1 == 32817)
    return "table too large";
  if ((a1 - 1280) > 6)
    return 0;
  return gGLErrorStrings[a1 - 1280];
}

char *dy_string_from_attachment_mask(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_attachment_mask_clear_mask_bits, 4, a1, a2, __s, __size);
}

char *format_bitfield(_QWORD *a1, uint64_t a2, unsigned int a3, char a4, char *__s, size_t __size)
{
  char *v7;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  size_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char v28;
  const char **v29;
  size_t v30;

  v7 = __s;
  if (!a3)
  {
    if (!__s)
    {
      __size = 2;
      v7 = (char *)malloc_type_malloc(2uLL, 0x8A4E21D3uLL);
    }
    strlcpy(v7, "0", __size);
    return v7;
  }
  v9 = a2;
  v10 = a1;
  if (!a2)
  {
    v13 = a3;
    if (__s)
    {
      *__s = 0;
LABEL_45:
      v30 = strlen(v7);
      snprintf(&v7[v30], __size - v30, "0x%lx", v13);
      return v7;
    }
    v24 = 1;
    v22 = a3;
    goto LABEL_24;
  }
  if (a2 == 1)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v11 = a2 & 0xFFFFFFFFFFFFFFFELL;
    v16 = a2 & 0xFFFFFFFFFFFFFFFELL;
    v17 = a1;
    do
    {
      v14 |= *v17;
      v15 |= v17[5];
      v17 += 10;
      v16 -= 2;
    }
    while (v16);
    v12 = v15 | v14;
    if (v11 == a2)
      goto LABEL_12;
  }
  v18 = a2 - v11;
  v19 = &a1[5 * v11];
  do
  {
    v20 = *v19;
    v19 += 5;
    v12 |= v20;
    --v18;
  }
  while (v18);
LABEL_12:
  v21 = a3;
  v22 = ~v12 & a3;
  if (__s)
    goto LABEL_28;
  if ((a4 & 1) != 0)
  {
    v23 = a1 + 4;
    v24 = 1;
    v25 = a2;
    do
    {
      if ((*(v23 - 4) & a3) != 0)
        v24 += *v23 + 3;
      v23 += 5;
      --v25;
    }
    while (v25);
  }
  else
  {
    v26 = a1 + 2;
    v24 = 1;
    v27 = a2;
    do
    {
      if ((*(v26 - 2) & a3) != 0)
        v24 += *v26 + 3;
      v26 += 5;
      --v27;
    }
    while (v27);
  }
  v13 = a3;
LABEL_24:
  v21 = v13;
  if (v22)
    __size = v24 + 13;
  else
    __size = v24;
  v7 = (char *)malloc_type_malloc(__size, 0x99871F80uLL);
LABEL_28:
  v13 = v22;
  *v7 = 0;
  v28 = 0;
  if (v9)
  {
    if ((a4 & 1) != 0)
    {
      do
      {
        if ((*v10 & v21) != 0)
        {
          if ((v28 & 1) != 0)
            strlcat(v7, " | ", __size);
          strlcat(v7, (const char *)v10[3], __size);
          v28 = 1;
        }
        v10 += 5;
        --v9;
      }
      while (v9);
    }
    else
    {
      v29 = (const char **)(v10 + 1);
      do
      {
        if (((unint64_t)*(v29 - 1) & v21) != 0)
        {
          if ((v28 & 1) != 0)
            strlcat(v7, " | ", __size);
          strlcat(v7, *v29, __size);
          v28 = 1;
        }
        v29 += 5;
        --v9;
      }
      while (v9);
    }
  }
  if (v22)
  {
    if ((v28 & 1) != 0)
      strlcat(v7, " | ", __size);
    goto LABEL_45;
  }
  return v7;
}

char *dy_string_from_pipeline_stages(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4;
  char *v5;
  const char *v8;

  v4 = __size;
  v5 = __s;
  if (a1 != -1)
    return format_bitfield(dy_string_from_pipeline_stages_pipeline_stages_bits, 5, a1, a2, __s, __size);
  if (!__s)
  {
    v4 = 8;
    v5 = (char *)malloc_type_malloc(8uLL, 0x529859A1uLL);
  }
  if (a2)
    v8 = "AllShaders";
  else
    v8 = "GL_ALL_SHADER_BITS";
  strlcpy(v5, v8, v4);
  return v5;
}

char *dy_string_from_map_buffer_range_access(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_map_buffer_range_access_map_buffer_range_access_bits, 6, a1, a2, __s, __size);
}

char *dy_string_from_sync_flags(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_sync_flags_sync_flags_bits, 1, a1, a2, __s, __size);
}

char *dy_string_from_client_attrib_mask(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4;
  char *v5;
  const char *v8;

  v4 = __size;
  v5 = __s;
  if (a1 != -1)
    return format_bitfield(dy_string_from_client_attrib_mask_client_attrib_bits, 2, a1, a2, __s, __size);
  if (!__s)
  {
    v4 = 8;
    v5 = (char *)malloc_type_malloc(8uLL, 0xC7640EDDuLL);
  }
  if (a2)
    v8 = "ClientAllAttribs";
  else
    v8 = "GL_CLIENT_ALL_ATTRIB_BITS";
  strlcpy(v5, v8, v4);
  return v5;
}

char *dy_string_from_attrib_mask(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4;
  char *v5;
  const char *v7;

  v4 = __size;
  v5 = __s;
  if (a1 != 0xFFFFF)
    return format_bitfield(dy_string_from_attrib_mask_attrib_bits, 20, a1, a2, __s, __size);
  if (!__s)
  {
    v4 = 8;
    v5 = (char *)malloc_type_malloc(8uLL, 0x95EDDC42uLL);
  }
  if (a2)
    v7 = "AllAttribs";
  else
    v7 = "GL_ALL_ATTRIB_BITS";
  strlcpy(v5, v7, v4);
  return v5;
}

const char *dy_glsl_type_string_from_enum(int a1)
{
  const char *result;

  if (a1 > 35663)
  {
    switch(a1)
    {
      case 35664:
        result = "vec2";
        break;
      case 35665:
        result = "vec3";
        break;
      case 35666:
        result = "vec4";
        break;
      case 35667:
        result = "ivec2";
        break;
      case 35668:
        result = "ivec3";
        break;
      case 35669:
        result = "ivec4";
        break;
      case 35670:
        result = "BOOL";
        break;
      case 35671:
        result = "bvec2";
        break;
      case 35672:
        result = "bvec3";
        break;
      case 35673:
        result = "bvec4";
        break;
      case 35674:
        result = "mat2";
        break;
      case 35675:
        result = "mat3";
        break;
      case 35676:
        result = "mat4";
        break;
      case 35677:
      case 35681:
      case 35683:
      case 35684:
        return "Unknown";
      case 35678:
        result = "sampler2D";
        break;
      case 35679:
        result = "sampler3D";
        break;
      case 35680:
        result = "samplerCube";
        break;
      case 35682:
        result = "sampler2DShadow";
        break;
      case 35685:
        result = "mat2x3";
        break;
      case 35686:
        result = "mat2x4";
        break;
      case 35687:
        result = "mat3x2";
        break;
      case 35688:
        result = "mat3x4";
        break;
      case 35689:
        result = "mat4x2";
        break;
      case 35690:
        result = "mat4x3";
        break;
      default:
        switch(a1)
        {
          case 36289:
            result = "sampler2DArray";
            break;
          case 36292:
            result = "sampler2DArrayShadow";
            break;
          case 36293:
            result = "samplerCubeShadow";
            break;
          case 36294:
            result = "uvec2";
            break;
          case 36295:
            result = "uvec3";
            break;
          case 36296:
            result = "uvec4";
            break;
          case 36298:
            result = "isampler2D";
            break;
          case 36299:
            result = "isampler3D";
            break;
          case 36300:
            result = "isamplerCube";
            break;
          case 36303:
            result = "isampler2DArray";
            break;
          case 36306:
            result = "usampler2D";
            break;
          case 36307:
            result = "usampler3D";
            break;
          case 36308:
            result = "usamplerCube";
            break;
          case 36311:
            result = "usampler2DArray";
            break;
          default:
            return "Unknown";
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 5124:
        return "int";
      case 5125:
        return "uint";
      case 5126:
        return "float";
      default:
        return "Unknown";
    }
  }
  return result;
}

const char *dy_short_tex_target_string_from_enum(int a1)
{
  if (a1 > 34066)
  {
    if (a1 != 35866)
    {
      if (a1 == 34067)
        return "Cube Map";
      return "Unknown";
    }
    return "2D Array";
  }
  else
  {
    if (a1 != 3553)
    {
      if (a1 == 32879)
        return "3D";
      return "Unknown";
    }
    return "2D";
  }
}

const char *dy_short_cube_face_string_from_enum(int a1)
{
  if ((a1 - 34069) > 5)
    return "Unknown";
  else
    return off_250D4F258[a1 - 34069];
}

const char *dy_binding_point_string_from_enum(int a1)
{
  const char *result;
  int v2;

  if (a1 > 35724)
  {
    if (a1 > 36388)
    {
      switch(a1)
      {
        case 36389:
          return "Transform Feedback";
        case 36662:
          return "Copy Read Buffer";
        case 36663:
          return "Copy Write Buffer";
        default:
          return "Unknown";
      }
    }
    else
    {
      v2 = a1 - 35983;
      result = "Draw Framebuffer";
      switch(v2)
      {
        case 0:
          result = "Transform Feedback Buffer";
          break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 25:
        case 26:
          return "Unknown";
        case 23:
          return result;
        case 24:
          result = "Renderbuffer";
          break;
        case 27:
          result = "Read Framebuffer";
          break;
        default:
          if ("Draw Framebuffer" != 35725)
            return "Unknown";
          result = "Current Program";
          break;
      }
    }
  }
  else if (a1 > 35052)
  {
    if (a1 > 35096)
    {
      if (a1 != 35097)
      {
        if (a1 == 35368)
          return "Uniform Buffer";
        return "Unknown";
      }
      return "Sampler";
    }
    else
    {
      if (a1 != 35053)
      {
        if (a1 == 35055)
          return "Pixel Unpack Buffer";
        return "Unknown";
      }
      return "Pixel Pack Buffer";
    }
  }
  else if (a1 > 34963)
  {
    if (a1 != 34964)
    {
      if (a1 == 34965)
        return "Element Array Buffer";
      return "Unknown";
    }
    return "Array Buffer";
  }
  else
  {
    if (a1 != 33370)
    {
      if (a1 == 34229)
        return "Vertex Array";
      return "Unknown";
    }
    return "Program Pipeline";
  }
  return result;
}

const char *dy_buffer_string_from_enum(int a1)
{
  if (a1 > 35344)
  {
    if (a1 > 36661)
    {
      if (a1 == 36663)
        return "Copy Write Buffer";
      if (a1 == 36662)
        return "Copy Read Buffer";
    }
    else
    {
      if (a1 == 35345)
        return "Uniform Buffer";
      if (a1 == 35982)
        return "TF Buffer";
    }
  }
  else if (a1 > 35050)
  {
    if (a1 == 35051)
      return "Pixel Pack Buffer";
    if (a1 == 35052)
      return "Pixel Unpack Buffer";
  }
  else
  {
    if (a1 == 34962)
      return "Array Buffer";
    if (a1 == 34963)
      return "Element Array Buffer";
  }
  return "Buffer";
}

const char *dy_query_target_string_from_enum(int a1)
{
  const char *v1;
  const char *v2;

  v1 = (const char *)&unk_23C65FE76;
  if (a1 == 36202)
    v1 = "Any Samples Passed Conservative";
  if (a1 == 35976)
    v2 = "Transform Feedback Primitives Written";
  else
    v2 = v1;
  if (a1 == 35887)
    return "Any Samples Passed";
  else
    return v2;
}

void sub_23C640390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C641B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C642F58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t DYGetGLGuestAppClient()
{
  uint64_t result;

  result = _guestAppClientGL;
  if (!_guestAppClientGL)
    __assert_rtn("DYGuestAppClient *DYGetGLGuestAppClient()", (const char *)&unk_23C65FE76, 0, "_guestAppClientGL != nil");
  return result;
}

id DYSetGLGuestAppClient(void *a1)
{
  id result;

  result = a1;
  _guestAppClientGL = (uint64_t)result;
  return result;
}

uint64_t DYSetContextRemappingBlock()
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return DYSetBlockPointer();
}

uint64_t init_interpose_api(void *a1)
{
  const char *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = (const char *)DYGetGLInterposeDylibPath();
  v2 = dlopen(v1, 272);
  if (v2)
  {
    v3 = v2;
    g_interpose_api = dlsym(v2, "add_per_function_profiling_data");
    if (g_interpose_api)
    {
      g_interpose_api = dlsym(v3, "HarvestRenderbuffer");
      if (g_interpose_api)
      {
        g_interpose_api = dlsym(v3, "HarvestRenderbufferInfo");
        if (g_interpose_api)
        {
          g_interpose_api = (uint64_t (*)(void))dlsym(v3, "ReserveGLObjectsAPI");
          if (g_interpose_api)
          {
            g_interpose_api = dlsym(v3, "ReserveGLVAOsAPI");
            if (g_interpose_api)
            {
              g_interpose_api = dlsym(v3, "ReserveGLProgramAPI");
              if (g_interpose_api)
              {
                g_interpose_api = dlsym(v3, "ReserveGLShaderAPI");
                if (g_interpose_api)
                {
                  g_interpose_api = dlsym(v3, "ReserveGLFenceSyncAPI");
                  if (g_interpose_api)
                  {
                    g_interpose_api = dlsym(v3, "CreatePrivateGLProgram");
                    if (g_interpose_api)
                    {
                      g_interpose_api = dlsym(v3, "CreatePrivateGLShader");
                      if (g_interpose_api)
                      {
                        g_interpose_api = dlsym(v3, "CreatePrivateGLProgramPipeline");
                        if (g_interpose_api)
                        {
                          g_interpose_api = (uint64_t)dlsym(v3, "gDYContextRemappingBlock");
                          if (g_interpose_api)
                          {
                            g_interpose_api = (uint64_t)dlsym(v3, "gDYResourceUpdateCallbackBlock");
                            if (g_interpose_api)
                            {
                              g_interpose_api = (uint64_t)dlsym(v3, "gEncodeNameReservationSPI");
                              if (g_interpose_api)
                                return dlclose(v3);
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
      }
    }
  }
  else
  {
    dlerror();
    dy_abort();
  }
  v5 = dy_abort();
  return DYHarvestRenderbuffer(v5);
}

uint64_t DYHarvestRenderbuffer(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2);
}

uint64_t DYHarvestRenderbufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3, a4);
}

uint64_t DYAddPerFunctionProfilingData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3);
}

void DYSetNameReservationEncoding(char a1)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  *(_BYTE *)g_interpose_api = a1;
}

uint64_t DYReserveGLObjects()
{
  return g_interpose_api();
}

uint64_t DYReserveGLVAOs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3);
}

uint64_t DYReserveGLProgram(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2);
}

uint64_t DYReserveGLShader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3);
}

uint64_t DYReserveGLFenceSync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3, a4);
}

uint64_t DYCreatePrivateGLProgram(uint64_t a1)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1);
}

uint64_t DYCreatePrivateGLShader(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2);
}

uint64_t DYCreatePrivateGLProgramPipeline(uint64_t a1)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1);
}

uint64_t DYSetResourceUpdateCallbackBlock()
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return DYSetBlockPointer();
}

const char *dy_string_from_enum(int a1)
{
  const char *result;
  int v2;

  if (a1 > 24719)
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 24720:
          result = "GL_PN_TRIANGLES_ATI";
          break;
        case 24721:
          result = "GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI";
          break;
        case 24722:
          result = "GL_PN_TRIANGLES_POINT_MODE_ATI";
          break;
        case 24723:
          result = "GL_PN_TRIANGLES_NORMAL_MODE_ATI";
          break;
        case 24724:
          result = "GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI";
          break;
        case 24725:
          result = "GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI";
          break;
        case 24726:
          result = "GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI";
          break;
        case 24727:
          result = "GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI";
          break;
        case 24728:
          result = "GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI";
          break;
        case 24755:
          result = "GL_POINT_CULL_MODE_ATI";
          break;
        case 24756:
          result = "GL_POINT_CULL_CENTER_ATI";
          break;
        case 24757:
          result = "GL_POINT_CULL_CLIP_ATI";
          break;
        case 32768:
          result = "GL_ABGR_EXT";
          break;
        case 32769:
          result = "GL_CONSTANT_COLOR";
          break;
        case 32770:
          result = "GL_ONE_MINUS_CONSTANT_COLOR";
          break;
        case 32771:
          result = "GL_CONSTANT_ALPHA";
          break;
        case 32772:
          result = "GL_ONE_MINUS_CONSTANT_ALPHA";
          break;
        case 32773:
          result = "GL_BLEND_COLOR";
          break;
        case 32774:
          result = "GL_FUNC_ADD";
          break;
        case 32775:
          result = "GL_MIN";
          break;
        case 32776:
          result = "GL_MAX";
          break;
        case 32777:
          result = "GL_BLEND_EQUATION_RGB";
          break;
        case 32778:
          result = "GL_FUNC_SUBTRACT";
          break;
        case 32779:
          result = "GL_FUNC_REVERSE_SUBTRACT";
          break;
        case 32784:
          result = "GL_CONVOLUTION_1D";
          break;
        case 32785:
          result = "GL_CONVOLUTION_2D";
          break;
        case 32786:
          result = "GL_SEPARABLE_2D";
          break;
        case 32787:
          result = "GL_CONVOLUTION_BORDER_MODE";
          break;
        case 32788:
          result = "GL_CONVOLUTION_FILTER_SCALE";
          break;
        case 32789:
          result = "GL_CONVOLUTION_FILTER_BIAS";
          break;
        case 32790:
          result = "GL_REDUCE";
          break;
        case 32791:
          result = "GL_CONVOLUTION_FORMAT";
          break;
        case 32792:
          result = "GL_CONVOLUTION_WIDTH";
          break;
        case 32793:
          result = "GL_CONVOLUTION_HEIGHT";
          break;
        case 32794:
          result = "GL_MAX_CONVOLUTION_WIDTH";
          break;
        case 32795:
          result = "GL_MAX_CONVOLUTION_HEIGHT";
          break;
        case 32796:
          result = "GL_POST_CONVOLUTION_RED_SCALE";
          break;
        case 32797:
          result = "GL_POST_CONVOLUTION_GREEN_SCALE";
          break;
        case 32798:
          result = "GL_POST_CONVOLUTION_BLUE_SCALE";
          break;
        case 32799:
          result = "GL_POST_CONVOLUTION_ALPHA_SCALE";
          break;
        case 32800:
          result = "GL_POST_CONVOLUTION_RED_BIAS";
          break;
        case 32801:
          result = "GL_POST_CONVOLUTION_GREEN_BIAS";
          break;
        case 32802:
          result = "GL_POST_CONVOLUTION_BLUE_BIAS";
          break;
        case 32803:
          result = "GL_POST_CONVOLUTION_ALPHA_BIAS";
          break;
        case 32804:
          result = "GL_HISTOGRAM";
          break;
        case 32805:
          result = "GL_PROXY_HISTOGRAM";
          break;
        case 32806:
          result = "GL_HISTOGRAM_WIDTH";
          break;
        case 32807:
          result = "GL_HISTOGRAM_FORMAT";
          break;
        case 32808:
          result = "GL_HISTOGRAM_RED_SIZE";
          break;
        case 32809:
          result = "GL_HISTOGRAM_GREEN_SIZE";
          break;
        case 32810:
          result = "GL_HISTOGRAM_BLUE_SIZE";
          break;
        case 32811:
          result = "GL_HISTOGRAM_ALPHA_SIZE";
          break;
        case 32812:
          result = "GL_HISTOGRAM_LUMINANCE_SIZE";
          break;
        case 32813:
          result = "GL_HISTOGRAM_SINK";
          break;
        case 32814:
          result = "GL_MINMAX";
          break;
        case 32815:
          result = "GL_MINMAX_FORMAT";
          break;
        case 32816:
          result = "GL_MINMAX_SINK";
          break;
        case 32817:
          result = "GL_TABLE_TOO_LARGE";
          break;
        case 32818:
          result = "GL_UNSIGNED_BYTE_3_3_2";
          break;
        case 32819:
          result = "GL_UNSIGNED_SHORT_4_4_4_4";
          break;
        case 32820:
          result = "GL_UNSIGNED_SHORT_5_5_5_1";
          break;
        case 32821:
          result = "GL_UNSIGNED_INT_8_8_8_8";
          break;
        case 32822:
          result = "GL_UNSIGNED_INT_10_10_10_2";
          break;
        case 32823:
          result = "GL_POLYGON_OFFSET_FILL";
          break;
        case 32824:
          result = "GL_POLYGON_OFFSET_FACTOR";
          break;
        case 32825:
          result = "GL_POLYGON_OFFSET_BIAS_EXT";
          break;
        case 32826:
          result = "GL_RESCALE_NORMAL";
          break;
        case 32827:
          result = "GL_ALPHA4";
          break;
        case 32828:
          result = "GL_ALPHA8";
          break;
        case 32829:
          result = "GL_ALPHA12";
          break;
        case 32830:
          result = "GL_ALPHA16";
          break;
        case 32831:
          result = "GL_LUMINANCE4";
          break;
        case 32832:
          result = "GL_LUMINANCE8";
          break;
        case 32833:
          result = "GL_LUMINANCE12";
          break;
        case 32834:
          result = "GL_LUMINANCE16";
          break;
        case 32835:
          result = "GL_LUMINANCE4_ALPHA4";
          break;
        case 32836:
          result = "GL_LUMINANCE6_ALPHA2";
          break;
        case 32837:
          result = "GL_LUMINANCE8_ALPHA8";
          break;
        case 32838:
          result = "GL_LUMINANCE12_ALPHA4";
          break;
        case 32839:
          result = "GL_LUMINANCE12_ALPHA12";
          break;
        case 32840:
          result = "GL_LUMINANCE16_ALPHA16";
          break;
        case 32841:
          result = "GL_INTENSITY";
          break;
        case 32842:
          result = "GL_INTENSITY4";
          break;
        case 32843:
          result = "GL_INTENSITY8";
          break;
        case 32844:
          result = "GL_INTENSITY12";
          break;
        case 32845:
          result = "GL_INTENSITY16";
          break;
        case 32846:
          result = "GL_RGB2_EXT";
          break;
        case 32847:
          result = "GL_RGB4";
          break;
        case 32848:
          result = "GL_RGB5";
          break;
        case 32849:
          result = "GL_RGB8";
          break;
        case 32850:
          result = "GL_RGB10";
          break;
        case 32851:
          result = "GL_RGB12";
          break;
        case 32852:
          result = "GL_RGB16";
          break;
        case 32853:
          result = "GL_RGBA2";
          break;
        case 32854:
          result = "GL_RGBA4";
          break;
        case 32855:
          result = "GL_RGB5_A1";
          break;
        case 32856:
          result = "GL_RGBA8";
          break;
        case 32857:
          result = "GL_RGB10_A2";
          break;
        case 32858:
          result = "GL_RGBA12";
          break;
        case 32859:
          result = "GL_RGBA16";
          break;
        case 32860:
          result = "GL_TEXTURE_RED_SIZE";
          break;
        case 32861:
          result = "GL_TEXTURE_GREEN_SIZE";
          break;
        case 32862:
          result = "GL_TEXTURE_BLUE_SIZE";
          break;
        case 32863:
          result = "GL_TEXTURE_ALPHA_SIZE";
          break;
        case 32864:
          result = "GL_TEXTURE_LUMINANCE_SIZE";
          break;
        case 32865:
          result = "GL_TEXTURE_INTENSITY_SIZE";
          break;
        case 32866:
          result = "GL_REPLACE_EXT";
          break;
        case 32867:
          result = "GL_PROXY_TEXTURE_1D";
          break;
        case 32868:
          result = "GL_PROXY_TEXTURE_2D";
          break;
        case 32869:
          result = "GL_TEXTURE_TOO_LARGE_EXT";
          break;
        case 32870:
          result = "GL_TEXTURE_PRIORITY";
          break;
        case 32871:
          result = "GL_TEXTURE_RESIDENT";
          break;
        case 32872:
          result = "GL_TEXTURE_BINDING_1D";
          break;
        case 32873:
          result = "GL_TEXTURE_BINDING_2D";
          break;
        case 32874:
          result = "GL_TEXTURE_BINDING_3D";
          break;
        case 32875:
          result = "GL_PACK_SKIP_IMAGES";
          break;
        case 32876:
          result = "GL_PACK_IMAGE_HEIGHT";
          break;
        case 32877:
          result = "GL_UNPACK_SKIP_IMAGES";
          break;
        case 32878:
          result = "GL_UNPACK_IMAGE_HEIGHT";
          break;
        case 32879:
          result = "GL_TEXTURE_3D";
          break;
        case 32880:
          result = "GL_PROXY_TEXTURE_3D";
          break;
        case 32881:
          result = "GL_TEXTURE_DEPTH";
          break;
        case 32882:
          result = "GL_TEXTURE_WRAP_R";
          break;
        case 32883:
          result = "GL_MAX_3D_TEXTURE_SIZE";
          break;
        case 32884:
          result = "GL_VERTEX_ARRAY";
          break;
        case 32885:
          result = "GL_NORMAL_ARRAY";
          break;
        case 32886:
          result = "GL_COLOR_ARRAY";
          break;
        case 32887:
          result = "GL_INDEX_ARRAY";
          break;
        case 32888:
          result = "GL_TEXTURE_COORD_ARRAY";
          break;
        case 32889:
          result = "GL_EDGE_FLAG_ARRAY";
          break;
        case 32890:
          result = "GL_VERTEX_ARRAY_SIZE";
          break;
        case 32891:
          result = "GL_VERTEX_ARRAY_TYPE";
          break;
        case 32892:
          result = "GL_VERTEX_ARRAY_STRIDE";
          break;
        case 32893:
          result = "GL_VERTEX_ARRAY_COUNT_EXT";
          break;
        case 32894:
          result = "GL_NORMAL_ARRAY_TYPE";
          break;
        case 32895:
          result = "GL_NORMAL_ARRAY_STRIDE";
          break;
        case 32896:
          result = "GL_NORMAL_ARRAY_COUNT_EXT";
          break;
        case 32897:
          result = "GL_COLOR_ARRAY_SIZE";
          break;
        case 32898:
          result = "GL_COLOR_ARRAY_TYPE";
          break;
        case 32899:
          result = "GL_COLOR_ARRAY_STRIDE";
          break;
        case 32900:
          result = "GL_COLOR_ARRAY_COUNT_EXT";
          break;
        case 32901:
          result = "GL_INDEX_ARRAY_TYPE";
          break;
        case 32902:
          result = "GL_INDEX_ARRAY_STRIDE";
          break;
        case 32903:
          result = "GL_INDEX_ARRAY_COUNT_EXT";
          break;
        case 32904:
          result = "GL_TEXTURE_COORD_ARRAY_SIZE";
          break;
        case 32905:
          result = "GL_TEXTURE_COORD_ARRAY_TYPE";
          break;
        case 32906:
          result = "GL_TEXTURE_COORD_ARRAY_STRIDE";
          break;
        case 32907:
          result = "GL_TEXTURE_COORD_ARRAY_COUNT_EXT";
          break;
        case 32908:
          result = "GL_EDGE_FLAG_ARRAY_STRIDE";
          break;
        case 32909:
          result = "GL_EDGE_FLAG_ARRAY_COUNT_EXT";
          break;
        case 32910:
          result = "GL_VERTEX_ARRAY_POINTER";
          break;
        case 32911:
          result = "GL_NORMAL_ARRAY_POINTER";
          break;
        case 32912:
          result = "GL_COLOR_ARRAY_POINTER";
          break;
        case 32913:
          result = "GL_INDEX_ARRAY_POINTER";
          break;
        case 32914:
          result = "GL_TEXTURE_COORD_ARRAY_POINTER";
          break;
        case 32915:
          result = "GL_EDGE_FLAG_ARRAY_POINTER";
          break;
        case 32925:
          result = "GL_MULTISAMPLE";
          break;
        case 32926:
          result = "GL_SAMPLE_ALPHA_TO_COVERAGE";
          break;
        case 32927:
          result = "GL_SAMPLE_ALPHA_TO_ONE";
          break;
        case 32928:
          result = "GL_SAMPLE_COVERAGE";
          break;
        case 32936:
          result = "GL_SAMPLE_BUFFERS";
          break;
        case 32937:
          result = "GL_SAMPLES";
          break;
        case 32938:
          result = "GL_SAMPLE_COVERAGE_VALUE";
          break;
        case 32939:
          result = "GL_SAMPLE_COVERAGE_INVERT";
          break;
        case 32945:
          result = "GL_COLOR_MATRIX";
          break;
        case 32946:
          result = "GL_COLOR_MATRIX_STACK_DEPTH";
          break;
        case 32947:
          result = "GL_MAX_COLOR_MATRIX_STACK_DEPTH";
          break;
        case 32948:
          result = "GL_POST_COLOR_MATRIX_RED_SCALE";
          break;
        case 32949:
          result = "GL_POST_COLOR_MATRIX_GREEN_SCALE";
          break;
        case 32950:
          result = "GL_POST_COLOR_MATRIX_BLUE_SCALE";
          break;
        case 32951:
          result = "GL_POST_COLOR_MATRIX_ALPHA_SCALE";
          break;
        case 32952:
          result = "GL_POST_COLOR_MATRIX_RED_BIAS";
          break;
        case 32953:
          result = "GL_POST_COLOR_MATRIX_GREEN_BIAS";
          break;
        case 32954:
          result = "GL_POST_COLOR_MATRIX_BLUE_BIAS";
          break;
        case 32955:
          result = "GL_POST_COLOR_MATRIX_ALPHA_BIAS";
          break;
        case 32959:
          result = "GL_TEXTURE_COMPARE_FAIL_VALUE_ARB";
          break;
        case 32968:
          result = "GL_BLEND_DST_RGB";
          break;
        case 32969:
          result = "GL_BLEND_SRC_RGB";
          break;
        case 32970:
          result = "GL_BLEND_DST_ALPHA";
          break;
        case 32971:
          result = "GL_BLEND_SRC_ALPHA";
          break;
        case 32976:
          result = "GL_COLOR_TABLE";
          break;
        case 32977:
          result = "GL_POST_CONVOLUTION_COLOR_TABLE";
          break;
        case 32978:
          result = "GL_POST_COLOR_MATRIX_COLOR_TABLE";
          break;
        case 32979:
          result = "GL_PROXY_COLOR_TABLE";
          break;
        case 32980:
          result = "GL_PROXY_POST_CONVOLUTION_COLOR_TABLE";
          break;
        case 32981:
          result = "GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE";
          break;
        case 32982:
          result = "GL_COLOR_TABLE_SCALE";
          break;
        case 32983:
          result = "GL_COLOR_TABLE_BIAS";
          break;
        case 32984:
          result = "GL_COLOR_TABLE_FORMAT";
          break;
        case 32985:
          result = "GL_COLOR_TABLE_WIDTH";
          break;
        case 32986:
          result = "GL_COLOR_TABLE_RED_SIZE";
          break;
        case 32987:
          result = "GL_COLOR_TABLE_GREEN_SIZE";
          break;
        case 32988:
          result = "GL_COLOR_TABLE_BLUE_SIZE";
          break;
        case 32989:
          result = "GL_COLOR_TABLE_ALPHA_SIZE";
          break;
        case 32990:
          result = "GL_COLOR_TABLE_LUMINANCE_SIZE";
          break;
        case 32991:
          result = "GL_COLOR_TABLE_INTENSITY_SIZE";
          break;
        case 32992:
          result = "GL_BGR";
          break;
        case 32993:
          result = "GL_BGRA";
          break;
        case 32994:
          result = "GL_COLOR_INDEX1_EXT";
          break;
        case 32995:
          result = "GL_COLOR_INDEX2_EXT";
          break;
        case 32996:
          result = "GL_COLOR_INDEX4_EXT";
          break;
        case 32997:
          result = "GL_COLOR_INDEX8_EXT";
          break;
        case 32998:
          result = "GL_COLOR_INDEX12_EXT";
          break;
        case 32999:
          result = "GL_COLOR_INDEX16_EXT";
          break;
        case 33000:
          result = "GL_MAX_ELEMENTS_VERTICES";
          break;
        case 33001:
          result = "GL_MAX_ELEMENTS_INDICES";
          break;
        case 33005:
          result = "GL_TEXTURE_INDEX_SIZE_EXT";
          break;
        case 33008:
          result = "GL_CLIP_VOLUME_CLIPPING_HINT_EXT";
          break;
        case 33062:
          result = "GL_POINT_SIZE_MIN";
          break;
        case 33063:
          result = "GL_POINT_SIZE_MAX";
          break;
        case 33064:
          result = "GL_POINT_FADE_THRESHOLD_SIZE";
          break;
        case 33065:
          result = "GL_POINT_DISTANCE_ATTENUATION";
          break;
        case 33069:
          result = "GL_CLAMP_TO_BORDER";
          break;
        case 33071:
          result = "GL_CLAMP_TO_EDGE";
          break;
        case 33082:
          result = "GL_TEXTURE_MIN_LOD";
          break;
        case 33083:
          result = "GL_TEXTURE_MAX_LOD";
          break;
        case 33084:
          result = "GL_TEXTURE_BASE_LEVEL";
          break;
        case 33085:
          result = "GL_TEXTURE_MAX_LEVEL";
          break;
        case 33104:
          result = "GL_IGNORE_BORDER_HP";
          break;
        case 33105:
          result = "GL_CONSTANT_BORDER";
          break;
        case 33107:
          result = "GL_REPLICATE_BORDER";
          break;
        case 33108:
          result = "GL_CONVOLUTION_BORDER_COLOR";
          break;
        case 33169:
          result = "GL_GENERATE_MIPMAP";
          break;
        case 33170:
          result = "GL_GENERATE_MIPMAP_HINT";
          break;
        case 33189:
          result = "GL_DEPTH_COMPONENT16";
          break;
        case 33190:
          result = "GL_DEPTH_COMPONENT24";
          break;
        case 33191:
          result = "GL_DEPTH_COMPONENT32";
          break;
        case 33192:
          result = "GL_ARRAY_ELEMENT_LOCK_FIRST_EXT";
          break;
        case 33193:
          result = "GL_ARRAY_ELEMENT_LOCK_COUNT_EXT";
          break;
        case 33272:
          result = "GL_LIGHT_MODEL_COLOR_CONTROL";
          break;
        case 33273:
          result = "GL_SINGLE_COLOR";
          break;
        case 33274:
          result = "GL_SEPARATE_SPECULAR_COLOR";
          break;
        case 33275:
          result = "GL_SHARED_TEXTURE_PALETTE_EXT";
          break;
        case 33280:
          result = "GL_TEXT_FRAGMENT_SHADER_ATI";
          break;
        case 33296:
          result = "GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING";
          break;
        case 33297:
          result = "GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE";
          break;
        case 33298:
          result = "GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE";
          break;
        case 33299:
          result = "GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE";
          break;
        case 33300:
          result = "GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE";
          break;
        case 33301:
          result = "GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE";
          break;
        case 33302:
          result = "GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE";
          break;
        case 33303:
          result = "GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE";
          break;
        case 33304:
          result = "GL_FRAMEBUFFER_DEFAULT";
          break;
        case 33305:
          result = "GL_FRAMEBUFFER_UNDEFINED";
          break;
        case 33306:
          result = "GL_DEPTH_STENCIL_ATTACHMENT";
          break;
        case 33307:
          result = "GL_MAJOR_VERSION";
          break;
        case 33308:
          result = "GL_MINOR_VERSION";
          break;
        case 33309:
          result = "GL_NUM_EXTENSIONS";
          break;
        case 33310:
          result = "GL_CONTEXT_FLAGS";
          break;
        case 33317:
          result = "GL_COMPRESSED_RED";
          break;
        case 33318:
          result = "GL_COMPRESSED_RG";
          break;
        case 33319:
          result = "GL_RG";
          break;
        case 33320:
          result = "GL_RG_INTEGER";
          break;
        case 33321:
          result = "GL_R8";
          break;
        case 33322:
          result = "GL_R16";
          break;
        case 33323:
          result = "GL_RG8";
          break;
        case 33324:
          result = "GL_RG16";
          break;
        case 33325:
          result = "GL_R16F";
          break;
        case 33326:
          result = "GL_R32F";
          break;
        case 33327:
          result = "GL_RG16F";
          break;
        case 33328:
          result = "GL_RG32F";
          break;
        case 33329:
          result = "GL_R8I";
          break;
        case 33330:
          result = "GL_R8UI";
          break;
        case 33331:
          result = "GL_R16I";
          break;
        case 33332:
          result = "GL_R16UI";
          break;
        case 33333:
          result = "GL_R32I";
          break;
        case 33334:
          result = "GL_R32UI";
          break;
        case 33335:
          result = "GL_RG8I";
          break;
        case 33336:
          result = "GL_RG8UI";
          break;
        case 33337:
          result = "GL_RG16I";
          break;
        case 33338:
          result = "GL_RG16UI";
          break;
        case 33339:
          result = "GL_RG32I";
          break;
        case 33340:
          result = "GL_RG32UI";
          break;
        case 33344:
          result = "GL_SYNC_CL_EVENT_ARB";
          break;
        case 33345:
          result = "GL_SYNC_CL_EVENT_COMPLETE_ARB";
          break;
        case 33367:
          result = "GL_PROGRAM_BINARY_RETRIEVABLE_HINT";
          break;
        case 33368:
          result = "GL_PROGRAM_SEPARABLE";
          break;
        case 33369:
          result = "GL_ACTIVE_PROGRAM";
          break;
        case 33370:
          result = "GL_PROGRAM_PIPELINE_BINDING";
          break;
        case 33371:
          result = "GL_MAX_VIEWPORTS";
          break;
        case 33372:
          result = "GL_VIEWPORT_SUBPIXEL_BITS";
          break;
        case 33373:
          result = "GL_VIEWPORT_BOUNDS_RANGE";
          break;
        case 33374:
          result = "GL_LAYER_PROVOKING_VERTEX";
          break;
        case 33375:
          result = "GL_VIEWPORT_INDEX_PROVOKING_VERTEX";
          break;
        case 33376:
          result = "GL_UNDEFINED_VERTEX";
          break;
        case 33503:
          result = "GL_TEXTURE_IMMUTABLE_LEVELS";
          break;
        case 33510:
          result = "GL_SAMPLER";
          break;
        case 33634:
          result = "GL_UNSIGNED_BYTE_2_3_3_REV";
          break;
        case 33635:
          result = "GL_UNSIGNED_SHORT_5_6_5";
          break;
        case 33636:
          result = "GL_UNSIGNED_SHORT_5_6_5_REV";
          break;
        case 33637:
          result = "GL_UNSIGNED_SHORT_4_4_4_4_REV";
          break;
        case 33638:
          result = "GL_UNSIGNED_SHORT_1_5_5_5_REV";
          break;
        case 33639:
          result = "GL_UNSIGNED_INT_8_8_8_8_REV";
          break;
        case 33640:
          result = "GL_UNSIGNED_INT_2_10_10_10_REV";
          break;
        case 33648:
          result = "GL_MIRRORED_REPEAT";
          break;
        case 33776:
          result = "GL_COMPRESSED_RGB_S3TC_DXT1_EXT";
          break;
        case 33777:
          result = "GL_COMPRESSED_RGBA_S3TC_DXT1_EXT";
          break;
        case 33778:
          result = "GL_COMPRESSED_RGBA_S3TC_DXT3_EXT";
          break;
        case 33779:
          result = "GL_COMPRESSED_RGBA_S3TC_DXT5_EXT";
          break;
        case 33872:
          result = "GL_FOG_COORD_SRC";
          break;
        case 33873:
          result = "GL_FOG_COORD";
          break;
        case 33874:
          result = "GL_FRAGMENT_DEPTH";
          break;
        case 33875:
          result = "GL_CURRENT_FOG_COORDINATE_EXT";
          break;
        case 33876:
          result = "GL_FOG_COORD_ARRAY_TYPE";
          break;
        case 33877:
          result = "GL_FOG_COORD_ARRAY_STRIDE";
          break;
        case 33878:
          result = "GL_FOG_COORD_ARRAY_POINTER";
          break;
        case 33879:
          result = "GL_FOG_COORD_ARRAY";
          break;
        case 33880:
          result = "GL_COLOR_SUM";
          break;
        case 33881:
          result = "GL_CURRENT_SECONDARY_COLOR";
          break;
        case 33882:
          result = "GL_SECONDARY_COLOR_ARRAY_SIZE";
          break;
        case 33883:
          result = "GL_SECONDARY_COLOR_ARRAY_TYPE";
          break;
        case 33884:
          result = "GL_SECONDARY_COLOR_ARRAY_STRIDE";
          break;
        case 33885:
          result = "GL_SECONDARY_COLOR_ARRAY_POINTER";
          break;
        case 33886:
          result = "GL_SECONDARY_COLOR_ARRAY";
          break;
        case 33887:
          result = "GL_CURRENT_RASTER_SECONDARY_COLOR";
          break;
        case 33901:
          result = "GL_ALIASED_POINT_SIZE_RANGE";
          break;
        case 33902:
          result = "GL_ALIASED_LINE_WIDTH_RANGE";
          break;
        case 33984:
          result = "GL_TEXTURE0";
          break;
        case 33985:
          result = "GL_TEXTURE1";
          break;
        case 33986:
          result = "GL_TEXTURE2";
          break;
        case 33987:
          result = "GL_TEXTURE3";
          break;
        case 33988:
          result = "GL_TEXTURE4";
          break;
        case 33989:
          result = "GL_TEXTURE5";
          break;
        case 33990:
          result = "GL_TEXTURE6";
          break;
        case 33991:
          result = "GL_TEXTURE7";
          break;
        case 33992:
          result = "GL_TEXTURE8";
          break;
        case 33993:
          result = "GL_TEXTURE9";
          break;
        case 33994:
          result = "GL_TEXTURE10";
          break;
        case 33995:
          result = "GL_TEXTURE11";
          break;
        case 33996:
          result = "GL_TEXTURE12";
          break;
        case 33997:
          result = "GL_TEXTURE13";
          break;
        case 33998:
          result = "GL_TEXTURE14";
          break;
        case 33999:
          result = "GL_TEXTURE15";
          break;
        case 34000:
          result = "GL_TEXTURE16";
          break;
        case 34001:
          result = "GL_TEXTURE17";
          break;
        case 34002:
          result = "GL_TEXTURE18";
          break;
        case 34003:
          result = "GL_TEXTURE19";
          break;
        case 34004:
          result = "GL_TEXTURE20";
          break;
        case 34005:
          result = "GL_TEXTURE21";
          break;
        case 34006:
          result = "GL_TEXTURE22";
          break;
        case 34007:
          result = "GL_TEXTURE23";
          break;
        case 34008:
          result = "GL_TEXTURE24";
          break;
        case 34009:
          result = "GL_TEXTURE25";
          break;
        case 34010:
          result = "GL_TEXTURE26";
          break;
        case 34011:
          result = "GL_TEXTURE27";
          break;
        case 34012:
          result = "GL_TEXTURE28";
          break;
        case 34013:
          result = "GL_TEXTURE29";
          break;
        case 34014:
          result = "GL_TEXTURE30";
          break;
        case 34015:
          result = "GL_TEXTURE31";
          break;
        case 34016:
          result = "GL_ACTIVE_TEXTURE";
          break;
        case 34017:
          result = "GL_CLIENT_ACTIVE_TEXTURE";
          break;
        case 34018:
          result = "GL_MAX_TEXTURE_UNITS";
          break;
        case 34019:
          result = "GL_TRANSPOSE_MODELVIEW_MATRIX";
          break;
        case 34020:
          result = "GL_TRANSPOSE_PROJECTION_MATRIX";
          break;
        case 34021:
          result = "GL_TRANSPOSE_TEXTURE_MATRIX";
          break;
        case 34022:
          result = "GL_TRANSPOSE_COLOR_MATRIX";
          break;
        case 34023:
          result = "GL_SUBTRACT";
          break;
        case 34024:
          result = "GL_MAX_RENDERBUFFER_SIZE";
          break;
        case 34025:
          result = "GL_COMPRESSED_ALPHA";
          break;
        case 34026:
          result = "GL_COMPRESSED_LUMINANCE";
          break;
        case 34027:
          result = "GL_COMPRESSED_LUMINANCE_ALPHA";
          break;
        case 34028:
          result = "GL_COMPRESSED_INTENSITY";
          break;
        case 34029:
          result = "GL_COMPRESSED_RGB";
          break;
        case 34030:
          result = "GL_COMPRESSED_RGBA";
          break;
        case 34031:
          result = "GL_TEXTURE_COMPRESSION_HINT";
          break;
        case 34032:
          result = "GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER";
          break;
        case 34033:
          result = "GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER";
          break;
        case 34037:
          result = "GL_TEXTURE_RECTANGLE";
          break;
        case 34038:
          result = "GL_TEXTURE_BINDING_RECTANGLE";
          break;
        case 34039:
          result = "GL_PROXY_TEXTURE_RECTANGLE";
          break;
        case 34040:
          result = "GL_MAX_RECTANGLE_TEXTURE_SIZE";
          break;
        case 34041:
          result = "GL_DEPTH_STENCIL";
          break;
        case 34042:
          result = "GL_UNSIGNED_INT_24_8";
          break;
        case 34045:
          result = "GL_MAX_TEXTURE_LOD_BIAS";
          break;
        case 34046:
          result = "GL_TEXTURE_MAX_ANISOTROPY_EXT";
          break;
        case 34047:
          result = "GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT";
          break;
        case 34048:
          result = "GL_TEXTURE_FILTER_CONTROL";
          break;
        case 34049:
          result = "GL_TEXTURE_LOD_BIAS";
          break;
        case 34052:
          result = "GL_MAX_SHININESS_NV";
          break;
        case 34053:
          result = "GL_MAX_SPOT_EXPONENT_NV";
          break;
        case 34055:
          result = "GL_INCR_WRAP";
          break;
        case 34056:
          result = "GL_DECR_WRAP";
          break;
        case 34058:
          result = "GL_MODELVIEW1_ARB";
          break;
        case 34065:
          result = "GL_NORMAL_MAP";
          break;
        case 34066:
          result = "GL_REFLECTION_MAP";
          break;
        case 34067:
          result = "GL_TEXTURE_CUBE_MAP";
          break;
        case 34068:
          result = "GL_TEXTURE_BINDING_CUBE_MAP";
          break;
        case 34069:
          result = "GL_TEXTURE_CUBE_MAP_POSITIVE_X";
          break;
        case 34070:
          result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_X";
          break;
        case 34071:
          result = "GL_TEXTURE_CUBE_MAP_POSITIVE_Y";
          break;
        case 34072:
          result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_Y";
          break;
        case 34073:
          result = "GL_TEXTURE_CUBE_MAP_POSITIVE_Z";
          break;
        case 34074:
          result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_Z";
          break;
        case 34075:
          result = "GL_PROXY_TEXTURE_CUBE_MAP";
          break;
        case 34076:
          result = "GL_MAX_CUBE_MAP_TEXTURE_SIZE";
          break;
        case 34077:
          result = "GL_VERTEX_ARRAY_RANGE_APPLE";
          break;
        case 34078:
          result = "GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE";
          break;
        case 34079:
          result = "GL_VERTEX_ARRAY_STORAGE_HINT_APPLE";
          break;
        case 34080:
          result = "GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_APPLE";
          break;
        case 34081:
          result = "GL_VERTEX_ARRAY_RANGE_POINTER_APPLE";
          break;
        case 34082:
          result = "GL_REGISTER_COMBINERS_NV";
          break;
        case 34083:
          result = "GL_VARIABLE_A_NV";
          break;
        case 34084:
          result = "GL_VARIABLE_B_NV";
          break;
        case 34085:
          result = "GL_VARIABLE_C_NV";
          break;
        case 34086:
          result = "GL_VARIABLE_D_NV";
          break;
        case 34087:
          result = "GL_VARIABLE_E_NV";
          break;
        case 34088:
          result = "GL_VARIABLE_F_NV";
          break;
        case 34089:
          result = "GL_VARIABLE_G_NV";
          break;
        case 34090:
          result = "GL_CONSTANT_COLOR0_NV";
          break;
        case 34091:
          result = "GL_CONSTANT_COLOR1_NV";
          break;
        case 34092:
          result = "GL_PRIMARY_COLOR_NV";
          break;
        case 34093:
          result = "GL_SECONDARY_COLOR_NV";
          break;
        case 34094:
          result = "GL_SPARE0_NV";
          break;
        case 34095:
          result = "GL_SPARE1_NV";
          break;
        case 34096:
          result = "GL_DISCARD_NV";
          break;
        case 34097:
          result = "GL_E_TIMES_F_NV";
          break;
        case 34098:
          result = "GL_SPARE0_PLUS_SECONDARY_COLOR_NV";
          break;
        case 34099:
          result = "GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV";
          break;
        case 34100:
          result = "GL_MULTISAMPLE_FILTER_HINT_NV";
          break;
        case 34101:
          result = "GL_PER_STAGE_CONSTANTS_NV";
          break;
        case 34102:
          result = "GL_UNSIGNED_IDENTITY_NV";
          break;
        case 34103:
          result = "GL_UNSIGNED_INVERT_NV";
          break;
        case 34104:
          result = "GL_EXPAND_NORMAL_NV";
          break;
        case 34105:
          result = "GL_EXPAND_NEGATE_NV";
          break;
        case 34106:
          result = "GL_HALF_BIAS_NORMAL_NV";
          break;
        case 34107:
          result = "GL_HALF_BIAS_NEGATE_NV";
          break;
        case 34108:
          result = "GL_SIGNED_IDENTITY_NV";
          break;
        case 34109:
          result = "GL_SIGNED_NEGATE_NV";
          break;
        case 34110:
          result = "GL_SCALE_BY_TWO_NV";
          break;
        case 34111:
          result = "GL_SCALE_BY_FOUR_NV";
          break;
        case 34112:
          result = "GL_SCALE_BY_ONE_HALF_NV";
          break;
        case 34113:
          result = "GL_BIAS_BY_NEGATIVE_ONE_HALF_NV";
          break;
        case 34114:
          result = "GL_COMBINER_INPUT_NV";
          break;
        case 34115:
          result = "GL_COMBINER_MAPPING_NV";
          break;
        case 34116:
          result = "GL_COMBINER_COMPONENT_USAGE_NV";
          break;
        case 34117:
          result = "GL_COMBINER_AB_DOT_PRODUCT_NV";
          break;
        case 34118:
          result = "GL_COMBINER_CD_DOT_PRODUCT_NV";
          break;
        case 34119:
          result = "GL_COMBINER_MUX_SUM_NV";
          break;
        case 34120:
          result = "GL_COMBINER_SCALE_NV";
          break;
        case 34121:
          result = "GL_COMBINER_BIAS_NV";
          break;
        case 34122:
          result = "GL_COMBINER_AB_OUTPUT_NV";
          break;
        case 34123:
          result = "GL_COMBINER_CD_OUTPUT_NV";
          break;
        case 34124:
          result = "GL_COMBINER_SUM_OUTPUT_NV";
          break;
        case 34125:
          result = "GL_MAX_GENERAL_COMBINERS_NV";
          break;
        case 34126:
          result = "GL_NUM_GENERAL_COMBINERS_NV";
          break;
        case 34127:
          result = "GL_COLOR_SUM_CLAMP_NV";
          break;
        case 34128:
          result = "GL_COMBINER0_NV";
          break;
        case 34129:
          result = "GL_COMBINER1_NV";
          break;
        case 34130:
          result = "GL_COMBINER2_NV";
          break;
        case 34131:
          result = "GL_COMBINER3_NV";
          break;
        case 34132:
          result = "GL_COMBINER4_NV";
          break;
        case 34133:
          result = "GL_COMBINER5_NV";
          break;
        case 34134:
          result = "GL_COMBINER6_NV";
          break;
        case 34135:
          result = "GL_COMBINER7_NV";
          break;
        case 34138:
          result = "GL_FOG_DISTANCE_MODE_NV";
          break;
        case 34139:
          result = "GL_EYE_RADIAL_NV";
          break;
        case 34140:
          result = "GL_EYE_PLANE_ABSOLUTE_NV";
          break;
        case 34160:
          result = "GL_COMBINE";
          break;
        case 34161:
          result = "GL_COMBINE_RGB";
          break;
        case 34162:
          result = "GL_COMBINE_ALPHA";
          break;
        case 34163:
          result = "GL_RGB_SCALE";
          break;
        case 34164:
          result = "GL_ADD_SIGNED";
          break;
        case 34165:
          result = "GL_INTERPOLATE";
          break;
        case 34166:
          result = "GL_CONSTANT";
          break;
        case 34167:
          result = "GL_PRIMARY_COLOR";
          break;
        case 34168:
          result = "GL_PREVIOUS";
          break;
        case 34176:
          result = "GL_SRC0_RGB";
          break;
        case 34177:
          result = "GL_SRC1_RGB";
          break;
        case 34178:
          result = "GL_SRC2_RGB";
          break;
        case 34184:
          result = "GL_SRC0_ALPHA";
          break;
        case 34185:
          result = "GL_SRC1_ALPHA";
          break;
        case 34186:
          result = "GL_SRC2_ALPHA";
          break;
        case 34192:
          result = "GL_OPERAND0_RGB";
          break;
        case 34193:
          result = "GL_OPERAND1_RGB";
          break;
        case 34194:
          result = "GL_OPERAND2_RGB";
          break;
        case 34200:
          result = "GL_OPERAND0_ALPHA";
          break;
        case 34201:
          result = "GL_OPERAND1_ALPHA";
          break;
        case 34202:
          result = "GL_OPERAND2_ALPHA";
          break;
        case 34224:
          result = "GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE";
          break;
        case 34225:
          result = "GL_TRANSFORM_HINT_APPLE";
          break;
        case 34226:
          result = "GL_UNPACK_CLIENT_STORAGE_APPLE";
          break;
        case 34227:
          result = "GL_BUFFER_OBJECT_APPLE";
          break;
        case 34228:
          result = "GL_STORAGE_CLIENT_APPLE";
          break;
        case 34229:
          result = "GL_VERTEX_ARRAY_BINDING";
          break;
        case 34230:
          result = "GL_TEXTURE_MINIMIZE_STORAGE_APPLE";
          break;
        case 34231:
          result = "GL_TEXTURE_RANGE_LENGTH_APPLE";
          break;
        case 34232:
          result = "GL_TEXTURE_RANGE_POINTER_APPLE";
          break;
        case 34233:
          result = "GL_YCBCR_422_APPLE";
          break;
        case 34234:
          result = "GL_UNSIGNED_SHORT_8_8_APPLE";
          break;
        case 34235:
          result = "GL_UNSIGNED_SHORT_8_8_REV_APPLE";
          break;
        case 34236:
          result = "GL_TEXTURE_STORAGE_HINT_APPLE";
          break;
        case 34237:
          result = "GL_STORAGE_PRIVATE_APPLE";
          break;
        case 34238:
          result = "GL_STORAGE_CACHED_APPLE";
          break;
        case 34239:
          result = "GL_STORAGE_SHARED_APPLE";
          break;
        case 34336:
          result = "GL_VERTEX_PROGRAM_ARB";
          break;
        case 34337:
          result = "GL_VERTEX_STATE_PROGRAM_NV";
          break;
        case 34338:
          result = "GL_VERTEX_ATTRIB_ARRAY_ENABLED";
          break;
        case 34339:
          result = "GL_VERTEX_ATTRIB_ARRAY_SIZE";
          break;
        case 34340:
          result = "GL_VERTEX_ATTRIB_ARRAY_STRIDE";
          break;
        case 34341:
          result = "GL_VERTEX_ATTRIB_ARRAY_TYPE";
          break;
        case 34342:
          result = "GL_CURRENT_VERTEX_ATTRIB";
          break;
        case 34343:
          result = "GL_PROGRAM_LENGTH_ARB";
          break;
        case 34344:
          result = "GL_PROGRAM_STRING_ARB";
          break;
        case 34345:
          result = "GL_MODELVIEW_PROJECTION_NV";
          break;
        case 34346:
          result = "GL_IDENTITY_NV";
          break;
        case 34347:
          result = "GL_INVERSE_NV";
          break;
        case 34348:
          result = "GL_TRANSPOSE_NV";
          break;
        case 34349:
          result = "GL_INVERSE_TRANSPOSE_NV";
          break;
        case 34350:
          result = "GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB";
          break;
        case 34351:
          result = "GL_MAX_PROGRAM_MATRICES_ARB";
          break;
        case 34352:
          result = "GL_MATRIX0_NV";
          break;
        case 34353:
          result = "GL_MATRIX1_NV";
          break;
        case 34354:
          result = "GL_MATRIX2_NV";
          break;
        case 34355:
          result = "GL_MATRIX3_NV";
          break;
        case 34356:
          result = "GL_MATRIX4_NV";
          break;
        case 34357:
          result = "GL_MATRIX5_NV";
          break;
        case 34358:
          result = "GL_MATRIX6_NV";
          break;
        case 34359:
          result = "GL_MATRIX7_NV";
          break;
        case 34368:
          result = "GL_CURRENT_MATRIX_STACK_DEPTH_ARB";
          break;
        case 34369:
          result = "GL_CURRENT_MATRIX_ARB";
          break;
        case 34370:
          result = "GL_PROGRAM_POINT_SIZE";
          break;
        case 34371:
          result = "GL_VERTEX_PROGRAM_TWO_SIDE";
          break;
        case 34372:
          result = "GL_PROGRAM_PARAMETER_NV";
          break;
        case 34373:
          result = "GL_VERTEX_ATTRIB_ARRAY_POINTER";
          break;
        case 34374:
          result = "GL_PROGRAM_TARGET_NV";
          break;
        case 34375:
          result = "GL_PROGRAM_RESIDENT_NV";
          break;
        case 34376:
          result = "GL_TRACK_MATRIX_NV";
          break;
        case 34377:
          result = "GL_TRACK_MATRIX_TRANSFORM_NV";
          break;
        case 34378:
          result = "GL_VERTEX_PROGRAM_BINDING_NV";
          break;
        case 34379:
          result = "GL_PROGRAM_ERROR_POSITION_ARB";
          break;
        case 34380:
          result = "GL_OFFSET_TEXTURE_RECTANGLE_NV";
          break;
        case 34381:
          result = "GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV";
          break;
        case 34382:
          result = "GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV";
          break;
        case 34383:
          result = "GL_DEPTH_CLAMP";
          break;
        case 34384:
          result = "GL_VERTEX_ATTRIB_ARRAY0_NV";
          break;
        case 34385:
          result = "GL_VERTEX_ATTRIB_ARRAY1_NV";
          break;
        case 34386:
          result = "GL_VERTEX_ATTRIB_ARRAY2_NV";
          break;
        case 34387:
          result = "GL_VERTEX_ATTRIB_ARRAY3_NV";
          break;
        case 34388:
          result = "GL_VERTEX_ATTRIB_ARRAY4_NV";
          break;
        case 34389:
          result = "GL_VERTEX_ATTRIB_ARRAY5_NV";
          break;
        case 34390:
          result = "GL_VERTEX_ATTRIB_ARRAY6_NV";
          break;
        case 34391:
          result = "GL_VERTEX_ATTRIB_ARRAY7_NV";
          break;
        case 34392:
          result = "GL_VERTEX_ATTRIB_ARRAY8_NV";
          break;
        case 34393:
          result = "GL_VERTEX_ATTRIB_ARRAY9_NV";
          break;
        case 34394:
          result = "GL_VERTEX_ATTRIB_ARRAY10_NV";
          break;
        case 34395:
          result = "GL_VERTEX_ATTRIB_ARRAY11_NV";
          break;
        case 34396:
          result = "GL_VERTEX_ATTRIB_ARRAY12_NV";
          break;
        case 34397:
          result = "GL_VERTEX_ATTRIB_ARRAY13_NV";
          break;
        case 34398:
          result = "GL_VERTEX_ATTRIB_ARRAY14_NV";
          break;
        case 34399:
          result = "GL_VERTEX_ATTRIB_ARRAY15_NV";
          break;
        case 34400:
          result = "GL_MAP1_VERTEX_ATTRIB0_4_NV";
          break;
        case 34401:
          result = "GL_MAP1_VERTEX_ATTRIB1_4_NV";
          break;
        case 34402:
          result = "GL_MAP1_VERTEX_ATTRIB2_4_NV";
          break;
        case 34403:
          result = "GL_MAP1_VERTEX_ATTRIB3_4_NV";
          break;
        case 34404:
          result = "GL_MAP1_VERTEX_ATTRIB4_4_NV";
          break;
        case 34405:
          result = "GL_MAP1_VERTEX_ATTRIB5_4_NV";
          break;
        case 34406:
          result = "GL_MAP1_VERTEX_ATTRIB6_4_NV";
          break;
        case 34407:
          result = "GL_MAP1_VERTEX_ATTRIB7_4_NV";
          break;
        case 34408:
          result = "GL_MAP1_VERTEX_ATTRIB8_4_NV";
          break;
        case 34409:
          result = "GL_MAP1_VERTEX_ATTRIB9_4_NV";
          break;
        case 34410:
          result = "GL_MAP1_VERTEX_ATTRIB10_4_NV";
          break;
        case 34411:
          result = "GL_MAP1_VERTEX_ATTRIB11_4_NV";
          break;
        case 34412:
          result = "GL_MAP1_VERTEX_ATTRIB12_4_NV";
          break;
        case 34413:
          result = "GL_MAP1_VERTEX_ATTRIB13_4_NV";
          break;
        case 34414:
          result = "GL_MAP1_VERTEX_ATTRIB14_4_NV";
          break;
        case 34415:
          result = "GL_MAP1_VERTEX_ATTRIB15_4_NV";
          break;
        case 34416:
          result = "GL_MAP2_VERTEX_ATTRIB0_4_NV";
          break;
        case 34417:
          result = "GL_MAP2_VERTEX_ATTRIB1_4_NV";
          break;
        case 34418:
          result = "GL_MAP2_VERTEX_ATTRIB2_4_NV";
          break;
        case 34419:
          result = "GL_MAP2_VERTEX_ATTRIB3_4_NV";
          break;
        case 34420:
          result = "GL_MAP2_VERTEX_ATTRIB4_4_NV";
          break;
        case 34421:
          result = "GL_MAP2_VERTEX_ATTRIB5_4_NV";
          break;
        case 34422:
          result = "GL_MAP2_VERTEX_ATTRIB6_4_NV";
          break;
        case 34423:
          result = "GL_PROGRAM_BINDING_ARB";
          break;
        case 34424:
          result = "GL_MAP2_VERTEX_ATTRIB8_4_NV";
          break;
        case 34425:
          result = "GL_MAP2_VERTEX_ATTRIB9_4_NV";
          break;
        case 34426:
          result = "GL_MAP2_VERTEX_ATTRIB10_4_NV";
          break;
        case 34427:
          result = "GL_MAP2_VERTEX_ATTRIB11_4_NV";
          break;
        case 34428:
          result = "GL_MAP2_VERTEX_ATTRIB12_4_NV";
          break;
        case 34429:
          result = "GL_MAP2_VERTEX_ATTRIB13_4_NV";
          break;
        case 34430:
          result = "GL_MAP2_VERTEX_ATTRIB14_4_NV";
          break;
        case 34431:
          result = "GL_MAP2_VERTEX_ATTRIB15_4_NV";
          break;
        case 34464:
          result = "GL_TEXTURE_COMPRESSED_IMAGE_SIZE";
          break;
        case 34465:
          result = "GL_TEXTURE_COMPRESSED";
          break;
        case 34466:
          result = "GL_NUM_COMPRESSED_TEXTURE_FORMATS";
          break;
        case 34467:
          result = "GL_COMPRESSED_TEXTURE_FORMATS";
          break;
        case 34468:
          result = "GL_MAX_VERTEX_UNITS_ARB";
          break;
        case 34469:
          result = "GL_ACTIVE_VERTEX_UNITS_ARB";
          break;
        case 34470:
          result = "GL_WEIGHT_SUM_UNITY_ARB";
          break;
        case 34471:
          result = "GL_VERTEX_BLEND_ARB";
          break;
        case 34472:
          result = "GL_CURRENT_WEIGHT_ARB";
          break;
        case 34473:
          result = "GL_WEIGHT_ARRAY_TYPE_ARB";
          break;
        case 34474:
          result = "GL_WEIGHT_ARRAY_STRIDE_ARB";
          break;
        case 34475:
          result = "GL_WEIGHT_ARRAY_SIZE_ARB";
          break;
        case 34476:
          result = "GL_WEIGHT_ARRAY_POINTER_ARB";
          break;
        case 34477:
          result = "GL_WEIGHT_ARRAY_ARB";
          break;
        case 34478:
          result = "GL_DOT3_RGB";
          break;
        case 34479:
          result = "GL_DOT3_RGBA";
          break;
        case 34521:
          result = "GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV";
          break;
        case 34522:
          result = "GL_UNSIGNED_INT_S8_S8_8_8_NV";
          break;
        case 34523:
          result = "GL_UNSIGNED_INT_8_8_S8_S8_REV_NV";
          break;
        case 34524:
          result = "GL_DSDT_MAG_INTENSITY_NV";
          break;
        case 34525:
          result = "GL_SHADER_CONSISTENT_NV";
          break;
        case 34526:
          result = "GL_TEXTURE_SHADER_NV";
          break;
        case 34527:
          result = "GL_SHADER_OPERATION_NV";
          break;
        case 34528:
          result = "GL_CULL_MODES_NV";
          break;
        case 34529:
          result = "GL_OFFSET_TEXTURE_MATRIX_NV";
          break;
        case 34530:
          result = "GL_OFFSET_TEXTURE_SCALE_NV";
          break;
        case 34531:
          result = "GL_OFFSET_TEXTURE_BIAS_NV";
          break;
        case 34532:
          result = "GL_PREVIOUS_TEXTURE_INPUT_NV";
          break;
        case 34533:
          result = "GL_CONST_EYE_NV";
          break;
        case 34534:
          result = "GL_PASS_THROUGH_NV";
          break;
        case 34535:
          result = "GL_CULL_FRAGMENT_NV";
          break;
        case 34536:
          result = "GL_OFFSET_TEXTURE_2D_NV";
          break;
        case 34537:
          result = "GL_DEPENDENT_AR_TEXTURE_2D_NV";
          break;
        case 34538:
          result = "GL_DEPENDENT_GB_TEXTURE_2D_NV";
          break;
        case 34540:
          result = "GL_DOT_PRODUCT_NV";
          break;
        case 34541:
          result = "GL_DOT_PRODUCT_DEPTH_REPLACE_NV";
          break;
        case 34542:
          result = "GL_DOT_PRODUCT_TEXTURE_2D_NV";
          break;
        case 34543:
          result = "GL_DOT_PRODUCT_TEXTURE_3D_NV";
          break;
        case 34544:
          result = "GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV";
          break;
        case 34545:
          result = "GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV";
          break;
        case 34546:
          result = "GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV";
          break;
        case 34547:
          result = "GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV";
          break;
        case 34548:
          result = "GL_HILO_NV";
          break;
        case 34549:
          result = "GL_DSDT_NV";
          break;
        case 34550:
          result = "GL_DSDT_MAG_NV";
          break;
        case 34551:
          result = "GL_DSDT_MAG_VIB_NV";
          break;
        case 34552:
          result = "GL_HILO16_NV";
          break;
        case 34553:
          result = "GL_SIGNED_HILO_NV";
          break;
        case 34554:
          result = "GL_SIGNED_HILO16_NV";
          break;
        case 34555:
          result = "GL_SIGNED_RGBA_NV";
          break;
        case 34556:
          result = "GL_SIGNED_RGBA8_NV";
          break;
        case 34558:
          result = "GL_SIGNED_RGB_NV";
          break;
        case 34559:
          result = "GL_SIGNED_RGB8_NV";
          break;
        case 34561:
          result = "GL_SIGNED_LUMINANCE_NV";
          break;
        case 34562:
          result = "GL_SIGNED_LUMINANCE8_NV";
          break;
        case 34563:
          result = "GL_SIGNED_LUMINANCE_ALPHA_NV";
          break;
        case 34564:
          result = "GL_SIGNED_LUMINANCE8_ALPHA8_NV";
          break;
        case 34565:
          result = "GL_SIGNED_ALPHA_NV";
          break;
        case 34566:
          result = "GL_SIGNED_ALPHA8_NV";
          break;
        case 34567:
          result = "GL_SIGNED_INTENSITY_NV";
          break;
        case 34568:
          result = "GL_SIGNED_INTENSITY8_NV";
          break;
        case 34569:
          result = "GL_DSDT8_NV";
          break;
        case 34570:
          result = "GL_DSDT8_MAG8_NV";
          break;
        case 34571:
          result = "GL_DSDT8_MAG8_INTENSITY8_NV";
          break;
        case 34572:
          result = "GL_SIGNED_RGB_UNSIGNED_ALPHA_NV";
          break;
        case 34573:
          result = "GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV";
          break;
        case 34574:
          result = "GL_HI_SCALE_NV";
          break;
        case 34575:
          result = "GL_LO_SCALE_NV";
          break;
        case 34576:
          result = "GL_DS_SCALE_NV";
          break;
        case 34577:
          result = "GL_DT_SCALE_NV";
          break;
        case 34578:
          result = "GL_MAGNITUDE_SCALE_NV";
          break;
        case 34579:
          result = "GL_VIBRANCE_SCALE_NV";
          break;
        case 34580:
          result = "GL_HI_BIAS_NV";
          break;
        case 34581:
          result = "GL_LO_BIAS_NV";
          break;
        case 34582:
          result = "GL_DS_BIAS_NV";
          break;
        case 34583:
          result = "GL_DT_BIAS_NV";
          break;
        case 34584:
          result = "GL_MAGNITUDE_BIAS_NV";
          break;
        case 34585:
          result = "GL_VIBRANCE_BIAS_NV";
          break;
        case 34586:
          result = "GL_TEXTURE_BORDER_VALUES_NV";
          break;
        case 34587:
          result = "GL_TEXTURE_HI_SIZE_NV";
          break;
        case 34588:
          result = "GL_TEXTURE_LO_SIZE_NV";
          break;
        case 34589:
          result = "GL_TEXTURE_DS_SIZE_NV";
          break;
        case 34590:
          result = "GL_TEXTURE_DT_SIZE_NV";
          break;
        case 34591:
          result = "GL_TEXTURE_MAG_SIZE_NV";
          break;
        case 34594:
          result = "GL_MODELVIEW2_ARB";
          break;
        case 34595:
          result = "GL_MODELVIEW3_ARB";
          break;
        case 34596:
          result = "GL_MODELVIEW4_ARB";
          break;
        case 34597:
          result = "GL_MODELVIEW5_ARB";
          break;
        case 34598:
          result = "GL_MODELVIEW6_ARB";
          break;
        case 34599:
          result = "GL_MODELVIEW7_ARB";
          break;
        case 34600:
          result = "GL_MODELVIEW8_ARB";
          break;
        case 34601:
          result = "GL_MODELVIEW9_ARB";
          break;
        case 34602:
          result = "GL_MODELVIEW10_ARB";
          break;
        case 34603:
          result = "GL_MODELVIEW11_ARB";
          break;
        case 34604:
          result = "GL_MODELVIEW12_ARB";
          break;
        case 34605:
          result = "GL_MODELVIEW13_ARB";
          break;
        case 34606:
          result = "GL_MODELVIEW14_ARB";
          break;
        case 34607:
          result = "GL_MODELVIEW15_ARB";
          break;
        case 34608:
          result = "GL_MODELVIEW16_ARB";
          break;
        case 34609:
          result = "GL_MODELVIEW17_ARB";
          break;
        case 34610:
          result = "GL_MODELVIEW18_ARB";
          break;
        case 34611:
          result = "GL_MODELVIEW19_ARB";
          break;
        case 34612:
          result = "GL_MODELVIEW20_ARB";
          break;
        case 34613:
          result = "GL_MODELVIEW21_ARB";
          break;
        case 34614:
          result = "GL_MODELVIEW22_ARB";
          break;
        case 34615:
          result = "GL_MODELVIEW23_ARB";
          break;
        case 34616:
          result = "GL_MODELVIEW24_ARB";
          break;
        case 34617:
          result = "GL_MODELVIEW25_ARB";
          break;
        case 34618:
          result = "GL_MODELVIEW26_ARB";
          break;
        case 34619:
          result = "GL_MODELVIEW27_ARB";
          break;
        case 34620:
          result = "GL_MODELVIEW28_ARB";
          break;
        case 34621:
          result = "GL_MODELVIEW29_ARB";
          break;
        case 34622:
          result = "GL_MODELVIEW30_ARB";
          break;
        case 34623:
          result = "GL_MODELVIEW31_ARB";
          break;
        case 34625:
          result = "GL_PROGRAM_BINARY_LENGTH";
          break;
        case 34626:
          result = "GL_MIRROR_CLAMP_EXT";
          break;
        case 34627:
          result = "GL_MIRROR_CLAMP_TO_EDGE_EXT";
          break;
        case 34628:
          result = "GL_MODULATE_ADD_ATI";
          break;
        case 34629:
          result = "GL_MODULATE_SIGNED_ADD_ATI";
          break;
        case 34630:
          result = "GL_MODULATE_SUBTRACT_ATI";
          break;
        case 34660:
          result = "GL_BUFFER_SIZE";
          break;
        case 34661:
          result = "GL_BUFFER_USAGE";
          break;
        case 34685:
          result = "GL_MIN_WEIGHTED_ATI";
          break;
        case 34686:
          result = "GL_MAX_WEIGHTED_ATI";
          break;
        case 34814:
          result = "GL_NUM_PROGRAM_BINARY_FORMATS";
          break;
        case 34815:
          result = "GL_PROGRAM_BINARY_FORMATS";
          break;
        case 34816:
          result = "GL_STENCIL_BACK_FUNC";
          break;
        case 34817:
          result = "GL_STENCIL_BACK_FAIL";
          break;
        case 34818:
          result = "GL_STENCIL_BACK_PASS_DEPTH_FAIL";
          break;
        case 34819:
          result = "GL_STENCIL_BACK_PASS_DEPTH_PASS";
          break;
        case 34820:
          result = "GL_FRAGMENT_PROGRAM_ARB";
          break;
        case 34821:
          result = "GL_PROGRAM_ALU_INSTRUCTIONS_ARB";
          break;
        case 34822:
          result = "GL_PROGRAM_TEX_INSTRUCTIONS_ARB";
          break;
        case 34823:
          result = "GL_PROGRAM_TEX_INDIRECTIONS_ARB";
          break;
        case 34824:
          result = "GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB";
          break;
        case 34825:
          result = "GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB";
          break;
        case 34826:
          result = "GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB";
          break;
        case 34827:
          result = "GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB";
          break;
        case 34828:
          result = "GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB";
          break;
        case 34829:
          result = "GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB";
          break;
        case 34830:
          result = "GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB";
          break;
        case 34831:
          result = "GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB";
          break;
        case 34832:
          result = "GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB";
          break;
        case 34836:
          result = "GL_RGBA32F";
          break;
        case 34837:
          result = "GL_RGB32F";
          break;
        case 34838:
          result = "GL_ALPHA32F_ARB";
          break;
        case 34839:
          result = "GL_INTENSITY32F_ARB";
          break;
        case 34840:
          result = "GL_LUMINANCE32F_ARB";
          break;
        case 34841:
          result = "GL_LUMINANCE_ALPHA32F_ARB";
          break;
        case 34842:
          result = "GL_RGBA16F";
          break;
        case 34843:
          result = "GL_RGB16F";
          break;
        case 34844:
          result = "GL_ALPHA16F_ARB";
          break;
        case 34845:
          result = "GL_INTENSITY16F_ARB";
          break;
        case 34846:
          result = "GL_LUMINANCE16F_ARB";
          break;
        case 34847:
          result = "GL_LUMINANCE_ALPHA16F_ARB";
          break;
        case 34848:
          result = "GL_RGBA_FLOAT_MODE_ARB";
          break;
        case 34852:
          result = "GL_MAX_DRAW_BUFFERS";
          break;
        case 34853:
          result = "GL_DRAW_BUFFER0";
          break;
        case 34854:
          result = "GL_DRAW_BUFFER1";
          break;
        case 34855:
          result = "GL_DRAW_BUFFER2";
          break;
        case 34856:
          result = "GL_DRAW_BUFFER3";
          break;
        case 34857:
          result = "GL_DRAW_BUFFER4";
          break;
        case 34858:
          result = "GL_DRAW_BUFFER5";
          break;
        case 34859:
          result = "GL_DRAW_BUFFER6";
          break;
        case 34860:
          result = "GL_DRAW_BUFFER7";
          break;
        case 34861:
          result = "GL_DRAW_BUFFER8";
          break;
        case 34862:
          result = "GL_DRAW_BUFFER9";
          break;
        case 34863:
          result = "GL_DRAW_BUFFER10";
          break;
        case 34864:
          result = "GL_DRAW_BUFFER11";
          break;
        case 34865:
          result = "GL_DRAW_BUFFER12";
          break;
        case 34866:
          result = "GL_DRAW_BUFFER13";
          break;
        case 34867:
          result = "GL_DRAW_BUFFER14";
          break;
        case 34868:
          result = "GL_DRAW_BUFFER15";
          break;
        case 34871:
          result = "GL_COMPRESSED_LUMINANCE_ALPHA_3DC_ATI";
          break;
        case 34877:
          result = "GL_BLEND_EQUATION_ALPHA";
          break;
        case 34880:
          result = "GL_MATRIX_PALETTE_OES";
          break;
        case 34882:
          result = "GL_MAX_PALETTE_MATRICES_OES";
          break;
        case 34883:
          result = "GL_CURRENT_PALETTE_MATRIX_OES";
          break;
        case 34884:
          result = "GL_MATRIX_INDEX_ARRAY_OES";
          break;
        case 34886:
          result = "GL_MATRIX_INDEX_ARRAY_SIZE_OES";
          break;
        case 34887:
          result = "GL_MATRIX_INDEX_ARRAY_TYPE_OES";
          break;
        case 34888:
          result = "GL_MATRIX_INDEX_ARRAY_STRIDE_OES";
          break;
        case 34889:
          result = "GL_MATRIX_INDEX_ARRAY_POINTER_OES";
          break;
        case 34890:
          result = "GL_TEXTURE_DEPTH_SIZE";
          break;
        case 34891:
          result = "GL_DEPTH_TEXTURE_MODE";
          break;
        case 34892:
          result = "GL_TEXTURE_COMPARE_MODE";
          break;
        case 34893:
          result = "GL_TEXTURE_COMPARE_FUNC";
          break;
        case 34894:
          result = "GL_COMPARE_REF_TO_TEXTURE";
          break;
        case 34895:
          result = "GL_TEXTURE_CUBE_MAP_SEAMLESS";
          break;
        case 34896:
          result = "GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV";
          break;
        case 34897:
          result = "GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV";
          break;
        case 34898:
          result = "GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV";
          break;
        case 34899:
          result = "GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV";
          break;
        case 34900:
          result = "GL_OFFSET_HILO_TEXTURE_2D_NV";
          break;
        case 34901:
          result = "GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV";
          break;
        case 34902:
          result = "GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV";
          break;
        case 34903:
          result = "GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV";
          break;
        case 34904:
          result = "GL_DEPENDENT_HILO_TEXTURE_2D_NV";
          break;
        case 34905:
          result = "GL_DEPENDENT_RGB_TEXTURE_3D_NV";
          break;
        case 34906:
          result = "GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV";
          break;
        case 34907:
          result = "GL_DOT_PRODUCT_PASS_THROUGH_NV";
          break;
        case 34908:
          result = "GL_DOT_PRODUCT_TEXTURE_1D_NV";
          break;
        case 34909:
          result = "GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV";
          break;
        case 34910:
          result = "GL_HILO8_NV";
          break;
        case 34911:
          result = "GL_SIGNED_HILO8_NV";
          break;
        case 34912:
          result = "GL_FORCE_BLUE_TO_ONE_NV";
          break;
        case 34913:
          result = "GL_POINT_SPRITE";
          break;
        case 34914:
          result = "GL_COORD_REPLACE";
          break;
        case 34915:
          result = "GL_POINT_SPRITE_R_MODE_NV";
          break;
        case 34916:
          result = "GL_QUERY_COUNTER_BITS";
          break;
        case 34917:
          result = "GL_CURRENT_QUERY";
          break;
        case 34918:
          result = "GL_QUERY_RESULT";
          break;
        case 34919:
          result = "GL_QUERY_RESULT_AVAILABLE";
          break;
        case 34921:
          result = "GL_MAX_VERTEX_ATTRIBS";
          break;
        case 34922:
          result = "GL_VERTEX_ATTRIB_ARRAY_NORMALIZED";
          break;
        case 34924:
          result = "GL_MAX_TESS_CONTROL_INPUT_COMPONENTS";
          break;
        case 34925:
          result = "GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS";
          break;
        case 34929:
          result = "GL_MAX_TEXTURE_COORDS";
          break;
        case 34930:
          result = "GL_MAX_TEXTURE_IMAGE_UNITS";
          break;
        case 34932:
          result = "GL_PROGRAM_ERROR_STRING_ARB";
          break;
        case 34933:
          result = "GL_PROGRAM_FORMAT_ASCII_ARB";
          break;
        case 34934:
          result = "GL_PROGRAM_FORMAT_ARB";
          break;
        case 34943:
          result = "GL_GEOMETRY_SHADER_INVOCATIONS";
          break;
        case 34960:
          result = "GL_DEPTH_BOUNDS_TEST_EXT";
          break;
        case 34961:
          result = "GL_DEPTH_BOUNDS_EXT";
          break;
        case 34962:
          result = "GL_ARRAY_BUFFER";
          break;
        case 34963:
          result = "GL_ELEMENT_ARRAY_BUFFER";
          break;
        case 34964:
          result = "GL_ARRAY_BUFFER_BINDING";
          break;
        case 34965:
          result = "GL_ELEMENT_ARRAY_BUFFER_BINDING";
          break;
        case 34966:
          result = "GL_VERTEX_ARRAY_BUFFER_BINDING";
          break;
        case 34967:
          result = "GL_NORMAL_ARRAY_BUFFER_BINDING";
          break;
        case 34968:
          result = "GL_COLOR_ARRAY_BUFFER_BINDING";
          break;
        case 34969:
          result = "GL_INDEX_ARRAY_BUFFER_BINDING";
          break;
        case 34970:
          result = "GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING";
          break;
        case 34971:
          result = "GL_EDGE_FLAG_ARRAY_BUFFER_BINDING";
          break;
        case 34972:
          result = "GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING";
          break;
        case 34973:
          result = "GL_FOG_COORD_ARRAY_BUFFER_BINDING";
          break;
        case 34974:
          result = "GL_WEIGHT_ARRAY_BUFFER_BINDING";
          break;
        case 34975:
          result = "GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING";
          break;
        case 34976:
          result = "GL_PROGRAM_INSTRUCTIONS_ARB";
          break;
        case 34977:
          result = "GL_MAX_PROGRAM_INSTRUCTIONS_ARB";
          break;
        case 34978:
          result = "GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB";
          break;
        case 34979:
          result = "GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB";
          break;
        case 34980:
          result = "GL_PROGRAM_TEMPORARIES_ARB";
          break;
        case 34981:
          result = "GL_MAX_PROGRAM_TEMPORARIES_ARB";
          break;
        case 34982:
          result = "GL_PROGRAM_NATIVE_TEMPORARIES_ARB";
          break;
        case 34983:
          result = "GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB";
          break;
        case 34984:
          result = "GL_PROGRAM_PARAMETERS_ARB";
          break;
        case 34985:
          result = "GL_MAX_PROGRAM_PARAMETERS_ARB";
          break;
        case 34986:
          result = "GL_PROGRAM_NATIVE_PARAMETERS_ARB";
          break;
        case 34987:
          result = "GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB";
          break;
        case 34988:
          result = "GL_PROGRAM_ATTRIBS_ARB";
          break;
        case 34989:
          result = "GL_MAX_PROGRAM_ATTRIBS_ARB";
          break;
        case 34990:
          result = "GL_PROGRAM_NATIVE_ATTRIBS_ARB";
          break;
        case 34991:
          result = "GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB";
          break;
        case 34992:
          result = "GL_PROGRAM_ADDRESS_REGISTERS_ARB";
          break;
        case 34993:
          result = "GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB";
          break;
        case 34994:
          result = "GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB";
          break;
        case 34995:
          result = "GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB";
          break;
        case 34996:
          result = "GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB";
          break;
        case 34997:
          result = "GL_MAX_PROGRAM_ENV_PARAMETERS_ARB";
          break;
        case 34998:
          result = "GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB";
          break;
        case 34999:
          result = "GL_TRANSPOSE_CURRENT_MATRIX_ARB";
          break;
        case 35000:
          result = "GL_READ_ONLY";
          break;
        case 35001:
          result = "GL_WRITE_ONLY";
          break;
        case 35002:
          result = "GL_READ_WRITE";
          break;
        case 35003:
          result = "GL_BUFFER_ACCESS";
          break;
        case 35004:
          result = "GL_BUFFER_MAPPED";
          break;
        case 35005:
          result = "GL_BUFFER_MAP_POINTER";
          break;
        case 35007:
          result = "GL_TIME_ELAPSED";
          break;
        case 35008:
          result = "GL_MATRIX0_ARB";
          break;
        case 35009:
          result = "GL_MATRIX1_ARB";
          break;
        case 35010:
          result = "GL_MATRIX2_ARB";
          break;
        case 35011:
          result = "GL_MATRIX3_ARB";
          break;
        case 35012:
          result = "GL_MATRIX4_ARB";
          break;
        case 35013:
          result = "GL_MATRIX5_ARB";
          break;
        case 35014:
          result = "GL_MATRIX6_ARB";
          break;
        case 35015:
          result = "GL_MATRIX7_ARB";
          break;
        case 35016:
          result = "GL_MATRIX8_ARB";
          break;
        case 35017:
          result = "GL_MATRIX9_ARB";
          break;
        case 35018:
          result = "GL_MATRIX10_ARB";
          break;
        case 35019:
          result = "GL_MATRIX11_ARB";
          break;
        case 35020:
          result = "GL_MATRIX12_ARB";
          break;
        case 35021:
          result = "GL_MATRIX13_ARB";
          break;
        case 35022:
          result = "GL_MATRIX14_ARB";
          break;
        case 35023:
          result = "GL_MATRIX15_ARB";
          break;
        case 35024:
          result = "GL_MATRIX16_ARB";
          break;
        case 35025:
          result = "GL_MATRIX17_ARB";
          break;
        case 35026:
          result = "GL_MATRIX18_ARB";
          break;
        case 35027:
          result = "GL_MATRIX19_ARB";
          break;
        case 35028:
          result = "GL_MATRIX20_ARB";
          break;
        case 35029:
          result = "GL_MATRIX21_ARB";
          break;
        case 35030:
          result = "GL_MATRIX22_ARB";
          break;
        case 35031:
          result = "GL_MATRIX23_ARB";
          break;
        case 35032:
          result = "GL_MATRIX24_ARB";
          break;
        case 35033:
          result = "GL_MATRIX25_ARB";
          break;
        case 35034:
          result = "GL_MATRIX26_ARB";
          break;
        case 35035:
          result = "GL_MATRIX27_ARB";
          break;
        case 35036:
          result = "GL_MATRIX28_ARB";
          break;
        case 35037:
          result = "GL_MATRIX29_ARB";
          break;
        case 35038:
          result = "GL_MATRIX30_ARB";
          break;
        case 35039:
          result = "GL_MATRIX31_ARB";
          break;
        case 35040:
          result = "GL_STREAM_DRAW";
          break;
        case 35041:
          result = "GL_STREAM_READ";
          break;
        case 35042:
          result = "GL_STREAM_COPY";
          break;
        case 35044:
          result = "GL_STATIC_DRAW";
          break;
        case 35045:
          result = "GL_STATIC_READ";
          break;
        case 35046:
          result = "GL_STATIC_COPY";
          break;
        case 35048:
          result = "GL_DYNAMIC_DRAW";
          break;
        case 35049:
          result = "GL_DYNAMIC_READ";
          break;
        case 35050:
          result = "GL_DYNAMIC_COPY";
          break;
        case 35051:
          result = "GL_PIXEL_PACK_BUFFER";
          break;
        case 35052:
          result = "GL_PIXEL_UNPACK_BUFFER";
          break;
        case 35053:
          result = "GL_PIXEL_PACK_BUFFER_BINDING";
          break;
        case 35055:
          result = "GL_PIXEL_UNPACK_BUFFER_BINDING";
          break;
        case 35056:
          result = "GL_DEPTH24_STENCIL8";
          break;
        case 35057:
          result = "GL_TEXTURE_STENCIL_SIZE";
          break;
        case 35060:
          result = "GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV";
          break;
        case 35061:
          result = "GL_MAX_PROGRAM_CALL_DEPTH_NV";
          break;
        case 35062:
          result = "GL_MAX_PROGRAM_IF_DEPTH_NV";
          break;
        case 35063:
          result = "GL_MAX_PROGRAM_LOOP_DEPTH_NV";
          break;
        case 35064:
          result = "GL_MAX_PROGRAM_LOOP_COUNT_NV";
          break;
        case 35065:
          result = "GL_SRC1_COLOR";
          break;
        case 35066:
          result = "GL_ONE_MINUS_SRC1_COLOR";
          break;
        case 35067:
          result = "GL_ONE_MINUS_SRC1_ALPHA";
          break;
        case 35068:
          result = "GL_MAX_DUAL_SOURCE_DRAW_BUFFERS";
          break;
        case 35069:
          result = "GL_VERTEX_ATTRIB_ARRAY_INTEGER";
          break;
        case 35070:
          result = "GL_VERTEX_ATTRIB_ARRAY_DIVISOR";
          break;
        case 35071:
          result = "GL_MAX_ARRAY_TEXTURE_LAYERS";
          break;
        case 35076:
          result = "GL_MIN_PROGRAM_TEXEL_OFFSET";
          break;
        case 35077:
          result = "GL_MAX_PROGRAM_TEXEL_OFFSET";
          break;
        case 35088:
          result = "GL_STENCIL_TEST_TWO_SIDE_EXT";
          break;
        case 35089:
          result = "GL_ACTIVE_STENCIL_FACE_EXT";
          break;
        case 35090:
          result = "GL_MIRROR_CLAMP_TO_BORDER_EXT";
          break;
        case 35092:
          result = "GL_SAMPLES_PASSED";
          break;
        case 35094:
          result = "GL_GEOMETRY_VERTICES_OUT";
          break;
        case 35095:
          result = "GL_GEOMETRY_INPUT_TYPE";
          break;
        case 35096:
          result = "GL_GEOMETRY_OUTPUT_TYPE";
          break;
        case 35097:
          result = "GL_SAMPLER_BINDING";
          break;
        case 35098:
          result = "GL_CLAMP_VERTEX_COLOR_ARB";
          break;
        case 35099:
          result = "GL_CLAMP_FRAGMENT_COLOR_ARB";
          break;
        case 35100:
          result = "GL_CLAMP_READ_COLOR";
          break;
        case 35101:
          result = "GL_FIXED_ONLY";
          break;
        case 35196:
          result = "GL_ARRAY_REV_COMPS_IN_4_BYTES_ATI";
          break;
        case 35210:
          result = "GL_POINT_SIZE_ARRAY_TYPE_OES";
          break;
        case 35211:
          result = "GL_POINT_SIZE_ARRAY_STRIDE_OES";
          break;
        case 35212:
          result = "GL_POINT_SIZE_ARRAY_POINTER_OES";
          break;
        case 35213:
          result = "GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35214:
          result = "GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35215:
          result = "GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35328:
          result = "GL_VERTEX_ATTRIB_MAP1_APPLE";
          break;
        case 35329:
          result = "GL_VERTEX_ATTRIB_MAP2_APPLE";
          break;
        case 35330:
          result = "GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE";
          break;
        case 35331:
          result = "GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE";
          break;
        case 35332:
          result = "GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE";
          break;
        case 35333:
          result = "GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE";
          break;
        case 35334:
          result = "GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE";
          break;
        case 35335:
          result = "GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE";
          break;
        case 35336:
          result = "GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE";
          break;
        case 35337:
          result = "GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE";
          break;
        case 35338:
          result = "GL_DRAW_PIXELS_APPLE";
          break;
        case 35339:
          result = "GL_FENCE_APPLE";
          break;
        case 35340:
          result = "GL_ELEMENT_ARRAY_APPLE";
          break;
        case 35341:
          result = "GL_ELEMENT_ARRAY_TYPE_APPLE";
          break;
        case 35342:
          result = "GL_ELEMENT_ARRAY_POINTER_APPLE";
          break;
        case 35343:
          result = "GL_COLOR_FLOAT_APPLE";
          break;
        case 35344:
          result = "GL_MIN_PBUFFER_VIEWPORT_DIMS_APPLE";
          break;
        case 35345:
          result = "GL_UNIFORM_BUFFER";
          break;
        case 35346:
          result = "GL_BUFFER_SERIALIZED_MODIFY_APPLE";
          break;
        case 35347:
          result = "GL_BUFFER_FLUSHING_UNMAP_APPLE";
          break;
        case 35348:
          result = "GL_AUX_DEPTH_STENCIL_APPLE";
          break;
        case 35349:
          result = "GL_PACK_ROW_BYTES_APPLE";
          break;
        case 35350:
          result = "GL_UNPACK_ROW_BYTES_APPLE";
          break;
        case 35351:
          result = "GL_PACK_IMAGE_BYTES_APPLE";
          break;
        case 35352:
          result = "GL_UNPACK_IMAGE_BYTES_APPLE";
          break;
        case 35353:
          result = "GL_RELEASED_APPLE";
          break;
        case 35354:
          result = "GL_VOLATILE_APPLE";
          break;
        case 35355:
          result = "GL_RETAINED_APPLE";
          break;
        case 35356:
          result = "GL_UNDEFINED_APPLE";
          break;
        case 35357:
          result = "GL_PURGEABLE_APPLE";
          break;
        case 35358:
          result = "GL_PRIVATE_EXTENSIONS_APPLE";
          break;
        case 35359:
          result = "GL_RGB_422_APPLE";
          break;
        case 35366:
          result = "GL_VERTEX_POINT_SIZE_APPLE";
          break;
        case 35367:
          result = "GL_CURRENT_POINT_SIZE_APPLE";
          break;
        case 35368:
          result = "GL_UNIFORM_BUFFER_BINDING";
          break;
        case 35369:
          result = "GL_UNIFORM_BUFFER_START";
          break;
        case 35370:
          result = "GL_UNIFORM_BUFFER_SIZE";
          break;
        case 35371:
          result = "GL_MAX_VERTEX_UNIFORM_BLOCKS";
          break;
        case 35372:
          result = "GL_MAX_GEOMETRY_UNIFORM_BLOCKS";
          break;
        case 35373:
          result = "GL_MAX_FRAGMENT_UNIFORM_BLOCKS";
          break;
        case 35374:
          result = "GL_MAX_COMBINED_UNIFORM_BLOCKS";
          break;
        case 35375:
          result = "GL_MAX_UNIFORM_BUFFER_BINDINGS";
          break;
        case 35376:
          result = "GL_MAX_UNIFORM_BLOCK_SIZE";
          break;
        case 35377:
          result = "GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS";
          break;
        case 35378:
          result = "GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS";
          break;
        case 35379:
          result = "GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS";
          break;
        case 35380:
          result = "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT";
          break;
        case 35381:
          result = "GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH";
          break;
        case 35382:
          result = "GL_ACTIVE_UNIFORM_BLOCKS";
          break;
        case 35383:
          result = "GL_UNIFORM_TYPE";
          break;
        case 35384:
          result = "GL_UNIFORM_SIZE";
          break;
        case 35385:
          result = "GL_UNIFORM_NAME_LENGTH";
          break;
        case 35386:
          result = "GL_UNIFORM_BLOCK_INDEX";
          break;
        case 35387:
          result = "GL_UNIFORM_OFFSET";
          break;
        case 35388:
          result = "GL_UNIFORM_ARRAY_STRIDE";
          break;
        case 35389:
          result = "GL_UNIFORM_MATRIX_STRIDE";
          break;
        case 35390:
          result = "GL_UNIFORM_IS_ROW_MAJOR";
          break;
        case 35391:
          result = "GL_UNIFORM_BLOCK_BINDING";
          break;
        case 35392:
          result = "GL_UNIFORM_BLOCK_DATA_SIZE";
          break;
        case 35393:
          result = "GL_UNIFORM_BLOCK_NAME_LENGTH";
          break;
        case 35394:
          result = "GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS";
          break;
        case 35395:
          result = "GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES";
          break;
        case 35396:
          result = "GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER";
          break;
        case 35397:
          result = "GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER";
          break;
        case 35398:
          result = "GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER";
          break;
        case 35400:
          result = "GL_TEXTURE_SRGB_DECODE_EXT";
          break;
        case 35401:
          result = "GL_DECODE_EXT";
          break;
        case 35402:
          result = "GL_SKIP_DECODE_EXT";
          break;
        case 35403:
          result = "GL_MAGIC_MIPMAP_APPLE";
          break;
        case 35407:
          result = "GL_PROGRAM_PIPELINE_OBJECT_EXT";
          break;
        case 35408:
          result = "GL_RGB_YCBCR_422_APPLE";
          break;
        case 35409:
          result = "GL_RGB_RAW_422_APPLE";
          break;
        case 35410:
          result = "GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT";
          break;
        case 35411:
          result = "GL_SYNC_OBJECT_APPLE";
          break;
        case 35412:
          result = "GL_COMPRESSED_SRGB_PVRTC_2BPPV1_EXT";
          break;
        case 35413:
          result = "GL_COMPRESSED_SRGB_PVRTC_4BPPV1_EXT";
          break;
        case 35414:
          result = "GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV1_EXT";
          break;
        case 35415:
          result = "GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV1_EXT";
          break;
        case 35416:
          result = "GL_CUBIC_APPLE";
          break;
        case 35417:
          result = "GL_CUBIC_MIPMAP_NEAREST_APPLE";
          break;
        case 35418:
          result = "GL_CUBIC_MIPMAP_LINEAR_APPLE";
          break;
        case 35419:
          result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_TARGET_APPLE";
          break;
        case 35420:
          result = "GL_COMPRESSED_RGBA_ASTC_4x2_APPLE";
          break;
        case 35421:
          result = "GL_COMPRESSED_RGBA_ASTC_8x4_APPLE";
          break;
        case 35422:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x2_APPLE";
          break;
        case 35423:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x4_APPLE";
          break;
        case 35424:
          result = "GL_UNIFORM_REFERENCED_BY_VERTEX_SHADER_APPLE";
          break;
        case 35425:
          result = "GL_UNIFORM_REFERENCED_BY_TESS_CONTROL_SHADER_APPLE";
          break;
        case 35426:
          result = "GL_UNIFORM_REFERENCED_BY_TESS_EVAL_SHADER_APPLE";
          break;
        case 35427:
          result = "GL_UNIFORM_REFERENCED_BY_GEOMETRY_SHADER_APPLE";
          break;
        case 35428:
          result = "GL_UNIFORM_REFERENCED_BY_FRAGMENT_SHADER_APPLE";
          break;
        case 35429:
          result = "GL_YCBCR8_420_2PLANE_APPLE";
          break;
        case 35430:
          result = "GL_YCBCR8_422_1PLANE_APPLE";
          break;
        case 35431:
          result = "GL_YCBCR8_422_2PLANE_APPLE";
          break;
        case 35432:
          result = "GL_YCBCR8_444_2PLANE_APPLE";
          break;
        case 35433:
          result = "GL_YCBCR10_444_1PLANE_APPLE";
          break;
        case 35434:
          result = "GL_YCBCR10_422_2PLANE_APPLE";
          break;
        case 35435:
          result = "GL_YCBCR10_420_2PLANE_APPLE";
          break;
        case 35436:
          result = "GL_YCBCR10_444_2PLANE_APPLE";
          break;
        case 35437:
          result = "GL_SRGB_YCBCR8_420_2PLANE_APPLE";
          break;
        case 35438:
          result = "GL_SRGB_YCBCR8_422_1PLANE_APPLE";
          break;
        case 35439:
          result = "GL_SRGB_YCBCR8_422_2PLANE_APPLE";
          break;
        case 35440:
          result = "GL_SRGB_YCBCR8_444_2PLANE_APPLE";
          break;
        case 35441:
          result = "GL_SRGB_YCBCR10_444_1PLANE_APPLE";
          break;
        case 35442:
          result = "GL_SRGB_YCBCR10_422_2PLANE_APPLE";
          break;
        case 35443:
          result = "GL_SRGB_YCBCR10_420_2PLANE_APPLE";
          break;
        case 35444:
          result = "GL_SRGB_YCBCR10_444_2PLANE_APPLE";
          break;
        case 35445:
          result = "GL_FUNC_OVERRIDE_BLEND_SOURCE_COLOR_APPLE";
          break;
        case 35446:
          result = "GL_ARGBV16_XR10_APPLE";
          break;
        case 35447:
          result = "GL_SRGB_ARGBV16_XR10_APPLE";
          break;
        case 35448:
          result = "GL_SR8_APPLE";
          break;
        case 35449:
          result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_APPLE";
          break;
        case 35450:
          result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_0_APPLE";
          break;
        case 35451:
          result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_90_APPLE";
          break;
        case 35452:
          result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_180_APPLE";
          break;
        case 35453:
          result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_270_APPLE";
          break;
        case 35454:
          result = "GL_VERTEX_STORAGE_MEMORY_COHERENT_APPLE";
          break;
        case 35455:
          result = "GL_TEXTURE_STORAGE_MEMORY_COHERENT_APPLE";
          break;
        case 35632:
          result = "GL_FRAGMENT_SHADER";
          break;
        case 35633:
          result = "GL_VERTEX_SHADER";
          break;
        case 35648:
          result = "GL_PROGRAM_OBJECT_EXT";
          break;
        case 35656:
          result = "GL_SHADER_OBJECT_EXT";
          break;
        case 35657:
          result = "GL_MAX_FRAGMENT_UNIFORM_COMPONENTS";
          break;
        case 35658:
          result = "GL_MAX_VERTEX_UNIFORM_COMPONENTS";
          break;
        case 35659:
          result = "GL_MAX_VARYING_COMPONENTS";
          break;
        case 35660:
          result = "GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS";
          break;
        case 35661:
          result = "GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS";
          break;
        case 35662:
          result = "GL_OBJECT_TYPE_ARB";
          break;
        case 35663:
          result = "GL_SHADER_TYPE";
          break;
        case 35664:
          result = "GL_FLOAT_VEC2";
          break;
        case 35665:
          result = "GL_FLOAT_VEC3";
          break;
        case 35666:
          result = "GL_FLOAT_VEC4";
          break;
        case 35667:
          result = "GL_INT_VEC2";
          break;
        case 35668:
          result = "GL_INT_VEC3";
          break;
        case 35669:
          result = "GL_INT_VEC4";
          break;
        case 35670:
          result = "GL_BOOL";
          break;
        case 35671:
          result = "GL_BOOL_VEC2";
          break;
        case 35672:
          result = "GL_BOOL_VEC3";
          break;
        case 35673:
          result = "GL_BOOL_VEC4";
          break;
        case 35674:
          result = "GL_FLOAT_MAT2";
          break;
        case 35675:
          result = "GL_FLOAT_MAT3";
          break;
        case 35676:
          result = "GL_FLOAT_MAT4";
          break;
        case 35677:
          result = "GL_SAMPLER_1D";
          break;
        case 35678:
          result = "GL_SAMPLER_2D";
          break;
        case 35679:
          result = "GL_SAMPLER_3D";
          break;
        case 35680:
          result = "GL_SAMPLER_CUBE";
          break;
        case 35681:
          result = "GL_SAMPLER_1D_SHADOW";
          break;
        case 35682:
          result = "GL_SAMPLER_2D_SHADOW";
          break;
        case 35683:
          result = "GL_SAMPLER_2D_RECT";
          break;
        case 35684:
          result = "GL_SAMPLER_2D_RECT_SHADOW";
          break;
        case 35685:
          result = "GL_FLOAT_MAT2x3";
          break;
        case 35686:
          result = "GL_FLOAT_MAT2x4";
          break;
        case 35687:
          result = "GL_FLOAT_MAT3x2";
          break;
        case 35688:
          result = "GL_FLOAT_MAT3x4";
          break;
        case 35689:
          result = "GL_FLOAT_MAT4x2";
          break;
        case 35690:
          result = "GL_FLOAT_MAT4x3";
          break;
        case 35712:
          result = "GL_DELETE_STATUS";
          break;
        case 35713:
          result = "GL_COMPILE_STATUS";
          break;
        case 35714:
          result = "GL_LINK_STATUS";
          break;
        case 35715:
          result = "GL_VALIDATE_STATUS";
          break;
        case 35716:
          result = "GL_INFO_LOG_LENGTH";
          break;
        case 35717:
          result = "GL_ATTACHED_SHADERS";
          break;
        case 35718:
          result = "GL_ACTIVE_UNIFORMS";
          break;
        case 35719:
          result = "GL_ACTIVE_UNIFORM_MAX_LENGTH";
          break;
        case 35720:
          result = "GL_SHADER_SOURCE_LENGTH";
          break;
        case 35721:
          result = "GL_ACTIVE_ATTRIBUTES";
          break;
        case 35722:
          result = "GL_ACTIVE_ATTRIBUTE_MAX_LENGTH";
          break;
        case 35723:
          result = "GL_FRAGMENT_SHADER_DERIVATIVE_HINT";
          break;
        case 35724:
          result = "GL_SHADING_LANGUAGE_VERSION";
          break;
        case 35725:
          result = "GL_CURRENT_PROGRAM";
          break;
        case 35728:
          result = "GL_PALETTE4_RGB8_OES";
          break;
        case 35729:
          result = "GL_PALETTE4_RGBA8_OES";
          break;
        case 35730:
          result = "GL_PALETTE4_R5_G6_B5_OES";
          break;
        case 35731:
          result = "GL_PALETTE4_RGBA4_OES";
          break;
        case 35732:
          result = "GL_PALETTE4_RGB5_A1_OES";
          break;
        case 35733:
          result = "GL_PALETTE8_RGB8_OES";
          break;
        case 35734:
          result = "GL_PALETTE8_RGBA8_OES";
          break;
        case 35735:
          result = "GL_PALETTE8_R5_G6_B5_OES";
          break;
        case 35736:
          result = "GL_PALETTE8_RGBA4_OES";
          break;
        case 35737:
          result = "GL_PALETTE8_RGB5_A1_OES";
          break;
        case 35738:
          result = "GL_IMPLEMENTATION_COLOR_READ_TYPE";
          break;
        case 35739:
          result = "GL_IMPLEMENTATION_COLOR_READ_FORMAT";
          break;
        case 35740:
          result = "GL_POINT_SIZE_ARRAY_OES";
          break;
        case 35741:
          result = "GL_TEXTURE_CROP_RECT_OES";
          break;
        case 35742:
          result = "GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES";
          break;
        case 35743:
          result = "GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES";
          break;
        case 35840:
          result = "GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG";
          break;
        case 35841:
          result = "GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG";
          break;
        case 35842:
          result = "GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG";
          break;
        case 35843:
          result = "GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG";
          break;
        case 35856:
          result = "GL_TEXTURE_RED_TYPE";
          break;
        case 35857:
          result = "GL_TEXTURE_GREEN_TYPE";
          break;
        case 35858:
          result = "GL_TEXTURE_BLUE_TYPE";
          break;
        case 35859:
          result = "GL_TEXTURE_ALPHA_TYPE";
          break;
        case 35860:
          result = "GL_TEXTURE_LUMINANCE_TYPE_ARB";
          break;
        case 35861:
          result = "GL_TEXTURE_INTENSITY_TYPE_ARB";
          break;
        case 35862:
          result = "GL_TEXTURE_DEPTH_TYPE";
          break;
        case 35863:
          result = "GL_UNSIGNED_NORMALIZED";
          break;
        case 35864:
          result = "GL_TEXTURE_1D_ARRAY";
          break;
        case 35865:
          result = "GL_PROXY_TEXTURE_1D_ARRAY";
          break;
        case 35866:
          result = "GL_TEXTURE_2D_ARRAY";
          break;
        case 35867:
          result = "GL_PROXY_TEXTURE_2D_ARRAY";
          break;
        case 35868:
          result = "GL_TEXTURE_BINDING_1D_ARRAY";
          break;
        case 35869:
          result = "GL_TEXTURE_BINDING_2D_ARRAY";
          break;
        case 35881:
          result = "GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS";
          break;
        case 35882:
          result = "GL_TEXTURE_BUFFER";
          break;
        case 35883:
          result = "GL_MAX_TEXTURE_BUFFER_SIZE";
          break;
        case 35884:
          result = "GL_TEXTURE_BINDING_BUFFER";
          break;
        case 35885:
          result = "GL_TEXTURE_BUFFER_DATA_STORE_BINDING";
          break;
        case 35887:
          result = "GL_ANY_SAMPLES_PASSED";
          break;
        case 35894:
          result = "GL_SAMPLE_SHADING";
          break;
        case 35895:
          result = "GL_MIN_SAMPLE_SHADING_VALUE";
          break;
        case 35898:
          result = "GL_R11F_G11F_B10F";
          break;
        case 35899:
          result = "GL_UNSIGNED_INT_10F_11F_11F_REV";
          break;
        case 35900:
          result = "GL_RGBA_SIGNED_COMPONENTS_EXT";
          break;
        case 35901:
          result = "GL_RGB9_E5";
          break;
        case 35902:
          result = "GL_UNSIGNED_INT_5_9_9_9_REV";
          break;
        case 35903:
          result = "GL_TEXTURE_SHARED_SIZE";
          break;
        case 35904:
          result = "GL_SRGB";
          break;
        case 35905:
          result = "GL_SRGB8";
          break;
        case 35906:
          result = "GL_SRGB_ALPHA";
          break;
        case 35907:
          result = "GL_SRGB8_ALPHA8";
          break;
        case 35908:
          result = "GL_SLUMINANCE_ALPHA";
          break;
        case 35909:
          result = "GL_SLUMINANCE8_ALPHA8";
          break;
        case 35910:
          result = "GL_SLUMINANCE";
          break;
        case 35911:
          result = "GL_SLUMINANCE8";
          break;
        case 35912:
          result = "GL_COMPRESSED_SRGB";
          break;
        case 35913:
          result = "GL_COMPRESSED_SRGB_ALPHA";
          break;
        case 35914:
          result = "GL_COMPRESSED_SLUMINANCE";
          break;
        case 35915:
          result = "GL_COMPRESSED_SLUMINANCE_ALPHA";
          break;
        case 35916:
          result = "GL_COMPRESSED_SRGB_S3TC_DXT1_EXT";
          break;
        case 35917:
          result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT";
          break;
        case 35918:
          result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT";
          break;
        case 35919:
          result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT";
          break;
        case 35958:
          result = "GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH";
          break;
        case 35967:
          result = "GL_TRANSFORM_FEEDBACK_BUFFER_MODE";
          break;
        case 35968:
          result = "GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS";
          break;
        case 35971:
          result = "GL_TRANSFORM_FEEDBACK_VARYINGS";
          break;
        case 35972:
          result = "GL_TRANSFORM_FEEDBACK_BUFFER_START";
          break;
        case 35973:
          result = "GL_TRANSFORM_FEEDBACK_BUFFER_SIZE";
          break;
        case 35975:
          result = "GL_PRIMITIVES_GENERATED";
          break;
        case 35976:
          result = "GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN";
          break;
        case 35977:
          result = "GL_RASTERIZER_DISCARD";
          break;
        case 35978:
          result = "GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS";
          break;
        case 35979:
          result = "GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS";
          break;
        case 35980:
          result = "GL_INTERLEAVED_ATTRIBS";
          break;
        case 35981:
          result = "GL_SEPARATE_ATTRIBS";
          break;
        case 35982:
          result = "GL_TRANSFORM_FEEDBACK_BUFFER";
          break;
        case 35983:
          result = "GL_TRANSFORM_FEEDBACK_BUFFER_BINDING";
          break;
        case 36000:
          result = "GL_POINT_SPRITE_COORD_ORIGIN";
          break;
        case 36001:
          result = "GL_LOWER_LEFT";
          break;
        case 36002:
          result = "GL_UPPER_LEFT";
          break;
        case 36003:
          result = "GL_STENCIL_BACK_REF";
          break;
        case 36004:
          result = "GL_STENCIL_BACK_VALUE_MASK";
          break;
        case 36005:
          result = "GL_STENCIL_BACK_WRITEMASK";
          break;
        case 36006:
          result = "GL_FRAMEBUFFER_BINDING";
          break;
        case 36007:
          result = "GL_RENDERBUFFER_BINDING";
          break;
        case 36008:
          result = "GL_READ_FRAMEBUFFER";
          break;
        case 36009:
          result = "GL_DRAW_FRAMEBUFFER";
          break;
        case 36010:
          result = "GL_READ_FRAMEBUFFER_BINDING";
          break;
        case 36011:
          result = "GL_RENDERBUFFER_SAMPLES";
          break;
        case 36012:
          result = "GL_DEPTH_COMPONENT32F";
          break;
        case 36013:
          result = "GL_DEPTH32F_STENCIL8";
          break;
        case 36048:
          result = "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE";
          break;
        case 36049:
          result = "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME";
          break;
        case 36050:
          result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL";
          break;
        case 36051:
          result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE";
          break;
        case 36052:
          result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER";
          break;
        case 36053:
          result = "GL_FRAMEBUFFER_COMPLETE";
          break;
        case 36054:
          result = "GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT";
          break;
        case 36055:
          result = "GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT";
          break;
        case 36057:
          result = "GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS";
          break;
        case 36058:
          result = "GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT";
          break;
        case 36059:
          result = "GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER";
          break;
        case 36060:
          result = "GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER";
          break;
        case 36061:
          result = "GL_FRAMEBUFFER_UNSUPPORTED";
          break;
        case 36063:
          result = "GL_MAX_COLOR_ATTACHMENTS";
          break;
        case 36064:
          result = "GL_COLOR_ATTACHMENT0";
          break;
        case 36065:
          result = "GL_COLOR_ATTACHMENT1";
          break;
        case 36066:
          result = "GL_COLOR_ATTACHMENT2";
          break;
        case 36067:
          result = "GL_COLOR_ATTACHMENT3";
          break;
        case 36068:
          result = "GL_COLOR_ATTACHMENT4";
          break;
        case 36069:
          result = "GL_COLOR_ATTACHMENT5";
          break;
        case 36070:
          result = "GL_COLOR_ATTACHMENT6";
          break;
        case 36071:
          result = "GL_COLOR_ATTACHMENT7";
          break;
        case 36072:
          result = "GL_COLOR_ATTACHMENT8";
          break;
        case 36073:
          result = "GL_COLOR_ATTACHMENT9";
          break;
        case 36074:
          result = "GL_COLOR_ATTACHMENT10";
          break;
        case 36075:
          result = "GL_COLOR_ATTACHMENT11";
          break;
        case 36076:
          result = "GL_COLOR_ATTACHMENT12";
          break;
        case 36077:
          result = "GL_COLOR_ATTACHMENT13";
          break;
        case 36078:
          result = "GL_COLOR_ATTACHMENT14";
          break;
        case 36079:
          result = "GL_COLOR_ATTACHMENT15";
          break;
        case 36096:
          result = "GL_DEPTH_ATTACHMENT";
          break;
        case 36128:
          result = "GL_STENCIL_ATTACHMENT";
          break;
        case 36160:
          result = "GL_FRAMEBUFFER";
          break;
        case 36161:
          result = "GL_RENDERBUFFER";
          break;
        case 36162:
          result = "GL_RENDERBUFFER_WIDTH";
          break;
        case 36163:
          result = "GL_RENDERBUFFER_HEIGHT";
          break;
        case 36164:
          result = "GL_RENDERBUFFER_INTERNAL_FORMAT";
          break;
        case 36166:
          result = "GL_STENCIL_INDEX1";
          break;
        case 36167:
          result = "GL_STENCIL_INDEX4";
          break;
        case 36168:
          result = "GL_STENCIL_INDEX8";
          break;
        case 36169:
          result = "GL_STENCIL_INDEX16";
          break;
        case 36176:
          result = "GL_RENDERBUFFER_RED_SIZE";
          break;
        case 36177:
          result = "GL_RENDERBUFFER_GREEN_SIZE";
          break;
        case 36178:
          result = "GL_RENDERBUFFER_BLUE_SIZE";
          break;
        case 36179:
          result = "GL_RENDERBUFFER_ALPHA_SIZE";
          break;
        case 36180:
          result = "GL_RENDERBUFFER_DEPTH_SIZE";
          break;
        case 36181:
          result = "GL_RENDERBUFFER_STENCIL_SIZE";
          break;
        case 36182:
          result = "GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE";
          break;
        case 36183:
          result = "GL_MAX_SAMPLES";
          break;
        case 36193:
          result = "GL_HALF_FLOAT_OES";
          break;
        case 36194:
          result = "GL_RGB565";
          break;
        case 36201:
          result = "GL_PRIMITIVE_RESTART_FIXED_INDEX";
          break;
        case 36202:
          result = "GL_ANY_SAMPLES_PASSED_CONSERVATIVE";
          break;
        case 36203:
          result = "GL_MAX_ELEMENT_INDEX";
          break;
        case 36208:
          result = "GL_RGBA32UI";
          break;
        case 36209:
          result = "GL_RGB32UI";
          break;
        case 36210:
          result = "GL_ALPHA32UI_EXT";
          break;
        case 36211:
          result = "GL_INTENSITY32UI_EXT";
          break;
        case 36212:
          result = "GL_LUMINANCE32UI_EXT";
          break;
        case 36213:
          result = "GL_LUMINANCE_ALPHA32UI_EXT";
          break;
        case 36214:
          result = "GL_RGBA16UI";
          break;
        case 36215:
          result = "GL_RGB16UI";
          break;
        case 36216:
          result = "GL_ALPHA16UI_EXT";
          break;
        case 36217:
          result = "GL_INTENSITY16UI_EXT";
          break;
        case 36218:
          result = "GL_LUMINANCE16UI_EXT";
          break;
        case 36219:
          result = "GL_LUMINANCE_ALPHA16UI_EXT";
          break;
        case 36220:
          result = "GL_RGBA8UI";
          break;
        case 36221:
          result = "GL_RGB8UI";
          break;
        case 36222:
          result = "GL_ALPHA8UI_EXT";
          break;
        case 36223:
          result = "GL_INTENSITY8UI_EXT";
          break;
        case 36224:
          result = "GL_LUMINANCE8UI_EXT";
          break;
        case 36225:
          result = "GL_LUMINANCE_ALPHA8UI_EXT";
          break;
        case 36226:
          result = "GL_RGBA32I";
          break;
        case 36227:
          result = "GL_RGB32I";
          break;
        case 36228:
          result = "GL_ALPHA32I_EXT";
          break;
        case 36229:
          result = "GL_INTENSITY32I_EXT";
          break;
        case 36230:
          result = "GL_LUMINANCE32I_EXT";
          break;
        case 36231:
          result = "GL_LUMINANCE_ALPHA32I_EXT";
          break;
        case 36232:
          result = "GL_RGBA16I";
          break;
        case 36233:
          result = "GL_RGB16I";
          break;
        case 36234:
          result = "GL_ALPHA16I_EXT";
          break;
        case 36235:
          result = "GL_INTENSITY16I_EXT";
          break;
        case 36236:
          result = "GL_LUMINANCE16I_EXT";
          break;
        case 36237:
          result = "GL_LUMINANCE_ALPHA16I_EXT";
          break;
        case 36238:
          result = "GL_RGBA8I";
          break;
        case 36239:
          result = "GL_RGB8I";
          break;
        case 36240:
          result = "GL_ALPHA8I_EXT";
          break;
        case 36241:
          result = "GL_INTENSITY8I_EXT";
          break;
        case 36242:
          result = "GL_LUMINANCE8I_EXT";
          break;
        case 36243:
          result = "GL_LUMINANCE_ALPHA8I_EXT";
          break;
        case 36244:
          result = "GL_RED_INTEGER";
          break;
        case 36245:
          result = "GL_GREEN_INTEGER";
          break;
        case 36246:
          result = "GL_BLUE_INTEGER";
          break;
        case 36247:
          result = "GL_ALPHA_INTEGER_EXT";
          break;
        case 36248:
          result = "GL_RGB_INTEGER";
          break;
        case 36249:
          result = "GL_RGBA_INTEGER";
          break;
        case 36250:
          result = "GL_BGR_INTEGER";
          break;
        case 36251:
          result = "GL_BGRA_INTEGER";
          break;
        case 36252:
          result = "GL_LUMINANCE_INTEGER_EXT";
          break;
        case 36253:
          result = "GL_LUMINANCE_ALPHA_INTEGER_EXT";
          break;
        case 36254:
          result = "GL_RGBA_INTEGER_MODE_EXT";
          break;
        case 36255:
          result = "GL_INT_2_10_10_10_REV";
          break;
        case 36263:
          result = "GL_FRAMEBUFFER_ATTACHMENT_LAYERED";
          break;
        case 36264:
          result = "GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS";
          break;
        case 36265:
          result = "GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT";
          break;
        case 36269:
          result = "GL_FLOAT_32_UNSIGNED_INT_24_8_REV";
          break;
        case 36270:
          result = "GL_SHADER_INCLUDE_ARB";
          break;
        case 36281:
          result = "GL_FRAMEBUFFER_SRGB";
          break;
        case 36282:
          result = "GL_FRAMEBUFFER_SRGB_CAPABLE_EXT";
          break;
        case 36283:
          result = "GL_COMPRESSED_RED_RGTC1";
          break;
        case 36284:
          result = "GL_COMPRESSED_SIGNED_RED_RGTC1";
          break;
        case 36285:
          result = "GL_COMPRESSED_RG_RGTC2";
          break;
        case 36286:
          result = "GL_COMPRESSED_SIGNED_RG_RGTC2";
          break;
        case 36288:
          result = "GL_SAMPLER_1D_ARRAY";
          break;
        case 36289:
          result = "GL_SAMPLER_2D_ARRAY";
          break;
        case 36290:
          result = "GL_SAMPLER_BUFFER";
          break;
        case 36291:
          result = "GL_SAMPLER_1D_ARRAY_SHADOW";
          break;
        case 36292:
          result = "GL_SAMPLER_2D_ARRAY_SHADOW";
          break;
        case 36293:
          result = "GL_SAMPLER_CUBE_SHADOW";
          break;
        case 36294:
          result = "GL_UNSIGNED_INT_VEC2";
          break;
        case 36295:
          result = "GL_UNSIGNED_INT_VEC3";
          break;
        case 36296:
          result = "GL_UNSIGNED_INT_VEC4";
          break;
        case 36297:
          result = "GL_INT_SAMPLER_1D";
          break;
        case 36298:
          result = "GL_INT_SAMPLER_2D";
          break;
        case 36299:
          result = "GL_INT_SAMPLER_3D";
          break;
        case 36300:
          result = "GL_INT_SAMPLER_CUBE";
          break;
        case 36301:
          result = "GL_INT_SAMPLER_2D_RECT";
          break;
        case 36302:
          result = "GL_INT_SAMPLER_1D_ARRAY";
          break;
        case 36303:
          result = "GL_INT_SAMPLER_2D_ARRAY";
          break;
        case 36304:
          result = "GL_INT_SAMPLER_BUFFER";
          break;
        case 36305:
          result = "GL_UNSIGNED_INT_SAMPLER_1D";
          break;
        case 36306:
          result = "GL_UNSIGNED_INT_SAMPLER_2D";
          break;
        case 36307:
          result = "GL_UNSIGNED_INT_SAMPLER_3D";
          break;
        case 36308:
          result = "GL_UNSIGNED_INT_SAMPLER_CUBE";
          break;
        case 36309:
          result = "GL_UNSIGNED_INT_SAMPLER_2D_RECT";
          break;
        case 36310:
          result = "GL_UNSIGNED_INT_SAMPLER_1D_ARRAY";
          break;
        case 36311:
          result = "GL_UNSIGNED_INT_SAMPLER_2D_ARRAY";
          break;
        case 36312:
          result = "GL_UNSIGNED_INT_SAMPLER_BUFFER";
          break;
        case 36313:
          result = "GL_GEOMETRY_SHADER";
          break;
        case 36314:
          result = "GL_GEOMETRY_VERTICES_OUT_EXT";
          break;
        case 36315:
          result = "GL_GEOMETRY_INPUT_TYPE_EXT";
          break;
        case 36316:
          result = "GL_GEOMETRY_OUTPUT_TYPE_EXT";
          break;
        case 36317:
          result = "GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT";
          break;
        case 36318:
          result = "GL_MAX_VERTEX_VARYING_COMPONENTS_EXT";
          break;
        case 36319:
          result = "GL_MAX_GEOMETRY_UNIFORM_COMPONENTS";
          break;
        case 36320:
          result = "GL_MAX_GEOMETRY_OUTPUT_VERTICES";
          break;
        case 36321:
          result = "GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS";
          break;
        case 36322:
          result = "GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT";
          break;
        case 36323:
          result = "GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT";
          break;
        case 36324:
          result = "GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT";
          break;
        case 36325:
          result = "GL_ACTIVE_SUBROUTINES";
          break;
        case 36326:
          result = "GL_ACTIVE_SUBROUTINE_UNIFORMS";
          break;
        case 36327:
          result = "GL_MAX_SUBROUTINES";
          break;
        case 36328:
          result = "GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS";
          break;
        case 36329:
          result = "GL_NAMED_STRING_LENGTH_ARB";
          break;
        case 36330:
          result = "GL_NAMED_STRING_TYPE_ARB";
          break;
        case 36333:
          result = "GL_MAX_BINDABLE_UNIFORM_SIZE_EXT";
          break;
        case 36334:
          result = "GL_UNIFORM_BUFFER_EXT";
          break;
        case 36335:
          result = "GL_UNIFORM_BUFFER_BINDING_EXT";
          break;
        case 36336:
          result = "GL_LOW_FLOAT";
          break;
        case 36337:
          result = "GL_MEDIUM_FLOAT";
          break;
        case 36338:
          result = "GL_HIGH_FLOAT";
          break;
        case 36339:
          result = "GL_LOW_INT";
          break;
        case 36340:
          result = "GL_MEDIUM_INT";
          break;
        case 36341:
          result = "GL_HIGH_INT";
          break;
        case 36344:
          result = "GL_SHADER_BINARY_FORMATS";
          break;
        case 36345:
          result = "GL_NUM_SHADER_BINARY_FORMATS";
          break;
        case 36346:
          result = "GL_SHADER_COMPILER";
          break;
        case 36347:
          result = "GL_MAX_VERTEX_UNIFORM_VECTORS";
          break;
        case 36348:
          result = "GL_MAX_VARYING_VECTORS";
          break;
        case 36349:
          result = "GL_MAX_FRAGMENT_UNIFORM_VECTORS";
          break;
        case 36371:
          result = "GL_QUERY_WAIT";
          break;
        case 36372:
          result = "GL_QUERY_NO_WAIT";
          break;
        case 36373:
          result = "GL_QUERY_BY_REGION_WAIT";
          break;
        case 36374:
          result = "GL_QUERY_BY_REGION_NO_WAIT";
          break;
        case 36382:
          result = "GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS";
          break;
        case 36383:
          result = "GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS";
          break;
        case 36386:
          result = "GL_TRANSFORM_FEEDBACK";
          break;
        case 36387:
          result = "GL_TRANSFORM_FEEDBACK_PAUSED";
          break;
        case 36388:
          result = "GL_TRANSFORM_FEEDBACK_ACTIVE";
          break;
        case 36389:
          result = "GL_TRANSFORM_FEEDBACK_BINDING";
          break;
        case 36392:
          result = "GL_TIMESTAMP";
          break;
        case 36418:
          result = "GL_TEXTURE_SWIZZLE_R";
          break;
        case 36419:
          result = "GL_TEXTURE_SWIZZLE_G";
          break;
        case 36420:
          result = "GL_TEXTURE_SWIZZLE_B";
          break;
        case 36421:
          result = "GL_TEXTURE_SWIZZLE_A";
          break;
        case 36422:
          result = "GL_TEXTURE_SWIZZLE_RGBA";
          break;
        case 36423:
          result = "GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS";
          break;
        case 36424:
          result = "GL_ACTIVE_SUBROUTINE_MAX_LENGTH";
          break;
        case 36425:
          result = "GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH";
          break;
        case 36426:
          result = "GL_NUM_COMPATIBLE_SUBROUTINES";
          break;
        case 36427:
          result = "GL_COMPATIBLE_SUBROUTINES";
          break;
        case 36428:
          result = "GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION";
          break;
        case 36429:
          result = "GL_FIRST_VERTEX_CONVENTION";
          break;
        case 36430:
          result = "GL_LAST_VERTEX_CONVENTION";
          break;
        case 36431:
          result = "GL_PROVOKING_VERTEX";
          break;
        case 36432:
          result = "GL_SAMPLE_POSITION";
          break;
        case 36433:
          result = "GL_SAMPLE_MASK";
          break;
        case 36434:
          result = "GL_SAMPLE_MASK_VALUE";
          break;
        case 36441:
          result = "GL_MAX_SAMPLE_MASK_WORDS";
          break;
        case 36442:
          result = "GL_MAX_GEOMETRY_SHADER_INVOCATIONS";
          break;
        case 36443:
          result = "GL_MIN_FRAGMENT_INTERPOLATION_OFFSET";
          break;
        case 36444:
          result = "GL_MAX_FRAGMENT_INTERPOLATION_OFFSET";
          break;
        case 36445:
          result = "GL_FRAGMENT_INTERPOLATION_OFFSET_BITS";
          break;
        case 36446:
          result = "GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET";
          break;
        case 36447:
          result = "GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET";
          break;
        case 36464:
          result = "GL_MAX_TRANSFORM_FEEDBACK_BUFFERS";
          break;
        case 36465:
          result = "GL_MAX_VERTEX_STREAMS";
          break;
        case 36466:
          result = "GL_PATCH_VERTICES";
          break;
        case 36467:
          result = "GL_PATCH_DEFAULT_INNER_LEVEL";
          break;
        case 36468:
          result = "GL_PATCH_DEFAULT_OUTER_LEVEL";
          break;
        case 36469:
          result = "GL_TESS_CONTROL_OUTPUT_VERTICES";
          break;
        case 36470:
          result = "GL_TESS_GEN_MODE";
          break;
        case 36471:
          result = "GL_TESS_GEN_SPACING";
          break;
        case 36472:
          result = "GL_TESS_GEN_VERTEX_ORDER";
          break;
        case 36473:
          result = "GL_TESS_GEN_POINT_MODE";
          break;
        case 36474:
          result = "GL_ISOLINES";
          break;
        case 36475:
          result = "GL_FRACTIONAL_ODD";
          break;
        case 36476:
          result = "GL_FRACTIONAL_EVEN";
          break;
        case 36477:
          result = "GL_MAX_PATCH_VERTICES";
          break;
        case 36478:
          result = "GL_MAX_TESS_GEN_LEVEL";
          break;
        case 36479:
          result = "GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS";
          break;
        case 36480:
          result = "GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS";
          break;
        case 36481:
          result = "GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS";
          break;
        case 36482:
          result = "GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS";
          break;
        case 36483:
          result = "GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS";
          break;
        case 36484:
          result = "GL_MAX_TESS_PATCH_COMPONENTS";
          break;
        case 36485:
          result = "GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS";
          break;
        case 36486:
          result = "GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS";
          break;
        case 36487:
          result = "GL_TESS_EVALUATION_SHADER";
          break;
        case 36488:
          result = "GL_TESS_CONTROL_SHADER";
          break;
        case 36489:
          result = "GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS";
          break;
        case 36490:
          result = "GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS";
          break;
        case 36662:
          result = "GL_COPY_READ_BUFFER";
          break;
        case 36663:
          result = "GL_COPY_WRITE_BUFFER";
          break;
        case 36671:
          result = "GL_DRAW_INDIRECT_BUFFER";
          break;
        case 36675:
          result = "GL_DRAW_INDIRECT_BUFFER_BINDING";
          break;
        case 36678:
          result = "GL_DOUBLE_MAT2";
          break;
        case 36679:
          result = "GL_DOUBLE_MAT3";
          break;
        case 36680:
          result = "GL_DOUBLE_MAT4";
          break;
        case 36681:
          result = "GL_DOUBLE_MAT2x3";
          break;
        case 36682:
          result = "GL_DOUBLE_MAT2x4";
          break;
        case 36683:
          result = "GL_DOUBLE_MAT3x2";
          break;
        case 36684:
          result = "GL_DOUBLE_MAT3x4";
          break;
        case 36685:
          result = "GL_DOUBLE_MAT4x2";
          break;
        case 36686:
          result = "GL_DOUBLE_MAT4x3";
          break;
        case 36756:
          result = "GL_R8_SNORM";
          break;
        case 36757:
          result = "GL_RG8_SNORM";
          break;
        case 36758:
          result = "GL_RGB8_SNORM";
          break;
        case 36759:
          result = "GL_RGBA8_SNORM";
          break;
        case 36760:
          result = "GL_R16_SNORM";
          break;
        case 36761:
          result = "GL_RG16_SNORM";
          break;
        case 36762:
          result = "GL_RGB16_SNORM";
          break;
        case 36763:
          result = "GL_RGBA16_SNORM";
          break;
        case 36764:
          result = "GL_SIGNED_NORMALIZED";
          break;
        case 36765:
          result = "GL_PRIMITIVE_RESTART";
          break;
        case 36766:
          result = "GL_PRIMITIVE_RESTART_INDEX";
          break;
        case 36767:
          result = "GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB";
          break;
        case 36860:
          result = "GL_DOUBLE_VEC2";
          break;
        case 36861:
          result = "GL_DOUBLE_VEC3";
          break;
        case 36862:
          result = "GL_DOUBLE_VEC4";
          break;
        case 36873:
          result = "GL_TEXTURE_CUBE_MAP_ARRAY";
          break;
        case 36874:
          result = "GL_TEXTURE_BINDING_CUBE_MAP_ARRAY";
          break;
        case 36875:
          result = "GL_PROXY_TEXTURE_CUBE_MAP_ARRAY";
          break;
        case 36876:
          result = "GL_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36877:
          result = "GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW";
          break;
        case 36878:
          result = "GL_INT_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36879:
          result = "GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36975:
          result = "GL_RGB10_A2UI";
          break;
        case 37050:
          result = "GL_SCALED_RESOLVE_FASTEST_EXT";
          break;
        case 37051:
          result = "GL_SCALED_RESOLVE_NICEST_EXT";
          break;
        case 37120:
          result = "GL_TEXTURE_2D_MULTISAMPLE";
          break;
        case 37121:
          result = "GL_PROXY_TEXTURE_2D_MULTISAMPLE";
          break;
        case 37122:
          result = "GL_TEXTURE_2D_MULTISAMPLE_ARRAY";
          break;
        case 37123:
          result = "GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY";
          break;
        case 37124:
          result = "GL_TEXTURE_BINDING_2D_MULTISAMPLE";
          break;
        case 37125:
          result = "GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY";
          break;
        case 37126:
          result = "GL_TEXTURE_SAMPLES";
          break;
        case 37127:
          result = "GL_TEXTURE_FIXED_SAMPLE_LOCATIONS";
          break;
        case 37128:
          result = "GL_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37129:
          result = "GL_INT_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37130:
          result = "GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37131:
          result = "GL_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37132:
          result = "GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37133:
          result = "GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37134:
          result = "GL_MAX_COLOR_TEXTURE_SAMPLES";
          break;
        case 37135:
          result = "GL_MAX_DEPTH_TEXTURE_SAMPLES";
          break;
        case 37136:
          result = "GL_MAX_INTEGER_SAMPLES";
          break;
        case 37137:
          result = "GL_MAX_SERVER_WAIT_TIMEOUT";
          break;
        case 37138:
          result = "GL_OBJECT_TYPE";
          break;
        case 37139:
          result = "GL_SYNC_CONDITION";
          break;
        case 37140:
          result = "GL_SYNC_STATUS";
          break;
        case 37141:
          result = "GL_SYNC_FLAGS";
          break;
        case 37142:
          result = "GL_SYNC_FENCE";
          break;
        case 37143:
          result = "GL_SYNC_GPU_COMMANDS_COMPLETE";
          break;
        case 37144:
          result = "GL_UNSIGNALED";
          break;
        case 37145:
          result = "GL_SIGNALED";
          break;
        case 37146:
          result = "GL_ALREADY_SIGNALED";
          break;
        case 37147:
          result = "GL_TIMEOUT_EXPIRED";
          break;
        case 37148:
          result = "GL_CONDITION_SATISFIED";
          break;
        case 37149:
          result = "GL_WAIT_FAILED";
          break;
        case 37151:
          result = "GL_BUFFER_ACCESS_FLAGS";
          break;
        case 37152:
          result = "GL_BUFFER_MAP_LENGTH";
          break;
        case 37153:
          result = "GL_BUFFER_MAP_OFFSET";
          break;
        case 37154:
          result = "GL_MAX_VERTEX_OUTPUT_COMPONENTS";
          break;
        case 37155:
          result = "GL_MAX_GEOMETRY_INPUT_COMPONENTS";
          break;
        case 37156:
          result = "GL_MAX_GEOMETRY_OUTPUT_COMPONENTS";
          break;
        case 37157:
          result = "GL_MAX_FRAGMENT_INPUT_COMPONENTS";
          break;
        case 37158:
          result = "GL_CONTEXT_PROFILE_MASK";
          break;
        case 37167:
          result = "GL_TEXTURE_IMMUTABLE_FORMAT";
          break;
        case 37201:
          result = "GL_BUFFER_OBJECT_EXT";
          break;
        case 37203:
          result = "GL_QUERY_OBJECT_EXT";
          break;
        case 37204:
          result = "GL_VERTEX_ARRAY_OBJECT_EXT";
          break;
        case 37488:
          result = "GL_COMPRESSED_R11_EAC";
          break;
        case 37489:
          result = "GL_COMPRESSED_SIGNED_R11_EAC";
          break;
        case 37490:
          result = "GL_COMPRESSED_RG11_EAC";
          break;
        case 37491:
          result = "GL_COMPRESSED_SIGNED_RG11_EAC";
          break;
        case 37492:
          result = "GL_COMPRESSED_RGB8_ETC2";
          break;
        case 37493:
          result = "GL_COMPRESSED_SRGB8_ETC2";
          break;
        case 37494:
          result = "GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2";
          break;
        case 37495:
          result = "GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2";
          break;
        case 37496:
          result = "GL_COMPRESSED_RGBA8_ETC2_EAC";
          break;
        case 37497:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC";
          break;
        case 37760:
          result = "GL_NUM_SAMPLE_COUNTS";
          break;
        case 37793:
          result = "GL_BGRA8_EXT";
          break;
        case 37808:
          result = "GL_COMPRESSED_RGBA_ASTC_4x4_KHR";
          break;
        case 37809:
          result = "GL_COMPRESSED_RGBA_ASTC_5x4_KHR";
          break;
        case 37810:
          result = "GL_COMPRESSED_RGBA_ASTC_5x5_KHR";
          break;
        case 37811:
          result = "GL_COMPRESSED_RGBA_ASTC_6x5_KHR";
          break;
        case 37812:
          result = "GL_COMPRESSED_RGBA_ASTC_6x6_KHR";
          break;
        case 37813:
          result = "GL_COMPRESSED_RGBA_ASTC_8x5_KHR";
          break;
        case 37814:
          result = "GL_COMPRESSED_RGBA_ASTC_8x6_KHR";
          break;
        case 37815:
          result = "GL_COMPRESSED_RGBA_ASTC_8x8_KHR";
          break;
        case 37816:
          result = "GL_COMPRESSED_RGBA_ASTC_10x5_KHR";
          break;
        case 37817:
          result = "GL_COMPRESSED_RGBA_ASTC_10x6_KHR";
          break;
        case 37818:
          result = "GL_COMPRESSED_RGBA_ASTC_10x8_KHR";
          break;
        case 37819:
          result = "GL_COMPRESSED_RGBA_ASTC_10x10_KHR";
          break;
        case 37820:
          result = "GL_COMPRESSED_RGBA_ASTC_12x10_KHR";
          break;
        case 37821:
          result = "GL_COMPRESSED_RGBA_ASTC_12x12_KHR";
          break;
        case 37840:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR";
          break;
        case 37841:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR";
          break;
        case 37842:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR";
          break;
        case 37843:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR";
          break;
        case 37844:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR";
          break;
        case 37845:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR";
          break;
        case 37846:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR";
          break;
        case 37847:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR";
          break;
        case 37848:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR";
          break;
        case 37849:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR";
          break;
        case 37850:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR";
          break;
        case 37851:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR";
          break;
        case 37852:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR";
          break;
        case 37853:
          result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR";
          break;
        case 37874:
          result = "GL_XRSRGB10_APPLE";
          break;
        case 37875:
          result = "GL_YCBCR10_422_2PLANE_PACKED_APPLE";
          break;
        case 37876:
          result = "GL_YCBCR10_420_2PLANE_PACKED_APPLE";
          break;
        case 37877:
          result = "GL_YCBCR10_444_2PLANE_PACKED_APPLE";
          break;
        case 37878:
          result = "GL_SRGB_YCBCR10_422_2PLANE_PACKED_APPLE";
          break;
        case 37879:
          result = "GL_SRGB_YCBCR10_420_2PLANE_PACKED_APPLE";
          break;
        case 37880:
          result = "GL_SRGB_YCBCR10_444_2PLANE_PACKED_APPLE";
          break;
        case 37881:
          result = "GL_XRSRGB10_PLANE_A8_PLANE_APPLE";
          break;
        case 37882:
          result = "GL_UNSIGNED_INT_2_10_10_10_PLANE_UNSIGNED_BYTE_PLANE_APPLE";
          break;
        case 37883:
          result = "GL_RGB8_420_2PLANE_APPLE";
          break;
        case 37884:
          result = "GL_RGB8_422_2PLANE_APPLE";
          break;
        case 37885:
          result = "GL_RGB8_444_2PLANE_APPLE";
          break;
        case 37886:
          result = "GL_COMPRESSED_RGBA_ASTC_4x2_LOWPRECISION_APPLE";
          break;
        case 37887:
          result = "GL_COMPRESSED_RGBA_ASTC_4x4_LOWPRECISION_APPLE";
          break;
        case 37888:
          result = "GL_COMPRESSED_RGBA_ASTC_5x4_LOWPRECISION_APPLE";
          break;
        case 37889:
          result = "GL_COMPRESSED_RGBA_ASTC_5x5_LOWPRECISION_APPLE";
          break;
        case 37890:
          result = "GL_COMPRESSED_RGBA_ASTC_6x5_LOWPRECISION_APPLE";
          break;
        case 37891:
          result = "GL_COMPRESSED_RGBA_ASTC_6x6_LOWPRECISION_APPLE";
          break;
        case 37892:
          result = "GL_COMPRESSED_RGBA_ASTC_8x4_LOWPRECISION_APPLE";
          break;
        case 37893:
          result = "GL_COMPRESSED_RGBA_ASTC_8x5_LOWPRECISION_APPLE";
          break;
        case 37894:
          result = "GL_COMPRESSED_RGBA_ASTC_8x6_LOWPRECISION_APPLE";
          break;
        case 37895:
          result = "GL_COMPRESSED_RGBA_ASTC_8x8_LOWPRECISION_APPLE";
          break;
        case 37896:
          result = "GL_COMPRESSED_RGBA_ASTC_10x5_LOWPRECISION_APPLE";
          break;
        case 37897:
          result = "GL_COMPRESSED_RGBA_ASTC_10x6_LOWPRECISION_APPLE";
          break;
        case 37898:
          result = "GL_COMPRESSED_RGBA_ASTC_10x8_LOWPRECISION_APPLE";
          break;
        case 37899:
          result = "GL_COMPRESSED_RGBA_ASTC_10x10_LOWPRECISION_APPLE";
          break;
        case 37900:
          result = "GL_COMPRESSED_RGBA_ASTC_12x10_LOWPRECISION_APPLE";
          break;
        case 37901:
          result = "GL_COMPRESSED_RGBA_ASTC_12x12_LOWPRECISION_APPLE";
          break;
        default:
          return 0;
      }
      return result;
    }
    if (a1 >= 0x80000)
    {
      switch(a1)
      {
        case 0x80000:
          return "GL_SCISSOR_BIT";
        case 0xFFFFF:
          return "GL_ALL_ATTRIB_BITS";
        case 0x20000000:
          return "GL_MULTISAMPLE_BIT";
      }
    }
    else
    {
      switch(a1)
      {
        case 0x10000:
          return "GL_EVAL_BIT";
        case 0x20000:
          return "GL_LIST_BIT";
        case 0x40000:
          return "GL_TEXTURE_BIT";
      }
    }
    return 0;
  }
  if (a1 > 4095)
  {
    if (a1 <= 7167)
    {
      if (a1 > 5631)
      {
        if (a1 <= 6399)
        {
          if (a1 > 5888)
          {
            if (a1 <= 6143)
            {
              if (a1 == 5889)
                return "GL_PROJECTION";
              if (a1 == 5890)
                return "GL_TEXTURE";
            }
            else
            {
              switch(a1)
              {
                case 6144:
                  return "GL_COLOR";
                case 6145:
                  return "GL_DEPTH";
                case 6146:
                  return "GL_STENCIL";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 5632:
              result = "GL_EMISSION";
              break;
            case 5633:
              result = "GL_SHININESS";
              break;
            case 5634:
              result = "GL_AMBIENT_AND_DIFFUSE";
              break;
            case 5635:
              result = "GL_COLOR_INDEXES";
              break;
            default:
              if (a1 != 5888)
                return 0;
              result = "GL_MODELVIEW";
              break;
          }
        }
        else
        {
          if (a1 > 6655)
          {
            if (a1 > 6912)
            {
              if (a1 == 6913)
                return "GL_LINE";
              if (a1 == 6914)
                return "GL_FILL";
            }
            else
            {
              if (a1 == 6656)
                return "GL_BITMAP";
              if (a1 == 6912)
                return "GL_POINT";
            }
            return 0;
          }
          switch(a1)
          {
            case 6400:
              result = "GL_COLOR_INDEX";
              break;
            case 6401:
              result = "GL_STENCIL_INDEX";
              break;
            case 6402:
              result = "GL_DEPTH_COMPONENT";
              break;
            case 6403:
              result = "GL_RED";
              break;
            case 6404:
              result = "GL_GREEN";
              break;
            case 6405:
              result = "GL_BLUE";
              break;
            case 6406:
              result = "GL_ALPHA";
              break;
            case 6407:
              result = "GL_RGB";
              break;
            case 6408:
              result = "GL_RGBA";
              break;
            case 6409:
              result = "GL_LUMINANCE";
              break;
            case 6410:
              result = "GL_LUMINANCE_ALPHA";
              break;
            default:
              return 0;
          }
        }
      }
      else if (a1 <= 4863)
      {
        if (a1 <= 4353)
        {
          switch(a1)
          {
            case 4096:
              return "GL_TEXTURE_WIDTH";
            case 4097:
              return "GL_TEXTURE_HEIGHT";
            case 4098:
              return 0;
            case 4099:
              return "GL_TEXTURE_INTERNAL_FORMAT";
            case 4100:
              return "GL_TEXTURE_BORDER_COLOR";
            case 4101:
              return "GL_TEXTURE_BORDER";
            default:
              if (a1 == 4352)
              {
                result = "GL_DONT_CARE";
              }
              else
              {
                if (a1 != 4353)
                  return 0;
                result = "GL_FASTEST";
              }
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 4608:
              result = "GL_AMBIENT";
              break;
            case 4609:
              result = "GL_DIFFUSE";
              break;
            case 4610:
              result = "GL_SPECULAR";
              break;
            case 4611:
              result = "GL_POSITION";
              break;
            case 4612:
              result = "GL_SPOT_DIRECTION";
              break;
            case 4613:
              result = "GL_SPOT_EXPONENT";
              break;
            case 4614:
              result = "GL_SPOT_CUTOFF";
              break;
            case 4615:
              result = "GL_CONSTANT_ATTENUATION";
              break;
            case 4616:
              result = "GL_LINEAR_ATTENUATION";
              break;
            case 4617:
              result = "GL_QUADRATIC_ATTENUATION";
              break;
            default:
              if (a1 != 4354)
                return 0;
              result = "GL_NICEST";
              break;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 5120:
            return "GL_BYTE";
          case 5121:
            return "GL_UNSIGNED_BYTE";
          case 5122:
            return "GL_SHORT";
          case 5123:
            return "GL_UNSIGNED_SHORT";
          case 5124:
            return "GL_INT";
          case 5125:
            return "GL_UNSIGNED_INT";
          case 5126:
            return "GL_FLOAT";
          case 5127:
            return "GL_2_BYTES";
          case 5128:
            return "GL_3_BYTES";
          case 5129:
            return "GL_4_BYTES";
          case 5130:
            return "GL_DOUBLE";
          case 5131:
            return "GL_HALF_FLOAT";
          case 5132:
            return "GL_FIXED";
          case 5133:
          case 5134:
          case 5135:
          case 5136:
          case 5137:
          case 5138:
          case 5139:
          case 5140:
          case 5141:
          case 5142:
          case 5143:
          case 5144:
          case 5145:
          case 5146:
          case 5147:
          case 5148:
          case 5149:
          case 5150:
          case 5151:
          case 5152:
          case 5153:
          case 5154:
          case 5155:
          case 5156:
          case 5157:
          case 5158:
          case 5159:
          case 5160:
          case 5161:
          case 5162:
          case 5163:
          case 5164:
          case 5165:
          case 5166:
          case 5167:
          case 5168:
          case 5169:
          case 5170:
          case 5171:
          case 5172:
          case 5173:
          case 5174:
          case 5175:
          case 5176:
          case 5177:
          case 5178:
          case 5179:
          case 5180:
          case 5181:
          case 5182:
          case 5183:
          case 5184:
          case 5185:
          case 5186:
          case 5187:
          case 5188:
          case 5189:
          case 5190:
          case 5191:
          case 5192:
          case 5193:
          case 5194:
          case 5195:
          case 5196:
          case 5197:
          case 5198:
          case 5199:
          case 5200:
          case 5201:
          case 5202:
          case 5203:
          case 5204:
          case 5205:
          case 5206:
          case 5207:
          case 5208:
          case 5209:
          case 5210:
          case 5211:
          case 5212:
          case 5213:
          case 5214:
          case 5215:
          case 5216:
          case 5217:
          case 5218:
          case 5219:
          case 5220:
          case 5221:
          case 5222:
          case 5223:
          case 5224:
          case 5225:
          case 5226:
          case 5227:
          case 5228:
          case 5229:
          case 5230:
          case 5231:
          case 5232:
          case 5233:
          case 5234:
          case 5235:
          case 5236:
          case 5237:
          case 5238:
          case 5239:
          case 5240:
          case 5241:
          case 5242:
          case 5243:
          case 5244:
          case 5245:
          case 5246:
          case 5247:
          case 5248:
          case 5249:
          case 5250:
          case 5251:
          case 5252:
          case 5253:
          case 5254:
          case 5255:
          case 5256:
          case 5257:
          case 5258:
          case 5259:
          case 5260:
          case 5261:
          case 5262:
          case 5263:
          case 5264:
          case 5265:
          case 5266:
          case 5267:
          case 5268:
          case 5269:
          case 5270:
          case 5271:
          case 5272:
          case 5273:
          case 5274:
          case 5275:
          case 5276:
          case 5277:
          case 5278:
          case 5279:
          case 5280:
          case 5281:
          case 5282:
          case 5283:
          case 5284:
          case 5285:
          case 5286:
          case 5287:
          case 5288:
          case 5289:
          case 5290:
          case 5291:
          case 5292:
          case 5293:
          case 5294:
          case 5295:
          case 5296:
          case 5297:
          case 5298:
          case 5299:
          case 5300:
          case 5301:
          case 5302:
          case 5303:
          case 5304:
          case 5305:
          case 5306:
          case 5307:
          case 5308:
          case 5309:
          case 5310:
          case 5311:
          case 5312:
          case 5313:
          case 5314:
          case 5315:
          case 5316:
          case 5317:
          case 5318:
          case 5319:
          case 5320:
          case 5321:
          case 5322:
          case 5323:
          case 5324:
          case 5325:
          case 5326:
          case 5327:
          case 5328:
          case 5329:
          case 5330:
          case 5331:
          case 5332:
          case 5333:
          case 5334:
          case 5335:
          case 5336:
          case 5337:
          case 5338:
          case 5339:
          case 5340:
          case 5341:
          case 5342:
          case 5343:
          case 5344:
          case 5345:
          case 5346:
          case 5347:
          case 5348:
          case 5349:
          case 5350:
          case 5351:
          case 5352:
          case 5353:
          case 5354:
          case 5355:
          case 5356:
          case 5357:
          case 5358:
          case 5359:
          case 5360:
          case 5361:
          case 5362:
          case 5363:
          case 5364:
          case 5365:
          case 5366:
          case 5367:
          case 5368:
          case 5369:
          case 5370:
          case 5371:
          case 5372:
          case 5373:
          case 5374:
          case 5375:
            return 0;
          case 5376:
            return "GL_CLEAR";
          case 5377:
            return "GL_AND";
          case 5378:
            return "GL_AND_REVERSE";
          case 5379:
            return "GL_COPY";
          case 5380:
            return "GL_AND_INVERTED";
          case 5381:
            return "GL_NOOP";
          case 5382:
            return "GL_XOR";
          case 5383:
            return "GL_OR";
          case 5384:
            return "GL_NOR";
          case 5385:
            return "GL_EQUIV";
          case 5386:
            return "GL_INVERT";
          case 5387:
            return "GL_OR_REVERSE";
          case 5388:
            return "GL_COPY_INVERTED";
          case 5389:
            return "GL_OR_INVERTED";
          case 5390:
            return "GL_NAND";
          case 5391:
            return "GL_SET";
          default:
            if (a1 == 4864)
            {
              result = "GL_COMPILE";
            }
            else
            {
              if (a1 != 4865)
                return 0;
              result = "GL_COMPILE_AND_EXECUTE";
            }
            break;
        }
      }
    }
    else if (a1 > 10494)
    {
      if (a1 <= 10751)
      {
        switch(a1)
        {
          case 10495:
            return "GL_TEXTURE_SUBIMAGE_SYNC";
          case 10496:
            return "GL_CLAMP";
          case 10497:
            return "GL_REPEAT";
        }
        return 0;
      }
      switch(a1)
      {
        case 10752:
          result = "GL_POLYGON_OFFSET_UNITS";
          break;
        case 10753:
          result = "GL_POLYGON_OFFSET_POINT";
          break;
        case 10754:
          result = "GL_POLYGON_OFFSET_LINE";
          break;
        case 10755:
        case 10756:
        case 10757:
        case 10758:
        case 10759:
        case 10760:
        case 10761:
        case 10762:
        case 10763:
        case 10764:
        case 10765:
        case 10766:
        case 10767:
        case 10769:
        case 10770:
        case 10771:
        case 10772:
        case 10773:
        case 10774:
        case 10775:
        case 10776:
        case 10777:
        case 10778:
        case 10779:
        case 10780:
        case 10781:
        case 10782:
        case 10783:
          return 0;
        case 10768:
          result = "GL_R3_G3_B2";
          break;
        case 10784:
          result = "GL_V2F";
          break;
        case 10785:
          result = "GL_V3F";
          break;
        case 10786:
          result = "GL_C4UB_V2F";
          break;
        case 10787:
          result = "GL_C4UB_V3F";
          break;
        case 10788:
          result = "GL_C3F_V3F";
          break;
        case 10789:
          result = "GL_N3F_V3F";
          break;
        case 10790:
          result = "GL_C4F_N3F_V3F";
          break;
        case 10791:
          result = "GL_T2F_V3F";
          break;
        case 10792:
          result = "GL_T4F_V4F";
          break;
        case 10793:
          result = "GL_T2F_C4UB_V3F";
          break;
        case 10794:
          result = "GL_T2F_C3F_V3F";
          break;
        case 10795:
          result = "GL_T2F_N3F_V3F";
          break;
        case 10796:
          result = "GL_T2F_C4F_N3F_V3F";
          break;
        case 10797:
          result = "GL_T4F_C4F_N3F_V4F";
          break;
        default:
          switch(a1)
          {
            case 12288:
              result = "GL_CLIP_DISTANCE0";
              break;
            case 12289:
              result = "GL_CLIP_DISTANCE1";
              break;
            case 12290:
              result = "GL_CLIP_DISTANCE2";
              break;
            case 12291:
              result = "GL_CLIP_DISTANCE3";
              break;
            case 12292:
              result = "GL_CLIP_DISTANCE4";
              break;
            case 12293:
              result = "GL_CLIP_DISTANCE5";
              break;
            case 12294:
              result = "GL_CLIP_DISTANCE6";
              break;
            case 12295:
              result = "GL_CLIP_DISTANCE7";
              break;
            default:
              switch(a1)
              {
                case 16384:
                  result = "GL_LIGHT0";
                  break;
                case 16385:
                  result = "GL_LIGHT1";
                  break;
                case 16386:
                  result = "GL_LIGHT2";
                  break;
                case 16387:
                  result = "GL_LIGHT3";
                  break;
                case 16388:
                  result = "GL_LIGHT4";
                  break;
                case 16389:
                  result = "GL_LIGHT5";
                  break;
                case 16390:
                  result = "GL_LIGHT6";
                  break;
                case 16391:
                  result = "GL_LIGHT7";
                  break;
                default:
                  return 0;
              }
              break;
          }
          break;
      }
    }
    else if (a1 > 8703)
    {
      if (a1 <= 9727)
      {
        if (a1 <= 9216)
        {
          if (a1 > 8959)
          {
            if (a1 == 8960)
              return "GL_TEXTURE_ENV";
            if (a1 == 9216)
              return "GL_EYE_LINEAR";
          }
          else
          {
            if (a1 == 8704)
              return "GL_TEXTURE_ENV_MODE";
            if (a1 == 8705)
              return "GL_TEXTURE_ENV_COLOR";
          }
        }
        else if (a1 <= 9471)
        {
          if (a1 == 9217)
            return "GL_OBJECT_LINEAR";
          if (a1 == 9218)
            return "GL_SPHERE_MAP";
        }
        else
        {
          switch(a1)
          {
            case 9472:
              return "GL_TEXTURE_GEN_MODE";
            case 9473:
              return "GL_OBJECT_PLANE";
            case 9474:
              return "GL_EYE_PLANE";
          }
        }
        return 0;
      }
      if (a1 > 10239)
      {
        switch(a1)
        {
          case 10240:
            result = "GL_TEXTURE_MAG_FILTER";
            break;
          case 10241:
            result = "GL_TEXTURE_MIN_FILTER";
            break;
          case 10242:
            result = "GL_TEXTURE_WRAP_S";
            break;
          case 10243:
            result = "GL_TEXTURE_WRAP_T";
            break;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 9984:
            result = "GL_NEAREST_MIPMAP_NEAREST";
            break;
          case 9985:
            result = "GL_LINEAR_MIPMAP_NEAREST";
            break;
          case 9986:
            result = "GL_NEAREST_MIPMAP_LINEAR";
            break;
          case 9987:
            result = "GL_LINEAR_MIPMAP_LINEAR";
            break;
          default:
            if (a1 == 9728)
            {
              result = "GL_NEAREST";
            }
            else
            {
              if (a1 != 9729)
                return 0;
              result = "GL_LINEAR";
            }
            break;
        }
      }
    }
    else if (a1 <= 7935)
    {
      if (a1 <= 7423)
      {
        switch(a1)
        {
          case 7168:
            return "GL_RENDER";
          case 7169:
            return "GL_FEEDBACK";
          case 7170:
            return "GL_SELECT";
        }
        return 0;
      }
      switch(a1)
      {
        case 7680:
          result = "GL_KEEP";
          break;
        case 7681:
          result = "GL_REPLACE";
          break;
        case 7682:
          result = "GL_INCR";
          break;
        case 7683:
          result = "GL_DECR";
          break;
        default:
          if (a1 == 7424)
          {
            result = "GL_FLAT";
          }
          else
          {
            if (a1 != 7425)
              return 0;
            result = "GL_SMOOTH";
          }
          break;
      }
    }
    else if (a1 < 0x2000)
    {
      switch(a1)
      {
        case 7936:
          result = "GL_VENDOR";
          break;
        case 7937:
          result = "GL_RENDERER";
          break;
        case 7938:
          result = "GL_VERSION";
          break;
        case 7939:
          result = "GL_EXTENSIONS";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 8192:
          result = "GL_S";
          break;
        case 8193:
          result = "GL_T";
          break;
        case 8194:
          result = "GL_R";
          break;
        case 8195:
          result = "GL_Q";
          break;
        default:
          if (a1 == 8448)
          {
            result = "GL_MODULATE";
          }
          else
          {
            if (a1 != 8449)
              return 0;
            result = "GL_DECAL";
          }
          break;
      }
    }
  }
  else if (a1 <= 1023)
  {
    if (a1 <= 255)
    {
      v2 = a1 + 1;
      result = "GL_FALSE";
      switch(v2)
      {
        case 0:
          result = "GL_INVALID_INDEX";
          break;
        case 1:
          return result;
        case 2:
          result = "GL_TRUE";
          break;
        case 3:
          result = "GL_LINE_LOOP";
          break;
        case 4:
          result = "GL_LINE_STRIP";
          break;
        case 5:
          result = "GL_TRIANGLES";
          break;
        case 6:
          result = "GL_TRIANGLE_STRIP";
          break;
        case 7:
          result = "GL_TRIANGLE_FAN";
          break;
        case 8:
          result = "GL_QUADS";
          break;
        case 9:
          result = "GL_QUAD_STRIP";
          break;
        case 10:
          result = "GL_POLYGON";
          break;
        case 11:
          result = "GL_LINES_ADJACENCY";
          break;
        case 12:
          result = "GL_LINE_STRIP_ADJACENCY";
          break;
        case 13:
          result = "GL_TRIANGLES_ADJACENCY";
          break;
        case 14:
          result = "GL_TRIANGLE_STRIP_ADJACENCY";
          break;
        case 15:
          result = "GL_PATCHES";
          break;
        case 17:
          result = "GL_MAP_FLUSH_EXPLICIT_BIT";
          break;
        case 33:
          result = "GL_MAP_UNSYNCHRONIZED_BIT";
          break;
        case 65:
          result = "GL_LIGHTING_BIT";
          break;
        case 129:
          result = "GL_FOG_BIT";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 768:
          result = "GL_SRC_COLOR";
          break;
        case 769:
          result = "GL_ONE_MINUS_SRC_COLOR";
          break;
        case 770:
          result = "GL_SRC_ALPHA";
          break;
        case 771:
          result = "GL_ONE_MINUS_SRC_ALPHA";
          break;
        case 772:
          result = "GL_DST_ALPHA";
          break;
        case 773:
          result = "GL_ONE_MINUS_DST_ALPHA";
          break;
        case 774:
          result = "GL_DST_COLOR";
          break;
        case 775:
          result = "GL_ONE_MINUS_DST_COLOR";
          break;
        case 776:
          result = "GL_SRC_ALPHA_SATURATE";
          break;
        default:
          switch(a1)
          {
            case 512:
              result = "GL_NEVER";
              break;
            case 513:
              result = "GL_LESS";
              break;
            case 514:
              result = "GL_EQUAL";
              break;
            case 515:
              result = "GL_LEQUAL";
              break;
            case 516:
              result = "GL_GREATER";
              break;
            case 517:
              result = "GL_NOTEQUAL";
              break;
            case 518:
              result = "GL_GEQUAL";
              break;
            case 519:
              result = "GL_ALWAYS";
              break;
            default:
              switch(a1)
              {
                case 256:
                  result = "GL_ACCUM";
                  break;
                case 257:
                  result = "GL_LOAD";
                  break;
                case 258:
                  result = "GL_RETURN";
                  break;
                case 259:
                  result = "GL_MULT";
                  break;
                case 260:
                  result = "GL_ADD";
                  break;
                default:
                  return 0;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        result = "GL_INVALID_ENUM";
        break;
      case 1281:
        result = "GL_INVALID_VALUE";
        break;
      case 1282:
        result = "GL_INVALID_OPERATION";
        break;
      case 1283:
        result = "GL_STACK_OVERFLOW";
        break;
      case 1284:
        result = "GL_STACK_UNDERFLOW";
        break;
      case 1285:
        result = "GL_OUT_OF_MEMORY";
        break;
      case 1286:
        result = "GL_INVALID_FRAMEBUFFER_OPERATION";
        break;
      case 1287:
      case 1288:
      case 1289:
      case 1290:
      case 1291:
      case 1292:
      case 1293:
      case 1294:
      case 1295:
      case 1296:
      case 1297:
      case 1298:
      case 1299:
      case 1300:
      case 1301:
      case 1302:
      case 1303:
      case 1304:
      case 1305:
      case 1306:
      case 1307:
      case 1308:
      case 1309:
      case 1310:
      case 1311:
      case 1312:
      case 1313:
      case 1314:
      case 1315:
      case 1316:
      case 1317:
      case 1318:
      case 1319:
      case 1320:
      case 1321:
      case 1322:
      case 1323:
      case 1324:
      case 1325:
      case 1326:
      case 1327:
      case 1328:
      case 1329:
      case 1330:
      case 1331:
      case 1332:
      case 1333:
      case 1334:
      case 1335:
      case 1336:
      case 1337:
      case 1338:
      case 1339:
      case 1340:
      case 1341:
      case 1342:
      case 1343:
      case 1344:
      case 1345:
      case 1346:
      case 1347:
      case 1348:
      case 1349:
      case 1350:
      case 1351:
      case 1352:
      case 1353:
      case 1354:
      case 1355:
      case 1356:
      case 1357:
      case 1358:
      case 1359:
      case 1360:
      case 1361:
      case 1362:
      case 1363:
      case 1364:
      case 1365:
      case 1366:
      case 1367:
      case 1368:
      case 1369:
      case 1370:
      case 1371:
      case 1372:
      case 1373:
      case 1374:
      case 1375:
      case 1376:
      case 1377:
      case 1378:
      case 1379:
      case 1380:
      case 1381:
      case 1382:
      case 1383:
      case 1384:
      case 1385:
      case 1386:
      case 1387:
      case 1388:
      case 1389:
      case 1390:
      case 1391:
      case 1392:
      case 1393:
      case 1394:
      case 1395:
      case 1396:
      case 1397:
      case 1398:
      case 1399:
      case 1400:
      case 1401:
      case 1402:
      case 1403:
      case 1404:
      case 1405:
      case 1406:
      case 1407:
      case 1408:
      case 1409:
      case 1410:
      case 1411:
      case 1412:
      case 1413:
      case 1414:
      case 1415:
      case 1416:
      case 1417:
      case 1418:
      case 1419:
      case 1420:
      case 1421:
      case 1422:
      case 1423:
      case 1424:
      case 1425:
      case 1426:
      case 1427:
      case 1428:
      case 1429:
      case 1430:
      case 1431:
      case 1432:
      case 1433:
      case 1434:
      case 1435:
      case 1436:
      case 1437:
      case 1438:
      case 1439:
      case 1440:
      case 1441:
      case 1442:
      case 1443:
      case 1444:
      case 1445:
      case 1446:
      case 1447:
      case 1448:
      case 1449:
      case 1450:
      case 1451:
      case 1452:
      case 1453:
      case 1454:
      case 1455:
      case 1456:
      case 1457:
      case 1458:
      case 1459:
      case 1460:
      case 1461:
      case 1462:
      case 1463:
      case 1464:
      case 1465:
      case 1466:
      case 1467:
      case 1468:
      case 1469:
      case 1470:
      case 1471:
      case 1472:
      case 1473:
      case 1474:
      case 1475:
      case 1476:
      case 1477:
      case 1478:
      case 1479:
      case 1480:
      case 1481:
      case 1482:
      case 1483:
      case 1484:
      case 1485:
      case 1486:
      case 1487:
      case 1488:
      case 1489:
      case 1490:
      case 1491:
      case 1492:
      case 1493:
      case 1494:
      case 1495:
      case 1496:
      case 1497:
      case 1498:
      case 1499:
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1504:
      case 1505:
      case 1506:
      case 1507:
      case 1508:
      case 1509:
      case 1510:
      case 1511:
      case 1512:
      case 1513:
      case 1514:
      case 1515:
      case 1516:
      case 1517:
      case 1518:
      case 1519:
      case 1520:
      case 1521:
      case 1522:
      case 1523:
      case 1524:
      case 1525:
      case 1526:
      case 1527:
      case 1528:
      case 1529:
      case 1530:
      case 1531:
      case 1532:
      case 1533:
      case 1534:
      case 1535:
      case 1541:
      case 1542:
      case 1543:
      case 1544:
      case 1545:
      case 1546:
      case 1547:
      case 1548:
      case 1549:
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1633:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1638:
      case 1639:
      case 1640:
      case 1641:
      case 1642:
      case 1643:
      case 1644:
      case 1645:
      case 1646:
      case 1647:
      case 1648:
      case 1649:
      case 1650:
      case 1651:
      case 1652:
      case 1653:
      case 1654:
      case 1655:
      case 1656:
      case 1657:
      case 1658:
      case 1659:
      case 1660:
      case 1661:
      case 1662:
      case 1663:
      case 1664:
      case 1665:
      case 1666:
      case 1667:
      case 1668:
      case 1669:
      case 1670:
      case 1671:
      case 1672:
      case 1673:
      case 1674:
      case 1675:
      case 1676:
      case 1677:
      case 1678:
      case 1679:
      case 1680:
      case 1681:
      case 1682:
      case 1683:
      case 1684:
      case 1685:
      case 1686:
      case 1687:
      case 1688:
      case 1689:
      case 1690:
      case 1691:
      case 1692:
      case 1693:
      case 1694:
      case 1695:
      case 1696:
      case 1697:
      case 1698:
      case 1699:
      case 1700:
      case 1701:
      case 1702:
      case 1703:
      case 1704:
      case 1705:
      case 1706:
      case 1707:
      case 1708:
      case 1709:
      case 1710:
      case 1711:
      case 1712:
      case 1713:
      case 1714:
      case 1715:
      case 1716:
      case 1717:
      case 1718:
      case 1719:
      case 1720:
      case 1721:
      case 1722:
      case 1723:
      case 1724:
      case 1725:
      case 1726:
      case 1727:
      case 1728:
      case 1729:
      case 1730:
      case 1731:
      case 1732:
      case 1733:
      case 1734:
      case 1735:
      case 1736:
      case 1737:
      case 1738:
      case 1739:
      case 1740:
      case 1741:
      case 1742:
      case 1743:
      case 1744:
      case 1745:
      case 1746:
      case 1747:
      case 1748:
      case 1749:
      case 1750:
      case 1751:
      case 1752:
      case 1753:
      case 1754:
      case 1755:
      case 1756:
      case 1757:
      case 1758:
      case 1759:
      case 1760:
      case 1761:
      case 1762:
      case 1763:
      case 1764:
      case 1765:
      case 1766:
      case 1767:
      case 1768:
      case 1769:
      case 1770:
      case 1771:
      case 1772:
      case 1773:
      case 1774:
      case 1775:
      case 1776:
      case 1777:
      case 1778:
      case 1779:
      case 1780:
      case 1781:
      case 1782:
      case 1783:
      case 1784:
      case 1785:
      case 1786:
      case 1787:
      case 1788:
      case 1789:
      case 1790:
      case 1791:
      case 1800:
      case 1801:
      case 1802:
      case 1803:
      case 1804:
      case 1805:
      case 1806:
      case 1807:
      case 1808:
      case 1809:
      case 1810:
      case 1811:
      case 1812:
      case 1813:
      case 1814:
      case 1815:
      case 1816:
      case 1817:
      case 1818:
      case 1819:
      case 1820:
      case 1821:
      case 1822:
      case 1823:
      case 1824:
      case 1825:
      case 1826:
      case 1827:
      case 1828:
      case 1829:
      case 1830:
      case 1831:
      case 1832:
      case 1833:
      case 1834:
      case 1835:
      case 1836:
      case 1837:
      case 1838:
      case 1839:
      case 1840:
      case 1841:
      case 1842:
      case 1843:
      case 1844:
      case 1845:
      case 1846:
      case 1847:
      case 1848:
      case 1849:
      case 1850:
      case 1851:
      case 1852:
      case 1853:
      case 1854:
      case 1855:
      case 1856:
      case 1857:
      case 1858:
      case 1859:
      case 1860:
      case 1861:
      case 1862:
      case 1863:
      case 1864:
      case 1865:
      case 1866:
      case 1867:
      case 1868:
      case 1869:
      case 1870:
      case 1871:
      case 1872:
      case 1873:
      case 1874:
      case 1875:
      case 1876:
      case 1877:
      case 1878:
      case 1879:
      case 1880:
      case 1881:
      case 1882:
      case 1883:
      case 1884:
      case 1885:
      case 1886:
      case 1887:
      case 1888:
      case 1889:
      case 1890:
      case 1891:
      case 1892:
      case 1893:
      case 1894:
      case 1895:
      case 1896:
      case 1897:
      case 1898:
      case 1899:
      case 1900:
      case 1901:
      case 1902:
      case 1903:
      case 1904:
      case 1905:
      case 1906:
      case 1907:
      case 1908:
      case 1909:
      case 1910:
      case 1911:
      case 1912:
      case 1913:
      case 1914:
      case 1915:
      case 1916:
      case 1917:
      case 1918:
      case 1919:
      case 1920:
      case 1921:
      case 1922:
      case 1923:
      case 1924:
      case 1925:
      case 1926:
      case 1927:
      case 1928:
      case 1929:
      case 1930:
      case 1931:
      case 1932:
      case 1933:
      case 1934:
      case 1935:
      case 1936:
      case 1937:
      case 1938:
      case 1939:
      case 1940:
      case 1941:
      case 1942:
      case 1943:
      case 1944:
      case 1945:
      case 1946:
      case 1947:
      case 1948:
      case 1949:
      case 1950:
      case 1951:
      case 1952:
      case 1953:
      case 1954:
      case 1955:
      case 1956:
      case 1957:
      case 1958:
      case 1959:
      case 1960:
      case 1961:
      case 1962:
      case 1963:
      case 1964:
      case 1965:
      case 1966:
      case 1967:
      case 1968:
      case 1969:
      case 1970:
      case 1971:
      case 1972:
      case 1973:
      case 1974:
      case 1975:
      case 1976:
      case 1977:
      case 1978:
      case 1979:
      case 1980:
      case 1981:
      case 1982:
      case 1983:
      case 1984:
      case 1985:
      case 1986:
      case 1987:
      case 1988:
      case 1989:
      case 1990:
      case 1991:
      case 1992:
      case 1993:
      case 1994:
      case 1995:
      case 1996:
      case 1997:
      case 1998:
      case 1999:
      case 2000:
      case 2001:
      case 2002:
      case 2003:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2008:
      case 2009:
      case 2010:
      case 2011:
      case 2012:
      case 2013:
      case 2014:
      case 2015:
      case 2016:
      case 2017:
      case 2018:
      case 2019:
      case 2020:
      case 2021:
      case 2022:
      case 2023:
      case 2024:
      case 2025:
      case 2026:
      case 2027:
      case 2028:
      case 2029:
      case 2030:
      case 2031:
      case 2032:
      case 2033:
      case 2034:
      case 2035:
      case 2036:
      case 2037:
      case 2038:
      case 2039:
      case 2040:
      case 2041:
      case 2042:
      case 2043:
      case 2044:
      case 2045:
      case 2046:
      case 2047:
      case 2050:
      case 2051:
      case 2052:
      case 2053:
      case 2054:
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2059:
      case 2060:
      case 2061:
      case 2062:
      case 2063:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2069:
      case 2070:
      case 2071:
      case 2072:
      case 2073:
      case 2074:
      case 2075:
      case 2076:
      case 2077:
      case 2078:
      case 2079:
      case 2080:
      case 2081:
      case 2082:
      case 2083:
      case 2084:
      case 2085:
      case 2086:
      case 2087:
      case 2088:
      case 2089:
      case 2090:
      case 2091:
      case 2092:
      case 2093:
      case 2094:
      case 2095:
      case 2096:
      case 2097:
      case 2098:
      case 2099:
      case 2100:
      case 2101:
      case 2102:
      case 2103:
      case 2104:
      case 2105:
      case 2106:
      case 2107:
      case 2108:
      case 2109:
      case 2110:
      case 2111:
      case 2112:
      case 2113:
      case 2114:
      case 2115:
      case 2116:
      case 2117:
      case 2118:
      case 2119:
      case 2120:
      case 2121:
      case 2122:
      case 2123:
      case 2124:
      case 2125:
      case 2126:
      case 2127:
      case 2128:
      case 2129:
      case 2130:
      case 2131:
      case 2132:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2140:
      case 2141:
      case 2142:
      case 2143:
      case 2144:
      case 2145:
      case 2146:
      case 2147:
      case 2148:
      case 2149:
      case 2150:
      case 2151:
      case 2152:
      case 2153:
      case 2154:
      case 2155:
      case 2156:
      case 2157:
      case 2158:
      case 2159:
      case 2160:
      case 2161:
      case 2162:
      case 2163:
      case 2164:
      case 2165:
      case 2166:
      case 2167:
      case 2168:
      case 2169:
      case 2170:
      case 2171:
      case 2172:
      case 2173:
      case 2174:
      case 2175:
      case 2176:
      case 2177:
      case 2178:
      case 2179:
      case 2180:
      case 2181:
      case 2182:
      case 2183:
      case 2184:
      case 2185:
      case 2186:
      case 2187:
      case 2188:
      case 2189:
      case 2190:
      case 2191:
      case 2192:
      case 2193:
      case 2194:
      case 2195:
      case 2196:
      case 2197:
      case 2198:
      case 2199:
      case 2200:
      case 2201:
      case 2202:
      case 2203:
      case 2204:
      case 2205:
      case 2206:
      case 2207:
      case 2208:
      case 2209:
      case 2210:
      case 2211:
      case 2212:
      case 2213:
      case 2214:
      case 2215:
      case 2216:
      case 2217:
      case 2218:
      case 2219:
      case 2220:
      case 2221:
      case 2222:
      case 2223:
      case 2224:
      case 2225:
      case 2226:
      case 2227:
      case 2228:
      case 2229:
      case 2230:
      case 2231:
      case 2232:
      case 2233:
      case 2234:
      case 2235:
      case 2236:
      case 2237:
      case 2238:
      case 2239:
      case 2240:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2301:
      case 2302:
      case 2303:
      case 2306:
      case 2307:
      case 2308:
      case 2309:
      case 2310:
      case 2311:
      case 2312:
      case 2313:
      case 2314:
      case 2315:
      case 2316:
      case 2317:
      case 2318:
      case 2319:
      case 2320:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2400:
      case 2401:
      case 2402:
      case 2403:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2500:
      case 2501:
      case 2502:
      case 2503:
      case 2504:
      case 2505:
      case 2506:
      case 2507:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
      case 2600:
      case 2601:
      case 2602:
      case 2603:
      case 2604:
      case 2605:
      case 2606:
      case 2607:
      case 2608:
      case 2609:
      case 2610:
      case 2611:
      case 2612:
      case 2613:
      case 2614:
      case 2615:
      case 2616:
      case 2617:
      case 2618:
      case 2619:
      case 2620:
      case 2621:
      case 2622:
      case 2623:
      case 2624:
      case 2625:
      case 2626:
      case 2627:
      case 2628:
      case 2629:
      case 2630:
      case 2631:
      case 2632:
      case 2633:
      case 2634:
      case 2635:
      case 2636:
      case 2637:
      case 2638:
      case 2639:
      case 2640:
      case 2641:
      case 2642:
      case 2643:
      case 2644:
      case 2645:
      case 2646:
      case 2647:
      case 2648:
      case 2649:
      case 2650:
      case 2651:
      case 2652:
      case 2653:
      case 2654:
      case 2655:
      case 2656:
      case 2657:
      case 2658:
      case 2659:
      case 2660:
      case 2661:
      case 2662:
      case 2663:
      case 2664:
      case 2665:
      case 2666:
      case 2667:
      case 2668:
      case 2669:
      case 2670:
      case 2671:
      case 2672:
      case 2673:
      case 2674:
      case 2675:
      case 2676:
      case 2677:
      case 2678:
      case 2679:
      case 2680:
      case 2681:
      case 2682:
      case 2683:
      case 2684:
      case 2685:
      case 2686:
      case 2687:
      case 2688:
      case 2689:
      case 2690:
      case 2691:
      case 2692:
      case 2693:
      case 2694:
      case 2695:
      case 2696:
      case 2697:
      case 2698:
      case 2699:
      case 2700:
      case 2701:
      case 2702:
      case 2703:
      case 2704:
      case 2705:
      case 2706:
      case 2707:
      case 2708:
      case 2709:
      case 2710:
      case 2711:
      case 2712:
      case 2713:
      case 2714:
      case 2715:
      case 2716:
      case 2717:
      case 2718:
      case 2719:
      case 2720:
      case 2721:
      case 2722:
      case 2723:
      case 2724:
      case 2725:
      case 2726:
      case 2727:
      case 2728:
      case 2729:
      case 2730:
      case 2731:
      case 2732:
      case 2733:
      case 2734:
      case 2735:
      case 2736:
      case 2737:
      case 2738:
      case 2739:
      case 2740:
      case 2741:
      case 2742:
      case 2743:
      case 2744:
      case 2745:
      case 2746:
      case 2747:
      case 2748:
      case 2749:
      case 2750:
      case 2751:
      case 2752:
      case 2753:
      case 2754:
      case 2755:
      case 2756:
      case 2757:
      case 2758:
      case 2759:
      case 2760:
      case 2761:
      case 2762:
      case 2763:
      case 2764:
      case 2765:
      case 2766:
      case 2767:
      case 2768:
      case 2769:
      case 2770:
      case 2771:
      case 2772:
      case 2773:
      case 2774:
      case 2775:
      case 2776:
      case 2777:
      case 2778:
      case 2779:
      case 2780:
      case 2781:
      case 2782:
      case 2783:
      case 2784:
      case 2785:
      case 2786:
      case 2787:
      case 2788:
      case 2789:
      case 2790:
      case 2791:
      case 2792:
      case 2793:
      case 2794:
      case 2795:
      case 2796:
      case 2797:
      case 2798:
      case 2799:
      case 2800:
      case 2801:
      case 2802:
      case 2803:
      case 2804:
      case 2805:
      case 2806:
      case 2807:
      case 2808:
      case 2809:
      case 2810:
      case 2811:
      case 2812:
      case 2813:
      case 2814:
      case 2815:
      case 2826:
      case 2827:
      case 2828:
      case 2829:
      case 2830:
      case 2831:
      case 2836:
      case 2837:
      case 2838:
      case 2839:
      case 2840:
      case 2841:
      case 2842:
      case 2843:
      case 2844:
      case 2845:
      case 2846:
      case 2847:
      case 2855:
      case 2856:
      case 2857:
      case 2858:
      case 2859:
      case 2860:
      case 2861:
      case 2862:
      case 2863:
      case 2868:
      case 2869:
      case 2870:
      case 2871:
      case 2872:
      case 2873:
      case 2874:
      case 2875:
      case 2876:
      case 2877:
      case 2878:
      case 2879:
      case 2887:
      case 2888:
      case 2889:
      case 2890:
      case 2891:
      case 2892:
      case 2893:
      case 2894:
      case 2895:
      case 2904:
      case 2905:
      case 2906:
      case 2907:
      case 2908:
      case 2909:
      case 2910:
      case 2911:
      case 2919:
      case 2920:
      case 2921:
      case 2922:
      case 2923:
      case 2924:
      case 2925:
      case 2926:
      case 2927:
      case 2933:
      case 2934:
      case 2935:
      case 2936:
      case 2937:
      case 2938:
      case 2939:
      case 2940:
      case 2941:
      case 2942:
      case 2943:
      case 2945:
      case 2946:
      case 2947:
      case 2948:
      case 2949:
      case 2950:
      case 2951:
      case 2952:
      case 2953:
      case 2954:
      case 2955:
      case 2956:
      case 2957:
      case 2958:
      case 2959:
      case 2969:
      case 2970:
      case 2971:
      case 2972:
      case 2973:
      case 2974:
      case 2975:
      case 2985:
      case 2986:
      case 2987:
      case 2988:
      case 2989:
      case 2990:
      case 2991:
      case 2994:
      case 2995:
      case 2996:
      case 2997:
      case 2998:
      case 2999:
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
      case 3016:
      case 3017:
      case 3018:
      case 3019:
      case 3020:
      case 3021:
      case 3022:
      case 3023:
      case 3025:
      case 3026:
      case 3027:
      case 3028:
      case 3029:
      case 3030:
      case 3031:
      case 3032:
      case 3033:
      case 3034:
      case 3035:
      case 3036:
      case 3037:
      case 3038:
      case 3039:
      case 3043:
      case 3044:
      case 3045:
      case 3046:
      case 3047:
      case 3048:
      case 3049:
      case 3050:
      case 3051:
      case 3052:
      case 3053:
      case 3054:
      case 3055:
      case 3059:
      case 3060:
      case 3061:
      case 3062:
      case 3063:
      case 3064:
      case 3065:
      case 3066:
      case 3067:
      case 3068:
      case 3069:
      case 3070:
      case 3071:
      case 3075:
      case 3076:
      case 3077:
      case 3078:
      case 3079:
      case 3080:
      case 3081:
      case 3082:
      case 3083:
      case 3084:
      case 3085:
      case 3086:
      case 3087:
      case 3090:
      case 3091:
      case 3092:
      case 3093:
      case 3094:
      case 3095:
      case 3096:
      case 3097:
      case 3098:
      case 3099:
      case 3100:
      case 3101:
      case 3102:
      case 3103:
      case 3108:
      case 3109:
      case 3110:
      case 3111:
      case 3112:
      case 3113:
      case 3114:
      case 3115:
      case 3116:
      case 3117:
      case 3118:
      case 3119:
      case 3124:
      case 3125:
      case 3126:
      case 3127:
      case 3128:
      case 3129:
      case 3130:
      case 3131:
      case 3132:
      case 3133:
      case 3134:
      case 3135:
      case 3137:
      case 3138:
      case 3139:
      case 3140:
      case 3141:
      case 3142:
      case 3143:
      case 3144:
      case 3145:
      case 3146:
      case 3147:
      case 3148:
      case 3149:
      case 3150:
      case 3151:
      case 3157:
      case 3158:
      case 3159:
      case 3160:
      case 3161:
      case 3162:
      case 3163:
      case 3164:
      case 3165:
      case 3166:
      case 3167:
      case 3172:
      case 3173:
      case 3174:
      case 3175:
      case 3176:
      case 3177:
      case 3178:
      case 3179:
      case 3180:
      case 3181:
      case 3182:
      case 3183:
      case 3194:
      case 3195:
      case 3196:
      case 3197:
      case 3198:
      case 3199:
      case 3200:
      case 3201:
      case 3202:
      case 3203:
      case 3204:
      case 3205:
      case 3206:
      case 3207:
      case 3208:
      case 3209:
      case 3210:
      case 3211:
      case 3212:
      case 3213:
      case 3214:
      case 3215:
      case 3216:
      case 3217:
      case 3218:
      case 3219:
      case 3220:
      case 3221:
      case 3222:
      case 3223:
      case 3224:
      case 3225:
      case 3226:
      case 3227:
      case 3228:
      case 3229:
      case 3230:
      case 3231:
      case 3232:
      case 3233:
      case 3234:
      case 3235:
      case 3236:
      case 3237:
      case 3238:
      case 3239:
      case 3240:
      case 3241:
      case 3242:
      case 3243:
      case 3244:
      case 3245:
      case 3246:
      case 3247:
      case 3258:
      case 3259:
      case 3260:
      case 3261:
      case 3262:
      case 3263:
      case 3264:
      case 3265:
      case 3266:
      case 3267:
      case 3268:
      case 3269:
      case 3270:
      case 3271:
      case 3272:
      case 3273:
      case 3274:
      case 3275:
      case 3276:
      case 3277:
      case 3278:
      case 3279:
      case 3280:
      case 3281:
      case 3282:
      case 3283:
      case 3284:
      case 3285:
      case 3286:
      case 3287:
      case 3288:
      case 3289:
      case 3290:
      case 3291:
      case 3292:
      case 3293:
      case 3294:
      case 3295:
      case 3296:
      case 3297:
      case 3298:
      case 3299:
      case 3300:
      case 3301:
      case 3302:
      case 3303:
      case 3304:
      case 3305:
      case 3306:
      case 3307:
      case 3308:
      case 3309:
      case 3310:
      case 3311:
      case 3318:
      case 3319:
      case 3320:
      case 3321:
      case 3322:
      case 3323:
      case 3324:
      case 3325:
      case 3326:
      case 3327:
      case 3334:
      case 3335:
      case 3336:
      case 3337:
      case 3338:
      case 3339:
      case 3340:
      case 3341:
      case 3342:
      case 3343:
      case 3360:
      case 3361:
      case 3362:
      case 3363:
      case 3364:
      case 3365:
      case 3366:
      case 3367:
      case 3368:
      case 3369:
      case 3370:
      case 3371:
      case 3372:
      case 3373:
      case 3374:
      case 3375:
      case 3388:
      case 3389:
      case 3390:
      case 3391:
      case 3392:
      case 3393:
      case 3394:
      case 3395:
      case 3396:
      case 3397:
      case 3398:
      case 3399:
      case 3400:
      case 3401:
      case 3402:
      case 3403:
      case 3404:
      case 3405:
      case 3406:
      case 3407:
      case 3420:
      case 3421:
      case 3422:
      case 3423:
      case 3424:
      case 3425:
      case 3426:
      case 3427:
      case 3428:
      case 3429:
      case 3430:
      case 3431:
      case 3432:
      case 3433:
      case 3434:
      case 3435:
      case 3436:
      case 3437:
      case 3438:
      case 3439:
      case 3441:
      case 3442:
      case 3443:
      case 3444:
      case 3445:
      case 3446:
      case 3447:
      case 3448:
      case 3449:
      case 3450:
      case 3451:
      case 3452:
      case 3453:
      case 3454:
      case 3455:
      case 3457:
      case 3458:
      case 3459:
      case 3460:
      case 3461:
      case 3462:
      case 3463:
      case 3464:
      case 3465:
      case 3466:
      case 3467:
      case 3468:
      case 3469:
      case 3470:
      case 3471:
      case 3481:
      case 3482:
      case 3483:
      case 3484:
      case 3485:
      case 3486:
      case 3487:
      case 3488:
      case 3489:
      case 3490:
      case 3491:
      case 3492:
      case 3493:
      case 3494:
      case 3495:
      case 3496:
      case 3497:
      case 3498:
      case 3499:
      case 3500:
      case 3501:
      case 3502:
      case 3503:
      case 3513:
      case 3514:
      case 3515:
      case 3516:
      case 3517:
      case 3518:
      case 3519:
      case 3520:
      case 3521:
      case 3522:
      case 3523:
      case 3524:
      case 3525:
      case 3526:
      case 3527:
      case 3528:
      case 3529:
      case 3530:
      case 3531:
      case 3532:
      case 3533:
      case 3534:
      case 3535:
      case 3540:
      case 3541:
      case 3542:
      case 3543:
      case 3544:
      case 3545:
      case 3546:
      case 3547:
      case 3548:
      case 3549:
      case 3550:
      case 3551:
      case 3554:
      case 3555:
      case 3556:
      case 3557:
      case 3558:
      case 3559:
      case 3560:
      case 3561:
      case 3562:
      case 3563:
      case 3564:
      case 3565:
      case 3566:
      case 3567:
        return 0;
      case 1536:
        result = "GL_2D";
        break;
      case 1537:
        result = "GL_3D";
        break;
      case 1538:
        result = "GL_3D_COLOR";
        break;
      case 1539:
        result = "GL_3D_COLOR_TEXTURE";
        break;
      case 1540:
        result = "GL_4D_COLOR_TEXTURE";
        break;
      case 1792:
        result = "GL_PASS_THROUGH_TOKEN";
        break;
      case 1793:
        result = "GL_POINT_TOKEN";
        break;
      case 1794:
        result = "GL_LINE_TOKEN";
        break;
      case 1795:
        result = "GL_POLYGON_TOKEN";
        break;
      case 1796:
        result = "GL_BITMAP_TOKEN";
        break;
      case 1797:
        result = "GL_DRAW_PIXEL_TOKEN";
        break;
      case 1798:
        result = "GL_COPY_PIXEL_TOKEN";
        break;
      case 1799:
        result = "GL_LINE_RESET_TOKEN";
        break;
      case 2048:
        result = "GL_EXP";
        break;
      case 2049:
        result = "GL_EXP2";
        break;
      case 2304:
        result = "GL_CW";
        break;
      case 2305:
        result = "GL_CCW";
        break;
      case 2560:
        result = "GL_COEFF";
        break;
      case 2561:
        result = "GL_ORDER";
        break;
      case 2562:
        result = "GL_DOMAIN";
        break;
      case 2816:
        result = "GL_CURRENT_COLOR";
        break;
      case 2817:
        result = "GL_CURRENT_INDEX";
        break;
      case 2818:
        result = "GL_CURRENT_NORMAL";
        break;
      case 2819:
        result = "GL_CURRENT_TEXTURE_COORDS";
        break;
      case 2820:
        result = "GL_CURRENT_RASTER_COLOR";
        break;
      case 2821:
        result = "GL_CURRENT_RASTER_INDEX";
        break;
      case 2822:
        result = "GL_CURRENT_RASTER_TEXTURE_COORDS";
        break;
      case 2823:
        result = "GL_CURRENT_RASTER_POSITION";
        break;
      case 2824:
        result = "GL_CURRENT_RASTER_POSITION_VALID";
        break;
      case 2825:
        result = "GL_CURRENT_RASTER_DISTANCE";
        break;
      case 2832:
        result = "GL_POINT_SMOOTH";
        break;
      case 2833:
        result = "GL_POINT_SIZE";
        break;
      case 2834:
        result = "GL_POINT_SIZE_RANGE";
        break;
      case 2835:
        result = "GL_POINT_SIZE_GRANULARITY";
        break;
      case 2848:
        result = "GL_LINE_SMOOTH";
        break;
      case 2849:
        result = "GL_LINE_WIDTH";
        break;
      case 2850:
        result = "GL_SMOOTH_LINE_WIDTH_RANGE";
        break;
      case 2851:
        result = "GL_SMOOTH_LINE_WIDTH_GRANULARITY";
        break;
      case 2852:
        result = "GL_LINE_STIPPLE";
        break;
      case 2853:
        result = "GL_LINE_STIPPLE_PATTERN";
        break;
      case 2854:
        result = "GL_LINE_STIPPLE_REPEAT";
        break;
      case 2864:
        result = "GL_LIST_MODE";
        break;
      case 2865:
        result = "GL_MAX_LIST_NESTING";
        break;
      case 2866:
        result = "GL_LIST_BASE";
        break;
      case 2867:
        result = "GL_LIST_INDEX";
        break;
      case 2880:
        result = "GL_POLYGON_MODE";
        break;
      case 2881:
        result = "GL_POLYGON_SMOOTH";
        break;
      case 2882:
        result = "GL_POLYGON_STIPPLE";
        break;
      case 2883:
        result = "GL_EDGE_FLAG";
        break;
      case 2884:
        result = "GL_CULL_FACE";
        break;
      case 2885:
        result = "GL_CULL_FACE_MODE";
        break;
      case 2886:
        result = "GL_FRONT_FACE";
        break;
      case 2896:
        result = "GL_LIGHTING";
        break;
      case 2897:
        result = "GL_LIGHT_MODEL_LOCAL_VIEWER";
        break;
      case 2898:
        result = "GL_LIGHT_MODEL_TWO_SIDE";
        break;
      case 2899:
        result = "GL_LIGHT_MODEL_AMBIENT";
        break;
      case 2900:
        result = "GL_SHADE_MODEL";
        break;
      case 2901:
        result = "GL_COLOR_MATERIAL_FACE";
        break;
      case 2902:
        result = "GL_COLOR_MATERIAL_PARAMETER";
        break;
      case 2903:
        result = "GL_COLOR_MATERIAL";
        break;
      case 2912:
        result = "GL_FOG";
        break;
      case 2913:
        result = "GL_FOG_INDEX";
        break;
      case 2914:
        result = "GL_FOG_DENSITY";
        break;
      case 2915:
        result = "GL_FOG_START";
        break;
      case 2916:
        result = "GL_FOG_END";
        break;
      case 2917:
        result = "GL_FOG_MODE";
        break;
      case 2918:
        result = "GL_FOG_COLOR";
        break;
      case 2928:
        result = "GL_DEPTH_RANGE";
        break;
      case 2929:
        result = "GL_DEPTH_TEST";
        break;
      case 2930:
        result = "GL_DEPTH_WRITEMASK";
        break;
      case 2931:
        result = "GL_DEPTH_CLEAR_VALUE";
        break;
      case 2932:
        result = "GL_DEPTH_FUNC";
        break;
      case 2944:
        result = "GL_ACCUM_CLEAR_VALUE";
        break;
      case 2960:
        result = "GL_STENCIL_TEST";
        break;
      case 2961:
        result = "GL_STENCIL_CLEAR_VALUE";
        break;
      case 2962:
        result = "GL_STENCIL_FUNC";
        break;
      case 2963:
        result = "GL_STENCIL_VALUE_MASK";
        break;
      case 2964:
        result = "GL_STENCIL_FAIL";
        break;
      case 2965:
        result = "GL_STENCIL_PASS_DEPTH_FAIL";
        break;
      case 2966:
        result = "GL_STENCIL_PASS_DEPTH_PASS";
        break;
      case 2967:
        result = "GL_STENCIL_REF";
        break;
      case 2968:
        result = "GL_STENCIL_WRITEMASK";
        break;
      case 2976:
        result = "GL_MATRIX_MODE";
        break;
      case 2977:
        result = "GL_NORMALIZE";
        break;
      case 2978:
        result = "GL_VIEWPORT";
        break;
      case 2979:
        result = "GL_MODELVIEW_STACK_DEPTH";
        break;
      case 2980:
        result = "GL_PROJECTION_STACK_DEPTH";
        break;
      case 2981:
        result = "GL_TEXTURE_STACK_DEPTH";
        break;
      case 2982:
        result = "GL_MODELVIEW_MATRIX";
        break;
      case 2983:
        result = "GL_PROJECTION_MATRIX";
        break;
      case 2984:
        result = "GL_TEXTURE_MATRIX";
        break;
      case 2992:
        result = "GL_ATTRIB_STACK_DEPTH";
        break;
      case 2993:
        result = "GL_CLIENT_ATTRIB_STACK_DEPTH";
        break;
      case 3008:
        result = "GL_ALPHA_TEST";
        break;
      case 3009:
        result = "GL_ALPHA_TEST_FUNC";
        break;
      case 3010:
        result = "GL_ALPHA_TEST_REF";
        break;
      case 3024:
        result = "GL_DITHER";
        break;
      case 3040:
        result = "GL_BLEND_DST";
        break;
      case 3041:
        result = "GL_BLEND_SRC";
        break;
      case 3042:
        result = "GL_BLEND";
        break;
      case 3056:
        result = "GL_LOGIC_OP_MODE";
        break;
      case 3057:
        result = "GL_INDEX_LOGIC_OP";
        break;
      case 3058:
        result = "GL_COLOR_LOGIC_OP";
        break;
      case 3072:
        result = "GL_AUX_BUFFERS";
        break;
      case 3073:
        result = "GL_DRAW_BUFFER";
        break;
      case 3074:
        result = "GL_READ_BUFFER";
        break;
      case 3088:
        result = "GL_SCISSOR_BOX";
        break;
      case 3089:
        result = "GL_SCISSOR_TEST";
        break;
      case 3104:
        result = "GL_INDEX_CLEAR_VALUE";
        break;
      case 3105:
        result = "GL_INDEX_WRITEMASK";
        break;
      case 3106:
        result = "GL_COLOR_CLEAR_VALUE";
        break;
      case 3107:
        result = "GL_COLOR_WRITEMASK";
        break;
      case 3120:
        result = "GL_INDEX_MODE";
        break;
      case 3121:
        result = "GL_RGBA_MODE";
        break;
      case 3122:
        result = "GL_DOUBLEBUFFER";
        break;
      case 3123:
        result = "GL_STEREO";
        break;
      case 3136:
        result = "GL_RENDER_MODE";
        break;
      case 3152:
        result = "GL_PERSPECTIVE_CORRECTION_HINT";
        break;
      case 3153:
        result = "GL_POINT_SMOOTH_HINT";
        break;
      case 3154:
        result = "GL_LINE_SMOOTH_HINT";
        break;
      case 3155:
        result = "GL_POLYGON_SMOOTH_HINT";
        break;
      case 3156:
        result = "GL_FOG_HINT";
        break;
      case 3168:
        result = "GL_TEXTURE_GEN_S";
        break;
      case 3169:
        result = "GL_TEXTURE_GEN_T";
        break;
      case 3170:
        result = "GL_TEXTURE_GEN_R";
        break;
      case 3171:
        result = "GL_TEXTURE_GEN_Q";
        break;
      case 3184:
        result = "GL_PIXEL_MAP_I_TO_I";
        break;
      case 3185:
        result = "GL_PIXEL_MAP_S_TO_S";
        break;
      case 3186:
        result = "GL_PIXEL_MAP_I_TO_R";
        break;
      case 3187:
        result = "GL_PIXEL_MAP_I_TO_G";
        break;
      case 3188:
        result = "GL_PIXEL_MAP_I_TO_B";
        break;
      case 3189:
        result = "GL_PIXEL_MAP_I_TO_A";
        break;
      case 3190:
        result = "GL_PIXEL_MAP_R_TO_R";
        break;
      case 3191:
        result = "GL_PIXEL_MAP_G_TO_G";
        break;
      case 3192:
        result = "GL_PIXEL_MAP_B_TO_B";
        break;
      case 3193:
        result = "GL_PIXEL_MAP_A_TO_A";
        break;
      case 3248:
        result = "GL_PIXEL_MAP_I_TO_I_SIZE";
        break;
      case 3249:
        result = "GL_PIXEL_MAP_S_TO_S_SIZE";
        break;
      case 3250:
        result = "GL_PIXEL_MAP_I_TO_R_SIZE";
        break;
      case 3251:
        result = "GL_PIXEL_MAP_I_TO_G_SIZE";
        break;
      case 3252:
        result = "GL_PIXEL_MAP_I_TO_B_SIZE";
        break;
      case 3253:
        result = "GL_PIXEL_MAP_I_TO_A_SIZE";
        break;
      case 3254:
        result = "GL_PIXEL_MAP_R_TO_R_SIZE";
        break;
      case 3255:
        result = "GL_PIXEL_MAP_G_TO_G_SIZE";
        break;
      case 3256:
        result = "GL_PIXEL_MAP_B_TO_B_SIZE";
        break;
      case 3257:
        result = "GL_PIXEL_MAP_A_TO_A_SIZE";
        break;
      case 3312:
        result = "GL_UNPACK_SWAP_BYTES";
        break;
      case 3313:
        result = "GL_UNPACK_LSB_FIRST";
        break;
      case 3314:
        result = "GL_UNPACK_ROW_LENGTH";
        break;
      case 3315:
        result = "GL_UNPACK_SKIP_ROWS";
        break;
      case 3316:
        result = "GL_UNPACK_SKIP_PIXELS";
        break;
      case 3317:
        result = "GL_UNPACK_ALIGNMENT";
        break;
      case 3328:
        result = "GL_PACK_SWAP_BYTES";
        break;
      case 3329:
        result = "GL_PACK_LSB_FIRST";
        break;
      case 3330:
        result = "GL_PACK_ROW_LENGTH";
        break;
      case 3331:
        result = "GL_PACK_SKIP_ROWS";
        break;
      case 3332:
        result = "GL_PACK_SKIP_PIXELS";
        break;
      case 3333:
        result = "GL_PACK_ALIGNMENT";
        break;
      case 3344:
        result = "GL_MAP_COLOR";
        break;
      case 3345:
        result = "GL_MAP_STENCIL";
        break;
      case 3346:
        result = "GL_INDEX_SHIFT";
        break;
      case 3347:
        result = "GL_INDEX_OFFSET";
        break;
      case 3348:
        result = "GL_RED_SCALE";
        break;
      case 3349:
        result = "GL_RED_BIAS";
        break;
      case 3350:
        result = "GL_ZOOM_X";
        break;
      case 3351:
        result = "GL_ZOOM_Y";
        break;
      case 3352:
        result = "GL_GREEN_SCALE";
        break;
      case 3353:
        result = "GL_GREEN_BIAS";
        break;
      case 3354:
        result = "GL_BLUE_SCALE";
        break;
      case 3355:
        result = "GL_BLUE_BIAS";
        break;
      case 3356:
        result = "GL_ALPHA_SCALE";
        break;
      case 3357:
        result = "GL_ALPHA_BIAS";
        break;
      case 3358:
        result = "GL_DEPTH_SCALE";
        break;
      case 3359:
        result = "GL_DEPTH_BIAS";
        break;
      case 3376:
        result = "GL_MAX_EVAL_ORDER";
        break;
      case 3377:
        result = "GL_MAX_LIGHTS";
        break;
      case 3378:
        result = "GL_MAX_CLIP_DISTANCES";
        break;
      case 3379:
        result = "GL_MAX_TEXTURE_SIZE";
        break;
      case 3380:
        result = "GL_MAX_PIXEL_MAP_TABLE";
        break;
      case 3381:
        result = "GL_MAX_ATTRIB_STACK_DEPTH";
        break;
      case 3382:
        result = "GL_MAX_MODELVIEW_STACK_DEPTH";
        break;
      case 3383:
        result = "GL_MAX_NAME_STACK_DEPTH";
        break;
      case 3384:
        result = "GL_MAX_PROJECTION_STACK_DEPTH";
        break;
      case 3385:
        result = "GL_MAX_TEXTURE_STACK_DEPTH";
        break;
      case 3386:
        result = "GL_MAX_VIEWPORT_DIMS";
        break;
      case 3387:
        result = "GL_MAX_CLIENT_ATTRIB_STACK_DEPTH";
        break;
      case 3408:
        result = "GL_SUBPIXEL_BITS";
        break;
      case 3409:
        result = "GL_INDEX_BITS";
        break;
      case 3410:
        result = "GL_RED_BITS";
        break;
      case 3411:
        result = "GL_GREEN_BITS";
        break;
      case 3412:
        result = "GL_BLUE_BITS";
        break;
      case 3413:
        result = "GL_ALPHA_BITS";
        break;
      case 3414:
        result = "GL_DEPTH_BITS";
        break;
      case 3415:
        result = "GL_STENCIL_BITS";
        break;
      case 3416:
        result = "GL_ACCUM_RED_BITS";
        break;
      case 3417:
        result = "GL_ACCUM_GREEN_BITS";
        break;
      case 3418:
        result = "GL_ACCUM_BLUE_BITS";
        break;
      case 3419:
        result = "GL_ACCUM_ALPHA_BITS";
        break;
      case 3440:
        result = "GL_NAME_STACK_DEPTH";
        break;
      case 3456:
        result = "GL_AUTO_NORMAL";
        break;
      case 3472:
        result = "GL_MAP1_COLOR_4";
        break;
      case 3473:
        result = "GL_MAP1_INDEX";
        break;
      case 3474:
        result = "GL_MAP1_NORMAL";
        break;
      case 3475:
        result = "GL_MAP1_TEXTURE_COORD_1";
        break;
      case 3476:
        result = "GL_MAP1_TEXTURE_COORD_2";
        break;
      case 3477:
        result = "GL_MAP1_TEXTURE_COORD_3";
        break;
      case 3478:
        result = "GL_MAP1_TEXTURE_COORD_4";
        break;
      case 3479:
        result = "GL_MAP1_VERTEX_3";
        break;
      case 3480:
        result = "GL_MAP1_VERTEX_4";
        break;
      case 3504:
        result = "GL_MAP2_COLOR_4";
        break;
      case 3505:
        result = "GL_MAP2_INDEX";
        break;
      case 3506:
        result = "GL_MAP2_NORMAL";
        break;
      case 3507:
        result = "GL_MAP2_TEXTURE_COORD_1";
        break;
      case 3508:
        result = "GL_MAP2_TEXTURE_COORD_2";
        break;
      case 3509:
        result = "GL_MAP2_TEXTURE_COORD_3";
        break;
      case 3510:
        result = "GL_MAP2_TEXTURE_COORD_4";
        break;
      case 3511:
        result = "GL_MAP2_VERTEX_3";
        break;
      case 3512:
        result = "GL_MAP2_VERTEX_4";
        break;
      case 3536:
        result = "GL_MAP1_GRID_DOMAIN";
        break;
      case 3537:
        result = "GL_MAP1_GRID_SEGMENTS";
        break;
      case 3538:
        result = "GL_MAP2_GRID_DOMAIN";
        break;
      case 3539:
        result = "GL_MAP2_GRID_SEGMENTS";
        break;
      case 3552:
        result = "GL_TEXTURE_1D";
        break;
      case 3553:
        result = "GL_TEXTURE_2D";
        break;
      case 3568:
        result = "GL_FEEDBACK_BUFFER_POINTER";
        break;
      case 3569:
        result = "GL_FEEDBACK_BUFFER_SIZE";
        break;
      case 3570:
        result = "GL_FEEDBACK_BUFFER_TYPE";
        break;
      case 3571:
        result = "GL_SELECTION_BUFFER_POINTER";
        break;
      case 3572:
        result = "GL_SELECTION_BUFFER_SIZE";
        break;
      default:
        switch(a1)
        {
          case 1024:
            result = "GL_FRONT_LEFT";
            break;
          case 1025:
            result = "GL_FRONT_RIGHT";
            break;
          case 1026:
            result = "GL_BACK_LEFT";
            break;
          case 1027:
            result = "GL_BACK_RIGHT";
            break;
          case 1028:
            result = "GL_FRONT";
            break;
          case 1029:
            result = "GL_BACK";
            break;
          case 1030:
            result = "GL_LEFT";
            break;
          case 1031:
            result = "GL_RIGHT";
            break;
          case 1032:
            result = "GL_FRONT_AND_BACK";
            break;
          case 1033:
            result = "GL_AUX0";
            break;
          case 1034:
            result = "GL_AUX1";
            break;
          case 1035:
            result = "GL_AUX2";
            break;
          case 1036:
            result = "GL_AUX3";
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

const char *dy_compact_string_from_enum(int a1)
{
  const char *result;
  int v2;

  if (a1 > 24719)
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 24720:
          result = "Pn Triangles";
          break;
        case 24721:
          result = "Max Pn Triangles Tesselation Level";
          break;
        case 24722:
          result = "Pn Triangles Point Mode";
          break;
        case 24723:
          result = "Pn Triangles Normal Mode";
          break;
        case 24724:
          result = "Pn Triangles Tesselation Level";
          break;
        case 24725:
          result = "Pn Triangles Point Mode Linear";
          break;
        case 24726:
          result = "Pn Triangles Point Mode Cubic";
          break;
        case 24727:
          result = "Pn Triangles Normal Mode Linear";
          break;
        case 24728:
          result = "Pn Triangles Normal Mode Quadratic";
          break;
        case 24755:
          result = "Cull Mode";
          break;
        case 24756:
          result = "Cull Center";
          break;
        case 24757:
          result = "Cull Clip";
          break;
        case 32768:
          result = "Abgr";
          break;
        case 32769:
          result = "Constant Color";
          break;
        case 32770:
          result = "One Minus Constant Color";
          break;
        case 32771:
          result = "Constant Alpha";
          break;
        case 32772:
          result = "One Minus Constant Alpha";
          break;
        case 32773:
          result = "Color";
          break;
        case 32774:
          result = "Func Add";
          break;
        case 32775:
          result = "Min";
          break;
        case 32776:
          result = "Max";
          break;
        case 32777:
          result = "Equation RGB";
          break;
        case 32778:
          result = "Func Subtract";
          break;
        case 32779:
          result = "Func Reverse Subtract";
          break;
        case 32784:
          result = "Convolution 1D";
          break;
        case 32785:
          result = "Convolution 2D";
          break;
        case 32786:
          result = "Separable 2D";
          break;
        case 32787:
          result = "Convolution Border Mode";
          break;
        case 32788:
          result = "Convolution Filter Scale";
          break;
        case 32789:
          result = "Convolution Filter Bias";
          break;
        case 32790:
          result = "Reduce";
          break;
        case 32791:
          result = "Convolution Format";
          break;
        case 32792:
          result = "Convolution Width";
          break;
        case 32793:
          result = "Convolution Height";
          break;
        case 32794:
          result = "Max Convolution Width";
          break;
        case 32795:
          result = "Max Convolution Height";
          break;
        case 32796:
          result = "Post Convolution Red Scale";
          break;
        case 32797:
          result = "Post Convolution Green Scale";
          break;
        case 32798:
          result = "Post Convolution Blue Scale";
          break;
        case 32799:
          result = "Post Convolution Alpha Scale";
          break;
        case 32800:
          result = "Post Convolution Red Bias";
          break;
        case 32801:
          result = "Post Convolution Green Bias";
          break;
        case 32802:
          result = "Post Convolution Blue Bias";
          break;
        case 32803:
          result = "Post Convolution Alpha Bias";
          break;
        case 32804:
          result = "Histogram";
          break;
        case 32805:
          result = "Proxy Histogram";
          break;
        case 32806:
          result = "Histogram Width";
          break;
        case 32807:
          result = "Histogram Format";
          break;
        case 32808:
          result = "Histogram Red Size";
          break;
        case 32809:
          result = "Histogram Green Size";
          break;
        case 32810:
          result = "Histogram Blue Size";
          break;
        case 32811:
          result = "Histogram Alpha Size";
          break;
        case 32812:
          result = "Histogram Luminance Size";
          break;
        case 32813:
          result = "Histogram Sink";
          break;
        case 32814:
          result = "Minmax";
          break;
        case 32815:
          result = "Minmax Format";
          break;
        case 32816:
          result = "Minmax Sink";
          break;
        case 32817:
          result = "Table Too Large";
          break;
        case 32818:
          result = "Unsigned Byte 3 3 2";
          break;
        case 32819:
          result = "Unsigned Short 4 4 4 4";
          break;
        case 32820:
          result = "Unsigned Short 5 5 5 1";
          break;
        case 32821:
          result = "Unsigned Int 8 8 8 8";
          break;
        case 32822:
          result = "Unsigned Int 10 10 10 2";
          break;
        case 32823:
          result = "Fill";
          break;
        case 32824:
          result = "Factor";
          break;
        case 32825:
          result = "Bias";
          break;
        case 32826:
          result = "Rescale Normal";
          break;
        case 32827:
          result = "Alpha4";
          break;
        case 32828:
          result = "Alpha8";
          break;
        case 32829:
          result = "Alpha12";
          break;
        case 32830:
          result = "Alpha16";
          break;
        case 32831:
          result = "Luminance4";
          break;
        case 32832:
          result = "Luminance8";
          break;
        case 32833:
          result = "Luminance12";
          break;
        case 32834:
          result = "Luminance16";
          break;
        case 32835:
          result = "Luminance4 Alpha4";
          break;
        case 32836:
          result = "Luminance6 Alpha2";
          break;
        case 32837:
          result = "Luminance8 Alpha8";
          break;
        case 32838:
          result = "Luminance12 Alpha4";
          break;
        case 32839:
          result = "Luminance12 Alpha12";
          break;
        case 32840:
          result = "Luminance16 Alpha16";
          break;
        case 32841:
          result = "Intensity";
          break;
        case 32842:
          result = "Intensity4";
          break;
        case 32843:
          result = "Intensity8";
          break;
        case 32844:
          result = "Intensity12";
          break;
        case 32845:
          result = "Intensity16";
          break;
        case 32846:
          result = "RGB2";
          break;
        case 32847:
          result = "RGB4";
          break;
        case 32848:
          result = "RGB5";
          break;
        case 32849:
          result = "RGB8";
          break;
        case 32850:
          result = "RGB10";
          break;
        case 32851:
          result = "RGB12";
          break;
        case 32852:
          result = "RGB16";
          break;
        case 32853:
          result = "RGBA2";
          break;
        case 32854:
          result = "RGBA4";
          break;
        case 32855:
          result = "RGB5 A1";
          break;
        case 32856:
          result = "RGBA8";
          break;
        case 32857:
          result = "RGB10 A2";
          break;
        case 32858:
          result = "RGBA12";
          break;
        case 32859:
          result = "RGBA16";
          break;
        case 32860:
          result = "Red Size";
          break;
        case 32861:
          result = "Green Size";
          break;
        case 32862:
          result = "Blue Size";
          break;
        case 32863:
          result = "Alpha Size";
          break;
        case 32864:
          result = "Luminance Size";
          break;
        case 32865:
          result = "Intensity Size";
          break;
        case 32866:
          result = "Replace";
          break;
        case 32867:
          result = "Proxy Texture 1D";
          break;
        case 32868:
          result = "Proxy Texture 2D";
          break;
        case 32869:
          result = "Too Large";
          break;
        case 32870:
          result = "Priority";
          break;
        case 32871:
          result = "Resident";
          break;
        case 32872:
          result = "Binding 1D";
          break;
        case 32873:
          result = "Binding 2D";
          break;
        case 32874:
          result = "Binding 3D";
          break;
        case 32875:
          result = "Pack Skip Images";
          break;
        case 32876:
          result = "Pack Image Height";
          break;
        case 32877:
          result = "Unpack Skip Images";
          break;
        case 32878:
          result = "Unpack Image Height";
          break;
        case 32879:
          result = "3D";
          break;
        case 32880:
          result = "Proxy Texture 3D";
          break;
        case 32881:
          result = "Depth";
          break;
        case 32882:
          result = "Wrap R";
          break;
        case 32883:
          result = "Max 3D Texture Size";
          break;
        case 32884:
          result = "Vertex Array";
          break;
        case 32885:
          result = "Normal Array";
          break;
        case 32886:
          result = "Color Array";
          break;
        case 32887:
          result = "Index Array";
          break;
        case 32888:
          result = "Coord Array";
          break;
        case 32889:
          result = "Edge Flag Array";
          break;
        case 32890:
          result = "Vertex Array Size";
          break;
        case 32891:
          result = "Vertex Array Type";
          break;
        case 32892:
          result = "Vertex Array Stride";
          break;
        case 32893:
          result = "Vertex Array Count";
          break;
        case 32894:
          result = "Normal Array Type";
          break;
        case 32895:
          result = "Normal Array Stride";
          break;
        case 32896:
          result = "Normal Array Count";
          break;
        case 32897:
          result = "Color Array Size";
          break;
        case 32898:
          result = "Color Array Type";
          break;
        case 32899:
          result = "Color Array Stride";
          break;
        case 32900:
          result = "Color Array Count";
          break;
        case 32901:
          result = "Index Array Type";
          break;
        case 32902:
          result = "Index Array Stride";
          break;
        case 32903:
          result = "Index Array Count";
          break;
        case 32904:
          result = "Coord Array Size";
          break;
        case 32905:
          result = "Coord Array Type";
          break;
        case 32906:
          result = "Coord Array Stride";
          break;
        case 32907:
          result = "Coord Array Count";
          break;
        case 32908:
          result = "Edge Flag Array Stride";
          break;
        case 32909:
          result = "Edge Flag Array Count";
          break;
        case 32910:
          result = "Vertex Array Pointer";
          break;
        case 32911:
          result = "Normal Array Pointer";
          break;
        case 32912:
          result = "Color Array Pointer";
          break;
        case 32913:
          result = "Index Array Pointer";
          break;
        case 32914:
          result = "Coord Array Pointer";
          break;
        case 32915:
          result = "Edge Flag Array Pointer";
          break;
        case 32925:
          result = "Multisample";
          break;
        case 32926:
          result = "Alpha To Coverage";
          break;
        case 32927:
          result = "Alpha To One";
          break;
        case 32928:
          result = "Coverage";
          break;
        case 32936:
          result = "Sample Buffers";
          break;
        case 32937:
          result = "Samples";
          break;
        case 32938:
          result = "Coverage Value";
          break;
        case 32939:
          result = "Coverage Invert";
          break;
        case 32945:
          result = "Matrix";
          break;
        case 32946:
          result = "Matrix Stack Depth";
          break;
        case 32947:
          result = "Max Color Matrix Stack Depth";
          break;
        case 32948:
          result = "Post Color Matrix Red Scale";
          break;
        case 32949:
          result = "Post Color Matrix Green Scale";
          break;
        case 32950:
          result = "Post Color Matrix Blue Scale";
          break;
        case 32951:
          result = "Post Color Matrix Alpha Scale";
          break;
        case 32952:
          result = "Post Color Matrix Red Bias";
          break;
        case 32953:
          result = "Post Color Matrix Green Bias";
          break;
        case 32954:
          result = "Post Color Matrix Blue Bias";
          break;
        case 32955:
          result = "Post Color Matrix Alpha Bias";
          break;
        case 32959:
          result = "Compare Fail Value";
          break;
        case 32968:
          result = "Dst RGB";
          break;
        case 32969:
          result = "Src RGB";
          break;
        case 32970:
          result = "Dst Alpha";
          break;
        case 32971:
          result = "Src Alpha";
          break;
        case 32976:
          result = "Table";
          break;
        case 32977:
          result = "Post Convolution Color Table";
          break;
        case 32978:
          result = "Post Color Matrix Color Table";
          break;
        case 32979:
          result = "Proxy Color Table";
          break;
        case 32980:
          result = "Proxy Post Convolution Color Table";
          break;
        case 32981:
          result = "Proxy Post Color Matrix Color Table";
          break;
        case 32982:
          result = "Table Scale";
          break;
        case 32983:
          result = "Table Bias";
          break;
        case 32984:
          result = "Table Format";
          break;
        case 32985:
          result = "Table Width";
          break;
        case 32986:
          result = "Table Red Size";
          break;
        case 32987:
          result = "Table Green Size";
          break;
        case 32988:
          result = "Table Blue Size";
          break;
        case 32989:
          result = "Table Alpha Size";
          break;
        case 32990:
          result = "Table Luminance Size";
          break;
        case 32991:
          result = "Table Intensity Size";
          break;
        case 32992:
          result = "BGR";
          break;
        case 32993:
          result = "BGRA";
          break;
        case 32994:
          result = "Index1";
          break;
        case 32995:
          result = "Index2";
          break;
        case 32996:
          result = "Index4";
          break;
        case 32997:
          result = "Index8";
          break;
        case 32998:
          result = "Index12";
          break;
        case 32999:
          result = "Index16";
          break;
        case 33000:
          result = "Max Elements Vertices";
          break;
        case 33001:
          result = "Max Elements Indices";
          break;
        case 33005:
          result = "Index Size";
          break;
        case 33008:
          result = "Clip Volume Clipping Hint";
          break;
        case 33062:
          result = "Size Min";
          break;
        case 33063:
          result = "Size Max";
          break;
        case 33064:
          result = "Fade Threshold Size";
          break;
        case 33065:
          result = "Distance Attenuation";
          break;
        case 33069:
          result = "Clamp To Border";
          break;
        case 33071:
          result = "Clamp To Edge";
          break;
        case 33082:
          result = "Min Lod";
          break;
        case 33083:
          result = "Max Lod";
          break;
        case 33084:
          result = "Base Level";
          break;
        case 33085:
          result = "Max Level";
          break;
        case 33104:
          result = "Ignore Border";
          break;
        case 33105:
          result = "Constant Border";
          break;
        case 33107:
          result = "Replicate Border";
          break;
        case 33108:
          result = "Convolution Border Color";
          break;
        case 33169:
          result = "Generate Mipmap";
          break;
        case 33170:
          result = "Generate Mipmap Hint";
          break;
        case 33189:
          result = "Depth Component16";
          break;
        case 33190:
          result = "Depth Component24";
          break;
        case 33191:
          result = "Depth Component32";
          break;
        case 33192:
          result = "Array Element Lock First";
          break;
        case 33193:
          result = "Array Element Lock Count";
          break;
        case 33272:
          result = "Control";
          break;
        case 33273:
          result = "Single Color";
          break;
        case 33274:
          result = "Separate Specular Color";
          break;
        case 33275:
          result = "Shared Texture Palette";
          break;
        case 33280:
          result = "Text Fragment Shader";
          break;
        case 33296:
          result = "Attachment Color Encoding";
          break;
        case 33297:
          result = "Attachment Component Type";
          break;
        case 33298:
          result = "Attachment Red Size";
          break;
        case 33299:
          result = "Attachment Green Size";
          break;
        case 33300:
          result = "Attachment Blue Size";
          break;
        case 33301:
          result = "Attachment Alpha Size";
          break;
        case 33302:
          result = "Attachment Depth Size";
          break;
        case 33303:
          result = "Attachment Stencil Size";
          break;
        case 33304:
          result = "Default";
          break;
        case 33305:
          result = "Undefined";
          break;
        case 33306:
          result = "Stencil Attachment";
          break;
        case 33307:
          result = "Major Version";
          break;
        case 33308:
          result = "Minor Version";
          break;
        case 33309:
          result = "Num Extensions";
          break;
        case 33310:
          result = "Context Flags";
          break;
        case 33317:
          result = "Compressed Red";
          break;
        case 33318:
          result = "Compressed RG";
          break;
        case 33319:
          result = "RG";
          break;
        case 33320:
          result = "RG Integer";
          break;
        case 33321:
          result = "R8";
          break;
        case 33322:
          result = "R16";
          break;
        case 33323:
          result = "RG8";
          break;
        case 33324:
          result = "RG16";
          break;
        case 33325:
          result = "R16f";
          break;
        case 33326:
          result = "R32f";
          break;
        case 33327:
          result = "RG16f";
          break;
        case 33328:
          result = "RG32f";
          break;
        case 33329:
          result = "R8i";
          break;
        case 33330:
          result = "R8ui";
          break;
        case 33331:
          result = "R16i";
          break;
        case 33332:
          result = "R16ui";
          break;
        case 33333:
          result = "R32i";
          break;
        case 33334:
          result = "R32ui";
          break;
        case 33335:
          result = "RG8i";
          break;
        case 33336:
          result = "RG8ui";
          break;
        case 33337:
          result = "RG16i";
          break;
        case 33338:
          result = "RG16ui";
          break;
        case 33339:
          result = "RG32i";
          break;
        case 33340:
          result = "RG32ui";
          break;
        case 33344:
          result = "Sync CL Event";
          break;
        case 33345:
          result = "Sync CL Event Complete";
          break;
        case 33367:
          result = "Program Binary Retrievable Hint";
          break;
        case 33368:
          result = "Program Separable";
          break;
        case 33369:
          result = "Active Program";
          break;
        case 33370:
          result = "Program Pipeline Binding";
          break;
        case 33371:
          result = "Max Viewports";
          break;
        case 33372:
          result = "Viewport Subpixel Bits";
          break;
        case 33373:
          result = "Viewport Bounds Range";
          break;
        case 33374:
          result = "Layer Provoking Vertex";
          break;
        case 33375:
          result = "Viewport Index Provoking Vertex";
          break;
        case 33376:
          result = "Undefined Vertex";
          break;
        case 33503:
          result = "Immutable Levels";
          break;
        case 33510:
          result = "Sampler";
          break;
        case 33634:
          result = "Unsigned Byte 2 3 3 Rev";
          break;
        case 33635:
          result = "Unsigned Short 5 6 5";
          break;
        case 33636:
          result = "Unsigned Short 5 6 5 Rev";
          break;
        case 33637:
          result = "Unsigned Short 4 4 4 4 Rev";
          break;
        case 33638:
          result = "Unsigned Short 1 5 5 5 Rev";
          break;
        case 33639:
          result = "Unsigned Int 8 8 8 8 Rev";
          break;
        case 33640:
          result = "Unsigned Int 2 10 10 10 Rev";
          break;
        case 33648:
          result = "Mirrored Repeat";
          break;
        case 33776:
          result = "Compressed RGB S3TC DXT1";
          break;
        case 33777:
          result = "Compressed RGBA S3TC DXT1";
          break;
        case 33778:
          result = "Compressed RGBA S3TC DXT3";
          break;
        case 33779:
          result = "Compressed RGBA S3TC DXT5";
          break;
        case 33872:
          result = "Coord Src";
          break;
        case 33873:
          result = "Coord";
          break;
        case 33874:
          result = "Fragment Depth";
          break;
        case 33875:
          result = "Current Fog Coordinate";
          break;
        case 33876:
          result = "Coord Array Type";
          break;
        case 33877:
          result = "Coord Array Stride";
          break;
        case 33878:
          result = "Coord Array Pointer";
          break;
        case 33879:
          result = "Coord Array";
          break;
        case 33880:
          result = "Sum";
          break;
        case 33881:
          result = "Current Secondary Color";
          break;
        case 33882:
          result = "Secondary Color Array Size";
          break;
        case 33883:
          result = "Secondary Color Array Type";
          break;
        case 33884:
          result = "Secondary Color Array Stride";
          break;
        case 33885:
          result = "Secondary Color Array Pointer";
          break;
        case 33886:
          result = "Secondary Color Array";
          break;
        case 33887:
          result = "Current Raster Secondary Color";
          break;
        case 33901:
          result = "Aliased Point Size Range";
          break;
        case 33902:
          result = "Aliased Line Width Range";
          break;
        case 33984:
          result = "Texture0";
          break;
        case 33985:
          result = "Texture1";
          break;
        case 33986:
          result = "Texture2";
          break;
        case 33987:
          result = "Texture3";
          break;
        case 33988:
          result = "Texture4";
          break;
        case 33989:
          result = "Texture5";
          break;
        case 33990:
          result = "Texture6";
          break;
        case 33991:
          result = "Texture7";
          break;
        case 33992:
          result = "Texture8";
          break;
        case 33993:
          result = "Texture9";
          break;
        case 33994:
          result = "Texture10";
          break;
        case 33995:
          result = "Texture11";
          break;
        case 33996:
          result = "Texture12";
          break;
        case 33997:
          result = "Texture13";
          break;
        case 33998:
          result = "Texture14";
          break;
        case 33999:
          result = "Texture15";
          break;
        case 34000:
          result = "Texture16";
          break;
        case 34001:
          result = "Texture17";
          break;
        case 34002:
          result = "Texture18";
          break;
        case 34003:
          result = "Texture19";
          break;
        case 34004:
          result = "Texture20";
          break;
        case 34005:
          result = "Texture21";
          break;
        case 34006:
          result = "Texture22";
          break;
        case 34007:
          result = "Texture23";
          break;
        case 34008:
          result = "Texture24";
          break;
        case 34009:
          result = "Texture25";
          break;
        case 34010:
          result = "Texture26";
          break;
        case 34011:
          result = "Texture27";
          break;
        case 34012:
          result = "Texture28";
          break;
        case 34013:
          result = "Texture29";
          break;
        case 34014:
          result = "Texture30";
          break;
        case 34015:
          result = "Texture31";
          break;
        case 34016:
          result = "Active Texture";
          break;
        case 34017:
          result = "Client Active Texture";
          break;
        case 34018:
          result = "Max Texture Units";
          break;
        case 34019:
          result = "Transpose Modelview Matrix";
          break;
        case 34020:
          result = "Transpose Projection Matrix";
          break;
        case 34021:
          result = "Transpose Texture Matrix";
          break;
        case 34022:
          result = "Transpose Color Matrix";
          break;
        case 34023:
          result = "Subtract";
          break;
        case 34024:
          result = "Max Renderbuffer Size";
          break;
        case 34025:
          result = "Compressed Alpha";
          break;
        case 34026:
          result = "Compressed Luminance";
          break;
        case 34027:
          result = "Compressed Luminance Alpha";
          break;
        case 34028:
          result = "Compressed Intensity";
          break;
        case 34029:
          result = "Compressed RGB";
          break;
        case 34030:
          result = "Compressed RGBA";
          break;
        case 34031:
          result = "Compression Hint";
          break;
        case 34032:
          result = "Uniform Block Referenced By Tess Control Shader";
          break;
        case 34033:
          result = "Uniform Block Referenced By Tess Evaluation Shader";
          break;
        case 34037:
          result = "Rectangle";
          break;
        case 34038:
          result = "Binding Rectangle";
          break;
        case 34039:
          result = "Proxy Texture Rectangle";
          break;
        case 34040:
          result = "Max Rectangle Texture Size";
          break;
        case 34041:
          result = "Stencil";
          break;
        case 34042:
          result = "Unsigned Int 24 8";
          break;
        case 34045:
          result = "Max Texture Lod Bias";
          break;
        case 34046:
          result = "Max Anisotropy";
          break;
        case 34047:
          result = "Max Texture Max Anisotropy";
          break;
        case 34048:
          result = "Filter Control";
          break;
        case 34049:
          result = "Lod Bias";
          break;
        case 34052:
          result = "Max Shininess";
          break;
        case 34053:
          result = "Max Spot Exponent";
          break;
        case 34055:
          result = "Incr Wrap";
          break;
        case 34056:
          result = "Decr Wrap";
          break;
        case 34058:
          result = "Modelview1";
          break;
        case 34065:
          result = "Normal Map";
          break;
        case 34066:
          result = "Reflection Map";
          break;
        case 34067:
          result = "Cube Map";
          break;
        case 34068:
          result = "Binding Cube Map";
          break;
        case 34069:
          result = "Cube Map Positive X";
          break;
        case 34070:
          result = "Cube Map Negative X";
          break;
        case 34071:
          result = "Cube Map Positive Y";
          break;
        case 34072:
          result = "Cube Map Negative Y";
          break;
        case 34073:
          result = "Cube Map Positive Z";
          break;
        case 34074:
          result = "Cube Map Negative Z";
          break;
        case 34075:
          result = "Proxy Texture Cube Map";
          break;
        case 34076:
          result = "Max Cube Map Texture Size";
          break;
        case 34077:
          result = "Vertex Array Range";
          break;
        case 34078:
          result = "Vertex Array Range Length";
          break;
        case 34079:
          result = "Vertex Array Storage Hint";
          break;
        case 34080:
          result = "Max Vertex Array Range Element";
          break;
        case 34081:
          result = "Vertex Array Range Pointer";
          break;
        case 34082:
          result = "Register Combiners";
          break;
        case 34083:
          result = "Variable A";
          break;
        case 34084:
          result = "Variable B";
          break;
        case 34085:
          result = "Variable C";
          break;
        case 34086:
          result = "Variable D";
          break;
        case 34087:
          result = "Variable E";
          break;
        case 34088:
          result = "Variable F";
          break;
        case 34089:
          result = "Variable G";
          break;
        case 34090:
          result = "Constant Color0";
          break;
        case 34091:
          result = "Constant Color1";
          break;
        case 34092:
          result = "Primary Color";
          break;
        case 34093:
          result = "Secondary Color";
          break;
        case 34094:
          result = "Spare0";
          break;
        case 34095:
          result = "Spare1";
          break;
        case 34096:
          result = "Discard";
          break;
        case 34097:
          result = "E Times F";
          break;
        case 34098:
          result = "Spare0 Plus Secondary Color";
          break;
        case 34099:
          result = "Vertex Array Range Without Flush";
          break;
        case 34100:
          result = "Multisample Filter Hint";
          break;
        case 34101:
          result = "Per Stage Constants";
          break;
        case 34102:
          result = "Unsigned Identity";
          break;
        case 34103:
          result = "Unsigned Invert";
          break;
        case 34104:
          result = "Expand Normal";
          break;
        case 34105:
          result = "Expand Negate";
          break;
        case 34106:
          result = "Half Bias Normal";
          break;
        case 34107:
          result = "Half Bias Negate";
          break;
        case 34108:
          result = "Signed Identity";
          break;
        case 34109:
          result = "Signed Negate";
          break;
        case 34110:
          result = "Scale By Two";
          break;
        case 34111:
          result = "Scale By Four";
          break;
        case 34112:
          result = "Scale By One Half";
          break;
        case 34113:
          result = "Bias By Negative One Half";
          break;
        case 34114:
          result = "Combiner Input";
          break;
        case 34115:
          result = "Combiner Mapping";
          break;
        case 34116:
          result = "Combiner Component Usage";
          break;
        case 34117:
          result = "Combiner Ab Dot Product";
          break;
        case 34118:
          result = "Combiner Cd Dot Product";
          break;
        case 34119:
          result = "Combiner Mux Sum";
          break;
        case 34120:
          result = "Combiner Scale";
          break;
        case 34121:
          result = "Combiner Bias";
          break;
        case 34122:
          result = "Combiner Ab Output";
          break;
        case 34123:
          result = "Combiner Cd Output";
          break;
        case 34124:
          result = "Combiner Sum Output";
          break;
        case 34125:
          result = "Max General Combiners";
          break;
        case 34126:
          result = "Num General Combiners";
          break;
        case 34127:
          result = "Sum Clamp";
          break;
        case 34128:
          result = "Combiner0";
          break;
        case 34129:
          result = "Combiner1";
          break;
        case 34130:
          result = "Combiner2";
          break;
        case 34131:
          result = "Combiner3";
          break;
        case 34132:
          result = "Combiner4";
          break;
        case 34133:
          result = "Combiner5";
          break;
        case 34134:
          result = "Combiner6";
          break;
        case 34135:
          result = "Combiner7";
          break;
        case 34138:
          result = "Distance Mode";
          break;
        case 34139:
          result = "Eye Radial";
          break;
        case 34140:
          result = "Eye Plane Absolute";
          break;
        case 34160:
          result = "Combine";
          break;
        case 34161:
          result = "Combine RGB";
          break;
        case 34162:
          result = "Combine Alpha";
          break;
        case 34163:
          result = "RGB Scale";
          break;
        case 34164:
          result = "Add Signed";
          break;
        case 34165:
          result = "Interpolate";
          break;
        case 34166:
          result = "Constant";
          break;
        case 34167:
          result = "Primary Color";
          break;
        case 34168:
          result = "Previous";
          break;
        case 34176:
          result = "Src0 RGB";
          break;
        case 34177:
          result = "Src1 RGB";
          break;
        case 34178:
          result = "Src2 RGB";
          break;
        case 34184:
          result = "Src0 Alpha";
          break;
        case 34185:
          result = "Src1 Alpha";
          break;
        case 34186:
          result = "Src2 Alpha";
          break;
        case 34192:
          result = "Operand0 RGB";
          break;
        case 34193:
          result = "Operand1 RGB";
          break;
        case 34194:
          result = "Operand2 RGB";
          break;
        case 34200:
          result = "Operand0 Alpha";
          break;
        case 34201:
          result = "Operand1 Alpha";
          break;
        case 34202:
          result = "Operand2 Alpha";
          break;
        case 34224:
          result = "Specular Vector";
          break;
        case 34225:
          result = "Transform Hint";
          break;
        case 34226:
          result = "Unpack Client Storage";
          break;
        case 34227:
          result = "Object";
          break;
        case 34228:
          result = "Storage Client";
          break;
        case 34229:
          result = "Vertex Array Binding";
          break;
        case 34230:
          result = "Minimize Storage";
          break;
        case 34231:
          result = "Range Length";
          break;
        case 34232:
          result = "Range Pointer";
          break;
        case 34233:
          result = "Ycbcr 422";
          break;
        case 34234:
          result = "Unsigned Short 8 8";
          break;
        case 34235:
          result = "Unsigned Short 8 8 Rev";
          break;
        case 34236:
          result = "Storage Hint";
          break;
        case 34237:
          result = "Storage Private";
          break;
        case 34238:
          result = "Storage Cached";
          break;
        case 34239:
          result = "Storage Shared";
          break;
        case 34336:
          result = "Vertex Program";
          break;
        case 34337:
          result = "Vertex State Program";
          break;
        case 34338:
          result = "Enabled";
          break;
        case 34339:
          result = "Size";
          break;
        case 34340:
          result = "Stride";
          break;
        case 34341:
          result = "Type";
          break;
        case 34342:
          result = "Current Vertex Attrib";
          break;
        case 34343:
          result = "Program Length";
          break;
        case 34344:
          result = "Program String";
          break;
        case 34345:
          result = "Modelview Projection";
          break;
        case 34346:
          result = "Identity";
          break;
        case 34347:
          result = "Inverse";
          break;
        case 34348:
          result = "Transpose";
          break;
        case 34349:
          result = "Inverse Transpose";
          break;
        case 34350:
          result = "Max Program Matrix Stack Depth";
          break;
        case 34351:
          result = "Max Program Matrices";
          break;
        case 34352:
          result = "Matrix0";
          break;
        case 34353:
          result = "Matrix1";
          break;
        case 34354:
          result = "Matrix2";
          break;
        case 34355:
          result = "Matrix3";
          break;
        case 34356:
          result = "Matrix4";
          break;
        case 34357:
          result = "Matrix5";
          break;
        case 34358:
          result = "Matrix6";
          break;
        case 34359:
          result = "Matrix7";
          break;
        case 34368:
          result = "Current Matrix Stack Depth";
          break;
        case 34369:
          result = "Current Matrix";
          break;
        case 34370:
          result = "Program Point Size";
          break;
        case 34371:
          result = "Vertex Program Two Side";
          break;
        case 34372:
          result = "Program Parameter";
          break;
        case 34373:
          result = "Pointer";
          break;
        case 34374:
          result = "Program Target";
          break;
        case 34375:
          result = "Program Resident";
          break;
        case 34376:
          result = "Track Matrix";
          break;
        case 34377:
          result = "Track Matrix Transform";
          break;
        case 34378:
          result = "Vertex Program Binding";
          break;
        case 34379:
          result = "Program Error Position";
          break;
        case 34380:
          result = "Offset Texture Rectangle";
          break;
        case 34381:
          result = "Offset Texture Rectangle Scale";
          break;
        case 34382:
          result = "Dot Product Texture Rectangle";
          break;
        case 34383:
          result = "Clamp";
          break;
        case 34384:
          result = "Vertex Attrib Array0";
          break;
        case 34385:
          result = "Vertex Attrib Array1";
          break;
        case 34386:
          result = "Vertex Attrib Array2";
          break;
        case 34387:
          result = "Vertex Attrib Array3";
          break;
        case 34388:
          result = "Vertex Attrib Array4";
          break;
        case 34389:
          result = "Vertex Attrib Array5";
          break;
        case 34390:
          result = "Vertex Attrib Array6";
          break;
        case 34391:
          result = "Vertex Attrib Array7";
          break;
        case 34392:
          result = "Vertex Attrib Array8";
          break;
        case 34393:
          result = "Vertex Attrib Array9";
          break;
        case 34394:
          result = "Vertex Attrib Array10";
          break;
        case 34395:
          result = "Vertex Attrib Array11";
          break;
        case 34396:
          result = "Vertex Attrib Array12";
          break;
        case 34397:
          result = "Vertex Attrib Array13";
          break;
        case 34398:
          result = "Vertex Attrib Array14";
          break;
        case 34399:
          result = "Vertex Attrib Array15";
          break;
        case 34400:
          result = "Map1 Vertex Attrib0 4";
          break;
        case 34401:
          result = "Map1 Vertex Attrib1 4";
          break;
        case 34402:
          result = "Map1 Vertex Attrib2 4";
          break;
        case 34403:
          result = "Map1 Vertex Attrib3 4";
          break;
        case 34404:
          result = "Map1 Vertex Attrib4 4";
          break;
        case 34405:
          result = "Map1 Vertex Attrib5 4";
          break;
        case 34406:
          result = "Map1 Vertex Attrib6 4";
          break;
        case 34407:
          result = "Map1 Vertex Attrib7 4";
          break;
        case 34408:
          result = "Map1 Vertex Attrib8 4";
          break;
        case 34409:
          result = "Map1 Vertex Attrib9 4";
          break;
        case 34410:
          result = "Map1 Vertex Attrib10 4";
          break;
        case 34411:
          result = "Map1 Vertex Attrib11 4";
          break;
        case 34412:
          result = "Map1 Vertex Attrib12 4";
          break;
        case 34413:
          result = "Map1 Vertex Attrib13 4";
          break;
        case 34414:
          result = "Map1 Vertex Attrib14 4";
          break;
        case 34415:
          result = "Map1 Vertex Attrib15 4";
          break;
        case 34416:
          result = "Map2 Vertex Attrib0 4";
          break;
        case 34417:
          result = "Map2 Vertex Attrib1 4";
          break;
        case 34418:
          result = "Map2 Vertex Attrib2 4";
          break;
        case 34419:
          result = "Map2 Vertex Attrib3 4";
          break;
        case 34420:
          result = "Map2 Vertex Attrib4 4";
          break;
        case 34421:
          result = "Map2 Vertex Attrib5 4";
          break;
        case 34422:
          result = "Map2 Vertex Attrib6 4";
          break;
        case 34423:
          result = "Program Binding";
          break;
        case 34424:
          result = "Map2 Vertex Attrib8 4";
          break;
        case 34425:
          result = "Map2 Vertex Attrib9 4";
          break;
        case 34426:
          result = "Map2 Vertex Attrib10 4";
          break;
        case 34427:
          result = "Map2 Vertex Attrib11 4";
          break;
        case 34428:
          result = "Map2 Vertex Attrib12 4";
          break;
        case 34429:
          result = "Map2 Vertex Attrib13 4";
          break;
        case 34430:
          result = "Map2 Vertex Attrib14 4";
          break;
        case 34431:
          result = "Map2 Vertex Attrib15 4";
          break;
        case 34464:
          result = "Compressed Image Size";
          break;
        case 34465:
          result = "Compressed";
          break;
        case 34466:
          result = "Num Compressed Texture Formats";
          break;
        case 34467:
          result = "Compressed Texture Formats";
          break;
        case 34468:
          result = "Max Vertex Units";
          break;
        case 34469:
          result = "Active Vertex Units";
          break;
        case 34470:
          result = "Weight Sum Unity";
          break;
        case 34471:
          result = "Vertex Blend";
          break;
        case 34472:
          result = "Current Weight";
          break;
        case 34473:
          result = "Weight Array Type";
          break;
        case 34474:
          result = "Weight Array Stride";
          break;
        case 34475:
          result = "Weight Array Size";
          break;
        case 34476:
          result = "Weight Array Pointer";
          break;
        case 34477:
          result = "Weight Array";
          break;
        case 34478:
          result = "Dot3 RGB";
          break;
        case 34479:
          result = "Dot3 RGBA";
          break;
        case 34521:
          result = "RGBA Unsigned Dot Product Mapping";
          break;
        case 34522:
          result = "Unsigned Int S8 S8 8 8";
          break;
        case 34523:
          result = "Unsigned Int 8 8 S8 S8 Rev";
          break;
        case 34524:
          result = "Dsdt Mag Intensity";
          break;
        case 34525:
          result = "Shader Consistent";
          break;
        case 34526:
          result = "Shader";
          break;
        case 34527:
          result = "Shader Operation";
          break;
        case 34528:
          result = "Cull Modes";
          break;
        case 34529:
          result = "Offset Texture Matrix";
          break;
        case 34530:
          result = "Offset Texture Scale";
          break;
        case 34531:
          result = "Offset Texture Bias";
          break;
        case 34532:
          result = "Previous Texture Input";
          break;
        case 34533:
          result = "Const Eye";
          break;
        case 34534:
          result = "Pass Through";
          break;
        case 34535:
          result = "Cull Fragment";
          break;
        case 34536:
          result = "Offset Texture 2D";
          break;
        case 34537:
          result = "Dependent Ar Texture 2D";
          break;
        case 34538:
          result = "Dependent Gb Texture 2D";
          break;
        case 34540:
          result = "Dot Product";
          break;
        case 34541:
          result = "Dot Product Depth Replace";
          break;
        case 34542:
          result = "Dot Product Texture 2D";
          break;
        case 34543:
          result = "Dot Product Texture 3D";
          break;
        case 34544:
          result = "Dot Product Texture Cube Map";
          break;
        case 34545:
          result = "Dot Product Diffuse Cube Map";
          break;
        case 34546:
          result = "Dot Product Reflect Cube Map";
          break;
        case 34547:
          result = "Dot Product Const Eye Reflect Cube Map";
          break;
        case 34548:
          result = "Hilo";
          break;
        case 34549:
          result = "Dsdt";
          break;
        case 34550:
          result = "Dsdt Mag";
          break;
        case 34551:
          result = "Dsdt Mag Vib";
          break;
        case 34552:
          result = "Hilo16";
          break;
        case 34553:
          result = "Signed Hilo";
          break;
        case 34554:
          result = "Signed Hilo16";
          break;
        case 34555:
          result = "Signed RGBA";
          break;
        case 34556:
          result = "Signed RGBA8";
          break;
        case 34558:
          result = "Signed RGB";
          break;
        case 34559:
          result = "Signed RGB8";
          break;
        case 34561:
          result = "Signed Luminance";
          break;
        case 34562:
          result = "Signed Luminance8";
          break;
        case 34563:
          result = "Signed Luminance Alpha";
          break;
        case 34564:
          result = "Signed Luminance8 Alpha8";
          break;
        case 34565:
          result = "Signed Alpha";
          break;
        case 34566:
          result = "Signed Alpha8";
          break;
        case 34567:
          result = "Signed Intensity";
          break;
        case 34568:
          result = "Signed Intensity8";
          break;
        case 34569:
          result = "Dsdt8";
          break;
        case 34570:
          result = "Dsdt8 Mag8";
          break;
        case 34571:
          result = "Dsdt8 Mag8 Intensity8";
          break;
        case 34572:
          result = "Signed RGB Unsigned Alpha";
          break;
        case 34573:
          result = "Signed RGB8 Unsigned Alpha8";
          break;
        case 34574:
          result = "Hi Scale";
          break;
        case 34575:
          result = "Lo Scale";
          break;
        case 34576:
          result = "Ds Scale";
          break;
        case 34577:
          result = "Dt Scale";
          break;
        case 34578:
          result = "Magnitude Scale";
          break;
        case 34579:
          result = "Vibrance Scale";
          break;
        case 34580:
          result = "Hi Bias";
          break;
        case 34581:
          result = "Lo Bias";
          break;
        case 34582:
          result = "Ds Bias";
          break;
        case 34583:
          result = "Dt Bias";
          break;
        case 34584:
          result = "Magnitude Bias";
          break;
        case 34585:
          result = "Vibrance Bias";
          break;
        case 34586:
          result = "Border Values";
          break;
        case 34587:
          result = "Hi Size";
          break;
        case 34588:
          result = "Lo Size";
          break;
        case 34589:
          result = "Ds Size";
          break;
        case 34590:
          result = "Dt Size";
          break;
        case 34591:
          result = "Mag Size";
          break;
        case 34594:
          result = "Modelview2";
          break;
        case 34595:
          result = "Modelview3";
          break;
        case 34596:
          result = "Modelview4";
          break;
        case 34597:
          result = "Modelview5";
          break;
        case 34598:
          result = "Modelview6";
          break;
        case 34599:
          result = "Modelview7";
          break;
        case 34600:
          result = "Modelview8";
          break;
        case 34601:
          result = "Modelview9";
          break;
        case 34602:
          result = "Modelview10";
          break;
        case 34603:
          result = "Modelview11";
          break;
        case 34604:
          result = "Modelview12";
          break;
        case 34605:
          result = "Modelview13";
          break;
        case 34606:
          result = "Modelview14";
          break;
        case 34607:
          result = "Modelview15";
          break;
        case 34608:
          result = "Modelview16";
          break;
        case 34609:
          result = "Modelview17";
          break;
        case 34610:
          result = "Modelview18";
          break;
        case 34611:
          result = "Modelview19";
          break;
        case 34612:
          result = "Modelview20";
          break;
        case 34613:
          result = "Modelview21";
          break;
        case 34614:
          result = "Modelview22";
          break;
        case 34615:
          result = "Modelview23";
          break;
        case 34616:
          result = "Modelview24";
          break;
        case 34617:
          result = "Modelview25";
          break;
        case 34618:
          result = "Modelview26";
          break;
        case 34619:
          result = "Modelview27";
          break;
        case 34620:
          result = "Modelview28";
          break;
        case 34621:
          result = "Modelview29";
          break;
        case 34622:
          result = "Modelview30";
          break;
        case 34623:
          result = "Modelview31";
          break;
        case 34625:
          result = "Program Binary Length";
          break;
        case 34626:
          result = "Mirror Clamp";
          break;
        case 34627:
          result = "Mirror Clamp To Edge";
          break;
        case 34628:
          result = "Modulate Add";
          break;
        case 34629:
          result = "Modulate Signed Add";
          break;
        case 34630:
          result = "Modulate Subtract";
          break;
        case 34660:
          result = "Size";
          break;
        case 34661:
          result = "Usage";
          break;
        case 34685:
          result = "Min Weighted";
          break;
        case 34686:
          result = "Max Weighted";
          break;
        case 34814:
          result = "Num Program Binary Formats";
          break;
        case 34815:
          result = "Program Binary Formats";
          break;
        case 34816:
          result = "Back Func";
          break;
        case 34817:
          result = "Back Fail";
          break;
        case 34818:
          result = "Back Pass Depth Fail";
          break;
        case 34819:
          result = "Back Pass Depth Pass";
          break;
        case 34820:
          result = "Fragment Program";
          break;
        case 34821:
          result = "Program Alu Instructions";
          break;
        case 34822:
          result = "Program Tex Instructions";
          break;
        case 34823:
          result = "Program Tex Indirections";
          break;
        case 34824:
          result = "Program Native Alu Instructions";
          break;
        case 34825:
          result = "Program Native Tex Instructions";
          break;
        case 34826:
          result = "Program Native Tex Indirections";
          break;
        case 34827:
          result = "Max Program Alu Instructions";
          break;
        case 34828:
          result = "Max Program Tex Instructions";
          break;
        case 34829:
          result = "Max Program Tex Indirections";
          break;
        case 34830:
          result = "Max Program Native Alu Instructions";
          break;
        case 34831:
          result = "Max Program Native Tex Instructions";
          break;
        case 34832:
          result = "Max Program Native Tex Indirections";
          break;
        case 34836:
          result = "RGBA32f";
          break;
        case 34837:
          result = "RGB32f";
          break;
        case 34838:
          result = "Alpha32f";
          break;
        case 34839:
          result = "Intensity32f";
          break;
        case 34840:
          result = "Luminance32f";
          break;
        case 34841:
          result = "Luminance Alpha32f";
          break;
        case 34842:
          result = "RGBA16f";
          break;
        case 34843:
          result = "RGB16f";
          break;
        case 34844:
          result = "Alpha16f";
          break;
        case 34845:
          result = "Intensity16f";
          break;
        case 34846:
          result = "Luminance16f";
          break;
        case 34847:
          result = "Luminance Alpha16f";
          break;
        case 34848:
          result = "RGBA Float Mode";
          break;
        case 34852:
          result = "Max Draw Buffers";
          break;
        case 34853:
          result = "Draw Buffer0";
          break;
        case 34854:
          result = "Draw Buffer1";
          break;
        case 34855:
          result = "Draw Buffer2";
          break;
        case 34856:
          result = "Draw Buffer3";
          break;
        case 34857:
          result = "Draw Buffer4";
          break;
        case 34858:
          result = "Draw Buffer5";
          break;
        case 34859:
          result = "Draw Buffer6";
          break;
        case 34860:
          result = "Draw Buffer7";
          break;
        case 34861:
          result = "Draw Buffer8";
          break;
        case 34862:
          result = "Draw Buffer9";
          break;
        case 34863:
          result = "Draw Buffer10";
          break;
        case 34864:
          result = "Draw Buffer11";
          break;
        case 34865:
          result = "Draw Buffer12";
          break;
        case 34866:
          result = "Draw Buffer13";
          break;
        case 34867:
          result = "Draw Buffer14";
          break;
        case 34868:
          result = "Draw Buffer15";
          break;
        case 34871:
          result = "Compressed Luminance Alpha 3DC";
          break;
        case 34877:
          result = "Equation Alpha";
          break;
        case 34880:
          result = "Matrix Palette";
          break;
        case 34882:
          result = "Max Palette Matrices";
          break;
        case 34883:
          result = "Current Palette Matrix";
          break;
        case 34884:
          result = "Matrix Index Array";
          break;
        case 34886:
          result = "Matrix Index Array Size";
          break;
        case 34887:
          result = "Matrix Index Array Type";
          break;
        case 34888:
          result = "Matrix Index Array Stride";
          break;
        case 34889:
          result = "Matrix Index Array Pointer";
          break;
        case 34890:
          result = "Size";
          break;
        case 34891:
          result = "Texture Mode";
          break;
        case 34892:
          result = "Compare Mode";
          break;
        case 34893:
          result = "Compare Func";
          break;
        case 34894:
          result = "Compare Ref To Texture";
          break;
        case 34895:
          result = "Cube Map Seamless";
          break;
        case 34896:
          result = "Offset Projective Texture 2D";
          break;
        case 34897:
          result = "Offset Projective Texture 2D Scale";
          break;
        case 34898:
          result = "Offset Projective Texture Rectangle";
          break;
        case 34899:
          result = "Offset Projective Texture Rectangle Scale";
          break;
        case 34900:
          result = "Offset Hilo Texture 2D";
          break;
        case 34901:
          result = "Offset Hilo Texture Rectangle";
          break;
        case 34902:
          result = "Offset Hilo Projective Texture 2D";
          break;
        case 34903:
          result = "Offset Hilo Projective Texture Rectangle";
          break;
        case 34904:
          result = "Dependent Hilo Texture 2D";
          break;
        case 34905:
          result = "Dependent RGB Texture 3D";
          break;
        case 34906:
          result = "Dependent RGB Texture Cube Map";
          break;
        case 34907:
          result = "Dot Product Pass Through";
          break;
        case 34908:
          result = "Dot Product Texture 1D";
          break;
        case 34909:
          result = "Dot Product Affine Depth Replace";
          break;
        case 34910:
          result = "Hilo8";
          break;
        case 34911:
          result = "Signed Hilo8";
          break;
        case 34912:
          result = "Force Blue To One";
          break;
        case 34913:
          result = "Sprite";
          break;
        case 34914:
          result = "Coord Replace";
          break;
        case 34915:
          result = "Sprite R Mode";
          break;
        case 34916:
          result = "Query Counter Bits";
          break;
        case 34917:
          result = "Current Query";
          break;
        case 34918:
          result = "Query Result";
          break;
        case 34919:
          result = "Query Result Available";
          break;
        case 34921:
          result = "Max Vertex Attribs";
          break;
        case 34922:
          result = "Normalized";
          break;
        case 34924:
          result = "Max Tess Control Input Components";
          break;
        case 34925:
          result = "Max Tess Evaluation Input Components";
          break;
        case 34929:
          result = "Max Texture Coords";
          break;
        case 34930:
          result = "Max Texture Image Units";
          break;
        case 34932:
          result = "Program Error String";
          break;
        case 34933:
          result = "Program Format Ascii";
          break;
        case 34934:
          result = "Program Format";
          break;
        case 34943:
          result = "Geometry Shader Invocations";
          break;
        case 34960:
          result = "Bounds Test";
          break;
        case 34961:
          result = "Bounds";
          break;
        case 34962:
          result = "Array Buffer";
          break;
        case 34963:
          result = "Element Array Buffer";
          break;
        case 34964:
          result = "Array Buffer Binding";
          break;
        case 34965:
          result = "Element Array Buffer Binding";
          break;
        case 34966:
          result = "Vertex Array Buffer Binding";
          break;
        case 34967:
          result = "Normal Array Buffer Binding";
          break;
        case 34968:
          result = "Color Array Buffer Binding";
          break;
        case 34969:
          result = "Index Array Buffer Binding";
          break;
        case 34970:
          result = "Coord Array Buffer Binding";
          break;
        case 34971:
          result = "Edge Flag Array Buffer Binding";
          break;
        case 34972:
          result = "Secondary Color Array Buffer Binding";
          break;
        case 34973:
          result = "Coord Array Buffer Binding";
          break;
        case 34974:
          result = "Weight Array Buffer Binding";
          break;
        case 34975:
          result = "Buffer Binding";
          break;
        case 34976:
          result = "Program Instructions";
          break;
        case 34977:
          result = "Max Program Instructions";
          break;
        case 34978:
          result = "Program Native Instructions";
          break;
        case 34979:
          result = "Max Program Native Instructions";
          break;
        case 34980:
          result = "Program Temporaries";
          break;
        case 34981:
          result = "Max Program Temporaries";
          break;
        case 34982:
          result = "Program Native Temporaries";
          break;
        case 34983:
          result = "Max Program Native Temporaries";
          break;
        case 34984:
          result = "Program Parameters";
          break;
        case 34985:
          result = "Max Program Parameters";
          break;
        case 34986:
          result = "Program Native Parameters";
          break;
        case 34987:
          result = "Max Program Native Parameters";
          break;
        case 34988:
          result = "Program Attribs";
          break;
        case 34989:
          result = "Max Program Attribs";
          break;
        case 34990:
          result = "Program Native Attribs";
          break;
        case 34991:
          result = "Max Program Native Attribs";
          break;
        case 34992:
          result = "Program Address Registers";
          break;
        case 34993:
          result = "Max Program Address Registers";
          break;
        case 34994:
          result = "Program Native Address Registers";
          break;
        case 34995:
          result = "Max Program Native Address Registers";
          break;
        case 34996:
          result = "Max Program Local Parameters";
          break;
        case 34997:
          result = "Max Program Env Parameters";
          break;
        case 34998:
          result = "Program Under Native Limits";
          break;
        case 34999:
          result = "Transpose Current Matrix";
          break;
        case 35000:
          result = "Read Only";
          break;
        case 35001:
          result = "Write Only";
          break;
        case 35002:
          result = "Read Write";
          break;
        case 35003:
          result = "Access";
          break;
        case 35004:
          result = "Mapped";
          break;
        case 35005:
          result = "Map Pointer";
          break;
        case 35007:
          result = "Time Elapsed";
          break;
        case 35008:
          result = "Matrix0";
          break;
        case 35009:
          result = "Matrix1";
          break;
        case 35010:
          result = "Matrix2";
          break;
        case 35011:
          result = "Matrix3";
          break;
        case 35012:
          result = "Matrix4";
          break;
        case 35013:
          result = "Matrix5";
          break;
        case 35014:
          result = "Matrix6";
          break;
        case 35015:
          result = "Matrix7";
          break;
        case 35016:
          result = "Matrix8";
          break;
        case 35017:
          result = "Matrix9";
          break;
        case 35018:
          result = "Matrix10";
          break;
        case 35019:
          result = "Matrix11";
          break;
        case 35020:
          result = "Matrix12";
          break;
        case 35021:
          result = "Matrix13";
          break;
        case 35022:
          result = "Matrix14";
          break;
        case 35023:
          result = "Matrix15";
          break;
        case 35024:
          result = "Matrix16";
          break;
        case 35025:
          result = "Matrix17";
          break;
        case 35026:
          result = "Matrix18";
          break;
        case 35027:
          result = "Matrix19";
          break;
        case 35028:
          result = "Matrix20";
          break;
        case 35029:
          result = "Matrix21";
          break;
        case 35030:
          result = "Matrix22";
          break;
        case 35031:
          result = "Matrix23";
          break;
        case 35032:
          result = "Matrix24";
          break;
        case 35033:
          result = "Matrix25";
          break;
        case 35034:
          result = "Matrix26";
          break;
        case 35035:
          result = "Matrix27";
          break;
        case 35036:
          result = "Matrix28";
          break;
        case 35037:
          result = "Matrix29";
          break;
        case 35038:
          result = "Matrix30";
          break;
        case 35039:
          result = "Matrix31";
          break;
        case 35040:
          result = "Stream Draw";
          break;
        case 35041:
          result = "Stream Read";
          break;
        case 35042:
          result = "Stream Copy";
          break;
        case 35044:
          result = "Static Draw";
          break;
        case 35045:
          result = "Static Read";
          break;
        case 35046:
          result = "Static Copy";
          break;
        case 35048:
          result = "Dynamic Draw";
          break;
        case 35049:
          result = "Dynamic Read";
          break;
        case 35050:
          result = "Dynamic Copy";
          break;
        case 35051:
          result = "Pixel Pack Buffer";
          break;
        case 35052:
          result = "Pixel Unpack Buffer";
          break;
        case 35053:
          result = "Pixel Pack Buffer Binding";
          break;
        case 35055:
          result = "Pixel Unpack Buffer Binding";
          break;
        case 35056:
          result = "Depth24 Stencil8";
          break;
        case 35057:
          result = "Size";
          break;
        case 35060:
          result = "Max Program Exec Instructions";
          break;
        case 35061:
          result = "Max Program Call Depth";
          break;
        case 35062:
          result = "Max Program If Depth";
          break;
        case 35063:
          result = "Max Program Loop Depth";
          break;
        case 35064:
          result = "Max Program Loop Count";
          break;
        case 35065:
          result = "Src1 Color";
          break;
        case 35066:
          result = "One Minus Src1 Color";
          break;
        case 35067:
          result = "One Minus Src1 Alpha";
          break;
        case 35068:
          result = "Max Dual Source Draw Buffers";
          break;
        case 35069:
          result = "Integer";
          break;
        case 35070:
          result = "Divisor";
          break;
        case 35071:
          result = "Max Array Texture Layers";
          break;
        case 35076:
          result = "Min Program Texel Offset";
          break;
        case 35077:
          result = "Max Program Texel Offset";
          break;
        case 35088:
          result = "Test Two Side";
          break;
        case 35089:
          result = "Active Stencil Face";
          break;
        case 35090:
          result = "Mirror Clamp To Border";
          break;
        case 35092:
          result = "Samples Passed";
          break;
        case 35094:
          result = "Geometry Vertices Out";
          break;
        case 35095:
          result = "Geometry Input Type";
          break;
        case 35096:
          result = "Geometry Output Type";
          break;
        case 35097:
          result = "Sampler Binding";
          break;
        case 35098:
          result = "Clamp Vertex Color";
          break;
        case 35099:
          result = "Clamp Fragment Color";
          break;
        case 35100:
          result = "Clamp Read Color";
          break;
        case 35101:
          result = "Fixed Only";
          break;
        case 35196:
          result = "Array Rev Comps In 4 Bytes";
          break;
        case 35210:
          result = "Size Array Type";
          break;
        case 35211:
          result = "Size Array Stride";
          break;
        case 35212:
          result = "Size Array Pointer";
          break;
        case 35213:
          result = "Modelview Matrix Float As Int Bits";
          break;
        case 35214:
          result = "Projection Matrix Float As Int Bits";
          break;
        case 35215:
          result = "Matrix Float As Int Bits";
          break;
        case 35328:
          result = "Vertex Attrib Map1";
          break;
        case 35329:
          result = "Vertex Attrib Map2";
          break;
        case 35330:
          result = "Vertex Attrib Map1 Size";
          break;
        case 35331:
          result = "Vertex Attrib Map1 Coeff";
          break;
        case 35332:
          result = "Vertex Attrib Map1 Order";
          break;
        case 35333:
          result = "Vertex Attrib Map1 Domain";
          break;
        case 35334:
          result = "Vertex Attrib Map2 Size";
          break;
        case 35335:
          result = "Vertex Attrib Map2 Coeff";
          break;
        case 35336:
          result = "Vertex Attrib Map2 Order";
          break;
        case 35337:
          result = "Vertex Attrib Map2 Domain";
          break;
        case 35338:
          result = "Draw Pixels";
          break;
        case 35339:
          result = "Fence";
          break;
        case 35340:
          result = "Element Array";
          break;
        case 35341:
          result = "Element Array Type";
          break;
        case 35342:
          result = "Element Array Pointer";
          break;
        case 35343:
          result = "Float";
          break;
        case 35344:
          result = "Min Pbuffer Viewport Dims";
          break;
        case 35345:
          result = "Uniform Buffer";
          break;
        case 35346:
          result = "Serialized Modify";
          break;
        case 35347:
          result = "Flushing Unmap";
          break;
        case 35348:
          result = "Aux Depth Stencil";
          break;
        case 35349:
          result = "Pack Row Bytes";
          break;
        case 35350:
          result = "Unpack Row Bytes";
          break;
        case 35351:
          result = "Pack Image Bytes";
          break;
        case 35352:
          result = "Unpack Image Bytes";
          break;
        case 35353:
          result = "Released";
          break;
        case 35354:
          result = "Volatile";
          break;
        case 35355:
          result = "Retained";
          break;
        case 35356:
          result = "Undefined";
          break;
        case 35357:
          result = "Purgeable";
          break;
        case 35358:
          result = "Private Extensions";
          break;
        case 35359:
          result = "RGB 422";
          break;
        case 35366:
          result = "Vertex Point Size";
          break;
        case 35367:
          result = "Current Point Size";
          break;
        case 35368:
          result = "Uniform Buffer Binding";
          break;
        case 35369:
          result = "Uniform Buffer Start";
          break;
        case 35370:
          result = "Uniform Buffer Size";
          break;
        case 35371:
          result = "Max Vertex Uniform Blocks";
          break;
        case 35372:
          result = "Max Geometry Uniform Blocks";
          break;
        case 35373:
          result = "Max Fragment Uniform Blocks";
          break;
        case 35374:
          result = "Max Combined Uniform Blocks";
          break;
        case 35375:
          result = "Max Uniform Buffer Bindings";
          break;
        case 35376:
          result = "Max Uniform Block Size";
          break;
        case 35377:
          result = "Max Combined Vertex Uniform Components";
          break;
        case 35378:
          result = "Max Combined Geometry Uniform Components";
          break;
        case 35379:
          result = "Max Combined Fragment Uniform Components";
          break;
        case 35380:
          result = "Uniform Buffer Offset Alignment";
          break;
        case 35381:
          result = "Active Uniform Block Max Name Length";
          break;
        case 35382:
          result = "Active Uniform Blocks";
          break;
        case 35383:
          result = "Uniform Type";
          break;
        case 35384:
          result = "Uniform Size";
          break;
        case 35385:
          result = "Uniform Name Length";
          break;
        case 35386:
          result = "Uniform Block Index";
          break;
        case 35387:
          result = "Uniform Offset";
          break;
        case 35388:
          result = "Uniform Array Stride";
          break;
        case 35389:
          result = "Uniform Matrix Stride";
          break;
        case 35390:
          result = "Uniform Is Row Major";
          break;
        case 35391:
          result = "Uniform Block Binding";
          break;
        case 35392:
          result = "Uniform Block Data Size";
          break;
        case 35393:
          result = "Uniform Block Name Length";
          break;
        case 35394:
          result = "Uniform Block Active Uniforms";
          break;
        case 35395:
          result = "Uniform Block Active Uniform Indices";
          break;
        case 35396:
          result = "Uniform Block Referenced By Vertex Shader";
          break;
        case 35397:
          result = "Uniform Block Referenced By Geometry Shader";
          break;
        case 35398:
          result = "Uniform Block Referenced By Fragment Shader";
          break;
        case 35400:
          result = "SRGB Decode";
          break;
        case 35401:
          result = "Decode";
          break;
        case 35402:
          result = "Skip Decode";
          break;
        case 35403:
          result = "Magic Mipmap";
          break;
        case 35407:
          result = "Program Pipeline Object";
          break;
        case 35408:
          result = "RGB Ycbcr 422";
          break;
        case 35409:
          result = "RGB Raw 422";
          break;
        case 35410:
          result = "Fragment Shader Discards Samples";
          break;
        case 35411:
          result = "Sync Object";
          break;
        case 35412:
          result = "PVRTC SRGB2";
          break;
        case 35413:
          result = "PVRTC SRGB4";
          break;
        case 35414:
          result = "PVRTC SRGBA2";
          break;
        case 35415:
          result = "PVRTC SRGBA4";
          break;
        case 35416:
          result = "Cubic";
          break;
        case 35417:
          result = "Cubic Mipmap Nearest";
          break;
        case 35418:
          result = "Cubic Mipmap Linear";
          break;
        case 35419:
          result = "Attachment Texture Target";
          break;
        case 35420:
          result = "ASTC RGBA 4x2";
          break;
        case 35421:
          result = "ASTC RGBA 8x4";
          break;
        case 35422:
          result = "ASTC sRGBA 4x2";
          break;
        case 35423:
          result = "ASTC sRGBA 8x4";
          break;
        case 35424:
          result = "Uniform Referenced By Vertex Shader";
          break;
        case 35425:
          result = "Uniform Referenced By Tess Control Shader";
          break;
        case 35426:
          result = "Uniform Referenced By Tess Eval Shader";
          break;
        case 35427:
          result = "Uniform Referenced By Geometry Shader";
          break;
        case 35428:
          result = "Uniform Referenced By Fragment Shader";
          break;
        case 35429:
          result = "Ycbcr8 420 2plane";
          break;
        case 35430:
          result = "Ycbcr8 422 1plane";
          break;
        case 35431:
          result = "Ycbcr8 422 2plane";
          break;
        case 35432:
          result = "Ycbcr8 444 2plane";
          break;
        case 35433:
          result = "Ycbcr10 444 1plane";
          break;
        case 35434:
          result = "Ycbcr10 422 2plane";
          break;
        case 35435:
          result = "Ycbcr10 420 2plane";
          break;
        case 35436:
          result = "Ycbcr10 444 2plane";
          break;
        case 35437:
          result = "SRGB Ycbcr8 420 2plane";
          break;
        case 35438:
          result = "SRGB Ycbcr8 422 1plane";
          break;
        case 35439:
          result = "SRGB Ycbcr8 422 2plane";
          break;
        case 35440:
          result = "SRGB Ycbcr8 444 2plane";
          break;
        case 35441:
          result = "SRGB Ycbcr10 444 1plane";
          break;
        case 35442:
          result = "SRGB Ycbcr10 422 2plane";
          break;
        case 35443:
          result = "SRGB Ycbcr10 420 2plane";
          break;
        case 35444:
          result = "SRGB Ycbcr10 444 2plane";
          break;
        case 35445:
          result = "Func Override Blend Source Color";
          break;
        case 35446:
          result = "Argbv16 Xr10";
          break;
        case 35447:
          result = "SRGB Argbv16 Xr10";
          break;
        case 35448:
          result = "Sr8";
          break;
        case 35449:
          result = "Tile Order Rot";
          break;
        case 35450:
          result = "Tile Order Rot 0";
          break;
        case 35451:
          result = "Tile Order Rot 90";
          break;
        case 35452:
          result = "Tile Order Rot 180";
          break;
        case 35453:
          result = "Tile Order Rot 270";
          break;
        case 35454:
          result = "Vertex Storage Memory Coherent";
          break;
        case 35455:
          result = "Storage Memory Coherent";
          break;
        case 35632:
          result = "Fragment Shader";
          break;
        case 35633:
          result = "Vertex Shader";
          break;
        case 35648:
          result = "Program Object";
          break;
        case 35656:
          result = "Shader Object";
          break;
        case 35657:
          result = "Max Fragment Uniform Components";
          break;
        case 35658:
          result = "Max Vertex Uniform Components";
          break;
        case 35659:
          result = "Max Varying Components";
          break;
        case 35660:
          result = "Max Vertex Texture Image Units";
          break;
        case 35661:
          result = "Max Combined Texture Image Units";
          break;
        case 35662:
          result = "Object Type";
          break;
        case 35663:
          result = "Shader Type";
          break;
        case 35664:
          result = "Float Vec2";
          break;
        case 35665:
          result = "Float Vec3";
          break;
        case 35666:
          result = "Float Vec4";
          break;
        case 35667:
          result = "Int Vec2";
          break;
        case 35668:
          result = "Int Vec3";
          break;
        case 35669:
          result = "Int Vec4";
          break;
        case 35670:
          result = "Bool";
          break;
        case 35671:
          result = "Bool Vec2";
          break;
        case 35672:
          result = "Bool Vec3";
          break;
        case 35673:
          result = "Bool Vec4";
          break;
        case 35674:
          result = "Float Mat2";
          break;
        case 35675:
          result = "Float Mat3";
          break;
        case 35676:
          result = "Float Mat4";
          break;
        case 35677:
          result = "Sampler 1D";
          break;
        case 35678:
          result = "Sampler 2D";
          break;
        case 35679:
          result = "Sampler 3D";
          break;
        case 35680:
          result = "Sampler Cube";
          break;
        case 35681:
          result = "Sampler 1D Shadow";
          break;
        case 35682:
          result = "Sampler 2D Shadow";
          break;
        case 35683:
          result = "Sampler 2D Rect";
          break;
        case 35684:
          result = "Sampler 2D Rect Shadow";
          break;
        case 35685:
          result = "Float Mat2x3";
          break;
        case 35686:
          result = "Float Mat2x4";
          break;
        case 35687:
          result = "Float Mat3x2";
          break;
        case 35688:
          result = "Float Mat3x4";
          break;
        case 35689:
          result = "Float Mat4x2";
          break;
        case 35690:
          result = "Float Mat4x3";
          break;
        case 35712:
          result = "Delete Status";
          break;
        case 35713:
          result = "Compile Status";
          break;
        case 35714:
          result = "Link Status";
          break;
        case 35715:
          result = "Validate Status";
          break;
        case 35716:
          result = "Info Log Length";
          break;
        case 35717:
          result = "Attached Shaders";
          break;
        case 35718:
          result = "Active Uniforms";
          break;
        case 35719:
          result = "Active Uniform Max Length";
          break;
        case 35720:
          result = "Shader Source Length";
          break;
        case 35721:
          result = "Active Attributes";
          break;
        case 35722:
          result = "Active Attribute Max Length";
          break;
        case 35723:
          result = "Fragment Shader Derivative Hint";
          break;
        case 35724:
          result = "Shading Language Version";
          break;
        case 35725:
          result = "Current Program";
          break;
        case 35728:
          result = "Palette4 RGB8";
          break;
        case 35729:
          result = "Palette4 RGBA8";
          break;
        case 35730:
          result = "Palette4 R5 G6 B5";
          break;
        case 35731:
          result = "Palette4 RGBA4";
          break;
        case 35732:
          result = "Palette4 RGB5 A1";
          break;
        case 35733:
          result = "Palette8 RGB8";
          break;
        case 35734:
          result = "Palette8 RGBA8";
          break;
        case 35735:
          result = "Palette8 R5 G6 B5";
          break;
        case 35736:
          result = "Palette8 RGBA4";
          break;
        case 35737:
          result = "Palette8 RGB5 A1";
          break;
        case 35738:
          result = "Implementation Color Read Type";
          break;
        case 35739:
          result = "Implementation Color Read Format";
          break;
        case 35740:
          result = "Size Array";
          break;
        case 35741:
          result = "Crop Rect";
          break;
        case 35742:
          result = "Matrix Index Array Buffer Binding";
          break;
        case 35743:
          result = "Size Array Buffer Binding";
          break;
        case 35840:
          result = "PVRTC RGB4";
          break;
        case 35841:
          result = "PVRTC RGB2";
          break;
        case 35842:
          result = "PVRTC RGBA4";
          break;
        case 35843:
          result = "PVRTC RGBA2";
          break;
        case 35856:
          result = "Red Type";
          break;
        case 35857:
          result = "Green Type";
          break;
        case 35858:
          result = "Blue Type";
          break;
        case 35859:
          result = "Alpha Type";
          break;
        case 35860:
          result = "Luminance Type";
          break;
        case 35861:
          result = "Intensity Type";
          break;
        case 35862:
          result = "Type";
          break;
        case 35863:
          result = "Unsigned Normalized";
          break;
        case 35864:
          result = "1D Array";
          break;
        case 35865:
          result = "Proxy Texture 1D Array";
          break;
        case 35866:
          result = "2D Array";
          break;
        case 35867:
          result = "Proxy Texture 2D Array";
          break;
        case 35868:
          result = "Binding 1D Array";
          break;
        case 35869:
          result = "Binding 2D Array";
          break;
        case 35881:
          result = "Max Geometry Texture Image Units";
          break;
        case 35882:
          result = "Buffer";
          break;
        case 35883:
          result = "Max Texture Buffer Size";
          break;
        case 35884:
          result = "Binding Buffer";
          break;
        case 35885:
          result = "Data Store Binding";
          break;
        case 35887:
          result = "Any Samples Passed";
          break;
        case 35894:
          result = "Shading";
          break;
        case 35895:
          result = "Min Sample Shading Value";
          break;
        case 35898:
          result = "R11f G11f B10f";
          break;
        case 35899:
          result = "Unsigned Int 10f 11f 11f Rev";
          break;
        case 35900:
          result = "RGBA Signed Components";
          break;
        case 35901:
          result = "RGB9 E5";
          break;
        case 35902:
          result = "Unsigned Int 5 9 9 9 Rev";
          break;
        case 35903:
          result = "Shared Size";
          break;
        case 35904:
          result = "SRGB";
          break;
        case 35905:
          result = "SRGB8";
          break;
        case 35906:
          result = "SRGB Alpha";
          break;
        case 35907:
          result = "SRGB8 Alpha8";
          break;
        case 35908:
          result = "Sluminance Alpha";
          break;
        case 35909:
          result = "Sluminance8 Alpha8";
          break;
        case 35910:
          result = "Sluminance";
          break;
        case 35911:
          result = "Sluminance8";
          break;
        case 35912:
          result = "Compressed SRGB";
          break;
        case 35913:
          result = "Compressed SRGB Alpha";
          break;
        case 35914:
          result = "Compressed Sluminance";
          break;
        case 35915:
          result = "Compressed Sluminance Alpha";
          break;
        case 35916:
          result = "Compressed SRGB S3TC DXT1";
          break;
        case 35917:
          result = "Compressed SRGB Alpha S3TC DXT1";
          break;
        case 35918:
          result = "Compressed SRGB Alpha S3TC DXT3";
          break;
        case 35919:
          result = "Compressed SRGB Alpha S3TC DXT5";
          break;
        case 35958:
          result = "Varying Max Length";
          break;
        case 35967:
          result = "Buffer Mode";
          break;
        case 35968:
          result = "Max Transform Feedback Separate Components";
          break;
        case 35971:
          result = "Varyings";
          break;
        case 35972:
          result = "Buffer Start";
          break;
        case 35973:
          result = "Buffer Size";
          break;
        case 35975:
          result = "Primitives Generated";
          break;
        case 35976:
          result = "Primitives Written";
          break;
        case 35977:
          result = "Rasterizer Discard";
          break;
        case 35978:
          result = "Max Transform Feedback Interleaved Components";
          break;
        case 35979:
          result = "Max Transform Feedback Separate Attribs";
          break;
        case 35980:
          result = "Interleaved Attribs";
          break;
        case 35981:
          result = "Separate Attribs";
          break;
        case 35982:
          result = "Buffer";
          break;
        case 35983:
          result = "Buffer Binding";
          break;
        case 36000:
          result = "Sprite Coord Origin";
          break;
        case 36001:
          result = "Lower Left";
          break;
        case 36002:
          result = "Upper Left";
          break;
        case 36003:
          result = "Back Ref";
          break;
        case 36004:
          result = "Back Value Mask";
          break;
        case 36005:
          result = "Back Writemask";
          break;
        case 36006:
          result = "Binding";
          break;
        case 36007:
          result = "Binding";
          break;
        case 36008:
          result = "Read Framebuffer";
          break;
        case 36009:
          result = "Draw Framebuffer";
          break;
        case 36010:
          result = "Read Framebuffer Binding";
          break;
        case 36011:
          result = "Samples";
          break;
        case 36012:
          result = "Depth Component32f";
          break;
        case 36013:
          result = "Depth32f Stencil8";
          break;
        case 36048:
          result = "Attachment Object Type";
          break;
        case 36049:
          result = "Attachment Object Name";
          break;
        case 36050:
          result = "Attachment Texture Level";
          break;
        case 36051:
          result = "Attachment Texture Cube Map Face";
          break;
        case 36052:
          result = "Attachment Texture Layer";
          break;
        case 36053:
          result = "Complete";
          break;
        case 36054:
          result = "Incomplete Attachment";
          break;
        case 36055:
          result = "Incomplete Missing Attachment";
          break;
        case 36057:
          result = "Incomplete Dimensions";
          break;
        case 36058:
          result = "Incomplete Formats";
          break;
        case 36059:
          result = "Incomplete Draw Buffer";
          break;
        case 36060:
          result = "Incomplete Read Buffer";
          break;
        case 36061:
          result = "Unsupported";
          break;
        case 36063:
          result = "Max Color Attachments";
          break;
        case 36064:
          result = "Color Attachment 0";
          break;
        case 36065:
          result = "Color Attachment 1";
          break;
        case 36066:
          result = "Color Attachment 2";
          break;
        case 36067:
          result = "Color Attachment 3";
          break;
        case 36068:
          result = "Color Attachment 4";
          break;
        case 36069:
          result = "Color Attachment 5";
          break;
        case 36070:
          result = "Color Attachment 6";
          break;
        case 36071:
          result = "Color Attachment 7";
          break;
        case 36072:
          result = "Color Attachment 8";
          break;
        case 36073:
          result = "Color Attachment 9";
          break;
        case 36074:
          result = "Color Attachment 10";
          break;
        case 36075:
          result = "Color Attachment 11";
          break;
        case 36076:
          result = "Color Attachment 12";
          break;
        case 36077:
          result = "Color Attachment 13";
          break;
        case 36078:
          result = "Color Attachment 14";
          break;
        case 36079:
          result = "Color Attachment 15";
          break;
        case 36096:
          result = "Depth Attachment";
          break;
        case 36128:
          result = "Stencil Attachment";
          break;
        case 36160:
          result = "Framebuffer";
          break;
        case 36161:
          result = "Renderbuffer";
          break;
        case 36162:
          result = "Width";
          break;
        case 36163:
          result = "Height";
          break;
        case 36164:
          result = "Internal Format";
          break;
        case 36166:
          result = "Stencil Index1";
          break;
        case 36167:
          result = "Stencil Index4";
          break;
        case 36168:
          result = "Stencil Index8";
          break;
        case 36169:
          result = "Stencil Index16";
          break;
        case 36176:
          result = "Red Size";
          break;
        case 36177:
          result = "Green Size";
          break;
        case 36178:
          result = "Blue Size";
          break;
        case 36179:
          result = "Alpha Size";
          break;
        case 36180:
          result = "Size";
          break;
        case 36181:
          result = "Size";
          break;
        case 36182:
          result = "Incomplete Multisample";
          break;
        case 36183:
          result = "Max Samples";
          break;
        case 36193:
          result = "Half Float";
          break;
        case 36194:
          result = "RGB565";
          break;
        case 36201:
          result = "Primitive Restart Fixed Index";
          break;
        case 36202:
          result = "Any Samples Passed Conservative";
          break;
        case 36203:
          result = "Max Element Index";
          break;
        case 36208:
          result = "RGBA32ui";
          break;
        case 36209:
          result = "RGB32ui";
          break;
        case 36210:
          result = "Alpha32ui";
          break;
        case 36211:
          result = "Intensity32ui";
          break;
        case 36212:
          result = "Luminance32ui";
          break;
        case 36213:
          result = "Luminance Alpha32ui";
          break;
        case 36214:
          result = "RGBA16ui";
          break;
        case 36215:
          result = "RGB16ui";
          break;
        case 36216:
          result = "Alpha16ui";
          break;
        case 36217:
          result = "Intensity16ui";
          break;
        case 36218:
          result = "Luminance16ui";
          break;
        case 36219:
          result = "Luminance Alpha16ui";
          break;
        case 36220:
          result = "RGBA8ui";
          break;
        case 36221:
          result = "RGB8ui";
          break;
        case 36222:
          result = "Alpha8ui";
          break;
        case 36223:
          result = "Intensity8ui";
          break;
        case 36224:
          result = "Luminance8ui";
          break;
        case 36225:
          result = "Luminance Alpha8ui";
          break;
        case 36226:
          result = "RGBA32i";
          break;
        case 36227:
          result = "RGB32i";
          break;
        case 36228:
          result = "Alpha32i";
          break;
        case 36229:
          result = "Intensity32i";
          break;
        case 36230:
          result = "Luminance32i";
          break;
        case 36231:
          result = "Luminance Alpha32i";
          break;
        case 36232:
          result = "RGBA16i";
          break;
        case 36233:
          result = "RGB16i";
          break;
        case 36234:
          result = "Alpha16i";
          break;
        case 36235:
          result = "Intensity16i";
          break;
        case 36236:
          result = "Luminance16i";
          break;
        case 36237:
          result = "Luminance Alpha16i";
          break;
        case 36238:
          result = "RGBA8i";
          break;
        case 36239:
          result = "RGB8i";
          break;
        case 36240:
          result = "Alpha8i";
          break;
        case 36241:
          result = "Intensity8i";
          break;
        case 36242:
          result = "Luminance8i";
          break;
        case 36243:
          result = "Luminance Alpha8i";
          break;
        case 36244:
          result = "Red Integer";
          break;
        case 36245:
          result = "Green Integer";
          break;
        case 36246:
          result = "Blue Integer";
          break;
        case 36247:
          result = "Alpha Integer";
          break;
        case 36248:
          result = "RGB Integer";
          break;
        case 36249:
          result = "RGBA Integer";
          break;
        case 36250:
          result = "BGR Integer";
          break;
        case 36251:
          result = "BGRA Integer";
          break;
        case 36252:
          result = "Luminance Integer";
          break;
        case 36253:
          result = "Luminance Alpha Integer";
          break;
        case 36254:
          result = "RGBA Integer Mode";
          break;
        case 36255:
          result = "Int 2 10 10 10 Rev";
          break;
        case 36263:
          result = "Attachment Layered";
          break;
        case 36264:
          result = "Incomplete Layer Targets";
          break;
        case 36265:
          result = "Incomplete Layer Count";
          break;
        case 36269:
          result = "Float 32 Unsigned Int 24 8 Rev";
          break;
        case 36270:
          result = "Shader Include";
          break;
        case 36281:
          result = "SRGB";
          break;
        case 36282:
          result = "SRGB Capable";
          break;
        case 36283:
          result = "Compressed Red RGTC1";
          break;
        case 36284:
          result = "Compressed Signed Red RGTC1";
          break;
        case 36285:
          result = "Compressed RG RGTC2";
          break;
        case 36286:
          result = "Compressed Signed RG RGTC2";
          break;
        case 36288:
          result = "Sampler 1D Array";
          break;
        case 36289:
          result = "Sampler 2D Array";
          break;
        case 36290:
          result = "Sampler Buffer";
          break;
        case 36291:
          result = "Sampler 1D Array Shadow";
          break;
        case 36292:
          result = "Sampler 2D Array Shadow";
          break;
        case 36293:
          result = "Sampler Cube Shadow";
          break;
        case 36294:
          result = "Unsigned Int Vec2";
          break;
        case 36295:
          result = "Unsigned Int Vec3";
          break;
        case 36296:
          result = "Unsigned Int Vec4";
          break;
        case 36297:
          result = "Int Sampler 1D";
          break;
        case 36298:
          result = "Int Sampler 2D";
          break;
        case 36299:
          result = "Int Sampler 3D";
          break;
        case 36300:
          result = "Int Sampler Cube";
          break;
        case 36301:
          result = "Int Sampler 2D Rect";
          break;
        case 36302:
          result = "Int Sampler 1D Array";
          break;
        case 36303:
          result = "Int Sampler 2D Array";
          break;
        case 36304:
          result = "Int Sampler Buffer";
          break;
        case 36305:
          result = "Unsigned Int Sampler 1D";
          break;
        case 36306:
          result = "Unsigned Int Sampler 2D";
          break;
        case 36307:
          result = "Unsigned Int Sampler 3D";
          break;
        case 36308:
          result = "Unsigned Int Sampler Cube";
          break;
        case 36309:
          result = "Unsigned Int Sampler 2D Rect";
          break;
        case 36310:
          result = "Unsigned Int Sampler 1D Array";
          break;
        case 36311:
          result = "Unsigned Int Sampler 2D Array";
          break;
        case 36312:
          result = "Unsigned Int Sampler Buffer";
          break;
        case 36313:
          result = "Geometry Shader";
          break;
        case 36314:
          result = "Geometry Vertices Out";
          break;
        case 36315:
          result = "Geometry Input Type";
          break;
        case 36316:
          result = "Geometry Output Type";
          break;
        case 36317:
          result = "Max Geometry Varying Components";
          break;
        case 36318:
          result = "Max Vertex Varying Components";
          break;
        case 36319:
          result = "Max Geometry Uniform Components";
          break;
        case 36320:
          result = "Max Geometry Output Vertices";
          break;
        case 36321:
          result = "Max Geometry Total Output Components";
          break;
        case 36322:
          result = "Max Vertex Bindable Uniforms";
          break;
        case 36323:
          result = "Max Fragment Bindable Uniforms";
          break;
        case 36324:
          result = "Max Geometry Bindable Uniforms";
          break;
        case 36325:
          result = "Active Subroutines";
          break;
        case 36326:
          result = "Active Subroutine Uniforms";
          break;
        case 36327:
          result = "Max Subroutines";
          break;
        case 36328:
          result = "Max Subroutine Uniform Locations";
          break;
        case 36329:
          result = "Named String Length";
          break;
        case 36330:
          result = "Named String Type";
          break;
        case 36333:
          result = "Max Bindable Uniform Size";
          break;
        case 36334:
          result = "Uniform Buffer";
          break;
        case 36335:
          result = "Uniform Buffer Binding";
          break;
        case 36336:
          result = "Low Float";
          break;
        case 36337:
          result = "Medium Float";
          break;
        case 36338:
          result = "High Float";
          break;
        case 36339:
          result = "Low Int";
          break;
        case 36340:
          result = "Medium Int";
          break;
        case 36341:
          result = "High Int";
          break;
        case 36344:
          result = "Shader Binary Formats";
          break;
        case 36345:
          result = "Num Shader Binary Formats";
          break;
        case 36346:
          result = "Shader Compiler";
          break;
        case 36347:
          result = "Max Vertex Uniform Vectors";
          break;
        case 36348:
          result = "Max Varying Vectors";
          break;
        case 36349:
          result = "Max Fragment Uniform Vectors";
          break;
        case 36371:
          result = "Query Wait";
          break;
        case 36372:
          result = "Query No Wait";
          break;
        case 36373:
          result = "Query By Region Wait";
          break;
        case 36374:
          result = "Query By Region No Wait";
          break;
        case 36382:
          result = "Max Combined Tess Control Uniform Components";
          break;
        case 36383:
          result = "Max Combined Tess Evaluation Uniform Components";
          break;
        case 36386:
          result = "Transform Feedback";
          break;
        case 36387:
          result = "Paused";
          break;
        case 36388:
          result = "Active";
          break;
        case 36389:
          result = "Binding";
          break;
        case 36392:
          result = "Timestamp";
          break;
        case 36418:
          result = "Swizzle R";
          break;
        case 36419:
          result = "Swizzle G";
          break;
        case 36420:
          result = "Swizzle B";
          break;
        case 36421:
          result = "Swizzle A";
          break;
        case 36422:
          result = "Swizzle RGBA";
          break;
        case 36423:
          result = "Active Subroutine Uniform Locations";
          break;
        case 36424:
          result = "Active Subroutine Max Length";
          break;
        case 36425:
          result = "Active Subroutine Uniform Max Length";
          break;
        case 36426:
          result = "Num Compatible Subroutines";
          break;
        case 36427:
          result = "Compatible Subroutines";
          break;
        case 36428:
          result = "Quads Follow Provoking Vertex Convention";
          break;
        case 36429:
          result = "First Vertex Convention";
          break;
        case 36430:
          result = "Last Vertex Convention";
          break;
        case 36431:
          result = "Provoking Vertex";
          break;
        case 36432:
          result = "Position";
          break;
        case 36433:
          result = "Mask";
          break;
        case 36434:
          result = "Mask Value";
          break;
        case 36441:
          result = "Max Sample Mask Words";
          break;
        case 36442:
          result = "Max Geometry Shader Invocations";
          break;
        case 36443:
          result = "Min Fragment Interpolation Offset";
          break;
        case 36444:
          result = "Max Fragment Interpolation Offset";
          break;
        case 36445:
          result = "Fragment Interpolation Offset Bits";
          break;
        case 36446:
          result = "Min Program Texture Gather Offset";
          break;
        case 36447:
          result = "Max Program Texture Gather Offset";
          break;
        case 36464:
          result = "Max Transform Feedback Buffers";
          break;
        case 36465:
          result = "Max Vertex Streams";
          break;
        case 36466:
          result = "Patch Vertices";
          break;
        case 36467:
          result = "Patch Default Inner Level";
          break;
        case 36468:
          result = "Patch Default Outer Level";
          break;
        case 36469:
          result = "Tess Control Output Vertices";
          break;
        case 36470:
          result = "Tess Gen Mode";
          break;
        case 36471:
          result = "Tess Gen Spacing";
          break;
        case 36472:
          result = "Tess Gen Vertex Order";
          break;
        case 36473:
          result = "Tess Gen Point Mode";
          break;
        case 36474:
          result = "Isolines";
          break;
        case 36475:
          result = "Fractional Odd";
          break;
        case 36476:
          result = "Fractional Even";
          break;
        case 36477:
          result = "Max Patch Vertices";
          break;
        case 36478:
          result = "Max Tess Gen Level";
          break;
        case 36479:
          result = "Max Tess Control Uniform Components";
          break;
        case 36480:
          result = "Max Tess Evaluation Uniform Components";
          break;
        case 36481:
          result = "Max Tess Control Texture Image Units";
          break;
        case 36482:
          result = "Max Tess Evaluation Texture Image Units";
          break;
        case 36483:
          result = "Max Tess Control Output Components";
          break;
        case 36484:
          result = "Max Tess Patch Components";
          break;
        case 36485:
          result = "Max Tess Control Total Output Components";
          break;
        case 36486:
          result = "Max Tess Evaluation Output Components";
          break;
        case 36487:
          result = "Tess Evaluation Shader";
          break;
        case 36488:
          result = "Tess Control Shader";
          break;
        case 36489:
          result = "Max Tess Control Uniform Blocks";
          break;
        case 36490:
          result = "Max Tess Evaluation Uniform Blocks";
          break;
        case 36662:
          result = "Copy Read Buffer";
          break;
        case 36663:
          result = "Copy Write Buffer";
          break;
        case 36671:
          result = "Draw Indirect Buffer";
          break;
        case 36675:
          result = "Draw Indirect Buffer Binding";
          break;
        case 36678:
          result = "Double Mat2";
          break;
        case 36679:
          result = "Double Mat3";
          break;
        case 36680:
          result = "Double Mat4";
          break;
        case 36681:
          result = "Double Mat2x3";
          break;
        case 36682:
          result = "Double Mat2x4";
          break;
        case 36683:
          result = "Double Mat3x2";
          break;
        case 36684:
          result = "Double Mat3x4";
          break;
        case 36685:
          result = "Double Mat4x2";
          break;
        case 36686:
          result = "Double Mat4x3";
          break;
        case 36756:
          result = "R8 Snorm";
          break;
        case 36757:
          result = "RG8 Snorm";
          break;
        case 36758:
          result = "RGB8 Snorm";
          break;
        case 36759:
          result = "RGBA8 Snorm";
          break;
        case 36760:
          result = "R16 Snorm";
          break;
        case 36761:
          result = "RG16 Snorm";
          break;
        case 36762:
          result = "RGB16 Snorm";
          break;
        case 36763:
          result = "RGBA16 Snorm";
          break;
        case 36764:
          result = "Signed Normalized";
          break;
        case 36765:
          result = "Primitive Restart";
          break;
        case 36766:
          result = "Primitive Restart Index";
          break;
        case 36767:
          result = "Max Program Texture Gather Components";
          break;
        case 36860:
          result = "Double Vec2";
          break;
        case 36861:
          result = "Double Vec3";
          break;
        case 36862:
          result = "Double Vec4";
          break;
        case 36873:
          result = "Cube Map Array";
          break;
        case 36874:
          result = "Binding Cube Map Array";
          break;
        case 36875:
          result = "Proxy Texture Cube Map Array";
          break;
        case 36876:
          result = "Sampler Cube Map Array";
          break;
        case 36877:
          result = "Sampler Cube Map Array Shadow";
          break;
        case 36878:
          result = "Int Sampler Cube Map Array";
          break;
        case 36879:
          result = "Unsigned Int Sampler Cube Map Array";
          break;
        case 36975:
          result = "RGB10 A2ui";
          break;
        case 37050:
          result = "Scaled Resolve Fastest";
          break;
        case 37051:
          result = "Scaled Resolve Nicest";
          break;
        case 37120:
          result = "2D Multisample";
          break;
        case 37121:
          result = "Proxy Texture 2D Multisample";
          break;
        case 37122:
          result = "2D Multisample Array";
          break;
        case 37123:
          result = "Proxy Texture 2D Multisample Array";
          break;
        case 37124:
          result = "Binding 2D Multisample";
          break;
        case 37125:
          result = "Binding 2D Multisample Array";
          break;
        case 37126:
          result = "Samples";
          break;
        case 37127:
          result = "Fixed Sample Locations";
          break;
        case 37128:
          result = "Sampler 2D Multisample";
          break;
        case 37129:
          result = "Int Sampler 2D Multisample";
          break;
        case 37130:
          result = "Unsigned Int Sampler 2D Multisample";
          break;
        case 37131:
          result = "Sampler 2D Multisample Array";
          break;
        case 37132:
          result = "Int Sampler 2D Multisample Array";
          break;
        case 37133:
          result = "Unsigned Int Sampler 2D Multisample Array";
          break;
        case 37134:
          result = "Max Color Texture Samples";
          break;
        case 37135:
          result = "Max Depth Texture Samples";
          break;
        case 37136:
          result = "Max Integer Samples";
          break;
        case 37137:
          result = "Max Server Wait Timeout";
          break;
        case 37138:
          result = "Object Type";
          break;
        case 37139:
          result = "Sync Condition";
          break;
        case 37140:
          result = "Sync Status";
          break;
        case 37141:
          result = "Sync Flags";
          break;
        case 37142:
          result = "Sync Fence";
          break;
        case 37143:
          result = "Sync Gpu Commands Complete";
          break;
        case 37144:
          result = "Unsignaled";
          break;
        case 37145:
          result = "Signaled";
          break;
        case 37146:
          result = "Already Signaled";
          break;
        case 37147:
          result = "Timeout Expired";
          break;
        case 37148:
          result = "Condition Satisfied";
          break;
        case 37149:
          result = "Wait Failed";
          break;
        case 37151:
          result = "Access Flags";
          break;
        case 37152:
          result = "Map Length";
          break;
        case 37153:
          result = "Map Offset";
          break;
        case 37154:
          result = "Max Vertex Output Components";
          break;
        case 37155:
          result = "Max Geometry Input Components";
          break;
        case 37156:
          result = "Max Geometry Output Components";
          break;
        case 37157:
          result = "Max Fragment Input Components";
          break;
        case 37158:
          result = "Context Profile Mask";
          break;
        case 37167:
          result = "Immutable Format";
          break;
        case 37201:
          result = "Object";
          break;
        case 37203:
          result = "Query Object";
          break;
        case 37204:
          result = "Vertex Array Object";
          break;
        case 37488:
          result = "EAC R11ui";
          break;
        case 37489:
          result = "EAC R11i";
          break;
        case 37490:
          result = "EAC RG11ui";
          break;
        case 37491:
          result = "EAC RG11i";
          break;
        case 37492:
          result = "ETC2 RGB";
          break;
        case 37493:
          result = "ETC2 SRGB";
          break;
        case 37494:
          result = "ETC2 RGB A1";
          break;
        case 37495:
          result = "ETC2 SRGB A1";
          break;
        case 37496:
          result = "ETC2 RGBA";
          break;
        case 37497:
          result = "ETC2 SRGBA";
          break;
        case 37760:
          result = "Num Sample Counts";
          break;
        case 37793:
          result = "BGRA8";
          break;
        case 37808:
          result = "ASTC RGBA 4x4";
          break;
        case 37809:
          result = "ASTC RGBA 5x4";
          break;
        case 37810:
          result = "ASTC RGBA 5x5";
          break;
        case 37811:
          result = "ASTC RGBA 6x5";
          break;
        case 37812:
          result = "ASTC RGBA 6x6";
          break;
        case 37813:
          result = "ASTC RGBA 8x5";
          break;
        case 37814:
          result = "ASTC RGBA 8x6";
          break;
        case 37815:
          result = "ASTC RGBA 8x8";
          break;
        case 37816:
          result = "ASTC RGBA 10x5";
          break;
        case 37817:
          result = "ASTC RGBA 10x6";
          break;
        case 37818:
          result = "ASTC RGBA 10x8";
          break;
        case 37819:
          result = "ASTC RGBA 10x10";
          break;
        case 37820:
          result = "ASTC RGBA 12x10";
          break;
        case 37821:
          result = "ASTC RGBA 12x12";
          break;
        case 37840:
          result = "ASTC sRGBA 4x4";
          break;
        case 37841:
          result = "ASTC sRGBA 5x4";
          break;
        case 37842:
          result = "ASTC sRGBA 5x5";
          break;
        case 37843:
          result = "ASTC sRGBA 6x5";
          break;
        case 37844:
          result = "ASTC sRGBA 6x6";
          break;
        case 37845:
          result = "ASTC sRGBA 8x5";
          break;
        case 37846:
          result = "ASTC sRGBA 8x6";
          break;
        case 37847:
          result = "ASTC sRGBA 8x8";
          break;
        case 37848:
          result = "ASTC sRGBA 10x5";
          break;
        case 37849:
          result = "ASTC sRGBA 10x6";
          break;
        case 37850:
          result = "ASTC sRGBA 10x8";
          break;
        case 37851:
          result = "ASTC sRGBA 10x10";
          break;
        case 37852:
          result = "ASTC sRGBA 12x10";
          break;
        case 37853:
          result = "ASTC sRGBA 12x12";
          break;
        case 37874:
          result = "Xrsrgb10";
          break;
        case 37875:
          result = "Ycbcr10 422 2plane Packed";
          break;
        case 37876:
          result = "Ycbcr10 420 2plane Packed";
          break;
        case 37877:
          result = "Ycbcr10 444 2plane Packed";
          break;
        case 37878:
          result = "SRGB Ycbcr10 422 2plane Packed";
          break;
        case 37879:
          result = "SRGB Ycbcr10 420 2plane Packed";
          break;
        case 37880:
          result = "SRGB Ycbcr10 444 2plane Packed";
          break;
        case 37881:
          result = "Xrsrgb10 Plane A8 Plane";
          break;
        case 37882:
          result = "Unsigned Int 2 10 10 10 Plane Unsigned Byte Plane";
          break;
        case 37883:
          result = "RGB8 420 2plane";
          break;
        case 37884:
          result = "RGB8 422 2plane";
          break;
        case 37885:
          result = "RGB8 444 2plane";
          break;
        case 37886:
          result = "ASTC RGBA 4x2 LowPrecision";
          break;
        case 37887:
          result = "ASTC RGBA 4x4 LowPrecision";
          break;
        case 37888:
          result = "ASTC RGBA 5x4 LowPrecision";
          break;
        case 37889:
          result = "ASTC RGBA 5x5 LowPrecision";
          break;
        case 37890:
          result = "ASTC RGBA 6x5 LowPrecision";
          break;
        case 37891:
          result = "ASTC RGBA 6x6 LowPrecision";
          break;
        case 37892:
          result = "ASTC RGBA 8x4 LowPrecision";
          break;
        case 37893:
          result = "ASTC RGBA 8x5 LowPrecision";
          break;
        case 37894:
          result = "ASTC RGBA 8x6 LowPrecision";
          break;
        case 37895:
          result = "ASTC RGBA 8x8 LowPrecision";
          break;
        case 37896:
          result = "ASTC RGBA 10x5 LowPrecision";
          break;
        case 37897:
          result = "ASTC RGBA 10x6 LowPrecision";
          break;
        case 37898:
          result = "ASTC RGBA 10x8 LowPrecision";
          break;
        case 37899:
          result = "ASTC RGBA 10x10 LowPrecision";
          break;
        case 37900:
          result = "ASTC RGBA 12x10 LowPrecision";
          break;
        case 37901:
          result = "ASTC RGBA 12x12 LowPrecision";
          break;
        default:
          return 0;
      }
      return result;
    }
    if (a1 < 0x80000)
    {
      if (a1 == 0x10000)
        return "Eval Bit";
      if (a1 == 0x20000)
        return "List Bit";
      if (a1 != 0x40000)
        return 0;
      return "Bit";
    }
    switch(a1)
    {
      case 0x80000:
        return "Bit";
      case 0xFFFFF:
        return "All Attrib Bits";
      case 0x20000000:
        return "Multisample Bit";
    }
    return 0;
  }
  if (a1 > 4095)
  {
    if (a1 <= 7167)
    {
      if (a1 > 5631)
      {
        if (a1 <= 6399)
        {
          if (a1 > 5888)
          {
            if (a1 <= 6143)
            {
              if (a1 == 5889)
                return "Projection";
              if (a1 == 5890)
                return "Texture";
            }
            else
            {
              switch(a1)
              {
                case 6144:
                  return "Color";
                case 6145:
                  return "Depth";
                case 6146:
                  return "Stencil";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 5632:
              result = "Emission";
              break;
            case 5633:
              result = "Shininess";
              break;
            case 5634:
              result = "Ambient And Diffuse";
              break;
            case 5635:
              result = "Indexes";
              break;
            default:
              if (a1 != 5888)
                return 0;
              result = "Modelview";
              break;
          }
        }
        else
        {
          if (a1 > 6655)
          {
            if (a1 > 6912)
            {
              if (a1 == 6913)
                return "Line";
              if (a1 == 6914)
                return "Fill";
            }
            else
            {
              if (a1 == 6656)
                return "Bitmap";
              if (a1 == 6912)
                return "Point";
            }
            return 0;
          }
          switch(a1)
          {
            case 6400:
              result = "Index";
              break;
            case 6401:
              result = "Stencil Index";
              break;
            case 6402:
              result = "Depth Component";
              break;
            case 6403:
              result = "Red";
              break;
            case 6404:
              result = "Green";
              break;
            case 6405:
              result = "Blue";
              break;
            case 6406:
              result = "Alpha";
              break;
            case 6407:
              result = "RGB";
              break;
            case 6408:
              result = "RGBA";
              break;
            case 6409:
              result = "Luminance";
              break;
            case 6410:
              result = "Luminance Alpha";
              break;
            default:
              return 0;
          }
        }
      }
      else if (a1 <= 4863)
      {
        if (a1 <= 4353)
        {
          switch(a1)
          {
            case 4096:
              return "Width";
            case 4097:
              return "Height";
            case 4098:
              return 0;
            case 4099:
              return "Internal Format";
            case 4100:
              return "Border Color";
            case 4101:
              return "Border";
            default:
              if (a1 == 4352)
              {
                result = "Dont Care";
              }
              else
              {
                if (a1 != 4353)
                  return 0;
                result = "Fastest";
              }
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 4608:
              result = "Ambient";
              break;
            case 4609:
              result = "Diffuse";
              break;
            case 4610:
              result = "Specular";
              break;
            case 4611:
              result = "Position";
              break;
            case 4612:
              result = "Spot Direction";
              break;
            case 4613:
              result = "Spot Exponent";
              break;
            case 4614:
              result = "Spot Cutoff";
              break;
            case 4615:
              result = "Constant Attenuation";
              break;
            case 4616:
              result = "Linear Attenuation";
              break;
            case 4617:
              result = "Quadratic Attenuation";
              break;
            default:
              if (a1 != 4354)
                return 0;
              result = "Nicest";
              break;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 5120:
            return "Byte";
          case 5121:
            return "Unsigned Byte";
          case 5122:
            return "Short";
          case 5123:
            return "Unsigned Short";
          case 5124:
            return "Int";
          case 5125:
            return "Unsigned Int";
          case 5126:
            return "Float";
          case 5127:
            return "2 Bytes";
          case 5128:
            return "3 Bytes";
          case 5129:
            return "4 Bytes";
          case 5130:
            return "Double";
          case 5131:
            return "Half Float";
          case 5132:
            return "Fixed";
          case 5133:
          case 5134:
          case 5135:
          case 5136:
          case 5137:
          case 5138:
          case 5139:
          case 5140:
          case 5141:
          case 5142:
          case 5143:
          case 5144:
          case 5145:
          case 5146:
          case 5147:
          case 5148:
          case 5149:
          case 5150:
          case 5151:
          case 5152:
          case 5153:
          case 5154:
          case 5155:
          case 5156:
          case 5157:
          case 5158:
          case 5159:
          case 5160:
          case 5161:
          case 5162:
          case 5163:
          case 5164:
          case 5165:
          case 5166:
          case 5167:
          case 5168:
          case 5169:
          case 5170:
          case 5171:
          case 5172:
          case 5173:
          case 5174:
          case 5175:
          case 5176:
          case 5177:
          case 5178:
          case 5179:
          case 5180:
          case 5181:
          case 5182:
          case 5183:
          case 5184:
          case 5185:
          case 5186:
          case 5187:
          case 5188:
          case 5189:
          case 5190:
          case 5191:
          case 5192:
          case 5193:
          case 5194:
          case 5195:
          case 5196:
          case 5197:
          case 5198:
          case 5199:
          case 5200:
          case 5201:
          case 5202:
          case 5203:
          case 5204:
          case 5205:
          case 5206:
          case 5207:
          case 5208:
          case 5209:
          case 5210:
          case 5211:
          case 5212:
          case 5213:
          case 5214:
          case 5215:
          case 5216:
          case 5217:
          case 5218:
          case 5219:
          case 5220:
          case 5221:
          case 5222:
          case 5223:
          case 5224:
          case 5225:
          case 5226:
          case 5227:
          case 5228:
          case 5229:
          case 5230:
          case 5231:
          case 5232:
          case 5233:
          case 5234:
          case 5235:
          case 5236:
          case 5237:
          case 5238:
          case 5239:
          case 5240:
          case 5241:
          case 5242:
          case 5243:
          case 5244:
          case 5245:
          case 5246:
          case 5247:
          case 5248:
          case 5249:
          case 5250:
          case 5251:
          case 5252:
          case 5253:
          case 5254:
          case 5255:
          case 5256:
          case 5257:
          case 5258:
          case 5259:
          case 5260:
          case 5261:
          case 5262:
          case 5263:
          case 5264:
          case 5265:
          case 5266:
          case 5267:
          case 5268:
          case 5269:
          case 5270:
          case 5271:
          case 5272:
          case 5273:
          case 5274:
          case 5275:
          case 5276:
          case 5277:
          case 5278:
          case 5279:
          case 5280:
          case 5281:
          case 5282:
          case 5283:
          case 5284:
          case 5285:
          case 5286:
          case 5287:
          case 5288:
          case 5289:
          case 5290:
          case 5291:
          case 5292:
          case 5293:
          case 5294:
          case 5295:
          case 5296:
          case 5297:
          case 5298:
          case 5299:
          case 5300:
          case 5301:
          case 5302:
          case 5303:
          case 5304:
          case 5305:
          case 5306:
          case 5307:
          case 5308:
          case 5309:
          case 5310:
          case 5311:
          case 5312:
          case 5313:
          case 5314:
          case 5315:
          case 5316:
          case 5317:
          case 5318:
          case 5319:
          case 5320:
          case 5321:
          case 5322:
          case 5323:
          case 5324:
          case 5325:
          case 5326:
          case 5327:
          case 5328:
          case 5329:
          case 5330:
          case 5331:
          case 5332:
          case 5333:
          case 5334:
          case 5335:
          case 5336:
          case 5337:
          case 5338:
          case 5339:
          case 5340:
          case 5341:
          case 5342:
          case 5343:
          case 5344:
          case 5345:
          case 5346:
          case 5347:
          case 5348:
          case 5349:
          case 5350:
          case 5351:
          case 5352:
          case 5353:
          case 5354:
          case 5355:
          case 5356:
          case 5357:
          case 5358:
          case 5359:
          case 5360:
          case 5361:
          case 5362:
          case 5363:
          case 5364:
          case 5365:
          case 5366:
          case 5367:
          case 5368:
          case 5369:
          case 5370:
          case 5371:
          case 5372:
          case 5373:
          case 5374:
          case 5375:
            return 0;
          case 5376:
            return "Clear";
          case 5377:
            return "And";
          case 5378:
            return "And Reverse";
          case 5379:
            return "Copy";
          case 5380:
            return "And Inverted";
          case 5381:
            return "Noop";
          case 5382:
            return "Xor";
          case 5383:
            return "Or";
          case 5384:
            return "Nor";
          case 5385:
            return "Equiv";
          case 5386:
            return "Invert";
          case 5387:
            return "Or Reverse";
          case 5388:
            return "Copy Inverted";
          case 5389:
            return "Or Inverted";
          case 5390:
            return "Nand";
          case 5391:
            return "Set";
          default:
            if (a1 == 4864)
            {
              result = "Compile";
            }
            else
            {
              if (a1 != 4865)
                return 0;
              result = "Compile And Execute";
            }
            break;
        }
      }
    }
    else if (a1 > 10494)
    {
      if (a1 <= 10751)
      {
        switch(a1)
        {
          case 10495:
            return "Subimage Sync";
          case 10496:
            return "Clamp";
          case 10497:
            return "Repeat";
        }
        return 0;
      }
      switch(a1)
      {
        case 10752:
          result = "Units";
          break;
        case 10753:
          result = "Point";
          break;
        case 10754:
          result = "Line";
          break;
        case 10755:
        case 10756:
        case 10757:
        case 10758:
        case 10759:
        case 10760:
        case 10761:
        case 10762:
        case 10763:
        case 10764:
        case 10765:
        case 10766:
        case 10767:
        case 10769:
        case 10770:
        case 10771:
        case 10772:
        case 10773:
        case 10774:
        case 10775:
        case 10776:
        case 10777:
        case 10778:
        case 10779:
        case 10780:
        case 10781:
        case 10782:
        case 10783:
          return 0;
        case 10768:
          result = "R3 G3 B2";
          break;
        case 10784:
          result = "V2f";
          break;
        case 10785:
          result = "V3f";
          break;
        case 10786:
          result = "C4ub V2f";
          break;
        case 10787:
          result = "C4ub V3f";
          break;
        case 10788:
          result = "C3f V3f";
          break;
        case 10789:
          result = "N3f V3f";
          break;
        case 10790:
          result = "C4f N3f V3f";
          break;
        case 10791:
          result = "T2f V3f";
          break;
        case 10792:
          result = "T4f V4f";
          break;
        case 10793:
          result = "T2f C4ub V3f";
          break;
        case 10794:
          result = "T2f C3f V3f";
          break;
        case 10795:
          result = "T2f N3f V3f";
          break;
        case 10796:
          result = "T2f C4f N3f V3f";
          break;
        case 10797:
          result = "T4f C4f N3f V4f";
          break;
        default:
          switch(a1)
          {
            case 12288:
              result = "Clip Distance 0";
              break;
            case 12289:
              result = "Clip Distance 1";
              break;
            case 12290:
              result = "Clip Distance 2";
              break;
            case 12291:
              result = "Clip Distance 3";
              break;
            case 12292:
              result = "Clip Distance 4";
              break;
            case 12293:
              result = "Clip Distance 5";
              break;
            case 12294:
              result = "Clip Distance 6";
              break;
            case 12295:
              result = "Clip Distance 7";
              break;
            default:
              switch(a1)
              {
                case 16384:
                  result = "Light 0";
                  break;
                case 16385:
                  result = "Light 1";
                  break;
                case 16386:
                  result = "Light 2";
                  break;
                case 16387:
                  result = "Light 3";
                  break;
                case 16388:
                  result = "Light 4";
                  break;
                case 16389:
                  result = "Light 5";
                  break;
                case 16390:
                  result = "Light 6";
                  break;
                case 16391:
                  result = "Light 7";
                  break;
                default:
                  return 0;
              }
              break;
          }
          break;
      }
    }
    else if (a1 > 8703)
    {
      if (a1 <= 9727)
      {
        if (a1 <= 9216)
        {
          if (a1 > 8959)
          {
            if (a1 == 8960)
              return "Env";
            if (a1 == 9216)
              return "Eye Linear";
          }
          else
          {
            if (a1 == 8704)
              return "Env Mode";
            if (a1 == 8705)
              return "Env Color";
          }
        }
        else if (a1 <= 9471)
        {
          if (a1 == 9217)
            return "Object Linear";
          if (a1 == 9218)
            return "Sphere Map";
        }
        else
        {
          switch(a1)
          {
            case 9472:
              return "Gen Mode";
            case 9473:
              return "Object Plane";
            case 9474:
              return "Eye Plane";
          }
        }
        return 0;
      }
      if (a1 > 10239)
      {
        switch(a1)
        {
          case 10240:
            result = "Mag Filter";
            break;
          case 10241:
            result = "Min Filter";
            break;
          case 10242:
            result = "Wrap S";
            break;
          case 10243:
            result = "Wrap T";
            break;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 9984:
            result = "Nearest Mipmap Nearest";
            break;
          case 9985:
            result = "Linear Mipmap Nearest";
            break;
          case 9986:
            result = "Nearest Mipmap Linear";
            break;
          case 9987:
            result = "Linear Mipmap Linear";
            break;
          default:
            if (a1 == 9728)
            {
              result = "Nearest";
            }
            else
            {
              if (a1 != 9729)
                return 0;
              result = "Linear";
            }
            break;
        }
      }
    }
    else if (a1 <= 7935)
    {
      if (a1 <= 7423)
      {
        switch(a1)
        {
          case 7168:
            return "Render";
          case 7169:
            return "Feedback";
          case 7170:
            return "Select";
        }
        return 0;
      }
      switch(a1)
      {
        case 7680:
          result = "Keep";
          break;
        case 7681:
          result = "Replace";
          break;
        case 7682:
          result = "Incr";
          break;
        case 7683:
          result = "Decr";
          break;
        default:
          if (a1 == 7424)
          {
            result = "Flat";
          }
          else
          {
            if (a1 != 7425)
              return 0;
            result = "Smooth";
          }
          break;
      }
    }
    else if (a1 < 0x2000)
    {
      switch(a1)
      {
        case 7936:
          result = "Vendor";
          break;
        case 7937:
          result = "Renderer";
          break;
        case 7938:
          result = "Version";
          break;
        case 7939:
          result = "Extensions";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 8192:
          result = "S";
          break;
        case 8193:
          result = "T";
          break;
        case 8194:
          result = "R";
          break;
        case 8195:
          result = "Q";
          break;
        default:
          if (a1 == 8448)
          {
            result = "Modulate";
          }
          else
          {
            if (a1 != 8449)
              return 0;
            result = "Decal";
          }
          break;
      }
    }
  }
  else if (a1 <= 1023)
  {
    if (a1 <= 255)
    {
      v2 = a1 + 1;
      result = "False";
      switch(v2)
      {
        case 0:
          result = "Invalid Index";
          break;
        case 1:
          return result;
        case 2:
          result = "True";
          break;
        case 3:
          result = "Line Loop";
          break;
        case 4:
          result = "Line Strip";
          break;
        case 5:
          result = "Triangles";
          break;
        case 6:
          result = "Triangle Strip";
          break;
        case 7:
          result = "Triangle Fan";
          break;
        case 8:
          result = "Quads";
          break;
        case 9:
          result = "Quad Strip";
          break;
        case 10:
          result = "Polygon";
          break;
        case 11:
          result = "Lines Adjacency";
          break;
        case 12:
          result = "Line Strip Adjacency";
          break;
        case 13:
          result = "Triangles Adjacency";
          break;
        case 14:
          result = "Triangle Strip Adjacency";
          break;
        case 15:
          result = "Patches";
          break;
        case 17:
          result = "Map Flush Explicit Bit";
          break;
        case 33:
          result = "Map Unsynchronized Bit";
          break;
        case 65:
          result = "Lighting Bit";
          break;
        case 129:
          return "Bit";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 768:
          result = "Src Color";
          break;
        case 769:
          result = "One Minus Src Color";
          break;
        case 770:
          result = "Src Alpha";
          break;
        case 771:
          result = "One Minus Src Alpha";
          break;
        case 772:
          result = "Dst Alpha";
          break;
        case 773:
          result = "One Minus Dst Alpha";
          break;
        case 774:
          result = "Dst Color";
          break;
        case 775:
          result = "One Minus Dst Color";
          break;
        case 776:
          result = "Src Alpha Saturate";
          break;
        default:
          switch(a1)
          {
            case 512:
              result = "Never";
              break;
            case 513:
              result = "Less";
              break;
            case 514:
              result = "Equal";
              break;
            case 515:
              result = "Lequal";
              break;
            case 516:
              result = "Greater";
              break;
            case 517:
              result = "Notequal";
              break;
            case 518:
              result = "Gequal";
              break;
            case 519:
              result = "Always";
              break;
            default:
              switch(a1)
              {
                case 256:
                  result = "Accum";
                  break;
                case 257:
                  result = "Load";
                  break;
                case 258:
                  result = "Return";
                  break;
                case 259:
                  result = "Mult";
                  break;
                case 260:
                  result = "Add";
                  break;
                default:
                  return 0;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        result = "Invalid Enum";
        break;
      case 1281:
        result = "Invalid Value";
        break;
      case 1282:
        result = "Invalid Operation";
        break;
      case 1283:
        result = "Stack Overflow";
        break;
      case 1284:
        result = "Stack Underflow";
        break;
      case 1285:
        result = "Out Of Memory";
        break;
      case 1286:
        result = "Invalid Framebuffer Operation";
        break;
      case 1287:
      case 1288:
      case 1289:
      case 1290:
      case 1291:
      case 1292:
      case 1293:
      case 1294:
      case 1295:
      case 1296:
      case 1297:
      case 1298:
      case 1299:
      case 1300:
      case 1301:
      case 1302:
      case 1303:
      case 1304:
      case 1305:
      case 1306:
      case 1307:
      case 1308:
      case 1309:
      case 1310:
      case 1311:
      case 1312:
      case 1313:
      case 1314:
      case 1315:
      case 1316:
      case 1317:
      case 1318:
      case 1319:
      case 1320:
      case 1321:
      case 1322:
      case 1323:
      case 1324:
      case 1325:
      case 1326:
      case 1327:
      case 1328:
      case 1329:
      case 1330:
      case 1331:
      case 1332:
      case 1333:
      case 1334:
      case 1335:
      case 1336:
      case 1337:
      case 1338:
      case 1339:
      case 1340:
      case 1341:
      case 1342:
      case 1343:
      case 1344:
      case 1345:
      case 1346:
      case 1347:
      case 1348:
      case 1349:
      case 1350:
      case 1351:
      case 1352:
      case 1353:
      case 1354:
      case 1355:
      case 1356:
      case 1357:
      case 1358:
      case 1359:
      case 1360:
      case 1361:
      case 1362:
      case 1363:
      case 1364:
      case 1365:
      case 1366:
      case 1367:
      case 1368:
      case 1369:
      case 1370:
      case 1371:
      case 1372:
      case 1373:
      case 1374:
      case 1375:
      case 1376:
      case 1377:
      case 1378:
      case 1379:
      case 1380:
      case 1381:
      case 1382:
      case 1383:
      case 1384:
      case 1385:
      case 1386:
      case 1387:
      case 1388:
      case 1389:
      case 1390:
      case 1391:
      case 1392:
      case 1393:
      case 1394:
      case 1395:
      case 1396:
      case 1397:
      case 1398:
      case 1399:
      case 1400:
      case 1401:
      case 1402:
      case 1403:
      case 1404:
      case 1405:
      case 1406:
      case 1407:
      case 1408:
      case 1409:
      case 1410:
      case 1411:
      case 1412:
      case 1413:
      case 1414:
      case 1415:
      case 1416:
      case 1417:
      case 1418:
      case 1419:
      case 1420:
      case 1421:
      case 1422:
      case 1423:
      case 1424:
      case 1425:
      case 1426:
      case 1427:
      case 1428:
      case 1429:
      case 1430:
      case 1431:
      case 1432:
      case 1433:
      case 1434:
      case 1435:
      case 1436:
      case 1437:
      case 1438:
      case 1439:
      case 1440:
      case 1441:
      case 1442:
      case 1443:
      case 1444:
      case 1445:
      case 1446:
      case 1447:
      case 1448:
      case 1449:
      case 1450:
      case 1451:
      case 1452:
      case 1453:
      case 1454:
      case 1455:
      case 1456:
      case 1457:
      case 1458:
      case 1459:
      case 1460:
      case 1461:
      case 1462:
      case 1463:
      case 1464:
      case 1465:
      case 1466:
      case 1467:
      case 1468:
      case 1469:
      case 1470:
      case 1471:
      case 1472:
      case 1473:
      case 1474:
      case 1475:
      case 1476:
      case 1477:
      case 1478:
      case 1479:
      case 1480:
      case 1481:
      case 1482:
      case 1483:
      case 1484:
      case 1485:
      case 1486:
      case 1487:
      case 1488:
      case 1489:
      case 1490:
      case 1491:
      case 1492:
      case 1493:
      case 1494:
      case 1495:
      case 1496:
      case 1497:
      case 1498:
      case 1499:
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1504:
      case 1505:
      case 1506:
      case 1507:
      case 1508:
      case 1509:
      case 1510:
      case 1511:
      case 1512:
      case 1513:
      case 1514:
      case 1515:
      case 1516:
      case 1517:
      case 1518:
      case 1519:
      case 1520:
      case 1521:
      case 1522:
      case 1523:
      case 1524:
      case 1525:
      case 1526:
      case 1527:
      case 1528:
      case 1529:
      case 1530:
      case 1531:
      case 1532:
      case 1533:
      case 1534:
      case 1535:
      case 1541:
      case 1542:
      case 1543:
      case 1544:
      case 1545:
      case 1546:
      case 1547:
      case 1548:
      case 1549:
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1633:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1638:
      case 1639:
      case 1640:
      case 1641:
      case 1642:
      case 1643:
      case 1644:
      case 1645:
      case 1646:
      case 1647:
      case 1648:
      case 1649:
      case 1650:
      case 1651:
      case 1652:
      case 1653:
      case 1654:
      case 1655:
      case 1656:
      case 1657:
      case 1658:
      case 1659:
      case 1660:
      case 1661:
      case 1662:
      case 1663:
      case 1664:
      case 1665:
      case 1666:
      case 1667:
      case 1668:
      case 1669:
      case 1670:
      case 1671:
      case 1672:
      case 1673:
      case 1674:
      case 1675:
      case 1676:
      case 1677:
      case 1678:
      case 1679:
      case 1680:
      case 1681:
      case 1682:
      case 1683:
      case 1684:
      case 1685:
      case 1686:
      case 1687:
      case 1688:
      case 1689:
      case 1690:
      case 1691:
      case 1692:
      case 1693:
      case 1694:
      case 1695:
      case 1696:
      case 1697:
      case 1698:
      case 1699:
      case 1700:
      case 1701:
      case 1702:
      case 1703:
      case 1704:
      case 1705:
      case 1706:
      case 1707:
      case 1708:
      case 1709:
      case 1710:
      case 1711:
      case 1712:
      case 1713:
      case 1714:
      case 1715:
      case 1716:
      case 1717:
      case 1718:
      case 1719:
      case 1720:
      case 1721:
      case 1722:
      case 1723:
      case 1724:
      case 1725:
      case 1726:
      case 1727:
      case 1728:
      case 1729:
      case 1730:
      case 1731:
      case 1732:
      case 1733:
      case 1734:
      case 1735:
      case 1736:
      case 1737:
      case 1738:
      case 1739:
      case 1740:
      case 1741:
      case 1742:
      case 1743:
      case 1744:
      case 1745:
      case 1746:
      case 1747:
      case 1748:
      case 1749:
      case 1750:
      case 1751:
      case 1752:
      case 1753:
      case 1754:
      case 1755:
      case 1756:
      case 1757:
      case 1758:
      case 1759:
      case 1760:
      case 1761:
      case 1762:
      case 1763:
      case 1764:
      case 1765:
      case 1766:
      case 1767:
      case 1768:
      case 1769:
      case 1770:
      case 1771:
      case 1772:
      case 1773:
      case 1774:
      case 1775:
      case 1776:
      case 1777:
      case 1778:
      case 1779:
      case 1780:
      case 1781:
      case 1782:
      case 1783:
      case 1784:
      case 1785:
      case 1786:
      case 1787:
      case 1788:
      case 1789:
      case 1790:
      case 1791:
      case 1800:
      case 1801:
      case 1802:
      case 1803:
      case 1804:
      case 1805:
      case 1806:
      case 1807:
      case 1808:
      case 1809:
      case 1810:
      case 1811:
      case 1812:
      case 1813:
      case 1814:
      case 1815:
      case 1816:
      case 1817:
      case 1818:
      case 1819:
      case 1820:
      case 1821:
      case 1822:
      case 1823:
      case 1824:
      case 1825:
      case 1826:
      case 1827:
      case 1828:
      case 1829:
      case 1830:
      case 1831:
      case 1832:
      case 1833:
      case 1834:
      case 1835:
      case 1836:
      case 1837:
      case 1838:
      case 1839:
      case 1840:
      case 1841:
      case 1842:
      case 1843:
      case 1844:
      case 1845:
      case 1846:
      case 1847:
      case 1848:
      case 1849:
      case 1850:
      case 1851:
      case 1852:
      case 1853:
      case 1854:
      case 1855:
      case 1856:
      case 1857:
      case 1858:
      case 1859:
      case 1860:
      case 1861:
      case 1862:
      case 1863:
      case 1864:
      case 1865:
      case 1866:
      case 1867:
      case 1868:
      case 1869:
      case 1870:
      case 1871:
      case 1872:
      case 1873:
      case 1874:
      case 1875:
      case 1876:
      case 1877:
      case 1878:
      case 1879:
      case 1880:
      case 1881:
      case 1882:
      case 1883:
      case 1884:
      case 1885:
      case 1886:
      case 1887:
      case 1888:
      case 1889:
      case 1890:
      case 1891:
      case 1892:
      case 1893:
      case 1894:
      case 1895:
      case 1896:
      case 1897:
      case 1898:
      case 1899:
      case 1900:
      case 1901:
      case 1902:
      case 1903:
      case 1904:
      case 1905:
      case 1906:
      case 1907:
      case 1908:
      case 1909:
      case 1910:
      case 1911:
      case 1912:
      case 1913:
      case 1914:
      case 1915:
      case 1916:
      case 1917:
      case 1918:
      case 1919:
      case 1920:
      case 1921:
      case 1922:
      case 1923:
      case 1924:
      case 1925:
      case 1926:
      case 1927:
      case 1928:
      case 1929:
      case 1930:
      case 1931:
      case 1932:
      case 1933:
      case 1934:
      case 1935:
      case 1936:
      case 1937:
      case 1938:
      case 1939:
      case 1940:
      case 1941:
      case 1942:
      case 1943:
      case 1944:
      case 1945:
      case 1946:
      case 1947:
      case 1948:
      case 1949:
      case 1950:
      case 1951:
      case 1952:
      case 1953:
      case 1954:
      case 1955:
      case 1956:
      case 1957:
      case 1958:
      case 1959:
      case 1960:
      case 1961:
      case 1962:
      case 1963:
      case 1964:
      case 1965:
      case 1966:
      case 1967:
      case 1968:
      case 1969:
      case 1970:
      case 1971:
      case 1972:
      case 1973:
      case 1974:
      case 1975:
      case 1976:
      case 1977:
      case 1978:
      case 1979:
      case 1980:
      case 1981:
      case 1982:
      case 1983:
      case 1984:
      case 1985:
      case 1986:
      case 1987:
      case 1988:
      case 1989:
      case 1990:
      case 1991:
      case 1992:
      case 1993:
      case 1994:
      case 1995:
      case 1996:
      case 1997:
      case 1998:
      case 1999:
      case 2000:
      case 2001:
      case 2002:
      case 2003:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2008:
      case 2009:
      case 2010:
      case 2011:
      case 2012:
      case 2013:
      case 2014:
      case 2015:
      case 2016:
      case 2017:
      case 2018:
      case 2019:
      case 2020:
      case 2021:
      case 2022:
      case 2023:
      case 2024:
      case 2025:
      case 2026:
      case 2027:
      case 2028:
      case 2029:
      case 2030:
      case 2031:
      case 2032:
      case 2033:
      case 2034:
      case 2035:
      case 2036:
      case 2037:
      case 2038:
      case 2039:
      case 2040:
      case 2041:
      case 2042:
      case 2043:
      case 2044:
      case 2045:
      case 2046:
      case 2047:
      case 2050:
      case 2051:
      case 2052:
      case 2053:
      case 2054:
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2059:
      case 2060:
      case 2061:
      case 2062:
      case 2063:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2069:
      case 2070:
      case 2071:
      case 2072:
      case 2073:
      case 2074:
      case 2075:
      case 2076:
      case 2077:
      case 2078:
      case 2079:
      case 2080:
      case 2081:
      case 2082:
      case 2083:
      case 2084:
      case 2085:
      case 2086:
      case 2087:
      case 2088:
      case 2089:
      case 2090:
      case 2091:
      case 2092:
      case 2093:
      case 2094:
      case 2095:
      case 2096:
      case 2097:
      case 2098:
      case 2099:
      case 2100:
      case 2101:
      case 2102:
      case 2103:
      case 2104:
      case 2105:
      case 2106:
      case 2107:
      case 2108:
      case 2109:
      case 2110:
      case 2111:
      case 2112:
      case 2113:
      case 2114:
      case 2115:
      case 2116:
      case 2117:
      case 2118:
      case 2119:
      case 2120:
      case 2121:
      case 2122:
      case 2123:
      case 2124:
      case 2125:
      case 2126:
      case 2127:
      case 2128:
      case 2129:
      case 2130:
      case 2131:
      case 2132:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2140:
      case 2141:
      case 2142:
      case 2143:
      case 2144:
      case 2145:
      case 2146:
      case 2147:
      case 2148:
      case 2149:
      case 2150:
      case 2151:
      case 2152:
      case 2153:
      case 2154:
      case 2155:
      case 2156:
      case 2157:
      case 2158:
      case 2159:
      case 2160:
      case 2161:
      case 2162:
      case 2163:
      case 2164:
      case 2165:
      case 2166:
      case 2167:
      case 2168:
      case 2169:
      case 2170:
      case 2171:
      case 2172:
      case 2173:
      case 2174:
      case 2175:
      case 2176:
      case 2177:
      case 2178:
      case 2179:
      case 2180:
      case 2181:
      case 2182:
      case 2183:
      case 2184:
      case 2185:
      case 2186:
      case 2187:
      case 2188:
      case 2189:
      case 2190:
      case 2191:
      case 2192:
      case 2193:
      case 2194:
      case 2195:
      case 2196:
      case 2197:
      case 2198:
      case 2199:
      case 2200:
      case 2201:
      case 2202:
      case 2203:
      case 2204:
      case 2205:
      case 2206:
      case 2207:
      case 2208:
      case 2209:
      case 2210:
      case 2211:
      case 2212:
      case 2213:
      case 2214:
      case 2215:
      case 2216:
      case 2217:
      case 2218:
      case 2219:
      case 2220:
      case 2221:
      case 2222:
      case 2223:
      case 2224:
      case 2225:
      case 2226:
      case 2227:
      case 2228:
      case 2229:
      case 2230:
      case 2231:
      case 2232:
      case 2233:
      case 2234:
      case 2235:
      case 2236:
      case 2237:
      case 2238:
      case 2239:
      case 2240:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2301:
      case 2302:
      case 2303:
      case 2306:
      case 2307:
      case 2308:
      case 2309:
      case 2310:
      case 2311:
      case 2312:
      case 2313:
      case 2314:
      case 2315:
      case 2316:
      case 2317:
      case 2318:
      case 2319:
      case 2320:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2400:
      case 2401:
      case 2402:
      case 2403:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2500:
      case 2501:
      case 2502:
      case 2503:
      case 2504:
      case 2505:
      case 2506:
      case 2507:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
      case 2600:
      case 2601:
      case 2602:
      case 2603:
      case 2604:
      case 2605:
      case 2606:
      case 2607:
      case 2608:
      case 2609:
      case 2610:
      case 2611:
      case 2612:
      case 2613:
      case 2614:
      case 2615:
      case 2616:
      case 2617:
      case 2618:
      case 2619:
      case 2620:
      case 2621:
      case 2622:
      case 2623:
      case 2624:
      case 2625:
      case 2626:
      case 2627:
      case 2628:
      case 2629:
      case 2630:
      case 2631:
      case 2632:
      case 2633:
      case 2634:
      case 2635:
      case 2636:
      case 2637:
      case 2638:
      case 2639:
      case 2640:
      case 2641:
      case 2642:
      case 2643:
      case 2644:
      case 2645:
      case 2646:
      case 2647:
      case 2648:
      case 2649:
      case 2650:
      case 2651:
      case 2652:
      case 2653:
      case 2654:
      case 2655:
      case 2656:
      case 2657:
      case 2658:
      case 2659:
      case 2660:
      case 2661:
      case 2662:
      case 2663:
      case 2664:
      case 2665:
      case 2666:
      case 2667:
      case 2668:
      case 2669:
      case 2670:
      case 2671:
      case 2672:
      case 2673:
      case 2674:
      case 2675:
      case 2676:
      case 2677:
      case 2678:
      case 2679:
      case 2680:
      case 2681:
      case 2682:
      case 2683:
      case 2684:
      case 2685:
      case 2686:
      case 2687:
      case 2688:
      case 2689:
      case 2690:
      case 2691:
      case 2692:
      case 2693:
      case 2694:
      case 2695:
      case 2696:
      case 2697:
      case 2698:
      case 2699:
      case 2700:
      case 2701:
      case 2702:
      case 2703:
      case 2704:
      case 2705:
      case 2706:
      case 2707:
      case 2708:
      case 2709:
      case 2710:
      case 2711:
      case 2712:
      case 2713:
      case 2714:
      case 2715:
      case 2716:
      case 2717:
      case 2718:
      case 2719:
      case 2720:
      case 2721:
      case 2722:
      case 2723:
      case 2724:
      case 2725:
      case 2726:
      case 2727:
      case 2728:
      case 2729:
      case 2730:
      case 2731:
      case 2732:
      case 2733:
      case 2734:
      case 2735:
      case 2736:
      case 2737:
      case 2738:
      case 2739:
      case 2740:
      case 2741:
      case 2742:
      case 2743:
      case 2744:
      case 2745:
      case 2746:
      case 2747:
      case 2748:
      case 2749:
      case 2750:
      case 2751:
      case 2752:
      case 2753:
      case 2754:
      case 2755:
      case 2756:
      case 2757:
      case 2758:
      case 2759:
      case 2760:
      case 2761:
      case 2762:
      case 2763:
      case 2764:
      case 2765:
      case 2766:
      case 2767:
      case 2768:
      case 2769:
      case 2770:
      case 2771:
      case 2772:
      case 2773:
      case 2774:
      case 2775:
      case 2776:
      case 2777:
      case 2778:
      case 2779:
      case 2780:
      case 2781:
      case 2782:
      case 2783:
      case 2784:
      case 2785:
      case 2786:
      case 2787:
      case 2788:
      case 2789:
      case 2790:
      case 2791:
      case 2792:
      case 2793:
      case 2794:
      case 2795:
      case 2796:
      case 2797:
      case 2798:
      case 2799:
      case 2800:
      case 2801:
      case 2802:
      case 2803:
      case 2804:
      case 2805:
      case 2806:
      case 2807:
      case 2808:
      case 2809:
      case 2810:
      case 2811:
      case 2812:
      case 2813:
      case 2814:
      case 2815:
      case 2826:
      case 2827:
      case 2828:
      case 2829:
      case 2830:
      case 2831:
      case 2836:
      case 2837:
      case 2838:
      case 2839:
      case 2840:
      case 2841:
      case 2842:
      case 2843:
      case 2844:
      case 2845:
      case 2846:
      case 2847:
      case 2855:
      case 2856:
      case 2857:
      case 2858:
      case 2859:
      case 2860:
      case 2861:
      case 2862:
      case 2863:
      case 2868:
      case 2869:
      case 2870:
      case 2871:
      case 2872:
      case 2873:
      case 2874:
      case 2875:
      case 2876:
      case 2877:
      case 2878:
      case 2879:
      case 2887:
      case 2888:
      case 2889:
      case 2890:
      case 2891:
      case 2892:
      case 2893:
      case 2894:
      case 2895:
      case 2904:
      case 2905:
      case 2906:
      case 2907:
      case 2908:
      case 2909:
      case 2910:
      case 2911:
      case 2919:
      case 2920:
      case 2921:
      case 2922:
      case 2923:
      case 2924:
      case 2925:
      case 2926:
      case 2927:
      case 2933:
      case 2934:
      case 2935:
      case 2936:
      case 2937:
      case 2938:
      case 2939:
      case 2940:
      case 2941:
      case 2942:
      case 2943:
      case 2945:
      case 2946:
      case 2947:
      case 2948:
      case 2949:
      case 2950:
      case 2951:
      case 2952:
      case 2953:
      case 2954:
      case 2955:
      case 2956:
      case 2957:
      case 2958:
      case 2959:
      case 2969:
      case 2970:
      case 2971:
      case 2972:
      case 2973:
      case 2974:
      case 2975:
      case 2985:
      case 2986:
      case 2987:
      case 2988:
      case 2989:
      case 2990:
      case 2991:
      case 2994:
      case 2995:
      case 2996:
      case 2997:
      case 2998:
      case 2999:
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
      case 3016:
      case 3017:
      case 3018:
      case 3019:
      case 3020:
      case 3021:
      case 3022:
      case 3023:
      case 3025:
      case 3026:
      case 3027:
      case 3028:
      case 3029:
      case 3030:
      case 3031:
      case 3032:
      case 3033:
      case 3034:
      case 3035:
      case 3036:
      case 3037:
      case 3038:
      case 3039:
      case 3043:
      case 3044:
      case 3045:
      case 3046:
      case 3047:
      case 3048:
      case 3049:
      case 3050:
      case 3051:
      case 3052:
      case 3053:
      case 3054:
      case 3055:
      case 3059:
      case 3060:
      case 3061:
      case 3062:
      case 3063:
      case 3064:
      case 3065:
      case 3066:
      case 3067:
      case 3068:
      case 3069:
      case 3070:
      case 3071:
      case 3075:
      case 3076:
      case 3077:
      case 3078:
      case 3079:
      case 3080:
      case 3081:
      case 3082:
      case 3083:
      case 3084:
      case 3085:
      case 3086:
      case 3087:
      case 3090:
      case 3091:
      case 3092:
      case 3093:
      case 3094:
      case 3095:
      case 3096:
      case 3097:
      case 3098:
      case 3099:
      case 3100:
      case 3101:
      case 3102:
      case 3103:
      case 3108:
      case 3109:
      case 3110:
      case 3111:
      case 3112:
      case 3113:
      case 3114:
      case 3115:
      case 3116:
      case 3117:
      case 3118:
      case 3119:
      case 3124:
      case 3125:
      case 3126:
      case 3127:
      case 3128:
      case 3129:
      case 3130:
      case 3131:
      case 3132:
      case 3133:
      case 3134:
      case 3135:
      case 3137:
      case 3138:
      case 3139:
      case 3140:
      case 3141:
      case 3142:
      case 3143:
      case 3144:
      case 3145:
      case 3146:
      case 3147:
      case 3148:
      case 3149:
      case 3150:
      case 3151:
      case 3157:
      case 3158:
      case 3159:
      case 3160:
      case 3161:
      case 3162:
      case 3163:
      case 3164:
      case 3165:
      case 3166:
      case 3167:
      case 3172:
      case 3173:
      case 3174:
      case 3175:
      case 3176:
      case 3177:
      case 3178:
      case 3179:
      case 3180:
      case 3181:
      case 3182:
      case 3183:
      case 3194:
      case 3195:
      case 3196:
      case 3197:
      case 3198:
      case 3199:
      case 3200:
      case 3201:
      case 3202:
      case 3203:
      case 3204:
      case 3205:
      case 3206:
      case 3207:
      case 3208:
      case 3209:
      case 3210:
      case 3211:
      case 3212:
      case 3213:
      case 3214:
      case 3215:
      case 3216:
      case 3217:
      case 3218:
      case 3219:
      case 3220:
      case 3221:
      case 3222:
      case 3223:
      case 3224:
      case 3225:
      case 3226:
      case 3227:
      case 3228:
      case 3229:
      case 3230:
      case 3231:
      case 3232:
      case 3233:
      case 3234:
      case 3235:
      case 3236:
      case 3237:
      case 3238:
      case 3239:
      case 3240:
      case 3241:
      case 3242:
      case 3243:
      case 3244:
      case 3245:
      case 3246:
      case 3247:
      case 3258:
      case 3259:
      case 3260:
      case 3261:
      case 3262:
      case 3263:
      case 3264:
      case 3265:
      case 3266:
      case 3267:
      case 3268:
      case 3269:
      case 3270:
      case 3271:
      case 3272:
      case 3273:
      case 3274:
      case 3275:
      case 3276:
      case 3277:
      case 3278:
      case 3279:
      case 3280:
      case 3281:
      case 3282:
      case 3283:
      case 3284:
      case 3285:
      case 3286:
      case 3287:
      case 3288:
      case 3289:
      case 3290:
      case 3291:
      case 3292:
      case 3293:
      case 3294:
      case 3295:
      case 3296:
      case 3297:
      case 3298:
      case 3299:
      case 3300:
      case 3301:
      case 3302:
      case 3303:
      case 3304:
      case 3305:
      case 3306:
      case 3307:
      case 3308:
      case 3309:
      case 3310:
      case 3311:
      case 3318:
      case 3319:
      case 3320:
      case 3321:
      case 3322:
      case 3323:
      case 3324:
      case 3325:
      case 3326:
      case 3327:
      case 3334:
      case 3335:
      case 3336:
      case 3337:
      case 3338:
      case 3339:
      case 3340:
      case 3341:
      case 3342:
      case 3343:
      case 3360:
      case 3361:
      case 3362:
      case 3363:
      case 3364:
      case 3365:
      case 3366:
      case 3367:
      case 3368:
      case 3369:
      case 3370:
      case 3371:
      case 3372:
      case 3373:
      case 3374:
      case 3375:
      case 3388:
      case 3389:
      case 3390:
      case 3391:
      case 3392:
      case 3393:
      case 3394:
      case 3395:
      case 3396:
      case 3397:
      case 3398:
      case 3399:
      case 3400:
      case 3401:
      case 3402:
      case 3403:
      case 3404:
      case 3405:
      case 3406:
      case 3407:
      case 3420:
      case 3421:
      case 3422:
      case 3423:
      case 3424:
      case 3425:
      case 3426:
      case 3427:
      case 3428:
      case 3429:
      case 3430:
      case 3431:
      case 3432:
      case 3433:
      case 3434:
      case 3435:
      case 3436:
      case 3437:
      case 3438:
      case 3439:
      case 3441:
      case 3442:
      case 3443:
      case 3444:
      case 3445:
      case 3446:
      case 3447:
      case 3448:
      case 3449:
      case 3450:
      case 3451:
      case 3452:
      case 3453:
      case 3454:
      case 3455:
      case 3457:
      case 3458:
      case 3459:
      case 3460:
      case 3461:
      case 3462:
      case 3463:
      case 3464:
      case 3465:
      case 3466:
      case 3467:
      case 3468:
      case 3469:
      case 3470:
      case 3471:
      case 3481:
      case 3482:
      case 3483:
      case 3484:
      case 3485:
      case 3486:
      case 3487:
      case 3488:
      case 3489:
      case 3490:
      case 3491:
      case 3492:
      case 3493:
      case 3494:
      case 3495:
      case 3496:
      case 3497:
      case 3498:
      case 3499:
      case 3500:
      case 3501:
      case 3502:
      case 3503:
      case 3513:
      case 3514:
      case 3515:
      case 3516:
      case 3517:
      case 3518:
      case 3519:
      case 3520:
      case 3521:
      case 3522:
      case 3523:
      case 3524:
      case 3525:
      case 3526:
      case 3527:
      case 3528:
      case 3529:
      case 3530:
      case 3531:
      case 3532:
      case 3533:
      case 3534:
      case 3535:
      case 3540:
      case 3541:
      case 3542:
      case 3543:
      case 3544:
      case 3545:
      case 3546:
      case 3547:
      case 3548:
      case 3549:
      case 3550:
      case 3551:
      case 3554:
      case 3555:
      case 3556:
      case 3557:
      case 3558:
      case 3559:
      case 3560:
      case 3561:
      case 3562:
      case 3563:
      case 3564:
      case 3565:
      case 3566:
      case 3567:
        return 0;
      case 1536:
        result = "2D";
        break;
      case 1537:
        result = "3D";
        break;
      case 1538:
        result = "3D Color";
        break;
      case 1539:
        result = "3D Color Texture";
        break;
      case 1540:
        result = "4D Color Texture";
        break;
      case 1792:
        result = "Pass Through Token";
        break;
      case 1793:
        result = "Token";
        break;
      case 1794:
        result = "Line Token";
        break;
      case 1795:
        result = "Polygon Token";
        break;
      case 1796:
        result = "Bitmap Token";
        break;
      case 1797:
        result = "Draw Pixel Token";
        break;
      case 1798:
        result = "Copy Pixel Token";
        break;
      case 1799:
        result = "Line Reset Token";
        break;
      case 2048:
        result = "Exp";
        break;
      case 2049:
        result = "Exp2";
        break;
      case 2304:
        result = "CW";
        break;
      case 2305:
        result = "CCW";
        break;
      case 2560:
        result = "Coeff";
        break;
      case 2561:
        result = "Order";
        break;
      case 2562:
        result = "Domain";
        break;
      case 2816:
        result = "Current Color";
        break;
      case 2817:
        result = "Current Index";
        break;
      case 2818:
        result = "Current Normal";
        break;
      case 2819:
        result = "Current Texture Coords";
        break;
      case 2820:
        result = "Current Raster Color";
        break;
      case 2821:
        result = "Current Raster Index";
        break;
      case 2822:
        result = "Current Raster Texture Coords";
        break;
      case 2823:
        result = "Current Raster Position";
        break;
      case 2824:
        result = "Current Raster Position Valid";
        break;
      case 2825:
        result = "Current Raster Distance";
        break;
      case 2832:
        result = "Smooth";
        break;
      case 2833:
        result = "Size";
        break;
      case 2834:
        result = "Size Range";
        break;
      case 2835:
        result = "Size Granularity";
        break;
      case 2848:
        result = "Line Smooth";
        break;
      case 2849:
        result = "Line Width";
        break;
      case 2850:
        result = "Smooth Line Width Range";
        break;
      case 2851:
        result = "Smooth Line Width Granularity";
        break;
      case 2852:
        result = "Line Stipple";
        break;
      case 2853:
        result = "Line Stipple Pattern";
        break;
      case 2854:
        result = "Line Stipple Repeat";
        break;
      case 2864:
        result = "List Mode";
        break;
      case 2865:
        result = "Max List Nesting";
        break;
      case 2866:
        result = "List Base";
        break;
      case 2867:
        result = "List Index";
        break;
      case 2880:
        result = "Polygon Mode";
        break;
      case 2881:
        result = "Polygon Smooth";
        break;
      case 2882:
        result = "Polygon Stipple";
        break;
      case 2883:
        result = "Edge Flag";
        break;
      case 2884:
        result = "Cull Face";
        break;
      case 2885:
        result = "Cull Face Mode";
        break;
      case 2886:
        result = "Front Face";
        break;
      case 2896:
        result = "Lighting";
        break;
      case 2897:
        result = "Local Viewer";
        break;
      case 2898:
        result = "Two Side";
        break;
      case 2899:
        result = "Ambient";
        break;
      case 2900:
        result = "Shade Model";
        break;
      case 2901:
        result = "Color Material Face";
        break;
      case 2902:
        result = "Color Material Parameter";
        break;
      case 2903:
        result = "Color Material";
        break;
      case 2912:
        result = "Fog";
        break;
      case 2913:
        result = "Index";
        break;
      case 2914:
        result = "Density";
        break;
      case 2915:
        result = "Start";
        break;
      case 2916:
        result = "End";
        break;
      case 2917:
        result = "Mode";
        break;
      case 2918:
        result = "Color";
        break;
      case 2928:
        result = "Depth Range";
        break;
      case 2929:
        result = "Test";
        break;
      case 2930:
        result = "Writemask";
        break;
      case 2931:
        result = "Clear Value";
        break;
      case 2932:
        result = "Func";
        break;
      case 2944:
        result = "Accum Clear Value";
        break;
      case 2960:
        result = "Test";
        break;
      case 2961:
        result = "Clear Value";
        break;
      case 2962:
        result = "Func";
        break;
      case 2963:
        result = "Value Mask";
        break;
      case 2964:
        result = "Fail";
        break;
      case 2965:
        result = "Pass Depth Fail";
        break;
      case 2966:
        result = "Pass Depth Pass";
        break;
      case 2967:
        result = "Ref";
        break;
      case 2968:
        result = "Writemask";
        break;
      case 2976:
        result = "Matrix Mode";
        break;
      case 2977:
        result = "Normalize";
        break;
      case 2978:
        result = "Viewport";
        break;
      case 2979:
        result = "Modelview Stack Depth";
        break;
      case 2980:
        result = "Projection Stack Depth";
        break;
      case 2981:
        result = "Stack Depth";
        break;
      case 2982:
        result = "Modelview Matrix";
        break;
      case 2983:
        result = "Projection Matrix";
        break;
      case 2984:
        result = "Texture Matrix";
        break;
      case 2992:
        result = "Attrib Stack Depth";
        break;
      case 2993:
        result = "Client Attrib Stack Depth";
        break;
      case 3008:
        result = "Alpha Test";
        break;
      case 3009:
        result = "Alpha Test Func";
        break;
      case 3010:
        result = "Alpha Test Ref";
        break;
      case 3024:
        result = "Dither";
        break;
      case 3040:
        result = "Dst";
        break;
      case 3041:
        result = "Src";
        break;
      case 3042:
        result = "Blend";
        break;
      case 3056:
        result = "Logic Op Mode";
        break;
      case 3057:
        result = "Index Logic Op";
        break;
      case 3058:
        result = "Logic Op";
        break;
      case 3072:
        result = "Aux Buffers";
        break;
      case 3073:
        result = "Draw Buffer";
        break;
      case 3074:
        result = "Read Buffer";
        break;
      case 3088:
        result = "Box";
        break;
      case 3089:
        result = "Test";
        break;
      case 3104:
        result = "Index Clear Value";
        break;
      case 3105:
        result = "Index Writemask";
        break;
      case 3106:
        result = "Clear Value";
        break;
      case 3107:
        result = "Writemask";
        break;
      case 3120:
        result = "Index Mode";
        break;
      case 3121:
        result = "RGBA Mode";
        break;
      case 3122:
        result = "Doublebuffer";
        break;
      case 3123:
        result = "Stereo";
        break;
      case 3136:
        result = "Render Mode";
        break;
      case 3152:
        result = "Perspective Correction Hint";
        break;
      case 3153:
        result = "Smooth Hint";
        break;
      case 3154:
        result = "Line Smooth Hint";
        break;
      case 3155:
        result = "Polygon Smooth Hint";
        break;
      case 3156:
        result = "Hint";
        break;
      case 3168:
        result = "Gen S";
        break;
      case 3169:
        result = "Gen T";
        break;
      case 3170:
        result = "Gen R";
        break;
      case 3171:
        result = "Gen Q";
        break;
      case 3184:
        result = "Pixel Map I To I";
        break;
      case 3185:
        result = "Pixel Map S To S";
        break;
      case 3186:
        result = "Pixel Map I To R";
        break;
      case 3187:
        result = "Pixel Map I To G";
        break;
      case 3188:
        result = "Pixel Map I To B";
        break;
      case 3189:
        result = "Pixel Map I To A";
        break;
      case 3190:
        result = "Pixel Map R To R";
        break;
      case 3191:
        result = "Pixel Map G To G";
        break;
      case 3192:
        result = "Pixel Map B To B";
        break;
      case 3193:
        result = "Pixel Map A To A";
        break;
      case 3248:
        result = "Pixel Map I To I Size";
        break;
      case 3249:
        result = "Pixel Map S To S Size";
        break;
      case 3250:
        result = "Pixel Map I To R Size";
        break;
      case 3251:
        result = "Pixel Map I To G Size";
        break;
      case 3252:
        result = "Pixel Map I To B Size";
        break;
      case 3253:
        result = "Pixel Map I To A Size";
        break;
      case 3254:
        result = "Pixel Map R To R Size";
        break;
      case 3255:
        result = "Pixel Map G To G Size";
        break;
      case 3256:
        result = "Pixel Map B To B Size";
        break;
      case 3257:
        result = "Pixel Map A To A Size";
        break;
      case 3312:
        result = "Unpack Swap Bytes";
        break;
      case 3313:
        result = "Unpack Lsb First";
        break;
      case 3314:
        result = "Unpack Row Length";
        break;
      case 3315:
        result = "Unpack Skip Rows";
        break;
      case 3316:
        result = "Unpack Skip Pixels";
        break;
      case 3317:
        result = "Unpack Alignment";
        break;
      case 3328:
        result = "Pack Swap Bytes";
        break;
      case 3329:
        result = "Pack Lsb First";
        break;
      case 3330:
        result = "Pack Row Length";
        break;
      case 3331:
        result = "Pack Skip Rows";
        break;
      case 3332:
        result = "Pack Skip Pixels";
        break;
      case 3333:
        result = "Pack Alignment";
        break;
      case 3344:
        result = "Map Color";
        break;
      case 3345:
        result = "Map Stencil";
        break;
      case 3346:
        result = "Index Shift";
        break;
      case 3347:
        result = "Index Offset";
        break;
      case 3348:
        result = "Red Scale";
        break;
      case 3349:
        result = "Red Bias";
        break;
      case 3350:
        result = "Zoom X";
        break;
      case 3351:
        result = "Zoom Y";
        break;
      case 3352:
        result = "Green Scale";
        break;
      case 3353:
        result = "Green Bias";
        break;
      case 3354:
        result = "Blue Scale";
        break;
      case 3355:
        result = "Blue Bias";
        break;
      case 3356:
        result = "Alpha Scale";
        break;
      case 3357:
        result = "Alpha Bias";
        break;
      case 3358:
        result = "Scale";
        break;
      case 3359:
        result = "Bias";
        break;
      case 3376:
        result = "Max Eval Order";
        break;
      case 3377:
        result = "Max Lights";
        break;
      case 3378:
        result = "Max Clip Distances";
        break;
      case 3379:
        result = "Max Texture Size";
        break;
      case 3380:
        result = "Max Pixel Map Table";
        break;
      case 3381:
        result = "Max Attrib Stack Depth";
        break;
      case 3382:
        result = "Max Modelview Stack Depth";
        break;
      case 3383:
        result = "Max Name Stack Depth";
        break;
      case 3384:
        result = "Max Projection Stack Depth";
        break;
      case 3385:
        result = "Max Texture Stack Depth";
        break;
      case 3386:
        result = "Max Viewport Dims";
        break;
      case 3387:
        result = "Max Client Attrib Stack Depth";
        break;
      case 3408:
        result = "Subpixel Bits";
        break;
      case 3409:
        result = "Index Bits";
        break;
      case 3410:
        result = "Red Bits";
        break;
      case 3411:
        result = "Green Bits";
        break;
      case 3412:
        result = "Blue Bits";
        break;
      case 3413:
        result = "Alpha Bits";
        break;
      case 3414:
        result = "Bits";
        break;
      case 3415:
        result = "Bits";
        break;
      case 3416:
        result = "Accum Red Bits";
        break;
      case 3417:
        result = "Accum Green Bits";
        break;
      case 3418:
        result = "Accum Blue Bits";
        break;
      case 3419:
        result = "Accum Alpha Bits";
        break;
      case 3440:
        result = "Name Stack Depth";
        break;
      case 3456:
        result = "Auto Normal";
        break;
      case 3472:
        result = "Map1 Color 4";
        break;
      case 3473:
        result = "Map1 Index";
        break;
      case 3474:
        result = "Map1 Normal";
        break;
      case 3475:
        result = "Map1 Texture Coord 1";
        break;
      case 3476:
        result = "Map1 Texture Coord 2";
        break;
      case 3477:
        result = "Map1 Texture Coord 3";
        break;
      case 3478:
        result = "Map1 Texture Coord 4";
        break;
      case 3479:
        result = "Map1 Vertex 3";
        break;
      case 3480:
        result = "Map1 Vertex 4";
        break;
      case 3504:
        result = "Map2 Color 4";
        break;
      case 3505:
        result = "Map2 Index";
        break;
      case 3506:
        result = "Map2 Normal";
        break;
      case 3507:
        result = "Map2 Texture Coord 1";
        break;
      case 3508:
        result = "Map2 Texture Coord 2";
        break;
      case 3509:
        result = "Map2 Texture Coord 3";
        break;
      case 3510:
        result = "Map2 Texture Coord 4";
        break;
      case 3511:
        result = "Map2 Vertex 3";
        break;
      case 3512:
        result = "Map2 Vertex 4";
        break;
      case 3536:
        result = "Map1 Grid Domain";
        break;
      case 3537:
        result = "Map1 Grid Segments";
        break;
      case 3538:
        result = "Map2 Grid Domain";
        break;
      case 3539:
        result = "Map2 Grid Segments";
        break;
      case 3552:
        result = "1D";
        break;
      case 3553:
        result = "2D";
        break;
      case 3568:
        result = "Feedback Buffer Pointer";
        break;
      case 3569:
        result = "Feedback Buffer Size";
        break;
      case 3570:
        result = "Feedback Buffer Type";
        break;
      case 3571:
        result = "Selection Buffer Pointer";
        break;
      case 3572:
        result = "Selection Buffer Size";
        break;
      default:
        switch(a1)
        {
          case 1024:
            result = "Front Left";
            break;
          case 1025:
            result = "Front Right";
            break;
          case 1026:
            result = "Back Left";
            break;
          case 1027:
            result = "Back Right";
            break;
          case 1028:
            result = "Front";
            break;
          case 1029:
            result = "Back";
            break;
          case 1030:
            result = "Left";
            break;
          case 1031:
            result = "Right";
            break;
          case 1032:
            result = "Front And Back";
            break;
          case 1033:
            result = "Aux0";
            break;
          case 1034:
            result = "Aux1";
            break;
          case 1035:
            result = "Aux2";
            break;
          case 1036:
            result = "Aux3";
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

id dy_nsstring_from_enum(uint64_t a1)
{
  const char *v2;

  v2 = dy_string_from_enum(a1);
  if (v2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v2, strlen(v2), 1, 0);
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08x"), a1);
}

id dy_compact_nsstring_from_enum(uint64_t a1)
{
  const char *v2;

  v2 = dy_compact_string_from_enum(a1);
  if (v2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v2, strlen(v2), 1, 0);
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08x"), a1);
}

const char *dy_string_from_enum_ex(int a1, int a2)
{
  if (a2)
    return dy_compact_string_from_enum(a1);
  else
    return dy_string_from_enum(a1);
}

id dy_nsstring_from_enum_ex(uint64_t a1, int a2)
{
  void *v3;
  const char *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (a2)
  {
    v4 = dy_compact_string_from_enum(a1);
    if (!v4)
      return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("0x%08x"), a1);
    return (id)objc_msgSend(objc_alloc((Class)v3), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, strlen(v4), 1, 0);
  }
  v4 = dy_string_from_enum(a1);
  if (v4)
    return (id)objc_msgSend(objc_alloc((Class)v3), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, strlen(v4), 1, 0);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("0x%08x"), a1);
}

uint64_t dy_enum_from_string(const char *a1)
{
  uint64_t **v1;
  const char *v3;

  v3 = a1;
  if (qword_256BB16C0 == -1)
  {
    v1 = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>((_QWORD *)_MergedGlobals, &v3);
    if (v1)
      return *((unsigned int *)v1 + 6);
  }
  else
  {
    dispatch_once(&qword_256BB16C0, &__block_literal_global);
    v1 = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>((_QWORD *)_MergedGlobals, &v3);
    if (v1)
      return *((unsigned int *)v1 + 6);
  }
  return 0xFFFFFFFFLL;
}

void *__dy_enum_from_string_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *result;
  __int128 v3;

  v0 = operator new();
  v1 = 0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  _MergedGlobals = v0;
  do
  {
    *(_QWORD *)&v3 = keys[v1];
    DWORD2(v3) = values[v1];
    result = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,std::pair<char const* const,unsigned int>>(_MergedGlobals, (const char **)&v3, &v3);
    ++v1;
  }
  while (v1 != 3029);
  return result;
}

void *std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,std::pair<char const* const,unsigned int>>(uint64_t a1, const char **a2, _OWORD *a3)
{
  unint64_t v3;
  unsigned int v6;
  const char *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  void **v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t prime;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;

  v6 = -1640531527;
  v7 = *a2;
  v8 = *(unsigned __int8 *)*a2;
  if (**a2)
  {
    v9 = (unsigned __int8 *)(v7 + 2);
    while (*(v9 - 1))
    {
      v10 = ((v6 + v8) << 16) ^ (*(v9 - 1) << 11) ^ (v6 + v8);
      v6 = v10 + (v10 >> 11);
      v11 = *v9;
      v9 += 2;
      v8 = v11;
      if (!v11)
        goto LABEL_7;
    }
    v6 = ((v6 + v8) ^ ((v6 + v8) << 11)) + (((v6 + v8) ^ ((v6 + v8) << 11)) >> 17);
  }
LABEL_7:
  v12 = (v6 ^ (8 * v6)) + ((v6 ^ (8 * v6)) >> 5);
  v13 = (v12 ^ (4 * v12)) + ((v12 ^ (4 * v12)) >> 15);
  v14 = v13 ^ (v13 << 10);
  if (v14)
    v15 = v14;
  else
    v15 = 0x40000000;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      v3 = v15;
      if (v16 <= v15)
        v3 = v15 % v16;
    }
    else
    {
      v3 = ((_DWORD)v16 - 1) & v15;
    }
    v18 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v18)
    {
      v19 = *v18;
      if (*v18)
      {
        if (v17.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = *((_QWORD *)v19 + 1);
            if (v21 == v15)
            {
              if (!strcmp(*((const char **)v19 + 2), v7))
                return v19;
            }
            else if ((v21 & (v16 - 1)) != v3)
            {
              goto LABEL_32;
            }
            v19 = *(void **)v19;
            if (!v19)
              goto LABEL_32;
          }
        }
        do
        {
          v20 = *((_QWORD *)v19 + 1);
          if (v20 == v15)
          {
            if (!strcmp(*((const char **)v19 + 2), v7))
              return v19;
          }
          else
          {
            if (v20 >= v16)
              v20 %= v16;
            if (v20 != v3)
              break;
          }
          v19 = *(void **)v19;
        }
        while (v19);
      }
    }
  }
LABEL_32:
  v19 = operator new(0x20uLL);
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = v15;
  *((_OWORD *)v19 + 1) = *a3;
  v22 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v23 = *(float *)(a1 + 32);
  if (v16 && (float)(v23 * (float)v16) >= v22)
  {
    v15 = v3;
  }
  else
  {
    v24 = 1;
    if (v16 >= 3)
      v24 = (v16 & (v16 - 1)) != 0;
    v25 = v24 | (2 * v16);
    v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26)
      prime = v26;
    else
      prime = v25;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v16 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v16)
      goto LABEL_45;
    if (prime < v16)
    {
      v28 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v16 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        v28 = std::__next_prime(v28);
      }
      else
      {
        v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2)
          v28 = v30;
      }
      if (prime <= v28)
        prime = v28;
      if (prime < v16)
LABEL_45:
        std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__do_rehash<true>(a1, prime);
    }
    v16 = *(_QWORD *)(a1 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15)
        v15 %= v16;
    }
    else
    {
      v15 = ((_DWORD)v16 - 1) & v15;
    }
  }
  v31 = *(_QWORD *)a1;
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (v32)
  {
    *(_QWORD *)v19 = *v32;
LABEL_68:
    *v32 = v19;
    goto LABEL_69;
  }
  *(_QWORD *)v19 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v19;
  *(_QWORD *)(v31 + 8 * v15) = a1 + 16;
  if (*(_QWORD *)v19)
  {
    v33 = *(_QWORD *)(*(_QWORD *)v19 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v33 >= v16)
        v33 %= v16;
    }
    else
    {
      v33 &= v16 - 1;
    }
    v32 = (_QWORD *)(*(_QWORD *)a1 + 8 * v33);
    goto LABEL_68;
  }
LABEL_69:
  ++*(_QWORD *)(a1 + 24);
  return v19;
}

void sub_23C6507C0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  if (!a2)
  {
    v15 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v15)
      operator delete(v15);
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
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
  v8 = a1 + 16;
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v9 = v7[1];
    v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      v11 = v9 & v10;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = v8;
      while (1)
      {
        v12 = (_QWORD *)*v7;
        if (!*v7)
          break;
        v13 = v12[1] & v10;
        if (v13 == v11)
        {
          v7 = (_QWORD *)*v7;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          *v7 = *v12;
          v14 = 8 * v13;
          *v12 = **(_QWORD **)(*(_QWORD *)a1 + v14);
          **(_QWORD **)(*(_QWORD *)a1 + v14) = v12;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = v12;
          v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2)
      v9 %= a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v8;
    v16 = (_QWORD *)*v7;
    if (*v7)
    {
      while (1)
      {
        v18 = v16[1];
        if (v18 >= a2)
          v18 %= a2;
        if (v18 == v9)
          goto LABEL_25;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v18))
        {
          *v7 = *v16;
          v17 = 8 * v18;
          *v16 = **(_QWORD **)(*(_QWORD *)a1 + v17);
          **(_QWORD **)(*(_QWORD *)a1 + v17) = v16;
          v16 = v7;
LABEL_25:
          v7 = v16;
          v16 = (_QWORD *)*v16;
          if (!v16)
            return;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v7;
          v7 = v16;
          v16 = (_QWORD *)*v16;
          v9 = v18;
          if (!v16)
            return;
        }
      }
    }
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>(_QWORD *a1, const char **a2)
{
  unsigned int v2;
  const char *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  int8x8_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t **v15;
  uint64_t ***v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;

  v2 = -1640531527;
  v3 = *a2;
  v4 = *(unsigned __int8 *)*a2;
  if (**a2)
  {
    v5 = (unsigned __int8 *)(v3 + 2);
    while (*(v5 - 1))
    {
      v6 = ((v2 + v4) << 16) ^ (*(v5 - 1) << 11) ^ (v2 + v4);
      v2 = v6 + (v6 >> 11);
      v7 = *v5;
      v5 += 2;
      v4 = v7;
      if (!v7)
        goto LABEL_7;
    }
    v2 = ((v2 + v4) ^ ((v2 + v4) << 11)) + (((v2 + v4) ^ ((v2 + v4) << 11)) >> 17);
  }
LABEL_7:
  v8 = (v2 ^ (8 * v2)) + ((v2 ^ (8 * v2)) >> 5);
  v9 = (v8 ^ (4 * v8)) + ((v8 ^ (4 * v8)) >> 15);
  v10 = v9 ^ (v9 << 10);
  if (v10)
    v11 = v10;
  else
    v11 = 0x40000000;
  v12 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v12)
    return 0;
  v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    v14 = v11;
    if (*(_QWORD *)&v12 <= v11)
      v14 = v11 % *(_QWORD *)&v12;
  }
  else
  {
    v14 = (v12.i32[0] - 1) & v11;
  }
  v16 = *(uint64_t ****)(*a1 + 8 * v14);
  if (!v16)
    return 0;
  v15 = *v16;
  if (*v16)
  {
    if (v13.u32[0] < 2uLL)
    {
      v17 = *(_QWORD *)&v12 - 1;
      while (1)
      {
        v19 = v15[1];
        if (v19 == (uint64_t *)v11)
        {
          if (!strcmp((const char *)v15[2], v3))
            return v15;
        }
        else if (((unint64_t)v19 & v17) != v14)
        {
          return 0;
        }
        v15 = (uint64_t **)*v15;
        if (!v15)
          return v15;
      }
    }
    do
    {
      v18 = (unint64_t)v15[1];
      if (v18 == v11)
      {
        if (!strcmp((const char *)v15[2], v3))
          return v15;
      }
      else
      {
        if (v18 >= *(_QWORD *)&v12)
          v18 %= *(_QWORD *)&v12;
        if (v18 != v14)
          return 0;
      }
      v15 = (uint64_t **)*v15;
    }
    while (v15);
  }
  return v15;
}

uint64_t GPUTools::GL::DYGetParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  char v4;
  int v5;
  uint64_t v6;
  char v7;
  char v8;

  if ((int)this > 33306)
  {
    if ((int)this > 35367)
    {
      if ((int)this <= 35967)
      {
        v6 = (this - 35368);
        if (v6 > 0x2A)
          goto LABEL_13;
        if (((1 << (this - 40)) & 0x1BEF) != 0)
          goto LABEL_38;
        if (v6 != 42)
        {
LABEL_13:
          switch((int)this)
          {
            case 35723:
            case 35738:
            case 35739:
            case 35740:
              break;
            default:
              goto LABEL_38;
          }
        }
      }
      else
      {
        if ((int)this <= 36202)
        {
          switch((int)this)
          {
            case 35968:
            case 35969:
            case 35970:
            case 35971:
            case 35972:
            case 35973:
            case 35974:
            case 35975:
            case 35976:
            case 35978:
            case 35979:
            case 35980:
            case 35981:
            case 35982:
            case 35983:
            case 35984:
            case 35985:
            case 35986:
            case 35987:
            case 35988:
            case 35989:
            case 35990:
            case 35991:
            case 35992:
            case 35993:
            case 35994:
            case 35995:
            case 35996:
            case 35997:
            case 35998:
            case 35999:
            case 36000:
            case 36001:
            case 36002:
            case 36003:
            case 36004:
            case 36005:
            case 36006:
            case 36007:
            case 36008:
            case 36009:
            case 36010:
            case 36011:
            case 36012:
            case 36013:
            case 36014:
            case 36015:
            case 36016:
            case 36017:
            case 36018:
            case 36019:
            case 36020:
            case 36021:
            case 36022:
            case 36023:
            case 36024:
            case 36025:
            case 36026:
            case 36027:
            case 36028:
            case 36029:
            case 36030:
            case 36031:
            case 36032:
            case 36033:
            case 36034:
            case 36035:
            case 36036:
            case 36037:
            case 36038:
            case 36039:
            case 36040:
            case 36041:
            case 36042:
            case 36043:
            case 36044:
            case 36045:
            case 36046:
            case 36047:
            case 36048:
            case 36049:
            case 36050:
            case 36051:
            case 36052:
            case 36053:
            case 36054:
            case 36055:
            case 36056:
            case 36057:
            case 36058:
            case 36059:
            case 36060:
            case 36061:
            case 36062:
            case 36063:
              goto LABEL_38;
            case 35977:
              goto LABEL_26;
            default:
              if ((_DWORD)this != 36201)
                goto LABEL_38;
              goto LABEL_26;
          }
        }
        if ((int)this > 36661)
          goto LABEL_38;
        v8 = this + 8;
        if ((this - 36344) > 0x30
          || ((1 << v8) & 0x120000000003ALL) != 0
          || ((1 << v8) & 0x180000000005) == 0)
        {
          goto LABEL_38;
        }
      }
    }
    else
    {
      if ((int)this > 34465)
      {
        switch((int)this)
        {
          case 34815:
          case 34816:
          case 34817:
          case 34818:
          case 34819:
          case 34853:
          case 34854:
          case 34855:
          case 34856:
          case 34857:
          case 34858:
          case 34859:
          case 34860:
          case 34861:
          case 34862:
          case 34863:
          case 34864:
          case 34865:
          case 34866:
          case 34867:
          case 34868:
          case 34877:
          case 34913:
          case 35210:
            goto LABEL_26;
          default:
            goto LABEL_38;
        }
      }
      if ((int)this <= 34015)
      {
        if (((this - 33307) > 0x3F || ((1 << (this - 27)) & 0x8000000000000007) == 0)
          && (this - 33901) < 2)
        {
LABEL_33:
          v4 = 0;
          v5 = 2;
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      v7 = this + 32;
      if ((this - 34016) > 0x3C || ((1 << v7) & 0x10100000A0000104) != 0 || ((1 << v7) & 3) == 0)
      {
LABEL_38:
        v4 = 0;
        v5 = 1;
        goto LABEL_39;
      }
    }
LABEL_26:
    v5 = 1;
    v4 = 1;
    goto LABEL_39;
  }
  if ((int)this >= 12288)
  {
    switch((int)this)
    {
      case 32773:
LABEL_4:
        v4 = 0;
        v5 = 4;
        break;
      case 32774:
      case 32775:
      case 32776:
      case 32778:
      case 32779:
      case 32780:
      case 32781:
      case 32782:
      case 32783:
      case 32784:
      case 32785:
      case 32786:
      case 32787:
      case 32788:
      case 32789:
      case 32790:
      case 32791:
      case 32792:
      case 32793:
      case 32794:
      case 32795:
      case 32796:
      case 32797:
      case 32798:
      case 32799:
      case 32800:
      case 32801:
      case 32802:
      case 32803:
      case 32804:
      case 32805:
      case 32806:
      case 32807:
      case 32808:
      case 32809:
      case 32810:
      case 32811:
      case 32812:
      case 32813:
      case 32814:
      case 32815:
      case 32816:
      case 32817:
      case 32818:
      case 32819:
      case 32820:
      case 32821:
      case 32822:
      case 32824:
      case 32825:
      case 32827:
      case 32828:
      case 32829:
      case 32830:
      case 32831:
      case 32832:
      case 32833:
      case 32834:
      case 32835:
      case 32836:
      case 32837:
      case 32838:
      case 32839:
      case 32840:
      case 32841:
      case 32842:
      case 32843:
      case 32844:
      case 32845:
      case 32846:
      case 32847:
      case 32848:
      case 32849:
      case 32850:
      case 32851:
      case 32852:
      case 32853:
      case 32854:
      case 32855:
      case 32856:
      case 32857:
      case 32858:
      case 32859:
      case 32860:
      case 32861:
      case 32862:
      case 32863:
      case 32864:
      case 32865:
      case 32866:
      case 32867:
      case 32868:
      case 32869:
      case 32870:
      case 32871:
      case 32872:
      case 32873:
      case 32874:
      case 32875:
      case 32876:
      case 32877:
      case 32878:
      case 32879:
      case 32880:
      case 32881:
      case 32882:
      case 32883:
      case 32887:
      case 32889:
      case 32890:
      case 32892:
      case 32893:
      case 32895:
      case 32896:
      case 32897:
      case 32899:
      case 32900:
      case 32901:
      case 32902:
      case 32903:
      case 32904:
      case 32906:
      case 32907:
      case 32908:
      case 32909:
      case 32910:
      case 32911:
      case 32912:
      case 32913:
      case 32914:
      case 32915:
      case 32916:
      case 32917:
      case 32918:
      case 32919:
      case 32920:
      case 32921:
      case 32922:
      case 32923:
      case 32924:
      case 32929:
      case 32930:
      case 32931:
      case 32932:
      case 32933:
      case 32934:
      case 32935:
      case 32936:
      case 32937:
      case 32938:
      case 32940:
      case 32941:
      case 32942:
      case 32943:
      case 32944:
      case 32945:
      case 32946:
      case 32947:
      case 32948:
      case 32949:
      case 32950:
      case 32951:
      case 32952:
      case 32953:
      case 32954:
      case 32955:
      case 32956:
      case 32957:
      case 32958:
      case 32959:
      case 32960:
      case 32961:
      case 32962:
      case 32963:
      case 32964:
      case 32965:
      case 32966:
      case 32967:
      case 32972:
      case 32973:
      case 32974:
      case 32975:
      case 32976:
      case 32977:
      case 32978:
      case 32979:
      case 32980:
      case 32981:
      case 32982:
      case 32983:
      case 32984:
      case 32985:
      case 32986:
      case 32987:
      case 32988:
      case 32989:
      case 32990:
      case 32991:
      case 32992:
      case 32993:
      case 32994:
      case 32995:
      case 32996:
      case 32997:
      case 32998:
      case 32999:
      case 33000:
      case 33001:
      case 33002:
      case 33003:
      case 33004:
      case 33005:
      case 33006:
      case 33007:
      case 33008:
      case 33009:
      case 33010:
      case 33011:
      case 33012:
      case 33013:
      case 33014:
      case 33015:
      case 33016:
      case 33017:
      case 33018:
      case 33019:
      case 33020:
      case 33021:
      case 33022:
      case 33023:
      case 33024:
      case 33025:
      case 33026:
      case 33027:
      case 33028:
      case 33029:
      case 33030:
      case 33031:
      case 33032:
      case 33033:
      case 33034:
      case 33035:
      case 33036:
      case 33037:
      case 33038:
      case 33039:
      case 33040:
      case 33041:
      case 33042:
      case 33043:
      case 33044:
      case 33045:
      case 33046:
      case 33047:
      case 33048:
      case 33049:
      case 33050:
      case 33051:
      case 33052:
      case 33053:
      case 33054:
      case 33055:
      case 33056:
      case 33057:
      case 33058:
      case 33059:
      case 33060:
      case 33061:
      case 33062:
      case 33063:
      case 33064:
      case 33065:
      case 33066:
      case 33067:
      case 33068:
      case 33069:
      case 33070:
      case 33071:
      case 33072:
      case 33073:
      case 33074:
      case 33075:
      case 33076:
      case 33077:
      case 33078:
      case 33079:
      case 33080:
      case 33081:
      case 33082:
      case 33083:
      case 33084:
      case 33085:
      case 33086:
      case 33087:
      case 33088:
      case 33089:
      case 33090:
      case 33091:
      case 33092:
      case 33093:
      case 33094:
      case 33095:
      case 33096:
      case 33097:
      case 33098:
      case 33099:
      case 33100:
      case 33101:
      case 33102:
      case 33103:
      case 33104:
      case 33105:
      case 33106:
      case 33107:
      case 33108:
      case 33109:
      case 33110:
      case 33111:
      case 33112:
      case 33113:
      case 33114:
      case 33115:
      case 33116:
      case 33117:
      case 33118:
      case 33119:
      case 33120:
      case 33121:
      case 33122:
      case 33123:
      case 33124:
      case 33125:
      case 33126:
      case 33127:
      case 33128:
      case 33129:
      case 33130:
      case 33131:
      case 33132:
      case 33133:
      case 33134:
      case 33135:
      case 33136:
      case 33137:
      case 33138:
      case 33139:
      case 33140:
      case 33141:
      case 33142:
      case 33143:
      case 33144:
      case 33145:
      case 33146:
      case 33147:
      case 33148:
      case 33149:
      case 33150:
      case 33151:
      case 33152:
      case 33153:
      case 33154:
      case 33155:
      case 33156:
      case 33157:
      case 33158:
      case 33159:
      case 33160:
      case 33161:
      case 33162:
      case 33163:
      case 33164:
      case 33165:
      case 33166:
      case 33167:
      case 33168:
      case 33169:
        goto LABEL_38;
      case 32777:
      case 32823:
      case 32826:
      case 32884:
      case 32885:
      case 32886:
      case 32888:
      case 32891:
      case 32894:
      case 32898:
      case 32905:
      case 32925:
      case 32926:
      case 32927:
      case 32928:
      case 32939:
      case 32968:
      case 32969:
      case 32970:
      case 32971:
      case 33170:
        goto LABEL_26;
      default:
        if ((this - 12288) >= 8 && (this - 0x4000) >= 8)
          goto LABEL_38;
        goto LABEL_26;
    }
  }
  else
  {
    v4 = 0;
    v5 = 16;
    switch((int)this)
    {
      case 2816:
      case 2819:
      case 2899:
      case 2918:
      case 2978:
      case 3088:
      case 3106:
      case 3107:
        goto LABEL_4;
      case 2818:
        v4 = 0;
        v5 = 3;
        break;
      case 2832:
      case 2848:
      case 2849:
      case 2884:
      case 2885:
      case 2886:
      case 2896:
      case 2898:
      case 2900:
      case 2903:
      case 2912:
      case 2917:
      case 2929:
      case 2930:
      case 2932:
      case 2960:
      case 2962:
      case 2964:
      case 2965:
      case 2966:
      case 2976:
      case 2977:
      case 3008:
      case 3009:
      case 3024:
      case 3040:
      case 3041:
      case 3042:
      case 3056:
      case 3058:
      case 3074:
      case 3089:
      case 3152:
      case 3153:
      case 3154:
      case 3156:
      case 3553:
        goto LABEL_26;
      case 2834:
      case 2850:
      case 2928:
      case 3386:
        goto LABEL_33;
      case 2982:
      case 2983:
      case 2984:
        break;
      default:
        goto LABEL_38;
    }
  }
LABEL_39:
  if (a2)
    *a2 = v5;
  if (a3)
    *(_BYTE *)a3 = v4;
  return this;
}

uint64_t GPUTools::GL::dy_light_model_param_component_count(GPUTools::GL *this)
{
  if (((_DWORD)this - 2897) >= 2 && (_DWORD)this == 2899)
    return 4;
  else
    return 1;
}

uint64_t GPUTools::GL::dy_light_array_size(GPUTools::GL *this)
{
  int v1;
  uint64_t result;

  v1 = (int)this;
  result = 1;
  if (v1 <= 4611)
  {
    if ((v1 - 4608) >= 4)
      return result;
    return 4;
  }
  if (v1 > 5633)
  {
    if (v1 == 5634)
      return 4;
    if (v1 != 5635)
      return result;
    return 3;
  }
  if (v1 == 4612)
    return 3;
  if (v1 == 5632)
    return 4;
  return result;
}

uint64_t GPUTools::GL::dy_fog_param_component_count(GPUTools::GL *this)
{
  if (((_DWORD)this - 2913) < 5)
    return 1;
  if ((_DWORD)this == 2918)
    return 4;
  return 1;
}

uint64_t GPUTools::GL::DYMaterialParameterComponentCount(GPUTools::GL *this)
{
  int v1;
  uint64_t result;

  v1 = (int)this;
  result = 4;
  switch(v1)
  {
    case 5632:
    case 5634:
      return result;
    case 5633:
      result = 1;
      break;
    case 5635:
      result = 3;
      break;
    default:
      if ((v1 - 4608) >= 3)
        result = 1;
      else
        result = 4;
      break;
  }
  return result;
}

double GPUTools::GL::DYGetTextureTargetInfo(int a1, uint64_t a2)
{
  double result;
  _BYTE *v3;

  if (!a2)
    __assert_rtn("void GPUTools::GL::DYGetTextureTargetInfo(GLenum, TextureTargetInfo *)", (const char *)&unk_23C65FE76, 0, "info");
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  if (a1 > 34036)
  {
    switch(a1)
    {
      case 34037:
        goto LABEL_28;
      case 34038:
      case 34040:
      case 34041:
      case 34042:
      case 34043:
      case 34044:
      case 34045:
      case 34046:
      case 34047:
      case 34048:
      case 34049:
      case 34050:
      case 34051:
      case 34052:
      case 34053:
      case 34054:
      case 34055:
      case 34056:
      case 34057:
      case 34058:
      case 34059:
      case 34060:
      case 34061:
      case 34062:
      case 34063:
      case 34064:
      case 34065:
      case 34066:
      case 34068:
        goto LABEL_24;
      case 34039:
        *(_BYTE *)(a2 + 13) = 1;
LABEL_28:
        *(_QWORD *)&result = 0x84F6000084F8;
        goto LABEL_26;
      case 34067:
        goto LABEL_11;
      case 34069:
      case 34070:
      case 34071:
      case 34072:
      case 34073:
      case 34074:
        v3 = (_BYTE *)(a2 + 11);
        goto LABEL_10;
      case 34075:
        v3 = (_BYTE *)(a2 + 13);
LABEL_10:
        *v3 = 1;
LABEL_11:
        *(_QWORD *)&result = 0x85140000851CLL;
        goto LABEL_26;
      default:
        switch(a1)
        {
          case 35864:
            goto LABEL_17;
          case 35865:
            *(_BYTE *)(a2 + 13) = 1;
LABEL_17:
            *(_QWORD *)&result = 0x8C1C00000D33;
            *(_QWORD *)a2 = 0x8C1C00000D33;
            *(_WORD *)(a2 + 8) = 258;
            *(_BYTE *)(a2 + 10) = 1;
            *(_BYTE *)(a2 + 14) = 1;
            return result;
          case 35866:
            goto LABEL_31;
          case 35867:
            *(_BYTE *)(a2 + 13) = 1;
LABEL_31:
            *(_QWORD *)&result = 0x8C1D00000D33;
            *(_QWORD *)a2 = 0x8C1D00000D33;
            *(_WORD *)(a2 + 8) = 259;
            *(_BYTE *)(a2 + 10) = 1;
            *(_BYTE *)(a2 + 14) = 1;
            break;
          case 35868:
          case 35869:
          case 35870:
          case 35871:
          case 35872:
          case 35873:
          case 35874:
          case 35875:
          case 35876:
          case 35877:
          case 35878:
          case 35879:
          case 35880:
          case 35881:
            goto LABEL_24;
          case 35882:
            *(_QWORD *)&result = 0x8C2C00008C2BLL;
            *(_QWORD *)a2 = 0x8C2C00008C2BLL;
            *(_BYTE *)(a2 + 8) = 1;
            break;
          default:
            switch(a1)
            {
              case 37120:
                goto LABEL_23;
              case 37121:
                *(_BYTE *)(a2 + 13) = 1;
LABEL_23:
                *(_QWORD *)&result = 0x910400000D33;
                *(_QWORD *)a2 = 0x910400000D33;
                *(_BYTE *)(a2 + 8) = 2;
                *(_BYTE *)(a2 + 12) = 1;
                return result;
              case 37122:
                goto LABEL_34;
              case 37123:
                *(_BYTE *)(a2 + 13) = 1;
LABEL_34:
                *(_QWORD *)&result = 0x910500000D33;
                *(_QWORD *)a2 = 0x910500000D33;
                *(_BYTE *)(a2 + 8) = 3;
                *(_BYTE *)(a2 + 10) = 1;
                *(_BYTE *)(a2 + 12) = 1;
                break;
              default:
                goto LABEL_24;
            }
            break;
        }
        return result;
    }
  }
  if (a1 <= 32866)
  {
    if (a1 != 3552)
    {
      if (a1 == 3553)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_19:
    *(_QWORD *)&result = 0x806800000D33;
    *(_QWORD *)a2 = 0x806800000D33;
    *(_WORD *)(a2 + 8) = 257;
    *(_BYTE *)(a2 + 14) = 1;
    return result;
  }
  switch(a1)
  {
    case 32867:
      *(_BYTE *)(a2 + 13) = 1;
      goto LABEL_19;
    case 32868:
      *(_BYTE *)(a2 + 13) = 1;
      goto LABEL_25;
    case 32879:
      *(_QWORD *)&result = 0x806A00008073;
      *(_QWORD *)a2 = 0x806A00008073;
      *(_WORD *)(a2 + 8) = 259;
      *(_BYTE *)(a2 + 14) = 1;
      return result;
  }
LABEL_24:
  *(_QWORD *)(a2 + 8) = 0;
LABEL_25:
  *(_QWORD *)&result = 0x806900000D33;
LABEL_26:
  *(double *)a2 = result;
  *(_WORD *)(a2 + 8) = 258;
  *(_BYTE *)(a2 + 14) = 1;
  return result;
}

uint64_t GPUTools::GL::DYGetTextureParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  int v4;
  char v5;
  int v6;
  int v7;

  if ((int)this > 34229)
  {
    if ((int)this > 35740)
    {
      if ((int)this <= 36421)
      {
        if ((this - 36418) >= 4)
        {
          v4 = 35741;
LABEL_17:
          if ((_DWORD)this == v4)
          {
            v5 = 0;
            v6 = 4;
            if (!a2)
              goto LABEL_34;
LABEL_33:
            *a2 = v6;
            goto LABEL_34;
          }
          goto LABEL_27;
        }
LABEL_32:
        v6 = 1;
        v5 = 1;
        if (!a2)
          goto LABEL_34;
        goto LABEL_33;
      }
      if ((_DWORD)this == 36422)
      {
        v5 = 1;
        v6 = 4;
        if (a2)
          goto LABEL_33;
        goto LABEL_34;
      }
      v7 = 37167;
      goto LABEL_31;
    }
    if ((int)this <= 34890)
    {
      if ((_DWORD)this == 34230)
        goto LABEL_32;
      if ((_DWORD)this == 34231)
        goto LABEL_27;
      v7 = 34236;
      goto LABEL_31;
    }
    if ((this - 34891) < 3
      || (this - 35400) <= 0x37 && ((1 << (this - 72)) & 0x80000000000009) != 0)
    {
      goto LABEL_32;
    }
  }
  else if ((int)this > 32958)
  {
    if ((int)this > 33168 && (_DWORD)this == 33169)
      goto LABEL_32;
  }
  else
  {
    if ((int)this <= 10494)
    {
      if ((this - 10240) >= 4)
      {
        v4 = 4100;
        goto LABEL_17;
      }
      goto LABEL_32;
    }
    if ((_DWORD)this == 10495)
      goto LABEL_32;
    if ((_DWORD)this != 32870)
    {
      v7 = 32882;
LABEL_31:
      if ((_DWORD)this == v7)
        goto LABEL_32;
    }
  }
LABEL_27:
  v5 = 0;
  v6 = 1;
  if (a2)
    goto LABEL_33;
LABEL_34:
  if (a3)
    *(_BYTE *)a3 = v5;
  return this;
}

uint64_t GPUTools::GL::DYGetTexEnvParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  int v4;
  char v5;

  if ((int)this > 9471)
  {
    switch((int)this)
    {
      case 34049:
      case 34050:
      case 34051:
      case 34052:
      case 34053:
      case 34054:
      case 34055:
      case 34056:
      case 34057:
      case 34058:
      case 34059:
      case 34060:
      case 34061:
      case 34062:
      case 34063:
      case 34064:
      case 34065:
      case 34066:
      case 34067:
      case 34068:
      case 34069:
      case 34070:
      case 34071:
      case 34072:
      case 34073:
      case 34074:
      case 34075:
      case 34076:
      case 34077:
      case 34078:
      case 34079:
      case 34080:
      case 34081:
      case 34082:
      case 34083:
      case 34084:
      case 34085:
      case 34086:
      case 34087:
      case 34088:
      case 34089:
      case 34090:
      case 34091:
      case 34092:
      case 34093:
      case 34094:
      case 34095:
      case 34096:
      case 34097:
      case 34098:
      case 34099:
      case 34100:
      case 34101:
      case 34102:
      case 34103:
      case 34104:
      case 34105:
      case 34106:
      case 34107:
      case 34108:
      case 34109:
      case 34110:
      case 34111:
      case 34112:
      case 34113:
      case 34114:
      case 34115:
      case 34116:
      case 34117:
      case 34118:
      case 34119:
      case 34120:
      case 34121:
      case 34122:
      case 34123:
      case 34124:
      case 34125:
      case 34126:
      case 34127:
      case 34128:
      case 34129:
      case 34130:
      case 34131:
      case 34132:
      case 34133:
      case 34134:
      case 34135:
      case 34136:
      case 34137:
      case 34138:
      case 34139:
      case 34140:
      case 34141:
      case 34142:
      case 34143:
      case 34144:
      case 34145:
      case 34146:
      case 34147:
      case 34148:
      case 34149:
      case 34150:
      case 34151:
      case 34152:
      case 34153:
      case 34154:
      case 34155:
      case 34156:
      case 34157:
      case 34158:
      case 34159:
      case 34160:
      case 34163:
      case 34164:
      case 34165:
      case 34166:
      case 34167:
      case 34168:
      case 34169:
      case 34170:
      case 34171:
      case 34172:
      case 34173:
      case 34174:
      case 34175:
      case 34179:
      case 34180:
      case 34181:
      case 34182:
      case 34183:
      case 34187:
      case 34188:
      case 34189:
      case 34190:
      case 34191:
      case 34195:
      case 34196:
      case 34197:
      case 34198:
      case 34199:
        goto LABEL_10;
      case 34161:
      case 34162:
      case 34176:
      case 34177:
      case 34178:
      case 34184:
      case 34185:
      case 34186:
      case 34192:
      case 34193:
      case 34194:
      case 34200:
      case 34201:
      case 34202:
        goto LABEL_3;
      default:
        if ((_DWORD)this != 9472 && (_DWORD)this != 34914)
          goto LABEL_10;
        goto LABEL_3;
    }
  }
  if ((_DWORD)this == 3356)
    goto LABEL_10;
  if ((_DWORD)this == 8704)
  {
LABEL_3:
    v4 = 1;
    v5 = 1;
    goto LABEL_11;
  }
  if ((_DWORD)this != 8705)
  {
LABEL_10:
    v5 = 0;
    v4 = 1;
  }
  else
  {
    v5 = 0;
    v4 = 4;
  }
LABEL_11:
  if (a2)
    *a2 = v4;
  if (a3)
    *(_BYTE *)a3 = v5;
  return this;
}

uint64_t GPUTools::GL::DYTexGenParameterComponentCount(GPUTools::GL *this)
{
  if (((_DWORD)this - 9472) > 2)
    return 1;
  else
    return dword_23C691DC0[(int)this - 9472];
}

uint64_t GPUTools::GL::DYGetProgramParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  char v4;

  v4 = 0;
  if ((int)this > 35966)
  {
    if ((this - 36315) >= 2 && (_DWORD)this != 35967)
      goto LABEL_13;
LABEL_12:
    v4 = 1;
    goto LABEL_13;
  }
  if ((this - 35712) <= 3 && (_DWORD)this != 35713 || (_DWORD)this == 33367)
    goto LABEL_12;
LABEL_13:
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = v4;
  return this;
}

uint64_t GPUTools::GL::DYShaderParameterComponentCount(GPUTools::GL *this)
{
  return 1;
}

void GPUTools::GL::DYGetProgramPipelineParameterInfo(GPUTools::GL *this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = 0;
}

uint64_t GPUTools::GL::DYGetShaderVariableTypeInfo(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int32x2_t v7;
  unsigned int v8;
  char v9;
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

  if (!a2)
    __assert_rtn("void GPUTools::GL::DYGetShaderVariableTypeInfo(const GLenum, ShaderVariableTypeInfo *)", (const char *)&unk_23C65FE76, 0, "pVariableTypeInfo");
  v2 = 0x26200001406;
  v3 = 0x100000001;
  v4 = 1;
  if ((int)result <= 36287)
  {
    if ((int)result <= 35663)
    {
      switch((_DWORD)result)
      {
        case 0x1404:
LABEL_14:
          v7 = (int32x2_t)0x26400001404;
LABEL_15:
          *(_DWORD *)a2 = 1;
          *(int32x2_t *)(a2 + 4) = v7;
          *(_QWORD *)(a2 + 16) = 0x100000001;
          *(_BYTE *)(a2 + 12) = 0;
          return result;
        case 0x1405:
          v8 = 614;
          break;
        case 0x140A:
          v8 = 1010;
          break;
        default:
          goto LABEL_9;
      }
      v7 = vdup_n_s32(v8);
      v7.i32[0] = result;
      goto LABEL_15;
    }
    switch((int)result)
    {
      case 35664:
        v5 = 0x26800001406;
        goto LABEL_31;
      case 35665:
        v11 = 0x26E00001406;
        goto LABEL_33;
      case 35666:
        v9 = 0;
        v10 = 0x400000001;
        v6 = 0x27400001406;
        goto LABEL_37;
      case 35667:
      case 35671:
        v3 = 0x200000001;
        v2 = 0x26A00001404;
        v4 = 2;
        goto LABEL_9;
      case 35668:
      case 35672:
        v11 = 0x27000001404;
        goto LABEL_33;
      case 35669:
      case 35673:
        v9 = 0;
        v10 = 0x400000001;
        v6 = 0x27600001404;
        goto LABEL_37;
      case 35670:
      case 35677:
      case 35678:
      case 35679:
      case 35680:
      case 35681:
      case 35682:
      case 35683:
      case 35684:
        goto LABEL_14;
      case 35674:
        v6 = 0x27A00001406;
LABEL_36:
        v10 = 0x200000002;
        v9 = 1;
        goto LABEL_37;
      case 35675:
        v12 = 0x27D00001406;
LABEL_49:
        *(_DWORD *)a2 = 9;
        *(_QWORD *)(a2 + 4) = v12;
        *(_QWORD *)(a2 + 16) = 0x300000003;
        *(_BYTE *)(a2 + 12) = 1;
        return result;
      case 35676:
        v13 = 0x28000001406;
LABEL_51:
        *(_DWORD *)a2 = 16;
        *(_QWORD *)(a2 + 4) = v13;
        *(_QWORD *)(a2 + 16) = 0x400000004;
        *(_BYTE *)(a2 + 12) = 1;
        return result;
      case 35685:
        v14 = 0x200000003;
        v15 = 0x27B00001406;
        goto LABEL_55;
      case 35686:
        v16 = 0x200000004;
        v17 = 0x27C00001406;
        goto LABEL_58;
      case 35687:
        v14 = 0x300000002;
        v15 = 0x27E00001406;
LABEL_55:
        *(_DWORD *)a2 = 6;
        *(_QWORD *)(a2 + 4) = v15;
        *(_QWORD *)(a2 + 16) = v14;
        *(_BYTE *)(a2 + 12) = 1;
        return result;
      case 35688:
        v18 = 0x300000004;
        v19 = 0x27F00001406;
        goto LABEL_60;
      case 35689:
        v16 = 0x400000002;
        v17 = 0x28100001406;
LABEL_58:
        *(_DWORD *)a2 = 8;
        *(_QWORD *)(a2 + 4) = v17;
        *(_QWORD *)(a2 + 16) = v16;
        *(_BYTE *)(a2 + 12) = 1;
        return result;
      case 35690:
        v18 = 0x400000003;
        v19 = 0x28200001406;
LABEL_60:
        *(_DWORD *)a2 = 12;
        *(_QWORD *)(a2 + 4) = v19;
        *(_QWORD *)(a2 + 16) = v18;
        *(_BYTE *)(a2 + 12) = 1;
        break;
      default:
        goto LABEL_9;
    }
  }
  else
  {
    if ((int)result <= 36677)
    {
      switch((int)result)
      {
        case 36288:
        case 36289:
        case 36290:
        case 36291:
        case 36292:
        case 36293:
        case 36297:
        case 36298:
        case 36299:
        case 36300:
        case 36301:
        case 36302:
        case 36303:
        case 36304:
        case 36305:
        case 36306:
        case 36307:
        case 36308:
        case 36309:
        case 36310:
        case 36311:
        case 36312:
          goto LABEL_14;
        case 36294:
          v5 = 0x26C00001405;
          goto LABEL_31;
        case 36295:
          v11 = 0x27200001405;
          goto LABEL_33;
        case 36296:
          v9 = 0;
          v10 = 0x400000001;
          v6 = 0x27800001405;
          goto LABEL_37;
        default:
          goto LABEL_9;
      }
    }
    if ((int)result <= 36860)
    {
      switch((int)result)
      {
        case 36678:
          v6 = 0x3F90000140ALL;
          goto LABEL_36;
        case 36679:
          v12 = 0x3FC0000140ALL;
          goto LABEL_49;
        case 36680:
          v13 = 0x3FF0000140ALL;
          goto LABEL_51;
        case 36681:
          v14 = 0x200000003;
          v15 = 0x3FA0000140ALL;
          goto LABEL_55;
        case 36682:
          v16 = 0x200000004;
          v17 = 0x3FB0000140ALL;
          goto LABEL_58;
        case 36683:
          v14 = 0x300000002;
          v15 = 0x3FD0000140ALL;
          goto LABEL_55;
        case 36684:
          v18 = 0x300000004;
          v19 = 0x3FE0000140ALL;
          goto LABEL_60;
        case 36685:
          v16 = 0x400000002;
          v17 = 0x4000000140ALL;
          goto LABEL_58;
        case 36686:
          v18 = 0x400000003;
          v19 = 0x4010000140ALL;
          goto LABEL_60;
        default:
          if ((_DWORD)result != 36860)
            goto LABEL_9;
          v5 = 0x3F40000140ALL;
          break;
      }
LABEL_31:
      *(_DWORD *)a2 = 2;
      *(_QWORD *)(a2 + 4) = v5;
      *(_QWORD *)(a2 + 16) = 0x200000001;
      *(_BYTE *)(a2 + 12) = 0;
      return result;
    }
    if ((result - 37128) < 6)
      goto LABEL_14;
    if ((_DWORD)result != 36861)
    {
      if ((_DWORD)result == 36862)
      {
        v9 = 0;
        v10 = 0x400000001;
        v6 = 0x3F80000140ALL;
LABEL_37:
        *(_DWORD *)a2 = 4;
        *(_QWORD *)(a2 + 4) = v6;
        *(_QWORD *)(a2 + 16) = v10;
        *(_BYTE *)(a2 + 12) = v9;
        return result;
      }
LABEL_9:
      *(_DWORD *)a2 = v4;
      *(_QWORD *)(a2 + 4) = v2;
      *(_QWORD *)(a2 + 16) = v3;
      *(_BYTE *)(a2 + 12) = 0;
      return result;
    }
    v11 = 0x3F60000140ALL;
LABEL_33:
    *(_DWORD *)a2 = 3;
    *(_QWORD *)(a2 + 4) = v11;
    *(_QWORD *)(a2 + 16) = 0x300000001;
    *(_BYTE *)(a2 + 12) = 0;
  }
  return result;
}

uint64_t GPUTools::GL::DYGetVertexAttribParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  int v4;
  char v5;

  v4 = 1;
  if ((int)this > 34921)
  {
    if ((int)this > 35068)
    {
      v5 = 1;
      if ((_DWORD)this == 35069)
        goto LABEL_9;
    }
    else
    {
      v5 = 1;
      if ((_DWORD)this == 34922)
        goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
    v4 = 1;
  }
  else
  {
    v5 = 1;
    switch((int)this)
    {
      case 34338:
      case 34341:
        break;
      case 34342:
        v5 = 0;
        v4 = 4;
        break;
      default:
        goto LABEL_8;
    }
  }
LABEL_9:
  if (a2)
    *a2 = v4;
  if (a3)
    *(_BYTE *)a3 = v5;
  return this;
}

uint64_t GPUTools::GL::DYGetActiveUniformParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = (_DWORD)this == 35383;
  return this;
}

uint64_t GPUTools::GL::DYGetActiveUniformBlockParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = (this & 0xFFFFFFFD) == 35396;
  return this;
}

uint64_t GPUTools::GL::DYGetShaderTypeFromMask(GPUTools::GL *this)
{
  int v1;
  uint64_t result;

  v1 = (_DWORD)this - 1;
  result = 35633;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 35632;
      break;
    case 3:
      result = 36313;
      break;
    case 7:
      result = 36488;
      break;
    case 15:
      result = 36487;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t GPUTools::GL::DYGetRenderbufferParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  char v4;

  if ((this - 36162) > 0x13 || (v4 = 1, ((1 << (this - 66)) & 0xFC003) != 0) || (_DWORD)this != 36164)
    v4 = 0;
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = v4;
  return this;
}

uint64_t GPUTools::GL::DYGetFramebufferAttachmentParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  char v4;

  v4 = 1;
  if ((int)this > 36047)
  {
    if ((this - 36048) > 4 || ((1 << (this + 48)) & 0x16) != 0)
      goto LABEL_7;
  }
  else if ((this - 33298) < 6 || (this - 33296) >= 2)
  {
LABEL_7:
    v4 = 0;
  }
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = v4;
  return this;
}

uint64_t GPUTools::GL::GetFramebufferAttachmentMaskInfo(GPUTools::GL *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2930;
  v2 = 3107;
  if ((_DWORD)this == 36128)
    v2 = 2968;
  if ((_DWORD)this != 36096)
    v1 = v2;
  if ((_DWORD)this == 33306)
  {
    v1 = 2930;
    v3 = 0xB9800000000;
  }
  else
  {
    v3 = 0;
  }
  return v3 | v1;
}

uint64_t GPUTools::GL::DYGetFramebufferAttachment(GPUTools::GL *this, int a2)
{
  if ((int)this > 6145)
  {
    if ((_DWORD)this != 6146)
    {
      if ((_DWORD)this == 34041)
        return 33306;
      return 36064;
    }
    return 36128;
  }
  else
  {
    if ((_DWORD)this != 6144)
    {
      if ((_DWORD)this == 6145)
        return 36096;
      return 36064;
    }
    return (a2 + 36064);
  }
}

uint64_t GPUTools::GL::DYGetBufferParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  BOOL v5;

  v5 = (this - 35003) < 2 || (_DWORD)this == 34661;
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = v5;
  return this;
}

void GPUTools::GL::DYGetQueryParameterInfo(GPUTools::GL *this, unsigned int a2, _DWORD *a3, unsigned int *a4, BOOL *a5)
{
  if (a3)
    *a3 = 1;
  if (a4)
    *(_BYTE *)a4 = 0;
}

uint64_t GPUTools::GL::DYGetQueryObjectParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = (_DWORD)this == 34919;
  return this;
}

int *GPUTools::GL::GetInternalFormatInfo(GPUTools::GL *this)
{
  int v1;
  int *result;
  uint64_t v3;

  v1 = (int)this;
  result = &GPUTools::GL::sInternalFormatsTable;
  v3 = 6660;
  while (*result != v1)
  {
    result += 15;
    v3 -= 60;
    if (!v3)
      return (int *)&GPUTools::GL::sUnknownFormat;
  }
  return result;
}

uint64_t GPUTools::GL::EnumerateInternalFormats(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  BOOL v6;
  char v7;

  v7 = 0;
  v2 = &GPUTools::GL::sInternalFormatsTable;
  v3 = 6600;
  do
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (!v4)
      std::__throw_bad_function_call[abi:ne180100]();
    result = (*(uint64_t (**)(uint64_t, int *, char *))(*(_QWORD *)v4 + 48))(v4, v2, &v7);
    v2 += 15;
    if (v7)
      v6 = 1;
    else
      v6 = v3 == 0;
    v3 -= 60;
  }
  while (!v6);
  return result;
}

{
  int *v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  char v6;

  v6 = 0;
  v2 = &GPUTools::GL::sInternalFormatsTable;
  v3 = 6600;
  do
  {
    result = (*(uint64_t (**)(uint64_t, int *, char *))(a1 + 16))(a1, v2, &v6);
    v2 += 15;
    if (v6)
      v5 = 1;
    else
      v5 = v3 == 0;
    v3 -= 60;
  }
  while (!v5);
  return result;
}

void *GPUTools::GL::GetCompressedFormatInfo(GPUTools::GL *this)
{
  void *result;
  int v2;
  uint64_t v3;

  if ((int)this > 36282)
  {
    switch((int)this)
    {
      case 37488:
        result = &unk_23C690FC0;
        break;
      case 37489:
        result = &unk_23C690FFC;
        break;
      case 37490:
        result = &unk_23C691038;
        break;
      case 37491:
        result = &unk_23C691074;
        break;
      case 37492:
        result = &unk_23C690E58;
        break;
      case 37493:
        result = &unk_23C690E94;
        break;
      case 37494:
        result = &unk_23C690ED0;
        break;
      case 37495:
        result = &unk_23C690F0C;
        break;
      case 37496:
        result = &unk_23C690F48;
        break;
      case 37497:
        result = &unk_23C690F84;
        break;
      case 37498:
      case 37499:
      case 37500:
      case 37501:
      case 37502:
      case 37503:
      case 37504:
      case 37505:
      case 37506:
      case 37507:
      case 37508:
      case 37509:
      case 37510:
      case 37511:
      case 37512:
      case 37513:
      case 37514:
      case 37515:
      case 37516:
      case 37517:
      case 37518:
      case 37519:
      case 37520:
      case 37521:
      case 37522:
      case 37523:
      case 37524:
      case 37525:
      case 37526:
      case 37527:
      case 37528:
      case 37529:
      case 37530:
      case 37531:
      case 37532:
      case 37533:
      case 37534:
      case 37535:
      case 37536:
      case 37537:
      case 37538:
      case 37539:
      case 37540:
      case 37541:
      case 37542:
      case 37543:
      case 37544:
      case 37545:
      case 37546:
      case 37547:
      case 37548:
      case 37549:
      case 37550:
      case 37551:
      case 37552:
      case 37553:
      case 37554:
      case 37555:
      case 37556:
      case 37557:
      case 37558:
      case 37559:
      case 37560:
      case 37561:
      case 37562:
      case 37563:
      case 37564:
      case 37565:
      case 37566:
      case 37567:
      case 37568:
      case 37569:
      case 37570:
      case 37571:
      case 37572:
      case 37573:
      case 37574:
      case 37575:
      case 37576:
      case 37577:
      case 37578:
      case 37579:
      case 37580:
      case 37581:
      case 37582:
      case 37583:
      case 37584:
      case 37585:
      case 37586:
      case 37587:
      case 37588:
      case 37589:
      case 37590:
      case 37591:
      case 37592:
      case 37593:
      case 37594:
      case 37595:
      case 37596:
      case 37597:
      case 37598:
      case 37599:
      case 37600:
      case 37601:
      case 37602:
      case 37603:
      case 37604:
      case 37605:
      case 37606:
      case 37607:
      case 37608:
      case 37609:
      case 37610:
      case 37611:
      case 37612:
      case 37613:
      case 37614:
      case 37615:
      case 37616:
      case 37617:
      case 37618:
      case 37619:
      case 37620:
      case 37621:
      case 37622:
      case 37623:
      case 37624:
      case 37625:
      case 37626:
      case 37627:
      case 37628:
      case 37629:
      case 37630:
      case 37631:
      case 37632:
      case 37633:
      case 37634:
      case 37635:
      case 37636:
      case 37637:
      case 37638:
      case 37639:
      case 37640:
      case 37641:
      case 37642:
      case 37643:
      case 37644:
      case 37645:
      case 37646:
      case 37647:
      case 37648:
      case 37649:
      case 37650:
      case 37651:
      case 37652:
      case 37653:
      case 37654:
      case 37655:
      case 37656:
      case 37657:
      case 37658:
      case 37659:
      case 37660:
      case 37661:
      case 37662:
      case 37663:
      case 37664:
      case 37665:
      case 37666:
      case 37667:
      case 37668:
      case 37669:
      case 37670:
      case 37671:
      case 37672:
      case 37673:
      case 37674:
      case 37675:
      case 37676:
      case 37677:
      case 37678:
      case 37679:
      case 37680:
      case 37681:
      case 37682:
      case 37683:
      case 37684:
      case 37685:
      case 37686:
      case 37687:
      case 37688:
      case 37689:
      case 37690:
      case 37691:
      case 37692:
      case 37693:
      case 37694:
      case 37695:
      case 37696:
      case 37697:
      case 37698:
      case 37699:
      case 37700:
      case 37701:
      case 37702:
      case 37703:
      case 37704:
      case 37705:
      case 37706:
      case 37707:
      case 37708:
      case 37709:
      case 37710:
      case 37711:
      case 37712:
      case 37713:
      case 37714:
      case 37715:
      case 37716:
      case 37717:
      case 37718:
      case 37719:
      case 37720:
      case 37721:
      case 37722:
      case 37723:
      case 37724:
      case 37725:
      case 37726:
      case 37727:
      case 37728:
      case 37729:
      case 37730:
      case 37731:
      case 37732:
      case 37733:
      case 37734:
      case 37735:
      case 37736:
      case 37737:
      case 37738:
      case 37739:
      case 37740:
      case 37741:
      case 37742:
      case 37743:
      case 37744:
      case 37745:
      case 37746:
      case 37747:
      case 37748:
      case 37749:
      case 37750:
      case 37751:
      case 37752:
      case 37753:
      case 37754:
      case 37755:
      case 37756:
      case 37757:
      case 37758:
      case 37759:
      case 37760:
      case 37761:
      case 37762:
      case 37763:
      case 37764:
      case 37765:
      case 37766:
      case 37767:
      case 37768:
      case 37769:
      case 37770:
      case 37771:
      case 37772:
      case 37773:
      case 37774:
      case 37775:
      case 37776:
      case 37777:
      case 37778:
      case 37779:
      case 37780:
      case 37781:
      case 37782:
      case 37783:
      case 37784:
      case 37785:
      case 37786:
      case 37787:
      case 37788:
      case 37789:
      case 37790:
      case 37791:
      case 37792:
      case 37793:
      case 37794:
      case 37795:
      case 37796:
      case 37797:
      case 37798:
      case 37799:
      case 37800:
      case 37801:
      case 37802:
      case 37803:
      case 37804:
      case 37805:
      case 37806:
      case 37807:
      case 37822:
      case 37823:
      case 37824:
      case 37825:
      case 37826:
      case 37827:
      case 37828:
      case 37829:
      case 37830:
      case 37831:
      case 37832:
      case 37833:
      case 37834:
      case 37835:
      case 37836:
      case 37837:
      case 37838:
      case 37839:
      case 37854:
      case 37855:
      case 37856:
      case 37857:
      case 37858:
      case 37859:
      case 37860:
      case 37861:
      case 37862:
      case 37863:
      case 37864:
      case 37865:
      case 37866:
      case 37867:
      case 37868:
      case 37869:
      case 37870:
      case 37871:
      case 37872:
      case 37873:
      case 37875:
      case 37876:
      case 37877:
      case 37878:
      case 37879:
      case 37880:
      case 37881:
      case 37882:
      case 37883:
      case 37884:
      case 37885:
        goto LABEL_98;
      case 37808:
        result = &unk_23C6910B0;
        break;
      case 37809:
        result = &unk_23C6910EC;
        break;
      case 37810:
        result = &unk_23C691128;
        break;
      case 37811:
        result = &unk_23C691164;
        break;
      case 37812:
        result = &unk_23C6911A0;
        break;
      case 37813:
        result = &unk_23C6911DC;
        break;
      case 37814:
        result = &unk_23C691218;
        break;
      case 37815:
        result = &unk_23C691254;
        break;
      case 37816:
        result = &unk_23C691290;
        break;
      case 37817:
        result = &unk_23C6912CC;
        break;
      case 37818:
        result = &unk_23C691308;
        break;
      case 37819:
        result = &unk_23C691344;
        break;
      case 37820:
        result = &unk_23C691380;
        break;
      case 37821:
        result = &unk_23C6913BC;
        break;
      case 37840:
        result = &unk_23C6913F8;
        break;
      case 37841:
        result = &unk_23C691434;
        break;
      case 37842:
        result = &unk_23C691470;
        break;
      case 37843:
        result = &unk_23C6914AC;
        break;
      case 37844:
        result = &unk_23C6914E8;
        break;
      case 37845:
        result = &unk_23C691524;
        break;
      case 37846:
        result = &unk_23C691560;
        break;
      case 37847:
        result = &unk_23C69159C;
        break;
      case 37848:
        result = &unk_23C6915D8;
        break;
      case 37849:
        result = &unk_23C691614;
        break;
      case 37850:
        result = &unk_23C691650;
        break;
      case 37851:
        result = &unk_23C69168C;
        break;
      case 37852:
        result = &unk_23C6916C8;
        break;
      case 37853:
        result = &unk_23C691704;
        break;
      case 37874:
        result = &unk_23C691BF0;
        break;
      case 37886:
        result = &unk_23C691830;
        break;
      case 37887:
        result = &unk_23C69186C;
        break;
      case 37888:
        result = &unk_23C6918A8;
        break;
      case 37889:
        result = &unk_23C6918E4;
        break;
      case 37890:
        result = &unk_23C691920;
        break;
      case 37891:
        result = &unk_23C69195C;
        break;
      case 37892:
        result = &unk_23C691998;
        break;
      case 37893:
        result = &unk_23C6919D4;
        break;
      case 37894:
        result = &unk_23C691A10;
        break;
      case 37895:
        result = &unk_23C691A4C;
        break;
      case 37896:
        result = &unk_23C691A88;
        break;
      case 37897:
        result = &unk_23C691AC4;
        break;
      case 37898:
        result = &unk_23C691B00;
        break;
      case 37899:
        result = &unk_23C691B3C;
        break;
      case 37900:
        result = &unk_23C691B78;
        break;
      case 37901:
        result = &unk_23C691BB4;
        break;
      default:
        switch((int)this)
        {
          case 36283:
            result = &unk_23C690C78;
            break;
          case 36284:
            result = &unk_23C690CB4;
            break;
          case 36285:
            result = &unk_23C690CF0;
            break;
          case 36286:
            result = &unk_23C690D2C;
            break;
          default:
            switch((int)this)
            {
              case 36492:
                result = &unk_23C690D68;
                break;
              case 36493:
                result = &unk_23C690DA4;
                break;
              case 36494:
                result = &unk_23C690DE0;
                break;
              case 36495:
                result = &unk_23C690E1C;
                break;
              default:
                goto LABEL_98;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)this <= 35839)
  {
    if ((int)this > 35411)
    {
      switch((int)this)
      {
        case 35412:
          result = &unk_23C690A20;
          break;
        case 35413:
          result = &unk_23C690A98;
          break;
        case 35414:
          result = &unk_23C690A5C;
          break;
        case 35415:
          result = &unk_23C690AD4;
          break;
        case 35420:
          result = &unk_23C691740;
          break;
        case 35421:
          result = &unk_23C69177C;
          break;
        case 35422:
          result = &unk_23C6917B8;
          break;
        case 35423:
          result = &unk_23C6917F4;
          break;
        case 35446:
          result = &unk_23C691C2C;
          break;
        case 35447:
          result = &unk_23C691C68;
          break;
        default:
          goto LABEL_98;
      }
      return result;
    }
    switch((_DWORD)this)
    {
      case 0x83F1:
        return &unk_23C690B10;
      case 0x83F2:
        return &unk_23C690B88;
      case 0x83F3:
        return &unk_23C690C00;
    }
LABEL_98:
    v3 = dy_abort();
    return (void *)GPUTools::GL::EnumerateCompressedFormats(v3);
  }
  if ((int)this > 35916)
  {
    switch((_DWORD)this)
    {
      case 0x8C4D:
        return &unk_23C690B4C;
      case 0x8C4E:
        return &unk_23C690BC4;
      case 0x8C4F:
        return &unk_23C690C3C;
    }
    goto LABEL_98;
  }
  v2 = (_DWORD)this - 35840;
  result = &GPUTools::GL::sCompressedFormatsTable;
  switch(v2)
  {
    case 0:
      result = &unk_23C6909A8;
      break;
    case 1:
      return result;
    case 2:
      result = &unk_23C6909E4;
      break;
    case 3:
      result = &unk_23C69096C;
      break;
    default:
      goto LABEL_98;
  }
  return result;
}

uint64_t GPUTools::GL::EnumerateCompressedFormats(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  BOOL v6;
  char v7;

  v7 = 0;
  v2 = (char *)&GPUTools::GL::sCompressedFormatsTable;
  v3 = 4920;
  do
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (!v4)
      std::__throw_bad_function_call[abi:ne180100]();
    result = (*(uint64_t (**)(uint64_t, char *, char *))(*(_QWORD *)v4 + 48))(v4, v2, &v7);
    v2 += 60;
    if (v7)
      v6 = 1;
    else
      v6 = v3 == 0;
    v3 -= 60;
  }
  while (!v6);
  return result;
}

{
  char *v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  char v6;

  v6 = 0;
  v2 = (char *)&GPUTools::GL::sCompressedFormatsTable;
  v3 = 4920;
  do
  {
    result = (*(uint64_t (**)(uint64_t, char *, char *))(a1 + 16))(a1, v2, &v6);
    v2 += 60;
    if (v6)
      v5 = 1;
    else
      v5 = v3 == 0;
    v3 -= 60;
  }
  while (!v5);
  return result;
}

uint64_t GPUTools::GL::GetInternalFormatComponentsInfo@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v3 = *(_DWORD *)(result + 8);
  *(_QWORD *)a2 = v3;
  if (v3)
  {
    a3.i32[0] = *(_DWORD *)(result + 44);
    LOBYTE(v4) = vmaxv_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a3));
LABEL_10:
    *(_DWORD *)(a2 + 4) = v4;
    goto LABEL_11;
  }
  v5 = *(_DWORD *)(result + 36);
  *(_DWORD *)a2 = v5;
  if (v5)
  {
    v4 = *(unsigned __int8 *)(result + 51);
    if (v4 <= *(unsigned __int8 *)(result + 47))
      LOBYTE(v4) = *(_BYTE *)(result + 47);
    goto LABEL_10;
  }
  v6 = *(_DWORD *)(result + 40);
  *(_DWORD *)a2 = v6;
  if (v6)
  {
    LOBYTE(v4) = *(_BYTE *)(result + 52);
    goto LABEL_10;
  }
  v7 = *(_DWORD *)(result + 20);
  *(_DWORD *)a2 = v7;
  if (v7)
  {
    LOBYTE(v4) = *(_BYTE *)(result + 47);
    goto LABEL_10;
  }
LABEL_11:
  v8 = *(unsigned __int8 *)(result + 49);
  v9 = *(_DWORD *)(result + 32);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 12) = v8;
  v10 = *(unsigned __int8 *)(result + 50);
  *(_DWORD *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 20) = v10;
  return result;
}

unint64_t GPUTools::GL::GetFirstValidComponentInfo(_QWORD *a1)
{
  if (*(_DWORD *)a1)
    return *a1 | *a1 & 0xFFFFFFFF00000000;
  if (*((_DWORD *)a1 + 2))
    return a1[1] | a1[1] & 0xFFFFFFFF00000000;
  if (*((_DWORD *)a1 + 4))
    return a1[2] | a1[2] & 0xFFFFFFFF00000000;
  return 0;
}

uint64_t GPUTools::GL::GetImageUploadFormatInfo(GPUTools::GL *this, char a2)
{
  int v3;
  uint64_t v4;
  uint8x8_t v5;
  unsigned int *v6;
  uint64_t v7;

  v3 = (int)this;
  v4 = this;
  if ((GPUTools::GL::IsCompressedFormat(this) & 1) != 0)
    return v4;
  v6 = (unsigned int *)&GPUTools::GL::sInternalFormatsTable;
  v7 = 6660;
  while (*v6 != v3)
  {
    v6 += 15;
    v7 -= 60;
    if (!v7)
      return v4;
  }
  if (!v3)
    return v4;
  else
    return GPUTools::GL::GetImageUploadFormatInfo(v6, a2, v5);
}

uint64_t GPUTools::GL::IsCompressedFormat(GPUTools::GL *this)
{
  int v1;
  uint64_t result;

  v1 = (int)this;
  result = 1;
  if (v1 <= 36282)
  {
    if (v1 <= 35727)
    {
      if ((v1 - 35412) <= 0x23 && ((1 << (v1 - 84)) & 0xC00000F0FLL) != 0
        || (v1 - 33777) < 3)
      {
        return result;
      }
    }
    else if ((v1 - 35728) < 0xA || (v1 - 35840) < 4 || (v1 - 35917) < 3)
    {
      return result;
    }
    return 0;
  }
  switch(v1)
  {
    case 37488:
    case 37489:
    case 37490:
    case 37491:
    case 37492:
    case 37493:
    case 37494:
    case 37495:
    case 37496:
    case 37497:
    case 37808:
    case 37809:
    case 37810:
    case 37811:
    case 37812:
    case 37813:
    case 37814:
    case 37815:
    case 37816:
    case 37817:
    case 37818:
    case 37819:
    case 37820:
    case 37821:
    case 37840:
    case 37841:
    case 37842:
    case 37843:
    case 37844:
    case 37845:
    case 37846:
    case 37847:
    case 37848:
    case 37849:
    case 37850:
    case 37851:
    case 37852:
    case 37853:
    case 37874:
    case 37886:
    case 37887:
    case 37888:
    case 37889:
    case 37890:
    case 37891:
    case 37892:
    case 37893:
    case 37894:
    case 37895:
    case 37896:
    case 37897:
    case 37898:
    case 37899:
    case 37900:
    case 37901:
      return result;
    case 37498:
    case 37499:
    case 37500:
    case 37501:
    case 37502:
    case 37503:
    case 37504:
    case 37505:
    case 37506:
    case 37507:
    case 37508:
    case 37509:
    case 37510:
    case 37511:
    case 37512:
    case 37513:
    case 37514:
    case 37515:
    case 37516:
    case 37517:
    case 37518:
    case 37519:
    case 37520:
    case 37521:
    case 37522:
    case 37523:
    case 37524:
    case 37525:
    case 37526:
    case 37527:
    case 37528:
    case 37529:
    case 37530:
    case 37531:
    case 37532:
    case 37533:
    case 37534:
    case 37535:
    case 37536:
    case 37537:
    case 37538:
    case 37539:
    case 37540:
    case 37541:
    case 37542:
    case 37543:
    case 37544:
    case 37545:
    case 37546:
    case 37547:
    case 37548:
    case 37549:
    case 37550:
    case 37551:
    case 37552:
    case 37553:
    case 37554:
    case 37555:
    case 37556:
    case 37557:
    case 37558:
    case 37559:
    case 37560:
    case 37561:
    case 37562:
    case 37563:
    case 37564:
    case 37565:
    case 37566:
    case 37567:
    case 37568:
    case 37569:
    case 37570:
    case 37571:
    case 37572:
    case 37573:
    case 37574:
    case 37575:
    case 37576:
    case 37577:
    case 37578:
    case 37579:
    case 37580:
    case 37581:
    case 37582:
    case 37583:
    case 37584:
    case 37585:
    case 37586:
    case 37587:
    case 37588:
    case 37589:
    case 37590:
    case 37591:
    case 37592:
    case 37593:
    case 37594:
    case 37595:
    case 37596:
    case 37597:
    case 37598:
    case 37599:
    case 37600:
    case 37601:
    case 37602:
    case 37603:
    case 37604:
    case 37605:
    case 37606:
    case 37607:
    case 37608:
    case 37609:
    case 37610:
    case 37611:
    case 37612:
    case 37613:
    case 37614:
    case 37615:
    case 37616:
    case 37617:
    case 37618:
    case 37619:
    case 37620:
    case 37621:
    case 37622:
    case 37623:
    case 37624:
    case 37625:
    case 37626:
    case 37627:
    case 37628:
    case 37629:
    case 37630:
    case 37631:
    case 37632:
    case 37633:
    case 37634:
    case 37635:
    case 37636:
    case 37637:
    case 37638:
    case 37639:
    case 37640:
    case 37641:
    case 37642:
    case 37643:
    case 37644:
    case 37645:
    case 37646:
    case 37647:
    case 37648:
    case 37649:
    case 37650:
    case 37651:
    case 37652:
    case 37653:
    case 37654:
    case 37655:
    case 37656:
    case 37657:
    case 37658:
    case 37659:
    case 37660:
    case 37661:
    case 37662:
    case 37663:
    case 37664:
    case 37665:
    case 37666:
    case 37667:
    case 37668:
    case 37669:
    case 37670:
    case 37671:
    case 37672:
    case 37673:
    case 37674:
    case 37675:
    case 37676:
    case 37677:
    case 37678:
    case 37679:
    case 37680:
    case 37681:
    case 37682:
    case 37683:
    case 37684:
    case 37685:
    case 37686:
    case 37687:
    case 37688:
    case 37689:
    case 37690:
    case 37691:
    case 37692:
    case 37693:
    case 37694:
    case 37695:
    case 37696:
    case 37697:
    case 37698:
    case 37699:
    case 37700:
    case 37701:
    case 37702:
    case 37703:
    case 37704:
    case 37705:
    case 37706:
    case 37707:
    case 37708:
    case 37709:
    case 37710:
    case 37711:
    case 37712:
    case 37713:
    case 37714:
    case 37715:
    case 37716:
    case 37717:
    case 37718:
    case 37719:
    case 37720:
    case 37721:
    case 37722:
    case 37723:
    case 37724:
    case 37725:
    case 37726:
    case 37727:
    case 37728:
    case 37729:
    case 37730:
    case 37731:
    case 37732:
    case 37733:
    case 37734:
    case 37735:
    case 37736:
    case 37737:
    case 37738:
    case 37739:
    case 37740:
    case 37741:
    case 37742:
    case 37743:
    case 37744:
    case 37745:
    case 37746:
    case 37747:
    case 37748:
    case 37749:
    case 37750:
    case 37751:
    case 37752:
    case 37753:
    case 37754:
    case 37755:
    case 37756:
    case 37757:
    case 37758:
    case 37759:
    case 37760:
    case 37761:
    case 37762:
    case 37763:
    case 37764:
    case 37765:
    case 37766:
    case 37767:
    case 37768:
    case 37769:
    case 37770:
    case 37771:
    case 37772:
    case 37773:
    case 37774:
    case 37775:
    case 37776:
    case 37777:
    case 37778:
    case 37779:
    case 37780:
    case 37781:
    case 37782:
    case 37783:
    case 37784:
    case 37785:
    case 37786:
    case 37787:
    case 37788:
    case 37789:
    case 37790:
    case 37791:
    case 37792:
    case 37793:
    case 37794:
    case 37795:
    case 37796:
    case 37797:
    case 37798:
    case 37799:
    case 37800:
    case 37801:
    case 37802:
    case 37803:
    case 37804:
    case 37805:
    case 37806:
    case 37807:
    case 37822:
    case 37823:
    case 37824:
    case 37825:
    case 37826:
    case 37827:
    case 37828:
    case 37829:
    case 37830:
    case 37831:
    case 37832:
    case 37833:
    case 37834:
    case 37835:
    case 37836:
    case 37837:
    case 37838:
    case 37839:
    case 37854:
    case 37855:
    case 37856:
    case 37857:
    case 37858:
    case 37859:
    case 37860:
    case 37861:
    case 37862:
    case 37863:
    case 37864:
    case 37865:
    case 37866:
    case 37867:
    case 37868:
    case 37869:
    case 37870:
    case 37871:
    case 37872:
    case 37873:
    case 37875:
    case 37876:
    case 37877:
    case 37878:
    case 37879:
    case 37880:
    case 37881:
    case 37882:
    case 37883:
    case 37884:
    case 37885:
      return 0;
    default:
      if ((v1 - 36283) >= 4 && (v1 - 36492) >= 4)
        return 0;
      break;
  }
  return result;
}

uint64_t GPUTools::GL::GetImageUploadFormatInfo(unsigned int *a1, char a2, uint8x8_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v12;
  GPUTools::GL *v13;
  int v14;

  v3 = *a1;
  v4 = a1[1];
  if ((a2 & 1) != 0)
    goto LABEL_2;
  if ((int)v3 > 35897)
  {
    if ((int)v3 <= 36012)
    {
      if ((_DWORD)v3 == 35898)
        return v3 | (v4 << 32);
      if ((_DWORD)v3 == 35901)
        return v3 | (v4 << 32);
    }
    else
    {
      switch((_DWORD)v3)
      {
        case 0x8CAD:
          return v3 | (v4 << 32);
        case 0x906F:
          v4 = 36249;
          return v3 | (v4 << 32);
        case 0x8D62:
          return v3 | (v4 << 32);
      }
    }
  }
  else
  {
    if ((int)v3 > 32854)
    {
      if ((_DWORD)v3 == 32855)
        return v3 | (v4 << 32);
      if ((_DWORD)v3 != 32857)
      {
        if ((_DWORD)v3 == 35056)
          return v3 | (v4 << 32);
        goto LABEL_2;
      }
      return v3 | (v4 << 32);
    }
    if ((_DWORD)v3 == 10768)
      return v3 | (v4 << 32);
    if ((_DWORD)v3 == 32854)
      return v3 | (v4 << 32);
  }
LABEL_2:
  v5 = a1[2];
  if (v5)
  {
    a3.i32[0] = a1[11];
    LOBYTE(v6) = vmaxv_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a3));
LABEL_34:
    v8 = v6;
    goto LABEL_35;
  }
  v5 = a1[9];
  if (v5)
  {
    v6 = *((unsigned __int8 *)a1 + 51);
    if (v6 <= *((unsigned __int8 *)a1 + 47))
      LOBYTE(v6) = *((_BYTE *)a1 + 47);
    goto LABEL_34;
  }
  v5 = a1[10];
  if (v5)
  {
    LOBYTE(v6) = *((_BYTE *)a1 + 52);
    goto LABEL_34;
  }
  v5 = a1[5];
  if (v5)
  {
    LOBYTE(v6) = *((_BYTE *)a1 + 47);
    goto LABEL_34;
  }
  v5 = a1[7];
  if (!v5)
  {
    v9 = (unint64_t)*((unsigned __int8 *)a1 + 50) << 32;
    if (a1[8])
    {
      v12 = a1[8];
    }
    else
    {
      v9 = 0;
      v12 = 0;
    }
    v5 = v12 | v9;
    if (v5 >> 1 != 2562)
      goto LABEL_49;
    goto LABEL_36;
  }
  v8 = *((unsigned __int8 *)a1 + 49);
LABEL_35:
  v9 = v8 << 32;
  if (v5 >> 1 != 2562)
    goto LABEL_49;
LABEL_36:
  if ((int)v4 > 32840)
  {
    if ((_DWORD)v4 != 32841)
    {
      if ((_DWORD)v4 == 33319)
      {
        v4 = 33320;
      }
      else if ((_DWORD)v4 != 34041)
      {
LABEL_42:
        dy_abort();
LABEL_43:
        v4 = 36247;
      }
    }
  }
  else
  {
    switch((int)v4)
    {
      case 6401:
      case 6402:
        break;
      case 6403:
        v4 = 36244;
        break;
      case 6406:
        goto LABEL_43;
      case 6407:
        v4 = 36248;
        break;
      case 6408:
        v4 = 36249;
        break;
      case 6409:
        v4 = 36252;
        break;
      case 6410:
        v4 = 36253;
        break;
      default:
        goto LABEL_42;
    }
  }
LABEL_49:
  v10 = HIDWORD(v9);
  if ((_DWORD)v10)
    goto LABEL_52;
  if ((v5 - 5124) < 3)
  {
    LODWORD(v10) = 32;
LABEL_52:
    if (v5 > 5125)
      goto LABEL_53;
LABEL_64:
    if (v5 != 5124)
    {
      if (v5 != 5125)
        goto LABEL_89;
LABEL_66:
      if (v10 < 9)
        return v3 | (v4 << 32);
      if (v10 < 0x11)
        return v3 | (v4 << 32);
      if (v10 < 0x21)
        return v3 | (v4 << 32);
      goto LABEL_89;
    }
LABEL_68:
    if (v10 < 9)
      return v3 | (v4 << 32);
    if (v10 < 0x11)
      return v3 | (v4 << 32);
    if (v10 < 0x21)
      return v3 | (v4 << 32);
    goto LABEL_89;
  }
  if (v5 != 35863 && v5 != 36764)
    goto LABEL_89;
  LODWORD(v10) = 8;
  if (v5 <= 5125)
    goto LABEL_64;
LABEL_53:
  switch(v5)
  {
    case 36764:
      goto LABEL_68;
    case 35863:
      goto LABEL_66;
    case 5126:
      if (v10 < 0x11)
        return v3 | (v4 << 32);
      if (v10 < 0x21)
        return v3 | (v4 << 32);
      if (v10 < 0x41)
        return v3 | (v4 << 32);
      break;
  }
LABEL_89:
  v13 = (GPUTools::GL *)dy_abort();
  return GPUTools::GL::TypeMatchingComponentSpecification(v13, v14);
}

uint64_t GPUTools::GL::TypeMatchingComponentSpecification(GPUTools::GL *this, int a2)
{
  uint64_t v3;

  if (!a2)
  {
    if (((_DWORD)this - 5124) >= 3)
    {
      a2 = 8;
      if ((_DWORD)this != 35863 && (_DWORD)this != 36764)
        goto LABEL_30;
    }
    else
    {
      a2 = 32;
    }
  }
  if ((int)this <= 5125)
  {
    if ((_DWORD)this != 5124)
    {
      if ((_DWORD)this != 5125)
        goto LABEL_30;
LABEL_14:
      if (a2 < 9)
        return 5121;
      if (a2 < 0x11)
        return 5123;
      if (a2 < 0x21)
        return 5125;
      goto LABEL_30;
    }
LABEL_16:
    if (a2 < 9)
      return 5120;
    if (a2 < 0x11)
      return 5122;
    if (a2 < 0x21)
      return 5124;
    goto LABEL_30;
  }
  switch((_DWORD)this)
  {
    case 0x8F9C:
      goto LABEL_16;
    case 0x8C17:
      goto LABEL_14;
    case 0x1406:
      if (a2 < 17)
        return 36193;
      if (a2 < 0x21)
        return 5126;
      if (a2 < 0x41)
        return 5130;
      break;
  }
LABEL_30:
  v3 = dy_abort();
  return GPUTools::GL::DYProcessImageUploadFormatForLegacyES(v3);
}

int *GPUTools::GL::DYProcessImageUploadFormatForLegacyES(int *result)
{
  int v1;

  if (!result)
    __assert_rtn("void GPUTools::GL::DYProcessImageUploadFormatForLegacyES(ImageFormatInfo *)", (const char *)&unk_23C65FE76, 0, "pImageFormatInfo");
  v1 = result[1];
  if (v1 == 32993)
  {
    *result = 6408;
  }
  else
  {
    if (*result == 35905)
      v1 = 35904;
    if (*result == 35907)
      v1 = 35906;
    *result = v1;
  }
  return result;
}

uint64_t GPUTools::GL::dy_type_component_count(GPUTools::GL *this)
{
  int v1;
  uint64_t result;
  int v3;

  v1 = (int)this;
  result = 1;
  if (v1 <= 33636)
  {
    if ((v1 - 32819) < 4)
      return 4;
    if ((v1 - 33634) >= 3 && v1 != 32818)
      return result;
    return 3;
  }
  if (v1 <= 34233)
  {
    if ((v1 - 33637) >= 4)
    {
      v3 = 34042;
      goto LABEL_17;
    }
    return 4;
  }
  if (v1 > 35901)
  {
    if (v1 != 35902)
    {
      v3 = 36269;
LABEL_17:
      if (v1 == v3)
        return 2;
      return result;
    }
    return 3;
  }
  if ((v1 - 34234) < 2)
    return 2;
  if (v1 == 35899)
    return 3;
  return result;
}

uint64_t GPUTools::GL::dy_type_size(GPUTools::GL *this)
{
  int v1;
  uint64_t result;
  int v3;

  v1 = (int)this;
  result = 1;
  if (v1 <= 33634)
  {
    switch(v1)
    {
      case 5122:
      case 5123:
      case 5127:
      case 5131:
        return 2;
      case 5124:
      case 5125:
      case 5126:
      case 5129:
      case 5132:
        return 4;
      case 5128:
        return 3;
      case 5130:
        return 8;
      default:
        if ((v1 - 32819) < 2)
          return 2;
        if ((v1 - 32821) >= 2)
          return result;
        return 4;
    }
  }
  if (v1 <= 34233)
  {
    if ((v1 - 33635) >= 4)
    {
      if ((v1 - 33639) >= 2)
      {
        v3 = 34042;
        goto LABEL_12;
      }
      return 4;
    }
    return 2;
  }
  if (v1 > 36192)
  {
    if (v1 == 36269)
      return 8;
    if (v1 == 36255)
      return 4;
    if (v1 != 36193)
      return result;
    return 2;
  }
  if ((v1 - 34234) < 2)
    return 2;
  if (v1 == 35899)
    return 4;
  v3 = 35902;
LABEL_12:
  if (v1 == v3)
    return 4;
  return result;
}

uint64_t GPUTools::GL::GetCompressedFormatElementCount(GPUTools::GL *this)
{
  int v1;
  uint64_t result;
  char v3;

  v1 = (int)this;
  result = 4;
  if (v1 <= 37487)
  {
    if ((v1 - 35412) < 2 || (v1 - 35840) < 2)
      return 3;
  }
  else
  {
    v3 = v1 - 112;
    if ((v1 - 37488) <= 5)
    {
      if (((1 << v3) & 3) != 0)
        return 1;
      if (((1 << v3) & 0xC) != 0)
        return 2;
      return 3;
    }
    if (v1 == 37874)
      return 3;
  }
  return result;
}

uint64_t GPUTools::GL::GetColorFormatForElementCount(GPUTools::GL *this, int a2)
{
  uint64_t result;

  switch((int)this)
  {
    case 1:
      if (a2)
        result = 36244;
      else
        result = 6403;
      break;
    case 2:
      if (a2)
        result = 33320;
      else
        result = 33319;
      break;
    case 3:
      if (a2)
        result = 36248;
      else
        result = 6407;
      break;
    default:
      if (a2)
        result = 36249;
      else
        result = 6408;
      break;
  }
  return result;
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingFormat(int *a1)
{
  uint64_t v1;
  int v3;
  char IsCompressedFormat;
  int *CompressedFormatInfo;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  int v20;
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  char *v28;
  uint8x8_t v29;
  unsigned int *v30;
  uint64_t v31;
  uint64_t v33;

  v1 = *a1;
  if (!(_DWORD)v1)
    __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_23C65FE76, 0, "formatInfo.internalFormat != 0");
  if (!a1[1] && (GPUTools::GL::IsCompressedFormat((GPUTools::GL *)*a1) & 1) == 0)
    __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_23C65FE76, 0, "formatInfo.format != 0 || IsCompressedFormat(formatInfo.internalFormat)");
  v3 = a1[2];
  IsCompressedFormat = GPUTools::GL::IsCompressedFormat((GPUTools::GL *)v1);
  if (!v3)
    goto LABEL_16;
  if ((IsCompressedFormat & 1) != 0)
    goto LABEL_17;
  CompressedFormatInfo = &GPUTools::GL::sInternalFormatsTable;
  v6 = 6660;
  while (*CompressedFormatInfo != (_DWORD)v1)
  {
    CompressedFormatInfo += 15;
    v6 -= 60;
    if (!v6)
    {
      CompressedFormatInfo = (int *)&GPUTools::GL::sUnknownFormat;
      break;
    }
  }
  v7 = CompressedFormatInfo[1];
  if ((_DWORD)v7 == 6402)
  {
LABEL_18:
    v9 = *a1;
    v1 = 0x19030000822ELL;
    if ((*a1 - 33189) < 3 || v9 == 6402 || v9 == 36012)
      return v1;
    dy_string_from_enum(v9);
    v7 = dy_abort();
  }
  else
  {
    while ((_DWORD)v7 == 34041)
    {
      v8 = *a1;
      v1 = 0x19030000822ELL;
      if (*a1 == 34041 || v8 == 35056 || v8 == 36013)
        return v1;
      dy_string_from_enum(v8);
      IsCompressedFormat = dy_abort();
LABEL_16:
      if ((IsCompressedFormat & 1) == 0)
        __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_23C65FE76, 0, "formatInfo.type != 0 || IsCompressedFormat(formatInfo.internalFormat)");
LABEL_17:
      CompressedFormatInfo = (int *)GPUTools::GL::GetCompressedFormatInfo((GPUTools::GL *)v1);
      v7 = CompressedFormatInfo[1];
      if ((_DWORD)v7 == 6402)
        goto LABEL_18;
    }
  }
  v10 = CompressedFormatInfo[7];
  v11 = CompressedFormatInfo[8];
  v12 = *((unsigned __int8 *)CompressedFormatInfo + 47);
  v13 = *((unsigned __int8 *)CompressedFormatInfo + 49);
  v14 = CompressedFormatInfo[2];
  if (v14)
  {
    v15 = *((unsigned __int8 *)CompressedFormatInfo + 44);
    v16 = *((unsigned __int8 *)CompressedFormatInfo + 45);
    v17 = *((unsigned __int8 *)CompressedFormatInfo + 46);
    if (v17 <= v12)
      v17 = v12;
    if (v16 > v17)
      v17 = v16;
    if (v15 <= v17)
      v12 = v17;
    else
      v12 = v15;
    goto LABEL_37;
  }
  v14 = CompressedFormatInfo[9];
  if (v14)
  {
    v18 = *((unsigned __int8 *)CompressedFormatInfo + 51);
    if (v18 <= v12)
      v12 = v12;
    else
      v12 = v18;
    goto LABEL_37;
  }
  v14 = CompressedFormatInfo[10];
  if (v14)
  {
    v12 = *((unsigned __int8 *)CompressedFormatInfo + 52);
    goto LABEL_37;
  }
  v14 = CompressedFormatInfo[5];
  if (v14)
  {
LABEL_37:
    v19 = v12 << 32;
    v20 = v14;
    v21 = GPUTools::GL::dy_format_element_count((GPUTools::GL *)v7);
    if (v20 > 5125)
      goto LABEL_38;
LABEL_52:
    if (v20 != 5124)
    {
      if (v20 == 5125)
      {
        v22 = 4;
        v23 = HIDWORD(v19);
        if (HIDWORD(v19) < 9)
          goto LABEL_64;
        goto LABEL_59;
      }
LABEL_83:
      dy_abort();
      goto LABEL_84;
    }
    v22 = 3;
    v23 = HIDWORD(v19);
    if (HIDWORD(v19) >= 9)
      goto LABEL_59;
LABEL_64:
    v26 = 0;
    goto LABEL_65;
  }
  v24 = (unint64_t)*((unsigned __int8 *)CompressedFormatInfo + 50) << 32;
  if (!v11)
  {
    v24 = 0;
    v11 = 0;
  }
  if (v10)
    v19 = v13 << 32;
  else
    v19 = v24;
  if (v10)
    v25 = v10;
  else
    v25 = v11;
  v20 = v25 | v19;
  v21 = GPUTools::GL::dy_format_element_count((GPUTools::GL *)v7);
  if (v20 <= 5125)
    goto LABEL_52;
LABEL_38:
  if (v20 == 5126)
  {
    v22 = 2;
    v23 = HIDWORD(v19);
    if (HIDWORD(v19) < 9)
      goto LABEL_64;
    goto LABEL_59;
  }
  if (v20 == 35863)
  {
    v22 = 0;
    v23 = HIDWORD(v19);
    if (HIDWORD(v19) >= 9)
      goto LABEL_59;
    goto LABEL_64;
  }
  if (v20 != 36764)
    goto LABEL_83;
  v22 = 1;
  v23 = HIDWORD(v19);
  if (HIDWORD(v19) < 9)
    goto LABEL_64;
LABEL_59:
  if (v23 < 0x11)
  {
    v26 = 1;
LABEL_65:
    v27 = 1;
    if (v21 != 2)
      v27 = 2;
    if (v21 == 1)
      v27 = 0;
    v28 = (char *)&GPUTools::GL::s_renderableFormats + 48 * v22 + 12 * v26;
    v1 = *(unsigned int *)&v28[4 * v27];
    if ((_DWORD)v1)
    {
      if ((GPUTools::GL::IsCompressedFormat((GPUTools::GL *)*(unsigned int *)&v28[4 * v27]) & 1) == 0)
      {
        v30 = (unsigned int *)&GPUTools::GL::sInternalFormatsTable;
        v31 = 6660;
        while (*v30 != (_DWORD)v1)
        {
          v30 += 15;
          v31 -= 60;
          if (!v31)
            return v1;
        }
        return GPUTools::GL::GetImageUploadFormatInfo(v30, 1, v29);
      }
      return v1;
    }
    dy_string_from_enum(*a1);
    dy_string_from_enum(a1[1]);
    dy_string_from_enum(a1[2]);
    dy_abort();
    goto LABEL_83;
  }
  if (v23 < 0x21)
  {
    v26 = 2;
    goto LABEL_65;
  }
  if (v23 < 0x41)
  {
    v26 = 3;
    goto LABEL_65;
  }
LABEL_84:
  v33 = dy_abort();
  return GPUTools::GL::ColorRenderableFormatMatchingDepthStencilFormat(v33);
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingDepthStencilFormat(int *a1, int a2)
{
  int v2;
  uint64_t v5;

  v2 = *a1;
  if (v2 == 34041 || v2 == 36013 || v2 == 35056)
  {
    if (a2)
      return 0x19030000822ELL;
    else
      return 0x8D9400008232;
  }
  else
  {
    dy_string_from_enum(v2);
    v5 = dy_abort();
    return GPUTools::GL::ColorRenderableFormatMatchingDepthFormat(v5);
  }
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingDepthFormat(int *a1)
{
  int v1;
  GPUTools::GL *v4;

  v1 = *a1;
  if ((v1 - 33189) < 3 || v1 == 36012 || v1 == 6402)
    return 0x19030000822ELL;
  dy_string_from_enum(v1);
  v4 = (GPUTools::GL *)dy_abort();
  return GPUTools::GL::dy_format_element_count(v4);
}

uint64_t GPUTools::GL::dy_format_element_count(GPUTools::GL *this)
{
  int v1;
  uint64_t result;
  int v3;
  int v4;

  v1 = (int)this;
  result = 1;
  if (v1 > 35358)
  {
    if ((v1 - 35898) > 8)
      goto LABEL_11;
    if (((1 << (v1 - 58)) & 0x5B) != 0)
      return 3;
    if (v1 != 35906)
    {
LABEL_11:
      switch(v1)
      {
        case 36248:
        case 36250:
          return 3;
        case 36249:
        case 36251:
          return 4;
        default:
          v4 = 35359;
          goto LABEL_23;
      }
    }
    return 4;
  }
  if (v1 <= 32992)
  {
    if (v1 > 6409)
    {
      if (v1 != 6410)
      {
        if (v1 != 0x8000)
        {
          if (v1 != 32992)
            return result;
          return 3;
        }
        return 4;
      }
      return 2;
    }
    if (v1 == 6407)
      return 3;
    v3 = 6408;
LABEL_17:
    if (v1 != v3)
      return result;
    return 4;
  }
  if (v1 <= 34040)
  {
    if ((v1 - 33319) < 2)
      return 2;
    v3 = 32993;
    goto LABEL_17;
  }
  if (v1 == 34041)
    return 2;
  v4 = 34233;
LABEL_23:
  if (v1 == v4)
    return 2;
  return result;
}

BOOL GPUTools::GL::IsIntegerFormat(GPUTools::GL *this)
{
  return ((_DWORD)this - 36244) <= 5 && ((1 << ((_BYTE)this + 108)) & 0x31) != 0 || (_DWORD)this == 33320;
}

BOOL GPUTools::GL::IsSignedType(GPUTools::GL *this)
{
  return ((_DWORD)this - 5120) <= 0xB && ((1 << (char)this) & 0xC55) != 0 || (_DWORD)this == 36193;
}

uint64_t GPUTools::GL::IsPackedType(GPUTools::GL *this)
{
  int v1;
  uint64_t result;

  v1 = (int)this;
  result = 1;
  if (v1 <= 34041)
  {
    if ((v1 - 33634) >= 7 && (v1 - 32818) >= 5)
      return 0;
  }
  else
  {
    if (v1 > 35901)
    {
      if (v1 == 35902 || v1 == 36255 || v1 == 36269)
        return result;
      return 0;
    }
    if (v1 != 34042 && v1 != 35899)
      return 0;
  }
  return result;
}

BOOL GPUTools::GL::IsIntegralType(GPUTools::GL *this)
{
  return ((_DWORD)this - 5120) < 6;
}

double GPUTools::GL::RangeForUnpackedType(GPUTools::GL *this, unint64_t *a2, double *a3, double *a4)
{
  unint64_t v4;
  double result;

  v4 = 0;
  result = 255.0;
  switch((int)this)
  {
    case 5120:
      result = 127.0;
      v4 = 0xC060000000000000;
      goto LABEL_3;
    case 5121:
LABEL_3:
      *a2 = v4;
      *a3 = result;
      return result;
    case 5122:
      result = 32767.0;
      *a2 = 0xC0E0000000000000;
      *a3 = 32767.0;
      return result;
    case 5123:
      result = 65535.0;
      *a2 = 0;
      *a3 = 65535.0;
      return result;
    case 5124:
      result = 2147483650.0;
      *a2 = 0xC1E0000000000000;
      *a3 = 2147483650.0;
      return result;
    case 5125:
      result = 4294967300.0;
      *a2 = 0;
      *a3 = 4294967300.0;
      return result;
    case 5126:
      result = 3.40282347e38;
      *a2 = 0xC7EFFFFFE0000000;
      *a3 = 3.40282347e38;
      return result;
    case 5127:
    case 5128:
    case 5129:
      goto LABEL_6;
    case 5130:
      result = 1.79769313e308;
      *a2 = 0xFFEFFFFFFFFFFFFFLL;
      *a3 = 1.79769313e308;
      return result;
    case 5131:
      goto LABEL_5;
    default:
      if ((_DWORD)this == 36193)
      {
LABEL_5:
        result = 65504.0;
        *a2 = 0xC0EFFC0000000000;
        *a3 = 65504.0;
      }
      else
      {
LABEL_6:
        result = 1.0;
        *a2 = 0;
        *a3 = 1.0;
      }
      return result;
  }
}

uint64_t GPUTools::GL::dy_pixel_group_size(GPUTools::GL *this, GPUTools::GL *a2)
{
  int v2;
  uint64_t result;

  v2 = (int)a2;
  result = GPUTools::GL::dy_type_size(a2);
  if (v2 > 34041)
  {
    if (v2 > 35898)
    {
      if (v2 != 35899 && v2 != 35902 && v2 != 36269)
        return GPUTools::GL::dy_format_element_count(this) * result;
    }
    else if ((v2 - 34234) >= 2 && v2 != 34042)
    {
      return GPUTools::GL::dy_format_element_count(this) * result;
    }
  }
  else if ((v2 - 33634) >= 7 && (v2 - 32818) >= 5)
  {
    return GPUTools::GL::dy_format_element_count(this) * result;
  }
  return result;
}

uint64_t GPUTools::GL::dy_pixel_row_bytes(GPUTools::GL *this, int a2, int a3, unsigned int a4)
{
  int v4;
  uint64_t result;
  int v6;

  if (!a2)
    return 0;
  v4 = (int)this;
  result = 0;
  if (a4 <= 8 && ((1 << a4) & 0x116) != 0)
  {
    if (a3 <= 0)
      v6 = a2;
    else
      v6 = a3;
    return (a4 + v6 * v4 - 1) & -a4;
  }
  return result;
}

uint64_t GPUTools::GL::ComputeClientImageSize(unsigned int *a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v9;

  v4 = GPUTools::GL::dy_pixel_group_size((GPUTools::GL *)a1[1], (GPUTools::GL *)a1[2]);
  if ((int)a1[10] <= 1)
    v5 = 1;
  else
    v5 = a1[10];
  v6 = a1[6];
  if (!v6)
    return 0;
  v7 = a2[3];
  if (v7 > 8 || ((1 << v7) & 0x116) == 0)
    return 0;
  v9 = v5 * v4;
  if (*a2 > 0)
    v6 = *a2;
  return a1[7] * ((v7 + v9 * v6 - 1) & -v7) * a1[8];
}

uint64_t GPUTools::GL::ComputePackedClientImageSize(unsigned int *a1)
{
  int v2;
  int v3;

  v2 = GPUTools::GL::dy_pixel_group_size((GPUTools::GL *)a1[1], (GPUTools::GL *)a1[2]);
  v3 = a1[10];
  if (v3 <= 1)
    v3 = 1;
  return a1[7] * a1[6] * v3 * v2 * a1[8];
}

uint64_t GPUTools::GL::ComputeReadPixelsImageSize(int a1, int a2, GPUTools::GL *this, GPUTools::GL *a4, int *a5)
{
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  BOOL v12;
  int v13;

  v8 = GPUTools::GL::dy_pixel_group_size(this, a4);
  v9 = a5[6];
  if (!v9)
  {
    v10 = *a5;
    v11 = a5[3];
    if (*a5 <= 0)
      v10 = a1;
    v9 = (v11 + v10 * v8 - 1) & -v11;
    v12 = v11 > 8;
    v13 = (1 << v11) & 0x116;
    if (v12 || v13 == 0)
      v9 = 0;
    if (!a1)
      v9 = 0;
  }
  return (a5[2] * v8 + (a5[1] + a2) * v9);
}

const signed __int8 *GPUTools::GL::NormalizeIntegerComponents(const signed __int8 *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const signed __int8 *v4;
  char *v5;
  float *v6;
  int v7;
  int v8;
  int8x16_t v9;
  float32x4_t v10;
  unint64_t v11;
  float32x4_t *v12;
  int8x16_t *v13;
  int8x16_t v14;
  int8x16_t v15;
  float32x4_t v16;
  float32x4_t v17;
  unint64_t v18;
  int8x8_t *v19;
  float32x4_t *v20;
  unint64_t v21;
  float32x4_t v22;
  int8x8_t v23;
  int8x8_t v24;

  if (!a3)
    return this;
  if (a3 >= 8 && (a2 + a3 <= (unint64_t)this || (unint64_t)&this[4 * a3] <= a2))
  {
    if (a3 >= 0x10)
    {
      v3 = a3 & 0xFFFFFFFFFFFFFFF0;
      v9.i64[0] = 0x8181818181818181;
      v9.i64[1] = 0x8181818181818181;
      v10 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
      v11 = a3 & 0xFFFFFFFFFFFFFFF0;
      v12 = (float32x4_t *)this;
      v13 = (int8x16_t *)a2;
      do
      {
        v14 = *v13++;
        v15 = vmaxq_s8(v14, v9);
        v16 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL)));
        v17 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL)));
        v15.i64[0] = vextq_s8(v15, v15, 8uLL).u64[0];
        *v12 = vdivq_f32(v17, v10);
        v12[1] = vdivq_f32(v16, v10);
        v12[2] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL))), v10);
        v12[3] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL))), v10);
        v12 += 4;
        v11 -= 16;
      }
      while (v11);
      if (v3 == a3)
        return this;
      if ((a3 & 8) == 0)
        goto LABEL_6;
    }
    else
    {
      v3 = 0;
    }
    v18 = v3;
    v3 = a3 & 0xFFFFFFFFFFFFFFF8;
    v19 = (int8x8_t *)(a2 + v18);
    v20 = (float32x4_t *)&this[4 * v18];
    v21 = v18 - (a3 & 0xFFFFFFFFFFFFFFF8);
    v22 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
    do
    {
      v23 = *v19++;
      v24 = vmax_s8(v23, (int8x8_t)0x8181818181818181);
      *v20 = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v24, (int8x8_t)0x8181818181818181), 8uLL), 8uLL))), v22);
      v20[1] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v24, (int8x8_t)0x8181818181818181), 8uLL), 8uLL))), v22);
      v20 += 2;
      v21 += 8;
    }
    while (v21);
    if (v3 == a3)
      return this;
  }
  else
  {
    v3 = 0;
  }
LABEL_6:
  v4 = (const signed __int8 *)(a3 - v3);
  v5 = (char *)(a2 + v3);
  v6 = (float *)&this[4 * v3];
  do
  {
    v8 = *v5++;
    v7 = v8;
    if (v8 <= -127)
      v7 = -127;
    *v6++ = (float)v7 / 127.0;
    --v4;
  }
  while (v4);
  return this;
}

const unsigned __int8 *GPUTools::GL::NormalizeIntegerComponents(const unsigned __int8 *this, unint64_t a2, unint64_t a3, double a4, double a5, double a6, int8x16_t a7)
{
  unint64_t v7;
  const unsigned __int8 *v8;
  unsigned __int8 *v9;
  float *v10;
  unsigned int v11;
  unint64_t v12;
  float32x4_t *v13;
  int8x16_t *v14;
  float32x4_t v15;
  int8x16_t v16;
  unint64_t v17;
  unint64_t *v18;
  unsigned __int8 *v19;
  unint64_t v20;
  float32x4_t v21;
  unint64_t v22;
  uint32x4_t v23;

  if (a3)
  {
    if (a3 < 8 || a2 + a3 > (unint64_t)this && (unint64_t)&this[4 * a3] > a2)
    {
      v7 = 0;
      goto LABEL_6;
    }
    if (a3 >= 0x10)
    {
      v7 = a3 & 0xFFFFFFFFFFFFFFF0;
      a7.i64[1] = 0xFFFFFF0FFFFFFF0ELL;
      v12 = a3 & 0xFFFFFFFFFFFFFFF0;
      v13 = (float32x4_t *)this;
      v14 = (int8x16_t *)a2;
      v15 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        v16 = *v14++;
        v13[2] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_23C692020)), v15);
        v13[3] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_23C692030)), v15);
        *v13 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_23C692000)), v15);
        v13[1] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_23C692010)), v15);
        v13 += 4;
        v12 -= 16;
      }
      while (v12);
      if (v7 == a3)
        return this;
      if ((a3 & 8) == 0)
      {
LABEL_6:
        v8 = (const unsigned __int8 *)(a3 - v7);
        v9 = (unsigned __int8 *)(a2 + v7);
        v10 = (float *)&this[4 * v7];
        do
        {
          v11 = *v9++;
          *v10++ = (float)v11 / 255.0;
          --v8;
        }
        while (v8);
        return this;
      }
    }
    else
    {
      v7 = 0;
    }
    v17 = v7;
    v7 = a3 & 0xFFFFFFFFFFFFFFF8;
    v18 = (unint64_t *)(a2 + v17);
    v19 = (unsigned __int8 *)&this[4 * v17];
    v20 = v17 - (a3 & 0xFFFFFFFFFFFFFFF8);
    v21 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      v22 = *v18++;
      a7.i64[0] = v22;
      v23 = (uint32x4_t)vqtbl1q_s8(a7, (int8x16_t)xmmword_23C692000);
      a7 = (int8x16_t)vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(a7, (int8x16_t)xmmword_23C692010)), v21);
      *(float32x4_t *)v19 = vdivq_f32(vcvtq_f32_u32(v23), v21);
      *((int8x16_t *)v19 + 1) = a7;
      v19 += 32;
      v20 += 8;
    }
    while (v20);
    if (v7 != a3)
      goto LABEL_6;
  }
  return this;
}

float GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, int16x8_t *a2, unint64_t a3, int16x8_t a4)
{
  unint64_t v4;
  int16x8_t *v5;
  float32x4_t *v6;
  float32x4_t v7;
  unint64_t v8;
  int16x8_t v9;
  int16x8_t v10;
  char *v11;
  _DWORD *v12;
  __int16 *v13;
  int v14;
  int v15;

  if (a3)
  {
    if (a3 >= 0x10)
    {
      v4 = a3 & 0xFFFFFFFFFFFFFFF0;
      v5 = a2 + 1;
      v6 = (float32x4_t *)((char *)this + 32);
      a4 = vdupq_n_s16(0x8001u);
      v7 = (float32x4_t)vdupq_n_s32(0x46FFFE00u);
      v8 = a3 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        v9 = vmaxq_s16(v5[-1], a4);
        v10 = vmaxq_s16(*v5, a4);
        v6[-2] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v9.i8)), v7);
        v6[-1] = vdivq_f32(vcvtq_f32_s32(vmovl_high_s16(v9)), v7);
        *v6 = vdivq_f32(vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v10.i8)), v7);
        v6[1] = vdivq_f32(vcvtq_f32_s32(vmovl_high_s16(v10)), v7);
        v6 += 4;
        v5 += 2;
        v8 -= 16;
      }
      while (v8);
      if (v4 == a3)
        return *(float *)a4.i32;
    }
    else
    {
      v4 = 0;
    }
    v11 = (char *)(a3 - v4);
    v12 = (_DWORD *)((char *)this + 4 * v4);
    v13 = &a2->i16[v4];
    do
    {
      v15 = *v13++;
      v14 = v15;
      if (v15 <= -32767)
        v14 = -32767;
      *(float *)a4.i32 = (float)v14 / 32767.0;
      *v12++ = a4.i32[0];
      --v11;
    }
    while (v11);
  }
  return *(float *)a4.i32;
}

float32_t GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, uint16x8_t *a2, unint64_t a3, float32x4_t a4)
{
  unint64_t v4;
  uint16x8_t *v5;
  float32x4_t *v6;
  unint64_t v7;
  uint16x8_t v8;
  float32x4_t v9;
  float32x4_t v10;
  char *v11;
  _DWORD *v12;
  unsigned __int16 *v13;
  unsigned int v14;

  if (a3)
  {
    if (a3 < 0x10)
    {
      v4 = 0;
LABEL_7:
      v11 = (char *)(a3 - v4);
      v12 = (_DWORD *)((char *)this + 4 * v4);
      v13 = (unsigned __int16 *)a2 + v4;
      do
      {
        v14 = *v13++;
        a4.f32[0] = (float)v14 / 65535.0;
        *v12++ = a4.i32[0];
        --v11;
      }
      while (v11);
      return a4.f32[0];
    }
    v4 = a3 & 0xFFFFFFFFFFFFFFF0;
    v5 = a2 + 1;
    v6 = (float32x4_t *)((char *)this + 32);
    a4 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
    v7 = a3 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v8 = v5[-1];
      v9 = vcvtq_f32_u32(vmovl_high_u16(*v5));
      v10 = vdivq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v5->i8)), a4);
      v6[-2] = vdivq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v8.i8)), a4);
      v6[-1] = vdivq_f32(vcvtq_f32_u32(vmovl_high_u16(v8)), a4);
      *v6 = v10;
      v6[1] = vdivq_f32(v9, a4);
      v6 += 4;
      v5 += 2;
      v7 -= 16;
    }
    while (v7);
    if (v4 != a3)
      goto LABEL_7;
  }
  return a4.f32[0];
}

float32x4_t *GPUTools::GL::NormalizeIntegerComponents(float32x4_t *this, int32x4_t *a2, unint64_t a3)
{
  unint64_t v3;
  int32x4_t *v4;
  float32x4_t *v5;
  int32x4_t v6;
  float32x4_t v7;
  unint64_t v8;
  float32x4_t v9;
  char *v10;
  unint64_t v11;
  float *v12;
  float *v13;
  int v14;
  int v15;

  if (a3)
  {
    if (a3 >= 8)
    {
      v3 = a3 & 0xFFFFFFFFFFFFFFF8;
      v4 = a2 + 1;
      v5 = this + 1;
      v6 = vdupq_n_s32(0x80000001);
      v7.i64[0] = 0x3000000030000000;
      v7.i64[1] = 0x3000000030000000;
      v8 = a3 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v9 = vmulq_f32(vcvtq_f32_s32(vmaxq_s32(*v4, v6)), v7);
        v5[-1] = vmulq_f32(vcvtq_f32_s32(vmaxq_s32(v4[-1], v6)), v7);
        *v5 = v9;
        v4 += 2;
        v5 += 2;
        v8 -= 8;
      }
      while (v8);
      if (v3 == a3)
        return this;
    }
    else
    {
      v3 = 0;
    }
    v10 = (char *)(a3 - v3);
    v11 = v3;
    v12 = &this->f32[v3];
    v13 = (float *)&a2->i32[v11];
    do
    {
      v15 = *(_DWORD *)v13++;
      v14 = v15;
      if (v15 <= -2147483647)
        v14 = -2147483647;
      *v12++ = (float)v14 * 4.6566e-10;
      --v10;
    }
    while (v10);
  }
  return this;
}

float32_t GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, uint32x4_t *a2, unint64_t a3, float32x4_t a4)
{
  unint64_t v4;
  uint32x4_t *v5;
  float32x4_t *v6;
  unint64_t v7;
  float32x4_t v8;
  char *v9;
  unint64_t v10;
  _DWORD *v11;
  float *v12;
  unsigned int v13;

  if (a3)
  {
    if (a3 < 8)
    {
      v4 = 0;
LABEL_7:
      v9 = (char *)(a3 - v4);
      v10 = v4;
      v11 = (_DWORD *)((char *)this + 4 * v4);
      v12 = (float *)&a2->i32[v10];
      do
      {
        v13 = *(_DWORD *)v12++;
        a4.f32[0] = (float)v13 * 2.3283e-10;
        *v11++ = a4.i32[0];
        --v9;
      }
      while (v9);
      return a4.f32[0];
    }
    v4 = a3 & 0xFFFFFFFFFFFFFFF8;
    v5 = a2 + 1;
    v6 = (float32x4_t *)((char *)this + 16);
    a4 = (float32x4_t)vdupq_n_s32(0x2F800000u);
    v7 = a3 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v8 = vmulq_f32(vcvtq_f32_u32(*v5), a4);
      v6[-1] = vmulq_f32(vcvtq_f32_u32(v5[-1]), a4);
      *v6 = v8;
      v5 += 2;
      v6 += 2;
      v7 -= 8;
    }
    while (v7);
    if (v4 != a3)
      goto LABEL_7;
  }
  return a4.f32[0];
}

uint64_t GPUTools::GL::DYGetBufferBindingEnum(GPUTools::GL *this)
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

  if ((_DWORD)this == 36663)
    v1 = 36663;
  else
    v1 = 0;
  if ((_DWORD)this == 36662)
    v2 = 36662;
  else
    v2 = v1;
  if ((_DWORD)this == 35982)
    v3 = 35983;
  else
    v3 = 0;
  if ((_DWORD)this == 35345)
    v4 = 35368;
  else
    v4 = v3;
  if ((int)this <= 36661)
    v5 = v4;
  else
    v5 = v2;
  if ((_DWORD)this == 35052)
    v6 = 35055;
  else
    v6 = 0;
  if ((_DWORD)this == 35051)
    v7 = 35053;
  else
    v7 = v6;
  if ((_DWORD)this == 34963)
    v8 = 34965;
  else
    v8 = 0;
  if ((_DWORD)this == 34962)
    v9 = 34964;
  else
    v9 = v8;
  if ((int)this <= 35050)
    v10 = v9;
  else
    v10 = v7;
  if ((int)this <= 35344)
    return v10;
  else
    return v5;
}

uint64_t GPUTools::GL::DYGetBufferAccessAsBitfield(GPUTools::GL *this)
{
  if (((_DWORD)this - 35000) >= 3)
    return 0;
  else
    return ((_DWORD)this - 34999);
}

uint64_t GPUTools::GL::dy_get_renderbuffer_binding_enum(GPUTools::GL *this)
{
  return 36007;
}

uint64_t GPUTools::GL::dy_get_framebuffer_binding_enum(GPUTools::GL *this)
{
  int v1;
  unsigned int v2;

  if ((_DWORD)this == 36008)
    v1 = 36010;
  else
    v1 = 36160;
  if ((_DWORD)this == 36009)
    v2 = 36006;
  else
    v2 = v1;
  if ((_DWORD)this == 36160)
    return 36006;
  else
    return v2;
}

uint64_t GPUTools::GL::DYGetCompressedPalettedTextureInfo(uint64_t result, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  int v4;

  if ((result - 35728) > 9)
  {
    *a2 = 1;
    a2[1] = 1;
    a2[2] = 8;
  }
  else
  {
    v2 = 4 * ((int)result - 35728);
    v3 = *(_DWORD *)((char *)&unk_23C691DCC + v2);
    v4 = *(_DWORD *)((char *)&unk_23C691DF4 + v2);
    LODWORD(v2) = *(_DWORD *)((char *)&unk_23C691E1C + v2);
    *a2 = v3;
    a2[1] = v4;
    a2[2] = v2;
  }
  return result;
}

uint64_t GPUTools::GL::DYComputeTextureLayerDataOffset(GPUTools::GL *this, int a2, int a3, int a4)
{
  return ((int)this / a3 * (a2 - a4));
}

BOOL GPUTools::GL::DYIsAttachmentWritable(int a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  int v7;
  BOOL v8;
  BOOL v9;
  _BOOL4 v10;
  BOOL v11;
  int v12;
  BOOL v14;
  int v15;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  _DWORD v22[4];
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a1 == 33306)
  {
    v23[1] = 36128;
    a1 = 36096;
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  v4 = 0;
  v5 = 1;
  v23[0] = a1;
  while (1)
  {
    v7 = v23[v4];
    if ((v7 - 36064) < 0x10)
      break;
    if (v7 == 36096)
    {
      v22[0] = 0;
      (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 2929, v22);
      if (v22[0] == 1)
      {
        v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2930, &v21);
        if (v21)
        {
          v21 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2932, &v21);
          if (v21 != 512)
            return v5;
        }
      }
    }
    else if (v7 == 36128)
    {
      v22[0] = 0;
      (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 2960, v22);
      if (v22[0] == 1)
      {
        v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2968, &v21);
        if (v21)
        {
          v20 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2962, &v20);
          if (v20 == 519)
          {
            v19 = 0;
            HIDWORD(v18) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2929, (char *)&v18 + 4);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2965, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2966, &v19);
            if ((_DWORD)v19 == 7680)
            {
              v11 = HIDWORD(v19) == 7680;
              v12 = HIDWORD(v18);
              goto LABEL_36;
            }
            v10 = 1;
          }
          else
          {
            if (v20 == 512)
            {
              HIDWORD(v19) = 0;
              (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2964, (char *)&v19 + 4);
              v10 = HIDWORD(v19) != 7680;
              goto LABEL_43;
            }
            v18 = 0;
            v19 = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2929, &v18);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2964, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2965, &v19);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2966, (char *)&v18 + 4);
            v10 = 1;
            if (HIDWORD(v19) == 7680 && HIDWORD(v18) == 7680)
            {
              v11 = (_DWORD)v19 == 7680;
              v12 = v18;
LABEL_36:
              v10 = !v11 && v12 == 1;
            }
          }
        }
        else
        {
          v10 = 0;
        }
LABEL_43:
        v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 36005, &v21);
        v6 = v21;
        if (v21)
        {
          v20 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 34816, &v20);
          if (v20 == 512)
          {
            HIDWORD(v19) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34817, (char *)&v19 + 4);
            v6 = HIDWORD(v19) != 7680;
          }
          else if (v20 == 519)
          {
            v19 = 0;
            HIDWORD(v18) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2929, (char *)&v18 + 4);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34818, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 34819, &v19);
            if ((_DWORD)v19 == 7680)
            {
              v14 = HIDWORD(v19) == 7680;
              v15 = HIDWORD(v18);
              goto LABEL_51;
            }
            v6 = 1;
          }
          else
          {
            v18 = 0;
            v19 = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2929, &v18);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34817, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 34818, &v19);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34819, (char *)&v18 + 4);
            v6 = 1;
            if (HIDWORD(v19) == 7680 && HIDWORD(v18) == 7680)
            {
              v14 = (_DWORD)v19 == 7680;
              v15 = v18;
LABEL_51:
              v6 = !v14 && v15 == 1;
            }
          }
        }
        if (v10 || v6)
          return v5;
      }
    }
LABEL_7:
    v5 = ++v4 < v3;
    if (v3 == v4)
      return v5;
  }
  (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 3107, v22);
  if (v22[0])
    v8 = 0;
  else
    v8 = v22[1] == 0;
  v9 = v8 && v22[2] == 0;
  if (v9 && !v22[3])
    goto LABEL_7;
  return v5;
}

uint64_t GPUTools::GL::DYGetSyncObjectParamterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2)
    *a2 = 1;
  if (a3)
    *(_BYTE *)a3 = ((this - 37138) < 4) & (7u >> ((this - 18) & 0xF));
  return this;
}

void GPUTools::GL::DYResolveMSAABuffer(GPUTools::GL *this, unint64_t a2, int8x16_t *__src, size_t __n, float *__b, void *a6)
{
  float *v6;
  int8x16_t *v8;
  int v10;
  void *v11;
  double v12;
  int64x2_t v13;
  int8x16_t *v14;
  uint64_t v15;
  unint64_t v16;
  int8x16_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int8x16_t v40;
  int8x16_t v41;
  int16x8_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int16x8_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  uint64_t v54;
  int64x2_t v55;
  int64x2_t v56;
  int64x2_t v57;
  int64x2_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int8x16_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  int64x2_t v78;
  int64x2_t v79;
  int64x2_t v80;
  int64x2_t v81;
  int64x2_t v82;
  int64x2_t v83;
  int64x2_t v84;
  int8x16_t v85;
  int8x16_t v86;
  int16x8_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int16x8_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int16x8_t v96;
  int32x4_t v97;
  int32x4_t v98;
  uint64_t v99;
  int64x2_t v100;
  int64x2_t v101;
  int64x2_t v102;
  int64x2_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  int64x2_t v112;
  int64x2_t v113;
  int64x2_t v114;
  int64x2_t v115;
  int64x2_t v116;
  int64x2_t v117;
  int64x2_t v118;
  int64x2_t v119;
  int64x2_t v120;
  int64x2_t v121;
  int64x2_t v122;
  int64x2_t v123;
  int64x2_t v124;
  int64x2_t v125;
  int64x2_t v126;
  int64x2_t v127;
  int8x16_t v128;
  int8x16_t v129;
  uint32x4_t v130;
  uint32x4_t v131;
  uint32x4_t v132;
  uint32x4_t v133;
  uint32x4_t v134;
  uint32x4_t v135;
  uint32x4_t v136;
  uint32x4_t v137;
  uint64_t v138;
  int64x2_t v139;
  int64x2_t v140;
  int64x2_t v141;
  int64x2_t v142;
  uint32x4_t v143;

  v6 = __b;
  v8 = __src;
  if (a2 <= 1)
  {
    memcpy(__b, __src, __n);
    return;
  }
  v10 = (int)this;
  memset(__b, 255, __n / a2);
  if (v10 > 35055)
  {
    if (v10 <= 36167)
    {
      if (v10 > 36011)
      {
        if (v10 == 36012)
        {
          GPUTools::GL::MSAADepthStencilResolver<float>::resolve<4u,4u,true,63ull,32ull,0ull,0ull>(a2, (unint64_t)v8, __n, v6);
        }
        else if (v10 == 36013)
        {
          GPUTools::GL::MSAADepthStencilResolver<float>::resolve<8u,8u,true,63ull,32ull,31ull,24ull>(a2, (unint64_t)v8, __n, (uint64_t)v6);
        }
      }
      else
      {
        switch(v10)
        {
          case 35898:
            GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)11,(unsigned char)11,(unsigned char)10,(unsigned char)0>(a2, v8->i8, __n, (int *)v6);
            break;
          case 35899:
          case 35900:
          case 35902:
          case 35903:
          case 35904:
          case 35906:
            return;
          case 35901:
            GPUTools::GL::MSAABufferResolverResolveRGB9E5((GPUTools::GL *)a2, (unsigned int *)v8, (const void *)__n, (__int32 *)v6, v11, v12);
            break;
          case 35905:
LABEL_49:
            GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
            break;
          case 35907:
LABEL_45:
            GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(a2, (unsigned __int8 *)v8, __n, v6);
            break;
          default:
            if (v10 == 35056)
              GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,39ull,32ull>(a2, (unsigned int *)v8, __n, (uint64_t)v6);
            break;
        }
      }
      return;
    }
    switch(v10)
    {
      case 36168:
LABEL_8:
        if (!(_DWORD)__n)
          return;
        v14 = (int8x16_t *)((char *)v8 + __n);
        if (a2 < 8)
        {
          do
          {
            v15 = 0;
            v16 = 0;
            do
              v16 += v8->u8[v15++];
            while ((_DWORD)a2 != (_DWORD)v15);
            v8 = (int8x16_t *)((char *)v8 + a2);
            *(_BYTE *)v6 = v16 / a2;
            v6 = (float *)((char *)v6 + 1);
          }
          while (v8 < v14);
          return;
        }
        v107 = a2 & 0xFFFFFFE0;
        v108 = a2 & 0xFFFFFFF8;
        while (a2 >= 0x20)
        {
          v111 = 0;
          v112 = 0uLL;
          v113 = 0uLL;
          v114 = 0uLL;
          v115 = 0uLL;
          v116 = 0uLL;
          v117 = 0uLL;
          v118 = 0uLL;
          v119 = 0uLL;
          v120 = 0uLL;
          v121 = 0uLL;
          v122 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          v125 = 0uLL;
          v126 = 0uLL;
          v127 = 0uLL;
          do
          {
            v128 = v8[v111 / 0x10];
            v129 = v8[v111 / 0x10 + 1];
            v130 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_23C692020);
            v131 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_23C692010);
            v132 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_23C692000);
            v133 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_23C692030);
            v134 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_23C692020);
            v135 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_23C692010);
            v136 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_23C692000);
            v137 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_23C692030);
            v115 = (int64x2_t)vaddw_high_u32((uint64x2_t)v115, v131);
            v113 = (int64x2_t)vaddw_high_u32((uint64x2_t)v113, v132);
            v116 = (int64x2_t)vaddw_u32((uint64x2_t)v116, *(uint32x2_t *)v130.i8);
            v114 = (int64x2_t)vaddw_u32((uint64x2_t)v114, *(uint32x2_t *)v131.i8);
            v112 = (int64x2_t)vaddw_u32((uint64x2_t)v112, *(uint32x2_t *)v132.i8);
            v117 = (int64x2_t)vaddw_high_u32((uint64x2_t)v117, v130);
            v118 = (int64x2_t)vaddw_u32((uint64x2_t)v118, *(uint32x2_t *)v133.i8);
            v119 = (int64x2_t)vaddw_high_u32((uint64x2_t)v119, v133);
            v123 = (int64x2_t)vaddw_high_u32((uint64x2_t)v123, v135);
            v121 = (int64x2_t)vaddw_high_u32((uint64x2_t)v121, v136);
            v124 = (int64x2_t)vaddw_u32((uint64x2_t)v124, *(uint32x2_t *)v134.i8);
            v122 = (int64x2_t)vaddw_u32((uint64x2_t)v122, *(uint32x2_t *)v135.i8);
            v120 = (int64x2_t)vaddw_u32((uint64x2_t)v120, *(uint32x2_t *)v136.i8);
            v125 = (int64x2_t)vaddw_high_u32((uint64x2_t)v125, v134);
            v126 = (int64x2_t)vaddw_u32((uint64x2_t)v126, *(uint32x2_t *)v137.i8);
            v127 = (int64x2_t)vaddw_high_u32((uint64x2_t)v127, v137);
            v111 += 32;
          }
          while (v107 != v111);
          v13 = vaddq_s64(v126, v118);
          v109 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v120, v112), vaddq_s64(v124, v116)), vaddq_s64(vaddq_s64(v122, v114), v13)), vaddq_s64(vaddq_s64(vaddq_s64(v121, v113), vaddq_s64(v125, v117)), vaddq_s64(vaddq_s64(v123, v115), vaddq_s64(v127, v119)))));
          if (v107 == a2)
            goto LABEL_111;
          v110 = a2 & 0xFFFFFFE0;
          v138 = v110;
          if ((a2 & 0x18) != 0)
            goto LABEL_118;
          do
LABEL_121:
            v109 += v8->u8[v138++];
          while ((_DWORD)a2 != (_DWORD)v138);
LABEL_111:
          v8 = (int8x16_t *)((char *)v8 + a2);
          *(_BYTE *)v6 = v109 / a2;
          v6 = (float *)((char *)v6 + 1);
          if (v8 >= v14)
            return;
        }
        v109 = 0;
        v110 = 0;
LABEL_118:
        v139 = 0uLL;
        v140 = (int64x2_t)v109;
        v141 = 0uLL;
        v142 = 0uLL;
        do
        {
          v13.i64[0] = *(uint64_t *)((char *)v8->i64 + v110);
          v143 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v13, (int8x16_t)xmmword_23C692010);
          v13 = (int64x2_t)vqtbl1q_s8((int8x16_t)v13, (int8x16_t)xmmword_23C692000);
          v142 = (int64x2_t)vaddw_high_u32((uint64x2_t)v142, v143);
          v139 = (int64x2_t)vaddw_high_u32((uint64x2_t)v139, (uint32x4_t)v13);
          v141 = (int64x2_t)vaddw_u32((uint64x2_t)v141, *(uint32x2_t *)v143.i8);
          v140 = (int64x2_t)vaddw_u32((uint64x2_t)v140, *(uint32x2_t *)v13.i8);
          v110 += 8;
        }
        while (v108 != v110);
        v109 = vaddvq_s64(vaddq_s64(vaddq_s64(v140, v141), vaddq_s64(v139, v142)));
        v138 = a2 & 0xFFFFFFF8;
        if (v108 == a2)
          goto LABEL_111;
        goto LABEL_121;
      case 36169:
      case 36170:
      case 36171:
      case 36172:
      case 36173:
      case 36174:
      case 36175:
      case 36176:
      case 36177:
      case 36178:
      case 36179:
      case 36180:
      case 36181:
      case 36182:
      case 36183:
      case 36184:
      case 36185:
      case 36186:
      case 36187:
      case 36188:
      case 36189:
      case 36190:
      case 36191:
      case 36192:
      case 36193:
      case 36195:
      case 36196:
      case 36197:
      case 36198:
      case 36199:
      case 36200:
      case 36201:
      case 36202:
      case 36203:
      case 36204:
      case 36205:
      case 36206:
      case 36207:
      case 36210:
      case 36211:
      case 36212:
      case 36213:
      case 36216:
      case 36217:
      case 36218:
      case 36219:
      case 36222:
      case 36223:
      case 36224:
      case 36225:
      case 36228:
      case 36229:
      case 36230:
      case 36231:
      case 36234:
      case 36235:
      case 36236:
      case 36237:
        return;
      case 36194:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,53ull,52ull,48ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
        return;
      case 36208:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, &v8->i8[8], __n, (uint64_t)(v6 + 2));
        return;
      case 36209:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, &v8->u32[2], __n, (uint64_t)(v6 + 2));
        return;
      case 36214:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(a2, v8, __n, v6);
        return;
      case 36215:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
        return;
      case 36220:
        goto LABEL_45;
      case 36221:
        goto LABEL_49;
      case 36226:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, &v8->i8[8], __n, (uint64_t)(v6 + 2));
        return;
      case 36227:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i64, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, &v8->i32[2], __n, (uint64_t)(v6 + 2));
        return;
      case 36232:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(a2, v8->i64, __n, v6);
        return;
      case 36233:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(a2, v8->i32, __n, v6);
        return;
      case 36238:
LABEL_52:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(a2, v8->i8, __n, v6);
        return;
      case 36239:
LABEL_51:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(a2, v8->i8, __n, v6);
        return;
      default:
        switch(v10)
        {
          case 36756:
            if (!(_DWORD)__n)
              return;
            v17 = (int8x16_t *)((char *)v8 + __n);
            if (a2 < 8)
            {
              do
              {
                v20 = v8->i8[0];
                if ((_DWORD)a2 != 1)
                {
                  v20 += v8->i8[1];
                  if ((_DWORD)a2 != 2)
                  {
                    v20 += v8->i8[2];
                    if ((_DWORD)a2 != 3)
                    {
                      v20 += v8->i8[3];
                      if ((_DWORD)a2 != 4)
                      {
                        v20 += v8->i8[4];
                        if ((_DWORD)a2 != 5)
                        {
                          v20 += v8->i8[5];
                          if ((_DWORD)a2 != 6)
                            v20 += v8->i8[6];
                        }
                      }
                    }
                  }
                }
                v8 = (int8x16_t *)((char *)v8 + a2);
                *(_BYTE *)v6 = v20 / a2;
                v6 = (float *)((char *)v6 + 1);
              }
              while (v8 < v17);
              return;
            }
            v18 = a2 & 0xFFFFFFE0;
            v19 = a2 & 0xFFFFFFF8;
            break;
          case 36757:
LABEL_50:
            GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, v6);
            return;
          case 36758:
            goto LABEL_51;
          case 36759:
            goto LABEL_52;
          default:
            if (v10 == 36975)
LABEL_54:
              GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,41ull,32ull,51ull,42ull,61ull,52ull,63ull,62ull>(a2, v8->i8, __n, v6);
            return;
        }
        break;
    }
    while (a2 >= 0x20)
    {
      v23 = 0;
      v24 = 0uLL;
      v25 = 0uLL;
      v26 = 0uLL;
      v27 = 0uLL;
      v28 = 0uLL;
      v29 = 0uLL;
      v30 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
      v37 = 0uLL;
      v38 = 0uLL;
      v39 = 0uLL;
      do
      {
        v40 = v8[v23 / 0x10];
        v41 = v8[v23 / 0x10 + 1];
        v42 = vmovl_s8(*(int8x8_t *)v40.i8);
        v43 = vmovl_s16(*(int16x4_t *)v42.i8);
        v44 = vmovl_high_s16(v42);
        v45 = vmovl_high_s8(v40);
        v46 = vmovl_s16(*(int16x4_t *)v45.i8);
        v47 = vmovl_high_s16(v45);
        v48 = vmovl_s8(*(int8x8_t *)v41.i8);
        v49 = vmovl_s16(*(int16x4_t *)v48.i8);
        v50 = vmovl_high_s16(v48);
        v51 = vmovl_high_s8(v41);
        v52 = vmovl_s16(*(int16x4_t *)v51.i8);
        v53 = vmovl_high_s16(v51);
        v29 = vaddw_high_s32(v29, v46);
        v27 = vaddw_high_s32(v27, v44);
        v30 = vaddw_s32(v30, *(int32x2_t *)v47.i8);
        v28 = vaddw_s32(v28, *(int32x2_t *)v46.i8);
        v26 = vaddw_s32(v26, *(int32x2_t *)v44.i8);
        v25 = vaddw_high_s32(v25, v43);
        v31 = vaddw_high_s32(v31, v47);
        v24 = vaddw_s32(v24, *(int32x2_t *)v43.i8);
        v37 = vaddw_high_s32(v37, v52);
        v35 = vaddw_high_s32(v35, v50);
        v38 = vaddw_s32(v38, *(int32x2_t *)v53.i8);
        v36 = vaddw_s32(v36, *(int32x2_t *)v52.i8);
        v34 = vaddw_s32(v34, *(int32x2_t *)v50.i8);
        v33 = vaddw_high_s32(v33, v49);
        v39 = vaddw_high_s32(v39, v53);
        v32 = vaddw_s32(v32, *(int32x2_t *)v49.i8);
        v23 += 32;
      }
      while (v18 != v23);
      v21 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v32, v24), vaddq_s64(v36, v28)), vaddq_s64(vaddq_s64(v34, v26), vaddq_s64(v38, v30))), vaddq_s64(vaddq_s64(vaddq_s64(v33, v25), vaddq_s64(v37, v29)), vaddq_s64(vaddq_s64(v35, v27), vaddq_s64(v39, v31)))));
      if (v18 == a2)
        goto LABEL_31;
      v22 = a2 & 0xFFFFFFE0;
      v54 = v22;
      if ((a2 & 0x18) != 0)
        goto LABEL_38;
      do
LABEL_41:
        v21 += v8->i8[v54++];
      while ((_DWORD)a2 != (_DWORD)v54);
LABEL_31:
      v8 = (int8x16_t *)((char *)v8 + a2);
      *(_BYTE *)v6 = v21 / a2;
      v6 = (float *)((char *)v6 + 1);
      if (v8 >= v17)
        return;
    }
    v21 = 0;
    v22 = 0;
LABEL_38:
    v55 = 0uLL;
    v56 = (int64x2_t)(unint64_t)v21;
    v57 = 0uLL;
    v58 = 0uLL;
    do
    {
      v59 = vmovl_s8(*(int8x8_t *)&v8->i8[v22]);
      v60 = vmovl_s16(*(int16x4_t *)v59.i8);
      v61 = vmovl_high_s16(v59);
      v58 = vaddw_high_s32(v58, v61);
      v57 = vaddw_s32(v57, *(int32x2_t *)v61.i8);
      v55 = vaddw_high_s32(v55, v60);
      v56 = vaddw_s32(v56, *(int32x2_t *)v60.i8);
      v22 += 8;
    }
    while (v19 != v22);
    v21 = vaddvq_s64(vaddq_s64(vaddq_s64(v56, v57), vaddq_s64(v55, v58)));
    v54 = a2 & 0xFFFFFFF8;
    if (v19 == a2)
      goto LABEL_31;
    goto LABEL_41;
  }
  switch(v10)
  {
    case 33189:
      GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33190:
      GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,0ull,0ull>(a2, (uint32x4_t *)v8, __n, (uint64_t)v6);
      return;
    case 33191:
    case 33192:
    case 33193:
    case 33194:
    case 33195:
    case 33196:
    case 33197:
    case 33198:
    case 33199:
    case 33200:
    case 33201:
    case 33202:
    case 33203:
    case 33204:
    case 33205:
    case 33206:
    case 33207:
    case 33208:
    case 33209:
    case 33210:
    case 33211:
    case 33212:
    case 33213:
    case 33214:
    case 33215:
    case 33216:
    case 33217:
    case 33218:
    case 33219:
    case 33220:
    case 33221:
    case 33222:
    case 33223:
    case 33224:
    case 33225:
    case 33226:
    case 33227:
    case 33228:
    case 33229:
    case 33230:
    case 33231:
    case 33232:
    case 33233:
    case 33234:
    case 33235:
    case 33236:
    case 33237:
    case 33238:
    case 33239:
    case 33240:
    case 33241:
    case 33242:
    case 33243:
    case 33244:
    case 33245:
    case 33246:
    case 33247:
    case 33248:
    case 33249:
    case 33250:
    case 33251:
    case 33252:
    case 33253:
    case 33254:
    case 33255:
    case 33256:
    case 33257:
    case 33258:
    case 33259:
    case 33260:
    case 33261:
    case 33262:
    case 33263:
    case 33264:
    case 33265:
    case 33266:
    case 33267:
    case 33268:
    case 33269:
    case 33270:
    case 33271:
    case 33272:
    case 33273:
    case 33274:
    case 33275:
    case 33276:
    case 33277:
    case 33278:
    case 33279:
    case 33280:
    case 33281:
    case 33282:
    case 33283:
    case 33284:
    case 33285:
    case 33286:
    case 33287:
    case 33288:
    case 33289:
    case 33290:
    case 33291:
    case 33292:
    case 33293:
    case 33294:
    case 33295:
    case 33296:
    case 33297:
    case 33298:
    case 33299:
    case 33300:
    case 33301:
    case 33302:
    case 33303:
    case 33304:
    case 33305:
    case 33306:
    case 33307:
    case 33308:
    case 33309:
    case 33310:
    case 33311:
    case 33312:
    case 33313:
    case 33314:
    case 33315:
    case 33316:
    case 33317:
    case 33318:
    case 33319:
    case 33320:
    case 33322:
    case 33324:
      return;
    case 33321:
    case 33330:
      goto LABEL_8;
    case 33323:
    case 33336:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
      return;
    case 33325:
      GPUTools::GL::MSAABufferResolver<float>::resolve<2u,(unsigned char)16,(unsigned char)0,(unsigned char)0,(unsigned char)0>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33326:
      GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)32,(unsigned char)0,(unsigned char)0,(unsigned char)0>(a2, (unint64_t)v8, __n, v6);
      return;
    case 33327:
      GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)16,(unsigned char)16,(unsigned char)0,(unsigned char)0>(a2, v8->i8, __n, v6);
      return;
    case 33328:
      GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)32,(unsigned char)32,(unsigned char)0,(unsigned char)0>(a2, (unint64_t)v8, __n, v6, v12);
      return;
    case 33329:
      if (!(_DWORD)__n)
        return;
      v62 = (int8x16_t *)((char *)v8 + __n);
      if (a2 >= 8)
      {
        v63 = a2 & 0xFFFFFFE0;
        v64 = a2 & 0xFFFFFFF8;
        while (a2 >= 0x20)
        {
          v68 = 0;
          v69 = 0uLL;
          v70 = 0uLL;
          v71 = 0uLL;
          v72 = 0uLL;
          v73 = 0uLL;
          v74 = 0uLL;
          v75 = 0uLL;
          v76 = 0uLL;
          v77 = 0uLL;
          v78 = 0uLL;
          v79 = 0uLL;
          v80 = 0uLL;
          v81 = 0uLL;
          v82 = 0uLL;
          v83 = 0uLL;
          v84 = 0uLL;
          do
          {
            v85 = v8[v68 / 0x10];
            v86 = v8[v68 / 0x10 + 1];
            v87 = vmovl_s8(*(int8x8_t *)v85.i8);
            v88 = vmovl_s16(*(int16x4_t *)v87.i8);
            v89 = vmovl_high_s16(v87);
            v90 = vmovl_high_s8(v85);
            v91 = vmovl_s16(*(int16x4_t *)v90.i8);
            v92 = vmovl_high_s16(v90);
            v93 = vmovl_s8(*(int8x8_t *)v86.i8);
            v94 = vmovl_s16(*(int16x4_t *)v93.i8);
            v95 = vmovl_high_s16(v93);
            v96 = vmovl_high_s8(v86);
            v97 = vmovl_s16(*(int16x4_t *)v96.i8);
            v98 = vmovl_high_s16(v96);
            v74 = vaddw_high_s32(v74, v91);
            v72 = vaddw_high_s32(v72, v89);
            v75 = vaddw_s32(v75, *(int32x2_t *)v92.i8);
            v73 = vaddw_s32(v73, *(int32x2_t *)v91.i8);
            v71 = vaddw_s32(v71, *(int32x2_t *)v89.i8);
            v70 = vaddw_high_s32(v70, v88);
            v76 = vaddw_high_s32(v76, v92);
            v69 = vaddw_s32(v69, *(int32x2_t *)v88.i8);
            v82 = vaddw_high_s32(v82, v97);
            v80 = vaddw_high_s32(v80, v95);
            v83 = vaddw_s32(v83, *(int32x2_t *)v98.i8);
            v81 = vaddw_s32(v81, *(int32x2_t *)v97.i8);
            v79 = vaddw_s32(v79, *(int32x2_t *)v95.i8);
            v78 = vaddw_high_s32(v78, v94);
            v84 = vaddw_high_s32(v84, v98);
            v77 = vaddw_s32(v77, *(int32x2_t *)v94.i8);
            v68 += 32;
          }
          while (v63 != v68);
          v66 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v77, v69), vaddq_s64(v81, v73)), vaddq_s64(vaddq_s64(v79, v71), vaddq_s64(v83, v75))), vaddq_s64(vaddq_s64(vaddq_s64(v78, v70), vaddq_s64(v82, v74)), vaddq_s64(vaddq_s64(v80, v72), vaddq_s64(v84, v76)))));
          if (v63 == a2)
            goto LABEL_77;
          v67 = a2 & 0xFFFFFFE0;
          v99 = v67;
          if ((a2 & 0x18) != 0)
            goto LABEL_84;
          do
LABEL_87:
            v66 += v8->i8[v99++];
          while ((_DWORD)a2 != (_DWORD)v99);
LABEL_77:
          v8 = (int8x16_t *)((char *)v8 + a2);
          *(_BYTE *)v6 = v66 / a2;
          v6 = (float *)((char *)v6 + 1);
          if (v8 >= v62)
            return;
        }
        v66 = 0;
        v67 = 0;
LABEL_84:
        v100 = 0uLL;
        v101 = (int64x2_t)(unint64_t)v66;
        v102 = 0uLL;
        v103 = 0uLL;
        do
        {
          v104 = vmovl_s8(*(int8x8_t *)&v8->i8[v67]);
          v105 = vmovl_s16(*(int16x4_t *)v104.i8);
          v106 = vmovl_high_s16(v104);
          v103 = vaddw_high_s32(v103, v106);
          v102 = vaddw_s32(v102, *(int32x2_t *)v106.i8);
          v100 = vaddw_high_s32(v100, v105);
          v101 = vaddw_s32(v101, *(int32x2_t *)v105.i8);
          v67 += 8;
        }
        while (v64 != v67);
        v66 = vaddvq_s64(vaddq_s64(vaddq_s64(v101, v102), vaddq_s64(v100, v103)));
        v99 = a2 & 0xFFFFFFF8;
        if (v64 == a2)
          goto LABEL_77;
        goto LABEL_87;
      }
      do
      {
        v65 = v8->i8[0];
        if ((_DWORD)a2 != 1)
        {
          v65 += v8->i8[1];
          if ((_DWORD)a2 != 2)
          {
            v65 += v8->i8[2];
            if ((_DWORD)a2 != 3)
            {
              v65 += v8->i8[3];
              if ((_DWORD)a2 != 4)
              {
                v65 += v8->i8[4];
                if ((_DWORD)a2 != 5)
                {
                  v65 += v8->i8[5];
                  if ((_DWORD)a2 != 6)
                    v65 += v8->i8[6];
                }
              }
            }
          }
        }
        v8 = (int8x16_t *)((char *)v8 + a2);
        *(_BYTE *)v6 = v65 / a2;
        v6 = (float *)((char *)v6 + 1);
      }
      while (v8 < v62);
      break;
    case 33331:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
      return;
    case 33332:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33333:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, v8->i32, __n, (uint64_t)v6);
      return;
    case 33334:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, (uint64_t)v6);
      return;
    case 33335:
      goto LABEL_50;
    case 33337:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,47ull,32ull,65ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
      return;
    case 33338:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,47ull,32ull,63ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
      return;
    case 33339:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8, __n, (uint64_t)v6);
      return;
    case 33340:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8, __n, (uint64_t)v6);
      return;
    default:
      switch(v10)
      {
        case 32849:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,32ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
          break;
        case 32850:
        case 32851:
        case 32852:
        case 32853:
          return;
        case 32854:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,60ull,59ull,56ull,55ull,52ull,51ull,48ull>(a2, (unsigned __int8 *)v8, __n, v6);
          break;
        case 32855:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,54ull,53ull,49ull,48ull,48ull>(a2, v8->i8, __n, v6);
          break;
        case 32856:
          goto LABEL_45;
        case 32857:
          goto LABEL_54;
        default:
          switch(v10)
          {
            case 34836:
              GPUTools::GL::MSAABufferResolver<float>::resolve<16u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)32>(a2, (unint64_t)v8, __n, (int32x4_t *)v6, v12);
              break;
            case 34837:
              GPUTools::GL::MSAABufferResolver<float>::resolve<12u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)0>(a2, (float32x2_t *)v8, __n, v6, v12);
              break;
            case 34842:
              GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)16>(a2, v8->i16, __n, v6);
              break;
            case 34843:
              GPUTools::GL::MSAABufferResolver<float>::resolve<6u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)0>(a2, (unsigned __int16 *)v8, __n, v6);
              break;
            default:
              return;
          }
          break;
      }
      return;
  }
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(unint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  unint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64x2_t v10;
  const char *v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint16x8_t v16;
  uint32x4_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  uint32x4_t v21;
  int8x16_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  const char *v28;
  int64x2_t v29;
  uint64_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  uint16x8_t v37;
  uint32x4_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int8x16_t v41;
  uint32x4_t v42;
  int8x16_t v43;
  uint16x8_t v44;
  uint32x4_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  uint32x4_t v49;
  int8x16_t v50;
  uint16x8_t v51;
  uint32x4_t v52;
  uint32x4_t v53;
  int64x2_t v54;
  uint64_t v55;
  int64x2_t v56;
  const char *v57;
  int64x2_t v58;
  int64x2_t v59;
  int64x2_t v60;
  int64x2_t v61;
  int64x2_t v62;
  int64x2_t v63;
  uint16x8_t v64;
  uint32x4_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  uint32x4_t v69;
  int8x16_t v70;
  uint16x8_t v71;
  uint32x4_t v72;
  int8x16_t v73;
  int8x16_t v74;
  int8x16_t v75;
  uint32x4_t v76;
  int8x16_t v77;
  uint16x8_t v78;
  uint32x4_t v79;
  uint32x4_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  int v84;
  int64x2_t v85;
  int64x2_t v86;
  uint64_t v87;
  uint64_t v88;
  int64x2_t v89;
  int64x2_t v90;
  const char *v91;
  uint16x8_t v92;
  uint32x4_t v93;
  int8x16_t v94;
  int8x16_t v95;
  int8x16_t v96;
  uint32x4_t v97;
  int8x16_t v98;
  int v99;
  int8x8x2_t v100;
  int8x8x2_t v101;
  int8x16x2_t v102;
  int8x16x2_t v103;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned __int16 *)((char *)a2 + a3);
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v9 = *a2;
        if (result >= 2)
        {
          v9 += a2[1];
          if ((_DWORD)v4 != 2)
          {
            v9 += a2[2];
            if ((_DWORD)v4 != 3)
            {
              v9 += a2[3];
              if ((_DWORD)v4 != 4)
              {
                v9 += a2[4];
                if ((_DWORD)v4 != 5)
                {
                  v9 += a2[5];
                  if ((_DWORD)v4 != 6)
                    v9 += a2[6];
                }
              }
            }
          }
        }
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v9 / v4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v7 > 0xF)
      {
        v26 = v7 & 0xFFFFFFF0;
        if (v26 == v7)
        {
          do
          {
            v27 = 0uLL;
            v28 = (const char *)a2;
            v29 = 0uLL;
            v30 = v26;
            v31 = 0uLL;
            v32 = 0uLL;
            v33 = 0uLL;
            v34 = 0uLL;
            v35 = 0uLL;
            v36 = 0uLL;
            do
            {
              v102 = vld2q_s8(v28);
              v28 += 32;
              v37 = vmovl_high_u8((uint8x16_t)v102.val[0]);
              v38 = vmovl_high_u16(v37);
              v39.i64[0] = v38.u32[2];
              v39.i64[1] = v38.u32[3];
              v40 = v39;
              v39.i64[0] = v38.u32[0];
              v39.i64[1] = v38.u32[1];
              v41 = v39;
              v42 = vmovl_u16(*(uint16x4_t *)v37.i8);
              v39.i64[0] = v42.u32[2];
              v39.i64[1] = v42.u32[3];
              v43 = v39;
              v44 = vmovl_u8(*(uint8x8_t *)v102.val[0].i8);
              v45 = vmovl_high_u16(v44);
              v39.i64[0] = v45.u32[2];
              v39.i64[1] = v45.u32[3];
              v46 = v39;
              v39.i64[0] = v42.u32[0];
              v39.i64[1] = v42.u32[1];
              v47 = v39;
              v39.i64[0] = v45.u32[0];
              v39.i64[1] = v45.u32[1];
              v48 = v39;
              v49 = vmovl_u16(*(uint16x4_t *)v44.i8);
              v39.i64[0] = v49.u32[2];
              v39.i64[1] = v49.u32[3];
              v50 = v39;
              v39.i64[0] = v49.u32[0];
              v39.i64[1] = v49.u32[1];
              v51 = vmovl_u8(*(uint8x8_t *)v102.val[1].i8);
              v52 = vmovl_u16(*(uint16x4_t *)v51.i8);
              v53 = vmovl_high_u16(v51);
              v102.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v102.val[1]);
              v102.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v102.val[0].i8);
              v102.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v102.val[0]);
              v36 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v102.val[0], 8uLL), v40), v36);
              v35 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v102.val[0].i8, 8uLL), v41), v35);
              v34 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v102.val[1], 8uLL), v43), v34);
              v32 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v53, 8uLL), v46), v32);
              v33 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v102.val[1].i8, 8uLL), v47), v33);
              v31 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v53.i8, 8uLL), v48), v31);
              v29 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v52, 8uLL), v50), v29);
              v27 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v52.i8, 8uLL), v39), v27);
              v30 -= 16;
            }
            while (v30);
            a2 = (unsigned __int16 *)((char *)a2 + v6);
            *a4++ = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v27, v33), vaddq_s64(v31, v35)), vaddq_s64(vaddq_s64(v29, v34), vaddq_s64(v32, v36))))/ v4;
          }
          while (a2 < v5);
        }
        else
        {
          do
          {
            v54 = 0uLL;
            v55 = v7 & 0xFFFFFFF0;
            v56 = 0uLL;
            v57 = (const char *)a2;
            v58 = 0uLL;
            v59 = 0uLL;
            v60 = 0uLL;
            v61 = 0uLL;
            v62 = 0uLL;
            v63 = 0uLL;
            do
            {
              v103 = vld2q_s8(v57);
              v57 += 32;
              v64 = vmovl_high_u8((uint8x16_t)v103.val[0]);
              v65 = vmovl_high_u16(v64);
              v66.i64[0] = v65.u32[2];
              v66.i64[1] = v65.u32[3];
              v67 = v66;
              v66.i64[0] = v65.u32[0];
              v66.i64[1] = v65.u32[1];
              v68 = v66;
              v69 = vmovl_u16(*(uint16x4_t *)v64.i8);
              v66.i64[0] = v69.u32[2];
              v66.i64[1] = v69.u32[3];
              v70 = v66;
              v71 = vmovl_u8(*(uint8x8_t *)v103.val[0].i8);
              v72 = vmovl_high_u16(v71);
              v66.i64[0] = v72.u32[2];
              v66.i64[1] = v72.u32[3];
              v73 = v66;
              v66.i64[0] = v69.u32[0];
              v66.i64[1] = v69.u32[1];
              v74 = v66;
              v66.i64[0] = v72.u32[0];
              v66.i64[1] = v72.u32[1];
              v75 = v66;
              v76 = vmovl_u16(*(uint16x4_t *)v71.i8);
              v66.i64[0] = v76.u32[2];
              v66.i64[1] = v76.u32[3];
              v77 = v66;
              v66.i64[0] = v76.u32[0];
              v66.i64[1] = v76.u32[1];
              v78 = vmovl_u8(*(uint8x8_t *)v103.val[1].i8);
              v79 = vmovl_u16(*(uint16x4_t *)v78.i8);
              v80 = vmovl_high_u16(v78);
              v103.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v103.val[1]);
              v103.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[0].i8);
              v103.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[0]);
              v63 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v103.val[0], 8uLL), v67), v63);
              v62 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v103.val[0].i8, 8uLL), v68), v62);
              v61 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v103.val[1], 8uLL), v70), v61);
              v59 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v80, 8uLL), v73), v59);
              v60 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v103.val[1].i8, 8uLL), v74), v60);
              v58 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v80.i8, 8uLL), v75), v58);
              v56 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v79, 8uLL), v77), v56);
              v54 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v79.i8, 8uLL), v66), v54);
              v55 -= 16;
            }
            while (v55);
            v81 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v54, v60), vaddq_s64(v58, v62)), vaddq_s64(vaddq_s64(v56, v61), vaddq_s64(v59, v63))));
            v82 = v81;
            v83 = v26;
            v84 = v7 & 0xFFFFFFF0;
            if ((v7 & 8) == 0)
              goto LABEL_38;
            v85 = 0uLL;
            v86 = (int64x2_t)(unint64_t)v81;
            v87 = v8 - v26;
            v88 = (2 * v4) & 0x1FFFFFFE0;
            v89 = 0uLL;
            v90 = 0uLL;
            do
            {
              v91 = (char *)a2 + v88;
              v101 = vld2_s8(v91);
              v92 = vmovl_u8((uint8x8_t)v101.val[0]);
              v93 = vmovl_high_u16(v92);
              v94.i64[0] = v93.u32[2];
              v94.i64[1] = v93.u32[3];
              v95 = v94;
              v94.i64[0] = v93.u32[0];
              v94.i64[1] = v93.u32[1];
              v96 = v94;
              v97 = vmovl_u16(*(uint16x4_t *)v92.i8);
              v94.i64[0] = v97.u32[2];
              v94.i64[1] = v97.u32[3];
              v98 = v94;
              v94.i64[0] = v97.u32[0];
              v94.i64[1] = v97.u32[1];
              v101 = (int8x8x2_t)vmovl_u8((uint8x8_t)v101.val[1]);
              *(int8x8x2_t *)((char *)&v101 + 8) = (int8x8x2_t)vmovl_u16((uint16x4_t)v101.val[0]);
              v101 = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v101);
              v90 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v101, 8uLL), v95), v90);
              v89 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v101.val[0], 8uLL), v96), v89);
              v85 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v101 + 8), 8uLL), v98), v85);
              v86 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v101.val[1], 8uLL), v94), v86);
              v88 += 16;
              v87 -= 8;
            }
            while (v87);
            v82 = vaddvq_s64(vaddq_s64(vaddq_s64(v86, v89), vaddq_s64(v85, v90)));
            v83 = v7 & 0xFFFFFFF8;
            v84 = v7 & 0xFFFFFFF8;
            if (v8 != v7)
            {
LABEL_38:
              v99 = v4 - v84;
              do
              {
                v82 += a2[v83++];
                --v99;
              }
              while (v99);
            }
            a2 = (unsigned __int16 *)((char *)a2 + v6);
            result = v82 / v4;
            *a4++ = result;
          }
          while (a2 < v5);
        }
      }
      else
      {
        do
        {
          v10 = 0uLL;
          v11 = (const char *)a2;
          v12 = v7 & 0xFFFFFFF8;
          v13 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          do
          {
            v100 = vld2_s8(v11);
            v11 += 16;
            v16 = vmovl_u8((uint8x8_t)v100.val[0]);
            v17 = vmovl_high_u16(v16);
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            v19 = v18;
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            v20 = v18;
            v21 = vmovl_u16(*(uint16x4_t *)v16.i8);
            v18.i64[0] = v21.u32[2];
            v18.i64[1] = v21.u32[3];
            v22 = v18;
            v18.i64[0] = v21.u32[0];
            v18.i64[1] = v21.u32[1];
            v100 = (int8x8x2_t)vmovl_u8((uint8x8_t)v100.val[1]);
            *(int8x8x2_t *)((char *)&v100 + 8) = (int8x8x2_t)vmovl_u16((uint16x4_t)v100.val[0]);
            v100 = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v100);
            v15 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v100, 8uLL), v19), v15);
            v14 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v100.val[0], 8uLL), v20), v14);
            v13 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v100 + 8), 8uLL), v22), v13);
            v10 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v100.val[1], 8uLL), v18), v10);
            v12 -= 8;
          }
          while (v12);
          v23 = vaddvq_s64(vaddq_s64(vaddq_s64(v10, v14), vaddq_s64(v13, v15)));
          v24 = v4 - v8;
          v25 = v7 & 0xFFFFFFF8;
          if (v8 != v7)
          {
            do
            {
              result = a2[v25];
              v23 += result;
              ++v25;
              --v24;
            }
            while (v24);
          }
          a2 = (unsigned __int16 *)((char *)a2 + v6);
          *a4++ = v23 / v4;
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, _WORD *a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64x2_t v10;
  const char *v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint16x8_t v16;
  uint32x4_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  uint32x4_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  unsigned int v25;
  unsigned int v26;
  int64x2_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int64x2_t v34;
  const char *v35;
  int64x2_t v36;
  uint64_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  uint16x8_t v44;
  uint32x4_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  uint32x4_t v49;
  int64x2_t v50;
  uint16x8_t v51;
  uint32x4_t v52;
  int64x2_t v53;
  int64x2_t v54;
  int64x2_t v55;
  uint32x4_t v56;
  int64x2_t v57;
  int64x2_t v58;
  uint16x8_t v59;
  uint32x4_t v60;
  int64x2_t v61;
  int64x2_t v62;
  uint32x4_t v63;
  int64x2_t v64;
  int64x2_t v65;
  int64x2_t v66;
  int64x2_t v67;
  int64x2_t v68;
  uint64_t v69;
  int64x2_t v70;
  const char *v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  uint16x8_t v78;
  uint32x4_t v79;
  int64x2_t v80;
  int64x2_t v81;
  int64x2_t v82;
  uint32x4_t v83;
  int64x2_t v84;
  uint16x8_t v85;
  uint32x4_t v86;
  int64x2_t v87;
  int64x2_t v88;
  int64x2_t v89;
  uint32x4_t v90;
  int64x2_t v91;
  int64x2_t v92;
  uint16x8_t v93;
  uint32x4_t v94;
  int64x2_t v95;
  int64x2_t v96;
  uint32x4_t v97;
  int64x2_t v98;
  int64x2_t v99;
  int64x2_t v100;
  int64x2_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int64x2_t v106;
  int64x2_t v107;
  uint64_t v108;
  uint64_t v109;
  int64x2_t v110;
  int64x2_t v111;
  const char *v112;
  uint16x8_t v113;
  uint32x4_t v114;
  int64x2_t v115;
  int64x2_t v116;
  int64x2_t v117;
  uint32x4_t v118;
  int64x2_t v119;
  int64x2_t v120;
  int64x2_t v121;
  unsigned int v122;
  unsigned int v123;
  int64x2_t v124;
  unsigned int v125;
  unsigned int v126;
  int v127;
  uint16x8_t v128;
  uint16x8_t v129;
  int8x16x2_t v130;
  int8x16x2_t v131;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v9 = (uint64_t)(((unint64_t)*a2 << 48) | ((unint64_t)a2[1] << 56)) >> 48;
        if (result >= 2)
        {
          v9 += (uint64_t)(((unint64_t)a2[2] << 48) | ((unint64_t)a2[3] << 56)) >> 48;
          if ((_DWORD)v4 != 2)
          {
            v9 += (uint64_t)(((unint64_t)a2[4] << 48) | ((unint64_t)a2[5] << 56)) >> 48;
            if ((_DWORD)v4 != 3)
            {
              v9 += (uint64_t)(((unint64_t)a2[6] << 48) | ((unint64_t)a2[7] << 56)) >> 48;
              if ((_DWORD)v4 != 4)
              {
                v9 += (uint64_t)(((unint64_t)a2[8] << 48) | ((unint64_t)a2[9] << 56)) >> 48;
                if ((_DWORD)v4 != 5)
                {
                  v9 += (uint64_t)(((unint64_t)a2[10] << 48) | ((unint64_t)a2[11] << 56)) >> 48;
                  if ((_DWORD)v4 != 6)
                    v9 += (uint64_t)(((unint64_t)a2[12] << 48) | ((unint64_t)a2[13] << 56)) >> 48;
                }
              }
            }
          }
        }
        a2 += v6;
        *a4++ = v9 / v4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v7 > 0xF)
      {
        v33 = v7 & 0xFFFFFFF0;
        if (v33 == v7)
        {
          do
          {
            v34 = 0uLL;
            v35 = (const char *)a2;
            v36 = 0uLL;
            v37 = v33;
            v38 = 0uLL;
            v39 = 0uLL;
            v40 = 0uLL;
            v41 = 0uLL;
            v42 = 0uLL;
            v43 = 0uLL;
            do
            {
              v130 = vld2q_s8(v35);
              v35 += 32;
              v44 = vmovl_u8(*(uint8x8_t *)v130.val[0].i8);
              v45 = vmovl_u16(*(uint16x4_t *)v44.i8);
              v46.i64[0] = v45.u32[0];
              v46.i64[1] = v45.u32[1];
              v47 = v46;
              v46.i64[0] = v45.u32[2];
              v46.i64[1] = v45.u32[3];
              v48 = v46;
              v49 = vmovl_high_u16(v44);
              v46.i64[0] = v49.u32[0];
              v46.i64[1] = v49.u32[1];
              v50 = v46;
              v51 = vmovl_high_u8((uint8x16_t)v130.val[0]);
              v52 = vmovl_u16(*(uint16x4_t *)v51.i8);
              v46.i64[0] = v52.u32[0];
              v46.i64[1] = v52.u32[1];
              v53 = v46;
              v46.i64[0] = v49.u32[2];
              v46.i64[1] = v49.u32[3];
              v54 = v46;
              v46.i64[0] = v52.u32[2];
              v46.i64[1] = v52.u32[3];
              v55 = v46;
              v56 = vmovl_high_u16(v51);
              v46.i64[0] = v56.u32[0];
              v46.i64[1] = v56.u32[1];
              v57 = v46;
              v46.i64[0] = v56.u32[2];
              v46.i64[1] = v56.u32[3];
              v58 = v46;
              v59 = vmovl_u8(*(uint8x8_t *)v130.val[1].i8);
              v60 = vmovl_u16(*(uint16x4_t *)v59.i8);
              v46.i64[0] = v60.u32[0];
              v46.i64[1] = v60.u32[1];
              v61 = v46;
              v46.i64[0] = v60.u32[2];
              v46.i64[1] = v60.u32[3];
              v62 = v46;
              v63 = vmovl_high_u16(v59);
              v46.i64[0] = v63.u32[0];
              v46.i64[1] = v63.u32[1];
              v64 = v46;
              v130.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v130.val[1]);
              v130.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v130.val[0].i8);
              v46.i64[0] = v130.val[1].u32[0];
              v46.i64[1] = v130.val[1].u32[1];
              v65 = v46;
              v46.i64[0] = v63.u32[2];
              v46.i64[1] = v63.u32[3];
              v66 = v46;
              v46.i64[0] = v130.val[1].u32[2];
              v46.i64[1] = v130.val[1].u32[3];
              v130.val[1] = (int8x16_t)v46;
              v130.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v130.val[0]);
              v46.i64[0] = v130.val[0].u32[0];
              v46.i64[1] = v130.val[0].u32[1];
              v67 = v46;
              v46.i64[0] = v130.val[0].u32[2];
              v46.i64[1] = v130.val[0].u32[3];
              v43 = vsraq_n_s64(v43, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v58, 0x30uLL)), 0x30uLL);
              v42 = vsraq_n_s64(v42, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v67, 0x38uLL), (int8x16_t)vshlq_n_s64(v57, 0x30uLL)), 0x30uLL);
              v41 = vsraq_n_s64(v41, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v130.val[1], 0x38uLL), (int8x16_t)vshlq_n_s64(v55, 0x30uLL)), 0x30uLL);
              v39 = vsraq_n_s64(v39, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v66, 0x38uLL), (int8x16_t)vshlq_n_s64(v54, 0x30uLL)), 0x30uLL);
              v40 = vsraq_n_s64(v40, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v65, 0x38uLL), (int8x16_t)vshlq_n_s64(v53, 0x30uLL)), 0x30uLL);
              v38 = vsraq_n_s64(v38, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v64, 0x38uLL), (int8x16_t)vshlq_n_s64(v50, 0x30uLL)), 0x30uLL);
              v36 = vsraq_n_s64(v36, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v62, 0x38uLL), (int8x16_t)vshlq_n_s64(v48, 0x30uLL)), 0x30uLL);
              v34 = vsraq_n_s64(v34, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v61, 0x38uLL), (int8x16_t)vshlq_n_s64(v47, 0x30uLL)), 0x30uLL);
              v37 -= 16;
            }
            while (v37);
            a2 += v6;
            *a4++ = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v34, v40), vaddq_s64(v38, v42)), vaddq_s64(vaddq_s64(v36, v41), vaddq_s64(v39, v43))))/ v4;
          }
          while (a2 < v5);
        }
        else
        {
          do
          {
            v68 = 0uLL;
            v69 = v7 & 0xFFFFFFF0;
            v70 = 0uLL;
            v71 = (const char *)a2;
            v72 = 0uLL;
            v73 = 0uLL;
            v74 = 0uLL;
            v75 = 0uLL;
            v76 = 0uLL;
            v77 = 0uLL;
            do
            {
              v131 = vld2q_s8(v71);
              v71 += 32;
              v78 = vmovl_u8(*(uint8x8_t *)v131.val[0].i8);
              v79 = vmovl_u16(*(uint16x4_t *)v78.i8);
              v80.i64[0] = v79.u32[0];
              v80.i64[1] = v79.u32[1];
              v81 = v80;
              v80.i64[0] = v79.u32[2];
              v80.i64[1] = v79.u32[3];
              v82 = v80;
              v83 = vmovl_high_u16(v78);
              v80.i64[0] = v83.u32[0];
              v80.i64[1] = v83.u32[1];
              v84 = v80;
              v85 = vmovl_high_u8((uint8x16_t)v131.val[0]);
              v86 = vmovl_u16(*(uint16x4_t *)v85.i8);
              v80.i64[0] = v86.u32[0];
              v80.i64[1] = v86.u32[1];
              v87 = v80;
              v80.i64[0] = v83.u32[2];
              v80.i64[1] = v83.u32[3];
              v88 = v80;
              v80.i64[0] = v86.u32[2];
              v80.i64[1] = v86.u32[3];
              v89 = v80;
              v90 = vmovl_high_u16(v85);
              v80.i64[0] = v90.u32[0];
              v80.i64[1] = v90.u32[1];
              v91 = v80;
              v80.i64[0] = v90.u32[2];
              v80.i64[1] = v90.u32[3];
              v92 = v80;
              v93 = vmovl_u8(*(uint8x8_t *)v131.val[1].i8);
              v94 = vmovl_u16(*(uint16x4_t *)v93.i8);
              v80.i64[0] = v94.u32[0];
              v80.i64[1] = v94.u32[1];
              v95 = v80;
              v80.i64[0] = v94.u32[2];
              v80.i64[1] = v94.u32[3];
              v96 = v80;
              v97 = vmovl_high_u16(v93);
              v80.i64[0] = v97.u32[0];
              v80.i64[1] = v97.u32[1];
              v98 = v80;
              v131.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v131.val[1]);
              v131.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v131.val[0].i8);
              v80.i64[0] = v131.val[1].u32[0];
              v80.i64[1] = v131.val[1].u32[1];
              v99 = v80;
              v80.i64[0] = v97.u32[2];
              v80.i64[1] = v97.u32[3];
              v100 = v80;
              v80.i64[0] = v131.val[1].u32[2];
              v80.i64[1] = v131.val[1].u32[3];
              v131.val[1] = (int8x16_t)v80;
              v131.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v131.val[0]);
              v80.i64[0] = v131.val[0].u32[0];
              v80.i64[1] = v131.val[0].u32[1];
              v101 = v80;
              v80.i64[0] = v131.val[0].u32[2];
              v80.i64[1] = v131.val[0].u32[3];
              v77 = vsraq_n_s64(v77, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v80, 0x38uLL), (int8x16_t)vshlq_n_s64(v92, 0x30uLL)), 0x30uLL);
              v76 = vsraq_n_s64(v76, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v101, 0x38uLL), (int8x16_t)vshlq_n_s64(v91, 0x30uLL)), 0x30uLL);
              v75 = vsraq_n_s64(v75, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v131.val[1], 0x38uLL), (int8x16_t)vshlq_n_s64(v89, 0x30uLL)), 0x30uLL);
              v73 = vsraq_n_s64(v73, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v100, 0x38uLL), (int8x16_t)vshlq_n_s64(v88, 0x30uLL)), 0x30uLL);
              v74 = vsraq_n_s64(v74, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v99, 0x38uLL), (int8x16_t)vshlq_n_s64(v87, 0x30uLL)), 0x30uLL);
              v72 = vsraq_n_s64(v72, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v98, 0x38uLL), (int8x16_t)vshlq_n_s64(v84, 0x30uLL)), 0x30uLL);
              v70 = vsraq_n_s64(v70, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v96, 0x38uLL), (int8x16_t)vshlq_n_s64(v82, 0x30uLL)), 0x30uLL);
              v68 = vsraq_n_s64(v68, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v95, 0x38uLL), (int8x16_t)vshlq_n_s64(v81, 0x30uLL)), 0x30uLL);
              v69 -= 16;
            }
            while (v69);
            v102 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v68, v74), vaddq_s64(v72, v76)), vaddq_s64(vaddq_s64(v70, v75), vaddq_s64(v73, v77))));
            v103 = v102;
            v104 = 2 * v33;
            v105 = v7 & 0xFFFFFFF0;
            if ((v7 & 8) == 0)
              goto LABEL_38;
            v106 = 0uLL;
            v107 = (int64x2_t)(unint64_t)v102;
            v108 = v8 - v33;
            v109 = (2 * v4) & 0x1FFFFFFE0;
            v110 = 0uLL;
            v111 = 0uLL;
            do
            {
              v112 = (const char *)&a2[v109];
              v129 = (uint16x8_t)vld2_s8(v112);
              v113 = vmovl_u8(*(uint8x8_t *)v129.i8);
              v114 = vmovl_u16(*(uint16x4_t *)v113.i8);
              v115.i64[0] = v114.u32[0];
              v115.i64[1] = v114.u32[1];
              v116 = v115;
              v115.i64[0] = v114.u32[2];
              v115.i64[1] = v114.u32[3];
              v117 = v115;
              v118 = vmovl_high_u16(v113);
              v115.i64[0] = v118.u32[0];
              v115.i64[1] = v118.u32[1];
              v119 = v115;
              v115.i64[0] = v118.u32[2];
              v115.i64[1] = v118.u32[3];
              v120 = v115;
              v129 = vmovl_u8((uint8x8_t)v129.u64[1]);
              *(uint32x4_t *)((char *)&v129 + 8) = vmovl_u16(*(uint16x4_t *)v129.i8);
              v115.i64[0] = v129.u32[2];
              v115.i64[1] = v129.u32[3];
              v121 = v115;
              v115.i64[0] = v122;
              v115.i64[1] = v123;
              *(int64x2_t *)((char *)&v129 + 8) = v115;
              v129 = (uint16x8_t)vmovl_high_u16(v129);
              v115.i64[0] = v129.u32[0];
              v115.i64[1] = v129.u32[1];
              v124 = v115;
              v115.i64[0] = v125;
              v115.i64[1] = v126;
              v111 = vsraq_n_s64(v111, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v115, 0x38uLL), (int8x16_t)vshlq_n_s64(v120, 0x30uLL)), 0x30uLL);
              v110 = vsraq_n_s64(v110, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v124, 0x38uLL), (int8x16_t)vshlq_n_s64(v119, 0x30uLL)), 0x30uLL);
              v106 = vsraq_n_s64(v106, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v129 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v117, 0x30uLL)), 0x30uLL);
              v107 = vsraq_n_s64(v107, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v121, 0x38uLL), (int8x16_t)vshlq_n_s64(v116, 0x30uLL)), 0x30uLL);
              v109 += 16;
              v108 -= 8;
            }
            while (v108);
            v103 = vaddvq_s64(vaddq_s64(vaddq_s64(v107, v110), vaddq_s64(v106, v111)));
            v104 = 2 * (v7 & 0xFFFFFFF8);
            v105 = v7 & 0xFFFFFFF8;
            if (v8 != v7)
            {
LABEL_38:
              v127 = v4 - v105;
              do
              {
                v103 += (uint64_t)(((unint64_t)a2[v104] << 48) | ((unint64_t)a2[v104 + 1] << 56)) >> 48;
                v104 += 2;
                --v127;
              }
              while (v127);
            }
            a2 += v6;
            result = v103 / v4;
            *a4++ = result;
          }
          while (a2 < v5);
        }
      }
      else
      {
        do
        {
          v10 = 0uLL;
          v11 = (const char *)a2;
          v12 = v7 & 0xFFFFFFF8;
          v13 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          do
          {
            v128 = (uint16x8_t)vld2_s8(v11);
            v11 += 16;
            v16 = vmovl_u8(*(uint8x8_t *)v128.i8);
            v17 = vmovl_u16(*(uint16x4_t *)v16.i8);
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            v19 = v18;
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            v20 = v18;
            v21 = vmovl_high_u16(v16);
            v18.i64[0] = v21.u32[0];
            v18.i64[1] = v21.u32[1];
            v22 = v18;
            v18.i64[0] = v21.u32[2];
            v18.i64[1] = v21.u32[3];
            v23 = v18;
            v128 = vmovl_u8((uint8x8_t)v128.u64[1]);
            *(uint32x4_t *)((char *)&v128 + 8) = vmovl_u16(*(uint16x4_t *)v128.i8);
            v18.i64[0] = v128.u32[2];
            v18.i64[1] = v128.u32[3];
            v24 = v18;
            v18.i64[0] = v25;
            v18.i64[1] = v26;
            *(int64x2_t *)((char *)&v128 + 8) = v18;
            v128 = (uint16x8_t)vmovl_high_u16(v128);
            v18.i64[0] = v128.u32[0];
            v18.i64[1] = v128.u32[1];
            v27 = v18;
            v18.i64[0] = v28;
            v18.i64[1] = v29;
            v15 = vsraq_n_s64(v15, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v18, 0x38uLL), (int8x16_t)vshlq_n_s64(v23, 0x30uLL)), 0x30uLL);
            v14 = vsraq_n_s64(v14, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v27, 0x38uLL), (int8x16_t)vshlq_n_s64(v22, 0x30uLL)), 0x30uLL);
            v13 = vsraq_n_s64(v13, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v128 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v20, 0x30uLL)), 0x30uLL);
            v10 = vsraq_n_s64(v10, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v24, 0x38uLL), (int8x16_t)vshlq_n_s64(v19, 0x30uLL)), 0x30uLL);
            v12 -= 8;
          }
          while (v12);
          v30 = vaddvq_s64(vaddq_s64(vaddq_s64(v10, v14), vaddq_s64(v13, v15)));
          v31 = v4 - v8;
          v32 = 2 * (v7 & 0xFFFFFFF8);
          if (v8 != v7)
          {
            do
            {
              result = ((unint64_t)a2[v32] << 48) | ((unint64_t)a2[v32 + 1] << 56);
              v30 += result >> 48;
              v32 += 2;
              --v31;
            }
            while (v31);
          }
          a2 += v6;
          *a4++ = v30 / v4;
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint32x4_t *v9;
  int64x2_t v10;
  uint32x4_t *v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint32x4_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint32x4_t *v20;
  int64x2_t v21;
  uint64_t v22;
  uint32x4_t *v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  uint32x4_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v19 = *a2;
        if (result >= 2)
        {
          v19 += a2[1];
          if ((_DWORD)v4 != 2)
          {
            v19 += a2[2];
            if ((_DWORD)v4 != 3)
            {
              v19 += a2[3];
              if ((_DWORD)v4 != 4)
              {
                v19 += a2[4];
                if ((_DWORD)v4 != 5)
                {
                  v19 += a2[5];
                  if ((_DWORD)v4 != 6)
                    v19 += a2[6];
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        v18 = v19 / v4;
        *(_WORD *)a4 = v18;
        *(_BYTE *)(a4 + 2) = BYTE2(v18);
        *(_BYTE *)(a4 + 3) = BYTE3(v18);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = (uint32x4_t *)(a2 + 4);
        do
        {
          v10 = 0uLL;
          v11 = v9;
          v12 = v8;
          v13 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          do
          {
            v16 = v11[-1];
            v13 = (int64x2_t)vaddw_high_u32((uint64x2_t)v13, v16);
            v10 = (int64x2_t)vaddw_u32((uint64x2_t)v10, *(uint32x2_t *)v16.i8);
            v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, *v11);
            v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)v11->i8);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
          a2 = (unsigned int *)((char *)a2 + v6);
          *(_WORD *)a4 = v17 / v4;
          *(_BYTE *)(a4 + 2) = (v17 / v4) >> 16;
          *(_BYTE *)(a4 + 3) = (v17 / v4) >> 24;
          a4 += 4;
          v9 = (uint32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v20 = (uint32x4_t *)(a2 + 4);
        do
        {
          v21 = 0uLL;
          v22 = v8;
          v23 = v20;
          v24 = 0uLL;
          v25 = 0uLL;
          v26 = 0uLL;
          do
          {
            v27 = v23[-1];
            v24 = (int64x2_t)vaddw_high_u32((uint64x2_t)v24, v27);
            v21 = (int64x2_t)vaddw_u32((uint64x2_t)v21, *(uint32x2_t *)v27.i8);
            v26 = (int64x2_t)vaddw_high_u32((uint64x2_t)v26, *v23);
            v25 = (int64x2_t)vaddw_u32((uint64x2_t)v25, *(uint32x2_t *)v23->i8);
            v23 += 2;
            v22 -= 8;
          }
          while (v22);
          v28 = vaddvq_s64(vaddq_s64(vaddq_s64(v25, v21), vaddq_s64(v26, v24)));
          v29 = v8;
          do
            v28 += a2[v29++];
          while ((_DWORD)v4 != (_DWORD)v29);
          a2 = (unsigned int *)((char *)a2 + v6);
          v30 = v28 / v4;
          *(_WORD *)a4 = v30;
          *(_BYTE *)(a4 + 2) = BYTE2(v30);
          *(_BYTE *)(a4 + 3) = BYTE3(v30);
          a4 += 4;
          v20 = (uint32x4_t *)((char *)v20 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int32x4_t *v9;
  int64x2_t v10;
  int32x4_t *v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int32x4_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int32x4_t *v20;
  int64x2_t v21;
  uint64_t v22;
  int32x4_t *v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int32x4_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (int *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v19 = *a2;
        if (result >= 2)
        {
          v19 += a2[1];
          if ((_DWORD)v4 != 2)
          {
            v19 += a2[2];
            if ((_DWORD)v4 != 3)
            {
              v19 += a2[3];
              if ((_DWORD)v4 != 4)
              {
                v19 += a2[4];
                if ((_DWORD)v4 != 5)
                {
                  v19 += a2[5];
                  if ((_DWORD)v4 != 6)
                    v19 += a2[6];
                }
              }
            }
          }
        }
        a2 = (int *)((char *)a2 + v6);
        v18 = v19 / v4;
        *(_WORD *)a4 = v18;
        *(_BYTE *)(a4 + 2) = BYTE2(v18);
        *(_BYTE *)(a4 + 3) = BYTE3(v18);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = (int32x4_t *)(a2 + 4);
        do
        {
          v10 = 0uLL;
          v11 = v9;
          v12 = v8;
          v13 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          do
          {
            v16 = v11[-1];
            v13 = vaddw_high_s32(v13, v16);
            v10 = vaddw_s32(v10, *(int32x2_t *)v16.i8);
            v15 = vaddw_high_s32(v15, *v11);
            v14 = vaddw_s32(v14, *(int32x2_t *)v11->i8);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
          a2 = (int *)((char *)a2 + v6);
          *(_WORD *)a4 = v17 / v4;
          *(_BYTE *)(a4 + 2) = (v17 / v4) >> 16;
          *(_BYTE *)(a4 + 3) = (v17 / v4) >> 24;
          a4 += 4;
          v9 = (int32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v20 = (int32x4_t *)(a2 + 4);
        do
        {
          v21 = 0uLL;
          v22 = v8;
          v23 = v20;
          v24 = 0uLL;
          v25 = 0uLL;
          v26 = 0uLL;
          do
          {
            v27 = v23[-1];
            v24 = vaddw_high_s32(v24, v27);
            v21 = vaddw_s32(v21, *(int32x2_t *)v27.i8);
            v26 = vaddw_high_s32(v26, *v23);
            v25 = vaddw_s32(v25, *(int32x2_t *)v23->i8);
            v23 += 2;
            v22 -= 8;
          }
          while (v22);
          v28 = vaddvq_s64(vaddq_s64(vaddq_s64(v25, v21), vaddq_s64(v26, v24)));
          v29 = v8;
          do
            v28 += a2[v29++];
          while ((_DWORD)v4 != (_DWORD)v29);
          a2 = (int *)((char *)a2 + v6);
          v30 = v28 / v4;
          *(_WORD *)a4 = v30;
          *(_BYTE *)(a4 + 2) = BYTE2(v30);
          *(_BYTE *)(a4 + 3) = BYTE3(v30);
          a4 += 4;
          v20 = (int32x4_t *)((char *)v20 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(unint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  int64x2_t v4;
  int64x2_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  const char *v25;
  uint32x4_t v26;
  uint32x4_t v27;
  uint32x4_t v28;
  uint64_t v29;
  int64x2_t v30;
  uint64_t v31;
  int64x2_t v32;
  const char *v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  uint32x4_t v48;
  uint32x4_t v49;
  uint32x4_t v50;
  uint32x4_t v51;
  uint32x4_t v52;
  uint32x4_t v53;
  uint32x4_t v54;
  uint64_t v55;
  int v56;
  int8x16x2_t v57;

  if (result <= 1)
    v6 = 1;
  else
    v6 = result;
  if (a3)
  {
    v7 = &a2[a3];
    v8 = 2 * (v6 - 1) + 2;
    if (result <= 1)
      v9 = 1;
    else
      v9 = result;
    if (v9 >= 8)
    {
      while (v9 >= 0x10)
      {
        v30 = 0uLL;
        v31 = v9 & 0xFFFFFFF0;
        v32 = 0uLL;
        v33 = (const char *)a2;
        v34 = 0uLL;
        v35 = 0uLL;
        v36 = 0uLL;
        v37 = 0uLL;
        v38 = 0uLL;
        v39 = 0uLL;
        v40 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v43 = 0uLL;
        v44 = 0uLL;
        v45 = 0uLL;
        v46 = 0uLL;
        v47 = 0uLL;
        do
        {
          v57 = vld2q_s8(v33);
          v33 += 32;
          v48 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_23C692020);
          v49 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_23C692010);
          v50 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_23C692000);
          v51 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_23C692030);
          v52 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_23C692020);
          v53 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_23C692010);
          v54 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_23C692000);
          v57.val[0] = vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_23C692030);
          v35 = (int64x2_t)vaddw_high_u32((uint64x2_t)v35, v49);
          v32 = (int64x2_t)vaddw_high_u32((uint64x2_t)v32, v50);
          v36 = (int64x2_t)vaddw_u32((uint64x2_t)v36, *(uint32x2_t *)v48.i8);
          v34 = (int64x2_t)vaddw_u32((uint64x2_t)v34, *(uint32x2_t *)v49.i8);
          v30 = (int64x2_t)vaddw_u32((uint64x2_t)v30, *(uint32x2_t *)v50.i8);
          v37 = (int64x2_t)vaddw_high_u32((uint64x2_t)v37, v48);
          v38 = (int64x2_t)vaddw_u32((uint64x2_t)v38, *(uint32x2_t *)v51.i8);
          v39 = (int64x2_t)vaddw_high_u32((uint64x2_t)v39, v51);
          v43 = (int64x2_t)vaddw_high_u32((uint64x2_t)v43, v53);
          v41 = (int64x2_t)vaddw_high_u32((uint64x2_t)v41, v54);
          v44 = (int64x2_t)vaddw_u32((uint64x2_t)v44, *(uint32x2_t *)v52.i8);
          v42 = (int64x2_t)vaddw_u32((uint64x2_t)v42, *(uint32x2_t *)v53.i8);
          v40 = (int64x2_t)vaddw_u32((uint64x2_t)v40, *(uint32x2_t *)v54.i8);
          v45 = (int64x2_t)vaddw_high_u32((uint64x2_t)v45, v52);
          v46 = (int64x2_t)vaddw_u32((uint64x2_t)v46, *(uint32x2_t *)v57.val[0].i8);
          v47 = (int64x2_t)vaddw_high_u32((uint64x2_t)v47, (uint32x4_t)v57.val[0]);
          v31 -= 16;
        }
        while (v31);
        v5 = vaddq_s64(v43, v47);
        v4 = vaddq_s64(vaddq_s64(vaddq_s64(v40, v44), vaddq_s64(v42, v46)), vaddq_s64(vaddq_s64(v41, v45), v5));
        v13 = vaddvq_s64(v4);
        v12 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v30, v36), vaddq_s64(v34, v38)), vaddq_s64(vaddq_s64(v32, v37), vaddq_s64(v35, v39))));
        if ((v9 & 0xFFFFFFF0) == v9)
          goto LABEL_18;
        v14 = v9 & 0xFFFFFFF0;
        v29 = v14;
        if ((v9 & 8) != 0)
          goto LABEL_21;
LABEL_29:
        v55 = 2 * v29;
        v56 = v6 - v29;
        do
        {
          v12 += a2[v55];
          v13 += a2[v55 + 1];
          v55 += 2;
          --v56;
        }
        while (v56);
LABEL_18:
        a2 += v8;
        result = v12 / v6;
        *a4 = result;
        a4[1] = v13 / v6;
        a4 += 2;
        if (a2 >= v7)
          return result;
      }
      v12 = 0;
      v13 = 0;
      v14 = 0;
LABEL_21:
      v15 = 0uLL;
      v16 = (int64x2_t)v12;
      v17 = (int64x2_t)v13;
      v18 = 2 * v14;
      v19 = v14 - (v6 & 0xFFFFFFF8);
      v20 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
      v23 = 0uLL;
      v24 = 0uLL;
      do
      {
        v25 = (const char *)&a2[v18];
        v4 = (int64x2_t)vld2_s8(v25);
        v26 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_23C692010);
        v27 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_23C692000);
        v28 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_23C692010);
        v4 = (int64x2_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_23C692000);
        v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v26);
        v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v27);
        v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v26.i8);
        v16 = (int64x2_t)vaddw_u32((uint64x2_t)v16, *(uint32x2_t *)v27.i8);
        v24 = (int64x2_t)vaddw_high_u32((uint64x2_t)v24, v28);
        v22 = (int64x2_t)vaddw_high_u32((uint64x2_t)v22, (uint32x4_t)v4);
        v23 = (int64x2_t)vaddw_u32((uint64x2_t)v23, *(uint32x2_t *)v28.i8);
        v17 = (int64x2_t)vaddw_u32((uint64x2_t)v17, *(uint32x2_t *)v4.i8);
        v18 += 16;
        v19 += 8;
      }
      while (v19);
      v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v23), vaddq_s64(v22, v24)));
      v12 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v20), vaddq_s64(v15, v21)));
      v29 = v9 & 0xFFFFFFF8;
      if (v29 == v9)
        goto LABEL_18;
      goto LABEL_29;
    }
    do
    {
      v10 = *a2;
      v11 = a2[1];
      if (result >= 2)
      {
        v10 += a2[2];
        v11 += a2[3];
        if ((_DWORD)v6 != 2)
        {
          v10 += a2[4];
          v11 += a2[5];
          if ((_DWORD)v6 != 3)
          {
            v10 += a2[6];
            v11 += a2[7];
            if ((_DWORD)v6 != 4)
            {
              v10 += a2[8];
              v11 += a2[9];
              if ((_DWORD)v6 != 5)
              {
                v10 += a2[10];
                v11 += a2[11];
                if ((_DWORD)v6 != 6)
                {
                  v10 += a2[12];
                  v11 += a2[13];
                }
              }
            }
          }
        }
      }
      a2 += v8;
      *a4 = v10 / v6;
      a4[1] = v11 / v6;
      a4 += 2;
    }
    while (a2 < v7);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, char *a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  uint64_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  const char *v23;
  int16x8_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int64x2_t v27;
  uint64_t v28;
  int64x2_t v29;
  const char *v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int16x8_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  uint64_t v54;
  int16x8_t v55;
  int8x16x2_t v56;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 >= 8)
    {
      while (v7 >= 0x10)
      {
        v27 = 0uLL;
        v28 = v7 & 0xFFFFFFF0;
        v29 = 0uLL;
        v30 = a2;
        v31 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        v34 = 0uLL;
        v35 = 0uLL;
        v36 = 0uLL;
        v37 = 0uLL;
        v38 = 0uLL;
        v39 = 0uLL;
        v40 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v43 = 0uLL;
        v44 = 0uLL;
        do
        {
          v56 = vld2q_s8(v30);
          v30 += 32;
          v45 = vmovl_s8(*(int8x8_t *)v56.val[0].i8);
          v46 = vmovl_s16(*(int16x4_t *)v45.i8);
          v47 = vmovl_high_s16(v45);
          v48 = vmovl_high_s8(v56.val[0]);
          v49 = vmovl_s16(*(int16x4_t *)v48.i8);
          v50 = vmovl_high_s16(v48);
          v51 = vmovl_s8(*(int8x8_t *)v56.val[1].i8);
          v52 = vmovl_s16(*(int16x4_t *)v51.i8);
          v53 = vmovl_high_s16(v51);
          v56.val[0] = (int8x16_t)vmovl_high_s8(v56.val[1]);
          v56.val[1] = (int8x16_t)vmovl_s16(*(int16x4_t *)v56.val[0].i8);
          v56.val[0] = (int8x16_t)vmovl_high_s16((int16x8_t)v56.val[0]);
          v34 = vaddw_high_s32(v34, v49);
          v32 = vaddw_high_s32(v32, v47);
          v35 = vaddw_s32(v35, *(int32x2_t *)v50.i8);
          v33 = vaddw_s32(v33, *(int32x2_t *)v49.i8);
          v31 = vaddw_s32(v31, *(int32x2_t *)v47.i8);
          v29 = vaddw_high_s32(v29, v46);
          v36 = vaddw_high_s32(v36, v50);
          v27 = vaddw_s32(v27, *(int32x2_t *)v46.i8);
          v42 = vaddw_high_s32(v42, (int32x4_t)v56.val[1]);
          v40 = vaddw_high_s32(v40, v53);
          v43 = vaddw_s32(v43, *(int32x2_t *)v56.val[0].i8);
          v41 = vaddw_s32(v41, *(int32x2_t *)v56.val[1].i8);
          v39 = vaddw_s32(v39, *(int32x2_t *)v53.i8);
          v38 = vaddw_high_s32(v38, v52);
          v44 = vaddw_high_s32(v44, (int32x4_t)v56.val[0]);
          v37 = vaddw_s32(v37, *(int32x2_t *)v52.i8);
          v28 -= 16;
        }
        while (v28);
        v11 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v37, v41), vaddq_s64(v39, v43)), vaddq_s64(vaddq_s64(v38, v42), vaddq_s64(v40, v44))));
        v10 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v27, v33), vaddq_s64(v31, v35)), vaddq_s64(vaddq_s64(v29, v34), vaddq_s64(v32, v36))));
        if ((v7 & 0xFFFFFFF0) == v7)
          goto LABEL_18;
        v12 = v7 & 0xFFFFFFF0;
        result = v12;
        if ((v7 & 8) != 0)
          goto LABEL_21;
LABEL_29:
        v54 = 2 * result;
        LODWORD(result) = v4 - result;
        do
        {
          v10 += a2[v54];
          v11 += a2[v54 + 1];
          v54 += 2;
          result = (result - 1);
        }
        while ((_DWORD)result);
LABEL_18:
        a2 += v6;
        *a4 = v10 / v4;
        a4[1] = v11 / v4;
        a4 += 2;
        if (a2 >= v5)
          return result;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
LABEL_21:
      v13 = 0uLL;
      v14 = (int64x2_t)(unint64_t)v10;
      v15 = (int64x2_t)(unint64_t)v11;
      v16 = 2 * v12;
      v17 = v12 - (v4 & 0xFFFFFFF8);
      v18 = 0uLL;
      v19 = 0uLL;
      v20 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
      do
      {
        v23 = &a2[v16];
        v55 = (int16x8_t)vld2_s8(v23);
        v24 = vmovl_s8(*(int8x8_t *)v55.i8);
        v25 = vmovl_s16(*(int16x4_t *)v24.i8);
        v26 = vmovl_high_s16(v24);
        v55 = vmovl_s8((int8x8_t)v55.u64[1]);
        *(int32x4_t *)((char *)&v55 + 8) = vmovl_s16(*(int16x4_t *)v55.i8);
        v55 = (int16x8_t)vmovl_high_s16(v55);
        v19 = vaddw_high_s32(v19, v26);
        v18 = vaddw_s32(v18, *(int32x2_t *)v26.i8);
        v13 = vaddw_high_s32(v13, v25);
        v14 = vaddw_s32(v14, *(int32x2_t *)v25.i8);
        v22 = vaddw_high_s32(v22, (int32x4_t)v55);
        v21 = vaddw_s32(v21, *(int32x2_t *)v55.i8);
        v20 = vaddw_high_s32(v20, *(int32x4_t *)((char *)&v55 + 8));
        v15 = vaddw_s32(v15, (int32x2_t)v55.u64[1]);
        v16 += 16;
        v17 += 8;
      }
      while (v17);
      v11 = vaddvq_s64(vaddq_s64(vaddq_s64(v15, v21), vaddq_s64(v20, v22)));
      v10 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v18), vaddq_s64(v13, v19)));
      result = v7 & 0xFFFFFFF8;
      if (result == v7)
        goto LABEL_18;
      goto LABEL_29;
    }
    do
    {
      v8 = *a2;
      v9 = a2[1];
      if (result >= 2)
      {
        v8 += a2[2];
        v9 += a2[3];
        if ((_DWORD)v4 != 2)
        {
          v8 += a2[4];
          v9 += a2[5];
          if ((_DWORD)v4 != 3)
          {
            v8 += a2[6];
            v9 += a2[7];
            if ((_DWORD)v4 != 4)
            {
              v8 += a2[8];
              v9 += a2[9];
              if ((_DWORD)v4 != 5)
              {
                v8 += a2[10];
                v9 += a2[11];
                if ((_DWORD)v4 != 6)
                {
                  v8 += a2[12];
                  v9 += a2[13];
                }
              }
            }
          }
        }
      }
      a2 += v6;
      *a4 = v8 / v4;
      a4[1] = v9 / v4;
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,47ull,32ull,63ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int8x16_t v10;
  int64x2_t v11;
  unsigned int *v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  __int128 v21;
  int8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int *v34;
  int8x16_t v35;
  int64x2_t v36;
  uint64_t v37;
  int64x2_t v38;
  unsigned int *v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int64x2_t v45;
  __int128 v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  int8x16_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v26 = (unsigned __int16)*a2;
        v27 = (unint64_t)*a2 >> 16;
        if (result >= 2)
        {
          v28 = a2[1];
          v26 += (unsigned __int16)v28;
          v27 += v28 >> 16;
          if ((_DWORD)v4 != 2)
          {
            v29 = a2[2];
            v26 += (unsigned __int16)v29;
            v27 += v29 >> 16;
            if ((_DWORD)v4 != 3)
            {
              v30 = a2[3];
              v26 += (unsigned __int16)v30;
              v27 += v30 >> 16;
              if ((_DWORD)v4 != 4)
              {
                v31 = a2[4];
                v26 += (unsigned __int16)v31;
                v27 += v31 >> 16;
                if ((_DWORD)v4 != 5)
                {
                  v32 = a2[5];
                  v26 += (unsigned __int16)v32;
                  v27 += v32 >> 16;
                  if ((_DWORD)v4 != 6)
                  {
                    v33 = a2[6];
                    v26 += (unsigned __int16)v33;
                    v27 += v33 >> 16;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v26 / v4;
        a4[1] = v27 / v4;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = a2 + 4;
        v10.i64[0] = 0xFFFFLL;
        v10.i64[1] = 0xFFFFLL;
        do
        {
          v11 = 0uLL;
          v12 = v9;
          v13 = 0uLL;
          v14 = v8;
          v15 = 0uLL;
          v16 = 0uLL;
          v17 = 0uLL;
          v18 = 0uLL;
          v19 = 0uLL;
          v20 = 0uLL;
          do
          {
            v21 = *((_OWORD *)v12 - 1);
            v22.i64[0] = DWORD2(v21);
            v22.i64[1] = HIDWORD(v21);
            v23 = v22;
            v22.i64[0] = v21;
            v22.i64[1] = DWORD1(v21);
            v24 = v22;
            v22.i64[0] = *((_QWORD *)v12 + 1);
            v22.i64[1] = HIDWORD(*(_OWORD *)v12);
            v25 = v22;
            v22.i64[0] = *(_OWORD *)v12;
            v22.i64[1] = HIDWORD(*(_QWORD *)v12);
            v13 = vaddq_s64((int64x2_t)vandq_s8(v23, v10), v13);
            v11 = vaddq_s64((int64x2_t)vandq_s8(v24, v10), v11);
            v16 = vaddq_s64((int64x2_t)vandq_s8(v25, v10), v16);
            v15 = vaddq_s64((int64x2_t)vandq_s8(v22, v10), v15);
            v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v23, 0x10uLL);
            v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v24, 0x10uLL);
            v20 = (int64x2_t)vsraq_n_u64((uint64x2_t)v20, (uint64x2_t)v25, 0x10uLL);
            v19 = (int64x2_t)vsraq_n_u64((uint64x2_t)v19, (uint64x2_t)v22, 0x10uLL);
            v12 += 8;
            v14 -= 8;
          }
          while (v14);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v15, v11), vaddq_s64(v16, v13))) / v4;
          a4[1] = vaddvq_s64(vaddq_s64(vaddq_s64(v19, v17), vaddq_s64(v20, v18))) / v4;
          a4 += 2;
          v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v34 = a2 + 4;
        v35.i64[0] = 0xFFFFLL;
        v35.i64[1] = 0xFFFFLL;
        do
        {
          v36 = 0uLL;
          v37 = v8;
          v38 = 0uLL;
          v39 = v34;
          v40 = 0uLL;
          v41 = 0uLL;
          v42 = 0uLL;
          v43 = 0uLL;
          v44 = 0uLL;
          v45 = 0uLL;
          do
          {
            v46 = *((_OWORD *)v39 - 1);
            v47.i64[0] = DWORD2(v46);
            v47.i64[1] = HIDWORD(v46);
            v48 = v47;
            v47.i64[0] = v46;
            v47.i64[1] = DWORD1(v46);
            v49 = v47;
            v47.i64[0] = *((_QWORD *)v39 + 1);
            v47.i64[1] = HIDWORD(*(_OWORD *)v39);
            v50 = v47;
            v47.i64[0] = *(_OWORD *)v39;
            v47.i64[1] = HIDWORD(*(_QWORD *)v39);
            v38 = vaddq_s64((int64x2_t)vandq_s8(v48, v35), v38);
            v36 = vaddq_s64((int64x2_t)vandq_s8(v49, v35), v36);
            v41 = vaddq_s64((int64x2_t)vandq_s8(v50, v35), v41);
            v40 = vaddq_s64((int64x2_t)vandq_s8(v47, v35), v40);
            v43 = (int64x2_t)vsraq_n_u64((uint64x2_t)v43, (uint64x2_t)v48, 0x10uLL);
            v42 = (int64x2_t)vsraq_n_u64((uint64x2_t)v42, (uint64x2_t)v49, 0x10uLL);
            v45 = (int64x2_t)vsraq_n_u64((uint64x2_t)v45, (uint64x2_t)v50, 0x10uLL);
            v44 = (int64x2_t)vsraq_n_u64((uint64x2_t)v44, (uint64x2_t)v47, 0x10uLL);
            v39 += 8;
            v37 -= 8;
          }
          while (v37);
          v51 = vaddvq_s64(vaddq_s64(vaddq_s64(v44, v42), vaddq_s64(v45, v43)));
          v52 = vaddvq_s64(vaddq_s64(vaddq_s64(v40, v36), vaddq_s64(v41, v38)));
          v53 = v8;
          do
          {
            v54 = a2[v53];
            v52 += (unsigned __int16)v54;
            v51 += v54 >> 16;
            ++v53;
          }
          while ((_DWORD)v4 != (_DWORD)v53);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = v52 / v4;
          a4[1] = v51 / v4;
          a4 += 2;
          v34 = (unsigned int *)((char *)v34 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,47ull,32ull,65ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int64x2_t v10;
  unsigned int *v11;
  int64x2_t v12;
  uint64_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  __int128 v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int *v34;
  int64x2_t v35;
  uint64_t v36;
  int64x2_t v37;
  unsigned int *v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  __int128 v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v25 = *a2;
        v26 = (__int16)v25;
        v27 = v25 >> 16;
        if (result >= 2)
        {
          v28 = a2[1];
          v26 += (__int16)v28;
          v27 += v28 >> 16;
          if ((_DWORD)v4 != 2)
          {
            v29 = a2[2];
            v26 += (__int16)v29;
            v27 += v29 >> 16;
            if ((_DWORD)v4 != 3)
            {
              v30 = a2[3];
              v26 += (__int16)v30;
              v27 += v30 >> 16;
              if ((_DWORD)v4 != 4)
              {
                v31 = a2[4];
                v26 += (__int16)v31;
                v27 += v31 >> 16;
                if ((_DWORD)v4 != 5)
                {
                  v32 = a2[5];
                  v26 += (__int16)v32;
                  v27 += v32 >> 16;
                  if ((_DWORD)v4 != 6)
                  {
                    v33 = a2[6];
                    v26 += (__int16)v33;
                    v27 += v33 >> 16;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v26 / v4;
        a4[1] = v27 / v4;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = a2 + 4;
        do
        {
          v10 = 0uLL;
          v11 = v9;
          v12 = 0uLL;
          v13 = v8;
          v14 = 0uLL;
          v15 = 0uLL;
          v16 = 0uLL;
          v17 = 0uLL;
          v18 = 0uLL;
          v19 = 0uLL;
          do
          {
            v20 = *((_OWORD *)v11 - 1);
            v21.i64[0] = DWORD2(v20);
            v21.i64[1] = HIDWORD(v20);
            v22 = v21;
            v21.i64[0] = v20;
            v21.i64[1] = DWORD1(v20);
            v23 = v21;
            v21.i64[0] = *((_QWORD *)v11 + 1);
            v21.i64[1] = HIDWORD(*(_OWORD *)v11);
            v24 = v21;
            v21.i64[0] = *(_OWORD *)v11;
            v21.i64[1] = HIDWORD(*(_QWORD *)v11);
            v12 = vsraq_n_s64(v12, vshlq_n_s64(v22, 0x30uLL), 0x30uLL);
            v10 = vsraq_n_s64(v10, vshlq_n_s64(v23, 0x30uLL), 0x30uLL);
            v15 = vsraq_n_s64(v15, vshlq_n_s64(v24, 0x30uLL), 0x30uLL);
            v14 = vsraq_n_s64(v14, vshlq_n_s64(v21, 0x30uLL), 0x30uLL);
            v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v22, 0x10uLL);
            v16 = (int64x2_t)vsraq_n_u64((uint64x2_t)v16, (uint64x2_t)v23, 0x10uLL);
            v19 = (int64x2_t)vsraq_n_u64((uint64x2_t)v19, (uint64x2_t)v24, 0x10uLL);
            v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v21, 0x10uLL);
            v11 += 8;
            v13 -= 8;
          }
          while (v13);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v12))) / v4;
          a4[1] = vaddvq_s64(vaddq_s64(vaddq_s64(v18, v16), vaddq_s64(v19, v17))) / (unint64_t)v4;
          a4 += 2;
          v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v34 = a2 + 4;
        do
        {
          v35 = 0uLL;
          v36 = v8;
          v37 = 0uLL;
          v38 = v34;
          v39 = 0uLL;
          v40 = 0uLL;
          v41 = 0uLL;
          v42 = 0uLL;
          v43 = 0uLL;
          v44 = 0uLL;
          do
          {
            v45 = *((_OWORD *)v38 - 1);
            v46.i64[0] = DWORD2(v45);
            v46.i64[1] = HIDWORD(v45);
            v47 = v46;
            v46.i64[0] = v45;
            v46.i64[1] = DWORD1(v45);
            v48 = v46;
            v46.i64[0] = *((_QWORD *)v38 + 1);
            v46.i64[1] = HIDWORD(*(_OWORD *)v38);
            v49 = v46;
            v46.i64[0] = *(_OWORD *)v38;
            v46.i64[1] = HIDWORD(*(_QWORD *)v38);
            v37 = vsraq_n_s64(v37, vshlq_n_s64(v47, 0x30uLL), 0x30uLL);
            v35 = vsraq_n_s64(v35, vshlq_n_s64(v48, 0x30uLL), 0x30uLL);
            v40 = vsraq_n_s64(v40, vshlq_n_s64(v49, 0x30uLL), 0x30uLL);
            v39 = vsraq_n_s64(v39, vshlq_n_s64(v46, 0x30uLL), 0x30uLL);
            v42 = (int64x2_t)vsraq_n_u64((uint64x2_t)v42, (uint64x2_t)v47, 0x10uLL);
            v41 = (int64x2_t)vsraq_n_u64((uint64x2_t)v41, (uint64x2_t)v48, 0x10uLL);
            v44 = (int64x2_t)vsraq_n_u64((uint64x2_t)v44, (uint64x2_t)v49, 0x10uLL);
            v43 = (int64x2_t)vsraq_n_u64((uint64x2_t)v43, (uint64x2_t)v46, 0x10uLL);
            v38 += 8;
            v36 -= 8;
          }
          while (v36);
          v50 = vaddvq_s64(vaddq_s64(vaddq_s64(v43, v41), vaddq_s64(v44, v42)));
          v51 = vaddvq_s64(vaddq_s64(vaddq_s64(v39, v35), vaddq_s64(v40, v37)));
          v52 = v8;
          do
          {
            v53 = a2[v52];
            v51 += (__int16)v53;
            v50 += v53 >> 16;
            ++v52;
          }
          while ((_DWORD)v4 != (_DWORD)v52);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = v51 / v4;
          a4[1] = v50 / v4;
          a4 += 2;
          v34 = (unsigned int *)((char *)v34 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, int8x16_t *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  int8x16_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t *v16;
  int64x2_t v17;
  int64x2_t v18;
  uint64_t v19;
  int8x16_t *v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int8x16_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int v30;
  unint64_t v31;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (int8x16_t *)((char *)a2 + a3);
    v6 = 8 * (v4 - 1) + 8;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = a2 + 1;
    v9.i64[0] = 0xFFFFFFFFLL;
    v9.i64[1] = 0xFFFFFFFFLL;
    v10 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 4)
      {
        v17 = 0uLL;
        v16 = &a2->i64[v7 & 0xFFFFFFFC];
        v18 = 0uLL;
        v19 = v7 & 0xFFFFFFFC;
        v20 = v8;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        do
        {
          v27 = v20[-1];
          v28 = (int64x2_t)vandq_s8(v27, v10);
          v29 = (int64x2_t)vandq_s8(*v20, v10);
          v17 = vaddq_s64((int64x2_t)vandq_s8(v27, v9), v17);
          v18 = vaddq_s64((int64x2_t)vandq_s8(*v20, v9), v18);
          v21 = (int64x2_t)vsraq_n_u64((uint64x2_t)v21, (uint64x2_t)v27, 0x20uLL);
          v22 = (int64x2_t)vsraq_n_u64((uint64x2_t)v22, *(uint64x2_t *)v20, 0x20uLL);
          v23 = vaddq_s64(v28, v23);
          v24 = vaddq_s64(v29, v24);
          v25 = vaddq_s64(v28, v25);
          v26 = vaddq_s64(v29, v26);
          v20 += 2;
          v19 -= 4;
        }
        while (v19);
        v15 = vaddvq_s64(vaddq_s64(v26, v25));
        v13 = vaddvq_s64(vaddq_s64(v24, v23));
        v12 = vaddvq_s64(vaddq_s64(v22, v21));
        v11 = vaddvq_s64(vaddq_s64(v18, v17));
        v14 = v7 & 0xFFFFFFFC;
        if ((v7 & 0xFFFFFFFC) == v7)
          goto LABEL_9;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = (uint64_t *)a2;
      }
      v30 = v7 - v14;
      do
      {
        v31 = *v16++;
        v11 += v31;
        v12 += HIDWORD(v31);
        v13 += v31 & 1;
        v15 += v31 & 1;
        --v30;
      }
      while (v30);
LABEL_9:
      a2 = (int8x16_t *)((char *)a2 + v6);
      result = v13 / v4;
      *(_BYTE *)a4 = ((v15 / v4) | result) & 1 | (v11 / v4);
      *(_BYTE *)(a4 + 1) = (unsigned __int16)(v11 / v4) >> 8;
      *(_BYTE *)(a4 + 2) = (v11 / v4) >> 16;
      *(_BYTE *)(a4 + 3) = (v11 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v12 / v4;
      *(_BYTE *)(a4 + 6) = (v12 / v4) >> 16;
      *(_BYTE *)(a4 + 7) = (v12 / v4) >> 24;
      a4 += 8;
      v8 = (int8x16_t *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, int8x16_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  int8x16_t *v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int v29;
  uint64_t v30;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (int8x16_t *)((char *)a2 + a3);
    v6 = 8 * (v4 - 1) + 8;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = a2 + 1;
    v9 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 4)
      {
        v16 = 0uLL;
        v15 = &a2->i64[v7 & 0xFFFFFFFC];
        v17 = 0uLL;
        v18 = v7 & 0xFFFFFFFC;
        v19 = v8;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        do
        {
          v26 = (int64x2_t)v19[-1];
          v27 = (int64x2_t)vandq_s8((int8x16_t)v26, v9);
          v28 = (int64x2_t)vandq_s8(*v19, v9);
          v16 = vsraq_n_s64(v16, vshlq_n_s64(v26, 0x20uLL), 0x20uLL);
          v17 = vsraq_n_s64(v17, vshlq_n_s64(*(int64x2_t *)v19, 0x20uLL), 0x20uLL);
          v20 = vsraq_n_s64(v20, v26, 0x20uLL);
          v21 = vsraq_n_s64(v21, *(int64x2_t *)v19, 0x20uLL);
          v22 = vsubq_s64(v22, v27);
          v23 = vsubq_s64(v23, v28);
          v24 = vsubq_s64(v24, v27);
          v25 = vsubq_s64(v25, v28);
          v19 += 2;
          v18 -= 4;
        }
        while (v18);
        v13 = vaddvq_s64(vaddq_s64(v25, v24));
        v12 = vaddvq_s64(vaddq_s64(v23, v22));
        v11 = vaddvq_s64(vaddq_s64(v21, v20));
        v10 = vaddvq_s64(vaddq_s64(v17, v16));
        v14 = v7 & 0xFFFFFFFC;
        if ((v7 & 0xFFFFFFFC) == v7)
          goto LABEL_9;
      }
      else
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = (uint64_t *)a2;
      }
      v29 = v7 - v14;
      do
      {
        v30 = *v15++;
        v10 += (int)v30;
        v11 += v30 >> 32;
        v12 -= v30 & 1;
        v13 -= v30 & 1;
        --v29;
      }
      while (v29);
LABEL_9:
      a2 = (int8x16_t *)((char *)a2 + v6);
      result = v12 / v4;
      *(_BYTE *)a4 = ((v13 / v4) | result) & 1 | (v10 / v4);
      *(_BYTE *)(a4 + 1) = (unsigned __int16)(v10 / v4) >> 8;
      *(_BYTE *)(a4 + 2) = (v10 / v4) >> 16;
      *(_BYTE *)(a4 + 3) = (v10 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v11 / v4;
      *(_BYTE *)(a4 + 6) = (v11 / v4) >> 16;
      *(_BYTE *)(a4 + 7) = (v11 / v4) >> 24;
      a4 += 8;
      v8 = (int8x16_t *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,32ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  int64x2_t v4;
  int64x2_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  const char *v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  uint32x4_t v27;
  uint32x4_t v28;
  uint32x4_t v29;
  uint32x4_t v30;
  uint8x8_t v31;
  uint16x8_t v32;
  uint32x4_t v33;
  uint32x4_t v34;
  int64x2_t v35;
  int64x2_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;

  if (result <= 1)
    v6 = 1;
  else
    v6 = result;
  if (a3)
  {
    v7 = &a2[a3];
    v8 = 3 * (v6 - 1) + 3;
    if (result <= 1)
      v9 = 1;
    else
      v9 = result;
    if (v9 < 8)
    {
      do
      {
        v10 = *a2;
        v11 = a2[1];
        v12 = a2[2];
        if (result >= 2)
        {
          v10 += a2[3];
          v11 += a2[4];
          v12 += a2[5];
          if ((_DWORD)v6 != 2)
          {
            v10 += a2[6];
            v11 += a2[7];
            v12 += a2[8];
            if ((_DWORD)v6 != 3)
            {
              v10 += a2[9];
              v11 += a2[10];
              v12 += a2[11];
              if ((_DWORD)v6 != 4)
              {
                v10 += a2[12];
                v11 += a2[13];
                v12 += a2[14];
                if ((_DWORD)v6 != 5)
                {
                  v10 += a2[15];
                  v11 += a2[16];
                  v12 += a2[17];
                  if ((_DWORD)v6 != 6)
                  {
                    v10 += a2[18];
                    v11 += a2[19];
                    v12 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v8;
        *a4 = v10 / v6;
        a4[1] = v11 / v6;
        a4[2] = (unsigned __int16)((v12 << 8) / v6) >> 8;
        a4 += 3;
      }
      while (a2 < v7);
    }
    else
    {
      do
      {
        v13 = 0uLL;
        v14 = v9 & 0xFFFFFFF8;
        v15 = 0uLL;
        v16 = (const char *)a2;
        v17 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        do
        {
          *(int8x8x3_t *)v4.i8 = vld3_s8(v16);
          v16 += 24;
          v27 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_23C692010);
          v28 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_23C692000);
          v29 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_23C692010);
          v30 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_23C692000);
          v32 = vmovl_u8(v31);
          v33 = vmovl_high_u16(v32);
          v34 = vmovl_u16(*(uint16x4_t *)v32.i8);
          v35 = (int64x2_t)vshll_n_u32(*(uint32x2_t *)v34.i8, 8uLL);
          v4 = (int64x2_t)vshll_high_n_u32(v34, 8uLL);
          v36 = (int64x2_t)vshll_n_u32(*(uint32x2_t *)v33.i8, 8uLL);
          v5 = (int64x2_t)vshll_high_n_u32(v33, 8uLL);
          v18 = (int64x2_t)vaddw_high_u32((uint64x2_t)v18, v27);
          v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v28);
          v17 = (int64x2_t)vaddw_u32((uint64x2_t)v17, *(uint32x2_t *)v27.i8);
          v13 = (int64x2_t)vaddw_u32((uint64x2_t)v13, *(uint32x2_t *)v28.i8);
          v22 = (int64x2_t)vaddw_high_u32((uint64x2_t)v22, v29);
          v20 = (int64x2_t)vaddw_high_u32((uint64x2_t)v20, v30);
          v21 = (int64x2_t)vaddw_u32((uint64x2_t)v21, *(uint32x2_t *)v29.i8);
          v19 = (int64x2_t)vaddw_u32((uint64x2_t)v19, *(uint32x2_t *)v30.i8);
          v26 = vaddq_s64(v5, v26);
          v25 = vaddq_s64(v36, v25);
          v24 = vaddq_s64(v4, v24);
          v23 = vaddq_s64(v35, v23);
          v14 -= 8;
        }
        while (v14);
        v37 = vaddvq_s64(vaddq_s64(vaddq_s64(v23, v25), vaddq_s64(v24, v26)));
        v38 = vaddvq_s64(vaddq_s64(vaddq_s64(v19, v21), vaddq_s64(v20, v22)));
        v39 = vaddvq_s64(vaddq_s64(vaddq_s64(v13, v17), vaddq_s64(v15, v18)));
        result = v6 - (v9 & 0xFFFFFFF8);
        v40 = 3 * (v9 & 0xFFFFFFF8);
        if ((v9 & 0xFFFFFFF8) != v9)
        {
          do
          {
            v39 += a2[v40];
            v38 += a2[v40 + 1];
            v37 += (unint64_t)a2[v40 + 2] << 8;
            v40 += 3;
            result = (result - 1);
          }
          while ((_DWORD)result);
        }
        a2 += v8;
        *a4 = v39 / v6;
        a4[1] = v38 / v6;
        a4[2] = (unsigned __int16)(v37 / v6) >> 8;
        a4 += 3;
      }
      while (a2 < v7);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,53ull,52ull,48ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int64x2_t v30;
  uint64_t v31;
  int64x2_t v32;
  const char *v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  uint16x8_t v44;
  uint32x4_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  uint32x4_t v49;
  int64x2_t v50;
  int64x2_t v51;
  int64x2_t v52;
  unsigned int v53;
  unsigned int v54;
  int64x2_t v55;
  unsigned int v56;
  unsigned int v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint16x8_t v65;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 8)
    {
      do
      {
        v11 = *a2;
        v12 = a2[1];
        v13 = (v11 << 48) | (v12 << 56);
        v14 = v12 >> 3;
        v15 = (v13 >> 53) & 0x3F;
        v16 = v11 & 0x1F;
        if (result >= 2)
        {
          v17 = a2[2];
          v18 = a2[3];
          v14 += v18 >> 3;
          v15 += (((v17 << 48) | (v18 << 56)) >> 53) & 0x3F;
          v16 += v17 & 0x1F;
          if ((_DWORD)v4 != 2)
          {
            v19 = a2[4];
            v20 = a2[5];
            v14 += v20 >> 3;
            v15 += (((v19 << 48) | (v20 << 56)) >> 53) & 0x3F;
            v16 += v19 & 0x1F;
            if ((_DWORD)v4 != 3)
            {
              v21 = a2[6];
              v22 = a2[7];
              v14 += v22 >> 3;
              v15 += (((v21 << 48) | (v22 << 56)) >> 53) & 0x3F;
              v16 += v21 & 0x1F;
              if ((_DWORD)v4 != 4)
              {
                v23 = a2[8];
                v24 = a2[9];
                v14 += v24 >> 3;
                v15 += (((v23 << 48) | (v24 << 56)) >> 53) & 0x3F;
                v16 += v23 & 0x1F;
                if ((_DWORD)v4 != 5)
                {
                  v25 = a2[10];
                  v26 = a2[11];
                  v14 += v26 >> 3;
                  v15 += (((v25 << 48) | (v26 << 56)) >> 53) & 0x3F;
                  v16 += v25 & 0x1F;
                  if ((_DWORD)v4 != 6)
                  {
                    v27 = a2[12];
                    v28 = a2[13];
                    v14 += v28 >> 3;
                    v15 += (((v27 << 48) | (v28 << 56)) >> 53) & 0x3F;
                    v16 += v27 & 0x1F;
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        v10 = (v15 / v4) << 53;
        *a4 = (v10 & 0xFFE0FFFFFFFFFFFFLL | (((v16 / v4) & 0x1F) << 48)) >> 48;
        a4[1] = (v10 & 0x700000000000000 | ((v14 / v4) << 59)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = (int8x16_t)vdupq_n_s64(0x3FuLL);
      v9 = (int8x16_t)vdupq_n_s64(0x1FuLL);
      do
      {
        v30 = 0uLL;
        v31 = v7 & 0xFFFFFFF8;
        v32 = 0uLL;
        v33 = (const char *)a2;
        v34 = 0uLL;
        v35 = 0uLL;
        v36 = 0uLL;
        v37 = 0uLL;
        v38 = 0uLL;
        v39 = 0uLL;
        v40 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v43 = 0uLL;
        do
        {
          v65 = (uint16x8_t)vld2_s8(v33);
          v33 += 16;
          v44 = vmovl_u8(*(uint8x8_t *)v65.i8);
          v45 = vmovl_u16(*(uint16x4_t *)v44.i8);
          v46.i64[0] = v45.u32[0];
          v46.i64[1] = v45.u32[1];
          v47 = v46;
          v46.i64[0] = v45.u32[2];
          v46.i64[1] = v45.u32[3];
          v48 = v46;
          v49 = vmovl_high_u16(v44);
          v46.i64[0] = v49.u32[0];
          v46.i64[1] = v49.u32[1];
          v50 = v46;
          v46.i64[0] = v49.u32[2];
          v46.i64[1] = v49.u32[3];
          v51 = v46;
          v65 = vmovl_u8((uint8x8_t)v65.u64[1]);
          *(uint32x4_t *)((char *)&v65 + 8) = vmovl_u16(*(uint16x4_t *)v65.i8);
          v46.i64[0] = v65.u32[2];
          v46.i64[1] = v65.u32[3];
          v52 = v46;
          v46.i64[0] = v53;
          v46.i64[1] = v54;
          *(int64x2_t *)((char *)&v65 + 8) = v46;
          v65 = (uint16x8_t)vmovl_high_u16(v65);
          v46.i64[0] = v65.u32[0];
          v46.i64[1] = v65.u32[1];
          v55 = v46;
          v46.i64[0] = v56;
          v46.i64[1] = v57;
          v35 = (int64x2_t)vsraq_n_u64((uint64x2_t)v35, (uint64x2_t)v46, 3uLL);
          v34 = (int64x2_t)vsraq_n_u64((uint64x2_t)v34, (uint64x2_t)v55, 3uLL);
          v32 = (int64x2_t)vsraq_n_u64((uint64x2_t)v32, *(uint64x2_t *)((char *)&v65 + 8), 3uLL);
          v30 = (int64x2_t)vsraq_n_u64((uint64x2_t)v30, (uint64x2_t)v52, 3uLL);
          v39 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v51, 0x30uLL)), 0x35uLL), v8), v39);
          v38 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v55, 0x38uLL), (int8x16_t)vshlq_n_s64(v50, 0x30uLL)), 0x35uLL), v8), v38);
          v37 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v65 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v48, 0x30uLL)), 0x35uLL), v8), v37);
          v36 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v52, 0x38uLL), (int8x16_t)vshlq_n_s64(v47, 0x30uLL)), 0x35uLL), v8), v36);
          v43 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v51, v9), v43);
          v42 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v50, v9), v42);
          v41 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v9), v41);
          v40 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v47, v9), v40);
          v31 -= 8;
        }
        while (v31);
        v58 = vaddvq_s64(vaddq_s64(vaddq_s64(v40, v42), vaddq_s64(v41, v43)));
        v59 = vaddvq_s64(vaddq_s64(vaddq_s64(v36, v38), vaddq_s64(v37, v39)));
        v60 = vaddvq_s64(vaddq_s64(vaddq_s64(v30, v34), vaddq_s64(v32, v35)));
        v61 = v4 - (v7 & 0xFFFFFFF8);
        v62 = 2 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v63 = a2[v62];
            v64 = a2[v62 + 1];
            v60 += v64 >> 3;
            v59 += (((v63 << 48) | (v64 << 56)) >> 53) & 0x3F;
            v58 += v63 & 0x1F;
            v62 += 2;
            --v61;
          }
          while (v61);
        }
        a2 += v6;
        v29 = (v59 / v4) << 53;
        result = v29 & 0x700000000000000;
        *a4 = (v29 & 0xFFE0FFFFFFFFFFFFLL | (((v58 / v4) & 0x1F) << 48)) >> 48;
        a4[1] = (v29 & 0x700000000000000 | ((v60 / v4) << 59)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(unint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  int64x2_t v18;
  const char *v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  uint32x4_t v34;
  uint32x4_t v35;
  uint32x4_t v36;
  uint32x4_t v37;
  uint32x4_t v38;
  uint32x4_t v39;
  uint32x4_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  uint64_t v46;

  if (result <= 1)
    v8 = 1;
  else
    v8 = result;
  if (a3)
  {
    v9 = &a2[a3];
    v10 = 4 * (v8 - 1) + 4;
    if (result <= 1)
      v11 = 1;
    else
      v11 = result;
    if (v11 < 8)
    {
      do
      {
        v12 = *a2;
        v13 = a2[1];
        v14 = a2[2];
        v15 = a2[3];
        if (result >= 2)
        {
          v12 += a2[4];
          v13 += a2[5];
          v14 += a2[6];
          v15 += a2[7];
          if ((_DWORD)v8 != 2)
          {
            v12 += a2[8];
            v13 += a2[9];
            v14 += a2[10];
            v15 += a2[11];
            if ((_DWORD)v8 != 3)
            {
              v12 += a2[12];
              v13 += a2[13];
              v14 += a2[14];
              v15 += a2[15];
              if ((_DWORD)v8 != 4)
              {
                v12 += a2[16];
                v13 += a2[17];
                v14 += a2[18];
                v15 += a2[19];
                if ((_DWORD)v8 != 5)
                {
                  v12 += a2[20];
                  v13 += a2[21];
                  v14 += a2[22];
                  v15 += a2[23];
                  if ((_DWORD)v8 != 6)
                  {
                    v12 += a2[24];
                    v13 += a2[25];
                    v14 += a2[26];
                    v15 += a2[27];
                  }
                }
              }
            }
          }
        }
        a2 += v10;
        *a4 = v12 / v8;
        a4[1] = v13 / v8;
        a4[2] = v14 / v8;
        a4[3] = v15 / v8;
        a4 += 4;
      }
      while (a2 < v9);
    }
    else
    {
      do
      {
        v16 = 0uLL;
        v17 = v11 & 0xFFFFFFF8;
        v18 = 0uLL;
        v19 = (const char *)a2;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        v28 = 0uLL;
        v29 = 0uLL;
        v30 = 0uLL;
        v31 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        do
        {
          *(int8x8x4_t *)v4.i8 = vld4_s8(v19);
          v19 += 32;
          v34 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_23C692010);
          v35 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_23C692000);
          v36 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_23C692010);
          v37 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_23C692000);
          v38 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_23C692010);
          v39 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_23C692000);
          v40 = (uint32x4_t)vqtbl1q_s8(v7, (int8x16_t)xmmword_23C692010);
          v4 = vqtbl1q_s8(v7, (int8x16_t)xmmword_23C692000);
          v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v34);
          v18 = (int64x2_t)vaddw_high_u32((uint64x2_t)v18, v35);
          v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v34.i8);
          v16 = (int64x2_t)vaddw_u32((uint64x2_t)v16, *(uint32x2_t *)v35.i8);
          v25 = (int64x2_t)vaddw_high_u32((uint64x2_t)v25, v36);
          v23 = (int64x2_t)vaddw_high_u32((uint64x2_t)v23, v37);
          v24 = (int64x2_t)vaddw_u32((uint64x2_t)v24, *(uint32x2_t *)v36.i8);
          v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, *(uint32x2_t *)v37.i8);
          v29 = (int64x2_t)vaddw_high_u32((uint64x2_t)v29, v38);
          v27 = (int64x2_t)vaddw_high_u32((uint64x2_t)v27, v39);
          v28 = (int64x2_t)vaddw_u32((uint64x2_t)v28, *(uint32x2_t *)v38.i8);
          v26 = (int64x2_t)vaddw_u32((uint64x2_t)v26, *(uint32x2_t *)v39.i8);
          v33 = (int64x2_t)vaddw_high_u32((uint64x2_t)v33, v40);
          v31 = (int64x2_t)vaddw_high_u32((uint64x2_t)v31, (uint32x4_t)v4);
          v32 = (int64x2_t)vaddw_u32((uint64x2_t)v32, *(uint32x2_t *)v40.i8);
          v30 = (int64x2_t)vaddw_u32((uint64x2_t)v30, *(uint32x2_t *)v4.i8);
          v17 -= 8;
        }
        while (v17);
        v41 = vaddvq_s64(vaddq_s64(vaddq_s64(v30, v32), vaddq_s64(v31, v33)));
        v42 = vaddvq_s64(vaddq_s64(vaddq_s64(v26, v28), vaddq_s64(v27, v29)));
        v43 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v24), vaddq_s64(v23, v25)));
        v44 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v20), vaddq_s64(v18, v21)));
        v45 = v8 - (v11 & 0xFFFFFFF8);
        v46 = 4 * (v11 & 0xFFFFFFF8);
        if ((v11 & 0xFFFFFFF8) != v11)
        {
          do
          {
            v44 += a2[v46];
            v43 += a2[v46 + 1];
            v42 += a2[v46 + 2];
            v41 += a2[v46 + 3];
            v46 += 4;
            --v45;
          }
          while (v45);
        }
        a2 += v10;
        result = v44 / v8;
        *a4 = result;
        a4[1] = v43 / v8;
        a4[2] = v42 / v8;
        a4[3] = v41 / v8;
        a4 += 4;
      }
      while (a2 < v9);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(uint64_t result, char *a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v13;
  int64x2_t v14;
  const char *v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int32x4_t v37;
  int32x4_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int8x8x4_t v45;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 8)
    {
      do
      {
        v8 = *a2;
        v9 = a2[1];
        v10 = a2[2];
        v11 = a2[3];
        if (result >= 2)
        {
          v8 += a2[4];
          v9 += a2[5];
          v10 += a2[6];
          v11 += a2[7];
          if ((_DWORD)v4 != 2)
          {
            v8 += a2[8];
            v9 += a2[9];
            v10 += a2[10];
            v11 += a2[11];
            if ((_DWORD)v4 != 3)
            {
              v8 += a2[12];
              v9 += a2[13];
              v10 += a2[14];
              v11 += a2[15];
              if ((_DWORD)v4 != 4)
              {
                v8 += a2[16];
                v9 += a2[17];
                v10 += a2[18];
                v11 += a2[19];
                if ((_DWORD)v4 != 5)
                {
                  v8 += a2[20];
                  v9 += a2[21];
                  v10 += a2[22];
                  v11 += a2[23];
                  if ((_DWORD)v4 != 6)
                  {
                    v8 += a2[24];
                    v9 += a2[25];
                    v10 += a2[26];
                    v11 += a2[27];
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = v8 / v4;
        a4[1] = v9 / v4;
        a4[2] = v10 / v4;
        a4[3] = v11 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        v12 = 0uLL;
        v13 = v7 & 0xFFFFFFF8;
        v14 = 0uLL;
        v15 = a2;
        v16 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        v28 = 0uLL;
        v29 = 0uLL;
        do
        {
          v45 = vld4_s8(v15);
          v15 += 32;
          v30 = vmovl_s8(v45.val[0]);
          v31 = vmovl_s16(*(int16x4_t *)v30.i8);
          v32 = vmovl_high_s16(v30);
          v33 = vmovl_s8(v45.val[1]);
          v34 = vmovl_s16(*(int16x4_t *)v33.i8);
          v35 = vmovl_high_s16(v33);
          v36 = vmovl_s8(v45.val[2]);
          v37 = vmovl_s16(*(int16x4_t *)v36.i8);
          v38 = vmovl_high_s16(v36);
          *(int16x8_t *)v45.val[0].i8 = vmovl_s8(v45.val[3]);
          *(int32x4_t *)v45.val[1].i8 = vmovl_s16((int16x4_t)v45.val[0]);
          *(int32x4_t *)v45.val[0].i8 = vmovl_high_s16(*(int16x8_t *)v45.val[0].i8);
          v17 = vaddw_high_s32(v17, v32);
          v16 = vaddw_s32(v16, *(int32x2_t *)v32.i8);
          v14 = vaddw_high_s32(v14, v31);
          v12 = vaddw_s32(v12, *(int32x2_t *)v31.i8);
          v21 = vaddw_high_s32(v21, v35);
          v20 = vaddw_s32(v20, *(int32x2_t *)v35.i8);
          v19 = vaddw_high_s32(v19, v34);
          v18 = vaddw_s32(v18, *(int32x2_t *)v34.i8);
          v25 = vaddw_high_s32(v25, v38);
          v24 = vaddw_s32(v24, *(int32x2_t *)v38.i8);
          v23 = vaddw_high_s32(v23, v37);
          v22 = vaddw_s32(v22, *(int32x2_t *)v37.i8);
          v29 = vaddw_high_s32(v29, *(int32x4_t *)v45.val[0].i8);
          v28 = vaddw_s32(v28, (int32x2_t)v45.val[0]);
          v27 = vaddw_high_s32(v27, *(int32x4_t *)v45.val[1].i8);
          v26 = vaddw_s32(v26, (int32x2_t)v45.val[1]);
          v13 -= 8;
        }
        while (v13);
        v39 = vaddvq_s64(vaddq_s64(vaddq_s64(v26, v28), vaddq_s64(v27, v29)));
        v40 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v24), vaddq_s64(v23, v25)));
        v41 = vaddvq_s64(vaddq_s64(vaddq_s64(v18, v20), vaddq_s64(v19, v21)));
        v42 = vaddvq_s64(vaddq_s64(vaddq_s64(v12, v16), vaddq_s64(v14, v17)));
        v43 = v4 - (v7 & 0xFFFFFFF8);
        v44 = 4 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v42 += a2[v44];
            v41 += a2[v44 + 1];
            v40 += a2[v44 + 2];
            v39 += a2[v44 + 3];
            v44 += 4;
            --v43;
          }
          while (v43);
        }
        a2 += v6;
        result = v42 / v4;
        *a4 = result;
        a4[1] = v41 / v4;
        a4[2] = v40 / v4;
        a4[3] = v39 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(uint64_t result, int8x16_t *a2, unsigned int a3, _WORD *a4)
{
  unint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  int64x2_t v18;
  int8x16_t *v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int8x16_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (int8x16_t *)((char *)a2 + a3);
    v6 = 8 * (v4 - 1) + 8;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 4)
    {
      do
      {
        v10 = WORD1(a2->i64[0]);
        v11 = (unsigned __int16)a2->i64[0];
        v12 = (unsigned __int16)WORD2(a2->i64[0]);
        v13 = HIWORD(a2->i64[0]);
        if (result >= 2)
        {
          v14 = a2->u64[1];
          v11 += (unsigned __int16)v14;
          v10 += WORD1(v14);
          v12 += WORD2(v14);
          v13 += HIWORD(v14);
          if ((_DWORD)v4 != 2)
          {
            v15 = a2[1].u64[0];
            v11 += (unsigned __int16)v15;
            v10 += WORD1(v15);
            v12 += WORD2(v15);
            v13 += HIWORD(v15);
          }
        }
        a2 = (int8x16_t *)((char *)a2 + v6);
        *a4 = v11 / v4;
        a4[1] = v10 / v4;
        a4[2] = v12 / v4;
        a4[3] = v13 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = a2 + 1;
      v9.i64[0] = 0xFFFFLL;
      v9.i64[1] = 0xFFFFLL;
      do
      {
        v16 = 0uLL;
        v17 = v7 & 0xFFFFFFFC;
        v18 = 0uLL;
        v19 = v8;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        do
        {
          v26 = v19[-1];
          v16 = vaddq_s64((int64x2_t)vandq_s8(v26, v9), v16);
          v18 = vaddq_s64((int64x2_t)vandq_s8(*v19, v9), v18);
          v20 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v26, 0x10uLL), v9), v20);
          v21 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*(uint64x2_t *)v19, 0x10uLL), v9), v21);
          v22 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v26, 0x20uLL), v9), v22);
          v23 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*(uint64x2_t *)v19, 0x20uLL), v9), v23);
          v24 = (int64x2_t)vsraq_n_u64((uint64x2_t)v24, (uint64x2_t)v26, 0x30uLL);
          v25 = (int64x2_t)vsraq_n_u64((uint64x2_t)v25, *(uint64x2_t *)v19, 0x30uLL);
          v19 += 2;
          v17 -= 4;
        }
        while (v17);
        v27 = vaddvq_s64(vaddq_s64(v25, v24));
        v28 = vaddvq_s64(vaddq_s64(v23, v22));
        v29 = vaddvq_s64(vaddq_s64(v21, v20));
        v30 = vaddvq_s64(vaddq_s64(v18, v16));
        result = v7 & 0xFFFFFFFC;
        if (result != v7)
        {
          do
          {
            v31 = a2->u64[result];
            v30 += (unsigned __int16)v31;
            v29 += WORD1(v31);
            v28 += WORD2(v31);
            v27 += HIWORD(v31);
            ++result;
          }
          while ((_DWORD)v4 != (_DWORD)result);
        }
        a2 = (int8x16_t *)((char *)a2 + v6);
        *a4 = v30 / v4;
        a4[1] = v29 / v4;
        a4[2] = v28 / v4;
        a4[3] = v27 / v4;
        a4 += 4;
        v8 = (int8x16_t *)((char *)v8 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(uint64_t result, uint64_t *a2, unsigned int a3, _WORD *a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int64x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;
  int64x2_t v17;
  int64x2_t *v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (uint64_t *)((char *)a2 + a3);
    v6 = 8 * (v4 - 1) + 8;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 4)
    {
      do
      {
        v9 = (__int16)*a2;
        v10 = *a2 << 32 >> 48;
        v11 = *a2 << 16 >> 48;
        v12 = *a2 >> 48;
        if (result >= 2)
        {
          v13 = a2[1];
          v9 += (__int16)v13;
          v10 += (uint64_t)(int)v13 >> 16;
          v11 += v13 << 16 >> 48;
          v12 += v13 >> 48;
          if ((_DWORD)v4 != 2)
          {
            v14 = a2[2];
            v9 += (__int16)v14;
            v10 += (uint64_t)(int)v14 >> 16;
            v11 += v14 << 16 >> 48;
            v12 += v14 >> 48;
          }
        }
        a2 = (uint64_t *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = v10 / v4;
        a4[2] = v11 / v4;
        a4[3] = v12 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = (int64x2_t *)(a2 + 2);
      do
      {
        v15 = 0uLL;
        v16 = v7 & 0xFFFFFFFC;
        v17 = 0uLL;
        v18 = v8;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        do
        {
          v25 = v18[-1];
          v15 = vsraq_n_s64(v15, vshlq_n_s64(v25, 0x30uLL), 0x30uLL);
          v17 = vsraq_n_s64(v17, vshlq_n_s64(*v18, 0x30uLL), 0x30uLL);
          v19 = vsraq_n_s64(v19, vshlq_n_s64(v25, 0x20uLL), 0x30uLL);
          v20 = vsraq_n_s64(v20, vshlq_n_s64(*v18, 0x20uLL), 0x30uLL);
          v21 = vsraq_n_s64(v21, vshlq_n_s64(v25, 0x10uLL), 0x30uLL);
          v22 = vsraq_n_s64(v22, vshlq_n_s64(*v18, 0x10uLL), 0x30uLL);
          v23 = vsraq_n_s64(v23, v25, 0x30uLL);
          v24 = vsraq_n_s64(v24, *v18, 0x30uLL);
          v18 += 2;
          v16 -= 4;
        }
        while (v16);
        v26 = vaddvq_s64(vaddq_s64(v24, v23));
        v27 = vaddvq_s64(vaddq_s64(v22, v21));
        v28 = vaddvq_s64(vaddq_s64(v20, v19));
        v29 = vaddvq_s64(vaddq_s64(v17, v15));
        result = v7 & 0xFFFFFFFC;
        if (result != v7)
        {
          do
          {
            v30 = a2[result];
            v29 += (__int16)v30;
            v28 += (uint64_t)(int)v30 >> 16;
            v27 += v30 << 16 >> 48;
            v26 += v30 >> 48;
            ++result;
          }
          while ((_DWORD)v4 != (_DWORD)result);
        }
        a2 = (uint64_t *)((char *)a2 + v6);
        *a4 = v29 / v4;
        a4[1] = v28 / v4;
        a4[2] = v27 / v4;
        a4[3] = v26 / v4;
        a4 += 4;
        v8 = (int64x2_t *)((char *)v8 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const double *v10;
  int8x16_t v11;
  int8x16_t v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  const double *v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  const double *v23;
  unsigned __int128 v24;
  unsigned __int128 v25;
  int64x2_t v26;
  int64x2_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 16 * (v4 - 1) + 16;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if ((v7 & 3) != 0)
      v8 = v7 & 3;
    else
      v8 = 4;
    if (v7 < 5)
    {
      do
      {
        v39 = *(_QWORD *)a2;
        v40 = HIDWORD(*(_QWORD *)a2);
        v41 = *(_QWORD *)a2 & 1;
        if (result >= 2)
        {
          v42 = *((_QWORD *)a2 + 2);
          v39 += v42;
          v40 += HIDWORD(v42);
          v41 += v42 & 1;
          if ((_DWORD)v4 != 2)
          {
            v43 = *((_QWORD *)a2 + 4);
            v39 += v43;
            v40 += HIDWORD(v43);
            v41 += v43 & 1;
            if ((_DWORD)v4 != 3)
            {
              v44 = *((_QWORD *)a2 + 6);
              v39 += v44;
              v40 += HIDWORD(v44);
              v41 += v44 & 1;
            }
          }
        }
        a2 += v6;
        v37 = v39 / v4;
        *(_BYTE *)a4 = (v41 / v4) & 1 | v37;
        *(_BYTE *)(a4 + 1) = BYTE1(v37);
        *(_BYTE *)(a4 + 2) = BYTE2(v37);
        *(_BYTE *)(a4 + 3) = BYTE3(v37);
        v38 = v40 / v4;
        *(_WORD *)(a4 + 4) = v38;
        *(_BYTE *)(a4 + 6) = BYTE2(v38);
        *(_BYTE *)(a4 + 7) = BYTE3(v38);
        a4 += 16;
      }
      while (a2 < v5);
    }
    else
    {
      v9 = v7 - v8;
      v10 = (const double *)(a2 + 32);
      v11.i64[0] = 0xFFFFFFFFLL;
      v11.i64[1] = 0xFFFFFFFFLL;
      v12 = (int8x16_t)vdupq_n_s64(1uLL);
      do
      {
        v13 = 0uLL;
        v14 = v9;
        v15 = 0uLL;
        v16 = v10;
        v17 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        do
        {
          v23 = v16 - 4;
          v24 = (unsigned __int128)vld2q_f64(v23);
          v25 = (unsigned __int128)vld2q_f64(v16);
          v26 = (int64x2_t)vandq_s8((int8x16_t)v24, v12);
          v27 = (int64x2_t)vandq_s8((int8x16_t)v25, v12);
          v13 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v24, v11), v13);
          v15 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v25, v11), v15);
          v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v24, 0x20uLL);
          v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v25, 0x20uLL);
          v19 = vaddq_s64(v26, v19);
          v20 = vaddq_s64(v27, v20);
          v21 = vaddq_s64(v26, v21);
          v22 = vaddq_s64(v27, v22);
          v16 += 8;
          v14 -= 4;
        }
        while (v14);
        v28 = vaddvq_s64(vaddq_s64(v22, v21));
        v29 = vaddvq_s64(vaddq_s64(v20, v19));
        v30 = vaddvq_s64(vaddq_s64(v18, v17));
        v31 = vaddvq_s64(vaddq_s64(v15, v13));
        v32 = v8;
        v33 = 16 * v9;
        do
        {
          v34 = *(_QWORD *)&a2[v33];
          v31 += v34;
          v30 += HIDWORD(v34);
          v35 = v34 & 1;
          v29 += v35;
          v28 += v35;
          v33 += 16;
          --v32;
        }
        while (v32);
        a2 += v6;
        result = v31 / v4;
        *(_BYTE *)a4 = ((v28 / v4) | (v29 / v4)) & 1 | result;
        *(_BYTE *)(a4 + 1) = BYTE1(result);
        *(_BYTE *)(a4 + 2) = BYTE2(result);
        *(_BYTE *)(a4 + 3) = BYTE3(result);
        v36 = v30 / v4;
        *(_WORD *)(a4 + 4) = v36;
        *(_BYTE *)(a4 + 6) = BYTE2(v36);
        *(_BYTE *)(a4 + 7) = BYTE3(v36);
        a4 += 16;
        v10 = (const double *)((char *)v10 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const double *v10;
  int8x16_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  int64x2_t v18;
  int64x2_t v19;
  uint64_t v20;
  const double *v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  const double *v28;
  unsigned __int128 v29;
  unsigned __int128 v30;
  int64x2_t v31;
  int64x2_t v32;
  int v33;
  uint64_t v34;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 16 * (v4 - 1) + 16;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = v7 & 3;
    if ((v7 & 3) == 0)
      v8 = 4;
    v9 = v7 - v8;
    v10 = (const double *)(a2 + 32);
    v11 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 5)
      {
        v18 = 0uLL;
        v17 = (uint64_t *)&a2[16 * v9];
        v19 = 0uLL;
        v20 = v9;
        v21 = v10;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        do
        {
          v28 = v21 - 4;
          v29 = (unsigned __int128)vld2q_f64(v28);
          v30 = (unsigned __int128)vld2q_f64(v21);
          v31 = (int64x2_t)vandq_s8((int8x16_t)v29, v11);
          v32 = (int64x2_t)vandq_s8((int8x16_t)v30, v11);
          v18 = vsraq_n_s64(v18, vshlq_n_s64((int64x2_t)v29, 0x20uLL), 0x20uLL);
          v19 = vsraq_n_s64(v19, vshlq_n_s64((int64x2_t)v30, 0x20uLL), 0x20uLL);
          v22 = vsraq_n_s64(v22, (int64x2_t)v29, 0x20uLL);
          v23 = vsraq_n_s64(v23, (int64x2_t)v30, 0x20uLL);
          v24 = vsubq_s64(v24, v31);
          v25 = vsubq_s64(v25, v32);
          v26 = vsubq_s64(v26, v31);
          v27 = vsubq_s64(v27, v32);
          v21 += 8;
          v20 -= 4;
        }
        while (v20);
        v15 = vaddvq_s64(vaddq_s64(v27, v26));
        v14 = vaddvq_s64(vaddq_s64(v25, v24));
        v13 = vaddvq_s64(vaddq_s64(v23, v22));
        v12 = vaddvq_s64(vaddq_s64(v19, v18));
        v16 = v9;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = (uint64_t *)a2;
      }
      v33 = v7 - v16;
      do
      {
        v34 = *v17;
        v17 += 2;
        v12 += (int)v34;
        v13 += v34 >> 32;
        v14 -= v34 & 1;
        v15 -= v34 & 1;
        --v33;
      }
      while (v33);
      a2 += v6;
      result = v14 / v4;
      *(_BYTE *)a4 = ((v15 / v4) | result) & 1 | (v12 / v4);
      *(_BYTE *)(a4 + 1) = (unsigned __int16)(v12 / v4) >> 8;
      *(_BYTE *)(a4 + 2) = (v12 / v4) >> 16;
      *(_BYTE *)(a4 + 3) = (v12 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v13 / v4;
      *(_BYTE *)(a4 + 6) = (v13 / v4) >> 16;
      *(_BYTE *)(a4 + 7) = (v13 / v4) >> 24;
      a4 += 16;
      v10 = (const double *)((char *)v10 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,41ull,32ull,51ull,42ull,61ull,52ull,63ull,62ull>(unint64_t result, char *a2, unsigned int a3, _BYTE *a4)
{
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  int8x16_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  unsigned int *v18;
  int64x2_t v19;
  int64x2_t v20;
  uint64_t v21;
  int64x2_t v22;
  _DWORD *v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  __int128 v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int8x16_t v41;
  int v42;
  unsigned int v43;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = a2 + 16;
    v9 = (int8x16_t)vdupq_n_s64(0x3FFuLL);
    do
    {
      if (v7 >= 8)
      {
        v19 = 0uLL;
        v18 = (unsigned int *)&a2[4 * (v7 & 0xFFFFFFF8)];
        v20 = 0uLL;
        v21 = v7 & 0xFFFFFFF8;
        v22 = 0uLL;
        v23 = v8;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        v28 = 0uLL;
        v29 = 0uLL;
        v30 = 0uLL;
        v31 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        v34 = 0uLL;
        v35 = 0uLL;
        v36 = 0uLL;
        do
        {
          v37 = *((_OWORD *)v23 - 1);
          v38.i64[0] = DWORD2(v37);
          v38.i64[1] = HIDWORD(v37);
          v39 = v38;
          v38.i64[0] = v37;
          v38.i64[1] = DWORD1(v37);
          v40 = v38;
          v38.i64[0] = *((_QWORD *)v23 + 1);
          v38.i64[1] = HIDWORD(*(_OWORD *)v23);
          v41 = v38;
          v38.i64[0] = *(_OWORD *)v23;
          v38.i64[1] = HIDWORD(*(_QWORD *)v23);
          v20 = vaddq_s64((int64x2_t)vandq_s8(v39, v9), v20);
          v19 = vaddq_s64((int64x2_t)vandq_s8(v40, v9), v19);
          v24 = vaddq_s64((int64x2_t)vandq_s8(v41, v9), v24);
          v22 = vaddq_s64((int64x2_t)vandq_s8(v38, v9), v22);
          v26 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 0xAuLL), v9), v26);
          v25 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v40, 0xAuLL), v9), v25);
          v28 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 0xAuLL), v9), v28);
          v27 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 0xAuLL), v9), v27);
          v30 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 0x14uLL), v9), v30);
          v29 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v40, 0x14uLL), v9), v29);
          v32 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 0x14uLL), v9), v32);
          v31 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 0x14uLL), v9), v31);
          v34 = (int64x2_t)vsraq_n_u64((uint64x2_t)v34, (uint64x2_t)v39, 0x1EuLL);
          v33 = (int64x2_t)vsraq_n_u64((uint64x2_t)v33, (uint64x2_t)v40, 0x1EuLL);
          v36 = (int64x2_t)vsraq_n_u64((uint64x2_t)v36, (uint64x2_t)v41, 0x1EuLL);
          v35 = (int64x2_t)vsraq_n_u64((uint64x2_t)v35, (uint64x2_t)v38, 0x1EuLL);
          v23 += 8;
          v21 -= 8;
        }
        while (v21);
        v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v35, v33), vaddq_s64(v36, v34)));
        v15 = vaddvq_s64(vaddq_s64(vaddq_s64(v31, v29), vaddq_s64(v32, v30)));
        v14 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v25), vaddq_s64(v28, v26)));
        v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v19), vaddq_s64(v24, v20)));
        v16 = v7 & 0xFFFFFFF8;
        if ((v7 & 0xFFFFFFF8) == v7)
          goto LABEL_9;
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = (unsigned int *)a2;
      }
      v42 = v7 - v16;
      do
      {
        v43 = *v18++;
        v13 += v43 & 0x3FF;
        v14 += ((unint64_t)v43 >> 10) & 0x3FF;
        v15 += ((unint64_t)v43 >> 20) & 0x3FF;
        v17 += (unint64_t)v43 >> 30;
        --v42;
      }
      while (v42);
LABEL_9:
      a2 += v6;
      v10 = v15 / v4;
      v11 = (v14 / v4) << 42;
      v12 = v11 & 0xF000000000000;
      result = v11 & 0xFFFFFC0000000000 | ((v13 / v4) << 32) & 0x3FFFFFFFFFFLL;
      *a4 = v13 / v4;
      a4[1] = BYTE5(result);
      a4[2] = (v12 & 0xFFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 52)) >> 48;
      a4[3] = ((v10 << 52) & 0x3F00000000000000 | ((v17 / v4) << 62)) >> 56;
      a4 += 4;
      v8 = (_DWORD *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,60ull,59ull,56ull,55ull,52ull,51ull,48ull>(uint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  int64x2_t v29;
  const char *v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  uint16x8_t v45;
  unsigned int v46;
  unsigned int v47;
  int8x8x2_t v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  int8x8x2_t v63;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 8)
    {
      do
      {
        v9 = a2[1];
        v10 = v9 >> 4;
        v11 = *a2;
        v12 = v9 & 0xF;
        v13 = v11 >> 4;
        v14 = v11 & 0xF;
        if (result >= 2)
        {
          v15 = a2[2];
          v16 = a2[3];
          v10 += v16 >> 4;
          v12 += v16 & 0xF;
          v13 += v15 >> 4;
          v14 += v15 & 0xF;
          if ((_DWORD)v4 != 2)
          {
            v17 = a2[4];
            v18 = a2[5];
            v10 += v18 >> 4;
            v12 += v18 & 0xF;
            v13 += v17 >> 4;
            v14 += v17 & 0xF;
            if ((_DWORD)v4 != 3)
            {
              v19 = a2[6];
              v20 = a2[7];
              v10 += v20 >> 4;
              v12 += v20 & 0xF;
              v13 += v19 >> 4;
              v14 += v19 & 0xF;
              if ((_DWORD)v4 != 4)
              {
                v21 = a2[8];
                v22 = a2[9];
                v10 += v22 >> 4;
                v12 += v22 & 0xF;
                v13 += v21 >> 4;
                v14 += v21 & 0xF;
                if ((_DWORD)v4 != 5)
                {
                  v23 = a2[10];
                  v24 = a2[11];
                  v10 += v24 >> 4;
                  v12 += v24 & 0xF;
                  v13 += v23 >> 4;
                  v14 += v23 & 0xF;
                  if ((_DWORD)v4 != 6)
                  {
                    v25 = a2[12];
                    v26 = a2[13];
                    v10 += v26 >> 4;
                    v12 += v26 & 0xF;
                    v13 += v25 >> 4;
                    v14 += v25 & 0xF;
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = (((v13 / v4) << 52) | (((v14 / v4) & 0xF) << 48)) >> 48;
        a4[1] = (((v10 / v4) << 60) | (((v12 / v4) & 0xF) << 56)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = (int8x16_t)vdupq_n_s64(0xFuLL);
      do
      {
        v27 = 0uLL;
        v28 = v7 & 0xFFFFFFF8;
        v29 = 0uLL;
        v30 = (const char *)a2;
        v31 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        v34 = 0uLL;
        v35 = 0uLL;
        v36 = 0uLL;
        v37 = 0uLL;
        v38 = 0uLL;
        v39 = 0uLL;
        v40 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v43 = 0uLL;
        v44 = 0uLL;
        do
        {
          v63 = vld2_s8(v30);
          v30 += 16;
          v45 = vmovl_u8((uint8x8_t)v63.val[0]);
          v63 = (int8x8x2_t)vmovl_u8((uint8x8_t)v63.val[1]);
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v63);
          v48.val[0] = (int8x8_t)v46;
          v48.val[1] = (int8x8_t)v47;
          v32 = (int64x2_t)vsraq_n_u64((uint64x2_t)v32, (uint64x2_t)v48, 4uLL);
          v36 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v36);
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          v63 = (int8x8x2_t)vmovl_u16((uint16x4_t)v63.val[0]);
          v31 = (int64x2_t)vsraq_n_u64((uint64x2_t)v31, (uint64x2_t)v48, 4uLL);
          v35 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v35);
          v48.val[0] = (int8x8_t)v49;
          v48.val[1] = (int8x8_t)v50;
          v29 = (int64x2_t)vsraq_n_u64((uint64x2_t)v29, (uint64x2_t)v48, 4uLL);
          v34 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v34);
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_high_u16(v45);
          v48.val[0] = (int8x8_t)v63.val[0].u32[0];
          v48.val[1] = (int8x8_t)v63.val[0].u32[1];
          v27 = (int64x2_t)vsraq_n_u64((uint64x2_t)v27, (uint64x2_t)v48, 4uLL);
          v33 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v33);
          v48.val[0] = (int8x8_t)v51;
          v48.val[1] = (int8x8_t)v52;
          v40 = (int64x2_t)vsraq_n_u64((uint64x2_t)v40, (uint64x2_t)v48, 4uLL);
          v44 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v44);
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_u16(*(uint16x4_t *)v45.i8);
          v39 = (int64x2_t)vsraq_n_u64((uint64x2_t)v39, (uint64x2_t)v48, 4uLL);
          v43 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v43);
          v48.val[0] = (int8x8_t)v53;
          v48.val[1] = (int8x8_t)v54;
          v63 = v48;
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          v37 = (int64x2_t)vsraq_n_u64((uint64x2_t)v37, (uint64x2_t)v48, 4uLL);
          v38 = (int64x2_t)vsraq_n_u64((uint64x2_t)v38, (uint64x2_t)v63, 4uLL);
          v42 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v63, v8), v42);
          v41 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v41);
          v28 -= 8;
        }
        while (v28);
        v55 = vaddvq_s64(vaddq_s64(vaddq_s64(v41, v43), vaddq_s64(v42, v44)));
        v56 = vaddvq_s64(vaddq_s64(vaddq_s64(v37, v39), vaddq_s64(v38, v40)));
        v57 = vaddvq_s64(vaddq_s64(vaddq_s64(v33, v35), vaddq_s64(v34, v36)));
        v58 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v31), vaddq_s64(v29, v32)));
        v59 = v4 - (v7 & 0xFFFFFFF8);
        v60 = 2 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v61 = a2[v60 + 1];
            v62 = a2[v60];
            v58 += v61 >> 4;
            v57 += v61 & 0xF;
            v56 += v62 >> 4;
            v55 += v62 & 0xF;
            v60 += 2;
            --v59;
          }
          while (v59);
        }
        a2 += v6;
        result = ((v58 / v4) << 60) | (((v57 / v4) & 0xF) << 56);
        *a4 = (((v56 / v4) << 52) | (((v55 / v4) & 0xF) << 48)) >> 48;
        a4[1] = HIBYTE(result);
        a4 += 2;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,54ull,53ull,49ull,48ull,48ull>(uint64_t result, const char *a2, int a3, _BYTE *a4)
{
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  const char *v16;
  int64x2_t v17;
  int64x2_t v18;
  uint64_t v19;
  int64x2_t v20;
  const char *v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  uint16x8_t v35;
  uint32x4_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  uint32x4_t v40;
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  unsigned int v44;
  unsigned int v45;
  int64x2_t v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  unint64_t v50;
  unint64_t v51;
  uint16x8_t v52;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    if (result <= 1)
      v6 = 1;
    else
      v6 = result;
    v7 = (int8x16_t)vdupq_n_s64(0x1FuLL);
    v8 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v6 >= 8)
      {
        v17 = 0uLL;
        v16 = &a2[2 * (v6 & 0xFFFFFFF8)];
        v18 = 0uLL;
        v19 = v6 & 0xFFFFFFF8;
        v20 = 0uLL;
        v21 = a2;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        v28 = 0uLL;
        v29 = 0uLL;
        v30 = 0uLL;
        v31 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        v34 = 0uLL;
        do
        {
          v52 = (uint16x8_t)vld2_s8(v21);
          v21 += 16;
          v35 = vmovl_u8(*(uint8x8_t *)v52.i8);
          v36 = vmovl_u16(*(uint16x4_t *)v35.i8);
          v37.i64[0] = v36.u32[0];
          v37.i64[1] = v36.u32[1];
          v38 = v37;
          v37.i64[0] = v36.u32[2];
          v37.i64[1] = v36.u32[3];
          v39 = v37;
          v40 = vmovl_high_u16(v35);
          v37.i64[0] = v40.u32[0];
          v37.i64[1] = v40.u32[1];
          v41 = v37;
          v37.i64[0] = v40.u32[2];
          v37.i64[1] = v40.u32[3];
          v42 = v37;
          v52 = vmovl_u8((uint8x8_t)v52.u64[1]);
          *(uint32x4_t *)((char *)&v52 + 8) = vmovl_u16(*(uint16x4_t *)v52.i8);
          v37.i64[0] = v52.u32[2];
          v37.i64[1] = v52.u32[3];
          v43 = v37;
          v37.i64[0] = v44;
          v37.i64[1] = v45;
          *(int64x2_t *)((char *)&v52 + 8) = v37;
          v52 = (uint16x8_t)vmovl_high_u16(v52);
          v37.i64[0] = v52.u32[0];
          v37.i64[1] = v52.u32[1];
          v46 = v37;
          v37.i64[0] = v47;
          v37.i64[1] = v48;
          v22 = (int64x2_t)vsraq_n_u64((uint64x2_t)v22, (uint64x2_t)v37, 3uLL);
          v20 = (int64x2_t)vsraq_n_u64((uint64x2_t)v20, (uint64x2_t)v46, 3uLL);
          v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, *(uint64x2_t *)((char *)&v52 + 8), 3uLL);
          v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v43, 3uLL);
          v26 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v37, 0x38uLL), (int8x16_t)vshlq_n_s64(v42, 0x30uLL)), 0x36uLL), v7), v26);
          v25 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v41, 0x30uLL)), 0x36uLL), v7), v25);
          v24 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v52 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v39, 0x30uLL)), 0x36uLL), v7), v24);
          v23 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v43, 0x38uLL), (int8x16_t)vshlq_n_s64(v38, 0x30uLL)), 0x36uLL), v7), v23);
          v30 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v42, 1uLL), v7), v30);
          v29 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 1uLL), v7), v29);
          v28 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 1uLL), v7), v28);
          v27 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 1uLL), v7), v27);
          v34 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v42, v8), v34);
          v33 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v41, v8), v33);
          v32 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v39, v8), v32);
          v31 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v38, v8), v31);
          v19 -= 8;
        }
        while (v19);
        v15 = vaddvq_s64(vaddq_s64(vaddq_s64(v31, v33), vaddq_s64(v32, v34)));
        v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v29), vaddq_s64(v28, v30)));
        v12 = vaddvq_s64(vaddq_s64(vaddq_s64(v23, v25), vaddq_s64(v24, v26)));
        v11 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v20), vaddq_s64(v18, v22)));
        v14 = v6 & 0xFFFFFFF8;
        if ((v6 & 0xFFFFFFF8) == v6)
          goto LABEL_9;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = a2;
      }
      v49 = v6 - v14;
      do
      {
        v50 = *(unsigned __int8 *)v16;
        v51 = *((unsigned __int8 *)v16 + 1);
        v11 += v51 >> 3;
        v12 += (((v50 << 48) | (v51 << 56)) >> 54) & 0x1F;
        v13 += (v50 >> 1) & 0x1F;
        v15 += v50 & 1;
        v16 += 2;
        --v49;
      }
      while (v49);
LABEL_9:
      a2 += 2 * (v4 - 1) + 2;
      v9 = v11 / v4;
      v10 = v12 / v4;
      result = (v10 << 54) & 0x700000000000000;
      *a4 = ((((v15 / v4) & 1) << 48) & 0x1FFFFFFFFFFFFLL | (((v13 / v4) & 0x1F) << 49) & 0x3FFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 54)) >> 48;
      a4[1] = (result | (v9 << 59)) >> 56;
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)11,(unsigned char)11,(unsigned char)10,(unsigned char)0>(uint64_t result, char *a2, unsigned int a3, int *a4)
{
  char *v4;
  float v5;
  int v6;
  int v7;
  float v8;
  unsigned int *v9;
  float v10;
  float v11;
  int v12;
  float v13;
  unsigned int v14;
  int v15;
  int v16;
  char v17;
  int v18;
  float v19;
  int v20;
  int v21;
  float v22;
  unsigned int v23;
  char v24;
  int v25;
  int v26;
  char v27;
  int v28;
  float v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  float v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  float v37;
  unsigned int v38;
  unsigned int v39;

  if (a3)
  {
    v4 = &a2[a3];
    v5 = (float)result;
    do
    {
      if (!(_DWORD)result)
      {
        v11 = 0.0;
        v10 = 0.0;
        v29 = 0.0 / v5;
        if ((COERCE_UNSIGNED_INT(0.0 / v5) & 0x80000000) != 0)
          goto LABEL_53;
LABEL_43:
        v30 = LODWORD(v29) & 0x7F800000;
        v31 = LODWORD(v29) & 0x7FFFFF;
        if (v30 == 2139095040)
        {
          v32 = (v31 >> 17) | 0x7C0;
          v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0)
            goto LABEL_54;
          goto LABEL_67;
        }
        if (!v30)
        {
          v32 = v31 >> 17;
          v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0)
            goto LABEL_54;
          goto LABEL_67;
        }
        if (v30 > 0x47000000)
        {
          LOWORD(v32) = 1984;
          v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0)
            goto LABEL_54;
          goto LABEL_67;
        }
        if (v30 >> 23 < 0x71)
          goto LABEL_53;
        v32 = ((v30 >> 17) + 58368) | (v31 >> 17);
        v33 = v11 / v5;
        if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) != 0)
          goto LABEL_67;
LABEL_54:
        v34 = LODWORD(v33) & 0x7F800000;
        v35 = LODWORD(v33) & 0x7FFFFF;
        if (v34 == 2139095040)
        {
          v36 = (v35 >> 17) | 0x7C0;
          v37 = v10 / v5;
          if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0)
            goto LABEL_68;
        }
        else if (v34)
        {
          if (v34 <= 0x47000000)
          {
            if (v34 >> 23 < 0x71)
              goto LABEL_67;
            v36 = ((v34 >> 17) + 58368) | (v35 >> 17);
            v37 = v10 / v5;
            if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0)
              goto LABEL_68;
          }
          else
          {
            LOWORD(v36) = 1984;
            v37 = v10 / v5;
            if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0)
              goto LABEL_68;
          }
        }
        else
        {
          v36 = v35 >> 17;
          v37 = v10 / v5;
          if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0)
            goto LABEL_68;
        }
LABEL_3:
        v6 = 0;
        goto LABEL_4;
      }
      v7 = 0;
      v8 = 0.0;
      v9 = (unsigned int *)a2;
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        v14 = *v9;
        v15 = (*v9 >> 6) & 0x1F;
        v16 = *v9 & 0x3F;
        if (v15 == 31)
        {
          LODWORD(v19) = (v16 << 17) | 0x7F800000;
          v20 = (v14 >> 17) & 0x1F;
          v21 = (v14 >> 11) & 0x3F;
          if (v20 == 31)
            goto LABEL_17;
          goto LABEL_21;
        }
        if (v15)
        {
          v17 = 0;
          v18 = (v15 << 23) + 939524096;
          goto LABEL_20;
        }
        if (v16)
        {
          v17 = -1;
          v18 = 956301312;
          do
          {
            ++v17;
            v18 -= 0x800000;
          }
          while (((v16 << v17) & 0x40) == 0);
LABEL_20:
          LODWORD(v19) = (v16 << (v17 + 17)) & 0x7FFFFF | v18;
          v20 = (v14 >> 17) & 0x1F;
          v21 = (v14 >> 11) & 0x3F;
          if (v20 == 31)
            goto LABEL_17;
          goto LABEL_21;
        }
        v19 = 0.0;
        v20 = (v14 >> 17) & 0x1F;
        v21 = (v14 >> 11) & 0x3F;
        if (v20 == 31)
        {
LABEL_17:
          LODWORD(v22) = (v21 << 17) | 0x7F800000;
          v23 = v14 >> 27;
          if (v14 >> 27 == 31)
            goto LABEL_7;
          goto LABEL_28;
        }
LABEL_21:
        if (v20)
        {
          v24 = 0;
          v25 = (v20 << 23) + 939524096;
          goto LABEL_27;
        }
        if (v21)
        {
          v24 = -1;
          v25 = 956301312;
          do
          {
            ++v24;
            v25 -= 0x800000;
          }
          while (((v21 << v24) & 0x40) == 0);
LABEL_27:
          LODWORD(v22) = (v21 << (v24 + 17)) & 0x7FFFFF | v25;
          v23 = v14 >> 27;
          if (v14 >> 27 == 31)
            goto LABEL_7;
          goto LABEL_28;
        }
        v22 = 0.0;
        v23 = v14 >> 27;
        if (v14 >> 27 == 31)
        {
LABEL_7:
          v12 = (v14 >> 22 << 18) | 0x7F800000;
LABEL_8:
          v13 = *(float *)&v12;
          goto LABEL_9;
        }
LABEL_28:
        v26 = (v14 >> 22) & 0x1F;
        if (v23)
        {
          v27 = 0;
          v28 = (v23 << 23) + 939524096;
LABEL_34:
          v12 = (v26 << (v27 + 18)) & 0x7FFFFF | v28;
          goto LABEL_8;
        }
        if (v26)
        {
          v27 = -1;
          v28 = 956301312;
          do
          {
            ++v27;
            v28 -= 0x800000;
          }
          while (((v26 << v27) & 0x20) == 0);
          goto LABEL_34;
        }
        v13 = 0.0;
LABEL_9:
        v8 = v8 + v19;
        v11 = v11 + v22;
        v10 = v10 + v13;
        ++v9;
        ++v7;
      }
      while (v7 != (_DWORD)result);
      a2 += 4 * (result - 1) + 4;
      v29 = v8 / v5;
      if ((COERCE_UNSIGNED_INT(v8 / v5) & 0x80000000) == 0)
        goto LABEL_43;
LABEL_53:
      LOWORD(v32) = 0;
      v33 = v11 / v5;
      if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0)
        goto LABEL_54;
LABEL_67:
      LOWORD(v36) = 0;
      v37 = v10 / v5;
      if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) != 0)
        goto LABEL_3;
LABEL_68:
      v38 = LODWORD(v37) & 0x7F800000;
      v39 = LODWORD(v37) & 0x7FFFFF;
      if (v38 == 2139095040)
      {
        v6 = (v39 >> 18) | 0x3E0;
        goto LABEL_4;
      }
      if (!v38)
      {
        v6 = v39 >> 18;
        goto LABEL_4;
      }
      if (v38 > 0x47000000)
      {
        v6 = 992;
        goto LABEL_4;
      }
      if (v38 >> 23 < 0x71)
        goto LABEL_3;
      v6 = ((v38 >> 18) + 61952) | (v39 >> 18);
LABEL_4:
      *a4++ = ((unsigned __int16)v36 << 11) | (unsigned __int16)v32 | (v6 << 22);
    }
    while (a2 < v4);
  }
  return result;
}

void GPUTools::GL::MSAABufferResolverResolveRGB9E5(GPUTools::GL *this, unsigned int *a2, const void *a3, __int32 *a4, void *a5, double a6)
{
  unsigned int *v7;
  int v8;
  unint64_t v9;
  float32x2_t v10;
  float v15;
  float v16;
  double v17;
  float32x2_t v18;
  int8x8_t v19;
  float v20;
  float v21;
  int v22;
  double v23;
  unsigned int v24;
  int v26;
  int v27;
  __int16 v28;
  int8x8_t v29;
  float32x2_t v30;
  float v31;
  int v32;
  unsigned int v33;
  float v34;
  float64x2_t v35;
  float32x2_t v36;
  float v37;
  float32x2_t v38;

  if ((_DWORD)a3)
  {
    v7 = a2;
    v8 = (int)this;
    *(float *)&a6 = (float)this;
    v9 = (unint64_t)a2 + a3;
    v37 = (float)this;
    v36 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    v10 = (float32x2_t)vdup_n_s32(0x477F8000u);
    __asm { FMOV            V0.2D, #0.5 }
    v35 = _Q0;
    do
    {
      v30 = 0;
      v31 = 0.0;
      if (v8)
      {
        v32 = v8;
        do
        {
          v33 = *v7++;
          v34 = ldexp(1.0, (v33 >> 27) - 24);
          v31 = v31 + (float)((float)(v33 & 0x1FF) * v34);
          v30 = vadd_f32(v30, vmul_n_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v33), (uint32x2_t)0xFFFFFFF7FFFFFFEELL), (int8x8_t)0x100000001)), v34));
          --v32;
        }
        while (v32);
      }
      v15 = 65408.0;
      if ((float)(v31 / v37) < 65408.0)
        v15 = v31 / v37;
      v16 = 0.0;
      if ((float)(v31 / v37) > 0.0)
        v16 = v15;
      v17 = v16;
      v18 = vdiv_f32(v30, v36);
      v19 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v18, v10), (int8x8_t)v10, (int8x8_t)v18), (int8x8_t)vcgtz_f32(v18));
      v38 = (float32x2_t)v19;
      if (v16 <= *(float *)v19.i32)
        v20 = *(float *)v19.i32;
      else
        v20 = v16;
      if (*(float *)&v19.i32[1] > *(float *)v19.i32)
        v19.i32[0] = v19.i32[1];
      if (v16 <= *(float *)&v19.i32[1])
        v21 = *(float *)v19.i32;
      else
        v21 = v20;
      if ((LODWORD(v21) >> 23) <= 0x6Fu)
        v22 = 111;
      else
        v22 = (LODWORD(v21) >> 23);
      v23 = ldexp(1.0, v22 - 135);
      v24 = vcvtmd_s64_f64(v21 / v23 + 0.5);
      _ZF = v24 == 512;
      if (v24 == 512)
        v26 = 18;
      else
        v26 = 17;
      v27 = v26 + v22;
      if (_ZF)
        v23 = v23 + v23;
      v28 = vcvtmd_s64_f64(v17 / v23 + 0.5);
      v29 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v38), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0)), v35)))), (uint32x2_t)0x900000012), (int8x8_t)0x3FE0007FC0000);
      *a4++ = v28 & 0x1FF | (v27 << 27) | v29.i32[1] | v29.i32[0];
    }
    while ((unint64_t)v7 < v9);
  }
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<2u,(unsigned char)16,(unsigned char)0,(unsigned char)0,(unsigned char)0>(uint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  float v4;
  unsigned __int16 *v5;
  uint64_t v6;
  int v7;
  float v8;
  unsigned __int16 *v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  char v15;
  int v16;
  float v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  __int16 v23;
  float v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  __int16 i;
  unsigned int j;

  if (!a3)
    return result;
  v4 = (float)result;
  if (!(_DWORD)result)
  {
    v24 = 0.0 / v4;
    v25 = HIWORD(COERCE_UNSIGNED_INT(0.0 / v4)) & 0x8000;
    v26 = HIWORD(LODWORD(v24)) & 0x8000 | (LODWORD(v24) >> 13) & 0x3FF;
    v27 = COERCE_UNSIGNED_INT(0.0 / v4) & 0x7F800000;
    if (v27)
    {
      if (v27 == 2139095040)
      {
        while (1)
          *a4++ = v26 | 0x7C00;
      }
      if (v27 >= 0x47000001)
      {
        for (i = v25 | 0x7C00; ; *a4++ = i)
          ;
      }
      if (v27 >> 23 < 0x71)
      {
        while (1)
          *a4++ = v25;
      }
      for (j = (((v27 >> 13) & 0xFFFFFC00 | (LODWORD(v24) >> 13) & 0x3FF) + 0x4000) | v25; ; *a4++ = j)
        ;
    }
    while (1)
      *a4++ = v26;
  }
  v5 = (unsigned __int16 *)((char *)a2 + a3);
  v6 = 2 * (result - 1) + 2;
  do
  {
    while (2)
    {
      v7 = 0;
      v8 = 0.0;
      v9 = a2;
      do
      {
        while (1)
        {
          v11 = (__int16)*v9;
          v12 = (v11 >> 10) & 0x1F;
          v13 = v11 & 0x3FF;
          v14 = v11 & 0x80000000;
          if (!v12)
            break;
          if (v12 != 31)
          {
            v15 = 0;
            v16 = (v12 << 23) + 939524096;
LABEL_14:
            v10 = v16 | v14 | (v13 << (v15 + 13)) & 0x7FFFFF;
            goto LABEL_7;
          }
          v10 = v14 | (*v9 << 13) | 0x7F800000;
LABEL_7:
          v8 = v8 + *(float *)&v10;
          ++v9;
          if (++v7 == (_DWORD)result)
            goto LABEL_16;
        }
        if ((v11 & 0x3FF) != 0)
        {
          v16 = 956301312;
          v15 = -1;
          do
          {
            ++v15;
            v16 -= 0x800000;
          }
          while (((v13 << v15) & 0x400) == 0);
          goto LABEL_14;
        }
        v8 = v8 + 0.0;
        ++v9;
        ++v7;
      }
      while (v7 != (_DWORD)result);
LABEL_16:
      v17 = v8 / v4;
      v18 = LODWORD(v17) & 0x7FFFFF;
      v19 = HIWORD(LODWORD(v17)) & 0x8000;
      v20 = LODWORD(v17) & 0x7F800000;
      if ((LODWORD(v17) & 0x7F800000) == 0)
      {
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v19 | (v18 >> 13);
        if (a2 >= v5)
          return result;
        continue;
      }
      break;
    }
    v21 = v19 | (v18 >> 13) | 0x7C00;
    v22 = ((v20 >> 13) + 0x4000) | (v18 >> 13) | v19;
    if (v20 >> 23 < 0x71)
      v22 = HIWORD(LODWORD(v17)) & 0x8000;
    if (v20 > 0x47000000)
      LOWORD(v22) = v19 | 0x7C00;
    if (v20 == 2139095040)
      v23 = v21;
    else
      v23 = v22;
    a2 = (unsigned __int16 *)((char *)a2 + v6);
    *a4++ = v23;
  }
  while (a2 < v5);
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)32,(unsigned char)0,(unsigned char)0,(unsigned char)0>(uint64_t result, unint64_t a2, unsigned int a3, float *a4)
{
  float v4;
  unint64_t v5;
  uint64_t v6;
  float v7;
  float i;

  if (a3)
  {
    v4 = (float)result;
    if (!(_DWORD)result)
    {
      for (i = 0.0 / v4; ; *a4++ = i)
        ;
    }
    v5 = a2 + a3;
    do
    {
      v6 = 0;
      v7 = 0.0;
      do
        v7 = v7 + *(float *)(a2 + 4 * v6++);
      while ((_DWORD)result != (_DWORD)v6);
      a2 += 4 * (result - 1) + 4;
      *a4++ = v7 / v4;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)16,(unsigned char)16,(unsigned char)0,(unsigned char)0>(uint64_t result, char *a2, unsigned int a3, _WORD *a4)
{
  char *v4;
  float v5;
  float v6;
  float v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  float v19;
  unsigned int *v20;
  float v21;
  int v22;
  float v23;
  unsigned int v24;
  int v25;
  int v26;
  unsigned int v27;
  char v28;
  int v29;
  float v30;
  int v31;
  unsigned int v32;
  int v33;
  char v34;
  int v35;

  if (a3)
  {
    v4 = &a2[a3];
    v5 = (float)result;
    while (!(_DWORD)result)
    {
      v21 = 0.0;
      v19 = 0.0;
LABEL_4:
      v6 = v19 / v5;
      v7 = v21 / v5;
      v8 = LODWORD(v6) & 0x7F800000;
      v9 = HIWORD(LODWORD(v6)) & 0x8000;
      v10 = v9 | ((LODWORD(v6) & 0x7FFFFFu) >> 13);
      v11 = (((LODWORD(v6) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v6) & 0x7FFFFFu) >> 13) | v9;
      if ((LODWORD(v6) & 0x7F800000u) >> 23 < 0x71)
        v11 = HIWORD(LODWORD(v6)) & 0x8000;
      v12 = v9 | 0x7C00;
      if (v8 < 0x47000001)
        v12 = v11;
      if (!v8)
        v12 = v10;
      if (v8 == 2139095040)
        v12 = v10 | 0x7C00;
      *a4 = v12;
      v13 = LODWORD(v7) & 0x7F800000;
      v14 = HIWORD(LODWORD(v7)) & 0x8000;
      v15 = v14 | ((LODWORD(v7) & 0x7FFFFFu) >> 13);
      v16 = (((LODWORD(v7) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v7) & 0x7FFFFFu) >> 13) | v14;
      if ((LODWORD(v7) & 0x7F800000u) >> 23 < 0x71)
        v16 = HIWORD(LODWORD(v7)) & 0x8000;
      v17 = v14 | 0x7C00;
      if (v13 < 0x47000001)
        v17 = v16;
      if (!v13)
        v17 = v15;
      if (v13 == 2139095040)
        v17 = v15 | 0x7C00;
      a4[1] = v17;
      a4 += 2;
      if (a2 >= v4)
        return result;
    }
    v18 = 0;
    v19 = 0.0;
    v20 = (unsigned int *)a2;
    v21 = 0.0;
    while (1)
    {
      v24 = *v20;
      v25 = (*v20 >> 10) & 0x1F;
      v26 = *v20 & 0x3FF;
      v27 = (*v20 << 16) & 0x80000000;
      if (v25 == 31)
      {
        LODWORD(v30) = v27 | (v26 << 13) | 0x7F800000;
        v31 = (v24 >> 26) & 0x1F;
        v32 = v24 & 0x80000000;
        if (v31 == 31)
          goto LABEL_23;
        goto LABEL_36;
      }
      if (v25)
        break;
      if (v26)
      {
        v28 = -1;
        v29 = 956301312;
        do
        {
          ++v28;
          v29 -= 0x800000;
        }
        while (((v26 << v28) & 0x400) == 0);
LABEL_35:
        LODWORD(v30) = v29 | v27 | (v26 << (v28 + 13)) & 0x7FFFFF;
        v31 = (v24 >> 26) & 0x1F;
        v32 = v24 & 0x80000000;
        if (v31 == 31)
          goto LABEL_23;
        goto LABEL_36;
      }
      v30 = 0.0;
      v31 = (v24 >> 26) & 0x1F;
      v32 = v24 & 0x80000000;
      if (v31 == 31)
      {
LABEL_23:
        v22 = v32 | (HIWORD(v24) << 13) | 0x7F800000;
        goto LABEL_24;
      }
LABEL_36:
      v33 = HIWORD(v24) & 0x3FF;
      if (v31)
      {
        v34 = 0;
        v35 = (v31 << 23) + 939524096;
      }
      else
      {
        if (!v33)
        {
          v23 = 0.0;
          goto LABEL_25;
        }
        v34 = -1;
        v35 = 956301312;
        do
        {
          ++v34;
          v35 -= 0x800000;
        }
        while (((v33 << v34) & 0x400) == 0);
      }
      v22 = v35 | v32 | (v33 << (v34 + 13)) & 0x7FFFFF;
LABEL_24:
      v23 = *(float *)&v22;
LABEL_25:
      v19 = v19 + v30;
      v21 = v21 + v23;
      ++v20;
      if (++v18 == (_DWORD)result)
      {
        a2 += 4 * (result - 1) + 4;
        goto LABEL_4;
      }
    }
    v28 = 0;
    v29 = (v25 << 23) + 939524096;
    goto LABEL_35;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)32,(unsigned char)32,(unsigned char)0,(unsigned char)0>(uint64_t result, unint64_t a2, unsigned int a3, float *a4, double a5)
{
  unint64_t v5;
  float32x2_t v6;
  uint64_t v7;
  float32x2_t v8;
  float v9;

  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!(_DWORD)result)
    {
      v9 = 0.0 / *(float *)&a5;
      while (1)
      {
        *a4 = v9;
        a4[1] = v9;
        a4 += 2;
      }
    }
    v5 = a2 + a3;
    v6 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      v7 = 0;
      v8 = 0;
      do
        v8 = vadd_f32(v8, *(float32x2_t *)(a2 + 8 * v7++));
      while ((_DWORD)result != (_DWORD)v7);
      a2 += 8 * (result - 1) + 8;
      *(float32x2_t *)a4 = vdiv_f32(v8, v6);
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(uint64_t result, char *a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t v11;
  uint64_t v12;
  int64x2_t v13;
  const char *v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int16x8_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int8x8x3_t v35;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    v6 = 3 * (v4 - 1) + 3;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 < 8)
    {
      do
      {
        v8 = *a2;
        v9 = a2[1];
        v10 = a2[2];
        if (result >= 2)
        {
          v8 += a2[3];
          v9 += a2[4];
          v10 += a2[5];
          if ((_DWORD)v4 != 2)
          {
            v8 += a2[6];
            v9 += a2[7];
            v10 += a2[8];
            if ((_DWORD)v4 != 3)
            {
              v8 += a2[9];
              v9 += a2[10];
              v10 += a2[11];
              if ((_DWORD)v4 != 4)
              {
                v8 += a2[12];
                v9 += a2[13];
                v10 += a2[14];
                if ((_DWORD)v4 != 5)
                {
                  v8 += a2[15];
                  v9 += a2[16];
                  v10 += a2[17];
                  if ((_DWORD)v4 != 6)
                  {
                    v8 += a2[18];
                    v9 += a2[19];
                    v10 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = v8 / v4;
        a4[1] = v9 / v4;
        a4[2] = v10 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        v11 = 0uLL;
        v12 = v7 & 0xFFFFFFF8;
        v13 = 0uLL;
        v14 = a2;
        v15 = 0uLL;
        v16 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        do
        {
          v35 = vld3_s8(v14);
          v14 += 24;
          v25 = vmovl_s8(v35.val[0]);
          v26 = vmovl_s16(*(int16x4_t *)v25.i8);
          v27 = vmovl_high_s16(v25);
          v28 = vmovl_s8(v35.val[1]);
          v29 = vmovl_s16(*(int16x4_t *)v28.i8);
          v30 = vmovl_high_s16(v28);
          *(int16x8_t *)v35.val[0].i8 = vmovl_s8(v35.val[2]);
          *(int32x4_t *)v35.val[1].i8 = vmovl_s16((int16x4_t)v35.val[0]);
          *(int32x4_t *)v35.val[0].i8 = vmovl_high_s16(*(int16x8_t *)v35.val[0].i8);
          v16 = vaddw_high_s32(v16, v27);
          v15 = vaddw_s32(v15, *(int32x2_t *)v27.i8);
          v13 = vaddw_high_s32(v13, v26);
          v11 = vaddw_s32(v11, *(int32x2_t *)v26.i8);
          v20 = vaddw_high_s32(v20, v30);
          v19 = vaddw_s32(v19, *(int32x2_t *)v30.i8);
          v18 = vaddw_high_s32(v18, v29);
          v17 = vaddw_s32(v17, *(int32x2_t *)v29.i8);
          v24 = vaddw_high_s32(v24, *(int32x4_t *)v35.val[0].i8);
          v23 = vaddw_s32(v23, (int32x2_t)v35.val[0]);
          v22 = vaddw_high_s32(v22, *(int32x4_t *)v35.val[1].i8);
          v21 = vaddw_s32(v21, (int32x2_t)v35.val[1]);
          v12 -= 8;
        }
        while (v12);
        v31 = vaddvq_s64(vaddq_s64(vaddq_s64(v21, v23), vaddq_s64(v22, v24)));
        v32 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v19), vaddq_s64(v18, v20)));
        v33 = vaddvq_s64(vaddq_s64(vaddq_s64(v11, v15), vaddq_s64(v13, v16)));
        result = v4 - (v7 & 0xFFFFFFF8);
        v34 = 3 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v33 += a2[v34];
            v32 += a2[v34 + 1];
            v31 += a2[v34 + 2];
            v34 += 3;
            result = (result - 1);
          }
          while ((_DWORD)result);
        }
        a2 += v6;
        *a4 = v33 / v4;
        a4[1] = v32 / v4;
        a4[2] = v31 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, _BYTE *a4)
{
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64x2_t v14;
  uint64_t v15;
  int64x2_t v16;
  const char *v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  uint32x4_t v28;
  uint32x4_t v29;
  uint32x4_t v30;
  uint32x4_t v31;
  uint32x4_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;

  if (result <= 1)
    v7 = 1;
  else
    v7 = result;
  if (a3)
  {
    v8 = &a2[a3];
    v9 = 3 * (v7 - 1) + 3;
    if (result <= 1)
      v10 = 1;
    else
      v10 = result;
    if (v10 < 8)
    {
      do
      {
        v11 = *a2;
        v12 = a2[1];
        v13 = a2[2];
        if (result >= 2)
        {
          v11 += a2[3];
          v12 += a2[4];
          v13 += a2[5];
          if ((_DWORD)v7 != 2)
          {
            v11 += a2[6];
            v12 += a2[7];
            v13 += a2[8];
            if ((_DWORD)v7 != 3)
            {
              v11 += a2[9];
              v12 += a2[10];
              v13 += a2[11];
              if ((_DWORD)v7 != 4)
              {
                v11 += a2[12];
                v12 += a2[13];
                v13 += a2[14];
                if ((_DWORD)v7 != 5)
                {
                  v11 += a2[15];
                  v12 += a2[16];
                  v13 += a2[17];
                  if ((_DWORD)v7 != 6)
                  {
                    v11 += a2[18];
                    v12 += a2[19];
                    v13 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v9;
        *a4 = v11 / v7;
        a4[1] = v12 / v7;
        a4[2] = v13 / v7;
        a4 += 3;
      }
      while (a2 < v8);
    }
    else
    {
      do
      {
        v14 = 0uLL;
        v15 = v10 & 0xFFFFFFF8;
        v16 = 0uLL;
        v17 = (const char *)a2;
        v18 = 0uLL;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        v25 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        do
        {
          *(int8x8x3_t *)v4.i8 = vld3_s8(v17);
          v17 += 24;
          v28 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_23C692010);
          v29 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_23C692000);
          v30 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_23C692010);
          v31 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_23C692000);
          v32 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_23C692010);
          v4 = vqtbl1q_s8(v6, (int8x16_t)xmmword_23C692000);
          v19 = (int64x2_t)vaddw_high_u32((uint64x2_t)v19, v28);
          v16 = (int64x2_t)vaddw_high_u32((uint64x2_t)v16, v29);
          v18 = (int64x2_t)vaddw_u32((uint64x2_t)v18, *(uint32x2_t *)v28.i8);
          v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)v29.i8);
          v23 = (int64x2_t)vaddw_high_u32((uint64x2_t)v23, v30);
          v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v31);
          v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, *(uint32x2_t *)v30.i8);
          v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v31.i8);
          v27 = (int64x2_t)vaddw_high_u32((uint64x2_t)v27, v32);
          v25 = (int64x2_t)vaddw_high_u32((uint64x2_t)v25, (uint32x4_t)v4);
          v26 = (int64x2_t)vaddw_u32((uint64x2_t)v26, *(uint32x2_t *)v32.i8);
          v24 = (int64x2_t)vaddw_u32((uint64x2_t)v24, *(uint32x2_t *)v4.i8);
          v15 -= 8;
        }
        while (v15);
        v33 = vaddvq_s64(vaddq_s64(vaddq_s64(v24, v26), vaddq_s64(v25, v27)));
        v34 = vaddvq_s64(vaddq_s64(vaddq_s64(v20, v22), vaddq_s64(v21, v23)));
        v35 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v18), vaddq_s64(v16, v19)));
        result = v7 - (v10 & 0xFFFFFFF8);
        v36 = 3 * (v10 & 0xFFFFFFF8);
        if ((v10 & 0xFFFFFFF8) != v10)
        {
          do
          {
            v35 += a2[v36];
            v34 += a2[v36 + 1];
            v33 += a2[v36 + 2];
            v36 += 3;
            result = (result - 1);
          }
          while ((_DWORD)result);
        }
        a2 += v9;
        *a4 = v35 / v7;
        a4[1] = v34 / v7;
        a4[2] = v33 / v7;
        a4 += 3;
      }
      while (a2 < v8);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, _WORD *a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t v18;
  int64x2_t v19;
  int v20;
  uint64_t v21;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unint64_t)a2 + a3;
    v6 = 6 * (v4 - 1) + 6;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 >= 2)
    {
      v11 = (unsigned __int8 *)a2 + 5;
      do
      {
        v12 = 0;
        v13 = 0;
        v14 = 0uLL;
        v15 = v11;
        v16 = v7 & 0xFFFFFFFE;
        v17 = 0uLL;
        do
        {
          v17 = vsraq_n_s64(v17, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)(v15 - 5)), (uint64x2_t)xmmword_23C692040), 0x30uLL);
          v14 = vsraq_n_s64(v14, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)(v15 + 1)), (uint64x2_t)xmmword_23C692040), 0x30uLL);
          v12 += (uint64_t)(((unint64_t)*(v15 - 1) << 48) | ((unint64_t)*v15 << 56)) >> 48;
          v13 += (uint64_t)(((unint64_t)v15[5] << 48) | ((unint64_t)v15[6] << 56)) >> 48;
          v15 += 12;
          v16 -= 2;
        }
        while (v16);
        v18 = v13 + v12;
        v19 = vaddq_s64(v14, v17);
        v20 = v4 - (v7 & 0xFFFFFFFE);
        v21 = 6 * (v7 & 0xFFFFFFFE);
        if ((v7 & 0xFFFFFFFE) != v7)
        {
          do
          {
            v19 = vsraq_n_s64(v19, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)((char *)a2 + v21)), (uint64x2_t)xmmword_23C692040), 0x30uLL);
            v18 += (uint64_t)(((unint64_t)*((unsigned __int8 *)a2 + v21 + 4) << 48) | ((unint64_t)*((unsigned __int8 *)a2 + v21 + 5) << 56)) >> 48;
            v21 += 6;
            --v20;
          }
          while (v20);
        }
        a2 = (int *)((char *)a2 + v6);
        result = v19.i64[1] / v4;
        *a4 = v19.i64[0] / v4;
        a4[1] = v19.i64[1] / v4;
        a4[2] = v18 / v4;
        a4 += 3;
        v11 += v6;
      }
      while ((unint64_t)a2 < v5);
    }
    else
    {
      do
      {
        v8 = *a2;
        v9 = (__int16)*a2;
        v10 = (uint64_t)(((unint64_t)*((unsigned __int8 *)a2 + 4) << 48) | ((unint64_t)*((unsigned __int8 *)a2 + 5) << 56)) >> 48;
        a2 = (int *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = ((uint64_t)v8 >> 16) / v4;
        a4[2] = v10 / v4;
        a4 += 3;
      }
      while ((unint64_t)a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(unint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 6 * (v4 - 1) + 6;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 >= 2)
    {
      v11 = (char *)a2 + 5;
      do
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = v11;
        v19 = v7 & 0xFFFFFFFE;
        do
        {
          v20 = *(unsigned int *)(v18 - 5);
          v21 = *(unsigned int *)(v18 + 1);
          v12 += (unsigned __int16)v20;
          v13 += (unsigned __int16)v21;
          v14 += v20 >> 16;
          v15 += v21 >> 16;
          v16 += *(unsigned __int16 *)(v18 - 1);
          v17 += *(unsigned __int16 *)(v18 + 5);
          v18 += 12;
          v19 -= 2;
        }
        while (v19);
        result = v17 + v16;
        v22 = v15 + v14;
        v23 = v13 + v12;
        v24 = v4 - (v7 & 0xFFFFFFFE);
        v25 = 6 * (v7 & 0xFFFFFFFE);
        if ((v7 & 0xFFFFFFFE) != v7)
        {
          do
          {
            v26 = *(unsigned int *)((char *)a2 + v25);
            v23 += (unsigned __int16)v26;
            v22 += v26 >> 16;
            result += *(unsigned __int16 *)((char *)a2 + v25 + 4);
            v25 += 6;
            --v24;
          }
          while (v24);
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v23 / v4;
        a4[1] = v22 / v4;
        a4[2] = result / v4;
        a4 += 3;
        v11 += v6;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        v8 = *((unsigned __int16 *)a2 + 2);
        v9 = (unsigned __int16)*a2;
        v10 = (unint64_t)*a2 >> 16;
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = v10 / v4;
        a4[2] = v8 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<6u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)0>(uint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  unsigned __int16 *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  float v25;
  unsigned __int16 *v26;
  float v27;
  float v28;
  int v29;
  float v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  int v34;
  char v35;
  int v36;
  int v37;
  float v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  int v42;
  char v43;
  int v44;
  int v45;
  float v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  int v50;
  char v51;
  int v52;

  if (a3)
  {
    v4 = (unsigned __int16 *)((char *)a2 + a3);
    v5 = (float)result;
    while (!(_DWORD)result)
    {
      v28 = 0.0;
      v27 = 0.0;
      v25 = 0.0;
LABEL_4:
      v6 = v28 / v5;
      v7 = v27 / v5;
      v8 = v25 / v5;
      v9 = LODWORD(v6) & 0x7F800000;
      v10 = HIWORD(LODWORD(v6)) & 0x8000;
      v11 = v10 | ((LODWORD(v6) & 0x7FFFFFu) >> 13);
      v12 = (((LODWORD(v6) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v6) & 0x7FFFFFu) >> 13) | v10;
      if ((LODWORD(v6) & 0x7F800000u) >> 23 < 0x71)
        v12 = HIWORD(LODWORD(v6)) & 0x8000;
      v13 = v10 | 0x7C00;
      if (v9 < 0x47000001)
        v13 = v12;
      if (!v9)
        v13 = v11;
      if (v9 == 2139095040)
        v13 = v11 | 0x7C00;
      *a4 = v13;
      v14 = LODWORD(v7) & 0x7F800000;
      v15 = HIWORD(LODWORD(v7)) & 0x8000;
      v16 = v15 | ((LODWORD(v7) & 0x7FFFFFu) >> 13);
      v17 = (((LODWORD(v7) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v7) & 0x7FFFFFu) >> 13) | v15;
      if ((LODWORD(v7) & 0x7F800000u) >> 23 < 0x71)
        v17 = HIWORD(LODWORD(v7)) & 0x8000;
      v18 = v15 | 0x7C00;
      if (v14 < 0x47000001)
        v18 = v17;
      if (!v14)
        v18 = v16;
      if (v14 == 2139095040)
        v18 = v16 | 0x7C00;
      a4[1] = v18;
      v19 = LODWORD(v8) & 0x7F800000;
      v20 = HIWORD(LODWORD(v8)) & 0x8000;
      v21 = v20 | ((LODWORD(v8) & 0x7FFFFFu) >> 13);
      v22 = (((LODWORD(v8) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v8) & 0x7FFFFFu) >> 13) | v20;
      if ((LODWORD(v8) & 0x7F800000u) >> 23 < 0x71)
        v22 = HIWORD(LODWORD(v8)) & 0x8000;
      v23 = v20 | 0x7C00;
      if (v19 < 0x47000001)
        v23 = v22;
      if (!v19)
        v23 = v21;
      if (v19 == 2139095040)
        v23 = v21 | 0x7C00;
      a4[2] = v23;
      a4 += 3;
      if (a2 >= v4)
        return result;
    }
    v24 = 0;
    v25 = 0.0;
    v26 = a2;
    v27 = 0.0;
    v28 = 0.0;
    while (1)
    {
      v31 = (__int16)*v26;
      v32 = (v31 >> 10) & 0x1F;
      v33 = v31 & 0x80000000;
      if (v32 == 31)
        break;
      v34 = v31 & 0x3FF;
      if (v32)
      {
        v35 = 0;
        v36 = (v32 << 23) + 939524096;
        goto LABEL_42;
      }
      if (v34)
      {
        v35 = -1;
        v36 = 956301312;
        do
        {
          ++v35;
          v36 -= 0x800000;
        }
        while (((v34 << v35) & 0x400) == 0);
LABEL_42:
        v37 = v36 | v33 | (v34 << (v35 + 13)) & 0x7FFFFF;
LABEL_43:
        v38 = *(float *)&v37;
        v39 = (__int16)v26[1];
        v40 = (v39 >> 10) & 0x1F;
        v41 = v39 & 0x80000000;
        if (v40 == 31)
          goto LABEL_52;
        goto LABEL_44;
      }
      v38 = 0.0;
      v39 = (__int16)v26[1];
      v40 = (v39 >> 10) & 0x1F;
      v41 = v39 & 0x80000000;
      if (v40 == 31)
      {
LABEL_52:
        v45 = v41 | ((unsigned __int16)v39 << 13) | 0x7F800000;
LABEL_53:
        v46 = *(float *)&v45;
        v47 = (__int16)v26[2];
        v48 = (v47 >> 10) & 0x1F;
        v49 = v47 & 0x80000000;
        if (v48 == 31)
          goto LABEL_31;
        goto LABEL_54;
      }
LABEL_44:
      v42 = v39 & 0x3FF;
      if (v40)
      {
        v43 = 0;
        v44 = (v40 << 23) + 939524096;
LABEL_50:
        v45 = v44 | v41 | (v42 << (v43 + 13)) & 0x7FFFFF;
        goto LABEL_53;
      }
      if (v42)
      {
        v43 = -1;
        v44 = 956301312;
        do
        {
          ++v43;
          v44 -= 0x800000;
        }
        while (((v42 << v43) & 0x400) == 0);
        goto LABEL_50;
      }
      v46 = 0.0;
      v47 = (__int16)v26[2];
      v48 = (v47 >> 10) & 0x1F;
      v49 = v47 & 0x80000000;
      if (v48 == 31)
      {
LABEL_31:
        v29 = v49 | ((unsigned __int16)v47 << 13) | 0x7F800000;
        goto LABEL_32;
      }
LABEL_54:
      v50 = v47 & 0x3FF;
      if (v48)
      {
        v51 = 0;
        v52 = (v48 << 23) + 939524096;
      }
      else
      {
        if (!v50)
        {
          v30 = 0.0;
          goto LABEL_33;
        }
        v51 = -1;
        v52 = 956301312;
        do
        {
          ++v51;
          v52 -= 0x800000;
        }
        while (((v50 << v51) & 0x400) == 0);
      }
      v29 = v52 | v49 | (v50 << (v51 + 13)) & 0x7FFFFF;
LABEL_32:
      v30 = *(float *)&v29;
LABEL_33:
      v28 = v28 + v38;
      v27 = v27 + v46;
      v25 = v25 + v30;
      v26 += 3;
      if (++v24 == (_DWORD)result)
      {
        a2 += 3 * (result - 1) + 3;
        goto LABEL_4;
      }
    }
    v37 = v33 | (*v26 << 13) | 0x7F800000;
    goto LABEL_43;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (uint64_t *)((char *)a2 + a3);
    if (result <= 1)
      v6 = 1;
    else
      v6 = result;
    do
    {
      if (v6 >= 2)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v11 = (uint64_t *)((char *)a2 + 12 * (v6 & 0xFFFFFFFE));
        v20 = v6 & 0xFFFFFFFE;
        v21 = a2;
        do
        {
          v12 += (int)*v21;
          v22 = *(uint64_t *)((char *)v21 + 12);
          v13 += (int)v22;
          v14 += *v21 >> 32;
          v23 = *v21 & 1;
          v15 += v22 >> 32;
          v16 -= v23;
          v17 -= v22 & 1;
          v18 -= v23;
          v19 -= v22 & 1;
          v21 += 3;
          v20 -= 2;
        }
        while (v20);
        v9 = v19 + v18;
        v8 = v17 + v16;
        v7 = v15 + v14;
        result = v13 + v12;
        v10 = v6 & 0xFFFFFFFE;
        if ((v6 & 0xFFFFFFFE) == v6)
          goto LABEL_8;
      }
      else
      {
        result = 0;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = a2;
      }
      v24 = v6 - v10;
      do
      {
        v25 = *v11;
        v11 = (uint64_t *)((char *)v11 + 12);
        result += (int)v25;
        v7 += v25 >> 32;
        v8 -= v25 & 1;
        v9 -= v25 & 1;
        --v24;
      }
      while (v24);
LABEL_8:
      a2 = (uint64_t *)((char *)a2 + 12 * (v4 - 1) + 12);
      *(_BYTE *)a4 = ((v9 / v4) | (v8 / v4)) & 1 | (result / v4);
      *(_BYTE *)(a4 + 1) = (unsigned __int16)(result / v4) >> 8;
      *(_BYTE *)(a4 + 2) = (result / v4) >> 16;
      *(_BYTE *)(a4 + 3) = (result / v4) >> 24;
      *(_WORD *)(a4 + 4) = v7 / v4;
      *(_BYTE *)(a4 + 6) = (v7 / v4) >> 16;
      *(_BYTE *)(a4 + 7) = (v7 / v4) >> 24;
      a4 += 12;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64x2_t v10;
  uint64_t v11;
  const float *v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  const float *v16;
  const float *v17;
  unsigned __int128 v18;
  unsigned __int128 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (int *)((char *)a2 + a3);
    v6 = 12 * (v4 - 1) + 12;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = 8;
    if ((v7 & 7) != 0)
      v8 = v7 & 7;
    if (v7 < 9)
    {
      do
      {
        v25 = *a2;
        if (result >= 2)
        {
          v25 += a2[3];
          if ((_DWORD)v4 != 2)
          {
            v25 += a2[6];
            if ((_DWORD)v4 != 3)
            {
              v25 += a2[9];
              if ((_DWORD)v4 != 4)
              {
                v25 += a2[12];
                if ((_DWORD)v4 != 5)
                {
                  v25 += a2[15];
                  if ((_DWORD)v4 != 6)
                  {
                    v25 += a2[18];
                    if ((_DWORD)v4 != 7)
                      v25 += a2[21];
                  }
                }
              }
            }
          }
        }
        a2 = (int *)((char *)a2 + v6);
        v24 = v25 / v4;
        *(_WORD *)a4 = v24;
        *(_BYTE *)(a4 + 2) = BYTE2(v24);
        *(_BYTE *)(a4 + 3) = BYTE3(v24);
        a4 += 12;
      }
      while (a2 < v5);
    }
    else
    {
      v9 = v7 - v8;
      do
      {
        v10 = 0uLL;
        v11 = v9;
        v12 = (const float *)a2;
        v13 = 0uLL;
        v14 = 0uLL;
        v15 = 0uLL;
        do
        {
          v16 = v12 + 24;
          v18 = (unsigned __int128)vld3q_f32(v12);
          v17 = v12 + 12;
          v19 = (unsigned __int128)vld3q_f32(v17);
          v13 = vaddw_high_s32(v13, (int32x4_t)v18);
          v10 = vaddw_s32(v10, *(int32x2_t *)&v18);
          v15 = vaddw_high_s32(v15, (int32x4_t)v19);
          v14 = vaddw_s32(v14, *(int32x2_t *)&v19);
          v12 = v16;
          v11 -= 8;
        }
        while (v11);
        v20 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
        v21 = v8;
        v22 = 3 * v9;
        do
        {
          v20 += a2[v22];
          v22 += 3;
          --v21;
        }
        while (v21);
        a2 = (int *)((char *)a2 + v6);
        v23 = v20 / v4;
        *(_WORD *)a4 = v23;
        *(_BYTE *)(a4 + 2) = BYTE2(v23);
        *(_BYTE *)(a4 + 3) = BYTE3(v23);
        a4 += 12;
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = &a2[a3];
    if (result <= 1)
      v6 = 1;
    else
      v6 = result;
    do
    {
      if (v6 >= 2)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v11 = (unint64_t *)&a2[12 * (v6 & 0xFFFFFFFE)];
        v20 = v6 & 0xFFFFFFFE;
        v21 = a2;
        do
        {
          v12 += *v21;
          v22 = *(_QWORD *)((char *)v21 + 12);
          v13 += v22;
          v14 += HIDWORD(*v21);
          v23 = *v21 & 1;
          v15 += HIDWORD(v22);
          v16 += v23;
          v17 += v22 & 1;
          v18 += v23;
          v19 += v22 & 1;
          v21 += 3;
          v20 -= 2;
        }
        while (v20);
        v10 = v19 + v18;
        v8 = v17 + v16;
        v7 = v15 + v14;
        result = v13 + v12;
        v9 = v6 & 0xFFFFFFFE;
        if ((v6 & 0xFFFFFFFE) == v6)
          goto LABEL_8;
      }
      else
      {
        result = 0;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = (unint64_t *)a2;
      }
      v24 = v6 - v9;
      do
      {
        v25 = *v11;
        v11 = (unint64_t *)((char *)v11 + 12);
        result += v25;
        v7 += HIDWORD(v25);
        v8 += v25 & 1;
        v10 += v25 & 1;
        --v24;
      }
      while (v24);
LABEL_8:
      a2 += 12 * (v4 - 1) + 12;
      *(_BYTE *)a4 = ((v10 / v4) | (v8 / v4)) & 1 | (result / v4);
      *(_BYTE *)(a4 + 1) = (unsigned __int16)(result / v4) >> 8;
      *(_BYTE *)(a4 + 2) = (result / v4) >> 16;
      *(_BYTE *)(a4 + 3) = (result / v4) >> 24;
      *(_WORD *)(a4 + 4) = v7 / v4;
      *(_BYTE *)(a4 + 6) = (v7 / v4) >> 16;
      *(_BYTE *)(a4 + 7) = (v7 / v4) >> 24;
      a4 += 12;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64x2_t v10;
  uint64_t v11;
  const float *v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  const float *v16;
  const float *v17;
  unsigned __int128 v18;
  unsigned __int128 v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 12 * (v4 - 1) + 12;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    v8 = 8;
    if ((v7 & 7) != 0)
      v8 = v7 & 7;
    if (v7 < 9)
    {
      do
      {
        v25 = *a2;
        if (result >= 2)
        {
          v25 += a2[3];
          if ((_DWORD)v4 != 2)
          {
            v25 += a2[6];
            if ((_DWORD)v4 != 3)
            {
              v25 += a2[9];
              if ((_DWORD)v4 != 4)
              {
                v25 += a2[12];
                if ((_DWORD)v4 != 5)
                {
                  v25 += a2[15];
                  if ((_DWORD)v4 != 6)
                  {
                    v25 += a2[18];
                    if ((_DWORD)v4 != 7)
                      v25 += a2[21];
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        v24 = v25 / v4;
        *(_WORD *)a4 = v24;
        *(_BYTE *)(a4 + 2) = BYTE2(v24);
        *(_BYTE *)(a4 + 3) = BYTE3(v24);
        a4 += 12;
      }
      while (a2 < v5);
    }
    else
    {
      v9 = v7 - v8;
      do
      {
        v10 = 0uLL;
        v11 = v9;
        v12 = (const float *)a2;
        v13 = 0uLL;
        v14 = 0uLL;
        v15 = 0uLL;
        do
        {
          v16 = v12 + 24;
          v18 = (unsigned __int128)vld3q_f32(v12);
          v17 = v12 + 12;
          v19 = (unsigned __int128)vld3q_f32(v17);
          v13 = (int64x2_t)vaddw_high_u32((uint64x2_t)v13, (uint32x4_t)v18);
          v10 = (int64x2_t)vaddw_u32((uint64x2_t)v10, *(uint32x2_t *)&v18);
          v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, (uint32x4_t)v19);
          v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)&v19);
          v12 = v16;
          v11 -= 8;
        }
        while (v11);
        v20 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
        v21 = v8;
        v22 = 3 * v9;
        do
        {
          v20 += a2[v22];
          v22 += 3;
          --v21;
        }
        while (v21);
        a2 = (unsigned int *)((char *)a2 + v6);
        v23 = v20 / v4;
        *(_WORD *)a4 = v23;
        *(_BYTE *)(a4 + 2) = BYTE2(v23);
        *(_BYTE *)(a4 + 3) = BYTE3(v23);
        a4 += 12;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<12u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)0>(uint64_t result, float32x2_t *a2, unsigned int a3, float *a4, double a5)
{
  float32x2_t *v5;
  float32x2_t v6;
  float32x2_t v7;
  float v8;
  int v9;
  float32x2_t *v10;
  float v11;

  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!(_DWORD)result)
    {
      v11 = 0.0 / *(float *)&a5;
      while (1)
      {
        *a4 = v11;
        a4[1] = v11;
        a4[2] = v11;
        a4 += 3;
      }
    }
    v5 = (float32x2_t *)((char *)a2 + a3);
    v6 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      v7 = 0;
      v8 = 0.0;
      v9 = result;
      v10 = a2;
      do
      {
        v7 = vadd_f32(v7, *v10);
        v8 = v8 + v10[1].f32[0];
        v10 = (float32x2_t *)((char *)v10 + 12);
        --v9;
      }
      while (v9);
      a2 = (float32x2_t *)((char *)a2 + 12 * (result - 1) + 12);
      *(float32x2_t *)a4 = vdiv_f32(v7, v6);
      a4[2] = v8 / *(float *)&a5;
      a4 += 3;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)16>(uint64_t result, __int16 *a2, unsigned int a3, _WORD *a4)
{
  __int16 *v4;
  float v5;
  int v6;
  int v7;
  float v8;
  __int16 *v9;
  float v10;
  float v11;
  float v12;
  int v13;
  float v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  char v19;
  int v20;
  float v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  float v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  float v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  char v34;
  int v35;
  int v36;
  char v37;
  int v38;
  int v39;
  char v40;
  int v41;
  float v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  float v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  float v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  float v54;
  unsigned int v55;
  unsigned int v56;

  if (a3)
  {
    v4 = (__int16 *)((char *)a2 + a3);
    v5 = (float)result;
    while (1)
    {
      if ((_DWORD)result)
      {
        v7 = 0;
        v8 = 0.0;
        v9 = a2;
        v10 = 0.0;
        v11 = 0.0;
        v12 = 0.0;
        while (1)
        {
          v15 = *v9;
          v16 = (v15 >> 10) & 0x1F;
          v17 = v15 & 0x80000000;
          if (v16 == 31)
          {
            LODWORD(v21) = v17 | ((unsigned __int16)*v9 << 13) | 0x7F800000;
            v22 = v9[1];
            v23 = (v22 >> 10) & 0x1F;
            v24 = v22 & 0x80000000;
            if (v23 == 31)
              goto LABEL_17;
            goto LABEL_22;
          }
          v18 = v15 & 0x3FF;
          if (v16)
            break;
          if (v18)
          {
            v19 = -1;
            v20 = 956301312;
            do
            {
              ++v19;
              v20 -= 0x800000;
            }
            while (((v18 << v19) & 0x400) == 0);
LABEL_21:
            LODWORD(v21) = v20 | v17 | (v18 << (v19 + 13)) & 0x7FFFFF;
            v22 = v9[1];
            v23 = (v22 >> 10) & 0x1F;
            v24 = v22 & 0x80000000;
            if (v23 == 31)
              goto LABEL_17;
            goto LABEL_22;
          }
          v21 = 0.0;
          v22 = v9[1];
          v23 = (v22 >> 10) & 0x1F;
          v24 = v22 & 0x80000000;
          if (v23 == 31)
          {
LABEL_17:
            LODWORD(v25) = v24 | ((unsigned __int16)v22 << 13) | 0x7F800000;
            v26 = v9[2];
            v27 = (v26 >> 10) & 0x1F;
            v28 = v26 & 0x80000000;
            if (v27 == 31)
              goto LABEL_18;
            goto LABEL_29;
          }
LABEL_22:
          v33 = v22 & 0x3FF;
          if (v23)
          {
            v34 = 0;
            v35 = (v23 << 23) + 939524096;
            goto LABEL_28;
          }
          if (v33)
          {
            v34 = -1;
            v35 = 956301312;
            do
            {
              ++v34;
              v35 -= 0x800000;
            }
            while (((v33 << v34) & 0x400) == 0);
LABEL_28:
            LODWORD(v25) = v35 | v24 | (v33 << (v34 + 13)) & 0x7FFFFF;
            v26 = v9[2];
            v27 = (v26 >> 10) & 0x1F;
            v28 = v26 & 0x80000000;
            if (v27 == 31)
              goto LABEL_18;
            goto LABEL_29;
          }
          v25 = 0.0;
          v26 = v9[2];
          v27 = (v26 >> 10) & 0x1F;
          v28 = v26 & 0x80000000;
          if (v27 == 31)
          {
LABEL_18:
            LODWORD(v29) = v28 | ((unsigned __int16)v26 << 13) | 0x7F800000;
            v30 = v9[3];
            v31 = (v30 >> 10) & 0x1F;
            v32 = v30 & 0x80000000;
            if (v31 == 31)
              goto LABEL_7;
            goto LABEL_36;
          }
LABEL_29:
          v36 = v26 & 0x3FF;
          if (v27)
          {
            v37 = 0;
            v38 = (v27 << 23) + 939524096;
            goto LABEL_35;
          }
          if (v36)
          {
            v37 = -1;
            v38 = 956301312;
            do
            {
              ++v37;
              v38 -= 0x800000;
            }
            while (((v36 << v37) & 0x400) == 0);
LABEL_35:
            LODWORD(v29) = v38 | v28 | (v36 << (v37 + 13)) & 0x7FFFFF;
            v30 = v9[3];
            v31 = (v30 >> 10) & 0x1F;
            v32 = v30 & 0x80000000;
            if (v31 == 31)
              goto LABEL_7;
            goto LABEL_36;
          }
          v29 = 0.0;
          v30 = v9[3];
          v31 = (v30 >> 10) & 0x1F;
          v32 = v30 & 0x80000000;
          if (v31 == 31)
          {
LABEL_7:
            v13 = v32 | ((unsigned __int16)v30 << 13) | 0x7F800000;
            goto LABEL_8;
          }
LABEL_36:
          v39 = v30 & 0x3FF;
          if (v31)
          {
            v40 = 0;
            v41 = (v31 << 23) + 939524096;
          }
          else
          {
            if (!v39)
            {
              v14 = 0.0;
              goto LABEL_9;
            }
            v40 = -1;
            v41 = 956301312;
            do
            {
              ++v40;
              v41 -= 0x800000;
            }
            while (((v39 << v40) & 0x400) == 0);
          }
          v13 = v41 | v32 | (v39 << (v40 + 13)) & 0x7FFFFF;
LABEL_8:
          v14 = *(float *)&v13;
LABEL_9:
          v12 = v12 + v21;
          v11 = v11 + v25;
          v10 = v10 + v29;
          v8 = v8 + v14;
          v9 += 4;
          if (++v7 == (_DWORD)result)
          {
            a2 += 4 * (result - 1) + 4;
            goto LABEL_52;
          }
        }
        v19 = 0;
        v20 = (v16 << 23) + 939524096;
        goto LABEL_21;
      }
      v12 = 0.0;
      v11 = 0.0;
      v10 = 0.0;
      v8 = 0.0;
LABEL_52:
      v42 = v12 / v5;
      v43 = LODWORD(v42) & 0x7F800000;
      v44 = LODWORD(v42) & 0x7FFFFF;
      v45 = HIWORD(LODWORD(v42)) & 0x8000;
      if ((LODWORD(v42) & 0x7F800000) == 0x7F800000)
      {
        v45 |= (v44 >> 13) | 0x7C00;
      }
      else if (v43)
      {
        if (v43 < 0x47000001)
        {
          if (v43 >> 23 >= 0x71)
            v45 |= ((v43 >> 13) + 0x4000) | (v44 >> 13);
        }
        else
        {
          LOWORD(v45) = v45 | 0x7C00;
        }
      }
      else
      {
        v45 |= v44 >> 13;
      }
      v46 = v11 / v5;
      *a4 = v45;
      v47 = LODWORD(v46) & 0x7F800000;
      v48 = LODWORD(v46) & 0x7FFFFF;
      v49 = HIWORD(LODWORD(v46)) & 0x8000;
      if ((LODWORD(v46) & 0x7F800000) == 0x7F800000)
      {
        v49 |= (v48 >> 13) | 0x7C00;
      }
      else if (v47)
      {
        if (v47 < 0x47000001)
        {
          if (v47 >> 23 >= 0x71)
            v49 |= ((v47 >> 13) + 0x4000) | (v48 >> 13);
        }
        else
        {
          LOWORD(v49) = v49 | 0x7C00;
        }
      }
      else
      {
        v49 |= v48 >> 13;
      }
      v50 = v10 / v5;
      a4[1] = v49;
      v51 = LODWORD(v50) & 0x7F800000;
      v52 = LODWORD(v50) & 0x7FFFFF;
      v53 = HIWORD(LODWORD(v50)) & 0x8000;
      if ((LODWORD(v50) & 0x7F800000) == 0x7F800000)
      {
        v53 |= (v52 >> 13) | 0x7C00;
      }
      else if (v51)
      {
        if (v51 < 0x47000001)
        {
          if (v51 >> 23 >= 0x71)
            v53 |= ((v51 >> 13) + 0x4000) | (v52 >> 13);
        }
        else
        {
          LOWORD(v53) = v53 | 0x7C00;
        }
      }
      else
      {
        v53 |= v52 >> 13;
      }
      v54 = v8 / v5;
      a4[2] = v53;
      v55 = LODWORD(v54) & 0x7F800000;
      v56 = LODWORD(v54) & 0x7FFFFF;
      v6 = HIWORD(LODWORD(v54)) & 0x8000;
      if ((LODWORD(v54) & 0x7F800000) == 0x7F800000)
        break;
      if (v55)
      {
        if (v55 < 0x47000001)
        {
          if (v55 >> 23 >= 0x71)
            v6 |= ((v55 >> 13) + 0x4000) | (v56 >> 13);
          goto LABEL_4;
        }
        goto LABEL_82;
      }
      v6 |= v56 >> 13;
LABEL_4:
      a4[3] = v6;
      a4 += 4;
      if (a2 >= v4)
        return result;
    }
    v6 |= v56 >> 13;
LABEL_82:
    LOWORD(v6) = v6 | 0x7C00;
    goto LABEL_4;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<16u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)32>(uint64_t result, unint64_t a2, unsigned int a3, int32x4_t *a4, double a5)
{
  unint64_t v5;
  float32x4_t v6;
  uint64_t v7;
  float32x4_t v8;
  int32x4_t i;

  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!(_DWORD)result)
    {
      *(float *)&a5 = 0.0 / *(float *)&a5;
      for (i = vdupq_lane_s32(*(int32x2_t *)&a5, 0); ; *a4++ = i)
        ;
    }
    v5 = a2 + a3;
    v6 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      v7 = 0;
      v8 = 0uLL;
      do
        v8 = vaddq_f32(v8, *(float32x4_t *)(a2 + 16 * v7++));
      while ((_DWORD)result != (_DWORD)v7);
      a2 += 16 * (result - 1) + 16;
      *(float32x4_t *)a4++ = vdivq_f32(v8, v6);
    }
    while (a2 < v5);
  }
  return result;
}

unint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull>(unint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  int v4;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  const char *v17;
  uint16x8_t v18;
  uint32x4_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  uint32x4_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  uint64_t v33;
  int8x16_t v34;
  const char *v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int8x16_t v41;
  uint16x8_t v42;
  uint32x4_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  uint32x4_t v47;
  int8x16_t v48;
  uint16x8_t v49;
  uint32x4_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  uint32x4_t v54;
  int8x16_t v55;
  uint16x8_t v56;
  uint32x4_t v57;
  uint32x4_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16_t v69;
  int8x16_t v70;
  int8x16_t v71;
  int8x16_t v72;
  int8x16_t v73;
  uint64_t v74;
  int v75;
  int8x16_t v76;
  int8x16x2_t v77;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned __int16 *)((char *)a2 + a3);
    v6 = 2 * (v4 - 1) + 2;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 >= 8)
    {
      while (1)
      {
        if (v7 >= 0x10)
        {
          v32.i64[0] = -1;
          v32.i64[1] = -1;
          v33 = v7 & 0xFFFFFFF0;
          v34.i64[0] = -1;
          v34.i64[1] = -1;
          v35 = (const char *)a2;
          v36.i64[0] = -1;
          v36.i64[1] = -1;
          v37.i64[0] = -1;
          v37.i64[1] = -1;
          v38.i64[0] = -1;
          v38.i64[1] = -1;
          v39.i64[0] = -1;
          v39.i64[1] = -1;
          v40.i64[0] = -1;
          v40.i64[1] = -1;
          v41.i64[0] = -1;
          v41.i64[1] = -1;
          do
          {
            v77 = vld2q_s8(v35);
            v35 += 32;
            v42 = vmovl_high_u8((uint8x16_t)v77.val[0]);
            v43 = vmovl_high_u16(v42);
            v44.i64[0] = v43.u32[2];
            v44.i64[1] = v43.u32[3];
            v45 = v44;
            v44.i64[0] = v43.u32[0];
            v44.i64[1] = v43.u32[1];
            v46 = v44;
            v47 = vmovl_u16(*(uint16x4_t *)v42.i8);
            v44.i64[0] = v47.u32[2];
            v44.i64[1] = v47.u32[3];
            v48 = v44;
            v49 = vmovl_u8(*(uint8x8_t *)v77.val[0].i8);
            v50 = vmovl_high_u16(v49);
            v44.i64[0] = v50.u32[2];
            v44.i64[1] = v50.u32[3];
            v51 = v44;
            v44.i64[0] = v47.u32[0];
            v44.i64[1] = v47.u32[1];
            v52 = v44;
            v44.i64[0] = v50.u32[0];
            v44.i64[1] = v50.u32[1];
            v53 = v44;
            v54 = vmovl_u16(*(uint16x4_t *)v49.i8);
            v44.i64[0] = v54.u32[2];
            v44.i64[1] = v54.u32[3];
            v55 = v44;
            v44.i64[0] = v54.u32[0];
            v44.i64[1] = v54.u32[1];
            v56 = vmovl_u8(*(uint8x8_t *)v77.val[1].i8);
            v57 = vmovl_u16(*(uint16x4_t *)v56.i8);
            v58 = vmovl_high_u16(v56);
            v77.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v77.val[1]);
            v77.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v77.val[0].i8);
            v77.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v77.val[0]);
            v59 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v77.val[0], 8uLL);
            v60 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v77.val[1], 8uLL);
            v61 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v57.i8, 8uLL), v44);
            v62 = vorrq_s8((int8x16_t)vshll_high_n_u32(v57, 8uLL), v55);
            v63 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v58.i8, 8uLL), v53);
            v77.val[1] = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v77.val[1].i8, 8uLL), v52);
            v64 = vorrq_s8((int8x16_t)vshll_high_n_u32(v58, 8uLL), v51);
            v65 = vorrq_s8(v60, v48);
            v77.val[0] = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v77.val[0].i8, 8uLL), v46);
            v66 = vorrq_s8(v59, v45);
            v41 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v66, (uint64x2_t)v41), v41, v66);
            v40 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v77.val[0], (uint64x2_t)v40), v40, v77.val[0]);
            v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v65, (uint64x2_t)v39), v39, v65);
            v37 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v64, (uint64x2_t)v37), v37, v64);
            v38 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v77.val[1], (uint64x2_t)v38), v38, v77.val[1]);
            v36 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v63, (uint64x2_t)v36), v36, v63);
            v34 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v62, (uint64x2_t)v34), v34, v62);
            v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v61, (uint64x2_t)v32), v32, v61);
            v33 -= 16;
          }
          while (v33);
          v67 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v32), v32, v38);
          v68 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v36), v36, v40);
          v69 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v68, (uint64x2_t)v67), v67, v68);
          v70 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v39, (uint64x2_t)v34), v34, v39);
          v71 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v41, (uint64x2_t)v37), v37, v41);
          v72 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v71, (uint64x2_t)v70), v70, v71);
          v73 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v72, (uint64x2_t)v69), v69, v72);
          v71.i64[0] = vextq_s8(v73, v73, 8uLL).u64[0];
          v10 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v71.u64[0], v73.u64[0]), *(int8x8_t *)v73.i8, *(int8x8_t *)v71.i8);
          if ((v7 & 0xFFFFFFF0) == v7)
            goto LABEL_30;
          v9 = v7 & 0xFFFFFFF0;
          result = v9;
          if ((v7 & 8) == 0)
            goto LABEL_41;
        }
        else
        {
          v9 = 0;
          v10 = -1;
        }
        v11 = v9;
        v12 = (int8x16_t)vdupq_n_s64(v10);
        v13 = v9 - (v7 & 0xFFFFFFF8);
        v14 = v12;
        v15 = v12;
        v16 = v12;
        do
        {
          v17 = (const char *)&a2[v11];
          v76 = (int8x16_t)vld2_s8(v17);
          v18 = vmovl_u8(*(uint8x8_t *)v76.i8);
          v19 = vmovl_high_u16(v18);
          v20.i64[0] = v19.u32[2];
          v20.i64[1] = v19.u32[3];
          v21 = v20;
          v20.i64[0] = v19.u32[0];
          v20.i64[1] = v19.u32[1];
          v22 = v20;
          v23 = vmovl_u16(*(uint16x4_t *)v18.i8);
          v20.i64[0] = v23.u32[2];
          v20.i64[1] = v23.u32[3];
          v24 = v20;
          v20.i64[0] = v23.u32[0];
          v20.i64[1] = v23.u32[1];
          v76 = (int8x16_t)vmovl_u8((uint8x8_t)v76.u64[1]);
          *(uint32x4_t *)((char *)&v76 + 8) = vmovl_u16(*(uint16x4_t *)v76.i8);
          v76 = (int8x16_t)vmovl_high_u16((uint16x8_t)v76);
          v25 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v76, 8uLL);
          v26 = (int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v76 + 8), 8uLL);
          *(int8x16_t *)((char *)&v76 + 8) = vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v76.u64[1], 8uLL), v20);
          v27 = vorrq_s8(v26, v24);
          v76 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v76.i8, 8uLL), v22);
          v28 = vorrq_s8(v25, v21);
          v16 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v28, (uint64x2_t)v16), v16, v28);
          v15 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v76, (uint64x2_t)v15), v15, v76);
          v14 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v27, (uint64x2_t)v14), v14, v27);
          v12 = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)((char *)&v76 + 8), (uint64x2_t)v12), v12, *(int8x16_t *)((char *)&v76 + 8));
          v11 += 8;
          v13 += 8;
        }
        while (v13);
        v29 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v12), v12, v15);
        v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v16, (uint64x2_t)v14), v14, v16);
        v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v30, (uint64x2_t)v29), v29, v30);
        v30.i64[0] = vextq_s8(v31, v31, 8uLL).u64[0];
        v10 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v30.u64[0], v31.u64[0]), *(int8x8_t *)v31.i8, *(int8x8_t *)v30.i8);
        result = v7 & 0xFFFFFFF8;
        if (result != v7)
        {
LABEL_41:
          v74 = result;
          v75 = v4 - result;
          do
          {
            result = a2[v74];
            if (v10 >= result)
              v10 = a2[v74];
            ++v74;
            --v75;
          }
          while (v75);
        }
LABEL_30:
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v10;
        if (a2 >= v5)
          return result;
      }
    }
    do
    {
      v8 = *a2;
      if (result >= 2)
      {
        if (v8 >= a2[1])
          v8 = a2[1];
        if (v4 != 2)
        {
          if (v8 >= a2[2])
            v8 = a2[2];
          if (v4 != 3)
          {
            if (v8 >= a2[3])
              v8 = a2[3];
            if (v4 != 4)
            {
              if (v8 >= a2[4])
                v8 = a2[4];
              if (v4 != 5)
              {
                if (v8 >= a2[5])
                  v8 = a2[5];
                if (v4 != 6 && v8 >= a2[6])
                  LOWORD(v8) = a2[6];
              }
            }
          }
        }
      }
      a2 = (unsigned __int16 *)((char *)a2 + v6);
      *a4++ = v8;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<float>::resolve<4u,4u,true,63ull,32ull,0ull,0ull>(uint64_t result, unint64_t a2, unsigned int a3, float *a4)
{
  int v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  float v9;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = a2 + a3;
    v6 = 4 * (v4 - 1) + 4;
    v7 = result;
    if (result <= 1uLL)
      v7 = 1;
    do
    {
      v8 = 0;
      v9 = 3.4028e38;
      do
      {
        if (v9 >= *(float *)(a2 + 4 * v8))
          v9 = *(float *)(a2 + 4 * v8);
        ++v8;
      }
      while (v7 != (_DWORD)v8);
      a2 += v6;
      *a4++ = v9;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,0ull,0ull>(uint64_t result, uint32x4_t *a2, unsigned int a3, uint64_t a4)
{
  int v4;
  uint32x4_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint32x4_t *v9;
  int8x16_t v10;
  uint32x4_t *v11;
  uint64_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint32x4_t v16;
  uint32x4_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  unsigned __int32 v25;
  uint32x4_t *v26;
  int8x16_t v27;
  uint64_t v28;
  uint32x4_t *v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  uint32x4_t v33;
  uint32x4_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int8x16_t v41;
  unint64_t v42;
  uint64_t v43;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (uint32x4_t *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v25 = (unsigned __int32)a2->i32[0] >> 8;
        if (result >= 2)
        {
          if (v25 >= (unsigned __int32)a2->i32[1] >> 8)
            v25 = (unsigned __int32)a2->i32[1] >> 8;
          if (v4 != 2)
          {
            if (v25 >= (unsigned __int32)a2->i32[2] >> 8)
              v25 = (unsigned __int32)a2->i32[2] >> 8;
            if (v4 != 3)
            {
              if (v25 >= (unsigned __int32)a2->i32[3] >> 8)
                v25 = (unsigned __int32)a2->i32[3] >> 8;
              if (v4 != 4)
              {
                if (v25 >= (unsigned __int32)a2[1].i32[0] >> 8)
                  v25 = (unsigned __int32)a2[1].i32[0] >> 8;
                if (v4 != 5)
                {
                  if (v25 >= (unsigned __int32)a2[1].i32[1] >> 8)
                    v25 = (unsigned __int32)a2[1].i32[1] >> 8;
                  if (v4 != 6 && v25 >= (unsigned __int32)a2[1].i32[2] >> 8)
                    v25 = (unsigned __int32)a2[1].i32[2] >> 8;
                }
              }
            }
          }
        }
        a2 = (uint32x4_t *)((char *)a2 + v6);
        *(_BYTE *)a4 = 0;
        *(_WORD *)(a4 + 1) = v25;
        *(_BYTE *)(a4 + 3) = BYTE2(v25);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = a2 + 1;
        do
        {
          v10.i64[0] = -1;
          v10.i64[1] = -1;
          v11 = v9;
          v12 = v8;
          v13.i64[0] = -1;
          v13.i64[1] = -1;
          v14.i64[0] = -1;
          v14.i64[1] = -1;
          v15.i64[0] = -1;
          v15.i64[1] = -1;
          do
          {
            v16 = vshrq_n_u32(v11[-1], 8uLL);
            v17 = vshrq_n_u32(*v11, 8uLL);
            v18.i64[0] = v16.u32[0];
            v18.i64[1] = v16.u32[1];
            v19 = v18;
            v18.i64[0] = v16.u32[2];
            v18.i64[1] = v16.u32[3];
            v20 = v18;
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            v21 = v18;
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            v13 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v20, (uint64x2_t)v13), v13, v20);
            v10 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v19, (uint64x2_t)v10), v10, v19);
            v15 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v18, (uint64x2_t)v15), v15, v18);
            v14 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v21, (uint64x2_t)v14), v14, v21);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          v22 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v14, (uint64x2_t)v10), v10, v14);
          v23 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v13), v13, v15);
          v24 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v23, (uint64x2_t)v22), v22, v23);
          v23.i64[0] = vextq_s8(v24, v24, 8uLL).u64[0];
          *(int8x8_t *)v24.i8 = vbsl_s8((int8x8_t)vcgtd_u64(v23.u64[0], v24.u64[0]), *(int8x8_t *)v24.i8, *(int8x8_t *)v23.i8);
          a2 = (uint32x4_t *)((char *)a2 + v6);
          *(_BYTE *)a4 = 0;
          *(_WORD *)(a4 + 1) = v24.i16[0];
          *(_BYTE *)(a4 + 3) = v24.i8[2];
          a4 += 4;
          v9 = (uint32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v26 = a2 + 1;
        do
        {
          v27.i64[0] = -1;
          v27.i64[1] = -1;
          v28 = v7 & 0xFFFFFFF8;
          v29 = v26;
          v30.i64[0] = -1;
          v30.i64[1] = -1;
          v31.i64[0] = -1;
          v31.i64[1] = -1;
          v32.i64[0] = -1;
          v32.i64[1] = -1;
          do
          {
            v33 = vshrq_n_u32(v29[-1], 8uLL);
            v34 = vshrq_n_u32(*v29, 8uLL);
            v35.i64[0] = v33.u32[0];
            v35.i64[1] = v33.u32[1];
            v36 = v35;
            v35.i64[0] = v33.u32[2];
            v35.i64[1] = v33.u32[3];
            v37 = v35;
            v35.i64[0] = v34.u32[0];
            v35.i64[1] = v34.u32[1];
            v38 = v35;
            v35.i64[0] = v34.u32[2];
            v35.i64[1] = v34.u32[3];
            v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v30), v30, v37);
            v27 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v36, (uint64x2_t)v27), v27, v36);
            v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v35, (uint64x2_t)v32), v32, v35);
            v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v31), v31, v38);
            v29 += 2;
            v28 -= 8;
          }
          while (v28);
          v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v31, (uint64x2_t)v27), v27, v31);
          v40 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v32, (uint64x2_t)v30), v30, v32);
          v41 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v39, v40);
          v40.i64[0] = vextq_s8(v41, v41, 8uLL).u64[0];
          v42 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v40.u64[0], v41.u64[0]), *(int8x8_t *)v41.i8, *(int8x8_t *)v40.i8);
          v43 = v7 & 0xFFFFFFF8;
          do
          {
            if (v42 >= (unint64_t)a2->u32[v43] >> 8)
              v42 = (unint64_t)a2->u32[v43] >> 8;
            ++v43;
          }
          while ((_DWORD)v7 != (_DWORD)v43);
          a2 = (uint32x4_t *)((char *)a2 + v6);
          *(_BYTE *)a4 = 0;
          *(_WORD *)(a4 + 1) = v42;
          *(_BYTE *)(a4 + 3) = BYTE2(v42);
          a4 += 4;
          v26 = (uint32x4_t *)((char *)v26 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,39ull,32ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int8x16_t v10;
  int8x16_t v11;
  int64x2_t v12;
  unsigned int *v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  __int128 v21;
  int8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int *v41;
  int8x16_t v42;
  int8x16_t v43;
  int64x2_t v44;
  uint64_t v45;
  unsigned int *v46;
  int64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  __int128 v53;
  int8x16_t v54;
  int8x16_t v55;
  int8x16_t v56;
  int8x16_t v57;
  int8x16_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x8_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = (unsigned int *)((char *)a2 + a3);
    v6 = 4 * (v4 - 1) + 4;
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (v7 <= 7)
    {
      do
      {
        v33 = (unint64_t)*a2 >> 8;
        v34 = *a2;
        if (result >= 2)
        {
          v35 = a2[1];
          if (v33 >= v35 >> 8)
            v33 = v35 >> 8;
          v34 += v35;
          if ((_DWORD)v4 != 2)
          {
            v36 = a2[2];
            if (v33 >= v36 >> 8)
              v33 = v36 >> 8;
            v34 += v36;
            if ((_DWORD)v4 != 3)
            {
              v37 = a2[3];
              if (v33 >= v37 >> 8)
                v33 = v37 >> 8;
              v34 += v37;
              if ((_DWORD)v4 != 4)
              {
                v38 = a2[4];
                if (v33 >= v38 >> 8)
                  v33 = v38 >> 8;
                v34 += v38;
                if ((_DWORD)v4 != 5)
                {
                  v39 = a2[5];
                  if (v33 >= v39 >> 8)
                    v33 = v39 >> 8;
                  v34 += v39;
                  if ((_DWORD)v4 != 6)
                  {
                    v40 = a2[6];
                    if (v33 >= v40 >> 8)
                      v33 = v40 >> 8;
                    v34 += v40;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *(_BYTE *)a4 = v34 / v4;
        *(_WORD *)(a4 + 1) = v33;
        *(_BYTE *)(a4 + 3) = BYTE2(v33);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        v9 = a2 + 4;
        v10.i64[0] = 255;
        v10.i64[1] = 255;
        do
        {
          v11.i64[0] = -1;
          v11.i64[1] = -1;
          v12 = 0uLL;
          v13 = v9;
          v14 = v8;
          v15 = 0uLL;
          v16 = 0uLL;
          v17 = 0uLL;
          v18.i64[0] = -1;
          v18.i64[1] = -1;
          v19.i64[0] = -1;
          v19.i64[1] = -1;
          v20.i64[0] = -1;
          v20.i64[1] = -1;
          do
          {
            v21 = *((_OWORD *)v13 - 1);
            v22.i64[0] = DWORD2(v21);
            v22.i64[1] = HIDWORD(v21);
            v23 = v22;
            v22.i64[0] = v21;
            v22.i64[1] = DWORD1(v21);
            v24 = v22;
            v22.i64[0] = *((_QWORD *)v13 + 1);
            v22.i64[1] = HIDWORD(*(_OWORD *)v13);
            v25 = v22;
            v22.i64[0] = *(_OWORD *)v13;
            v22.i64[1] = HIDWORD(*(_QWORD *)v13);
            v26 = (int8x16_t)vshrq_n_u64((uint64x2_t)v24, 8uLL);
            v27 = (int8x16_t)vshrq_n_u64((uint64x2_t)v23, 8uLL);
            v28 = (int8x16_t)vshrq_n_u64((uint64x2_t)v22, 8uLL);
            v29 = (int8x16_t)vshrq_n_u64((uint64x2_t)v25, 8uLL);
            v18 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v27, (uint64x2_t)v18), v18, v27);
            v11 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v26, (uint64x2_t)v11), v11, v26);
            v20 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v29, (uint64x2_t)v20), v20, v29);
            v19 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v28, (uint64x2_t)v19), v19, v28);
            v15 = vaddq_s64((int64x2_t)vandq_s8(v23, v10), v15);
            v12 = vaddq_s64((int64x2_t)vandq_s8(v24, v10), v12);
            v17 = vaddq_s64((int64x2_t)vandq_s8(v25, v10), v17);
            v16 = vaddq_s64((int64x2_t)vandq_s8(v22, v10), v16);
            v13 += 8;
            v14 -= 8;
          }
          while (v14);
          v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v19, (uint64x2_t)v11), v11, v19);
          v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v20, (uint64x2_t)v18), v18, v20);
          v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v31, (uint64x2_t)v30), v30, v31);
          v31.i64[0] = vextq_s8(v32, v32, 8uLL).u64[0];
          *(int8x8_t *)v32.i8 = vbsl_s8((int8x8_t)vcgtd_u64(v31.u64[0], v32.u64[0]), *(int8x8_t *)v32.i8, *(int8x8_t *)v31.i8);
          a2 = (unsigned int *)((char *)a2 + v6);
          *(_BYTE *)a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v12), vaddq_s64(v17, v15))) / v4;
          *(_WORD *)(a4 + 1) = v32.i16[0];
          *(_BYTE *)(a4 + 3) = v32.i8[2];
          a4 += 4;
          v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        v41 = a2 + 4;
        v42.i64[0] = 255;
        v42.i64[1] = 255;
        do
        {
          v43.i64[0] = -1;
          v43.i64[1] = -1;
          v44 = 0uLL;
          v45 = v8;
          v46 = v41;
          v47 = 0uLL;
          v48 = 0uLL;
          v49 = 0uLL;
          v50.i64[0] = -1;
          v50.i64[1] = -1;
          v51.i64[0] = -1;
          v51.i64[1] = -1;
          v52.i64[0] = -1;
          v52.i64[1] = -1;
          do
          {
            v53 = *((_OWORD *)v46 - 1);
            v54.i64[0] = DWORD2(v53);
            v54.i64[1] = HIDWORD(v53);
            v55 = v54;
            v54.i64[0] = v53;
            v54.i64[1] = DWORD1(v53);
            v56 = v54;
            v54.i64[0] = *((_QWORD *)v46 + 1);
            v54.i64[1] = HIDWORD(*(_OWORD *)v46);
            v57 = v54;
            v54.i64[0] = *(_OWORD *)v46;
            v54.i64[1] = HIDWORD(*(_QWORD *)v46);
            v58 = (int8x16_t)vshrq_n_u64((uint64x2_t)v56, 8uLL);
            v59 = (int8x16_t)vshrq_n_u64((uint64x2_t)v55, 8uLL);
            v60 = (int8x16_t)vshrq_n_u64((uint64x2_t)v54, 8uLL);
            v61 = (int8x16_t)vshrq_n_u64((uint64x2_t)v57, 8uLL);
            v50 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v59, (uint64x2_t)v50), v50, v59);
            v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v58, (uint64x2_t)v43), v43, v58);
            v52 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v61, (uint64x2_t)v52), v52, v61);
            v51 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v60, (uint64x2_t)v51), v51, v60);
            v47 = vaddq_s64((int64x2_t)vandq_s8(v55, v42), v47);
            v44 = vaddq_s64((int64x2_t)vandq_s8(v56, v42), v44);
            v49 = vaddq_s64((int64x2_t)vandq_s8(v57, v42), v49);
            v48 = vaddq_s64((int64x2_t)vandq_s8(v54, v42), v48);
            v46 += 8;
            v45 -= 8;
          }
          while (v45);
          v62 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v51, (uint64x2_t)v43), v43, v51);
          v63 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v52, (uint64x2_t)v50), v50, v52);
          v64 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v63, (uint64x2_t)v62), v62, v63);
          v63.i64[0] = vextq_s8(v64, v64, 8uLL).u64[0];
          v65 = vbsl_s8((int8x8_t)vcgtd_u64(v63.u64[0], v64.u64[0]), *(int8x8_t *)v64.i8, *(int8x8_t *)v63.i8);
          v66 = vaddvq_s64(vaddq_s64(vaddq_s64(v48, v44), vaddq_s64(v49, v47)));
          v67 = v8;
          do
          {
            v68 = a2[v67];
            if (*(_QWORD *)&v65 >= v68 >> 8)
              v65 = (int8x8_t)(v68 >> 8);
            v66 += v68;
            ++v67;
          }
          while ((_DWORD)v4 != (_DWORD)v67);
          a2 = (unsigned int *)((char *)a2 + v6);
          *(_BYTE *)a4 = v66 / v4;
          *(_WORD *)(a4 + 1) = v65.i16[0];
          *(_BYTE *)(a4 + 3) = v65.i8[2];
          a4 += 4;
          v41 = (unsigned int *)((char *)v41 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<float>::resolve<8u,8u,true,63ull,32ull,31ull,24ull>(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  uint64_t v10;

  if (result <= 1)
    v4 = 1;
  else
    v4 = result;
  if (a3)
  {
    v5 = a2 + a3;
    v6 = result;
    if (result <= 1uLL)
      v6 = 1;
    do
    {
      v7 = 0;
      v8 = 0;
      v9 = 3.4028e38;
      do
      {
        v10 = *(_QWORD *)(a2 + 8 * v7);
        if (v9 >= *((float *)&v10 + 1))
          LODWORD(v9) = HIDWORD(*(_QWORD *)(a2 + 8 * v7));
        v8 += BYTE3(v10);
        ++v7;
      }
      while (v6 != (_DWORD)v7);
      a2 += 8 * (v4 - 1) + 8;
      *(_WORD *)a4 = 0;
      *(_BYTE *)(a4 + 2) = 0;
      *(_BYTE *)(a4 + 3) = v8 / v4;
      *(float *)(a4 + 4) = v9;
      a4 += 8;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::IsLumAlphaFormatTextureFilterable(GPUTools::GL *this, int a2, unsigned int a3)
{
  int v3;
  uint64_t result;
  char v5;
  unsigned int v6;

  v3 = (int)this;
  result = 1;
  v5 = v3 - 22;
  if ((v3 - 34838) <= 9)
  {
    if (((1 << v5) & 0xD) != 0)
      return 0;
    if (((1 << v5) & 0x340) != 0)
    {
      if (a2 > 2)
        return 1;
      else
        return a3;
    }
  }
  v6 = v3 - 32828;
  if (v6 > 9 || ((1 << v6) & 0x211) == 0)
    return 0;
  return result;
}

uint64_t GPUTools::GL::IsFormatColorRenderable(GPUTools::GL *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v4;
  uint64_t v5;
  uint64_t result;

  v4 = &GPUTools::GL::sInternalFormatsTable;
  v5 = 6660;
  while (*v4 != (_DWORD)this)
  {
    v4 += 15;
    v5 -= 60;
    if (!v5)
    {
      v4 = (int *)&GPUTools::GL::sUnknownFormat;
      break;
    }
  }
  if ((v4[14] & 2) != 0)
    return 1;
  if ((int)this <= 34835)
  {
    a4 = a2;
    switch((int)this)
    {
      case 33325:
      case 33327:
        return a4;
      case 33326:
      case 33328:
        result = a3;
        break;
      default:
        return 0;
    }
  }
  else
  {
    if ((int)this <= 35897)
    {
      a4 = a3;
      if (((_DWORD)this - 34836) < 2)
        return a4;
      a4 = a2;
      if (((_DWORD)this - 34842) < 2)
        return a4;
      return 0;
    }
    if ((_DWORD)this != 35898)
    {
      if ((_DWORD)this == 35901)
        return a4;
      return 0;
    }
    return a3 | a4;
  }
  return result;
}

BOOL GPUTools::GL::IsFormatDepthRenderable(GPUTools::GL *this)
{
  return ((_DWORD)this - 33189) < 2 || ((_DWORD)this - 36012) < 2 || (_DWORD)this == 35056;
}

BOOL GPUTools::GL::IsFormatStencilRenderable(GPUTools::GL *this)
{
  _BOOL4 v1;

  v1 = (_DWORD)this == 36013 || (_DWORD)this == 36168;
  return (_DWORD)this == 35056 || v1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x242621A90);
}

uint64_t *GPUTools::SM::GL::GetEnumName(GPUTools::SM::GL *this)
{
  uint64_t *result;
  int v2;

  v2 = (int)this;
  if (GPUTools::SM::GL::GetEnumName(int)::sEnumNameMappingOnce != -1)
    dispatch_once(&GPUTools::SM::GL::GetEnumName(int)::sEnumNameMappingOnce, &__block_literal_global_0);
  result = std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::find<int>((_QWORD *)GPUTools::SM::GL::GetEnumName(int)::sEnumNameMapping, &v2);
  if (result)
    return (uint64_t *)result[3];
  return result;
}

uint64_t GPUTools::SM::GL::GetInternalBindingEnum(GPUTools::SM::GL *this)
{
  if ((int)this > 35631)
  {
    if ((int)this <= 36005)
    {
      if ((int)this <= 35724)
      {
        if ((_DWORD)this == 35632)
          return 4294966774;
        if ((_DWORD)this == 35633)
          return 4294966775;
      }
      else
      {
        switch((_DWORD)this)
        {
          case 0x8B8D:
            return 4294966779;
          case 0x8C1D:
            return 4294966794;
          case 0x8C8F:
            return 4294966785;
        }
      }
    }
    else if ((int)this > 36388)
    {
      switch((_DWORD)this)
      {
        case 0x8E25:
          return 4294966776;
        case 0x8F36:
          return 4294966789;
        case 0x8F37:
          return 4294966788;
      }
    }
    else
    {
      switch((_DWORD)this)
      {
        case 0x8CA6:
          return 4294966781;
        case 0x8CA7:
          return 4294966783;
        case 0x8CAA:
          return 4294966780;
      }
    }
  }
  else if ((int)this <= 34963)
  {
    if ((int)this <= 33369)
    {
      if ((_DWORD)this == 32873)
        return 4294966796;
      if ((_DWORD)this == 32874)
        return 4294966793;
    }
    else
    {
      switch((_DWORD)this)
      {
        case 0x825A:
          return 4294966777;
        case 0x8514:
          return 4294966795;
        case 0x85B5:
          return 4294966778;
      }
    }
  }
  else if ((int)this > 35054)
  {
    switch((_DWORD)this)
    {
      case 0x88EF:
        return 4294966786;
      case 0x8919:
        return 4294966792;
      case 0x8A28:
        return 4294966784;
    }
  }
  else
  {
    switch((_DWORD)this)
    {
      case 0x8894:
        return 4294966791;
      case 0x8895:
        return 4294966790;
      case 0x88ED:
        return 4294966787;
    }
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
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
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_23C65C454(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::find<int>(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramUniform(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v7;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t result;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v7 = a4;
  if (a6)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = -1;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = ___ZN8GPUTools2GLL23GetValidUniformLocationERKNS0_10DispatcherE11DYOpenGLAPIjRKNS0_14ProgramUniformE_block_invoke;
    v25[3] = &unk_250D55358;
    v25[5] = &v26;
    v25[6] = a5;
    v25[4] = &v30;
    GPUTools::GL::EnumerateProgramActiveUniforms(a1, a2, a4, 1, (uint64_t)v25);
    v10 = *((_DWORD *)v31 + 6);
    if (v10 == -1)
    {
      v11 = 0xFFFFFFFFLL;
    }
    else if (*((_BYTE *)v27 + 24))
    {
      v11 = v10;
    }
    else
    {
      v11 = 0xFFFFFFFFLL;
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v11 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[1] + 5000))(*(_QWORD *)(*a1 + 16), a4, *(_QWORD *)a5);
  }
  if ((_DWORD)v11 == -1)
    return v11;
  LODWORD(v30) = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t *))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 35725, &v30);
  (*(void (**)(_QWORD, _QWORD))(a1[1] + 4800))(*(_QWORD *)(*a1 + 16), v7);
  GPUTools::GL::DYGetShaderVariableTypeInfo(*(unsigned int *)(a5 + 24), (uint64_t)v25);
  switch(HIDWORD(v25[0]))
  {
    case 0x1404:
      v12 = operator new[]();
      if (*(int *)(a5 + 20) >= 1)
      {
        v21 = 0;
        v22 = *(unsigned int *)(a5 + 28);
        do
        {
          (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[1] + 5024))(*(_QWORD *)(*a1 + 16), a3, v22, v12 + 4 * (LODWORD(v25[0]) * v21));
          v22 = (*(_DWORD *)(a5 + 44) + v22);
          ++v21;
        }
        while (v21 < *(_DWORD *)(a5 + 20));
      }
      v23 = *(_DWORD *)(a5 + 24);
      switch(v23)
      {
        case 35667:
        case 35671:
          v16 = a1[1];
          v17 = 4920;
          goto LABEL_55;
        case 35668:
        case 35672:
          v16 = a1[1];
          v17 = 4928;
          goto LABEL_55;
        case 35669:
        case 35673:
          v16 = a1[1];
          v17 = 4936;
          goto LABEL_55;
        case 35670:
        case 35678:
        case 35679:
        case 35680:
        case 35682:
          break;
        case 35674:
        case 35675:
        case 35676:
        case 35677:
        case 35681:
          goto LABEL_60;
        default:
          if (((v23 - 36289) > 0x16 || ((1 << (v23 + 63)) & 0x4E4E11) == 0) && v23 != 5124)
            goto LABEL_60;
          break;
      }
      v16 = a1[1];
      v17 = 4912;
      goto LABEL_55;
    case 0x1405:
      v12 = operator new[]();
      if (*(int *)(a5 + 20) >= 1)
      {
        v18 = 0;
        v19 = *(unsigned int *)(a5 + 28);
        do
        {
          (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1[1] + 5936))(*(_QWORD *)(*a1 + 16), a3, v19, v12 + 4 * (LODWORD(v25[0]) * v18));
          v19 = (*(_DWORD *)(a5 + 44) + v19);
          ++v18;
        }
        while (v18 < *(_DWORD *)(a5 + 20));
      }
      v20 = *(_DWORD *)(a5 + 24);
      if (v20 > 36294)
      {
        if (v20 == 36295)
        {
          v16 = a1[1];
          v17 = 5920;
        }
        else
        {
          if (v20 != 36296)
            goto LABEL_60;
          v16 = a1[1];
          v17 = 5928;
        }
      }
      else if (v20 == 5125)
      {
        v16 = a1[1];
        v17 = 5904;
      }
      else
      {
        if (v20 != 36294)
          goto LABEL_60;
        v16 = a1[1];
        v17 = 5912;
      }
LABEL_55:
      (*(void (**)(_QWORD, uint64_t))(v16 + v17))(*(_QWORD *)(*a1 + 16), v11);
      MEMORY[0x242621A78](v12, 0x1000C8052888210);
      (*(void (**)(_QWORD, _QWORD))(a1[1] + 4800))(*(_QWORD *)(*a1 + 16), v30);
      return v11;
    case 0x1406:
      v12 = operator new[]();
      if (*(int *)(a5 + 20) >= 1)
      {
        v13 = 0;
        v14 = *(unsigned int *)(a5 + 28);
        do
        {
          (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[1] + 5016))(*(_QWORD *)(*a1 + 16), a3, v14, v12 + 4 * (LODWORD(v25[0]) * v13));
          v14 = (*(_DWORD *)(a5 + 44) + v14);
          ++v13;
        }
        while (v13 < *(_DWORD *)(a5 + 20));
      }
      v15 = *(_DWORD *)(a5 + 24);
      switch(v15)
      {
        case 35664:
          v16 = a1[1];
          v17 = 4888;
          goto LABEL_55;
        case 35665:
          v16 = a1[1];
          v17 = 4896;
          goto LABEL_55;
        case 35666:
          v16 = a1[1];
          v17 = 4904;
          goto LABEL_55;
        case 35667:
        case 35668:
        case 35669:
        case 35670:
        case 35671:
        case 35672:
        case 35673:
        case 35677:
        case 35678:
        case 35679:
        case 35680:
        case 35681:
        case 35682:
        case 35683:
        case 35684:
          goto LABEL_60;
        case 35674:
          v16 = a1[1];
          v17 = 4944;
          goto LABEL_55;
        case 35675:
          v16 = a1[1];
          v17 = 4952;
          goto LABEL_55;
        case 35676:
          v16 = a1[1];
          v17 = 4960;
          goto LABEL_55;
        case 35685:
          v16 = a1[1];
          v17 = 5992;
          goto LABEL_55;
        case 35686:
          v16 = a1[1];
          v17 = 6008;
          goto LABEL_55;
        case 35687:
          v16 = a1[1];
          v17 = 6000;
          goto LABEL_55;
        case 35688:
          v16 = a1[1];
          v17 = 6024;
          goto LABEL_55;
        case 35689:
          v16 = a1[1];
          v17 = 6016;
          goto LABEL_55;
        case 35690:
          v16 = a1[1];
          v17 = 6032;
          goto LABEL_55;
        default:
          if (v15 != 5126)
            goto LABEL_60;
          v16 = a1[1];
          v17 = 4880;
          break;
      }
      goto LABEL_55;
  }
  dy_string_from_enum(SHIDWORD(v25[0]));
  dy_abort();
LABEL_60:
  result = dy_abort();
  __break(1u);
  return result;
}

void sub_23C65CAD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242621A78](v1, 0x1000C8052888210);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::GL::CopyProgramActiveUniforms(_QWORD *a1, unsigned int a2, uint64_t a3, int a4, char a5)
{
  _QWORD v6[5];
  unsigned int v7;
  int v8;
  int v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZN8GPUTools2GL25CopyProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjjb_block_invoke;
  v6[3] = &__block_descriptor_53_e45_v24__0r__ProgramUniform__QiiIiIIiiiiCCI_8_B16l;
  v6[4] = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  return GPUTools::GL::EnumerateProgramActiveUniforms(a1, a2, a3, 1, (uint64_t)v6);
}

uint64_t GPUTools::GL::EnumerateProgramActiveUniforms(_QWORD *a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t result;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD *(*v28)(_QWORD *, uint64_t, int, _BYTE *);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  char v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48[2];
  __int128 v49;
  _BYTE v50[26];
  int v51;
  uint64_t v52;
  _BYTE v53[9];

  v53[0] = 0;
  v52 = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, char *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a3, 35718, (char *)&v52 + 4);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a3, 35719, &v52);
  if (!HIDWORD(v52))
    return result;
  if (a2 < 3)
  {
    memset(v50, 0, sizeof(v50));
    v49 = 0u;
    v51 = 0;
    *(_DWORD *)&v50[4] = -1;
    v48[1] = (v52 + 32);
    result = operator new[]();
    v48[0] = result;
    v47 = 0;
    if (!HIDWORD(v52))
      goto LABEL_18;
    v11 = 0;
    while (1)
    {
      *(_DWORD *)v50 = v11;
      (*(void (**)(_QWORD, _QWORD))(a1[1] + 5008))(*(_QWORD *)(*a1 + 16), a3);
      if (*(_BYTE *)v48[0] == 103 && *(_BYTE *)(v48[0] + 1) == 108)
      {
        v50[25] = *(_BYTE *)(v48[0] + 2) == 95;
        if (v50[25])
        {
          HIDWORD(v49) = -1;
          if (a4)
            goto LABEL_13;
          goto LABEL_14;
        }
      }
      else
      {
        v50[25] = 0;
      }
      HIDWORD(v49) = (*(uint64_t (**)(_QWORD, _QWORD))(a1[1] + 5000))(*(_QWORD *)(*a1 + 16), a3);
      GPUTools::GL::SetUniformArrayLocationStride(a1, a3, v48);
      v46 = 0;
      (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *, uint64_t, char *))(a1[1] + 3536))(*(_QWORD *)(*a1 + 16), a3, 1, &v47, 35424, (char *)&v46 + 4);
      (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t *))(a1[1] + 3536))(*(_QWORD *)(*a1 + 16), a3, 1, &v47, 35428, &v46);
      v51 = (HIDWORD(v46) != 0) | (2 * ((_DWORD)v46 != 0));
      if (a4)
      {
LABEL_13:
        if (v50[25])
          goto LABEL_15;
      }
LABEL_14:
      (*(void (**)(uint64_t, uint64_t *, _BYTE *))(a5 + 16))(a5, v48, v53);
LABEL_15:
      if (!v53[0])
      {
        v11 = v47 + 1;
        v47 = v11;
        if (v11 < HIDWORD(v52))
          continue;
      }
      result = v48[0];
      if (v48[0])
      {
LABEL_18:
        v12 = 2004306212;
        return MEMORY[0x242621A78](result, v12 | 0x1000C8000000000);
      }
      return result;
    }
  }
  if (a2 - 3 >= 2)
    return result;
  v26 = operator new[]();
  v24 = operator new[]();
  v13 = operator new[]();
  v23 = operator new[]();
  v22 = operator new[]();
  v21 = operator new[]();
  v14 = (v52 + 32);
  v15 = operator new[]();
  v16 = operator new[]();
  v17 = operator new[]();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v28 = ___ZN8GPUTools2GL30EnumerateProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjbU13block_pointerFvRKNS0_14ProgramUniformERbE_block_invoke;
  v29 = &unk_250D55310;
  v32 = a1;
  v33 = v26;
  v34 = v24;
  v35 = v13;
  v25 = v17;
  v36 = v23;
  v37 = v22;
  v38 = v16;
  v39 = v17;
  v40 = v14;
  v41 = v15;
  v42 = a3;
  v43 = a3;
  v44 = v52;
  v45 = a4;
  v30 = a5;
  v31 = v21;
  v18 = HIDWORD(v52);
  if (HIDWORD(v52) >= 0x10)
  {
    v19 = 0;
    v20 = HIDWORD(v52) >> 4;
    while (1)
    {
      v28(v27, 16, v19, v53);
      if (v53[0])
        break;
      v19 = (v19 + 16);
      if (!--v20)
        goto LABEL_26;
    }
  }
  else if (!v53[0])
  {
LABEL_26:
    v28(v27, BYTE4(v52) & 0xF, v18 & 0xFFFFFFF0, v53);
  }
  MEMORY[0x242621A78](v15, 0x1000C8077774924);
  MEMORY[0x242621A78](v21, 0x1000C8052888210);
  MEMORY[0x242621A78](v22, 0x1000C8052888210);
  MEMORY[0x242621A78](v23, 0x1000C8052888210);
  MEMORY[0x242621A78](v13, 0x1000C8052888210);
  MEMORY[0x242621A78](v24, 0x1000C8052888210);
  MEMORY[0x242621A78](v26, 0x1000C8052888210);
  MEMORY[0x242621A78](v16, 0x1000C8052888210);
  result = v25;
  v12 = 1384677904;
  return MEMORY[0x242621A78](result, v12 | 0x1000C8000000000);
}

uint64_t ___ZN8GPUTools2GL25CopyProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjjb_block_invoke(uint64_t a1, uint64_t a2)
{
  return GPUTools::GL::CopyProgramUniform(*(_QWORD **)(a1 + 32), *(_DWORD *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), a2, *(unsigned __int8 *)(a1 + 52));
}

uint64_t GPUTools::GL::CopyProgramActiveAttributes(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD v4[5];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZN8GPUTools2GL27CopyProgramActiveAttributesERKNS0_10DispatcherEjj_block_invoke;
  v4[3] = &__block_descriptor_44_e49_v24__0r__ProgramActiveObject__QiiIiIIiiiiCC_8_B16l;
  v4[4] = a1;
  v5 = a3;
  return GPUTools::GL::EnumerateProgramActiveAttributes(a1, a2, 1, (uint64_t)v4);
}

uint64_t GPUTools::GL::EnumerateProgramActiveAttributes(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  int v10;
  char v11;
  _QWORD v12[2];
  _OWORD v13[3];
  unsigned int v14;
  unsigned int v15;

  v15 = 0;
  v14 = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35721, &v15);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35722, &v14);
  if (!v15)
    return result;
  memset(v13, 0, 42);
  v12[1] = v14 + 32;
  result = operator new[]();
  v12[0] = result;
  v11 = 0;
  if (!v15)
    return MEMORY[0x242621A78](result, 0x1000C8077774924);
  v9 = 0;
  do
  {
    LODWORD(v13[1]) = v9;
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, char *, char *, _QWORD))(a1[1] + 5048))(*(_QWORD *)(*a1 + 16), a2, v9, v14, v13, (char *)v13 + 4, (char *)v13 + 8, v12[0]);
    if (*(_BYTE *)v12[0] != 103 || *(_BYTE *)(v12[0] + 1) != 108)
    {
      BYTE9(v13[2]) = 0;
LABEL_10:
      v10 = (*(uint64_t (**)(_QWORD, _QWORD))(a1[1] + 5056))(*(_QWORD *)(*a1 + 16), a2);
      goto LABEL_11;
    }
    BYTE9(v13[2]) = *(_BYTE *)(v12[0] + 2) == 95;
    if (!BYTE9(v13[2]))
      goto LABEL_10;
    v10 = -1;
LABEL_11:
    HIDWORD(v13[0]) = v10;
    if (!a3 || !BYTE9(v13[2]))
      (*(void (**)(uint64_t, _QWORD *, char *))(a4 + 16))(a4, v12, &v11);
    if (v11)
      break;
    v9 = (v9 + 1);
  }
  while (v9 < v15);
  result = v12[0];
  if (v12[0])
    return MEMORY[0x242621A78](result, 0x1000C8077774924);
  return result;
}

uint64_t ___ZN8GPUTools2GL27CopyProgramActiveAttributesERKNS0_10DispatcherEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 5040))(*(_QWORD *)(**(_QWORD **)(a1 + 32) + 16), *(unsigned int *)(a1 + 40), *(unsigned int *)(a2 + 28), *(_QWORD *)a2);
}

_QWORD *GPUTools::GL::SetUniformArrayLocationStride(_QWORD *result, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;

  if (*((_DWORD *)a3 + 7) != -1 && *((_DWORD *)a3 + 5) != 1)
  {
    v5 = *a3;
    v6 = *((int *)a3 + 4);
    if (*(_BYTE *)(v6 + *a3 - 3) == 91 && *(_BYTE *)(v5 + v6 - 2) == 48 && *(_BYTE *)(v6 + v5 - 1) == 93)
    {
      *(_BYTE *)(v5 + v6 - 2) = 49;
      result = (_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(result[1] + 5000))(*(_QWORD *)(*result + 16), a2, *a3);
      *(_BYTE *)(*((int *)a3 + 4) + *a3 - 2) = 48;
      if ((_DWORD)result == -1)
        __assert_rtn("void GPUTools::GL::SetUniformArrayLocationStride(const Dispatcher &, GLhandleARB, ProgramUniform &)", (const char *)&unk_23C65FE76, 0, "nextLoc != -1");
      *((_DWORD *)a3 + 11) = (_DWORD)result - *((_DWORD *)a3 + 7);
    }
  }
  return result;
}

uint64_t GPUTools::GL::EnumerateProgramActiveUniformBlocks(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, char *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35382, (char *)&v18 + 4);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35381, &v18);
  if (HIDWORD(v18))
  {
    v14 = 0;
    v16 = 0;
    v17 = 0;
    v15 = 0;
    v13 = (v18 + 32);
    result = operator new[]();
    v12 = result;
    v11 = 0;
    if (!HIDWORD(v18))
      return MEMORY[0x242621A78](result, 0x1000C8077774924);
    v7 = 0;
    v8 = 0;
    do
    {
      HIDWORD(v14) = v7;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35394, &v15);
      if (v15 > v8)
      {
        if (v8 && v16)
          MEMORY[0x242621A78](v16, 0x1000C8052888210);
        v16 = operator new[]();
        v8 = v15;
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35391, (char *)&v17 + 4);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35395, v16);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35392, &v14);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35393, (char *)&v13 + 4);
      v9 = 0;
      v10 = 0;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35396, &v10);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(a1[1] + 3560))(*(_QWORD *)(*a1 + 16), a2, v7, 35398, &v9);
      LODWORD(v17) = (v10 != 0) | (2 * (v9 != 0));
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, char *, uint64_t))(a1[1] + 3568))(*(_QWORD *)(*a1 + 16), a2, v7, v13, (char *)&v13 + 4, v12);
      (*(void (**)(uint64_t, uint64_t *, char *))(a3 + 16))(a3, &v12, &v11);
      if (v11)
        break;
      v7 = (v7 + 1);
    }
    while (v7 < HIDWORD(v18));
    if (v16)
      MEMORY[0x242621A78](v16, 0x1000C8052888210);
    result = v12;
    if (v12)
      return MEMORY[0x242621A78](result, 0x1000C8077774924);
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramActiveUniformBlockBindings(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD v4[5];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZN8GPUTools2GL37CopyProgramActiveUniformBlockBindingsERKNS0_10DispatcherEjj_block_invoke;
  v4[3] = &__block_descriptor_44_e45_v24__0r__ProgramUniformBlock__iiiIi_iII_8_B16l;
  v4[4] = a1;
  v5 = a3;
  return GPUTools::GL::EnumerateProgramActiveUniformBlocks(a1, a2, (uint64_t)v4);
}

uint64_t ___ZN8GPUTools2GL37CopyProgramActiveUniformBlockBindingsERKNS0_10DispatcherEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 3552))(*(_QWORD *)(**(_QWORD **)(a1 + 32) + 16), *(unsigned int *)(a1 + 40), *(_QWORD *)a2);
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 3576))(*(_QWORD *)(**(_QWORD **)(a1 + 32) + 16), *(unsigned int *)(a1 + 40), v4, *(unsigned int *)(a2 + 44));
}

uint64_t GPUTools::GL::EnumerateProgramTransformFeedbackVaryings(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v10 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35971, &v10);
  if (v10)
  {
    v9 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35958, &v9);
    v11 = operator new[]();
    if (v10 < 1)
      return MEMORY[0x242621A78]();
    v7 = 0;
    do
    {
      v8 = 0;
      HIDWORD(v12) = v7;
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t *, uint64_t *, char *, uint64_t))(a1[1] + 5592))(*(_QWORD *)(*a1 + 16), a2, v7, v9, &v12, &v13, (char *)&v13 + 4, v11);
      (*(void (**)(uint64_t, uint64_t *, char *))(a3 + 16))(a3, &v11, &v8);
      if (v8)
        break;
      v7 = (v7 + 1);
    }
    while ((int)v7 < v10);
    result = v11;
    if (v11)
      return MEMORY[0x242621A78]();
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramTransformFeedbackVaryings(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;

  v15 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35971, &v15);
  if (v15)
  {
    v13 = 0;
    v14 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35967, &v14);
    (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(a1[1] + 5264))(*(_QWORD *)(*a1 + 16), a2, 35958, &v13);
    v7 = operator new[]();
    if (v15 >= 1)
    {
      for (i = 0;
            i < v15;
            (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1[1] + 5592))(*(_QWORD *)(*a1 + 16), a2, i++, v13, 0, 0, 0, v9))
      {
        v9 = operator new[]();
        *(_QWORD *)(v7 + 8 * i) = v9;
      }
    }
    (*(void (**)(_QWORD, uint64_t))(a1[1] + 5584))(*(_QWORD *)(*a1 + 16), a3);
    v10 = v15;
    if (v15 >= 1)
    {
      v11 = 0;
      do
      {
        v12 = *(_QWORD *)(v7 + 8 * v11);
        if (v12)
        {
          MEMORY[0x242621A78](v12, 0x1000C8077774924);
          v10 = v15;
        }
        ++v11;
      }
      while (v11 < v10);
    }
    return MEMORY[0x242621A78](v7, 0x10C80436913F5);
  }
  return result;
}

char *GPUTools::GL::EnumerateTextureTargets(char *result, int a2, uint64_t a3)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;

  v4 = result;
  switch(a2)
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3552);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 32879);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 34067);
      v5 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*((_QWORD *)v4 + 1) + 936))(*(_QWORD *)(*(_QWORD *)v4 + 16), 7939);
      if (strstr(v5, "GL_EXT_texture_array"))
      {
        (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35864);
        (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35866);
      }
      v6 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*((_QWORD *)v4 + 1) + 936))(*(_QWORD *)(*(_QWORD *)v4 + 16), 7939);
      result = strstr(v6, "GL_ARB_texture_rectangle");
      if (result)
      {
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
        v8 = a3;
        v9 = 34037;
        goto LABEL_12;
      }
      return result;
    case 1:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      v10 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*((_QWORD *)v4 + 1) + 936))(*(_QWORD *)(*(_QWORD *)v4 + 16), 7939);
      result = strstr(v10, "GL_OES_texture_cube_map");
      if (result)
        goto LABEL_11;
      return result;
    case 2:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      goto LABEL_11;
    case 3:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3552);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35864);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35866);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 37120);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 37122);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 32879);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 34067);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 34037);
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
      v8 = a3;
      v9 = 35882;
      goto LABEL_12;
    case 4:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35866);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 32879);
LABEL_11:
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
      v8 = a3;
      v9 = 34067;
LABEL_12:
      result = (char *)v7(v8, v9);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPUTools::GL::GetTexStorageInfo(_QWORD *a1, int a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  LODWORD(v5) = a2;
  v7 = a4 + 4;
  *(_OWORD *)a4 = xmmword_23C692090;
  v8 = 1;
  *(_DWORD *)(a4 + 16) = 1;
  if (*((_BYTE *)a3 + 9))
  {
    HIDWORD(v17) = 0;
    (*(void (**)(_QWORD, _QWORD, char *))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), *a3, (char *)&v17 + 4);
    v9 = HIDWORD(v17);
    if (HIWORD(HIDWORD(v17)))
      v9 = HIWORD(HIDWORD(v17));
    v10 = 16 * (HIWORD(HIDWORD(v17)) != 0);
    if (v9 > 0xFF)
    {
      v9 >>= 8;
      v10 = (16 * (HIWORD(HIDWORD(v17)) != 0)) | 8;
    }
    if (v9 > 0xF)
    {
      v9 >>= 4;
      v10 |= 4u;
    }
    if (v9 > 3)
    {
      v9 >>= 2;
      v10 |= 2u;
    }
    v8 = (v10 | (v9 > 1)) + 1;
  }
  v11 = 0;
  if ((_DWORD)v5 == 34067)
    v5 = 34069;
  else
    v5 = v5;
  while (1)
  {
    v17 = 0;
    v16 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(a1[1] + 1000))(*(_QWORD *)(*a1 + 16), v5, v11, 4096, (char *)&v17 + 4);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *))(a1[1] + 1000))(*(_QWORD *)(*a1 + 16), v5, v11, 4097, &v17);
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(a1[1] + 1000))(*(_QWORD *)(*a1 + 16), v5, v11, 32881, &v16);
    if ((_DWORD)v11)
    {
      v13 = v17;
      v14 = v16;
      if (!HIDWORD(v17))
        break;
    }
    else
    {
      result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a1[1] + 1000))(*(_QWORD *)(*a1 + 16), v5, 0, 4099, v7);
      v13 = v17;
      v15 = HIDWORD(v17);
      *(_DWORD *)(a4 + 8) = HIDWORD(v17);
      *(_DWORD *)(a4 + 12) = v13;
      v14 = v16;
      *(_DWORD *)(a4 + 16) = v16;
      if (!v15)
        break;
    }
    if (!v13 || !v14)
      break;
    v11 = (v11 + 1);
    if (v8 == (_DWORD)v11)
    {
      *(_DWORD *)a4 = v8;
      return result;
    }
  }
  *(_DWORD *)a4 = v11;
  return result;
}

double GPUTools::GL::GetImageInfo(id **a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  int v13;
  _DWORD v14[2];
  double v15;

  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_DWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 28) = 0x100000001;
  v9 = a5 + 28;
  *(_QWORD *)(a5 + 36) = 0;
  v10 = a5 + 36;
  *(_QWORD *)(a5 + 41) = 0;
  if (a3 == 36161)
  {
    LODWORD(v11) = 36161;
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36162, a5 + 24);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36163, v9);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36164, a5 + 12);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36011, a5 + 40);
  }
  else
  {
    if (a3 == 34067)
      v11 = 34069;
    else
      v11 = a3;
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4096, a5 + 24);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4097, v9);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 32881, a5 + 32);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 34465, v10);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4099, a5 + 12);
  }
  if (*(_DWORD *)(a5 + 24) && *(_DWORD *)(a5 + 28) && *(_DWORD *)(a5 + 32))
  {
    if (*(_DWORD *)(a5 + 36))
    {
      *(_QWORD *)(a5 + 16) = 0;
      *(_QWORD *)a5 = *(_QWORD *)(a5 + 12);
      *(_DWORD *)(a5 + 8) = *(_DWORD *)(a5 + 20);
    }
    else
    {
      *(_QWORD *)a5 = GPUTools::GL::GetImageUploadFormatInfo((GPUTools::GL *)*(unsigned int *)(a5 + 12), 0);
      *(_DWORD *)(a5 + 8) = v13;
      if ((a2 - 1) <= 1 && (_DWORD)v11 != 36161)
        GPUTools::GL::DYProcessImageUploadFormatForLegacyES((int *)a5);
      v14[0] = v11;
      v14[1] = a4;
      if (!objc_msgSend(**a1, "getParameter:to:", 1500, v14))
      {
        result = v15;
        *(double *)(a5 + 16) = v15;
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::GetImageInfo(id **a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 v11;
  double v14;
  __n128 v15;
  unsigned int v16[5];
  unsigned int v17;

  if ((_DWORD)a4 == 36161)
  {
    v16[0] = 0;
    ((void (*)(id, uint64_t, unsigned int *))a1[1][104])((*a1)[2], 36007, v16);
    ((void (*)(id, uint64_t, uint64_t))a1[1][666])((*a1)[2], 36161, a3);
    v11.n128_f64[0] = GPUTools::GL::GetImageInfo(a1, a2, 0x8D41u, a5, a6);
    return ((uint64_t (*)(id, uint64_t, _QWORD, __n128))a1[1][666])((*a1)[2], 36161, v16[0], v11);
  }
  else
  {
    v17 = 0;
    memset(v16, 0, 15);
    v14 = GPUTools::GL::DYGetTextureTargetInfo(a4, (uint64_t)v16);
    ((void (*)(id, _QWORD, unsigned int *, double))a1[1][104])((*a1)[2], v16[1], &v17, v14);
    ((void (*)(id, uint64_t, uint64_t))a1[1][5])((*a1)[2], a4, a3);
    v15.n128_f64[0] = GPUTools::GL::GetImageInfo(a1, a2, a4, a5, a6);
    return ((uint64_t (*)(id, uint64_t, _QWORD, __n128))a1[1][5])((*a1)[2], a4, v17, v15);
  }
}

BOOL GPUTools::GL::ShouldUseGLIReadTextureData(_QWORD *a1)
{
  char *v1;

  v1 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(a1[1] + 936))(*(_QWORD *)(*a1 + 16), 7937);
  return strstr(v1, "SGX") != 0;
}

uint64_t GPUTools::GL::GetImageData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  int v14;
  _DWORD v15[4];
  uint64_t v16;

  if (a6)
  {
    v15[0] = a2;
    v15[1] = a3;
    v15[2] = a4;
    v15[3] = a5;
    v16 = a7;
    return objc_msgSend(**(id **)a1, "getParameter:to:", 605, v15);
  }
  else
  {
    v15[0] = 0;
    objc_msgSend(**(id **)a1, "getParameter:to:", 1501, v15);
    v14 = 1;
    objc_msgSend(**(id **)a1, "setParameter:to:", 1501, &v14);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 984))(*(_QWORD *)(*(_QWORD *)a1 + 16), a2, a3, a4, a5, a7);
    return objc_msgSend(**(id **)a1, "setParameter:to:", 1501, v15);
  }
}

uint64_t GPUTools::GL::GetFramebufferAttachmentInfo(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  int v11;

  *(_QWORD *)(a5 + 12) = 0;
  *(_DWORD *)(a5 + 28) = 0;
  *(_QWORD *)(a5 + 4) = 0;
  *(_QWORD *)(a5 + 20) = 0;
  *(_DWORD *)a5 = a4;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36049, a5 + 4);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36048, a5 + 8);
  v11 = *(_DWORD *)(a5 + 8);
  if (v11 == 5890)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36050, a5 + 20);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36051, a5 + 16);
    if ((a2 - 1) >= 2)
    {
      if ((a2 - 3) <= 1)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36052, a5 + 24);
LABEL_9:
        (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 36263, a5 + 28);
        return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 35419, a5 + 12);
      }
      if (a2 >= 3)
        goto LABEL_9;
    }
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(_QWORD *)(*a1 + 16), a3, a4, 35419, a5 + 12);
  }
  if (v11 == 36161)
    *(_DWORD *)(a5 + 12) = 36161;
  return result;
}

uint64_t GPUTools::GL::SavePixelStorePackState(_QWORD *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3333, a4 + 12);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3330, a4);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3331, a4 + 4);
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3332, a4 + 8);
    if (a2 != 4)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 32876, a4 + 16);
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 32875, a4 + 20);
      if (a2 == 3)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 792))(*(_QWORD *)(*a1 + 16), 3328, a4 + 32);
        result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 792))(*(_QWORD *)(*a1 + 16), 3329, a4 + 33);
      }
    }
  }
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 35349, a4 + 24);
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 35351, a4 + 28);
  }
  return result;
}

uint64_t GPUTools::GL::SavePixelStoreUnpackState(_QWORD *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3317, a4 + 12);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3314, a4);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3315, a4 + 4);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 3316, a4 + 8);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 32878, a4 + 16);
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 32877, a4 + 20);
    if (a2 == 3)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 792))(*(_QWORD *)(*a1 + 16), 3312, a4 + 32);
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 792))(*(_QWORD *)(*a1 + 16), 3313, a4 + 33);
    }
  }
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 35350, a4 + 24);
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1[1] + 832))(*(_QWORD *)(*a1 + 16), 35352, a4 + 28);
  }
  return result;
}

uint64_t GPUTools::GL::SavePixelStoreState(_QWORD *a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  GPUTools::GL::SavePixelStoreUnpackState(a1, a2, a3, a4);
  return GPUTools::GL::SavePixelStorePackState(a1, a2, a3, a5);
}

uint64_t GPUTools::GL::ApplyPixelStorePackState(_QWORD *a1, int a2, int a3, unsigned int *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3333, a4[3]);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3330, *a4);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3331, a4[1]);
    result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3332, a4[2]);
    if (a2 != 4)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 32876, a4[4]);
      result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 32875, a4[5]);
      if (a2 == 3)
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3328, *((unsigned __int8 *)a4 + 32));
        result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3329, *((unsigned __int8 *)a4 + 33));
      }
    }
  }
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 35349, a4[6]);
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 35351, a4[7]);
  }
  return result;
}

uint64_t GPUTools::GL::ApplyPixelStoreUnpackState(_QWORD *a1, int a2, int a3, unsigned int *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3317, a4[3]);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3314, *a4);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3315, a4[1]);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3316, a4[2]);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 32878, a4[4]);
    result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 32877, a4[5]);
    if (a2 == 3)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3312, *((unsigned __int8 *)a4 + 32));
      result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 3313, *((unsigned __int8 *)a4 + 33));
    }
  }
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 35350, a4[6]);
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[1] + 1560))(*(_QWORD *)(*a1 + 16), 35352, a4[7]);
  }
  return result;
}

uint64_t GPUTools::GL::ApplyPixelStoreState(_QWORD *a1, int a2, int a3, unsigned int *a4, unsigned int *a5)
{
  GPUTools::GL::ApplyPixelStoreUnpackState(a1, a2, a3, a4);
  return GPUTools::GL::ApplyPixelStorePackState(a1, a2, a3, a5);
}

uint64_t GPUTools::GL::GetBufferSize(_QWORD *a1, int a2, uint64_t a3)
{
  int v4;
  uint64_t v5;

  if ((a2 - 3) > 1)
  {
    v4 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(a1[1] + 5208))(*(_QWORD *)(*a1 + 16), a3, 34660, &v4);
    return v4;
  }
  else
  {
    v5 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1[1] + 6392))(*(_QWORD *)(*a1 + 16), a3, 34660, &v5);
    return v5;
  }
}

uint64_t ___ZN8GPUTools2GLL23GetValidUniformLocationERKNS0_10DispatcherE11DYOpenGLAPIjRKNS0_14ProgramUniformE_block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t result;
  BOOL v8;

  v6 = a1[6];
  result = strcmp(*(const char **)v6, *(const char **)a2);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_DWORD *)(a2 + 28);
    v8 = *(_DWORD *)(v6 + 24) == *(_DWORD *)(a2 + 24) && *(_DWORD *)(v6 + 20) == *(_DWORD *)(a2 + 20);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
    *a3 = 1;
  }
  return result;
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

uint64_t DYGetGLInterposeDylibPath()
{
  return MEMORY[0x24BE390A0]();
}

uint64_t DYSetBlockPointer()
{
  return MEMORY[0x24BE390F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t GPUTools::FD::Argument::GLObjectNameFromVariable(GPUTools::FD::Argument *this, const char *a2)
{
  return MEMORY[0x24BE391E8](this, a2);
}

uint64_t GPUTools::FD::Function::Function(GPUTools::FD::Function *this, const Function *a2)
{
  return MEMORY[0x24BE391F0](this, a2);
}

void GPUTools::FD::Function::~Function(GPUTools::FD::Function *this)
{
  MEMORY[0x24BE39200](this);
}

uint64_t GPUTools::FD::Argument::ViewAsGLObjectName(GPUTools::FD::Argument *this)
{
  return MEMORY[0x24BE39238](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250D4EA48();
}

void operator delete(void *__p)
{
  off_250D4EA50(__p);
}

uint64_t operator delete()
{
  return off_250D4EA58();
}

uint64_t operator new[]()
{
  return off_250D4EA60();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250D4EA68(__sz);
}

uint64_t operator new()
{
  return off_250D4EA70();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dy_abort()
{
  return MEMORY[0x24BE39240]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

