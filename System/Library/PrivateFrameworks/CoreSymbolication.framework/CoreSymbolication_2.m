_QWORD *mapped_memory_core_file_is_exclave(_QWORD *result)
{
  if (result)
  {
    result = (_QWORD *)result[24];
    if (result)
  }
  return result;
}

uint64_t mapped_memory_core_file_get_exclave_vm_flags_for_address(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  const void *v3;
  CSCppCoreFileExclavesMetadata *v6;

  if (a1
    && (v3 = *(const void **)(a1 + 192)) != 0
  {
    return CSCppCoreFileExclavesMetadata::get_exclave_vm_flags_for_address(v6, a2, a3);
  }
  else
  {
    return 4;
  }
}

uint64_t mapped_memory_core_file_get_addressing_mask(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  if (!a1)
    return 4;
  result = 4;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 192);
    if (v4)
    {
      if (*(_BYTE *)(v4 + 80))
      {
        result = 0;
        *a2 = *(_QWORD *)(v4 + 72);
      }
      else
      {
        return 5;
      }
    }
  }
  return result;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
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

void parse_thread_load_command(const thread_command *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t cmdsize;
  unint64_t v3;
  thread_command *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  char v20;
  uint64_t **v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  const thread_command *v27;
  void *__p;
  char *v29;
  char *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t v33;
  _DWORD *v34;

  v32 = 0;
  v33 = 0;
  v31 = (uint64_t *)&v32;
  cmdsize = a1->cmdsize;
  if (cmdsize <= 8)
  {
    *(_QWORD *)a2 = &v32;
    *(_QWORD *)(a2 + 8) = 0;
    v24 = a2 + 8;
    *(_QWORD *)(a2 + 16) = 0;
LABEL_34:
    *(_QWORD *)a2 = v24;
    v25 = 1;
  }
  else
  {
    v26 = a2;
    v3 = 8;
    v27 = a1;
    do
    {
      if (v3 + 8 > cmdsize
        || (v4 = (thread_command *)((char *)a1 + v3),
            v5 = *(unsigned int *)((char *)&a1->cmdsize + v3),
            v5 >> 30)
        || (v6 = 4 * v5 + 8, v6 > cmdsize))
      {
        v25 = 0;
        a2 = v26;
        *(_BYTE *)v26 = 0;
        goto LABEL_36;
      }
      __p = 0;
      v29 = 0;
      v30 = 0;
      std::vector<unsigned char>::reserve((unint64_t *)&__p, 4 * v5);
      if ((v5 & 0x3FFFFFFF) != 0)
      {
        v7 = 0;
        v8 = (4 * v5);
        v9 = v29;
        do
        {
          v10 = (char *)&v4[1] + v7;
          if (v9 >= v30)
          {
            v12 = (char *)__p;
            v13 = v9 - (_BYTE *)__p;
            v14 = v9 - (_BYTE *)__p + 1;
            if (v14 < 0)
              std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
            v15 = v30 - (_BYTE *)__p;
            if (2 * (v30 - (_BYTE *)__p) > (unint64_t)v14)
              v14 = 2 * v15;
            if (v15 >= 0x3FFFFFFFFFFFFFFFLL)
              v16 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v16 = v14;
            if (v16)
              v17 = (char *)operator new(v16);
            else
              v17 = 0;
            v18 = &v17[v13];
            v17[v13] = *v10;
            v11 = &v17[v13 + 1];
            if (v9 != v12)
            {
              v19 = &v9[~(unint64_t)v12];
              do
              {
                v20 = *--v9;
                (v19--)[(_QWORD)v17] = v20;
              }
              while (v9 != v12);
              v9 = (char *)__p;
              v18 = v17;
            }
            __p = v18;
            v29 = &v17[v13 + 1];
            v30 = &v17[v16];
            if (v9)
              operator delete(v9);
          }
          else
          {
            *v9 = *v10;
            v11 = v9 + 1;
          }
          v29 = v11;
          ++v7;
          v9 = v11;
        }
        while (v7 != v8);
      }
      v34 = v4;
      v21 = std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v31, (int *)v4, (uint64_t)&std::piecewise_construct, &v34)+ 5;
      if (v21 != (uint64_t **)&__p)
        std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v21, (char *)__p, v29, v29 - (_BYTE *)__p);
      if (__p)
      {
        v29 = (char *)__p;
        operator delete(__p);
      }
      v3 += v6;
      a1 = v27;
      cmdsize = v27->cmdsize;
    }
    while (v3 < cmdsize);
    v22 = v32;
    v23 = v33;
    a2 = v26;
    *(_QWORD *)v26 = v31;
    *(_QWORD *)(v26 + 8) = v22;
    v24 = v26 + 8;
    *(_QWORD *)(v26 + 16) = v23;
    if (!v23)
      goto LABEL_34;
    v22[2] = v24;
    v31 = (uint64_t *)&v32;
    v25 = 1;
    v32 = 0;
    v33 = 0;
  }
LABEL_36:
  *(_BYTE *)(a2 + 24) = v25;
  std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::destroy((uint64_t)&v31, v32);
}

void sub_1B418726C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16, _QWORD *a17)
{
  if (__p)
    operator delete(__p);
  std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::destroy((uint64_t)&a16, a17);
  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<CSCppCoreFileDarwinMetadata,int const&,std::vector<mapped_memory_core_file_dumped_region_info_t> &,CSCppArchitecture const,std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> &,std::optional<CSCppCoreFileRegionsTree> &,std::optional<unsigned long long> &,std::optional<CSCppCoreFileTaskCrashinfo> &>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, const CSCppCoreFileTaskCrashinfo *a7@<X6>, _QWORD *a8@<X8>)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20[2];
  char v21;
  char v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *__p;
  void *v36;
  char v37;
  char v38;
  _BYTE v39[32];
  uint64_t v40[3];
  void *v41;
  void *v42;
  uint64_t v43;
  void **v44;

  v16 = (_QWORD *)operator new();
  LODWORD(a1) = *a1;
  v42 = 0;
  v43 = 0;
  v41 = 0;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>(&v41, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v17 = *a3;
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v40, a4);
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]((uint64_t)v39, a5);
  v19 = *a6;
  v18 = a6[1];
  std::__optional_copy_base<CSCppCoreFileTaskCrashinfo,false>::__optional_copy_base[abi:ne180100]((CSCppCoreFileTaskCrashinfo *)v20, a7);
  CSCppCoreFileDarwinMetadata::CSCppCoreFileDarwinMetadata(v16, (int)a1, (uint64_t)&v41, v17, (uint64_t)v40, (uint64_t)v39, v19, v18, (const CSCppCoreFileTaskCrashinfo *)v20);
  *a8 = v16;
  if (v38)
  {
    if (v37 && __p)
    {
      v36 = __p;
      operator delete(__p);
    }
    if (v34 && v32)
    {
      v33 = v32;
      operator delete(v32);
    }
    if (v31 && v30 < 0)
      operator delete(v29);
    if (v28 && v27 < 0)
      operator delete(v26);
    if (v25 && v24 < 0)
      operator delete(v23);
    if (v22 && v21 < 0)
      operator delete(v20[0]);
  }
  if (v39[24])
  {
    v44 = (void **)v39;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v44);
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)v40, (_QWORD *)v40[1]);
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
}

void sub_1B418746C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  uint64_t v65;
  uint64_t v66;
  void *v68;

  if (a65)
    CSCppCoreFileTaskCrashinfo::~CSCppCoreFileTaskCrashinfo((CSCppCoreFileTaskCrashinfo *)&a10);
  if (*(_BYTE *)(v66 - 144))
  {
    *(_QWORD *)(v66 - 88) = v66 - 168;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v66 - 88));
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy(v66 - 136, *(_QWORD **)(v66 - 128));
  v68 = *(void **)(v66 - 112);
  if (v68)
  {
    *(_QWORD *)(v66 - 104) = v68;
    operator delete(v68);
  }
  MEMORY[0x1B5E36940](v65, 0x10B3C40B028D1A8);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 5) = 0;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,std::vector<unsigned char>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[5];
    if (v3)
    {
      __p[6] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

_QWORD *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;

  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    v9 = (char *)v7[1];
    goto LABEL_17;
  }
  v12 = (_BYTE *)result[1];
  v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    v16 = a3 - __src;
    if (v16)
      result = memmove(v9, __src, v16);
    v15 = &v9[v16];
    goto LABEL_20;
  }
  v14 = &__src[v13];
  if (v12 != v9)
  {
    result = memmove((void *)*result, __src, v13);
    v9 = (char *)v7[1];
  }
  if (a3 != v14)
    result = memmove(v9, v14, a3 - v14);
  v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

uint64_t *std::map<int,std::vector<unsigned char>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<int,std::vector<unsigned char>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<int,std::vector<unsigned char>>,std::__tree_node<std::__value_type<int,std::vector<unsigned char>>,void *> *,long>>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_1B418774C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<int,std::vector<unsigned char>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<int,std::vector<unsigned char>>,std::__tree_node<std::__value_type<int,std::vector<unsigned char>>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__emplace_hint_unique_key_args<int,std::pair<int const,std::vector<unsigned char>> const&>(v5, v6, v4 + 8, (uint64_t)(v4 + 8));
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__emplace_hint_unique_key_args<int,std::pair<int const,std::vector<unsigned char>> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__find_equal<int>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__construct_node<std::pair<int const,std::vector<unsigned char>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__find_equal<int>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

_QWORD *std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::__construct_node<std::pair<int const,std::vector<unsigned char>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _DWORD *v6;
  _QWORD *result;

  v5 = a1 + 8;
  v6 = operator new(0x40uLL);
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 16) = 0;
  v6[8] = *(_DWORD *)a2;
  *((_QWORD *)v6 + 6) = 0;
  *((_QWORD *)v6 + 7) = 0;
  *((_QWORD *)v6 + 5) = 0;
  result = std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)v6 + 5, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1B4187A84(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,std::vector<unsigned char>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x48uLL);
    v11[8] = **a4;
    v11[10] = 0;
    *((_QWORD *)v11 + 8) = 0;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 6) = v11 + 14;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD **a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
    std::__tree<std::__value_type<int,std::vector<unsigned char>>,std::__map_value_compare<int,std::__value_type<int,std::vector<unsigned char>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<unsigned char>>>>::destroy((uint64_t)(a2 + 6), a2[7]);
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

__n128 std::__optional_storage_base<CSCppCoreFileRegionsTree,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<CSCppCoreFileRegionsTree,false>>(uint64_t a1, __n128 *a2)
{
  __n128 result;
  void **v5;

  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(_BYTE *)(a1 + 24))
    {
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)a1);
      result = *a2;
      *(__n128 *)a1 = *a2;
      *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
      a2->n128_u64[0] = 0;
      a2->n128_u64[1] = 0;
      a2[1].n128_u64[0] = 0;
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    v5 = (void **)a1;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    result = *a2;
    *(__n128 *)a1 = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

void std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<CSCppCoreFileRegionInfo>::__base_destruct_at_end[abi:ne180100]((uint64_t)a1, *a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<CSCppCoreFileRegionInfo>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void *v5;
  void *v6;
  void **v7;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 224)
  {
    v7 = (void **)(i - 24);
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v7);
    if (*(_BYTE *)(i - 32))
    {
      v5 = *(void **)(i - 56);
      if (v5)
      {
        *(_QWORD *)(i - 48) = v5;
        operator delete(v5);
      }
    }
    if (*(_BYTE *)(i - 64))
    {
      v6 = *(void **)(i - 88);
      if (v6)
      {
        *(_QWORD *)(i - 80) = v6;
        operator delete(v6);
      }
    }
    if (*(_BYTE *)(i - 96) && *(char *)(i - 97) < 0)
      operator delete(*(void **)(i - 120));
  }
  *(_QWORD *)(a1 + 8) = a2;
}

void CSCppCoreFileRegionInfo::~CSCppCoreFileRegionInfo(CSCppCoreFileRegionInfo *this)
{
  void *v2;
  void *v3;
  void **v4;

  v4 = (void **)((char *)this + 200);
  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v4);
  if (*((_BYTE *)this + 192))
  {
    v2 = (void *)*((_QWORD *)this + 21);
    if (v2)
    {
      *((_QWORD *)this + 22) = v2;
      operator delete(v2);
    }
  }
  if (*((_BYTE *)this + 160))
  {
    v3 = (void *)*((_QWORD *)this + 17);
    if (v3)
    {
      *((_QWORD *)this + 18) = v3;
      operator delete(v3);
    }
  }
  if (*((_BYTE *)this + 128))
  {
    if (*((char *)this + 127) < 0)
      operator delete(*((void **)this + 13));
  }
}

void std::__optional_storage_base<CSCppCoreFileTaskCrashinfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<CSCppCoreFileTaskCrashinfo,false>>(CSCppCoreFileTaskCrashinfo *this, uint64_t a2)
{
  if (*((unsigned __int8 *)this + 440) == *(unsigned __int8 *)(a2 + 440))
  {
    if (*((_BYTE *)this + 440))
      CSCppCoreFileTaskCrashinfo::operator=((uint64_t)this, a2);
  }
  else if (*((_BYTE *)this + 440))
  {
    CSCppCoreFileTaskCrashinfo::~CSCppCoreFileTaskCrashinfo(this);
    *((_BYTE *)this + 440) = 0;
  }
  else
  {
    std::construct_at[abi:ne180100]<CSCppCoreFileTaskCrashinfo,CSCppCoreFileTaskCrashinfo,CSCppCoreFileTaskCrashinfo*>((uint64_t)this, (__int128 *)a2);
    *((_BYTE *)this + 440) = 1;
  }
}

uint64_t CSCppCoreFileTaskCrashinfo::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(a1, (__n128 *)a2);
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(a1 + 32, (__n128 *)(a2 + 32));
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(a1 + 64, (__n128 *)(a2 + 64));
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(a1 + 96, (__n128 *)(a2 + 96));
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v4 = *(_OWORD *)(a2 + 144);
  v5 = *(_OWORD *)(a2 + 160);
  v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 188) = *(_OWORD *)(a2 + 188);
  *(_OWORD *)(a1 + 160) = v5;
  *(_OWORD *)(a1 + 176) = v6;
  *(_OWORD *)(a1 + 144) = v4;
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>(a1 + 208, (__n128 *)(a2 + 208));
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>(a1 + 240, (__n128 *)(a2 + 240));
  v7 = *(_OWORD *)(a2 + 272);
  v8 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v8;
  *(_OWORD *)(a1 + 272) = v7;
  v9 = *(_OWORD *)(a2 + 320);
  v10 = *(_OWORD *)(a2 + 336);
  v11 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v11;
  *(_OWORD *)(a1 + 320) = v9;
  *(_OWORD *)(a1 + 336) = v10;
  v12 = *(_OWORD *)(a2 + 384);
  v13 = *(_OWORD *)(a2 + 400);
  v14 = *(_OWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 400) = v13;
  *(_OWORD *)(a1 + 416) = v14;
  *(_OWORD *)(a1 + 384) = v12;
  return a1;
}

__n128 std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>(uint64_t a1, __n128 *a2)
{
  __n128 result;
  void *v4;

  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(_BYTE *)(a1 + 24))
      result.n128_u64[0] = std::vector<CSSymbolicatorAotImageInfo>::__move_assign(a1, a2).n128_u64[0];
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    v4 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v4;
      operator delete(v4);
    }
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    result = *a2;
    *(__n128 *)a1 = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

__n128 std::construct_at[abi:ne180100]<CSCppCoreFileTaskCrashinfo,CSCppCoreFileTaskCrashinfo,CSCppCoreFileTaskCrashinfo*>(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __n128 result;
  __int128 v17;
  __int128 v18;

  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 24) = 0;
  if (*((_BYTE *)a2 + 24))
  {
    v2 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v2;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  *(_BYTE *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 56) = 0;
  if (*((_BYTE *)a2 + 56))
  {
    v3 = a2[2];
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
    *(_OWORD *)(a1 + 32) = v3;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 6) = 0;
    *((_QWORD *)a2 + 4) = 0;
    *(_BYTE *)(a1 + 56) = 1;
  }
  *(_BYTE *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 88) = 0;
  if (*((_BYTE *)a2 + 88))
  {
    v4 = a2[4];
    *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
    *(_OWORD *)(a1 + 64) = v4;
    *((_QWORD *)a2 + 9) = 0;
    *((_QWORD *)a2 + 10) = 0;
    *((_QWORD *)a2 + 8) = 0;
    *(_BYTE *)(a1 + 88) = 1;
  }
  *(_BYTE *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 120) = 0;
  if (*((_BYTE *)a2 + 120))
  {
    v5 = a2[6];
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    *(_OWORD *)(a1 + 96) = v5;
    *((_QWORD *)a2 + 13) = 0;
    *((_QWORD *)a2 + 14) = 0;
    *((_QWORD *)a2 + 12) = 0;
    *(_BYTE *)(a1 + 120) = 1;
  }
  v6 = a2[10];
  v7 = a2[11];
  v8 = *(__int128 *)((char *)a2 + 188);
  v10 = a2[8];
  v9 = a2[9];
  *(_BYTE *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 188) = v8;
  *(_OWORD *)(a1 + 160) = v6;
  *(_OWORD *)(a1 + 176) = v7;
  *(_OWORD *)(a1 + 128) = v10;
  *(_OWORD *)(a1 + 144) = v9;
  *(_BYTE *)(a1 + 232) = 0;
  if (*((_BYTE *)a2 + 232))
  {
    *(_QWORD *)(a1 + 208) = 0;
    *(_QWORD *)(a1 + 216) = 0;
    *(_QWORD *)(a1 + 224) = 0;
    *(_OWORD *)(a1 + 208) = a2[13];
    *(_QWORD *)(a1 + 224) = *((_QWORD *)a2 + 28);
    *((_QWORD *)a2 + 26) = 0;
    *((_QWORD *)a2 + 27) = 0;
    *((_QWORD *)a2 + 28) = 0;
    *(_BYTE *)(a1 + 232) = 1;
  }
  *(_BYTE *)(a1 + 240) = 0;
  *(_BYTE *)(a1 + 264) = 0;
  if (*((_BYTE *)a2 + 264))
  {
    *(_QWORD *)(a1 + 240) = 0;
    *(_QWORD *)(a1 + 248) = 0;
    *(_QWORD *)(a1 + 256) = 0;
    *(_OWORD *)(a1 + 240) = a2[15];
    *(_QWORD *)(a1 + 256) = *((_QWORD *)a2 + 32);
    *((_QWORD *)a2 + 30) = 0;
    *((_QWORD *)a2 + 31) = 0;
    *((_QWORD *)a2 + 32) = 0;
    *(_BYTE *)(a1 + 264) = 1;
  }
  v11 = a2[17];
  v12 = a2[19];
  *(_OWORD *)(a1 + 288) = a2[18];
  *(_OWORD *)(a1 + 304) = v12;
  *(_OWORD *)(a1 + 272) = v11;
  v13 = a2[20];
  v14 = a2[21];
  v15 = a2[23];
  *(_OWORD *)(a1 + 352) = a2[22];
  *(_OWORD *)(a1 + 368) = v15;
  *(_OWORD *)(a1 + 320) = v13;
  *(_OWORD *)(a1 + 336) = v14;
  result = (__n128)a2[24];
  v17 = a2[25];
  v18 = a2[26];
  *(_QWORD *)(a1 + 432) = *((_QWORD *)a2 + 54);
  *(_OWORD *)(a1 + 400) = v17;
  *(_OWORD *)(a1 + 416) = v18;
  *(__n128 *)(a1 + 384) = result;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*,false>(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 *v47;
  __int128 *v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  BOOL v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  BOOL v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  uint64_t v109;
  unint64_t v110;
  __int128 v111;
  unint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(__int128 *result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;

  v3 = *a2;
  v4 = *a3;
  if (*a2 >= *(_QWORD *)result)
  {
    if (v4 < v3)
    {
      v10 = *(_OWORD *)a2;
      v11 = *((_OWORD *)a2 + 1);
      v12 = a2[4];
      v13 = a3[4];
      v14 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v14;
      a2[4] = v13;
      a3[4] = v12;
      *(_OWORD *)a3 = v10;
      *((_OWORD *)a3 + 1) = v11;
      if (*a2 < *(_QWORD *)result)
      {
        v15 = *result;
        v16 = result[1];
        v17 = *((_QWORD *)result + 4);
        v18 = a2[4];
        v19 = *((_OWORD *)a2 + 1);
        *result = *(_OWORD *)a2;
        result[1] = v19;
        *((_QWORD *)result + 4) = v18;
        a2[4] = v17;
        *(_OWORD *)a2 = v15;
        *((_OWORD *)a2 + 1) = v16;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      v20 = *result;
      v21 = result[1];
      v22 = *((_QWORD *)result + 4);
      v23 = a2[4];
      v24 = *((_OWORD *)a2 + 1);
      *result = *(_OWORD *)a2;
      result[1] = v24;
      *((_QWORD *)result + 4) = v23;
      a2[4] = v22;
      *(_OWORD *)a2 = v20;
      *((_OWORD *)a2 + 1) = v21;
      if (*a3 >= *a2)
        return result;
      v5 = *(_OWORD *)a2;
      v6 = *((_OWORD *)a2 + 1);
      v7 = a2[4];
      v25 = a3[4];
      v26 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v26;
      a2[4] = v25;
    }
    else
    {
      v5 = *result;
      v6 = result[1];
      v7 = *((_QWORD *)result + 4);
      v8 = a3[4];
      v9 = *((_OWORD *)a3 + 1);
      *result = *(_OWORD *)a3;
      result[1] = v9;
      *((_QWORD *)result + 4) = v8;
    }
    a3[4] = v7;
    *(_OWORD *)a3 = v5;
    *((_OWORD *)a3 + 1) = v6;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  __int128 *v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 40);
      if (*(_QWORD *)(a2 - 40) < *(_QWORD *)a1)
      {
        v7 = *(_OWORD *)a1;
        v8 = *(_OWORD *)(a1 + 16);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a2 - 8);
        v11 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v11;
        *(_QWORD *)(a1 + 32) = v10;
        *(_QWORD *)(a2 - 8) = v9;
        *v6 = v7;
        *(_OWORD *)(a2 - 24) = v8;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>((__int128 *)a1, (unint64_t *)(a1 + 40), (unint64_t *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      v21 = (_QWORD *)(a1 + 40);
      v22 = (_QWORD *)(a1 + 80);
      v23 = (__int128 *)(a1 + 120);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(a1, a1 + 40, a1 + 80, a1 + 120);
      v25 = *(_QWORD *)(a2 - 40);
      v24 = a2 - 40;
      if (v25 >= *(_QWORD *)(a1 + 120))
        return 1;
      v26 = *v23;
      v27 = *(_OWORD *)(a1 + 136);
      v28 = *(_QWORD *)(a1 + 152);
      v29 = *(_QWORD *)(v24 + 32);
      v30 = *(_OWORD *)(v24 + 16);
      *v23 = *(_OWORD *)v24;
      *(_OWORD *)(a1 + 136) = v30;
      *(_QWORD *)(a1 + 152) = v29;
      *(_QWORD *)(v24 + 32) = v28;
      *(_OWORD *)v24 = v26;
      *(_OWORD *)(v24 + 16) = v27;
      if (*(_QWORD *)v23 >= *v22)
        return 1;
      v31 = *(_QWORD *)(a1 + 112);
      v33 = *(_OWORD *)v22;
      v32 = *(_OWORD *)(a1 + 96);
      v34 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)v22 = *v23;
      *(_OWORD *)(a1 + 96) = v34;
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 152);
      *v23 = v33;
      *(_OWORD *)(a1 + 136) = v32;
      *(_QWORD *)(a1 + 152) = v31;
      if (*v22 >= *v21)
        return 1;
      v35 = *(_QWORD *)(a1 + 72);
      v37 = *(_OWORD *)v21;
      v36 = *(_OWORD *)(a1 + 56);
      v38 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *(_OWORD *)(a1 + 56) = v38;
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 112);
      *(_OWORD *)v22 = v37;
      *(_OWORD *)(a1 + 96) = v36;
      *(_QWORD *)(a1 + 112) = v35;
      if (*(_QWORD *)(a1 + 40) >= *(_QWORD *)a1)
        return 1;
      v39 = *(_QWORD *)(a1 + 32);
      v41 = *(_OWORD *)a1;
      v40 = *(_OWORD *)(a1 + 16);
      v42 = *(_OWORD *)(a1 + 56);
      *(_OWORD *)a1 = *(_OWORD *)v21;
      *(_OWORD *)(a1 + 16) = v42;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 72);
      *(_OWORD *)v21 = v41;
      *(_OWORD *)(a1 + 56) = v40;
      result = 1;
      *(_QWORD *)(a1 + 72) = v39;
      return result;
    default:
      v12 = (_QWORD *)(a1 + 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>((__int128 *)a1, (unint64_t *)(a1 + 40), (unint64_t *)(a1 + 80));
      v13 = a1 + 120;
      if (a1 + 120 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    v16 = *(_QWORD *)v13;
    if (*(_QWORD *)v13 < *v12)
    {
      v43 = *(_OWORD *)(v13 + 8);
      v44 = *(_OWORD *)(v13 + 24);
      v17 = v14;
      while (1)
      {
        v18 = a1 + v17;
        v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(_QWORD *)(v18 + 152) = *(_QWORD *)(a1 + v17 + 112);
        if (v17 == -80)
          break;
        v17 -= 40;
        if (v16 >= *(_QWORD *)(v18 + 40))
        {
          v20 = a1 + v17 + 120;
          goto LABEL_13;
        }
      }
      v20 = a1;
LABEL_13:
      *(_QWORD *)v20 = v16;
      *(_OWORD *)(v20 + 8) = v43;
      *(_OWORD *)(v20 + 24) = v44;
      if (++v15 == 8)
        return v13 + 40 == a2;
    }
    v12 = (_QWORD *)v13;
    v14 += 40;
    v13 += 40;
    if (v13 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>((__int128 *)a1, (unint64_t *)a2, (unint64_t *)a3);
  if (*(_QWORD *)a4 < *(_QWORD *)a3)
  {
    result = *(__n128 *)a3;
    v9 = *(_OWORD *)(a3 + 16);
    v10 = *(_QWORD *)(a3 + 32);
    v11 = *(_QWORD *)(a4 + 32);
    v12 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)(a3 + 16) = v12;
    *(_QWORD *)(a3 + 32) = v11;
    *(_QWORD *)(a4 + 32) = v10;
    *(__n128 *)a4 = result;
    *(_OWORD *)(a4 + 16) = v9;
    if (*(_QWORD *)a3 < *(_QWORD *)a2)
    {
      result = *(__n128 *)a2;
      v13 = *(_OWORD *)(a2 + 16);
      v14 = *(_QWORD *)(a2 + 32);
      v15 = *(_QWORD *)(a3 + 32);
      v16 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 16) = v16;
      *(_QWORD *)(a2 + 32) = v15;
      *(_QWORD *)(a3 + 32) = v14;
      *(__n128 *)a3 = result;
      *(_OWORD *)(a3 + 16) = v13;
      if (*(_QWORD *)a2 < *(_QWORD *)a1)
      {
        result = *(__n128 *)a1;
        v17 = *(_OWORD *)(a1 + 16);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a2 + 32);
        v20 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v20;
        *(_QWORD *)(a1 + 32) = v19;
        *(_QWORD *)(a2 + 32) = v18;
        *(__n128 *)a2 = result;
        *(_OWORD *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

_QWORD *std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<mapped_memory_core_file_dumped_region_info_t>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B4188E54(_Unwind_Exception *exception_object)
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

char *std::vector<mapped_memory_core_file_dumped_region_info_t>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppDyldSplitSharedCacheMemory::CacheMemoryAndPath>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t *std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *> *,long>>>(a1, *(unsigned int **)a2, (unsigned int *)(a2 + 8));
  return a1;
}

void sub_1B4188EFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *> *,long>>>(uint64_t *result, unsigned int *a2, unsigned int *a3)
{
  unsigned int *v4;
  uint64_t **v5;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>(v5, v6, v4 + 8, v4 + 8);
      v7 = (unsigned int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(unsigned int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (unsigned int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>(uint64_t **a1, uint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__find_equal<unsigned int>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__construct_node<std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__find_equal<unsigned int>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  unsigned int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__construct_node<std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  void *v6;
  uint64_t *result;

  v5 = a1 + 8;
  v6 = operator new(0x48uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *a2;
  *((_DWORD *)v6 + 10) = a2[2];
  result = std::map<int,std::vector<unsigned char>>::map[abi:ne180100]((uint64_t *)v6 + 6, (uint64_t)(a2 + 4));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1B4189234(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 24) = 0;
  std::__optional_storage_base<CSCppCoreFileRegionsTree,false>::__construct_from[abi:ne180100]<std::__optional_copy_base<CSCppCoreFileRegionsTree,false> const&>((_QWORD *)a1, a2);
  return a1;
}

void sub_1B4189284(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  if (*(_BYTE *)(v10 + 24))
  {
    a10 = v10;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::__optional_storage_base<CSCppCoreFileRegionsTree,false>::__construct_from[abi:ne180100]<std::__optional_copy_base<CSCppCoreFileRegionsTree,false> const&>(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (*(_BYTE *)(a2 + 24))
  {
    v2 = result;
    *result = 0;
    result[1] = 0;
    result[2] = 0;
    result = std::vector<CSCppCoreFileRegionInfo>::__init_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>(result, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5));
    *((_BYTE *)v2 + 24) = 1;
  }
  return result;
}

CSCppCoreFileTaskCrashinfo *std::__optional_copy_base<CSCppCoreFileTaskCrashinfo,false>::__optional_copy_base[abi:ne180100](CSCppCoreFileTaskCrashinfo *this, const CSCppCoreFileTaskCrashinfo *a2)
{
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 440) = 0;
  if (*((_BYTE *)a2 + 440))
  {
    CSCppCoreFileTaskCrashinfo::CSCppCoreFileTaskCrashinfo(this, a2);
    *((_BYTE *)this + 440) = 1;
  }
  return this;
}

void sub_1B4189340(_Unwind_Exception *exception_object)
{
  CSCppCoreFileTaskCrashinfo *v1;

  if (*((_BYTE *)v1 + 440))
    CSCppCoreFileTaskCrashinfo::~CSCppCoreFileTaskCrashinfo(v1);
  _Unwind_Resume(exception_object);
}

void CSCppCoreFileTaskCrashinfo::CSCppCoreFileTaskCrashinfo(CSCppCoreFileTaskCrashinfo *this, const CSCppCoreFileTaskCrashinfo *a2)
{
  std::string *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)this, (__int128 *)a2);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)((char *)v4 + 32), (__int128 *)a2 + 2);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)((char *)this + 64), (__int128 *)a2 + 4);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)this + 4, (__int128 *)a2 + 6);
  *((_OWORD *)this + 8) = *((_OWORD *)a2 + 8);
  v5 = *((_OWORD *)a2 + 9);
  v6 = *((_OWORD *)a2 + 10);
  v7 = *((_OWORD *)a2 + 11);
  *(_OWORD *)((char *)this + 188) = *(_OWORD *)((char *)a2 + 188);
  *((_OWORD *)this + 10) = v6;
  *((_OWORD *)this + 11) = v7;
  *((_OWORD *)this + 9) = v5;
  std::__optional_copy_base<std::vector<unsigned long long>,false>::__optional_copy_base[abi:ne180100]((uint64_t)this + 208, (uint64_t)a2 + 208);
  std::__optional_copy_base<std::vector<CS_vm_object_query_data_t>,false>::__optional_copy_base[abi:ne180100]((uint64_t)this + 240, (uint64_t)a2 + 240);
  v8 = *((_OWORD *)a2 + 17);
  v9 = *((_OWORD *)a2 + 19);
  *((_OWORD *)this + 18) = *((_OWORD *)a2 + 18);
  *((_OWORD *)this + 19) = v9;
  *((_OWORD *)this + 17) = v8;
  v10 = *((_OWORD *)a2 + 20);
  v11 = *((_OWORD *)a2 + 21);
  v12 = *((_OWORD *)a2 + 23);
  *((_OWORD *)this + 22) = *((_OWORD *)a2 + 22);
  *((_OWORD *)this + 23) = v12;
  *((_OWORD *)this + 20) = v10;
  *((_OWORD *)this + 21) = v11;
  v13 = *((_OWORD *)a2 + 24);
  v14 = *((_OWORD *)a2 + 25);
  v15 = *((_OWORD *)a2 + 26);
  *((_QWORD *)this + 54) = *((_QWORD *)a2 + 54);
  *((_OWORD *)this + 25) = v14;
  *((_OWORD *)this + 26) = v15;
  *((_OWORD *)this + 24) = v13;
}

void sub_1B4189438(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void *v7;

  if (*(_BYTE *)(v1 + 232))
  {
    v7 = *v5;
    if (*v5)
    {
      *(_QWORD *)(v1 + 216) = v7;
      operator delete(v7);
    }
  }
  if (*(_BYTE *)(v1 + 120) && *(char *)(v1 + 119) < 0)
    operator delete(*v4);
  if (*(_BYTE *)(v1 + 88) && *(char *)(v1 + 87) < 0)
    operator delete(*v3);
  if (*(_BYTE *)(v1 + 56) && *(char *)(v1 + 55) < 0)
    operator delete(*v2);
  if (*(_BYTE *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *CSCppCoreFileDarwinMetadata::CSCppCoreFileDarwinMetadata(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const CSCppCoreFileTaskCrashinfo *a9)
{
  _BYTE v17[32];
  uint64_t v18[3];
  void *__p;
  void *v20;
  uint64_t v21;
  void **v22;

  __p = 0;
  v20 = 0;
  v21 = 0;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>(&__p, *(const void **)a3, *(_QWORD *)(a3 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3));
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v18, a5);
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]((uint64_t)v17, a6);
  CSCppCoreFileMetadata::CSCppCoreFileMetadata((uint64_t)a1, a2, (uint64_t)&__p, a4, (uint64_t)v18, a7, a8, (uint64_t)v17);
  if (v17[24])
  {
    v22 = (void **)v17;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v22);
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)v18, (_QWORD *)v18[1]);
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  *a1 = &off_1E67792E8;
  std::__optional_copy_base<CSCppCoreFileTaskCrashinfo,false>::__optional_copy_base[abi:ne180100]((CSCppCoreFileTaskCrashinfo *)(a1 + 15), a9);
  return a1;
}

void sub_1B41895EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  CSCppCoreFileMetadata *v21;

  CSCppCoreFileMetadata::~CSCppCoreFileMetadata(v21);
  _Unwind_Resume(a1);
}

uint64_t CSCppCoreFileMetadata::CSCppCoreFileMetadata(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_QWORD *)a1 = off_1E6779178;
  *(_DWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>((_QWORD *)(a1 + 16), *(const void **)a3, *(_QWORD *)(a3 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3));
  *(_QWORD *)(a1 + 40) = a4;
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100]((uint64_t *)(a1 + 48), a5);
  *(_QWORD *)(a1 + 72) = a6;
  *(_QWORD *)(a1 + 80) = a7;
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100](a1 + 88, a8);
  return a1;
}

void sub_1B41896FC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;
  void *v5;

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy(v3, *(_QWORD **)(v1 + 56));
  v5 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

void std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::~__func()
{
  JUMPOUT(0x1B5E36940);
}

_QWORD *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E677A550;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E677A550;
  a2[1] = v2;
  return result;
}

unsigned int *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  return CSRelease(**(unsigned int ***)(a1 + 8), *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - *a1) >> 5);
    if ((unint64_t)(v9 + 1) > 0x124924924924924)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v10 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5 - *a1) >> 5);
    v11 = 2 * v10;
    if (2 * v10 <= v9 + 1)
      v11 = v9 + 1;
    if (v10 >= 0x92492492492492)
      v12 = 0x124924924924924;
    else
      v12 = v11;
    v18 = v4;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>>(v4, v12);
    else
      v13 = 0;
    v14 = v13;
    v15 = &v13[224 * v9];
    v17 = &v13[224 * v12];
    std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>((uint64_t)v15, a2);
    v16 = v15 + 224;
    std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer(a1, &v14);
    v8 = a1[1];
    std::__split_buffer<CSCppCoreFileRegionInfo>::~__split_buffer((uint64_t)&v14);
  }
  else
  {
    std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(*(_QWORD *)(v4 - 8), a2);
    v8 = v7 + 224;
    a1[1] = v7 + 224;
  }
  a1[1] = v8;
}

void sub_1B418990C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<CSCppCoreFileRegionInfo>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void set_up_mapped_memory_cache_for_exclave_core_file<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long long,vas_segmentinfo_table const&,CSExclaveCoreFileType,mapped_memory_t *)::{lambda(unsigned long long)#1}::operator()(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  __int16 v11;
  void *__p[2];
  uint64_t v13;
  __int16 v14;
  void *v15[2];
  uint64_t v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  _BYTE v24[15];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  void *v32;
  char v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  _BYTE v41[24];
  void **v42;

  v2 = *(_QWORD *)(a1 + 40);
  v10 = a2 - v2;
  if (a2 > v2)
  {
    v4 = a2 - v2;
    do
    {
      v5 = *(uint64_t **)(a1 + 48);
      if (v4 >= 0x6400000)
        v6 = 104857600;
      else
        v6 = v4;
      *(_QWORD *)&v17 = v2;
      *((_QWORD *)&v17 + 1) = v6;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v7 = *(unsigned __int8 *)(a1 + 25);
      v18 = 1;
      v22 = v7;
      v23 = 0;
      memset(v24, 0, sizeof(v24));
      v25 = 3;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v8 = *(_DWORD *)(a1 + 28);
      v30 = 3;
      v31 = v8;
      LOBYTE(v32) = 0;
      v34 = 0;
      v9 = v6 >> 14;
      v14 = 0;
      std::vector<unsigned short>::vector(v15, v6 >> 14, &v14);
      v35 = *(_OWORD *)v15;
      v36 = v16;
      v15[1] = 0;
      v16 = 0;
      v15[0] = 0;
      v37 = 1;
      v11 = 0;
      std::vector<unsigned short>::vector(__p, v9, &v11);
      v38 = *(_OWORD *)__p;
      v39 = v13;
      __p[1] = 0;
      v13 = 0;
      __p[0] = 0;
      v40 = 1;
      memset(v41, 0, sizeof(v41));
      std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](v5, &v17);
      v42 = (void **)v41;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v42);
      if (v40 && (_QWORD)v38)
      {
        *((_QWORD *)&v38 + 1) = v38;
        operator delete((void *)v38);
      }
      if (v37 && (_QWORD)v35)
      {
        *((_QWORD *)&v35 + 1) = v35;
        operator delete((void *)v35);
      }
      if (v34 && v33 < 0)
        operator delete(v32);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v15[0])
      {
        v15[1] = v15[0];
        operator delete(v15[0]);
      }
      v2 += 104857600;
      v4 -= 104857600;
    }
    while (v2 < v10 + *(_QWORD *)(a1 + 40));
  }
}

void sub_1B4189AF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;
  void *v43;

  if (a41)
  {
    v43 = *(void **)(v41 + 136);
    if (v43)
    {
      *(_QWORD *)(v41 + 144) = v43;
      operator delete(v43);
    }
  }
  if (__p)
    operator delete(__p);
  if (a37)
  {
    if (a36 < 0)
      operator delete(*(void **)(v41 + 104));
  }
  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<CSCppCoreFileExclavesMetadata,int const&,std::vector<mapped_memory_core_file_dumped_region_info_t> const&,_CSArchitecture const&,std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&,std::optional<unsigned long long> const&,CSCppCoreFileRegionsTree,CSExclaveCoreFileType const&,long long &>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, __int128 *a6@<X5>, int *a7@<X6>, uint64_t *a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  uint64_t v25[3];
  void *__p;
  void *v27;
  uint64_t v28;
  void **v29;

  v18 = operator new();
  LODWORD(a1) = *a1;
  v27 = 0;
  v28 = 0;
  __p = 0;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v19 = *a3;
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v25, a4);
  v20 = *a5;
  v21 = a5[1];
  v22 = *a6;
  v23 = *((_QWORD *)a6 + 2);
  *((_QWORD *)a6 + 1) = 0;
  *((_QWORD *)a6 + 2) = 0;
  *(_QWORD *)a6 = 0;
  v24 = 1;
  CSCppCoreFileExclavesMetadata::CSCppCoreFileExclavesMetadata(v18, (int)a1, (uint64_t)&__p, v19, (uint64_t)v25, v20, v21, (uint64_t)&v22, *a7, *a8);
  *a9 = v18;
  if (v24)
  {
    v29 = (void **)&v22;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v29);
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)v25, (_QWORD *)v25[1]);
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
}

void sub_1B4189CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, _QWORD *a17, uint64_t a18, void *__p, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;

  if (a14)
  {
    *(_QWORD *)(v21 - 88) = &a11;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 88));
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)&a16, a17);
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  MEMORY[0x1B5E36940](v20, 0x10A3C40ADEFD0ABLL);
  _Unwind_Resume(a1);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(uint64_t a1, __n128 *a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __n128 *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  unint64_t v30;
  __int128 v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 *v35;
  unint64_t v36;
  __int128 v37;
  __int128 *v38;
  __int128 *v39;
  __int128 *v40;
  __n128 *v41;
  unint64_t v42;
  __n128 v43;
  __n128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __n128 *v52;
  BOOL v54;
  uint64_t v55;
  unint64_t v56;
  __n128 *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  BOOL v69;
  unint64_t v70;
  unint64_t v71;
  _OWORD *v72;
  __int128 v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _OWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __n128 v84;
  uint64_t v85;
  unint64_t v86;
  _OWORD *v87;
  unint64_t v88;
  _OWORD *v89;
  __int128 v90;
  uint64_t v92;
  unint64_t v93;
  __n128 v94;
  unint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __n128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __n128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  __n128 v119;
  unint64_t v120;

__int128 *_ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_(__int128 *result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = *a2;
  v4 = *a3;
  if (*a2 >= *(_QWORD *)result)
  {
    if (v4 < v3)
    {
      v9 = *(_OWORD *)a2;
      v8 = *((_OWORD *)a2 + 1);
      v10 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v10;
      *(_OWORD *)a3 = v9;
      *((_OWORD *)a3 + 1) = v8;
      if (*a2 < *(_QWORD *)result)
      {
        v12 = *result;
        v11 = result[1];
        v13 = *((_OWORD *)a2 + 1);
        *result = *(_OWORD *)a2;
        result[1] = v13;
        *(_OWORD *)a2 = v12;
        *((_OWORD *)a2 + 1) = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      v15 = *result;
      v14 = result[1];
      v16 = *((_OWORD *)a2 + 1);
      *result = *(_OWORD *)a2;
      result[1] = v16;
      *(_OWORD *)a2 = v15;
      *((_OWORD *)a2 + 1) = v14;
      if (*a3 >= *a2)
        return result;
      v6 = *(_OWORD *)a2;
      v5 = *((_OWORD *)a2 + 1);
      v17 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v17;
    }
    else
    {
      v6 = *result;
      v5 = result[1];
      v7 = *((_OWORD *)a3 + 1);
      *result = *(_OWORD *)a3;
      result[1] = v7;
    }
    *(_OWORD *)a3 = v6;
    *((_OWORD *)a3 + 1) = v5;
  }
  return result;
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;
  unint64_t v23;
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
  uint64_t v37;

  v4 = (a2 - a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = (__int128 *)(a2 - 32);
      if (*(_QWORD *)(a2 - 32) < *(_QWORD *)a1)
      {
        v8 = *(_OWORD *)a1;
        v7 = *(_OWORD *)(a1 + 16);
        v9 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v9;
        *v6 = v8;
        *(_OWORD *)(a2 - 16) = v7;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_((__int128 *)a1, (unint64_t *)(a1 + 32), (unint64_t *)(a2 - 32));
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_(a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a2 - 32));
      return 1;
    case 5:
      v19 = (__int128 *)(a1 + 32);
      v20 = (__int128 *)(a1 + 64);
      v21 = (__int128 *)(a1 + 96);
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_(a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a1 + 96));
      v23 = *(_QWORD *)(a2 - 32);
      v22 = (__int128 *)(a2 - 32);
      if (v23 < *(_QWORD *)(a1 + 96))
      {
        v25 = *v21;
        v24 = *(_OWORD *)(a1 + 112);
        v26 = v22[1];
        *v21 = *v22;
        *(_OWORD *)(a1 + 112) = v26;
        *v22 = v25;
        v22[1] = v24;
        if (*(_QWORD *)v21 < *(_QWORD *)v20)
        {
          v28 = *v20;
          v27 = *(_OWORD *)(a1 + 80);
          v29 = *(_OWORD *)(a1 + 112);
          *v20 = *v21;
          *(_OWORD *)(a1 + 80) = v29;
          *v21 = v28;
          *(_OWORD *)(a1 + 112) = v27;
          if (*(_QWORD *)v20 < *(_QWORD *)v19)
          {
            v31 = *v19;
            v30 = *(_OWORD *)(a1 + 48);
            v32 = *(_OWORD *)(a1 + 80);
            *v19 = *v20;
            *(_OWORD *)(a1 + 48) = v32;
            *v20 = v31;
            *(_OWORD *)(a1 + 80) = v30;
            if (*(_QWORD *)(a1 + 32) < *(_QWORD *)a1)
            {
              v34 = *(_OWORD *)a1;
              v33 = *(_OWORD *)(a1 + 16);
              v35 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v35;
              *v19 = v34;
              *(_OWORD *)(a1 + 48) = v33;
            }
          }
        }
      }
      return 1;
    default:
      v10 = (_QWORD *)(a1 + 64);
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_((__int128 *)a1, (unint64_t *)(a1 + 32), (unint64_t *)(a1 + 64));
      v11 = a1 + 96;
      if (a1 + 96 == a2)
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
      v36 = *(_OWORD *)(v11 + 8);
      v37 = *(_QWORD *)(v11 + 24);
      v15 = v12;
      while (1)
      {
        v16 = a1 + v15;
        v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64)
          break;
        v15 -= 32;
        if (v14 >= *(_QWORD *)(v16 + 32))
        {
          v18 = a1 + v15 + 96;
          goto LABEL_13;
        }
      }
      v18 = a1;
LABEL_13:
      *(_QWORD *)v18 = v14;
      *(_OWORD *)(v18 + 8) = v36;
      *(_QWORD *)(v18 + 24) = v37;
      if (++v13 == 8)
        return v11 + 32 == a2;
    }
    v10 = (_QWORD *)v11;
    v12 += 32;
    v11 += 32;
    if (v11 == a2)
      return 1;
  }
}

__n128 _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4)
{
  __n128 result;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __int128 v13;
  __n128 v14;

  _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_((__int128 *)a1, a2->n128_u64, a3->n128_u64);
  if (a4->n128_u64[0] < a3->n128_u64[0])
  {
    v9 = *a3;
    result = a3[1];
    v10 = a4[1];
    *a3 = *a4;
    a3[1] = v10;
    *a4 = v9;
    a4[1] = result;
    if (a3->n128_u64[0] < a2->n128_u64[0])
    {
      v11 = *a2;
      result = a2[1];
      v12 = a3[1];
      *a2 = *a3;
      a2[1] = v12;
      *a3 = v11;
      a3[1] = result;
      if (a2->n128_u64[0] < *(_QWORD *)a1)
      {
        v13 = *(_OWORD *)a1;
        result = *(__n128 *)(a1 + 16);
        v14 = a2[1];
        *(__n128 *)a1 = *a2;
        *(__n128 *)(a1 + 16) = v14;
        *a2 = (__n128)v13;
        a2[1] = result;
      }
    }
  }
  return result;
}

uint64_t *std::__tree<unsigned long,std::greater<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

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
        v9 = v5[4];
        if (v7 <= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 <= v7)
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
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

_QWORD *std::vector<unsigned short>::vector(_QWORD *a1, uint64_t a2, _WORD *a3)
{
  _WORD *v6;
  _WORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned short>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_WORD *)a1[1];
    v7 = &v6[a2];
    v8 = 2 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 2;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1B418A950(_Unwind_Exception *exception_object)
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

__int128 *std::vector<CSCppCoreFileRegionInfo>::__insert_with_size[abi:ne180100]<std::__wrap_iter<CSCppCoreFileRegionInfo*>,std::__wrap_iter<CSCppCoreFileRegionInfo*>>(uint64_t *a1, __int128 *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  __int128 *v5;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v5 = a2;
  if (a5 >= 1)
  {
    v7 = a3;
    v11 = a1[2];
    v9 = (uint64_t)(a1 + 2);
    v10 = v11;
    v12 = *(_QWORD *)(v9 - 8);
    if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v11 - v12) >> 5) >= a5)
    {
      v20 = v12 - (_QWORD)a2;
      if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v12 - (_QWORD)a2) >> 5) >= a5)
      {
        v21 = &a3[28 * a5];
      }
      else
      {
        v21 = &a3[4 * ((uint64_t)(v12 - (_QWORD)a2) >> 5)];
        a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>(v9, (uint64_t)v21, a4, *(_QWORD *)(v9 - 8));
        if (v20 < 1)
          return v5;
      }
      std::vector<CSCppCoreFileRegionInfo>::__move_range((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[14 * a5]);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>((uint64_t)v26, v7, v21, (uint64_t)v5);
    }
    else
    {
      v13 = *a1;
      v14 = a5 + 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v12 - *a1) >> 5);
      if (v14 > 0x124924924924924)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v15 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a2 - v13) >> 5);
      v16 = 0x6DB6DB6DB6DB6DB7 * ((v10 - v13) >> 5);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x92492492492492)
        v18 = 0x124924924924924;
      else
        v18 = v17;
      v29 = v9;
      if (v18)
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>>(v9, v18);
      else
        v19 = 0;
      v22 = (uint64_t)&v19[224 * v15];
      v26[0] = v19;
      v26[1] = v22;
      v27 = v22;
      v28 = &v19[224 * v18];
      v23 = 224 * a5;
      v24 = v22 + 224 * a5;
      do
      {
        CSCppCoreFileRegionInfo::CSCppCoreFileRegionInfo(v22, (__int128 *)v7);
        v22 += 224;
        v7 += 28;
        v23 -= 224;
      }
      while (v23);
      v27 = v24;
      v5 = (__int128 *)std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer(a1, v26, v5);
      std::__split_buffer<CSCppCoreFileRegionInfo>::~__split_buffer((uint64_t)v26);
    }
  }
  return v5;
}

void sub_1B418AB4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<CSCppCoreFileRegionInfo>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v10;
  char v12;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = v6;
  if (v7 < a3)
  {
    v10 = (__int128 *)(a2 + v6 - a4);
    v8 = *(_QWORD *)(a1 + 8);
    do
    {
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v8, v10);
      v10 += 14;
      v8 += 224;
    }
    while ((unint64_t)v10 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>((uint64_t)&v12, a2, v7, v6);
}

uint64_t std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2, __int128 *a3)
{
  __int128 *v3;
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v6 = a2[1];
  v7 = (__int128 *)*a1;
  v8 = v6;
  if ((__int128 *)*a1 != a3)
  {
    v9 = a3;
    v8 = a2[1];
    do
    {
      v8 -= 224;
      v9 -= 14;
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v8, v9);
    }
    while (v9 != v7);
  }
  a2[1] = v8;
  v10 = (__int128 *)a1[1];
  v11 = a2[2];
  if (v10 != v3)
  {
    do
    {
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v11, v3);
      v3 += 14;
      v11 += 224;
    }
    while (v3 != v10);
    v8 = a2[1];
  }
  a2[2] = v11;
  v12 = *a1;
  *a1 = v8;
  a2[1] = v12;
  v13 = a1[1];
  a1[1] = a2[2];
  a2[2] = v13;
  v14 = a1[2];
  a1[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return v6;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 != a2)
  {
    v7 = 0;
    do
    {
      v8 = a4 + v7;
      v9 = *(_OWORD *)(a3 + v7 - 224);
      v10 = *(_OWORD *)(a3 + v7 - 192);
      *(_OWORD *)(v8 - 208) = *(_OWORD *)(a3 + v7 - 208);
      *(_OWORD *)(v8 - 192) = v10;
      *(_OWORD *)(v8 - 224) = v9;
      v11 = *(_OWORD *)(a3 + v7 - 176);
      v12 = *(_OWORD *)(a3 + v7 - 160);
      v13 = *(_OWORD *)(a3 + v7 - 144);
      *(_QWORD *)(v8 - 128) = *(_QWORD *)(a3 + v7 - 128);
      *(_OWORD *)(v8 - 160) = v12;
      *(_OWORD *)(v8 - 144) = v13;
      *(_OWORD *)(v8 - 176) = v11;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(a4 + v7 - 120, (__n128 *)(a3 + v7 - 120));
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>(a4 + v7 - 88, (__n128 *)(a3 + v7 - 88));
      v14 = a4 + v7;
      v15 = a3 + v7;
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>(a4 + v7 - 56, (__n128 *)(a3 + v7 - 56));
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a4 + v7 - 24));
      *(_OWORD *)(v14 - 24) = *(_OWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v14 - 8) = *(_QWORD *)(a3 + v7 - 8);
      *(_QWORD *)(v15 - 24) = 0;
      *(_QWORD *)(v15 - 16) = 0;
      *(_QWORD *)(v15 - 8) = 0;
      v7 -= 224;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

uint64_t *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a2 == a3)
    return a2;
  v5 = a3;
  v6 = a2 + 26;
  do
  {
    v7 = v6 - 26;
    v8 = *((_OWORD *)v6 - 13);
    v9 = *((_OWORD *)v6 - 11);
    *(_OWORD *)(a4 + 16) = *((_OWORD *)v6 - 12);
    *(_OWORD *)(a4 + 32) = v9;
    *(_OWORD *)a4 = v8;
    v10 = *((_OWORD *)v6 - 10);
    v11 = *((_OWORD *)v6 - 9);
    v12 = *((_OWORD *)v6 - 8);
    *(_QWORD *)(a4 + 96) = *(v6 - 14);
    *(_OWORD *)(a4 + 64) = v11;
    *(_OWORD *)(a4 + 80) = v12;
    *(_OWORD *)(a4 + 48) = v10;
    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>((std::string *)(a4 + 104), (const std::string *)(v6 - 13));
    std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>(a4 + 136, (uint64_t)(v6 - 9));
    std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>(a4 + 168, (uint64_t)(v6 - 5));
    if ((uint64_t *)a4 != v6 - 26)
      std::vector<CSCppCoreFileRegionInfo>::__assign_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>((uint64_t *)(a4 + 200), *(v6 - 1), *v6, 0x6DB6DB6DB6DB6DB7 * ((*v6 - *(v6 - 1)) >> 5));
    a4 += 224;
    v6 += 28;
  }
  while (v7 + 28 != v5);
  return v5;
}

void std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>(std::string *this, const std::string *a2)
{
  __int128 v3;

  if (this[1].__r_.__value_.__s.__data_[0] == a2[1].__r_.__value_.__s.__data_[0])
  {
    if (this[1].__r_.__value_.__s.__data_[0])
      std::string::operator=(this, a2);
  }
  else if (this[1].__r_.__value_.__s.__data_[0])
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      operator delete(this->__r_.__value_.__l.__data_);
    this[1].__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(this, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }
    else
    {
      v3 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      this->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
}

void std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
  {
    if (a1 != a2)
    {
      if (*(_BYTE *)(a1 + 24))
        std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>((char *)a1, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 1);
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v3;
      operator delete(v3);
    }
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((_QWORD *)a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 1);
    *(_BYTE *)(a1 + 24) = 1;
  }
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(_QWORD *)result) >> 1)
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
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    if (v8 <= a4)
      v10 = a4;
    else
      v10 = v8;
    if (v8 >= 0x7FFFFFFFFFFFFFFELL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_17:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 1;
  if (v15 >= a4)
    goto LABEL_17;
  v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_19:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *v12 = &v9[v17];
  return result;
}

void std::vector<CSCppCoreFileRegionInfo>::__assign_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  v8 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 5) < a4)
  {
    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(a1);
    if (a4 > 0x124924924924924)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v9 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 5);
    if (v9 <= a4)
      v9 = a4;
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 5)) >= 0x92492492492492)
      v10 = 0x124924924924924;
    else
      v10 = v9;
    std::vector<CSCppCoreFileRegionInfo>::__vallocate[abi:ne180100](a1, v10);
    v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>(v8, a2, a3, a1[1]);
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 5) < a4)
  {
    v12 = a2 + 32 * ((a1[1] - *a1) >> 5);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>(&v14, a2, v12);
    v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>(v8, v12, a3, a1[1]);
LABEL_11:
    a1[1] = v11;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>(&v15, a2, a3);
  std::vector<CSCppCoreFileRegionInfo>::__base_destruct_at_end[abi:ne180100]((uint64_t)a1, v13);
}

void sub_1B418B260(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1B418B268(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 *v22;
  unint64_t v23;
  unint64_t v24;
  __int128 *v25;
  unint64_t v26;
  unint64_t v27;
  __int128 *v28;
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
  BOOL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __n128 v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __int128 *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 *v64;
  __int128 *v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __n128 *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t *v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  __int128 *v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unint64_t v103;
  __n128 v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  __int128 *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  unint64_t v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __n128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __n128 *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __n128 v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  BOOL v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __n128 *v183;
  unint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  unint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __n128 *v194;
  __int128 *v195;
  __int128 *v196;
  __int128 *v197;
  int64_t v198;
  int64_t v200;
  __int128 *v201;
  __int128 *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  __n128 v210;
  uint64_t v211;
  char v212;
  __n128 v213;
  uint64_t v214;
  char v215;
  __n128 v216;
  uint64_t v217;
  char v218;
  __int128 v219;
  uint64_t v220;
  void **v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint64_t v228;
  __n128 v229;
  uint64_t v230;
  char v231;
  __n128 v232;
  uint64_t v233;
  char v234;
  __n128 __p;
  uint64_t v236;
  char v237;
  __int128 v238;
  uint64_t v239;

void _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(__int128 *a1, __int128 *a2, __int128 *a3)
{
  __int128 *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 *v8;

  v5 = a1;
  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)a3;
  if (*(_QWORD *)a2 < *(_QWORD *)a1)
  {
    if (v7 >= v6)
    {
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, a2);
      if (*(_QWORD *)a3 >= *(_QWORD *)a2)
        return;
      a1 = a2;
    }
    v8 = a3;
    goto LABEL_9;
  }
  if (v7 < v6)
  {
    std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a2, a3);
    if (*(_QWORD *)a2 < *(_QWORD *)v5)
    {
      a1 = v5;
      v8 = a2;
LABEL_9:
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, v8);
    }
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char v36;
  __n128 v37;
  uint64_t v38;
  char v39;
  __n128 __p;
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  void **v45;

  v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 5);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*((_QWORD *)a2 - 28) < *(_QWORD *)a1)
      {
        v6 = a1;
        v7 = a2 - 14;
        goto LABEL_4;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a2 - 14);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a2 - 14);
      return 1;
    case 5:
      v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a1 + 42);
      v26 = *((_QWORD *)a2 - 28);
      v25 = a2 - 14;
      if (v26 < *((_QWORD *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((_QWORD *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((_QWORD *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((_QWORD *)a1 + 28) < *(_QWORD *)a1)
            {
              v6 = a1;
              v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }
      return 1;
    default:
      v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a1 + 28);
      v9 = a1 + 42;
      result = 1;
      if (a1 + 42 == a2)
        return result;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*(_QWORD *)v9 < *(_QWORD *)v8)
    {
      v31 = v9[4];
      v32 = v9[5];
      v33 = *((_QWORD *)v9 + 12);
      v27 = *v9;
      v28 = v9[1];
      v29 = v9[2];
      v30 = v9[3];
      v34.n128_u8[0] = 0;
      v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        v34 = *(__n128 *)((char *)v9 + 104);
        v35 = *((_QWORD *)v9 + 15);
        *((_QWORD *)v9 + 14) = 0;
        *((_QWORD *)v9 + 15) = 0;
        *((_QWORD *)v9 + 13) = 0;
        v36 = 1;
      }
      v37.n128_u8[0] = 0;
      v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        v37 = *(__n128 *)((char *)v9 + 136);
        v38 = *((_QWORD *)v9 + 19);
        *((_QWORD *)v9 + 18) = 0;
        *((_QWORD *)v9 + 19) = 0;
        *((_QWORD *)v9 + 17) = 0;
        v39 = 1;
      }
      __p.n128_u8[0] = 0;
      v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __p = *(__n128 *)((char *)v9 + 168);
        v41 = *((_QWORD *)v9 + 23);
        *((_QWORD *)v9 + 22) = 0;
        *((_QWORD *)v9 + 23) = 0;
        *((_QWORD *)v9 + 21) = 0;
        v42 = 1;
      }
      v43 = *(__int128 *)((char *)v9 + 200);
      v44 = *((_QWORD *)v9 + 27);
      *((_QWORD *)v9 + 26) = 0;
      *((_QWORD *)v9 + 27) = 0;
      *((_QWORD *)v9 + 25) = 0;
      v12 = v10;
      while (1)
      {
        v13 = v12;
        v14 = (char *)a1 + v12;
        v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((_QWORD *)v14 + 96) = *(_QWORD *)((char *)a1 + v12 + 544);
        v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a1 + v12 + 776, (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v14 + 808), (__n128 *)(v14 + 584));
        v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + v13 + 840, (__n128 *)((char *)a1 + v13 + 616));
        v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((_QWORD *)v18 + 111) = *((_QWORD *)v18 + 83);
        *((_QWORD *)v18 + 83) = 0;
        *v19 = 0u;
        if (v13 == -448)
          break;
        v12 = v13 - 224;
        if ((unint64_t)v27 >= *(_QWORD *)((char *)a1 + v13 + 224))
        {
          v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }
      v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(_QWORD *)(v20 + 96) = v33;
      *(_OWORD *)v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)(v21 + 69), &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 73), &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 77), &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      v22 = *((_QWORD *)&v43 + 1);
      v21[81] = v43;
      v23 = v44;
      *(_QWORD *)(v20 + 208) = v22;
      *(_QWORD *)(v20 + 216) = v23;
      v44 = 0;
      v43 = 0uLL;
      v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }
      if (v36 && SHIBYTE(v35) < 0)
        operator delete((void *)v34.n128_u64[0]);
      if (++v11 == 8)
        return v9 + 14 == a2;
    }
    v8 = v9;
    v10 += 224;
    v9 += 14;
    if (v9 == a2)
      return 1;
  }
}

void std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(__int128 *a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  char v18;
  __n128 v19;
  uint64_t v20;
  char v21;
  __n128 __p;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  void **v27;

  v13 = a1[4];
  v14 = a1[5];
  v15 = *((_QWORD *)a1 + 12);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v16.n128_u8[0] = 0;
  v18 = 0;
  if (*((_BYTE *)a1 + 128))
  {
    v16 = *(__n128 *)((char *)a1 + 104);
    v17 = *((_QWORD *)a1 + 15);
    *((_QWORD *)a1 + 14) = 0;
    *((_QWORD *)a1 + 15) = 0;
    *((_QWORD *)a1 + 13) = 0;
    v18 = 1;
  }
  v19.n128_u8[0] = 0;
  v21 = 0;
  if (*((_BYTE *)a1 + 160))
  {
    v19 = *(__n128 *)((char *)a1 + 136);
    v20 = *((_QWORD *)a1 + 19);
    *((_QWORD *)a1 + 18) = 0;
    *((_QWORD *)a1 + 19) = 0;
    *((_QWORD *)a1 + 17) = 0;
    v21 = 1;
  }
  __p.n128_u8[0] = 0;
  v24 = 0;
  if (*((_BYTE *)a1 + 192))
  {
    __p = *(__n128 *)((char *)a1 + 168);
    v23 = *((_QWORD *)a1 + 23);
    *((_QWORD *)a1 + 22) = 0;
    *((_QWORD *)a1 + 23) = 0;
    *((_QWORD *)a1 + 21) = 0;
    v24 = 1;
  }
  v25 = *(__int128 *)((char *)a1 + 200);
  v26 = *((_QWORD *)a1 + 27);
  *((_QWORD *)a1 + 26) = 0;
  *((_QWORD *)a1 + 27) = 0;
  *((_QWORD *)a1 + 25) = 0;
  v5 = a2[4];
  v4 = a2[5];
  v6 = a2[3];
  *((_QWORD *)a1 + 12) = *((_QWORD *)a2 + 12);
  a1[4] = v5;
  a1[5] = v4;
  a1[3] = v6;
  v7 = *a2;
  v8 = a2[2];
  a1[1] = a2[1];
  a1[2] = v8;
  *a1 = v7;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a1 + 104, (__n128 *)((char *)a2 + 104));
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + 136, (__n128 *)((char *)a2 + 136));
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + 168, (__n128 *)((char *)a2 + 168));
  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)a1 + 25);
  *(__int128 *)((char *)a1 + 200) = *(__int128 *)((char *)a2 + 200);
  *((_QWORD *)a1 + 27) = *((_QWORD *)a2 + 27);
  *((_QWORD *)a2 + 25) = 0;
  *((_QWORD *)a2 + 26) = 0;
  *((_QWORD *)a2 + 27) = 0;
  a2[4] = v13;
  a2[5] = v14;
  *((_QWORD *)a2 + 12) = v15;
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a2 + 104, &v16);
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a2 + 136, &v19);
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a2 + 168, &__p);
  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)a2 + 25);
  *(__int128 *)((char *)a2 + 200) = v25;
  *((_QWORD *)a2 + 27) = v26;
  v26 = 0;
  v25 = 0uLL;
  v27 = (void **)&v25;
  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v27);
  if (v24 && __p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }
  if (v21 && v19.n128_u64[0])
  {
    v19.n128_u64[1] = v19.n128_u64[0];
    operator delete((void *)v19.n128_u64[0]);
  }
  if (v18)
  {
    if (SHIBYTE(v17) < 0)
      operator delete((void *)v16.n128_u64[0]);
  }
}

void _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4)
{
  _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a2, a3);
  if (*(_QWORD *)a4 < *(_QWORD *)a3)
  {
    std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a3, a4);
    if (*(_QWORD *)a3 < *(_QWORD *)a2)
    {
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a2, a3);
      if (*(_QWORD *)a2 < *(_QWORD *)a1)
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, a2);
    }
  }
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 *v22;
  unint64_t v23;
  unint64_t v24;
  __int128 *v25;
  unint64_t v26;
  unint64_t v27;
  __int128 *v28;
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
  BOOL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __n128 v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __int128 *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 *v64;
  __int128 *v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __n128 *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t *v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  __int128 *v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unint64_t v103;
  __n128 v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  __int128 *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  unint64_t v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __n128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __n128 *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __n128 v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  BOOL v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __n128 *v183;
  unint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  unint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __n128 *v194;
  __int128 *v195;
  __int128 *v196;
  __int128 *v197;
  int64_t v198;
  int64_t v200;
  __int128 *v201;
  __int128 *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  __n128 v210;
  uint64_t v211;
  char v212;
  __n128 v213;
  uint64_t v214;
  char v215;
  __n128 v216;
  uint64_t v217;
  char v218;
  __int128 v219;
  uint64_t v220;
  void **v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint64_t v228;
  __n128 v229;
  uint64_t v230;
  char v231;
  __n128 v232;
  uint64_t v233;
  char v234;
  __n128 __p;
  uint64_t v236;
  char v237;
  __int128 v238;
  uint64_t v239;

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char v36;
  __n128 v37;
  uint64_t v38;
  char v39;
  __n128 __p;
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  void **v45;

  v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 5);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*((_QWORD *)a2 - 28) < *(_QWORD *)a1)
      {
        v6 = a1;
        v7 = a2 - 14;
        goto LABEL_4;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a2 - 14);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a2 - 14);
      return 1;
    case 5:
      v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a1 + 42);
      v26 = *((_QWORD *)a2 - 28);
      v25 = a2 - 14;
      if (v26 < *((_QWORD *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((_QWORD *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((_QWORD *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((_QWORD *)a1 + 28) < *(_QWORD *)a1)
            {
              v6 = a1;
              v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }
      return 1;
    default:
      v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a1 + 28);
      v9 = a1 + 42;
      result = 1;
      if (a1 + 42 == a2)
        return result;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*(_QWORD *)v9 < *(_QWORD *)v8)
    {
      v31 = v9[4];
      v32 = v9[5];
      v33 = *((_QWORD *)v9 + 12);
      v27 = *v9;
      v28 = v9[1];
      v29 = v9[2];
      v30 = v9[3];
      v34.n128_u8[0] = 0;
      v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        v34 = *(__n128 *)((char *)v9 + 104);
        v35 = *((_QWORD *)v9 + 15);
        *((_QWORD *)v9 + 14) = 0;
        *((_QWORD *)v9 + 15) = 0;
        *((_QWORD *)v9 + 13) = 0;
        v36 = 1;
      }
      v37.n128_u8[0] = 0;
      v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        v37 = *(__n128 *)((char *)v9 + 136);
        v38 = *((_QWORD *)v9 + 19);
        *((_QWORD *)v9 + 18) = 0;
        *((_QWORD *)v9 + 19) = 0;
        *((_QWORD *)v9 + 17) = 0;
        v39 = 1;
      }
      __p.n128_u8[0] = 0;
      v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __p = *(__n128 *)((char *)v9 + 168);
        v41 = *((_QWORD *)v9 + 23);
        *((_QWORD *)v9 + 22) = 0;
        *((_QWORD *)v9 + 23) = 0;
        *((_QWORD *)v9 + 21) = 0;
        v42 = 1;
      }
      v43 = *(__int128 *)((char *)v9 + 200);
      v44 = *((_QWORD *)v9 + 27);
      *((_QWORD *)v9 + 26) = 0;
      *((_QWORD *)v9 + 27) = 0;
      *((_QWORD *)v9 + 25) = 0;
      v12 = v10;
      while (1)
      {
        v13 = v12;
        v14 = (char *)a1 + v12;
        v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((_QWORD *)v14 + 96) = *(_QWORD *)((char *)a1 + v12 + 544);
        v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a1 + v12 + 776, (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v14 + 808), (__n128 *)(v14 + 584));
        v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + v13 + 840, (__n128 *)((char *)a1 + v13 + 616));
        v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((_QWORD *)v18 + 111) = *((_QWORD *)v18 + 83);
        *((_QWORD *)v18 + 83) = 0;
        *v19 = 0u;
        if (v13 == -448)
          break;
        v12 = v13 - 224;
        if ((unint64_t)v27 >= *(_QWORD *)((char *)a1 + v13 + 224))
        {
          v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }
      v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(_QWORD *)(v20 + 96) = v33;
      *(_OWORD *)v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)(v21 + 69), &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 73), &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 77), &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      v22 = *((_QWORD *)&v43 + 1);
      v21[81] = v43;
      v23 = v44;
      *(_QWORD *)(v20 + 208) = v22;
      *(_QWORD *)(v20 + 216) = v23;
      v44 = 0;
      v43 = 0uLL;
      v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }
      if (v36 && SHIBYTE(v35) < 0)
        operator delete((void *)v34.n128_u64[0]);
      if (++v11 == 8)
        return v9 + 14 == a2;
    }
    v8 = v9;
    v10 += 224;
    v9 += 14;
    if (v9 == a2)
      return 1;
  }
}

void std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__move_assign(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)(a1 + 8);
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy(a1, *(_QWORD **)(a1 + 8));
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

uint64_t CSCppCoreFileExclavesMetadata::CSCppCoreFileExclavesMetadata(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  _BYTE v18[32];
  uint64_t v19[3];
  void *__p;
  void *v21;
  uint64_t v22;
  void **v23;

  __p = 0;
  v21 = 0;
  v22 = 0;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>(&__p, *(const void **)a3, *(_QWORD *)(a3 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3));
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v19, a5);
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]((uint64_t)v18, a8);
  CSCppCoreFileMetadata::CSCppCoreFileMetadata(a1, a2, (uint64_t)&__p, a4, (uint64_t)v19, a6, a7, (uint64_t)v18);
  if (v18[24])
  {
    v23 = (void **)v18;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v23);
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)v19, (_QWORD *)v19[1]);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  *(_QWORD *)a1 = &unk_1E6779460;
  *(_DWORD *)(a1 + 120) = a9;
  *(_QWORD *)(a1 + 128) = a10;
  return a1;
}

void sub_1B418EFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, _QWORD *a18, uint64_t a19, void *__p,uint64_t a21)
{
  uint64_t v21;

  if (a13)
  {
    *(_QWORD *)(v21 - 72) = &a10;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 72));
  }
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy((uint64_t)&a15, a18);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*,false>(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 *v47;
  __int128 *v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  BOOL v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  BOOL v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  uint64_t v109;
  unint64_t v110;
  __int128 v111;
  unint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  __int128 *v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 40);
      if (*(_QWORD *)(a2 - 40) < *(_QWORD *)a1)
      {
        v7 = *(_OWORD *)a1;
        v8 = *(_OWORD *)(a1 + 16);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a2 - 8);
        v11 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v11;
        *(_QWORD *)(a1 + 32) = v10;
        *(_QWORD *)(a2 - 8) = v9;
        *v6 = v7;
        *(_OWORD *)(a2 - 24) = v8;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>((__int128 *)a1, (unint64_t *)(a1 + 40), (unint64_t *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      v21 = (_QWORD *)(a1 + 40);
      v22 = (_QWORD *)(a1 + 80);
      v23 = (__int128 *)(a1 + 120);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>(a1, a1 + 40, a1 + 80, a1 + 120);
      v25 = *(_QWORD *)(a2 - 40);
      v24 = a2 - 40;
      if (v25 >= *(_QWORD *)(a1 + 120))
        return 1;
      v26 = *v23;
      v27 = *(_OWORD *)(a1 + 136);
      v28 = *(_QWORD *)(a1 + 152);
      v29 = *(_QWORD *)(v24 + 32);
      v30 = *(_OWORD *)(v24 + 16);
      *v23 = *(_OWORD *)v24;
      *(_OWORD *)(a1 + 136) = v30;
      *(_QWORD *)(a1 + 152) = v29;
      *(_QWORD *)(v24 + 32) = v28;
      *(_OWORD *)v24 = v26;
      *(_OWORD *)(v24 + 16) = v27;
      if (*(_QWORD *)v23 >= *v22)
        return 1;
      v31 = *(_QWORD *)(a1 + 112);
      v33 = *(_OWORD *)v22;
      v32 = *(_OWORD *)(a1 + 96);
      v34 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)v22 = *v23;
      *(_OWORD *)(a1 + 96) = v34;
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 152);
      *v23 = v33;
      *(_OWORD *)(a1 + 136) = v32;
      *(_QWORD *)(a1 + 152) = v31;
      if (*v22 >= *v21)
        return 1;
      v35 = *(_QWORD *)(a1 + 72);
      v37 = *(_OWORD *)v21;
      v36 = *(_OWORD *)(a1 + 56);
      v38 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *(_OWORD *)(a1 + 56) = v38;
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 112);
      *(_OWORD *)v22 = v37;
      *(_OWORD *)(a1 + 96) = v36;
      *(_QWORD *)(a1 + 112) = v35;
      if (*(_QWORD *)(a1 + 40) >= *(_QWORD *)a1)
        return 1;
      v39 = *(_QWORD *)(a1 + 32);
      v41 = *(_OWORD *)a1;
      v40 = *(_OWORD *)(a1 + 16);
      v42 = *(_OWORD *)(a1 + 56);
      *(_OWORD *)a1 = *(_OWORD *)v21;
      *(_OWORD *)(a1 + 16) = v42;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 72);
      *(_OWORD *)v21 = v41;
      *(_OWORD *)(a1 + 56) = v40;
      result = 1;
      *(_QWORD *)(a1 + 72) = v39;
      return result;
    default:
      v12 = (_QWORD *)(a1 + 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>((__int128 *)a1, (unint64_t *)(a1 + 40), (unint64_t *)(a1 + 80));
      v13 = a1 + 120;
      if (a1 + 120 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    v16 = *(_QWORD *)v13;
    if (*(_QWORD *)v13 < *v12)
    {
      v43 = *(_OWORD *)(v13 + 8);
      v44 = *(_OWORD *)(v13 + 24);
      v17 = v14;
      while (1)
      {
        v18 = a1 + v17;
        v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(_QWORD *)(v18 + 152) = *(_QWORD *)(a1 + v17 + 112);
        if (v17 == -80)
          break;
        v17 -= 40;
        if (v16 >= *(_QWORD *)(v18 + 40))
        {
          v20 = a1 + v17 + 120;
          goto LABEL_13;
        }
      }
      v20 = a1;
LABEL_13:
      *(_QWORD *)v20 = v16;
      *(_OWORD *)(v20 + 8) = v43;
      *(_OWORD *)(v20 + 24) = v44;
      if (++v15 == 8)
        return v13 + 40 == a2;
    }
    v12 = (_QWORD *)v13;
    v14 += 40;
    v13 += 40;
    if (v13 == a2)
      return 1;
  }
}

void std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::~__func()
{
  JUMPOUT(0x1B5E36940);
}

_QWORD *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E677A5D0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E677A5D0;
  a2[1] = v2;
  return result;
}

unsigned int *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  return CSRelease(**(unsigned int ***)(a1 + 8), *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void set_up_mapped_memory_cache_for_exclave_core_file<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long long,vas_segmentinfo_table const&,CSExclaveCoreFileType,mapped_memory_t *)::{lambda(unsigned long long)#1}::operator()(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  __int16 v11;
  void *__p[2];
  uint64_t v13;
  __int16 v14;
  void *v15[2];
  uint64_t v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  _BYTE v24[15];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  void *v32;
  char v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  _BYTE v41[24];
  void **v42;

  v2 = *(_QWORD *)(a1 + 40);
  v10 = a2 - v2;
  if (a2 > v2)
  {
    v4 = a2 - v2;
    do
    {
      v5 = *(uint64_t **)(a1 + 48);
      if (v4 >= 0x6400000)
        v6 = 104857600;
      else
        v6 = v4;
      *(_QWORD *)&v17 = v2;
      *((_QWORD *)&v17 + 1) = v6;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v7 = *(unsigned __int8 *)(a1 + 25);
      v18 = 1;
      v22 = v7;
      v23 = 0;
      memset(v24, 0, sizeof(v24));
      v25 = 3;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v8 = *(_DWORD *)(a1 + 28);
      v30 = 3;
      v31 = v8;
      LOBYTE(v32) = 0;
      v34 = 0;
      v9 = v6 >> 14;
      v14 = 0;
      std::vector<unsigned short>::vector(v15, v6 >> 14, &v14);
      v35 = *(_OWORD *)v15;
      v36 = v16;
      v15[1] = 0;
      v16 = 0;
      v15[0] = 0;
      v37 = 1;
      v11 = 0;
      std::vector<unsigned short>::vector(__p, v9, &v11);
      v38 = *(_OWORD *)__p;
      v39 = v13;
      __p[1] = 0;
      v13 = 0;
      __p[0] = 0;
      v40 = 1;
      memset(v41, 0, sizeof(v41));
      std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](v5, &v17);
      v42 = (void **)v41;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v42);
      if (v40 && (_QWORD)v38)
      {
        *((_QWORD *)&v38 + 1) = v38;
        operator delete((void *)v38);
      }
      if (v37 && (_QWORD)v35)
      {
        *((_QWORD *)&v35 + 1) = v35;
        operator delete((void *)v35);
      }
      if (v34 && v33 < 0)
        operator delete(v32);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v15[0])
      {
        v15[1] = v15[0];
        operator delete(v15[0]);
      }
      v2 += 104857600;
      v4 -= 104857600;
    }
    while (v2 < v10 + *(_QWORD *)(a1 + 40));
  }
}

void sub_1B418FE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;
  void *v43;

  if (a41)
  {
    v43 = *(void **)(v41 + 136);
    if (v43)
    {
      *(_QWORD *)(v41 + 144) = v43;
      operator delete(v43);
    }
  }
  if (__p)
    operator delete(__p);
  if (a37)
  {
    if (a36 < 0)
      operator delete(*(void **)(v41 + 104));
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(uint64_t a1, __n128 *a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __n128 *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  unint64_t v30;
  __int128 v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 *v35;
  unint64_t v36;
  __int128 v37;
  __int128 *v38;
  __int128 *v39;
  __int128 *v40;
  __n128 *v41;
  unint64_t v42;
  __n128 v43;
  __n128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __n128 *v52;
  BOOL v54;
  uint64_t v55;
  unint64_t v56;
  __n128 *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  BOOL v69;
  unint64_t v70;
  unint64_t v71;
  _OWORD *v72;
  __int128 v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _OWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __n128 v84;
  uint64_t v85;
  unint64_t v86;
  _OWORD *v87;
  unint64_t v88;
  _OWORD *v89;
  __int128 v90;
  uint64_t v92;
  unint64_t v93;
  __n128 v94;
  unint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __n128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __n128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  __n128 v119;
  unint64_t v120;

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;
  unint64_t v23;
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
  uint64_t v37;

  v4 = (a2 - a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = (__int128 *)(a2 - 32);
      if (*(_QWORD *)(a2 - 32) < *(_QWORD *)a1)
      {
        v8 = *(_OWORD *)a1;
        v7 = *(_OWORD *)(a1 + 16);
        v9 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v9;
        *v6 = v8;
        *(_OWORD *)(a2 - 16) = v7;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_((__int128 *)a1, (unint64_t *)(a1 + 32), (unint64_t *)(a2 - 32));
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_(a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a2 - 32));
      return 1;
    case 5:
      v19 = (__int128 *)(a1 + 32);
      v20 = (__int128 *)(a1 + 64);
      v21 = (__int128 *)(a1 + 96);
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_(a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a1 + 96));
      v23 = *(_QWORD *)(a2 - 32);
      v22 = (__int128 *)(a2 - 32);
      if (v23 < *(_QWORD *)(a1 + 96))
      {
        v25 = *v21;
        v24 = *(_OWORD *)(a1 + 112);
        v26 = v22[1];
        *v21 = *v22;
        *(_OWORD *)(a1 + 112) = v26;
        *v22 = v25;
        v22[1] = v24;
        if (*(_QWORD *)v21 < *(_QWORD *)v20)
        {
          v28 = *v20;
          v27 = *(_OWORD *)(a1 + 80);
          v29 = *(_OWORD *)(a1 + 112);
          *v20 = *v21;
          *(_OWORD *)(a1 + 80) = v29;
          *v21 = v28;
          *(_OWORD *)(a1 + 112) = v27;
          if (*(_QWORD *)v20 < *(_QWORD *)v19)
          {
            v31 = *v19;
            v30 = *(_OWORD *)(a1 + 48);
            v32 = *(_OWORD *)(a1 + 80);
            *v19 = *v20;
            *(_OWORD *)(a1 + 48) = v32;
            *v20 = v31;
            *(_OWORD *)(a1 + 80) = v30;
            if (*(_QWORD *)(a1 + 32) < *(_QWORD *)a1)
            {
              v34 = *(_OWORD *)a1;
              v33 = *(_OWORD *)(a1 + 16);
              v35 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v35;
              *v19 = v34;
              *(_OWORD *)(a1 + 48) = v33;
            }
          }
        }
      }
      return 1;
    default:
      v10 = (_QWORD *)(a1 + 64);
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_((__int128 *)a1, (unint64_t *)(a1 + 32), (unint64_t *)(a1 + 64));
      v11 = a1 + 96;
      if (a1 + 96 == a2)
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
      v36 = *(_OWORD *)(v11 + 8);
      v37 = *(_QWORD *)(v11 + 24);
      v15 = v12;
      while (1)
      {
        v16 = a1 + v15;
        v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64)
          break;
        v15 -= 32;
        if (v14 >= *(_QWORD *)(v16 + 32))
        {
          v18 = a1 + v15 + 96;
          goto LABEL_13;
        }
      }
      v18 = a1;
LABEL_13:
      *(_QWORD *)v18 = v14;
      *(_OWORD *)(v18 + 8) = v36;
      *(_QWORD *)(v18 + 24) = v37;
      if (++v13 == 8)
        return v11 + 32 == a2;
    }
    v10 = (_QWORD *)v11;
    v12 += 32;
    v11 += 32;
    if (v11 == a2)
      return 1;
  }
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 *v22;
  unint64_t v23;
  unint64_t v24;
  __int128 *v25;
  unint64_t v26;
  unint64_t v27;
  __int128 *v28;
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
  BOOL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __n128 v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __int128 *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 *v64;
  __int128 *v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __n128 *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t *v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  __int128 *v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unint64_t v103;
  __n128 v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  __int128 *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  unint64_t v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __n128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __n128 *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __n128 v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  BOOL v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __n128 *v183;
  unint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  unint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __n128 *v194;
  __int128 *v195;
  __int128 *v196;
  __int128 *v197;
  int64_t v198;
  int64_t v200;
  __int128 *v201;
  __int128 *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  __n128 v210;
  uint64_t v211;
  char v212;
  __n128 v213;
  uint64_t v214;
  char v215;
  __n128 v216;
  uint64_t v217;
  char v218;
  __int128 v219;
  uint64_t v220;
  void **v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint64_t v228;
  __n128 v229;
  uint64_t v230;
  char v231;
  __n128 v232;
  uint64_t v233;
  char v234;
  __n128 __p;
  uint64_t v236;
  char v237;
  __int128 v238;
  uint64_t v239;

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char v36;
  __n128 v37;
  uint64_t v38;
  char v39;
  __n128 __p;
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  void **v45;

  v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 5);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*((_QWORD *)a2 - 28) < *(_QWORD *)a1)
      {
        v6 = a1;
        v7 = a2 - 14;
        goto LABEL_4;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a2 - 14);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a2 - 14);
      return 1;
    case 5:
      v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a1 + 42);
      v26 = *((_QWORD *)a2 - 28);
      v25 = a2 - 14;
      if (v26 < *((_QWORD *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((_QWORD *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((_QWORD *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((_QWORD *)a1 + 28) < *(_QWORD *)a1)
            {
              v6 = a1;
              v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }
      return 1;
    default:
      v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a1 + 28);
      v9 = a1 + 42;
      result = 1;
      if (a1 + 42 == a2)
        return result;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*(_QWORD *)v9 < *(_QWORD *)v8)
    {
      v31 = v9[4];
      v32 = v9[5];
      v33 = *((_QWORD *)v9 + 12);
      v27 = *v9;
      v28 = v9[1];
      v29 = v9[2];
      v30 = v9[3];
      v34.n128_u8[0] = 0;
      v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        v34 = *(__n128 *)((char *)v9 + 104);
        v35 = *((_QWORD *)v9 + 15);
        *((_QWORD *)v9 + 14) = 0;
        *((_QWORD *)v9 + 15) = 0;
        *((_QWORD *)v9 + 13) = 0;
        v36 = 1;
      }
      v37.n128_u8[0] = 0;
      v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        v37 = *(__n128 *)((char *)v9 + 136);
        v38 = *((_QWORD *)v9 + 19);
        *((_QWORD *)v9 + 18) = 0;
        *((_QWORD *)v9 + 19) = 0;
        *((_QWORD *)v9 + 17) = 0;
        v39 = 1;
      }
      __p.n128_u8[0] = 0;
      v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __p = *(__n128 *)((char *)v9 + 168);
        v41 = *((_QWORD *)v9 + 23);
        *((_QWORD *)v9 + 22) = 0;
        *((_QWORD *)v9 + 23) = 0;
        *((_QWORD *)v9 + 21) = 0;
        v42 = 1;
      }
      v43 = *(__int128 *)((char *)v9 + 200);
      v44 = *((_QWORD *)v9 + 27);
      *((_QWORD *)v9 + 26) = 0;
      *((_QWORD *)v9 + 27) = 0;
      *((_QWORD *)v9 + 25) = 0;
      v12 = v10;
      while (1)
      {
        v13 = v12;
        v14 = (char *)a1 + v12;
        v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((_QWORD *)v14 + 96) = *(_QWORD *)((char *)a1 + v12 + 544);
        v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a1 + v12 + 776, (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v14 + 808), (__n128 *)(v14 + 584));
        v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + v13 + 840, (__n128 *)((char *)a1 + v13 + 616));
        v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((_QWORD *)v18 + 111) = *((_QWORD *)v18 + 83);
        *((_QWORD *)v18 + 83) = 0;
        *v19 = 0u;
        if (v13 == -448)
          break;
        v12 = v13 - 224;
        if ((unint64_t)v27 >= *(_QWORD *)((char *)a1 + v13 + 224))
        {
          v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }
      v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(_QWORD *)(v20 + 96) = v33;
      *(_OWORD *)v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)(v21 + 69), &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 73), &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 77), &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      v22 = *((_QWORD *)&v43 + 1);
      v21[81] = v43;
      v23 = v44;
      *(_QWORD *)(v20 + 208) = v22;
      *(_QWORD *)(v20 + 216) = v23;
      v44 = 0;
      v43 = 0uLL;
      v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }
      if (v36 && SHIBYTE(v35) < 0)
        operator delete((void *)v34.n128_u64[0]);
      if (++v11 == 8)
        return v9 + 14 == a2;
    }
    v8 = v9;
    v10 += 224;
    v9 += 14;
    if (v9 == a2)
      return 1;
  }
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb(unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 *v22;
  unint64_t v23;
  unint64_t v24;
  __int128 *v25;
  unint64_t v26;
  unint64_t v27;
  __int128 *v28;
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
  BOOL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __n128 v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  __int128 *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __int128 *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 *v64;
  __int128 *v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __n128 *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t *v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  __int128 *v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unint64_t v103;
  __n128 v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  __int128 *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  unint64_t v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __n128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __n128 *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __n128 v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  BOOL v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __n128 *v183;
  unint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  unint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __n128 *v194;
  __int128 *v195;
  __int128 *v196;
  __int128 *v197;
  int64_t v198;
  int64_t v200;
  __int128 *v201;
  __int128 *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  __n128 v210;
  uint64_t v211;
  char v212;
  __n128 v213;
  uint64_t v214;
  char v215;
  __n128 v216;
  uint64_t v217;
  char v218;
  __int128 v219;
  uint64_t v220;
  void **v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint64_t v228;
  __n128 v229;
  uint64_t v230;
  char v231;
  __n128 v232;
  uint64_t v233;
  char v234;
  __n128 __p;
  uint64_t v236;
  char v237;
  __int128 v238;
  uint64_t v239;

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char v36;
  __n128 v37;
  uint64_t v38;
  char v39;
  __n128 __p;
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  void **v45;

  v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 5);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*((_QWORD *)a2 - 28) < *(_QWORD *)a1)
      {
        v6 = a1;
        v7 = a2 - 14;
        goto LABEL_4;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a2 - 14);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a2 - 14);
      return 1;
    case 5:
      v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_(a1, a1 + 14, a1 + 28, a1 + 42);
      v26 = *((_QWORD *)a2 - 28);
      v25 = a2 - 14;
      if (v26 < *((_QWORD *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((_QWORD *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((_QWORD *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((_QWORD *)a1 + 28) < *(_QWORD *)a1)
            {
              v6 = a1;
              v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }
      return 1;
    default:
      v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_(a1, a1 + 14, a1 + 28);
      v9 = a1 + 42;
      result = 1;
      if (a1 + 42 == a2)
        return result;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*(_QWORD *)v9 < *(_QWORD *)v8)
    {
      v31 = v9[4];
      v32 = v9[5];
      v33 = *((_QWORD *)v9 + 12);
      v27 = *v9;
      v28 = v9[1];
      v29 = v9[2];
      v30 = v9[3];
      v34.n128_u8[0] = 0;
      v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        v34 = *(__n128 *)((char *)v9 + 104);
        v35 = *((_QWORD *)v9 + 15);
        *((_QWORD *)v9 + 14) = 0;
        *((_QWORD *)v9 + 15) = 0;
        *((_QWORD *)v9 + 13) = 0;
        v36 = 1;
      }
      v37.n128_u8[0] = 0;
      v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        v37 = *(__n128 *)((char *)v9 + 136);
        v38 = *((_QWORD *)v9 + 19);
        *((_QWORD *)v9 + 18) = 0;
        *((_QWORD *)v9 + 19) = 0;
        *((_QWORD *)v9 + 17) = 0;
        v39 = 1;
      }
      __p.n128_u8[0] = 0;
      v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __p = *(__n128 *)((char *)v9 + 168);
        v41 = *((_QWORD *)v9 + 23);
        *((_QWORD *)v9 + 22) = 0;
        *((_QWORD *)v9 + 23) = 0;
        *((_QWORD *)v9 + 21) = 0;
        v42 = 1;
      }
      v43 = *(__int128 *)((char *)v9 + 200);
      v44 = *((_QWORD *)v9 + 27);
      *((_QWORD *)v9 + 26) = 0;
      *((_QWORD *)v9 + 27) = 0;
      *((_QWORD *)v9 + 25) = 0;
      v12 = v10;
      while (1)
      {
        v13 = v12;
        v14 = (char *)a1 + v12;
        v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((_QWORD *)v14 + 96) = *(_QWORD *)((char *)a1 + v12 + 544);
        v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)a1 + v12 + 776, (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v14 + 808), (__n128 *)(v14 + 584));
        v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)a1 + v13 + 840, (__n128 *)((char *)a1 + v13 + 616));
        v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((_QWORD *)v18 + 111) = *((_QWORD *)v18 + 83);
        *((_QWORD *)v18 + 83) = 0;
        *v19 = 0u;
        if (v13 == -448)
          break;
        v12 = v13 - 224;
        if ((unint64_t)v27 >= *(_QWORD *)((char *)a1 + v13 + 224))
        {
          v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }
      v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(_QWORD *)(v20 + 96) = v33;
      *(_OWORD *)v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)(v21 + 69), &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 73), &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>((uint64_t)(v21 + 77), &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      v22 = *((_QWORD *)&v43 + 1);
      v21[81] = v43;
      v23 = v44;
      *(_QWORD *)(v20 + 208) = v22;
      *(_QWORD *)(v20 + 216) = v23;
      v44 = 0;
      v43 = 0uLL;
      v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }
      if (v36 && SHIBYTE(v35) < 0)
        operator delete((void *)v34.n128_u64[0]);
      if (++v11 == 8)
        return v9 + 14 == a2;
    }
    v8 = v9;
    v10 += 224;
    v9 += 14;
    if (v9 == a2)
      return 1;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::__emplace_unique_key_args<unsigned int,unsigned int &,mapped_memory_t *&>(uint64_t a1, unsigned int *a2, _DWORD *a3, _QWORD *a4)
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
      v4 = ((_DWORD)v9 - 1) & v8;
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
      v4 = ((_DWORD)v9 - 1) & v8;
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

void sub_1B41942E0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::__erase_unique<unsigned int>(_QWORD *a1, unsigned int *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::find<unsigned int>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

void std::default_delete<mapped_memory_t>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a2 + 192) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    std::mutex::~mutex((std::mutex *)(a2 + 128));
    v4 = *(void **)(a2 + 64);
    if (v4)
    {
      *(_QWORD *)(a2 + 72) = v4;
      operator delete(v4);
    }
    std::__tree<TRange<Pointer64>>::destroy(a2 + 40, *(_QWORD **)(a2 + 48));
    JUMPOUT(0x1B5E36940);
  }
}

uint64_t **std::__tree<mapped_region_node_internal_t,CompareMappedRegionNode,std::allocator<mapped_region_node_internal_t>>::__emplace_unique_key_args<mapped_region_node_internal_t,mapped_region_node_internal_t const&>(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  _OWORD *v10;
  __int128 v11;

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
        v9 = v5[4];
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
    v10 = operator new(0x48uLL);
    v11 = *(_OWORD *)(a3 + 16);
    v10[2] = *(_OWORD *)a3;
    v10[3] = v11;
    *((_QWORD *)v10 + 8) = *(_QWORD *)(a3 + 32);
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t std::__tree<mapped_region_node_internal_t,CompareMappedRegionNode,std::allocator<mapped_region_node_internal_t>>::__erase_unique<mapped_region_node_internal_t>(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<TRangeValue<Pointer64,unsigned char *>>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

const char *CSDwarfExpression::Evaluate(uint64_t (*a1)(uint64_t, _QWORD, char *), uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3, CSBinaryDataRef *this, unsigned int a5, uint64_t a6, unint64_t *a7, _QWORD *a8)
{
  unint64_t *v9;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  unint64_t Pointer;
  unint64_t *v27;
  unint64_t *v28;
  uint64_t SLEB128;
  unint64_t v30;
  unint64_t *v31;
  unint64_t *v32;
  unint64_t *v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  unint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  __int16 v120;
  uint64_t ULEB128;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  const char *v138;
  const char *v139;
  BOOL v140;
  char v141[8];
  uint64_t v142;
  uint64_t v143;
  int v144;
  unint64_t v145;
  unsigned int v146;
  void *__p;
  unint64_t *v148;
  char *v149;

  v9 = a7;
  __p = 0;
  v148 = 0;
  v149 = 0;
  if (a7)
  {
    v16 = (unint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, 1uLL);
    *v16 = *v9;
    v9 = v16 + 1;
    __p = v16;
    v149 = (char *)&v16[v17];
    v148 = v16 + 1;
  }
  v146 = a5;
  v141[0] = 1;
  v145 = 0;
  v142 = 0;
  v143 = 0;
  v144 = 0;
  v18 = *((_QWORD *)this + 1);
  if (*(_QWORD *)this >= v18)
    goto LABEL_296;
  v19 = a5;
  v20 = v18 - *(_QWORD *)this;
  v21 = a6 - 1;
  if (!a6)
    v21 = 0;
  if (v20 <= v21 + (unint64_t)a5)
  {
LABEL_296:
    v25 = "invalid offset and/or length for opcodes buffer";
    goto LABEL_297;
  }
  if (v20 <= a5)
  {
LABEL_294:
    if (__p != v9)
    {
      v25 = 0;
      *a8 = *(v9 - 1);
      goto LABEL_297;
    }
    v25 = "Stack empty after evaluation";
    if (v9)
      goto LABEL_298;
    return v25;
  }
  v22 = 0;
  v23 = a6 + a5;
  while (2)
  {
    if (v22 || v23 <= v19)
    {
LABEL_293:
      v9 = v148;
      goto LABEL_294;
    }
    v24 = CSBinaryDataRef::Get8(this, &v146);
    v22 = 0;
    v25 = "error: UNIMPLEMENTED opcode DW_OP_xderef_size";
    switch(v24)
    {
      case 3:
        Pointer = CSBinaryDataRef::GetPointer(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v90 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v92 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v91)
          v91 = v92 >> 2;
        if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v91;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v90];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v128 = *--v27;
          *--v48 = v128;
        }
        goto LABEL_285;
      case 6:
        if (__p == v148 || !a1)
        {
          v138 = "DW_OP_deref: No read memory callback provided";
          v139 = "Stack empty for DW_OP_deref";
          v140 = __p == v148;
          goto LABEL_330;
        }
        v142 = *((unsigned __int8 *)this + 17);
        v141[0] = 1;
        v93 = a1(a3, *(v148 - 1), v141);
        goto LABEL_239;
      case 8:
        Pointer = CSBinaryDataRef::Get8(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v102 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v103 = v102 + 1;
        if ((unint64_t)(v102 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v104 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v103)
          v103 = v104 >> 2;
        if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v103;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v102];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v131 = *--v27;
          *--v48 = v131;
        }
        goto LABEL_285;
      case 9:
        Pointer = (char)CSBinaryDataRef::Get8(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v99 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v100 = v99 + 1;
        if ((unint64_t)(v99 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v101 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v100)
          v100 = v101 >> 2;
        if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v100;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v99];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v130 = *--v27;
          *--v48 = v130;
        }
        goto LABEL_285;
      case 10:
        Pointer = CSBinaryDataRef::Get16(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v95 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v96 = v95 + 1;
        if ((unint64_t)(v95 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v97 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v96)
          v96 = v97 >> 2;
        if ((unint64_t)v97 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v96;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v95];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v129 = *--v27;
          *--v48 = v129;
        }
        goto LABEL_285;
      case 11:
        Pointer = (__int16)CSBinaryDataRef::Get16(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v109 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v110 = v109 + 1;
        if ((unint64_t)(v109 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v111 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v110)
          v110 = v111 >> 2;
        if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v110;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v109];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v133 = *--v27;
          *--v48 = v133;
        }
        goto LABEL_285;
      case 12:
        Pointer = CSBinaryDataRef::Get32(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v114 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v115 = v114 + 1;
        if ((unint64_t)(v114 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v116 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v115)
          v115 = v116 >> 2;
        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v115;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v114];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v134 = *--v27;
          *--v48 = v134;
        }
        goto LABEL_285;
      case 13:
        Pointer = (int)CSBinaryDataRef::Get32(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v106 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v107 = v106 + 1;
        if ((unint64_t)(v106 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v108 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v107)
          v107 = v108 >> 2;
        if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v107;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v106];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v132 = *--v27;
          *--v48 = v132;
        }
        goto LABEL_285;
      case 14:
        Pointer = CSBinaryDataRef::Get64(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v82 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v83 = v82 + 1;
        if ((unint64_t)(v82 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v84 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v83)
          v83 = v84 >> 2;
        if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v83;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v82];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v127 = *--v27;
          *--v48 = v127;
        }
        goto LABEL_285;
      case 15:
        Pointer = CSBinaryDataRef::Get64(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v73 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v75 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v74)
          v74 = v75 >> 2;
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v74;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v73];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v125 = *--v27;
          *--v48 = v125;
        }
        goto LABEL_285;
      case 16:
        Pointer = CSBinaryDataRef::Get_ULEB128(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v79 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v81 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v80)
          v80 = v81 >> 2;
        if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v80;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v79];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v126 = *--v27;
          *--v48 = v126;
        }
        goto LABEL_285;
      case 17:
        Pointer = CSBinaryDataRef::Get_SLEB128(this, &v146);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
          goto LABEL_13;
        v34 = (unint64_t *)__p;
        v67 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v68 = v67 + 1;
        if ((unint64_t)(v67 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v69 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v68)
          v68 = v69 >> 2;
        if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v68;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v67];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v124 = *--v27;
          *--v48 = v124;
        }
        goto LABEL_285;
      case 18:
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_dup";
          goto LABEL_297;
        }
        v78 = v148 - 1;
        goto LABEL_187;
      case 19:
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_drop";
          goto LABEL_297;
        }
        v22 = 0;
        --v148;
        goto LABEL_289;
      case 20:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_over";
          goto LABEL_297;
        }
        v78 = v148 - 2;
LABEL_187:
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, v78);
        goto LABEL_237;
      case 21:
        v62 = CSBinaryDataRef::Get8(this, &v146);
        if (v62 >= (unint64_t)(((char *)v148 - (_BYTE *)__p) >> 3))
        {
          v25 = "Index out of range for DW_OP_pick";
          goto LABEL_297;
        }
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, (_QWORD *)__p + v62);
LABEL_237:
        v22 = 0;
        goto LABEL_289;
      case 22:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_swap";
          goto LABEL_297;
        }
        v22 = 0;
        v70 = *(v148 - 1);
        v71 = v148;
        *(v148 - 1) = *(v148 - 2);
        *(v71 - 2) = v70;
        goto LABEL_289;
      case 23:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x18)
        {
          v25 = "Stack size less than 3 elements for DW_OP_rot";
          goto LABEL_297;
        }
        v22 = 0;
        v76 = v148;
        v77 = *(v148 - 1);
        *((_OWORD *)v148 - 1) = *(_OWORD *)(v148 - 3);
        *(v76 - 3) = v77;
        goto LABEL_289;
      case 24:
        v25 = "error: UNIMPLEMENTED opcode DW_OP_xderef";
        goto LABEL_297;
      case 25:
        v57 = v148;
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_abs";
          goto LABEL_297;
        }
        v64 = *(v148 - 1);
        if ((v64 & 0x8000000000000000) == 0)
          goto LABEL_237;
        v22 = 0;
LABEL_182:
        v59 = -v64;
        goto LABEL_233;
      case 26:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
          goto LABEL_305;
        v22 = 0;
        v72 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) & v72;
        goto LABEL_233;
      case 27:
        v65 = v148;
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
LABEL_305:
          v25 = "Stack size less than 2 elements for DW_OP_and";
          goto LABEL_297;
        }
        v66 = *(v148 - 1);
        if (!v66)
        {
          v25 = "DW_OP_div divide by zero";
          goto LABEL_297;
        }
        v22 = 0;
        --v148;
        *(v65 - 2) /= v66;
        goto LABEL_289;
      case 28:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
          goto LABEL_304;
        v22 = 0;
        v105 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) - v105;
        goto LABEL_233;
      case 29:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_mod";
          goto LABEL_297;
        }
        v22 = 0;
        v60 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) % v60;
        goto LABEL_233;
      case 30:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
LABEL_304:
          v25 = "Stack size less than 2 elements for DW_OP_minus";
          goto LABEL_297;
        }
        v22 = 0;
        v117 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) * v117;
        goto LABEL_233;
      case 31:
        v57 = v148;
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_neg";
          goto LABEL_297;
        }
        v22 = 0;
        v64 = *(v148 - 1);
        goto LABEL_182;
      case 32:
        v57 = v148;
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_not";
          goto LABEL_297;
        }
        v22 = 0;
        v59 = ~*(v148 - 1);
        goto LABEL_233;
      case 33:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_or";
          goto LABEL_297;
        }
        v22 = 0;
        v85 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) | v85;
        goto LABEL_233;
      case 34:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_plus";
          goto LABEL_297;
        }
        v22 = 0;
        v94 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) + v94;
        goto LABEL_233;
      case 35:
        if (__p == v148)
        {
          v25 = "Stack empty for DW_OP_plus_uconst";
          goto LABEL_297;
        }
        ULEB128 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        v22 = 0;
        v57 = v148;
        v59 = *(v148 - 1) + ULEB128;
LABEL_233:
        *(v57 - 1) = v59;
        goto LABEL_289;
      case 36:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_shl";
          goto LABEL_297;
        }
        v22 = 0;
        v118 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) << v118;
        goto LABEL_233;
      case 37:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_shr";
          goto LABEL_297;
        }
        v22 = 0;
        v113 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) >> v113;
        goto LABEL_233;
      case 38:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_shra";
          goto LABEL_297;
        }
        v22 = 0;
        v122 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = (uint64_t)*(v57 - 1) >> v122;
        goto LABEL_233;
      case 39:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_xor";
          goto LABEL_297;
        }
        v22 = 0;
        v112 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) ^ v112;
        goto LABEL_233;
      case 40:
        v86 = *--v148;
        v87 = CSBinaryDataRef::Get16(this, &v146);
        if (!v86)
          goto LABEL_237;
        v88 = v146 + v87;
        v25 = "DW_OP_bra has invalid opcode offset";
LABEL_226:
        if (v88 < a5 || v23 <= v88)
          goto LABEL_297;
        v22 = 0;
        v146 = v88;
        goto LABEL_289;
      case 41:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_eq";
          goto LABEL_297;
        }
        v22 = 0;
        v58 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) == v58;
        goto LABEL_233;
      case 42:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_ge";
          goto LABEL_297;
        }
        v22 = 0;
        v61 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) >= v61;
        goto LABEL_233;
      case 43:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_gt";
          goto LABEL_297;
        }
        v22 = 0;
        v98 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) > v98;
        goto LABEL_233;
      case 44:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_le";
          goto LABEL_297;
        }
        v22 = 0;
        v119 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) <= v119;
        goto LABEL_233;
      case 45:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_lt";
          goto LABEL_297;
        }
        v22 = 0;
        v89 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) < v89;
        goto LABEL_233;
      case 46:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          v25 = "Stack size less than 2 elements for DW_OP_ne";
          goto LABEL_297;
        }
        v22 = 0;
        v63 = *(v148 - 1);
        v57 = v148 - 1;
        v148 = v57;
        v59 = *(v57 - 1) != v63;
        goto LABEL_233;
      case 47:
        v120 = CSBinaryDataRef::Get16(this, &v146);
        v88 = v146 + v120;
        v25 = "DW_OP_skip has invalid opcode offset";
        goto LABEL_226;
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
        Pointer = (v24 - 48);
        v27 = v148;
        if (v148 < (unint64_t *)v149)
        {
LABEL_13:
          *v27 = Pointer;
          v28 = v27 + 1;
          goto LABEL_22;
        }
        v34 = (unint64_t *)__p;
        v35 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v37 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v36)
          v36 = v37 >> 2;
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
          v38 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v38 = v36;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          v34 = (unint64_t *)__p;
          v27 = v148;
        }
        else
        {
          v39 = 0;
        }
        v48 = (unint64_t *)&v39[8 * v35];
        *v48 = Pointer;
        v33 = v48 + 1;
        while (v27 != v34)
        {
          v49 = *--v27;
          *--v48 = v49;
        }
        goto LABEL_285;
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
        if (!a2)
        {
          v25 = "DW_OP_reg: No read register callback provided";
          goto LABEL_297;
        }
        v25 = (const char *)a2(a3, (v24 - 80), v141);
        if (v25)
          goto LABEL_297;
        v32 = v148;
        if (v148 >= (unint64_t *)v149)
        {
          v34 = (unint64_t *)__p;
          v40 = ((char *)v148 - (_BYTE *)__p) >> 3;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 61)
            goto LABEL_347;
          v42 = v149 - (_BYTE *)__p;
          if ((v149 - (_BYTE *)__p) >> 2 > v41)
            v41 = v42 >> 2;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
            v38 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v38 = v41;
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
            v34 = (unint64_t *)__p;
            v32 = v148;
          }
          else
          {
            v39 = 0;
          }
          v48 = (unint64_t *)&v39[8 * v40];
          *v48 = v145;
          v33 = v48 + 1;
          while (v32 != v34)
          {
            v50 = *--v32;
            *--v48 = v50;
          }
LABEL_285:
          v53 = &v39[8 * v38];
          __p = v48;
LABEL_286:
          v148 = v33;
          v149 = v53;
          if (v34)
            operator delete(v34);
        }
        else
        {
          *v148 = v145;
          v28 = v32 + 1;
LABEL_22:
          v33 = v28;
        }
        v22 = 0;
        v148 = v33;
        goto LABEL_289;
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
        if (!a2)
        {
          v25 = "DW_OP_breg: No read register callback provided";
          goto LABEL_297;
        }
        v25 = (const char *)a2(a3, (v24 - 112), v141);
        if (v25)
          goto LABEL_297;
        SLEB128 = CSBinaryDataRef::Get_SLEB128(this, &v146);
        v30 = v145 + SLEB128;
        v145 += SLEB128;
        v31 = v148;
        if (v148 < (unint64_t *)v149)
        {
          *v148 = v30;
          v28 = v31 + 1;
          goto LABEL_22;
        }
        v34 = (unint64_t *)__p;
        v43 = ((char *)v148 - (_BYTE *)__p) >> 3;
        v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61)
LABEL_347:
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v45 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v44)
          v44 = v45 >> 2;
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
          v46 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v46 = v44;
        if (v46)
        {
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v46);
          v34 = (unint64_t *)__p;
          v31 = v148;
          v30 = v145;
        }
        else
        {
          v47 = 0;
        }
        v51 = &v47[8 * v43];
        *(_QWORD *)v51 = v30;
        v33 = (unint64_t *)(v51 + 8);
        while (v31 != v34)
        {
          v52 = *--v31;
          *((_QWORD *)v51 - 1) = v52;
          v51 -= 8;
        }
        v53 = &v47[8 * v46];
        __p = v51;
        goto LABEL_286;
      case 144:
        if (!a2)
        {
          v25 = "DW_OP_regx: No read register callback provided";
          goto LABEL_297;
        }
        v123 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        v25 = (const char *)a2(a3, v123, v141);
        if (v25)
          goto LABEL_297;
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, &v145);
        goto LABEL_237;
      case 145:
        v25 = "DW_OP_fbreg is not implemented";
        goto LABEL_297;
      case 146:
        if (!a2)
        {
          v25 = "DW_OP_bregx: No read register callback provided";
          goto LABEL_297;
        }
        v54 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        v25 = (const char *)a2(a3, v54, v141);
        if (v25)
          goto LABEL_297;
        v55 = CSBinaryDataRef::Get_SLEB128(this, &v146);
        v145 += v55;
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, &v145);
        goto LABEL_237;
      case 147:
        v25 = "DW_OP_piece is not implemented.";
        goto LABEL_297;
      case 148:
        if (__p != v148 && a1)
        {
          v56 = CSBinaryDataRef::Get8(this, &v146);
          if (v56 <= *((unsigned __int8 *)this + 17))
          {
            v142 = v56;
            v141[0] = 7;
            v93 = a1(a3, *(v148 - 1), v141);
LABEL_239:
            v25 = (const char *)v93;
            if (v93)
              goto LABEL_297;
            v22 = 0;
            *(v148 - 1) = v145;
          }
          else
          {
            v22 = "error: DW_OP_deref_size attempted to dereference a value with a size larger than a target address.";
          }
LABEL_289:
          v19 = v146;
          v135 = *((_QWORD *)this + 1);
          if (v135 <= *(_QWORD *)this || v135 - *(_QWORD *)this <= (unint64_t)v146)
            goto LABEL_293;
          continue;
        }
        v138 = "DW_OP_deref_size: No read memory callback provided";
        v139 = "Stack empty for DW_OP_deref_size";
        v140 = __p == v148;
LABEL_330:
        if (v140)
          v25 = v139;
        else
          v25 = v138;
LABEL_297:
        v9 = (unint64_t *)__p;
        if (__p)
        {
LABEL_298:
          v148 = v9;
          operator delete(v9);
        }
        return v25;
      case 149:
        goto LABEL_297;
      case 150:
        goto LABEL_289;
      case 151:
        v25 = "DW_OP_push_object_address is not implemented.";
        goto LABEL_297;
      case 152:
        v25 = "DW_OP_call2 is not implemented.";
        goto LABEL_297;
      case 153:
        v25 = "DW_OP_call4 is not implemented.";
        goto LABEL_297;
      case 154:
        v25 = "DW_OP_call_ref is not implemented.";
        goto LABEL_297;
      case 157:
        v25 = "DW_OP_bit_piece is not implemented.";
        goto LABEL_297;
      case 240:
        v25 = "Value is not initialized";
        goto LABEL_297;
      default:
        v25 = "Unknown DWARF DW_OP value.";
        goto LABEL_297;
    }
  }
}

void sub_1B41957B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned long long>::push_back[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = a1 + 16;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_QWORD **)a1;
    v9 = ((uint64_t)v6 - *(_QWORD *)a1) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
      v8 = *(_QWORD **)a1;
      v6 = *(_QWORD **)(a1 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v6 != v8)
    {
      v16 = *--v6;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
  }
  *(_QWORD *)(a1 + 8) = v7;
}

void SymbolicationSession::SymbolicationSession(SymbolicationSession *this, int a2)
{
  uint64_t v4;

  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = &off_1E677A650;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_QWORD *)this + 13) = 0;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_QWORD *)this + 21) = 0;
  *((_DWORD *)this + 44) = 1065353216;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 54) = 1065353216;
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = 0;
  v4 = operator new();
  *(_QWORD *)v4 = this;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_DWORD *)(v4 + 40) = 1065353216;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_DWORD *)(v4 + 80) = 1065353216;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_DWORD *)(v4 + 120) = 1065353216;
  *((_QWORD *)this + 31) = v4;
  *((_DWORD *)this + 64) = a2;
  *((_QWORD *)this + 33) = 0;
}

void sub_1B4195A44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table(v4);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 144);
  std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80);
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(v2);
  _Unwind_Resume(a1);
}

void SymbolicationSession::~SymbolicationSession(SymbolicationSession *this)
{
  _QWORD *i;
  unsigned int **v3;
  unsigned int **v4;
  uint64_t v5;
  void **v6;

  *(_QWORD *)this = &off_1E677A650;
  for (i = (_QWORD *)*((_QWORD *)this + 25); i; i = (_QWORD *)*i)
  {
    v3 = (unsigned int **)i[3];
    v4 = (unsigned int **)i[4];
    while (v3 != v4)
      CSCppReferenceCount::release(*v3++, 1);
  }
  v5 = *((_QWORD *)this + 31);
  *((_QWORD *)this + 31) = 0;
  if (v5)
    std::default_delete<EventAggregator>::operator()[abi:ne180100]((uint64_t)this + 248, v5);
  v6 = (void **)((char *)this + 224);
  std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table((uint64_t)this + 184);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)this + 144);
  v6 = (void **)((char *)this + 120);
  std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)this + 80);
  v6 = (void **)((char *)this + 56);
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)this + 16);
}

{
  SymbolicationSession::~SymbolicationSession(this);
  JUMPOUT(0x1B5E36940);
}

unint64_t SymbolicationSession::register_library(SymbolicationSession *this, LibraryDescription *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _OWORD *v8;

  v4 = *((_QWORD *)this + 8);
  if (v4 >= *((_QWORD *)this + 9))
  {
    v5 = std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>((uint64_t *)this + 7, (__int128 *)a2);
  }
  else
  {
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>(*((_QWORD *)this + 8), (__int128 *)a2);
    v5 = v4 + 96;
    *((_QWORD *)this + 8) = v4 + 96;
  }
  *((_QWORD *)this + 8) = v5;
  v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *((_QWORD *)this + 7)) >> 5) - 1;
  v8 = a2;
  std::__hash_table<std::__hash_value_type<UUID,unsigned long>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,unsigned long>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)this + 80, a2, (uint64_t)&std::piecewise_construct, &v8)[4] = v6;
  return v6;
}

void sub_1B4195C4C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 64) = v2;
  _Unwind_Resume(a1);
}

void LibraryDescription::~LibraryDescription(LibraryDescription *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 8);
  if (v2)
  {
    *((_QWORD *)this + 9) = v2;
    operator delete(v2);
  }
  if (*((_BYTE *)this + 48))
  {
    if (*((char *)this + 47) < 0)
      operator delete(*((void **)this + 3));
  }
}

unint64_t SymbolicationSession::lookup_or_register_process(SymbolicationSession *this, int a2)
{
  char *v3;
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int *v14;
  int *v15;
  uint64_t v16;
  char **v17;
  int **v18;
  char *v19;
  unint64_t v20;
  char **v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  int *v30;
  int *v31;
  uint64_t v32;
  int *v33;
  int *v34;
  int v36;
  int *v37;
  int *v38;
  int *v39;
  int *v40;
  char *v41;

  v36 = a2;
  v3 = (char *)this + 144;
  v4 = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>((_QWORD *)this + 18, &v36);
  if (v4)
    return v4[3];
  v6 = *((_QWORD *)this + 30);
  v7 = (_QWORD *)*((_QWORD *)this + 29);
  if ((unint64_t)v7 >= v6)
  {
    v9 = *((_QWORD *)this + 28);
    v10 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v9) >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v9) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    v41 = (char *)this + 240;
    if (v13)
      v14 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)this + 240, v13);
    else
      v14 = 0;
    v15 = &v14[6 * v10];
    v37 = v14;
    v38 = v15;
    v40 = &v14[6 * v13];
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = 0;
    v39 = v15 + 6;
    std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__swap_out_circular_buffer((uint64_t *)this + 28, &v37);
    v8 = (_QWORD *)*((_QWORD *)this + 29);
    std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::~__split_buffer((void **)&v37);
  }
  else
  {
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    v8 = v7 + 3;
    *((_QWORD *)this + 29) = v7 + 3;
  }
  *((_QWORD *)this + 29) = v8;
  v16 = *((_QWORD *)this + 28);
  v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v16) >> 3) - 1;
  if ((*((_BYTE *)this + 256) & 1) != 0)
  {
    v17 = (char **)(v16 + 24 * v5);
    v18 = (int **)(v17 + 1);
    v19 = v17[1];
    v21 = v17 + 2;
    v20 = (unint64_t)v17[2];
    if ((unint64_t)v19 >= v20)
    {
      v23 = (v19 - *v17) >> 3;
      if ((unint64_t)(v23 + 1) >> 61)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v24 = v20 - (_QWORD)*v17;
      v25 = v24 >> 2;
      if (v24 >> 2 <= (unint64_t)(v23 + 1))
        v25 = v23 + 1;
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
        v26 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v26 = v25;
      v41 = (char *)(v17 + 2);
      if (v26)
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v21, v26);
      else
        v27 = 0;
      v28 = &v27[8 * v23];
      v29 = &v27[8 * v26];
      v40 = (int *)v29;
      *(_QWORD *)v28 = 0;
      v22 = (int *)(v28 + 8);
      v39 = (int *)(v28 + 8);
      v30 = *v18;
      v31 = (int *)*v17;
      if (*v18 == (int *)*v17)
      {
        v33 = *v18;
      }
      else
      {
        do
        {
          v32 = *((_QWORD *)v30 - 1);
          v30 -= 2;
          *(_QWORD *)v30 = 0;
          *((_QWORD *)v28 - 1) = v32;
          v28 -= 8;
        }
        while (v30 != v31);
        v33 = (int *)*v17;
        v30 = *v18;
        v22 = v39;
        v29 = (char *)v40;
      }
      *v17 = v28;
      v38 = v33;
      *v18 = v22;
      v39 = v30;
      v34 = (int *)*v21;
      *v21 = v29;
      v40 = v34;
      v37 = v33;
      std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer((uint64_t)&v37);
    }
    else
    {
      *(_QWORD *)v19 = 0;
      v22 = (int *)(v19 + 8);
    }
    *v18 = v22;
  }
  v37 = &v36;
  std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v3, &v36, (uint64_t)&std::piecewise_construct, &v37)[3] = v5;
  return v5;
}

void sub_1B4195F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<AS::LoadOperator,std::vector<AS::LoadDescription> &,unsigned long long const&>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  void *__p;
  _BYTE *v9;
  uint64_t v10;

  v6 = operator new();
  v9 = 0;
  v10 = 0;
  __p = 0;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>(&__p, *(const void **)a1, *(_QWORD *)(a1 + 8), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4);
  v7 = *a2;
  *(_QWORD *)v6 = &off_1E677A7D0;
  *(_QWORD *)(v6 + 8) = v7;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>((_QWORD *)(v6 + 16), __p, (uint64_t)v9, (v9 - (_BYTE *)__p) >> 4);
  *(_BYTE *)(v6 + 40) = 1;
  *a3 = v6;
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
}

void sub_1B4195FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;

  if (__p)
    operator delete(__p);
  MEMORY[0x1B5E36940](v11, 0x10A3C402B483A02);
  _Unwind_Resume(a1);
}

_QWORD *SymbolicationSession::add_operator(SymbolicationSession *this, unint64_t a2, uint64_t *a3)
{
  char **v6;
  char **v7;
  char *v8;
  unint64_t v9;
  char **v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  _QWORD v27[2];
  char *v28;
  char *v29;
  _QWORD *v30;

  v6 = (char **)(*((_QWORD *)this + 28) + 24 * a2);
  v7 = v6 + 1;
  v8 = v6[1];
  v10 = v6 + 2;
  v9 = (unint64_t)v6[2];
  if ((unint64_t)v8 >= v9)
  {
    v13 = (v8 - *v6) >> 3;
    if ((unint64_t)(v13 + 1) >> 61)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v14 = v9 - (_QWORD)*v6;
    v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    v30 = v6 + 2;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v10, v16);
    else
      v17 = 0;
    v18 = &v17[8 * v13];
    v19 = &v17[8 * v16];
    v29 = v19;
    v20 = *a3;
    *a3 = 0;
    *(_QWORD *)v18 = v20;
    v12 = v18 + 8;
    v28 = v18 + 8;
    v21 = *v7;
    v22 = *v6;
    if (*v7 == *v6)
    {
      v24 = *v7;
    }
    else
    {
      do
      {
        v23 = *((_QWORD *)v21 - 1);
        v21 -= 8;
        *(_QWORD *)v21 = 0;
        *((_QWORD *)v18 - 1) = v23;
        v18 -= 8;
      }
      while (v21 != v22);
      v24 = *v6;
      v21 = *v7;
      v12 = v28;
      v19 = v29;
    }
    *v6 = v18;
    v27[1] = v24;
    *v7 = v12;
    v28 = v21;
    v25 = *v10;
    *v10 = v19;
    v29 = v25;
    v27[0] = v24;
    std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer((uint64_t)v27);
  }
  else
  {
    v11 = *a3;
    *a3 = 0;
    *(_QWORD *)v8 = v11;
    v12 = v8 + 8;
  }
  *v7 = v12;
  return SymbolicationSession::advance_managed_symbolicators(this, a2);
}

uint64_t SymbolicationSession::process_ats_dsc_and_pid_chunks(SymbolicationSession *this, const __CFData *a2, const __CFData *a3)
{
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 0x40000000;
  v8[2] = ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke;
  v8[3] = &__block_descriptor_tmp_16_2;
  v8[4] = this;
  _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a2, 0, (uint64_t)v8);
  v7[0] = v5;
  v7[1] = 0x40000000;
  v7[2] = ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2;
  v7[3] = &__block_descriptor_tmp_17_1;
  v7[4] = this;
  return _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a3, 0, (uint64_t)v7);
}

void ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke(uint64_t a1, FlatbufferSymbols::Symbolicator *this)
{
  unsigned __int16 *v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t *v5;
  int *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  FlatbufferSymbols::SymbolOwner *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19[6];
  char v20;
  _BYTE v21[17];
  void **v22[15];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int16 *)((char *)this - *(int *)this);
  if (*v2 >= 9u && (v3 = v2[4]) != 0)
    v4 = (unsigned int *)((char *)this + v3 + *(unsigned int *)((char *)this + v3));
  else
    v4 = 0;
  v5 = *(uint64_t **)(a1 + 32);
  v6 = (int *)FlatbufferSymbols::Symbolicator::metadata_as_DyldSharedCacheMetadata(this);
  v7 = (unsigned __int16 *)((char *)v6 - *v6);
  if (*v7 < 5u)
  {
    v8 = 0;
  }
  else
  {
    v8 = v7[2];
    if (v8)
      v8 += (uint64_t)v6 + *(unsigned int *)((char *)v6 + v8);
  }
  CSUUIDStringToCFUUIDBytes(v8 + 4, &v23);
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v11 = *v4;
  v10 = v4 + 1;
  v9 = v11;
  if (v11)
  {
    v12 = 4 * v9;
    do
    {
      v13 = (FlatbufferSymbols::SymbolOwner *)((char *)v10 + *v10);
      v21[0] = 0;
      v21[16] = 0;
      SymbolicationSession::transform_fbs_owner(v13, (uint64_t)v5, 1, (uint64_t)v21, 0, (uint64_t)v22);
      std::__optional_copy_base<LibraryDescription,false>::__optional_copy_base[abi:ne180100](v19, (uint64_t)v22);
      if (!v20)
        std::__throw_bad_optional_access[abi:ne180100]();
      v14 = v17;
      if (v17 >= v18)
      {
        v15 = std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>(&v16, v19);
      }
      else
      {
        std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>(v17, v19);
        v15 = v14 + 96;
      }
      v17 = v15;
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v19);
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v22);
      ++v10;
      v12 -= 4;
    }
    while (v12);
  }
  SymbolicationSession::register_dsc(v5, &v23, &v16);
  v22[0] = (void **)&v16;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](v22);
}

void sub_1B41963C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void **a29)
{
  a29 = (void **)&a10;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&a29);
  _Unwind_Resume(a1);
}

void SymbolicationSession::transform_fbs_owner(FlatbufferSymbols::SymbolOwner *this@<X1>, uint64_t a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  CSCppSegmentRange *v22;
  unsigned int *v23;
  char *v24;
  unsigned __int16 *v25;
  unsigned int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  CSCppNamedRange *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  CSCppSegmentRange *v39;
  CSCppSegmentRange *v40;
  char *v41;
  __int128 v42;
  char *v43;
  unsigned __int16 *v44;
  unsigned int v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  unsigned int v57;
  const char *v58;
  const char *v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t ArchitectureForName;
  unsigned int v66;
  unint64_t v67;
  int v68;
  unsigned __int16 *v69;
  uint64_t v70;
  int v71;
  unsigned __int16 *v72;
  uint64_t v73;
  uint64_t v74;
  const char **v75;
  const char **i;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  FlatbufferSymbols::SymbolOwner *v82;
  int v83;
  uint64_t v84;
  std::string v85;
  char v86;
  void *v87;
  CSCppSegmentRange *v88;
  unint64_t v89;
  __int128 v90;
  uint64_t v91;
  void *__p[2];
  uint64_t v93;
  unsigned __int8 v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  int v98;
  __int128 v99;
  unsigned __int8 *v100;
  std::string v101;
  char v102;
  unint64_t v103;
  const char **v104;
  const char **v105;
  uint64_t v106;
  int v107;
  __int128 v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v12 = (const char *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(this);
  v13 = v12;
  v14 = &v12[-*(int *)v12];
  if (*(unsigned __int16 *)v14 < 5u)
  {
    v15 = 0;
  }
  else
  {
    v15 = *((unsigned __int16 *)v14 + 2);
    if (v15)
      v15 += (uint64_t)&v12[*(unsigned int *)&v12[v15]];
  }
  CSUUIDStringToCFUUIDBytes(v15 + 4, &v108);
  if ((a3 & 1) == 0)
  {
    v16 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::find<UUID>((_QWORD *)(a2 + 80), &v108);
    if (v16)
    {
      v17 = v16[4];
      *(_BYTE *)a6 = 0;
      *(_BYTE *)(a6 + 96) = 0;
      *(_QWORD *)(a6 + 104) = v17;
      *(_QWORD *)(a6 + 112) = 1;
      return;
    }
  }
  v83 = a5;
  v81 = a4;
  v82 = this;
  v80 = a3;
  v84 = a2;
  v79 = a6;
  v18 = (unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - *(int *)this + 8));
  v19 = *v18;
  v87 = 0;
  v88 = 0;
  v89 = 0;
  v21 = (unsigned int *)((char *)v18 + v19 + 4);
  v20 = *(unsigned int *)((char *)v18 + v19);
  if ((_DWORD)v20)
  {
    v22 = 0;
    v23 = &v21[v20];
    do
    {
      v24 = (char *)v21 + *v21;
      v25 = (unsigned __int16 *)&v24[-*(int *)v24];
      v26 = *v25;
      if (v26 >= 5)
      {
        v27 = v25[2];
        if (v25[2])
        {
          v28 = &v24[v27];
          if (!strstr(&v24[v27 + 4 + *(unsigned int *)&v24[v27]], "__LINKINFO"))
          {
            if (v26 < 7)
            {
              v30 = 0;
              v29 = -1;
            }
            else
            {
              if (v25[3])
                v29 = *(_QWORD *)&v24[v25[3]];
              else
                v29 = -1;
              if (v26 >= 9 && v25[4])
                v30 = *(_QWORD *)&v24[v25[4]];
              else
                v30 = 0;
            }
            v31 = (CSCppNamedRange *)&v28[*(unsigned int *)v28 + 4];
            if ((unint64_t)v22 >= v89)
            {
              v32 = (v22 - (CSCppSegmentRange *)v87) >> 5;
              if ((unint64_t)(v32 + 1) >> 59)
                std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
              v33 = (uint64_t)(v89 - (_QWORD)v87) >> 4;
              if (v33 <= v32 + 1)
                v33 = v32 + 1;
              if (v89 - (unint64_t)v87 >= 0x7FFFFFFFFFFFFFE0)
                v34 = 0x7FFFFFFFFFFFFFFLL;
              else
                v34 = v33;
              if (v34)
              {
                v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>((uint64_t)&v89, v34);
                v37 = v36;
              }
              else
              {
                v35 = 0;
                v37 = 0;
              }
              CSCppSegmentRange::CSCppSegmentRange((CSCppSegmentRange *)&v35[32 * v32], v29, v30, v31, 0);
              v40 = (CSCppSegmentRange *)v87;
              v39 = v88;
              v41 = v38;
              if (v88 != v87)
              {
                do
                {
                  v42 = *((_OWORD *)v39 - 1);
                  *((_OWORD *)v41 - 2) = *((_OWORD *)v39 - 2);
                  *((_OWORD *)v41 - 1) = v42;
                  v41 -= 32;
                  v39 = (CSCppSegmentRange *)((char *)v39 - 32);
                }
                while (v39 != v40);
                v39 = v40;
              }
              v43 = &v35[32 * v37];
              v22 = (CSCppSegmentRange *)(v38 + 32);
              v87 = v41;
              v88 = (CSCppSegmentRange *)(v38 + 32);
              v89 = (unint64_t)v43;
              if (v39)
                operator delete(v39);
            }
            else
            {
              CSCppSegmentRange::CSCppSegmentRange(v22, v29, v30, (CSCppNamedRange *)&v28[*(unsigned int *)v28 + 4], 0);
              v22 = (CSCppSegmentRange *)((char *)v22 + 32);
            }
            v88 = v22;
          }
        }
      }
      ++v21;
    }
    while (v21 != v23);
  }
  v44 = (unsigned __int16 *)&v13[-*(int *)v13];
  v45 = *v44;
  v46 = "<unknown>";
  if (v45 >= 7)
  {
    v47 = v44[3];
    if (v44[3])
      v47 += (uint64_t)&v13[*(unsigned int *)&v13[v47]];
    if (v45 < 0x13)
    {
      if (v45 < 0x11)
      {
        if (!v47)
        {
          v49 = 0;
LABEL_56:
          if (v49)
            v46 = (char *)(v49 + 4);
          goto LABEL_58;
        }
LABEL_54:
        v46 = (char *)(v47 + 4);
        goto LABEL_58;
      }
      v48 = 0;
    }
    else
    {
      v48 = v44[9];
      if (v44[9])
        v48 += (uint64_t)&v13[*(unsigned int *)&v13[v48]];
    }
    v49 = v44[8];
    if (v49)
      v49 += (uint64_t)&v13[*(unsigned int *)&v13[v49]];
    if (!v47)
    {
      if (v48)
      {
        v46 = (char *)(v48 + 4);
        goto LABEL_58;
      }
      goto LABEL_56;
    }
    goto LABEL_54;
  }
LABEL_58:
  v50 = CSCppStringCache::intern((CSCppStringCache *)(v84 + 16), v46);
  v51 = *(int *)v13;
  if (*(unsigned __int16 *)&v13[-v51] >= 0x17u
    && (v52 = *(unsigned __int16 *)&v13[-v51 + 22], *(_WORD *)&v13[-v51 + 22]))
  {
    v53 = &v13[v52];
    v54 = *(unsigned int *)&v13[v52];
    v85.__r_.__value_.__s.__data_[0] = 0;
    v86 = 0;
    *(_QWORD *)&v90 = &v53[v54 + 4];
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>(&v85, (std::string::value_type **)&v90);
    v55 = -(uint64_t)*(int *)v13;
  }
  else
  {
    v55 = -v51;
    v85.__r_.__value_.__s.__data_[0] = 0;
    v86 = 0;
  }
  v56 = &v13[v55];
  v57 = *(unsigned __int16 *)v56;
  if (v57 < 0xD)
  {
LABEL_73:
    v66 = 0;
    v67 = 0;
    goto LABEL_77;
  }
  if (!*((_WORD *)v56 + 6))
  {
    if (v57 >= 0xF)
    {
      v64 = *((unsigned __int16 *)v56 + 7);
      if (v64)
      {
        ArchitectureForName = CSArchitectureGetArchitectureForName(&v13[v64 + 4 + *(unsigned int *)&v13[v64]]);
        v66 = ArchitectureForName;
        v67 = ArchitectureForName & 0xFFFFFFFF00000000;
        goto LABEL_77;
      }
    }
    goto LABEL_73;
  }
  v58 = &v13[*((unsigned __int16 *)v56 + 6) + *(unsigned int *)&v13[*((unsigned __int16 *)v56 + 6)]];
  v59 = &v58[-*(int *)v58];
  v60 = *(unsigned __int16 *)v59;
  if (v60 < 7)
  {
    LODWORD(v61) = 0;
LABEL_75:
    v63 = 0;
    goto LABEL_76;
  }
  v61 = *((unsigned __int16 *)v59 + 3);
  if (*((_WORD *)v59 + 3))
    LODWORD(v61) = *(_DWORD *)&v58[v61];
  if (v60 < 9)
    goto LABEL_75;
  v62 = *((unsigned __int16 *)v59 + 4);
  if (!v62)
    goto LABEL_75;
  v63 = *(unsigned int *)&v58[v62];
LABEL_76:
  v67 = v63 << 32;
  v66 = v61;
LABEL_77:
  v68 = v83 | 1;
  v69 = (unsigned __int16 *)((char *)v82 - *(int *)v82);
  if (*v69 >= 0xFu)
  {
    v70 = v69[7];
    if (v70)
    {
      if (*((_BYTE *)v82 + v70))
        v68 = v83 | 0x201;
    }
  }
  if (*(_BYTE *)(v81 + 16) && *(_OWORD *)v81 == v108)
    v68 |= 0x10u;
  v99 = v108;
  v100 = v50;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v101, (__int128 *)&v85);
  v103 = v67 | v66;
  v104 = 0;
  v105 = 0;
  v106 = 0;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>(&v104, v87, (uint64_t)v88, (v88 - (CSCppSegmentRange *)v87) >> 5);
  v107 = v68;
  if ((v80 & 1) != 0)
  {
    std::pair<LibraryDescription,std::nullopt_t>::pair[abi:ne180100]<LibraryDescription&,std::nullopt_t const&,0>((uint64_t)&v90, &v99);
    *(_OWORD *)v79 = v90;
    *(_QWORD *)(v79 + 16) = v91;
    *(_BYTE *)(v79 + 24) = 0;
    *(_BYTE *)(v79 + 48) = 0;
    v71 = v94;
    if (v94)
    {
      *(_OWORD *)(v79 + 24) = *(_OWORD *)__p;
      *(_QWORD *)(v79 + 40) = v93;
      __p[1] = 0;
      v93 = 0;
      __p[0] = 0;
      *(_BYTE *)(v79 + 48) = 1;
    }
    *(_QWORD *)(v79 + 56) = v95;
    *(_OWORD *)(v79 + 64) = v96;
    *(_QWORD *)(v79 + 80) = v97;
    v96 = 0uLL;
    v97 = 0;
    *(_DWORD *)(v79 + 88) = v98;
    *(_BYTE *)(v79 + 96) = 1;
    *(_BYTE *)(v79 + 104) = 0;
    *(_BYTE *)(v79 + 112) = 0;
    if (v71 && SHIBYTE(v93) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v72 = (unsigned __int16 *)((char *)v82 - *(int *)v82);
    if (*v72 >= 0xBu && (v73 = v72[5]) != 0)
      v74 = *(_QWORD *)((char *)v82 + v73);
    else
      v74 = -1;
    v75 = v104;
    for (i = v105; v75 != i; v75 += 4)
    {
      if (!strcmp(v75[2], "__PAGEZERO"))
        v77 = 0;
      else
        v77 = (uint64_t)&(*v75)[-v74];
      *v75 = (const char *)v77;
    }
    v78 = SymbolicationSession::register_library((SymbolicationSession *)v84, (LibraryDescription *)&v99);
    *(_BYTE *)v79 = 0;
    *(_BYTE *)(v79 + 96) = 0;
    *(_QWORD *)(v79 + 104) = v78;
    *(_BYTE *)(v79 + 112) = 1;
  }
  if (v104)
  {
    v105 = v104;
    operator delete(v104);
  }
  if (v102 && SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v101.__r_.__value_.__l.__data_);
  if (v86 && SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v85.__r_.__value_.__l.__data_);
  if (v87)
  {
    v88 = (CSCppSegmentRange *)v87;
    operator delete(v87);
  }
}

void sub_1B4196AEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,void *a24,uint64_t a25)
{
  if (a23 && a22 < 0)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::register_dsc(uint64_t *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t result;

  v4 = a1 + 15;
  v5 = a1[16];
  if (v5 >= a1[17])
  {
    result = std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__emplace_back_slow_path<UUID const&,std::vector<LibraryDescription> const&>(v4, a2, a3);
  }
  else
  {
    std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__construct_one_at_end[abi:ne180100]<UUID const&,std::vector<LibraryDescription> const&>((uint64_t)v4, a2, a3);
    result = v5 + 40;
  }
  a1[16] = result;
  return result;
}

void ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2(uint64_t a1, FlatbufferSymbols::Symbolicator *a2)
{
  SymbolicationSession *v3;
  FlatbufferSymbols::SymbolOwner *PrimarySharedCacheInFlatbufferSymbolicator;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t dsc;
  char v13;
  uint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int *v29;
  FlatbufferSymbols::SymbolOwner *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  _QWORD *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void *__p;
  _QWORD *v51;
  unint64_t v52;
  __int128 v53;
  char v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  UUID v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = *(SymbolicationSession **)(a1 + 32);
  PrimarySharedCacheInFlatbufferSymbolicator = (FlatbufferSymbols::SymbolOwner *)_findPrimarySharedCacheInFlatbufferSymbolicator(a2);
  if (PrimarySharedCacheInFlatbufferSymbolicator)
  {
    v5 = (unsigned __int16 *)((char *)PrimarySharedCacheInFlatbufferSymbolicator
                            - *(int *)PrimarySharedCacheInFlatbufferSymbolicator);
    if (*v5 >= 9u && (v6 = v5[4]) != 0)
      v7 = *(_QWORD *)((char *)PrimarySharedCacheInFlatbufferSymbolicator + v6);
    else
      v7 = -1;
    v8 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(PrimarySharedCacheInFlatbufferSymbolicator);
    v9 = v8;
    v10 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v10 < 5u)
    {
      v11 = 0;
    }
    else
    {
      v11 = v10[2];
      if (v11)
        v11 += (uint64_t)v8 + *(unsigned int *)((char *)v8 + v11);
    }
    CSUUIDStringToCFUUIDBytes(v11 + 4, v61);
    dsc = SymbolicationSession::find_dsc(v3, (const UUID *)v61);
    if (!v13)
      std::__throw_bad_optional_access[abi:ne180100]();
    v14 = dsc;
    v15 = (unsigned __int16 *)((char *)v9 - *v9);
    if (*v15 >= 0x15u && (v16 = v15[10]) != 0)
      v17 = *(_QWORD *)((char *)v9 + v16);
    else
      v17 = -1;
    v18 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(a2);
    v19 = v18;
    v20 = (unsigned __int16 *)((char *)v18 - *v18);
    if (*v20 >= 7u && (v21 = v20[3]) != 0)
      v22 = *(_QWORD *)((char *)v18 + v21);
    else
      LODWORD(v22) = -1;
    v46 = SymbolicationSession::lookup_or_register_process(v3, v22);
    v23 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v23 >= 0xBu)
    {
      v24 = v23[5];
      if (v24)
        CSUUIDStringToCFUUIDBytes((char *)v19 + v24 + *(unsigned int *)((char *)v19 + v24) + 4, &v60);
    }
    v47 = v17;
    v48 = v14;
    v25 = (unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 - *(int *)a2 + 8));
    v26 = *v25;
    __p = 0;
    v51 = 0;
    v52 = 0;
    v28 = (unsigned int *)((char *)v25 + v26 + 4);
    v27 = *(unsigned int *)((char *)v25 + v26);
    if ((_DWORD)v27)
    {
      v29 = &v28[v27];
      do
      {
        v30 = (FlatbufferSymbols::SymbolOwner *)((char *)v28 + *v28);
        v53 = v60;
        v54 = 1;
        SymbolicationSession::transform_fbs_owner(v30, (uint64_t)v3, 0, (uint64_t)&v53, 0, (uint64_t)&v55);
        v31 = (unsigned __int16 *)((char *)v30 - *(int *)v30);
        if (*v31 >= 0xBu && (v32 = v31[5]) != 0)
          v33 = *(_QWORD *)((char *)v30 + v32);
        else
          v33 = -1;
        if (!v59)
          std::__throw_bad_optional_access[abi:ne180100]();
        v34 = v58;
        v35 = v51;
        if ((unint64_t)v51 >= v52)
        {
          v37 = __p;
          v38 = ((char *)v51 - (_BYTE *)__p) >> 4;
          v39 = v38 + 1;
          if ((unint64_t)(v38 + 1) >> 60)
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          v40 = v52 - (_QWORD)__p;
          if ((uint64_t)(v52 - (_QWORD)__p) >> 3 > v39)
            v39 = v40 >> 3;
          if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0)
            v41 = 0xFFFFFFFFFFFFFFFLL;
          else
            v41 = v39;
          if (v41)
          {
            v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)&v52, v41);
            v37 = __p;
            v35 = v51;
          }
          else
          {
            v42 = 0;
          }
          v43 = &v42[16 * v38];
          *(_QWORD *)v43 = v34;
          *((_QWORD *)v43 + 1) = v33;
          v44 = v43;
          if (v35 != v37)
          {
            do
            {
              *((_OWORD *)v44 - 1) = *((_OWORD *)v35 - 1);
              v44 -= 16;
              v35 -= 2;
            }
            while (v35 != v37);
            v37 = __p;
          }
          v36 = v43 + 16;
          __p = v44;
          v51 = v43 + 16;
          v52 = (unint64_t)&v42[16 * v41];
          if (v37)
            operator delete(v37);
        }
        else
        {
          *v51 = v58;
          v35[1] = v33;
          v36 = v35 + 2;
        }
        v51 = v36;
        std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v55);
        ++v28;
      }
      while (v28 != v29);
    }
    v45 = (_QWORD *)operator new();
    v55 = 0;
    v56 = 0;
    v57 = 0;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>(&v55, __p, (uint64_t)v51, ((char *)v51 - (_BYTE *)__p) >> 4);
    *v45 = &off_1E677A828;
    v45[1] = 0;
    v45[2] = v48;
    v45[3] = v7;
    v45[4] = v47 + v7;
    v45[6] = 0;
    v45[7] = 0;
    v45[5] = 0;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>(v45 + 5, v55, (uint64_t)v56, (v56 - (_BYTE *)v55) >> 4);
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    v49 = v45;
    SymbolicationSession::add_operator(v3, v46, (uint64_t *)&v49);
    if (v49)
      (*(void (**)(_QWORD *))(*v49 + 16))(v49);
    if (__p)
    {
      v51 = __p;
      operator delete(__p);
    }
  }
}

void sub_1B4196FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (a13)
    (*(void (**)(uint64_t))(*(_QWORD *)a13 + 16))(a13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::find_dsc(SymbolicationSession *this, const UUID *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)*((_QWORD *)this + 15);
  v3 = *((_QWORD *)this + 16) - (_QWORD)v2;
  if (!v3)
    return 0;
  result = 0;
  v5 = v3 / 40;
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  while (*v2 != *(_QWORD *)a2 || v2[1] != *(_QWORD *)&(*a2)[8])
  {
    ++result;
    v2 += 5;
    if (v6 == result)
      return 0;
  }
  return result;
}

uint64_t SymbolicationSession::process_ats_kernel_chunk(SymbolicationSession *this, const __CFData *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___ZN20SymbolicationSession24process_ats_kernel_chunkEPK8__CFData_block_invoke;
  v3[3] = &__block_descriptor_tmp_18_1;
  v3[4] = this;
  return _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a2, 0, (uint64_t)v3);
}

void ___ZN20SymbolicationSession24process_ats_kernel_chunkEPK8__CFData_block_invoke(uint64_t a1, FlatbufferSymbols::SymbolOwner *this)
{
  SymbolicationSession *v3;
  int *v4;
  int *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int *v16;
  FlatbufferSymbols::SymbolOwner *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *__p;
  char *v37;
  char *v38;
  __int128 v39;
  char v40;
  uint64_t v41[13];
  uint64_t v42;
  char v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = *(SymbolicationSession **)(a1 + 32);
  v4 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(this);
  v5 = v4;
  v6 = (unsigned __int16 *)((char *)v4 - *v4);
  if (*v6 >= 7u && (v7 = v6[3]) != 0)
    v8 = *(_QWORD *)((char *)v4 + v7);
  else
    LODWORD(v8) = -1;
  v9 = SymbolicationSession::lookup_or_register_process(v3, v8);
  v10 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v10 >= 0xBu)
  {
    v11 = v10[5];
    if (v11)
      CSUUIDStringToCFUUIDBytes((char *)v5 + v11 + *(unsigned int *)((char *)v5 + v11) + 4, &v44);
  }
  v34 = v9;
  v12 = (unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - *(int *)this + 8));
  v13 = *v12;
  __p = 0;
  v37 = 0;
  v38 = 0;
  v15 = (unsigned int *)((char *)v12 + v13 + 4);
  v14 = *(unsigned int *)((char *)v12 + v13);
  if ((_DWORD)v14)
  {
    v16 = &v15[v14];
    do
    {
      v17 = (FlatbufferSymbols::SymbolOwner *)((char *)v15 + *v15);
      v39 = v44;
      v40 = 1;
      SymbolicationSession::transform_fbs_owner(v17, (uint64_t)v3, 0, (uint64_t)&v39, 4096, (uint64_t)v41);
      v18 = (unsigned __int16 *)((char *)v17 - *(int *)v17);
      if (*v18 >= 0xBu && (v19 = v18[5]) != 0)
        v20 = *(_QWORD *)((char *)v17 + v19);
      else
        v20 = -1;
      if (!v43)
        std::__throw_bad_optional_access[abi:ne180100]();
      v21 = v42;
      v22 = v37;
      if (v37 >= v38)
      {
        v24 = (char *)__p;
        v25 = (v37 - (_BYTE *)__p) >> 4;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 60)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v27 = v38 - (_BYTE *)__p;
        if ((v38 - (_BYTE *)__p) >> 3 > v26)
          v26 = v27 >> 3;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
          v28 = 0xFFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)&v38, v28);
          v24 = (char *)__p;
          v22 = v37;
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[16 * v25];
        *(_QWORD *)v30 = v21;
        *((_QWORD *)v30 + 1) = v20;
        v31 = v30;
        if (v22 != v24)
        {
          do
          {
            *((_OWORD *)v31 - 1) = *((_OWORD *)v22 - 1);
            v31 -= 16;
            v22 -= 16;
          }
          while (v22 != v24);
          v24 = (char *)__p;
        }
        v23 = v30 + 16;
        __p = v31;
        v37 = v30 + 16;
        v38 = &v29[16 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        *(_QWORD *)v37 = v42;
        *((_QWORD *)v22 + 1) = v20;
        v23 = v22 + 16;
      }
      v37 = v23;
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v41);
      ++v15;
    }
    while (v15 != v16);
  }
  std::make_unique[abi:ne180100]<AS::LoadOperator,std::vector<AS::LoadDescription> &,unsigned long long const&>((uint64_t)&__p, &kCSBeginningOfTime, v41);
  v32 = v41[0];
  v41[0] = 0;
  v35 = v32;
  SymbolicationSession::add_operator(v3, v34, &v35);
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 16))(v35);
  v33 = v41[0];
  v41[0] = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 16))(v33);
  if (__p)
  {
    v37 = (char *)__p;
    operator delete(__p);
  }
}

void sub_1B41973DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _Unwind_Resume(exception_object);
}

std::string *std::optional<std::string>::operator=[abi:ne180100]<char const*,void>(std::string *a1, std::string::value_type **a2)
{
  std::string::value_type *v3;

  v3 = *a2;
  if (a1[1].__r_.__value_.__s.__data_[0])
  {
    std::string::__assign_external(a1, v3);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, v3);
    a1[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return a1;
}

_QWORD *SymbolicationSession::advance_managed_symbolicators(SymbolicationSession *this, unint64_t a2)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t *v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;

  v10 = a2;
  v4 = *((_QWORD *)this + 28);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::find<unsigned long long>((_QWORD *)this + 23, &v10);
  if (result)
  {
    v6 = (uint64_t *)result[3];
    v7 = (uint64_t *)result[4];
    if (v6 != v7)
    {
      v8 = (_QWORD *)(v4 + 24 * a2 + 8);
      do
      {
        v9 = *v6++;
        result = (_QWORD *)(***(uint64_t (****)(_QWORD, uint64_t, SymbolicationSession *))(*v8 - 8))(*(_QWORD *)(*v8 - 8), v9, this);
      }
      while (v6 != v7);
    }
  }
  return result;
}

uint64_t SymbolicationSession::create_pid_symbolicator(SymbolicationSession *this, int a2, int a3, uint64_t a4)
{
  uint64_t *v7;
  CSCppFakeTask *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  void *__p;
  void *v40;
  char *v41;
  void *v42;
  char *v43;
  char *v44;
  CSCppFakeTask *v45;
  unint64_t v46;
  int v47;

  v47 = a2;
  v7 = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>((_QWORD *)this + 18, &v47);
  if (!v7)
    return 0;
  v46 = v7[3];
  v8 = (CSCppFakeTask *)operator new();
  CSCppFakeTask::CSCppFakeTask(v8, v47, 0);
  v45 = v8;
  SymbolicationSession::create_symbolicator(this, &v45, v46, v47 == 0, a4, &v38);
  v9 = v38;
  if (v45)
    (*(void (**)(CSCppFakeTask *))(*(_QWORD *)v45 + 8))(v45);
  if ((*((_BYTE *)this + 256) & 2) != 0)
  {
    if (!*(_QWORD *)(v9 + 80))
      *(_QWORD *)(v9 + 80) = *((_QWORD *)this + 33);
    *(_BYTE *)(v9 + 88) |= 1u;
  }
  if (a3)
  {
    v10 = (char *)this + 184;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::find<unsigned long long>((_QWORD *)this + 23, &v46);
    if (v11)
    {
      v12 = v11;
      v15 = v11[5];
      v13 = (uint64_t)(v11 + 5);
      v14 = v15;
      v16 = *(uint64_t **)(v13 - 8);
      if ((unint64_t)v16 >= v15)
      {
        v25 = (void **)(v13 - 16);
        v26 = *(_QWORD *)(v13 - 16);
        v27 = ((uint64_t)v16 - v26) >> 3;
        if ((unint64_t)(v27 + 1) >> 61)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v28 = v14 - v26;
        v29 = v28 >> 2;
        if (v28 >> 2 <= (unint64_t)(v27 + 1))
          v29 = v27 + 1;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v30 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v30 = v29;
        if (v30)
          v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v13, v30);
        else
          v31 = 0;
        v32 = (uint64_t *)&v31[8 * v27];
        v33 = &v31[8 * v30];
        *v32 = v9;
        v17 = v32 + 1;
        v35 = (char *)v12[3];
        v34 = (char *)v12[4];
        if (v34 != v35)
        {
          do
          {
            v36 = *((_QWORD *)v34 - 1);
            v34 -= 8;
            *--v32 = v36;
          }
          while (v34 != v35);
          v34 = (char *)*v25;
        }
        v12[3] = v32;
        v12[4] = v17;
        v12[5] = v33;
        if (v34)
          operator delete(v34);
      }
      else
      {
        *v16 = v9;
        v17 = v16 + 1;
      }
      v12[4] = v17;
    }
    else
    {
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, 1uLL);
      v20 = &v18[8 * v19];
      *(_QWORD *)v18 = v9;
      v21 = v18 + 8;
      v23 = (char *)v42;
      v22 = v43;
      if (v43 != v42)
      {
        do
        {
          v24 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          *((_QWORD *)v18 - 1) = v24;
          v18 -= 8;
        }
        while (v22 != v23);
        v22 = (char *)v42;
      }
      v42 = v18;
      v43 = v21;
      v44 = v20;
      if (v22)
      {
        operator delete(v22);
        v18 = (char *)v42;
        v20 = v44;
      }
      v38 = v46;
      __p = v18;
      v40 = v21;
      v41 = v20;
      v43 = 0;
      v44 = 0;
      v42 = 0;
      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,std::vector<CSCppSymbolicator *>>>((uint64_t)v10, (unint64_t *)&v38, (uint64_t)&v38);
      if (__p)
      {
        v40 = __p;
        operator delete(__p);
      }
      if (v42)
      {
        v43 = (char *)v42;
        operator delete(v42);
      }
    }
    CSCppReferenceCount::retain(v9);
  }
  return v9;
}

void sub_1B419777C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::create_symbolicator(SymbolicationSession *this@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  int v12;
  uint64_t v13;
  const void ***v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  AS::LoadOperator *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  const void **v25;
  unsigned int v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *__p;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void **v38;

  v12 = *((_DWORD *)this + 64);
  if ((v12 & 1) != 0)
  {
    SymbolicationSession::fixup_address_space(this, a3);
    v12 = *((_DWORD *)this + 64);
  }
  v13 = *((_QWORD *)this + 28);
  v14 = (const void ***)(v13 + 24 * a3);
  v36 = 0uLL;
  v37 = 0;
  if ((v12 & 2) == 0 || (a4 & 1) != 0)
  {
    if ((v12 & 2) != 0 && a4)
    {
      if (!v18)
        __cxa_bad_cast();
    }
    else
    {
      if (!v18)
        __cxa_bad_cast();
    }
    AS::LoadOperator::generate_owners(v18, this, (char **)&v30);
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vdeallocate((void **)&v36);
    v36 = v30;
    v37 = v31;
    *(_QWORD *)&v31 = 0;
    v30 = 0uLL;
    *(_QWORD *)&v28 = &v30;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  }
  else
  {
    if (!v15)
      __cxa_bad_cast();
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)&v30 = &off_1E677A828;
    *((_QWORD *)&v30 + 1) = v16;
    v17 = *((_QWORD *)v15 + 4);
    v31 = *((_OWORD *)v15 + 1);
    v32 = v17;
    __p = 0;
    v34 = 0;
    v35 = 0;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>(&__p, *((const void **)v15 + 5), *((_QWORD *)v15 + 6), (uint64_t)(*((_QWORD *)v15 + 6) - *((_QWORD *)v15 + 5)) >> 4);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*a2 + 80))(*a2, *((_QWORD *)this + 15) + 40 * v31);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*a2 + 88))(*a2, v32);
    AS::FullCreationOperator::generate_owners((AS::FullCreationOperator *)&v30, this, (uint64_t)&v28);
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vdeallocate((void **)&v36);
    v36 = v28;
    v37 = v29;
    v29 = 0;
    v28 = 0uLL;
    v38 = (void **)&v28;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v38);
    *(_QWORD *)&v30 = &off_1E677A828;
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }
  }
  v19 = operator new();
  v20 = *a2;
  *a2 = 0;
  *(_QWORD *)&v28 = v20;
  CSCppSymbolicator::CSCppSymbolicator(v19, &v36, &v28, a5, 0);
  *a6 = v19;
  v21 = v28;
  *(_QWORD *)&v28 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  v22 = v13 + 24 * a3;
  v24 = *(_QWORD *)(v22 + 8);
  v23 = (_QWORD *)(v22 + 8);
  v25 = *v14;
  if ((unint64_t)(v24 - (_QWORD)*v14) >= 9)
  {
    v26 = 2;
    v27 = 1;
    do
    {
      (**(void (***)(const void *, uint64_t, SymbolicationSession *))v25[v27])(v25[v27], v19, this);
      v27 = v26;
      v25 = *v14;
      ++v26;
    }
    while (v27 < (uint64_t)(*v23 - (_QWORD)*v14) >> 3);
  }
  *(_QWORD *)&v30 = &v36;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
}

void sub_1B4197AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,char a21)
{
  uint64_t v21;

  a13 = (char *)(v21 + 16);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  a13 = &a21;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::fixup_address_space(SymbolicationSession *this, uint64_t a2)
{
  uint64_t **v2;
  uint64_t **v3;
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  const void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  _OWORD *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *i;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v45;
  void *__p;
  char *v47;
  char *v48;
  _OWORD v49[2];
  int v50;

  v2 = (uint64_t **)(*((_QWORD *)this + 28) + 24 * a2);
  memset(v49, 0, sizeof(v49));
  v50 = 1065353216;
  __p = 0;
  v47 = 0;
  v48 = 0;
  v3 = v2 + 1;
  v4 = *v2;
  v5 = v2[1] - *v2 - 1;
  if (v5 >= 2)
  {
    v6 = 1;
    do
    {
      v7 = (const void *)v4[v6];
      if (v7)
      {
        if (v8)
        {
          if (*((_BYTE *)v8 + 40))
          {
            v9 = (_QWORD *)v8[2];
            v10 = (_QWORD *)v8[3];
            while (v9 != v10)
            {
              std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>((uint64_t)v49, v9, v9);
              v9 += 2;
            }
          }
          else
          {
            std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>((uint64_t)v49, v8 + 2, (_OWORD *)v8 + 1);
          }
        }
        else
        {
          if (v11)
          {
            v12 = v11 + 16;
            if (!std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>(v49, (_QWORD *)v11 + 2))
            {
              v13 = v47;
              if (v47 >= v48)
              {
                v15 = (v47 - (_BYTE *)__p) >> 4;
                v16 = v15 + 1;
                if ((unint64_t)(v15 + 1) >> 60)
                  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
                v17 = v48 - (_BYTE *)__p;
                if ((v48 - (_BYTE *)__p) >> 3 > v16)
                  v16 = v17 >> 3;
                if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
                  v18 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v18 = v16;
                if (v18)
                  v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)&v48, v18);
                else
                  v19 = 0;
                v20 = &v19[16 * v15];
                *(_OWORD *)v20 = *v12;
                v22 = (char *)__p;
                v21 = v47;
                v23 = v20;
                if (v47 != __p)
                {
                  do
                  {
                    *((_OWORD *)v23 - 1) = *((_OWORD *)v21 - 1);
                    v23 -= 16;
                    v21 -= 16;
                  }
                  while (v21 != v22);
                  v21 = (char *)__p;
                }
                v14 = v20 + 16;
                __p = v23;
                v47 = v20 + 16;
                v48 = &v19[16 * v18];
                if (v21)
                  operator delete(v21);
              }
              else
              {
                *(_OWORD *)v47 = *v12;
                v14 = v13 + 16;
              }
              v47 = v14;
            }
          }
        }
      }
      v6 = (v6 + 1);
      v4 = *v2;
      v5 = *v3 - *v2 - 1;
    }
    while (v5 > v6);
  }
  v25 = (_QWORD *)v24[2];
  for (i = (_QWORD *)v24[3]; v25 != i; v25 += 2)
  {
    if (!std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>(v49, v25))
    {
      v27 = v47;
      if (v47 >= v48)
      {
        v29 = (v47 - (_BYTE *)__p) >> 4;
        v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 60)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v31 = v48 - (_BYTE *)__p;
        if ((v48 - (_BYTE *)__p) >> 3 > v30)
          v30 = v31 >> 3;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
          v32 = 0xFFFFFFFFFFFFFFFLL;
        else
          v32 = v30;
        if (v32)
          v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)&v48, v32);
        else
          v33 = 0;
        v34 = &v33[16 * v29];
        *(_OWORD *)v34 = *(_OWORD *)v25;
        v36 = (char *)__p;
        v35 = v47;
        v37 = v34;
        if (v47 != __p)
        {
          do
          {
            *((_OWORD *)v37 - 1) = *((_OWORD *)v35 - 1);
            v37 -= 16;
            v35 -= 16;
          }
          while (v35 != v36);
          v35 = (char *)__p;
        }
        v28 = v34 + 16;
        __p = v37;
        v47 = v34 + 16;
        v48 = &v33[16 * v32];
        if (v35)
          operator delete(v35);
      }
      else
      {
        *(_OWORD *)v47 = *(_OWORD *)v25;
        v28 = v27 + 16;
      }
      v47 = v28;
    }
  }
  std::make_unique[abi:ne180100]<AS::LoadOperator,std::vector<AS::LoadDescription> &,unsigned long long const&>((uint64_t)&__p, &kCSBeginningOfTime, &v45);
  v38 = *v2;
  v39 = v45;
  v45 = 0;
  v40 = *v38;
  *v38 = v39;
  if (v40)
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 16))(v40);
  v41 = v45;
  v45 = 0;
  if (v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
  v43 = *v3 - 1;
  v42 = *v43;
  *v43 = 0;
  if (v42)
    (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
  *v3 = v43;
  if (__p)
  {
    v47 = (char *)__p;
    operator delete(__p);
  }
  return std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)v49);
}

void sub_1B4197F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  if (__p)
    operator delete(__p);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::foreach_pid(uint64_t a1, uint64_t a2)
{
  uint64_t **v2;
  uint64_t v4;

  v2 = *(uint64_t ***)(a1 + 160);
  if (!v2)
    return 0;
  v4 = 0;
  do
  {
    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *((unsigned int *)v2 + 4));
    ++v4;
    v2 = (uint64_t **)*v2;
  }
  while (v2);
  return v4;
}

_QWORD *SymbolicationSession::dsc_slide_for_pid(SymbolicationSession *this, int a2)
{
  _QWORD *result;
  int v4;

  v4 = a2;
  result = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>((_QWORD *)this + 18, &v4);
  if (result)
  {
    result = **(_QWORD ***)(*((_QWORD *)this + 28) + 24 * result[3]);
    if (result)
    {
      if (result)
        return (_QWORD *)result[3];
    }
  }
  return result;
}

void std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

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
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void **v7;

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
        v6 = v4 - 40;
        v7 = (void **)(v4 - 24);
        std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v7);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        std::__destroy_at[abi:ne180100]<LibraryDescription,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<LibraryDescription,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(char *)(a1 + 47) < 0)
      operator delete(*(void **)(a1 + 24));
  }
}

_BYTE *std::__optional_copy_base<LibraryDescription,false>::__optional_copy_base[abi:ne180100](_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[96] = 0;
  if (*(_BYTE *)(a2 + 96))
  {
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>((uint64_t)a1, (__int128 *)a2);
    a1[96] = 1;
  }
  return a1;
}

void sub_1B41982C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)(a1 + 24), (__int128 *)((char *)a2 + 24));
  v5 = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>((_QWORD *)(a1 + 64), *((const void **)a2 + 8), *((_QWORD *)a2 + 9), (uint64_t)(*((_QWORD *)a2 + 9) - *((_QWORD *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_1B419834C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(_BYTE *)(v1 + 48))
  {
    if (*(char *)(v1 + 47) < 0)
      operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 96))
  {
    v2 = *(void **)(a1 + 64);
    if (v2)
    {
      *(_QWORD *)(a1 + 72) = v2;
      operator delete(v2);
    }
    if (*(_BYTE *)(a1 + 48) && *(char *)(a1 + 47) < 0)
      operator delete(*(void **)(a1 + 24));
  }
  return a1;
}

uint64_t std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TRawSymbol<Pointer32>>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[96 * v4];
  v16 = &v10[96 * v9];
  std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>((uint64_t)v14, a2);
  v15 = v14 + 96;
  std::vector<LibraryDescription>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<LibraryDescription>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1B41984B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LibraryDescription>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<LibraryDescription>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (__int128 *)*a1;
  v4 = (__int128 *)a1[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 96;
    v4 -= 6;
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription,LibraryDescription*>(v6, v4);
  }
  a2[1] = v6;
  v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

__n128 std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription,LibraryDescription*>(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;

  v2 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v2;
  *(_BYTE *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  if (*((_BYTE *)a2 + 48))
  {
    v3 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(a1 + 24) = v3;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    *(_BYTE *)(a1 + 48) = 1;
  }
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  result = (__n128)a2[4];
  *(__n128 *)(a1 + 64) = result;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 8) = 0;
  *((_QWORD *)a2 + 9) = 0;
  *((_QWORD *)a2 + 10) = 0;
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return result;
}

uint64_t std::__split_buffer<LibraryDescription>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    std::__destroy_at[abi:ne180100]<LibraryDescription,0>(i - 96);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<LibraryDescription,std::nullopt_t>::pair[abi:ne180100]<LibraryDescription&,std::nullopt_t const&,0>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)(a1 + 24), (__int128 *)((char *)a2 + 24));
  v5 = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>((_QWORD *)(a1 + 64), *((const void **)a2 + 8), *((_QWORD *)a2 + 9), (uint64_t)(*((_QWORD *)a2 + 9) - *((_QWORD *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_1B419868C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(_BYTE *)(v1 + 48))
  {
    if (*(char *)(v1 + 47) < 0)
      operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__construct_one_at_end[abi:ne180100]<UUID const&,std::vector<LibraryDescription> const&>(uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v4;
  _QWORD *result;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)v4 = *a2;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  result = std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>((_QWORD *)(v4 + 16), *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 5));
  *(_QWORD *)(a1 + 8) = v4 + 40;
  return result;
}

void sub_1B4198708(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__emplace_back_slow_path<UUID const&,std::vector<LibraryDescription> const&>(uint64_t *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v16[2];
  char *v17;
  char *v18;
  uint64_t *v19;

  v4 = *a1;
  v5 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0x666666666666666)
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  v9 = (uint64_t)(a1 + 2);
  v10 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6)
    v6 = 2 * v10;
  if (v10 >= 0x333333333333333)
    v11 = 0x666666666666666;
  else
    v11 = v6;
  v19 = a1 + 2;
  if (v11)
    v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppDyldSplitSharedCacheMemory::CacheMemoryAndPath>>(v9, v11);
  else
    v12 = 0;
  v13 = &v12[40 * v5];
  v16[0] = v12;
  v16[1] = v13;
  v17 = v13;
  v18 = &v12[40 * v11];
  *(_OWORD *)v13 = *a2;
  *((_QWORD *)v13 + 3) = 0;
  *((_QWORD *)v13 + 4) = 0;
  *((_QWORD *)v13 + 2) = 0;
  std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>((_QWORD *)v13 + 2, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 5));
  v17 += 40;
  std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__swap_out_circular_buffer(a1, v16);
  v14 = a1[1];
  std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::~__split_buffer(v16);
  return v14;
}

void sub_1B4198828(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<TRawSymbol<Pointer32>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<LibraryDescription>,LibraryDescription*,LibraryDescription*,LibraryDescription*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B41988A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<LibraryDescription>,LibraryDescription*,LibraryDescription*,LibraryDescription*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription&,LibraryDescription*>(a4 + v7, (__int128 *)(a2 + v7));
      v7 += 96;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1B419891C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v2)
  {
    v4 = v1 - 96;
    do
    {
      std::__destroy_at[abi:ne180100]<LibraryDescription,0>(v4 + v2);
      v2 -= 96;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription&,LibraryDescription*>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)(a1 + 24), (__int128 *)((char *)a2 + 24));
  v5 = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>((_QWORD *)(a1 + 64), *((const void **)a2 + 8), *((_QWORD *)a2 + 9), (uint64_t)(*((_QWORD *)a2 + 9) - *((_QWORD *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_1B41989B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(_BYTE *)(v1 + 48))
  {
    if (*(char *)(v1 + 47) < 0)
      operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  char v11;
  __int128 v12;
  __int128 v13;

  v7 = a7;
  *(_QWORD *)&v13 = a6;
  *((_QWORD *)&v13 + 1) = a7;
  v12 = v13;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  if (a3 == a5)
  {
    v8 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 - 8);
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      v7 = *((_QWORD *)&v13 + 1) - 40;
      *((_QWORD *)&v13 + 1) -= 40;
      a3 -= 40;
    }
    while (a3 != a5);
    v8 = v13;
  }
  v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v8;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = (void **)(v1 + 16);
    std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 40;
  }
}

void **std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 40;
    v4 = (void **)(i - 24);
    std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

uint64_t std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>::operator()[abi:ne180100](uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 3;
  }
}

void **std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 24);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

uint64_t std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B4198ED0(_Unwind_Exception *exception_object)
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

void std::default_delete<EventAggregator>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(a2 + 88);
    std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::~__hash_table(a2 + 48);
    std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(a2 + 8);
    JUMPOUT(0x1B5E36940);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,LibraryConstructionState>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,LibraryConstructionState>,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(_QWORD *)(a1 + 80) = v2;
    operator delete(v2);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(char *)(a1 + 55) < 0)
      operator delete(*(void **)(a1 + 32));
  }
}

uint64_t *std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>(_QWORD *a1, int *a2)
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

_QWORD *std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
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

void sub_1B41992BC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,unsigned long>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,unsigned long>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
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
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[4] = 0;
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
    *i = *v21;
LABEL_42:
    *v21 = i;
    goto LABEL_43;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v4) = a1 + 16;
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
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1B41994E8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,std::vector<CSCppSymbolicator *>>>(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  char *v10;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

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
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (char *)*v9;
      if (*v9)
      {
        do
        {
          v11 = *((_QWORD *)v10 + 1);
          if (v11 == v6)
          {
            if (*((_QWORD *)v10 + 2) == v6)
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
          v10 = *(char **)v10;
        }
        while (v10);
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  v10 = (char *)operator new(0x30uLL);
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v6;
  *((_QWORD *)v10 + 2) = *(_QWORD *)a3;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a3 + 8);
  *((_QWORD *)v10 + 5) = *(_QWORD *)(a3 + 24);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
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
    *(_QWORD *)v10 = *v20;
LABEL_38:
    *v20 = v10;
    goto LABEL_39;
  }
  *(_QWORD *)v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v19 + 8 * v3) = v12;
  if (*(_QWORD *)v10)
  {
    v21 = *(_QWORD *)(*(_QWORD *)v10 + 8);
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
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1B419973C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
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

  v6 = a2[1];
  v7 = (v6 + (*a2 << 6) + (*a2 >> 2) + 2654435769) ^ *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = (v6 + (*a2 << 6) + (*a2 >> 2) + 2654435769) ^ *a2;
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = v7 & (v8 - 1);
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == v6)
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
          if (v12 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  *((_OWORD *)i + 1) = *a3;
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
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_42:
    *v21 = i;
    goto LABEL_43;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
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
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1B4199978(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  uint64_t v3;
  unint64_t v4;
  uint8x8_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *result;
  unint64_t v9;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = a2[1];
  v4 = (v3 + (*a2 << 6) + (*a2 >> 2) + 2654435769) ^ *a2;
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = (v3 + (*a2 << 6) + (*a2 >> 2) + 2654435769) ^ *a2;
    if (v4 >= *(_QWORD *)&v2)
      v6 = v4 % *(_QWORD *)&v2;
  }
  else
  {
    v6 = v4 & (*(_QWORD *)&v2 - 1);
  }
  v7 = *(_QWORD **)(*a1 + 8 * v6);
  if (!v7)
    return 0;
  result = (_QWORD *)*v7;
  if (*v7)
  {
    do
    {
      v9 = result[1];
      if (v9 == v4)
      {
        if (result[2] == *a2 && result[3] == v3)
          return result;
      }
      else
      {
        if (v5.u32[0] > 1uLL)
        {
          if (v9 >= *(_QWORD *)&v2)
            v9 %= *(_QWORD *)&v2;
        }
        else
        {
          v9 &= *(_QWORD *)&v2 - 1;
        }
        if (v9 != v6)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t catch_mach_exception_raise()
{
  return 5;
}

uint64_t catch_mach_exception_raise_state(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, const void *a6, unsigned int a7, _QWORD *a8, unsigned int *a9)
{
  vm_offset_t v12;
  uint64_t result;
  integer_t ref_count[2];
  uint8_t buf[4];
  vm_offset_t v16;
  __int16 v17;
  integer_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*a3 == 1)
    return 5;
  *(_QWORD *)ref_count = 0;
  v12 = a3[1];
  if (vm_map_page_query(*MEMORY[0x1E0C83DA0], v12, &ref_count[1], ref_count))
    return 5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v16 = v12;
    v17 = 1024;
    v18 = ref_count[1];
    _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Caught EXC_BAD_ACCESS at 0x%llx, valid page mapping, page query flags (0x%x)\n", buf, 0x12u);
  }
  result = 5;
  if (a7 <= 0xF5 && *a9 >= a7)
  {
    memcpy(a8, a6, 4 * a7);
    result = 0;
    *a9 = a7;
    a8[33] = thread_exit_due_to_bad_access;
  }
  return result;
}

void thread_exit_due_to_bad_access(void)
{
  CSCppExceptionSafeThread *v0;

  if (_exception_safe_thread_key(void)::onceToken != -1)
    dispatch_once(&_exception_safe_thread_key(void)::onceToken, &__block_literal_global_3);
  v0 = (CSCppExceptionSafeThread *)pthread_getspecific(_exception_safe_thread_key(void)::est_key);
  CSCppExceptionSafeThread::runloop_exit_due_to_bad_access(v0);
}

uint64_t catch_mach_exception_raise_identity_protected(uint64_t a1, uint64_t a2, mach_port_name_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t v6;
  NSObject *v7;
  kern_return_t v8;
  mach_error_t v9;
  char *v10;
  FILE *v11;
  char *v12;
  unint64_t v13;
  thread_read_t v14;
  unint64_t v15;
  mach_port_name_t v16;
  uint64_t state;
  char *v18;
  FILE *v19;
  char *v20;
  vm_offset_t v21;
  integer_t thread_info_out[66];
  void (*v26)(void);
  mach_msg_type_number_t thread_info_outCnt;
  thread_act_array_t act_list;
  mach_msg_type_number_t act_listCnt;
  uint8_t buf[4];
  vm_offset_t v31;
  __int16 v32;
  mach_msg_type_number_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  act_listCnt = 0;
  act_list = 0;
  task_threads(*MEMORY[0x1E0C83DA0], &act_list, &act_listCnt);
  if (!act_listCnt)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_18;
  }
  v6 = 0;
  v7 = MEMORY[0x1E0C81028];
  while (1)
  {
    thread_info_outCnt = 6;
    v8 = thread_info(act_list[v6], 4u, thread_info_out, &thread_info_outCnt);
    v9 = v8;
    if (v8)
    {
      if (v8 != 268435459)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v10 = mach_error_string(v9);
          *(_DWORD *)buf = 136315138;
          v31 = (vm_offset_t)v10;
          _os_log_impl(&dword_1B40C5000, v7, OS_LOG_TYPE_ERROR, "thread_info failed due to %s", buf, 0xCu);
        }
        v11 = (FILE *)*MEMORY[0x1E0C80C10];
        v12 = mach_error_string(v9);
        fprintf(v11, "thread_info failed due to %s", v12);
      }
      goto LABEL_9;
    }
    if (*(_QWORD *)thread_info_out == a2)
      break;
LABEL_9:
    ++v6;
    v13 = act_listCnt;
    if (v6 >= act_listCnt)
    {
      v14 = 0;
      if (!act_listCnt)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  v14 = act_list[v6];
  v13 = act_listCnt;
  if (!act_listCnt)
    goto LABEL_18;
LABEL_14:
  v15 = 0;
  do
  {
    v16 = act_list[v15];
    if (v14 != v16)
    {
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v16);
      v13 = act_listCnt;
    }
    ++v15;
  }
  while (v15 < v13);
LABEL_18:
  mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)act_list, 4 * v13);
  LODWORD(act_list) = 70;
  state = thread_get_state(v14, 1, (thread_state_t)thread_info_out, (mach_msg_type_number_t *)&act_list);
  if ((_DWORD)state)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = mach_error_string(state);
      *(_DWORD *)buf = 136315138;
      v31 = (vm_offset_t)v18;
      _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "thread_get_state failed due to %s", buf, 0xCu);
    }
    v19 = (FILE *)*MEMORY[0x1E0C80C10];
    v20 = mach_error_string(state);
    fprintf(v19, "thread_get_state failed due to %s", v20);
  }
  else if (*a5 == 1
         || (act_listCnt = 0,
             thread_info_outCnt = 0,
             v21 = a5[1],
             vm_map_page_query(*MEMORY[0x1E0C83DA0], v21, (integer_t *)&act_listCnt, (integer_t *)&thread_info_outCnt)))
  {
    state = 5;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v31 = v21;
      v32 = 1024;
      v33 = act_listCnt;
      _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Caught EXC_BAD_ACCESS at 0x%llx, valid page mapping, page query flags (0x%x)\n", buf, 0x12u);
    }
    v26 = thread_exit_due_to_bad_access;
    state = thread_set_state(v14, 1, (thread_state_t)thread_info_out, (mach_msg_type_number_t)act_list);
    if (!(_DWORD)state)
    {
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], a3);
      state = 0;
    }
  }
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14);
  return state;
}

void sub_1B4199F84(_Unwind_Exception *a1)
{
  mach_port_name_t v1;

  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
  _Unwind_Resume(a1);
}

void CSCppExceptionSafeThread::CSCppExceptionSafeThread(CSCppExceptionSafeThread *this)
{
  thread_act_t v2;

  *((_QWORD *)this + 1) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *(_OWORD *)((char *)this + 172) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 80), 0);
  pthread_mutex_init((pthread_mutex_t *)this + 3, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 256), 0);
  pthread_mutex_lock((pthread_mutex_t *)this + 3);
  if (pthread_create((pthread_t *)this, 0, (void *(__cdecl *)(void *))thread_runloop_init, this))
  {
    atomic_store(0x1001u, (unsigned int *)this + 3);
  }
  else
  {
    v2 = pthread_mach_thread_np(*(pthread_t *)this);
    CSCppExceptionSafeThread::register_for_exceptions((mach_port_name_t *)this, v2);
    pthread_cond_wait((pthread_cond_t *)((char *)this + 256), (pthread_mutex_t *)this + 3);
    pthread_mutex_unlock((pthread_mutex_t *)this + 3);
  }
}

void sub_1B419A09C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::deque<TRawSymbol<Pointer32> *,std::allocator<TRawSymbol<Pointer32> *>>::~deque[abi:ne180100]((_QWORD *)(v1 + 136));
  _Unwind_Resume(a1);
}

void thread_runloop_init(CSCppExceptionSafeThread *a1)
{
  CSCppExceptionSafeThread::thread_init(a1);
  CSCppExceptionSafeThread::runloop(a1);
}

uint64_t CSCppExceptionSafeThread::register_for_exceptions(mach_port_name_t *this, thread_act_t a2)
{
  ipc_space_t *v4;
  exception_behavior_t v5;
  mach_port_name_t *v6;
  mach_error_t inserted;
  uint64_t result;
  FILE *v9;
  char *v10;
  uint8_t buf[4];
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (CSTaskIsTranslated(*MEMORY[0x1E0C83DA0]))
    v5 = -2147483646;
  else
    v5 = -2147483644;
  v6 = this + 2;
  inserted = mach_port_allocate(*v4, 1u, this + 2);
  if (inserted
    || (inserted = mach_port_insert_right(*v4, *v6, *v6, 0x14u)) != 0
    || (inserted = thread_set_exception_ports(a2, 2u, *v6, v5, 1)) != 0
    || (result = MEMORY[0x1B5E36E20](*v4, this[2], this), (inserted = result) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = mach_error_string(inserted);
      _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure while allocating exception port: %s\n", buf, 0xCu);
    }
    v9 = (FILE *)*MEMORY[0x1E0C80C10];
    v10 = mach_error_string(inserted);
    result = fprintf(v9, "failure while allocating exception port: %s\n", v10);
    if (*v6)
    {
      mach_port_mod_refs(*v4, *v6, 1u, -1);
      result = mach_port_deallocate(*v4, *v6);
      *v6 = 0;
    }
  }
  return result;
}

uint64_t CSCppExceptionSafeThread::run(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  FILE **v7;
  mach_msg_return_t v8;
  mach_error_t v9;
  char *v10;
  FILE *v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;
  os_unfair_lock_s *lock;
  _BYTE buf[12];
  __int16 v18;
  mach_error_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (CSCppExceptionSafeThread::is_current_thread((CSCppExceptionSafeThread *)a1))
  {
    *(_QWORD *)buf = a3;
    std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back((_QWORD *)(a1 + 136), buf);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    CSCppExceptionSafeThread::pop_recovery_block((CSCppExceptionSafeThread *)a1);
    return 4096;
  }
  if (!*(_DWORD *)(a1 + 8))
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    return 4096;
  }
  lock = (os_unfair_lock_s *)(a1 + 184);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 184));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_QWORD *)(a1 + 128) = a2;
  *(_QWORD *)buf = a3;
  std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back((_QWORD *)(a1 + 136), buf);
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  v6 = MEMORY[0x1E0C81028];
  v7 = (FILE **)MEMORY[0x1E0C80C10];
  do
  {
    v8 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))_exception_handler_demux, 0x40000u, *(_DWORD *)(a1 + 8), 0);
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = mach_error_string(v9);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v10;
        v18 = 1024;
        v19 = v9;
        _os_log_impl(&dword_1B40C5000, v6, OS_LOG_TYPE_ERROR, "error handling EST message: %s (%u)\n", buf, 0x12u);
      }
      v11 = *v7;
      v12 = mach_error_string(v9);
      fprintf(v11, "error handling EST message: %s (%u)\n", v12, v9);
    }
    v13 = atomic_load((unsigned int *)(a1 + 12));
  }
  while (v13 < 0x1000);
  v14 = atomic_load((unsigned int *)(a1 + 12));
  os_unfair_lock_unlock(lock);
  return v14;
}

BOOL CSCppExceptionSafeThread::is_current_thread(CSCppExceptionSafeThread *this)
{
  if (_exception_safe_thread_key(void)::onceToken != -1)
    dispatch_once(&_exception_safe_thread_key(void)::onceToken, &__block_literal_global_3);
  return pthread_getspecific(_exception_safe_thread_key(void)::est_key) != 0;
}

uint64_t CSCppExceptionSafeThread::pop_recovery_block(CSCppExceptionSafeThread *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((_QWORD *)this + 22);
  if (!v1)
    return 0;
  v2 = v1 - 1;
  v3 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 18)
                             + (((unint64_t)(*((_QWORD *)this + 21) + v2) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * ((*((_QWORD *)this + 21) + v2) & 0x1FF));
  *((_QWORD *)this + 22) = v2;
  std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__maybe_remove_back_spare[abi:ne180100]((_QWORD *)this + 17, 1);
  return v3;
}

uint64_t _exception_handler_demux(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  mach_port_context_t context;

  if (a1->msgh_id != 999)
    return mach_exc_server(a1, (uint64_t)a2);
  context = 0;
  if (!mach_port_get_context(*MEMORY[0x1E0C83DA0], a1->msgh_local_port, &context))
    atomic_store(a1[1].msgh_bits, (unsigned int *)(context + 12));
  return 1;
}

uint64_t CSCppExceptionSafeThread::runloop_send_exit_notice(uint64_t this, int a2)
{
  mach_port_t v2;
  mach_msg_header_t v4;
  int v5;

  v2 = *(_DWORD *)(this + 8);
  if (v2)
  {
    bzero(&v4, 0x1CuLL);
    v4.msgh_voucher_port = 0;
    v4.msgh_id = 999;
    v4.msgh_remote_port = v2;
    v4.msgh_local_port = 0;
    *(_QWORD *)&v4.msgh_bits = 0x1C00001413;
    v5 = a2;
    return mach_msg_send(&v4);
  }
  return this;
}

uint64_t CSCppExceptionSafeThread::thread_init(CSCppExceptionSafeThread *this)
{
  if (_exception_safe_thread_key(void)::onceToken != -1)
    dispatch_once(&_exception_safe_thread_key(void)::onceToken, &__block_literal_global_3);
  pthread_setspecific(_exception_safe_thread_key(void)::est_key, this);
  pthread_setname_np("ExceptionSafeThread");
  atomic_store(0x100u, (unsigned int *)this + 3);
  pthread_mutex_lock((pthread_mutex_t *)this + 3);
  pthread_cond_signal((pthread_cond_t *)((char *)this + 256));
  return pthread_mutex_unlock((pthread_mutex_t *)this + 3);
}

void CSCppExceptionSafeThread::runloop(CSCppExceptionSafeThread *this)
{
  pthread_mutex_t *v2;
  pthread_cond_t *v3;
  uint64_t v4;

  v2 = (pthread_mutex_t *)((char *)this + 16);
  v3 = (pthread_cond_t *)((char *)this + 80);
  while (1)
  {
    pthread_mutex_lock(v2);
    while (1)
    {
      v4 = *((_QWORD *)this + 16);
      if (v4)
        break;
      pthread_cond_wait(v3, v2);
    }
    atomic_store(0x100u, (unsigned int *)this + 3);
    (*(void (**)(void))(v4 + 16))();
    CSCppExceptionSafeThread::pop_recovery_block(this);
    CSCppExceptionSafeThread::runloop_send_exit_notice((uint64_t)this, 4096);
    *((_QWORD *)this + 16) = 0;
    pthread_mutex_unlock(v2);
  }
}

uint64_t CSCppExceptionSafeThread::runloop_prep_to_turn(CSCppExceptionSafeThread *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t result;

  if (a2 <= 0x1000)
  {
    CSCppExceptionSafeThread::pop_recovery_block(this);
  }
  else
  {
    while (*((_QWORD *)this + 22))
    {
      v4 = CSCppExceptionSafeThread::pop_recovery_block(this);
      if (v4)
        (*(void (**)(void))(v4 + 16))();
    }
  }
  result = CSCppExceptionSafeThread::runloop_send_exit_notice((uint64_t)this, a2);
  *((_QWORD *)this + 16) = 0;
  return result;
}

void CSCppExceptionSafeThread::runloop_exit_due_to_bad_access(CSCppExceptionSafeThread *this)
{
  CSCppExceptionSafeThread::runloop_prep_to_turn(this, 0x1002u);
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  CSCppExceptionSafeThread::runloop(this);
}

uint64_t ___ZL26_exception_safe_thread_keyv_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_exception_safe_thread_key(void)::est_key, 0);
}

void std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a1[2];
  v5 = a1[1];
  v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
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
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
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
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<TRawSymbol<Pointer32> *,std::allocator<TRawSymbol<Pointer32> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<TRawSymbol<Pointer32> *,std::allocator<TRawSymbol<Pointer32> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<TRawSymbol<Pointer32> *,std::allocator<TRawSymbol<Pointer32> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<TRawSymbol<Pointer32> *,std::allocator<TRawSymbol<Pointer32> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_1B419AAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__maybe_remove_back_spare[abi:ne180100](_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = ((v2 - v3) << 6) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x200)
    a2 = 1;
  if (v5 < 0x400)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void CSCallFrameInfoForBinary::ParseEHFrameData(CSCallFrameInfoForBinary *this)
{
  unint64_t v2;
  CSBinaryDataRef *v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unsigned int v7;
  FILE **v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  __int128 *v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  unsigned int v24;

  v24 = 0;
  v3 = (CSCallFrameInfoForBinary *)((char *)this + 56);
  v2 = *((_QWORD *)this + 7);
  v5 = (_QWORD *)((char *)this + 24);
  v4 = *((_QWORD *)this + 3);
  v23[0] = *((_QWORD *)this + 5);
  v23[1] = v4;
  v23[2] = -1;
  v6 = *((_QWORD *)this + 8);
  if (v2 < v6)
  {
    v7 = 0;
    v8 = (FILE **)MEMORY[0x1E0C80C10];
    do
    {
      if ((v6 - v2) <= (unint64_t)v7 + 7)
        break;
      v9 = CSBinaryDataRef::Get32(v3, &v24);
      v13 = CSBinaryDataRef::Get32(v3, &v24);
      v14 = v7 + v9;
      v15 = v7 + v9 + 4;
      if (v13)
        v16 = CSCallFrameInfoForBinary::ParseFDE(this, v10, v11, v13, v24, (v14 + 4), v23, 1, v5);
      else
        v16 = CSCallFrameInfoForBinary::ParseCIE((uint64_t)this, v7, v11, v12, v24, v14 + 4, v23);
      v24 = v16;
      if (v16 != v15)
      {
        if (v13)
          v17 = "FDE";
        else
          v17 = "CIE";
        v18 = (const char *)this;
        if (*((char *)this + 23) < 0)
          v18 = *(const char **)this;
        fprintf(*v8, "CoreSymbolication warning: error parsing %s at 0x%8.8llx in:\n\t__TEXT [0x%8.8llx - 0x%8.8llx) __eh_frame [0x%8.8llx - 0x%8.8llx) %s\n", v17, *((_QWORD *)this + 5) + v16, *((_QWORD *)this + 3), *((_QWORD *)this + 4) + *((_QWORD *)this + 3), *((_QWORD *)this + 5), *((_QWORD *)this + 6) + *((_QWORD *)this + 5), v18);
        v24 = v15;
      }
      v2 = *((_QWORD *)this + 7);
      v6 = *((_QWORD *)this + 8);
      v7 = v15;
    }
    while (v2 < v6);
  }
  v19 = *((_QWORD *)this + 17);
  v20 = (__int128 *)*((_QWORD *)this + 18);
  v21 = 126 - 2 * __clz(((uint64_t)v20 - v19) >> 5);
  if (v20 == (__int128 *)v19)
    v22 = 0;
  else
    v22 = v21;
  std::__introsort<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *,false>(v19, v20, v22, 1);
  *((_BYTE *)this + 104) = 1;
}

uint64_t CSCallFrameInfoForBinary::ParseCIE(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, _QWORD *a7)
{
  CSBinaryDataRef *v10;
  unint64_t v11;
  int v12;
  int v14;
  int ULEB128;
  unsigned int v16;
  size_t v17;
  size_t v18;
  char *v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t **v25;
  __int128 v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int *v29;
  __int128 v30;
  __int128 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a5;
  v28 = a2;
  LOBYTE(v32) = 0;
  v10 = (CSBinaryDataRef *)(a1 + 56);
  v11 = 0;
  LOBYTE(v30) = CSBinaryDataRef::Get8((CSBinaryDataRef *)(a1 + 56), &v27);
  while (1)
  {
    v12 = CSBinaryDataRef::Get8(v10, &v27);
    *((_BYTE *)&v30 + v11 + 1) = v12;
    if (!v12)
      break;
    if (++v11 == 8)
      goto LABEL_7;
  }
  if (v11 <= 6)
  {
    bzero((char *)&v30 + v11 + 2, 7 - v11);
    goto LABEL_10;
  }
LABEL_7:
  if (v11 == 8 && BYTE8(v30))
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "CIE parse error: CIE augmentation string was too large for the fixed sized buffer of %d bytes.\n", 8);
    return 0;
  }
LABEL_10:
  HIDWORD(v30) = CSBinaryDataRef::Get_ULEB128(v10, &v27);
  LODWORD(v31) = CSBinaryDataRef::Get_SLEB128(v10, &v27);
  DWORD1(v31) = CSBinaryDataRef::Get8(v10, &v27);
  v14 = BYTE1(v30);
  if (BYTE1(v30))
  {
    ULEB128 = CSBinaryDataRef::Get_ULEB128(v10, &v27);
    v16 = v27;
    v17 = strlen((const char *)&v30 + 1);
    if (v14 == 122 && v17 >= 2)
    {
      v18 = v17 - 1;
      v19 = (char *)&v30 + 2;
      do
      {
        v21 = *v19++;
        v20 = v21;
        if (v21 == 82)
        {
          LOBYTE(v32) = CSBinaryDataRef::Get8(v10, &v27);
        }
        else if (v20 == 80)
        {
          v22 = CSBinaryDataRef::Get8(v10, &v27);
          CSBinaryDataRef::GetDwarfEHPtr(v10, &v27, v22, a7);
        }
        else if (v20 == 76)
        {
          CSBinaryDataRef::Get8(v10, &v27);
        }
        --v18;
      }
      while (v18);
    }
    v23 = v16 + ULEB128;
    v27 = v16 + ULEB128;
  }
  else
  {
    v23 = v27;
  }
  v24 = a6 - v23;
  if (a6 <= v23)
  {
    v24 = 0;
  }
  else
  {
    DWORD2(v31) = v23;
    v27 = a6;
  }
  HIDWORD(v31) = v24;
  v29 = &v28;
  v25 = std::__tree<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 112), &v28, (uint64_t)&std::piecewise_construct, &v29);
  v26 = v31;
  *((_OWORD *)v25 + 2) = v30;
  *((_OWORD *)v25 + 3) = v26;
  *((_DWORD *)v25 + 16) = v32;
  return v27;
}

uint64_t CSCallFrameInfoForBinary::ParseFDE(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _QWORD *a7, int a8, _QWORD *a9)
{
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  FILE *v19;
  uint64_t DwarfEHPtr;
  uint64_t v22;
  unint64_t v23;
  int v24;
  int ULEB128;
  uint64_t v26;
  int v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  unsigned int v40;

  v9 = a5;
  v40 = a5;
  if (a8)
    v10 = a5 - a4 - 4;
  else
    v10 = a4;
  v11 = a1[15];
  if (!v11)
    goto LABEL_15;
  v15 = a1 + 15;
  do
  {
    v16 = *(_DWORD *)(v11 + 28);
    v17 = v16 >= v10;
    if (v16 >= v10)
      v18 = (uint64_t *)v11;
    else
      v18 = (uint64_t *)(v11 + 8);
    if (v17)
      v15 = (_QWORD *)v11;
    v11 = *v18;
  }
  while (*v18);
  if (v15 == a1 + 15 || *((_DWORD *)v15 + 7) > v10)
  {
LABEL_15:
    v19 = (FILE *)*MEMORY[0x1E0C80C10];
    if (a8)
      fprintf(v19, "CoreSymbolication warning: Unable to locate CIE at 0x%8.8x = 0x%8.8x - (0x%8.8x + 4)\n");
    else
      fprintf(v19, "CoreSymbolication warning: Unable to locate CIE with ID 0x%8.8x\n");
    return v9;
  }
  DwarfEHPtr = CSBinaryDataRef::GetDwarfEHPtr((CSBinaryDataRef *)(a1 + 7), &v40, *((unsigned __int8 *)v15 + 64), a7);
  v22 = CSBinaryDataRef::GetDwarfEHPtr((CSBinaryDataRef *)(a1 + 7), &v40, v15[8] & 0xF, a7);
  v23 = a9[1];
  if (DwarfEHPtr - *a9 >= v23)
  {
    if (!DwarfEHPtr)
    {
      v24 = 0;
      goto LABEL_23;
    }
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "CoreSymbolication warning: fde.addrRange.location 0x%8.8llx isn't in  the __TEXT segment [0x%8.8llx - 0x%8.8llx)\n", DwarfEHPtr, *a9, v23);
  }
  v24 = 1;
LABEL_23:
  if (*((_BYTE *)v15 + 33) == 122)
  {
    ULEB128 = CSBinaryDataRef::Get_ULEB128((CSBinaryDataRef *)(a1 + 7), &v40);
    v26 = v40;
    if (ULEB128)
    {
      v26 = v40 + ULEB128;
      v40 += ULEB128;
    }
  }
  else
  {
    v26 = v40;
  }
  v27 = a6 - v26;
  if (a6 <= v26)
  {
    v27 = 0;
    a6 = v26;
  }
  else
  {
    v40 = a6;
  }
  v9 = a6;
  if (v24)
  {
    v28 = a1[19];
    v29 = (char *)a1[18];
    if ((unint64_t)v29 >= v28)
    {
      v31 = (char *)a1[17];
      v32 = (v29 - v31) >> 5;
      v33 = v32 + 1;
      if ((unint64_t)(v32 + 1) >> 59)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v34 = v28 - (_QWORD)v31;
      if (v34 >> 4 > v33)
        v33 = v34 >> 4;
      if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFE0)
        v35 = 0x7FFFFFFFFFFFFFFLL;
      else
        v35 = v33;
      if (v35)
      {
        v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>((uint64_t)(a1 + 19), v35);
        v31 = (char *)a1[17];
        v29 = (char *)a1[18];
      }
      else
      {
        v36 = 0;
      }
      v37 = &v36[32 * v32];
      *(_DWORD *)v37 = v10;
      *((_QWORD *)v37 + 1) = DwarfEHPtr;
      *((_QWORD *)v37 + 2) = v22;
      v38 = &v36[32 * v35];
      *((_DWORD *)v37 + 6) = v26;
      *((_DWORD *)v37 + 7) = v27;
      v30 = v37 + 32;
      if (v29 != v31)
      {
        do
        {
          v39 = *((_OWORD *)v29 - 1);
          *((_OWORD *)v37 - 2) = *((_OWORD *)v29 - 2);
          *((_OWORD *)v37 - 1) = v39;
          v37 -= 32;
          v29 -= 32;
        }
        while (v29 != v31);
        v31 = (char *)a1[17];
      }
      a1[17] = v37;
      a1[18] = v30;
      a1[19] = v38;
      if (v31)
        operator delete(v31);
    }
    else
    {
      *(_DWORD *)v29 = v10;
      *((_QWORD *)v29 + 1) = DwarfEHPtr;
      *((_QWORD *)v29 + 2) = v22;
      v30 = v29 + 32;
      *((_DWORD *)v29 + 6) = v26;
      *((_DWORD *)v29 + 7) = v27;
    }
    a1[18] = v30;
    return v40;
  }
  return v9;
}

void CSCallFrameInfoForBinary::ParseInstructions(_QWORD *a1, CSThread *a2, unsigned int *a3, void (*a4)(CSThread *, unsigned int *, _QWORD *, uint64_t), uint64_t a5)
{
  uint64_t v6;
  unsigned int v9;
  _DWORD *v10;
  unsigned int v11;
  BOOL v12;
  uint64_t *v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  char *v21;
  char v22;
  unsigned int v25;
  void *v26[3];
  void *__p[3];
  _QWORD v28[3];
  void *v29;
  _BYTE *v30;

  if (a3)
  {
    v6 = a1[15];
    if (v6)
    {
      v9 = *a3;
      v10 = a1 + 15;
      do
      {
        v11 = *(_DWORD *)(v6 + 28);
        v12 = v11 >= v9;
        if (v11 >= v9)
          v13 = (uint64_t *)v6;
        else
          v13 = (uint64_t *)(v6 + 8);
        if (v12)
          v10 = (_DWORD *)v6;
        v6 = *v13;
      }
      while (*v13);
      if (v10 != (_DWORD *)(a1 + 15) && v10[7] <= v9)
      {
        v28[0] = a2;
        v28[1] = 0;
        v28[2] = 0xFFFFFFFFLL;
        CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)&v29, a2);
        CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)__p, a2);
        v26[0] = v26;
        v26[1] = v26;
        v26[2] = 0;
        v14 = 1;
        do
        {
          v22 = v14;
          if ((v14 & 1) != 0)
          {
            v16 = v10[14];
            v15 = v10[15];
          }
          else
          {
            v16 = a3[6];
            v15 = a3[7];
            std::vector<CSCppSectionRange>::__assign_with_size[abi:ne180100]<CSCppSectionRange*,CSCppSectionRange*>((char *)__p, (char *)v29, (uint64_t)v30, 0xAAAAAAAAAAAAAAABLL * ((v30 - (_BYTE *)v29) >> 3));
          }
          if (v15)
          {
            v25 = v16;
            v17 = a1[7];
            v18 = a1[8];
            if (v18 > v17)
            {
              v19 = v15 + v16;
              if ((v18 - v17) > (unint64_t)v16 && v16 < v19)
              {
                v21 = (char *)&loc_1B419B3B0
                    + 4
                    * byte_1B41ADB60[(CSBinaryDataRef::Get8((CSBinaryDataRef *)(a1 + 7), &v25) >> 6) ^ 2];
                __asm { BR              X9 }
              }
            }
          }
          v14 = 0;
        }
        while ((v22 & 1) != 0);
        if (a4)
          a4(a2, a3, v28, a5);
        std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::clear((uint64_t *)v26);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v29)
        {
          v30 = v29;
          operator delete(v29);
        }
      }
    }
  }
}

void sub_1B419BAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25)
{
  std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::clear(&a15);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a24)
  {
    a25 = (uint64_t)a24;
    operator delete(a24);
  }
  _Unwind_Resume(a1);
}

CSCallFrameInfoForBinary::RegLocations *CSCallFrameInfoForBinary::RegLocations::RegLocations(CSCallFrameInfoForBinary::RegLocations *this, const CSThread *a2)
{
  unsigned int v4;
  CSCallFrameInfoForBinary::RegLocations *v5;

  v4 = (*(uint64_t (**)(const CSThread *))(*(_QWORD *)a2 + 32))(a2);
  v5 = (CSCallFrameInfoForBinary::RegLocations *)std::vector<CSCallFrameInfoForBinary::RegLocation>::vector(this, v4);
  CSCallFrameInfoForBinary::RegLocations::SetABIDefaults(v5, a2);
  return this;
}

void sub_1B419BB54(_Unwind_Exception *exception_object)
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

uint64_t CSCallFrameInfoForBinary::RegLocations::SetABIDefaults(CSCallFrameInfoForBinary::RegLocations *this, const CSThread *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  result = (*(uint64_t (**)(const CSThread *, _QWORD))(*(_QWORD *)a2 + 48))(a2, 0);
  v4 = *(_QWORD *)this;
  if (*((_QWORD *)this + 1) != *(_QWORD *)this)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (result == v6)
      {
        *(_QWORD *)(v4 + 24 * result + 8) = 0;
        v7 = 4;
      }
      else
      {
        v7 = 0;
      }
      *(_DWORD *)(v4 + v5) = v7;
      ++v6;
      v4 = *(_QWORD *)this;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3));
  }
  return result;
}

uint64_t CSCallFrameInfoForBinary::FindFDE(CSCallFrameInfoForBinary *this, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*((_BYTE *)this + 104))
  {
    CSCallFrameInfoForBinary::ParseEHFrameData(this);
    *((_BYTE *)this + 104) = 1;
  }
  result = *((_QWORD *)this + 17);
  v5 = *((_QWORD *)this + 18);
  if (result == v5)
    return 0;
  v6 = (v5 - result) >> 5;
  do
  {
    v7 = v6 >> 1;
    v8 = result + 32 * (v6 >> 1);
    v9 = *(_QWORD *)(v8 + 16) + *(_QWORD *)(v8 + 8);
    v10 = v8 + 32;
    v6 += ~(v6 >> 1);
    if (v9 <= a2)
      result = v10;
    else
      v6 = v7;
  }
  while (v6);
  if (result == v5 || a2 - *(_QWORD *)(result + 8) >= *(_QWORD *)(result + 16))
    return 0;
  return result;
}

uint64_t CSCallFrameInfoForBinary::UnwindThreadState(CSCallFrameInfoForBinary *a1, const CSThread *a2, uint64_t a3, CSThread *a4, void *a5)
{
  uint64_t FDE;
  unsigned int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  void *__p[4];
  char v19;

  FDE = CSCallFrameInfoForBinary::FindFDE(a1, (unint64_t)a5);
  if (!FDE)
    return 0;
  v11 = (unsigned int *)FDE;
  v17[0] = a2;
  v17[1] = 0;
  v17[2] = 0xFFFFFFFFLL;
  CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)__p, a2);
  __p[3] = a5;
  v19 = 0;
  CSCallFrameInfoForBinary::ParseInstructions(a1, a2, v11, (void (*)(CSThread *, unsigned int *, _QWORD *, uint64_t))FindRowForAddress, (uint64_t)v17);
  if (v19 && (v12 = (*(uint64_t (**)(const CSThread *))(*(_QWORD *)a2 + 32))(a2), (v13 = v12) != 0))
  {
    v14 = 0;
    LODWORD(v15) = 0;
    do
    {
      v12 = CSCallFrameInfoForBinary::UnwindRegisterAtIndex(v12, v14, a2, (uint64_t)v17, a3, a4);
      v15 = (v15 + v12);
      v14 = (v14 + 1);
    }
    while (v13 != (_DWORD)v14);
  }
  else
  {
    v15 = 0;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v15;
}

void sub_1B419BDA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL FindRowForAddress(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  _BOOL8 result;

  v5 = *((_QWORD *)a3 + 1) + *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a4 + 48);
  if (v5 <= v6)
  {
    v7 = *a3;
    *(_QWORD *)(a4 + 16) = *((_QWORD *)a3 + 2);
    *(_OWORD *)a4 = v7;
    if ((__int128 *)a4 != a3)
    {
      std::vector<CSCppSectionRange>::__assign_with_size[abi:ne180100]<CSCppSectionRange*,CSCppSectionRange*>((char *)(a4 + 24), *((char **)a3 + 3), *((_QWORD *)a3 + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3)) >> 3));
      v6 = *(_QWORD *)(a4 + 48);
    }
  }
  result = v5 < v6;
  *(_BYTE *)(a4 + 56) = v5 >= v6;
  return result;
}

uint64_t CSCallFrameInfoForBinary::UnwindRegisterAtIndex(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, CSThread *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t RegisterValue;
  tree *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _BYTE v26[24];
  tree *v27;
  _QWORD v28[3];
  uint64_t v29;
  char v30;

  v30 = 0;
  v11 = *(_QWORD *)(a4 + 24);
  v12 = v11 + 24 * a2;
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a4 + 32) - v11) >> 3) <= a2)
    v13 = 0;
  else
    v13 = v11 + 24 * a2;
  if ((*(unsigned int (**)(_BYTE *, _QWORD))(*(_QWORD *)a3 + 64))(a3, 0) == (_DWORD)a2)
  {
    v14 = (*(uint64_t (**)(_BYTE *, _QWORD))(*(_QWORD *)a3 + 72))(a3, 0);
    v15 = *(_QWORD *)(a4 + 24);
    v16 = v15 + 24 * v14;
    if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a4 + 32) - v15) >> 3) <= v14)
      v17 = 0;
    else
      v17 = v15 + 24 * v14;
    if (v13)
    {
      if (v17)
        v18 = *(_DWORD *)v13 == 0;
      else
        v18 = 0;
      if (v18)
        v13 = v16;
      else
        v13 = v12;
LABEL_17:
      v29 = -1;
      v19 = 1;
      switch(*(_DWORD *)v13)
      {
        case 0:
        case 2:
          return v19;
        case 1:
          CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0, 0);
          return v19;
        case 3:
        case 4:
          RegisterValue = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(a4 + 16), 2, -1, (uint64_t)&v30);
          if (!v30)
            goto LABEL_30;
          v21 = (tree *)(RegisterValue + *(int *)(a4 + 20) + *(_QWORD *)(v13 + 8));
          if (*(_DWORD *)v13 == 4)
            goto LABEL_35;
          if (mapped_memory_read_pointer(a5, v21, &v29))
            goto LABEL_30;
          v21 = (tree *)v29;
LABEL_35:
          CSThread::SetRegisterValue((uint64_t)a6, a2, 0, (uint64_t)v21);
          break;
        case 5:
          v24 = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(v13 + 8), 2, 0, (uint64_t)&v30);
          v29 = v24;
          if (!v30)
            return 0;
          v21 = (tree *)v24;
          goto LABEL_35;
        case 6:
        case 7:
          v28[1] = a5;
          v28[2] = 0;
          v27 = 0;
          v28[0] = a3;
          CSBinaryDataRef::CSBinaryDataRef((CSBinaryDataRef *)v26, *(const unsigned __int8 **)(v13 + 8), *(unsigned int *)(v13 + 16), 0);
          if (a3[9])
            v23 = 8;
          else
            v23 = 4;
          v26[17] = v23;
          if (CSDwarfExpression::Evaluate((uint64_t (*)(uint64_t, _QWORD, char *))DWARFExpressionReadMemoryCallback, (uint64_t (*)(uint64_t, uint64_t, char *))DWARFExpressionReadRegisterCallback, (uint64_t)v28, (CSBinaryDataRef *)v26, 0, *(unsigned int *)(v13 + 16), 0, &v27))
          {
            goto LABEL_29;
          }
          if (*(_DWORD *)v13 == 7)
          {
            CSThread::SetRegisterValue((uint64_t)a6, a2, 0, (uint64_t)v27);
          }
          else if (mapped_memory_read_pointer(a5, v27, &v29))
          {
LABEL_29:
            CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0, 0);
            v19 = 0;
          }
          else
          {
            CSThread::SetRegisterValue((uint64_t)a6, a2, 0, v29);
          }
          CSCppAddressSet::sort((CSCppAddressSet *)v26);
          return v19;
        default:
          goto LABEL_22;
      }
      return v19;
    }
    v13 = v17;
  }
  if (v13)
    goto LABEL_17;
LABEL_22:
  v19 = 0;
  if ((*(unsigned int (**)(_BYTE *, _QWORD))(*(_QWORD *)a3 + 48))(a3, 0) == (_DWORD)a2)
  {
    v22 = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(a4 + 16), 2, 0, (uint64_t)&v30);
    if (v30)
    {
      return CSThread::SetSP(a6, v22 + *(int *)(a4 + 20));
    }
    else
    {
LABEL_30:
      CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0, 0);
      return 0;
    }
  }
  return v19;
}

void sub_1B419C178(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CSCppAddressSet::sort((CSCppAddressSet *)va);
  _Unwind_Resume(a1);
}

char *DWARFExpressionReadMemoryCallback(uint64_t a1, tree *a2, unsigned __int8 *a3)
{
  const char *v4;
  int v5;
  mach_error_t v6;
  char *v7;
  unsigned int v8;
  unint64_t Max64;
  unint64_t v11;
  char v12;
  _BYTE v14[28];
  unsigned int v15;
  const unsigned __int8 *v16;

  v4 = *(const char **)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 16);
  v16 = 0;
  v6 = mapped_memory_read(v4, a2, *((_QWORD *)a3 + 1), &v16);
  if (v6)
  {
    v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
    if (mach_error_string(v6))
      snprintf(DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error, 0x400uLL, "memory read of %u bytes at address 0x%8.8llx failed: %s");
    else
      snprintf(DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error, 0x400uLL, "memory read of %u bytes at address 0x%8.8llx failed: 0x%8.8x");
  }
  else if (v16)
  {
    v8 = *a3;
    if (v8 > 8 || ((1 << v8) & 0x1E2) == 0)
    {
      if (v8 == 128)
      {
        v7 = 0;
        *((_QWORD *)a3 + 4) = v16;
      }
      else
      {
        v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
        snprintf(DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error, 0x400uLL, "Unsupported DW_ATE encoding in value argument: %u");
      }
    }
    else
    {
      v15 = 0;
      CSBinaryDataRef::CSBinaryDataRef((CSBinaryDataRef *)v14, v16, *((_QWORD *)a3 + 1), v5 != 0);
      Max64 = CSBinaryDataRef::GetMax64((CSBinaryDataRef *)v14, &v15, *((_DWORD *)a3 + 2));
      *((_QWORD *)a3 + 4) = Max64;
      if (*a3 - 5 <= 1)
      {
        v11 = *((_QWORD *)a3 + 1);
        if (v11 <= 7)
        {
          v12 = 8 * v11;
          if (((Max64 >> (v12 - 1)) & 1) != 0)
            *((_QWORD *)a3 + 4) = (-1 << v12) | Max64;
        }
      }
      CSCppAddressSet::sort((CSCppAddressSet *)v14);
      return 0;
    }
  }
  else
  {
    v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
    snprintf(DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error, 0x400uLL, "memory read of %u bytes at address 0x%8.8llx failed: NULL data returned");
  }
  return v7;
}

void sub_1B419C31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  CSCppAddressSet::sort((CSCppAddressSet *)va);
  _Unwind_Resume(a1);
}

char *DWARFExpressionReadRegisterCallback(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v8;

  v4 = *a1;
  *(_BYTE *)a3 = 7;
  v5 = 8;
  if (!*(_BYTE *)(v4 + 9))
    v5 = 4;
  *(_QWORD *)(a3 + 8) = v5;
  v8 = 0;
  *(_QWORD *)(a3 + 32) = CSThread::GetRegisterValue(v4, a2, 2, 0xFFFFFFFFLL, (uint64_t)&v8);
  if (v8)
    return 0;
  v6 = DWARFExpressionReadRegisterCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
  snprintf(DWARFExpressionReadRegisterCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error, 0x400uLL, "failed to read register number: %llu", a2);
  return v6;
}

void std::__introsort<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *,false>(uint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 *v19;
  __int128 *v20;
  unint64_t v21;
  __int128 *v22;
  unint64_t v23;
  __int128 *v24;
  __int128 v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  __int128 *v35;
  __int128 *v36;
  unint64_t v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 *v43;
  __int128 *v44;
  __int128 *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 *v55;
  BOOL v57;
  uint64_t v58;
  _QWORD *v59;
  __int128 *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  int64_t v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  _OWORD *v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _OWORD *v85;
  __int128 *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  __int128 *v97;
  __int128 v98;
  __int128 *v100;
  unint64_t v101;
  uint64_t v102;
  __int128 *v103;
  __int128 v104;
  unint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>(__int128 *result, __int128 *a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = *((_QWORD *)a2 + 1);
  v4 = *((_QWORD *)a3 + 1);
  if (v3 >= *((_QWORD *)result + 1))
  {
    if (v4 < v3)
    {
      v9 = *a2;
      v8 = a2[1];
      v10 = a3[1];
      *a2 = *a3;
      a2[1] = v10;
      *a3 = v9;
      a3[1] = v8;
      if (*((_QWORD *)a2 + 1) < *((_QWORD *)result + 1))
      {
        v12 = *result;
        v11 = result[1];
        v13 = a2[1];
        *result = *a2;
        result[1] = v13;
        *a2 = v12;
        a2[1] = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      v15 = *result;
      v14 = result[1];
      v16 = a2[1];
      *result = *a2;
      result[1] = v16;
      *a2 = v15;
      a2[1] = v14;
      if (*((_QWORD *)a3 + 1) >= *((_QWORD *)a2 + 1))
        return result;
      v6 = *a2;
      v5 = a2[1];
      v17 = a3[1];
      *a2 = *a3;
      a2[1] = v17;
    }
    else
    {
      v6 = *result;
      v5 = result[1];
      v7 = a3[1];
      *result = *a3;
      result[1] = v7;
    }
    *a3 = v6;
    a3[1] = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
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

  v4 = (a2 - a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(_QWORD *)(a2 - 24) < *(_QWORD *)(a1 + 8))
      {
        v7 = *(_OWORD *)a1;
        v6 = *(_OWORD *)(a1 + 16);
        v8 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 32) = v7;
        *(_OWORD *)(a2 - 16) = v6;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>((__int128 *)a1, (__int128 *)(a1 + 32), (__int128 *)(a2 - 32));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>(a1, a1 + 32, a1 + 64, a2 - 32);
      return 1;
    case 5:
      v19 = (__int128 *)(a1 + 32);
      v20 = (__int128 *)(a1 + 64);
      v21 = (__int128 *)(a1 + 96);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>(a1, a1 + 32, a1 + 64, a1 + 96);
      if (*(_QWORD *)(a2 - 24) < *(_QWORD *)(a1 + 104))
      {
        v23 = *v21;
        v22 = *(_OWORD *)(a1 + 112);
        v24 = *(_OWORD *)(a2 - 16);
        *v21 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)(a1 + 112) = v24;
        *(_OWORD *)(a2 - 32) = v23;
        *(_OWORD *)(a2 - 16) = v22;
        if (*(_QWORD *)(a1 + 104) < *(_QWORD *)(a1 + 72))
        {
          v26 = *v20;
          v25 = *(_OWORD *)(a1 + 80);
          v27 = *(_OWORD *)(a1 + 112);
          *v20 = *v21;
          *(_OWORD *)(a1 + 80) = v27;
          *v21 = v26;
          *(_OWORD *)(a1 + 112) = v25;
          if (*(_QWORD *)(a1 + 72) < *(_QWORD *)(a1 + 40))
          {
            v29 = *v19;
            v28 = *(_OWORD *)(a1 + 48);
            v30 = *(_OWORD *)(a1 + 80);
            *v19 = *v20;
            *(_OWORD *)(a1 + 48) = v30;
            *v20 = v29;
            *(_OWORD *)(a1 + 80) = v28;
            if (*(_QWORD *)(a1 + 40) < *(_QWORD *)(a1 + 8))
            {
              v32 = *(_OWORD *)a1;
              v31 = *(_OWORD *)(a1 + 16);
              v33 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v33;
              *v19 = v32;
              *(_OWORD *)(a1 + 48) = v31;
            }
          }
        }
      }
      return 1;
    default:
      v9 = a1 + 64;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>((__int128 *)a1, (__int128 *)(a1 + 32), (__int128 *)(a1 + 64));
      v10 = a1 + 96;
      if (a1 + 96 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    v13 = *(_QWORD *)(v10 + 8);
    if (v13 < *(_QWORD *)(v9 + 8))
    {
      v14 = *(_QWORD *)v10;
      v34 = *(_OWORD *)(v10 + 16);
      v15 = v11;
      while (1)
      {
        v16 = a1 + v15;
        v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64)
          break;
        v15 -= 32;
        if (v13 >= *(_QWORD *)(v16 + 40))
        {
          v18 = a1 + v15 + 96;
          goto LABEL_12;
        }
      }
      v18 = a1;
LABEL_12:
      *(_QWORD *)v18 = v14;
      *(_QWORD *)(v18 + 8) = v13;
      *(_OWORD *)(v18 + 16) = v34;
      if (++v12 == 8)
        return v10 + 32 == a2;
    }
    v9 = v10;
    v11 += 32;
    v10 += 32;
    if (v10 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3);
  if (*(_QWORD *)(a4 + 8) < *(_QWORD *)(a3 + 8))
  {
    v9 = *(_OWORD *)a3;
    result = *(__n128 *)(a3 + 16);
    v10 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)a4 = v9;
    *(__n128 *)(a4 + 16) = result;
    if (*(_QWORD *)(a3 + 8) < *(_QWORD *)(a2 + 8))
    {
      v11 = *(_OWORD *)a2;
      result = *(__n128 *)(a2 + 16);
      v12 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 16) = v12;
      *(_OWORD *)a3 = v11;
      *(__n128 *)(a3 + 16) = result;
      if (*(_QWORD *)(a2 + 8) < *(_QWORD *)(a1 + 8))
      {
        v13 = *(_OWORD *)a1;
        result = *(__n128 *)(a1 + 16);
        v14 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v14;
        *(_OWORD *)a2 = v13;
        *(__n128 *)(a2 + 16) = result;
      }
    }
  }
  return result;
}

_QWORD *std::vector<CSCallFrameInfoForBinary::RegLocation>::vector(_QWORD *a1, unint64_t a2)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<CSCppFlatbufferRelocation>::__vallocate[abi:ne180100](a1, a2);
    v4 = (_DWORD *)a1[1];
    v5 = &v4[6 * a2];
    v6 = 24 * a2;
    do
    {
      *v4 = 2;
      v4 += 6;
      v6 -= 24;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_1B419CF94(_Unwind_Exception *exception_object)
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

void std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::clear(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  if (a1[2])
  {
    v3 = *a1;
    v2 = (uint64_t *)a1[1];
    v4 = *v2;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v3 + 8) = v4;
    a1[2] = 0;
    while (v2 != a1)
    {
      v5 = (uint64_t *)v2[1];
      std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__delete_node[abi:ne180100]<>((int)a1, v2);
      v2 = v5;
    }
  }
}

void std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__delete_node[abi:ne180100]<>(int a1, _QWORD *__p)
{
  void *v3;

  v3 = (void *)__p[2];
  if (v3)
  {
    __p[3] = v3;
    operator delete(v3);
  }
  operator delete(__p);
}

uint64_t **std::__tree<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x48uLL);
    v11[7] = **a4;
    v11[16] = 0;
    *((_OWORD *)v11 + 2) = 0u;
    *((_OWORD *)v11 + 3) = 0u;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

_QWORD *std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__create_node[abi:ne180100]<CSCallFrameInfoForBinary::RegLocations const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;

  v7 = operator new(0x28uLL);
  *v7 = a2;
  v7[1] = a3;
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = 0;
  std::vector<CSCallFrameInfoForBinary::RegLocation>::__init_with_size[abi:ne180100]<CSCallFrameInfoForBinary::RegLocation*,CSCallFrameInfoForBinary::RegLocation*>(v7 + 2, *(const void **)a4, *(_QWORD *)(a4 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3));
  return v7;
}

void sub_1B419D16C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<CSCallFrameInfoForBinary::RegLocation>::__init_with_size[abi:ne180100]<CSCallFrameInfoForBinary::RegLocation*,CSCallFrameInfoForBinary::RegLocation*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<CSCppFlatbufferRelocation>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B419D1DC(_Unwind_Exception *exception_object)
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

void CSCppCFDataMemory::CSCppCFDataMemory(CSCppCFDataMemory *this, CFTypeRef cf)
{
  const __CFData *v3;

  *(_QWORD *)this = &off_1E677A738;
  v3 = (const __CFData *)CFRetain(cf);
  *((_QWORD *)this + 1) = v3;
  *((_QWORD *)this + 2) = CFDataGetBytePtr(v3);
  *((_QWORD *)this + 3) = CFDataGetLength(*((CFDataRef *)this + 1));
}

void CSCppCFDataMemory::~CSCppCFDataMemory(CFTypeRef *this)
{
  *this = &off_1E677A738;
  CFRelease(this[1]);
}

{
  CSCppCFDataMemory::~CSCppCFDataMemory(this);
  JUMPOUT(0x1B5E36940);
}

uint64_t CSCppCFDataMemory::bytes_at(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 + a2) <= *(_QWORD *)(a1 + 24))
    return a2 + *(_QWORD *)(a1 + 16);
  else
    return 0;
}

uint64_t CSCppCFDataMemory::footprint(CSCppCFDataMemory *this)
{
  return *((_QWORD *)this + 3) + 32;
}

void CSCppCFDataMemory::validate(CSCppCFDataMemory *this)
{
  _QWORD *v1;
  char *v2;
  size_t v3;
  _QWORD *v4;
  _QWORD *exception;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  v1 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"Unimplemented: ", 15);
  v2 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppCFDataMemory.cpp");
  v3 = strlen(v2);
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)v2, v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)":", 1);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v9, &v7);
  Exception::Exception(v6, &v7);
  exception = __cxa_allocate_exception(0x20uLL);
  Exception::Exception(exception, (uint64_t)v6);
}

void sub_1B419D3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  Exception::~Exception((std::exception *)&a9);
  if (a18 < 0)
    operator delete(__p);
  a19 = *MEMORY[0x1E0DE4F60];
  *(uint64_t *)((char *)&a19 + *(_QWORD *)(a19 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  a20 = MEMORY[0x1E0DE4FB8] + 16;
  if (a33 < 0)
    operator delete(a28);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1B5E368EC](&a36);
  _Unwind_Resume(a1);
}

uint64_t CSCppCFDataMemory::is_task(CSCppCFDataMemory *this)
{
  return 0;
}

uint64_t CSCppCFDataMemory::is_dyld_shared_cache(CSCppCFDataMemory *this)
{
  return 0;
}

_QWORD *CSCppCFDataMemory::to_string@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "CSCppCFDataMemory");
}

void AS::Operator::generate_owner(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  unsigned int v19;

  v6 = *(_QWORD *)(a3 + 56) + 96 * *a2;
  v15 = (_QWORD *)v6;
  v19 = 0;
  v18 = *(_DWORD *)(v6 + 88) | 0x420;
  std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>(&v15, &v19, (_QWORD *)(a1 + 8), &kCSEndOfTime, (unsigned int *)&v18, (_QWORD *)(v6 + 56), (_QWORD *)(v6 + 16), a4);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>(&v15, *(const void **)(v6 + 64), *(_QWORD *)(v6 + 72), (uint64_t)(*(_QWORD *)(v6 + 72) - *(_QWORD *)(v6 + 64)) >> 5);
  v7 = v15;
  v8 = v16;
  if (v15 != v16)
  {
    v9 = a2[1];
    v10 = v15;
    do
    {
      v11 = (const char *)v10[3];
      if (!v11)
        v11 = (const char *)v10[2];
      if (strncmp(v11, "__PAGEZERO", 0xBuLL))
        *v10 += v9;
      v10 += 4;
    }
    while (v10 != v8);
  }
  v12 = (_QWORD *)*a4;
  v13 = *(_QWORD **)(*a4 + 32);
  v12[4] = v7;
  v12[5] = v8;
  v14 = v12[6];
  v12[6] = v17;
  v15 = v13;
  v17 = v14;
  if (v13)
  {
    v16 = v13;
    operator delete(v13);
  }
}

void sub_1B419D590(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void AS::LoadOperator::operator()(AS::LoadOperator *a1, uint64_t a2, SymbolicationSession *a3)
{
  _QWORD v4[4];
  _QWORD v5[3];
  char *v6;
  char *v7;
  char **v8;

  AS::LoadOperator::generate_owners(a1, a3, &v6);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1174405120;
  v4[2] = ___ZNK2AS12LoadOperatorclER17CSCppSymbolicatorR20SymbolicationSession_block_invoke;
  v4[3] = &__block_descriptor_tmp_22;
  memset(v5, 0, sizeof(v5));
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>((char *)v5, v6, v7, (v7 - v6) >> 4);
  CSCppSymbolicator::apply_mutable_context_block(a2, (uint64_t)v4);
  v8 = (char **)v5;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  v8 = &v6;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
}

void sub_1B419D64C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = v1;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  *(_QWORD *)(v2 - 24) = v2 - 48;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

void AS::LoadOperator::generate_owners(AS::LoadOperator *this@<X0>, const SymbolicationSession *a2@<X1>, char **a3@<X8>)
{
  __int128 *v6;
  __int128 *i;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  int64x2_t v21;
  char *v22;
  char *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  int64x2_t v40;
  char *v41;
  char *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  int64x2_t v49;
  char *v50;
  _QWORD *v51;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (*((_BYTE *)this + 40))
  {
    v6 = (__int128 *)*((_QWORD *)this + 2);
    for (i = (__int128 *)*((_QWORD *)this + 3); v6 != i; ++v6)
    {
      v47 = *v6;
      AS::Operator::generate_owner((uint64_t)this, &v47, (uint64_t)a2, &v46);
      v9 = a3[1];
      v8 = (unint64_t)a3[2];
      if ((unint64_t)v9 >= v8)
      {
        v10 = (v9 - *a3) >> 4;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 60)
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        v12 = v8 - (_QWORD)*a3;
        if (v12 >> 3 > v11)
          v11 = v12 >> 3;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
          v13 = 0xFFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        v51 = a3 + 2;
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(a3 + 2), v13);
        v16 = &v14[16 * v10];
        *(_OWORD *)v16 = v46;
        v46 = 0uLL;
        v18 = *a3;
        v17 = a3[1];
        if (v17 == *a3)
        {
          v21 = vdupq_n_s64((unint64_t)v17);
          v19 = &v14[16 * v10];
        }
        else
        {
          v19 = &v14[16 * v10];
          do
          {
            v20 = *((_OWORD *)v17 - 1);
            v17 -= 16;
            *((_OWORD *)v19 - 1) = v20;
            v19 -= 16;
            *(_QWORD *)v17 = 0;
            *((_QWORD *)v17 + 1) = 0;
          }
          while (v17 != v18);
          v21 = *(int64x2_t *)a3;
        }
        v22 = v16 + 16;
        *a3 = v19;
        a3[1] = v16 + 16;
        v49 = v21;
        v23 = a3[2];
        a3[2] = &v14[16 * v15];
        v50 = v23;
        v48 = v21.i64[0];
        std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)&v48);
        v24 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
        a3[1] = v22;
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            v26 = __ldaxr(p_shared_owners);
          while (__stlxr(v26 - 1, p_shared_owners));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
      }
      else
      {
        *(_OWORD *)v9 = v46;
        a3[1] = v9 + 16;
      }
    }
  }
  else
  {
    AS::Operator::generate_owner((uint64_t)this, (_QWORD *)this + 2, (uint64_t)a2, &v47);
    v27 = (unint64_t)a3[2];
    v28 = a3[1];
    if ((unint64_t)v28 >= v27)
    {
      v29 = (v28 - *a3) >> 4;
      v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 60)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v31 = v27 - (_QWORD)*a3;
      if (v31 >> 3 > v30)
        v30 = v31 >> 3;
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
        v32 = 0xFFFFFFFFFFFFFFFLL;
      else
        v32 = v30;
      v51 = a3 + 2;
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(a3 + 2), v32);
      v35 = &v33[16 * v29];
      *(_OWORD *)v35 = v47;
      v47 = 0uLL;
      v37 = *a3;
      v36 = a3[1];
      if (v36 == *a3)
      {
        v40 = vdupq_n_s64((unint64_t)v36);
        v38 = &v33[16 * v29];
      }
      else
      {
        v38 = &v33[16 * v29];
        do
        {
          v39 = *((_OWORD *)v36 - 1);
          v36 -= 16;
          *((_OWORD *)v38 - 1) = v39;
          v38 -= 16;
          *(_QWORD *)v36 = 0;
          *((_QWORD *)v36 + 1) = 0;
        }
        while (v36 != v37);
        v40 = *(int64x2_t *)a3;
      }
      v41 = v35 + 16;
      *a3 = v38;
      a3[1] = v35 + 16;
      v49 = v40;
      v42 = a3[2];
      a3[2] = &v33[16 * v34];
      v50 = v42;
      v48 = v40.i64[0];
      std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)&v48);
      v43 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
      a3[1] = v41;
      if (v43)
      {
        v44 = (unint64_t *)&v43->__shared_owners_;
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }
    else
    {
      *(_OWORD *)v28 = v47;
      a3[1] = v28 + 16;
    }
  }
}

void sub_1B419D954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void ___ZNK2AS12LoadOperatorclER17CSCppSymbolicatorR20SymbolicationSession_block_invoke(uint64_t a1, char **a2)
{
  unint64_t *v2;
  unint64_t *i;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  std::__shared_weak_count *v18;

  v2 = *(unint64_t **)(a1 + 32);
  for (i = *(unint64_t **)(a1 + 40); v2 != i; v2 += 2)
  {
    v5 = *v2;
    v6 = (std::__shared_weak_count *)v2[1];
    v17 = *v2;
    v18 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
      *(_QWORD *)&v16 = v5;
      *((_QWORD *)&v16 + 1) = v6;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    else
    {
      v16 = v5;
    }
    CSCppMutableContext::add_symbol_owner_no_copy(a2, &v16);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v18;
    if (v18)
    {
      v14 = (unint64_t *)&v18->__shared_owners_;
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

void sub_1B419DA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

char *__copy_helper_block_e8_32c76_ZTSNSt3__16vectorINS_10shared_ptrI16CSCppSymbolOwnerEENS_9allocatorIS3_EEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v2 = a1 + 32;
  *(_QWORD *)(v2 + 16) = 0;
  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>((char *)v2, *(_QWORD **)(a2 + 32), *(_QWORD **)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 4);
}

void __destroy_helper_block_e8_32c76_ZTSNSt3__16vectorINS_10shared_ptrI16CSCppSymbolOwnerEENS_9allocatorIS3_EEEE(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 32);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void AS::LoadOperator::~LoadOperator(AS::LoadOperator *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E677A7D0;
  if (*((_BYTE *)this + 40))
  {
    v2 = (void *)*((_QWORD *)this + 2);
    if (v2)
    {
      *((_QWORD *)this + 3) = v2;
      operator delete(v2);
    }
  }
}

{
  void *v2;

  *(_QWORD *)this = &off_1E677A7D0;
  if (*((_BYTE *)this + 40))
  {
    v2 = (void *)*((_QWORD *)this + 2);
    if (v2)
    {
      *((_QWORD *)this + 3) = v2;
      operator delete(v2);
    }
  }
  JUMPOUT(0x1B5E36940);
}

void AS::FullCreationOperator::generate_owners(AS::FullCreationOperator *this@<X0>, const SymbolicationSession *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  CSCppSymbolOwner *v14;
  __int128 v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _OWORD *v20;
  _OWORD *j;
  unint64_t v22;
  _OWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  int64x2_t v35;
  _OWORD *v36;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;
  __int128 v41;
  int v42;
  CSCppSymbolOwner *v43[2];
  void *__p[6];

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v6 = *((_QWORD *)a2 + 15) + 40 * *((_QWORD *)this + 2);
  v7 = *(_QWORD *)(v6 + 16);
  for (i = *(_QWORD *)(v6 + 24); v7 != i; v7 += 96)
  {
    __p[0] = (void *)v7;
    LODWORD(v41) = 0;
    v42 = *(_DWORD *)(v7 + 88) | 0x420;
    std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>(__p, (unsigned int *)&v41, (_QWORD *)this + 1, &kCSEndOfTime, (unsigned int *)&v42, (_QWORD *)(v7 + 56), (_QWORD *)(v7 + 16), v43);
    if (*(_BYTE *)(v7 + 48))
    {
      v9 = (const char *)(v7 + 24);
      if (*(char *)(v7 + 47) < 0)
        v9 = *(const char **)v9;
      CSCppSymbolOwner::set_version((size_t)v43[0], v9);
    }
    memset(__p, 0, 24);
    std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>(__p, *(const void **)(v7 + 64), *(_QWORD *)(v7 + 72), (uint64_t)(*(_QWORD *)(v7 + 72) - *(_QWORD *)(v7 + 64)) >> 5);
    v10 = __p[0];
    v11 = __p[1];
    if (__p[0] != __p[1])
    {
      v12 = *((_QWORD *)this + 3);
      v13 = __p[0];
      do
      {
        *v13 += v12;
        v13 += 4;
      }
      while (v13 != v11);
    }
    v14 = v43[0];
    v15 = *((_OWORD *)v43[0] + 2);
    *((_QWORD *)v43[0] + 4) = v10;
    *((_QWORD *)v14 + 5) = v11;
    *(_OWORD *)__p = v15;
    v16 = (void *)*((_QWORD *)v14 + 6);
    *((void **)v14 + 6) = __p[2];
    __p[2] = v16;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)a3, (__int128 *)v43);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v17 = (std::__shared_weak_count *)v43[1];
    if (v43[1])
    {
      v18 = (unint64_t *)((char *)v43[1] + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  v20 = (_OWORD *)*((_QWORD *)this + 5);
  for (j = (_OWORD *)*((_QWORD *)this + 6); v20 != j; ++v20)
  {
    *(_OWORD *)v43 = *v20;
    AS::Operator::generate_owner((uint64_t)this, v43, (uint64_t)a2, &v41);
    v23 = *(_OWORD **)(a3 + 8);
    v22 = *(_QWORD *)(a3 + 16);
    if ((unint64_t)v23 >= v22)
    {
      v24 = ((uint64_t)v23 - *(_QWORD *)a3) >> 4;
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 60)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v26 = v22 - *(_QWORD *)a3;
      if (v26 >> 3 > v25)
        v25 = v26 >> 3;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
        v27 = 0xFFFFFFFFFFFFFFFLL;
      else
        v27 = v25;
      __p[4] = (void *)(a3 + 16);
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>(a3 + 16, v27);
      v30 = &v28[16 * v24];
      *(_OWORD *)v30 = v41;
      v41 = 0uLL;
      v32 = *(char **)a3;
      v31 = *(char **)(a3 + 8);
      if (v31 == *(char **)a3)
      {
        v35 = vdupq_n_s64((unint64_t)v31);
        v33 = &v28[16 * v24];
      }
      else
      {
        v33 = &v28[16 * v24];
        do
        {
          v34 = *((_OWORD *)v31 - 1);
          v31 -= 16;
          *((_OWORD *)v33 - 1) = v34;
          v33 -= 16;
          *(_QWORD *)v31 = 0;
          *((_QWORD *)v31 + 1) = 0;
        }
        while (v31 != v32);
        v35 = *(int64x2_t *)a3;
      }
      v36 = v30 + 16;
      *(_QWORD *)a3 = v33;
      *(_QWORD *)(a3 + 8) = v30 + 16;
      *(int64x2_t *)&__p[1] = v35;
      v37 = *(void **)(a3 + 16);
      *(_QWORD *)(a3 + 16) = &v28[16 * v29];
      __p[3] = v37;
      __p[0] = (void *)v35.i64[0];
      std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)__p);
      v38 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
      *(_QWORD *)(a3 + 8) = v36;
      if (v38)
      {
        p_shared_owners = (unint64_t *)&v38->__shared_owners_;
        do
          v40 = __ldaxr(p_shared_owners);
        while (__stlxr(v40 - 1, p_shared_owners));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
    }
    else
    {
      *v23 = v41;
      *(_QWORD *)(a3 + 8) = v23 + 1;
    }
  }
}

void sub_1B419DE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void AS::FullCreationOperator::~FullCreationOperator(AS::FullCreationOperator *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E677A828;
  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  *(_QWORD *)this = &off_1E677A828;
  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1B5E36940);
}

_QWORD *std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>@<X0>(_QWORD *a1@<X1>, unsigned int *a2@<X2>, _QWORD *a3@<X3>, _QWORD *a4@<X4>, unsigned int *a5@<X5>, _QWORD *a6@<X6>, _QWORD *a7@<X7>, _QWORD *a8@<X8>)
{
  _QWORD *v16;
  _QWORD *result;

  v16 = operator new(0xE8uLL);
  result = std::__shared_ptr_emplace<CSCppSymbolOwner>::__shared_ptr_emplace[abi:ne180100]<UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,std::allocator<CSCppSymbolOwner>,0>(v16, a1, a2, a3, a4, a5, a6, a7);
  *a8 = v16 + 3;
  a8[1] = v16;
  return result;
}

void sub_1B419DFE0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<CSCppSymbolOwner>::__shared_ptr_emplace[abi:ne180100]<UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,std::allocator<CSCppSymbolOwner>,0>(_QWORD *a1, _QWORD *a2, unsigned int *a3, _QWORD *a4, _QWORD *a5, unsigned int *a6, _QWORD *a7, _QWORD *a8)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1E6774D20;
  CSCppSymbolOwner::CSCppSymbolOwner(a1 + 3, *a2, *a3, *a4, *a5, *a6, *a7, *a8);
  return a1;
}

void sub_1B419E044(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t CSCppMutableContext::CSCppMutableContext(uint64_t a1, _QWORD **a2)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>((char *)a1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return a1;
}

uint64_t CSCppMutableContext::add_symbol_owner_no_copy(char **a1, __int128 *a2)
{
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](a1 + 6, a2);
  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](a1, a2);
}

uint64_t CSCppMutableContext::remove_symbol_owner(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (uint64_t)a2;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)(a1 + 24), a2);
  v4 = v2 + 16;
  v5 = *(_QWORD *)(a1 + 8);
  if (v2 + 16 != v5)
  {
    do
    {
      v6 = v2 + 16;
      std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v2, (__int128 *)(v2 + 16));
      v7 = v2 + 32;
      v2 += 16;
    }
    while (v7 != v5);
    v4 = *(_QWORD *)(a1 + 8);
    v2 = v6;
  }
  while (v4 != v2)
    v4 = std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v4 - 16);
  *(_QWORD *)(a1 + 8) = v2;
  return 1;
}

uint64_t CSCppMutableContext::copy_symbol_owner@<X0>(char **this@<X0>, CSCppSymbolOwner *a2@<X1>, char a3@<W2>, __int128 *a4@<X8>)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;

  std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,CSCppSymbolOwner&,void>(a2, a4);
  v8 = *(_QWORD *)a4;
  v9 = *(_DWORD *)(*(_QWORD *)a4 + 108);
  if ((v9 & 0x800000) != 0)
    v10 = v9 & 0xFE7FFFFF | 0x1000000;
  else
    v10 = v9 | 0x1000000;
  *(_DWORD *)(v8 + 108) = v10;
  if ((a3 & 1) != 0)
  {
    v11 = *((_QWORD *)a2 + 10);
    if (v11)
    {
      *(_QWORD *)(v8 + 80) = v11;
      CSCppReferenceCount::retain(v11);
    }
  }
  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](this + 6, a4);
}

void sub_1B419E1D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

char **CSCppMutableContext::add_symbol_owner@<X0>(char **this@<X0>, CSCppSymbolOwner *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char **v5;

  if ((*((_BYTE *)a2 + 111) & 1) != 0)
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
  }
  else
  {
    v5 = this;
    CSCppMutableContext::copy_symbol_owner(this, a2, a3, (__int128 *)a4);
    return (char **)std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](v5, (__int128 *)a4);
  }
  return this;
}

void sub_1B419E22C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t CSCppMutableContext::remove_symbol_owner(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  uint64_t *SymbolOwnerInList;
  __int128 *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;

  if (*((_QWORD *)this + 1) - *(_QWORD *)this < 0x20uLL)
    return 0;
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  if (*((uint64_t **)this + 1) == SymbolOwnerInList)
    return 0;
  v5 = (__int128 *)SymbolOwnerInList;
  v6 = _findSymbolOwnerInList((uint64_t **)this + 6, (uint64_t)a2);
  v7 = *((_QWORD *)this + 7);
  if ((uint64_t *)v7 == v6)
  {
    CSCppMutableContext::remove_symbol_owner((uint64_t)this, v5);
  }
  else
  {
    v8 = (uint64_t)v6;
    if (v6 + 2 != (uint64_t *)v7)
    {
      do
      {
        v9 = v8 + 16;
        std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v8, (__int128 *)(v8 + 16));
        v10 = v8 + 32;
        v8 += 16;
      }
      while (v10 != v7);
      v7 = *((_QWORD *)this + 7);
      v8 = v9;
    }
    while (v7 != v8)
    {
      v7 -= 16;
      std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v7);
    }
    *((_QWORD *)this + 7) = v8;
    v11 = (uint64_t)(v5 + 1);
    v12 = (__int128 *)*((_QWORD *)this + 1);
    if (v5 + 1 != v12)
    {
      do
      {
        v13 = v5 + 1;
        std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100]((uint64_t)v5, v5 + 1);
        v14 = v5 + 2;
        ++v5;
      }
      while (v14 != v12);
      v11 = *((_QWORD *)this + 1);
      v5 = v13;
    }
    while ((__int128 *)v11 != v5)
      v11 = std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v11 - 16);
    *((_QWORD *)this + 1) = v5;
  }
  return 1;
}

uint64_t *_findSymbolOwnerInList(uint64_t **a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t v9;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    while (1)
    {
      v6 = *v2;
      v5 = (std::__shared_weak_count *)v2[1];
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
      if (v6 == a2)
        break;
      v2 += 2;
      if (v2 == v3)
        return v3;
    }
  }
  return v2;
}

uint64_t CSCppMutableContext::replace_symbol_owner(char **this, CSCppSymbolOwner *a2, CSCppSymbolOwner *a3)
{
  uint64_t *SymbolOwnerInList;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  CSCppMutableContext::add_symbol_owner(this, a2, 1, (uint64_t)&v11);
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a3);
  if (this[1] != (char *)SymbolOwnerInList)
    CSCppMutableContext::remove_symbol_owner((uint64_t)this, (__int128 *)SymbolOwnerInList);
  v6 = v11;
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6;
}

void sub_1B419E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t CSCppMutableContext::make_symbol_owner_mutable(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  uint64_t *SymbolOwnerInList;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v15;

  if ((*((_BYTE *)a2 + 111) & 1) != 0)
    return 0;
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  if (*((uint64_t **)this + 1) == SymbolOwnerInList)
    return 0;
  v5 = (uint64_t)SymbolOwnerInList;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)this + 3, (__int128 *)SymbolOwnerInList);
  v6 = v5 + 16;
  v7 = *((_QWORD *)this + 1);
  if (v5 + 16 != v7)
  {
    do
    {
      v8 = v5 + 16;
      std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v5, (__int128 *)(v5 + 16));
      v9 = v5 + 32;
      v5 += 16;
    }
    while (v9 != v7);
    v6 = *((_QWORD *)this + 1);
    v5 = v8;
  }
  while (v6 != v5)
    v6 = std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v6 - 16);
  *((_QWORD *)this + 1) = v5;
  CSCppMutableContext::copy_symbol_owner((char **)this, a2, 0, &v15);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)this, &v15);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
  v10 = v15;
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
  return v10;
}

void sub_1B419E5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t CSCppMutableContext::make_all_symbol_owners_immutable(uint64_t this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(this + 48);
  v2 = *(uint64_t **)(this + 56);
  while (v1 != v2)
  {
    v3 = *v1;
    v1 += 2;
    *(_DWORD *)(v3 + 108) &= ~0x1000000u;
  }
  return this;
}

void CSCppMutableContext::mark_all_obsoleted_symbol_owners(CSCppMutableContext *this)
{
  uint64_t *i;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t v7;

  for (i = (uint64_t *)*((_QWORD *)this + 3); (unint64_t)i < *((_QWORD *)this + 4); i += 2)
  {
    v3 = *i;
    v4 = (std::__shared_weak_count *)i[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 108) & 0xFE7FFFFF | 0x800000;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 108) & 0xFE7FFFFF | 0x800000;
    }
  }
}

_QWORD *CSGetBinaryPathForExclaveWithUUIDBytes(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *result;
  uint8_t v6[16];

  get_exclave_core_uuid_to_path_map();
  get_exclave_kit_uuid_to_path_map();
  v2 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>(&get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map, a1);
  v3 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>(&get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map, a1);
  v4 = v3;
  if (!v2)
  {
    if (!v3)
      return 0;
    result = v3 + 4;
    if ((*((char *)v4 + 55) & 0x80000000) == 0)
      return result;
    return (_QWORD *)*result;
  }
  if (v3)
  {
    if (os_variant_has_internal_content())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "UUID found in both ExclaveCore and ExclaveKit\n", v6, 2u);
      }
    }
    return 0;
  }
  result = v2 + 4;
  if (*((char *)v2 + 55) < 0)
    return (_QWORD *)*result;
  return result;
}

void get_exclave_core_uuid_to_path_map(void)
{
  unsigned __int8 v0;
  unint64_t v1;
  char v2;
  char **v3;
  char *v4;

  if ((v0 & 1) == 0
  {
    get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_1EF08E570 = 0u;
    dword_1EF08E580 = 1065353216;
  }
  v1 = atomic_load(&get_exclave_core_uuid_to_path_map(void)::once);
  if (v1 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&get_exclave_core_uuid_to_path_map(void)::once, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>);
  }
}

void get_exclave_kit_uuid_to_path_map(void)
{
  unsigned __int8 v0;
  unint64_t v1;
  char v2;
  char **v3;
  char *v4;

  if ((v0 & 1) == 0
  {
    get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_1EF08E5A8 = 0u;
    dword_1EF08E5B8 = 1065353216;
  }
  v1 = atomic_load(&get_exclave_kit_uuid_to_path_map(void)::once);
  if (v1 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&get_exclave_kit_uuid_to_path_map(void)::once, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>);
  }
}

uint64_t CSSymbolicatorCreateWithExclaveUUIDAndFlags(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __n128 (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3802000000;
  v11 = __Block_byref_object_copy__16;
  v12 = __Block_byref_object_dispose__16;
  v13 = 0;
  v14 = 0;
  v4 = (char *)CSGetBinaryPathForExclaveWithUUIDBytes(a1);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke;
    v7[3] = &unk_1E677A860;
    v7[4] = &v8;
    v7[5] = a1;
    CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v4, a2, 0, (uint64_t)v7);
  }
  v5 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1B419E978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(0, a1);
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[6];
  _OWORD v10[2];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  get_exclave_core_uuid_to_path_map();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  memset(v10, 0, sizeof(v10));
  v11 = 1065353216;
  v4 = qword_1EF08E570;
  if (qword_1EF08E570)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>(v10, (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v10, (unsigned __int8 *)(v4 + 32), v4 + 32);
        if (*(char *)(v4 + 55) < 0)
          v6 = *(char **)v6;
        v9[0] = v5;
        v9[1] = 0x40000000;
        v9[2] = __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke;
        v9[3] = &unk_1E677A888;
        v9[4] = a2;
        v9[5] = &v12;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v6, a1, 0, (uint64_t)v9);
      }
      v4 = *(_QWORD *)v4;
    }
    while (v4);
    v7 = v13[3];
  }
  else
  {
    v7 = 0;
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v10);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1B419EB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(0, a1);
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[6];
  _OWORD v10[2];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  get_exclave_kit_uuid_to_path_map();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  memset(v10, 0, sizeof(v10));
  v11 = 1065353216;
  v4 = qword_1EF08E5A8;
  if (qword_1EF08E5A8)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>(v10, (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v10, (unsigned __int8 *)(v4 + 32), v4 + 32);
        if (*(char *)(v4 + 55) < 0)
          v6 = *(char **)v6;
        v9[0] = v5;
        v9[1] = 0x40000000;
        v9[2] = __CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags_block_invoke;
        v9[3] = &unk_1E677A8B0;
        v9[4] = a2;
        v9[5] = &v12;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v6, a1, 0, (uint64_t)v9);
      }
      v4 = *(_QWORD *)v4;
    }
    while (v4);
    v7 = v13[3];
  }
  else
  {
    v7 = 0;
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v10);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1B419ECCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>()
{
  char *v0;
  char *v1;
  std::vector<std::string>::pointer end;
  __int128 v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  std::string *v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer v12;
  char *v13;
  std::string *value;
  uint64_t v15;
  void *v16[2];
  std::string::size_type v17;
  std::vector<std::string> v18;
  std::__split_buffer<std::string> __p;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&__p, "/System/ExclaveCore/");
  memset(&v18, 0, sizeof(v18));
  v16[0] = &v18;
  LOBYTE(v16[1]) = 0;
  v18.__begin_ = (std::vector<std::string>::pointer)operator new(0x18uLL);
  v18.__end_ = v18.__begin_;
  v18.__end_cap_.__value_ = v18.__begin_ + 1;
  v18.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v18.__end_cap_, (__int128 *)&__p, (__int128 *)&__p.__end_cap_, v18.__begin_);
  if (SHIBYTE(__p.__end_) < 0)
    operator delete(__p.__first_);
  if (os_variant_has_internal_content())
  {
    v0 = getenv("CS_TEST_EXCLAVECORE_DIR");
    if (v0)
    {
      v1 = v0;
      if (!is_root_directory(v0))
      {
        std::string::basic_string[abi:ne180100]<0>(v16, v1);
        end = v18.__end_;
        if (v18.__end_ >= v18.__end_cap_.__value_)
        {
          v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v18.__end_ - (char *)v18.__begin_) >> 3);
          v5 = v4 + 1;
          if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v18.__end_cap_.__value_ - (char *)v18.__begin_) >> 3) > v5)
            v5 = 0x5555555555555556 * (((char *)v18.__end_cap_.__value_ - (char *)v18.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v18.__end_cap_.__value_ - (char *)v18.__begin_) >> 3) >= 0x555555555555555)
            v6 = 0xAAAAAAAAAAAAAAALL;
          else
            v6 = v5;
          __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v18.__end_cap_;
          if (v6)
            v7 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v18.__end_cap_, v6);
          else
            v7 = 0;
          v8 = v7 + v4;
          __p.__first_ = v7;
          __p.__begin_ = v8;
          __p.__end_cap_.__value_ = &v7[v6];
          v9 = *(_OWORD *)v16;
          v8->__r_.__value_.__r.__words[2] = v17;
          *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
          v16[1] = 0;
          v17 = 0;
          v16[0] = 0;
          __p.__end_ = v8 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v18, &__p);
          v10 = v18.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__p);
          v18.__end_ = v10;
          if (SHIBYTE(v17) < 0)
            operator delete(v16[0]);
        }
        else
        {
          v3 = *(_OWORD *)v16;
          v18.__end_->__r_.__value_.__r.__words[2] = v17;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v3;
          v18.__end_ = end + 1;
        }
      }
    }
  }
  begin = v18.__begin_;
  v12 = v18.__end_;
  if (v18.__begin_ != v18.__end_)
  {
    while (1)
    {
      v13 = (char *)begin;
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
        v13 = (char *)begin->__r_.__value_.__r.__words[0];
      __p.__first_ = (std::__split_buffer<std::string>::pointer)&off_1E677A910;
      __p.__end_cap_.__value_ = (std::string *)&__p;
      recursively_list_files_and_uuids_in_directory(v13, (uint64_t)&__p);
      value = __p.__end_cap_.__value_;
      if ((std::__split_buffer<std::string> *)__p.__end_cap_.__value_ == &__p)
        break;
      if (__p.__end_cap_.__value_)
      {
        v15 = 5;
LABEL_26:
        (*(void (**)(void))(value->__r_.__value_.__r.__words[0] + 8 * v15))();
      }
      if (++begin == v12)
        goto LABEL_28;
    }
    value = (std::string *)&__p;
    v15 = 4;
    goto LABEL_26;
  }
LABEL_28:
  v16[0] = &v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
}

void sub_1B419EFA8(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, char *__pa, std::__split_buffer<std::string> *a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a18);
  if (a14 < 0)
    operator delete(__pa);
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(__p);
}

void recursively_list_files_and_uuids_in_directory(char *a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  const std::__fs::filesystem::path *v6;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *size;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *v14;
  uint64_t v15;
  const std::__fs::filesystem::directory_entry *v16;
  int v17;
  std::string *v18;
  std::string *p_p;
  _QWORD *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *cntrl;
  uint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__fs::filesystem::path v31;
  std::string p;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *v33;
  std::__shared_weak_count *v34;
  char v35;
  std::__fs::filesystem::recursive_directory_iterator __p;
  char *v37;
  unsigned __int8 v38;
  _QWORD v39[4];
  _BYTE v40[24];
  _BYTE *v41;
  std::string v42;
  std::string buf;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  if (access(a1, 4) && os_variant_has_internal_content())
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)a1;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Failed to access directory: %s\n";
LABEL_22:
    _os_log_impl(&dword_1B40C5000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&buf, 0xCu);
    return;
  }
  v6 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v37);
  std::__fs::filesystem::__status(v6, 0);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if (LOBYTE(__p.__imp_.__ptr_) != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Path is not a directory: %s\n";
    goto LABEL_22;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&__p, &v37);
  MEMORY[0x1B5E36880](&buf, &__p, 0, 0);
  if (*(char *)(&__p.__rec_ + 7) < 0)
    operator delete(__p.__imp_.__ptr_);
  v7 = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&buf.__r_.__value_.__l.__data_;
  if (buf.__r_.__value_.__l.__size_)
  {
    v8 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
    __p.__imp_ = v7;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
    if (buf.__r_.__value_.__l.__size_)
    {
      v11 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      v33 = 0;
      v34 = 0;
      v35 = 0;
      do
        v13 = __ldaxr(v11);
      while (__stlxr(v13 - 1, v11));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
      goto LABEL_25;
    }
  }
  else
  {
    __p.__imp_.__ptr_ = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)buf.__r_.__value_.__r.__words[0];
    __p.__imp_.__cntrl_ = 0;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
  }
  v33 = 0;
  v34 = 0;
  v35 = 0;
LABEL_25:
  v14 = v33;
  v15 = MEMORY[0x1E0C809B0];
  while (__p.__imp_.__ptr_ != v14)
  {
    v16 = std::__fs::filesystem::recursive_directory_iterator::__dereference(&__p);
    if (SHIBYTE(v16->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&p, v16->__p_.__pn_.__r_.__value_.__l.__data_, v16->__p_.__pn_.__r_.__value_.__l.__size_);
    else
      p = (std::string)v16->__p_;
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v31.__pn_, (char *)&p);
    std::__fs::filesystem::__status(&v31, 0);
    v17 = v38;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    if (v17 != 2)
    {
      v18 = (p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &p
          : (std::string *)p.__r_.__value_.__r.__words[0];
      if ((CSFileIsSuitableForCS((const char *)v18) & 1) != 0)
      {
        if ((p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &p;
        else
          p_p = (std::string *)p.__r_.__value_.__r.__words[0];
        v31.__pn_.__r_.__value_.__r.__words[0] = -1;
        v39[0] = v15;
        v39[1] = 1174405120;
        v39[2] = ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke;
        v39[3] = &__block_descriptor_tmp_9_4;
        std::__function::__value_func<void ()(CSCppMMapInlinedSymbol *,std::vector<TRawSymbol<Pointer32>> &,CSCppStringCache &)>::__value_func[abi:ne180100]((uint64_t)v40, a2);
        if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v42, p.__r_.__value_.__l.__data_, p.__r_.__value_.__l.__size_);
        else
          v42 = p;
        iterate_symbol_owners_from_path((char *)p_p, 0, 0, (unint64_t *)&v31, 0, (uint64_t)v39);
        if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v42.__r_.__value_.__l.__data_);
        v20 = v41;
        if (v41 == v40)
        {
          v20 = v40;
          v21 = 4;
        }
        else
        {
          if (!v41)
            goto LABEL_50;
          v21 = 5;
        }
        (*(void (**)(void))(*v20 + 8 * v21))();
      }
    }
LABEL_50:
    if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(p.__r_.__value_.__l.__data_);
    std::__fs::filesystem::recursive_directory_iterator::__increment(&__p, 0);
  }
  v22 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  cntrl = __p.__imp_.__cntrl_;
  if (__p.__imp_.__cntrl_)
  {
    v26 = &__p.__imp_.__cntrl_->__shared_owners_;
    do
      v27 = __ldaxr((unint64_t *)v26);
    while (__stlxr(v27 - 1, (unint64_t *)v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v28 = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
  if (buf.__r_.__value_.__l.__size_)
  {
    v29 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

void sub_1B419F4CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a30 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 48))(v3, a1 + 64, *a2 + 16);
}

void __copy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;

  std::__function::__value_func<void ()(CSCppMMapInlinedSymbol *,std::vector<TRawSymbol<Pointer32>> &,CSCppStringCache &)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
  v4 = (std::string *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
}

void sub_1B419F64C(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  v3 = v2;
  v5 = *(_QWORD **)(v3 + 56);
  if (v5 == v1)
  {
    v6 = 4;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
    v1 = v5;
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v6))(v1);
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *__destroy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *result;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 32);
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  result = *(_QWORD **)(a1 + 56);
  if (result == v2)
  {
    v4 = 4;
    result = v2;
  }
  else
  {
    if (!result)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
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

void sub_1B419F730(_Unwind_Exception *exception_object)
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

void sub_1B419F8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void sub_1B419F9AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::~__func()
{
  JUMPOUT(0x1B5E36940);
}

_QWORD *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E677A910;
  return result;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E677A910;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()(int a1, uint64_t a2, UUID *this)
{
  uint64_t v3;
  _QWORD *v6;
  _OWORD *v7;

  v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    if (!UUID::is_null(this))
    {
      v7 = this;
      v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)&get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map, this, (uint64_t)&std::piecewise_construct, &v7);
      std::string::operator=((std::string *)(v6 + 4), (const std::string *)a2);
    }
  }
}

uint64_t std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
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

void sub_1B419FD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::pair<std::string,unsigned long long>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>()
{
  uint64_t v0;
  char *v1;
  char *v2;
  const char *v3;
  char v4;
  __int128 v5;
  size_t size;
  void **v7;
  std::string *v8;
  std::vector<std::string>::pointer end;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  char *v18;
  char *v19;
  std::vector<std::string>::pointer v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  std::string *v25;
  std::string *v26;
  __int128 v27;
  std::string *v28;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer v30;
  char *v31;
  std::string *value;
  uint64_t v33;
  std::string v34;
  char v35;
  std::vector<std::string> v36;
  void *__p[2];
  _QWORD v38[2];
  char v39;
  std::__split_buffer<std::string> buf;
  _QWORD v41[3];
  __int128 v42;

  *(_QWORD *)&v42 = *MEMORY[0x1E0C80C00];
  memset(&v36, 0, sizeof(v36));
  std::string::basic_string[abi:ne180100]<0>(&buf, "/System/Volumes/Preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(&buf.__end_cap_.__value_, "/private/preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(v41, "/System/Cryptexes/ExclaveOS");
  __p[0] = 0;
  __p[1] = 0;
  v38[0] = 0;
  v38[1] = __p;
  v39 = 0;
  __p[0] = operator new(0x48uLL);
  __p[1] = __p[0];
  v38[0] = (char *)__p[0] + 72;
  v0 = 0;
  __p[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)v38, (__int128 *)&buf, &v42, (std::string *)__p[0]);
  do
  {
    if (SHIBYTE(v41[v0 + 2]) < 0)
      operator delete((void *)v41[v0]);
    v0 -= 3;
  }
  while (v0 != -9);
  v1 = (char *)__p[0];
  v2 = (char *)__p[1];
  while (1)
  {
    if (v1 == v2)
    {
      v4 = 0;
      v34.__r_.__value_.__s.__data_[0] = 0;
      goto LABEL_16;
    }
    v3 = v1;
    if (v1[23] < 0)
      v3 = *(const char **)v1;
    if (!access(v3, 4))
      break;
    v1 += 24;
  }
  if (v1[23] < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v1, *((_QWORD *)v1 + 1));
  }
  else
  {
    v5 = *(_OWORD *)v1;
    v34.__r_.__value_.__r.__words[2] = *((_QWORD *)v1 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v5;
  }
  v4 = 1;
LABEL_16:
  v35 = v4;
  buf.__first_ = (std::__split_buffer<std::string>::pointer)__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v35)
  {
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      size = v34.__r_.__value_.__l.__size_;
    v7 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, size + 19);
    if (v38[0] < 0)
      v7 = (void **)__p[0];
    if (size)
    {
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v8 = &v34;
      else
        v8 = (std::string *)v34.__r_.__value_.__r.__words[0];
      memmove(v7, v8, size);
    }
    strcpy((char *)v7 + size, "/System/ExclaveKit/");
    end = v36.__end_;
    if (v36.__end_ >= v36.__end_cap_.__value_)
    {
      v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3);
      v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) > v12)
        v12 = 0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v36.__end_cap_;
      if (v13)
        v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v36.__end_cap_, v13);
      else
        v14 = 0;
      v15 = v14 + v11;
      buf.__first_ = v14;
      buf.__begin_ = v15;
      buf.__end_cap_.__value_ = &v14[v13];
      v16 = *(_OWORD *)__p;
      v15->__r_.__value_.__r.__words[2] = v38[0];
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
      __p[1] = 0;
      v38[0] = 0;
      __p[0] = 0;
      buf.__end_ = v15 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v36, &buf);
      v17 = v36.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&buf);
      v36.__end_ = v17;
      if (SHIBYTE(v38[0]) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v10 = *(_OWORD *)__p;
      v36.__end_->__r_.__value_.__r.__words[2] = v38[0];
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
      v36.__end_ = end + 1;
    }
  }
  else if (is_device_sptm_enabled()
         && os_variant_has_internal_content()
         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.__first_) = 0;
    _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to locate official Exclave Kit binaries on disk", (uint8_t *)&buf, 2u);
  }
  if (os_variant_has_internal_content())
  {
    v18 = getenv("CS_TEST_EXCLAVEKIT_DIR");
    if (v18)
    {
      v19 = v18;
      if (!is_root_directory(v18))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, v19);
        v20 = v36.__end_;
        if (v36.__end_ >= v36.__end_cap_.__value_)
        {
          v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3);
          v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) > v23)
            v23 = 0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) >= 0x555555555555555)
            v24 = 0xAAAAAAAAAAAAAAALL;
          else
            v24 = v23;
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v36.__end_cap_;
          if (v24)
            v25 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)&v36.__end_cap_, v24);
          else
            v25 = 0;
          v26 = v25 + v22;
          buf.__first_ = v25;
          buf.__begin_ = v26;
          buf.__end_cap_.__value_ = &v25[v24];
          v27 = *(_OWORD *)__p;
          v26->__r_.__value_.__r.__words[2] = v38[0];
          *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
          __p[1] = 0;
          v38[0] = 0;
          __p[0] = 0;
          buf.__end_ = v26 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v36, &buf);
          v28 = v36.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          v36.__end_ = v28;
          if (SHIBYTE(v38[0]) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v21 = *(_OWORD *)__p;
          v36.__end_->__r_.__value_.__r.__words[2] = v38[0];
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          v36.__end_ = v20 + 1;
        }
      }
    }
  }
  begin = v36.__begin_;
  v30 = v36.__end_;
  if (v36.__begin_ != v36.__end_)
  {
    while (1)
    {
      v31 = (char *)begin;
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
        v31 = (char *)begin->__r_.__value_.__r.__words[0];
      buf.__first_ = (std::__split_buffer<std::string>::pointer)&off_1E677A9A0;
      buf.__end_cap_.__value_ = (std::string *)&buf;
      recursively_list_files_and_uuids_in_directory(v31, (uint64_t)&buf);
      value = buf.__end_cap_.__value_;
      if ((std::__split_buffer<std::string> *)buf.__end_cap_.__value_ == &buf)
        break;
      if (buf.__end_cap_.__value_)
      {
        v33 = 5;
LABEL_67:
        (*(void (**)(void))(value->__r_.__value_.__r.__words[0] + 8 * v33))();
      }
      if (++begin == v30)
        goto LABEL_69;
    }
    value = (std::string *)&buf;
    v33 = 4;
    goto LABEL_67;
  }
LABEL_69:
  if (v35 && SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
}

void sub_1B41A027C(_Unwind_Exception *a1, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, int a8, uint64_t *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, void *__pa, std::__split_buffer<std::string> *a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a27);
  if (a24 < 0)
    operator delete(__pa);
  if ((_BYTE)__p)
  {
    if (SHIBYTE(a11) < 0)
      operator delete(a9);
  }
  a9 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::~__func()
{
  JUMPOUT(0x1B5E36940);
}

_QWORD *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E677A9A0;
  return result;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E677A9A0;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()(int a1, uint64_t a2, UUID *this)
{
  uint64_t v3;
  _QWORD *v6;
  _OWORD *v7;

  v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    if (!UUID::is_null(this))
    {
      v7 = this;
      v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)&get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map, this, (uint64_t)&std::piecewise_construct, &v7);
      std::string::operator=((std::string *)(v6 + 4), (const std::string *)a2);
    }
  }
}

uint64_t std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

void **CSCppDsymData::binary_path(CSCppDsymData *this)
{
  void **v2;
  const char *v3;
  std::string v5;
  glob_t v6;

  v2 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0)
  {
    if (!*((_QWORD *)this + 7))
      goto LABEL_14;
    v3 = (const char *)*v2;
    if (*(_BYTE *)*v2 != 126)
      goto LABEL_14;
  }
  else
  {
    if (!*((_BYTE *)this + 71))
      return 0;
    if (*(_BYTE *)v2 != 126)
      return v2;
    v3 = (char *)this + 48;
  }
  memset(&v5, 0, sizeof(v5));
  if (!glob(v3, 2048, 0, &v6))
  {
    std::string::__assign_external(&v5, *(const std::string::value_type **)v6.gl_pathv);
    globfree(&v6);
  }
  if (*((char *)this + 71) < 0)
    operator delete(*v2);
  *(std::string *)v2 = v5;
  if ((*((_BYTE *)this + 71) & 0x80) != 0)
  {
LABEL_14:
    if (*((_QWORD *)this + 7))
      return (void **)*v2;
    return 0;
  }
  if (!*((_BYTE *)this + 71))
    return 0;
  return v2;
}

void sub_1B41A05A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CSCppDsymData::CSCppDsymData(CSCppDsymData *this, const char *a2)
{
  *((_QWORD *)this + 8) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  strlcpy((char *)this + 72, a2, 0x400uLL);
}

void sub_1B41A0608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;

  if (*(char *)(v10 + 71) < 0)
    operator delete(*(void **)(v10 + 48));
  a10 = (void **)(v10 + 24);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  a10 = (void **)v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void make_dsym_data_from_path_and_uuid(const char *a1@<X0>, const CFUUIDBytes *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _BYTE v11[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1 && a2 && !access(a1, 0))
  {
    CSCppDsymData::CSCppDsymData((CSCppDsymData *)&v5, a1);
    *(_OWORD *)a3 = v5;
    *(_QWORD *)(a3 + 16) = v6;
    v5 = 0uLL;
    *(_OWORD *)(a3 + 24) = v7;
    *(_QWORD *)(a3 + 40) = v8;
    v6 = 0;
    v7 = 0uLL;
    v8 = 0;
    *(_OWORD *)(a3 + 48) = v9;
    *(_QWORD *)(a3 + 64) = v10;
    v10 = 0;
    v9 = 0uLL;
    memcpy((void *)(a3 + 72), v11, 0x400uLL);
    *(_BYTE *)(a3 + 1096) = 1;
    CSCppDsymData::~CSCppDsymData((void **)&v5);
  }
  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 1096) = 0;
  }
}

uint64_t CSCppInternedPathTransformer::CSCppInternedPathTransformer(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;

  *(_QWORD *)a1 = &off_1E677AA20;
  *(_QWORD *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 16) = 0u;
  v5 = a1 + 16;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3) >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a3[1] - *a3) >> 3))
    v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a3[1] - *a3) >> 3);
  else
    v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3);
  if (v6)
  {
    v9 = 0;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>(v5, (unsigned __int8 *)(*a3 + v9), (__int128 *)(*a3 + v9), (__int128 *)(*a4 + v9));
      v9 += 24;
      --v6;
    }
    while (v6);
  }
  return a1;
}

void sub_1B41A07F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t *CSCppInternedPathTransformer::find_replacement(CSCppInternedPathTransformer *this, const char *__s2)
{
  uint64_t *i;
  int v4;
  const char *v5;
  size_t v6;

  for (i = (uint64_t *)*((_QWORD *)this + 4); i; i = (uint64_t *)*i)
  {
    v4 = *((char *)i + 39);
    if (v4 >= 0)
      v5 = (const char *)(i + 2);
    else
      v5 = (const char *)i[2];
    if (v4 >= 0)
      v6 = *((unsigned __int8 *)i + 39);
    else
      v6 = i[3];
    if (!strncmp(v5, __s2, v6))
      break;
  }
  return i;
}

unsigned __int8 *CSCppInternedPathTransformer::transform(CSCppStringCache **this, char *a2)
{
  unsigned __int8 *v2;
  uint64_t *replacement;
  uint64_t *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  size_t v9;
  void **v10;
  const void *v11;
  char *v12;
  void *__p[2];
  char v15;

  v2 = (unsigned __int8 *)a2;
  replacement = CSCppInternedPathTransformer::find_replacement((CSCppInternedPathTransformer *)this, a2);
  if (replacement)
  {
    v5 = replacement;
    if (*((char *)replacement + 39) < 0)
      v6 = replacement[3];
    else
      v6 = *((unsigned __int8 *)replacement + 39);
    v7 = (const char *)&v2[v6];
    if (*((char *)replacement + 63) >= 0)
      v8 = *((unsigned __int8 *)replacement + 63);
    else
      v8 = replacement[6];
    v9 = strlen(v7);
    v10 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, v8 + v9);
    if (v15 < 0)
      v10 = (void **)__p[0];
    if (v8)
    {
      if (*((char *)v5 + 63) >= 0)
        v11 = v5 + 5;
      else
        v11 = (const void *)v5[5];
      memmove(v10, v11, v8);
    }
    if (v9)
      memmove((char *)v10 + v8, v7, v9);
    *((_BYTE *)v10 + v8 + v9) = 0;
    if (v15 >= 0)
      v12 = (char *)__p;
    else
      v12 = (char *)__p[0];
    v2 = CSCppStringCache::intern(this[1], v12);
    if (v15 < 0)
      operator delete(__p[0]);
  }
  return v2;
}

void sub_1B41A0978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CSCppInternedPathTransformer::~CSCppInternedPathTransformer(CSCppInternedPathTransformer *this)
{
  *(_QWORD *)this = &off_1E677AA20;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);
}

{
  *(_QWORD *)this = &off_1E677AA20;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);
  JUMPOUT(0x1B5E36940);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>(uint64_t a1, unsigned __int8 *a2, __int128 *a3, __int128 *a4)
{
  unint64_t v4;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[3];

  v9 = (_QWORD *)(a1 + 24);
  v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>(a1, v11, a3, a4, (uint64_t)v27);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    v20 = 1;
    if (v12 >= 3)
      v20 = (v12 & (v12 - 1)) != 0;
    v21 = v20 | (2 * v12);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v23);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
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
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12)
          v25 %= v12;
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_1B41A0C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  std::string *result;

  v9 = a1 + 16;
  v10 = (char *)operator new(0x40uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = a2;
  result = std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>((std::string *)(v10 + 16), a3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_1B41A0CF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>(std::string *this, __int128 *a2, __int128 *a3)
{
  __int128 v5;
  std::string *v6;
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_1B41A0D88(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

uint64_t _UUIDBytesToPath<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  BOOL v3;
  uint64_t v5;

  if (a1)
    v3 = __str == 0;
  else
    v3 = 1;
  v5 = !v3 && __size > 0x25;
  if ((_DWORD)v5 == 1)
    snprintf(__str, __size, "%02hhX%02hhX%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX/", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return v5;
}

uint64_t CSSymbolicationSessionCreateWithFlags(unsigned int a1)
{
  SymbolicationSession *v2;

  v2 = (SymbolicationSession *)operator new();
  SymbolicationSession::SymbolicationSession(v2, a1);
  return 1;
}

void sub_1B41A0EF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E36940](v1, 0x10A1C4031C43930);
  _Unwind_Resume(a1);
}

uint64_t CSSymbolicationSessionCreateSymbolicatorForPidWithFlags(char a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;
  unsigned int *v6;

  if (!(a1 & 7 | (8 * (a2 & 3))))
    return 0;
  result = SymbolicationSession::create_pid_symbolicator((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3, a4, a5);
  v6 = (unsigned int *)result;
  if (result)
  {
    CSCppReferenceCount::retain(result);
    CSCppReferenceCount::release(v6, 1);
    return 2;
  }
  return result;
}

uint64_t CSSymbolicationSessionCreateNonFaultingSymbolicatorForPid(char a1, uint64_t a2, int a3, int a4)
{
  uint64_t FlagsForNonFaultingBehavior;

  FlagsForNonFaultingBehavior = CSSymbolicatorGetFlagsForNonFaultingBehavior();
  return CSSymbolicationSessionCreateSymbolicatorForPidWithFlags(a1, a2, a3, a4, FlagsForNonFaultingBehavior);
}

uint64_t CSSymbolicationSessionProcessATRCProcessAndDSCChunks(uint64_t result, uint64_t a2, __CFData *a3, __CFData *a4)
{
  if (result & 7 | (8 * (a2 & 3)))
    return SymbolicationSession::process_ats_dsc_and_pid_chunks((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3, a4);
  return result;
}

uint64_t CSSymbolicationSessionProcessATRCKernelChunk(uint64_t result, uint64_t a2, __CFData *a3)
{
  if (result & 7 | (8 * (a2 & 3)))
    return SymbolicationSession::process_ats_kernel_chunk((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  return result;
}

__CFString *CSSymbolicationSessionCopyDescriptionWithIndent(char a1, uint64_t a2, int a3)
{
  unint64_t v4;
  __CFString *i;

  if (!(a1 & 7 | (8 * (a2 & 3))))
    return 0;
  v4 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  for (i = CFStringCreateMutable(0, 0); a3; --a3)
    CFStringAppendCString(i, "\t", 0x8000100u);
  CFStringAppendFormat(i, 0, CFSTR("<SymbolicationSession: %p> flags: 0x%x process count: %llu"), v4, *(unsigned int *)(v4 + 256), *(_QWORD *)(v4 + 168));
  return i;
}

uint64_t CSSymbolicationSessionSetGroupKey(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result & 7 | (8 * (a2 & 3)))
    *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + 264) = a3;
  return result;
}

uint64_t CSSymbolicationSessionForeachPid(char a1, uint64_t a2, uint64_t a3)
{
  if (a1 & 7 | (8 * (a2 & 3)))
    return SymbolicationSession::foreach_pid(a2 & 0xFFFFFFFFFFFFFFFCLL, a3);
  else
    return 0;
}

_QWORD *CSSymbolicationSessionGetDSCSlideForPid(char a1, uint64_t a2, int a3)
{
  if (a1 & 7 | (8 * (a2 & 3)))
    return SymbolicationSession::dsc_slide_for_pid((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  else
    return 0;
}

uint64_t CSExceptionSafeThreadRunBlock(CSCppExceptionSafeThread *a1)
{
  void *v2;

  v2 = CSCppExceptionSafeThread::main(a1);
  return CSCppExceptionSafeThread::run((uint64_t)v2, (uint64_t)a1, 0);
}

void *CSCppExceptionSafeThread::main(CSCppExceptionSafeThread *this)
{
  unsigned __int8 v1;

  {
    CSCppExceptionSafeThread::CSCppExceptionSafeThread((CSCppExceptionSafeThread *)&CSCppExceptionSafeThread::main(void)::thread_singleton);
  }
  return &CSCppExceptionSafeThread::main(void)::thread_singleton;
}

void sub_1B41A11A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSExceptionSafeThreadRunBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  void *v4;

  v4 = CSCppExceptionSafeThread::main(a1);
  return CSCppExceptionSafeThread::run((uint64_t)v4, (uint64_t)a1, a2);
}

uint64_t CSExceptionSafeThreadProtectBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  _BOOL8 is_current_thread;
  void *v5;

  is_current_thread = CSCppExceptionSafeThread::is_current_thread(a1);
  if (is_current_thread)
  {
    v5 = CSCppExceptionSafeThread::main((CSCppExceptionSafeThread *)is_current_thread);
    return CSCppExceptionSafeThread::run((uint64_t)v5, (uint64_t)a1, a2);
  }
  else
  {
    (*((void (**)(CSCppExceptionSafeThread *))a1 + 2))(a1);
    return 4096;
  }
}

_OWORD *kCSTypeRetainCallBack(const __CFAllocator *a1, uint64_t *a2)
{
  _OWORD *v3;

  v3 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  *v3 = *(_OWORD *)a2;
  CSRetain(*a2, a2[1]);
  return v3;
}

void kCSTypeReleaseCallBack(const __CFAllocator *a1, void *a2)
{
  CSRelease(*(unsigned int **)a2, *((_QWORD *)a2 + 1));
  free(a2);
}

BOOL kCSTypeEqualCallBack(uint64_t *a1, uint64_t *a2)
{
  return CSEqual(*a1, a1[1], *a2, a2[1]);
}

uint64_t kCSTypeHashCallBack(_QWORD *a1)
{
  return a1[1] ^ *a1;
}

__n128 kCSTypeWeakRetainCallBack(const __CFAllocator *a1, __n128 *a2)
{
  _OWORD *v3;
  __n128 result;

  v3 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  result = *a2;
  *v3 = *a2;
  return result;
}

void kCSTypeWeakReleaseCallBack(const __CFAllocator *a1, void *a2)
{
  free(a2);
}

uint64_t CSCppMMapSourceInfo::path(CSCppMMapSourceInfo *this, uint64_t a2)
{
  return *((unsigned int *)this + 2) + a2;
}

uint64_t _copyMMapArchiveFromCacheWithUUID<CFUUIDBytes>(__n128 *a1, _QWORD *a2, unint64_t *a3, __int16 *a4)
{
  CSCppSymbolOwner *v8;

  if (a1 && !UUID::is_null((UUID *)a1))
    return CSCppMMapArchiveCache::archive_for_uuid(a1, 0, 1, a2, a3, a4, 0, v8);
  else
    return 0;
}

uint64_t CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory(uint64_t a1, uint64_t a2, char *a3, const char *a4, _OWORD *a5)
{
  _QWORD *v9;
  char *v10;
  UUID *v11;
  _QWORD *v12;
  _QWORD *v13;
  CSCppDyldSharedCache *v14;
  CSCppDyldSharedCache *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD v38[7];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD v44[5];

  *(_QWORD *)a1 = &off_1E677AA60;
  v9 = (_QWORD *)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 16), a3);
  if (a4)
    v10 = (char *)a4;
  else
    v10 = "";
  v11 = (UUID *)std::string::basic_string[abi:ne180100]<0>(v9, v10);
  *(_OWORD *)(a1 + 64) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  v12 = (_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)UUID::null_uuid(v11);
  *(_OWORD *)(a1 + 184) = *a5;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  v13 = (_QWORD *)new_partial_file_memory((uint64_t)a3, 0, 0, (uint64_t)&__block_literal_global_4);
  v43 = v13;
  v14 = (CSCppDyldSharedCache *)TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::dyld_shared_cache_at(&v43, 0);
  v15 = v14;
  if (v14)
  {
    *(_OWORD *)(a1 + 168) = *(_OWORD *)CSCppDyldSharedCache::dsc_uuid(v14);
    if (a4)
      *(_QWORD *)(a1 + 64) = CSCppDyldSharedCacheMemory::TEXT_address_of_path((CSCppDyldSharedCacheMemory *)a1, a4, (unint64_t *)(a1 + 72));
    *(_QWORD *)(a1 + 216) = CSCppDyldSharedCache::text_segment_range(v15);
    *(_QWORD *)(a1 + 224) = v16;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2000000000;
    v42 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 0x40000000;
    v38[2] = ___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke_2;
    v38[3] = &unk_1E677AAE0;
    v38[4] = &v39;
    v38[5] = a1;
    v38[6] = a3;
    CSCppDyldSharedCache::enumerate_mapping_infos((uint64_t)v15, (uint64_t)v38);
    *(_QWORD *)(a1 + 80) = CSCppDyldSharedCache::local_symbols_range(v15);
    *(_QWORD *)(a1 + 88) = v17;
    if (v17)
    {
      v18 = operator new();
      CSCppFileMemory::CSCppFileMemory(v18, a3, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
      v19 = *(_QWORD *)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v18;
      if (!v19 || ((*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19), (v18 = *(_QWORD *)(a1 + 96)) != 0))
      {
        v20 = (unsigned int *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v18 + 32))(v18, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
        if (v20)
          *(_BYTE *)(a1 + 104) = CSCppDyldSharedCache::stripped_locals_data_for ((uint64_t)v15, v40[3], v20, a1 + 112);
      }
    }
    v21 = *(_QWORD *)(a1 + 160);
    v22 = *(_QWORD *)(a1 + 216);
    v23 = v13[4];
    *(_QWORD *)(a1 + 200) = v22;
    *(_QWORD *)(a1 + 208) = v23;
    v24 = v13[6];
    v25 = *(_QWORD **)(a1 + 152);
    if ((unint64_t)v25 >= v21)
    {
      v27 = ((uint64_t)v25 - *v12) >> 5;
      v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 59)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v29 = v21 - *v12;
      if (v29 >> 4 > v28)
        v28 = v29 >> 4;
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFE0)
        v30 = 0x7FFFFFFFFFFFFFFLL;
      else
        v30 = v28;
      v44[4] = a1 + 160;
      v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>(a1 + 160, v30);
      v32 = &v31[32 * v27];
      v44[0] = v31;
      v44[1] = v32;
      v44[3] = &v31[32 * v33];
      *(_QWORD *)v32 = v22;
      *((_QWORD *)v32 + 1) = v23;
      *((_QWORD *)v32 + 2) = v24;
      *((_QWORD *)v32 + 3) = v13;
      v44[2] = v32 + 32;
      std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer((uint64_t *)(a1 + 144), v44);
      v26 = *(_QWORD *)(a1 + 152);
      std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer((uint64_t)v44);
    }
    else
    {
      *v25 = v22;
      v25[1] = v23;
      v25[2] = v24;
      v25[3] = v13;
      v26 = (unint64_t)(v25 + 4);
      *(_QWORD *)(a1 + 152) = v25 + 4;
    }
    v34 = *(_QWORD *)(a1 + 144);
    v35 = 126 - 2 * __clz((uint64_t)(v26 - v34) >> 5);
    *(_QWORD *)(a1 + 152) = v26;
    if (v26 == v34)
      v36 = 0;
    else
      v36 = v35;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>(v34, v26, (uint64_t)v44, v36, 1);
    _Block_object_dispose(&v39, 8);
  }
  else if (v13)
  {
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  }
  return a1;
}

void sub_1B41A16C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  void **v10;
  void **v11;
  uint64_t v12;
  uint64_t v14;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v14 = *(_QWORD *)(v9 + 96);
  *(_QWORD *)(v9 + 96) = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (*(char *)(v9 + 63) < 0)
    operator delete(*v11);
  if (*(char *)(v9 + 39) < 0)
    operator delete(*v10);
  _Unwind_Resume(a1);
}

uint64_t CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory(UUID *a1, uint64_t a2, char *a3, const char *a4)
{
  uint64_t *v7;
  uint64_t v8;

  v7 = UUID::null_uuid(a1);
  return CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory((uint64_t)a1, v8, a3, a4, v7);
}

uint64_t CSCppDyldSharedCacheMemory::TEXT_address_of_path(CSCppDyldSharedCacheMemory *this, const char *a2, unint64_t *a3)
{
  const char *v6;
  uint64_t v7;
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2000000000;
  v10 = 0;
  v6 = (const char *)_dyld_shared_cache_real_path();
  if (v6)
    strcmp(a2, v6);
  CSCppDyldSharedCacheMemory::foreach_text_segment((uint64_t)this);
  if (a3)
    *a3 = v12[3];
  v7 = v16[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_1B41A1940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke_2(uint64_t result, unint64_t *a2)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  _QWORD v27[5];

  v3 = result;
  v4 = *(_QWORD **)(result + 40);
  v5 = *a2;
  v7 = v4 + 9;
  v6 = v4[9];
  if (v6 && (v8 = v4[8], v8 >= v5) && v8 + v6 <= a2[1] + v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v8 - v5 + a2[2];
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    v14 = *v7;
    v11 = operator new();
    CSCppFileMemory::CSCppFileMemory(v11, *(char **)(v3 + 48), v13, v14);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24);
    v5 += v12;
  }
  else
  {
    if (*((_DWORD *)a2 + 7) != 1)
      return result;
    v9 = a2[1];
    v10 = a2[2];
    v7 = a2 + 1;
    v11 = operator new();
    CSCppFileMemory::CSCppFileMemory(v11, *(char **)(v3 + 48), v10, v9);
    v12 = a2[2];
  }
  v15 = *v7;
  result = (uint64_t)(v4 + 20);
  v16 = v4[20];
  v17 = (unint64_t *)v4[19];
  if ((unint64_t)v17 >= v16)
  {
    v19 = v4[18];
    v20 = ((uint64_t)v17 - v19) >> 5;
    v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) >> 59)
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    v22 = v16 - v19;
    if (v22 >> 4 > v21)
      v21 = v22 >> 4;
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0)
      v23 = 0x7FFFFFFFFFFFFFFLL;
    else
      v23 = v21;
    v27[4] = v4 + 20;
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>(result, v23);
    v25 = &v24[32 * v20];
    v27[0] = v24;
    v27[1] = v25;
    v27[3] = &v24[32 * v26];
    *(_QWORD *)v25 = v5;
    *((_QWORD *)v25 + 1) = v15;
    *((_QWORD *)v25 + 2) = v12;
    *((_QWORD *)v25 + 3) = v11;
    v27[2] = v25 + 32;
    std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer(v4 + 18, v27);
    v18 = (_QWORD *)v4[19];
    result = std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer((uint64_t)v27);
  }
  else
  {
    *v17 = v5;
    v17[1] = v15;
    v17[2] = v12;
    v17[3] = v11;
    v18 = v17 + 4;
    v4[19] = v17 + 4;
  }
  v4[19] = v18;
  return result;
}

void sub_1B41A1B48(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E36940](v1, 0x1093C406FCC8570);
  _Unwind_Resume(a1);
}

void CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(CSCppDyldSharedCacheMemory *this)
{
  uint64_t v2;
  void **v3;

  *(_QWORD *)this = &off_1E677AA60;
  v3 = (void **)((char *)this + 144);
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

{
  CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(this);
  JUMPOUT(0x1B5E36940);
}

unint64_t CSCppDyldSharedCacheMemory::file_range_for_memory_range(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = *(_QWORD **)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 152) - (_QWORD)v3;
  if (!v4)
    return 0;
  v5 = v4 >> 5;
  v6 = *(_QWORD **)(a1 + 144);
  do
  {
    v7 = v5 >> 1;
    v8 = &v6[4 * (v5 >> 1)];
    v10 = *v8;
    v9 = v8 + 4;
    v5 += ~(v5 >> 1);
    if (*a2 < v10)
      v5 = v7;
    else
      v6 = v9;
  }
  while (v5);
  if (v6 == v3)
    return 0;
  v11 = *(v6 - 4);
  v12 = *a2 - v11;
  if (*a2 < v11 || a2[1] + *a2 > *(v6 - 3) + v11)
    return 0;
  if (a3)
    *a3 = *(v6 - 1);
  return v12 + *(v6 - 2);
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_segment(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string *v6;
  uint64_t v7;
  std::string v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (*(char *)(a1 + 39) < 0)
  {
    v3 = *(_QWORD *)(a1 + 16);
    v2 = *(_QWORD *)(a1 + 24);
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = *(unsigned __int8 *)(a1 + 39);
    v3 = a1 + 16;
    if (!*(_BYTE *)(a1 + 39))
      goto LABEL_10;
  }
  v4 = v3 - 1;
  while (v2)
  {
    v5 = *(unsigned __int8 *)(v4 + v2--);
    if (v5 == 47)
    {
      if (v2 == -1)
        break;
      std::string::basic_string(&v9, (const std::string *)(a1 + 16), 0, v2 + 1, (std::allocator<char> *)v14);
      goto LABEL_11;
    }
  }
LABEL_10:
  std::string::basic_string[abi:ne180100]<0>(&v9, "");
LABEL_11:
  v6 = &v9;
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v6 = (std::string *)v9.__r_.__value_.__r.__words[0];
  v14[0] = v6;
  v14[1] = 0;
  UUID::is_null((UUID *)(a1 + 184));
  dyld_shared_cache_find_iterate_text();
  v7 = v11[3];
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1B41A1E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20foreach_text_segmentEU13block_pointerFvPKcyyE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_memory(uint64_t a1)
{
  return CSCppDyldSharedCacheMemory::foreach_text_segment(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory19foreach_text_memoryEU13block_pointerFvPKcP15CSCppFileMemoryE_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v15[2];

  v6 = *(_QWORD *)(a1 + 40);
  v15[0] = a3;
  v15[1] = a4;
  v7 = CSCppDyldSharedCacheMemory::file_range_for_memory_range(v6, v15, 0);
  if (v8)
  {
    v9 = v7;
    v10 = (_QWORD *)(v6 + 16);
    if (*(char *)(v6 + 39) < 0)
      v10 = (_QWORD *)*v10;
    v11 = operator new();
    CSCppFileMemory::CSCppFileMemory(v11, v10, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  v12 = a3 - *(_QWORD *)(v6 + 216);
  if (v12 < *(_QWORD *)(v6 + 224))
  {
    v13 = (_QWORD *)(v6 + 16);
    if (*(char *)(v6 + 39) < 0)
      v13 = (_QWORD *)*v13;
    v11 = operator new();
    CSCppFileMemory::CSCppFileMemory(v11, v13, v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1B41A2070(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20TEXT_address_of_pathEPKcPy_block_invoke(uint64_t result, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v7 = result;
    result = strcmp(__s1, *(const char **)(result + 56));
    if (!(_DWORD)result || *(_BYTE *)(v7 + 72) && (result = strcmp(__s1, *(const char **)(v7 + 64)), !(_DWORD)result))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24) = a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 48) + 8) + 24) = a4;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::bytes_at(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7[2];

  v7[0] = a2;
  v7[1] = a3;
  v6 = 0;
  v4 = CSCppDyldSharedCacheMemory::file_range_for_memory_range(a1, v7, &v6);
  result = v6;
  if (v6)
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v6 + 32))(v6, v4, v3);
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::footprint(CSCppDyldSharedCacheMemory *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *((_QWORD *)this + 18);
  v3 = *((_QWORD *)this + 19);
  v4 = v3 - v2 + 232;
  v5 = *((_QWORD *)this + 12);
  if (v5)
  {
    v4 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 40))(v5);
    v2 = *((_QWORD *)this + 18);
    v3 = *((_QWORD *)this + 19);
  }
  while (v2 != v3)
  {
    v6 = *(_QWORD *)(v2 + 24);
    if (v6)
      v4 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 40))(v6);
    v2 += 32;
  }
  return v4;
}

uint64_t CSCppDyldSharedCacheMemory::to_string@<X0>(CSCppDyldSharedCacheMemory *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  int v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  _QWORD v15[10];
  char v16;
  uint64_t v17;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, (uint64_t)"CSCppDyldSharedCache path:", 26);
  v5 = *((char *)this + 39);
  if (v5 >= 0)
    v6 = (char *)this + 16;
  else
    v6 = (char *)*((_QWORD *)this + 2);
  if (v5 >= 0)
    v7 = *((unsigned __int8 *)this + 39);
  else
    v7 = *((_QWORD *)this + 3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v6, v7);
  if (std::string::compare((const std::string *)((char *)this + 40), ""))
  {
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, (uint64_t)", (symbol owner: ", 17);
    v9 = *((char *)this + 63);
    if (v9 >= 0)
      v10 = (char *)this + 40;
    else
      v10 = (char *)*((_QWORD *)this + 5);
    if (v9 >= 0)
      v11 = *((unsigned __int8 *)this + 63);
    else
      v11 = *((_QWORD *)this + 6);
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v10, v11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1);
  }
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a2);
  v14 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)&v15[-1] + *(_QWORD *)(v14 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1B5E368EC](&v17);
}

void sub_1B41A2350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t CSCppDyldSharedCacheMemory::is_task(CSCppDyldSharedCacheMemory *this)
{
  return 1;
}

uint64_t CSCppDyldSharedCacheMemory::is_dyld_shared_cache(CSCppDyldSharedCacheMemory *this)
{
  return 1;
}

uint64_t *std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
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
      v6 = *(_QWORD *)(v3 - 16);
      v7 = *(_QWORD *)(v3 - 8);
      *(_QWORD *)(v3 - 8) = 0;
      *(_QWORD *)(v4 - 16) = v6;
      *(_QWORD *)(v4 - 8) = v7;
      v4 -= 32;
      v3 -= 32;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v8 = *result;
  *result = v5;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  char v18;
  _BOOL4 v19;
  unint64_t v20;
  __int128 *v21;
  unint64_t v22;
  __int128 *v23;

  v7 = (__int128 *)a2;
  v8 = (__int128 *)result;
  v22 = a2;
  v23 = (__int128 *)result;
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
        return result;
      case 2uLL:
        v20 = *((_QWORD *)v7 - 4);
        v22 = (unint64_t)(v7 - 2);
        if (v20 < *(_QWORD *)v8)
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v23, (uint64_t *)&v22);
        return result;
      case 3uLL:
        v22 = (unint64_t)(v7 - 2);
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v8, v8 + 2, (_QWORD *)v7 - 4);
      case 4uLL:
        v22 = (unint64_t)(v7 - 2);
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v8, v8 + 2, v8 + 4, (_QWORD *)v7 - 4);
      case 5uLL:
        v22 = (unint64_t)(v7 - 2);
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v8, v8 + 2, v8 + 4, v8 + 6, (_QWORD *)v7 - 4);
      default:
        if (v10 <= 767)
        {
          if ((a5 & 1) != 0)
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v8, (uint64_t)v7);
          else
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v8, (uint64_t)v7);
        }
        if (v9 == 1)
        {
          if (v8 != v7)
            return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((unint64_t *)v8, v7, v7, a3);
          return result;
        }
        v12 = v11 >> 1;
        v13 = v7 - 2;
        if ((unint64_t)v10 <= 0x1000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(&v8[2 * (v11 >> 1)], v8, v13);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v8, &v8[2 * (v11 >> 1)], v13);
          v14 = v22;
          v15 = 32 * v12 - 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v23 + 2, (__int128 *)((char *)v23 + v15), (_QWORD *)(v22 - 64));
          v16 = 32 * v12 + 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v23 + 4, (__int128 *)((char *)v23 + v16), (_QWORD *)(v14 - 96));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((__int128 *)((char *)v23 + v15), &v23[2 * v12], (__int128 *)((char *)v23 + v16));
          v21 = &v23[2 * v12];
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v23, (uint64_t *)&v21);
        }
        if ((a5 & 1) == 0)
        {
          v7 = (__int128 *)v22;
          if (*((_QWORD *)v23 - 4) < *(_QWORD *)v23)
            goto LABEL_12;
          result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>((uint64_t)v23, v22);
          v8 = (__int128 *)result;
LABEL_21:
          a5 = 0;
          v23 = v8;
          a4 = -v9;
          continue;
        }
        v7 = (__int128 *)v22;
LABEL_12:
        v17 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>((uint64_t)v23, (unint64_t)v7);
        if ((v18 & 1) == 0)
        {
LABEL_19:
          result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>(v23, v17, a3, -v9, a5 & 1);
          v8 = v17 + 2;
          goto LABEL_21;
        }
        v19 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v23, v17);
        v8 = v17 + 2;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v17 + 2, v7);
        if (!(_DWORD)result)
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
          v22 = (unint64_t)v17;
          v8 = v23;
          v7 = v17;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }
        return result;
    }
  }
}

uint64_t std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(__int128 **a1, uint64_t *a2)
{
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;

  v2 = *a1;
  v3 = *a2;
  v9 = **a1;
  v4 = *((_QWORD *)*a1 + 2);
  v5 = *((_QWORD *)*a1 + 3);
  *((_QWORD *)v2 + 3) = 0;
  *v2 = *(_OWORD *)v3;
  *((_QWORD *)v2 + 2) = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;
  v7 = *((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  *(_OWORD *)v3 = v9;
  result = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 24) = v5;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (result != a2)
  {
    v3 = result;
    v4 = result + 32;
    if (result + 32 != a2)
    {
      v5 = 0;
      v6 = result;
      do
      {
        v7 = v6;
        v6 = v4;
        v8 = *(_QWORD *)(v7 + 32);
        if (v8 < *(_QWORD *)v7)
        {
          v17 = *(_OWORD *)(v7 + 40);
          v9 = *(_QWORD *)(v7 + 56);
          v10 = v5;
          *(_QWORD *)(v7 + 56) = 0;
          while (1)
          {
            v11 = v3 + v10;
            *(_OWORD *)(v11 + 32) = *(_OWORD *)(v3 + v10);
            v12 = *(_QWORD *)(v3 + v10 + 16);
            v13 = *(_QWORD *)(v3 + v10 + 24);
            *(_QWORD *)(v11 + 24) = 0;
            v14 = *(_QWORD *)(v3 + v10 + 56);
            *(_QWORD *)(v11 + 48) = v12;
            *(_QWORD *)(v11 + 56) = v13;
            if (v14)
              (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
            if (!v10)
              break;
            v15 = *(_QWORD *)(v3 + v10 - 32);
            v10 -= 32;
            if (v8 >= v15)
            {
              v16 = v3 + v10 + 32;
              goto LABEL_12;
            }
          }
          v16 = v3;
LABEL_12:
          *(_QWORD *)v16 = v8;
          *(_OWORD *)(v16 + 8) = v17;
          result = *(_QWORD *)(v16 + 24);
          *(_QWORD *)(v16 + 24) = v9;
          if (result)
            result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
        }
        v4 = v6 + 32;
        v5 += 32;
      }
      while (v6 + 32 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;

  if (result != a2)
  {
    v3 = result;
    v4 = result + 32;
    if (result + 32 != a2)
    {
      v5 = (_QWORD *)(result + 56);
      do
      {
        v6 = v3;
        v3 = v4;
        v7 = *(_QWORD *)(v6 + 32);
        if (v7 < *(_QWORD *)v6)
        {
          v14 = *(_OWORD *)(v6 + 40);
          v8 = *(_QWORD *)(v6 + 56);
          v9 = v5;
          *(_QWORD *)(v6 + 56) = 0;
          do
          {
            *(_OWORD *)(v9 - 3) = *(_OWORD *)(v9 - 7);
            v10 = *(v9 - 5);
            v11 = *(v9 - 4);
            *(v9 - 4) = 0;
            v12 = *v9;
            *(v9 - 1) = v10;
            *v9 = v11;
            if (v12)
              (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
            v13 = *(v9 - 11);
            v9 -= 4;
          }
          while (v7 < v13);
          *(v9 - 3) = v7;
          *((_OWORD *)v9 - 1) = v14;
          result = *v9;
          *v9 = v8;
          if (result)
            result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
        }
        v4 = v3 + 32;
        v5 += 4;
      }
      while (v3 + 32 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(__int128 *a1, __int128 *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 **v5;
  uint64_t *v6;
  _QWORD *v8;
  __int128 *v9;
  __int128 *v10;

  v10 = a1;
  v8 = a3;
  v9 = a2;
  v3 = *(_QWORD *)a2;
  v4 = *a3;
  if (*(_QWORD *)a2 < *(_QWORD *)a1)
  {
    if (v4 < v3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v8);
      return 1;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v9);
    if (*v8 >= *(_QWORD *)v9)
      return 1;
    v5 = &v9;
    v6 = (uint64_t *)&v8;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v9, (uint64_t *)&v8);
    if (*(_QWORD *)v9 >= *(_QWORD *)v10)
      return 1;
    v5 = &v10;
    v6 = (uint64_t *)&v9;
    goto LABEL_9;
  }
  return 0;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 *v7;
  unint64_t v8;
  __int128 *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;

  v20 = a2;
  v3 = *(_OWORD *)a1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  v6 = v3;
  if ((unint64_t)v3 >= *(_QWORD *)(a2 - 32))
  {
    v9 = (__int128 *)(a1 + 32);
    do
    {
      v7 = v9;
      if ((unint64_t)v9 >= a2)
        break;
      v9 += 2;
    }
    while ((unint64_t)v3 >= *(_QWORD *)v7);
  }
  else
  {
    v7 = (__int128 *)a1;
    do
    {
      v8 = *((_QWORD *)v7 + 4);
      v7 += 2;
    }
    while ((unint64_t)v3 >= v8);
  }
  v21 = v7;
  v19 = v3;
  if ((unint64_t)v7 < a2)
  {
    do
    {
      v10 = *(_QWORD *)(a2 - 32);
      a2 -= 32;
    }
    while ((unint64_t)v3 < v10);
    v20 = a2;
  }
  if ((unint64_t)v7 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v21, (uint64_t *)&v20);
      v7 = v21;
      do
      {
        v11 = *((_QWORD *)v7 + 4);
        v7 += 2;
      }
      while (v6 >= v11);
      v21 = v7;
      v12 = v20;
      do
      {
        v13 = *(_QWORD *)(v12 - 32);
        v12 -= 32;
      }
      while (v6 < v13);
      v20 = v12;
    }
    while ((unint64_t)v7 < v12);
  }
  if (v7 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *(v7 - 2);
    v14 = *((_QWORD *)v7 - 2);
    v15 = *((_QWORD *)v7 - 1);
    *((_QWORD *)v7 - 1) = 0;
    v16 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 16) = v14;
    *(_QWORD *)(a1 + 24) = v15;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  }
  *(v7 - 2) = v19;
  v17 = *((_QWORD *)v7 - 1);
  *((_QWORD *)v7 - 2) = v4;
  *((_QWORD *)v7 - 1) = v5;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  return v21;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  unint64_t v23;
  __int128 *v24;

  v4 = 0;
  v5 = *(_OWORD *)a1;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  v22 = v5;
  v8 = v5;
  do
  {
    v9 = *(_QWORD *)(a1 + v4 + 32);
    v4 += 32;
  }
  while (v9 < (unint64_t)v5);
  v10 = a1 + v4;
  v24 = (__int128 *)(a1 + v4);
  if (v4 == 32)
  {
    do
    {
      if (v10 >= a2)
        break;
      v12 = *(_QWORD *)(a2 - 32);
      a2 -= 32;
    }
    while (v12 >= (unint64_t)v5);
  }
  else
  {
    do
    {
      v11 = *(_QWORD *)(a2 - 32);
      a2 -= 32;
    }
    while (v11 >= (unint64_t)v5);
  }
  v23 = a2;
  v13 = (__int128 *)(a1 + v4);
  if (v10 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v24, (uint64_t *)&v23);
      v13 = v24;
      do
      {
        v14 = *((_QWORD *)v13 + 4);
        v13 += 2;
      }
      while (v14 < v8);
      v24 = v13;
      v15 = v23;
      do
      {
        v16 = *(_QWORD *)(v15 - 32);
        v15 -= 32;
      }
      while (v16 >= v8);
      v23 = v15;
    }
    while ((unint64_t)v13 < v15);
  }
  if (v13 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *(v13 - 2);
    v17 = *((_QWORD *)v13 - 2);
    v18 = *((_QWORD *)v13 - 1);
    *((_QWORD *)v13 - 1) = 0;
    v19 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 16) = v17;
    *(_QWORD *)(a1 + 24) = v18;
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  }
  *(v13 - 2) = v22;
  v20 = *((_QWORD *)v13 - 1);
  *((_QWORD *)v13 - 2) = v6;
  *((_QWORD *)v13 - 1) = v7;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  _BOOL8 result;
  unint64_t v6;
  __int128 *v7;
  __int128 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  __int128 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 *v21;
  __int128 *v22;

  v22 = a1;
  v4 = ((char *)a2 - (char *)a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *((_QWORD *)a2 - 4);
      v21 = a2 - 2;
      if (v6 < *(_QWORD *)a1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v22, (uint64_t *)&v21);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, (_QWORD *)a2 - 4);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, a1 + 4, (_QWORD *)a2 - 4);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, a1 + 4, a1 + 6, (_QWORD *)a2 - 4);
      return 1;
    default:
      v7 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a1 + 2, (_QWORD *)a1 + 8);
      v8 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v9 = 0;
      v10 = (uint64_t *)a1 + 15;
      break;
  }
  while (1)
  {
    v11 = *(_QWORD *)v8;
    if (*(_QWORD *)v8 < *(_QWORD *)v7)
    {
      v20 = *(__int128 *)((char *)v8 + 8);
      v12 = *((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = 0;
      v13 = v10;
      v14 = v22;
      while (1)
      {
        *(_OWORD *)(v13 - 3) = *(_OWORD *)(v13 - 7);
        v15 = *(v13 - 5);
        v16 = *(v13 - 4);
        *(v13 - 4) = 0;
        v17 = *v13;
        *(v13 - 1) = v15;
        *v13 = v16;
        if (v17)
          (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
        if (v13 - 7 == (uint64_t *)v14)
          break;
        v18 = *(v13 - 11);
        v13 -= 4;
        if (v11 >= v18)
        {
          v14 = (__int128 *)(v13 - 3);
          break;
        }
      }
      *(_QWORD *)v14 = v11;
      *(__int128 *)((char *)v14 + 8) = v20;
      v19 = *((_QWORD *)v14 + 3);
      *((_QWORD *)v14 + 3) = v12;
      if (v19)
        (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
      if (++v9 == 8)
        return v8 + 2 == a2;
    }
    v7 = v8;
    v10 += 4;
    v8 += 2;
    if (v8 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(__int128 *a1, __int128 *a2, __int128 *a3, _QWORD *a4)
{
  uint64_t result;
  _QWORD *v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;

  v11 = a2;
  v12 = a1;
  v9 = a4;
  v10 = a3;
  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a2, a3);
  if (*a4 < *(_QWORD *)a3)
  {
    result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v10, (uint64_t *)&v9);
    if (*(_QWORD *)v10 < *(_QWORD *)a2)
    {
      result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v11, (uint64_t *)&v10);
      if (*(_QWORD *)v11 < *(_QWORD *)a1)
        return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v12, (uint64_t *)&v11);
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, _QWORD *a5)
{
  uint64_t result;
  _QWORD *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  __int128 *v15;

  v14 = a2;
  v15 = a1;
  v12 = a4;
  v13 = a3;
  v11 = a5;
  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(a1, a2, a3, a4);
  if (*a5 < *(_QWORD *)a4)
  {
    result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v12, (uint64_t *)&v11);
    if (*(_QWORD *)v12 < *(_QWORD *)a3)
    {
      result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v13, (uint64_t *)&v12);
      if (*(_QWORD *)v13 < *(_QWORD *)a2)
      {
        result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v14, (uint64_t *)&v13);
        if (*(_QWORD *)v14 < *(_QWORD *)a1)
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v15, (uint64_t *)&v14);
      }
    }
  }
  return result;
}

__int128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(unint64_t *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  unint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  __int128 *v12;
  __int128 *v14;
  unint64_t *v15;

  v15 = a1;
  if (a1 != (unint64_t *)a2)
  {
    v7 = a1;
    v8 = ((char *)a2 - (char *)a1) >> 5;
    if ((char *)a2 - (char *)a1 >= 33)
    {
      v9 = (unint64_t)(v8 - 2) >> 1;
      v10 = v9 + 1;
      v11 = &a1[4 * v9];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v7, a4, v8, v11);
        v11 -= 4;
        --v10;
      }
      while (v10);
    }
    v14 = a2;
    if (a2 != a3)
    {
      v12 = a2;
      do
      {
        if (*(_QWORD *)v12 < *v15)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>(&v14, (uint64_t *)&v15);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v15, a4, v8, v15);
          v12 = v14;
        }
        v12 += 2;
        v14 = v12;
      }
      while (v12 != a3);
      v7 = v15;
    }
    std::__sort_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v7, (uint64_t)a2, a4);
    return v14;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v7 = (uint64_t)a4 - result;
    v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 5)
    {
      v10 = v7 >> 4;
      v11 = (v7 >> 4) + 1;
      v12 = (unint64_t *)(result + 32 * v11);
      v13 = v10 + 2;
      if (v10 + 2 >= a3)
      {
        v14 = *v12;
      }
      else
      {
        v14 = *v12;
        v15 = v12[4];
        if (*v12 <= v15)
          v14 = v12[4];
        if (*v12 < v15)
        {
          v12 += 4;
          v11 = v13;
        }
      }
      v16 = *a4;
      if (v14 >= *a4)
      {
        v24 = *(_OWORD *)(a4 + 1);
        v17 = a4[3];
        a4[3] = 0;
        do
        {
          v18 = v5;
          v5 = v12;
          *(_OWORD *)v18 = *(_OWORD *)v12;
          v19 = v12[2];
          v20 = v5[3];
          v5[3] = 0;
          v21 = v18[3];
          v18[2] = v19;
          v18[3] = v20;
          if (v21)
            (*(void (**)(unint64_t))(*(_QWORD *)v21 + 8))(v21);
          if (v8 < v11)
            break;
          v12 = (unint64_t *)(v6 + 32 * ((2 * v11) | 1));
          if (2 * v11 + 2 >= a3)
          {
            v22 = *v12;
            v11 = (2 * v11) | 1;
          }
          else
          {
            v22 = *v12;
            v23 = v12[4];
            if (*v12 <= v23)
              v22 = v12[4];
            if (*v12 >= v23)
            {
              v11 = (2 * v11) | 1;
            }
            else
            {
              v12 += 4;
              v11 = 2 * v11 + 2;
            }
          }
        }
        while (v22 >= v16);
        *v5 = v16;
        *(_OWORD *)(v5 + 1) = v24;
        result = v5[3];
        v5[3] = v17;
        if (result)
          return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
      }
    }
  }
  return result;
}

uint64_t std::__sort_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;

  if (a2 - result >= 33)
  {
    v4 = (char *)result;
    v5 = (unint64_t)(a2 - result) >> 5;
    v6 = (_QWORD *)(a2 - 32);
    do
    {
      v15 = *(_OWORD *)v4;
      v8 = *((_QWORD *)v4 + 2);
      v7 = *((_QWORD *)v4 + 3);
      *((_QWORD *)v4 + 3) = 0;
      v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(v4, a3, v5);
      v10 = v9;
      if (v6 == v9)
      {
        *(_OWORD *)v9 = v15;
        result = v9[3];
        v10[2] = v8;
        v10[3] = v7;
        if (result)
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
      }
      else
      {
        *(_OWORD *)v9 = *(_OWORD *)v6;
        v9[2] = v6[2];
        v11 = v6[3];
        v6[3] = 0;
        v12 = v9[3];
        v10[3] = v11;
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
        *(_OWORD *)v6 = v15;
        v13 = v6[3];
        v6[2] = v8;
        v6[3] = v7;
        if (v13)
          (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
        result = std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>((uint64_t)v4, (uint64_t)(v10 + 4), a3, ((char *)(v10 + 4) - v4) >> 5);
      }
      v6 -= 4;
    }
    while (v5-- > 2);
  }
  return result;
}

void sub_1B41A33E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = 0;
  v5 = a3 - 2;
  if (a3 < 2)
    v5 = a3 - 1;
  v6 = v5 >> 1;
  do
  {
    v7 = &a1[4 * v4 + 4];
    v8 = 2 * v4;
    v4 = (2 * v4) | 1;
    if (v8 + 2 < a3 && *v7 < v7[4])
    {
      v7 += 4;
      v4 = v8 + 2;
    }
    *(_OWORD *)a1 = *(_OWORD *)v7;
    v9 = v7[2];
    v10 = v7[3];
    v7[3] = 0;
    v11 = a1[3];
    a1[2] = v9;
    a1[3] = v10;
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    a1 = v7;
  }
  while (v4 <= v6);
  return v7;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = result;
    v6 = v4 >> 1;
    v7 = result + 32 * (v4 >> 1);
    v8 = a2 - 32;
    v9 = *(_QWORD *)(a2 - 32);
    if (*(_QWORD *)v7 < v9)
    {
      v15 = *(_OWORD *)(a2 - 24);
      v10 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 8) = 0;
      do
      {
        v11 = v8;
        v8 = v7;
        *(_OWORD *)v11 = *(_OWORD *)v7;
        v12 = *(_QWORD *)(v7 + 16);
        v13 = *(_QWORD *)(v8 + 24);
        *(_QWORD *)(v8 + 24) = 0;
        v14 = *(_QWORD *)(v11 + 24);
        *(_QWORD *)(v11 + 16) = v12;
        *(_QWORD *)(v11 + 24) = v13;
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
        if (!v6)
          break;
        v6 = (v6 - 1) >> 1;
        v7 = v5 + 32 * v6;
      }
      while (*(_QWORD *)v7 < v9);
      *(_QWORD *)v8 = v9;
      *(_OWORD *)(v8 + 8) = v15;
      result = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v10;
      if (result)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

void std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  uint64_t v6;

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
        v6 = *((_QWORD *)v4 - 1);
        *((_QWORD *)v4 - 1) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
        v4 -= 32;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

TMMapArchive *CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  TMMapArchive *archive_wrapper;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t text;
  uint64_t v9;
  TMMapArchive *new_mmap_archive_with_text;
  uint64_t v11;
  uint64_t v12;
  ArchiveWrapper *v13;
  _QWORD v15[3];
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void **v19;
  _BYTE v20[24];
  _QWORD *v21[6];
  char v22;
  uint64_t v23;
  std::mutex v24;
  uint64_t v25;

  archive_wrapper = a2;
  v25 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (*((_DWORD *)this + 20))
      return 0;
    CSCppTextSectionDataDescriptor::CSCppTextSectionDataDescriptor((CSCppTextSectionDataDescriptor *)v20, a2);
    v16 = *((_QWORD *)archive_wrapper + 14);
    if ((CSCppArchitecture::is_64_bit((CSCppArchitecture *)&v16) & 1) != 0)
    {
      CSCppTextSectionDataDescriptor::get_text_section<Pointer64>((uint64_t)v20, (uint64_t)archive_wrapper, &v16);
      v5 = v16;
      v6 = v17;
      v7 = v18;
    }
    else
    {
      text = CSCppTextSectionDataDescriptor::get_text_section<Pointer32>((unint64_t)v20, (uint64_t)archive_wrapper);
      v7 = v9;
      v5 = text;
      v6 = HIDWORD(text);
    }
    new_mmap_archive_with_text = this;
    if (v7)
    {
      v16 = v5;
      v17 = v6;
      v18 = v7;
      v15[0] = CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>((uint64_t)this, (uint64_t)archive_wrapper, &v16)+ v5;
      v15[1] = v6;
      v15[2] = v7;
      new_mmap_archive_with_text = _create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>((unsigned int *)this, (unsigned int *)v15);
    }
    std::mutex::~mutex(&v24);
    v19 = (void **)&v23;
    std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v19);
    if (v22 < 0)
      operator delete(v21[4]);
    std::__tree<TRange<Pointer64>>::destroy((uint64_t)v21, v21[1]);
    if (new_mmap_archive_with_text == this)
    {
      return 0;
    }
    else
    {
      v11 = *((_QWORD *)archive_wrapper + 1);
      if ((*(_BYTE *)(v11 + 88) & 1) != 0)
      {
        if (*(_QWORD *)(v11 + 80))
          v12 = *(_QWORD *)(v11 + 80);
        else
          v12 = *((_QWORD *)archive_wrapper + 1);
      }
      else
      {
        v12 = 0;
      }
      archive_wrapper = (TMMapArchive *)CSCppMMapArchiveCache::make_archive_wrapper((uint64_t)new_mmap_archive_with_text, 0, 1, *((unsigned int *)new_mmap_archive_with_text + 1), v12, 7, 0);
      CSCppMMapArchiveCache::_add_archive_wrapper_locked(new_mmap_archive_with_text, archive_wrapper, v13);
    }
  }
  return archive_wrapper;
}

void sub_1B41A37C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  CSCppTextSectionDataDescriptor::~CSCppTextSectionDataDescriptor((CSCppTextSectionDataDescriptor *)va);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::make_archive_wrapper(uint64_t a1, const void *a2, int a3, uint64_t a4, uint64_t a5, __int16 a6, __int16 a7)
{
  uint64_t v14;

  v14 = operator new();
  ArchiveWrapper::ArchiveWrapper(v14, a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

void sub_1B41A387C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E36940](v1, 0x10E1C408645BDD7);
  _Unwind_Resume(a1);
}

_QWORD *CSCppMMapArchiveCache::_add_archive_wrapper_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  TMMapArchive *v5;
  ArchiveWrapper *v6;

  if ((*((_BYTE *)a2 + 24) & 8) != 0)
    v5 = (TMMapArchive *)*((_QWORD *)a2 + 5);
  else
    v5 = 0;
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked(this, v5);
  return CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill(this, a2, v6);
}

CSCppMMapArchiveCache *CSCppMMapArchiveCache::augment_mmap_archive_to_include_text_section(CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  CSCppSymbolOwner *v5;
  TMMapArchive *v6;

  pthread_mutex_lock(&_cache_lock);
  v6 = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(this, a2, v5);
  if (v6)
    this = (CSCppMMapArchiveCache *)*((_QWORD *)v6 + 2);
  pthread_mutex_unlock(&_cache_lock);
  return this;
}

void sub_1B41A3938(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked(__n128 *this, const UUID *a2, int a3, _QWORD *a4, unint64_t *a5, __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  uint64_t v15;
  CSCppSymbolOwner *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  const UUID *v23;
  uint64_t result;
  CSCppMMapArchiveCache *v25;
  int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  os_unfair_lock_s *v29;
  _BOOL4 v30;
  CSCppSymbolOwner *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  unsigned int v35;

  if (!UUID::is_null((UUID *)this))
  {
    v15 = _mmap_archive_cache;
    if (!_mmap_archive_cache)
    {
      v15 = operator new();
      *(_OWORD *)v15 = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_DWORD *)(v15 + 32) = 1065353216;
      _mmap_archive_cache = v15;
    }
    v17 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((_QWORD *)v15, this);
    v19 = v18;
    if (a7)
      v20 = (CSCppSymbolicator::flags(a7[1]) >> 2) & 1;
    else
      v20 = 0;
    while (1)
    {
      if (v17 == v19)
        return 0;
      v21 = v17[4];
      v22 = *(_DWORD *)(v21 + 24);
      if ((v22 & 8) != 0)
      {
        v23 = *(const UUID **)(v21 + 40);
        if (v22 < 0)
          goto LABEL_12;
      }
      else
      {
        v23 = 0;
        if (v22 < 0)
          goto LABEL_12;
      }
      if (v23 == a2)
      {
        v25 = *(CSCppMMapArchiveCache **)(v21 + 16);
        v26 = *((_DWORD *)v25 + 7);
        if ((v26 & 0x1000) != 0)
        {
          v27 = *((_DWORD *)v25 + 20) == 0;
          if (!a7)
            goto LABEL_21;
        }
        else
        {
          v27 = 1;
          if (!a7)
          {
LABEL_21:
            v28 = 0;
            goto LABEL_25;
          }
        }
        if ((*((_BYTE *)a7 + 110) & 0x40) == 0)
          goto LABEL_21;
        v29 = a7[16];
        if (!v29)
          v29 = a7[15];
        v28 = v29 != 0;
LABEL_25:
        v30 = (v26 & 0x10) == 0 && v28;
        if ((v27 & v20 & 1) == 0 && !v30)
        {
LABEL_30:
          CSCppReferenceCount::retain(v21);
          result = v21;
          goto LABEL_31;
        }
        v35 = v20;
        result = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(this, a2, a3, a4, a5, a6, (__int16 *)a7, v16);
        if (!result)
        {
          if (!v35)
            goto LABEL_30;
          result = (uint64_t)CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(v25, (TMMapArchive *)a7, v31);
          goto LABEL_50;
        }
        v32 = *(_QWORD *)(result + 16);
        if (!v32)
          goto LABEL_30;
        if (v35)
        {
          if (*(_DWORD *)(v32 + 80))
            v33 = 0;
          else
            v33 = v30;
          if (*(_DWORD *)(v32 + 80))
            v34 = result;
          else
            v34 = 0;
          if (!v33)
          {
            result = v34;
LABEL_50:
            if (!result)
              goto LABEL_30;
LABEL_31:
            if (a4)
              *a4 = *(unsigned int *)(*(_QWORD *)(result + 16) + 4);
            if (a5)
              *(_WORD *)a5 = *(_WORD *)(result + 48);
            if (a6)
              *a6 = *(_WORD *)(result + 50);
            return result;
          }
        }
        else if (!v30)
        {
          goto LABEL_30;
        }
        if ((*(_BYTE *)(v32 + 28) & 0x10) == 0)
          goto LABEL_30;
        goto LABEL_31;
      }
LABEL_12:
      v17 = (_QWORD *)*v17;
    }
  }
  return 0;
}

uint64_t CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(__n128 *this, const UUID *a2, int a3, _QWORD *a4, unint64_t *a5, __int16 *a6, __int16 *a7, CSCppSymbolOwner *a8)
{
  BOOL v13;
  uid_t v14;
  _xpc_connection_s **v15;
  CSCppSymbolOwner *v16;
  uint64_t v17;
  char v19;
  CSCppMMapArchiveCache *v20;
  unint64_t v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  ArchiveWrapper *v24;
  unsigned __int16 v25[2];
  unint64_t v26;
  CSCppMMapArchiveCache *v27;
  int8x16_t v28[3];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (a2)
  {
    if (*((_QWORD *)a7 + 18))
      return 0;
    goto LABEL_6;
  }
  if (a7)
  {
LABEL_6:
    v13 = (CSCppSymbolicator::flags(*((os_unfair_lock_s **)a7 + 1)) & 4) == 0;
    goto LABEL_8;
  }
  v13 = 1;
LABEL_8:
  v27 = 0;
  v14 = geteuid();
  MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry((MMapArchiveFileSystem::ArchiveEntry *)v28, this, 0, v14, 0, 7, 0xFFFF);
  v26 = 0;
  *(_DWORD *)v25 = 0;
  v15 = (_xpc_connection_s **)mmap_storage_daemon();
  if (CSCppDaemonConnection::read_mmap_archive(v15, v28, &v27, &v26, &v25[1], v25))
    return 0;
  if ((*((_BYTE *)v27 + 29) & 0x10) != 0
    || (*((_DWORD *)v27 + 20) ? (v19 = 1) : (v19 = v13),
        (v19 & 1) != 0
     || (v17 = (uint64_t)CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(v27, (TMMapArchive *)a7, v16)) == 0))
  {
    v17 = operator new();
    v21 = v26;
    v20 = v27;
    v22 = v25[1];
    v23 = v25[0];
    *(_DWORD *)(v17 + 8) = 1;
    *(_QWORD *)(v17 + 16) = v20;
    *(_DWORD *)(v17 + 24) = 2;
    *(_WORD *)(v17 + 48) = v22;
    *(_WORD *)(v17 + 50) = v23;
    *(_QWORD *)(v17 + 32) = v21;
    *(_QWORD *)(v17 + 40) = 0;
    *(_QWORD *)v17 = &off_1E677ABA0;
    *(_QWORD *)(v17 + 56) = 0;
    CSCppMMapArchiveCache::_add_archive_wrapper_locked(v20, (TMMapArchive *)v17, v24);
  }
  else
  {
    munmap(v27, v26);
  }
  if (a4)
    *a4 = *(unsigned int *)(*(_QWORD *)(v17 + 16) + 4);
  if (a5)
    *(_WORD *)a5 = v25[1];
  if (a6)
    *a6 = v25[0];
  return v17;
}

CSCppDaemonConnection *mmap_storage_daemon(void)
{
  CSCppDaemonConnection *v0;

  v0 = (CSCppDaemonConnection *)_mmap_storage_daemon;
  if (!_mmap_storage_daemon)
  {
    v0 = (CSCppDaemonConnection *)operator new();
    CSCppDaemonConnection::CSCppDaemonConnection(v0);
    _mmap_storage_daemon = (uint64_t)v0;
  }
  return v0;
}

void sub_1B41A3D78(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E36940](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::archive_for_uuid(__n128 *this, const UUID *a2, int a3, _QWORD *a4, unint64_t *a5, __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  CSCppSymbolOwner *v15;
  uint64_t v16;
  CSCppSymbolOwner *v17;
  uint64_t v18;

  pthread_mutex_lock(&_cache_lock);
  v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked(this, a2, a3, a4, a5, a6, a7, v15);
  if (v16
    || (v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked(this, a2, a3, a4, a5, a6, (__int16 *)a7, v17)) != 0)
  {
    v18 = *(_QWORD *)(v16 + 16);
  }
  else
  {
    v18 = 0;
  }
  pthread_mutex_unlock(&_cache_lock);
  return v18;
}

void sub_1B41A3E5C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t *CSCppMMapArchiveCache::_kill_existing_matching_entries_locked(CSCppMMapArchiveCache *this, TMMapArchive *a2)
{
  uint64_t v4;
  uint64_t *result;
  uint64_t *v6;
  uint64_t v7;
  int v8;
  TMMapArchive *v9;

  v4 = _mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 32) = 1065353216;
    _mmap_archive_cache = v4;
  }
  for (result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((_QWORD *)v4, (CSCppMMapArchiveCache *)((char *)this + 52)); result != v6; result = (uint64_t *)*result)
  {
    v7 = result[4];
    v8 = *(_DWORD *)(v7 + 24);
    if ((v8 & 8) != 0)
      v9 = *(TMMapArchive **)(v7 + 40);
    else
      v9 = 0;
    if (v9 == a2)
      *(_DWORD *)(v7 + 24) = v8 | 0x80000000;
  }
  return result;
}

_QWORD *CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  uint64_t v4;
  TMMapArchive *v6;

  v6 = a2;
  v4 = _mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 32) = 1065353216;
    _mmap_archive_cache = v4;
  }
  return std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>((_QWORD *)v4, (CSCppMMapArchiveCache *)((char *)this + 52), &v6);
}

uint64_t CSCppMMapArchiveCache::add_archive_wrapper(CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  ArchiveWrapper *v5;

  pthread_mutex_lock(&_cache_lock);
  CSCppMMapArchiveCache::_add_archive_wrapper_locked(this, a2, v5);
  return pthread_mutex_unlock(&_cache_lock);
}

void sub_1B41A3FCC(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

TMMapArchive *CSCppMMapArchiveCache::_add_archive_to_daemon_locked(TMMapArchive *a1, unint64_t *a2, _DWORD *a3, char *__source)
{
  _xpc_connection_s **v7;
  TMMapArchive *v9;
  int v10;
  char __dst[8];
  int8x16_t v12[3];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (CSCppMMapArchiveCache::_should_store_to_daemon)
  {
    *(_QWORD *)__dst = 0;
    strlcpy(__dst, __source, 8uLL);
    MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry((MMapArchiveFileSystem::ArchiveEntry *)v12, (__n128 *)((char *)a1 + 52), *(uint64_t *)__dst, -1, 0, 7, 0);
    v10 = 0;
    v9 = a1;
    v7 = (_xpc_connection_s **)mmap_storage_daemon();
    if (CSCppDaemonConnection::write_mmap_archive(v7, v12, &v10, &v9, a2))
    {
      if (v10 == 4)
        CSCppMMapArchiveCache::_should_store_to_daemon = 0;
    }
    else if (!v10)
    {
      mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)a1, *((unsigned int *)a1 + 1));
      a1 = v9;
      *a3 = 2;
    }
  }
  return a1;
}

unsigned int *CSCppMMapArchiveCache::add_archive(unsigned int *a1, int a2, TMMapArchive *a3, int a4, char *a5)
{
  uint64_t v10;
  ArchiveWrapper *v11;
  int v12;
  unint64_t v13;
  TMMapArchive *v14;
  unint64_t v16;
  int v17;

  v17 = a2;
  pthread_mutex_lock(&_cache_lock);
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  v16 = a1[1];
  if (a2 == 1 && a4)
    a1 = (unsigned int *)CSCppMMapArchiveCache::_add_archive_to_daemon_locked((TMMapArchive *)a1, &v16, &v17, a5);
  v10 = operator new();
  v12 = v17;
  v13 = v16;
  *(_DWORD *)(v10 + 8) = 1;
  *(_QWORD *)(v10 + 16) = a1;
  *(_DWORD *)(v10 + 24) = v12;
  *(_DWORD *)(v10 + 48) = 7;
  if (a3)
  {
    v12 |= 8u;
    *(_DWORD *)(v10 + 24) = v12;
  }
  if ((v12 & 8) != 0)
    v14 = a3;
  else
    v14 = 0;
  *(_QWORD *)(v10 + 32) = v13;
  *(_QWORD *)(v10 + 40) = v14;
  *(_QWORD *)v10 = &off_1E677ABA0;
  *(_QWORD *)(v10 + 56) = 0;
  CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill((CSCppMMapArchiveCache *)a1, (TMMapArchive *)v10, v11);
  pthread_mutex_unlock(&_cache_lock);
  return a1;
}

void sub_1B41A41F4(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::release_archive(uint64_t this, TMMapArchive *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *i;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  if (this)
  {
    v2 = this;
    v3 = (_QWORD *)(this + 52);
    this = UUID::is_null((UUID *)(this + 52));
    if ((this & 1) == 0)
    {
      pthread_mutex_lock(&_cache_lock);
      v4 = _mmap_archive_cache;
      if (!_mmap_archive_cache)
      {
        v4 = operator new();
        *(_OWORD *)v4 = 0u;
        *(_OWORD *)(v4 + 16) = 0u;
        *(_DWORD *)(v4 + 32) = 1065353216;
        _mmap_archive_cache = v4;
      }
      for (i = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>((_QWORD *)v4, v3); i != v5; i = (uint64_t *)*i)
      {
        v7 = i[4];
        if (*(_QWORD *)(v7 + 16) == v2)
        {
          v8 = atomic_load((unsigned int *)(v7 + 8));
          if (v8 == 1 || (*(_BYTE *)(v7 + 24) & 0x10) != 0 && (v9 = atomic_load((unsigned int *)(v7 + 8)), v9 == 2))
            std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase((_QWORD *)v4, i);
          if ((*(_BYTE *)(v7 + 24) & 0x10) != 0 && (v10 = atomic_load((unsigned int *)(v7 + 8)), v10 == 2))
            v11 = 2;
          else
            v11 = 1;
          CSCppReferenceCount::release((unsigned int *)v7, v11);
          return pthread_mutex_unlock(&_cache_lock);
        }
      }
      return pthread_mutex_unlock(&_cache_lock);
    }
  }
  return this;
}

void sub_1B41A433C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::add_signature_archive<__CFData const*>(uint64_t a1, const void *a2, TMMapArchive *a3, int a4)
{
  uint64_t v8;
  int v9;
  mach_vm_size_t v10;
  TMMapArchive *v11;
  TMMapArchive *v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  mach_vm_address_t address[2];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&_cache_lock);
  v8 = _mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    v8 = operator new();
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_DWORD *)(v8 + 32) = 1065353216;
    _mmap_archive_cache = v8;
  }
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  v16 = 0;
  v9 = 4;
  v15 = 4;
  if (a4)
  {
    v10 = *(unsigned int *)(a1 + 4);
    address[0] = 0;
    address[1] = v10;
    mach_vm_allocate(*MEMORY[0x1E0C83DA0], address, v10, 3);
    v11 = (TMMapArchive *)address[0];
    if (address[0])
    {
      memcpy((void *)address[0], (const void *)a1, *(unsigned int *)(a1 + 4));
      v11 = (TMMapArchive *)address[0];
    }
    v12 = CSCppMMapArchiveCache::_add_archive_to_daemon_locked(v11, (unint64_t *)&v16, &v15, "system");
    v9 = v15;
    if (v15 == 2)
    {
      a2 = 0;
      address[0] = 0;
      a1 = (uint64_t)v12;
    }
    MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr(address);
  }
  v13 = operator new();
  ArchiveWrapper::ArchiveWrapper(v13, a1, a2, v9, v16, (uint64_t)a3, 7, 0);
  *(_OWORD *)address = *(_OWORD *)(a1 + 52);
  v18 = v13;
  std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<std::pair<UUID const,ArchiveWrapper *>>((_QWORD *)v8, (uint64_t)address);
  pthread_mutex_unlock(&_cache_lock);
  return a1;
}

void sub_1B41A4504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr((mach_vm_address_t *)va);
  pthread_mutex_unlock(&_cache_lock);
  _Unwind_Resume(a1);
}

uint64_t CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;

  v4 = *(_QWORD **)(a2 + 32);
  v5 = *(_QWORD **)(a2 + 40);
  if (v4 != v5)
  {
    v6 = *a3;
    while (1)
    {
      v7 = (const char *)(v4[3] ? v4[3] : v4[2]);
      if (!strncmp(v7, "__TEXT", 6uLL) && (unint64_t)(v6 - *v4) < v4[1])
        break;
      v4 += 4;
      if (v4 == v5)
        return 0;
    }
  }
  if (v4 == v5)
    return 0;
  v8 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v8)
    return 0;
  v9 = (const char *)v4[3];
  v10 = (const char *)(a1 + 112);
  v11 = 32 * v8;
  while (1)
  {
    v12 = v9;
    if (!v9)
      v12 = (const char *)v4[2];
    if (!strncmp(v10, v12, 0x10uLL))
      break;
    v10 += 32;
    v11 -= 32;
    if (!v11)
      return 0;
  }
  return *((_QWORD *)v10 - 2) - *v4;
}

TMMapArchive *_create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>(unsigned int *a1, unsigned int *a2)
{
  TMMapArchive *v3;
  TMMapArchive *v4;
  TMMapArchive *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  TMMapArchive *v15[2];

  v3 = (TMMapArchive *)a1;
  v4 = (TMMapArchive *)(*((_QWORD *)a2 + 1) + a1[1]);
  v15[0] = 0;
  v15[1] = v4;
  mach_vm_allocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t *)v15, (mach_vm_size_t)v4, 3);
  v5 = v15[0];
  if (v15[0])
  {
    v6 = *a2;
    v8 = *((_QWORD *)a2 + 1);
    v7 = (const void *)*((_QWORD *)a2 + 2);
    v9 = v6 | (v8 << 32);
    v10 = *((_OWORD *)v3 + 1);
    *(_OWORD *)v15[0] = *(_OWORD *)v3;
    v11 = *((_OWORD *)v3 + 2);
    v12 = *((_OWORD *)v3 + 3);
    v13 = *((_OWORD *)v3 + 5);
    *((_OWORD *)v5 + 4) = *((_OWORD *)v3 + 4);
    *((_OWORD *)v5 + 5) = v13;
    *((_OWORD *)v5 + 2) = v11;
    *((_OWORD *)v5 + 3) = v12;
    *((_OWORD *)v5 + 1) = v10;
    *((_DWORD *)v5 + 1) = (_DWORD)v4;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    *(_QWORD *)((char *)v5 + 76) = v9;
    TMMapArchive::copy_payload_from_archive(v5, v3);
    *((_DWORD *)v5 + 7) |= 0x1000u;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    memcpy((char *)v5+ 32 * *((_DWORD *)v5 + 2)+ 24 * *((_DWORD *)v5 + 3)+ (24 * *((_DWORD *)v5 + 4))+ (unint64_t)(4 * *((_DWORD *)v5 + 4))+ (36 * *((_DWORD *)v5 + 5))+ (20 * *((_DWORD *)v5 + 6))+ *((unsigned int *)v5 + 22)+ 96, v7, v8);
    v3 = v15[0];
    v15[0] = 0;
  }
  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr((mach_vm_address_t *)v15);
  return v3;
}

void sub_1B41A4790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, mach_vm_address_t a9)
{
  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr(&a9);
  _Unwind_Resume(a1);
}

void CSCppTextSectionDataDescriptor::~CSCppTextSectionDataDescriptor(CSCppTextSectionDataDescriptor *this)
{
  void **v2;

  std::mutex::~mutex((std::mutex *)((char *)this + 144));
  v2 = (void **)((char *)this + 88);
  std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  std::__tree<TRange<Pointer64>>::destroy((uint64_t)this + 24, *((_QWORD **)this + 4));
}

char *TMMapArchive::copy_payload_from_archive(TMMapArchive *this, const TMMapArchive *a2)
{
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  size_t v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  size_t v13;
  unsigned int v14;
  size_t v15;
  char *v16;
  char *v17;
  unsigned int v18;
  size_t v19;
  char *v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  size_t v24;
  int32x4_t v25;
  char *v26;
  char *v27;
  unsigned int v28;
  size_t v29;
  unsigned int v30;
  unsigned int v31;
  size_t v32;
  unsigned int v33;
  unsigned int v34;
  size_t v35;
  char *result;
  char *v37;
  BOOL v38;
  size_t v39;
  size_t v40;
  __int128 __src;
  uint64_t v42;

  v4 = (char *)this + 96;
  v5 = (char *)a2 + 96;
  v6 = *((_DWORD *)this + 2);
  v7 = (32 * v6);
  v8 = 32 * *((_DWORD *)a2 + 2);
  if (v8 >= 32 * v6)
    v9 = v7;
  else
    v9 = v8;
  memcpy((char *)this + 96, (char *)a2 + 96, v9);
  v10 = 24 * *((_DWORD *)a2 + 3);
  if (v10 >= 24 * *((_DWORD *)this + 3))
    v11 = (24 * *((_DWORD *)this + 3));
  else
    v11 = v10;
  memcpy(&v4[v7], &v5[32 * *((_DWORD *)a2 + 2)], v11);
  v12 = 24 * *((_DWORD *)a2 + 4);
  if (v12 >= 24 * *((_DWORD *)this + 4))
    v13 = (24 * *((_DWORD *)this + 4));
  else
    v13 = v12;
  memcpy(&v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3)], &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3)], v13);
  v14 = 36 * *((_DWORD *)a2 + 5);
  if (v14 >= 36 * *((_DWORD *)this + 5))
    v15 = (36 * *((_DWORD *)this + 5));
  else
    v15 = v14;
  memcpy(&v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3) + 24 * *((_DWORD *)this + 4)], &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3) + 24 * *((_DWORD *)a2 + 4)], v15);
  v16 = &v4[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)this + 8), (int32x4_t)xmmword_1B41A9130))];
  v17 = &v5[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 8), (int32x4_t)xmmword_1B41A9130))];
  v18 = 20 * *((_DWORD *)a2 + 6);
  if (v18 >= 20 * *((_DWORD *)this + 6))
    v19 = (20 * *((_DWORD *)this + 6));
  else
    v19 = v18;
  memcpy(v16, v17, v19);
  v20 = &v4[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)this + 8), (int32x4_t)xmmword_1B41A9130))
          + (20 * *((_DWORD *)this + 6))];
  v21 = &v5[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 8), (int32x4_t)xmmword_1B41A9130))
          + (20 * *((_DWORD *)a2 + 6))];
  v22 = *((_DWORD *)this + 22);
  v23 = *((_DWORD *)a2 + 22);
  if (v23 >= v22)
    v24 = v22;
  else
    v24 = v23;
  memcpy(v20, v21, v24);
  v25 = *(int32x4_t *)((char *)this + 12);
  v26 = &v4[*((unsigned int *)this + 22)
          + vaddlvq_u32((uint32x4_t)vmulq_s32(v25, (int32x4_t)xmmword_1B41ADF20))
          + (32 * *((_DWORD *)this + 2))];
  v27 = &v5[*((unsigned int *)a2 + 22)
          + vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 12), (int32x4_t)xmmword_1B41ADF20))
          + (32 * *((_DWORD *)a2 + 2))];
  v28 = 4 * HIDWORD(*(_QWORD *)((char *)a2 + 12));
  if (v28 >= 4 * v25.i32[1])
    v29 = (4 * v25.i32[1]);
  else
    v29 = v28;
  memcpy(v26, v27, v29);
  v30 = *((_DWORD *)this + 20);
  v31 = *((_DWORD *)a2 + 20);
  if (v31 >= v30)
    v32 = v30;
  else
    v32 = v31;
  memcpy(&v4[32 * *((_DWORD *)this + 2)+ 24 * *((_DWORD *)this + 3)+ (24 * *((_DWORD *)this + 4))+ (unint64_t)(4 * *((_DWORD *)this + 4))+ (36 * *((_DWORD *)this + 5))+ (20 * *((_DWORD *)this + 6))+ *((unsigned int *)this + 22)], &v5[32 * *((_DWORD *)a2 + 2)+ 24 * *((_DWORD *)a2 + 3)+ (24 * *((_DWORD *)a2 + 4))+ (unint64_t)(4 * *((_DWORD *)a2 + 4))+ (36 * *((_DWORD *)a2 + 5))+ (20 * *((_DWORD *)a2 + 6))+ *((unsigned int *)a2 + 22)], v32);
  v33 = *((_DWORD *)this + 21);
  v34 = *((_DWORD *)a2 + 21);
  if (v34 >= v33)
    v35 = v33;
  else
    v35 = v34;
  memcpy(&v4[32 * *((_DWORD *)this + 2)+ 24 * *((_DWORD *)this + 3)+ (24 * *((_DWORD *)this + 4))+ (unint64_t)(4 * *((_DWORD *)this + 4))+ (36 * *((_DWORD *)this + 5))+ (20 * *((_DWORD *)this + 6))+ *((unsigned int *)this + 22)+ *((unsigned int *)this + 20)], &v5[32 * *((_DWORD *)a2 + 2)+ 24 * *((_DWORD *)a2 + 3)+ (24 * *((_DWORD *)a2 + 4))+ (unint64_t)(4 * *((_DWORD *)a2 + 4))+ (36 * *((_DWORD *)a2 + 5))+ (20 * *((_DWORD *)a2 + 6))+ *((unsigned int *)a2 + 22)+ *((unsigned int *)a2 + 20)], v35);
  result = TMMapArchive::optional_data(a2);
  if (result)
  {
    __src = *(_OWORD *)result;
    v42 = *((_QWORD *)result + 2);
    result = (char *)TMMapArchive::strtab_end(this);
    v37 = (char *)this + *((unsigned int *)this + 1);
    v38 = v37 > result;
    v39 = v37 - result;
    if (v38)
    {
      if (DWORD2(__src) <= 0xC)
        v40 = 12;
      else
        v40 = DWORD2(__src);
      if (v39 >= v40)
        return (char *)memcpy(result, &__src, v40);
    }
  }
  return result;
}

uint64_t ArchiveWrapper::ArchiveWrapper(uint64_t a1, uint64_t a2, CFTypeRef cf, int a4, uint64_t a5, uint64_t a6, __int16 a7, __int16 a8)
{
  uint64_t v9;

  *(_DWORD *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 48) = a7;
  *(_WORD *)(a1 + 50) = a8;
  if (a6)
  {
    a4 |= 8u;
    *(_DWORD *)(a1 + 24) = a4;
  }
  if ((a4 & 8) != 0)
    v9 = a6;
  else
    v9 = 0;
  *(_QWORD *)(a1 + 32) = a5;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)a1 = &off_1E677ABA0;
  *(_QWORD *)(a1 + 56) = cf;
  if (cf && (a4 & 4) != 0)
    CFRetain(cf);
  return a1;
}

void ArchiveWrapper::~ArchiveWrapper(ArchiveWrapper *this)
{
  ArchiveWrapper::~ArchiveWrapper(this);
  JUMPOUT(0x1B5E36940);
}

{
  int v1;

  *(_QWORD *)this = &off_1E677ABA0;
  v1 = *((_DWORD *)this + 6);
  if ((v1 & 1) != 0)
  {
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], *((_QWORD *)this + 2), *(unsigned int *)(*((_QWORD *)this + 2) + 4));
  }
  else if ((v1 & 0x12) != 0)
  {
    munmap(*((void **)this + 2), *((_QWORD *)this + 4));
  }
  else
  {
    CFRelease(*((CFTypeRef *)this + 7));
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>(_QWORD *a1, _OWORD *a2, _QWORD *a3)
{
  _QWORD *v6;
  unint64_t v7;
  _QWORD *inserted;

  v6 = operator new(0x28uLL);
  *((_OWORD *)v6 + 1) = *a2;
  v6[4] = *a3;
  v7 = v6[3] ^ v6[2];
  *v6 = 0;
  v6[1] = v7;
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare((uint64_t)a1, v7, v6 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform(a1, v6, inserted);
  return v6;
}

void sub_1B41A4DD8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<std::pair<UUID const,ArchiveWrapper *>>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *inserted;

  v4 = operator new(0x28uLL);
  *((_OWORD *)v4 + 1) = *(_OWORD *)a2;
  v4[4] = *(_QWORD *)(a2 + 16);
  v5 = v4[3] ^ v4[2];
  *v4 = 0;
  v4[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_1B41A4E5C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

char *utility_basename(const char *a1)
{
  size_t v2;
  size_t v3;
  char *v5;
  char *v6;
  const char *v7;
  uint64_t v8;
  size_t v9;
  int v10;
  const char *v11;
  const char *v12;

  v2 = strlen(a1);
  if (v2 == 1)
  {
    v5 = (char *)malloc_type_malloc(2uLL, 0x780D56C1uLL);
    v6 = v5;
    v7 = a1;
  }
  else
  {
    v3 = v2;
    if (!v2)
      return strdup(a1);
    v8 = 0;
    do
    {
      v9 = v2 + v8;
      v10 = a1[v2 - 1 + v8--];
    }
    while (v9 != 1 && v10 != 47);
    if (v2 + v8)
    {
      if (v8 == -1)
      {
        v6 = (char *)malloc_type_malloc(v2, 0xBAF419B6uLL);
        strlcpy(v6, a1, v3);
        return v6;
      }
      v11 = &a1[v2];
      v5 = (char *)malloc_type_malloc(-v8, 0x505CB428uLL);
      v6 = v5;
      v7 = &v11[v8 + 1];
    }
    else
    {
      if (v10 == 47)
        v12 = a1 + 1;
      else
        v12 = a1;
      v5 = (char *)malloc_type_malloc(&a1[v2] - v12 + 1, 0x22F42F5FuLL);
      v6 = v5;
      v7 = v12;
    }
  }
  strcpy(v5, v7);
  return v6;
}

BOOL do_candidate_sources_satisfy_existing(int a1, int a2)
{
  return (a1 & ~a2 & CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()) == 0;
}

BOOL deny_nfs_mount_lookup(const char *__s1)
{
  uint64_t v2;
  int v3;
  BOOL v4;

  v2 = 0;
  do
  {
    v3 = strncmp(__s1, (&off_1E677ABE0)[v2], (size_t)(&off_1E677ABE0)[v2 + 1]);
    if (!v3)
      break;
    v4 = v2 == 6;
    v2 += 2;
  }
  while (!v4);
  return v3 == 0;
}

void CSCppDaemonConnection::CSCppDaemonConnection(CSCppDaemonConnection *this)
{
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  uint8_t v4[16];

  *(_QWORD *)this = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.coresymbolicationd", global_queue, 2uLL);
  *(_QWORD *)this = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
    xpc_connection_resume(*(xpc_connection_t *)this);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to acquire mach service port, symbol cache unavailable\n", v4, 2u);
    }
    fwrite("Unable to acquire mach service port, symbol cache unavailable\n", 0x3EuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    *(_QWORD *)this = 0;
  }
}

size_t ___ZN21CSCppDaemonConnectionC2Ev_block_invoke(uint64_t a1, uint64_t a2)
{
  size_t result;
  uint8_t buf[4];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = MEMORY[0x1B5E372E8](a2);
  if (result == MEMORY[0x1E0C81310])
  {
    if (a2 == MEMORY[0x1E0C81260])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v5 = "com.apple.coresymbolicationd";
        _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid connection: %s\n", buf, 0xCu);
      }
      return fprintf((FILE *)*MEMORY[0x1E0C80C10], "Invalid connection: %s\n", "com.apple.coresymbolicationd");
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Client side event: Unhandled xpc type\n", buf, 2u);
    }
    return fwrite("Client side event: Unhandled xpc type\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  return result;
}

void CSCppDaemonConnection::send_sync_message(_xpc_connection_s **a1@<X0>, uint64_t a2@<X1>, XPCObject *a3@<X8>)
{
  _xpc_connection_s *v4;
  void *v5;

  v4 = *a1;
  if (*a1)
  {
    v5 = (void *)XPCObject::operator*(a2);
    v4 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x1B5E372E8]() == MEMORY[0x1E0C81310])
    {
      xpc_release(v4);
      v4 = 0;
    }
  }
  XPCObject::XPCObject(a3, v4, 0);
}

uint64_t CSCppDaemonConnection::read_mmap_archive(_xpc_connection_s **this, int8x16_t *a2, TMMapArchive **a3, unint64_t *a4, unsigned __int16 *a5, unsigned __int16 *a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  xpc_object_t value;
  size_t v18;
  size_t v19;
  TMMapArchive *v20;
  size_t v21;
  int v22;
  void *v23;
  unsigned __int16 uint64;
  void *v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  void *v29;
  _BYTE v30[8];
  void *v31;
  void *v32;
  void *region;

  XPCDictionary::XPCDictionary((XPCDictionary *)&v32);
  XPCDictionary::set_uint64(&v32, "cmd", 4uLL);
  MMapArchiveFileSystem::ArchiveEntry::encode(a2, &region);
  v12 = (void *)XPCObject::operator*((uint64_t)&region);
  XPCDictionary::set_object(&v32, "entry", v12);
  XPCObject::~XPCObject((XPCObject *)&region);
  *a3 = 0;
  XPCObject::XPCObject((XPCObject *)v30, &v32);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v30, (XPCObject *)&v31);
  XPCObject::~XPCObject((XPCObject *)v30);
  if (!XPCObject::operator BOOL(&v31)
    || (v13 = XPCObject::operator*((uint64_t)&v31), MEMORY[0x1B5E372E8](v13) != MEMORY[0x1E0C812F8]))
  {
    XPCObject::~XPCObject((XPCObject *)&v31);
    v14 = 1;
    goto LABEL_4;
  }
  XPCObject::XPCObject((XPCObject *)&v29, &v31);
  v16 = (void *)XPCObject::operator*((uint64_t)&v29);
  value = xpc_dictionary_get_value(v16, "shmem");
  if (value)
  {
    region = 0;
    v18 = xpc_shmem_map(value, &region);
    v19 = v18;
    if (v18)
    {
      if (v18 >= 0x60)
      {
        v20 = (TMMapArchive *)region;
        v21 = *((unsigned int *)region + 1);
        if ((_DWORD)v21)
        {
          if (v18 >= v21)
          {
            v22 = *((_DWORD *)region + 12);
            if (v22 == TMMapArchive::calculate_checksum((int32x4_t *)region)
              && TMMapArchive::are_offsets_in_bounds(v20))
            {
              *a4 = v19;
              v23 = (void *)XPCObject::operator*((uint64_t)&v29);
              uint64 = xpc_dictionary_get_uint64(v23, "major_version");
              v25 = (void *)XPCObject::operator*((uint64_t)&v29);
              v26 = xpc_dictionary_get_uint64(v25, "minor_version");
              if (uint64)
                v27 = v26;
              else
                v27 = 0;
              if (a5)
              {
                v28 = uint64;
                if ((uint64 & 0xFFFE) == 0)
                  v28 = 1;
                *a5 = v28;
              }
              if (a6)
                *a6 = v27;
              goto LABEL_23;
            }
          }
        }
      }
      munmap(region, v19);
    }
  }
  v20 = 0;
LABEL_23:
  *a3 = v20;
  XPCObject::~XPCObject(&v29);
  if (v20)
    v14 = 0;
  else
    v14 = 3;
  XPCObject::~XPCObject((XPCObject *)&v31);
LABEL_4:
  XPCObject::~XPCObject(&v32);
  return v14;
}

void sub_1B41A54A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  _Unwind_Resume(a1);
}

uint64_t CSCppDaemonConnection::write_mmap_archive(_xpc_connection_s **this, int8x16_t *a2, int *a3, TMMapArchive **a4, unint64_t *a5)
{
  unsigned int *v10;
  void *v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  int uint64;
  void *v17;
  xpc_object_t value;
  unint64_t v19;
  TMMapArchive *v20;
  int8x16_t v21;
  _BYTE v22[8];
  void *region;
  void *v24;
  void *v25;
  _BYTE v26[8];
  void *v27;
  void *v28;
  _OWORD v29[3];
  __int8 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = (unsigned int *)*a4;
  XPCDictionary::XPCDictionary((XPCDictionary *)&v28);
  XPCDictionary::set_uint64(&v28, "cmd", 5uLL);
  MMapArchiveFileSystem::ArchiveEntry::encode(a2, v29);
  v11 = (void *)XPCObject::operator*((uint64_t)v29);
  XPCDictionary::set_object(&v28, "entry", v11);
  XPCObject::~XPCObject((XPCObject *)v29);
  v12 = xpc_shmem_create(v10, v10[1]);
  XPCDictionary::set_object(&v28, "archive_shmem", v12);
  xpc_release(v12);
  XPCObject::XPCObject((XPCObject *)v26, &v28);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v26, (XPCObject *)&v27);
  XPCObject::~XPCObject((XPCObject *)v26);
  if (XPCObject::operator BOOL(&v27))
  {
    v13 = XPCObject::operator*((uint64_t)&v27);
    if (MEMORY[0x1B5E372E8](v13) == MEMORY[0x1E0C812F8])
    {
      XPCObject::XPCObject((XPCObject *)&v25, &v27);
      uint64 = XPCDictionary::get_uint64(&v25, "write_errno");
      *a3 = uint64;
      if (!uint64)
      {
        XPCDictionary::get_object(&v25, "results", &v24);
        if (XPCObject::operator BOOL(&v24) && XPCObject::xpc_type((XPCObject *)&v24) == MEMORY[0x1E0C812C8])
        {
          v17 = (void *)XPCObject::operator*((uint64_t)&v27);
          value = xpc_dictionary_get_value(v17, "shmem");
          if (value)
          {
            region = 0;
            v19 = xpc_shmem_map(value, &region);
            if (v19)
            {
              v20 = (TMMapArchive *)region;
              if (TMMapArchive::validate((TMMapArchive *)region))
              {
                XPCObject::XPCObject((XPCObject *)v22, &v24);
                MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(v29, v22);
                v21 = (int8x16_t)v29[1];
                *a2 = (int8x16_t)v29[0];
                a2[1] = v21;
                a2[2] = (int8x16_t)v29[2];
                a2[3].i8[0] = v30;
                XPCObject::~XPCObject((XPCObject *)v22);
                *a4 = v20;
                *a5 = v19;
                XPCObject::~XPCObject((XPCObject *)&v24);
                v14 = 0;
                goto LABEL_10;
              }
              munmap(region, v19);
            }
          }
        }
        XPCObject::~XPCObject((XPCObject *)&v24);
      }
      v14 = 3;
LABEL_10:
      XPCObject::~XPCObject(&v25);
      XPCObject::~XPCObject((XPCObject *)&v27);
      goto LABEL_4;
    }
  }
  XPCObject::~XPCObject((XPCObject *)&v27);
  v14 = 1;
LABEL_4:
  XPCObject::~XPCObject(&v28);
  return v14;
}

void sub_1B41A5764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  void *v7;
  va_list va1;
  uint64_t v9;
  uint64_t v10;
  va_list va2;
  va_list va3;

  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, void *);
  v9 = va_arg(va2, _QWORD);
  va_copy(va3, va2);
  v10 = va_arg(va3, _QWORD);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  XPCObject::~XPCObject((XPCObject *)va2);
  XPCObject::~XPCObject((void **)va3);
  _Unwind_Resume(a1);
}

BOOL TMMapArchive::validate(TMMapArchive *this)
{
  int v2;

  if (*((_DWORD *)this + 1)
    && (v2 = *((_DWORD *)this + 12), v2 == TMMapArchive::calculate_checksum((int32x4_t *)this)))
  {
    return TMMapArchive::are_offsets_in_bounds(this);
  }
  else
  {
    return 0;
  }
}

uint64_t *UUID::null_uuid(UUID *this)
{
  return &UUID::null_uuid(void)::fake;
}

BOOL UUID::is_null(UUID *this)
{
  unint64_t v3;
  unint64_t v4;

  if (UUID::null_uuid(void)::fake == *(_QWORD *)this && unk_1EF08DC98 == *(_QWORD *)&(*this)[8])
    return 1;
  if ((*this)[0])
    return 0;
  v3 = 0;
  do
  {
    v4 = v3;
    if (v3 == 15)
      break;
    ++v3;
  }
  while (!(*this)[v4 + 1]);
  return v4 > 0xE;
}

double UUID::get_complement(int8x16_t *this)
{
  double result;

  *(_QWORD *)&result = vmvnq_s8(*this).u64[0];
  return result;
}

uint64_t _StringToUUIDBytes<CFUUIDBytes>(const char *a1, unsigned __int8 *a2)
{
  if (a1
    && a2
    && strlen(a1) >= 0x24
    && make_byte(*a1, a1[1], a2)
    && make_byte(a1[2], a1[3], a2 + 1)
    && make_byte(a1[4], a1[5], a2 + 2)
    && make_byte(a1[6], a1[7], a2 + 3)
    && a1[8] == 45
    && make_byte(a1[9], a1[10], a2 + 4)
    && make_byte(a1[11], a1[12], a2 + 5)
    && a1[13] == 45
    && make_byte(a1[14], a1[15], a2 + 6)
    && make_byte(a1[16], a1[17], a2 + 7)
    && a1[18] == 45
    && make_byte(a1[19], a1[20], a2 + 8)
    && make_byte(a1[21], a1[22], a2 + 9)
    && a1[23] == 45
    && make_byte(a1[24], a1[25], a2 + 10)
    && make_byte(a1[26], a1[27], a2 + 11)
    && make_byte(a1[28], a1[29], a2 + 12)
    && make_byte(a1[30], a1[31], a2 + 13)
    && make_byte(a1[32], a1[33], a2 + 14))
  {
    return make_byte(a1[34], a1[35], a2 + 15);
  }
  else
  {
    return 0;
  }
}

uint64_t _UUIDBytesToString<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  BOOL v3;
  uint64_t v5;

  if (a1)
    v3 = __str == 0;
  else
    v3 = 1;
  v5 = !v3 && __size > 0x24;
  if ((_DWORD)v5 == 1)
    snprintf(__str, __size, "%02hhX%02hhX%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return v5;
}

uint64_t make_byte(int a1, int a2, unsigned __int8 *a3)
{
  unsigned __int8 v3;
  char v4;

  if ((a1 - 48) > 9)
  {
    if ((a1 - 65) > 5 && (a1 - 97) > 5)
      return 0;
    v3 = 16 * a1 - 112;
  }
  else
  {
    v3 = 16 * a1;
  }
  *a3 = v3;
  v4 = a2 - 48;
  if ((a2 - 48) < 0xA)
  {
LABEL_11:
    *a3 = v3 | v4;
    return 1;
  }
  if ((a2 - 65) <= 5)
  {
    v4 = a2 - 55;
    goto LABEL_11;
  }
  if ((a2 - 97) <= 5)
  {
    v4 = a2 - 87;
    goto LABEL_11;
  }
  return 0;
}

__n128 MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(MMapArchiveFileSystem::ArchiveEntry *this, __n128 *a2, uint64_t a3, int a4, int a5, __int16 a6, __int16 a7)
{
  __n128 result;

  result = *a2;
  *(__n128 *)this = *a2;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = a3;
  *((_DWORD *)this + 8) = a4;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 10) = a5;
  *((_WORD *)this + 22) = a6;
  *((_WORD *)this + 23) = a7;
  *((_BYTE *)this + 48) = 0;
  return result;
}

int8x16_t *MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(int8x16_t *a1, void **a2)
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;

  XPCObject::XPCObject((XPCObject *)&v7, a2);
  *a1 = *(int8x16_t *)XPCArray::get_uuid(&v7, 0);
  a1[1].i64[0] = XPCArray::get_uint64(&v7, 1uLL);
  a1[1].i64[1] = XPCArray::get_uint64(&v7, 2uLL);
  a1[2].i32[0] = XPCArray::get_uint64(&v7, 3uLL);
  a1[2].i32[1] = XPCArray::get_uint64(&v7, 4uLL);
  a1[2].i32[2] = XPCArray::get_uint64(&v7, 5uLL);
  if (XPCArray::count(&v7) < 8)
  {
    a1[2].i32[3] = 1;
    a1[3].i8[0] = 0;
  }
  else
  {
    a1[2].i16[6] = XPCArray::get_uint64(&v7, 6uLL);
    a1[2].i16[7] = XPCArray::get_uint64(&v7, 7uLL);
    v3 = XPCArray::count(&v7) == 9 && XPCArray::get_uint64(&v7, 8uLL) != 0;
    a1[3].i8[0] = v3;
    if (a1[2].i16[6] == 3)
    {
      UUID::get_complement(a1);
      a1->i64[0] = v4;
      a1->i64[1] = v5;
    }
  }
  XPCObject::~XPCObject(&v7);
  return a1;
}

void sub_1B41A5CFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  XPCObject::~XPCObject((void **)va);
  _Unwind_Resume(a1);
}

void MMapArchiveFileSystem::ArchiveEntry::encode(int8x16_t *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CFUUIDBytes v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  XPCArray::XPCArray((XPCArray *)&v6);
  if (this[2].i16[6] == 3)
  {
    UUID::get_complement(this);
    *(_QWORD *)&v7.byte0 = v4;
    *(_QWORD *)&v7.byte8 = v5;
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, &v7);
  }
  else
  {
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, (const CFUUIDBytes *)this);
  }
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[2]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[6]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[7]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[3].u8[0]);
  XPCObject::XPCObject(a2, &v6);
  XPCObject::~XPCObject(&v6);
}

void sub_1B41A5E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  XPCObject::~XPCObject(&a9);
  _Unwind_Resume(a1);
}

uint64_t CSMMapArchiveCacheSetShouldStoreToDaemon(uint64_t result)
{
  CSCppMMapArchiveCache::_should_store_to_daemon = result;
  return result;
}

BOOL CSCppDyldSharedCache::has_stripped_locals_data(CSCppDyldSharedCache *this)
{
  return *((_QWORD *)this + 9) && *((_QWORD *)this + 10) != 0;
}

uint64_t CSCppDyldSharedCache::local_symbols_range(CSCppDyldSharedCache *this)
{
  return *((_QWORD *)this + 9);
}

BOOL CSCppDyldSharedCache::uses_unmapped_symbols_file(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu && *((_OWORD *)this + 25) != 0;
}

BOOL CSCppDyldSharedCache::is_split_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu;
}

BOOL CSCppDyldSharedCache::uses_universal_cache_struct_layout(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x1C8u;
}

BOOL CSCppDyldSharedCache::is_universal_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) >= 0x1C9u && *((_QWORD *)this + 13) == 2;
}

uint64_t CSCppDyldSharedCache::for_each_subcache_entry_uuid(_DWORD *a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v6;
  int v7;

  (*(void (**)(uint64_t, _DWORD *))(a2 + 16))(a2, a1 + 22);
  v4 = a1[4];
  if (v4 >= 0x1C9)
    return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>((uint64_t)a1, (uint64_t)a1 + a1[98], a1[99], a2);
  if (v4 < 0x188)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v6 = (uint64_t)a1 + a1[98];
  if (v4 < 0x18C)
  {
LABEL_7:
    v7 = 0;
    return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>((uint64_t)a1, v6, v7, a2);
  }
  v7 = a1[99];
  return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>((uint64_t)a1, v6, v7, a2);
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;

  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0)
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  if (!(_DWORD)v5)
    return 0;
  v5 = v5;
  v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 56;
    --v8;
  }
  while (v8);
  return v5;
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;

  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0)
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  if (!(_DWORD)v5)
    return 0;
  v5 = v5;
  v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 24;
    --v8;
  }
  while (v8);
  return v5;
}

_DWORD *CSCppDyldSharedCache::extract_universal_subcache_paths@<X0>(_DWORD *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  char *v5;
  char *v6;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (this[4] >= 0x18Cu)
  {
    v3 = this[99];
    if ((_DWORD)v3)
    {
      v4 = 0;
      v5 = (char *)this + this[98];
      v6 = v5 + 24;
      do
      {
        if (v5)
        {
          if ((unint64_t)v4 >= a2[2])
          {
            this = (_DWORD *)std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(a2, v6);
            v4 = this;
          }
          else
          {
            this = std::string::basic_string[abi:ne180100]<0>(v4, v6);
            v4 += 3;
            a2[1] = (uint64_t)v4;
          }
          a2[1] = (uint64_t)v4;
        }
        v6 += 56;
        --v3;
      }
      while (v3);
    }
  }
  return this;
}

void sub_1B41A61F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t CSCppDyldSharedCache::for_each_mapped_cache(char *a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;
  char *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, a1);
  v5 = *((_DWORD *)a1 + 4);
  if (v5 < 0x1C9)
  {
    if (v5 >= 0x18C)
    {
      v11 = &a1[*((unsigned int *)a1 + 98)];
      if (v11)
      {
        v12 = *((unsigned int *)a1 + 99);
        if ((_DWORD)v12)
        {
          v13 = (uint64_t *)(v11 + 16);
          do
          {
            v14 = *v13;
            v13 += 3;
            result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v14]);
            --v12;
          }
          while (v12);
        }
      }
    }
  }
  else
  {
    v6 = &a1[*((unsigned int *)a1 + 98)];
    v7 = *((unsigned int *)a1 + 99);
    if (v6)
      v8 = (_DWORD)v7 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (uint64_t *)(v6 + 16);
      do
      {
        v10 = *v9;
        v9 += 7;
        result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v10]);
        --v7;
      }
      while (v7);
    }
  }
  return result;
}

uint64_t CSCppDyldSharedCache::dsc_uuid(CSCppDyldSharedCache *this)
{
  return (uint64_t)this + 88;
}

void CSCppDyldSharedCache::ranges_with_permissions(CSCppDyldSharedCache *this@<X0>, int a2@<W1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t *v5;
  unint64_t v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  _QWORD v20[2];
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  uint64_t *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __n128 (*v29)(_QWORD *, uint64_t);
  void (*v30)(uint64_t);
  void *__p;
  void *v32;
  uint64_t v33;

  v5 = &v26;
  v26 = 0;
  v27 = &v26;
  v28 = 0x4002000000;
  v29 = __Block_byref_object_copy__17;
  v30 = __Block_byref_object_dispose__17;
  v32 = 0;
  v33 = 0;
  __p = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 0x40000000;
  v21 = ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke;
  v22 = &unk_1E677AC68;
  v24 = a2;
  v25 = a3;
  v23 = &v26;
  if (*((_DWORD *)this + 5))
  {
    v7 = 0;
    v8 = (char *)this + *((unsigned int *)this + 4);
    do
    {
      v21((uint64_t)v20, (uint64_t)v8);
      ++v7;
      v8 += 32;
    }
    while (v7 < *((unsigned int *)this + 5));
    v5 = v27;
    v9 = (_QWORD *)v27[5];
  }
  else
  {
    v9 = 0;
  }
  if (v9 == (_QWORD *)v5[6])
  {
    v10 = v5[7];
    if ((unint64_t)v9 >= v10)
    {
      v12 = v10 - (_QWORD)v9;
      v13 = v12 >> 3;
      if ((unint64_t)(v12 >> 3) <= 1)
        v13 = 1;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      v15 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(v5 + 7), v14);
      v17 = &v15[2 * v16];
      v11 = v15 + 2;
      *v15 = 0;
      v15[1] = 0;
      v19 = (char *)v5[5];
      v18 = (char *)v5[6];
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v18 - 1);
          v15 -= 2;
          v18 -= 16;
        }
        while (v18 != v19);
        v18 = (char *)v5[5];
      }
      v5[5] = (uint64_t)v15;
      v5[6] = (uint64_t)v11;
      v5[7] = (uint64_t)v17;
      if (v18)
        operator delete(v18);
    }
    else
    {
      v11 = v9 + 2;
      *v9 = 0;
      v9[1] = 0;
    }
    v5[6] = (uint64_t)v11;
    v5 = v27;
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>(a4, (const void *)v5[5], v5[6], (v5[6] - v5[5]) >> 4);
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
}

void sub_1B41A649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t CSCppDyldSharedCache::enumerate_mapping_infos(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v2 = result;
    if (*(_DWORD *)(result + 20))
    {
      v4 = 0;
      v5 = result + *(unsigned int *)(result + 16);
      do
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
        ++v4;
        v5 += 32;
      }
      while (v4 < *(unsigned int *)(v2 + 20));
    }
  }
  return result;
}

void ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  _QWORD *v4;
  _OWORD *v5;
  unint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;

  v2 = *(_DWORD *)(a2 + 28);
  if ((*(_DWORD *)(a1 + 40) & ~v2) == 0 && (*(_DWORD *)(a1 + 44) & v2) == 0)
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (_OWORD *)v4[6];
    v6 = v4[7];
    if ((unint64_t)v5 >= v6)
    {
      v8 = v4[5];
      v9 = ((uint64_t)v5 - v8) >> 4;
      if ((unint64_t)(v9 + 1) >> 60)
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      v10 = v6 - v8;
      v11 = v10 >> 3;
      if (v10 >> 3 <= (unint64_t)(v9 + 1))
        v11 = v9 + 1;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
        v12 = 0xFFFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>((uint64_t)(v4 + 7), v12);
      v14 = &v13[16 * v9];
      v16 = &v13[16 * v15];
      *(_OWORD *)v14 = *(_OWORD *)a2;
      v7 = v14 + 16;
      v18 = (char *)v4[5];
      v17 = (char *)v4[6];
      if (v17 != v18)
      {
        do
        {
          *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
          v14 -= 16;
          v17 -= 16;
        }
        while (v17 != v18);
        v17 = (char *)v4[5];
      }
      v4[5] = v14;
      v4[6] = v7;
      v4[7] = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *v5 = *(_OWORD *)a2;
      v7 = v5 + 1;
    }
    v4[6] = v7;
  }
}

void CSCppDyldSharedCache::data_segment_ranges(CSCppDyldSharedCache *this@<X0>, _QWORD *a2@<X8>)
{
  CSCppDyldSharedCache::ranges_with_permissions(this, 2, 0, a2);
}

uint64_t CSCppDyldSharedCache::text_segment_range(CSCppDyldSharedCache *this)
{
  uint64_t v1;
  void *__p[3];

  CSCppDyldSharedCache::ranges_with_permissions(this, 4, 0, __p);
  v1 = *(_QWORD *)__p[0];
  __p[1] = __p[0];
  operator delete(__p[0]);
  return v1;
}

BOOL CSCppDyldSharedCache::stripped_locals_data_for (uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  _BOOL8 result;
  unint64_t v6;
  _DWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _DWORD *v12;
  int v13;
  _DWORD *v14;
  int *v15;
  int v16;
  _DWORD *v17;
  int v18;
  unsigned int v19;

  if (!*(_QWORD *)(a1 + 72))
    return 0;
  result = 0;
  if (a3 && *(_QWORD *)(a1 + 80))
  {
    v6 = a3[5];
    v7 = (unsigned int *)((char *)a3 + a3[4]);
    if (*(_DWORD *)(a1 + 16) < 0x190u)
    {
      if ((_DWORD)v6)
      {
        if (*v7 == a2)
        {
          v9 = 0;
          result = 1;
LABEL_20:
          *(_QWORD *)a4 = *a3;
          v17 = &v7[3 * v9];
          v13 = v17[1];
          *(_DWORD *)(a4 + 8) = v13;
          v14 = v17 + 2;
          goto LABEL_21;
        }
        v9 = 0;
        v15 = v7 + 3;
        while (v6 - 1 != v9)
        {
          v16 = *v15;
          v15 += 3;
          ++v9;
          if (v16 == a2)
          {
            result = v9 < v6;
            goto LABEL_20;
          }
        }
      }
    }
    else if ((_DWORD)v6)
    {
      if (*(_QWORD *)v7 == a2)
      {
        v8 = 0;
        result = 1;
LABEL_15:
        *(_QWORD *)a4 = *a3;
        v12 = &v7[4 * v8];
        v13 = v12[2];
        *(_DWORD *)(a4 + 8) = v13;
        v14 = v12 + 3;
LABEL_21:
        v18 = *v14 + v13;
        v19 = a3[3];
        *(_QWORD *)(a4 + 24) = a3[2];
        *(_DWORD *)(a4 + 12) = v18;
        *(_DWORD *)(a4 + 16) = v19;
        return result;
      }
      v8 = 0;
      v10 = (uint64_t *)(v7 + 4);
      while (v6 - 1 != v8)
      {
        v11 = *v10;
        v10 += 2;
        ++v8;
        if (v11 == a2)
        {
          result = v8 < v6;
          goto LABEL_15;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(uint64_t *a1, char *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  uint64_t v11;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>(v7, v9);
  else
    v10 = 0;
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_1B41A68CC(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B41A693C(_Unwind_Exception *exception_object)
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

uint64_t (*mach_exc_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 2411) >= 0xFFFFFFFA)
    return catch_mach_exc_subsystem[5 * (v1 - 2405) + 5];
  else
    return 0;
}

uint64_t _Xmach_exception_raise(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    v3 = -304;
    if (*(_DWORD *)(result + 24) != 2)
      goto LABEL_3;
    v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x44 || v4 > 0x54)
      goto LABEL_3;
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
    {
      v3 = -300;
      goto LABEL_3;
    }
    v5 = *(_DWORD *)(result + 64);
    if (v5 <= 2 && v5 <= (v4 - 68) >> 3 && v4 == 8 * v5 + 68)
    {
      result = catch_mach_exception_raise();
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }
  v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xmach_exception_raise_state(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_17;
  v3 = *(_DWORD *)(result + 4);
  v4 = v3 < 0x30 || v3 > 0x1480;
  if (v4
    || (v5 = *(unsigned int *)(result + 36), v5 > 2)
    || ((v6 = 8 * v5, v5 <= (v3 - 48) >> 3) ? (v7 = v3 >= 8 * (int)v5 + 48) : (v7 = 0),
        !v7
     || (v8 = result + v6, v9 = *(_DWORD *)(v8 + 44), v9 > 0x510)
     || ((v10 = v3 - v6, v9 <= (v10 - 48) >> 2) ? (v11 = v10 == 4 * v9 + 48) : (v11 = 0), !v11)))
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
    v12 = *MEMORY[0x1E0C804E8];
LABEL_18:
    *(_QWORD *)(a2 + 24) = v12;
    return result;
  }
  v13 = v8 - 16;
  *(_DWORD *)(a2 + 40) = 1296;
  v14 = (_DWORD *)(v13 + 56);
  result = catch_mach_exception_raise_state(*(unsigned int *)(result + 12), *(unsigned int *)(result + 32), (_QWORD *)(result + 40), v5, v13 + 56, (const void *)(v13 + 64), v9, (_QWORD *)(a2 + 44), (unsigned int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  v12 = *MEMORY[0x1E0C804E8];
  if ((_DWORD)result)
    goto LABEL_18;
  *(_QWORD *)(a2 + 24) = v12;
  *(_DWORD *)(a2 + 36) = *v14;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_state_identity(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 2)
    goto LABEL_3;
  v5 = *(_DWORD *)(result + 4);
  if (v5 < 0x4C || v5 > 0x149C)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v7 = *(_DWORD *)(result + 64);
  if (v7 > 2)
    goto LABEL_2;
  v3 = -304;
  if (v7 > (v5 - 76) >> 3)
    goto LABEL_3;
  v8 = 8 * v7;
  if (v5 < 8 * v7 + 76)
    goto LABEL_3;
  v9 = result + v8;
  v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
LABEL_4:
    *(_QWORD *)(a2 + 24) = v4;
    return result;
  }
  *(_DWORD *)(a2 + 40) = 1296;
  v12 = (_DWORD *)(v9 + 68);
  result = catch_mach_exception_raise();
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if ((_DWORD)result)
    goto LABEL_4;
  *(_QWORD *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 36) = *v12;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_identity_protected(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    v3 = -304;
    if (*(_DWORD *)(result + 24) != 1)
      goto LABEL_3;
    v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x40 || v4 > 0x50)
      goto LABEL_3;
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      v3 = -300;
      goto LABEL_3;
    }
    v5 = *(_DWORD *)(result + 60);
    if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
    {
      result = catch_mach_exception_raise_identity_protected(*(unsigned int *)(result + 12), *(_QWORD *)(result + 48), *(_DWORD *)(result + 28), *(unsigned int *)(result + 56), (_QWORD *)(result + 64));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }
  v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t mach_exc_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 2411) >= 0xFFFFFFFA
    && (v5 = (void (*)(void))catch_mach_exc_subsystem[5 * (v4 - 2405) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void elide_some_symbol_owners(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void CSCppReferenceCount::retain()
{
  char *v0;

  putchar(10);
  v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value != 0", v0, 27, "attempted object resurrection");
  if (qword_1ED03E100)
    printf("__crashreporter_info__: %s\n", (const char *)qword_1ED03E100);
  abort();
}

void CSCppReferenceCount::release()
{
  char *v0;

  putchar(10);
  v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value >= value", v0, 43, "over release");
  if (qword_1ED03E100)
    printf("__crashreporter_info__: %s\n", (const char *)qword_1ED03E100);
  abort();
}

void new_file_memory_for_uuid_and_arch(void *a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = __cxa_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = (*(uint64_t (**)(void *))(*(_QWORD *)v1 + 16))(v1);
    v3 = 136315394;
    v4 = "CSCppFileMemory *new_file_memory_for_uuid_and_arch(const char *, const UUID &, CSCppArchitecture, uint32_t)";
    v5 = 2080;
    v6 = v2;
    _os_log_impl(&dword_1B40C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Caught exception in %s:\n %s\n", (uint8_t *)&v3, 0x16u);
  }
}

void CSCppSymbolicator::get_symbol_owners_at_time(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

uint64_t create_symbol_owner_data_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(const char *a1)
{
  uint64_t result;

  result = printf("ASSERT(%s) %s %d, %s\n", "traw_symbol_owner_data->retain_count() == 1", a1, 2243, "Wrong refcount on traw_symbol_owner_data");
  if (qword_1ED03E100)
    return printf("__crashreporter_info__: %s\n", (const char *)qword_1ED03E100);
  return result;
}

void extract_dwarf_data_from_header<SizeAndEndianness<Pointer32,LittleEndian>>(void *a1, uint64_t a2, void **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  *a3 = OUTLINED_FUNCTION_4(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_2(&dword_1B40C5000, MEMORY[0x1E0C81028], v3, "%s -- stopping DWARF analysis of %s\n", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3();
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__optional_copy_base<std::vector<unsigned long long>,false>::__optional_copy_base[abi:ne180100](void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    OUTLINED_FUNCTION_0_0(v2, (uint64_t)a1);
}

void ___ZN20TMachOHeaderIteratorI17SizeAndEndiannessI9Pointer6412LittleEndianEE7iterateEv_block_invoke_cold_2(void *a1)
{
  const char *v1;
  size_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  OUTLINED_FUNCTION_2_0(a1);
  v2 = strlen(v1);
  v10 = 1024;
  if (v2 < 0x400)
    v10 = v2;
  if (v10)
  {
    do
    {
      OUTLINED_FUNCTION_0_1(v2, v3, v4, v5, v6, v7, v8, v9, v12);
      OUTLINED_FUNCTION_3_0();
    }
    while (!v11);
  }
  OUTLINED_FUNCTION_1_0();
}

void create_sampling_context_for_task_pid_symbolicator_cold_1(void *a1, uint64_t a2, void ***a3, char **a4)
{
  void *v6;
  FILE *v7;
  const char *v8;
  void **v9;
  void **v10;

  v6 = __cxa_begin_catch(a1);
  v7 = (FILE *)*MEMORY[0x1E0C80C10];
  v8 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v6 + 16))(v6);
  fprintf(v7, "Caught exception in create_sampling_context_for_task:\n%s\n", v8);
  v9 = *a3;
  if (*a3)
  {
    v10 = *a3;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x1B5E36940](v9, 0x20C40960023A9);
    *a3 = 0;
  }
  sampling_context_t::~sampling_context_t(a4);
  MEMORY[0x1B5E36940]();
  __cxa_end_catch();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1E0CBBA48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1E0DE4200](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1E0DE4A10](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1E0DE4A18](this, __p, __opt, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E6774388();
}

void operator delete(void *__p)
{
  off_1E6774390(__p);
}

uint64_t operator delete()
{
  return off_1E6774398();
}

uint64_t operator new[]()
{
  return off_1E67743A0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E67743A8(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E67743B0(__sz, a2);
}

uint64_t operator new()
{
  return off_1E67743B8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1E0C80E98]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C80EA0]();
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1E0C80EF8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1E0C80F00]();
}

uint64_t _dyld_process_info_get_aot_cache()
{
  return MEMORY[0x1E0C80F08]();
}

uint64_t _dyld_process_info_get_cache()
{
  return MEMORY[0x1E0C80F10]();
}

uint64_t _dyld_process_info_get_platform()
{
  return MEMORY[0x1E0C80F18]();
}

uint64_t _dyld_process_info_get_state()
{
  return MEMORY[0x1E0C80F20]();
}

uint64_t _dyld_process_info_notify()
{
  return MEMORY[0x1E0C80F28]();
}

uint64_t _dyld_process_info_notify_main()
{
  return MEMORY[0x1E0C80F30]();
}

uint64_t _dyld_process_info_notify_release()
{
  return MEMORY[0x1E0C80F38]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1E0C80F40]();
}

uint64_t _dyld_shared_cache_real_path()
{
  return MEMORY[0x1E0C80F70]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint64_t aot_address_in_shared_cache()
{
  return MEMORY[0x1E0DE2E80]();
}

uint64_t aot_get_shared_cache_fragment_type()
{
  return MEMORY[0x1E0DE2E88]();
}

uint64_t aot_get_x86_address()
{
  return MEMORY[0x1E0DE2E90]();
}

uint64_t aot_get_x86_address_shared_cache()
{
  return MEMORY[0x1E0DE2E98]();
}

uint64_t aot_init_shared_cache_info()
{
  return MEMORY[0x1E0DE2EA0]();
}

uint64_t aot_symbolication_session_create()
{
  return MEMORY[0x1E0DE2EA8]();
}

uint64_t aot_symbolication_session_destroy()
{
  return MEMORY[0x1E0DE2EB0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return MEMORY[0x1E0C83090]();
}

uint64_t dyld_image_content_for_segment()
{
  return MEMORY[0x1E0C830D0]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1E0C830D8]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1E0C830E0]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x1E0C830E8]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1E0C830F0]();
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1E0C83108]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1E0C83118]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1E0C83120]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1E0C83130]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1E0C83138]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x1E0C83140]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1E0C83148]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1E0C83160]();
}

uint64_t dyld_shared_cache_file_path()
{
  return MEMORY[0x1E0C83168]();
}

uint64_t dyld_shared_cache_find_iterate_text()
{
  return MEMORY[0x1E0C83170]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1E0C83178]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1E0C83188]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1E0C83190]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1E0C83198]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl getwd(char *a1)
{
  return (char *)MEMORY[0x1E0C83838](a1);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x1E0C83848](a1, *(_QWORD *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
  MEMORY[0x1E0C83850](a1);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838B8](*(_QWORD *)&host, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kas_info()
{
  return MEMORY[0x1E0C83A08]();
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x1E0C83C78](str, *(_QWORD *)&error_value);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x1E0C83CD0](a1);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return MEMORY[0x1E0C83CD8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_context(ipc_space_read_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return MEMORY[0x1E0C83D28](*(_QWORD *)&task, *(_QWORD *)&name, context);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return MEMORY[0x1E0C83D80](*(_QWORD *)&task, *(_QWORD *)&name, context);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1E0C83D98](*(_QWORD *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C83DC0](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1E0C83DE8](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

kern_return_t mach_vm_read_overwrite(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1E0C83DF8](*(_QWORD *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1E0C83E08](*(_QWORD *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_vm_remap_new(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C83E18](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1E0C84AF8](*(_QWORD *)&t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t rosetta_get_runtime_location()
{
  return MEMORY[0x1E0DE2EB8]();
}

uint64_t rosetta_is_process_translated()
{
  return MEMORY[0x1E0DE2EC0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1E0C85840](*(_QWORD *)&task, *(_QWORD *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1E0C85858]();
}

kern_return_t task_resume(task_read_t target_task)
{
  return MEMORY[0x1E0C85878](*(_QWORD *)&target_task);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1E0C85880](*(_QWORD *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1E0C85898](*(_QWORD *)&target_task, suspend_token);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1E0C858A0](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1E0C858F0](*(_QWORD *)&target_act, *(_QWORD *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_set_exception_ports(thread_act_t thread, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x1E0C85920](*(_QWORD *)&thread, *(_QWORD *)&exception_mask, *(_QWORD *)&new_port, *(_QWORD *)&behavior, *(_QWORD *)&new_flavor);
}

kern_return_t thread_set_state(thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  return MEMORY[0x1E0C85928](*(_QWORD *)&target_act, *(_QWORD *)&flavor, new_state, *(_QWORD *)&new_stateCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_map_page_query(vm_map_read_t target_map, vm_offset_t offset, integer_t *disposition, integer_t *ref_count)
{
  return MEMORY[0x1E0C85AB8](*(_QWORD *)&target_map, offset, disposition, ref_count);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1E0C85E80](xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

