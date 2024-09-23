void GPUTools::Playback::GL::ContextInfo::~ContextInfo(id *this)
{
  *this = &off_250D4E0B0;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
}

{
  *this = &off_250D4E0B0;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
}

{
  *this = &off_250D4E0B0;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
  JUMPOUT(0x242621814);
}

void sub_23C6341F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11)
    (*(void (**)(uint64_t))(*(_QWORD *)a11 + 8))(a11);
  _Unwind_Resume(exception_object);
}

void sub_23C634DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100]((GPUTools::VMBuffer **)va);
  _Unwind_Resume(a1);
}

void sub_23C634DDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242621814](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

void sub_23C634E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100]((GPUTools::VMBuffer **)va);
  _Unwind_Resume(a1);
}

GPUTools::VMBuffer **std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100](GPUTools::VMBuffer **a1)
{
  GPUTools::VMBuffer *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    GPUTools::VMBuffer::~VMBuffer(v2);
    MEMORY[0x242621814]();
  }
  return a1;
}

uint64_t std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  GPUTools::VMBuffer **v6;
  uint64_t v7;
  GPUTools::VMBuffer *v8;
  GPUTools::VMBuffer **v9;
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
    v3 = *(void ***)(a1 + 8);
    *(_QWORD *)(a1 + 40) = 0;
    v10 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = &v2[v4 >> 9];
    v6 = (GPUTools::VMBuffer **)((char *)*v5 + 8 * (v4 & 0x1FF));
    v7 = *(uint64_t *)((char *)v2 + (((*(_QWORD *)(a1 + 40) + v4) >> 6) & 0x3FFFFFFFFFFFFF8))
       + 8 * ((*(_QWORD *)(a1 + 40) + v4) & 0x1FF);
    if (v6 != (GPUTools::VMBuffer **)v7)
    {
      do
      {
        v8 = *v6;
        *v6 = 0;
        if (v8)
        {
          GPUTools::VMBuffer::~VMBuffer(v8);
          MEMORY[0x242621814]();
        }
        if ((char *)++v6 - (_BYTE *)*v5 == 4096)
        {
          v9 = (GPUTools::VMBuffer **)v5[1];
          ++v5;
          v6 = v9;
        }
      }
      while (v6 != (GPUTools::VMBuffer **)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
    *(_QWORD *)(a1 + 40) = 0;
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
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 256;
    goto LABEL_17;
  }
  if (v11 == 2)
  {
    v12 = 512;
LABEL_17:
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD **v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  _QWORD *v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t prime;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        if (v10.u32[0] < 2uLL)
        {
          while (1)
          {
            v14 = v12[1];
            if (v14 == v8)
            {
              if (v12[2] == v8)
                return v12;
            }
            else if ((v14 & (v9 - 1)) != v4)
            {
              goto LABEL_23;
            }
            v12 = (_QWORD *)*v12;
            if (!v12)
              goto LABEL_23;
          }
        }
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8)
              return v12;
          }
          else
          {
            if (v13 >= v9)
              v13 %= v9;
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
LABEL_23:
  v15 = (_QWORD *)(a1 + 16);
  v12 = operator new(0x20uLL);
  v16 = *a3;
  v17 = *a4;
  *a4 = 0;
  *v12 = 0;
  v12[1] = v8;
  v12[2] = v16;
  v12[3] = v17;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (v9 && (float)(v19 * (float)v9) >= v18)
  {
    v20 = *(_QWORD *)a1;
    v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v21)
    {
LABEL_26:
      *v12 = *v21;
LABEL_61:
      *v21 = v12;
      goto LABEL_62;
    }
  }
  else
  {
    v22 = 1;
    if (v9 >= 3)
      v22 = (v9 & (v9 - 1)) != 0;
    v23 = v22 | (2 * v9);
    v24 = vcvtps_u32_f32(v18 / v19);
    if (v23 <= v24)
      prime = v24;
    else
      prime = v23;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v9 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v9)
      goto LABEL_37;
    if (prime < v9)
    {
      v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v9 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (prime <= v26)
        prime = v26;
      if (prime < v9)
LABEL_37:
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__do_rehash<true>(a1, prime);
    }
    v9 = *(_QWORD *)(a1 + 8);
    v29 = v9 - 1;
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
      {
        v4 = v8 % v9;
        v20 = *(_QWORD *)a1;
        v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v8 % v9));
        if (v21)
          goto LABEL_26;
      }
      else
      {
        v4 = v8;
        v20 = *(_QWORD *)a1;
        v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v8);
        if (v21)
          goto LABEL_26;
      }
    }
    else
    {
      v4 = v29 & v8;
      v20 = *(_QWORD *)a1;
      v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v29 & v8));
      if (v21)
        goto LABEL_26;
    }
  }
  *v12 = *v15;
  *v15 = v12;
  *(_QWORD *)(v20 + 8 * v4) = v15;
  if (*v12)
  {
    v30 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v30 >= v9)
        v30 %= v9;
    }
    else
    {
      v30 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v30);
    goto LABEL_61;
  }
LABEL_62:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_23C635434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = v2[3];
      v2[3] = 0;
      if (v3)
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    }
    operator delete(v2);
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

void std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  void *v26;
  char *v27;
  char *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  BOOL v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  int64_t v45;
  unint64_t v46;
  char *v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  size_t v58;
  unint64_t v59;
  char *v60;
  unint64_t v61;
  int64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 *v69;
  char *v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 *v77;
  _OWORD *v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 *v85;
  _OWORD *v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  void *v90;
  void *v91;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v6 + 1);
    v8 = *v6;
    *(_QWORD *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_78:
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v31 = (v5 - v9) >> 2;
      if (v5 == v9)
        v31 = 1;
      if (!(v31 >> 61))
      {
        v32 = v31 >> 2;
        v33 = 8 * v31;
        v34 = (char *)operator new(8 * v31);
        v35 = &v34[8 * v32];
        v36 = &v34[v33];
        v38 = v5 - v7;
        v37 = v5 == v7;
        v5 = v35;
        if (!v37)
        {
          v5 = &v35[v38 & 0xFFFFFFFFFFFFFFF8];
          v39 = v38 - 8;
          if ((unint64_t)(v38 - 8) >= 0x38)
          {
            v74 = &v34[8 * v32];
            v40 = v74;
            if ((unint64_t)(v74 - v7) >= 0x20)
            {
              v75 = (v39 >> 3) + 1;
              v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
              v40 = &v35[v76];
              v7 += v76;
              v77 = (__int128 *)(v6 + 3);
              v78 = v74 + 16;
              v79 = v75 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v80 = *v77;
                *(v78 - 1) = *(v77 - 1);
                *v78 = v80;
                v77 += 2;
                v78 += 2;
                v79 -= 4;
              }
              while (v79);
              if (v75 == (v75 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_76;
            }
          }
          else
          {
            v40 = &v34[8 * v32];
          }
          do
          {
            v81 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v40 = v81;
            v40 += 8;
          }
          while (v40 != v5);
        }
        goto LABEL_76;
      }
LABEL_87:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    v11 = v10 >> 3;
    if (v11 >= -1)
      v12 = v11 + 1;
    else
      v12 = v11 + 2;
    v13 = v12 >> 1;
    v14 = -v13;
    v15 = &v7[-8 * v13];
    v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(_QWORD *)(a1 + 8) = &v7[8 * v14];
    *(_QWORD *)(a1 + 16) = &v15[v16];
    goto LABEL_78;
  }
  v18 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v19 = *(_QWORD *)(a1 + 8);
  v20 = v18 - v19;
  v21 = (v18 - v19) >> 3;
  v22 = v17 - *(_QWORD *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      v91 = operator new(0x1000uLL);
      std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_back((char **)a1, &v91);
      return;
    }
    v91 = operator new(0x1000uLL);
    std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_front((void **)a1, &v91);
    v41 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v41 + 1);
    v8 = *v41;
    *(_QWORD *)(a1 + 8) = v41 + 1;
    if (v5 != *(char **)(a1 + 24))
      goto LABEL_78;
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v42 = (v5 - v9) >> 2;
      if (v5 == v9)
        v42 = 1;
      if (!(v42 >> 61))
      {
        v43 = v42 >> 2;
        v44 = 8 * v42;
        v34 = (char *)operator new(8 * v42);
        v35 = &v34[8 * v43];
        v36 = &v34[v44];
        v45 = v5 - v7;
        v37 = v5 == v7;
        v5 = v35;
        if (!v37)
        {
          v5 = &v35[v45 & 0xFFFFFFFFFFFFFFF8];
          v46 = v45 - 8;
          if ((unint64_t)(v45 - 8) >= 0x38)
          {
            v82 = &v34[8 * v43];
            v47 = v82;
            if ((unint64_t)(v82 - v7) >= 0x20)
            {
              v83 = (v46 >> 3) + 1;
              v84 = 8 * (v83 & 0x3FFFFFFFFFFFFFFCLL);
              v47 = &v35[v84];
              v7 += v84;
              v85 = (__int128 *)(v41 + 3);
              v86 = v82 + 16;
              v87 = v83 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v88 = *v85;
                *(v86 - 1) = *(v85 - 1);
                *v86 = v88;
                v85 += 2;
                v86 += 2;
                v87 -= 4;
              }
              while (v87);
              if (v83 == (v83 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_76;
            }
          }
          else
          {
            v47 = &v34[8 * v43];
          }
          do
          {
            v89 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v47 = v89;
            v47 += 8;
          }
          while (v47 != v5);
        }
LABEL_76:
        *(_QWORD *)a1 = v34;
        *(_QWORD *)(a1 + 8) = v35;
        *(_QWORD *)(a1 + 16) = v5;
        *(_QWORD *)(a1 + 24) = v36;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_78;
      }
      goto LABEL_87;
    }
    goto LABEL_5;
  }
  v23 = v22 >> 2;
  if (v17 == *(_QWORD *)a1)
    v24 = 1;
  else
    v24 = v23;
  if (v24 >> 61)
    goto LABEL_87;
  v25 = (char *)operator new(8 * v24);
  v26 = operator new(0x1000uLL);
  v27 = &v25[8 * v21];
  v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    v90 = v26;
    if (v20 < 1)
    {
      if (v18 == v19)
        v48 = 1;
      else
        v48 = v20 >> 2;
      if (v48 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v49 = (char *)operator new(8 * v48);
      v27 = &v49[8 * (v48 >> 2)];
      v28 = &v49[8 * v48];
      operator delete(v25);
      v50 = *(_QWORD *)(a1 + 8);
      v18 = *(_QWORD *)(a1 + 16);
      v25 = v49;
      *(_QWORD *)v27 = v90;
      v29 = v27 + 8;
      if (v18 == v50)
        goto LABEL_45;
    }
    else
    {
      v30 = v21 + 2;
      if (v21 >= -1)
        v30 = v21 + 1;
      v27 -= 8 * (v30 >> 1);
      *(_QWORD *)v27 = v26;
      v29 = v27 + 8;
      if (v18 == v19)
        goto LABEL_45;
    }
    do
    {
LABEL_50:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v27)
            v59 = 1;
          else
            v59 = (v28 - v27) >> 2;
          if (v59 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v60 = (char *)operator new(8 * v59);
          v25 = v60;
          v61 = (v59 + 3) >> 2;
          v53 = &v60[8 * v61];
          v62 = v29 - v27;
          v37 = v29 == v27;
          v29 = v53;
          if (!v37)
          {
            v29 = &v53[v62 & 0xFFFFFFFFFFFFFFF8];
            v63 = v62 - 8;
            v64 = &v60[8 * v61];
            v65 = v27;
            if (v63 < 0x38)
              goto LABEL_91;
            v66 = 8 * v61;
            v64 = &v60[8 * v61];
            v65 = v27;
            if ((unint64_t)(v64 - v27) < 0x20)
              goto LABEL_91;
            v67 = (v63 >> 3) + 1;
            v68 = 8 * (v67 & 0x3FFFFFFFFFFFFFFCLL);
            v64 = &v53[v68];
            v65 = &v27[v68];
            v69 = (__int128 *)(v27 + 16);
            v70 = &v60[v66 + 16];
            v71 = v67 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v72 = *v69;
              *((_OWORD *)v70 - 1) = *(v69 - 1);
              *(_OWORD *)v70 = v72;
              v69 += 2;
              v70 += 32;
              v71 -= 4;
            }
            while (v71);
            if (v67 != (v67 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              do
              {
                v73 = *(_QWORD *)v65;
                v65 += 8;
                *(_QWORD *)v64 = v73;
                v64 += 8;
              }
              while (v64 != v29);
            }
          }
          v28 = &v60[8 * v59];
          operator delete(v27);
        }
        else
        {
          v55 = (v28 - v29) >> 3;
          if (v55 >= -1)
            v56 = v55 + 1;
          else
            v56 = v55 + 2;
          v57 = &v29[8 * (v56 >> 1)];
          v53 = &v57[-(v29 - v27)];
          v58 = v29 - v27;
          v37 = v29 == v27;
          v29 = v57;
          if (!v37)
            memmove(v53, v27, v58);
          v25 = v27;
        }
      }
      else
      {
        v53 = v27;
      }
      v54 = *(_QWORD *)(v18 - 8);
      v18 -= 8;
      *((_QWORD *)v53 - 1) = v54;
      v51 = v53 - 8;
      v27 = v51;
    }
    while (v18 != *(_QWORD *)(a1 + 8));
    goto LABEL_46;
  }
  *(_QWORD *)v27 = v26;
  v29 = v27 + 8;
  if (v18 != v19)
    goto LABEL_50;
LABEL_45:
  v51 = v27;
LABEL_46:
  v52 = *(char **)a1;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v51;
  *(_QWORD *)(a1 + 16) = v29;
  *(_QWORD *)(a1 + 24) = v28;
  if (v52)
    operator delete(v52);
}

void sub_23C635D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  void *v9;

  operator delete(__p);
  operator delete(v9);
  _Unwind_Resume(a1);
}

void sub_23C635D1C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_23C635D30(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_23C635D48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_back(char **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_22;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    v11 = &v6[-8 * v9];
    v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      v4 = a1[1];
    }
    v13 = &v4[8 * v10];
    v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  v14 = (v4 - v5) >> 2;
  if (v4 == v5)
    v14 = 1;
  if (v14 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v15 = v14 >> 2;
  v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  v20 = v4 - v6;
  v19 = v4 == v6;
  v4 = v18;
  if (!v19)
  {
    v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        v31 = *(_QWORD *)v6;
        v6 += 8;
        *(_QWORD *)v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    v23 = &v17[8 * v15];
    v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20)
      goto LABEL_19;
    v24 = (v21 >> 3) + 1;
    v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    v22 = &v18[v25];
    v26 = &v6[v25];
    v27 = (__int128 *)(v6 + 16);
    v28 = v23 + 16;
    v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_19;
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    v4 = a1[2];
  }
LABEL_22:
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_front(void **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v7 >= v6)
    {
      v13 = v6 - v4;
      v12 = v13 == 0;
      v14 = v13 >> 2;
      if (v12)
        v14 = 1;
      if (v14 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (v14 + 3) >> 2;
      v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        v20 = v19 - 8;
        v21 = &v17[8 * v15];
        v22 = v4;
        if (v20 < 0x38)
          goto LABEL_27;
        v23 = &v17[8 * v15];
        v21 = v23;
        v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20)
          goto LABEL_27;
        v24 = (v20 >> 3) + 1;
        v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v21 = &v5[v25];
        v22 = &v4[v25];
        v26 = (__int128 *)(v4 + 16);
        v27 = v23 + 16;
        v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            v30 = *(_QWORD *)v22;
            v22 += 8;
            *(_QWORD *)v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      v8 = (v6 - v7) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((_QWORD *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

double std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__move_assign(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  unint64_t v6;
  void **v7;
  GPUTools::VMBuffer **v8;
  uint64_t v9;
  GPUTools::VMBuffer *v10;
  GPUTools::VMBuffer **v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double result;

  v4 = (void **)a1[1];
  v5 = (void **)a1[2];
  if (v5 == v4)
  {
    a1[5] = 0;
    v12 = 0;
  }
  else
  {
    v6 = a1[4];
    v7 = &v4[v6 >> 9];
    v8 = (GPUTools::VMBuffer **)((char *)*v7 + 8 * (v6 & 0x1FF));
    v9 = *(uint64_t *)((char *)v4 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * ((a1[5] + v6) & 0x1FF);
    if (v8 != (GPUTools::VMBuffer **)v9)
    {
      do
      {
        v10 = *v8;
        *v8 = 0;
        if (v10)
        {
          GPUTools::VMBuffer::~VMBuffer(v10);
          MEMORY[0x242621814]();
        }
        if ((char *)++v8 - (_BYTE *)*v7 == 4096)
        {
          v11 = (GPUTools::VMBuffer **)v7[1];
          ++v7;
          v8 = v11;
        }
      }
      while (v8 != (GPUTools::VMBuffer **)v9);
      v4 = (void **)a1[1];
      v5 = (void **)a1[2];
    }
    a1[5] = 0;
    v12 = (char *)v5 - (char *)v4;
    if (v12 >= 0x11)
    {
      do
      {
        operator delete(*v4);
        v13 = a1[2];
        v4 = (void **)(a1[1] + 8);
        a1[1] = v4;
        v12 = v13 - (_QWORD)v4;
      }
      while (v12 > 0x10);
    }
  }
  if (v12 >> 3 == 1)
  {
    v14 = 256;
  }
  else
  {
    if (v12 >> 3 != 2)
      goto LABEL_18;
    v14 = 512;
  }
  a1[4] = v14;
LABEL_18:
  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::shrink_to_fit(a1);
  v16 = a1[1];
  v15 = a1[2];
  if (v15 != v16)
    a1[2] = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit((uint64_t)a1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(_QWORD *)(a2 + 16);
  v17 = *(_QWORD *)(a2 + 32);
  a1[3] = *(_QWORD *)(a2 + 24);
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  a1[4] = v17;
  a1[5] = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void std::deque<std::unique_ptr<GPUTools::VMBuffer>>::shrink_to_fit(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  void **v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[5];
  if (v2)
  {
    v3 = a1[4];
    v4 = (void **)a1[1];
    if (v3 >= 0x200)
    {
      operator delete(*v4);
      v4 = (void **)(a1[1] + 8);
      a1[1] = v4;
      v2 = a1[5];
      v3 = a1[4] - 512;
      a1[4] = v3;
    }
    v5 = (void **)a1[2];
    if (v5 == v4)
      v6 = 0;
    else
      v6 = (((char *)v5 - (char *)v4) << 6) - 1;
    if (v6 - (v2 + v3) >= 0x200)
    {
      operator delete(*(v5 - 1));
      a1[2] -= 8;
    }
    std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit((uint64_t)a1);
  }
  else
  {
    v7 = a1[2];
    if (v7 != a1[1])
    {
      do
      {
        operator delete(*(void **)(v7 - 8));
        v8 = a1[1];
        v7 = a1[2] - 8;
        a1[2] = v7;
      }
      while (v7 != v8);
    }
    a1[4] = 0;
    std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit((uint64_t)a1);
  }
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit(uint64_t a1)
{
  char *v1;
  void *v2;
  char *v3;
  int64_t v4;
  unint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;

  v1 = *(char **)(a1 + 16);
  v2 = *(void **)a1;
  v3 = *(char **)(a1 + 8);
  v4 = v1 - v3;
  v5 = (v1 - v3) >> 3;
  if (v5 < (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)a1) >> 3)
  {
    if (v1 == v3)
    {
      v7 = 0;
      v8 = 8 * v5;
    }
    else
    {
      if (v4 < 0)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v7 = operator new(v1 - v3);
      v8 = (uint64_t)&v7[v5];
      if ((unint64_t)(v4 - 8) < 0x18)
      {
        v9 = v7;
      }
      else
      {
        v9 = v7;
        if ((unint64_t)((char *)v7 - v3) >= 0x20)
        {
          v10 = 0;
          v11 = ((unint64_t)(v4 - 8) >> 3) + 1;
          v12 = v11 & 0x3FFFFFFFFFFFFFFCLL;
          v9 = &v7[v12];
          v13 = &v3[v12 * 8];
          v14 = v11 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v15 = &v7[v10];
            v16 = *(_OWORD *)&v3[v10 * 8 + 16];
            *v15 = *(_OWORD *)&v3[v10 * 8];
            v15[1] = v16;
            v10 += 4;
            v14 -= 4;
          }
          while (v14);
          v3 = v13;
          if (v11 == (v11 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_13;
        }
      }
      do
      {
        v17 = *(_QWORD *)v3;
        v3 += 8;
        *v9++ = v17;
      }
      while (v9 != (_QWORD *)v8);
    }
LABEL_13:
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v8;
    if (v2)
      operator delete(v2);
  }
}

uint64_t GPUTools::GL::WireframeRenderer::IsBadDrawCall(GPUTools::GL::WireframeRenderer *this, int a2, int a3)
{
  GPUTools::GL::WireframeRenderer *v5;
  const void *v6;
  void **v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  if (a3 < 1)
    return 0;
  if (((_DWORD)this - 1) < 3)
  {
    return a2 < 2;
  }
  else if (((_DWORD)this - 4) >= 3)
  {
    if ((_DWORD)this)
    {
      v5 = (GPUTools::GL::WireframeRenderer *)dy_abort();
      return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v5, v6, v7, v8, v9, v10);
    }
    return a2 < 1;
  }
  else
  {
    return a2 < 3;
  }
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(GPUTools::GL::WireframeRenderer *this, _QWORD *a2, void **a3, int a4, int a5)
{
  unsigned int v7;
  _DWORD *v10;
  int v11;
  GPUTools::GL::WireframeRenderer *v13;
  void **v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v7 = a3;
  v10 = malloc_type_malloc(6 * a3 / 3 * a4, 0x57DC6B47uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_11);
      return (2 * v11);
    case 2:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_9);
      return (2 * v11);
    case 1:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global);
      return (2 * v11);
  }
  v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(GPUTools::GL::WireframeRenderer *this, void **a2, unsigned int a3, int a4)
{
  unsigned int v6;
  unsigned int v8;
  uint64_t v9;
  char *v10;
  float *v11;
  int16x4_t v12;
  GPUTools::GL::WireframeRenderer *v14;
  const void *v15;
  void **v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  float32x2x2_t v20;

  v6 = a2;
  v8 = a3 / 3;
  v9 = 6 * (a3 / 3);
  v10 = (char *)malloc_type_malloc((v9 * a4), 0xB6FA883FuLL);
  *(_QWORD *)this = v10;
  switch(a4)
  {
    case 4:
      if (a3 >= 3)
      {
        do
        {
          *(_DWORD *)v10 = v6;
          v20.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v6), (int32x2_t)0x200000001);
          v20.val[1] = v20.val[0];
          v11 = (float *)(v10 + 4);
          vst2_f32(v11, v20);
          *((_DWORD *)v10 + 5) = v6;
          v6 += 3;
          v10 += 24;
          --v8;
        }
        while (v8);
      }
      return v9;
    case 2:
      if (a3 >= 3)
      {
        do
        {
          *(_WORD *)v10 = v6;
          v12 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v6), (int32x2_t)0x200000001), (int16x4_t)0x200000001);
          *(int16x4_t *)(v10 + 2) = vzip1_s16(v12, v12);
          *((_WORD *)v10 + 5) = v6;
          v6 += 3;
          v10 += 12;
          --v8;
        }
        while (v8);
      }
      return v9;
    case 1:
      if (a3 >= 3)
      {
        do
        {
          *v10 = v6;
          v10[1] = v6 + 1;
          v10[2] = v6 + 1;
          v10[3] = v6 + 2;
          v10[4] = v6 + 2;
          v10[5] = v6;
          v10 += 6;
          v6 += 3;
          --v8;
        }
        while (v8);
      }
      return v9;
  }
  v14 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v14, v15, v16, v17, v18, v19);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(GPUTools::GL::WireframeRenderer *this, _QWORD *a2, void **a3, int a4, int a5)
{
  unsigned int v7;
  _DWORD *v10;
  int v11;
  GPUTools::GL::WireframeRenderer *v13;
  void **v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v7 = a3;
  v10 = malloc_type_malloc(((6 * (_DWORD)a3 - 12) * a4), 0xAC94DE10uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_14);
      return (2 * v11);
    case 2:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_13);
      return (2 * v11);
    case 1:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global_12);
      return (2 * v11);
  }
  v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(GPUTools::GL::WireframeRenderer *this, void **a2, int a3, int a4)
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  char *v9;
  char v10;
  float *v11;
  int16x4_t v12;
  int16x4_t v13;
  GPUTools::GL::WireframeRenderer *v15;
  const void *v16;
  void **v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  float32x2x2_t v21;

  v5 = a2;
  v7 = a3 - 2;
  v8 = (6 * (a3 - 2));
  v9 = (char *)malloc_type_malloc((v8 * a4), 0x4371EEFuLL);
  *(_QWORD *)this = v9;
  switch(a4)
  {
    case 4:
      for (; v7; --v7)
      {
        *(_DWORD *)v9 = v5;
        *((_DWORD *)v9 + 5) = v5;
        v21.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v5), (int32x2_t)0x200000001);
        v21.val[1] = v21.val[0];
        v11 = (float *)(v9 + 4);
        vst2_f32(v11, v21);
        v5 = v21.val[0].i32[0];
        v9 += 24;
      }
      return v8;
    case 2:
      for (; v7; --v7)
      {
        *(_WORD *)v9 = v5;
        v12 = (int16x4_t)vadd_s32(vdup_n_s32(v5), (int32x2_t)0x200000001);
        v13 = vuzp1_s16(v12, (int16x4_t)0x200000001);
        *((_WORD *)v9 + 5) = v5;
        v5 = v12.i32[0];
        *(int16x4_t *)(v9 + 2) = vzip1_s16(v13, v13);
        v9 += 12;
      }
      return v8;
    case 1:
      for (; v7; --v7)
      {
        *v9 = v5;
        v10 = v5 + 2;
        v9[5] = v5++;
        v9[1] = v5;
        v9[2] = v5;
        v9[3] = v10;
        v9[4] = v10;
        v9 += 6;
      }
      return v8;
  }
  v15 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v15, v16, v17, v18, v19, v20);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(GPUTools::GL::WireframeRenderer *this, _QWORD *a2, void **a3, int a4, int a5)
{
  unsigned int v7;
  _DWORD *v10;
  int v11;
  GPUTools::GL::WireframeRenderer *v13;
  void **v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v7 = a3;
  v10 = malloc_type_malloc(((6 * (_DWORD)a3 - 12) * a4), 0x2AB1B6D9uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_17);
      return (2 * v11);
    case 2:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_16);
      return (2 * v11);
    case 1:
      v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global_15);
      return (2 * v11);
  }
  v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(GPUTools::GL::WireframeRenderer *this, void **a2, int a3, int a4)
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  char *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  float *v13;
  unsigned int v14;
  int16x4_t v15;
  int16x4_t v16;
  unsigned int v18;
  _BYTE *v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v22;
  float32x2x2_t v23;

  v5 = a2;
  v7 = a3 - 2;
  v8 = (6 * (a3 - 2));
  v9 = (char *)malloc_type_malloc((v8 * a4), 0x4E2DA168uLL);
  *(_QWORD *)this = v9;
  switch(a4)
  {
    case 4:
      if (v7)
      {
        v12 = v5;
        do
        {
          *(_DWORD *)v9 = v5;
          v23.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v12), (int32x2_t)0x200000001);
          v23.val[1] = v23.val[0];
          v13 = (float *)(v9 + 4);
          vst2_f32(v13, v23);
          *((_DWORD *)v9 + 5) = v5;
          v12 = v23.val[0].i32[0];
          v9 += 24;
          --v7;
        }
        while (v7);
      }
      return v8;
    case 2:
      if (v7)
      {
        v14 = v5;
        do
        {
          *(_WORD *)v9 = v5;
          v15 = (int16x4_t)vadd_s32(vdup_n_s32(v14), (int32x2_t)0x200000001);
          v16 = vuzp1_s16(v15, (int16x4_t)0x200000001);
          v14 = v15.i32[0];
          *(int16x4_t *)(v9 + 2) = vzip1_s16(v16, v16);
          *((_WORD *)v9 + 5) = v5;
          v9 += 12;
          --v7;
        }
        while (v7);
      }
      return v8;
    case 1:
      if (v7)
      {
        v10 = v5;
        do
        {
          *v9 = v5;
          v11 = v10++ + 2;
          v9[1] = v10;
          v9[2] = v10;
          v9[3] = v11;
          v9[4] = v11;
          v9[5] = v5;
          v9 += 6;
          --v7;
        }
        while (v7);
      }
      return v8;
  }
  v18 = dy_abort();
  return GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v18, v19, v20, v21, v22);
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(unsigned int a1, _BYTE *a2, unsigned __int8 *a3, int a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  char v15;
  unsigned int v17;
  char v18;
  char v19;
  char v20;

  v17 = 0;
  if (!a1)
    return 0;
  v9 = 0;
  v10 = a1;
  do
  {
    v12 = *a3++;
    v11 = v12;
    v13 = v17;
    *(&v18 + v17) = v12;
    if (a4 && v11 == 255)
    {
      v17 = 0;
    }
    else if (v13 == 2)
    {
      if (v18 != v19 && v18 != v20 && v19 != v20)
      {
        *a2 = v18;
        a2[1] = v19;
        a2[2] = v19;
        v15 = v20;
        a2[3] = v20;
        a2[4] = v15;
        a2[5] = v18;
        a2 += 6;
        v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, char *, unsigned int *))(a5 + 16))(a5, &v18, &v17);
    }
    else
    {
      v17 = v13 + 1;
    }
    --v10;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(unsigned int a1, _WORD *a2, unsigned __int16 *a3, int a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  __int16 v15;
  unsigned int v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;

  v17 = 0;
  if (!a1)
    return 0;
  v9 = 0;
  v10 = 2 * a1;
  do
  {
    v12 = *a3++;
    v11 = v12;
    v13 = v17;
    *(&v18 + v17) = v12;
    if (a4 && v11 == 0xFFFF)
    {
      v17 = 0;
    }
    else if (v13 == 2)
    {
      if (v18 != v19 && v18 != v20 && v19 != v20)
      {
        *a2 = v18;
        a2[1] = v19;
        a2[2] = v19;
        v15 = v20;
        a2[3] = v20;
        a2[4] = v15;
        a2[5] = v18;
        a2 += 6;
        v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, __int16 *, unsigned int *))(a5 + 16))(a5, &v18, &v17);
    }
    else
    {
      v17 = v13 + 1;
    }
    v10 -= 2;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(unsigned int a1, _DWORD *a2, int *a3, int a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  int v15;
  int v16;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  if (!a1)
    return 0;
  v9 = 0;
  v10 = 4 * a1;
  do
  {
    v12 = *a3++;
    v11 = v12;
    v13 = v18;
    *(&v19 + v18) = v12;
    if (a4 && v11 == -1)
    {
      v18 = 0;
    }
    else if (v13 == 2)
    {
      if (v19 != v20 && v19 != v21 && v20 != v21)
      {
        *a2 = v19;
        v15 = v19;
        a2[1] = v20;
        a2[2] = v20;
        v16 = v21;
        a2[3] = v21;
        a2[4] = v16;
        a2[5] = v15;
        a2 += 6;
        v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, int *, unsigned int *))(a5 + 16))(a5, &v19, &v18);
    }
    else
    {
      v18 = v13 + 1;
    }
    v10 -= 4;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

void ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 = *(_WORD *)((char *)a2 + 1);
}

void ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)((char *)a2 + 2);
}

double ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)((char *)a2 + 4);
  *a2 = result;
  return result;
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 1) = *(_BYTE *)(a2 + 2);
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(a2 + 2) = *(_WORD *)(a2 + 4);
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a2 + 8);
}

uint64_t GLCFrontDispatch()
{
  return MEMORY[0x24BDE2808]();
}

uint64_t GLIContextFromEAGLContext()
{
  return MEMORY[0x24BDE2810]();
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

uint64_t _DYOLog()
{
  return MEMORY[0x24BE39158]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t GPUTools::VMBuffer::VMBuffer(GPUTools::VMBuffer *this)
{
  return MEMORY[0x24BE39210](this);
}

void GPUTools::VMBuffer::~VMBuffer(GPUTools::VMBuffer *this)
{
  MEMORY[0x24BE39218](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_250D4DF88(__p);
}

uint64_t operator delete()
{
  return off_250D4DF90();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250D4DF98(__sz);
}

uint64_t operator new()
{
  return off_250D4DFA0();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t dy_abort()
{
  return MEMORY[0x24BE39240]();
}

uint64_t dy_dispatch()
{
  return MEMORY[0x24BE39250]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

