unsigned __int8 *StringPool::cacheString@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 *result;
  unsigned __int8 *v5;
  uint64_t v6;
  char v7;

  result = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(a1, a2, (uint64_t)a2);
  if (result)
  {
    if ((char)result[39] < 0)
    {
      v5 = (unsigned __int8 *)*((_QWORD *)result + 2);
      v6 = *((_QWORD *)result + 3);
    }
    else
    {
      v5 = result + 16;
      v6 = result[39];
    }
    *(_QWORD *)a3 = v5;
    *(_QWORD *)(a3 + 8) = v6;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    *(_BYTE *)a3 = 0;
  }
  *(_BYTE *)(a3 + 16) = v7;
  return result;
}

unsigned __int8 *std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_226389EBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = operator new(0x28uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v9->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 16);
  }
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_22638A044(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EDD50F8, MEMORY[0x24BEDAAF0]);
}

void sub_22638A5E0(_Unwind_Exception *a1)
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

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
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

void StackshotAotImageDescription::StackshotAotImageDescription(StackshotAotImageDescription *this, user64_dyld_aot_info *a2)
{
  AOTImageDescription::AOTImageDescription(this, a2->x86LoadAddress, a2->aotLoadAddress, a2->aotImageSize, a2->aotImageKey);
}

{
  AOTImageDescription::AOTImageDescription(this, a2->x86LoadAddress, a2->aotLoadAddress, a2->aotImageSize, a2->aotImageKey);
}

void AOTImageDescription::AOTImageDescription(AOTImageDescription *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

void AOTImageDescription::AOTImageDescription(AOTImageDescription *this, uint64_t a2, uint64_t a3, uint64_t a4, const unsigned __int8 *a5)
{
  __int128 v5;

  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  v5 = *(_OWORD *)a5;
  *(_OWORD *)((char *)this + 40) = *((_OWORD *)a5 + 1);
  *(_OWORD *)((char *)this + 24) = v5;
}

{
  __int128 v5;

  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  v5 = *(_OWORD *)a5;
  *(_OWORD *)((char *)this + 40) = *((_OWORD *)a5 + 1);
  *(_OWORD *)((char *)this + 24) = v5;
}

uint64_t AOTImageDescription::x86Address(AOTImageDescription *this)
{
  return *(_QWORD *)this;
}

uint64_t AOTImageDescription::aotAddress(AOTImageDescription *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t AOTImageDescription::aotSize(AOTImageDescription *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t AOTImageDescription::aotImageKeySize(AOTImageDescription *this)
{
  return 32;
}

uint64_t AOTImageDescription::aotImageKey(AOTImageDescription *this)
{
  return (uint64_t)this + 24;
}

double ats_create_symbolication_config()
{
  _OWORD *v0;
  double result;

  v0 = (_OWORD *)operator new();
  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t ats_destroy_symbolication_config(uint64_t result)
{
  if (result)
    JUMPOUT(0x227696F98);
  return result;
}

uint64_t AOTImage::AOTImage(uint64_t a1, __int128 *a2)
{
  AOTImageDescription *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v3 = (AOTImageDescription *)(a1 + 16);
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 6);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)a1 = AOTImageDescription::aotAddress((AOTImageDescription *)(a1 + 16));
  *(_QWORD *)(a1 + 8) = AOTImageDescription::aotSize(v3);
  return a1;
}

{
  AOTImageDescription *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v3 = (AOTImageDescription *)(a1 + 16);
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 6);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)a1 = AOTImageDescription::aotAddress((AOTImageDescription *)(a1 + 16));
  *(_QWORD *)(a1 + 8) = AOTImageDescription::aotSize(v3);
  return a1;
}

uint64_t AOTImage::translateFromNativeAddress(AOTImage *this, void *a2)
{
  return 0;
}

__n128 AOTImage::aotImageInfo@<Q0>(AOTImage *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *((_OWORD *)this + 2);
  *(_OWORD *)a2 = *((_OWORD *)this + 1);
  *(_OWORD *)(a2 + 16) = v2;
  result = *((__n128 *)this + 3);
  *(__n128 *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 48) = *((_QWORD *)this + 8);
  return result;
}

uint64_t Process::Process(uint64_t a1, int a2, uint64_t a3)
{
  __int128 *v4;
  __int128 *v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE v9[9];

  *(_DWORD *)a1 = a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v4 = *(__int128 **)(a1 + 8);
  v5 = *(__int128 **)(a1 + 16);
  v6 = 126 - 2 * __clz(((char *)v5 - (char *)v4) >> 5);
  *(_OWORD *)(a1 + 112) = 0u;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = v6;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v4, v5, (uint64_t)v9, v7, 1);
  return a1;
}

void sub_22638AB00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v2 + 128);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v3);
  v5 = *(void **)(v2 + 32);
  if (v5)
  {
    *(_QWORD *)(v2 + 40) = v5;
    operator delete(v5);
  }
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

_QWORD *Process::setSharedCache(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)(a1 + 128), a2);
}

_QWORD *std::shared_ptr<SharedCache>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

__n128 Process::setAOTSharedCache(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  if (*(_BYTE *)(a1 + 104))
    *(_BYTE *)(a1 + 104) = 0;
  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  *(_BYTE *)(a1 + 104) = 1;
  return result;
}

double Process::setAOTImages(uint64_t a1, __n128 *a2)
{
  uint64_t v4;
  __int128 *v5;
  unint64_t v6;
  uint64_t v7;
  double result;
  char v9;

  v4 = a2->n128_u64[0];
  v5 = (__int128 *)a2->n128_u64[1];
  v6 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((uint64_t)v5 - v4) >> 3));
  if (v5 == (__int128 *)v4)
    v7 = 0;
  else
    v7 = v6;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(v4, v5, (uint64_t)&v9, v7, 1);
  *(_QWORD *)&result = std::vector<AOTImage>::__move_assign(a1 + 32, a2).n128_u64[0];
  return result;
}

_QWORD *Process::setAOTSymbolicator(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)(a1 + 112), a2);
}

uint64_t Process::libraries(Process *this)
{
  return (uint64_t)this + 8;
}

uint64_t Process::pid(Process *this)
{
  return *(unsigned int *)this;
}

uint64_t Process::aotImages(Process *this)
{
  return (uint64_t)this + 32;
}

__n128 Process::aotSharedCache@<Q0>(Process *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)((char *)this + 72);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 56);
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)((char *)this + 88);
  *(__n128 *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 48) = *((_QWORD *)this + 13);
  return result;
}

uint64_t Process::sharedCache(Process *this)
{
  return (uint64_t)this + 128;
}

uint64_t Process::translateFromNativeAddress(Process *this)
{
  return 0;
}

ProcessLibrary *Process::addAddressAndTryTranslation(Process *this, unint64_t a2)
{
  ProcessLibrary *result;

  result = (ProcessLibrary *)Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>((uint64_t)this, (_QWORD *)this + 1, a2);
  if (*((ProcessLibrary **)this + 2) != result)
    return ProcessLibrary::addAddress(result, a2);
  return result;
}

_QWORD *Process::findLibraryForAddress(Process *this, unint64_t a2)
{
  return Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>((uint64_t)this, (_QWORD *)this + 1, a2);
}

ProcessLibrary *Process::addAddresses(ProcessLibrary *this, unint64_t **a2)
{
  unint64_t *v2;
  unint64_t *v3;
  Process *v4;
  unint64_t v5;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = this;
    do
    {
      v5 = *v2++;
      this = Process::addAddressAndTryTranslation(v4, v5);
    }
    while (v2 != v3);
  }
  return this;
}

ProcessLibrary *Process::addAddressesAndTryTranslation(ProcessLibrary *this, unint64_t **a2)
{
  unint64_t *v2;
  unint64_t *v3;
  Process *v4;
  unint64_t v5;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = this;
    do
    {
      v5 = *v2++;
      this = Process::addAddressAndTryTranslation(v4, v5);
    }
    while (v2 != v3);
  }
  return this;
}

void Process::addAOTImages(uint64_t a1, char **a2)
{
  char *v2;
  char *v3;
  int v5;
  void **v6;
  uint64_t v7;
  __int128 *v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE __dst[72];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = a2[1];
  if (v3 != *a2)
  {
    v5 = 0;
    v6 = (void **)(a1 + 32);
    do
    {
      memmove(__dst, v2, 0x48uLL);
      v5 |= Process::addRangeLibrary<std::vector<AOTImage>,AOTImage>(a1, v6, (uint64_t)__dst);
      v2 += 72;
    }
    while (v2 != v3);
    if ((v5 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(__int128 **)(a1 + 40);
      v9 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((uint64_t)v8 - v7) >> 3));
      if (v8 == (__int128 *)v7)
        v10 = 0;
      else
        v10 = v9;
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(v7, v8, (uint64_t)&v11, v10, 1);
    }
  }
}

uint64_t Process::addRangeLibrary<std::vector<AOTImage>,AOTImage>(uint64_t a1, void **a2, uint64_t a3)
{
  char *v5;
  _QWORD *v6;
  char *v7;
  int64_t v9;
  char *v10;
  _BYTE *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD *v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char *v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v5 = (char *)Process::findRangeEntryForAddress<std::vector<AOTImage>>(a1, a2, *(_QWORD *)a3);
  v6 = v5;
  v7 = (char *)a2[1];
  if (v7 == v5)
  {
    v16 = (unint64_t)a2[2];
    if (v16 > (unint64_t)v5)
    {
      *(_OWORD *)v5 = *(_OWORD *)a3;
      v17 = *(_OWORD *)(a3 + 16);
      v18 = *(_OWORD *)(a3 + 32);
      v19 = *(_OWORD *)(a3 + 48);
      *((_QWORD *)v5 + 8) = *(_QWORD *)(a3 + 64);
      *((_OWORD *)v5 + 2) = v18;
      *((_OWORD *)v5 + 3) = v19;
      *((_OWORD *)v5 + 1) = v17;
      v15 = v5 + 72;
      goto LABEL_37;
    }
    v25 = 0x8E38E38E38E38E39 * ((v7 - (_BYTE *)*a2) >> 3);
    v26 = v25 + 1;
    if (v25 + 1 <= 0x38E38E38E38E38ELL)
    {
      v27 = 0x8E38E38E38E38E39 * ((uint64_t)(v16 - (_QWORD)*a2) >> 3);
      if (2 * v27 > v26)
        v26 = 2 * v27;
      if (v27 >= 0x1C71C71C71C71C7)
        v28 = 0x38E38E38E38E38ELL;
      else
        v28 = v26;
      if (v28)
        v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>((uint64_t)(a2 + 2), v28);
      else
        v29 = 0;
      v30 = &v29[72 * v25];
      v31 = &v29[72 * v28];
      *(_OWORD *)v30 = *(_OWORD *)a3;
      v40 = *(_OWORD *)(a3 + 16);
      v41 = *(_OWORD *)(a3 + 32);
      v42 = *(_OWORD *)(a3 + 48);
      *((_QWORD *)v30 + 8) = *(_QWORD *)(a3 + 64);
      *((_OWORD *)v30 + 2) = v41;
      *((_OWORD *)v30 + 3) = v42;
      *((_OWORD *)v30 + 1) = v40;
      v15 = v30 + 72;
      v43 = (char *)*a2;
      v35 = (char *)a2[1];
      if (v35 == *a2)
        goto LABEL_35;
      do
      {
        *(_OWORD *)(v30 - 72) = *(_OWORD *)(v35 - 72);
        v44 = *(_OWORD *)(v35 - 56);
        v45 = *(_OWORD *)(v35 - 40);
        v46 = *(_OWORD *)(v35 - 24);
        *((_QWORD *)v30 - 1) = *((_QWORD *)v35 - 1);
        *(_OWORD *)(v30 - 24) = v46;
        *(_OWORD *)(v30 - 40) = v45;
        *(_OWORD *)(v30 - 56) = v44;
        v30 -= 72;
        v35 -= 72;
      }
      while (v35 != v43);
      goto LABEL_34;
    }
LABEL_38:
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  if (*(_QWORD *)v5 == *(_QWORD *)a3 && *((_QWORD *)v5 + 1) == *(_QWORD *)(a3 + 8))
    return 0;
  v9 = v7 - (v5 + 72);
  if (v7 != v5 + 72)
    memmove(v5, v5 + 72, v7 - (v5 + 72));
  v10 = (char *)v6 + v9;
  v11 = a2[2];
  a2[1] = (char *)v6 + v9;
  if ((char *)v6 + v9 >= v11)
  {
    v20 = 0x8E38E38E38E38E39 * ((v10 - (_BYTE *)*a2) >> 3);
    v21 = v20 + 1;
    if (v20 + 1 <= 0x38E38E38E38E38ELL)
    {
      v22 = 0x8E38E38E38E38E39 * ((v11 - (_BYTE *)*a2) >> 3);
      if (2 * v22 > v21)
        v21 = 2 * v22;
      if (v22 >= 0x1C71C71C71C71C7)
        v23 = 0x38E38E38E38E38ELL;
      else
        v23 = v21;
      if (v23)
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>((uint64_t)(a2 + 2), v23);
      else
        v24 = 0;
      v30 = &v24[72 * v20];
      v31 = &v24[72 * v23];
      *(_OWORD *)v30 = *(_OWORD *)a3;
      v32 = *(_OWORD *)(a3 + 16);
      v33 = *(_OWORD *)(a3 + 32);
      v34 = *(_OWORD *)(a3 + 48);
      *((_QWORD *)v30 + 8) = *(_QWORD *)(a3 + 64);
      *((_OWORD *)v30 + 2) = v33;
      *((_OWORD *)v30 + 3) = v34;
      *((_OWORD *)v30 + 1) = v32;
      v15 = v30 + 72;
      v36 = (char *)*a2;
      v35 = (char *)a2[1];
      if (v35 == *a2)
        goto LABEL_35;
      do
      {
        *(_OWORD *)(v30 - 72) = *(_OWORD *)(v35 - 72);
        v37 = *(_OWORD *)(v35 - 56);
        v38 = *(_OWORD *)(v35 - 40);
        v39 = *(_OWORD *)(v35 - 24);
        *((_QWORD *)v30 - 1) = *((_QWORD *)v35 - 1);
        *(_OWORD *)(v30 - 24) = v39;
        *(_OWORD *)(v30 - 40) = v38;
        *(_OWORD *)(v30 - 56) = v37;
        v30 -= 72;
        v35 -= 72;
      }
      while (v35 != v36);
LABEL_34:
      v35 = (char *)*a2;
LABEL_35:
      *a2 = v30;
      a2[1] = v15;
      a2[2] = v31;
      if (v35)
        operator delete(v35);
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  *(_OWORD *)v10 = *(_OWORD *)a3;
  v12 = *(_OWORD *)(a3 + 16);
  v13 = *(_OWORD *)(a3 + 32);
  v14 = *(_OWORD *)(a3 + 48);
  *((_QWORD *)v10 + 8) = *(_QWORD *)(a3 + 64);
  *((_OWORD *)v10 + 2) = v13;
  *((_OWORD *)v10 + 3) = v14;
  *((_OWORD *)v10 + 1) = v12;
  v15 = v10 + 72;
LABEL_37:
  a2[1] = v15;
  return 1;
}

void Process::addLibraries(uint64_t a1, __int128 **a2)
{
  __int128 *v2;
  __int128 *v3;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  char v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 *v19;
  __int128 *v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  __int128 v26;
  uint64_t v27;
  std::__shared_weak_count *v28;

  v3 = *a2;
  v2 = a2[1];
  if (v2 != *a2)
  {
    v5 = 0;
    v6 = (uint64_t *)(a1 + 8);
    do
    {
      v26 = *v3;
      v7 = *((_QWORD *)v3 + 2);
      v8 = (std::__shared_weak_count *)*((_QWORD *)v3 + 3);
      v27 = v7;
      v28 = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
        v23 = v26;
        v24 = v7;
        v25 = v8;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      else
      {
        v23 = v26;
        v24 = v7;
        v25 = 0;
      }
      v12 = Process::addRangeLibrary<std::vector<ProcessLibrary>,ProcessLibrary>(a1, v6, (unint64_t *)&v23);
      v13 = v25;
      if (v25)
      {
        v14 = (unint64_t *)&v25->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      v16 = v28;
      if (v28)
      {
        v17 = (unint64_t *)&v28->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      v5 |= v12;
      v3 += 2;
    }
    while (v3 != v2);
    if ((v5 & 1) != 0)
    {
      v19 = *(__int128 **)(a1 + 8);
      v20 = *(__int128 **)(a1 + 16);
      v21 = 126 - 2 * __clz(((char *)v20 - (char *)v19) >> 5);
      if (v20 == v19)
        v22 = 0;
      else
        v22 = v21;
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v19, v20, (uint64_t)&v26, v22, 1);
    }
  }
}

void sub_22638B300(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t Process::addRangeLibrary<std::vector<ProcessLibrary>,ProcessLibrary>(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  _QWORD *v5;
  _OWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>(a1, a2, *a3);
  v6 = (_OWORD *)a2[1];
  if (v6 != (_OWORD *)v5)
  {
    if (*v5 == *a3 && v5[1] == a3[1])
      return 0;
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,ProcessLibrary *,ProcessLibrary *,ProcessLibrary *,0>((_OWORD *)v5 + 2, v6, v5);
    v9 = v8;
    v10 = a2[1];
    if (v10 != v8)
    {
      do
      {
        v11 = v10 - 32;
        std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v10 - 16);
        v10 = v11;
      }
      while (v11 != v9);
    }
    a2[1] = v9;
  }
  std::vector<ProcessLibrary>::push_back[abi:ne180100](a2, (uint64_t)a3);
  return 1;
}

_QWORD *Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  _QWORD *result;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;

  result = (_QWORD *)a2[1];
  if (result != (_QWORD *)*a2)
  {
    v4 = ((uint64_t)result - *a2) >> 5;
    v5 = (_QWORD *)*a2;
    do
    {
      v6 = v4 >> 1;
      v7 = &v5[4 * (v4 >> 1)];
      v9 = *v7;
      v8 = v7 + 4;
      v4 += ~(v4 >> 1);
      if (v9 > a3)
        v4 = v6;
      else
        v5 = v8;
    }
    while (v4);
    if (v5 != (_QWORD *)*a2)
    {
      v10 = *(v5 - 4);
      if (v10 <= a3 && *(v5 - 3) + v10 > a3)
        return v5 - 4;
    }
  }
  return result;
}

uint64_t Process::createTransientProcessSymbolicatorFromDescriptions(Process *this)
{
  SharedCache *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 *v6;
  __int128 *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unsigned __int8 *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  SharedLibrary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SharedLibrary *v20;
  int v21;
  SharedLibrary *v22;
  char v23;
  SharedLibrary *v24;
  SharedLibrary *v25;
  char v26;
  _BYTE *v27;
  _BYTE *v28;
  int v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  Process *i;
  void *__p;
  _BYTE *v47;
  uint64_t v48;
  __int128 v49;
  SharedLibrary *v50;
  std::__shared_weak_count *v51;
  uint64_t v52[3];
  void *v53;
  char *v54;
  char *v55;
  unsigned __int8 uu[8];
  uint64_t v57;
  void (*v58)(_QWORD *);
  void *v59;
  unsigned __int8 *v60;
  void **p_p;
  SharedLibrary *v62;
  unsigned __int8 v63[8];
  unsigned __int8 *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v2 = (SharedCache *)*((_QWORD *)this + 16);
  if (!v2)
    return 0;
  *(_QWORD *)uu = SharedCache::uuid(v2);
  v57 = v3;
  if (uuid_is_null(uu))
    return 0;
  v53 = 0;
  v54 = 0;
  v55 = 0;
  std::vector<_CSBinaryImageInformation>::reserve(&v53, 0x64uLL);
  memset(v52, 0, sizeof(v52));
  v6 = (__int128 *)*((_QWORD *)this + 1);
  v7 = (__int128 *)*((_QWORD *)this + 2);
  for (i = this; v6 != v7; v6 += 2)
  {
    v49 = *v6;
    v8 = (std::__shared_weak_count *)*((_QWORD *)v6 + 3);
    v50 = (SharedLibrary *)*((_QWORD *)v6 + 2);
    v51 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    if ((ProcessLibrary::isInSharedCacheCheckAfterPostprocessingDone((ProcessLibrary *)&v49) & 1) == 0)
    {
      ProcessLibrary::path((ProcessLibrary *)&v49, uu);
      if ((_BYTE)v58)
      {
        *(_QWORD *)v63 = ProcessLibrary::uuid((ProcessLibrary *)&v49);
        v64 = v11;
        if (!uuid_is_null(v63))
        {
          ProcessLibrary::slide((ProcessLibrary *)&v49);
          if (v15)
          {
            v16 = ProcessLibrary::uuid((ProcessLibrary *)&v49);
            v18 = v17;
            ProcessLibrary::path((ProcessLibrary *)&v49, uu);
            if (!(_BYTE)v58)
              std::__throw_bad_optional_access[abi:ne180100]();
            v19 = *(_QWORD *)uu;
            v20 = ProcessLibrary::architecture((ProcessLibrary *)&v49);
            if (ProcessLibrary::isPrimaryExecutableCheckAfterPostprocessingDone((ProcessLibrary *)&v49))
              v21 = 16;
            else
              v21 = 0;
            v22 = ProcessLibrary::slide((ProcessLibrary *)&v49);
            if (!v23)
              std::__throw_bad_optional_access[abi:ne180100]();
            v24 = v22;
            __p = 0;
            v47 = 0;
            v48 = 0;
            v25 = ProcessLibrary::segmentCountCheckAfterPostprocessingDone((ProcessLibrary *)&v49);
            if (v26)
              std::vector<_CSBinaryRelocationInformation>::reserve(&__p, (unint64_t)v25);
            if (v50)
            {
              *(_QWORD *)v63 = 0;
              v64 = v63;
              v65 = 0x2000000000;
              v66 = 0;
              SharedLibrary::csSymbolOwner(v50);
              *(_QWORD *)uu = MEMORY[0x24BDAC760];
              v57 = 0x40000000;
              v58 = ___ZNK14ProcessLibrary14forEachSegmentIZN7Process50createTransientProcessSymbolicatorFromDescriptionsEvE3__0EEvT__block_invoke;
              v59 = &unk_24EDD52D0;
              v60 = v63;
              p_p = &__p;
              v62 = v24;
              CSSymbolOwnerForeachSegment();
              _Block_object_dispose(v63, 8);
            }
            v28 = __p;
            v27 = v47;
            std::vector<std::vector<_CSBinaryRelocationInformation>>::push_back[abi:ne180100](v52, (uint64_t)&__p);
            v29 = -858993459 * ((unint64_t)(v27 - v28) >> 3);
            v30 = v54;
            if (v54 >= v55)
            {
              v32 = (v54 - (_BYTE *)v53) >> 6;
              v33 = v32 + 1;
              if ((unint64_t)(v32 + 1) >> 58)
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              v34 = v55 - (_BYTE *)v53;
              if ((v55 - (_BYTE *)v53) >> 5 > v33)
                v33 = v34 >> 5;
              if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFC0)
                v35 = 0x3FFFFFFFFFFFFFFLL;
              else
                v35 = v33;
              if (v35)
                v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)&v55, v35);
              else
                v36 = 0;
              v37 = &v36[64 * v32];
              *((_QWORD *)v37 + 2) = v16;
              *((_QWORD *)v37 + 3) = v18;
              *((_QWORD *)v37 + 4) = v20;
              *((_QWORD *)v37 + 5) = v19;
              *((_QWORD *)v37 + 6) = v28;
              *((_DWORD *)v37 + 14) = v29;
              *((_DWORD *)v37 + 15) = v21;
              v39 = (char *)v53;
              v38 = v54;
              v40 = v37;
              if (v54 != v53)
              {
                do
                {
                  v41 = *((_OWORD *)v38 - 4);
                  v42 = *((_OWORD *)v38 - 3);
                  v43 = *((_OWORD *)v38 - 1);
                  *((_OWORD *)v40 - 2) = *((_OWORD *)v38 - 2);
                  *((_OWORD *)v40 - 1) = v43;
                  *((_OWORD *)v40 - 4) = v41;
                  *((_OWORD *)v40 - 3) = v42;
                  v40 -= 64;
                  v38 -= 64;
                }
                while (v38 != v39);
                v38 = v39;
              }
              v31 = v37 + 64;
              v53 = v40;
              v54 = v37 + 64;
              v55 = &v36[64 * v35];
              if (v38)
                operator delete(v38);
            }
            else
            {
              *((_QWORD *)v54 + 2) = v16;
              *((_QWORD *)v30 + 3) = v18;
              *((_QWORD *)v30 + 4) = v20;
              *((_QWORD *)v30 + 5) = v19;
              *((_QWORD *)v30 + 6) = v28;
              v31 = v30 + 64;
              *((_DWORD *)v30 + 14) = v29;
              *((_DWORD *)v30 + 15) = v21;
            }
            v54 = v31;
            if (__p)
            {
              v47 = __p;
              operator delete(__p);
            }
          }
        }
      }
    }
    v12 = v51;
    if (v51)
    {
      v13 = (unint64_t *)&v51->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  *(_QWORD *)uu = SharedCache::uuid(*((SharedCache **)i + 16));
  v57 = v44;
  SharedCache::loadAddress(*((SharedCache **)i + 16));
  v4 = CSSymbolicatorCreateWithBinaryImageListPidAndSharedCacheUUID();
  *(_QWORD *)uu = v52;
  std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100]((void ***)uu);
  if (v53)
  {
    v54 = (char *)v53;
    operator delete(v53);
  }
  return v4;
}

void sub_22638B858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  uint64_t v24;

  if (__p)
    operator delete(__p);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](a9);
  *(_QWORD *)(v24 - 144) = &a20;
  std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v24 - 144));
  if (a23)
  {
    a24 = (uint64_t)a23;
    operator delete(a23);
  }
  _Unwind_Resume(a1);
}

void std::vector<_CSBinaryImageInformation>::reserve(void **a1, unint64_t a2)
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
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 6)
  {
    if (a2 >> 58)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFC0];
    v9 = &v6[64 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 4);
        v14 = *((_OWORD *)v10 - 3);
        v15 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v15;
        *((_OWORD *)v12 - 4) = v13;
        *((_OWORD *)v12 - 3) = v14;
        v12 -= 64;
        v10 -= 64;
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

void std::vector<_CSBinaryRelocationInformation>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 40;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(v3, a2);
    v7 = &v6[40 * v5];
    v9 = &v6[40 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 40);
        v14 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
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

uint64_t std::vector<std::vector<_CSBinaryRelocationInformation>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(result, v12);
    v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0;
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_QWORD *)v14 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<_CSBinaryRelocationInformation>>::__swap_out_circular_buffer(a1, v16);
    v8 = (_QWORD *)a1[1];
    result = std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v7[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_22638BB98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  __int128 *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  char v18;
  _BOOL4 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;

  v7 = a2;
  v8 = a1;
  v22 = a2;
  v23 = a1;
  while (2)
  {
    v9 = 1 - a4;
LABEL_3:
    v10 = (char *)v7 - (char *)v8;
    v11 = ((char *)v7 - (char *)v8) >> 5;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v20 = *((_QWORD *)v7 - 4);
        v22 = v7 - 2;
        if (v20 < *(_QWORD *)v8)
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v23, &v22);
        return;
      case 3uLL:
        v22 = v7 - 2;
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, v8 + 2, v7 - 2);
        return;
      case 4uLL:
        v22 = v7 - 2;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, v8 + 2, v8 + 4, v7 - 2);
        return;
      case 5uLL:
        v22 = v7 - 2;
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, v8 + 2, v8 + 4, v8 + 6, v7 - 2);
        return;
      default:
        if (v10 <= 767)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, v7);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, v7);
          return;
        }
        if (v9 == 1)
        {
          if (v8 != v7)
            std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,ProcessLibrary *>(v8, v7, v7, a3);
          return;
        }
        v12 = v11 >> 1;
        v13 = v7 - 2;
        if ((unint64_t)v10 <= 0x1000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(&v8[2 * (v11 >> 1)], v8, v13);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v8, &v8[2 * (v11 >> 1)], v13);
          v14 = v22;
          v15 = 32 * v12 - 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v23 + 2, (__int128 *)((char *)v23 + v15), v22 - 4);
          v16 = 32 * v12 + 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v23 + 4, (__int128 *)((char *)v23 + v16), v14 - 6);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((__int128 *)((char *)v23 + v15), &v23[2 * v12], (__int128 *)((char *)v23 + v16));
          v21 = &v23[2 * v12];
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v23, &v21);
        }
        if ((a5 & 1) == 0)
        {
          v7 = v22;
          if (*((_QWORD *)v23 - 4) < *(_QWORD *)v23)
            goto LABEL_12;
          v8 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>((uint64_t)v23, v22);
LABEL_21:
          a5 = 0;
          v23 = v8;
          a4 = -v9;
          continue;
        }
        v7 = v22;
LABEL_12:
        v17 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>((uint64_t)v23, v7);
        if ((v18 & 1) == 0)
        {
LABEL_19:
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v23, v17, a3, -v9, a5 & 1);
          v8 = v17 + 2;
          goto LABEL_21;
        }
        v19 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v23, v17);
        v8 = v17 + 2;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v17 + 2, v7))
        {
          if (v19)
          {
            v23 = v17 + 2;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        if (!v19)
        {
          v22 = v17;
          v8 = v23;
          v7 = v17;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }
        return;
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(__int128 **a1, __int128 **a2)
{
  __int128 *v2;
  __int128 *v3;
  __int128 v4;
  _QWORD *v5;
  __int128 v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  v3 = *a2;
  v4 = **a1;
  v2 = *a1;
  v6 = (*a1)[1];
  v5 = *a1 + 1;
  v10 = v4;
  v11 = v6;
  *((_QWORD *)v2 + 3) = 0;
  *v5 = 0;
  *v2 = *v3;
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)v5, v3 + 1);
  *v3 = v10;
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v3 + 1), &v11);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  __int128 *v11;
  unint64_t v12;
  _OWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 != a2)
  {
    v19 = v2;
    v20 = v3;
    v6 = a1 + 2;
    if (a1 + 2 != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = v6;
        if (*((_QWORD *)v8 + 4) < *(_QWORD *)v8)
        {
          v17 = *v6;
          v18 = v8[3];
          *((_QWORD *)v8 + 6) = 0;
          *((_QWORD *)v8 + 7) = 0;
          v10 = v7;
          while (1)
          {
            *(_OWORD *)((char *)a1 + v10 + 32) = *(_OWORD *)((char *)a1 + v10);
            v11 = (_OWORD *)((char *)a1 + v10 + 16);
            std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)a1 + v10 + 48, v11);
            if (!v10)
              break;
            v12 = *(_QWORD *)((char *)a1 + v10 - 32);
            v10 -= 32;
            if ((unint64_t)v17 >= v12)
            {
              v13 = (_OWORD *)((char *)a1 + v10 + 32);
              goto LABEL_10;
            }
          }
          v13 = a1;
LABEL_10:
          *v13 = v17;
          std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)v11, &v18);
          v14 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
          if (*((_QWORD *)&v18 + 1))
          {
            v15 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
            do
              v16 = __ldaxr(v15);
            while (__stlxr(v16 - 1, v15));
            if (!v16)
            {
              ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
              std::__shared_weak_count::__release_weak(v14);
            }
          }
        }
        v6 = v9 + 2;
        v7 += 32;
        v8 = v9;
      }
      while (v9 + 2 != a2);
    }
  }
}

_OWORD *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(_OWORD *result, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v5;
  __int128 *v6;
  _OWORD *v7;
  __int128 *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  if (result != a2)
  {
    v15 = v2;
    v16 = v3;
    v5 = result + 2;
    if (result + 2 != a2)
    {
      v6 = result + 1;
      do
      {
        v7 = v5;
        if (*((_QWORD *)result + 4) < *(_QWORD *)result)
        {
          v13 = *v5;
          v14 = result[3];
          *((_QWORD *)result + 6) = 0;
          *((_QWORD *)result + 7) = 0;
          v8 = v6;
          do
          {
            v8[1] = *(v8 - 1);
            std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v8 + 2), v8);
            v9 = *((_QWORD *)v8 - 6);
            v8 -= 2;
          }
          while ((unint64_t)v13 < v9);
          v8[1] = v13;
          std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v8 + 2), &v14);
          v10 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
          if (*((_QWORD *)&v14 + 1))
          {
            v11 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
            do
              v12 = __ldaxr(v11);
            while (__stlxr(v12 - 1, v11));
            if (!v12)
            {
              ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
              std::__shared_weak_count::__release_weak(v10);
            }
          }
        }
        v5 = v7 + 2;
        v6 += 2;
        result = v7;
      }
      while (v7 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(__int128 *a1, __int128 *a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 **v5;
  __int128 **v6;
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;

  v10 = a1;
  v8 = a3;
  v9 = a2;
  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)a3;
  if (*(_QWORD *)a2 < *(_QWORD *)a1)
  {
    if (v4 < v3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, &v8);
      return 1;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, &v9);
    if (*(_QWORD *)v8 >= *(_QWORD *)v9)
      return 1;
    v5 = &v9;
    v6 = &v8;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v9, &v8);
    if (*(_QWORD *)v9 >= *(_QWORD *)v10)
      return 1;
    v5 = &v10;
    v6 = &v9;
    goto LABEL_9;
  }
  return 0;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 *v4;
  unint64_t v5;
  __int128 *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 *v9;
  unint64_t v10;
  __int128 *v11;
  __int128 *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 *v19;
  __int128 *v20;

  v19 = a2;
  v3 = a1 + 16;
  v17 = *(_OWORD *)a1;
  v18 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if ((unint64_t)v17 >= *((_QWORD *)a2 - 4))
  {
    v6 = (__int128 *)(a1 + 32);
    do
    {
      v4 = v6;
      if (v6 >= a2)
        break;
      v6 += 2;
    }
    while ((unint64_t)v17 >= *(_QWORD *)v4);
  }
  else
  {
    v4 = (__int128 *)a1;
    do
    {
      v5 = *((_QWORD *)v4 + 4);
      v4 += 2;
    }
    while ((unint64_t)v17 >= v5);
  }
  v20 = v4;
  if (v4 < a2)
  {
    do
    {
      v7 = *((_QWORD *)a2 - 4);
      a2 -= 2;
    }
    while ((unint64_t)v17 < v7);
    v19 = a2;
  }
  if (v4 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v20, &v19);
      v4 = v20;
      do
      {
        v8 = *((_QWORD *)v4 + 4);
        v4 += 2;
      }
      while ((unint64_t)v17 >= v8);
      v20 = v4;
      v9 = v19;
      do
      {
        v10 = *((_QWORD *)v9 - 4);
        v9 -= 2;
      }
      while ((unint64_t)v17 < v10);
      v19 = v9;
    }
    while (v4 < v9);
  }
  v11 = v4 - 2;
  if (v4 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *v11;
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v3, v4 - 1);
  }
  *v11 = v17;
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v4 - 1), &v18);
  v12 = v20;
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v12;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 *v10;
  unint64_t v11;
  __int128 *v12;
  unint64_t v13;
  __int128 *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 *v21;
  __int128 *v22;

  v4 = 0;
  v5 = a1 + 16;
  v19 = *(_OWORD *)a1;
  v20 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  do
  {
    v6 = *(_QWORD *)(a1 + v4 + 32);
    v4 += 32;
  }
  while (v6 < (unint64_t)v19);
  v7 = a1 + v4;
  v22 = (__int128 *)(a1 + v4);
  if (v4 == 32)
  {
    do
    {
      if (v7 >= (unint64_t)a2)
        break;
      v9 = *((_QWORD *)a2 - 4);
      a2 -= 2;
    }
    while (v9 >= (unint64_t)v19);
  }
  else
  {
    do
    {
      v8 = *((_QWORD *)a2 - 4);
      a2 -= 2;
    }
    while (v8 >= (unint64_t)v19);
  }
  v21 = a2;
  v10 = (__int128 *)(a1 + v4);
  if (v7 < (unint64_t)a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v22, &v21);
      v10 = v22;
      do
      {
        v11 = *((_QWORD *)v10 + 4);
        v10 += 2;
      }
      while (v11 < (unint64_t)v19);
      v22 = v10;
      v12 = v21;
      do
      {
        v13 = *((_QWORD *)v12 - 4);
        v12 -= 2;
      }
      while (v13 >= (unint64_t)v19);
      v21 = v12;
    }
    while (v10 < v12);
  }
  v14 = v10 - 2;
  if (v10 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *v14;
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v5, v10 - 1);
  }
  *v14 = v19;
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v10 - 1), &v20);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v10 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(__int128 *a1, __int128 *a2)
{
  __int128 *v2;
  uint64_t v4;
  _BOOL8 result;
  unint64_t v6;
  __int128 *v7;
  __int128 *v8;
  int v9;
  __int128 *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  __int128 *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  __int128 *v19;

  v2 = a2;
  v18 = a2;
  v19 = a1;
  v4 = ((char *)a2 - (char *)a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *((_QWORD *)a2 - 4);
      v18 = a2 - 2;
      if (v6 < *(_QWORD *)a1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v19, &v18);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      v7 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a1 + 4);
      v8 = a1 + 6;
      if (a1 + 6 == v2)
        return 1;
      v9 = 0;
      break;
  }
  while (*(_QWORD *)v8 >= *(_QWORD *)v7)
  {
LABEL_17:
    v7 = v8;
    v8 += 2;
    if (v8 == v2)
      return 1;
  }
  v16 = *v8;
  v17 = v8[1];
  *((_QWORD *)v8 + 2) = 0;
  *((_QWORD *)v8 + 3) = 0;
  do
  {
    v10 = v7;
    v7[2] = *v7;
    v11 = (uint64_t)(v7 + 1);
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v7 + 3), v7 + 1);
    if (v7 == v19)
      break;
    v7 -= 2;
  }
  while ((unint64_t)v16 < *((_QWORD *)v10 - 4));
  *v10 = v16;
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v11, &v17);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  v13 = v18;
  if (*((_QWORD *)&v17 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (++v9 != 8)
  {
    v2 = v18;
    goto LABEL_17;
  }
  return v8 + 2 == v13;
}

uint64_t std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4)
{
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;

  v10 = a2;
  v11 = a1;
  v8 = a4;
  v9 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a2, a3);
  if (*(_QWORD *)a4 < *(_QWORD *)a3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v9, &v8);
    if (*(_QWORD *)v9 < *(_QWORD *)a2)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, &v9);
      if (*(_QWORD *)v10 < *(_QWORD *)a1)
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v11, &v10);
    }
  }
}

void std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5)
{
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;

  v13 = a2;
  v14 = a1;
  v11 = a4;
  v12 = a3;
  v10 = a5;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a2, a3, a4);
  if (*(_QWORD *)a5 < *(_QWORD *)a4)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v11, &v10);
    if (*(_QWORD *)v11 < *(_QWORD *)a3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v12, &v11);
      if (*(_QWORD *)v12 < *(_QWORD *)a2)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v13, &v12);
        if (*(_QWORD *)v13 < *(_QWORD *)a1)
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v14, &v13);
      }
    }
  }
}

__int128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,ProcessLibrary *>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  __int128 *v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  __int128 *v18;
  __int128 *v19;

  v19 = a1;
  if (a1 != a2)
  {
    v6 = a2;
    v7 = a1;
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) >> 5;
    if ((char *)a2 - (char *)a1 >= 33)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (unint64_t *)&a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((uint64_t)v7, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    v18 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      v13 = v6;
      do
      {
        if (*(_QWORD *)v13 < *(_QWORD *)v19)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v18, &v19);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((uint64_t)v19, a4, v9, (unint64_t *)v19);
          v13 = v18;
        }
        v13 += 2;
        v18 = v13;
      }
      while (v13 != a3);
      v7 = v19;
      v8 = (char *)v6 - (char *)v19;
    }
    if (v8 >= 33)
    {
      v14 = (unint64_t)v8 >> 5;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ProcessLibrary *>((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 2;
        v15 = v14 >= 2;
        v16 = v14-- == 2;
      }
      while (!v16 && v15);
      return v18;
    }
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v26 = v4;
    v27 = v5;
    v8 = (uint64_t)a4 - a1;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= ((uint64_t)a4 - a1) >> 5)
    {
      v11 = v8 >> 4;
      v12 = (v8 >> 4) + 1;
      v13 = (unint64_t *)(a1 + 32 * v12);
      v14 = v11 + 2;
      if (v11 + 2 >= a3)
      {
        v15 = *v13;
      }
      else
      {
        v15 = v13[4];
        v16 = *v13 >= v15;
        if (*v13 > v15)
          v15 = *v13;
        if (!v16)
        {
          v13 += 4;
          v12 = v14;
        }
      }
      if (v15 >= *a4)
      {
        v24 = *(_OWORD *)a4;
        v25 = *((_OWORD *)a4 + 1);
        a4[2] = 0;
        a4[3] = 0;
        do
        {
          v17 = v13;
          *(_OWORD *)a4 = *(_OWORD *)v13;
          v18 = (uint64_t)(v13 + 2);
          std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(a4 + 2), (__int128 *)v13 + 1);
          if (v9 < v12)
            break;
          v13 = (unint64_t *)(a1 + 32 * ((2 * v12) | 1));
          if (2 * v12 + 2 >= a3)
          {
            v19 = *v13;
            v12 = (2 * v12) | 1;
          }
          else
          {
            v19 = v13[4];
            v20 = *v13 >= v19;
            if (*v13 > v19)
              v19 = *v13;
            if (v20)
            {
              v12 = (2 * v12) | 1;
            }
            else
            {
              v13 += 4;
              v12 = 2 * v12 + 2;
            }
          }
          a4 = v17;
        }
        while (v19 >= (unint64_t)v24);
        *(_OWORD *)v17 = v24;
        std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v18, &v25);
        v21 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1))
        {
          v22 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;

  if (a4 >= 2)
  {
    v14 = *(_OWORD *)a1;
    v15 = *(_OWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    v7 = (_OWORD *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((_OWORD *)a1, a3, a4);
    v8 = (_OWORD *)(a2 - 32);
    v9 = (uint64_t)(v7 + 1);
    if (v7 == (_OWORD *)(a2 - 32))
    {
      *v7 = v14;
      std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v9, &v15);
    }
    else
    {
      *v7 = *v8;
      v10 = (__int128 *)(a2 - 16);
      std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v9, v10);
      *v8 = v14;
      std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)v10, &v15);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, (uint64_t)(v7 + 2), a3, ((uint64_t)v7 - a1 + 32) >> 5);
    }
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_22638CCBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = 0;
  v5 = a3 - 2;
  if (a3 < 2)
    v5 = a3 - 1;
  v6 = v5 >> 1;
  do
  {
    v7 = (uint64_t)&a1[2 * v4 + 2];
    v8 = (2 * v4) | 1;
    v9 = 2 * v4 + 2;
    if (v9 < a3 && *(_QWORD *)v7 < *(_QWORD *)(v7 + 32))
    {
      v7 += 32;
      v8 = v9;
    }
    *a1 = *(_OWORD *)v7;
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(a1 + 1), (__int128 *)(v7 + 16));
    a1 = (_OWORD *)v7;
    v4 = v8;
  }
  while (v8 <= v6);
  return v7;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v18 = v4;
    v19 = v5;
    v8 = v6 >> 1;
    v9 = (__int128 *)(a1 + 32 * (v6 >> 1));
    v10 = (__int128 *)(a2 - 32);
    if (*(_QWORD *)v9 < *(_QWORD *)(a2 - 32))
    {
      v16 = *v10;
      v17 = *(_OWORD *)(a2 - 16);
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      do
      {
        v11 = v9;
        *v10 = *v9;
        v12 = (uint64_t)(v9 + 1);
        std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(v10 + 1), v9 + 1);
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = (__int128 *)(a1 + 32 * v8);
        v10 = v11;
      }
      while (*(_QWORD *)v9 < (unint64_t)v16);
      *v11 = v16;
      std::shared_ptr<SharedLibrary>::operator=[abi:ne180100](v12, &v17);
      v13 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
      if (*((_QWORD *)&v17 + 1))
      {
        v14 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }
}

void std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

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
        v6 = v4 - 32;
        std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)(v4 - 16));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 *v15;
  uint64_t v16;
  unint64_t *v17;
  __int128 *v18;
  unint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t *v23;
  char v24;
  BOOL v25;
  char *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;

LABEL_1:
  v9 = (__int128 *)a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0x8E38E38E38E38E39 * (((char *)a2 - (char *)v9) >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v27 = *((_QWORD *)a2 - 9);
        v26 = (char *)a2 - 72;
        if (v27 < *(_QWORD *)v9)
        {
          v39 = *v9;
          v51 = *((_QWORD *)v9 + 8);
          v45 = v9[2];
          v48 = v9[3];
          v42 = v9[1];
          v29 = *((_OWORD *)v26 + 2);
          v28 = *((_OWORD *)v26 + 3);
          v30 = *((_OWORD *)v26 + 1);
          *((_QWORD *)v9 + 8) = *((_QWORD *)v26 + 8);
          v9[2] = v29;
          v9[3] = v28;
          v9[1] = v30;
          *v9 = *(_OWORD *)v26;
          *((_OWORD *)v26 + 2) = v45;
          *((_OWORD *)v26 + 3) = v48;
          *((_QWORD *)v26 + 8) = v51;
          *(_OWORD *)v26 = v39;
          *((_OWORD *)v26 + 1) = v42;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v9, (unint64_t *)v9 + 9, (unint64_t *)a2 - 9);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v9, (uint64_t)v9 + 72, (uint64_t)(v9 + 9), (uint64_t)a2 - 72);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v9, (uint64_t)v9 + 72, (uint64_t)(v9 + 9), (uint64_t)v9 + 216, (uint64_t)a2 - 72);
        return;
      default:
        if (v12 > 1727)
        {
          if (v11 == 1)
          {
            if (v9 != a2)
              std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,AOTImage *>((uint64_t)v9, a2, a2, a3);
            return;
          }
          v14 = v13 >> 1;
          v15 = (__int128 *)((char *)v9 + 72 * (v13 >> 1));
          if ((unint64_t)v12 < 0x2401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v15, (unint64_t *)v9, (unint64_t *)a2 - 9);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v9, (unint64_t *)v15, (unint64_t *)a2 - 9);
            v16 = 9 * v14;
            v17 = (unint64_t *)v9 + 9 * v14 - 9;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((__int128 *)((char *)v9 + 72), v17, (unint64_t *)a2 - 18);
            v18 = v9 + 9;
            v19 = (unint64_t *)v9 + v16 + 9;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v18, v19, (unint64_t *)a2 - 27);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((__int128 *)v17, (unint64_t *)v15, v19);
            v38 = *(_OWORD *)a1;
            v50 = *(_QWORD *)(a1 + 64);
            v44 = *(_OWORD *)(a1 + 32);
            v47 = *(_OWORD *)(a1 + 48);
            v41 = *(_OWORD *)(a1 + 16);
            v21 = v15[2];
            v20 = v15[3];
            v22 = v15[1];
            *(_QWORD *)(a1 + 64) = *((_QWORD *)v15 + 8);
            *(_OWORD *)(a1 + 32) = v21;
            *(_OWORD *)(a1 + 48) = v20;
            *(_OWORD *)(a1 + 16) = v22;
            *(_OWORD *)a1 = *v15;
            *((_QWORD *)v15 + 8) = v50;
            v15[2] = v44;
            v15[3] = v47;
            v15[1] = v41;
            *v15 = v38;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (*(_QWORD *)(a1 - 72) >= *(_QWORD *)a1)
          {
            v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>((uint64_t *)a1, (unint64_t)a2);
            goto LABEL_16;
          }
LABEL_11:
          v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>((uint64_t *)a1, (unint64_t)a2);
          if ((v24 & 1) == 0)
            goto LABEL_14;
          v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, (uint64_t)v23);
          v9 = (__int128 *)(v23 + 9);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)(v23 + 9), (uint64_t)a2))
          {
            v10 = v11 + 1;
            if (v25)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(a1, v23, a3, -v11, a5 & 1);
            v9 = (__int128 *)(v23 + 9);
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (__int128 *)v23;
          if (v25)
            return;
          goto LABEL_1;
        }
        if ((a5 & 1) != 0)
        {
          std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v9, (uint64_t)a2);
        }
        else if (v9 != a2)
        {
          v31 = (__int128 *)((char *)v9 + 72);
          while (v31 != a2)
          {
            v32 = (uint64_t)v31;
            v33 = *(_QWORD *)(a1 + 72);
            if (v33 < *(_QWORD *)a1)
            {
              v40 = *(_OWORD *)(a1 + 80);
              v43 = *(_OWORD *)(a1 + 96);
              v46 = *(_OWORD *)(a1 + 112);
              v49 = *(_OWORD *)(a1 + 128);
              v34 = v32;
              do
              {
                v35 = *(_OWORD *)(v34 - 56);
                v36 = *(_OWORD *)(v34 - 24);
                *(_OWORD *)(v34 + 32) = *(_OWORD *)(v34 - 40);
                *(_OWORD *)(v34 + 48) = v36;
                *(_QWORD *)(v34 + 64) = *(_QWORD *)(v34 - 8);
                *(_OWORD *)v34 = *(_OWORD *)(v34 - 72);
                *(_OWORD *)(v34 + 16) = v35;
                v37 = *(_QWORD *)(v34 - 144);
                v34 -= 72;
              }
              while (v33 < v37);
              *(_QWORD *)v34 = v33;
              *(_OWORD *)(v34 + 56) = v49;
              *(_OWORD *)(v34 + 40) = v46;
              *(_OWORD *)(v34 + 24) = v43;
              *(_OWORD *)(v34 + 8) = v40;
            }
            v31 = (__int128 *)(v32 + 72);
            a1 = v32;
          }
        }
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (result != a2)
  {
    v2 = result + 72;
    if (result + 72 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v2;
        v6 = *(_QWORD *)(v4 + 72);
        if (v6 < *(_QWORD *)v4)
        {
          v12 = *(_OWORD *)(v4 + 80);
          v13 = *(_OWORD *)(v4 + 96);
          v14 = *(_OWORD *)(v4 + 112);
          v15 = *(_OWORD *)(v4 + 128);
          v7 = v3;
          while (1)
          {
            v8 = result + v7;
            v9 = *(_OWORD *)(result + v7);
            *(_OWORD *)(v8 + 88) = *(_OWORD *)(result + v7 + 16);
            v10 = *(_OWORD *)(result + v7 + 48);
            *(_OWORD *)(v8 + 104) = *(_OWORD *)(result + v7 + 32);
            *(_OWORD *)(v8 + 120) = v10;
            *(_QWORD *)(v8 + 136) = *(_QWORD *)(result + v7 + 64);
            *(_OWORD *)(v8 + 72) = v9;
            if (!v7)
              break;
            v7 -= 72;
            if (v6 >= *(_QWORD *)(v8 - 72))
            {
              v11 = result + v7 + 72;
              goto LABEL_10;
            }
          }
          v11 = result;
LABEL_10:
          *(_QWORD *)v11 = v6;
          *(_OWORD *)(v11 + 8) = v12;
          *(_OWORD *)(v11 + 24) = v13;
          *(_OWORD *)(v11 + 40) = v14;
          *(_OWORD *)(v11 + 56) = v15;
        }
        v2 = v5 + 72;
        v3 += 72;
        v4 = v5;
      }
      while (v5 + 72 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(__int128 *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t result;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;

  v3 = *a2;
  v4 = *a3;
  if (*a2 >= *(_QWORD *)a1)
  {
    if (v4 >= v3)
      return 0;
    v34 = *((_OWORD *)a2 + 2);
    v39 = *((_OWORD *)a2 + 3);
    v44 = a2[8];
    v24 = *(_OWORD *)a2;
    v29 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    v12 = *((_OWORD *)a3 + 2);
    v11 = *((_OWORD *)a3 + 3);
    v13 = *((_OWORD *)a3 + 1);
    a2[8] = a3[8];
    *((_OWORD *)a2 + 2) = v12;
    *((_OWORD *)a2 + 3) = v11;
    *((_OWORD *)a2 + 1) = v13;
    a3[8] = v44;
    *((_OWORD *)a3 + 2) = v34;
    *((_OWORD *)a3 + 3) = v39;
    *(_OWORD *)a3 = v24;
    *((_OWORD *)a3 + 1) = v29;
    if (*a2 < *(_QWORD *)a1)
    {
      v35 = a1[2];
      v40 = a1[3];
      v45 = *((_QWORD *)a1 + 8);
      v25 = *a1;
      v30 = a1[1];
      *a1 = *(_OWORD *)a2;
      v15 = *((_OWORD *)a2 + 2);
      v14 = *((_OWORD *)a2 + 3);
      v16 = *((_OWORD *)a2 + 1);
      *((_QWORD *)a1 + 8) = a2[8];
      a1[2] = v15;
      a1[3] = v14;
      a1[1] = v16;
      a2[8] = v45;
      *((_OWORD *)a2 + 2) = v35;
      *((_OWORD *)a2 + 3) = v40;
      result = 2;
      *(_OWORD *)a2 = v25;
      *((_OWORD *)a2 + 1) = v30;
      return result;
    }
  }
  else
  {
    if (v4 < v3)
    {
      v33 = a1[2];
      v38 = a1[3];
      v43 = *((_QWORD *)a1 + 8);
      v23 = *a1;
      v28 = a1[1];
      *a1 = *(_OWORD *)a3;
      v6 = *((_OWORD *)a3 + 2);
      v5 = *((_OWORD *)a3 + 3);
      v7 = *((_OWORD *)a3 + 1);
      *((_QWORD *)a1 + 8) = a3[8];
      a1[2] = v6;
      a1[3] = v5;
      a1[1] = v7;
      a3[8] = v43;
      *((_OWORD *)a3 + 2) = v33;
      *((_OWORD *)a3 + 3) = v38;
      v8 = v23;
      v9 = v28;
      result = 1;
LABEL_9:
      *(_OWORD *)a3 = v8;
      *((_OWORD *)a3 + 1) = v9;
      return result;
    }
    v36 = a1[2];
    v41 = a1[3];
    v46 = *((_QWORD *)a1 + 8);
    v26 = *a1;
    v31 = a1[1];
    *a1 = *(_OWORD *)a2;
    v18 = *((_OWORD *)a2 + 2);
    v17 = *((_OWORD *)a2 + 3);
    v19 = *((_OWORD *)a2 + 1);
    *((_QWORD *)a1 + 8) = a2[8];
    a1[2] = v18;
    a1[3] = v17;
    a1[1] = v19;
    a2[8] = v46;
    *((_OWORD *)a2 + 2) = v36;
    *((_OWORD *)a2 + 3) = v41;
    *(_OWORD *)a2 = v26;
    *((_OWORD *)a2 + 1) = v31;
    if (*a3 < *a2)
    {
      v37 = *((_OWORD *)a2 + 2);
      v42 = *((_OWORD *)a2 + 3);
      v47 = a2[8];
      v27 = *(_OWORD *)a2;
      v32 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      v21 = *((_OWORD *)a3 + 2);
      v20 = *((_OWORD *)a3 + 3);
      v22 = *((_OWORD *)a3 + 1);
      a2[8] = a3[8];
      *((_OWORD *)a2 + 2) = v21;
      *((_OWORD *)a2 + 3) = v20;
      *((_OWORD *)a2 + 1) = v22;
      a3[8] = v47;
      *((_OWORD *)a3 + 2) = v37;
      *((_OWORD *)a3 + 3) = v42;
      v8 = v27;
      v9 = v32;
      result = 2;
      goto LABEL_9;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  __int128 *v3;
  unint64_t v4;
  __int128 *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v2 = *a1;
  v16 = *(_OWORD *)(a1 + 1);
  v17 = *(_OWORD *)(a1 + 3);
  v18 = *(_OWORD *)(a1 + 5);
  v19 = *(_OWORD *)(a1 + 7);
  if ((unint64_t)*a1 >= *(_QWORD *)(a2 - 72))
  {
    v5 = (__int128 *)(a1 + 9);
    do
    {
      v3 = v5;
      if ((unint64_t)v5 >= a2)
        break;
      v5 = (__int128 *)((char *)v5 + 72);
    }
    while (v2 >= *(_QWORD *)v3);
  }
  else
  {
    v3 = (__int128 *)a1;
    do
    {
      v4 = *((_QWORD *)v3 + 9);
      v3 = (__int128 *)((char *)v3 + 72);
    }
    while (v2 >= v4);
  }
  if ((unint64_t)v3 < a2)
  {
    do
    {
      v6 = *(_QWORD *)(a2 - 72);
      a2 -= 72;
    }
    while (v2 < v6);
  }
  while ((unint64_t)v3 < a2)
  {
    v20 = *v3;
    v24 = *((_QWORD *)v3 + 8);
    v22 = v3[2];
    v23 = v3[3];
    v21 = v3[1];
    v8 = *(_OWORD *)(a2 + 32);
    v7 = *(_OWORD *)(a2 + 48);
    v9 = *(_OWORD *)(a2 + 16);
    *((_QWORD *)v3 + 8) = *(_QWORD *)(a2 + 64);
    v3[2] = v8;
    v3[3] = v7;
    v3[1] = v9;
    *v3 = *(_OWORD *)a2;
    *(_QWORD *)(a2 + 64) = v24;
    *(_OWORD *)(a2 + 32) = v22;
    *(_OWORD *)(a2 + 48) = v23;
    *(_OWORD *)(a2 + 16) = v21;
    *(_OWORD *)a2 = v20;
    do
    {
      v10 = *((_QWORD *)v3 + 9);
      v3 = (__int128 *)((char *)v3 + 72);
    }
    while (v2 >= v10);
    do
    {
      v11 = *(_QWORD *)(a2 - 72);
      a2 -= 72;
    }
    while (v2 < v11);
  }
  if ((uint64_t *)((char *)v3 - 72) != a1)
  {
    *(_OWORD *)a1 = *(__int128 *)((char *)v3 - 72);
    v12 = *(__int128 *)((char *)v3 - 56);
    v13 = *(__int128 *)((char *)v3 - 40);
    v14 = *(__int128 *)((char *)v3 - 24);
    a1[8] = *((_QWORD *)v3 - 1);
    *((_OWORD *)a1 + 2) = v13;
    *((_OWORD *)a1 + 3) = v14;
    *((_OWORD *)a1 + 1) = v12;
  }
  *((_QWORD *)v3 - 9) = v2;
  *(v3 - 2) = v18;
  *(v3 - 1) = v19;
  *(v3 - 4) = v16;
  *(v3 - 3) = v17;
  return v3;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v2 = 0;
  v3 = *a1;
  v19 = *(_OWORD *)(a1 + 1);
  v20 = *(_OWORD *)(a1 + 3);
  v21 = *(_OWORD *)(a1 + 5);
  v22 = *(_OWORD *)(a1 + 7);
  do
  {
    v4 = a1[v2 + 9];
    v2 += 9;
  }
  while (v4 < v3);
  v5 = (unint64_t)&a1[v2];
  if (v2 == 9)
  {
    do
    {
      if (v5 >= a2)
        break;
      v7 = *(_QWORD *)(a2 - 72);
      a2 -= 72;
    }
    while (v7 >= v3);
  }
  else
  {
    do
    {
      v6 = *(_QWORD *)(a2 - 72);
      a2 -= 72;
    }
    while (v6 >= v3);
  }
  v8 = &a1[v2];
  if (v5 < a2)
  {
    v9 = a2;
    do
    {
      v25 = *((_OWORD *)v8 + 2);
      v26 = *((_OWORD *)v8 + 3);
      v27 = v8[8];
      v23 = *(_OWORD *)v8;
      v24 = *((_OWORD *)v8 + 1);
      v11 = *(_OWORD *)(v9 + 32);
      v10 = *(_OWORD *)(v9 + 48);
      v12 = *(_OWORD *)(v9 + 16);
      v8[8] = *(_QWORD *)(v9 + 64);
      *((_OWORD *)v8 + 2) = v11;
      *((_OWORD *)v8 + 3) = v10;
      *((_OWORD *)v8 + 1) = v12;
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_OWORD *)v9 = v23;
      *(_QWORD *)(v9 + 64) = v27;
      *(_OWORD *)(v9 + 32) = v25;
      *(_OWORD *)(v9 + 48) = v26;
      *(_OWORD *)(v9 + 16) = v24;
      do
      {
        v13 = v8[9];
        v8 += 9;
      }
      while (v13 < v3);
      do
      {
        v14 = *(_QWORD *)(v9 - 72);
        v9 -= 72;
      }
      while (v14 >= v3);
    }
    while ((unint64_t)v8 < v9);
  }
  if (v8 - 9 != a1)
  {
    *(_OWORD *)a1 = *(_OWORD *)(v8 - 9);
    v15 = *(_OWORD *)(v8 - 7);
    v16 = *(_OWORD *)(v8 - 5);
    v17 = *(_OWORD *)(v8 - 3);
    a1[8] = *(v8 - 1);
    *((_OWORD *)a1 + 2) = v16;
    *((_OWORD *)a1 + 3) = v17;
    *((_OWORD *)a1 + 1) = v15;
  }
  *(v8 - 9) = v3;
  *((_OWORD *)v8 - 2) = v21;
  *((_OWORD *)v8 - 1) = v22;
  *((_OWORD *)v8 - 4) = v19;
  *((_OWORD *)v8 - 3) = v20;
  return v8 - 9;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v4 = 0x8E38E38E38E38E39 * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 72);
      if (*(_QWORD *)(a2 - 72) < *(_QWORD *)a1)
      {
        v24 = *(_OWORD *)(a1 + 32);
        v26 = *(_OWORD *)(a1 + 48);
        v28 = *(_QWORD *)(a1 + 64);
        v20 = *(_OWORD *)a1;
        v22 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)a1 = *v6;
        v8 = *(_OWORD *)(a2 - 40);
        v7 = *(_OWORD *)(a2 - 24);
        v9 = *(_OWORD *)(a2 - 56);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 - 8);
        *(_OWORD *)(a1 + 32) = v8;
        *(_OWORD *)(a1 + 48) = v7;
        *(_OWORD *)(a1 + 16) = v9;
        *(_QWORD *)(a2 - 8) = v28;
        *(_OWORD *)(a2 - 40) = v24;
        *(_OWORD *)(a2 - 24) = v26;
        *v6 = v20;
        *(_OWORD *)(a2 - 56) = v22;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((__int128 *)a1, (unint64_t *)(a1 + 72), (unint64_t *)(a2 - 72));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a1 + 72, a1 + 144, a2 - 72);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a1 + 72, a1 + 144, a1 + 216, a2 - 72);
      return 1;
    default:
      v10 = (_QWORD *)(a1 + 144);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((__int128 *)a1, (unint64_t *)(a1 + 72), (unint64_t *)(a1 + 144));
      v11 = a1 + 216;
      if (a1 + 216 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *(_QWORD *)v11;
    if (*(_QWORD *)v11 < *v10)
    {
      v21 = *(_OWORD *)(v11 + 8);
      v23 = *(_OWORD *)(v11 + 24);
      v25 = *(_OWORD *)(v11 + 40);
      v27 = *(_OWORD *)(v11 + 56);
      v15 = v12;
      while (1)
      {
        v16 = a1 + v15;
        v17 = *(_OWORD *)(a1 + v15 + 144);
        *(_OWORD *)(v16 + 232) = *(_OWORD *)(a1 + v15 + 160);
        v18 = *(_OWORD *)(a1 + v15 + 192);
        *(_OWORD *)(v16 + 248) = *(_OWORD *)(a1 + v15 + 176);
        *(_OWORD *)(a1 + v15 + 264) = v18;
        *(_QWORD *)(v16 + 280) = *(_QWORD *)(a1 + v15 + 208);
        *(_OWORD *)(v16 + 216) = v17;
        if (v15 == -144)
          break;
        v15 -= 72;
        if (v14 >= *(_QWORD *)(v16 + 72))
        {
          v19 = a1 + v15 + 216;
          goto LABEL_12;
        }
      }
      v19 = a1;
LABEL_12:
      *(_QWORD *)v19 = v14;
      *(_OWORD *)(v19 + 8) = v21;
      *(_OWORD *)(v19 + 24) = v23;
      *(_OWORD *)(v19 + 40) = v25;
      *(_OWORD *)(v19 + 56) = v27;
      if (++v13 == 8)
        return v11 + 72 == a2;
    }
    v10 = (_QWORD *)v11;
    v12 += 72;
    v11 += 72;
    if (v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((__int128 *)a1, (unint64_t *)a2, (unint64_t *)a3);
  if (*(_QWORD *)a4 < *(_QWORD *)a3)
  {
    v24 = *(_OWORD *)(a3 + 32);
    v27 = *(_OWORD *)(a3 + 48);
    v30 = *(_QWORD *)(a3 + 64);
    v18 = *(__n128 *)a3;
    v21 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    v10 = *(_OWORD *)(a4 + 32);
    v9 = *(_OWORD *)(a4 + 48);
    v11 = *(_OWORD *)(a4 + 16);
    *(_QWORD *)(a3 + 64) = *(_QWORD *)(a4 + 64);
    *(_OWORD *)(a3 + 32) = v10;
    *(_OWORD *)(a3 + 48) = v9;
    *(_OWORD *)(a3 + 16) = v11;
    *(_QWORD *)(a4 + 64) = v30;
    *(_OWORD *)(a4 + 32) = v24;
    *(_OWORD *)(a4 + 48) = v27;
    result = v18;
    *(__n128 *)a4 = v18;
    *(_OWORD *)(a4 + 16) = v21;
    if (*(_QWORD *)a3 < *(_QWORD *)a2)
    {
      v25 = *(_OWORD *)(a2 + 32);
      v28 = *(_OWORD *)(a2 + 48);
      v31 = *(_QWORD *)(a2 + 64);
      v19 = *(__n128 *)a2;
      v22 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      v13 = *(_OWORD *)(a3 + 32);
      v12 = *(_OWORD *)(a3 + 48);
      v14 = *(_OWORD *)(a3 + 16);
      *(_QWORD *)(a2 + 64) = *(_QWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v12;
      *(_OWORD *)(a2 + 16) = v14;
      *(_QWORD *)(a3 + 64) = v31;
      *(_OWORD *)(a3 + 32) = v25;
      *(_OWORD *)(a3 + 48) = v28;
      result = v19;
      *(__n128 *)a3 = v19;
      *(_OWORD *)(a3 + 16) = v22;
      if (*(_QWORD *)a2 < *(_QWORD *)a1)
      {
        v26 = *(_OWORD *)(a1 + 32);
        v29 = *(_OWORD *)(a1 + 48);
        v32 = *(_QWORD *)(a1 + 64);
        v20 = *(__n128 *)a1;
        v23 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        v16 = *(_OWORD *)(a2 + 32);
        v15 = *(_OWORD *)(a2 + 48);
        v17 = *(_OWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        *(_OWORD *)(a1 + 32) = v16;
        *(_OWORD *)(a1 + 48) = v15;
        *(_OWORD *)(a1 + 16) = v17;
        *(_QWORD *)(a2 + 64) = v32;
        *(_OWORD *)(a2 + 32) = v26;
        *(_OWORD *)(a2 + 48) = v29;
        result = v20;
        *(__n128 *)a2 = v20;
        *(_OWORD *)(a2 + 16) = v23;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __n128 result;
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
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a2, a3, a4).n128_u64[0];
  if (*(_QWORD *)a5 < *(_QWORD *)a4)
  {
    v31 = *(_OWORD *)(a4 + 32);
    v35 = *(_OWORD *)(a4 + 48);
    v39 = *(_QWORD *)(a4 + 64);
    v23 = *(__n128 *)a4;
    v27 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    v12 = *(_OWORD *)(a5 + 32);
    v11 = *(_OWORD *)(a5 + 48);
    v13 = *(_OWORD *)(a5 + 16);
    *(_QWORD *)(a4 + 64) = *(_QWORD *)(a5 + 64);
    *(_OWORD *)(a4 + 32) = v12;
    *(_OWORD *)(a4 + 48) = v11;
    *(_OWORD *)(a4 + 16) = v13;
    *(_QWORD *)(a5 + 64) = v39;
    *(_OWORD *)(a5 + 32) = v31;
    *(_OWORD *)(a5 + 48) = v35;
    result = v23;
    *(__n128 *)a5 = v23;
    *(_OWORD *)(a5 + 16) = v27;
    if (*(_QWORD *)a4 < *(_QWORD *)a3)
    {
      v32 = *(_OWORD *)(a3 + 32);
      v36 = *(_OWORD *)(a3 + 48);
      v40 = *(_QWORD *)(a3 + 64);
      v24 = *(__n128 *)a3;
      v28 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      v15 = *(_OWORD *)(a4 + 32);
      v14 = *(_OWORD *)(a4 + 48);
      v16 = *(_OWORD *)(a4 + 16);
      *(_QWORD *)(a3 + 64) = *(_QWORD *)(a4 + 64);
      *(_OWORD *)(a3 + 32) = v15;
      *(_OWORD *)(a3 + 48) = v14;
      *(_OWORD *)(a3 + 16) = v16;
      *(_QWORD *)(a4 + 64) = v40;
      *(_OWORD *)(a4 + 32) = v32;
      *(_OWORD *)(a4 + 48) = v36;
      result = v24;
      *(__n128 *)a4 = v24;
      *(_OWORD *)(a4 + 16) = v28;
      if (*(_QWORD *)a3 < *(_QWORD *)a2)
      {
        v33 = *(_OWORD *)(a2 + 32);
        v37 = *(_OWORD *)(a2 + 48);
        v41 = *(_QWORD *)(a2 + 64);
        v25 = *(__n128 *)a2;
        v29 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        v18 = *(_OWORD *)(a3 + 32);
        v17 = *(_OWORD *)(a3 + 48);
        v19 = *(_OWORD *)(a3 + 16);
        *(_QWORD *)(a2 + 64) = *(_QWORD *)(a3 + 64);
        *(_OWORD *)(a2 + 32) = v18;
        *(_OWORD *)(a2 + 48) = v17;
        *(_OWORD *)(a2 + 16) = v19;
        *(_QWORD *)(a3 + 64) = v41;
        *(_OWORD *)(a3 + 32) = v33;
        *(_OWORD *)(a3 + 48) = v37;
        result = v25;
        *(__n128 *)a3 = v25;
        *(_OWORD *)(a3 + 16) = v29;
        if (*(_QWORD *)a2 < *(_QWORD *)a1)
        {
          v34 = *(_OWORD *)(a1 + 32);
          v38 = *(_OWORD *)(a1 + 48);
          v42 = *(_QWORD *)(a1 + 64);
          v26 = *(__n128 *)a1;
          v30 = *(_OWORD *)(a1 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v21 = *(_OWORD *)(a2 + 32);
          v20 = *(_OWORD *)(a2 + 48);
          v22 = *(_OWORD *)(a2 + 16);
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
          *(_OWORD *)(a1 + 32) = v21;
          *(_OWORD *)(a1 + 48) = v20;
          *(_OWORD *)(a1 + 16) = v22;
          *(_QWORD *)(a2 + 64) = v42;
          *(_OWORD *)(a2 + 32) = v34;
          *(_OWORD *)(a2 + 48) = v38;
          result = v26;
          *(__n128 *)a2 = v26;
          *(_OWORD *)(a2 + 16) = v30;
        }
      }
    }
  }
  return result;
}

__int128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,AOTImage *>(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  __int128 *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  if ((__int128 *)a1 != a2)
  {
    v6 = a2;
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) / 72;
    if ((uint64_t)a2 - a1 >= 73)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (unint64_t *)(a1 + 72 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a4, v9, v12);
        v12 -= 9;
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if (v6 != a3)
    {
      v14 = v6;
      do
      {
        if (*(_QWORD *)v14 < *(_QWORD *)a1)
        {
          v36 = v14[2];
          v38 = v14[3];
          v40 = *((_QWORD *)v14 + 8);
          v32 = *v14;
          v34 = v14[1];
          *v14 = *(_OWORD *)a1;
          v16 = *(_OWORD *)(a1 + 32);
          v15 = *(_OWORD *)(a1 + 48);
          v17 = *(_OWORD *)(a1 + 16);
          *((_QWORD *)v14 + 8) = *(_QWORD *)(a1 + 64);
          v14[2] = v16;
          v14[3] = v15;
          v14[1] = v17;
          *(_QWORD *)(a1 + 64) = v40;
          *(_OWORD *)(a1 + 32) = v36;
          *(_OWORD *)(a1 + 48) = v38;
          *(_OWORD *)a1 = v32;
          *(_OWORD *)(a1 + 16) = v34;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a4, v9, (unint64_t *)a1);
        }
        v14 = (__int128 *)((char *)v14 + 72);
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 73)
    {
      v18 = v8 / 0x48uLL;
      do
      {
        v19 = 0;
        v37 = *(_OWORD *)(a1 + 32);
        v39 = *(_OWORD *)(a1 + 48);
        v41 = *(_QWORD *)(a1 + 64);
        v33 = *(_OWORD *)a1;
        v35 = *(_OWORD *)(a1 + 16);
        v20 = a1;
        do
        {
          v21 = v20 + 72 * v19 + 72;
          v22 = (2 * v19) | 1;
          v23 = 2 * v19 + 2;
          if (v23 < v18 && *(_QWORD *)v21 < *(_QWORD *)(v21 + 72))
          {
            v21 += 72;
            v22 = v23;
          }
          *(_OWORD *)v20 = *(_OWORD *)v21;
          v24 = *(_OWORD *)(v21 + 16);
          v25 = *(_OWORD *)(v21 + 32);
          v26 = *(_OWORD *)(v21 + 48);
          *(_QWORD *)(v20 + 64) = *(_QWORD *)(v21 + 64);
          *(_OWORD *)(v20 + 32) = v25;
          *(_OWORD *)(v20 + 48) = v26;
          *(_OWORD *)(v20 + 16) = v24;
          v20 = v21;
          v19 = v22;
        }
        while (v22 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        v6 = (__int128 *)((char *)v6 - 72);
        if ((__int128 *)v21 == v6)
        {
          *(_OWORD *)v21 = v33;
          *(_QWORD *)(v21 + 64) = v41;
          *(_OWORD *)(v21 + 32) = v37;
          *(_OWORD *)(v21 + 48) = v39;
          *(_OWORD *)(v21 + 16) = v35;
        }
        else
        {
          *(_OWORD *)v21 = *v6;
          v27 = v6[1];
          v28 = v6[2];
          v29 = v6[3];
          *(_QWORD *)(v21 + 64) = *((_QWORD *)v6 + 8);
          *(_OWORD *)(v21 + 32) = v28;
          *(_OWORD *)(v21 + 48) = v29;
          *(_OWORD *)(v21 + 16) = v27;
          v6[2] = v37;
          v6[3] = v39;
          *((_QWORD *)v6 + 8) = v41;
          *v6 = v33;
          v6[1] = v35;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, v21 + 72, a4, 0x8E38E38E38E38E39 * ((v21 + 72 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  int64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  __n128 result;
  __n128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (a3 >= 2)
  {
    v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0x8E38E38E38E38E39 * (((uint64_t)a4 - a1) >> 3)))
    {
      v5 = (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3)) | 1;
      v6 = (unint64_t *)(a1 + 72 * v5);
      if (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        v7 = *v6;
      }
      else
      {
        v7 = v6[9];
        v8 = *v6 >= v7;
        if (*v6 > v7)
          v7 = *v6;
        if (!v8)
        {
          v6 += 9;
          v5 = 0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      v9 = *a4;
      if (v7 >= *a4)
      {
        v18 = *(__n128 *)(a4 + 1);
        v19 = *(_OWORD *)(a4 + 3);
        v20 = *(_OWORD *)(a4 + 5);
        v21 = *(_OWORD *)(a4 + 7);
        do
        {
          v10 = a4;
          a4 = v6;
          *(_OWORD *)v10 = *(_OWORD *)v6;
          v11 = *((_OWORD *)v6 + 1);
          v12 = *((_OWORD *)v6 + 2);
          v13 = *((_OWORD *)v6 + 3);
          v10[8] = v6[8];
          *((_OWORD *)v10 + 2) = v12;
          *((_OWORD *)v10 + 3) = v13;
          *((_OWORD *)v10 + 1) = v11;
          if (v4 < v5)
            break;
          v14 = (2 * v5) | 1;
          v6 = (unint64_t *)(a1 + 72 * v14);
          v5 = 2 * v5 + 2;
          if (v5 >= a3)
          {
            v15 = *v6;
            v5 = v14;
          }
          else
          {
            v15 = v6[9];
            v16 = *v6 >= v15;
            if (*v6 > v15)
              v15 = *v6;
            if (v16)
              v5 = v14;
            else
              v6 += 9;
          }
        }
        while (v15 >= v9);
        *a4 = v9;
        result = v18;
        *(_OWORD *)(a4 + 7) = v21;
        *(_OWORD *)(a4 + 5) = v20;
        *(_OWORD *)(a4 + 3) = v19;
        *(__n128 *)(a4 + 1) = v18;
      }
    }
  }
  return result;
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __n128 v16;
  __int128 v17;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = a1 + 72 * (v4 >> 1);
    v7 = a2 - 72;
    v8 = *(_QWORD *)(a2 - 72);
    if (*(_QWORD *)v6 < v8)
    {
      v14 = *(_OWORD *)(a2 - 64);
      v15 = *(_OWORD *)(a2 - 48);
      v16 = *(__n128 *)(a2 - 32);
      v17 = *(_OWORD *)(a2 - 16);
      do
      {
        v9 = v7;
        v7 = v6;
        *(_OWORD *)v9 = *(_OWORD *)v6;
        v10 = *(_OWORD *)(v6 + 16);
        v11 = *(_OWORD *)(v6 + 32);
        v12 = *(_OWORD *)(v6 + 48);
        *(_QWORD *)(v9 + 64) = *(_QWORD *)(v6 + 64);
        *(_OWORD *)(v9 + 32) = v11;
        *(_OWORD *)(v9 + 48) = v12;
        *(_OWORD *)(v9 + 16) = v10;
        if (!v5)
          break;
        v5 = (v5 - 1) >> 1;
        v6 = a1 + 72 * v5;
      }
      while (*(_QWORD *)v6 < v8);
      *(_QWORD *)v7 = v8;
      *(_OWORD *)(v7 + 8) = v14;
      *(_OWORD *)(v7 + 24) = v15;
      result = v16;
      *(__n128 *)(v7 + 40) = v16;
      *(_OWORD *)(v7 + 56) = v17;
    }
  }
  return result;
}

__n128 std::vector<AOTImage>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

uint64_t std::vector<std::vector<_CSBinaryRelocationInformation>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<_CSBinaryRelocationInformation>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<_CSBinaryRelocationInformation>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *Process::findRangeEntryForAddress<std::vector<AOTImage>>(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  _QWORD *result;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;

  result = (_QWORD *)a2[1];
  if (result != (_QWORD *)*a2)
  {
    v4 = 0x8E38E38E38E38E39 * (((uint64_t)result - *a2) >> 3);
    v5 = (_QWORD *)*a2;
    do
    {
      v6 = v4 >> 1;
      v7 = &v5[9 * (v4 >> 1)];
      v9 = *v7;
      v8 = v7 + 9;
      v4 += ~(v4 >> 1);
      if (v9 > a3)
        v4 = v6;
      else
        v5 = v8;
    }
    while (v4);
    if (v5 != (_QWORD *)*a2)
    {
      v10 = *(v5 - 9);
      if (v10 <= a3 && *(v5 - 8) + v10 > a3)
        return v5 - 9;
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(72 * a2);
}

uint64_t std::vector<ProcessLibrary>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_OWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((uint64_t)v7 - *a1) >> 5;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 59)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v11 = v5 - *a1;
    if (v11 >> 4 > v10)
      v10 = v11 >> 4;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>(result, v12);
    v14 = &v13[32 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[32 * v15];
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_OWORD *)v14 + 1) = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    v16[2] = v14 + 32;
    std::vector<ProcessLibrary>::__swap_out_circular_buffer(a1, v16);
    v8 = (_OWORD *)a1[1];
    result = std::__split_buffer<ProcessLibrary>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *v7 = *(_OWORD *)a2;
    v7[1] = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    v8 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_22638EAD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ProcessLibrary>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<ProcessLibrary>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *result;
  v3 = result[1];
  v4 = a2[1];
  if (v3 == *result)
  {
    v5 = a2[1];
  }
  else
  {
    do
    {
      v5 = v4 - 32;
      *(_OWORD *)(v4 - 32) = *(_OWORD *)(v3 - 32);
      *(_OWORD *)(v4 - 16) = *(_OWORD *)(v3 - 16);
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 8) = 0;
      v3 -= 32;
      v4 -= 32;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v6 = *result;
  *result = v5;
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__split_buffer<ProcessLibrary>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
    std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_OWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,ProcessLibrary *,ProcessLibrary *,ProcessLibrary *,0>(_OWORD *a1, _OWORD *a2, _OWORD *a3)
{
  _OWORD *v4;
  _OWORD *v5;

  v4 = a1;
  if (a1 == a2)
    return a1;
  v5 = a2;
  do
  {
    *a3 = *v4;
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(a3 + 1), v4 + 1);
    a3 += 2;
    v4 += 2;
  }
  while (v4 != v5);
  return v5;
}

void ___ZNK14ProcessLibrary14forEachSegmentIZN7Process50createTransientProcessSymbolicatorFromDescriptionsEvE3__0EEvT__block_invoke(_QWORD *a1)
{
  uint64_t Range;
  uint64_t v3;
  uint64_t v4;
  char *Name;
  std::string *v6;
  int64_t size;
  char v8;
  std::string::size_type v9;
  char *v10;
  std::string *v11;
  char *v12;
  std::string *v13;
  void **v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  std::string v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    Range = CSRegionGetRange();
    v4 = v3;
    Name = (char *)CSRegionGetName();
    if (strncmp(Name, "__PAGEZERO", 0xAuLL))
      Range += a1[6];
    *(_QWORD *)&v34 = Range;
    *((_QWORD *)&v34 + 1) = Range + v4;
    v6 = &v33;
    std::string::basic_string[abi:ne180100]<0>(&v33, Name);
    size = HIBYTE(v33.__r_.__value_.__r.__words[2]);
    v8 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
    v9 = v33.__r_.__value_.__r.__words[0];
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    {
      size = v33.__r_.__value_.__l.__size_;
      v6 = (std::string *)v33.__r_.__value_.__r.__words[0];
    }
    if (size >= 8)
    {
      v10 = (char *)v6 + size;
      v11 = v6;
      do
      {
        v12 = (char *)memchr(v11, 32, size - 7);
        if (!v12)
          break;
        if (*(_QWORD *)v12 == 0x544E454D47455320)
        {
          if (v12 != v10 && v12 - (char *)v6 != -1)
          {
            std::string::erase(&v33, v12 - (char *)v6, 8uLL);
            v8 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
            v9 = v33.__r_.__value_.__r.__words[0];
          }
          break;
        }
        v11 = (std::string *)(v12 + 1);
        size = v10 - (char *)v11;
      }
      while (v10 - (char *)v11 >= 8);
    }
    if (v8 >= 0)
      v13 = &v33;
    else
      v13 = (std::string *)v9;
    strncpy((char *)&v35, (const char *)v13, 0x11uLL);
    v14 = (void **)a1[5];
    v15 = (char *)v14[1];
    v16 = (char *)v14[2];
    if (v15 >= v16)
    {
      v20 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (_BYTE *)*v14) >> 3);
      v21 = v20 + 1;
      if (v20 + 1 > 0x666666666666666)
        std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
      v22 = 0xCCCCCCCCCCCCCCCDLL * ((v16 - (_BYTE *)*v14) >> 3);
      if (2 * v22 > v21)
        v21 = 2 * v22;
      if (v22 >= 0x333333333333333)
        v23 = 0x666666666666666;
      else
        v23 = v21;
      if (v23)
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v14 + 2), v23);
      else
        v24 = 0;
      v25 = &v24[40 * v20];
      v26 = &v24[40 * v23];
      v27 = v34;
      v28 = v35;
      *((_QWORD *)v25 + 4) = v36;
      *(_OWORD *)v25 = v27;
      *((_OWORD *)v25 + 1) = v28;
      v19 = v25 + 40;
      v30 = (char *)*v14;
      v29 = (char *)v14[1];
      if (v29 != *v14)
      {
        do
        {
          v31 = *(_OWORD *)(v29 - 40);
          v32 = *(_OWORD *)(v29 - 24);
          *((_QWORD *)v25 - 1) = *((_QWORD *)v29 - 1);
          *(_OWORD *)(v25 - 24) = v32;
          *(_OWORD *)(v25 - 40) = v31;
          v25 -= 40;
          v29 -= 40;
        }
        while (v29 != v30);
        v29 = (char *)*v14;
      }
      *v14 = v25;
      v14[1] = v19;
      v14[2] = v26;
      if (v29)
        operator delete(v29);
    }
    else
    {
      v17 = v34;
      v18 = v35;
      *((_QWORD *)v15 + 4) = v36;
      *(_OWORD *)v15 = v17;
      *((_OWORD *)v15 + 1) = v18;
      v19 = v15 + 40;
    }
    v14[1] = v19;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
  }
}

void sub_22638EEF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t ProcessLibrary::ProcessLibrary(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_OWORD *)(result + 16) = *(_OWORD *)a3;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)result = a2;
  v3 = *(_QWORD *)(result + 16);
  if (v3)
    *(_QWORD *)(result + 8) = *(_QWORD *)(v3 + 8);
  return result;
}

{
  uint64_t v3;

  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_OWORD *)(result + 16) = *(_OWORD *)a3;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)result = a2;
  v3 = *(_QWORD *)(result + 16);
  if (v3)
    *(_QWORD *)(result + 8) = *(_QWORD *)(v3 + 8);
  return result;
}

SharedLibrary *ProcessLibrary::slide(ProcessLibrary *this)
{
  SharedLibrary *result;
  uint64_t v3;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
  {
    v3 = *(_QWORD *)this;
    return (SharedLibrary *)(v3 - SharedLibrary::baseAddress(result));
  }
  return result;
}

uint64_t ProcessLibrary::loadAddress(ProcessLibrary *this)
{
  return *(_QWORD *)this;
}

SharedLibrary *ProcessLibrary::architecture(ProcessLibrary *this)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
    return (SharedLibrary *)SharedLibrary::architecture(result);
  return result;
}

SharedLibrary *ProcessLibrary::path@<X0>(ProcessLibrary *this@<X0>, _BYTE *a2@<X8>)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
    return (SharedLibrary *)SharedLibrary::path(result, (uint64_t)a2);
  *a2 = 0;
  a2[16] = 0;
  return result;
}

SharedLibrary *ProcessLibrary::addAddress(ProcessLibrary *this, uint64_t a2)
{
  SharedLibrary *result;
  uint64_t v4;
  unint64_t v5;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
  {
    v4 = *(_QWORD *)this;
    v5 = a2 - v4 + SharedLibrary::baseAddress(result);
    return (SharedLibrary *)SharedLibrary::addAddress(*((SharedLibrary **)this + 2), v5);
  }
  return result;
}

SharedLibrary *ProcessLibrary::uuid(ProcessLibrary *this)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
    return (SharedLibrary *)SharedLibrary::uuid(result);
  return result;
}

SharedLibrary *ProcessLibrary::isInSharedCacheCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerIsDyldSharedCache();
  }
  return result;
}

SharedLibrary *ProcessLibrary::isPrimaryExecutableCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerIsAOut();
  }
  return result;
}

SharedLibrary *ProcessLibrary::segmentCountCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  SharedLibrary *result;

  result = (SharedLibrary *)*((_QWORD *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerForeachSegment();
  }
  return result;
}

double MergedLibrary::mergeWith(MergedLibrary *this, const LibraryDescription *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  int v8;
  double result;
  __int128 v10;
  char v11;

  v4 = *((_QWORD *)this + 2);
  v5 = *((unsigned __int8 *)this + 24);
  LibraryDescription::libraryRange(a2);
  if (!v5 || (v4 <= 1 ? (v7 = v6 >= 2) : (v7 = 0), v7))
  {
    *((_QWORD *)this + 2) = v6;
    *((_BYTE *)this + 24) = 1;
  }
  v8 = *((unsigned __int8 *)this + 48);
  LibraryDescription::path((uint64_t)a2, (uint64_t)&v10);
  if (!v8)
  {
    if (v11)
    {
      result = *(double *)&v10;
      *((_OWORD *)this + 2) = v10;
      *((_BYTE *)this + 48) = v11;
    }
  }
  return result;
}

uint64_t MergedLibrary::length(MergedLibrary *this)
{
  return *((_QWORD *)this + 2);
}

__n128 MergedLibrary::path@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = this[2];
  *a2 = result;
  a2[1].n128_u64[0] = this[3].n128_u64[0];
  return result;
}

BOOL MergedLibrary::operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t MergedLibrary::uuid(MergedLibrary *this)
{
  return *(_QWORD *)this;
}

uint64_t MergedLibrary::hash(MergedLibrary *this)
{
  return *((_QWORD *)this + 1) ^ *(_QWORD *)this;
}

uint64_t Segment::name(Segment *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t Segment::sections(Segment *this)
{
  return (uint64_t)this + 32;
}

uint64_t Segment::symbols(Segment *this)
{
  return (uint64_t)this + 56;
}

uint64_t Segment::contents(Segment *this)
{
  return *((_QWORD *)this + 10);
}

uint64_t Segment::initializeWithCSSegment(uint64_t *a1)
{
  uint64_t v2;
  uint64_t Name;
  const char *v4;
  size_t v5;

  *a1 = CSRegionGetRange();
  a1[1] = v2;
  Name = CSRegionGetName();
  if (Name)
    v4 = (const char *)Name;
  else
    v4 = (const char *)&unk_2263A5A02;
  v5 = strlen(v4);
  a1[2] = (uint64_t)v4;
  a1[3] = v5;
  CSSegmentForeachSection();
  return CSRegionForeachSymbol();
}

uint64_t ___ZN7Segment23initializeWithCSSegmentE10_CSTypeRef_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t result;

  v1 = *(uint64_t **)(a1 + 32);
  v2 = v1[5];
  if (v2 >= v1[6])
  {
    result = std::vector<Section>::__emplace_back_slow_path<_CSTypeRef &>(v1 + 4);
  }
  else
  {
    Section::Section(v1[5]);
    result = v2 + 48;
    v1[5] = v2 + 48;
  }
  v1[5] = result;
  return result;
}

void sub_22638F40C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = v1;
  _Unwind_Resume(a1);
}

uint64_t ___ZN7Segment23initializeWithCSSegmentE10_CSTypeRef_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v6[0] = a2;
  v6[1] = a3;
  v3 = *(uint64_t **)(a1 + 32);
  v4 = v3[8];
  if (v4 >= v3[9])
  {
    result = std::vector<Symbol>::__emplace_back_slow_path<_CSTypeRef &>(v3 + 7, v6);
  }
  else
  {
    Symbol::Symbol(v3[8], a2, a3);
    result = v4 + 128;
    v3[8] = v4 + 128;
  }
  v3[8] = result;
  return result;
}

void sub_22638F46C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = v1;
  _Unwind_Resume(a1);
}

uint64_t Segment::debug(Segment *this)
{
  const char *v2;
  uint64_t result;
  Section *v4;
  Section *v5;
  Symbol *v6;
  Symbol *v7;

  printf("Segment @ 0x%llx - 0x%llx: ", *(_QWORD *)this, *((_QWORD *)this + 1) + *(_QWORD *)this);
  if (*((_QWORD *)this + 3))
    v2 = (const char *)*((_QWORD *)this + 2);
  else
    v2 = "<null>";
  result = puts(v2);
  v4 = (Section *)*((_QWORD *)this + 4);
  v5 = (Section *)*((_QWORD *)this + 5);
  while (v4 != v5)
  {
    result = Section::debug(v4);
    v4 = (Section *)((char *)v4 + 48);
  }
  v7 = (Symbol *)*((_QWORD *)this + 7);
  v6 = (Symbol *)*((_QWORD *)this + 8);
  while (v7 != v6)
  {
    result = Symbol::debug(v7);
    v7 = (Symbol *)((char *)v7 + 128);
  }
  return result;
}

uint64_t Segment::Segment(uint64_t a1)
{
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  Segment::initializeWithCSSegment((uint64_t *)a1);
  return a1;
}

void sub_22638F548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  void *v12;

  a10 = (void **)(v10 + 56);
  std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](&a10);
  v12 = *(void **)(v10 + 32);
  if (v12)
  {
    *(_QWORD *)(v10 + 40) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<Section>::__emplace_back_slow_path<_CSTypeRef &>(uint64_t *a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;

  v2 = (char *)*a1;
  v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v5 = (uint64_t)(a1 + 2);
  v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - (uint64_t)v2) >> 4);
  if (2 * v6 > v4)
    v4 = 2 * v6;
  if (v6 >= 0x2AAAAAAAAAAAAAALL)
    v7 = 0x555555555555555;
  else
    v7 = v4;
  if (v7)
  {
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(v5, v7);
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = Section::Section((uint64_t)&v8[48 * v3]);
  v12 = v11 + 48;
  v14 = (char *)*a1;
  v13 = (char *)a1[1];
  if (v13 != (char *)*a1)
  {
    do
    {
      v15 = *((_OWORD *)v13 - 3);
      v16 = *((_OWORD *)v13 - 1);
      *(_OWORD *)(v11 - 32) = *((_OWORD *)v13 - 2);
      *(_OWORD *)(v11 - 16) = v16;
      *(_OWORD *)(v11 - 48) = v15;
      v11 -= 48;
      v13 -= 48;
    }
    while (v13 != v14);
    v13 = (char *)*a1;
  }
  *a1 = v11;
  a1[1] = v12;
  a1[2] = (uint64_t)&v8[48 * v10];
  if (v13)
    operator delete(v13);
  return v12;
}

void sub_22638F68C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::vector<Symbol>::__emplace_back_slow_path<_CSTypeRef &>(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 7;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 57)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 6 > v5)
    v5 = v8 >> 6;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFF80)
    v9 = 0x1FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Symbol>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[128 * v4];
  v15 = v14;
  v16 = &v10[128 * v9];
  Symbol::Symbol(v14, *a2, a2[1]);
  v15 = v14 + 128;
  std::vector<Symbol>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<Symbol>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_22638F7B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<Symbol>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<Symbol>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Symbol>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Symbol>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 57)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 7);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Symbol>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 result;

  v7 = a7;
  if (a3 != a5)
  {
    v8 = (_QWORD *)(a7 - 48);
    do
    {
      *((_OWORD *)v8 - 5) = *(_OWORD *)(a3 - 128);
      v9 = *(_OWORD *)(a3 - 112);
      v10 = *(_OWORD *)(a3 - 96);
      v11 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)((char *)v8 - 20) = *(_OWORD *)(a3 - 68);
      *((_OWORD *)v8 - 3) = v10;
      *((_OWORD *)v8 - 2) = v11;
      *((_OWORD *)v8 - 4) = v9;
      v8[1] = 0;
      v8[2] = 0;
      *v8 = 0;
      *(_OWORD *)v8 = *(_OWORD *)(a3 - 48);
      v8[2] = *(_QWORD *)(a3 - 32);
      *(_QWORD *)(a3 - 48) = 0;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      v8[3] = 0;
      v8[4] = 0;
      v8[5] = 0;
      result = *(__n128 *)(a3 - 24);
      *(__n128 *)(v8 + 3) = result;
      v8[5] = *(_QWORD *)(a3 - 8);
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      v8 -= 16;
      v7 -= 128;
      a3 -= 128;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<Symbol,0>(uint64_t a1)
{
  void *v2;
  void **v3;

  v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(_QWORD *)(a1 + 112) = v2;
    operator delete(v2);
  }
  v3 = (void **)(a1 + 80);
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;

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
        v6 = v4 - 160;
        v7 = v4 - 80;
        std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v7);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<Symbol>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 128;
    std::__destroy_at[abi:ne180100]<Symbol,0>(i - 128);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 128;
        std::__destroy_at[abi:ne180100]<Symbol,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t InlineSymbol::asmName@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

uint64_t InlineSymbol::name@<X0>(uint64_t this@<X0>, _BYTE *a2@<X8>)
{
  __int128 v2;
  uint64_t v3;

  if (*(_QWORD *)(this + 24))
  {
    v2 = *(_OWORD *)(this + 16);
  }
  else
  {
    v3 = *(_QWORD *)(this + 40);
    if (!v3)
    {
      *a2 = 0;
      goto LABEL_6;
    }
    v2 = *(_OWORD *)(this + 32);
  }
  *(_OWORD *)a2 = v2;
  LOBYTE(v3) = 1;
LABEL_6:
  a2[16] = v3;
  return this;
}

uint64_t InlineSymbol::symbolFlags(InlineSymbol *this)
{
  return *((_QWORD *)this + 8);
}

uint64_t InlineSymbol::symbolSourceType(InlineSymbol *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t InlineSymbol::symbolContents(InlineSymbol *this)
{
  return *((_QWORD *)this + 6);
}

uint64_t InlineSymbol::initializeWithCSSymbolAndCSSourceInfo(uint64_t a1)
{
  uint64_t v2;
  uint64_t MangledName;
  const char *v4;
  size_t v5;
  uint64_t Name;
  const char *v7;
  size_t v8;
  __int128 v9;
  _OWORD v11[3];
  uint64_t v12;

  *(_QWORD *)a1 = CSSymbolGetRange();
  *(_QWORD *)(a1 + 8) = v2;
  MangledName = CSSymbolGetMangledName();
  if (MangledName)
    v4 = (const char *)MangledName;
  else
    v4 = (const char *)&unk_2263A5A02;
  v5 = strlen(v4);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  Name = CSSymbolGetName();
  if (Name)
    v7 = (const char *)Name;
  else
    v7 = (const char *)&unk_2263A5A02;
  v8 = strlen(v7);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 64) = CSSymbolGetFlags();
  SourceInfo::SourceInfo(v11);
  v9 = v11[1];
  *(_OWORD *)(a1 + 104) = v11[0];
  *(_OWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 136) = v11[2];
  *(_QWORD *)(a1 + 152) = v12;
  return CSSymbolForeachInlineRangeAtDepth();
}

uint64_t ___ZN12InlineSymbol37initializeWithCSSymbolAndCSSourceInfoE10_CSTypeRefS0__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  if (a6)
  {
    v6 = *(_QWORD *)(result + 32);
    v7 = 16 * a6 - 16;
    v8 = *(_OWORD *)(a4 + v7);
    v10 = *(_OWORD *)(a5 + v7);
    v11 = v8;
    v9 = *(_QWORD *)(v6 + 88);
    if (v9 >= *(_QWORD *)(v6 + 96))
    {
      result = std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(v6 + 80, &v11, &v10);
    }
    else
    {
      InlineSymbol::InlineSymbol(*(_QWORD *)(v6 + 88), v11, *((_QWORD *)&v11 + 1), v10, *((_QWORD *)&v10 + 1));
      result = v9 + 160;
      *(_QWORD *)(v6 + 88) = v9 + 160;
    }
    *(_QWORD *)(v6 + 88) = result;
  }
  return result;
}

void sub_22638FC94(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = v1;
  _Unwind_Resume(a1);
}

uint64_t InlineSymbol::debug(InlineSymbol *this)
{
  const char *v2;
  const char *v3;
  uint64_t result;
  InlineSymbol *v5;
  InlineSymbol *v6;

  printf("\t\tInline Symbol @ 0x%llx - 0x%llx: ", *(_QWORD *)this, *((_QWORD *)this + 1) + *(_QWORD *)this);
  if (*((_QWORD *)this + 3))
  {
    v2 = (const char *)*((_QWORD *)this + 2);
    if (!*((_QWORD *)this + 5))
      goto LABEL_7;
    goto LABEL_6;
  }
  if (*((_QWORD *)this + 5))
  {
    v2 = (const char *)*((_QWORD *)this + 4);
LABEL_6:
    v3 = (const char *)*((_QWORD *)this + 4);
    printf("%s | ", v2);
    v2 = v3;
LABEL_7:
    printf("%s | ", v2);
  }
  putchar(10);
  result = SourceInfo::debug((InlineSymbol *)((char *)this + 104));
  v6 = (InlineSymbol *)*((_QWORD *)this + 10);
  v5 = (InlineSymbol *)*((_QWORD *)this + 11);
  while (v6 != v5)
  {
    result = InlineSymbol::debug(v6);
    v6 = (InlineSymbol *)((char *)v6 + 160);
  }
  return result;
}

uint64_t InlineSymbol::InlineSymbol(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  InlineSymbol::initializeWithCSSymbolAndCSSourceInfo(a1);
  return a1;
}

void sub_22638FD9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(uint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t *v15;

  v2 = *a1;
  v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 5);
  v4 = v3 + 1;
  if (v3 + 1 > 0x199999999999999)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v5 = (uint64_t)(a1 + 2);
  v6 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v2) >> 5);
  if (2 * v6 > v4)
    v4 = 2 * v6;
  if (v6 >= 0xCCCCCCCCCCCCCCLL)
    v7 = 0x199999999999999;
  else
    v7 = v4;
  v15 = a1 + 2;
  if (v7)
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InlineSymbol>>(v5, v7);
  else
    v8 = 0;
  v11 = v8;
  v12 = &v8[160 * v3];
  v14 = &v8[160 * v7];
  InlineSymbol::InlineSymbol((uint64_t)v12);
  v13 = v12 + 160;
  std::vector<InlineSymbol>::__swap_out_circular_buffer(a1, &v11);
  v9 = a1[1];
  std::__split_buffer<InlineSymbol>::~__split_buffer(&v11);
  return v9;
}

void sub_22638FEB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<InlineSymbol>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<InlineSymbol>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InlineSymbol>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x19999999999999ALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(160 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  char v17;
  __int128 v18;
  __int128 v19;

  v7 = a7;
  *(_QWORD *)&v19 = a6;
  *((_QWORD *)&v19 + 1) = a7;
  v18 = v19;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  if (a3 == a5)
  {
    v14 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 160) = *(_OWORD *)(a3 - 160);
      v8 = *(_OWORD *)(a3 - 144);
      v9 = *(_OWORD *)(a3 - 128);
      v10 = *(_OWORD *)(a3 - 112);
      *(_OWORD *)(v7 - 100) = *(_OWORD *)(a3 - 100);
      *(_OWORD *)(v7 - 128) = v9;
      *(_OWORD *)(v7 - 112) = v10;
      *(_OWORD *)(v7 - 144) = v8;
      *(_QWORD *)(v7 - 72) = 0;
      *(_QWORD *)(v7 - 64) = 0;
      *(_QWORD *)(v7 - 80) = 0;
      *(_OWORD *)(v7 - 80) = *(_OWORD *)(a3 - 80);
      *(_QWORD *)(v7 - 64) = *(_QWORD *)(a3 - 64);
      *(_QWORD *)(a3 - 80) = 0;
      *(_QWORD *)(a3 - 72) = 0;
      *(_QWORD *)(a3 - 64) = 0;
      v11 = *(_OWORD *)(a3 - 40);
      v12 = *(_OWORD *)(a3 - 24);
      v13 = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v7 - 56) = *(_OWORD *)(a3 - 56);
      *(_QWORD *)(v7 - 8) = v13;
      *(_OWORD *)(v7 - 24) = v12;
      *(_OWORD *)(v7 - 40) = v11;
      v7 = *((_QWORD *)&v19 + 1) - 160;
      *((_QWORD *)&v19 + 1) -= 160;
      a3 -= 160;
    }
    while (a3 != a5);
    v14 = v19;
  }
  v17 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = (void **)(v1 + 80);
    std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 160;
  }
}

void **std::__split_buffer<InlineSymbol>::~__split_buffer(void **a1)
{
  std::__split_buffer<InlineSymbol>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<InlineSymbol>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 160;
    v4 = (void **)(i - 80);
    std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

__n128 DyldKdebugAOTImageDescription::consumeTracepointA(__n128 *a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 8);
  *a1 = result;
  a1[1].n128_u64[0] = *(_QWORD *)(a2 + 24);
  return result;
}

_QWORD *DyldKdebugAOTImageDescription::consumeTracepointB(_QWORD *result, _QWORD *a2)
{
  result[3] = a2[1];
  result[4] = a2[2];
  result[5] = a2[3];
  result[6] = a2[4];
  return result;
}

uint64_t *KernelSymbolicator::kernelSymbolicatorPtr(KernelSymbolicator *this)
{
  unsigned __int8 v1;
  unint64_t v2;
  char v4;
  char **v5;
  char *v6;

  if ((v1 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::~unique_ptr[abi:ne180100], &KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr, &dword_226389000);
  }
  v2 = atomic_load(&KernelSymbolicator::kernelSymbolicatorPtr(void)::once);
  if (v2 != -1)
  {
    v6 = &v4;
    v5 = &v6;
    std::__call_once(&KernelSymbolicator::kernelSymbolicatorPtr(void)::once, &v5, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<KernelSymbolicator::kernelSymbolicatorPtr(void)::$_0 &&>>);
  }
  return &KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr;
}

uint64_t *std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](a1, 0);
  return a1;
}

uint64_t KernelSymbolicator::sharedKernelSymbolicator(KernelSymbolicator *this)
{
  KernelSymbolicator::kernelSymbolicatorPtr(this);
  if (KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr)
    return *(_QWORD *)KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr;
  else
    return 0;
}

uint64_t std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard(result);
    JUMPOUT(0x227696F98);
  }
  return result;
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard(uint64_t a1)
{
  if ((CSIsNull() & 1) == 0)
    CSRelease();
  return a1;
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<KernelSymbolicator::kernelSymbolicatorPtr(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
  v2 = v1;
  v3 = operator new();
  *(_QWORD *)v3 = v0;
  *(_QWORD *)(v3 + 8) = v2;
  *(_BYTE *)(v3 + 16) = 0;
  return std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr, v3);
}

uint64_t ats_will_start_tracing(SharedCacheSymbolicators *a1)
{
  KernelSymbolicator *v1;

  v1 = (KernelSymbolicator *)SharedCacheSymbolicators::initializeSharedCacheSymbolicators(a1);
  return KernelSymbolicator::initializeKernelSymbolicator(v1);
}

uint64_t ats_configure_postprocessing(uint64_t a1)
{
  return ats_configure_postprocessing_with_config(a1, 0);
}

uint64_t ats_configure_postprocessing_with_config(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if (a2 && *(_DWORD *)(a2 + 8) == 1)
      ktrace_set_execnames_enabled();
    get_symbolication_session(a2);
    result = get_symbolication_session(ats_symbolication_config *)::session;
    if (get_symbolication_session(ats_symbolication_config *)::session)
    {
      SymbolicationSession::setKtraceSession(get_symbolication_session(ats_symbolication_config *)::session, v3);
      return SymbolicationSession::registerKtraceCallbacks((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    }
  }
  return result;
}

uint64_t ats_symbolication_enabled()
{
  uint64_t result;

  get_symbolication_session(0);
  result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
    return SymbolicationSession::isConfiguredToSaveSymbols((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
  return result;
}

uint64_t *ats_configure_postprocessing_with_additional_address(int a1, unint64_t a2)
{
  uint64_t *result;

  get_symbolication_session(0);
  result = (uint64_t *)get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
    return SymbolicationSession::learnAddressForPid((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session, a1, a2);
  return result;
}

uint64_t get_symbolication_session(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    if (a1)
      return SymbolicationSession::updateConfig(get_symbolication_session(ats_symbolication_config *)::session, a1);
  }
  else
  {
    v3 = operator new();
    result = SymbolicationSession::SymbolicationSession(v3, a1);
    get_symbolication_session(ats_symbolication_config *)::session = v3;
  }
  return result;
}

void sub_2263904E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227696F98](v1, 0x10A0C405ABB9D29);
  _Unwind_Resume(a1);
}

uint64_t ats_postprocessing_complete(uint64_t a1)
{
  get_symbolication_session(0);
  if (get_symbolication_session(ats_symbolication_config *)::session)
    SymbolicationSession::writeSymbolDataToKtraceFile(get_symbolication_session(ats_symbolication_config *)::session, a1);
  return destroy_symbolication_session();
}

uint64_t destroy_symbolication_session(void)
{
  uint64_t result;

  get_symbolication_session(0);
  result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    SymbolicationSession::~SymbolicationSession((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    result = MEMORY[0x227696F98]();
    get_symbolication_session(ats_symbolication_config *)::session = 0;
  }
  return result;
}

uint64_t ats_postprocessing_complete_write_processmaps()
{
  uint64_t result;

  get_symbolication_session(0);
  result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    SymbolicationSession::writeProcessMapsToKtraceFile((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    result = SymbolicationSession::isConfiguredToSaveSymbols((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    if ((result & 1) == 0)
      return destroy_symbolication_session();
  }
  return result;
}

uint64_t ats_should_amend_with_file(uint64_t a1, uint64_t a2)
{
  get_symbolication_session(a2);
  if (get_symbolication_session(ats_symbolication_config *)::session)
    return SymbolicationSession::extractSymbolicationChunksFromFile((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
  else
    return 1;
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepointA(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;

  *(_OWORD *)a1 = *(_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 16) = v4;
  DyldKdebugFilesystemInfo::setFsid((_QWORD *)(a1 + 40), v3);
  result = SharedCacheDescription::baseAddressForSharedCacheWithUUID((SharedCacheDescription *)a1, *(uint8_t **)a1, *(uint8_t **)(a1 + 8));
  *(_QWORD *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 32) = v6;
  return result;
}

int32x4_t DyldKdebugSharedCacheDescription::consumeTracepoint32A(int32x4_t *a1, uint64_t a2)
{
  int32x4_t result;

  result = vuzp1q_s32(*(int32x4_t *)(a2 + 8), *(int32x4_t *)(a2 + 24));
  *a1 = result;
  return result;
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepointB(uint64_t a1, uint64_t a2)
{
  return DyldKdebugFilesystemInfo::setFsobjId(a1 + 40, *(_QWORD *)(a2 + 8));
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepoint32B(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[2];
  *(_QWORD *)(a1 + 16) = a2[1];
  v4 = a1 + 40;
  DyldKdebugFilesystemInfo::setFsid((_QWORD *)(a1 + 40), v3 | (a2[3] << 32));
  return DyldKdebugFilesystemInfo::setFsobjId(v4, a2[4]);
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepoint32C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  char v7;

  v4 = (_QWORD *)(a1 + 40);
  v5 = DyldKdebugFilesystemInfo::fsobjId((DyldKdebugFilesystemInfo *)(a1 + 40));
  DyldKdebugFilesystemInfo::setFsid(v4, v5 | (*(_QWORD *)(a2 + 8) << 32));
  result = SharedCacheDescription::baseAddressForSharedCacheWithUUID((SharedCacheDescription *)a1, *(uint8_t **)a1, *(uint8_t **)(a1 + 8));
  *(_QWORD *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 32) = v7;
  return result;
}

uint64_t DyldKdebugSharedCacheDescription::fsInfo(DyldKdebugSharedCacheDescription *this)
{
  return (uint64_t)this + 40;
}

_QWORD *DyldKdebugLibraryDescription::consumeTracepointA(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 8);
  LibraryDescription::setLocation((_QWORD *)a1, *(_QWORD *)(a2 + 24));
  return DyldKdebugFilesystemInfo::setFsid((_QWORD *)(a1 + 48), *(_QWORD *)(a2 + 32));
}

int32x4_t DyldKdebugLibraryDescription::consumeTracepoint32A(int32x4_t *a1, uint64_t a2)
{
  int32x4_t result;

  result = vuzp1q_s32(*(int32x4_t *)(a2 + 8), *(int32x4_t *)(a2 + 24));
  a1[1] = result;
  return result;
}

uint64_t DyldKdebugLibraryDescription::consumeTracepointB(uint64_t a1, uint64_t a2)
{
  return DyldKdebugFilesystemInfo::setFsobjId(a1 + 48, *(_QWORD *)(a2 + 8));
}

uint64_t DyldKdebugLibraryDescription::consumeTracepoint32B(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v3;

  v3 = a1;
  LibraryDescription::setLocation(a1, a2[1]);
  v3 += 6;
  DyldKdebugFilesystemInfo::setFsid(v3, a2[2] | (a2[3] << 32));
  return DyldKdebugFilesystemInfo::setFsobjId((uint64_t)v3, a2[4]);
}

uint64_t DyldKdebugLibraryDescription::consumeTracepoint32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + 48;
  v3 = DyldKdebugFilesystemInfo::fsobjId((DyldKdebugFilesystemInfo *)(a1 + 48)) | (*(_QWORD *)(a2 + 8) << 32);
  return DyldKdebugFilesystemInfo::setFsobjId(v2, v3);
}

uint64_t DyldKdebugLibraryDescription::fsInfo(DyldKdebugLibraryDescription *this)
{
  return (uint64_t)this + 48;
}

uint64_t Symbol::asmName@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

uint64_t Symbol::name@<X0>(uint64_t this@<X0>, _BYTE *a2@<X8>)
{
  __int128 v2;
  uint64_t v3;

  if (*(_QWORD *)(this + 24))
  {
    v2 = *(_OWORD *)(this + 16);
  }
  else
  {
    v3 = *(_QWORD *)(this + 40);
    if (!v3)
    {
      *a2 = 0;
      goto LABEL_6;
    }
    v2 = *(_OWORD *)(this + 32);
  }
  *(_OWORD *)a2 = v2;
  LOBYTE(v3) = 1;
LABEL_6:
  a2[16] = v3;
  return this;
}

uint64_t Symbol::symbolFlags(Symbol *this)
{
  return *((_QWORD *)this + 8);
}

uint64_t Symbol::symbolSourceType(Symbol *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t Symbol::symbolContents(Symbol *this)
{
  return *((_QWORD *)this + 6);
}

uint64_t Symbol::initializeWithCSSymbol(uint64_t *a1)
{
  uint64_t v2;
  uint64_t MangledName;
  const char *v4;
  size_t v5;
  uint64_t Name;
  const char *v7;
  size_t v8;

  *a1 = CSSymbolGetRange();
  a1[1] = v2;
  MangledName = CSSymbolGetMangledName();
  if (MangledName)
    v4 = (const char *)MangledName;
  else
    v4 = (const char *)&unk_2263A5A02;
  v5 = strlen(v4);
  a1[4] = (uint64_t)v4;
  a1[5] = v5;
  Name = CSSymbolGetName();
  if (Name)
    v7 = (const char *)Name;
  else
    v7 = (const char *)&unk_2263A5A02;
  v8 = strlen(v7);
  a1[2] = (uint64_t)v7;
  a1[3] = v8;
  a1[8] = CSSymbolGetFlags();
  CSSymbolForeachSourceInfo();
  return CSSymbolForeachInlineRangeAtDepth();
}

void sub_2263909E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = v1;
  _Unwind_Resume(a1);
}

uint64_t ___ZN6Symbol22initializeWithCSSymbolE10_CSTypeRef_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  unint64_t v7;

  if (a6)
  {
    v6 = *(uint64_t **)(result + 32);
    v7 = v6[11];
    if (v7 >= v6[12])
    {
      result = std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(v6 + 10);
    }
    else
    {
      InlineSymbol::InlineSymbol(v6[11], *(_QWORD *)(a4 + 16 * a6 - 16), *(_QWORD *)(a4 + 16 * a6 - 16 + 8), *(_QWORD *)(a5 + 16 * a6 - 16), *(_QWORD *)(a5 + 16 * a6 - 16 + 8));
      result = v7 + 160;
      v6[11] = v7 + 160;
    }
    v6[11] = result;
  }
  return result;
}

void sub_226390A68(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = v1;
  _Unwind_Resume(a1);
}

uint64_t Symbol::debug(Symbol *this)
{
  const char *v2;
  const char *v3;
  uint64_t result;
  SourceInfo *v5;
  SourceInfo *v6;
  InlineSymbol *v7;
  InlineSymbol *v8;

  printf("\tSymbol @ 0x%llx - 0x%llx: ", *(_QWORD *)this, *((_QWORD *)this + 1) + *(_QWORD *)this);
  if (*((_QWORD *)this + 3))
  {
    v2 = (const char *)*((_QWORD *)this + 2);
    if (!*((_QWORD *)this + 5))
      goto LABEL_7;
    goto LABEL_6;
  }
  if (*((_QWORD *)this + 5))
  {
    v2 = (const char *)*((_QWORD *)this + 4);
LABEL_6:
    v3 = (const char *)*((_QWORD *)this + 4);
    printf("%s | ", v2);
    v2 = v3;
LABEL_7:
    printf("%s | ", v2);
  }
  result = putchar(10);
  v5 = (SourceInfo *)*((_QWORD *)this + 13);
  v6 = (SourceInfo *)*((_QWORD *)this + 14);
  while (v5 != v6)
  {
    result = SourceInfo::debug(v5);
    v5 = (SourceInfo *)((char *)v5 + 56);
  }
  v8 = (InlineSymbol *)*((_QWORD *)this + 10);
  v7 = (InlineSymbol *)*((_QWORD *)this + 11);
  while (v8 != v7)
  {
    result = InlineSymbol::debug(v8);
    v8 = (InlineSymbol *)((char *)v8 + 160);
  }
  return result;
}

uint64_t Symbol::Symbol(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  Symbol::initializeWithCSSymbol((uint64_t *)a1);
  return a1;
}

void sub_226390B8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  void *v4;
  va_list va;

  va_start(va, a2);
  v4 = *(void **)(v2 + 104);
  if (v4)
  {
    *(_QWORD *)(v2 + 112) = v4;
    operator delete(v4);
  }
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<SourceInfo>::__emplace_back_slow_path<_CSTypeRef &>(void **a1)
{
  char *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v2 = (char *)*a1;
  v3 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x492492492492492)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v5 = (uint64_t)(a1 + 2);
  v6 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - v2) >> 3);
  if (2 * v6 > v4)
    v4 = 2 * v6;
  if (v6 >= 0x249249249249249)
    v7 = 0x492492492492492;
  else
    v7 = v4;
  if (v7)
  {
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>(v5, v7);
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = SourceInfo::SourceInfo(&v8[56 * v3]);
  v12 = (char *)v11 + 56;
  v14 = (char *)*a1;
  v13 = (char *)a1[1];
  if (v13 != *a1)
  {
    do
    {
      v15 = *(_OWORD *)(v13 - 56);
      v16 = *(_OWORD *)(v13 - 40);
      v17 = *(_OWORD *)(v13 - 24);
      *((_QWORD *)v11 - 1) = *((_QWORD *)v13 - 1);
      *(_OWORD *)((char *)v11 - 24) = v17;
      *(_OWORD *)((char *)v11 - 40) = v16;
      *(_OWORD *)((char *)v11 - 56) = v15;
      v11 = (_OWORD *)((char *)v11 - 56);
      v13 -= 56;
    }
    while (v13 != v14);
    v13 = (char *)*a1;
  }
  *a1 = v11;
  a1[1] = v12;
  a1[2] = &v8[56 * v10];
  if (v13)
    operator delete(v13);
  return v12;
}

void sub_226390CF4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a2);
}

void StackshotLibraryDescription::StackshotLibraryDescription(LibraryDescription *a1, uint64_t a2)
{
  LibraryDescription::LibraryDescription(a1, *(_QWORD *)a2, *(uint8_t **)(a2 + 8), *(_QWORD *)(a2 + 16));
}

{
  LibraryDescription::LibraryDescription(a1, *(_QWORD *)a2, *(uint8_t **)(a2 + 8), *(_QWORD *)(a2 + 16));
}

void StackshotLibraryDescription::StackshotLibraryDescription(LibraryDescription *a1, unsigned int *a2)
{
  LibraryDescription::LibraryDescription(a1, *a2, *(uint8_t **)(a2 + 1), *(_QWORD *)(a2 + 3));
}

{
  LibraryDescription::LibraryDescription(a1, *a2, *(uint8_t **)(a2 + 1), *(_QWORD *)(a2 + 3));
}

BOOL Stackshot::isValidPidAndUniquePidPair(Stackshot *this, int a2, uint64_t a3)
{
  return a2 >= 0 && a3 != -1;
}

kcdata_item_t Stackshot::consumeTaskContainer(Stackshot *this, kcdata_iter a2)
{
  kcdata_item_t item;
  Stackshot *v3;
  uint64_t v4;
  uint64_t flags;
  kcdata_item *v6;
  int v7;
  int type;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  uint32_t size;
  uint32_t v17;
  BOOL v18;
  unsigned int v19;
  SharedCacheDescription *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  kcdata_item_t v28;
  uint64_t flags_high;
  LibraryDescription *v30;
  LibraryDescription *v31;
  StackshotAotImageDescription *v32;
  StackshotAotImageDescription *v33;
  LibraryDescription *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  StackshotAotImageDescription *v54;
  StackshotAotImageDescription *v55;
  char *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  char *v60;
  LibraryDescription *v61;
  LibraryDescription *v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  char *v66;
  LibraryDescription *v67;
  __int128 v68;
  __int128 v69;
  LibraryDescription *v70;
  LibraryDescription *v71;
  LibraryDescription *v72;
  uint64_t v73;
  LibraryDescription *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  __int128 v84;
  __int128 v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  char *v92;
  char *v93;
  __int128 v94;
  __int128 v95;
  char *v96;
  char *v97;
  char *v98;
  __int128 v99;
  __int128 v100;
  _QWORD *v101;
  _QWORD *v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  _OWORD *v106;
  __int128 v107;
  __int128 v108;
  _OWORD *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  char *v115;
  char *v116;
  __int128 v117;
  __int128 v118;
  char *v119;
  char *v120;
  char *v121;
  __int128 v122;
  __int128 v123;
  char *v125;
  char *v127;
  uint64_t v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t Address;
  void *__p;
  StackshotAotImageDescription *v138;
  unint64_t v139;
  void *v140;
  LibraryDescription *v141;
  unint64_t v142;
  uint32_t v143;
  unsigned __int8 *p_Address;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  char v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  char v152;
  unsigned __int8 uu[8];
  uint64_t v154;
  uint64_t v155;

  item = a2.item;
  v155 = *MEMORY[0x24BDAC8D0];
  if (a2.item->type != 19 || a2.item[1].type != 2307)
    return item;
  v3 = this;
  v4 = 0;
  flags = a2.item->flags;
  v143 = -1;
  v140 = 0;
  v141 = 0;
  v142 = 0;
  v127 = (char *)this + 200;
  v128 = flags;
  v125 = (char *)this + 160;
  v132 = (char *)this + 40;
  __p = 0;
  v138 = 0;
  v130 = (char *)this + 120;
  v131 = (char *)this + 80;
  v129 = (char *)this + 384;
  v139 = 0;
  v134 = (char *)this + 344;
  LOBYTE(v149) = 0;
  v135 = -1;
  v152 = 0;
  LOBYTE(v145) = 0;
  v148 = 0;
  while (1)
  {
    v6 = (kcdata_item_t)((char *)item + item->size);
    type = v6[1].type;
    item = v6 + 1;
    v7 = type;
    v9 = (type & 0xFFFFFFF0) == 0x20 ? 17 : v7;
    if (v9 <= 2308)
      break;
    if (v9 != 2309)
    {
      if (v9 == 2312)
      {
        size = item->size;
        if (size != 32 || (item->flags & 0x8F) != 0)
        {
          v17 = item->flags & 0xF;
          v18 = size >= v17;
          v19 = size - v17;
          if (!v18)
            v19 = 0;
          if (v19 >= 0x20)
          {
            if (v152)
              v152 = 0;
            StackshotSharedCacheDescription::StackshotSharedCacheDescription((StackshotSharedCacheDescription *)&v149, (dyld_uuid_info_64_v2 *)&item[1]);
            v152 = 1;
            *(_QWORD *)uu = SharedCacheDescription::uuid(v20);
            v154 = v21;
            p_Address = uu;
            v22 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v125, uu, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
            Address = SharedCacheDescription::loadAddress((SharedCacheDescription *)&v149);
            p_Address = (unsigned __int8 *)&Address;
            v23 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v22, &Address, (uint64_t)&std::piecewise_construct, (_QWORD **)&p_Address);
            v24 = v151;
            v25 = v150;
            *(_OWORD *)(v23 + 3) = v149;
            *(_OWORD *)(v23 + 5) = v25;
            v23[7] = v24;
          }
        }
      }
      else if (v9 == 2351)
      {
        if (v148)
          v148 = 0;
        StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription((StackshotAOTSharedCacheDescription *)&v145, (dyld_aot_cache_uuid_info *)&item[1]);
        v148 = 1;
        *(_QWORD *)uu = AOTSharedCacheDescription::aotUuid((AOTSharedCacheDescription *)&v145);
        v154 = v10;
        p_Address = uu;
        v11 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v127, uu, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
        Address = AOTSharedCacheDescription::x86LoadAddress((AOTSharedCacheDescription *)&v145);
        p_Address = (unsigned __int8 *)&Address;
        v12 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v11, &Address, (uint64_t)&std::piecewise_construct, (_QWORD **)&p_Address);
        v13 = v147;
        v14 = v146;
        *(_OWORD *)(v12 + 3) = v145;
        *(_OWORD *)(v12 + 5) = v14;
        *(_OWORD *)(v12 + 7) = v13;
      }
      goto LABEL_89;
    }
    v143 = item[6].size;
    if ((v143 & 0x80000000) == 0)
    {
      v135 = *(_QWORD *)&item[1].type;
      if (v135 != -1)
      {
        v4 = item[1].flags;
        goto LABEL_89;
      }
    }
    v4 = 0;
    v143 = -1;
    v135 = -1;
LABEL_153:
    if (v9 == -242132755)
      goto LABEL_154;
  }
  if (v9 == 17)
  {
    v133 = v4;
    v26 = item->flags;
    if (!item->flags)
      goto LABEL_88;
    v27 = 0;
    v28 = item + 1;
    flags_high = HIDWORD(item->flags);
    while ((_DWORD)flags_high != 48)
    {
      if ((_DWORD)flags_high == 57)
      {
        v32 = v138;
        if ((unint64_t)v138 >= v139)
        {
          v35 = 0x6DB6DB6DB6DB6DB7 * ((v138 - (StackshotAotImageDescription *)__p) >> 3);
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) > 0x492492492492492)
            std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v139 - (_QWORD)__p) >> 3) > v36)
            v36 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v139 - (_QWORD)__p) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v139 - (_QWORD)__p) >> 3)) >= 0x249249249249249)
            v37 = 0x492492492492492;
          else
            v37 = v36;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)&v139, v37);
            v40 = v39;
          }
          else
          {
            v38 = 0;
            v40 = 0;
          }
          StackshotAotImageDescription::StackshotAotImageDescription((StackshotAotImageDescription *)&v38[56 * v35], (user64_dyld_aot_info *)v28 + v27);
          v55 = (StackshotAotImageDescription *)__p;
          v54 = v138;
          v56 = v53;
          if (v138 != __p)
          {
            do
            {
              v57 = *(_OWORD *)((char *)v54 - 56);
              v58 = *(_OWORD *)((char *)v54 - 40);
              v59 = *(_OWORD *)((char *)v54 - 24);
              *((_QWORD *)v56 - 1) = *((_QWORD *)v54 - 1);
              *(_OWORD *)(v56 - 24) = v59;
              *(_OWORD *)(v56 - 40) = v58;
              *(_OWORD *)(v56 - 56) = v57;
              v56 -= 56;
              v54 = (StackshotAotImageDescription *)((char *)v54 - 56);
            }
            while (v54 != v55);
            v54 = v55;
          }
          v33 = (StackshotAotImageDescription *)(v53 + 56);
          __p = v56;
          v138 = (StackshotAotImageDescription *)(v53 + 56);
          v139 = (unint64_t)&v38[56 * v40];
          if (v54)
            operator delete(v54);
        }
        else
        {
          StackshotAotImageDescription::StackshotAotImageDescription(v138, (user64_dyld_aot_info *)v28 + v27);
          v33 = (StackshotAotImageDescription *)((char *)v32 + 56);
        }
        v138 = v33;
        goto LABEL_86;
      }
      if ((_DWORD)flags_high == 49)
      {
        v30 = v141;
        if ((unint64_t)v141 < v142)
        {
          StackshotLibraryDescription::StackshotLibraryDescription(v141, (uint64_t)v28 + 24 * v27);
          v31 = (LibraryDescription *)((char *)v30 + 48);
LABEL_85:
          v141 = v31;
          goto LABEL_86;
        }
        v47 = 0xAAAAAAAAAAAAAAABLL * ((v141 - (LibraryDescription *)v140) >> 4);
        v48 = v47 + 1;
        if (v47 + 1 > 0x555555555555555)
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)(v142 - (_QWORD)v140) >> 4) > v48)
          v48 = 0x5555555555555556 * ((uint64_t)(v142 - (_QWORD)v140) >> 4);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v142 - (_QWORD)v140) >> 4) >= 0x2AAAAAAAAAAAAAALL)
          v49 = 0x555555555555555;
        else
          v49 = v48;
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)&v142, v49);
          v52 = v51;
        }
        else
        {
          v50 = 0;
          v52 = 0;
        }
        StackshotLibraryDescription::StackshotLibraryDescription((LibraryDescription *)&v50[48 * v47], (uint64_t)v28 + 24 * v27);
        v67 = (LibraryDescription *)v140;
        v61 = v141;
        v63 = v60;
        if (v141 != v140)
        {
          do
          {
            v68 = *((_OWORD *)v61 - 3);
            v69 = *((_OWORD *)v61 - 1);
            *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
            *((_OWORD *)v63 - 1) = v69;
            *((_OWORD *)v63 - 3) = v68;
            v63 -= 48;
            v61 = (LibraryDescription *)((char *)v61 - 48);
          }
          while (v61 != v67);
          v61 = v67;
        }
        v66 = &v50[48 * v52];
        goto LABEL_83;
      }
LABEL_86:
      if (++v27 == v26)
      {
        v3 = this;
LABEL_88:
        v4 = v133;
LABEL_89:
        if (v135 != -1 && (v143 & 0x80000000) == 0)
        {
          v71 = (LibraryDescription *)v140;
          v70 = v141;
          if (v140 != v141)
          {
            v72 = v141;
            while (1)
            {
              *(_QWORD *)uu = LibraryDescription::uuid(v71);
              v154 = v73;
              if (uuid_is_null(uu))
                break;
              v71 = (LibraryDescription *)((char *)v71 + 48);
              if (v71 == v70)
                goto LABEL_102;
            }
            if (v71 != v70)
            {
              v74 = (LibraryDescription *)((char *)v71 + 48);
              v72 = v71;
              while (v74 != v70)
              {
                *(_QWORD *)uu = LibraryDescription::uuid(v74);
                v154 = v75;
                if (!uuid_is_null(uu))
                {
                  v76 = *(_OWORD *)v74;
                  v77 = *((_OWORD *)v74 + 2);
                  *((_OWORD *)v72 + 1) = *((_OWORD *)v74 + 1);
                  *((_OWORD *)v72 + 2) = v77;
                  *(_OWORD *)v72 = v76;
                  v72 = (LibraryDescription *)((char *)v72 + 48);
                }
                v74 = (LibraryDescription *)((char *)v74 + 48);
              }
            }
LABEL_102:
            if (v72 != v141)
              v141 = v72;
            std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>((uint64_t)v3, (int *)&v143, &v143, (uint64_t)&v140);
            v141 = (LibraryDescription *)v140;
          }
          if (__p != v138)
          {
            std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>((uint64_t)v132, (int *)&v143, &v143, (uint64_t)&__p);
            v138 = (StackshotAotImageDescription *)__p;
          }
          if ((v4 & 0x80000000) != 0 && v152)
          {
            *(_QWORD *)uu = &v143;
            v78 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v131, (int *)&v143, (uint64_t)&std::piecewise_construct, (_DWORD **)uu);
            if (!v152)
              std::__throw_bad_optional_access[abi:ne180100]();
            v79 = v78;
            v82 = v78[5];
            v80 = (uint64_t)(v78 + 5);
            v81 = v82;
            v83 = *(_QWORD *)(v80 - 8);
            if (v83 >= v82)
            {
              v87 = v79[3];
              v88 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v83 - v87) >> 3);
              v89 = v88 + 1;
              if (v88 + 1 > 0x666666666666666)
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              v90 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v81 - v87) >> 3);
              if (2 * v90 > v89)
                v89 = 2 * v90;
              if (v90 >= 0x333333333333333)
                v91 = 0x666666666666666;
              else
                v91 = v89;
              if (v91)
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(v80, v91);
              else
                v92 = 0;
              v93 = &v92[40 * v88];
              v94 = v149;
              v95 = v150;
              *((_QWORD *)v93 + 4) = v151;
              *(_OWORD *)v93 = v94;
              *((_OWORD *)v93 + 1) = v95;
              v97 = (char *)v79[3];
              v96 = (char *)v79[4];
              v98 = v93;
              if (v96 != v97)
              {
                do
                {
                  v99 = *(_OWORD *)(v96 - 40);
                  v100 = *(_OWORD *)(v96 - 24);
                  *((_QWORD *)v98 - 1) = *((_QWORD *)v96 - 1);
                  *(_OWORD *)(v98 - 24) = v100;
                  *(_OWORD *)(v98 - 40) = v99;
                  v98 -= 40;
                  v96 -= 40;
                }
                while (v96 != v97);
                v96 = (char *)v79[3];
              }
              v86 = v93 + 40;
              v79[3] = v98;
              v79[4] = v93 + 40;
              v79[5] = &v92[40 * v91];
              if (v96)
                operator delete(v96);
            }
            else
            {
              v84 = v149;
              v85 = v150;
              *(_QWORD *)(v83 + 32) = v151;
              *(_OWORD *)v83 = v84;
              *(_OWORD *)(v83 + 16) = v85;
              v86 = (char *)(v83 + 40);
            }
            v79[4] = v86;
            if (v152)
              v152 = 0;
          }
          if ((v4 & 0x10000000) != 0 && v148)
          {
            *(_QWORD *)uu = &v143;
            v101 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v130, (int *)&v143, (uint64_t)&std::piecewise_construct, (_DWORD **)uu);
            if (!v148)
              std::__throw_bad_optional_access[abi:ne180100]();
            v102 = v101;
            v105 = v101[5];
            v103 = (uint64_t)(v101 + 5);
            v104 = v105;
            v106 = *(_OWORD **)(v103 - 8);
            if ((unint64_t)v106 >= v105)
            {
              v110 = v102[3];
              v111 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v106 - v110) >> 4);
              v112 = v111 + 1;
              if (v111 + 1 > 0x555555555555555)
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              v113 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - v110) >> 4);
              if (2 * v113 > v112)
                v112 = 2 * v113;
              if (v113 >= 0x2AAAAAAAAAAAAAALL)
                v114 = 0x555555555555555;
              else
                v114 = v112;
              if (v114)
                v115 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(v103, v114);
              else
                v115 = 0;
              v116 = &v115[48 * v111];
              v117 = v145;
              v118 = v147;
              *((_OWORD *)v116 + 1) = v146;
              *((_OWORD *)v116 + 2) = v118;
              *(_OWORD *)v116 = v117;
              v120 = (char *)v102[3];
              v119 = (char *)v102[4];
              v121 = v116;
              if (v119 != v120)
              {
                do
                {
                  v122 = *((_OWORD *)v119 - 3);
                  v123 = *((_OWORD *)v119 - 1);
                  *((_OWORD *)v121 - 2) = *((_OWORD *)v119 - 2);
                  *((_OWORD *)v121 - 1) = v123;
                  *((_OWORD *)v121 - 3) = v122;
                  v121 -= 48;
                  v119 -= 48;
                }
                while (v119 != v120);
                v119 = (char *)v102[3];
              }
              v109 = v116 + 48;
              v102[3] = v121;
              v102[4] = v116 + 48;
              v102[5] = &v115[48 * v114];
              if (v119)
                operator delete(v119);
            }
            else
            {
              v107 = v145;
              v108 = v147;
              v106[1] = v146;
              v106[2] = v108;
              *v106 = v107;
              v109 = v106 + 3;
            }
            v102[4] = v109;
            if (v148)
              v148 = 0;
          }
          if ((v4 & 0x40000000) != 0)
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v129, (int *)&v143, &v143);
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v134, (int *)&v143, &v143);
        }
        goto LABEL_153;
      }
    }
    v34 = v141;
    if ((unint64_t)v141 < v142)
    {
      StackshotLibraryDescription::StackshotLibraryDescription(v141, &v28->type + 5 * v27);
      v31 = (LibraryDescription *)((char *)v34 + 48);
      goto LABEL_85;
    }
    v41 = 0xAAAAAAAAAAAAAAABLL * ((v141 - (LibraryDescription *)v140) >> 4);
    v42 = v41 + 1;
    if (v41 + 1 > 0x555555555555555)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * ((uint64_t)(v142 - (_QWORD)v140) >> 4) > v42)
      v42 = 0x5555555555555556 * ((uint64_t)(v142 - (_QWORD)v140) >> 4);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v142 - (_QWORD)v140) >> 4) >= 0x2AAAAAAAAAAAAAALL)
      v43 = 0x555555555555555;
    else
      v43 = v42;
    if (v43)
    {
      v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)&v142, v43);
      v46 = v45;
    }
    else
    {
      v44 = 0;
      v46 = 0;
    }
    StackshotLibraryDescription::StackshotLibraryDescription((LibraryDescription *)&v44[48 * v41], &v28->type + 5 * v27);
    v62 = (LibraryDescription *)v140;
    v61 = v141;
    v63 = v60;
    if (v141 != v140)
    {
      do
      {
        v64 = *((_OWORD *)v61 - 3);
        v65 = *((_OWORD *)v61 - 1);
        *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
        *((_OWORD *)v63 - 1) = v65;
        *((_OWORD *)v63 - 3) = v64;
        v63 -= 48;
        v61 = (LibraryDescription *)((char *)v61 - 48);
      }
      while (v61 != v62);
      v61 = v62;
    }
    v66 = &v44[48 * v46];
LABEL_83:
    v31 = (LibraryDescription *)(v60 + 48);
    v140 = v63;
    v141 = (LibraryDescription *)(v60 + 48);
    v142 = (unint64_t)v66;
    if (v61)
      operator delete(v61);
    goto LABEL_85;
  }
  if (v9 != 20 || item->flags != v128)
    goto LABEL_89;
LABEL_154:
  if (__p)
  {
    v138 = (StackshotAotImageDescription *)__p;
    operator delete(__p);
  }
  if (v140)
  {
    v141 = (LibraryDescription *)v140;
    operator delete(v140);
  }
  return item;
}

void sub_2263918B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28)
{
  if (__p)
    operator delete(__p);
  if (a27)
    operator delete(a27);
  _Unwind_Resume(exception_object);
}

uint64_t Stackshot::allPids(Stackshot *this)
{
  return (uint64_t)this + 344;
}

void Stackshot::consumeStackshot(Stackshot *this)
{
  kcdata_item_t v2;
  void *v3;
  _OWORD *v4;
  char *v5;
  kcdata_item *v6;
  int v7;
  uint32_t type;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t *v26;
  char *v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  char *v48;
  char *v49;
  uint64_t Address;
  uint64_t *p_Address;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  kcdata_iter v58;

  v57 = *MEMORY[0x24BDAC8D0];
  v2 = (kcdata_item_t)*((_QWORD *)this + 30);
  v3 = (void *)*((_QWORD *)this + 31);
  v4 = (_OWORD *)((char *)this + 296);
  v48 = (char *)this + 160;
  v49 = (char *)this + 200;
  v5 = (char *)this + 256;
  do
  {
    v6 = (kcdata_item_t)((char *)v2 + v2->size);
    type = v6[1].type;
    v2 = v6 + 1;
    v7 = type;
    if ((type & 0xFFFFFFF0) == 0x20)
      v9 = 17;
    else
      v9 = v7;
    if (v9 == 2351)
    {
      StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription((StackshotAOTSharedCacheDescription *)&v52, (dyld_aot_cache_uuid_info *)&v2[1]);
      v55 = AOTSharedCacheDescription::aotUuid((AOTSharedCacheDescription *)&v52);
      v56 = v18;
      p_Address = &v55;
      v19 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v49, &v55, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
      Address = AOTSharedCacheDescription::aotLoadAddress((AOTSharedCacheDescription *)&v52);
      p_Address = &Address;
      v20 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v19, &Address, (uint64_t)&std::piecewise_construct, &p_Address);
      v21 = v54;
      v22 = v53;
      v23 = v52;
      *(_OWORD *)(v20 + 3) = v52;
      *(_OWORD *)(v20 + 5) = v22;
      *(_OWORD *)(v20 + 7) = v21;
      v24 = v53;
      v25 = v54;
      *v4 = v23;
      v4[1] = v24;
      v4[2] = v25;
    }
    else if (v9 == 2312)
    {
      StackshotSharedCacheDescription::StackshotSharedCacheDescription((StackshotSharedCacheDescription *)&v52, (dyld_uuid_info_64_v2 *)&v2[1]);
      v55 = SharedCacheDescription::uuid((SharedCacheDescription *)&v52);
      v56 = v11;
      p_Address = &v55;
      v12 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v48, &v55, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
      Address = SharedCacheDescription::loadAddress((SharedCacheDescription *)&v52);
      p_Address = &Address;
      v13 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v12, &Address, (uint64_t)&std::piecewise_construct, &p_Address);
      v14 = v54;
      v15 = v53;
      v16 = v52;
      *(_OWORD *)(v13 + 3) = v52;
      *(_OWORD *)(v13 + 5) = v15;
      v13[7] = v14;
      v17 = v53;
      *(_OWORD *)v5 = v16;
      *((_OWORD *)v5 + 1) = v17;
      *((_QWORD *)v5 + 4) = v54;
    }
    else if (v9 == 19 && v2[1].type == 2307)
    {
      v58.item = v2;
      v58.end = v3;
      v2 = Stackshot::consumeTaskContainer(this, v58);
      v3 = v10;
    }
  }
  while (v9 != -242132755);
  v26 = (uint64_t *)*((_QWORD *)this + 50);
  if (v26)
  {
    v27 = (char *)this + 80;
    do
    {
      LODWORD(v55) = *((_DWORD *)v26 + 4);
      *(_QWORD *)&v52 = &v55;
      v28 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v27, (int *)&v55, (uint64_t)&std::piecewise_construct, (_DWORD **)&v52);
      v29 = v28[4];
      v30 = v28[5];
      if (v29 >= v30)
      {
        v34 = v28[3];
        v35 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v29 - v34) >> 3);
        v36 = v35 + 1;
        if (v35 + 1 > 0x666666666666666)
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        v37 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v30 - v34) >> 3);
        if (2 * v37 > v36)
          v36 = 2 * v37;
        if (v37 >= 0x333333333333333)
          v38 = 0x666666666666666;
        else
          v38 = v36;
        if (v38)
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v28 + 5), v38);
        else
          v39 = 0;
        v40 = &v39[40 * v35];
        v41 = *(_OWORD *)v5;
        v42 = *((_OWORD *)v5 + 1);
        *((_QWORD *)v40 + 4) = *((_QWORD *)v5 + 4);
        *(_OWORD *)v40 = v41;
        *((_OWORD *)v40 + 1) = v42;
        v44 = (char *)v28[3];
        v43 = (char *)v28[4];
        v45 = v40;
        if (v43 != v44)
        {
          do
          {
            v46 = *(_OWORD *)(v43 - 40);
            v47 = *(_OWORD *)(v43 - 24);
            *((_QWORD *)v45 - 1) = *((_QWORD *)v43 - 1);
            *(_OWORD *)(v45 - 24) = v47;
            *(_OWORD *)(v45 - 40) = v46;
            v45 -= 40;
            v43 -= 40;
          }
          while (v43 != v44);
          v43 = (char *)v28[3];
        }
        v33 = v40 + 40;
        v28[3] = v45;
        v28[4] = v40 + 40;
        v28[5] = &v39[40 * v38];
        if (v43)
          operator delete(v43);
      }
      else
      {
        v31 = *(_OWORD *)v5;
        v32 = *((_OWORD *)v5 + 1);
        *(_QWORD *)(v29 + 32) = *((_QWORD *)v5 + 4);
        *(_OWORD *)v29 = v31;
        *(_OWORD *)(v29 + 16) = v32;
        v33 = (char *)(v29 + 40);
      }
      v28[4] = v33;
      v26 = (uint64_t *)*v26;
    }
    while (v26);
  }
}

uint64_t *Stackshot::libraryDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t *result;
  int v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(this, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result)
    return std::vector<StackshotLibraryDescription>::__init_with_size[abi:ne180100]<StackshotLibraryDescription*,StackshotLibraryDescription*>(a3, (const void *)result[3], result[4], 0xAAAAAAAAAAAAAAABLL * ((result[4] - result[3]) >> 4));
  return result;
}

uint64_t *Stackshot::aotImageDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t *result;
  int v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)this + 5, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result)
    return std::vector<StackshotAotImageDescription>::__init_with_size[abi:ne180100]<StackshotAotImageDescription*,StackshotAotImageDescription*>(a3, (const void *)result[3], result[4], 0x6DB6DB6DB6DB6DB7 * ((result[4] - result[3]) >> 3));
  return result;
}

uint64_t *Stackshot::sharedCacheDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t *result;
  int v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)this + 10, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result)
    return std::vector<StackshotSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotSharedCacheDescription*,StackshotSharedCacheDescription*>(a3, (const void *)result[3], result[4], 0xCCCCCCCCCCCCCCCDLL * ((result[4] - result[3]) >> 3));
  return result;
}

uint64_t *Stackshot::aotSharedCacheDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t *result;
  int v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)this + 15, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result)
    return std::vector<StackshotAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotAOTSharedCacheDescription*,StackshotAOTSharedCacheDescription*>(a3, (const void *)result[3], result[4], 0xAAAAAAAAAAAAAAABLL * ((result[4] - result[3]) >> 4));
  return result;
}

uint64_t Stackshot::allSharedCacheDescriptions(Stackshot *this)
{
  return (uint64_t)this + 160;
}

uint64_t Stackshot::allAOTSharedCacheDescriptions(Stackshot *this)
{
  return (uint64_t)this + 200;
}

__n128 Stackshot::defaultAOTSharedCacheDescription@<Q0>(Stackshot *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)((char *)this + 312);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 296);
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)((char *)this + 328);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

__n128 Stackshot::defaultSharedCacheDescription@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result;
  __n128 v3;

  result = this[16];
  v3 = this[17];
  *a2 = result;
  a2[1] = v3;
  a2[2].n128_u64[0] = this[18].n128_u64[0];
  return result;
}

void Stackshot::Stackshot(Stackshot *this, kcdata_iter a2)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((kcdata_iter *)this + 15) = a2;
  SharedCacheDescription::SharedCacheDescription((Stackshot *)((char *)this + 256));
  AOTSharedCacheDescription::AOTSharedCacheDescription((Stackshot *)((char *)this + 296));
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *((_DWORD *)this + 94) = 1065353216;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_DWORD *)this + 104) = 1065353216;
}

void sub_226391FC0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<StackshotLibraryDescription>::__init_with_size[abi:ne180100]<StackshotLibraryDescription*,StackshotLibraryDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22639205C(_Unwind_Exception *exception_object)
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

char *std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

_QWORD *std::vector<StackshotAotImageDescription>::__init_with_size[abi:ne180100]<StackshotAotImageDescription*,StackshotAotImageDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_226392124(_Unwind_Exception *exception_object)
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

char *std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x492492492492493)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

_QWORD *std::vector<StackshotSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotSharedCacheDescription*,StackshotSharedCacheDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotSharedCacheDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263921F0(_Unwind_Exception *exception_object)
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

char *std::vector<StackshotSharedCacheDescription>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

_QWORD *std::vector<StackshotAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotAOTSharedCacheDescription*,StackshotAOTSharedCacheDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263922B8(_Unwind_Exception *exception_object)
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

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[2];
  char v26;

  v7 = a2[1] ^ *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1])
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
  v14 = a1 + 16;
  v15 = operator new(0x48uLL);
  v25[0] = v15;
  v25[1] = a1 + 16;
  *v15 = 0;
  v15[1] = v7;
  *((_OWORD *)v15 + 1) = **a4;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  *((_DWORD *)v15 + 16) = 1065353216;
  v26 = 1;
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v8 || (float)(v17 * (float)v8) < v16)
  {
    v18 = 1;
    if (v8 >= 3)
      v18 = (v8 & (v8 - 1)) != 0;
    v19 = v18 | (2 * v8);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
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
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v14;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v23 >= v8)
          v23 %= v8;
      }
      else
      {
        v23 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  v11 = (_QWORD *)v25[0];
  v25[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return v11;
}

void sub_226392530(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(uint64_t a1)
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

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6)
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *v20 = *v18;
    *v18 = v20;
  }
  else
  {
    *v20 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      v19 = *(_QWORD *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20;
    }
  }
  result = v20;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_2263927E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x40uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = **a3;
  *((_QWORD *)v8 + 7) = 0;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(v8 + 24));
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_226392878(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;

  *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6)
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *v20 = *v18;
    *v18 = v20;
  }
  else
  {
    *v20 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      v19 = *(_QWORD *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20;
    }
  }
  result = v20;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_226392AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = **a3;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  AOTSharedCacheDescription::AOTSharedCacheDescription((AOTSharedCacheDescription *)(v8 + 24));
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_226392B34(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;

  *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  char *v12;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v9 <= v8)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  v14 = (_QWORD *)(a1 + 16);
  v12 = (char *)operator new(0x30uLL);
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = v8;
  *((_DWORD *)v12 + 4) = *a3;
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a4;
  *((_QWORD *)v12 + 5) = *(_QWORD *)(a4 + 16);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *(_QWORD *)v12 = *v22;
LABEL_38:
    *v22 = v12;
    goto LABEL_39;
  }
  *(_QWORD *)v12 = *v14;
  *v14 = v12;
  *(_QWORD *)(v21 + 8 * v4) = v14;
  if (*(_QWORD *)v12)
  {
    v23 = *(_QWORD *)(*(_QWORD *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_226392D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
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
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
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
  return v11;
}

void sub_22639302C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
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
      v3 = (v7 - 1) & v6;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
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
      v3 = (v7 - 1) & v6;
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

void sub_22639324C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(_QWORD *a1, int *a2)
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

uint64_t std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)(v2 + 4));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t SymbolicationSession::processes(SymbolicationSession *this)
{
  return (uint64_t)this + 288;
}

uint64_t SymbolicationSession::updateConfig(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 13392) = a2;
  return result;
}

uint64_t SymbolicationSession::isConfiguredToSaveSymbols(SymbolicationSession *this)
{
  return *(unsigned __int8 *)(*((_QWORD *)this + 1674) + 24);
}

_QWORD *SymbolicationSession::learnPid(SymbolicationSession *this, int a2)
{
  int v3;

  v3 = a2;
  return std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)this + 352, &v3, &v3);
}

double SymbolicationSession::updateBestKnownLibraryDescriptions(SymbolicationSession *this, const LibraryDescription *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _OWORD *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = LibraryDescription::uuid(a2);
  v8[1] = v4;
  v7 = v8;
  v5 = std::__hash_table<std::__hash_value_type<UUID,MergedLibrary>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,MergedLibrary>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)this + 13400, v8, (uint64_t)&std::piecewise_construct, &v7);
  return MergedLibrary::mergeWith((MergedLibrary *)(v5 + 4), a2);
}

double SymbolicationSession::learnPidLibrary(SymbolicationSession *a1, int a2, LibraryDescription *this, uint64_t a4)
{
  std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, this, this);
  return SymbolicationSession::updateBestKnownLibraryDescriptions(a1, this);
}

uint64_t *SymbolicationSession::learnAddressForPid(SymbolicationSession *this, int a2, unint64_t a3)
{
  uint64_t *result;
  int v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)this + 39, &v5);
  if (result)
  {
    result = (uint64_t *)result[3];
    if (result)
      return (uint64_t *)Process::addAddress((Process *)result, a3);
  }
  return result;
}

uint64_t *SymbolicationSession::processPointerForPid(SymbolicationSession *this, int a2)
{
  uint64_t *result;
  int v3;

  v3 = a2;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)this + 39, &v3);
  if (result)
    return (uint64_t *)result[3];
  return result;
}

void SymbolicationSession::sharedCacheWithDescription(uint64_t a1@<X0>, SharedCacheDescription *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  char v11;
  char v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v5 = a1 + 16;
  v6 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::find<SharedCacheDescription>((_QWORD *)(a1 + 16), a2);
  if (v6)
  {
    v7 = v6[8];
    *a3 = v6[7];
    a3[1] = v7;
    if (v7)
    {
      v8 = (unint64_t *)(v7 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
  }
  else
  {
    std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,SharedCacheDescription &,std::shared_ptr<StringPool> &,void>((uint64_t)a2, &v19);
    v10 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>>(v5, a2, (uint64_t)a2, (uint64_t)&v19);
    v12 = v11;
    v13 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (v12)
    {
      SharedCache::symbolicator((SharedCache *)v10[7]);
      CSSymbolicatorForeachSymbolOwnerAtTime();
      v16 = v10[8];
      *a3 = v10[7];
      a3[1] = v16;
      if (v16)
      {
        v17 = (unint64_t *)(v16 + 8);
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
    }
    else
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
}

void sub_2263936D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN20SymbolicationSession26sharedCacheWithDescriptionE22SharedCacheDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(_QWORD *)(a1 + 32), a2, a3, &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void SymbolicationSession::sharedLibraryWithCSSymbolOwner(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  _OWORD *CFUUIDBytes;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD *v11;
  char v12;
  char v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  void *__p[2];
  uint64_t v21;
  char v22;
  void *v23[2];
  uint64_t v24;
  _QWORD v25[2];
  UUID v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25[0] = a2;
  v25[1] = a3;
  CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    *(_OWORD *)v26 = *CFUUIDBytes;
    v7 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((_QWORD *)(a1 + 56), v26);
    if (v7)
    {
      v8 = v7[5];
      *a4 = v7[4];
      a4[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>(v25, a1, __p);
      v11 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(a1 + 56, v26, v26, (__int128 *)__p);
      v13 = v12;
      v14 = (std::__shared_weak_count *)__p[1];
      if (__p[1])
      {
        v15 = (unint64_t *)((char *)__p[1] + 8);
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      if (v13)
      {
        v17 = v11[5];
        *a4 = v11[4];
        a4[1] = v17;
        if (v17)
        {
          v18 = (unint64_t *)(v17 + 8);
          do
            v19 = __ldxr(v18);
          while (__stxr(v19 + 1, v18));
        }
      }
      else
      {
        UUID::uuidString((UUID *)v26, (uint64_t)__p);
        if (v22)
        {
          *(_OWORD *)v23 = *(_OWORD *)__p;
          v24 = v21;
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v23, "<NULL_UUID>");
          if (v22 && SHIBYTE(v21) < 0)
            operator delete(__p[0]);
        }
        ats_symbolication_log_init();
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG))
          SymbolicationSession::sharedLibraryWithCSSymbolOwner();
        *a4 = 0;
        a4[1] = 0;
        if (SHIBYTE(v24) < 0)
          operator delete(v23[0]);
      }
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
  }
}

void sub_226393938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15)
  {
    if (a14 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::sharedLibraryWithUUIDAndPath(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  _QWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  char v14;
  char v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  void *__p[2];
  uint64_t v23;
  char v24;
  void *v25[2];
  uint64_t v26;
  _QWORD v27[2];
  unsigned __int8 uu[16];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu = a2;
  *(_QWORD *)&uu[8] = a3;
  v27[0] = a4;
  v27[1] = a5;
  if (uuid_is_null(uu) || !a5)
  {
    *a6 = 0;
    a6[1] = 0;
  }
  else
  {
    v9 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((_QWORD *)(a1 + 56), uu);
    if (v9)
    {
      v10 = v9[5];
      *a6 = v9[4];
      a6[1] = v10;
      if (v10)
      {
        v11 = (unint64_t *)(v10 + 8);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,UUID &,std::string_view &,std::shared_ptr<StringPool> &,void>(uu, v27, a1, __p);
      v13 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(a1 + 56, uu, uu, (__int128 *)__p);
      v15 = v14;
      v16 = (std::__shared_weak_count *)__p[1];
      if (__p[1])
      {
        v17 = (unint64_t *)((char *)__p[1] + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      if (v15)
      {
        v19 = v13[5];
        *a6 = v13[4];
        a6[1] = v19;
        if (v19)
        {
          v20 = (unint64_t *)(v19 + 8);
          do
            v21 = __ldxr(v20);
          while (__stxr(v21 + 1, v20));
        }
      }
      else
      {
        UUID::uuidString((UUID *)uu, (uint64_t)__p);
        if (v24)
        {
          *(_OWORD *)v25 = *(_OWORD *)__p;
          v26 = v23;
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v25, "<NULL UUID>");
          if (v24 && SHIBYTE(v23) < 0)
            operator delete(__p[0]);
        }
        ats_symbolication_log_init();
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG))
          SymbolicationSession::sharedLibraryWithUUIDAndPath();
        *a6 = 0;
        a6[1] = 0;
        if (SHIBYTE(v26) < 0)
          operator delete(v25[0]);
      }
    }
  }
}

void sub_226393B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15)
  {
    if (a14 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UUID::uuidString@<X0>(UUID *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v5;
  _BYTE v6[37];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = uuid_is_null((const unsigned __int8 *)this);
  if ((_DWORD)result)
  {
    v5 = 0;
    *(_BYTE *)a2 = 0;
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uuid_unparse((const unsigned __int8 *)this, v6);
    result = (uint64_t)std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, v6);
    v5 = 1;
  }
  *(_BYTE *)(a2 + 24) = v5;
  return result;
}

void sub_226393C6C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void SymbolicationSession::aotSymbolicatorWithDescription(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void SymbolicationSession::parseStackshot(SymbolicationSession *this, kcdata_iter a2)
{
  unint64_t v3;
  uint64_t v4;
  Stackshot *v5;
  kcdata_iter v6;

  v6 = a2;
  v3 = *((_QWORD *)this + 34);
  if (v3 >= *((_QWORD *)this + 35))
  {
    v4 = std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>((uint64_t *)this + 33, &v6);
  }
  else
  {
    Stackshot::Stackshot(*((Stackshot **)this + 34), a2);
    v4 = v3 + 424;
    *((_QWORD *)this + 34) = v3 + 424;
  }
  *((_QWORD *)this + 34) = v4;
  v5 = (Stackshot *)(v4 - 424);
  Stackshot::consumeStackshot((Stackshot *)(v4 - 424));
  SymbolicationSession::updateProcessView<Stackshot>((unint64_t *)this, v5);
}

void sub_226393CF0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 272) = v2;
  _Unwind_Resume(a1);
}

void SymbolicationSession::updateProcessView<Stackshot>(unint64_t *a1, Stackshot *this)
{
  uint64_t *i;
  unsigned int v5;

  if (*(_DWORD *)(a1[1674] + 8) != 1)
  {
    for (i = *(uint64_t **)(Stackshot::allPids(this) + 16); i; i = (uint64_t *)*i)
    {
      v5 = *((_DWORD *)i + 4);
      if (std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 44, (int *)&v5))
      {
        SymbolicationSession::updateProcessWithDataProvider<Stackshot>(a1, v5, this);
      }
      else
      {
        SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(a1, v5, this);
      }
    }
  }
}

uint64_t SymbolicationSession::parseDyldKdebugEntries(SymbolicationSession *this, __n128 **a2)
{
  __n128 *v3;
  __n128 *v4;

  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      DyldKdebugHandler::consumeTracepoint((SymbolicationSession *)((char *)this + 416), v3);
      v3 += 6;
    }
    while (v3 != v4);
  }
  return SymbolicationSession::updateKdebugLibraryView(this);
}

uint64_t SymbolicationSession::updateKdebugLibraryView(SymbolicationSession *this)
{
  DyldKdebugHandler *v2;
  uint64_t result;

  v2 = (SymbolicationSession *)((char *)this + 416);
  result = DyldKdebugHandler::shouldResetLibraryState((SymbolicationSession *)((char *)this + 416));
  if ((result & 1) == 0)
  {
    SymbolicationSession::updateProcessView<DyldKdebugHandler>((unint64_t *)this, v2);
    return DyldKdebugHandler::toggleResetLibraryState((uint64_t)v2);
  }
  return result;
}

void SymbolicationSession::collectLiveLibraryDescriptionsForPid(unint64_t *a1, int a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t *v7;
  unint64_t ***v8;
  unint64_t **v9;

  a1[1680] = KernelSymbolicator::sharedKernelSymbolicator((KernelSymbolicator *)a1);
  a1[1681] = v4;
  v7 = a1;
  v5 = atomic_load(a1 + 17);
  if (v5 != -1)
  {
    v9 = &v7;
    v8 = &v9;
    std::__call_once(a1 + 17, &v8, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>);
  }
  if (a2)
    CSSymbolicatorCreateWithPid();
  else
    CSRetain();
  if (CSIsNull())
  {
    ats_symbolication_log_init();
    v6 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG))
      SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, v6);
  }
  else
  {
    CSSymbolicatorIsKernelSymbolicator();
    CSSymbolicatorForeachSymbolOwnerAtTime();
    CSRelease();
  }
}

double ___ZN20SymbolicationSession36collectLiveLibraryDescriptionsForPidEiRNSt3__113unordered_setI18LibraryDescriptionNS0_4hashIS2_EENS0_8equal_toIS2_EENS0_9allocatorIS2_EEEE_block_invoke(uint64_t a1)
{
  SymbolicationSession *v2;
  double result;
  uint64_t BaseAddress;
  uint64_t KernelLibraryBaseAddress;
  char v6;
  uint64_t CFUUIDBytes;
  char *Path;
  uint64_t v9;
  void *__p[2];
  char v11;
  __int128 v12;
  char v13;
  _OWORD v14[3];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(SymbolicationSession **)(a1 + 32);
  if ((CSSymbolOwnerIsDyldSharedCache() & 1) == 0)
  {
    BaseAddress = CSSymbolOwnerGetBaseAddress();
    if (*(_BYTE *)(a1 + 52))
    {
      KernelLibraryBaseAddress = findKernelLibraryBaseAddress();
      if (v6)
        BaseAddress = KernelLibraryBaseAddress;
    }
    CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
    if (CFUUIDBytes)
    {
      LibraryDescription::LibraryDescription((LibraryDescription *)v14, BaseAddress, *(uint8_t **)CFUUIDBytes, *(_QWORD *)(CFUUIDBytes + 8));
      Path = (char *)CSSymbolOwnerGetPath();
      if (Path)
      {
        v9 = *(_QWORD *)v2;
        std::string::basic_string[abi:ne180100]<0>(__p, Path);
        StringPool::cacheString(v9, (unsigned __int8 *)__p, (uint64_t)&v12);
        if (v11 < 0)
          operator delete(__p[0]);
        if (v13)
          v14[2] = v12;
      }
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(*(_QWORD *)(a1 + 40), (LibraryDescription *)v14, v14);
      return SymbolicationSession::updateBestKnownLibraryDescriptions(v2, (const LibraryDescription *)v14);
    }
  }
  return result;
}

void sub_226394094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t findKernelLibraryBaseAddress()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t (*v6)();
  char v7;
  char v8;

  v2 = 0;
  v3 = &v2;
  v4 = 0x3802000000;
  v5 = __Block_byref_object_copy__39;
  v6 = __Block_byref_object_dispose__40;
  v7 = 0;
  v8 = 0;
  CSSymbolOwnerForeachSegment();
  v0 = v3[5];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_22639415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::registerKtraceCallbacks(SymbolicationSession *this)
{
  uint64_t result;
  _BYTE *v3;

  result = *((_QWORD *)this + 49);
  if (result)
  {
    v3 = (char *)this + 13384;
    if (*((_BYTE *)this + 13384)
      || (ktrace_stackshot(), result = ktrace_events_range(), *v3)
      || *(_DWORD *)(*((_QWORD *)this + 1674) + 8) == 1)
    {
      if (*(_BYTE *)(*((_QWORD *)this + 1674) + 24))
      {
        ktrace_events_single();
        ktrace_events_single();
        ktrace_events_single();
        ktrace_events_range();
        ktrace_events_single();
        result = ktrace_events_single();
      }
    }
    *v3 = 1;
  }
  return result;
}

void ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke(uint64_t a1, kcdata_iter a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  Stackshot *v5;
  kcdata_iter v6;

  v6 = a2;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[34];
  if (v3 >= v2[35])
  {
    v4 = std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>(v2 + 33, &v6);
  }
  else
  {
    Stackshot::Stackshot((Stackshot *)v2[34], a2);
    v4 = v3 + 424;
    v2[34] = v3 + 424;
  }
  v2[34] = v4;
  v5 = (Stackshot *)(v4 - 424);
  Stackshot::consumeStackshot((Stackshot *)(v4 - 424));
  SymbolicationSession::updateProcessView<Stackshot>(v2, v5);
}

void sub_22639441C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 272) = v2;
  _Unwind_Resume(a1);
}

void ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_2(uint64_t a1, __n128 *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(*(_QWORD *)(v2 + 13392) + 8) != 1)
    DyldKdebugHandler::consumeTracepoint((DyldKdebugHandler *)(v2 + 416), a2);
}

uint64_t ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_3(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleKernelStack((uint64_t)v3, a2);
}

uint64_t SymbolicationSession::handleKernelStack(uint64_t a1, uint64_t a2)
{
  Process *v4;
  uint64_t *v5;
  int v7;

  v4 = (Process *)SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc;
  if (!SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc)
  {
    v7 = 0;
    v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)(a1 + 312), &v7);
    if (v5)
      v4 = (Process *)v5[3];
    else
      v4 = 0;
    SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc = (uint64_t)v4;
  }
  return SymbolicationSession::handleKernelStack(a1, v4, a2);
}

uint64_t *SymbolicationSession::handleInterrupt(uint64_t a1, uint64_t a2)
{
  uint64_t *result;
  int v5;

  result = (uint64_t *)SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc;
  if (SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc)
    goto LABEL_10;
  v5 = 0;
  result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((_QWORD *)(a1 + 312), &v5);
  if (!result)
  {
    SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc = 0;
    return result;
  }
  result = (uint64_t *)result[3];
  SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc = (uint64_t)result;
  if (result)
  {
LABEL_10:
    if (*(_BYTE *)(*(_QWORD *)(a1 + 13392) + 24))
      return (uint64_t *)Process::addAddress((Process *)result, *(_QWORD *)(a2 + 16));
  }
  return result;
}

uint64_t *SymbolicationSession::handleUserStack(uint64_t *result, uint64_t a2)
{
  Process *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  if (*(_BYTE *)(result[1674] + 24))
  {
    v7 = *(_DWORD *)(a2 + 88);
    result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v7);
    if (result)
    {
      v3 = (Process *)result[3];
      if (v3)
      {
        v4 = 0;
        v5 = a2 + 8;
        do
        {
          v6 = *(_QWORD *)(v5 + v4);
          if (v6)
            result = (uint64_t *)Process::addAddress(v3, v6);
          v4 += 8;
        }
        while (v4 != 32);
      }
    }
  }
  return result;
}

uint64_t *SymbolicationSession::handleRealFault(uint64_t *result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;

  if (*(_BYTE *)(result[1674] + 24))
  {
    HIDWORD(v2) = *(_DWORD *)(a2 + 48);
    LODWORD(v2) = HIDWORD(v2) - 20054024;
    if ((v2 >> 2) <= 3)
    {
      v3 = *(_QWORD *)(a2 + 8);
      v4 = *(_DWORD *)(a2 + 88);
      result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v4);
      if (result)
      {
        result = (uint64_t *)result[3];
        if (result)
          return (uint64_t *)Process::addAddress((Process *)result, v3);
      }
    }
  }
  return result;
}

uint64_t *SymbolicationSession::handleKPCHandler(uint64_t *result, uint64_t a2)
{
  unint64_t v2;
  int v3;

  if (*(_BYTE *)(result[1674] + 24))
  {
    v2 = *(_QWORD *)(a2 + 24);
    v3 = *(_DWORD *)(a2 + 88);
    result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v3);
    if (result)
    {
      result = (uint64_t *)result[3];
      if (result)
        return (uint64_t *)Process::addAddress((Process *)result, v2);
    }
  }
  return result;
}

uint64_t *SymbolicationSession::handleDTraceProbe(uint64_t *result, uint64_t a2)
{
  unint64_t v2;
  int v3;

  if (*(_BYTE *)(result[1674] + 24))
  {
    v2 = *(_QWORD *)(a2 + 8);
    v3 = *(_QWORD *)(a2 + 24);
    result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v3);
    if (result)
    {
      result = (uint64_t *)result[3];
      if (result)
        return (uint64_t *)Process::addAddress((Process *)result, v2);
    }
  }
  return result;
}

void SymbolicationSession::updateProcessView<DyldKdebugHandler>(unint64_t *a1, DyldKdebugHandler *this)
{
  uint64_t *i;
  unsigned int v5;

  if (*(_DWORD *)(a1[1674] + 8) != 1)
  {
    for (i = *(uint64_t **)(DyldKdebugHandler::allPids(this) + 16); i; i = (uint64_t *)*i)
    {
      v5 = *((_DWORD *)i + 4);
      if (std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 44, (int *)&v5))
      {
        SymbolicationSession::updateProcessWithDataProvider<DyldKdebugHandler>(a1, v5, this);
      }
      else
      {
        SymbolicationSession::addNewProcessWithDataProvider<DyldKdebugHandler>(a1, v5, this);
      }
    }
  }
}

uint64_t SymbolicationSession::handleKernelStack(uint64_t result, Process *this, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (this && *(_BYTE *)(*(_QWORD *)(result + 13392) + 24))
  {
    v4 = 0;
    v5 = a3 + 8;
    do
    {
      v6 = *(_QWORD *)(v5 + v4);
      if (v6)
        result = Process::addAddress(this, v6);
      v4 += 8;
    }
    while (v4 != 32);
  }
  return result;
}

uint64_t SymbolicationSession::handleInterrupt(uint64_t result, Process *this, uint64_t a3)
{
  if (this)
  {
    if (*(_BYTE *)(*(_QWORD *)(result + 13392) + 24))
      return Process::addAddress(this, *(_QWORD *)(a3 + 16));
  }
  return result;
}

void SymbolicationSession::addNeededAddresses(unint64_t *a1, uint64_t *a2)
{
  DyldKdebugHandler *v4;
  uint64_t *v5;
  Process *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  unint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (DyldKdebugHandler *)(a1 + 52);
  if ((DyldKdebugHandler::shouldResetLibraryState((DyldKdebugHandler *)(a1 + 52)) & 1) == 0)
  {
    SymbolicationSession::updateProcessView<DyldKdebugHandler>(a1, v4);
    DyldKdebugHandler::toggleResetLibraryState((uint64_t)v4);
  }
  *(_DWORD *)buf = 0;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)buf);
  if (v5)
    v6 = (Process *)v5[3];
  else
    v6 = 0;
  v7 = *a2;
  v8 = a2[1];
  if (*a2 != v8)
  {
    do
    {
      v9 = *(_DWORD *)(v7 + 48);
      if (v9 > 620888075)
      {
        if (v9 > 721486252)
        {
          if ((v9 - 721486253) >= 2)
            goto LABEL_32;
          SymbolicationSession::handleDTraceProbe((uint64_t *)a1, v7);
        }
        else
        {
          switch(v9)
          {
            case 620888076:
              if (v6 && *(_BYTE *)(a1[1674] + 24))
              {
                for (i = 8; i != 40; i += 8)
                {
                  v12 = *(_QWORD *)(v7 + i);
                  if (v12)
                    Process::addAddress(v6, v12);
                }
              }
              break;
            case 620888080:
              SymbolicationSession::handleUserStack((uint64_t *)a1, v7);
              break;
            case 621150209:
              SymbolicationSession::handleKPCHandler((uint64_t *)a1, v7);
              break;
            default:
              goto LABEL_32;
          }
        }
      }
      else if ((v9 - 20054024) > 0xC || ((1 << (v9 - 8)) & 0x1111) == 0)
      {
        if (v9 != 83886085)
        {
LABEL_32:
          ats_symbolication_log_init();
          v13 = ats_symbolication_log;
          if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v15 = v9;
            _os_log_error_impl(&dword_226389000, v13, OS_LOG_TYPE_ERROR, "Unhandled tracepoint with debugid %u", buf, 8u);
          }
          goto LABEL_34;
        }
        if (v6)
        {
          if (*(_BYTE *)(a1[1674] + 24))
            Process::addAddress(v6, *(_QWORD *)(v7 + 16));
        }
      }
      else
      {
        SymbolicationSession::handleRealFault((uint64_t *)a1, v7);
      }
LABEL_34:
      v7 += 96;
    }
    while (v7 != v8);
  }
}

const void **SymbolicationSession::forEachSymbolChunk(const void **result, uint64_t a2)
{
  _QWORD *v2;
  const void **v4;
  int *v5;
  SharedLibrary *v6;
  const void *FBSSignatureWithConfig;
  uint64_t v8;
  const void *v9;
  char v10;
  const void *v11;

  v2 = result[9];
  if (v2)
  {
    v4 = result;
    do
    {
      v5 = (int *)v4[1674];
      v6 = (SharedLibrary *)v2[4];
      if (v5)
        FBSSignatureWithConfig = (const void *)SharedLibrary::generateFBSSignatureWithConfig((uint64_t)v6, *v5);
      else
        FBSSignatureWithConfig = (const void *)SharedLibrary::generateFBSSignature(v6);
      v9 = FBSSignatureWithConfig;
      v10 = 0;
      v11 = FBSSignatureWithConfig;
      v8 = *(_QWORD *)(a2 + 24);
      if (!v8)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, const void **))(*(_QWORD *)v8 + 48))(v8, &v11);
      result = ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard(&v9);
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return result;
}

void sub_226394BF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::forEachResymbolicatedSymbolChunk(uint64_t result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t (*v4)(const char *);
  uint64_t *i;
  int v6;
  SharedLibrary *v7;
  _QWORD *v8;
  const char *v9;
  void **v10;
  _QWORD *v11;
  const char *v12;
  SharedLibrary *v13;
  _QWORD *v14;
  const char *v15;
  void **v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *__p[2];
  char v21;
  char v22;
  _OWORD *v23;
  char __str[8];
  char v25;
  uint64_t v26;

  v3 = (_QWORD *)result;
  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(uint64_t (**)(const char *))(*(_QWORD *)(result + 13392) + 32);
  if (v4)
    result = v4("[Symbolication] Symbolicating");
  for (i = (uint64_t *)v3[9]; i; i = (uint64_t *)*i)
  {
    v6 = *(_DWORD *)(v3[1674] + 4);
    if (v6)
    {
      if (v6 == 2)
      {
        result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1692, i + 2);
        if (result)
        {
          v13 = (SharedLibrary *)i[4];
          *(_QWORD *)__str = i + 2;
          v14 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, (_OWORD **)__str);
          v15 = (const char *)(v14 + 4);
          if (*((char *)v14 + 55) < 0)
            v15 = *(const char **)v15;
          result = SharedLibrary::prepareForResymbolicationWithDsymPath(v13, v15);
          if ((result & 1) != 0)
          {
LABEL_39:
            *(_QWORD *)__str = SharedLibrary::generateFBSSignature((SharedLibrary *)i[4]);
            v25 = 0;
            __p[0] = *(void **)__str;
            v19 = *(_QWORD *)(a2 + 24);
            if (!v19)
              std::__throw_bad_function_call[abi:ne180100]();
            (*(void (**)(uint64_t, void **))(*(_QWORD *)v19 + 48))(v19, __p);
            result = (uint64_t)ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard((const void **)__str);
            continue;
          }
          if (*(_QWORD *)(v3[1674] + 32))
          {
            UUID::uuidString((UUID *)((uint8_t *)i + 1), (uint64_t)__p);
            if (!v22)
              std::__throw_bad_optional_access[abi:ne180100]();
            if (v21 >= 0)
              v16 = __p;
            else
              v16 = (void **)__p[0];
            v23 = i + 2;
            v17 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, &v23);
            v18 = (const char *)(v17 + 4);
            if (*((char *)v17 + 55) < 0)
              v18 = *(const char **)v18;
            snprintf(__str, 0x400uLL, "[Symbolication] failed to ingest dSYM: %s %s", (const char *)v16, v18);
            if (v22 && v21 < 0)
              operator delete(__p[0]);
            goto LABEL_22;
          }
        }
      }
      else
      {
        if (v6 != 1)
          goto LABEL_39;
        result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1692, i + 2);
        if (result)
        {
          result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1687, i + 2);
          if (result)
          {
            v7 = (SharedLibrary *)i[4];
            *(_QWORD *)__str = i + 2;
            v8 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, (_OWORD **)__str);
            v9 = (const char *)(v8 + 4);
            if (*((char *)v8 + 55) < 0)
              v9 = *(const char **)v9;
            result = SharedLibrary::prepareForResymbolicationWithDsymPath(v7, v9);
            if ((result & 1) != 0)
              goto LABEL_39;
            if (*(_QWORD *)(v3[1674] + 32))
            {
              UUID::uuidString((UUID *)((uint8_t *)i + 1), (uint64_t)__p);
              if (!v22)
                std::__throw_bad_optional_access[abi:ne180100]();
              if (v21 >= 0)
                v10 = __p;
              else
                v10 = (void **)__p[0];
              v23 = i + 2;
              v11 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, &v23);
              v12 = (const char *)(v11 + 4);
              if (*((char *)v11 + 55) < 0)
                v12 = *(const char **)v12;
              snprintf(__str, 0x400uLL, "[Symbolication] failed to ingest dSYM: %s %s", (const char *)v10, v12);
              if (v22)
              {
                if (v21 < 0)
                  operator delete(__p[0]);
              }
LABEL_22:
              result = (*(uint64_t (**)(char *))(v3[1674] + 32))(__str);
            }
          }
        }
      }
    }
    else
    {
      result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1687, i + 2);
      if (result)
        goto LABEL_39;
    }
  }
  return result;
}

void sub_226394F28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20)
{
  if (a17)
  {
    if (a16 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *SymbolicationSession::filterUUIDsNeedingSymbolicationWithFile(_QWORD *result)
{
  uint64_t *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _BYTE v6[24];

  v1 = (uint64_t *)result[9];
  if (v1)
  {
    v2 = result;
    v3 = result + 1682;
    v4 = result + 1687;
    do
    {
      result = (_QWORD *)SharedLibrary::hasAddressesToSymbolicate((SharedLibrary *)v1[4]);
      if ((_DWORD)result)
      {
        if ((*(_DWORD *)(v2[1674] + 4) - 1) <= 1
          && v2[1685]
          && (v5 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3, v1 + 2)) != 0&& *((_BYTE *)v5 + 32))
        {
          result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v4, v1 + 2);
          if (result)
            result = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__erase_unique<UUID>(v4, v1 + 2);
        }
        else
        {
          SharedLibrary::path((SharedLibrary *)v1[4], (uint64_t)v6);
          if (!v6[16])
            std::__throw_bad_optional_access[abi:ne180100]();
          result = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID const&,std::string_view>((uint64_t)v4, v1 + 2, (_OWORD *)v1 + 1, (uint64_t)v6);
        }
      }
      v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
  return result;
}

void SymbolicationSession::collectAvailableDsymPaths(SymbolicationSession *this)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *size;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  const std::__fs::filesystem::directory_entry *v13;
  char *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  char *v17;
  std::string::size_type i;
  std::string::size_type v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *cntrl;
  uint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::string p;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *v30;
  std::__shared_weak_count *v31;
  char v32;
  std::__fs::filesystem::recursive_directory_iterator __p;
  std::__fs::filesystem::path v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *(*v37)(uint64_t);
  void *v38;
  SymbolicationSession *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::string *p_p;

  v1 = *((_QWORD *)this + 1674);
  if (*(_DWORD *)(v1 + 4) == 1)
  {
    unfold_dsym_path(*(char **)(v1 + 16), (uint64_t)&v41);
    v3 = v41;
    v4 = v42;
    if (v41 != v42)
    {
      v5 = MEMORY[0x24BDAC760];
      do
      {
        v35 = v5;
        v36 = 0x40000000;
        v37 = ___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke;
        v38 = &__block_descriptor_tmp_16;
        v39 = this;
        v40 = v3;
        CSSymbolicatorForeachSymbolicatorWithPath();
        v3 += 24;
      }
      while (v3 != v4);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v34.__pn_, (char **)(*((_QWORD *)this + 1674) + 16));
    std::__fs::filesystem::__status(&v34, 0);
    if (SHIBYTE(v34.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__pn_.__r_.__value_.__l.__data_);
    if (!*((_QWORD *)this + 1695) && v30 == 2)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&__p, (char **)(*((_QWORD *)this + 1674) + 16));
      MEMORY[0x227696F5C](&v34, &__p, 0, 0);
      if (*(char *)(&__p.__rec_ + 7) < 0)
        operator delete(__p.__imp_.__ptr_);
      v6 = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&v34.__pn_.__r_.__value_.__l.__data_;
      if (v34.__pn_.__r_.__value_.__l.__size_)
      {
        v7 = (unint64_t *)(v34.__pn_.__r_.__value_.__l.__size_ + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
        size = (std::__shared_weak_count *)v34.__pn_.__r_.__value_.__l.__size_;
        __p.__imp_ = v6;
        __p.__rec_ = v34.__pn_.__r_.__value_.__s.__data_[16];
        if (v34.__pn_.__r_.__value_.__l.__size_)
        {
          v10 = (unint64_t *)(v34.__pn_.__r_.__value_.__l.__size_ + 8);
          do
            v11 = __ldxr(v10);
          while (__stxr(v11 + 1, v10));
          v30 = 0;
          v31 = 0;
          v32 = 0;
          do
            v12 = __ldaxr(v10);
          while (__stlxr(v12 - 1, v10));
          if (!v12)
          {
            ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
            std::__shared_weak_count::__release_weak(size);
          }
          while (1)
          {
LABEL_23:
            if (__p.__imp_.__ptr_ == v30)
            {
              v20 = v31;
              if (v31)
              {
                p_shared_owners = (unint64_t *)&v31->__shared_owners_;
                do
                  v22 = __ldaxr(p_shared_owners);
                while (__stlxr(v22 - 1, p_shared_owners));
                if (!v22)
                {
                  ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
                  std::__shared_weak_count::__release_weak(v20);
                }
              }
              cntrl = __p.__imp_.__cntrl_;
              if (__p.__imp_.__cntrl_)
              {
                v24 = &__p.__imp_.__cntrl_->__shared_owners_;
                do
                  v25 = __ldaxr((unint64_t *)v24);
                while (__stlxr(v25 - 1, (unint64_t *)v24));
                if (!v25)
                {
                  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
                  std::__shared_weak_count::__release_weak(cntrl);
                }
              }
              v26 = (std::__shared_weak_count *)v34.__pn_.__r_.__value_.__l.__size_;
              if (v34.__pn_.__r_.__value_.__l.__size_)
              {
                v27 = (unint64_t *)(v34.__pn_.__r_.__value_.__l.__size_ + 8);
                do
                  v28 = __ldaxr(v27);
                while (__stlxr(v28 - 1, v27));
                if (!v28)
                {
                  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
                  std::__shared_weak_count::__release_weak(v26);
                }
              }
              goto LABEL_54;
            }
            v13 = std::__fs::filesystem::recursive_directory_iterator::__dereference(&__p);
            v14 = (char *)v13;
            if (SHIBYTE(v13->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&p, v13->__p_.__pn_.__r_.__value_.__l.__data_, v13->__p_.__pn_.__r_.__value_.__l.__size_);
            else
              p = (std::string)v13->__p_;
            v15 = std::string::ends_with[abi:ne180100]((uint64_t *)&p, ".dSYM");
            v16 = v15;
            if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(p.__r_.__value_.__l.__data_);
              if (!v16)
                goto LABEL_38;
            }
            else if (!v15)
            {
              goto LABEL_38;
            }
            if (v14[23] >= 0)
              v17 = v14;
            else
              v17 = *(char **)v14;
            unfold_dsym_path(v17, (uint64_t)&p);
            v19 = p.__r_.__value_.__l.__size_;
            for (i = p.__r_.__value_.__r.__words[0]; i != v19; i += 24)
              CSSymbolicatorForeachSymbolicatorWithPath();
            p_p = &p;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
LABEL_38:
            std::__fs::filesystem::recursive_directory_iterator::__increment(&__p, 0);
          }
        }
      }
      else
      {
        __p.__imp_ = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&v34.__pn_.__r_.__value_.__l.__data_;
        __p.__rec_ = v34.__pn_.__r_.__value_.__s.__data_[16];
      }
      v30 = 0;
      v31 = 0;
      v32 = 0;
      goto LABEL_23;
    }
LABEL_54:
    v34.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
  }
}

void sub_2263953F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (a26 < 0)
    operator delete(__p);
  __p = (void *)(v32 - 128);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void unfold_dsym_path(char *__s@<X0>, uint64_t a2@<X8>)
{
  std::string *v3;
  __int128 v4;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v13;
  const std::__fs::filesystem::directory_entry *v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  std::string *v22;
  std::string *v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *cntrl;
  uint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__fs::filesystem::directory_entry::_Path __p;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v37;
  std::__shared_weak_count *v38;
  std::__fs::filesystem::directory_iterator v39;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v40;
  std::__shared_weak_count *v41;
  std::string v42;
  std::string v43;
  std::__split_buffer<std::string> __v;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::string::basic_string[abi:ne180100]<0>(&v43, __s);
  if (!std::string::ends_with[abi:ne180100]((uint64_t *)&v43, ".dSYM"))
    goto LABEL_55;
  v3 = std::string::append(&v43, "/Contents/Resources/DWARF/", 0x1AuLL);
  if (SHIBYTE(v3->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v42, v3->__r_.__value_.__l.__data_, v3->__r_.__value_.__l.__size_);
  }
  else
  {
    v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v4;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>((std::string *)&__v, (char *)&v42);
  MEMORY[0x227696F44](&v40, &__v, 0, 0);
  if (SHIBYTE(__v.__end_) < 0)
    operator delete(__v.__first_);
  v5 = v40;
  v6 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = v41;
    v39.__imp_.__ptr_ = v5;
    v39.__imp_.__cntrl_ = v6;
    if (v41)
    {
      v10 = (unint64_t *)&v41->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
      v37 = 0;
      v38 = 0;
      do
        v12 = __ldaxr(v10);
      while (__stlxr(v12 - 1, v10));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
      goto LABEL_19;
    }
  }
  else
  {
    v39.__imp_.__ptr_ = v40;
    v39.__imp_.__cntrl_ = 0;
  }
  v37 = 0;
  v38 = 0;
LABEL_19:
  v13 = v37;
  while (v39.__imp_.__ptr_ != v13)
  {
    v14 = std::__fs::filesystem::directory_iterator::__dereference(&v39);
    if (SHIBYTE(v14->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p.__pn_, v14->__p_.__pn_.__r_.__value_.__l.__data_, v14->__p_.__pn_.__r_.__value_.__l.__size_);
    else
      __p.__pn_ = (std::__fs::filesystem::path::string_type)v14->__p_;
    v16 = *(_QWORD *)(a2 + 8);
    v15 = *(_QWORD *)(a2 + 16);
    if (v16 >= v15)
    {
      v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *(_QWORD *)a2) >> 3);
      v19 = v18 + 1;
      if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
      v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *(_QWORD *)a2) >> 3);
      if (2 * v20 > v19)
        v19 = 2 * v20;
      if (v20 >= 0x555555555555555)
        v21 = 0xAAAAAAAAAAAAAAALL;
      else
        v21 = v19;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 16);
      if (v21)
        v22 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(a2 + 16, v21);
      else
        v22 = 0;
      v23 = v22 + v18;
      __v.__first_ = v22;
      __v.__begin_ = v23;
      __v.__end_cap_.__value_ = &v22[v21];
      v24 = *(_OWORD *)&__p.__pn_.__r_.__value_.__l.__data_;
      v23->__r_.__value_.__r.__words[2] = __p.__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
      memset(&__p, 0, sizeof(__p));
      __v.__end_ = v23 + 1;
      std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
      v25 = *(_QWORD *)(a2 + 8);
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v26 = SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]);
      *(_QWORD *)(a2 + 8) = v25;
      if (v26 < 0)
        operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    }
    else
    {
      v17 = *(_OWORD *)&__p.__pn_.__r_.__value_.__l.__data_;
      *(_QWORD *)(v16 + 16) = *((_QWORD *)&__p.__pn_.__r_.__value_.__l + 2);
      *(_OWORD *)v16 = v17;
      *(_QWORD *)(a2 + 8) = v16 + 24;
    }
    std::__fs::filesystem::directory_iterator::__increment(&v39, 0);
  }
  v27 = v38;
  if (v38)
  {
    v28 = (unint64_t *)&v38->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  cntrl = v39.__imp_.__cntrl_;
  if (v39.__imp_.__cntrl_)
  {
    v31 = &v39.__imp_.__cntrl_->__shared_owners_;
    do
      v32 = __ldaxr((unint64_t *)v31);
    while (__stlxr(v32 - 1, (unint64_t *)v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v33 = v41;
  if (v41)
  {
    v34 = (unint64_t *)&v41->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
LABEL_55:
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
}

void sub_2263957F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;

  if (*(char *)(v34 - 97) < 0)
    operator delete(*(void **)(v34 - 120));
  if (a27 < 0)
    operator delete(__p);
  if (a34 < 0)
    operator delete(a29);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a29);
  _Unwind_Resume(a1);
}

BOOL std::string::ends_with[abi:ne180100](uint64_t *a1, char *__s)
{
  size_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD v8[2];

  v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    v6 = a1;
    a1 = (uint64_t *)*a1;
    v5 = v6[1];
  }
  else
  {
    v5 = *((unsigned __int8 *)a1 + 23);
  }
  v8[0] = a1;
  v8[1] = v5;
  return std::string_view::ends_with[abi:ne180100](v8, __s, v4);
}

uint64_t SymbolicationSession::collectDsymPathsViaDownload(SymbolicationSession *this)
{
  return 10;
}

uint64_t SymbolicationSession::fillSharedCacheFromChunkSymbolicator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t SharedCacheBaseAddress;
  uint64_t SharedCacheUUID;
  _QWORD *v6;
  char v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  _QWORD v14[2];
  _BYTE v15[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14[0] = a2;
  v14[1] = a3;
  SharedCacheBaseAddress = CSSymbolicatorGetSharedCacheBaseAddress();
  SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID)
    return 5;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)v15, SharedCacheBaseAddress, 0, *(uint8_t **)SharedCacheUUID, *(_QWORD *)(SharedCacheUUID + 8));
  std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>(v14, a1, &v12);
  v6 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>&>(a1 + 16, (SharedCacheDescription *)v15, (uint64_t)v15, &v12);
  if (v7)
  {
    SharedCache::symbolicator((SharedCache *)v6[7]);
    CSSymbolicatorForeachSymbolOwnerAtTime();
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return 0;
}

void sub_226395B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN20SymbolicationSession36fillSharedCacheFromChunkSymbolicatorE10_CSTypeRef_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(_QWORD *)(a1 + 32), a2, a3, &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

uint64_t SymbolicationSession::addProcessFromChunkSymbolicator(uint64_t a1)
{
  int IsKernelSymbolicator;
  __int128 *v3;
  uint64_t *v4;
  uint64_t Pid;
  uint64_t v6;
  uint64_t v7;
  uint64_t SharedCacheBaseAddress;
  __int128 *SharedCacheUUID;
  __int128 *v10;
  uint64_t **v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v33[10];
  __int128 v34;
  uint64_t v35;
  char *v36;
  void (*v37)(uint64_t);
  _QWORD v38[4];
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  __n128 (*v52)(_QWORD *, uint64_t);
  void (*v53)(uint64_t);
  _QWORD v54[3];
  void **v55[3];
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  IsKernelSymbolicator = CSSymbolicatorIsKernelSymbolicator();
  v49 = 0;
  v50 = &v49;
  v51 = 0x4002000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  memset(v54, 0, sizeof(v54));
  v3 = (__int128 *)MEMORY[0x24BDAC760];
  v42 = MEMORY[0x24BDAC760];
  v43 = 0x40000000;
  v44 = ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke;
  v45 = &unk_24EDD5538;
  v48 = IsKernelSymbolicator;
  v46 = &v49;
  v47 = a1;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  v4 = v50;
  if (v50[6] == v50[5])
  {
    if (IsKernelSymbolicator)
      v6 = 3;
    else
      v6 = 6;
    goto LABEL_43;
  }
  if ((IsKernelSymbolicator & 1) != 0)
  {
    Pid = 0;
  }
  else
  {
    Pid = CSSymbolicatorGetPid();
    v4 = v50;
  }
  v41 = Pid;
  v7 = operator new();
  v34 = *(_OWORD *)(v4 + 5);
  v35 = v4[7];
  v4[6] = 0;
  v4[7] = 0;
  v4[5] = 0;
  Process::Process(v7, Pid, &v34);
  v40 = v7;
  *(_QWORD *)&v56 = &v34;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  v39 = v40;
  if (!v40)
  {
    if (IsKernelSymbolicator)
      v6 = 3;
    else
      v6 = 6;
    goto LABEL_43;
  }
  if ((IsKernelSymbolicator & 1) != 0)
    goto LABEL_26;
  SharedCacheBaseAddress = CSSymbolicatorGetSharedCacheBaseAddress();
  SharedCacheUUID = (__int128 *)CSSymbolicatorGetSharedCacheUUID();
  if (SharedCacheUUID)
  {
    v56 = *SharedCacheUUID;
    v10 = &v34;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x4002000000;
    v36 = (char *)__Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    memset(v38, 0, 24);
    v11 = *(uint64_t ***)(a1 + 32);
    if (v11)
    {
      do
      {
        v12 = SharedCacheDescription::uuid((SharedCacheDescription *)(v11 + 2));
        if (v12 == (_QWORD)v56 && v13 == *((_QWORD *)&v56 + 1))
        {
          SharedCache::symbolicator((SharedCache *)v11[7]);
          v15 = (__int128 *)(SharedCacheBaseAddress - CSSymbolicatorGetSharedCacheBaseAddress());
          SharedCache::symbolicator((SharedCache *)v11[7]);
          v33[3] = v3;
          v33[4] = (__int128 *)0x40000000;
          v33[5] = (__int128 *)___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke_2;
          v33[6] = (__int128 *)&unk_24EDD5560;
          v33[8] = (__int128 *)a1;
          v33[9] = v15;
          v33[7] = &v34;
          CSSymbolicatorForeachSymbolOwnerAtTime();
        }
        v11 = (uint64_t **)*v11;
      }
      while (v11);
      v10 = (__int128 *)*((_QWORD *)&v34 + 1);
      v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 40);
    }
    else
    {
      v16 = 0;
    }
    v17 = *((_QWORD *)v10 + 6);
    if (v17 != v16)
    {
      v18 = v40;
      memset(v33, 0, 24);
      std::vector<ProcessLibrary>::__init_with_size[abi:ne180100]<ProcessLibrary*,ProcessLibrary*>((char *)v33, v16, v17, (v17 - v16) >> 5);
      Process::addLibraries(v18, v33);
      v55[0] = (void **)v33;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](v55);
      _Block_object_dispose(&v34, 8);
      v55[0] = (void **)v38;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](v55);
      LODWORD(Pid) = v41;
LABEL_26:
      LODWORD(v34) = Pid;
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 352, (int *)&v34, &v34);
      std::__hash_table<std::__hash_value_type<int,Process *>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Process *>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Process *>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Process *>>>::__emplace_unique_key_args<int,int &,Process *&>(a1 + 312, &v41, &v41, &v39);
      v20 = *(uint64_t **)(a1 + 296);
      v19 = *(_QWORD *)(a1 + 304);
      if ((unint64_t)v20 >= v19)
      {
        v23 = *(_QWORD *)(a1 + 288);
        v24 = ((uint64_t)v20 - v23) >> 3;
        if ((unint64_t)(v24 + 1) >> 61)
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        v25 = v19 - v23;
        v26 = v25 >> 2;
        if (v25 >> 2 <= (unint64_t)(v24 + 1))
          v26 = v24 + 1;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
          v27 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v27 = v26;
        v37 = (void (*)(uint64_t))(a1 + 304);
        if (v27)
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<Process>>>(a1 + 304, v27);
        else
          v28 = 0;
        v29 = &v28[8 * v24];
        *(_QWORD *)&v34 = v28;
        *((_QWORD *)&v34 + 1) = v29;
        v36 = &v28[8 * v27];
        v30 = v40;
        v40 = 0;
        *(_QWORD *)v29 = v30;
        v35 = (uint64_t)(v29 + 8);
        std::vector<std::unique_ptr<Process>>::__swap_out_circular_buffer((uint64_t *)(a1 + 288), &v34);
        v22 = *(_QWORD **)(a1 + 296);
        std::__split_buffer<std::unique_ptr<Process>>::~__split_buffer((uint64_t)&v34);
      }
      else
      {
        v21 = v40;
        v40 = 0;
        *v20 = v21;
        v22 = v20 + 1;
        *(_QWORD *)(a1 + 296) = v22;
      }
      v6 = 0;
      *(_QWORD *)(a1 + 296) = v22;
      goto LABEL_41;
    }
    _Block_object_dispose(&v34, 8);
    v55[0] = (void **)v38;
    std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](v55);
  }
  v6 = 6;
LABEL_41:
  v31 = v40;
  v40 = 0;
  if (v31)
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&v40, v31);
LABEL_43:
  _Block_object_dispose(&v49, 8);
  *(_QWORD *)&v34 = v54;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
  return v6;
}

void sub_22639602C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;

  *(_QWORD *)(v33 - 152) = v32;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 152));
  _Block_object_dispose(&a21, 8);
  *(_QWORD *)(v33 - 152) = v31;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 152));
  v35 = a31;
  a31 = 0;
  if (v35)
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a31, v35);
  _Block_object_dispose((const void *)(v33 - 216), 8);
  *(_QWORD *)(v33 - 128) = a10;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 128));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 40);
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t BaseAddress;
  uint64_t KernelLibraryBaseAddress;
  char v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;

  v6 = *(_QWORD *)(a1 + 40);
  BaseAddress = CSSymbolOwnerGetBaseAddress();
  v15 = BaseAddress;
  if ((CSSymbolOwnerIsKextBundle() & 1) != 0 || *(_BYTE *)(a1 + 48))
  {
    KernelLibraryBaseAddress = findKernelLibraryBaseAddress();
    if (v9)
      v10 = KernelLibraryBaseAddress;
    else
      v10 = BaseAddress;
    v15 = v10;
  }
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(v6, a2, a3, &v14);
  std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &v15, &v14);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  if (*((_QWORD *)&v14 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_22639622C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(uint64_t *a1, uint64_t *a2, __int128 *a3)
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
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD *)(v6 - 8);
  if (v9 >= v8)
  {
    v11 = (uint64_t)(v9 - *a1) >> 5;
    if ((unint64_t)(v11 + 1) >> 59)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v12 = v7 - *a1;
    v13 = v12 >> 4;
    if (v12 >> 4 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0)
      v14 = 0x7FFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    v21 = v6;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>(v6, v14);
    else
      v15 = 0;
    v17 = v15;
    v18 = &v15[32 * v11];
    v20 = &v15[32 * v14];
    std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>((uint64_t)v18, a2, a3);
    v19 = v18 + 32;
    std::vector<ProcessLibrary>::__swap_out_circular_buffer(a1, &v17);
    v10 = a1[1];
    std::__split_buffer<ProcessLibrary>::~__split_buffer((uint64_t)&v17);
  }
  else
  {
    std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>(*(_QWORD *)(v6 - 8), a2, a3);
    v10 = v9 + 32;
    a1[1] = v9 + 32;
  }
  a1[1] = v10;
  return v10 - 32;
}

void sub_226396340(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;

  SymbolicationSession::sharedLibraryWithCSSymbolOwner(a1[5], a2, a3, &v8);
  v7 = a1[6] + CSSymbolOwnerGetBaseAddress();
  std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>((uint64_t *)(*(_QWORD *)(a1[4] + 8) + 40), &v7, &v8);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_226396408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::verifyKernelFromFileAndSetupLiveKernel(uint64_t a1)
{
  KernelSymbolicator *CFUUIDBytes;
  __int128 *v3;
  uint64_t v5;
  _QWORD v7[3];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CSSymbolicatorGetAOutSymbolOwner();
  CFUUIDBytes = (KernelSymbolicator *)CSSymbolOwnerGetCFUUIDBytes();
  if (!CFUUIDBytes)
    return 3;
  v9 = *(_OWORD *)CFUUIDBytes;
  memset(v7, 0, sizeof(v7));
  KernelSymbolicator::sharedKernelSymbolicator(CFUUIDBytes);
  CSSymbolicatorGetAOutSymbolOwner();
  v3 = (__int128 *)CSSymbolOwnerGetCFUUIDBytes();
  if (v3)
  {
    v8 = *v3;
    if ((_QWORD)v9 == (_QWORD)v8 && *((_QWORD *)&v9 + 1) == *((_QWORD *)&v8 + 1))
      v5 = SymbolicationSession::addProcessFromChunkSymbolicator(a1);
    else
      v5 = 7;
  }
  else
  {
    v5 = 4;
  }
  *(_QWORD *)&v8 = v7;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v5;
}

void sub_22639650C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(uint64_t a1)
{
  unint64_t v2;
  uint64_t SharedCacheUUID;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t **v9;
  uint64_t *v10;

  v8 = a1;
  v2 = atomic_load(&SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::dscMapFlag);
  if (v2 != -1)
  {
    v10 = &v8;
    v9 = &v10;
    std::__call_once(&SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::dscMapFlag, &v9, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::$_0 &&>>);
  }
  SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID)
    return 5;
  v4 = SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(*(SharedCacheSymbolicators **)SharedCacheUUID, *(uint8_t **)(SharedCacheUUID + 8));
  v6 = v5;
  if ((CSIsNull() & 1) != 0)
    return 7;
  else
    return SymbolicationSession::fillSharedCacheFromChunkSymbolicator(a1, (uint64_t)v4, v6);
}

uint64_t SymbolicationSession::addProcessFromModifiedNonFBSSymbolSource(uint64_t a1)
{
  uint64_t Signature;
  const void *v3;
  uint64_t v5;

  Signature = CSSymbolicatorCreateSignature();
  if (!Signature)
    return 6;
  v3 = (const void *)Signature;
  CSSymbolicatorCreateWithSignature();
  if (CSIsNull())
  {
    CFRelease(v3);
    return 6;
  }
  v5 = SymbolicationSession::addProcessFromChunkSymbolicator(a1);
  CFRelease(v3);
  CSRelease();
  return v5;
}

uint64_t SymbolicationSession::extractSymbolicationChunksFromFile(SymbolicationSession *a1)
{
  void (*v2)(const char *);
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  const char *v9;
  void **v10;
  void **v11;
  void **v12;
  void **v13;
  void *__p[2];
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD *);
  void *v21;
  uint64_t *v22;
  uint64_t *v23;
  SymbolicationSession *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(_QWORD *);
  void *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  SymbolicationSession *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  char __str[1024];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = *(void (**)(const char *))(*((_QWORD *)a1 + 1674) + 32);
  if (v2)
    v2("[Symbolication] Extracting symbolication related info and events from file");
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = 0;
  v3 = MEMORY[0x24BDAC760];
  v25 = MEMORY[0x24BDAC760];
  v26 = 0x40000000;
  v27 = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke;
  v28 = &unk_24EDD55B0;
  v29 = &v45;
  v30 = &v33;
  v31 = &v41;
  v32 = a1;
  ktrace_file_iterate();
  v4 = *((unsigned int *)v34 + 6);
  if (!(_DWORD)v4)
  {
    v18 = v3;
    v19 = 0x40000000;
    v20 = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_3;
    v21 = &unk_24EDD5600;
    v22 = &v37;
    v23 = &v33;
    v24 = a1;
    ktrace_file_iterate();
    v4 = *((unsigned int *)v34 + 6);
    if (!(_DWORD)v4)
    {
      if (!*((_BYTE *)v46 + 24) || !*((_BYTE *)v42 + 24) || !*((_BYTE *)v38 + 24))
      {
        v4 = 2;
        goto LABEL_61;
      }
      if (*(_DWORD *)(*((_QWORD *)a1 + 1674) + 4) != 1)
        goto LABEL_59;
      SymbolicationSession::collectAvailableDsymPaths(a1);
      v5 = (uint64_t *)*((_QWORD *)a1 + 1694);
      if (!v5)
        goto LABEL_62;
      v6 = 0;
      while (1)
      {
        v7 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((_QWORD *)a1 + 7, v5 + 2);
        v8 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((_QWORD *)a1 + 1682, v5 + 2);
        v9 = (const char *)(v5 + 4);
        if (v7)
        {
          if (*((_QWORD *)a1 + 1685) && v8)
          {
            if (*((_BYTE *)v8 + 32))
            {
              if (*(_QWORD *)(*((_QWORD *)a1 + 1674) + 32))
              {
                UUID::uuidString((UUID *)((uint8_t *)v5 + 1), (uint64_t)__p);
                if (!v17)
                  std::__throw_bad_optional_access[abi:ne180100]();
                if (v16 >= 0)
                  v10 = __p;
                else
                  v10 = (void **)__p[0];
                snprintf(__str, 0x400uLL, "[Symbolication] Library with uuid: %s is fully symbolicated. No new symbols will be written for this library", (const char *)v10);
                if (v17 && v16 < 0)
                  operator delete(__p[0]);
LABEL_56:
                (*(void (**)(char *))(*((_QWORD *)a1 + 1674) + 32))(__str);
              }
            }
            else
            {
              ++v6;
              if (*(_QWORD *)(*((_QWORD *)a1 + 1674) + 32))
              {
                UUID::uuidString((UUID *)((uint8_t *)v5 + 1), (uint64_t)__p);
                if (!v17)
                  std::__throw_bad_optional_access[abi:ne180100]();
                if (v16 >= 0)
                  v13 = __p;
                else
                  v13 = (void **)__p[0];
                if (*((char *)v5 + 55) < 0)
                  v9 = *(const char **)v9;
                snprintf(__str, 0x400uLL, "[Symbolication] Current Apple Trace contains incomplete symbols for uuid: %s. New symbols will be written for this library based on %s", (const char *)v13, v9);
                if (v17 && v16 < 0)
                  operator delete(__p[0]);
                goto LABEL_56;
              }
            }
          }
          else
          {
            ++v6;
            if (*(_QWORD *)(*((_QWORD *)a1 + 1674) + 32))
            {
              UUID::uuidString((UUID *)((uint8_t *)v5 + 1), (uint64_t)__p);
              if (!v17)
                std::__throw_bad_optional_access[abi:ne180100]();
              if (v16 >= 0)
                v12 = __p;
              else
                v12 = (void **)__p[0];
              if (*((char *)v5 + 55) < 0)
                v9 = *(const char **)v9;
              snprintf(__str, 0x400uLL, "[Symbolication] Current Apple Trace does not contain symbols for uuid: %s. The uuid is relevant for the file, new symbols will be written for this library based on %s", (const char *)v12, v9);
              if (v17 && v16 < 0)
                operator delete(__p[0]);
              goto LABEL_56;
            }
          }
        }
        else if (*(_QWORD *)(*((_QWORD *)a1 + 1674) + 32))
        {
          UUID::uuidString((UUID *)((uint8_t *)v5 + 1), (uint64_t)__p);
          if (!v17)
            std::__throw_bad_optional_access[abi:ne180100]();
          if (v16 >= 0)
            v11 = __p;
          else
            v11 = (void **)__p[0];
          if (*((char *)v5 + 55) < 0)
            v9 = *(const char **)v9;
          snprintf(__str, 0x400uLL, "[Symbolication] UUID: %s in %s is not relevant to current Apple Trace, it does not match any library found in file ", (const char *)v11, v9);
          if (v17 && v16 < 0)
            operator delete(__p[0]);
          goto LABEL_56;
        }
        v5 = (uint64_t *)*v5;
        if (!v5)
        {
          if (v6)
          {
LABEL_59:
            v4 = 0;
            break;
          }
LABEL_62:
          v4 = 8;
          break;
        }
      }
    }
  }
LABEL_61:
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  return v4;
}

void sub_226396AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  if (a18)
  {
    if (a17 < 0)
      operator delete(__p);
  }
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

BOOL ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  int v5;
  int v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  __int128 *CFUUIDBytes;
  _QWORD *v13;
  uint64_t v14;
  int v15;
  _BOOL8 result;
  _QWORD v17[7];
  __int128 *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a1[7];
  if (ktrace_chunk_tag() == 20585)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    ktrace_chunk_size();
    v3 = ktrace_chunk_copy_cfdata();
    if (v3)
    {
      v4 = (const void *)v3;
      MEMORY[0x227696DA0](v3, 0);
      if ((CSIsNull() & 1) != 0)
        goto LABEL_24;
      v5 = *(_DWORD *)(*(_QWORD *)(v2 + 13392) + 4);
      if ((v5 - 1) >= 2)
      {
        if (v5)
          goto LABEL_24;
        v6 = SymbolicationSession::verifyKernelFromFileAndSetupLiveKernel(v2);
      }
      else
      {
        v6 = SymbolicationSession::addProcessFromChunkSymbolicator(v2);
      }
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
LABEL_24:
      CFRelease(v4);
      return !*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    }
    v14 = *(_QWORD *)(a1[5] + 8);
    v15 = 3;
LABEL_20:
    *(_DWORD *)(v14 + 24) = v15;
    return 0;
  }
  if (ktrace_chunk_tag() == 20584)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    ktrace_chunk_size();
    v7 = ktrace_chunk_copy_cfdata();
    if (!v7)
    {
      v14 = *(_QWORD *)(a1[5] + 8);
      v15 = 5;
      goto LABEL_20;
    }
    v8 = (const void *)v7;
    *(_QWORD *)&v19 = 0;
    *((_QWORD *)&v19 + 1) = &v19;
    v20 = 0x2000000000;
    v21 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 0x40000000;
    v17[2] = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_2;
    v17[3] = &unk_24EDD5588;
    v17[5] = &v19;
    v17[6] = v2;
    v17[4] = a1[5];
    MEMORY[0x227696DF4](v7, 0, v17);
    CFRelease(v8);
    v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24);
    _Block_object_dispose(&v19, 8);
    if (!v9)
      return 0;
  }
  else if (ktrace_chunk_tag() == 20583)
  {
    if (!*(_DWORD *)(*(_QWORD *)(v2 + 13392) + 4))
    {
      result = 0;
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 9;
      return result;
    }
    ktrace_chunk_size();
    v10 = ktrace_chunk_copy_cfdata();
    if (v10)
    {
      v11 = (const void *)v10;
      MEMORY[0x227696DA0](v10, 0);
      if ((CSIsNull() & 1) == 0)
      {
        CSSymbolicatorGetSymbolOwner();
        if ((CSIsNull() & 1) == 0)
        {
          CFUUIDBytes = (__int128 *)CSSymbolOwnerGetCFUUIDBytes();
          if (CFUUIDBytes)
          {
            v19 = *CFUUIDBytes;
            v13 = (_QWORD *)(v2 + 13456);
            if (std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v13, &v19))
            {
              v18 = &v19;
              *((_BYTE *)std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)v13, &v19, (uint64_t)&std::piecewise_construct, &v18)+ 32) = 1;
            }
            else
            {
              LOBYTE(v18) = CSSymbolOwnerGetSourceInfoCount() != 0;
              std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,UUID&,BOOL>((uint64_t)v13, &v19, &v19, &v18);
            }
          }
        }
      }
      CSRelease();
      CFRelease(v11);
    }
  }
  return 1;
}

void sub_226396ECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  int v5;

  result = a1[6];
  v5 = *(_DWORD *)(*(_QWORD *)(result + 13392) + 4);
  if ((v5 - 1) >= 2)
  {
    if (v5)
      goto LABEL_6;
    result = SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(result);
  }
  else
  {
    result = SymbolicationSession::fillSharedCacheFromChunkSymbolicator(result, a2, a3);
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
LABEL_6:
  if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  return result;
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _QWORD v7[6];

  v2 = a1[6];
  v3 = 1;
  if (ktrace_chunk_tag() == 20586)
  {
    ktrace_chunk_size();
    v4 = ktrace_chunk_copy_cfdata();
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    if (v4)
    {
      v5 = (const void *)v4;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 0x40000000;
      v7[2] = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_4;
      v7[3] = &unk_24EDD55D8;
      v7[4] = a1[5];
      v7[5] = v2;
      MEMORY[0x227696DF4](v4, 0, v7);
      CFRelease(v5);
      if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
        return v3;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 6;
    }
    return 0;
  }
  return v3;
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_4(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_QWORD *)(a1 + 40);
  v3 = *(_DWORD *)(*(_QWORD *)(result + 13392) + 4);
  if ((v3 - 1) >= 2)
  {
    if (v3)
      return result;
    result = SymbolicationSession::addProcessFromModifiedNonFBSSymbolSource(result);
  }
  else
  {
    result = SymbolicationSession::addProcessFromChunkSymbolicator(result);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void SymbolicationSession::writeSymbolDataToKtraceFile(uint64_t a1, uint64_t a2)
{
  int v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(const char *);
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  _QWORD v13[3];
  _QWORD *v14;
  char __str[4];
  int v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 13392) + 8);
  if (v4 != 1)
  {
    if (v4)
      return;
    if (!a2)
      goto LABEL_16;
    v17[0] = &off_24EDD5800;
    v17[1] = a2;
    v17[2] = &v12;
    v18 = v17;
    SymbolicationSession::forEachSymbolChunk((const void **)a1, (uint64_t)v17);
    v5 = v18;
    if (v18 == v17)
    {
      v6 = 4;
      v5 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_16;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_16:
    ats_symbolication_log_init();
    v11 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__str = 67109120;
      v16 = v12;
      _os_log_impl(&dword_226389000, v11, OS_LOG_TYPE_INFO, "Wrote %u symbol chunks", (uint8_t *)__str, 8u);
    }
    return;
  }
  SymbolicationSession::filterUUIDsNeedingSymbolicationWithFile((_QWORD *)a1);
  v7 = *(_QWORD *)(a1 + 13392);
  if (*(_DWORD *)(v7 + 4) == 2)
  {
    v8 = *(void (**)(const char *))(v7 + 32);
    if (*(_QWORD *)(a1 + 13520))
    {
      if (v8)
      {
        snprintf(__str, 0x400uLL, "Symbolication failed. No dSYMs were found by '%s'.", *(const char **)(v7 + 40));
        (*(void (**)(char *))(*(_QWORD *)(a1 + 13392) + 32))(__str);
      }
    }
    else if (v8)
    {
      v8("[Symbolication] All libraries are symbolicated.");
    }
    return;
  }
  v13[0] = &off_24EDD5890;
  v13[1] = a2;
  v13[2] = &v12;
  v14 = v13;
  SymbolicationSession::forEachResymbolicatedSymbolChunk(a1, (uint64_t)v13);
  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_22;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_22:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 13392) + 32))
  {
    snprintf(__str, 0x400uLL, "[Symbolication] Successfully symbolicated %u libraries", v12);
    (*(void (**)(char *))(*(_QWORD *)(a1 + 13392) + 32))(__str);
  }
}

void sub_2263972DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char *a14)
{
  char *v14;
  char *v16;
  uint64_t v17;

  v16 = a14;
  if (a14 == v14)
  {
    v17 = 4;
    v16 = &a11;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::createProcessMapsChunk()
{
  uint64_t FlatbufferSignatureForSymbolicatorsWithBlock;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  FlatbufferSignatureForSymbolicatorsWithBlock = CSSymbolicatorCreateFlatbufferSignatureForSymbolicatorsWithBlock();
  ats_symbolication_log_init();
  v1 = ats_symbolication_log;
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
  {
    v2 = v10[3];
    v3 = v6[3];
    *(_DWORD *)buf = 134218240;
    v14 = v2;
    v15 = 2048;
    v16 = v3;
    _os_log_impl(&dword_226389000, v1, OS_LOG_TYPE_INFO, "Created %zu process maps, %zu failures", buf, 0x16u);
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return FlatbufferSignatureForSymbolicatorsWithBlock;
}

void sub_226397480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN20SymbolicationSession22createProcessMapsChunkEP11ktrace_file_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  Process **v3;
  Process **v4;
  uint64_t v6;
  uint64_t TransientProcessSymbolicatorFromDescriptions;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(result + 48);
  v3 = *(Process ***)(v2 + 288);
  v4 = *(Process ***)(v2 + 296);
  if (v3 != v4)
  {
    v6 = result;
    do
    {
      result = Process::pid(*v3);
      if ((_DWORD)result)
      {
        TransientProcessSymbolicatorFromDescriptions = Process::createTransientProcessSymbolicatorFromDescriptions(*v3);
        v9 = v8;
        result = CSIsNull();
        if ((result & 1) != 0)
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24);
        }
        else
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, TransientProcessSymbolicatorFromDescriptions, v9);
          result = CSRelease();
        }
      }
      ++v3;
    }
    while (v3 != v4);
  }
  return result;
}

void SymbolicationSession::writeProcessMapsToKtraceFile(SymbolicationSession *this)
{
  const __CFData *ProcessMapsChunk;
  const __CFData *v2;
  NSObject *v3;

  if (!*(_BYTE *)(*((_QWORD *)this + 1674) + 24))
    SymbolicationSession::updateKdebugLibraryView(this);
  ProcessMapsChunk = (const __CFData *)SymbolicationSession::createProcessMapsChunk();
  if (ProcessMapsChunk)
  {
    v2 = ProcessMapsChunk;
    CFDataGetBytePtr(ProcessMapsChunk);
    CFDataGetLength(v2);
    if (!ktrace_file_append_chunk())
    {
      ats_symbolication_log_init();
      v3 = ats_symbolication_log;
      if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR))
        SymbolicationSession::writeProcessMapsToKtraceFile(v3);
    }
    CFRelease(v2);
  }
}

uint64_t SymbolicationSession::setKtraceSession(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 392) = a2;
  *(_BYTE *)(result + 408) = 0;
  return result;
}

uint64_t SymbolicationSession::SymbolicationSession(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)operator new(0x40uLL);
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = &unk_24EDD5910;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 7) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_QWORD *)a1 = v4 + 24;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(_QWORD *)(a1 + 168) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 176) = 1065353216;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_DWORD *)(a1 + 216) = 1065353216;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_DWORD *)(a1 + 256) = 1065353216;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_DWORD *)(a1 + 344) = 1065353216;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_DWORD *)(a1 + 384) = 1065353216;
  *(_QWORD *)(a1 + 392) = 0;
  *(_BYTE *)(a1 + 408) = 0;
  DyldKdebugHandler::DyldKdebugHandler(a1 + 416, a1);
  *(_BYTE *)(a1 + 13384) = 0;
  *(_QWORD *)(a1 + 13392) = a2;
  *(_OWORD *)(a1 + 13400) = 0u;
  *(_OWORD *)(a1 + 13416) = 0u;
  *(_DWORD *)(a1 + 13432) = 1065353216;
  *(_OWORD *)(a1 + 13456) = 0u;
  *(_OWORD *)(a1 + 13472) = 0u;
  *(_DWORD *)(a1 + 13488) = 1065353216;
  *(_OWORD *)(a1 + 13496) = 0u;
  *(_OWORD *)(a1 + 13512) = 0u;
  *(_DWORD *)(a1 + 13528) = 1065353216;
  *(_OWORD *)(a1 + 13536) = 0u;
  *(_OWORD *)(a1 + 13552) = 0u;
  *(_DWORD *)(a1 + 13568) = 1065353216;
  *(_QWORD *)(a1 + 400) = dispatch_queue_create("com.apple.appletracingsupport.symbolication", 0);
  if (!*(_QWORD *)(a1 + 13392))
  {
    ats_create_symbolication_config();
    *(_QWORD *)(a1 + 13392) = v5;
  }
  return a1;
}

void sub_2263977BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  DyldKdebugHandler *v19;
  uint64_t v20;
  uint64_t v22;

  v22 = v18;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v20);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v13);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a10);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v22);
  DyldKdebugHandler::~DyldKdebugHandler(v19);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 352);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 312);
  a12 = (void **)(v12 + 288);
  std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](&a12);
  std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](&a12);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v17);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v16);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 144);
  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table(v15);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table(v14);
  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table(a11);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v12);
  _Unwind_Resume(a1);
}

void DyldKdebugHandler::~DyldKdebugHandler(DyldKdebugHandler *this)
{
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this + 12944);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12904);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12864);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12824);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12784);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12744);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 12704);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 12664);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12624);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12584);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12544);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12504);
}

void SymbolicationSession::SymbolicationSession(SymbolicationSession *this)
{
  SymbolicationSession::SymbolicationSession((uint64_t)this, 0);
}

{
  SymbolicationSession::SymbolicationSession((uint64_t)this, 0);
}

void SymbolicationSession::~SymbolicationSession(SymbolicationSession *this)
{
  NSObject *v2;
  uint64_t v3;
  void **v4;

  if (*((_QWORD *)this + 49) && *((_BYTE *)this + 408))
    ktrace_session_destroy();
  v2 = *((_QWORD *)this + 50);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 1674);
  if (v3 && !*(_BYTE *)(v3 + 24))
    ats_destroy_symbolication_config(v3);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 13536);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 13496);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13456);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13400);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this + 13360);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13320);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13280);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13240);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13200);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13160);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 13120);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 13080);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 13040);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 13000);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12960);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12920);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 352);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 312);
  v4 = (void **)((char *)this + 288);
  std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](&v4);
  v4 = (void **)((char *)this + 264);
  std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](&v4);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 224);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 184);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 144);
  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table((uint64_t)this + 96);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table((uint64_t)this + 56);
  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table((uint64_t)this + 16);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

uint64_t std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>(uint64_t *a1, kcdata_iter *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  Stackshot *v14;
  Stackshot *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0x21CFB2B78C13521DLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x9A90E7D95BC609)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x21CFB2B78C13521DLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x4D4873ECADE304)
    v9 = 0x9A90E7D95BC609;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Stackshot>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = (Stackshot *)&v10[424 * v4];
  v15 = v14;
  v16 = &v10[424 * v9];
  Stackshot::Stackshot(v14, *a2);
  v15 = (Stackshot *)((char *)v14 + 424);
  std::vector<Stackshot>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<Stackshot>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_226397BBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<Stackshot>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<Stackshot>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 424;
    v4 -= 424;
    result = (uint64_t *)std::construct_at[abi:ne180100]<Stackshot,Stackshot,Stackshot*>(v6, v4);
  }
  a2[1] = v6;
  v7 = *v3;
  *v3 = v6;
  a2[1] = v7;
  v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Stackshot>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x9A90E7D95BC60ALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(424 * a2);
}

uint64_t std::construct_at[abi:ne180100]<Stackshot,Stackshot,Stackshot*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1, (uint64_t *)a2);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(v4 + 40, (uint64_t *)(a2 + 40));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 80, (uint64_t *)(a2 + 80));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 120, (uint64_t *)(a2 + 120));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 160, (uint64_t *)(a2 + 160));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 200, (uint64_t *)(a2 + 200));
  v5 = *(_OWORD *)(a2 + 240);
  v6 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v6;
  *(_OWORD *)(a1 + 240) = v5;
  v7 = *(_OWORD *)(a2 + 288);
  v8 = *(_OWORD *)(a2 + 304);
  v9 = *(_OWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 304) = v8;
  *(_OWORD *)(a1 + 320) = v9;
  *(_OWORD *)(a1 + 288) = v7;
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 344, (uint64_t *)(a2 + 344));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 384, (uint64_t *)(a2 + 384));
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t std::__destroy_at[abi:ne180100]<Stackshot,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a1 + 384);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a1 + 344);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(a1 + 200);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(a1 + 160);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 120);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 40);
  return std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1);
}

uint64_t std::__split_buffer<Stackshot>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 424;
    std::__destroy_at[abi:ne180100]<Stackshot,0>(i - 424);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(result + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(result + 40) = v2;
  return result;
}

unint64_t ___ZL28findKernelLibraryBaseAddress10_CSTypeRef_block_invoke(uint64_t a1)
{
  const char *Name;
  _BOOL4 v3;
  const char *v4;
  _BOOL4 v5;
  unint64_t result;
  _BOOL4 v7;
  uint64_t v8;

  Name = (const char *)CSRegionGetName();
  if (Name)
    v3 = strncmp(Name, "__TEXT_EXEC", 0xBuLL) == 0;
  else
    v3 = 0;
  v4 = (const char *)CSRegionGetName();
  if (v4)
    v5 = strncmp(v4, "__PPLTEXT", 9uLL) == 0;
  else
    v5 = 0;
  result = CSRegionGetName();
  if (result)
  {
    result = strncmp((const char *)result, "__PPLTRAMP", 0xAuLL);
    v7 = result == 0;
  }
  else
  {
    v7 = 0;
  }
  if (v3 || v5 || v7)
  {
    result = CSRegionGetRange();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v8 + 48))
    {
      if (result >= *(_QWORD *)(v8 + 40))
        result = *(_QWORD *)(v8 + 40);
    }
    *(_QWORD *)(v8 + 40) = result;
    *(_BYTE *)(v8 + 48) = 1;
  }
  return result;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  v4 = (int)v3 < 0;
  v5 = *((_QWORD *)a2 + 1);
  if ((int)v3 < 0)
    a2 = *(char **)a2;
  v3 = v3;
  if (v4)
    v3 = v5;
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_226397FC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *i;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      v16 = *v4++;
      *i = v16;
    }
    *i = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_226398138(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
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
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

BOOL std::string_view::ends_with[abi:ne180100](_QWORD *a1, void *__s2, size_t a3)
{
  size_t v3;

  v3 = a1[1];
  return v3 >= a3
      && std::string_view::compare[abi:ne180100](a1, v3 - a3, 0xFFFFFFFFFFFFFFFFLL, __s2, a3) == 0;
}

uint64_t std::string_view::compare[abi:ne180100](_QWORD *a1, unint64_t a2, size_t a3, void *__s2, size_t a5)
{
  unint64_t v5;
  BOOL v6;
  size_t v7;
  const void *v9;
  size_t v10;
  size_t v11;
  uint64_t result;
  unsigned int v13;

  v5 = a1[1];
  v6 = v5 >= a2;
  v7 = v5 - a2;
  if (!v6)
    std::__throw_out_of_range[abi:ne180100]("string_view::substr");
  v9 = (const void *)(*a1 + a2);
  if (v7 >= a3)
    v10 = a3;
  else
    v10 = v7;
  if (a5 >= v10)
    v11 = v10;
  else
    v11 = a5;
  LODWORD(result) = memcmp(v9, __s2, v11);
  if (v10 < a5)
    v13 = -1;
  else
    v13 = 1;
  if (v10 == a5)
    v13 = 0;
  if ((_DWORD)result)
    return result;
  else
    return v13;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EDD5100, MEMORY[0x24BEDAB00]);
}

void sub_2263984F0(_Unwind_Exception *a1)
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

uint64_t std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>(uint64_t a1, uint64_t *a2, __int128 *a3)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;

  v4 = *a2;
  v9 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  ProcessLibrary::ProcessLibrary(a1, v4, (uint64_t)&v9);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return a1;
}

void sub_22639862C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ProcessLibrary>::__init_with_size[abi:ne180100]<ProcessLibrary*,ProcessLibrary*>(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    v6 = result;
    result = std::vector<ProcessLibrary>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      *(_OWORD *)v7 = *(_OWORD *)a2;
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(a2 + 16);
      v8 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(v7 + 24) = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 32;
      v7 += 32;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_2263986D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ProcessLibrary>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

uint64_t std::vector<std::unique_ptr<Process>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<Process>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    v11 = a6;
  }
  else
  {
    v8 = (_QWORD *)(a7 - 8);
    v9 = (_QWORD *)(a7 - 8);
    do
    {
      v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((_QWORD *)&v16 + 1) = v8;
      v7 -= 8;
      v8 = v9;
    }
    while (a3 != a5);
    v11 = v16;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(uint64_t **)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *v1;
    *v1 = 0;
    if (v3)
      std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)v1, v3);
    ++v1;
  }
}

uint64_t std::__split_buffer<std::unique_ptr<Process>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::unique_ptr<Process>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::unique_ptr<Process>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;
  uint64_t v5;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v5 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v5)
      std::default_delete<Process>::operator()[abi:ne180100](i - 8, v5);
  }
}

void std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<Process>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, (uint64_t *)*v2);
    operator delete(**a1);
  }
}

void std::vector<std::unique_ptr<Process>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    v5 = v4 - 1;
    do
    {
      v6 = *v5;
      *v5 = 0;
      if (v6)
        std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)v5, v6);
    }
    while (v5-- != a2);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

void std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 424;
        std::__destroy_at[abi:ne180100]<Stackshot,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,MergedLibrary>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,MergedLibrary>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = a2[1] ^ *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v7 >= v8)
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
            if (v11[2] == *a2 && v11[3] == a2[1])
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
  v11 = operator new(0x58uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_OWORD *)v11 + 1) = **a4;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  v11[10] = 0;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
    *v11 = *v21;
LABEL_42:
    *v21 = v11;
    goto LABEL_43;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v20 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
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
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_226398C94(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(uint64_t a1, LibraryDescription *this, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  void **v12;
  _QWORD *v13;
  unint64_t v14;
  __int128 v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;

  v7 = LibraryDescription::hash(this);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      v13 = *v12;
      if (*v12)
      {
        do
        {
          v14 = v13[1];
          if (v14 == v8)
          {
            if (LibraryDescription::operator==((uint64_t)(v13 + 2), (uint64_t)this))
              return v13;
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9)
                v14 %= v9;
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3)
              break;
          }
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
    }
  }
  v13 = operator new(0x40uLL);
  *v13 = 0;
  v13[1] = v8;
  v15 = a3[1];
  *((_OWORD *)v13 + 1) = *a3;
  *((_OWORD *)v13 + 2) = v15;
  *((_OWORD *)v13 + 3) = a3[2];
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    v18 = 1;
    if (v9 >= 3)
      v18 = (v9 & (v9 - 1)) != 0;
    v19 = v18 | (2 * v9);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v22 = *(_QWORD *)a1;
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v23)
  {
    *v13 = *v23;
LABEL_38:
    *v23 = v13;
    goto LABEL_39;
  }
  *v13 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v13;
  *(_QWORD *)(v22 + 8 * v3) = a1 + 16;
  if (*v13)
  {
    v24 = *(_QWORD *)(*v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9)
        v24 %= v9;
    }
    else
    {
      v24 &= v9 - 1;
    }
    v23 = (_QWORD *)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v13;
}

void sub_226398ED4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::find<SharedCacheDescription>(_QWORD *a1, SharedCacheDescription *this)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;

  v4 = SharedCacheDescription::hash(this);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
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
  v10 = *(_QWORD **)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = (_QWORD *)*v10;
  if (*v10)
  {
    do
    {
      v12 = v11[1];
      if (v12 == v6)
      {
        if (SharedCacheDescription::operator==(v11 + 2, this))
          return v11;
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
          return 0;
      }
      v11 = (_QWORD *)*v11;
    }
    while (v11);
  }
  return v11;
}

_QWORD *std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,SharedCacheDescription &,std::shared_ptr<StringPool> &,void>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0xB8uLL);
  result = std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<SharedCacheDescription &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22639902C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<SharedCacheDescription &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(_QWORD *a1, uint64_t a2)
{
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  a1[2] = 0;
  *a1 = &unk_24EDD5680;
  a1[1] = 0;
  v3 = *(_OWORD *)(a2 + 16);
  v5[0] = *(_OWORD *)a2;
  v5[1] = v3;
  v6 = *(_QWORD *)(a2 + 32);
  SharedCache::SharedCache(a1 + 3, v5);
  return a1;
}

void sub_2263990C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SharedCache>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5680;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SharedCache>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5680;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x227696F98);
}

void std::__shared_ptr_emplace<SharedCache>::__on_zero_shared(uint64_t a1)
{
  SharedCache::~SharedCache((SharedCache *)(a1 + 24));
}

_QWORD *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>>(uint64_t a1, SharedCacheDescription *this, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  char *v17;
  __int128 v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD v28[2];
  char v29;

  v9 = SharedCacheDescription::hash(this);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = (_QWORD *)*v14;
      if (*v14)
      {
        do
        {
          v16 = v15[1];
          if (v16 == v10)
          {
            if (SharedCacheDescription::operator==(v15 + 2, this))
              return v15;
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11)
                v16 %= v11;
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4)
              break;
          }
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
    }
  }
  v17 = (char *)operator new(0x48uLL);
  v28[0] = v17;
  v28[1] = a1 + 16;
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = v10;
  v18 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v17 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v17 + 2) = v18;
  *((_QWORD *)v17 + 6) = *(_QWORD *)(a3 + 32);
  *(_OWORD *)(v17 + 56) = *(_OWORD *)a4;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v29 = 1;
  v19 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v20 = *(float *)(a1 + 32);
  if (!v11 || (float)(v20 * (float)v11) < v19)
  {
    v21 = 1;
    if (v11 >= 3)
      v21 = (v11 & (v11 - 1)) != 0;
    v22 = v21 | (2 * v11);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      v24 = v23;
    else
      v24 = v22;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v24);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v25)
  {
    *(_QWORD *)v28[0] = *v25;
    *v25 = v28[0];
  }
  else
  {
    *(_QWORD *)v28[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v28[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v28[0])
    {
      v26 = *(_QWORD *)(*(_QWORD *)v28[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v26 >= v11)
          v26 %= v11;
      }
      else
      {
        v26 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v26) = v28[0];
    }
  }
  v15 = (_QWORD *)v28[0];
  v28[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>>::reset[abi:ne180100]((uint64_t)v28, 0);
  return v15;
}

void sub_22639939C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)v2 + 56);
    operator delete(v2);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = a2[1] ^ *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = a2[1] ^ *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1])
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
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,UUID &,std::string_view &,std::shared_ptr<StringPool> &,void>@<X0>(_QWORD *a1@<X1>, _QWORD *a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = operator new(0x128uLL);
  result = std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<UUID &,std::string_view &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_226399514(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<UUID &,std::string_view &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t a4)
{
  a1[2] = 0;
  *a1 = &unk_24EDD56D0;
  a1[1] = 0;
  SharedLibrary::SharedLibrary(a1 + 3, *a2, a2[1], *a3, a3[1], a4);
  return a1;
}

void sub_226399574(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SharedLibrary>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD56D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SharedLibrary>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD56D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x227696F98);
}

void std::__shared_ptr_emplace<SharedLibrary>::__on_zero_shared(uint64_t a1)
{
  SharedLibrary::~SharedLibrary((SharedLibrary *)(a1 + 24));
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(uint64_t a1, _QWORD *a2, _OWORD *a3, __int128 *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[2];
  char v28;

  v8 = a2[1] ^ *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = (_QWORD *)*v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2 && v12[3] == a2[1])
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v15 = a1 + 16;
  v16 = operator new(0x30uLL);
  v27[0] = v16;
  v27[1] = a1 + 16;
  *v16 = 0;
  v16[1] = v8;
  v17 = *a4;
  *((_OWORD *)v16 + 1) = *a3;
  *((_OWORD *)v16 + 2) = v17;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v28 = 1;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    v20 = 1;
    if (v9 >= 3)
      v20 = (v9 & (v9 - 1)) != 0;
    v21 = v20 | (2 * v9);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v23);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v24)
  {
    *(_QWORD *)v27[0] = *v24;
    *v24 = v27[0];
  }
  else
  {
    *(_QWORD *)v27[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v27[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v15;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v25 >= v9)
          v25 %= v9;
      }
      else
      {
        v25 &= v9 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  v12 = (_QWORD *)v27[0];
  v27[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return v12;
}

void sub_226399838(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

_QWORD *std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x128uLL);
  result = std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_2263998E0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  a1[2] = 0;
  *a1 = &unk_24EDD56D0;
  a1[1] = 0;
  SharedLibrary::SharedLibrary(a1 + 3, *a2, a2[1], a3);
  return a1;
}

void sub_226399938(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(_QWORD *a1, uint64_t a2, Stackshot *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 0x80000000) == 0 && !SymbolicationSession::createProcess<Stackshot>(a1, a2, a3))
  {
    ats_symbolication_log_init();
    v4 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR))
      SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(a2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void SymbolicationSession::updateProcessWithDataProvider<Stackshot>(unint64_t *a1, int a2, Stackshot *a3)
{
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *__p;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 *v15[3];
  __int128 *v16;
  __int128 *v17;
  __int128 *v18;

  LODWORD(v16) = a2;
  v6 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)&v16);
  if (v6)
  {
    v7 = v6[3];
    if (v7)
    {
      SymbolicationSession::createProcessLibrariesForPid<Stackshot>(a1, a2, a3, (uint64_t *)&v16);
      if (v17 != v16)
      {
        v15[0] = v16;
        v15[1] = v17;
        v15[2] = v18;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        Process::addLibraries(v7, v15);
        v12 = v15;
        std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
      }
      SymbolicationSession::aotImagesForPid<Stackshot>(a3, a2, (uint64_t *)&v12);
      v8 = v12;
      if (v13 != v12)
      {
        __p = v12;
        v10 = v13;
        v11 = v14;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        Process::addAOTImages(v7, (char **)&__p);
        if (__p)
        {
          v10 = __p;
          operator delete(__p);
        }
        v8 = v12;
      }
      if (v8)
      {
        v13 = v8;
        operator delete(v8);
      }
      v12 = &v16;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
    }
  }
}

void sub_226399AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char *a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p)
    operator delete(__p);
  if (a12)
  {
    a13 = a12;
    operator delete(a12);
  }
  a12 = &a18;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcess<Stackshot>(_QWORD *a1, uint64_t a2, Stackshot *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  __n128 __p;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  int v36;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _OWORD v44[2];
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v36 = a2;
  LODWORD(v40) = a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(a1 + 44), (int *)&v40, &v40);
  SymbolicationSession::createProcessLibrariesForPid<Stackshot>(a1, a2, a3, (uint64_t *)&v34);
  v6 = operator new();
  v40 = v34;
  *(_QWORD *)&v41 = v35;
  v35 = 0;
  v34 = 0uLL;
  Process::Process(v6, a2, &v40);
  v33 = v6;
  *(_QWORD *)&v46[0] = &v40;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)v46);
  v32 = v6;
  if (v6)
  {
    std::__hash_table<std::__hash_value_type<int,Process *>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Process *>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Process *>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Process *>>>::__emplace_unique_key_args<int,int &,Process *&>((uint64_t)(a1 + 39), &v36, &v36, &v32);
    v8 = (uint64_t *)a1[37];
    v7 = a1[38];
    if ((unint64_t)v8 >= v7)
    {
      v12 = a1[36];
      v13 = ((uint64_t)v8 - v12) >> 3;
      if ((unint64_t)(v13 + 1) >> 61)
        std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
      v14 = v7 - v12;
      v15 = v14 >> 2;
      if (v14 >> 2 <= (unint64_t)(v13 + 1))
        v15 = v13 + 1;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v16 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v16 = v15;
      *(_QWORD *)&v42 = a1 + 38;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<Process>>>((uint64_t)(a1 + 38), v16);
      else
        v17 = 0;
      v18 = &v17[8 * v13];
      *(_QWORD *)&v40 = v17;
      *((_QWORD *)&v40 + 1) = v18;
      *((_QWORD *)&v41 + 1) = &v17[8 * v16];
      v19 = v33;
      v33 = 0;
      *(_QWORD *)v18 = v19;
      *(_QWORD *)&v41 = v18 + 8;
      std::vector<std::unique_ptr<Process>>::__swap_out_circular_buffer(a1 + 36, &v40);
      v10 = (_QWORD *)a1[37];
      std::__split_buffer<std::unique_ptr<Process>>::~__split_buffer((uint64_t)&v40);
    }
    else
    {
      v9 = v33;
      v33 = 0;
      *v8 = v9;
      v10 = v8 + 1;
      a1[37] = v10;
    }
    a1[37] = v10;
    SymbolicationSession::sharedCacheDescriptionForPid<Stackshot>(a3, v36, (uint64_t)v46);
    if (v48)
    {
      v44[0] = v46[0];
      v44[1] = v46[1];
      v45 = v47;
      SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v44, &v40);
      if ((_QWORD)v40)
        Process::setSharedCache(v32, (uint64_t *)&v40);
      v20 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
      if (*((_QWORD *)&v40 + 1))
      {
        v21 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
    SymbolicationSession::aotSharedCacheDescriptionForPid<Stackshot>(a3, v36, (uint64_t)&v40);
    if (v43)
    {
      v38[0] = v40;
      v38[1] = v41;
      v38[2] = v42;
      AOTSharedCache::AOTSharedCache((uint64_t)v39, (uint64_t)v38);
      v37[0] = v39[0];
      v37[1] = v39[1];
      v37[2] = v39[2];
      Process::setAOTSharedCache(v32, (uint64_t)v37);
      v30 = 0;
      v31 = 0;
      SymbolicationSession::aotImagesForPid<Stackshot>(a3, v36, (uint64_t *)&v28);
      v23 = (void *)v28.n128_u64[0];
      if (v28.n128_u64[0] != v28.n128_u64[1])
      {
        __p = v28;
        v27 = v29;
        v28 = 0uLL;
        v29 = 0;
        Process::setAOTImages(v32, &__p);
        if (__p.n128_u64[0])
        {
          __p.n128_u64[1] = __p.n128_u64[0];
          operator delete((void *)__p.n128_u64[0]);
        }
        v23 = (void *)v28.n128_u64[0];
      }
      if (v23)
      {
        v28.n128_u64[1] = (unint64_t)v23;
        operator delete(v23);
      }
    }
    v11 = v32;
    v24 = v33;
    v33 = 0;
    if (v24)
      std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&v33, v24);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)&v40 = &v34;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
  return v11;
}

void sub_226399E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v19;
  uint64_t v21;

  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  v21 = a18;
  a18 = 0;
  if (v21)
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a18, v21);
  *(_QWORD *)(v19 - 104) = &a19;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v19 - 104));
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcessLibrariesForPid<Stackshot>@<X0>(unint64_t *a1@<X0>, int a2@<W1>, Stackshot *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t *v8;
  _OWORD *v9;
  uint64_t v10;
  __n128 *v11;
  int v12;
  int v13;
  int v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  size_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  void **v24;
  __int128 v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  void **v37;
  void *__p[2];
  uint64_t v40;
  uint64_t v41;
  char *__s;
  __n128 __s1;
  char v44;
  uint64_t Address;
  _BYTE v46[16];
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  std::string *(*v50)(uint64_t);
  void *v51;
  unint64_t *v52;
  int pid;
  UUID v54;
  _BYTE buffer[32];
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  pid = a2;
  v7 = (uint64_t)(a1 + 18);
  if (!std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 18, &pid))
  {
    if (proc_pidpath(pid, buffer, 0x400u) >= 1)
    {
      v48 = MEMORY[0x24BDAC760];
      v49 = 0x40000000;
      v50 = ___ZN20SymbolicationSession28createProcessLibrariesForPidI9StackshotEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke;
      v51 = &__block_descriptor_tmp_48;
      v52 = a1;
      CSSymbolicatorForeachSymbolicatorWithPath();
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(v7, &pid, &pid);
  }
  SymbolicationSession::collectAllLibraryDescriptionsForPid<Stackshot>(a3, a1, pid, (uint64_t)v46);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v8 = v47;
  if (v47)
  {
    while (1)
    {
      v9 = v8 + 2;
      Address = 0;
      Address = LibraryDescription::loadAddress((LibraryDescription *)(v8 + 2));
      *(_QWORD *)v54 = LibraryDescription::uuid((LibraryDescription *)(v8 + 2));
      *(_QWORD *)&v54[8] = v10;
      if (!std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(a1 + 28, v54))
      {
        v11 = (__n128 *)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 1675, v54);
        if (v11)
          break;
      }
LABEL_7:
      v8 = (uint64_t *)*v8;
      if (!v8)
        return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v46);
    }
    MergedLibrary::path(v11 + 2, &__s1);
    if (v44)
      goto LABEL_27;
    v41 = 0;
    __s = 0;
    v12 = OSLogLookupPathWithUUID();
    if (__s)
      v13 = v12;
    else
      v13 = 0;
    if (v13 == 1)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)buffer, &__s);
      std::__fs::filesystem::__status((const std::__fs::filesystem::path *)buffer, 0);
      v14 = LOBYTE(__p[0]);
      if ((buffer[23] & 0x80000000) != 0)
        operator delete(*(void **)buffer);
      if (v14 == 2
        && std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v54))
      {
        __p[0] = v54;
        v15 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
        v16 = (char *)(v15 + 4);
        if (*((char *)v15 + 55) < 0)
          v16 = *(char **)v16;
        __s = v16;
      }
      v17 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v17;
      v56 = *((_OWORD *)v8 + 3);
      v18 = strlen(__s);
      *(_QWORD *)&v56 = __s;
      *((_QWORD *)&v56 + 1) = v18;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      if (v44)
        v44 = 0;
      __s1.n128_u64[0] = (unint64_t)__s;
      __s1.n128_u64[1] = strlen(__s);
    }
    else
    {
      if (v44)
        goto LABEL_27;
      if (!std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v54))
      {
        UUID::uuidString((UUID *)v54, (uint64_t)buffer);
        if (buffer[24])
        {
          *(_OWORD *)__p = *(_OWORD *)buffer;
          v40 = *(_QWORD *)&buffer[16];
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
          if (buffer[24] && (buffer[23] & 0x80000000) != 0)
            operator delete(*(void **)buffer);
        }
        ats_symbolication_log_init();
        v36 = ats_symbolication_log;
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        {
          v37 = __p;
          if (v40 < 0)
            v37 = (void **)__p[0];
          *(_DWORD *)buffer = 136315650;
          *(_QWORD *)&buffer[4] = v37;
          *(_WORD *)&buffer[12] = 2048;
          *(_QWORD *)&buffer[14] = Address;
          *(_WORD *)&buffer[22] = 1024;
          *(_DWORD *)&buffer[24] = pid;
          _os_log_impl(&dword_226389000, v36, OS_LOG_TYPE_INFO, "Failed to find path for %s @ 0x%llx (pid=%d)", buffer, 0x1Cu);
        }
LABEL_46:
        std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>((uint64_t)(a1 + 28), v54, v54);
        if (SHIBYTE(v40) < 0)
          operator delete(__p[0]);
        goto LABEL_7;
      }
      v25 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v25;
      v56 = *((_OWORD *)v8 + 3);
      __p[0] = v54;
      v26 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      v29 = (_QWORD *)v26[4];
      v27 = v26 + 4;
      v28 = v29;
      v30 = *((unsigned __int8 *)v27 + 23);
      if ((v30 & 0x80u) != 0)
        v30 = v27[1];
      else
        v28 = v27;
      *(_QWORD *)&v56 = v28;
      *((_QWORD *)&v56 + 1) = v30;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      __p[0] = v54;
      v31 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      v34 = v31[4];
      v32 = v31 + 4;
      v33 = v34;
      v35 = *((unsigned __int8 *)v32 + 23);
      if ((v35 & 0x80u) != 0)
        v35 = v32[1];
      else
        v33 = (unint64_t)v32;
      __s1.n128_u64[0] = v33;
      __s1.n128_u64[1] = v35;
    }
    v44 = 1;
LABEL_27:
    if ((os_variant_has_internal_content() & 1) == 0)
    {
      v19 = __s1.n128_u64[0];
LABEL_33:
      SymbolicationSession::sharedLibraryWithUUIDAndPath((uint64_t)a1, *(uint64_t *)v54, *(uint64_t *)&v54[8], v19, __s1.n128_i64[1], buffer);
      std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(a4, &Address, (__int128 *)buffer);
      v20 = *(std::__shared_weak_count **)&buffer[8];
      if (*(_QWORD *)&buffer[8])
      {
        v21 = (unint64_t *)(*(_QWORD *)&buffer[8] + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      goto LABEL_7;
    }
    if (!v44)
      std::__throw_bad_optional_access[abi:ne180100]();
    v19 = __s1.n128_u64[0];
    if (!deny_nfs_mount_lookup((char *)__s1.n128_u64[0]))
      goto LABEL_33;
    UUID::uuidString((UUID *)v54, (uint64_t)buffer);
    if (buffer[24])
    {
      *(_OWORD *)__p = *(_OWORD *)buffer;
      v40 = *(_QWORD *)&buffer[16];
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
      if (buffer[24] && (buffer[23] & 0x80000000) != 0)
        operator delete(*(void **)buffer);
    }
    ats_symbolication_log_init();
    v23 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      if (!v44)
        std::__throw_bad_optional_access[abi:ne180100]();
      v24 = __p;
      if (v40 < 0)
        v24 = (void **)__p[0];
      *(_DWORD *)buffer = 136315906;
      *(_QWORD *)&buffer[4] = __s1.n128_u64[0];
      *(_WORD *)&buffer[12] = 2080;
      *(_QWORD *)&buffer[14] = v24;
      *(_WORD *)&buffer[22] = 2048;
      *(_QWORD *)&buffer[24] = Address;
      LOWORD(v56) = 1024;
      *(_DWORD *)((char *)&v56 + 2) = pid;
      _os_log_impl(&dword_226389000, v23, OS_LOG_TYPE_INFO, "NFS paths may cause hangs. Denying to process NFS path %s for %s @ 0x%llx (pid=%d)", buffer, 0x26u);
    }
    goto LABEL_46;
  }
  return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v46);
}

void sub_22639A52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,char a44)
{
  if (a44)
  {
    if (a43 < 0)
      operator delete(__p);
  }
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void SymbolicationSession::sharedCacheDescriptionForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  _QWORD *v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;

  Stackshot::sharedCacheDescriptionsForPid(this, a2, &v6);
  v4 = v6;
  if (v6 == v7)
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 40) = 0;
    if (!v4)
      return;
  }
  else
  {
    v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_QWORD *)(a3 + 32) = v4[4];
    *(_BYTE *)(a3 + 40) = 1;
  }
  v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotSharedCacheDescriptionForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  _OWORD *v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;

  Stackshot::aotSharedCacheDescriptionsForPid(this, a2, &v6);
  v4 = v6;
  if (v6 == v7)
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 48) = 0;
    if (!v4)
      return;
  }
  else
  {
    v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_OWORD *)(a3 + 32) = v4[2];
    *(_BYTE *)(a3 + 48) = 1;
  }
  v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotImagesForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t *a3@<X8>)
{
  __int128 *v4;
  __int128 *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 *v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16[3];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  Stackshot::aotImageDescriptionsForPid(this, a2, &v10);
  v4 = v10;
  v5 = v11;
  if (v10 != v11)
  {
    v6 = 0;
    do
    {
      v7 = *v4;
      v8 = v4[1];
      v9 = v4[2];
      v15 = *((_QWORD *)v4 + 6);
      v13 = v8;
      v14 = v9;
      v12 = v7;
      if (v6 >= a3[2])
      {
        v6 = std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(a3, (uint64_t)&v12);
      }
      else
      {
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        v17 = v15;
        AOTImage::AOTImage(v6, v16);
        v6 += 72;
        a3[1] = v6;
      }
      a3[1] = v6;
      v4 = (__int128 *)((char *)v4 + 56);
    }
    while (v4 != v5);
    v4 = v10;
  }
  if (v4)
  {
    v11 = v4;
    operator delete(v4);
  }
}

void sub_22639A7B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectAllLibraryDescriptionsForPid<Stackshot>(Stackshot *this@<X2>, unint64_t *a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  uint64_t *v8;
  Process *v9;
  int v10;

  v10 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_DWORD *)(a4 + 32) = 1065353216;
  if (!a3)
    SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, 0);
  SymbolicationSession::collectProviderLibraryDescriptionsForPid<Stackshot>((SymbolicationSession *)a2, a3, this, a4);
  v8 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a2 + 39, &v10);
  if (!v8 || (v9 = (Process *)v8[3]) == 0 || v10 && !*(_QWORD *)Process::sharedCache(v9))
    SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<Stackshot>((SymbolicationSession *)a2, v10, this, a4);
}

void sub_22639A968(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

BOOL deny_nfs_mount_lookup(char *__s1)
{
  uint64_t v2;

  v2 = 0;
  while (strncmp(__s1, (&off_24EDD5730)[v2], (size_t)(&off_24EDD5730)[v2 + 1]))
  {
    v2 += 2;
    if (v2 == 8)
      return strstr(__s1, "serve-xcode/mount") != 0;
  }
  return 1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void SymbolicationSession::collectProviderLibraryDescriptionsForPid<Stackshot>(SymbolicationSession *a1, int a2, Stackshot *this, uint64_t a4)
{
  LibraryDescription *v6;
  LibraryDescription *v7;
  LibraryDescription *v8;
  LibraryDescription *v9;

  Stackshot::libraryDescriptionsForPid(this, a2, &v8);
  v6 = v8;
  v7 = v9;
  if (v8 != v9)
  {
    do
    {
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v6, v6);
      SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v6);
      v6 = (LibraryDescription *)((char *)v6 + 48);
    }
    while (v6 != v7);
    v6 = v8;
  }
  if (v6)
  {
    v9 = v6;
    operator delete(v6);
  }
}

void sub_22639AB64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<Stackshot>(SymbolicationSession *a1, int a2, Stackshot *a3, uint64_t a4)
{
  SharedCache *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  LibraryDescription *v11;
  LibraryDescription *v12;
  SharedCache *v13;
  std::__shared_weak_count *v14;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  SymbolicationSession::sharedCacheDescriptionForPid<Stackshot>(a3, a2, (uint64_t)v17);
  if (v19)
  {
    v15[0] = v17[0];
    v15[1] = v17[1];
    v16 = v18;
    SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v15, &v13);
    v6 = v13;
    v7 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (v6)
    {
      v10 = SharedCache::libraryDescriptions(v6);
      v11 = *(LibraryDescription **)v10;
      v12 = *(LibraryDescription **)(v10 + 8);
      while (v11 != v12)
      {
        std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v11, v11);
        SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v11);
        v11 = (LibraryDescription *)((char *)v11 + 48);
      }
    }
  }
}

_QWORD *std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = a2[1] ^ *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = a2[1] ^ *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == *a2 && result[3] == a2[1])
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
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v6 = a2[1] ^ *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2[1] ^ *a2;
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
          if (i[2] == *a2 && i[3] == a2[1])
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
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *a3;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
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
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v20)
  {
    *i = *v20;
LABEL_42:
    *v20 = i;
    goto LABEL_43;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v19 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v21 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7)
        v21 %= v7;
    }
    else
    {
      v21 &= v7 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_22639AF54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(uint64_t *a1, uint64_t a2)
{
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22[3];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)*a1;
  v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x8E38E38E38E38E39 * ((a1[2] - (uint64_t)v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x1C71C71C71C71C7)
    v9 = 0x38E38E38E38E38ELL;
  else
    v9 = v5;
  if (v9)
  {
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>(v7, v9);
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = *(_OWORD *)(a2 + 16);
  v22[0] = *(_OWORD *)a2;
  v22[1] = v13;
  v22[2] = *(_OWORD *)(a2 + 32);
  v23 = *(_QWORD *)(a2 + 48);
  v14 = AOTImage::AOTImage((uint64_t)&v10[72 * v4], v22);
  v15 = v14 + 72;
  v17 = (char *)*a1;
  v16 = (char *)a1[1];
  if (v16 != (char *)*a1)
  {
    do
    {
      *(_OWORD *)(v14 - 72) = *(_OWORD *)(v16 - 72);
      v18 = *(_OWORD *)(v16 - 56);
      v19 = *(_OWORD *)(v16 - 40);
      v20 = *(_OWORD *)(v16 - 24);
      *(_QWORD *)(v14 - 8) = *((_QWORD *)v16 - 1);
      *(_OWORD *)(v14 - 24) = v20;
      *(_OWORD *)(v14 - 40) = v19;
      *(_OWORD *)(v14 - 56) = v18;
      v14 -= 72;
      v16 -= 72;
    }
    while (v16 != v17);
    v16 = (char *)*a1;
  }
  *a1 = v14;
  a1[1] = v15;
  a1[2] = (uint64_t)&v10[72 * v12];
  if (v16)
    operator delete(v16);
  return v15;
}

void sub_22639B0F8(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>()
{
  NSObject *v0;

  ats_symbolication_log_init();
  v0 = ats_symbolication_log;
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG))
    std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>(v0);
  return CSSymbolicatorForeachSymbolOwnerAtTime();
}

void ___ZZN20SymbolicationSession36collectLiveLibraryDescriptionsForPidEiRNSt3__113unordered_setI18LibraryDescriptionNS0_4hashIS2_EENS0_8equal_toIS2_EENS0_9allocatorIS2_EEEEENK3__0clEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(_QWORD *)(a1 + 32), a2, a3, &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void std::default_delete<Process>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void **v4;

  if (a2)
  {
    std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](a2 + 128);
    std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](a2 + 112);
    v3 = *(void **)(a2 + 32);
    if (v3)
    {
      *(_QWORD *)(a2 + 40) = v3;
      operator delete(v3);
    }
    v4 = (void **)(a2 + 8);
    std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&v4);
    MEMORY[0x227696F98](a2, 0x10A0C40DD46570ALL);
  }
}

void SymbolicationSession::addNewProcessWithDataProvider<DyldKdebugHandler>(_QWORD *a1, uint64_t a2, DyldKdebugHandler *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 0x80000000) == 0 && !SymbolicationSession::createProcess<DyldKdebugHandler>(a1, a2, a3))
  {
    ats_symbolication_log_init();
    v4 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR))
      SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(a2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void SymbolicationSession::updateProcessWithDataProvider<DyldKdebugHandler>(unint64_t *a1, int a2, DyldKdebugHandler *a3)
{
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *__p;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 *v15[3];
  __int128 *v16;
  __int128 *v17;
  __int128 *v18;

  LODWORD(v16) = a2;
  v6 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)&v16);
  if (v6)
  {
    v7 = v6[3];
    if (v7)
    {
      SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>(a1, a2, a3, (uint64_t *)&v16);
      if (v17 != v16)
      {
        v15[0] = v16;
        v15[1] = v17;
        v15[2] = v18;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        Process::addLibraries(v7, v15);
        v12 = v15;
        std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
      }
      SymbolicationSession::aotImagesForPid<DyldKdebugHandler>(a3, a2, (uint64_t *)&v12);
      v8 = v12;
      if (v13 != v12)
      {
        __p = v12;
        v10 = v13;
        v11 = v14;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        Process::addAOTImages(v7, (char **)&__p);
        if (__p)
        {
          v10 = __p;
          operator delete(__p);
        }
        v8 = v12;
      }
      if (v8)
      {
        v13 = v8;
        operator delete(v8);
      }
      v12 = &v16;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
    }
  }
}

void sub_22639B3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char *a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p)
    operator delete(__p);
  if (a12)
  {
    a13 = a12;
    operator delete(a12);
  }
  a12 = &a18;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcess<DyldKdebugHandler>(_QWORD *a1, uint64_t a2, DyldKdebugHandler *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  __n128 __p;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  int v36;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _OWORD v44[2];
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v36 = a2;
  LODWORD(v40) = a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(a1 + 44), (int *)&v40, &v40);
  SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>(a1, a2, a3, (uint64_t *)&v34);
  v6 = operator new();
  v40 = v34;
  *(_QWORD *)&v41 = v35;
  v35 = 0;
  v34 = 0uLL;
  Process::Process(v6, a2, &v40);
  v33 = v6;
  *(_QWORD *)&v46[0] = &v40;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)v46);
  v32 = v6;
  if (v6)
  {
    std::__hash_table<std::__hash_value_type<int,Process *>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Process *>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Process *>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Process *>>>::__emplace_unique_key_args<int,int &,Process *&>((uint64_t)(a1 + 39), &v36, &v36, &v32);
    v8 = (uint64_t *)a1[37];
    v7 = a1[38];
    if ((unint64_t)v8 >= v7)
    {
      v12 = a1[36];
      v13 = ((uint64_t)v8 - v12) >> 3;
      if ((unint64_t)(v13 + 1) >> 61)
        std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
      v14 = v7 - v12;
      v15 = v14 >> 2;
      if (v14 >> 2 <= (unint64_t)(v13 + 1))
        v15 = v13 + 1;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v16 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v16 = v15;
      *(_QWORD *)&v42 = a1 + 38;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<Process>>>((uint64_t)(a1 + 38), v16);
      else
        v17 = 0;
      v18 = &v17[8 * v13];
      *(_QWORD *)&v40 = v17;
      *((_QWORD *)&v40 + 1) = v18;
      *((_QWORD *)&v41 + 1) = &v17[8 * v16];
      v19 = v33;
      v33 = 0;
      *(_QWORD *)v18 = v19;
      *(_QWORD *)&v41 = v18 + 8;
      std::vector<std::unique_ptr<Process>>::__swap_out_circular_buffer(a1 + 36, &v40);
      v10 = (_QWORD *)a1[37];
      std::__split_buffer<std::unique_ptr<Process>>::~__split_buffer((uint64_t)&v40);
    }
    else
    {
      v9 = v33;
      v33 = 0;
      *v8 = v9;
      v10 = v8 + 1;
      a1[37] = v10;
    }
    a1[37] = v10;
    SymbolicationSession::sharedCacheDescriptionForPid<DyldKdebugHandler>(a3, v36, (uint64_t)v46);
    if (v48)
    {
      v44[0] = v46[0];
      v44[1] = v46[1];
      v45 = v47;
      SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v44, &v40);
      if ((_QWORD)v40)
        Process::setSharedCache(v32, (uint64_t *)&v40);
      v20 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
      if (*((_QWORD *)&v40 + 1))
      {
        v21 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
    SymbolicationSession::aotSharedCacheDescriptionForPid<DyldKdebugHandler>(a3, v36, (uint64_t)&v40);
    if (v43)
    {
      v38[0] = v40;
      v38[1] = v41;
      v38[2] = v42;
      AOTSharedCache::AOTSharedCache((uint64_t)v39, (uint64_t)v38);
      v37[0] = v39[0];
      v37[1] = v39[1];
      v37[2] = v39[2];
      Process::setAOTSharedCache(v32, (uint64_t)v37);
      v30 = 0;
      v31 = 0;
      SymbolicationSession::aotImagesForPid<DyldKdebugHandler>(a3, v36, (uint64_t *)&v28);
      v23 = (void *)v28.n128_u64[0];
      if (v28.n128_u64[0] != v28.n128_u64[1])
      {
        __p = v28;
        v27 = v29;
        v28 = 0uLL;
        v29 = 0;
        Process::setAOTImages(v32, &__p);
        if (__p.n128_u64[0])
        {
          __p.n128_u64[1] = __p.n128_u64[0];
          operator delete((void *)__p.n128_u64[0]);
        }
        v23 = (void *)v28.n128_u64[0];
      }
      if (v23)
      {
        v28.n128_u64[1] = (unint64_t)v23;
        operator delete(v23);
      }
    }
    v11 = v32;
    v24 = v33;
    v33 = 0;
    if (v24)
      std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&v33, v24);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)&v40 = &v34;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
  return v11;
}

void sub_22639B78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v19;
  uint64_t v21;

  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  v21 = a18;
  a18 = 0;
  if (v21)
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a18, v21);
  *(_QWORD *)(v19 - 104) = &a19;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v19 - 104));
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>@<X0>(unint64_t *a1@<X0>, int a2@<W1>, DyldKdebugHandler *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t *v8;
  _OWORD *v9;
  uint64_t v10;
  __n128 *v11;
  int v12;
  int v13;
  int v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  size_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  void **v24;
  __int128 v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  void **v37;
  void *__p[2];
  uint64_t v40;
  uint64_t v41;
  char *__s;
  __n128 __s1;
  char v44;
  uint64_t Address;
  _BYTE v46[16];
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  std::string *(*v50)(uint64_t);
  void *v51;
  unint64_t *v52;
  int pid;
  UUID v54;
  _BYTE buffer[32];
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  pid = a2;
  v7 = (uint64_t)(a1 + 18);
  if (!std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 18, &pid))
  {
    if (proc_pidpath(pid, buffer, 0x400u) >= 1)
    {
      v48 = MEMORY[0x24BDAC760];
      v49 = 0x40000000;
      v50 = ___ZN20SymbolicationSession28createProcessLibrariesForPidI17DyldKdebugHandlerEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke;
      v51 = &__block_descriptor_tmp_57;
      v52 = a1;
      CSSymbolicatorForeachSymbolicatorWithPath();
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(v7, &pid, &pid);
  }
  SymbolicationSession::collectAllLibraryDescriptionsForPid<DyldKdebugHandler>(a3, a1, pid, (uint64_t)v46);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v8 = v47;
  if (v47)
  {
    while (1)
    {
      v9 = v8 + 2;
      Address = 0;
      Address = LibraryDescription::loadAddress((LibraryDescription *)(v8 + 2));
      *(_QWORD *)v54 = LibraryDescription::uuid((LibraryDescription *)(v8 + 2));
      *(_QWORD *)&v54[8] = v10;
      if (!std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(a1 + 28, v54))
      {
        v11 = (__n128 *)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 1675, v54);
        if (v11)
          break;
      }
LABEL_7:
      v8 = (uint64_t *)*v8;
      if (!v8)
        return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v46);
    }
    MergedLibrary::path(v11 + 2, &__s1);
    if (v44)
      goto LABEL_27;
    v41 = 0;
    __s = 0;
    v12 = OSLogLookupPathWithUUID();
    if (__s)
      v13 = v12;
    else
      v13 = 0;
    if (v13 == 1)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)buffer, &__s);
      std::__fs::filesystem::__status((const std::__fs::filesystem::path *)buffer, 0);
      v14 = LOBYTE(__p[0]);
      if ((buffer[23] & 0x80000000) != 0)
        operator delete(*(void **)buffer);
      if (v14 == 2
        && std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v54))
      {
        __p[0] = v54;
        v15 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
        v16 = (char *)(v15 + 4);
        if (*((char *)v15 + 55) < 0)
          v16 = *(char **)v16;
        __s = v16;
      }
      v17 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v17;
      v56 = *((_OWORD *)v8 + 3);
      v18 = strlen(__s);
      *(_QWORD *)&v56 = __s;
      *((_QWORD *)&v56 + 1) = v18;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      if (v44)
        v44 = 0;
      __s1.n128_u64[0] = (unint64_t)__s;
      __s1.n128_u64[1] = strlen(__s);
    }
    else
    {
      if (v44)
        goto LABEL_27;
      if (!std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v54))
      {
        UUID::uuidString((UUID *)v54, (uint64_t)buffer);
        if (buffer[24])
        {
          *(_OWORD *)__p = *(_OWORD *)buffer;
          v40 = *(_QWORD *)&buffer[16];
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
          if (buffer[24] && (buffer[23] & 0x80000000) != 0)
            operator delete(*(void **)buffer);
        }
        ats_symbolication_log_init();
        v36 = ats_symbolication_log;
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        {
          v37 = __p;
          if (v40 < 0)
            v37 = (void **)__p[0];
          *(_DWORD *)buffer = 136315650;
          *(_QWORD *)&buffer[4] = v37;
          *(_WORD *)&buffer[12] = 2048;
          *(_QWORD *)&buffer[14] = Address;
          *(_WORD *)&buffer[22] = 1024;
          *(_DWORD *)&buffer[24] = pid;
          _os_log_impl(&dword_226389000, v36, OS_LOG_TYPE_INFO, "Failed to find path for %s @ 0x%llx (pid=%d)", buffer, 0x1Cu);
        }
LABEL_46:
        std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>((uint64_t)(a1 + 28), v54, v54);
        if (SHIBYTE(v40) < 0)
          operator delete(__p[0]);
        goto LABEL_7;
      }
      v25 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v25;
      v56 = *((_OWORD *)v8 + 3);
      __p[0] = v54;
      v26 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      v29 = (_QWORD *)v26[4];
      v27 = v26 + 4;
      v28 = v29;
      v30 = *((unsigned __int8 *)v27 + 23);
      if ((v30 & 0x80u) != 0)
        v30 = v27[1];
      else
        v28 = v27;
      *(_QWORD *)&v56 = v28;
      *((_QWORD *)&v56 + 1) = v30;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      __p[0] = v54;
      v31 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v54, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      v34 = v31[4];
      v32 = v31 + 4;
      v33 = v34;
      v35 = *((unsigned __int8 *)v32 + 23);
      if ((v35 & 0x80u) != 0)
        v35 = v32[1];
      else
        v33 = (unint64_t)v32;
      __s1.n128_u64[0] = v33;
      __s1.n128_u64[1] = v35;
    }
    v44 = 1;
LABEL_27:
    if ((os_variant_has_internal_content() & 1) == 0)
    {
      v19 = __s1.n128_u64[0];
LABEL_33:
      SymbolicationSession::sharedLibraryWithUUIDAndPath((uint64_t)a1, *(uint64_t *)v54, *(uint64_t *)&v54[8], v19, __s1.n128_i64[1], buffer);
      std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(a4, &Address, (__int128 *)buffer);
      v20 = *(std::__shared_weak_count **)&buffer[8];
      if (*(_QWORD *)&buffer[8])
      {
        v21 = (unint64_t *)(*(_QWORD *)&buffer[8] + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      goto LABEL_7;
    }
    if (!v44)
      std::__throw_bad_optional_access[abi:ne180100]();
    v19 = __s1.n128_u64[0];
    if (!deny_nfs_mount_lookup((char *)__s1.n128_u64[0]))
      goto LABEL_33;
    UUID::uuidString((UUID *)v54, (uint64_t)buffer);
    if (buffer[24])
    {
      *(_OWORD *)__p = *(_OWORD *)buffer;
      v40 = *(_QWORD *)&buffer[16];
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
      if (buffer[24] && (buffer[23] & 0x80000000) != 0)
        operator delete(*(void **)buffer);
    }
    ats_symbolication_log_init();
    v23 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      if (!v44)
        std::__throw_bad_optional_access[abi:ne180100]();
      v24 = __p;
      if (v40 < 0)
        v24 = (void **)__p[0];
      *(_DWORD *)buffer = 136315906;
      *(_QWORD *)&buffer[4] = __s1.n128_u64[0];
      *(_WORD *)&buffer[12] = 2080;
      *(_QWORD *)&buffer[14] = v24;
      *(_WORD *)&buffer[22] = 2048;
      *(_QWORD *)&buffer[24] = Address;
      LOWORD(v56) = 1024;
      *(_DWORD *)((char *)&v56 + 2) = pid;
      _os_log_impl(&dword_226389000, v23, OS_LOG_TYPE_INFO, "NFS paths may cause hangs. Denying to process NFS path %s for %s @ 0x%llx (pid=%d)", buffer, 0x26u);
    }
    goto LABEL_46;
  }
  return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v46);
}

void sub_22639BE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,char a44)
{
  if (a44)
  {
    if (a43 < 0)
      operator delete(__p);
  }
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void SymbolicationSession::sharedCacheDescriptionForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  _QWORD *v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;

  DyldKdebugHandler::sharedCacheDescriptionsForPid(this, a2, &v6);
  v4 = v6;
  if (v6 == v7)
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 40) = 0;
    if (!v4)
      return;
  }
  else
  {
    v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_QWORD *)(a3 + 32) = v4[4];
    *(_BYTE *)(a3 + 40) = 1;
  }
  v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotSharedCacheDescriptionForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  _OWORD *v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;

  DyldKdebugHandler::aotSharedCacheDescriptionsForPid(this, a2, &v6);
  v4 = v6;
  if (v6 == v7)
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 48) = 0;
    if (!v4)
      return;
  }
  else
  {
    v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_OWORD *)(a3 + 32) = v4[2];
    *(_BYTE *)(a3 + 48) = 1;
  }
  v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotImagesForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t *a3@<X8>)
{
  __int128 *v4;
  __int128 *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 *v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16[3];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  DyldKdebugHandler::aotImageDescriptionsForPid((uint64_t *)this, a2, &v10);
  v4 = v10;
  v5 = v11;
  if (v10 != v11)
  {
    v6 = 0;
    do
    {
      v7 = *v4;
      v8 = v4[1];
      v9 = v4[2];
      v15 = *((_QWORD *)v4 + 6);
      v13 = v8;
      v14 = v9;
      v12 = v7;
      if (v6 >= a3[2])
      {
        v6 = std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(a3, (uint64_t)&v12);
      }
      else
      {
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        v17 = v15;
        AOTImage::AOTImage(v6, v16);
        v6 += 72;
        a3[1] = v6;
      }
      a3[1] = v6;
      v4 = (__int128 *)((char *)v4 + 56);
    }
    while (v4 != v5);
    v4 = v10;
  }
  if (v4)
  {
    v11 = v4;
    operator delete(v4);
  }
}

void sub_22639C0F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectAllLibraryDescriptionsForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, unint64_t *a2@<X0>, unsigned int a3@<W1>, uint64_t a4@<X8>)
{
  uint64_t *v8;
  Process *v9;
  unsigned int v10;

  v10 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_DWORD *)(a4 + 32) = 1065353216;
  if (!a3)
    SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, 0);
  SymbolicationSession::collectProviderLibraryDescriptionsForPid<DyldKdebugHandler>((SymbolicationSession *)a2, a3, this, a4);
  v8 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a2 + 39, (int *)&v10);
  if (!v8 || (v9 = (Process *)v8[3]) == 0 || v10 && !*(_QWORD *)Process::sharedCache(v9))
    SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<DyldKdebugHandler>((SymbolicationSession *)a2, v10, this, a4);
}

void sub_22639C2A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void SymbolicationSession::collectProviderLibraryDescriptionsForPid<DyldKdebugHandler>(SymbolicationSession *a1, unsigned int a2, DyldKdebugHandler *this, uint64_t a4)
{
  LibraryDescription *v6;
  LibraryDescription *v7;
  LibraryDescription *v8;
  LibraryDescription *v9;

  DyldKdebugHandler::libraryDescriptionsForPid(this, a2, &v8);
  v6 = v8;
  v7 = v9;
  if (v8 != v9)
  {
    do
    {
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v6, v6);
      SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v6);
      v6 = (LibraryDescription *)((char *)v6 + 64);
    }
    while (v6 != v7);
    v6 = v8;
  }
  if (v6)
  {
    v9 = v6;
    operator delete(v6);
  }
}

void sub_22639C344(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<DyldKdebugHandler>(SymbolicationSession *a1, int a2, DyldKdebugHandler *a3, uint64_t a4)
{
  SharedCache *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  LibraryDescription *v11;
  LibraryDescription *v12;
  SharedCache *v13;
  std::__shared_weak_count *v14;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  SymbolicationSession::sharedCacheDescriptionForPid<DyldKdebugHandler>(a3, a2, (uint64_t)v17);
  if (v19)
  {
    v15[0] = v17[0];
    v15[1] = v17[1];
    v16 = v18;
    SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v15, &v13);
    v6 = v13;
    v7 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (v6)
    {
      v10 = SharedCache::libraryDescriptions(v6);
      v11 = *(LibraryDescription **)v10;
      v12 = *(LibraryDescription **)(v10 + 8);
      while (v11 != v12)
      {
        std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v11, v11);
        SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v11);
        v11 = (LibraryDescription *)((char *)v11 + 48);
      }
    }
  }
}

const void **ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x227696F98);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = a2[1] ^ *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
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
          if (i[2] == *a2 && i[3] == a2[1])
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
  v14 = (_QWORD *)(a1 + 16);
  i = operator new(0x38uLL);
  *i = 0;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[5] = 0;
  i[6] = 0;
  i[4] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
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
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_42:
    *v22 = i;
    goto LABEL_43;
  }
  *i = *v14;
  *v14 = i;
  *(_QWORD *)(v21 + 8 * v4) = v14;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8)
        v23 %= v8;
    }
    else
    {
      v23 &= v8 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_22639C730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID const&,std::string_view>(uint64_t a1, _QWORD *a2, _OWORD *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;

  v6 = a2[1] ^ *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == *a2 && result[3] == a2[1])
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID const&,std::string_view>(a1, a2[1] ^ *a2, a3, a4, (uint64_t)&v21);
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v19)
  {
    *v21 = *v19;
    *v19 = v21;
  }
  else
  {
    *v21 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v21;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v21)
    {
      v20 = *(_QWORD *)(*v21 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v20 >= v7)
          v20 %= v7;
      }
      else
      {
        v20 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v20) = v21;
    }
  }
  result = v21;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_22639C9B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID const&,std::string_view>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;

  v9 = a1 + 16;
  v10 = operator new(0x38uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  result = std::pair<UUID const,std::string>::pair[abi:ne180100]<UUID const&,std::string_view,0>((uint64_t)(v10 + 2), a3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_22639CA54(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::pair<UUID const,std::string>::pair[abi:ne180100]<UUID const&,std::string_view,0>(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  void *v3;
  size_t v4;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *a2;
  v3 = (void *)(a1 + 16);
  v4 = *(_QWORD *)(a3 + 8);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = *(const void **)a3;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v3 = operator new(v7 + 1);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v8 | 0x8000000000000000;
    *(_QWORD *)(a1 + 16) = v3;
  }
  else
  {
    *(_BYTE *)(a1 + 39) = v4;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v3, v6, v4);
LABEL_9:
  *((_BYTE *)v3 + v4) = 0;
  return a1;
}

uint64_t *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__erase_unique<UUID>(_QWORD *a1, _QWORD *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void **v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = (void **)__p;
  __p = 0;
  if (v3)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&v6, v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(uint64_t a1, _QWORD *a2, _OWORD *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;

  v6 = a2[1] ^ *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == *a2 && result[3] == a2[1])
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID&,std::string&>(a1, a2[1] ^ *a2, a3, a4, (uint64_t)&v21);
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v19)
  {
    *v21 = *v19;
    *v19 = v21;
  }
  else
  {
    *v21 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v21;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v21)
    {
      v20 = *(_QWORD *)(*v21 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v20 >= v7)
          v20 %= v7;
      }
      else
      {
        v20 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v20) = v21;
    }
  }
  result = v21;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_22639CEEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID&,std::string&>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  std::string *v11;

  v9 = a1 + 16;
  v10 = (char *)operator new(0x38uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = a2;
  *((_OWORD *)v10 + 1) = *a3;
  v11 = (std::string *)(v10 + 32);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v11->__r_.__value_.__r.__words[2] = *(_QWORD *)(a4 + 16);
  }
  *(_BYTE *)(a5 + 16) = 1;
}

void sub_22639CFAC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  char *v3;
  char *v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_22639D008(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0xB8uLL);
  result = std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_22639D070(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  a1[2] = 0;
  *a1 = &unk_24EDD5680;
  a1[1] = 0;
  SharedCache::SharedCache(a1 + 3, *a2, a2[1], a3);
  return a1;
}

void sub_22639D0C8(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>&>(uint64_t a1, SharedCacheDescription *this, uint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  float v23;
  float v24;
  _BOOL8 v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD v32[2];
  char v33;

  v9 = SharedCacheDescription::hash(this);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = (_QWORD *)*v14;
      if (*v14)
      {
        do
        {
          v16 = v15[1];
          if (v16 == v10)
          {
            if (SharedCacheDescription::operator==(v15 + 2, this))
              return v15;
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11)
                v16 %= v11;
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4)
              break;
          }
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
    }
  }
  v17 = operator new(0x48uLL);
  v32[0] = v17;
  v32[1] = a1 + 16;
  *v17 = 0;
  v17[1] = v10;
  v18 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v17 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v17 + 2) = v18;
  v20 = *a4;
  v19 = a4[1];
  v17[6] = *(_QWORD *)(a3 + 32);
  v17[7] = v20;
  v17[8] = v19;
  if (v19)
  {
    v21 = (unint64_t *)(v19 + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v33 = 1;
  v23 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v24 = *(float *)(a1 + 32);
  if (!v11 || (float)(v24 * (float)v11) < v23)
  {
    v25 = 1;
    if (v11 >= 3)
      v25 = (v11 & (v11 - 1)) != 0;
    v26 = v25 | (2 * v11);
    v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27)
      v28 = v27;
    else
      v28 = v26;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v28);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v29)
  {
    *(_QWORD *)v32[0] = *v29;
    *v29 = v32[0];
  }
  else
  {
    *(_QWORD *)v32[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v32[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v32[0])
    {
      v30 = *(_QWORD *)(*(_QWORD *)v32[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v30 >= v11)
          v30 %= v11;
      }
      else
      {
        v30 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v30) = v32[0];
    }
  }
  v15 = (_QWORD *)v32[0];
  v32[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>>::reset[abi:ne180100]((uint64_t)v32, 0);
  return v15;
}

void sub_22639D364(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,Process *>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Process *>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Process *>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Process *>>>::__emplace_unique_key_args<int,int &,Process *&>(uint64_t a1, int *a2, _DWORD *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  _QWORD *v12;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v9 <= v8)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v12 = operator new(0x20uLL);
  *v12 = 0;
  v12[1] = v8;
  *((_DWORD *)v12 + 4) = *a3;
  v12[3] = *a4;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v12 = *v21;
LABEL_38:
    *v21 = v12;
    goto LABEL_39;
  }
  *v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    v22 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_22639D594(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = a2[1] ^ *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v7 >= v8)
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
            if (v11[2] == *a2 && v11[3] == a2[1])
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
  v11 = operator new(0x28uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_OWORD *)v11 + 1) = **a4;
  *((_BYTE *)v11 + 32) = 0;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
    *v11 = *v21;
LABEL_42:
    *v21 = v11;
    goto LABEL_43;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v20 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
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
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_22639D7C4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,UUID&,BOOL>(uint64_t a1, _QWORD *a2, _OWORD *a3, _BYTE *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  _QWORD *v12;
  unint64_t v13;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v8 = a2[1] ^ *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = a2[1] ^ *a2;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2 && v12[3] == a2[1])
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v12 = operator new(0x28uLL);
  *v12 = 0;
  v12[1] = v8;
  *((_OWORD *)v12 + 1) = *a3;
  *((_BYTE *)v12 + 32) = *a4;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *v12 = *v22;
LABEL_42:
    *v22 = v12;
    goto LABEL_43;
  }
  *v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    v23 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_22639D9FC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::~__func()
{
  JUMPOUT(0x227696F98);
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24EDD5800;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24EDD5800;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::operator()(uint64_t result, CFDataRef *a2)
{
  const __CFData *v2;
  uint64_t v3;

  v2 = *a2;
  if (*a2)
  {
    v3 = result;
    CFDataGetBytePtr(*a2);
    CFDataGetLength(v2);
    result = ktrace_file_append_chunk();
    ++**(_DWORD **)(v3 + 16);
  }
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::target_type()
{
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

void std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::~__func()
{
  JUMPOUT(0x227696F98);
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24EDD5890;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24EDD5890;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::operator()(uint64_t result, CFDataRef *a2)
{
  const __CFData *v2;
  uint64_t v3;

  v2 = *a2;
  if (*a2)
  {
    v3 = result;
    CFDataGetBytePtr(*a2);
    CFDataGetLength(v2);
    result = ktrace_file_append_chunk();
    ++**(_DWORD **)(v3 + 16);
  }
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::target_type()
{
}

void std::__shared_ptr_emplace<StringPool>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5910;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<StringPool>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5910;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x227696F98);
}

uint64_t std::__shared_ptr_emplace<StringPool>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(a1 + 24);
}

uint64_t std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 7));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 4));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 8));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 55) < 0)
        operator delete(v2[4]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t Section::name(Section *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t Section::contents(Section *this)
{
  return *((_QWORD *)this + 4);
}

size_t Section::initializeWithCSSection(uint64_t *a1)
{
  uint64_t v2;
  uint64_t Name;
  const char *v4;
  size_t result;

  *a1 = CSRegionGetRange();
  a1[1] = v2;
  Name = CSRegionGetName();
  if (Name)
    v4 = (const char *)Name;
  else
    v4 = (const char *)&unk_2263A5A02;
  result = strlen(v4);
  a1[2] = (uint64_t)v4;
  a1[3] = result;
  return result;
}

uint64_t Section::debug(Section *this)
{
  const char *v2;

  printf("\tSection @ 0x%llx - 0x%llx: ", *(_QWORD *)this, *((_QWORD *)this + 1) + *(_QWORD *)this);
  if (*((_QWORD *)this + 3))
    v2 = (const char *)*((_QWORD *)this + 2);
  else
    v2 = "<null>";
  return puts(v2);
}

uint64_t Section::Section(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  Section::initializeWithCSSection((uint64_t *)a1);
  return a1;
}

{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  Section::initializeWithCSSection((uint64_t *)a1);
  return a1;
}

__n128 DyldKdebugAOTSharedCacheDescription::consumeTracepointA(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[2].n128_u64[0] = a2->n128_u64[1];
  result = a2[1];
  *a1 = result;
  return result;
}

__n128 DyldKdebugAOTSharedCacheDescription::consumeTracepointB(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[2].n128_u64[1] = a2->n128_u64[1];
  result = a2[1];
  a1[1] = result;
  return result;
}

void AOTSharedCacheDescription::AOTSharedCacheDescription(AOTSharedCacheDescription *this)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

void AOTSharedCacheDescription::AOTSharedCacheDescription(AOTSharedCacheDescription *this, UUID a2, UUID a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  *((_QWORD *)this + 3) = a5;
  *((_QWORD *)this + 4) = a6;
  *((_QWORD *)this + 5) = a7;
}

{
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  *((_QWORD *)this + 3) = a5;
  *((_QWORD *)this + 4) = a6;
  *((_QWORD *)this + 5) = a7;
}

uint64_t AOTSharedCacheDescription::x86Uuid(AOTSharedCacheDescription *this)
{
  return *(_QWORD *)this;
}

uint64_t AOTSharedCacheDescription::aotUuid(AOTSharedCacheDescription *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t AOTSharedCacheDescription::x86LoadAddress(AOTSharedCacheDescription *this)
{
  return *((_QWORD *)this + 4);
}

uint64_t AOTSharedCacheDescription::aotLoadAddress(AOTSharedCacheDescription *this)
{
  return *((_QWORD *)this + 5);
}

uint64_t AOTSharedCacheDescription::hash(AOTSharedCacheDescription *this)
{
  return *((_QWORD *)this + 3) ^ *((_QWORD *)this + 2) ^ *((_QWORD *)this + 4);
}

BOOL AOTSharedCacheDescription::operator==(_QWORD *a1, _QWORD *a2)
{
  return a1[2] == a2[2] && a1[3] == a2[3] && a1[5] == a2[5];
}

void SharedLibrary::SharedLibrary(SharedLibrary *this)
{
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  __n128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char *v9;
  std::__shared_weak_count *v10;

  *((_BYTE *)this + 80) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  v2 = (char *)operator new(0x40uLL);
  *((_QWORD *)v2 + 1) = 0;
  v3 = (unint64_t *)(v2 + 8);
  *((_QWORD *)v2 + 2) = 0;
  *(_QWORD *)v2 = &unk_24EDD5910;
  *((_QWORD *)v2 + 7) = 0;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 14) = 1065353216;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((_QWORD *)this + 11) = v2 + 24;
  *((_QWORD *)this + 12) = v2;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_DWORD *)this + 34) = 1065353216;
  v9 = v2 + 24;
  v10 = (std::__shared_weak_count *)v2;
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 + 1, v3));
  v5.n128_f64[0] = SharedLibraryMetadata::SharedLibraryMetadata((uint64_t)this + 144, (uint64_t)&v9);
  v6 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v6->__on_zero_shared)(v6, v5);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_22639E280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void **a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v14);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v13);
  a12 = (void **)(v12 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SharedLibrary::initializeWithCSSymbolOwner(SharedLibrary *this)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  _BYTE *v18;
  unint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(uint64_t, uint64_t);
  uint64_t (*v33)();
  char v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  __n128 (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)();
  char v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  __n128 (*v46)(uint64_t, uint64_t);
  uint64_t (*v47)();
  char v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 12);
  *(_QWORD *)&v50 = *((_QWORD *)this + 11);
  *((_QWORD *)&v50 + 1) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  SharedLibraryMetadata::SharedLibraryMetadata((uint64_t)&v51, &v50);
  std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)this + 144, &v51);
  v5 = v53;
  *((_OWORD *)this + 10) = v52;
  *((_OWORD *)this + 11) = v5;
  v6 = v55;
  *((_OWORD *)this + 12) = v54;
  *((_OWORD *)this + 13) = v6;
  v7 = v57;
  *((_OWORD *)this + 14) = v56;
  *((_OWORD *)this + 15) = v7;
  *((_OWORD *)this + 16) = v58;
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  if (*((_QWORD *)&v51 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  CSSymbolOwnerGetSymbolicator();
  CSSymbolicatorIsKernelSymbolicator();
  *(_QWORD *)&v51 = 0;
  *((_QWORD *)&v51 + 1) = &v51;
  *(_QWORD *)&v52 = 0x4002000000;
  *((_QWORD *)&v52 + 1) = __Block_byref_object_copy__0;
  *(_QWORD *)&v53 = __Block_byref_object_dispose__0;
  BYTE8(v53) = 0;
  BYTE8(v54) = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x4002000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v49 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x4002000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v42 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x4002000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v35 = 0;
  CSSymbolOwnerForeachSegment();
  v14 = *((_QWORD *)&v51 + 1);
  if (*(_BYTE *)(*((_QWORD *)&v51 + 1) + 56))
  {
    v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 40);
    v16 = v44;
    v17 = v44 + 5;
    v18 = v44 + 7;
    if (!*((_BYTE *)v44 + 56))
      goto LABEL_22;
LABEL_19:
    v19 = v16[5];
LABEL_23:
    v20 = v37;
    if (*((_BYTE *)v37 + 56))
      v21 = v37[5];
    else
      v21 = -1;
    if (v19 < v15)
      v15 = v19;
    if (v21 < v15)
      v15 = v21;
    *((_QWORD *)this + 9) = v15;
    *((_BYTE *)this + 80) = 1;
    if (*(_BYTE *)(v14 + 56))
      v22 = *(_QWORD *)(v14 + 48) + *(_QWORD *)(v14 + 40);
    else
      v22 = 0;
    if (*v18)
      v23 = v16[6] + *v17;
    else
      v23 = 0;
    if (*((_BYTE *)v20 + 56))
      v24 = v20[6] + v20[5];
    else
      v24 = 0;
    if (v22 > v23)
      v23 = v22;
    if (v23 <= v24)
      v23 = v24;
    goto LABEL_43;
  }
  v16 = v44;
  v18 = v44 + 7;
  if (*((_BYTE *)v44 + 56))
  {
    v17 = v44 + 5;
    v15 = -1;
    goto LABEL_19;
  }
  if (*((_BYTE *)v37 + 56))
  {
    v17 = v44 + 5;
    v15 = -1;
LABEL_22:
    v19 = -1;
    goto LABEL_23;
  }
  v28 = v30;
  if (*((_BYTE *)v30 + 56))
  {
    *((_QWORD *)this + 9) = v30[5];
    *((_BYTE *)this + 80) = 1;
    v23 = v28[6] + v28[5];
  }
  else
  {
    if (!*((_BYTE *)this + 80))
      goto LABEL_44;
    v23 = 0;
  }
LABEL_43:
  v25 = *((_QWORD *)this + 9);
  v26 = v23 >= v25;
  v27 = v23 - v25;
  if (!v26)
  {
LABEL_44:
    v27 = 0;
    v25 = -1;
  }
  *(_QWORD *)this = v25;
  *((_QWORD *)this + 1) = v27;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v51, 8);
}

void sub_22639E634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN13SharedLibrary27initializeWithCSSymbolOwnerEv_block_invoke(uint64_t a1)
{
  uint64_t Range;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  const char *Name;
  _BOOL4 v8;
  const char *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;

  Range = CSRegionGetRange();
  v4 = v3;
  result = CSRegionGetName();
  if (result)
  {
    result = strncmp((const char *)result, "__TEXT", 6uLL);
    if (!(_DWORD)result)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_QWORD *)(v6 + 40) = Range;
      *(_QWORD *)(v6 + 48) = v4;
      *(_BYTE *)(v6 + 56) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 64))
  {
    Name = (const char *)CSRegionGetName();
    if (Name)
      v8 = strncmp(Name, "__TEXT_EXEC", 0xBuLL) == 0;
    else
      v8 = 0;
    v9 = (const char *)CSRegionGetName();
    if (v9)
      v10 = strncmp(v9, "__PPLTEXT", 9uLL) == 0;
    else
      v10 = 0;
    result = CSRegionGetName();
    if (result)
    {
      result = strncmp((const char *)result, "__PPLTRAMP", 0xAuLL);
      v11 = result == 0;
      if (v8)
      {
LABEL_13:
        v12 = *(_QWORD *)(a1 + 40);
LABEL_19:
        v13 = *(_QWORD *)(v12 + 8);
        *(_QWORD *)(v13 + 40) = Range;
        *(_QWORD *)(v13 + 48) = v4;
        *(_BYTE *)(v13 + 56) = 1;
        return result;
      }
    }
    else
    {
      v11 = 0;
      if (v8)
        goto LABEL_13;
    }
    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      if (!v11)
        return result;
      v12 = *(_QWORD *)(a1 + 56);
    }
    goto LABEL_19;
  }
  return result;
}

uint64_t SharedLibrary::csSymbolOwner(SharedLibrary *this)
{
  return *((_QWORD *)this + 7);
}

uint64_t SharedLibrary::SharedLibrary(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  CSSymbolOwnerGetSymbolicator();
  *(_QWORD *)(a1 + 40) = CSRetain();
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 72) = 0;
  v9 = a4[1];
  *(_QWORD *)(a1 + 88) = *a4;
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = a3;
  *(_BYTE *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 96) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_BYTE *)(a1 + 216) = 0;
  *(_BYTE *)(a1 + 220) = 0;
  *(_BYTE *)(a1 + 228) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_BYTE *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  if ((CSIsNull() & 1) == 0)
    SharedLibrary::initializeWithCSSymbolOwner((SharedLibrary *)a1);
  return a1;
}

void sub_22639E8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v13);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v11);
  a10 = (void **)(v10 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t SharedLibrary::SharedLibrary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unsigned __int8 uu[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu = a2;
  *(_QWORD *)&uu[8] = a3;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 57) = 0u;
  *(_QWORD *)(a1 + 88) = *a6;
  *(_BYTE *)(a1 + 80) = 0;
  v7 = a6[1];
  *(_QWORD *)(a1 + 96) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  *(_OWORD *)(a1 + 104) = 0uLL;
  *(_OWORD *)(a1 + 120) = 0uLL;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(_OWORD *)(a1 + 144) = 0uLL;
  *(_BYTE *)(a1 + 216) = 0;
  *(_BYTE *)(a1 + 220) = 0;
  *(_BYTE *)(a1 + 228) = 0;
  *(_OWORD *)(a1 + 160) = 0uLL;
  *(_OWORD *)(a1 + 176) = 0uLL;
  *(_OWORD *)(a1 + 192) = 0uLL;
  *(_BYTE *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 240) = 0uLL;
  *(_OWORD *)(a1 + 256) = 0uLL;
  if (!uuid_is_null(uu))
  {
    CSSymbolicatorForeachSymbolicatorWithPath();
    if ((CSIsNull() & 1) == 0)
      SharedLibrary::initializeWithCSSymbolOwner((SharedLibrary *)a1);
  }
  return a1;
}

void sub_22639EA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v13);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v11);
  a10 = (void **)(v10 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13SharedLibraryC2E4UUIDNSt3__117basic_string_viewIcNS1_11char_traitsIcEEEERKNS1_10shared_ptrI10StringPoolEE_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t SymbolOwner;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (_QWORD *)a1[4];
  result = CSIsNull();
  if ((_DWORD)result)
  {
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
    v6 = v5;
    result = CSIsNull();
    if ((result & 1) == 0)
    {
      result = CSSymbolOwnerGetCFUUIDBytes();
      if (result)
      {
        if (*(_QWORD *)result == a1[5] && *(_QWORD *)(result + 8) == a1[6])
        {
          result = CSRetain();
          v2[5] = result;
          v2[6] = v8;
          v2[7] = SymbolOwner;
          v2[8] = v6;
        }
      }
    }
  }
  return result;
}

uint64_t SharedLibrary::hash(SharedLibrary *this)
{
  uint64_t v1;
  uint64_t v2;

  v1 = SharedLibraryMetadata::uuid((SharedLibrary *)((char *)this + 144));
  return v2 ^ v1;
}

BOOL SharedLibrary::operator==(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v8;
  uint64_t v9;

  v8 = SharedLibraryMetadata::uuid((SharedLibraryMetadata *)(a1 + 18));
  v9 = v4;
  v6 = v8 == SharedLibraryMetadata::uuid((SharedLibraryMetadata *)(a2 + 18)) && v9 == v5;
  return v6 && *a1 == *a2 && a1[1] == a2[1];
}

uint64_t SharedLibrary::architecture(SharedLibrary *this)
{
  return SharedLibraryMetadata::architecture((SharedLibrary *)((char *)this + 144));
}

uint64_t SharedLibrary::path@<X0>(SharedLibrary *this@<X0>, uint64_t a2@<X8>)
{
  return SharedLibraryMetadata::path((uint64_t)this + 144, a2);
}

uint64_t SharedLibrary::generateFBSSignature(SharedLibrary *this)
{
  return SharedLibrary::generateFBSSignatureWithConfig((uint64_t)this, 0);
}

uint64_t SharedLibrary::generateFBSSignatureWithConfig(uint64_t a1, int a2)
{
  uint64_t SparseSignatureWithFlags;
  _QWORD *i;
  _QWORD *j;
  uint64_t *v7;
  uint64_t SymbolWithAddress;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(_QWORD *, uint64_t);
  void (*v28)(uint64_t);
  void *__p;
  void *v30;
  uint64_t v31;

  if ((CSIsNull() & 1) != 0 || a2 != 2 && !*(_QWORD *)(a1 + 128))
    return 0;
  CSAddressSetCreate();
  for (i = *(_QWORD **)(a1 + 120); i; i = (_QWORD *)*i)
  {
    CSSymbolOwnerGetSymbolWithAddress();
    if ((CSIsNull() & 1) == 0)
    {
      CSSymbolGetRange();
      CSAddressSetAddRange();
    }
  }
  SparseSignatureWithFlags = CSSymbolOwnerCreateSparseSignatureWithFlags();
  CSRelease();
  if (!SparseSignatureWithFlags)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x4002000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__3;
    v30 = 0;
    v31 = 0;
    __p = 0;
    std::vector<_CSTypeRef>::reserve(&__p, *(_QWORD *)(a1 + 128));
    for (j = *(_QWORD **)(a1 + 120); j; j = (_QWORD *)*j)
    {
      v7 = v25;
      SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress();
      v10 = SymbolWithAddress;
      v11 = v9;
      v12 = v7[7];
      v13 = (uint64_t *)v7[6];
      if ((unint64_t)v13 >= v12)
      {
        v15 = (uint64_t *)v7[5];
        v16 = ((char *)v13 - (char *)v15) >> 4;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 60)
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        v18 = v12 - (_QWORD)v15;
        if (v18 >> 3 > v17)
          v17 = v18 >> 3;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
          v19 = 0xFFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(v7 + 7), v19);
          v15 = (uint64_t *)v7[5];
          v13 = (uint64_t *)v7[6];
        }
        else
        {
          v20 = 0;
        }
        v21 = (uint64_t *)&v20[16 * v16];
        *v21 = v10;
        v21[1] = v11;
        v22 = v21;
        if (v13 != v15)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v13 - 1);
            v22 -= 2;
            v13 -= 2;
          }
          while (v13 != v15);
          v15 = (uint64_t *)v7[5];
        }
        v14 = v21 + 2;
        v7[5] = (uint64_t)v22;
        v7[6] = (uint64_t)(v21 + 2);
        v7[7] = (uint64_t)&v20[16 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *v13 = SymbolWithAddress;
        v13[1] = v9;
        v14 = v13 + 2;
      }
      v7[6] = (uint64_t)v14;
    }
    CSSymbolOwnerCreateSparseDataWithBlock();
    SparseSignatureWithFlags = CSSymbolOwnerCreateSignature();
    _Block_object_dispose(&v24, 8);
    if (__p)
    {
      v30 = __p;
      operator delete(__p);
    }
  }
  return SparseSignatureWithFlags;
}

void sub_22639EF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void std::vector<_CSTypeRef>::reserve(void **a1, unint64_t a2)
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

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
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

BOOL ___ZN13SharedLibrary30generateFBSSignatureWithConfigE48ats_symbolication_instruction_fetching_options_t_block_invoke(uint64_t a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v3 + 40);
  v5 = (*(_QWORD *)(v3 + 48) - v4) >> 4;
  if (v5 > a2)
    *a3 = *(_OWORD *)(v4 + 16 * a2);
  return v5 <= a2;
}

BOOL SharedLibrary::hasAddressesToSymbolicate(SharedLibrary *this)
{
  return *((_QWORD *)this + 16) != 0;
}

uint64_t SharedLibrary::prepareForResymbolicationWithDsymPath(SharedLibrary *this, const char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  CSSymbolOwnerSetPathForSymbolication();
  CSSymbolicatorResymbolicateFromDebugSymbolsInfo();
  v2 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_22639F128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN13SharedLibrary37prepareForResymbolicationWithDsymPathEPKc_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _OWORD *CFUUIDBytes;
  uint64_t v7;
  void **v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  void **v14;
  uint64_t Path;
  void **v16;
  void *__p[2];
  char v18;
  char v19;
  uint8_t buf[4];
  void **v21;
  __int16 v22;
  uint64_t v23;
  UUID v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    *(_OWORD *)v24 = *CFUUIDBytes;
    if (a4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      ats_symbolication_log_init();
      v7 = ats_symbolication_log;
      if (!os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        return;
      UUID::uuidString((UUID *)v24, (uint64_t)__p);
      if (v18 >= 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v21 = v8;
      v9 = "Resymbolication: sucessfully ingested symbol data from dSYM for UUID: %s";
      v10 = v7;
      v11 = 12;
    }
    else
    {
      ats_symbolication_log_init();
      v12 = ats_symbolication_log;
      if (!os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        return;
      UUID::uuidString((UUID *)v24, (uint64_t)__p);
      v13 = v18;
      v14 = (void **)__p[0];
      Path = CSSymbolOwnerGetPath();
      v16 = __p;
      if (v13 < 0)
        v16 = v14;
      *(_DWORD *)buf = 136315394;
      v21 = v16;
      v22 = 2080;
      v23 = Path;
      v9 = "Resymbolication: failed to ingest symbol data from dSYM for UUID: %s %s";
      v10 = v12;
      v11 = 22;
    }
    _os_log_impl(&dword_226389000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    if (v19)
    {
      if (v18 < 0)
        operator delete(__p[0]);
    }
  }
}

void sub_22639F2F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a15)
  {
    if (a14 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *SharedLibrary::addAddress(SharedLibrary *this, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)this + 104, &v3, &v3);
}

uint64_t SharedLibrary::uuid(SharedLibrary *this)
{
  return SharedLibraryMetadata::uuid((SharedLibrary *)((char *)this + 144));
}

uint64_t SharedLibrary::baseAddress(SharedLibrary *this)
{
  return *(_QWORD *)this;
}

void SharedLibrary::~SharedLibrary(SharedLibrary *this)
{
  void **v2;

  CSRelease();
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this + 144);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 104);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this + 88);
  v2 = (void **)((char *)this + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 96;
        std::__destroy_at[abi:ne180100]<Segment,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<Segment,0>(uint64_t a1)
{
  void *v2;
  void **v3;

  v3 = (void **)(a1 + 56);
  std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(_QWORD *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
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
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
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
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
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
  return i;
}

void sub_22639F6A8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__int128 *SharedCacheSymbolicators::sharedCacheSymbolicatorMap(SharedCacheSymbolicators *this)
{
  unsigned __int8 v1;
  unint64_t v2;
  char v4;
  char **v5;
  char *v6;

  if ((v1 & 1) == 0
  {
    SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap = 0u;
    unk_25583CA08 = 0u;
    dword_25583CA18 = 1065353216;
    __cxa_atexit((void (*)(void *))std::unordered_map<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>::~unordered_map[abi:ne180100], &SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap, &dword_226389000);
  }
  v2 = atomic_load(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::once);
  if (v2 != -1)
  {
    v6 = &v4;
    v5 = &v6;
    std::__call_once(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::once, &v5, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::$_0 &&>>);
  }
  return &SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap;
}

_QWORD *SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(SharedCacheSymbolicators *this, UUID a2)
{
  _QWORD *result;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = this;
  v3[1] = a2;
  SharedCacheSymbolicators::sharedCacheSymbolicatorMap(this);
  result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap, v3);
  if (result)
    return *(_QWORD **)result[4];
  return result;
}

uint64_t SharedCacheSymbolicators::createSharedCacheSymbolicatorByUUID@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = CSSymbolicatorCreateWithSharedCacheUUID();
  v6 = v5;
  result = operator new();
  *(_QWORD *)result = v4;
  *(_QWORD *)(result + 8) = v6;
  *(_BYTE *)(result + 16) = 0;
  *a1 = result;
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](v2 + 4, 0);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::$_0 &&>>()
{
  return CSSymbolicatorForeachSharedCache();
}

void sub_22639F9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__emplace_unique_impl<CFUUIDBytes const*&,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>(_QWORD *a1, _OWORD **a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *inserted;
  char v8;

  v6 = operator new(0x28uLL);
  *v6 = 0;
  *((_OWORD *)v6 + 1) = **a2;
  v6[4] = *a3;
  *a3 = 0;
  v6[1] = v6[3] ^ v6[2];
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique(a1, v6);
  if ((v8 & 1) == 0)
  {
    std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](v6 + 4, 0);
    operator delete(v6);
  }
  return inserted;
}

void sub_22639FAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;

  v2 = a2;
  v4 = a2 + 2;
  v5 = a2[3] ^ a2[2];
  *(v4 - 1) = v5;
  v6 = std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v5, v4);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *i;
  unint64_t v8;
  float v10;
  float v11;
  uint64_t v12;
  _BOOL8 v13;
  size_t v14;
  unint64_t v15;
  size_t v16;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
      v5 = v3 <= a2 ? a2 % v3 : a2;
    else
      v5 = (v3 - 1) & a2;
    v6 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = (_QWORD *)*v6; i; i = (_QWORD *)*i)
      {
        v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3 && i[3] == a3[1])
            return i;
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3)
              v8 %= v3;
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5)
            break;
        }
      }
    }
  }
  v10 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v11 = *(float *)(a1 + 32);
  if (!v3 || (float)(v11 * (float)v3) < v10)
  {
    v12 = 2 * v3;
    v13 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    v14 = v13 | v12;
    v15 = vcvtps_u32_f32(v10 / v11);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v16);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_perform[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, uint64_t *__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](__p + 4, 0);
  if (__p)
    operator delete(__p);
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::ScopeGuard(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_BYTE *)(a1 + 16) = 0;
  if ((CSIsNull() & 1) == 0)
  {
    CSRetain();
    *(_BYTE *)(a1 + 16) = 1;
  }
  return a1;
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this)
{
  *((_BYTE *)this + 32) = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 24) = 0;
}

{
  *((_BYTE *)this + 32) = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 24) = 0;
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this, uint64_t a2, UUID a3, uint8_t *a4)
{
  char v5;

  *(_QWORD *)this = a3;
  *((_QWORD *)this + 1) = a4;
  *((_QWORD *)this + 2) = a2;
  *((_BYTE *)this + 24) = 0;
  *((_BYTE *)this + 32) = 0;
  *((_QWORD *)this + 3) = SharedCacheDescription::baseAddressForSharedCacheWithUUID(this, a3, a4);
  *((_BYTE *)this + 32) = v5;
}

{
  char v5;

  *(_QWORD *)this = a3;
  *((_QWORD *)this + 1) = a4;
  *((_QWORD *)this + 2) = a2;
  *((_BYTE *)this + 24) = 0;
  *((_BYTE *)this + 32) = 0;
  *((_QWORD *)this + 3) = SharedCacheDescription::baseAddressForSharedCacheWithUUID(this, a3, a4);
  *((_BYTE *)this + 32) = v5;
}

uint64_t SharedCacheDescription::baseAddressForSharedCacheWithUUID(SharedCacheDescription *this, UUID a2, uint8_t *a3)
{
  SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID((SharedCacheSymbolicators *)a2, a3);
  if ((CSIsNull() & 1) != 0)
    return 0;
  else
    return CSSymbolicatorGetSharedCacheBaseAddress();
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this, uint64_t a2, uint64_t a3, UUID a4, uint64_t a5)
{
  *(_QWORD *)this = a4;
  *((_QWORD *)this + 1) = a5;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = a2 - a3;
  *((_BYTE *)this + 32) = 1;
}

{
  *(_QWORD *)this = a4;
  *((_QWORD *)this + 1) = a5;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = a2 - a3;
  *((_BYTE *)this + 32) = 1;
}

uint64_t SharedCacheDescription::uuid(SharedCacheDescription *this)
{
  return *(_QWORD *)this;
}

uint64_t SharedCacheDescription::loadAddress(SharedCacheDescription *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t SharedCacheDescription::slide(SharedCacheDescription *this)
{
  if (*((_BYTE *)this + 32))
    return *((_QWORD *)this + 2) - *((_QWORD *)this + 3);
  else
    return 0;
}

uint64_t SharedCacheDescription::baseAddress(SharedCacheDescription *this)
{
  return *((_QWORD *)this + 3);
}

uint64_t SharedCacheDescription::hash(SharedCacheDescription *this)
{
  return *((_QWORD *)this + 1) ^ *(_QWORD *)this ^ *((_QWORD *)this + 2);
}

BOOL SharedCacheDescription::operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t SharedCacheMetadata::SharedCacheMetadata(uint64_t a1)
{
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  SharedCacheMetadata::populateWithSharedCacheSymbolicator(a1);
  return a1;
}

void sub_22639FFA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t SharedCacheMetadata::populateWithSharedCacheSymbolicator(uint64_t a1)
{
  uint64_t result;

  *(_OWORD *)a1 = *(_OWORD *)CSSymbolicatorGetSharedCacheUUID();
  *(_QWORD *)(a1 + 32) = CSSymbolicatorGetArchitecture();
  result = CSSymbolicatorGetSharedCacheBaseAddress();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t SharedCacheMetadata::SharedCacheMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = SharedCacheMetadata::SharedCacheMetadata(a1);
  std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)(v6 + 48), a4);
  return a1;
}

{
  uint64_t v6;

  v6 = SharedCacheMetadata::SharedCacheMetadata(a1);
  std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)(v6 + 48), a4);
  return a1;
}

uint64_t SharedCacheMetadata::baseAddress(SharedCacheMetadata *this)
{
  return *((_QWORD *)this + 5);
}

void SharedCacheMetadata::uuidString(SharedCacheMetadata *this@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v4;
  int v5;
  __int128 v6;
  __int128 v7;
  unsigned __int8 v8;
  void *__p[2];
  char v10;
  char v11;

  if (uuid_is_null((const unsigned __int8 *)this) || !*((_QWORD *)this + 6))
    goto LABEL_2;
  v4 = (_OWORD *)((char *)this + 16);
  if (*((_QWORD *)this + 3))
  {
    *(_OWORD *)a2 = *v4;
    *(_BYTE *)(a2 + 16) = 1;
    return;
  }
  UUID::uuidString((UUID *)this, (uint64_t)__p);
  if (!v11)
    goto LABEL_2;
  StringPool::cacheString(*((_QWORD *)this + 6), (unsigned __int8 *)__p, (uint64_t)&v7);
  v5 = v8;
  if (v8)
  {
    v6 = v7;
    *v4 = v7;
    *(_OWORD *)a2 = v6;
    *(_BYTE *)(a2 + 16) = 1;
  }
  if (v11)
  {
    if (v10 < 0)
      operator delete(__p[0]);
  }
  if (!v5)
  {
LABEL_2:
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 16) = 0;
  }
}

void sub_2263A0158(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedCacheMetadata::architecture(SharedCacheMetadata *this)
{
  return *((_QWORD *)this + 4);
}

uint64_t DyldKdebugHandler::shouldResetLibraryState(DyldKdebugHandler *this)
{
  return *((unsigned __int8 *)this + 12960);
}

uint64_t DyldKdebugHandler::toggleResetLibraryState(uint64_t this)
{
  *(_BYTE *)(this + 12960) ^= 1u;
  return this;
}

void DyldKdebugHandler::resetInternalLibraryState(DyldKdebugHandler *this)
{
  DyldKdebugHandler *v2;
  int v3;

  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12504);
  v2 = this;
  v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::__bitset<1563ul,99999ul>>((uint64_t)&v2, 0x1869FuLL);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12624);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12584);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12544);
}

void DyldKdebugHandler::handleLibraryCompletion(DyldKdebugHandler *this, DyldKdebugLibraryDescription *a2)
{
  fsid_t *v4;
  __int128 v5;
  char v6;
  void *__p[2];
  char v8;
  char v9;

  v4 = (fsid_t *)DyldKdebugLibraryDescription::fsInfo(a2);
  DyldKdebugFilesystemInfo::path(v4, (uint64_t)__p);
  if (v9)
  {
    StringPool::cacheString(*((_QWORD *)this + 1618), (unsigned __int8 *)__p, (uint64_t)&v5);
    if (v6)
      *((_OWORD *)a2 + 2) = v5;
    if (v9)
    {
      if (v8 < 0)
        operator delete(__p[0]);
    }
  }
}

void sub_2263A0290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void DyldKdebugHandler::consumeTracepoint(DyldKdebugHandler *this, __n128 *a2)
{
  _BYTE *v4;
  unint64_t v5;

  v4 = (char *)this + 12960;
  if (*((_BYTE *)this + 12960))
  {
    DyldKdebugHandler::resetInternalLibraryState(this);
    *v4 ^= 1u;
  }
  HIDWORD(v5) = a2[3].n128_u32[0];
  LODWORD(v5) = HIDWORD(v5) - 520421376;
  switch((v5 >> 2))
  {
    case 0u:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421376u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 1u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421380u>>(this, (uint64_t)a2);
      break;
    case 2u:
      DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421384u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 3u:
      DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421388u>>((uint64_t)this, (uint64_t *)a2);
      break;
    case 4u:
      DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421392u>>(this, (uint64_t)a2);
      break;
    case 0xAu:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421416u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xBu:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421420u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xCu:
      DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421424u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xDu:
      DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421428u>>((uint64_t)this, a2);
      break;
    case 0xEu:
      DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421432u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xFu:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421436u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0x10u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421440u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0x11u:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421444u>>((uint64_t)this, a2);
      break;
    case 0x12u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421448u>>((uint64_t)this, a2);
      break;
    default:
      return;
  }
}

_QWORD *DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421376u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;

  v5 = *(_QWORD *)(a2 + 40);
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugLibraryDescription::consumeTracepointA((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421380u>>(DyldKdebugHandler *a1, uint64_t a2)
{
  DyldKdebugLibraryDescription *v4;
  _QWORD *v5;
  _OWORD *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t *result;
  unsigned int v29;
  unint64_t v30;
  uint64_t *v31;

  v30 = *(_QWORD *)(a2 + 40);
  v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)a1 + 12904, (int *)&v29, &v29);
  v31 = (uint64_t *)&v30;
  v4 = (DyldKdebugLibraryDescription *)(std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a1 + 12744, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3);
  DyldKdebugLibraryDescription::consumeTracepointB((uint64_t)v4, a2);
  DyldKdebugHandler::handleLibraryCompletion(a1, v4);
  v31 = (uint64_t *)&v29;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)a1 + 12504, (int *)&v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  v6 = (_OWORD *)v5[4];
  v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    v12 = v5[3];
    v13 = ((uint64_t)v6 - v12) >> 6;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 58)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v15 = v7 - v12;
    if (v15 >> 5 > v14)
      v14 = v15 >> 5;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFC0)
      v16 = 0x3FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v5 + 5), v16);
    else
      v17 = 0;
    v18 = &v17[64 * v13];
    v19 = &v17[64 * v16];
    v20 = *(_OWORD *)v4;
    v21 = *((_OWORD *)v4 + 1);
    v22 = *((_OWORD *)v4 + 3);
    *((_OWORD *)v18 + 2) = *((_OWORD *)v4 + 2);
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    v11 = v18 + 64;
    v24 = (char *)v5[3];
    v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        v25 = *((_OWORD *)v23 - 4);
        v26 = *((_OWORD *)v23 - 3);
        v27 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v18 - 1) = v27;
        *((_OWORD *)v18 - 4) = v25;
        *((_OWORD *)v18 - 3) = v26;
        v18 -= 64;
        v23 -= 64;
      }
      while (v23 != v24);
      v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    v9 = *((_OWORD *)v4 + 1);
    v10 = *((_OWORD *)v4 + 3);
    v6[2] = *((_OWORD *)v4 + 2);
    v6[3] = v10;
    *v6 = v8;
    v6[1] = v9;
    v11 = v6 + 4;
  }
  v5[4] = v11;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)a1 + 1593, &v30);
  if (v29 >= 0x1869F)
    std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
  *(_QWORD *)((char *)a1 + (((unint64_t)v29 >> 3) & 0x1FFFFFF8)) |= 1 << v29;
  return result;
}

double DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421384u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  double result;
  uint64_t v5;
  uint64_t *v6;

  v5 = *(_QWORD *)(a2 + 40);
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(_QWORD *)&result = DyldKdebugLibraryDescription::consumeTracepoint32A((int32x4_t *)(v3 + 3), a2).u64[0];
  return result;
}

uint64_t DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421388u>>(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;

  v5 = a2[5];
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugLibraryDescription::consumeTracepoint32B(v3 + 3, a2);
}

uint64_t *DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421392u>>(DyldKdebugHandler *a1, uint64_t a2)
{
  DyldKdebugLibraryDescription *v4;
  _QWORD *v5;
  _OWORD *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v29;
  unint64_t v30;
  uint64_t *v31;

  v30 = *(_QWORD *)(a2 + 40);
  v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)a1 + 12904, &v29, &v29);
  v31 = (uint64_t *)&v30;
  v4 = (DyldKdebugLibraryDescription *)(std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a1 + 12744, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3);
  DyldKdebugLibraryDescription::consumeTracepoint32C((uint64_t)v4, a2);
  DyldKdebugHandler::handleLibraryCompletion(a1, v4);
  v31 = (uint64_t *)&v29;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)a1 + 12504, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  v6 = (_OWORD *)v5[4];
  v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    v12 = v5[3];
    v13 = ((uint64_t)v6 - v12) >> 6;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 58)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v15 = v7 - v12;
    if (v15 >> 5 > v14)
      v14 = v15 >> 5;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFC0)
      v16 = 0x3FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v5 + 5), v16);
    else
      v17 = 0;
    v18 = &v17[64 * v13];
    v19 = &v17[64 * v16];
    v20 = *(_OWORD *)v4;
    v21 = *((_OWORD *)v4 + 1);
    v22 = *((_OWORD *)v4 + 3);
    *((_OWORD *)v18 + 2) = *((_OWORD *)v4 + 2);
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    v11 = v18 + 64;
    v24 = (char *)v5[3];
    v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        v25 = *((_OWORD *)v23 - 4);
        v26 = *((_OWORD *)v23 - 3);
        v27 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v18 - 1) = v27;
        *((_OWORD *)v18 - 4) = v25;
        *((_OWORD *)v18 - 3) = v26;
        v18 -= 64;
        v23 -= 64;
      }
      while (v23 != v24);
      v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    v9 = *((_OWORD *)v4 + 1);
    v10 = *((_OWORD *)v4 + 3);
    v6[2] = *((_OWORD *)v4 + 2);
    v6[3] = v10;
    *v6 = v8;
    v6[1] = v9;
    v11 = v6 + 4;
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)a1 + 1593, &v30);
}

uint64_t DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421416u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;

  v5 = *(_QWORD *)(a2 + 40);
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugSharedCacheDescription::consumeTracepointA((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421420u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v29;
  unint64_t v30;
  uint64_t *v31;

  v30 = *(_QWORD *)(a2 + 40);
  v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  v31 = (uint64_t *)&v30;
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugSharedCacheDescription::consumeTracepointB((uint64_t)v4, a2);
  v31 = (uint64_t *)&v29;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12584, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  v6 = v5[4];
  v7 = v5[5];
  if (v6 >= v7)
  {
    v12 = v5[3];
    v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x249249249249249)
      v16 = 0x492492492492492;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    else
      v17 = 0;
    v18 = &v17[56 * v13];
    v19 = &v17[56 * v16];
    v20 = *(_OWORD *)v4;
    v21 = *((_OWORD *)v4 + 1);
    v22 = *((_OWORD *)v4 + 2);
    *((_QWORD *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)v18 = v20;
    v11 = v18 + 56;
    v24 = (char *)v5[3];
    v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        v25 = *(_OWORD *)(v23 - 56);
        v26 = *(_OWORD *)(v23 - 40);
        v27 = *(_OWORD *)(v23 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 40) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    v9 = *((_OWORD *)v4 + 1);
    v10 = *((_OWORD *)v4 + 2);
    *(_QWORD *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)v6 = v8;
    v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)(a1 + 12824), &v30);
}

double DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421424u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  double result;
  uint64_t v5;
  uint64_t *v6;

  v5 = *(_QWORD *)(a2 + 40);
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(_QWORD *)&result = DyldKdebugSharedCacheDescription::consumeTracepoint32A((int32x4_t *)(v3 + 3), a2).u64[0];
  return result;
}

uint64_t DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421428u>>(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;

  v5 = a2[5];
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugSharedCacheDescription::consumeTracepoint32B((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421432u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v29;
  unint64_t v30;
  uint64_t *v31;

  v30 = *(_QWORD *)(a2 + 40);
  v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  v31 = (uint64_t *)&v30;
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugSharedCacheDescription::consumeTracepoint32C((uint64_t)v4, a2);
  v31 = (uint64_t *)&v29;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12584, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  v6 = v5[4];
  v7 = v5[5];
  if (v6 >= v7)
  {
    v12 = v5[3];
    v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x249249249249249)
      v16 = 0x492492492492492;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    else
      v17 = 0;
    v18 = &v17[56 * v13];
    v19 = &v17[56 * v16];
    v20 = *(_OWORD *)v4;
    v21 = *((_OWORD *)v4 + 1);
    v22 = *((_OWORD *)v4 + 2);
    *((_QWORD *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)v18 = v20;
    v11 = v18 + 56;
    v24 = (char *)v5[3];
    v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        v25 = *(_OWORD *)(v23 - 56);
        v26 = *(_OWORD *)(v23 - 40);
        v27 = *(_OWORD *)(v23 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 40) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    v9 = *((_OWORD *)v4 + 1);
    v10 = *((_OWORD *)v4 + 2);
    *(_QWORD *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)v6 = v8;
    v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)(a1 + 12824), &v30);
}

double DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421444u>>(uint64_t a1, __n128 *a2)
{
  _QWORD *v3;
  double result;
  uint64_t v5;
  uint64_t *v6;

  v5 = a2[2].n128_i64[1];
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1 + 12864, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(_QWORD *)&result = DyldKdebugAOTSharedCacheDescription::consumeTracepointA((__n128 *)(v3 + 3), a2).n128_u64[0];
  return result;
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421448u>>(uint64_t a1, __n128 *a2)
{
  __n128 *v4;
  _QWORD *v5;
  __n128 *v6;
  unint64_t v7;
  __n128 v8;
  __n128 v9;
  __n128 *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  __n128 *v17;
  char *v18;
  __n128 v19;
  __n128 v20;
  __n128 *v21;
  __n128 *v22;
  __n128 v23;
  __n128 v24;
  int v26;
  unint64_t v27;
  uint64_t *v28;

  v27 = a2[2].n128_u64[1];
  v26 = a2[5].n128_i32[2];
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v26, &v26);
  v28 = (uint64_t *)&v27;
  v4 = (__n128 *)(std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1 + 12864, (uint64_t *)&v27, (uint64_t)&std::piecewise_construct, &v28)+ 3);
  DyldKdebugAOTSharedCacheDescription::consumeTracepointB(v4, a2);
  v28 = (uint64_t *)&v26;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12624, &v26, (uint64_t)&std::piecewise_construct, (_DWORD **)&v28);
  v6 = (__n128 *)v5[4];
  v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    v11 = v5[3];
    v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v6 - v11) >> 4);
    v13 = v12 + 1;
    if (v12 + 1 > 0x555555555555555)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v11) >> 4);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x2AAAAAAAAAAAAAALL)
      v15 = 0x555555555555555;
    else
      v15 = v13;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(v5 + 5), v15);
    else
      v16 = 0;
    v17 = (__n128 *)&v16[48 * v12];
    v18 = &v16[48 * v15];
    v19 = *v4;
    v20 = v4[2];
    v17[1] = v4[1];
    v17[2] = v20;
    *v17 = v19;
    v10 = v17 + 3;
    v22 = (__n128 *)v5[3];
    v21 = (__n128 *)v5[4];
    if (v21 != v22)
    {
      do
      {
        v23 = v21[-3];
        v24 = v21[-1];
        v17[-2] = v21[-2];
        v17[-1] = v24;
        v17[-3] = v23;
        v17 -= 3;
        v21 -= 3;
      }
      while (v21 != v22);
      v21 = (__n128 *)v5[3];
    }
    v5[3] = v17;
    v5[4] = v10;
    v5[5] = v18;
    if (v21)
      operator delete(v21);
  }
  else
  {
    v8 = *v4;
    v9 = v4[2];
    v6[1] = v4[1];
    v6[2] = v9;
    *v6 = v8;
    v10 = v6 + 3;
  }
  v5[4] = v10;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)(a1 + 12864), &v27);
}

double DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421436u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  double result;
  uint64_t v5;
  uint64_t *v6;

  v5 = *(_QWORD *)(a2 + 40);
  v6 = &v5;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12784, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(_QWORD *)&result = DyldKdebugAOTImageDescription::consumeTracepointA((__n128 *)(v3 + 3), a2).n128_u64[0];
  return result;
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421440u>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v29;
  unint64_t v30;
  uint64_t *v31;

  v30 = *(_QWORD *)(a2 + 40);
  v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  v31 = (uint64_t *)&v30;
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12784, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugAOTImageDescription::consumeTracepointB(v4, (_QWORD *)a2);
  v31 = (uint64_t *)&v29;
  v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12544, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  v6 = v5[4];
  v7 = v5[5];
  if (v6 >= v7)
  {
    v12 = v5[3];
    v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x249249249249249)
      v16 = 0x492492492492492;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    else
      v17 = 0;
    v18 = &v17[56 * v13];
    v19 = &v17[56 * v16];
    v20 = *(_OWORD *)v4;
    v21 = *((_OWORD *)v4 + 1);
    v22 = *((_OWORD *)v4 + 2);
    *((_QWORD *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)v18 = v20;
    v11 = v18 + 56;
    v24 = (char *)v5[3];
    v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        v25 = *(_OWORD *)(v23 - 56);
        v26 = *(_OWORD *)(v23 - 40);
        v27 = *(_OWORD *)(v23 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 40) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    v9 = *((_OWORD *)v4 + 1);
    v10 = *((_OWORD *)v4 + 2);
    *(_QWORD *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)v6 = v8;
    v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((_QWORD *)(a1 + 12784), &v30);
}

void DyldKdebugHandler::DyldKdebugHandler(DyldKdebugHandler *this)
{
  char *v2;

  bzero(this, 0x30F8uLL);
  *((_DWORD *)this + 3134) = 1065353216;
  *((_OWORD *)this + 784) = 0u;
  *((_OWORD *)this + 785) = 0u;
  *((_DWORD *)this + 3144) = 1065353216;
  *(_OWORD *)((char *)this + 12584) = 0u;
  *(_OWORD *)((char *)this + 12600) = 0u;
  *((_DWORD *)this + 3154) = 1065353216;
  *((_OWORD *)this + 789) = 0u;
  *((_OWORD *)this + 790) = 0u;
  *((_DWORD *)this + 3164) = 1065353216;
  *(_OWORD *)((char *)this + 12664) = 0u;
  *(_OWORD *)((char *)this + 12680) = 0u;
  *((_DWORD *)this + 3174) = 1065353216;
  *((_OWORD *)this + 794) = 0u;
  *((_OWORD *)this + 795) = 0u;
  *((_DWORD *)this + 3184) = 1065353216;
  *(_OWORD *)((char *)this + 12744) = 0u;
  *(_OWORD *)((char *)this + 12760) = 0u;
  *((_DWORD *)this + 3194) = 1065353216;
  *((_OWORD *)this + 799) = 0u;
  *((_OWORD *)this + 800) = 0u;
  *((_DWORD *)this + 3204) = 1065353216;
  *(_OWORD *)((char *)this + 12824) = 0u;
  *(_OWORD *)((char *)this + 12840) = 0u;
  *((_DWORD *)this + 3214) = 1065353216;
  *((_OWORD *)this + 804) = 0u;
  *((_OWORD *)this + 805) = 0u;
  *((_DWORD *)this + 3224) = 1065353216;
  *(_OWORD *)((char *)this + 12904) = 0u;
  *(_OWORD *)((char *)this + 12920) = 0u;
  *((_DWORD *)this + 3234) = 1065353216;
  v2 = (char *)operator new(0x40uLL);
  *((_QWORD *)v2 + 2) = 0;
  *(_QWORD *)v2 = &unk_24EDD5910;
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 7) = 0;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 14) = 1065353216;
  *((_QWORD *)this + 1618) = v2 + 24;
  *((_QWORD *)this + 1619) = v2;
  *((_BYTE *)this + 12960) = 0;
}

void sub_2263A148C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v10);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v18);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v17);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v16);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v15);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v14);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v13);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a9);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v12);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a10);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v11 + 12504);
  _Unwind_Resume(a1);
}

uint64_t DyldKdebugHandler::DyldKdebugHandler(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  bzero((void *)a1, 0x30F8uLL);
  *(_DWORD *)(a1 + 12536) = 1065353216;
  *(_OWORD *)(a1 + 12544) = 0u;
  *(_OWORD *)(a1 + 12560) = 0u;
  *(_DWORD *)(a1 + 12576) = 1065353216;
  *(_OWORD *)(a1 + 12584) = 0u;
  *(_OWORD *)(a1 + 12600) = 0u;
  *(_DWORD *)(a1 + 12616) = 1065353216;
  *(_OWORD *)(a1 + 12624) = 0u;
  *(_OWORD *)(a1 + 12640) = 0u;
  *(_DWORD *)(a1 + 12656) = 1065353216;
  *(_OWORD *)(a1 + 12664) = 0u;
  *(_OWORD *)(a1 + 12680) = 0u;
  *(_DWORD *)(a1 + 12696) = 1065353216;
  *(_OWORD *)(a1 + 12704) = 0u;
  *(_OWORD *)(a1 + 12720) = 0u;
  *(_DWORD *)(a1 + 12736) = 1065353216;
  *(_OWORD *)(a1 + 12744) = 0u;
  *(_OWORD *)(a1 + 12760) = 0u;
  *(_DWORD *)(a1 + 12776) = 1065353216;
  *(_OWORD *)(a1 + 12784) = 0u;
  *(_OWORD *)(a1 + 12800) = 0u;
  *(_DWORD *)(a1 + 12816) = 1065353216;
  *(_OWORD *)(a1 + 12824) = 0u;
  *(_OWORD *)(a1 + 12840) = 0u;
  *(_DWORD *)(a1 + 12856) = 1065353216;
  *(_OWORD *)(a1 + 12864) = 0u;
  *(_OWORD *)(a1 + 12880) = 0u;
  *(_DWORD *)(a1 + 12896) = 1065353216;
  *(_OWORD *)(a1 + 12904) = 0u;
  *(_OWORD *)(a1 + 12920) = 0u;
  *(_DWORD *)(a1 + 12936) = 1065353216;
  v4 = a2[1];
  *(_QWORD *)(a1 + 12944) = *a2;
  *(_QWORD *)(a1 + 12952) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_BYTE *)(a1 + 12960) = 0;
  return a1;
}

_QWORD *DyldKdebugHandler::libraryDescriptionsForPid@<X0>(_QWORD *this@<X0>, unsigned int a2@<W1>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  unsigned int v5;
  int *v6;

  v5 = a2;
  if (a2 >= 0x1869F)
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  if (((*(_QWORD *)((char *)this + (((unint64_t)a2 >> 3) & 0x1FFFFFF8)) >> a2) & 1) != 0)
  {
    v6 = (int *)&v5;
    v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)(this + 1563), (int *)&v5, (uint64_t)&std::piecewise_construct, &v6);
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return std::vector<DyldKdebugLibraryDescription>::__init_with_size[abi:ne180100]<DyldKdebugLibraryDescription*,DyldKdebugLibraryDescription*>(a3, (const void *)v4[3], v4[4], (uint64_t)(v4[4] - v4[3]) >> 6);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return this;
}

_QWORD *DyldKdebugHandler::sharedCacheDescriptionsForPid@<X0>(DyldKdebugHandler *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  int v6;
  int *v7;

  v6 = a2;
  v7 = &v6;
  v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 12584, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return std::vector<DyldKdebugSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugSharedCacheDescription*,DyldKdebugSharedCacheDescription*>(a3, (const void *)v4[3], v4[4], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v4[4] - v4[3]) >> 3));
}

_QWORD *DyldKdebugHandler::aotSharedCacheDescriptionsForPid@<X0>(DyldKdebugHandler *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  int v6;
  int *v7;

  v6 = a2;
  v7 = &v6;
  v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 12624, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return std::vector<DyldKdebugAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTSharedCacheDescription*,DyldKdebugAOTSharedCacheDescription*>(a3, (const void *)v4[3], v4[4], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[4] - v4[3]) >> 4));
}

uint64_t *DyldKdebugHandler::aotImageDescriptionsForPid@<X0>(uint64_t *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  int v6;
  int *v7;

  v6 = a2;
  if (this[1571]
    && (v4 = (uint64_t)(this + 1568),
        (this = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(this + 1568, &v6)) != 0))
  {
    v7 = &v6;
    v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, &v6, (uint64_t)&std::piecewise_construct, &v7);
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return std::vector<DyldKdebugAOTImageDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTImageDescription*,DyldKdebugAOTImageDescription*>(a3, (const void *)v5[3], v5[4], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5[4] - v5[3]) >> 3));
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return this;
}

uint64_t DyldKdebugHandler::allPids(DyldKdebugHandler *this)
{
  return (uint64_t)this + 12904;
}

_QWORD *std::vector<DyldKdebugLibraryDescription>::__init_with_size[abi:ne180100]<DyldKdebugLibraryDescription*,DyldKdebugLibraryDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<DyldKdebugLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263A18C4(_Unwind_Exception *exception_object)
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

char *std::vector<DyldKdebugLibraryDescription>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 58)
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

_QWORD *std::vector<DyldKdebugSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugSharedCacheDescription*,DyldKdebugSharedCacheDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263A197C(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<DyldKdebugAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTSharedCacheDescription*,DyldKdebugAOTSharedCacheDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263A19F4(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<DyldKdebugAOTImageDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTImageDescription*,DyldKdebugAOTImageDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2263A1A6C(_Unwind_Exception *exception_object)
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

void std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void std::__fill_n[abi:ne180100]<false,std::__bitset<1563ul,99999ul>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6)
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *v20 = *v18;
    *v18 = v20;
  }
  else
  {
    *v20 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      v19 = *(_QWORD *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20;
    }
  }
  result = v20;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_2263A1D98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x58uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = **a3;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  LibraryDescription::LibraryDescription((LibraryDescription *)(v8 + 24));
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2263A1E30(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;

  *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::find<unsigned long long>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::find<unsigned long long>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
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
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
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
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6)
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *v20 = *v18;
    *v18 = v20;
  }
  else
  {
    *v20 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      v19 = *(_QWORD *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20;
    }
  }
  result = v20;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_2263A2180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x50uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = **a3;
  *((_QWORD *)v8 + 9) = 0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(v8 + 24));
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2263A2218(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;

  *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v6 >= v7)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      result = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6)
              return result;
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
            if (v11 != v4)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *v20 = *v18;
    *v18 = v20;
  }
  else
  {
    *v20 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      v19 = *(_QWORD *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20;
    }
  }
  result = v20;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_2263A2440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x50uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = **a3;
  *((_QWORD *)v8 + 9) = 0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  AOTImageDescription::AOTImageDescription((AOTImageDescription *)(v8 + 24));
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2263A24D8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;

  *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription(StackshotAOTSharedCacheDescription *this, dyld_aot_cache_uuid_info *a2)
{
  AOTSharedCacheDescription::AOTSharedCacheDescription(this, *(uint8_t **)a2->x86UUID, *(uint8_t **)&a2->x86UUID[8], *(_QWORD *)a2->aotUUID, *(_QWORD *)&a2->aotUUID[8], a2->x86SlidBaseAddress, a2->aotSlidBaseAddress);
}

{
  AOTSharedCacheDescription::AOTSharedCacheDescription(this, *(uint8_t **)a2->x86UUID, *(uint8_t **)&a2->x86UUID[8], *(_QWORD *)a2->aotUUID, *(_QWORD *)&a2->aotUUID[8], a2->x86SlidBaseAddress, a2->aotSlidBaseAddress);
}

void DyldKdebugFilesystemInfo::DyldKdebugFilesystemInfo(DyldKdebugFilesystemInfo *this, fsid a2, fsobj_id a3)
{
  *(fsid *)this = a2;
  *((fsobj_id *)this + 1) = a3;
}

{
  *(fsid *)this = a2;
  *((fsobj_id *)this + 1) = a3;
}

uint64_t DyldKdebugFilesystemInfo::path@<X0>(fsid_t *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  char v6;
  fsid_t *v7;
  char *v8;
  char __s[1032];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = this;
  v4 = atomic_load(&DyldKdebugFilesystemInfo::path(void)::rootFsidOnce);
  if (v4 != -1)
  {
    *(_QWORD *)__s = &v7;
    v8 = __s;
    std::__call_once(&DyldKdebugFilesystemInfo::path(void)::rootFsidOnce, &v8, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<DyldKdebugFilesystemInfo::path(void)::$_0 &&>>);
  }
  if (!this->val[0] && !this->val[1])
    *this = (fsid_t)DyldKdebugFilesystemInfo::path(void)::root_fsid;
  result = fsgetpath(__s, 0x401uLL, this, *(_QWORD *)&this[1]);
  if (result == -1)
  {
    v6 = 0;
    *(_BYTE *)a2 = 0;
  }
  else
  {
    result = (uint64_t)std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, __s);
    v6 = 1;
  }
  *(_BYTE *)(a2 + 24) = v6;
  return result;
}

uint64_t DyldKdebugFilesystemInfo::fsid(DyldKdebugFilesystemInfo *this)
{
  return *(_QWORD *)this;
}

uint64_t DyldKdebugFilesystemInfo::fsobjId(DyldKdebugFilesystemInfo *this)
{
  return *((_QWORD *)this + 1);
}

fsid *DyldKdebugFilesystemInfo::setFsid(fsid *this, fsid a2)
{
  *this = a2;
  return this;
}

_QWORD *DyldKdebugFilesystemInfo::setFsid(_QWORD *this, uint64_t a2)
{
  *this = a2;
  return this;
}

fsobj_id *DyldKdebugFilesystemInfo::setFsobjId(fsobj_id *this, fsobj_id a2)
{
  this[1] = a2;
  return this;
}

uint64_t DyldKdebugFilesystemInfo::setFsobjId(uint64_t this, uint64_t a2)
{
  *(_QWORD *)(this + 8) = a2;
  return this;
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<DyldKdebugFilesystemInfo::path(void)::$_0 &&>>()
{
  uint64_t result;
  statfs v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  result = statfs("/", &v1);
  DyldKdebugFilesystemInfo::path(void)::root_fsid = (uint64_t)v1.f_fsid;
  return result;
}

void LibraryDescription::LibraryDescription(LibraryDescription *this)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

void LibraryDescription::LibraryDescription(LibraryDescription *this, uint64_t a2, UUID a3, uint64_t a4)
{
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = a4;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = 0;
}

{
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = a4;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = 0;
}

uint64_t LibraryDescription::loadAddress(LibraryDescription *this)
{
  return *(_QWORD *)this;
}

uint64_t LibraryDescription::uuid(LibraryDescription *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t LibraryDescription::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

uint64_t LibraryDescription::libraryRange(LibraryDescription *this)
{
  return *(_QWORD *)this;
}

_QWORD *LibraryDescription::setLocation(_QWORD *this, uint64_t a2)
{
  *this = a2;
  return this;
}

uint64_t LibraryDescription::setLength(uint64_t this, uint64_t a2)
{
  *(_QWORD *)(this + 8) = a2;
  return this;
}

uint64_t LibraryDescription::hash(LibraryDescription *this)
{
  return *((_QWORD *)this + 3) ^ *((_QWORD *)this + 2);
}

BOOL LibraryDescription::operator==(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 16);
  v5 = *(_OWORD *)(a2 + 16);
  return (_QWORD)v2 == (_QWORD)v5 && *((_QWORD *)&v2 + 1) == *((_QWORD *)&v5 + 1);
}

void ats_symbolication_log_init(void)
{
  unint64_t v0;
  char v1;
  char **v2;
  char *v3;

  v0 = atomic_load(&ats_symbolication_log_init(void)::initOnce);
  if (v0 != -1)
  {
    v3 = &v1;
    v2 = &v3;
    std::__call_once(&ats_symbolication_log_init(void)::initOnce, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<ats_symbolication_log_init(void)::$_0 &&>>);
  }
}

os_log_t std::__call_once_proxy[abi:ne180100]<std::tuple<ats_symbolication_log_init(void)::$_0 &&>>()
{
  os_log_t result;

  result = os_log_create("com.apple.appletracingsupport", "symbolication");
  ats_symbolication_log = (uint64_t)result;
  return result;
}

void StackshotSharedCacheDescription::StackshotSharedCacheDescription(StackshotSharedCacheDescription *this, dyld_uuid_info_64_v2 *a2)
{
  SharedCacheDescription::SharedCacheDescription(this, a2->imageSlidBaseAddress, a2->imageLoadAddress, *(uint8_t **)a2->imageUUID, *(_QWORD *)&a2->imageUUID[8]);
}

{
  SharedCacheDescription::SharedCacheDescription(this, a2->imageSlidBaseAddress, a2->imageLoadAddress, *(uint8_t **)a2->imageUUID, *(_QWORD *)&a2->imageUUID[8]);
}

uint64_t SourceInfo::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 24);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 16);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

uint64_t SourceInfo::lineNumber(SourceInfo *this)
{
  return *((unsigned int *)this + 12);
}

uint64_t SourceInfo::columnNumber(SourceInfo *this)
{
  return *((unsigned int *)this + 13);
}

uint64_t SourceInfo::initializeWithCSSourceInfo(uint64_t a1)
{
  uint64_t v2;
  uint64_t Path;
  const char *v4;
  size_t v5;
  uint64_t Filename;
  const char *v7;
  size_t v8;
  uint64_t result;

  *(_QWORD *)a1 = CSSourceInfoGetRange();
  *(_QWORD *)(a1 + 8) = v2;
  Path = CSSourceInfoGetPath();
  if (Path)
    v4 = (const char *)Path;
  else
    v4 = (const char *)&unk_2263A5A02;
  v5 = strlen(v4);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  Filename = CSSourceInfoGetFilename();
  if (Filename)
    v7 = (const char *)Filename;
  else
    v7 = (const char *)&unk_2263A5A02;
  v8 = strlen(v7);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = CSSourceInfoGetLineNumber();
  result = CSSourceInfoGetColumn();
  *(_DWORD *)(a1 + 52) = result;
  return result;
}

uint64_t SourceInfo::debug(SourceInfo *this)
{
  printf("\t\tSource Info: ");
  if (*((_QWORD *)this + 3))
    printf("%s");
  else
    printf("<null>");
  return printf(":%d\n", *((_DWORD *)this + 12));
}

_OWORD *SourceInfo::SourceInfo(_OWORD *a1)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if ((CSIsNull() & 1) == 0)
    SourceInfo::initializeWithCSSourceInfo((uint64_t)a1);
  return a1;
}

{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if ((CSIsNull() & 1) == 0)
    SourceInfo::initializeWithCSSourceInfo((uint64_t)a1);
  return a1;
}

__n128 AOTSharedCache::AOTSharedCache(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t AOTSharedCache::translateFromNativeAddress(AOTSharedCache *this, void *a2)
{
  return 0;
}

__n128 AOTSharedCache::aotSharedCacheInfo@<Q0>(AOTSharedCache *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *((_OWORD *)this + 1);
  *(_OWORD *)a2 = *(_OWORD *)this;
  *(_OWORD *)(a2 + 16) = v2;
  result = *((__n128 *)this + 2);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t SharedCache::SharedCache(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _QWORD v8[2];
  _OWORD v9[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v3;
  v10 = *(_QWORD *)(a2 + 32);
  v4 = (std::__shared_weak_count *)operator new(0x40uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5910;
  v4[2].__shared_owners_ = 0;
  *(_OWORD *)&v4[1].__shared_weak_owners_ = 0u;
  v4[1].std::__shared_count = 0u;
  LODWORD(v4[2].__shared_owners_) = 1065353216;
  v8[0] = v4 + 1;
  v8[1] = v4;
  SharedCache::SharedCache(a1, (SharedCache *)v9, v8);
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _QWORD v8[2];
  _OWORD v9[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v3;
  v10 = *(_QWORD *)(a2 + 32);
  v4 = (std::__shared_weak_count *)operator new(0x40uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_24EDD5910;
  v4[2].__shared_owners_ = 0;
  *(_OWORD *)&v4[1].__shared_weak_owners_ = 0u;
  v4[1].std::__shared_count = 0u;
  LODWORD(v4[2].__shared_owners_) = 1065353216;
  v8[0] = v4 + 1;
  v8[1] = v4;
  SharedCache::SharedCache(a1, (SharedCache *)v9, v8);
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void sub_2263A2B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void SharedCache::SharedCache(uint64_t a1, SharedCache *this, _QWORD *a3)
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  SharedCacheSymbolicators *v10;
  uint8_t *__attribute__((__org_typedef(UUID))) v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t *v17[6];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = *a3;
  v5 = a3[1];
  *(_QWORD *)(a1 + 8) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  v8 = *(_OWORD *)this;
  v9 = *((_OWORD *)this + 1);
  *(_QWORD *)(a1 + 152) = *((_QWORD *)this + 4);
  *(_OWORD *)(a1 + 136) = v9;
  *(_OWORD *)(a1 + 120) = v8;
  v10 = (SharedCacheSymbolicators *)SharedCacheDescription::uuid(this);
  *(_QWORD *)(a1 + 16) = SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(v10, v11);
  *(_QWORD *)(a1 + 24) = v12;
  if ((CSIsNull() & 1) != 0)
  {
    SharedCacheSymbolicators::createSharedCacheSymbolicatorByUUID(v17);
    if (v17[0])
    {
      *(_QWORD *)(a1 + 16) = ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::release(v17[0]);
      *(_QWORD *)(a1 + 24) = v13;
      v14 = v17[0];
      v17[0] = 0;
      if (v14)
      {
        v15 = ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard((uint64_t)v14);
        MEMORY[0x227696F98](v15, 0x1000C4057661CB1);
      }
    }
  }
  else
  {
    CSRetain();
  }
  if ((CSIsNull() & 1) == 0)
  {
    SharedCacheMetadata::populateWithSharedCacheSymbolicator(a1 + 32);
    v17[2] = (uint64_t *)0x40000000;
    v16 = *((_OWORD *)this + 1);
    v18 = *(_OWORD *)this;
    v17[1] = (uint64_t *)MEMORY[0x24BDAC760];
    v17[3] = (uint64_t *)___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke;
    v17[4] = (uint64_t *)&__block_descriptor_tmp_1_0;
    v17[5] = (uint64_t *)a1;
    v19 = v16;
    v20 = *((_QWORD *)this + 4);
    CSSymbolicatorForeachSymbolOwnerAtTime();
  }
}

void sub_2263A2D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  void *v12;

  std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0);
  v12 = *(void **)(v9 + 96);
  if (v12)
  {
    *(_QWORD *)(v9 + 104) = v12;
    operator delete(v12);
  }
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v10);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

void sub_2263A2E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::release(uint64_t *a1)
{
  uint64_t result;

  if (*((_BYTE *)a1 + 16))
    CSRelease();
  result = *a1;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

void ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t BaseAddress;
  uint64_t CFUUIDBytes;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char *Path;
  uint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  void *__p[2];
  char v31;
  __int128 v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(uint64_t **)(a1 + 32);
  BaseAddress = CSSymbolOwnerGetBaseAddress();
  CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    v5 = CFUUIDBytes;
    v6 = SharedCacheDescription::slide((SharedCacheDescription *)(a1 + 40));
    if (v7)
      v8 = v6;
    else
      v8 = 0;
    LibraryDescription::LibraryDescription((LibraryDescription *)&v43, v8 + BaseAddress, *(uint8_t **)v5, *(_QWORD *)(v5 + 8));
    v39 = 0;
    v40 = &v39;
    v41 = 0x2000000000;
    v42 = 0;
    v34 = MEMORY[0x24BDAC760];
    v35 = 0x40000000;
    v36 = ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke_2;
    v37 = &unk_24EDD5A30;
    v38 = &v39;
    CSSymbolOwnerForeachSegment();
    LibraryDescription::setLength((uint64_t)&v43, v40[3] - BaseAddress);
    Path = (char *)CSSymbolOwnerGetPath();
    if (Path)
    {
      v10 = *v2;
      std::string::basic_string[abi:ne180100]<0>(__p, Path);
      StringPool::cacheString(v10, (unsigned __int8 *)__p, (uint64_t)&v32);
      if (v31 < 0)
        operator delete(__p[0]);
      if (v33)
        v45 = v32;
      v11 = v2[14];
      v12 = (_OWORD *)v2[13];
      if ((unint64_t)v12 >= v11)
      {
        v16 = v2[12];
        v17 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v12 - v16) >> 4);
        v18 = v17 + 1;
        if (v17 + 1 > 0x555555555555555)
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v16) >> 4);
        if (2 * v19 > v18)
          v18 = 2 * v19;
        if (v19 >= 0x2AAAAAAAAAAAAAALL)
          v20 = 0x555555555555555;
        else
          v20 = v18;
        if (v20)
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(v2 + 14), v20);
        else
          v21 = 0;
        v22 = &v21[48 * v17];
        v23 = &v21[48 * v20];
        v24 = v43;
        v25 = v45;
        *((_OWORD *)v22 + 1) = v44;
        *((_OWORD *)v22 + 2) = v25;
        *(_OWORD *)v22 = v24;
        v15 = v22 + 48;
        v27 = (char *)v2[12];
        v26 = (char *)v2[13];
        if (v26 != v27)
        {
          do
          {
            v28 = *((_OWORD *)v26 - 3);
            v29 = *((_OWORD *)v26 - 1);
            *((_OWORD *)v22 - 2) = *((_OWORD *)v26 - 2);
            *((_OWORD *)v22 - 1) = v29;
            *((_OWORD *)v22 - 3) = v28;
            v22 -= 48;
            v26 -= 48;
          }
          while (v26 != v27);
          v26 = (char *)v2[12];
        }
        v2[12] = (uint64_t)v22;
        v2[13] = (uint64_t)v15;
        v2[14] = (uint64_t)v23;
        if (v26)
          operator delete(v26);
      }
      else
      {
        v13 = v43;
        v14 = v45;
        v12[1] = v44;
        v12[2] = v14;
        *v12 = v13;
        v15 = v12 + 3;
      }
      v2[13] = (uint64_t)v15;
    }
    _Block_object_dispose(&v39, 8);
  }
}

void sub_2263A3154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a14 < 0)
    operator delete(__p);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = CSRegionGetRange();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = result + v4;
  if (*(_QWORD *)(v3 + 24) > (unint64_t)(result + v4))
    v5 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v5;
  return result;
}

uint64_t SharedCache::SharedCache(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  *(_OWORD *)(a1 + 32) = 0u;
  v6 = a1 + 32;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(a1 + 120));
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  if ((CSIsNull() & 1) == 0)
  {
    CSRetain();
    SharedCacheMetadata::populateWithSharedCacheSymbolicator(v6);
  }
  return a1;
}

void sub_2263A3264(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)(v1 + 96);
  if (v4)
  {
    *(_QWORD *)(v1 + 104) = v4;
    operator delete(v4);
  }
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_OWORD *SharedCache::SharedCache(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(a1 + 120));
  return SharedCache::operator=((_OWORD *)a1, a2);
}

void sub_2263A32E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)(v1 + 96);
  if (v4)
  {
    *(_QWORD *)(v1 + 104) = v4;
    operator delete(v4);
  }
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_OWORD *SharedCache::operator=(_OWORD *a1, uint64_t a2)
{
  if (a1 != (_OWORD *)a2)
  {
    a1[2] = *(_OWORD *)(a2 + 32);
    a1[3] = *(_OWORD *)(a2 + 48);
    a1[4] = *(_OWORD *)(a2 + 64);
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)(a1 + 5), (__int128 *)(a2 + 80));
    std::vector<AOTImage>::__move_assign((uint64_t)(a1 + 6), (__n128 *)(a2 + 96));
    a1[1] = *(_OWORD *)(a2 + 16);
    std::shared_ptr<SharedLibrary>::operator=[abi:ne180100]((uint64_t)a1, (__int128 *)a2);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
  }
  return a1;
}

void SharedCache::SharedCache(SharedCache *this, const SharedCache *a2)
{
  *((_OWORD *)this + 5) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_OWORD *)this + 6) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCache *)((char *)this + 120));
  SharedCache::operator=((uint64_t)this, (uint64_t)a2);
}

void sub_2263A33E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)(v1 + 96);
  if (v4)
  {
    *(_QWORD *)(v1 + 104) = v4;
    operator delete(v4);
  }
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t SharedCache::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  if (a1 != a2)
  {
    v4 = *(_OWORD *)(a2 + 32);
    v5 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v5;
    *(_OWORD *)(a1 + 32) = v4;
    std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)(a1 + 80), (uint64_t *)(a2 + 80));
    std::vector<LibraryDescription>::__assign_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>((char *)(a1 + 96), *(char **)(a2 + 96), *(_QWORD *)(a2 + 104), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 104) - *(_QWORD *)(a2 + 96)) >> 4));
    std::shared_ptr<SharedCache>::operator=[abi:ne180100]((_QWORD *)a1, (uint64_t *)a2);
    *(_QWORD *)(a1 + 16) = CSRetain();
    *(_QWORD *)(a1 + 24) = v6;
  }
  return a1;
}

uint64_t SharedCache::libraryDescriptions(SharedCache *this)
{
  return (uint64_t)this + 96;
}

uint64_t SharedCache::baseAddress(SharedCache *this)
{
  return SharedCacheDescription::baseAddress((SharedCache *)((char *)this + 120));
}

uint64_t SharedCache::loadAddress(SharedCache *this)
{
  return SharedCacheDescription::loadAddress((SharedCache *)((char *)this + 120));
}

uint64_t SharedCache::uuid(SharedCache *this)
{
  return SharedCacheDescription::uuid((SharedCache *)((char *)this + 120));
}

void SharedCache::~SharedCache(SharedCache *this)
{
  void *v2;

  CSRelease();
  v2 = (void *)*((_QWORD *)this + 12);
  if (v2)
  {
    *((_QWORD *)this + 13) = v2;
    operator delete(v2);
  }
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this + 80);
  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

uint64_t SharedCache::symbolicator(SharedCache *this)
{
  return *((_QWORD *)this + 2);
}

char *std::vector<LibraryDescription>::__assign_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 4) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0x555555555555555)
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x2AAAAAAAAAAAAAALL)
      v12 = 0x555555555555555;
    else
      v12 = v11;
    result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 4) >= a4)
    goto LABEL_16;
  v16 = &__src[16 * ((v15 - v9) >> 4)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

double SharedLibraryMetadata::SharedLibraryMetadata(uint64_t a1, uint64_t a2)
{
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = 0;
  *(_BYTE *)(a1 + 84) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

{
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = 0;
  *(_BYTE *)(a1 + 84) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t SharedLibraryMetadata::SharedLibraryMetadata(uint64_t a1, __int128 *a2)
{
  __int128 v3;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = 0;
  *(_BYTE *)(a1 + 84) = 0;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  SharedLibraryMetadata::initializeWithCSSymbolOwner(a1);
  return a1;
}

{
  __int128 v3;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = 0;
  *(_BYTE *)(a1 + 84) = 0;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  SharedLibraryMetadata::initializeWithCSSymbolOwner(a1);
  return a1;
}

void sub_2263A36FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

size_t SharedLibraryMetadata::initializeWithCSSymbolOwner(uint64_t a1)
{
  _OWORD *CFUUIDBytes;
  uint64_t Path;
  const char *v4;
  size_t result;

  CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
    *(_OWORD *)(a1 + 16) = *CFUUIDBytes;
  *(_QWORD *)(a1 + 88) = CSSymbolOwnerGetArchitecture();
  Path = CSSymbolOwnerGetPath();
  if (Path)
    v4 = (const char *)Path;
  else
    v4 = (const char *)&unk_2263A5A02;
  result = strlen(v4);
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = result;
  return result;
}

void sub_2263A37E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SharedLibrary>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t SharedLibraryMetadata::debug(SharedLibraryMetadata *this)
{
  uint64_t v2;
  const char *v3;
  const char *v4;
  const char *FamilyName;
  const char *v7;
  char v8;

  puts("Shared Library Metadata:");
  v2 = *((_QWORD *)this + 7);
  if (v2)
    v3 = (const char *)*((_QWORD *)this + 6);
  else
    v3 = 0;
  SharedLibraryMetadata::uuidString(this, (uint64_t)&v7);
  printf("\tPath: ");
  if (v2)
    printf("%s", v3);
  else
    printf("%s", "<null>");
  printf("\tUUID: ");
  if (v8)
    v4 = v7;
  else
    v4 = "<null>";
  printf("%s", v4);
  FamilyName = (const char *)CSArchitectureGetFamilyName();
  return printf("\tArch: %s\n", FamilyName);
}

uint64_t SharedLibraryMetadata::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 56);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 48);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

void SharedLibraryMetadata::uuidString(SharedLibraryMetadata *this@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v3;
  int v5;
  __int128 v6;
  __int128 v7;
  unsigned __int8 v8;
  void *__p[2];
  char v10;
  char v11;

  v3 = (_OWORD *)((char *)this + 32);
  if (*((_QWORD *)this + 5))
  {
    *(_OWORD *)a2 = *v3;
    *(_BYTE *)(a2 + 16) = 1;
  }
  else
  {
    UUID::uuidString((UUID *)((uint8_t *)this + 1), (uint64_t)__p);
    if (!v11)
      goto LABEL_10;
    StringPool::cacheString(*(_QWORD *)this, (unsigned __int8 *)__p, (uint64_t)&v7);
    v5 = v8;
    if (v8)
    {
      v6 = v7;
      *v3 = v7;
      *(_OWORD *)a2 = v6;
      *(_BYTE *)(a2 + 16) = 1;
    }
    if (v11)
    {
      if (v10 < 0)
        operator delete(__p[0]);
    }
    if (!v5)
    {
LABEL_10:
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 16) = 0;
    }
  }
}

void sub_2263A39A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedLibraryMetadata::architecture(SharedLibraryMetadata *this)
{
  return *((_QWORD *)this + 11);
}

uint64_t SharedLibraryMetadata::uuid(SharedLibraryMetadata *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t SharedLibraryMetadata::fsid(SharedLibraryMetadata *this)
{
  return *((_QWORD *)this + 8);
}

uint64_t SharedLibraryMetadata::fsobj_id(SharedLibraryMetadata *this)
{
  return *(_QWORD *)((char *)this + 76);
}

uint64_t SharedLibraryMetadata::bundleID@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 104);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 96);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

uint64_t SharedLibraryMetadata::dsymPath@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 120);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 112);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
  }
  *(_BYTE *)(a2 + 16) = v2;
  return this;
}

void SymbolicationSession::sharedLibraryWithCSSymbolOwner()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  v2 = 136315138;
  v3 = v0;
  _os_log_debug_impl(&dword_226389000, v1, OS_LOG_TYPE_DEBUG, "Failed to store shared library with UUID %s", (uint8_t *)&v2, 0xCu);
}

void SymbolicationSession::sharedLibraryWithUUIDAndPath()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  v3 = 136315394;
  v4 = v0;
  v5 = 2080;
  v6 = v1;
  _os_log_debug_impl(&dword_226389000, v2, OS_LOG_TYPE_DEBUG, "Failed to store shared library with UUID %s, path %s", (uint8_t *)&v3, 0x16u);
}

void SymbolicationSession::collectLiveLibraryDescriptionsForPid(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_226389000, a2, OS_LOG_TYPE_DEBUG, "Failed to acquire live library info for pid %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_0();
}

void SymbolicationSession::writeProcessMapsToKtraceFile(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226389000, log, OS_LOG_TYPE_ERROR, "Failed to append process maps chunk", v1, 2u);
  OUTLINED_FUNCTION_0();
}

void SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_226389000, a2, a3, "Failed to create Process representation for pid %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226389000, log, OS_LOG_TYPE_DEBUG, "Preparing kernel mappings", v1, 2u);
  OUTLINED_FUNCTION_0();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CSAddressSetAddRange()
{
  return MEMORY[0x24BE286A0]();
}

uint64_t CSAddressSetCreate()
{
  return MEMORY[0x24BE286A8]();
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x24BE286C0]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x24BE286D0]();
}

uint64_t CSRegionForeachSymbol()
{
  return MEMORY[0x24BE286E0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x24BE286E8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x24BE286F0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x24BE286F8]();
}

uint64_t CSRetain()
{
  return MEMORY[0x24BE28700]();
}

uint64_t CSSegmentForeachSection()
{
  return MEMORY[0x24BE28708]();
}

uint64_t CSSourceInfoGetColumn()
{
  return MEMORY[0x24BE28710]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x24BE28718]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x24BE28720]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x24BE28728]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x24BE28730]();
}

uint64_t CSSymbolForeachInlineRangeAtDepth()
{
  return MEMORY[0x24BE28738]();
}

uint64_t CSSymbolForeachSourceInfo()
{
  return MEMORY[0x24BE28740]();
}

uint64_t CSSymbolGetFlags()
{
  return MEMORY[0x24BE28748]();
}

uint64_t CSSymbolGetMangledName()
{
  return MEMORY[0x24BE28750]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x24BE28758]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x24BE28760]();
}

uint64_t CSSymbolOwnerCreateSignature()
{
  return MEMORY[0x24BE28770]();
}

uint64_t CSSymbolOwnerCreateSparseDataWithBlock()
{
  return MEMORY[0x24BE28778]();
}

uint64_t CSSymbolOwnerCreateSparseSignatureWithFlags()
{
  return MEMORY[0x24BE28780]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x24BE28790]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x24BE287A8]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x24BE287B0]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x24BE287B8]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x24BE287D0]();
}

uint64_t CSSymbolOwnerGetSourceInfoCount()
{
  return MEMORY[0x24BE287D8]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x24BE287E0]();
}

uint64_t CSSymbolOwnerGetSymbolicator()
{
  return MEMORY[0x24BE287F0]();
}

uint64_t CSSymbolOwnerIsAOut()
{
  return MEMORY[0x24BE287F8]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x24BE28800]();
}

uint64_t CSSymbolOwnerIsKextBundle()
{
  return MEMORY[0x24BE28808]();
}

uint64_t CSSymbolOwnerSetPathForSymbolication()
{
  return MEMORY[0x24BE28810]();
}

uint64_t CSSymbolicatorCreateFlatbufferSignatureForSymbolicatorsWithBlock()
{
  return MEMORY[0x24BE28818]();
}

uint64_t CSSymbolicatorCreateNonFaultingWithSignatureAndGroupKey()
{
  return MEMORY[0x24BE28820]();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return MEMORY[0x24BE28828]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListPidAndSharedCacheUUID()
{
  return MEMORY[0x24BE28830]();
}

uint64_t CSSymbolicatorCreateWithMachKernelFlagsAndNotification()
{
  return MEMORY[0x24BE28840]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x24BE28850]();
}

uint64_t CSSymbolicatorCreateWithSharedCacheUUID()
{
  return MEMORY[0x24BE28858]();
}

uint64_t CSSymbolicatorCreateWithSignature()
{
  return MEMORY[0x24BE28860]();
}

uint64_t CSSymbolicatorForeachFlatbufferSymbolicatorInSignature()
{
  return MEMORY[0x24BE28870]();
}

uint64_t CSSymbolicatorForeachSharedCache()
{
  return MEMORY[0x24BE28878]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x24BE28880]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x24BE28898]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x24BE288A8]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x24BE288B0]();
}

uint64_t CSSymbolicatorGetPid()
{
  return MEMORY[0x24BE288C8]();
}

uint64_t CSSymbolicatorGetSharedCacheBaseAddress()
{
  return MEMORY[0x24BE288D0]();
}

uint64_t CSSymbolicatorGetSharedCacheUUID()
{
  return MEMORY[0x24BE288D8]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x24BE288E0]();
}

uint64_t CSSymbolicatorIsKernelSymbolicator()
{
  return MEMORY[0x24BE28910]();
}

uint64_t CSSymbolicatorResymbolicateFromDebugSymbolsInfo()
{
  return MEMORY[0x24BE28918]();
}

uint64_t OSLogLookupPathWithUUID()
{
  return MEMORY[0x24BE60CA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x24BEDA9F0](this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x24BEDA9F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A8](this, a2, a3, a4);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x24BEDB2C8](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x24BEDB2D0](this, __p, __opt, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
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
  off_24EDD5130(__p);
}

uint64_t operator delete()
{
  return off_24EDD5138();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EDD5140(__sz);
}

uint64_t operator new()
{
  return off_24EDD5148();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x24BDAE500](a1, a2, a3, a4);
}

uint64_t ktrace_chunk_copy_cfdata()
{
  return MEMORY[0x24BECDF38]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x24BECDF48]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x24BECDF50]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x24BECDF98]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x24BECDFA0]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x24BECDFA8]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x24BECDFD0]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x24BECDFF0]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x24BECE020]();
}

uint64_t ktrace_stackshot()
{
  return MEMORY[0x24BECE038]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

