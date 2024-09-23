void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_251075498, MEMORY[0x24BEDAAF0]);
}

void sub_240187D60(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
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
  std::__throw_length_error[abi:ne180100]();
}

void IOThreadServerMappedMemory::~IOThreadServerMappedMemory(IOThreadServerMappedMemory *this)
{
  IOThreadServerMappedMemory::~IOThreadServerMappedMemory(this);
  JUMPOUT(0x24267E4D8);
}

{
  void *v2;
  _QWORD *v3;
  size_t v4;

  *(_QWORD *)this = &off_251076420;
  v3 = (_QWORD *)((char *)this + 8);
  v2 = (void *)*((_QWORD *)this + 1);
  v4 = *((_QWORD *)this + 2);
  if (!v2 || !v4)
    munmap(v2, v4);
  *v3 = 0;
  v3[1] = 0;
}

void ClientSideServerConnection::~ClientSideServerConnection(ClientSideServerConnection *this)
{
  char *v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_2510763B8;
  v1 = (char *)this + 8;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2 == (_QWORD *)v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
}

{
  char *v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_2510763B8;
  v1 = (char *)this + 8;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2 == (_QWORD *)v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24267E4D8);
}

uint64_t ClientSideServerConnection::kill(ClientSideServerConnection *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 5);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_251076938;
  return result;
}

void std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251076938;
}

uint64_t std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideServerConnectionC1EvE3$_0"))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<ClientSideServerConnection::ClientSideServerConnection(void)::$_0,std::allocator<ClientSideServerConnection::ClientSideServerConnection(void)::$_0>,void ()(void)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2)
    return 1;
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2))
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void ServerSideHardware::~ServerSideHardware(ServerSideHardware *this)
{
  char *v2;
  char *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251076230;
  v2 = (char *)this + 112;
  v3 = (char *)*((_QWORD *)this + 17);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 48));
  std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table((uint64_t)this + 8);
}

{
  char *v2;
  char *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251076230;
  v2 = (char *)this + 112;
  v3 = (char *)*((_QWORD *)this + 17);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
    {
LABEL_6:
      std::mutex::~mutex((std::mutex *)((char *)this + 48));
      std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table((uint64_t)this + 8);
      JUMPOUT(0x24267E4D8);
    }
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  goto LABEL_6;
}

void ServerSideHardware::RegisterUseCaseID(ServerSideHardware *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  unint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::mutex *v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  uint64_t **v16;
  uint64_t *i;
  unint64_t v18;
  _QWORD *v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  void *v48;
  _QWORD *v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  _QWORD v53[2];
  char v54;

  LODWORD(v53[0]) = a2;
  v5 = *((_QWORD *)this + 17);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD *))(*(_QWORD *)v5 + 48))(&v51, v5, v53);
  v8 = v51;
  v7 = v52;
  v50 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (std::mutex *)((char *)this + 48);
  std::mutex::lock((std::mutex *)((char *)this + 48));
  v12 = (void **)((char *)this + 8);
  v13 = *(unsigned int *)(v8 + 8);
  if (std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((_QWORD *)this + 1, *(_DWORD *)(v8 + 8)))
  {
    goto LABEL_88;
  }
  v14 = *((_QWORD *)this + 2);
  if (v14)
  {
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      v3 = v13;
      if (v14 <= v13)
        v3 = v13 % v14;
    }
    else
    {
      v3 = ((_DWORD)v14 - 1) & v13;
    }
    v16 = (uint64_t **)*((_QWORD *)*v12 + v3);
    if (v16)
    {
      for (i = *v16; i; i = (uint64_t *)*i)
      {
        v18 = i[1];
        if (v18 == v13)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v13)
            goto LABEL_79;
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v18 >= v14)
              v18 %= v14;
          }
          else
          {
            v18 &= v14 - 1;
          }
          if (v18 != v3)
            break;
        }
      }
    }
  }
  v19 = operator new(0x28uLL);
  v53[0] = v19;
  v53[1] = (char *)this + 24;
  v49 = (_QWORD *)((char *)this + 24);
  *v19 = 0;
  v19[1] = v13;
  *((_DWORD *)v19 + 4) = v13;
  v19[3] = 0;
  v19[4] = 0;
  v54 = 1;
  v20 = (float)(unint64_t)(*((_QWORD *)this + 4) + 1);
  v21 = *((float *)this + 10);
  if (v14 && (float)(v21 * (float)v14) >= v20)
  {
    v13 = v3;
    goto LABEL_69;
  }
  v22 = 1;
  if (v14 >= 3)
    v22 = (v14 & (v14 - 1)) != 0;
  v23 = v22 | (2 * v14);
  v24 = vcvtps_u32_f32(v20 / v21);
  if (v23 <= v24)
    prime = (int8x8_t)v24;
  else
    prime = (int8x8_t)v23;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v14 = *((_QWORD *)this + 2);
  }
  if (*(_QWORD *)&prime <= v14)
  {
    if (*(_QWORD *)&prime >= v14)
      goto LABEL_65;
    v32 = vcvtps_u32_f32((float)*((unint64_t *)this + 4) / *((float *)this + 10));
    if (v14 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
    {
      v32 = std::__next_prime(v32);
    }
    else
    {
      v34 = 1 << -(char)__clz(v32 - 1);
      if (v32 >= 2)
        v32 = v34;
    }
    if (*(_QWORD *)&prime <= v32)
      prime = (int8x8_t)v32;
    if (*(_QWORD *)&prime >= v14)
    {
      v14 = *((_QWORD *)this + 2);
      goto LABEL_65;
    }
    if (!*(_QWORD *)&prime)
    {
      v48 = *v12;
      *v12 = 0;
      if (v48)
        operator delete(v48);
      v14 = 0;
      *((_QWORD *)this + 2) = 0;
      goto LABEL_65;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v26 = operator new(8 * *(_QWORD *)&prime);
  v27 = *v12;
  *v12 = v26;
  if (v27)
    operator delete(v27);
  v28 = 0;
  *((int8x8_t *)this + 2) = prime;
  do
    *((_QWORD *)*v12 + v28++) = 0;
  while (*(_QWORD *)&prime != v28);
  v29 = (_QWORD *)*v49;
  if (*v49)
  {
    v30 = v29[1];
    v31 = (uint8x8_t)vcnt_s8(prime);
    v31.i16[0] = vaddlv_u8(v31);
    if (v31.u32[0] > 1uLL)
    {
      if (v30 >= *(_QWORD *)&prime)
        v30 %= *(_QWORD *)&prime;
    }
    else
    {
      v30 &= *(_QWORD *)&prime - 1;
    }
    *((_QWORD *)*v12 + v30) = v49;
    v35 = (_QWORD *)*v29;
    if (*v29)
    {
      do
      {
        v36 = v35[1];
        if (v31.u32[0] > 1uLL)
        {
          if (v36 >= *(_QWORD *)&prime)
            v36 %= *(_QWORD *)&prime;
        }
        else
        {
          v36 &= *(_QWORD *)&prime - 1;
        }
        if (v36 != v30)
        {
          if (!*((_QWORD *)*v12 + v36))
          {
            *((_QWORD *)*v12 + v36) = v29;
            goto LABEL_61;
          }
          *v29 = *v35;
          *v35 = **((_QWORD **)*v12 + v36);
          **((_QWORD **)*v12 + v36) = v35;
          v35 = v29;
        }
        v36 = v30;
LABEL_61:
        v29 = v35;
        v35 = (_QWORD *)*v35;
        v30 = v36;
      }
      while (v35);
    }
  }
  v14 = (unint64_t)prime;
LABEL_65:
  if ((v14 & (v14 - 1)) != 0)
  {
    if (v14 <= v13)
      v13 %= v14;
  }
  else
  {
    v13 = ((_DWORD)v14 - 1) & v13;
  }
LABEL_69:
  v37 = (_QWORD *)*((_QWORD *)*v12 + v13);
  i = (uint64_t *)v53[0];
  if (v37)
  {
    *(_QWORD *)v53[0] = *v37;
  }
  else
  {
    *(_QWORD *)v53[0] = *v49;
    *v49 = i;
    *((_QWORD *)*v12 + v13) = v49;
    if (!*i)
      goto LABEL_78;
    v38 = *(_QWORD *)(*i + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v38 >= v14)
        v38 %= v14;
    }
    else
    {
      v38 &= v14 - 1;
    }
    v37 = (char *)*v12 + 8 * v38;
  }
  *v37 = i;
LABEL_78:
  v53[0] = 0;
  ++*((_QWORD *)this + 4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100]((uint64_t)v53);
LABEL_79:
  if (v7)
  {
    v39 = (unint64_t *)&v7->__shared_owners_;
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  v41 = (std::__shared_weak_count *)i[4];
  i[3] = v8;
  i[4] = (uint64_t)v7;
  if (v41)
  {
    v42 = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v7 = v50;
LABEL_88:
  std::mutex::unlock(v11);
  if (v7)
  {
    v44 = (unint64_t *)&v7->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v46 = v52;
  if (v51)
    v47 = v51 + 8;
  else
    v47 = 0;
  *a3 = v47;
  a3[1] = v46;
}

void sub_24018869C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::mutex *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  va_list va1;
  uint64_t v9;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100]((uint64_t)va2);
  std::mutex::unlock(v2);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ServerSideHardware::AcquireDeviceForUseCase(uint64_t a1, unsigned int **a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  float v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v15, a1 + 8, **a2);
  v2 = mach_absolute_time();
  v3 = 0;
  v4 = v15;
  while (1)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
    if ((v5 & 1) != 0)
      break;
    usleep(0x3D090u);
    if (++v3 == 10)
      goto LABEL_6;
  }
  if (!v3)
    goto LABEL_14;
LABEL_6:
  v6 = mach_absolute_time();
  v7 = dword_256FD844C;
  if (!dword_256FD844C)
  {
    mach_timebase_info((mach_timebase_info_t)&LogRetrySetDeviceIDState(BOOL,unsigned int,unsigned long long)::sTimebaseInfo);
    v7 = dword_256FD844C;
  }
  v8 = (float)((v6 - v2)
             * LogRetrySetDeviceIDState(BOOL,unsigned int,unsigned long long)::sTimebaseInfo
             / v7);
  v9 = sIsolatedCoreAudioLog();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315906;
      v19 = "ServerSideHardware.cpp";
      v20 = 1024;
      v21 = 36;
      v22 = 1024;
      v23 = v3;
      v24 = 2048;
      v25 = v8 / 1000000000.0;
      v11 = "%25s:%-5d LogRetrySetDeviceIDState - Successfully set device ID after %u tries in %f seconds";
LABEL_13:
      _os_log_impl(&dword_240186000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0x22u);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315906;
    v19 = "ServerSideHardware.cpp";
    v20 = 1024;
    v21 = 42;
    v22 = 1024;
    v23 = v3;
    v24 = 2048;
    v25 = v8 / 1000000000.0;
    v11 = "%25s:%-5d LogRetrySetDeviceIDState - Failed to set device ID for use case ID for %u tries in %f seconds";
    goto LABEL_13;
  }
LABEL_14:
  if (v17)
  {
    v12 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
}

void sub_240188908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  _Unwind_Resume(exception_object);
}

void ServerSideHardware::RegisterCallback(uint64_t a1, uint64_t a2, unsigned int **a3)
{
  AudioObjectID v4;
  uint8_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  OSStatus v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  AudioDeviceIOProcID v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  char v24;
  _QWORD v25[3];
  _QWORD *v26;
  _BYTE v27[24];
  _BYTE *v28;
  _BYTE v29[24];
  _BYTE *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[12];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v22, a1 + 8, **a3);
  if (!v24)
    return;
  v21 = 0;
  v4 = *(_DWORD *)(v22 + 24);
  v5 = *(uint8_t **)(v22 + 16);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v25, a2);
  v6 = (uint64_t)v26;
  if (!v26)
    goto LABEL_5;
  if (v26 != v25)
  {
    v6 = (*(uint64_t (**)(void))(*v26 + 16))();
LABEL_5:
    v28 = (_BYTE *)v6;
    goto LABEL_7;
  }
  v28 = v27;
  (*(void (**)(_QWORD *, _BYTE *))(v25[0] + 24))(v25, v27);
LABEL_7:
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v29, (uint64_t)v27);
  v7 = operator new(0x28uLL);
  *v7 = &off_251076780;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v7 + 1), (uint64_t)v29);
  *(_QWORD *)&v36[4] = v7;
  if (v5 != buf)
  {
    if (*((uint8_t **)v5 + 3) == v5)
    {
      v7 = buf;
      (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)v5 + 24))(v5, buf);
      (*(void (**)(_QWORD))(**((_QWORD **)v5 + 3) + 32))(*((_QWORD *)v5 + 3));
      *((_QWORD *)v5 + 3) = *(_QWORD *)&v36[4];
      *(_QWORD *)&v36[4] = buf;
      v8 = 4;
      goto LABEL_14;
    }
    *(_QWORD *)&v36[4] = *((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v7;
    v7 = *(_QWORD **)&v36[4];
    if (*(uint8_t **)&v36[4] == buf)
    {
      v8 = 4;
      v7 = buf;
      goto LABEL_14;
    }
    if (!*(_QWORD *)&v36[4])
      goto LABEL_15;
  }
  v8 = 5;
LABEL_14:
  (*(void (**)(_QWORD *))(*v7 + 8 * v8))(v7);
LABEL_15:
  v9 = v30;
  if (v30 == v29)
  {
    v10 = 4;
    v9 = v29;
  }
  else
  {
    if (!v30)
      goto LABEL_20;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_20:
  v11 = v28;
  if (v28 == v27)
  {
    v12 = 4;
    v11 = v27;
  }
  else
  {
    if (!v28)
      goto LABEL_25;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_25:
  v13 = AudioDeviceCreateIOProcID(v4, (AudioDeviceIOProc)IsolatedDeviceIOProc, v5, &v21);
  v14 = v26;
  if (v26 == v25)
  {
    v15 = 4;
    v14 = v25;
    goto LABEL_29;
  }
  if (v26)
  {
    v15 = 5;
LABEL_29:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }
  if (v13)
  {
    v29[0] = HIBYTE(v13);
    v29[1] = BYTE2(v13);
    v29[2] = BYTE1(v13);
    v29[3] = v13;
    v29[4] = 0;
    v16 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "ServerSideHardware.cpp";
      v33 = 1024;
      v34 = 100;
      v35 = 2080;
      *(_QWORD *)v36 = v29;
      _os_log_impl(&dword_240186000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::RegisterCallback - Failed to create audio device IO proc - error: %s", buf, 0x1Cu);
    }
  }
  else
  {
    v17 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "ServerSideHardware.cpp";
      v33 = 1024;
      v34 = 104;
      _os_log_impl(&dword_240186000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::RegisterCallback - IOProcID succeeded", buf, 0x12u);
    }
    *(_QWORD *)(v22 + 32) = v21;
  }
  if (v24)
  {
    v18 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
}

void sub_240188CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ServerSideHardware::DeRegisterCallback(uint64_t a1, unsigned int **a2)
{
  uint64_t v2;
  OSStatus v3;
  NSObject *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _BYTE v9[5];
  uint64_t v10;
  std::__shared_weak_count *v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v10, a1 + 8, **a2);
  if (v12)
  {
    v2 = v10;
    v3 = AudioDeviceDestroyIOProcID(*(_DWORD *)(v10 + 24), *(AudioDeviceIOProcID *)(v10 + 32));
    if (v3)
    {
      v9[0] = HIBYTE(v3);
      v9[1] = BYTE2(v3);
      v9[2] = BYTE1(v3);
      v9[3] = v3;
      v9[4] = 0;
      v4 = sIsolatedCoreAudioLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v14 = "ServerSideHardware.cpp";
        v15 = 1024;
        v16 = 119;
        v17 = 2080;
        v18 = v9;
        _os_log_impl(&dword_240186000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::DeRegisterCallback - Failed to destroy audio device IO proc - error: %s", buf, 0x1Cu);
      }
    }
    else
    {
      v5 = sIsolatedCoreAudioLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "ServerSideHardware.cpp";
        v15 = 1024;
        v16 = 123;
        _os_log_impl(&dword_240186000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideHardware::DeRegisterCallback - IOProcID destruction succeeded", buf, 0x12u);
      }
      *(_QWORD *)(v2 + 32) = 0;
    }
    v6 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_240188F38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ServerSideHardware::StartIOProc(uint64_t a1, unsigned int **a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _BYTE v13[5];
  uint64_t v14;
  std::__shared_weak_count *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v14, a1 + 8, **a2);
  if (!v16)
    return 5;
  v2 = AudioDeviceStart(*(_DWORD *)(v14 + 24), *(AudioDeviceIOProcID *)(v14 + 32));
  v3 = v2;
  if ((_DWORD)v2)
  {
    v13[0] = BYTE3(v2);
    v13[1] = BYTE2(v2);
    v13[2] = BYTE1(v2);
    v13[3] = v2;
    v13[4] = 0;
    v4 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "ServerSideHardware.cpp";
      v19 = 1024;
      v20 = 138;
      v21 = 2080;
      v22 = v13;
      v5 = "%25s:%-5d ServerSideHardware::StartIOProc - Failed to start audio device - error: %s";
      v6 = v4;
      v7 = 28;
LABEL_8:
      _os_log_impl(&dword_240186000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "ServerSideHardware.cpp";
      v19 = 1024;
      v20 = 142;
      v5 = "%25s:%-5d ServerSideHardware::StartIOProc - Started audio device";
      v6 = v8;
      v7 = 18;
      goto LABEL_8;
    }
  }
  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v3;
}

void sub_24018910C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ServerSideHardware::StartIOProcAtTime(uint64_t a1, unsigned int **a2, UInt64 a3)
{
  AudioObjectID v4;
  OSStatus (__cdecl *v5)(AudioObjectID, const AudioTimeStamp *, const AudioBufferList *, const AudioTimeStamp *, AudioBufferList *, const AudioTimeStamp *, void *);
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _BYTE v17[5];
  uint64_t v18;
  std::__shared_weak_count *v19;
  char v20;
  AudioTimeStamp ioRequestedStartTime;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v18, a1 + 8, **a2);
  if (!v20)
    return 5;
  v4 = *(_DWORD *)(v18 + 24);
  v5 = *(OSStatus (__cdecl **)(AudioObjectID, const AudioTimeStamp *, const AudioBufferList *, const AudioTimeStamp *, AudioBufferList *, const AudioTimeStamp *, void *))(v18 + 32);
  ioRequestedStartTime.mSampleTime = 0.0;
  memset(&ioRequestedStartTime.mRateScalar, 0, 48);
  ioRequestedStartTime.mHostTime = a3;
  ioRequestedStartTime.mFlags = 2;
  v6 = AudioDeviceStartAtTime(v4, v5, &ioRequestedStartTime, 9u);
  v7 = v6;
  if ((_DWORD)v6)
  {
    v17[0] = BYTE3(v6);
    v17[1] = BYTE2(v6);
    v17[2] = BYTE1(v6);
    v17[3] = v6;
    v17[4] = 0;
    v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(ioRequestedStartTime.mSampleTime) = 136315650;
      *(_QWORD *)((char *)&ioRequestedStartTime.mSampleTime + 4) = "ServerSideHardware.cpp";
      WORD2(ioRequestedStartTime.mHostTime) = 1024;
      *(_DWORD *)((char *)&ioRequestedStartTime.mHostTime + 6) = 160;
      WORD1(ioRequestedStartTime.mRateScalar) = 2080;
      *(_QWORD *)((char *)&ioRequestedStartTime.mRateScalar + 4) = v17;
      v9 = "%25s:%-5d ServerSideHardware::StartIOProcAtTime - Failed to start audio device - error: %s";
      v10 = v8;
      v11 = 28;
LABEL_8:
      _os_log_impl(&dword_240186000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&ioRequestedStartTime, v11);
    }
  }
  else
  {
    v12 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(ioRequestedStartTime.mSampleTime) = 136315394;
      *(_QWORD *)((char *)&ioRequestedStartTime.mSampleTime + 4) = "ServerSideHardware.cpp";
      WORD2(ioRequestedStartTime.mHostTime) = 1024;
      *(_DWORD *)((char *)&ioRequestedStartTime.mHostTime + 6) = 164;
      v9 = "%25s:%-5d ServerSideHardware::StartIOProcAtTime - Started audio device";
      v10 = v12;
      v11 = 18;
      goto LABEL_8;
    }
  }
  v13 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v7;
}

void sub_240189304(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ServerSideHardware::StopIOProc(uint64_t a1, unsigned int **a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _BYTE v13[5];
  uint64_t v14;
  std::__shared_weak_count *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v14, a1 + 8, **a2);
  if (!v16)
    return 5;
  v2 = AudioDeviceStop(*(_DWORD *)(v14 + 24), *(AudioDeviceIOProcID *)(v14 + 32));
  v3 = v2;
  if ((_DWORD)v2)
  {
    v13[0] = BYTE3(v2);
    v13[1] = BYTE2(v2);
    v13[2] = BYTE1(v2);
    v13[3] = v2;
    v13[4] = 0;
    v4 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "ServerSideHardware.cpp";
      v19 = 1024;
      v20 = 182;
      v21 = 2080;
      v22 = v13;
      v5 = "%25s:%-5d ServerSideHardware::StopIOProc - Failed to stop audio device - error: %s";
      v6 = v4;
      v7 = 28;
LABEL_8:
      _os_log_impl(&dword_240186000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    v8 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "ServerSideHardware.cpp";
      v19 = 1024;
      v20 = 186;
      v5 = "%25s:%-5d ServerSideHardware::StopIOProc - Stopped audio device";
      v6 = v8;
      v7 = 18;
      goto LABEL_8;
    }
  }
  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v3;
}

void sub_2401894D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

id ServerSideHardware::GetWorkgroupForUseCase(uint64_t a1, unsigned int **a2)
{
  uint64_t v2;
  uint64_t PropertyData;
  void *v4;
  id v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13;
  UInt32 ioDataSize;
  id outData;
  AudioObjectPropertyAddress inAddress;

  UseCaseSet<HALUseCase>::GetUseCase((uint64_t)&v11, a1 + 8, **a2);
  if (!v13)
    return 0;
  v2 = *(unsigned int *)(v11 + 24);
  outData = 0;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"gwsobolg";
  inAddress.mElement = 0;
  ioDataSize = 8;
  PropertyData = AudioObjectGetPropertyData(v2, &inAddress, 0, 0, &ioDataSize, &outData);
  if ((_DWORD)PropertyData)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", PropertyData);
    NSLog(CFSTR("Could not create get workgroup for deviceID: %d because of Error:%@"), v2, v4);

  }
  v5 = outData;

  v6 = v5;
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

void sub_240189608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);

  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void UseCaseSet<HALUseCase>::GetUseCase(uint64_t a1, uint64_t a2, unsigned int a3)
{
  std::mutex *v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char v11;

  v6 = (std::mutex *)(a2 + 40);
  std::mutex::lock((std::mutex *)(a2 + 40));
  v7 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((_QWORD *)a2, a3);
  if (v7)
  {
    v8 = v7[4];
    *(_QWORD *)a1 = v7[3];
    *(_QWORD *)(a1 + 8) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 16) = v11;
  std::mutex::unlock(v6);
}

uint64_t std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](uint64_t a1)
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

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(_QWORD *a1, unsigned int a2)
{
  unint64_t v2;
  uint8x8_t v3;
  unint64_t v4;
  uint64_t **v5;
  uint64_t *result;
  unint64_t v7;

  v2 = a1[1];
  if (!v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (v2 <= a2)
      v4 = a2 % v2;
  }
  else
  {
    v4 = ((_DWORD)v2 - 1) & a2;
  }
  v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t *)*result)
  {
    v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2)
          v7 %= v2;
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

uint64_t sIsolatedCoreAudioLog()
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(_QWORD *)(v1 + 1104);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(_QWORD *)(v1 + 1120);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(_QWORD *)(v1 + 1200);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(_QWORD *)(v1 + 1264);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(_QWORD *)(v1 + 1280);
}

uint64_t std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 24);
    operator delete(v1);
  }
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::~__hash_table(uint64_t a1)
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
      std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 3));
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

void std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_2510759D0;
  return result;
}

void std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_2510759D0;
}

double std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::operator()@<D0>(int *a1@<X1>, _QWORD *a2@<X8>)
{
  int v3;
  _QWORD *v4;
  _OWORD *v5;
  double result;

  v3 = *a1;
  v4 = operator new(0x40uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_251076B18;
  v4[3] = &off_2510758F8;
  *((_DWORD *)v4 + 8) = v3;
  v5 = (_OWORD *)operator new();
  result = 0.0;
  *v5 = 0u;
  v5[1] = 0u;
  v4[5] = v5;
  *((_DWORD *)v4 + 12) = 0;
  v4[7] = 0;
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_240189A60(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN18ServerSideHardwareC1EvE3$_0"))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()(unsigned int)>::target_type()
{
}

void std::__shared_ptr_emplace<HALUseCase>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<HALUseCase>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<HALUseCase>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void sub_240189B7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_240189C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_240189DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_240189EF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_240189F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_24018A06C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IsolatedCoreAudioClientExclaveKitProxy::~IsolatedCoreAudioClientExclaveKitProxy(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  IsolatedCoreAudioClientExclaveKitProxy::~IsolatedCoreAudioClientExclaveKitProxy(this);
  JUMPOUT(0x24267E4D8);
}

{
  *(_QWORD *)this = &off_2510764A8;
  tb_endpoint_destruct();
  *((_QWORD *)this + 2) = 0;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::doSetup(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  NSObject *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = ___ZN38IsolatedCoreAudioClientExclaveKitProxy7doSetupEv_block_invoke;
  v7[3] = &unk_251076DF8;
  v7[4] = &v8;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  memset(buf, 0, sizeof(buf));
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    v13 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v13)
    {
      v12 = 0;
      tb_message_decode_BOOL();
      ___ZN38IsolatedCoreAudioClientExclaveKitProxy7doSetupEv_block_invoke((uint64_t)v7, v12);
    }
    tb_client_connection_message_destruct();
  }
  v2 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioClientExclaveKitProxy.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 36;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    _os_log_impl(&dword_240186000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isolatedcoreaudioclient_isolatedcoreaudioclientservice_dosetup result: %d", buf, 0x18u);
  }
  v4 = v9;
  *((_BYTE *)this + 24) = *((_BYTE *)v9 + 24);
  v5 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::hasMappedMemory(IsolatedCoreAudioClientExclaveKitProxy *this)
{
  return *((unsigned __int8 *)this + 24);
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::ferryIsolatedAudioDataFromSourceAtSampleTime()
{
  uint64_t result;

  result = tb_client_connection_message_construct();
  if (!(_DWORD)result)
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t IsolatedCoreAudioClientExclaveKitProxy::ferryIsolatedAudioDataToSinkFromSampleTime()
{
  uint64_t result;

  result = tb_client_connection_message_construct();
  if (!(_DWORD)result)
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t ___ZN38IsolatedCoreAudioClientExclaveKitProxy7doSetupEv_block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t IOThread::IOThread(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](a1 + 16, a2);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](a1 + 48, a2 + 32);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](a1 + 80, a2 + 64);
  v4 = *(_QWORD *)(a2 + 120);
  if (v4)
  {
    if (v4 == a2 + 96)
    {
      *(_QWORD *)(a1 + 136) = a1 + 112;
      (*(void (**)(_QWORD))(**(_QWORD **)(a2 + 120) + 24))(*(_QWORD *)(a2 + 120));
      return a1;
    }
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  }
  *(_QWORD *)(a1 + 136) = v4;
  return a1;
}

void sub_24018A5EC(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v6 = (_QWORD *)v1[13];
  if (v6 == v4)
  {
    v7 = v4;
    v8 = 4;
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v8 = 5;
    v7 = (_QWORD *)v1[13];
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_6:
  v9 = (_QWORD *)v1[9];
  if (v9 == v3)
  {
    v10 = 4;
    v9 = v3;
  }
  else
  {
    if (!v9)
      goto LABEL_11;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_11:
  v11 = (_QWORD *)v1[5];
  if (v11 == v2)
  {
    v12 = 4;
    v11 = v2;
  }
  else
  {
    if (!v11)
      goto LABEL_16;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_16:
  _Unwind_Resume(exception_object);
}

uint64_t IOThread::workloop(IOThread *this, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *((_QWORD *)this + 9);
  if (!v3)
    goto LABEL_12;
  v4 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)v3 + 48))(v3, a2);
  if (!v4)
  {
    do
      __ldaxr((unsigned int *)this);
    while (__stlxr(2u, (unsigned int *)this));
    while (1)
    {
      v7 = atomic_load((unsigned __int8 *)this + 4);
      if ((v7 & 1) != 0)
        break;
      v6 = *((_QWORD *)this + 13);
      if (!v6)
        goto LABEL_12;
      v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
      if (v4)
        goto LABEL_3;
    }
    v9 = 0;
    v8 = *((_QWORD *)this + 17);
    if (v8)
    {
      (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 48))(v8, &v9);
      return 0;
    }
LABEL_12:
    std::__throw_bad_function_call[abi:ne180100]();
  }
LABEL_3:
  IOThread::exitWorkloopPrematurely(this, v4);
  return 0;
}

pthread_t IOThread::exitWorkloopPrematurely(IOThread *this, uint64_t a2)
{
  pthread_t result;

  result = pthread_self();
  if (result == *((pthread_t *)this + 1))
  {
    atomic_store(1u, (unsigned __int8 *)this + 4);
    std::function<long long ()(long long)>::operator()(*((_QWORD *)this + 17), a2);
    *((_QWORD *)this + 1) = 0;
    do
      __ldaxr((unsigned int *)this);
    while (__stlxr(0, (unsigned int *)this));
    pthread_exit(0);
  }
  return result;
}

uint64_t std::function<long long ()(long long)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 48))(a1, &v3);
}

void IOThreadServerSynchronizer::~IOThreadServerSynchronizer(IOThreadServerSynchronizer *this)
{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100]<caulk::mach::semaphore,std::default_delete<caulk::mach::semaphore>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  if (*a2)
  {
    v5 = (_QWORD *)operator new();
    v6 = *a2;
    *v5 = &off_251076D48;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v6;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
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

uint64_t std::unique_ptr<caulk::mach::semaphore>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    MEMORY[0x24267E3B8]();
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

void std::__shared_ptr_pointer<caulk::mach::semaphore  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_pointer<caulk::mach::semaphore  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    MEMORY[0x24267E3B8]();
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<caulk::mach::semaphore  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__114default_deleteIN5caulk4mach9semaphoreEEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t IsolatedDeviceIOProc(unsigned int a1, const AudioTimeStamp *a2, const AudioBufferList *a3, const AudioTimeStamp *a4, AudioBufferList *a5, const AudioTimeStamp *a6, _QWORD *a7)
{
  UInt64 mHostTime;
  uint64_t v8;
  UInt64 v10;
  Float64 mSampleTime;

  mHostTime = a4->mHostTime;
  mSampleTime = a4->mSampleTime;
  v10 = mHostTime;
  v8 = a7[3];
  if (!v8)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, Float64 *, UInt64 *))(*(_QWORD *)v8 + 48))(v8, &mSampleTime, &v10);
  return 0;
}

_QWORD *std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_251076780;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_251076780;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::__clone(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_251076780;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_24018AB90(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251076780;
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::operator()(uint64_t a1, double *a2, _QWORD *a3)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v3 = (unint64_t)*a2;
  v6[0] = *a3;
  v6[1] = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 48))(v4, v6);
}

uint64_t std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN25CoreAudioIOProcManagement12CreateIOProcEjP17CoreAudioCallbackPPFijPK14AudioTimeStampPK15AudioBufferListS4_PS5_S4_PvENSt3__18functionIFv18CoreAudioTimestampEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0,std::allocator<CoreAudioIOProcManagement::CreateIOProc(unsigned int,CoreAudioCallback *,int (**)(unsigned int,AudioTimeStamp const*,AudioBufferList const*,AudioTimeStamp const*,AudioBufferList*,AudioTimeStamp const*,void *),std::function<void ()(CoreAudioTimestamp)>)::$_0>,void ()(double,unsigned long long)>::target_type()
{
}

void CreateIsolatedAudioServicePortal()
{
  NSObject *v0;
  unint64_t v1;
  char v2;
  _BYTE *v3;
  _BYTE buf[12];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioServiceLauncher.mm";
    v5 = 1024;
    v6 = 16;
    _os_log_impl(&dword_240186000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received CreateIsolatedAudioServicePortal request", buf, 0x12u);
  }

  v1 = atomic_load(&flag);
  if (v1 != -1)
  {
    *(_QWORD *)buf = &v2;
    v3 = buf;
    std::__call_once(&flag, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioServicePortal::$_0 &&>>);
  }
}

id sIsolatedCoreAudioLog()
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(id *)(v1 + 1136);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(id *)(v1 + 1152);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(id *)(v1 + 1168);
}

{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x256FD8000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x256FD8000;
    if (v3)
    {
      sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
      v1 = 0x256FD8000;
    }
  }
  return *(id *)(v1 + 1184);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CreateIsolatedAudioServicePortal::$_0 &&>>()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  IsolatedCoreAudioXPCService *v6;
  void *v7;
  id *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = MGGetBoolAnswer();
  sIsolatedCoreAudioLog();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      v9 = 136315394;
      v10 = "IsolatedCoreAudioServiceLauncher.mm";
      v11 = 1024;
      v12 = 21;
      _os_log_impl(&dword_240186000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioServicePortal allocating portal", (uint8_t *)&v9, 0x12u);
    }

    v3 = operator new();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.audio.isolated.client.service"));
    v5 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v4;

    v6 = objc_alloc_init(IsolatedCoreAudioXPCService);
    v7 = *(void **)v3;
    *(_QWORD *)v3 = v6;

    objc_msgSend(*(id *)(v3 + 8), "setDelegate:", *(_QWORD *)v3);
    objc_msgSend(*(id *)(v3 + 8), "resume");
    v8 = (id *)CreateIsolatedAudioServicePortal::portal;
    CreateIsolatedAudioServicePortal::portal = v3;
    if (v8)
    {
      objc_msgSend(v8[1], "invalidate");

      MEMORY[0x24267E4D8](v8, 0x80C40803F642BLL);
    }
  }
  else
  {
    if (v2)
    {
      v9 = 136315394;
      v10 = "IsolatedCoreAudioServiceLauncher.mm";
      v11 = 1024;
      v12 = 26;
      _os_log_impl(&dword_240186000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CreateIsolatedAudioServicePortal unsupported", (uint8_t *)&v9, 0x12u);
    }

  }
}

void sub_24018AFF4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *AudioClient::AudioClient(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *global_queue;

  v4 = *a2;
  *a2 = 0;
  v6 = *a3;
  v5 = a3[1];
  a1[4] = v4;
  a1[5] = v6;
  a1[6] = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = dispatch_queue_create("com.apple.audio.isolatedcoreaudio.asyncio", 0);
  a1[7] = v9;
  global_queue = dispatch_get_global_queue(2, 0);
  dispatch_set_target_queue(v9, global_queue);
  return a1;
}

void std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2510766D0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_2510766D0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;

  v2 = *a2;
  v3 = a2[1];
  v4 = *(_QWORD *)(a1 + 8);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(v4 + 40) + 40))(*(_QWORD *)(v4 + 40), *a2, v3);
  v5 = *(NSObject **)(v4 + 56);
  v6 = (_QWORD *)operator new();
  *v6 = v4;
  v6[1] = v2;
  v6[2] = v3;
  dispatch_async_f(v5, v6, (dispatch_function_t)applesauce::dispatch::v1::async<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1}>(dispatch_queue_s *,AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN11AudioClient18setAsyncIOCallbackEPFv18CoreAudioTimestampPvES1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0,std::allocator<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

void applesauce::dispatch::v1::async<AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1}>(dispatch_queue_s *,AudioClient::setAsyncIOCallback(void (*)(CoreAudioTimestamp,void *),void *)::$_0::operator() const(CoreAudioTimestamp)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))*a1)(a1[1], a1[2], *(_QWORD *)(*a1 + 8));
  JUMPOUT(0x24267E4D8);
}

void sub_24018B224(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24267E4D8](v1, 0x1020C4024DAA5DELL);
  _Unwind_Resume(a1);
}

void std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251076678;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251076678;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::operator()(uint64_t a1, unsigned int *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*a2, *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
}

uint64_t std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN11AudioClient16setLapseCallbackEPFviPvES0_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0,std::allocator<AudioClient::setLapseCallback(void (*)(int,void *),void *)::$_0>,void ()(int)>::target_type()
{
}

void IOThreadClientSynchronizer::~IOThreadClientSynchronizer(IOThreadClientSynchronizer *this)
{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::allocate_shared[abi:ne180100]<caulk::mach::semaphore,std::allocator<caulk::mach::semaphore>,unsigned int const&,void>(uint64_t *a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &off_251076D10;
  result = caulk::mach::semaphore::semaphore((caulk::mach::semaphore *)(v2 + 3));
  *a1 = result;
  a1[1] = (uint64_t)v2;
  return result;
}

void sub_24018B3EC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

void std::__shared_ptr_emplace<caulk::mach::semaphore>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076D10;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<caulk::mach::semaphore>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076D10;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

void std::__shared_ptr_emplace<caulk::mach::semaphore>::__on_zero_shared()
{
  JUMPOUT(0x24267E3B8);
}

void StubbedIsolatedCoreAudioClientProxy::~StubbedIsolatedCoreAudioClientProxy(StubbedIsolatedCoreAudioClientProxy *this)
{
  JUMPOUT(0x24267E4D8);
}

uint64_t IsolatedCoreAudioClientProxy::doSetup(IsolatedCoreAudioClientProxy *this)
{
  return 0;
}

uint64_t IsolatedCoreAudioClientProxy::hasMappedMemory(IsolatedCoreAudioClientProxy *this)
{
  return 0;
}

void XPCConnectionToServer::~XPCConnectionToServer(XPCConnectionToServer *this)
{
  *(_QWORD *)this = &off_2510762B0;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

{
  *(_QWORD *)this = &off_2510762B0;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
  JUMPOUT(0x24267E4D8);
}

void XPCConnectionToServer::makeConnectionToServer(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void ***v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[3];
  _QWORD *v26;
  _BYTE buf[24];
  void *v28;
  id v29[3];
  id *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "XPCConnectionToServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 28;
    _os_log_impl(&dword_240186000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::makeXPCConnectionToServer Received CreateIsolatedAudioServicePortal request", buf, 0x12u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) == 0;
  v6 = objc_alloc(MEMORY[0x24BDD1988]);
  if (v5)
    v7 = objc_msgSend(v6, "initWithMachServiceName:options:", CFSTR("com.apple.audio.isolated.client.service"), 4096);
  else
    v7 = objc_msgSend(v6, "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16));
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v7;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256FD9AC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 8), "setRemoteObjectInterface:", v10);

  v11 = *(id *)(*(_QWORD *)(a1 + 16) + 8);
  v12 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEENK3__0cvU13block_pointerS2_Ev_block_invoke;
  v28 = &__block_descriptor_40_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__0_e5_v8__0l;
  v29[0] = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x24267E6DC](buf);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 8), "setInterruptionHandler:", v14);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v25, a2);
  *(_QWORD *)buf = v12;
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEENK3__1cvU13block_pointerS2_Ev_block_invoke;
  v28 = &__block_descriptor_64_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__1_e5_v8__0l;
  v15 = v29;
  v16 = (uint64_t)v26;
  if (!v26)
    goto LABEL_9;
  if (v26 != v25)
  {
    v16 = (*(uint64_t (**)(void))(*v26 + 16))();
LABEL_9:
    v30 = (id *)v16;
    goto LABEL_11;
  }
  v30 = v29;
  (*(void (**)(_QWORD *, id *))(v25[0] + 24))(v25, v29);
LABEL_11:
  v17 = (void *)MEMORY[0x24267E6DC](buf);
  if (v30 == v29)
  {
    v18 = 4;
  }
  else
  {
    if (!v30)
      goto LABEL_16;
    v18 = 5;
    v15 = v30;
  }
  (*((void (**)(id *))*v15 + v18))(v15);
LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 8), "setInvalidationHandler:", v17);

  v19 = v26;
  if (v26 == v25)
  {
    v20 = 4;
    v19 = v25;
    goto LABEL_20;
  }
  if (v26)
  {
    v20 = 5;
LABEL_20:
    (*(void (**)(void))(*v19 + 8 * v20))();
  }
  v22 = *(_QWORD *)(a1 + 16);
  v21 = (void ***)(a1 + 16);
  objc_msgSend(*(id *)(v22 + 8), "resume");
  objc_msgSend((*v21)[1], "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = **v21;
  **v21 = (void *)v23;

}

void sub_24018B858(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  uint64_t *v13;
  uint64_t v14;

  v13 = a12;
  if (a12 == &a9)
  {
    v14 = 4;
    v13 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer(XPCConnectionToServer *this@<X0>, uint64_t a2@<X8>)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t v10[4];
  const char *v11;
  __int16 v12;
  int v13;
  _BYTE buf[24];
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)();
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "XPCConnectionToServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 66;
    _os_log_impl(&dword_240186000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - before call", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4812000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = &unk_24019BCC2;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v5 = (void *)**((_QWORD **)this + 2);
  v6 = *((unsigned int *)this + 2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN21XPCConnectionToServer40acquireSharedIOThreadResourcesFromServerEv_block_invoke;
  v9[3] = &unk_251076E60;
  v9[4] = buf;
  objc_msgSend(v5, "checkInForIsolatedAudioSharedResources:with:", v6, v9);
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 136315394;
    v11 = "XPCConnectionToServer.mm";
    v12 = 1024;
    v13 = 73;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - after call", v10, 0x12u);
  }

  v8 = *(_QWORD *)&buf[8];
  *(_OWORD *)a2 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(v8 + 64);
  _Block_object_dispose(buf, 8);
}

void sub_24018BA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer(id **this)
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "XPCConnectionToServer.mm";
    v6 = 1024;
    v7 = 80;
    _os_log_impl(&dword_240186000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer - before call", (uint8_t *)&v4, 0x12u);
  }

  objc_msgSend(*this[2], "checkOutForIsolatedAudioSharedResources:", *((unsigned int *)this + 2));
  sIsolatedCoreAudioLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "XPCConnectionToServer.mm";
    v6 = 1024;
    v7 = 82;
    _os_log_impl(&dword_240186000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::releaseSharedIOThreadResourcesFromServer - after call", (uint8_t *)&v4, 0x12u);
  }

}

void XPCConnectionToServer::getWorkgroupFromServer(XPCConnectionToServer *this@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x4012000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__28;
  v18 = 0;
  v19 = 0;
  v17 = &unk_24019BCC2;
  v3 = (void *)**((_QWORD **)this + 2);
  v4 = *((unsigned int *)this + 2);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = ___ZN21XPCConnectionToServer22getWorkgroupFromServerEv_block_invoke;
  v11[3] = &unk_251076E88;
  v11[4] = &v12;
  objc_msgSend(v3, "getWorkgroupForIsolatedAudio:with:", v4, v11);
  v5 = v13[7];
  *a2 = v13[6];
  a2[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  _Block_object_dispose(&v12, 8);
  v8 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_24018BCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v7);
  _Unwind_Resume(a1);
}

uint64_t XPCConnectionToServer::tellServerToStartIO(XPCConnectionToServer *this)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v1 = (void *)**((_QWORD **)this + 2);
  v2 = *((unsigned int *)this + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___ZN21XPCConnectionToServer19tellServerToStartIOEv_block_invoke;
  v5[3] = &unk_251076EB0;
  v5[4] = &v6;
  objc_msgSend(v1, "startIsolatedAudioForUseCase:with:", v2, v5);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_24018BDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t XPCConnectionToServer::tellServerToStartIOAtTime(XPCConnectionToServer *this, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v2 = (void *)**((_QWORD **)this + 2);
  v3 = *((unsigned int *)this + 2);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZN21XPCConnectionToServer25tellServerToStartIOAtTimeEy_block_invoke;
  v6[3] = &unk_251076EB0;
  v6[4] = &v7;
  objc_msgSend(v2, "startIsolatedAudioForUseCase:atTime:with:", v3, a2, v6);
  v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_24018BE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t XPCConnectionToServer::tellServerToStopIO(XPCConnectionToServer *this)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v1 = (void *)**((_QWORD **)this + 2);
  v2 = *((unsigned int *)this + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___ZN21XPCConnectionToServer18tellServerToStopIOEv_block_invoke;
  v5[3] = &unk_251076EB0;
  v5[4] = &v6;
  objc_msgSend(v1, "stopIsolatedAudioForUseCase:with:", v2, v5);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_24018BF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21XPCConnectionToServer18tellServerToStopIOEv_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t ___ZN21XPCConnectionToServer25tellServerToStartIOAtTimeEy_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t ___ZN21XPCConnectionToServer19tellServerToStartIOEv_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

__n128 __Block_byref_object_copy__27(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__28(uint64_t a1)
{
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 48);
}

void ___ZN21XPCConnectionToServer22getWorkgroupFromServerEv_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  OS_os_workgroup *v4;
  IOThreadWorkgroup *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;

  v3 = a2;
  objc_msgSend(v3, "getWorkgroup");
  v4 = (OS_os_workgroup *)v12[1];
  caulk::mach::os_object<OS_os_workgroup * {__strong}>::get(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IOThreadWorkgroup *)operator new(0x20uLL);
  v5[1].var0.var0.var0 = 0;
  v5[2].var0.var0.var0 = 0;
  v5->var0.var0.var0 = (os_workgroup_managed *)&off_251076B88;
  IOThreadWorkgroup::IOThreadWorkgroup(v5 + 3, v4);
  *(_QWORD *)&v7 = v6;
  *((_QWORD *)&v7 + 1) = v5;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(std::__shared_weak_count **)(v8 + 56);
  *(_OWORD *)(v8 + 48) = v7;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (v12)
    (*(void (**)())(*v12 + 8))();

}

void sub_24018C050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  void *v14;

  std::__shared_weak_count::~__shared_weak_count(v12);
  operator delete(v14);

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);

  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<IOThreadWorkgroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IOThreadWorkgroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<IOThreadWorkgroup>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void ___ZN21XPCConnectionToServer40acquireSharedIOThreadResourcesFromServerEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "XPCConnectionToServer.mm";
    v13 = 1024;
    v14 = 69;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPCConnectionToServer::acquireSharedIOThreadResourcesFromServer - in reply call", (uint8_t *)&v11, 0x12u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = objc_msgSend(v5, "getSemaphores");
  v8 = objc_msgSend(v6, "getMappedMemory");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v9 + 56) = v8;
  *(_QWORD *)(v9 + 64) = v10;

}

void sub_24018C284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEENK3__0cvU13block_pointerS2_Ev_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t ___ZZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEENK3__1cvU13block_pointerS2_Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

void ___ZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEE_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("Attempt to connect to IsolatedAudio sever via XPC failed."));
  NSLog(CFSTR(" Code:\t\t\t%ld"), objc_msgSend(v5, "code"));
  objc_msgSend(v5, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR(" Description:\t%@"), v2);

  objc_msgSend(v5, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR(" Reason:\t\t%@"), v3);

  objc_msgSend(v5, "localizedRecoverySuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR(" Suggestion:\t%@"), v4);

}

void sub_24018C38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__1(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__1(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

id __copy_helper_block_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__0(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c83_ZTSKZN21XPCConnectionToServer22makeConnectionToServerENSt3__18functionIFvvEEEE3__0(uint64_t a1)
{

}

void std::__shared_ptr_emplace<XPCConnectionObjCWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076CA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<XPCConnectionObjCWrapper>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076CA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

void std::__shared_ptr_emplace<XPCConnectionObjCWrapper>::__on_zero_shared(id *a1)
{

}

void sub_24018C530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24018C68C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24018C84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_24018C9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24018CAA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24018CB70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *RegisterForIsolatedAudio(int a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = (_QWORD *)MGGetBoolAnswer();
  if (!(_DWORD)result)
    return result;
  getClient(a1);
  v7 = getClient::sClient;
  *(_QWORD *)getClient::sClient = a2;
  *(_QWORD *)(v7 + 8) = a3;
  v14[0] = &off_2510766D0;
  v14[1] = v7;
  v15 = v14;
  v8 = *(_QWORD *)(v7 + 32);
  v13 = v12;
  v12[0] = &off_2510766D0;
  v12[1] = v7;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v8 + 16))(v8, v12);
  v9 = v13;
  if (v13 == v12)
  {
    v10 = 4;
    v9 = v12;
    goto LABEL_6;
  }
  if (v13)
  {
    v10 = 5;
LABEL_6:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  result = v15;
  if (v15 == v14)
  {
    v11 = 4;
    result = v14;
  }
  else
  {
    if (!v15)
      return result;
    v11 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v11))();
}

void sub_24018CCA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19 = a13;
  if (a13 == v17)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  v21 = a17;
  if (a17 == &a14)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

_QWORD *SetAudioLapseHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getClient(0);
  v4 = getClient::sClient;
  *(_QWORD *)(getClient::sClient + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = *(_QWORD *)(v4 + 32);
  v8[0] = &off_251076678;
  v8[1] = v4;
  v9 = v8;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, v8);
  result = v9;
  if (v9 == v8)
  {
    v7 = 4;
    result = v8;
  }
  else
  {
    if (!v9)
      return result;
    v7 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
}

void sub_24018CDE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t StartIsolatedAudio()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
  {
    getClient(0);
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(getClient::sClient + 32) + 40))(*(_QWORD *)(getClient::sClient + 32));
  }
  return result;
}

uint64_t StartIsolatedAudioAtTime(uint64_t a1)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
  {
    getClient(0);
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(getClient::sClient + 32) + 48))(*(_QWORD *)(getClient::sClient + 32), a1);
  }
  return result;
}

void StopIsolatedAudio()
{
  uint64_t v0;
  NSObject *v1;
  char v2;
  _QWORD block[5];

  if (MGGetBoolAnswer())
  {
    getClient(0);
    v0 = getClient::sClient;
    (*(void (**)(_QWORD))(**(_QWORD **)(getClient::sClient + 32) + 56))(*(_QWORD *)(getClient::sClient + 32));
    v1 = *(NSObject **)(v0 + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN11AudioClient4stopEvE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_tmp_57;
    block[4] = &v2;
    dispatch_sync(v1, block);
  }
}

uint64_t RequestIsolatedAudio(uint64_t a1, uint64_t a2)
{
  if (MGGetBoolAnswer())
  {
    getClient(0);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(getClient::sClient + 40) + 48))(*(_QWORD *)(getClient::sClient + 40), a1, a2);
  }
  return 0;
}

uint64_t *std::unique_ptr<IOThread>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    if (atomic_load((unsigned int *)v2))
    {
      atomic_store(1u, (unsigned __int8 *)(v2 + 4));
      if (!pthread_join(*(pthread_t *)(v2 + 8), 0))
      {
        *(_QWORD *)(v2 + 8) = 0;
        do
          __ldaxr((unsigned int *)v2);
        while (__stlxr(0, (unsigned int *)v2));
      }
    }
    v4 = *(_QWORD **)(v2 + 136);
    if (v4 == (_QWORD *)(v2 + 112))
    {
      v5 = 4;
      v4 = (_QWORD *)(v2 + 112);
    }
    else
    {
      if (!v4)
        goto LABEL_12;
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_12:
    v6 = *(_QWORD **)(v2 + 104);
    if (v6 == (_QWORD *)(v2 + 80))
    {
      v7 = 4;
      v6 = (_QWORD *)(v2 + 80);
    }
    else
    {
      if (!v6)
        goto LABEL_17;
      v7 = 5;
    }
    (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_17:
    v8 = *(_QWORD **)(v2 + 72);
    if (v8 == (_QWORD *)(v2 + 48))
    {
      v9 = 4;
      v8 = (_QWORD *)(v2 + 48);
    }
    else
    {
      if (!v8)
        goto LABEL_22;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_22:
    v10 = *(_QWORD **)(v2 + 40);
    if (v10 == (_QWORD *)(v2 + 16))
    {
      v11 = 4;
      v10 = (_QWORD *)(v2 + 16);
    }
    else
    {
      if (!v10)
        goto LABEL_27;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_27:
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

void std::default_delete<IOThreadWork>::operator()[abi:ne180100](_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v2 = a1 + 12;
  v3 = (_QWORD *)a1[15];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (_QWORD *)a1[11];
  if (v5 == a1 + 8)
  {
    v6 = 4;
    v5 = a1 + 8;
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  v7 = (_QWORD *)a1[7];
  if (v7 == a1 + 4)
  {
    v8 = 4;
    v7 = a1 + 4;
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_16:
  v9 = (_QWORD *)a1[3];
  if (v9 == a1)
  {
    v10 = 4;
    v9 = a1;
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_21:
  JUMPOUT(0x24267E4D8);
}

_QWORD **std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100](_QWORD **result, _QWORD *a2)
{
  _QWORD *v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    *v2 = &off_251076290;
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 3));
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 1));
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

uint64_t ___ZN12IOThreadWorkC2Ev_block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::~__func(uint64_t a1)
{

  JUMPOUT(0x24267E4D8);
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::__clone()
{
  return 0;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_251076620;
  result = MEMORY[0x24267E6DC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::destroy(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x8000000240198875))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<long long({block_pointer} {__strong})(long long),std::allocator<long long({block_pointer} {__strong})(long long)>,long long ()(long long)>::target_type()
{
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::~__func(uint64_t a1)
{

  JUMPOUT(0x24267E4D8);
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::__clone()
{
  return 0;
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_2510765C8;
  result = MEMORY[0x24267E6DC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::destroy(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x80000002401987ECLL))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<long long({block_pointer} {__strong})(void),std::allocator<long long({block_pointer} {__strong})(void)>,long long ()(void)>::target_type()
{
}

uint64_t ___ZN12IOThreadWorkC2Ev_block_invoke()
{
  return 0;
}

_QWORD *ClientSideAudioSwitchboardIOThread::ClientSideAudioSwitchboardIOThread(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  *(_QWORD *)(std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)a1, a2)
            + 32) = 0;
  v3 = operator new();
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_QWORD *)v3 = &off_2510765C8;
  *(_QWORD *)(v3 + 8) = &__block_literal_global_135;
  *(_QWORD *)(v3 + 24) = v3;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](v3 + 32, v3);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100](v3 + 64, v3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___ZN12IOThreadWorkC2Ev_block_invoke_2;
  v7[3] = &__block_descriptor_40_e8_q16__0q8l;
  v7[4] = v3;
  *(_QWORD *)(v3 + 120) = 0;
  *(_QWORD *)(v3 + 96) = &off_251076620;
  *(_QWORD *)(v3 + 104) = MEMORY[0x24267E6DC](v7);
  *(_QWORD *)(v3 + 120) = v3 + 96;
  a1[5] = v3;
  v4 = operator new();
  IOThread::IOThread(v4, v3);
  a1[7] = 0;
  a1[6] = v4;
  a1[8] = 0;
  v5 = operator new();
  MEMORY[0x24267E3AC]();
  a1[9] = v5;
  return a1;
}

void sub_24018D5D4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = v3;
  MEMORY[0x24267E4D8](v5, 0x1000C4090D0E795);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v4);
  std::unique_ptr<IOThread>::reset[abi:ne180100](v1 + 6, 0);
  v7 = (_QWORD *)v1[5];
  v1[5] = 0;
  if (v7)
    std::default_delete<IOThreadWork>::operator()[abi:ne180100](v7);
  std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100](v2, 0);
  v8 = (_QWORD *)v1[3];
  if (v8 == v1)
  {
    v9 = 4;
  }
  else
  {
    if (!v8)
      goto LABEL_8;
    v9 = 5;
    v1 = (_QWORD *)v1[3];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v9))(v1);
LABEL_8:
  _Unwind_Resume(a1);
}

_QWORD **ClientSideAudioSwitchboardIOThread::stop(ClientSideAudioSwitchboardIOThread *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 6);
  atomic_store(1u, (unsigned __int8 *)(v2 + 4));
  if (!pthread_join(*(pthread_t *)(v2 + 8), 0))
  {
    *(_QWORD *)(v2 + 8) = 0;
    do
      __ldaxr((unsigned int *)v2);
    while (__stlxr(0, (unsigned int *)v2));
  }
  return std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100]((_QWORD **)this + 4, 0);
}

_QWORD *std::__function::__value_func<long long ()(void)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_24018D94C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_251076A98;
  v2 = a1 + 2;
  v3 = (_QWORD *)a1[5];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_251076A98;
  v1 = a1 + 2;
  v2 = (_QWORD *)a1[5];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = operator new(0x30uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *v2 = &off_251076A98;
  v2[1] = v3;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_24018DAC8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *a2 = &off_251076A98;
  a2[1] = v2;
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 16);
  result = *(_QWORD **)(a1 + 40);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 16;
  v3 = (char *)*((_QWORD *)__p + 5);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::operator()(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  caulk::mach::os_workgroup_managed *v4;
  int v5;
  NSObject *v6;
  _opaque_pthread_t *v7;
  thread_act_t v8;
  kern_return_t v9;
  NSObject *v10;
  uint64_t v11;
  integer_t v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  if (*a2)
  {
    v13 = 1751215220;
    v3 = *(_QWORD *)(a1 + 40);
    if (!v3)
      goto LABEL_17;
    (*(void (**)(uint64_t, integer_t *))(*(_QWORD *)v3 + 48))(v3, &v13);
  }
  v4 = **(caulk::mach::os_workgroup_managed ***)(v2 + 56);
  if (*((_QWORD *)v4 + 1))
  {
    v5 = caulk::mach::os_workgroup_managed::leave(v4);
    if (!v5)
      goto LABEL_11;
  }
  else
  {
    v5 = 29;
  }
  sIsolatedCoreAudioLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "ClientSideAudioSwitchboardIOThread.mm";
    v15 = 1024;
    v16 = 117;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_240186000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOTearDownFunction - Failed to leave the workgroup!!!! - %d", (uint8_t *)&v13, 0x18u);
  }

LABEL_11:
  v7 = pthread_self();
  v13 = 1;
  v8 = pthread_mach_thread_np(v7);
  v9 = thread_policy_set(v8, 1u, &v13, 1u);
  if (v9)
  {
    sIsolatedCoreAudioLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "ClientSideAudioSwitchboardIOThread.mm";
      v15 = 1024;
      v16 = 123;
      v17 = 1024;
      v18 = v9;
      _os_log_impl(&dword_240186000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOTearDownFunction - Failed to set the RT thread priority!!!! - %d", (uint8_t *)&v13, 0x18u);
    }

  }
  v11 = *(_QWORD *)(v2 + 24);
  if (!v11)
LABEL_17:
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 48))(v11);
  return TranslateKernelError(v9);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFviEEEE3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_2>,long long ()(long long)>::target_type()
{
}

uint64_t TranslateKernelError(int a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  if (a1 == 49)
  {
    sIsolatedCoreAudioLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "ClientSideAudioSwitchboardIOThread.mm";
      v9 = 1024;
      v10 = 67;
      v3 = "%25s:%-5d ClientSideAudioSwitchboardIOThread::TranslateKernelError - Semaphores timed out!!! Exiting the workloop";
      v4 = v2;
      v5 = 18;
LABEL_8:
      _os_log_impl(&dword_240186000, v4, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v7, v5);
    }
  }
  else
  {
    sIsolatedCoreAudioLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "ClientSideAudioSwitchboardIOThread.mm";
      v9 = 1024;
      v10 = 71;
      v11 = 1024;
      v12 = a1;
      v3 = "%25s:%-5d ClientSideAudioSwitchboardIOThread::TranslateKernelError - General Semaphore Error - %d. Exiting the workloop";
      v4 = v2;
      v5 = 24;
      goto LABEL_8;
    }
  }

  return 1;
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_251076A40;
  v2 = a1 + 2;
  v3 = (_QWORD *)a1[5];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_251076A40;
  v1 = a1 + 2;
  v2 = (_QWORD *)a1[5];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = operator new(0x30uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *v2 = &off_251076A40;
  v2[1] = v3;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_24018DFDC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *a2 = &off_251076A40;
  a2[1] = v2;
  return std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 16);
  result = *(_QWORD **)(a1 + 40);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 16;
  v3 = (char *)*((_QWORD *)__p + 5);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::operator()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  int v6;
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 8);
  v8 = 0uLL;
  v3 = *(_QWORD *)(v2 + 32);
  if (*(_QWORD *)(v3 + 56) >= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(v3 + 56);
  memcpy(&v8, *(const void **)(v3 + 48), v4);
  v9 = v8;
  v5 = *(_QWORD *)(a1 + 40);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v5 + 48))(v5, &v9);
  v6 = IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(*(_QWORD *)(v2 + 32) + 8), 0.5, *(caulk::mach::semaphore **)(*(_QWORD *)(v2 + 32) + 24));
  return TranslateKernelError(v6);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFviEEEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_1>,long long ()(void)>::target_type()
{
}

void std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

__n128 std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_2510769E8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_2510769E8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  _opaque_pthread_t *v3;
  unint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  thread_act_t v7;
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  caulk::mach::os_workgroup_managed *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  _BYTE v17[18];
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD *)(a1 + 16);
  v3 = pthread_self();
  if (v2 <= 0x4B2)
    v4 = 1202;
  else
    v4 = v2;
  LODWORD(v5) = v4 >> 1;
  if (v4 >> 1 <= 0x4B0)
    LODWORD(v5) = 1200;
  if (v5 >= 0x124F80)
    v5 = 1200000;
  else
    v5 = v5;
  v6 = (int8x16_t)vdupq_n_s64(0x100000000uLL);
  v6.i64[0] = v5 << 32;
  *(int8x16_t *)v17 = vorrq_s8(v6, (int8x16_t)vdupq_n_s64(v4));
  v7 = pthread_mach_thread_np(v3);
  v8 = thread_policy_set(v7, 2u, (thread_policy_t)v17, 4u);
  if (v8)
  {
    v9 = v8;
    sIsolatedCoreAudioLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v17 = 136315650;
      *(_QWORD *)&v17[4] = "ClientSideAudioSwitchboardIOThread.mm";
      *(_WORD *)&v17[12] = 1024;
      *(_DWORD *)&v17[14] = 86;
      v18 = 1024;
      v19 = v9;
      _os_log_impl(&dword_240186000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - Failed to set the RT thread priority!!!! - %d", v17, 0x18u);
    }

  }
  v11 = **(caulk::mach::os_workgroup_managed ***)(v1 + 56);
  if (*((_QWORD *)v11 + 1))
  {
    v12 = caulk::mach::os_workgroup_managed::join(v11);
    if (!v12)
      goto LABEL_20;
  }
  else
  {
    v12 = 29;
  }
  sIsolatedCoreAudioLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v17 = 136315650;
    *(_QWORD *)&v17[4] = "ClientSideAudioSwitchboardIOThread.mm";
    *(_WORD *)&v17[12] = 1024;
    *(_DWORD *)&v17[14] = 92;
    v18 = 1024;
    v19 = v12;
    _os_log_impl(&dword_240186000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::IOSetUpFunction - Failed to join the workgroup!!!! - %d", v17, 0x18u);
  }

LABEL_20:
  v14 = caulk::mach::semaphore::timed_wait_or_error(*(caulk::mach::semaphore **)(*(_QWORD *)(v1 + 32) + 24), 0.5);
  *(_QWORD *)v17 = v14;
  if ((v14 & 0xFF00000000) != 0)
  {
    caulk::expected<BOOL,int>::value((uint64_t)v17);
    if (v17[0])
      v15 = 0;
    else
      v15 = 49;
  }
  else
  {
    v15 = v14;
  }
  caulk::mach::semaphore::signal(*(caulk::mach::semaphore **)(v1 + 72));
  return TranslateKernelError(v15);
}

uint64_t std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN34ClientSideAudioSwitchboardIOThread13spawnIOThreadEjNSt3__18functionIFv18CoreAudioTimestampEEENS1_IFviEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0,std::allocator<ClientSideAudioSwitchboardIOThread::spawnIOThread(unsigned int,std::function<void ()(CoreAudioTimestamp)>,std::function<void ()(int)>)::$_0>,long long ()(void)>::target_type()
{
}

uint64_t caulk::expected<BOOL,int>::value(uint64_t result)
{
  int *v1;
  _DWORD *exception;
  int v3;

  if (!*(_BYTE *)(result + 4))
  {
    v1 = (int *)result;
    exception = __cxa_allocate_exception(0x10uLL);
    v3 = *v1;
    *(_QWORD *)exception = &off_2510764F0;
    exception[2] = v3;
  }
  return result;
}

void caulk::bad_expected_access<int>::~bad_expected_access(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x24267E4D8);
}

void ClientLocalServer::~ClientLocalServer(ClientLocalServer *this)
{
  ClientLocalServer::~ClientLocalServer(this);
  JUMPOUT(0x24267E4D8);
}

{
  ClientLocalServer *v2;
  uint64_t v3;
  uint64_t v4;
  ClientLocalServer *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_2510761A0;
  *((_QWORD *)this + 1) = &unk_251076208;
  ClientLocalServer::tellServerToStopIO(this);
  v2 = (ClientLocalServer *)*((_QWORD *)this + 14);
  if (v2 == (ClientLocalServer *)((char *)this + 88))
  {
    v3 = 4;
    v2 = (ClientLocalServer *)((char *)this + 88);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  std::unique_ptr<std::thread>::reset[abi:ne180100]((std::thread **)this + 9, 0);
  v4 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100]((_QWORD **)this + 7, 0);
  *((_QWORD *)this + 1) = &off_2510763B8;
  v5 = (ClientLocalServer *)*((_QWORD *)this + 5);
  if (v5 == (ClientLocalServer *)((char *)this + 16))
  {
    v6 = 4;
    v5 = (ClientLocalServer *)((char *)this + 16);
  }
  else
  {
    if (!v5)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
}

_QWORD *ClientLocalServer::makeConnectionToServer(uint64_t a1, uint64_t a2)
{
  atomic_store(1u, (unsigned __int8 *)(a1 + 81));
  return std::function<void ()(void)>::operator=((_QWORD *)(a1 + 88), a2);
}

__n128 ClientLocalServer::acquireSharedIOThreadResourcesFromServer@<Q0>(ClientLocalServer *this@<X0>, uint64_t a2@<X8>)
{
  ServerIOThreadResources *v4;
  uint64_t v5;
  __n128 result;
  _QWORD *v7;

  v4 = (ServerIOThreadResources *)operator new();
  ServerIOThreadResources::ServerIOThreadResources(v4);
  v7 = 0;
  std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100]((_QWORD **)this + 7, v4);
  std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100](&v7, 0);
  v5 = *((_QWORD *)this + 7);
  *(_BYTE *)(v5 + 64) = 1;
  *(_QWORD *)a2 = **(unsigned int **)(v5 + 24) | ((unint64_t)**(unsigned int **)(v5 + 8) << 32);
  result = *(__n128 *)(v5 + 48);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_24018E578(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24267E4D8](v1, 0x10A0C40DFABB4B5);
  _Unwind_Resume(a1);
}

_QWORD **ClientLocalServer::releaseSharedIOThreadResourcesFromServer(ClientLocalServer *this)
{
  return std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100]((_QWORD **)this + 7, 0);
}

void ClientLocalServer::getWorkgroupFromServer(ClientLocalServer *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  OS_os_workgroup *v13;
  IOThreadWorkgroup *v14;
  uint64_t v15;
  void *__p;
  char v17;
  _BYTE v18[8];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&__p, "ClientLocalServer Workgroup");
  caulk::mach::os_workgroup_interval_managed::make();
  v4 = operator new();
  *(_OWORD *)(v4 + 41) = 0u;
  v5 = MEMORY[0x24BEC6F60];
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  v6 = v19;
  *(_QWORD *)v4 = v5 + 16;
  *(_QWORD *)(v4 + 8) = v6;
  v19 = 0;
  caulk::mach::details::release_os_object(0, v7);
  v8 = *(_QWORD *)(v4 + 48);
  v9 = *(_OWORD *)(v4 + 16);
  v10 = *(_OWORD *)(v4 + 32);
  v11 = v21;
  *(_OWORD *)(v4 + 16) = v20;
  *(_OWORD *)(v4 + 32) = v11;
  *(_QWORD *)(v4 + 48) = v22;
  v20 = v9;
  v21 = v10;
  v22 = v8;
  *(_WORD *)(v4 + 56) = v23;
  v23 = 0;
  v12 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v4;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  caulk::mach::os_workgroup_interval_managed::~os_workgroup_interval_managed((caulk::mach::os_workgroup_interval_managed *)v18);
  if (v17 < 0)
    operator delete(__p);
  v13 = *(OS_os_workgroup **)(*((_QWORD *)this + 8) + 8);
  caulk::mach::os_object<OS_os_workgroup * {__strong}>::get(v13);
  objc_claimAutoreleasedReturnValue();
  v14 = (IOThreadWorkgroup *)operator new(0x20uLL);
  v14[1].var0.var0.var0 = 0;
  v14[2].var0.var0.var0 = 0;
  v14->var0.var0.var0 = (os_workgroup_managed *)&off_251076B88;
  IOThreadWorkgroup::IOThreadWorkgroup(v14 + 3, v13);
  *a2 = v15;
  a2[1] = v14;

}

void sub_24018E708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  void *v16;
  std::__shared_weak_count *v17;
  void *v19;

  std::__shared_weak_count::~__shared_weak_count(v17);
  operator delete(v19);

  _Unwind_Resume(a1);
}

uint64_t ClientLocalServer::tellServerToStartIO(ClientLocalServer *this)
{
  unsigned __int8 v1;
  std::thread *v4;
  std::__thread_struct *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;

  v1 = atomic_load((unsigned __int8 *)this + 81);
  if ((v1 & 1) == 0)
    return 0xFFFFFFFFLL;
  atomic_store(0, (unsigned __int8 *)this + 80);
  v4 = (std::thread *)operator new();
  v5 = (std::__thread_struct *)operator new();
  std::__thread_struct::__thread_struct(v5);
  v6 = (uint64_t *)operator new();
  *v6 = (uint64_t)v5;
  v6[1] = (uint64_t)this;
  v8 = v6;
  v7 = pthread_create(&v4->__t_, 0, (void *(__cdecl *)(void *))std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>, v6);
  if (v7)
  {
    std::__throw_system_error(v7, "thread constructor failed");
    __break(1u);
    JUMPOUT(0x24018E840);
  }
  v8 = 0;
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100](&v8);
  std::unique_ptr<std::thread>::reset[abi:ne180100]((std::thread **)this + 9, v4);
  return 0;
}

uint64_t ClientLocalServer::tellServerToStartIOAtTime(ClientLocalServer *this)
{
  return 0;
}

uint64_t ClientLocalServer::tellServerToStopIO(ClientLocalServer *this)
{
  std::thread *v1;
  std::thread **v2;

  atomic_store(1u, (unsigned __int8 *)this + 80);
  v2 = (std::thread **)((char *)this + 72);
  v1 = (std::thread *)*((_QWORD *)this + 9);
  if (v1)
    std::thread::join(v1);
  std::unique_ptr<std::thread>::reset[abi:ne180100](v2, 0);
  return 0;
}

BOOL ClientLocalServer::areServerResourcesCheckedOut(ClientLocalServer *this)
{
  return *((_QWORD *)this + 7) != 0;
}

uint64_t ClientLocalServer::kill(ClientLocalServer *this)
{
  uint64_t v2;
  uint64_t result;

  v2 = *((_QWORD *)this + 6);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  atomic_store(0, (unsigned __int8 *)this + 81);
  result = *((_QWORD *)this + 14);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

void `non-virtual thunk to'ClientLocalServer::~ClientLocalServer(ClientLocalServer *this)
{
  ClientLocalServer::~ClientLocalServer((ClientLocalServer *)((char *)this - 8));
}

{
  ClientLocalServer::~ClientLocalServer((ClientLocalServer *)((char *)this - 8));
  JUMPOUT(0x24267E4D8);
}

uint64_t `non-virtual thunk to'ClientLocalServer::kill(ClientLocalServer *this)
{
  uint64_t v2;
  uint64_t result;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  atomic_store(0, (unsigned __int8 *)this + 73);
  result = *((_QWORD *)this + 13);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

std::thread *std::unique_ptr<std::thread>::reset[abi:ne180100](std::thread **a1, std::thread *a2)
{
  std::thread *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    std::thread::~thread(result);
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

_QWORD **std::unique_ptr<ServerIOThreadResources>::reset[abi:ne180100](_QWORD **result, _QWORD *a2)
{
  _QWORD *v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    IOThreadServerMappedMemory::~IOThreadServerMappedMemory((IOThreadServerMappedMemory *)(v2 + 5));
    *v2 = &off_251076290;
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 3));
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 1));
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>(uint64_t *a1)
{
  std::__thread_specific_ptr<std::__thread_struct> *v1;
  const void *v2;
  uint64_t i;
  unsigned __int8 v4;
  const void **v6;

  v6 = (const void **)a1;
  v1 = std::__thread_local_data();
  v2 = *v6;
  *v6 = 0;
  pthread_setspecific(v1->__key_, v2);
  for (i = (uint64_t)v6[1];
        ;
        IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(*(_QWORD *)(i + 56) + 8), 10.0, *(caulk::mach::semaphore **)(*(_QWORD *)(i + 56) + 24)))
  {
    v4 = atomic_load((unsigned __int8 *)(i + 80));
    if ((v4 & 1) != 0)
      break;
  }
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t **)&v6);
  return 0;
}

void sub_24018EBC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t **std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,ClientLocalServer::tellServerToStartIO(void)::$_0>>::~unique_ptr[abi:ne180100](uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *v2;
    *v2 = 0;
    if (v3)
    {
      v4 = MEMORY[0x24267E430]();
      MEMORY[0x24267E4D8](v4, 0x20C4093837F09);
    }
    MEMORY[0x24267E4D8](v2, 0x20C40A4A59CD2);
  }
  return a1;
}

_QWORD *std::function<void ()(void)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v8, a2);
  if (v8 != a1)
  {
    v3 = v9;
    v4 = (_QWORD *)a1[3];
    if (v9 == v8)
    {
      if (v4 == a1)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v8[0] + 24))(v8, v10);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a1[3] + 24))(a1[3], v8);
        (*(void (**)(_QWORD))(*(_QWORD *)a1[3] + 32))(a1[3]);
        a1[3] = 0;
        v9 = v8;
        (*(void (**)(_QWORD *, _QWORD *))(v10[0] + 24))(v10, a1);
        (*(void (**)(_QWORD *))(v10[0] + 32))(v10);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(v8[0] + 24))(v8, a1);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = (_QWORD *)a1[3];
      }
      a1[3] = a1;
    }
    else if (v4 == a1)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a1 + 24))(a1, v8);
      (*(void (**)(_QWORD))(*(_QWORD *)a1[3] + 32))(a1[3]);
      a1[3] = v9;
      v9 = v8;
    }
    else
    {
      v9 = (_QWORD *)a1[3];
      a1[3] = v3;
    }
  }
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_14;
  }
  if (v9)
  {
    v6 = 5;
LABEL_14:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return a1;
}

void sub_24018EDFC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_24018F100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a9);

  _Unwind_Resume(a1);
}

void sub_24018FF90(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_2401904AC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, uint64_t a14, uint64_t a15, char a16)
{
  NSObject *v17;

  if (a2)
  {
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    __cxa_begin_catch(a1);
    sIsolatedCoreAudioLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 65;
      _os_log_impl(&dword_240186000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkOutForIsolatedAudioSharedResources - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x240190474);
  }
  _Unwind_Resume(a1);
}

void sub_2401907C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  uint64_t v16;
  NSObject *v17;

  if (a2)
  {
    v16 = a14;
    a14 = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);

    __cxa_begin_catch(a1);
    sIsolatedCoreAudioLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 82;
      _os_log_impl(&dword_240186000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - getWorkgroupForIsolatedAudio - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x240190770);
  }
  _Unwind_Resume(a1);
}

void sub_240190AD8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, uint64_t a12, uint64_t a13, char a14)
{
  NSObject *v15;

  if (a2)
  {
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    __cxa_begin_catch(a1);
    sIsolatedCoreAudioLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 99;
      _os_log_impl(&dword_240186000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - startIsolatedAudioForUseCase - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x240190A94);
  }
  _Unwind_Resume(a1);
}

void sub_240190DC4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, uint64_t a12, uint64_t a13, char a14)
{
  NSObject *v15;

  if (a2)
  {
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    __cxa_begin_catch(a1);
    sIsolatedCoreAudioLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 116;
      _os_log_impl(&dword_240186000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - startIsolatedAudioForUseCaseAtTime - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x240190D7CLL);
  }
  _Unwind_Resume(a1);
}

void sub_2401910A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, uint64_t a12, uint64_t a13, char a14)
{
  NSObject *v15;

  if (a2)
  {
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    __cxa_begin_catch(a1);
    sIsolatedCoreAudioLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "IsolatedCoreAudioXPCService.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 133;
      _os_log_impl(&dword_240186000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - stopIsolatedAudioForUseCase - landed in the catch!", (uint8_t *)&buf, 0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x24019105CLL);
  }
  _Unwind_Resume(a1);
}

void sub_240191374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v29 = v27;

  objc_sync_exit(v28);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__177(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__178(uint64_t a1)
{

}

void sub_240191710(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ServerSideHardware>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076BC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ServerSideHardware>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076BC0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<ServerSideHardware>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076CD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076CD8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

void std::__shared_ptr_emplace<ServerSideAudioSwitchboard>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 64);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v4)
    operator delete(v4);
}

void HALUseCase::~HALUseCase(HALUseCase *this)
{
  *(_QWORD *)this = &off_2510758F8;
  std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100]((_QWORD *)this + 2);
}

{
  *(_QWORD *)this = &off_2510758F8;
  std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100]((_QWORD *)this + 2);
  JUMPOUT(0x24267E4D8);
}

BOOL HALUseCase::SetDeviceIDUsingUseCaseID(HALUseCase *this)
{
  int v2;
  NSObject *v3;
  OSStatus PropertyData;
  NSObject *v5;
  int v6;
  NSObject *v7;
  int v8;
  _BYTE v10[5];
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  int outData;
  int inQualifierData;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 2);
  inQualifierData = v2;
  v3 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "HALUseCase.cpp";
    v17 = 1024;
    v18 = 34;
    v19 = 1024;
    v20 = v2;
    _os_log_impl(&dword_240186000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID looking for: %u", buf, 0x18u);
  }
  ioDataSize = 4;
  outData = 0;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"diuibolg";
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 4u, &inQualifierData, &ioDataSize, &outData);
  if (PropertyData)
  {
    v10[0] = HIBYTE(PropertyData);
    v10[1] = BYTE2(PropertyData);
    v10[2] = BYTE1(PropertyData);
    v10[3] = PropertyData;
    v10[4] = 0;
    v5 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "HALUseCase.cpp";
      v17 = 1024;
      v18 = 43;
      v19 = 1024;
      v20 = inQualifierData;
      v21 = 2080;
      v22 = v10;
      _os_log_impl(&dword_240186000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID could not get device ID - looking for %u and received error: %s ", buf, 0x22u);
    }
  }
  v6 = outData;
  if (outData)
  {
    *((_DWORD *)this + 6) = outData;
    v7 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_DWORD *)this + 6);
      *(_DWORD *)buf = 136315650;
      v16 = "HALUseCase.cpp";
      v17 = 1024;
      v18 = 52;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d HALUseCase::SetDeviceIDUsingUseCaseID mDeviceID: %d", buf, 0x18u);
    }
  }
  return v6 != 0;
}

_QWORD *std::unique_ptr<CoreAudioCallback>::reset[abi:ne180100](_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = (_QWORD *)*result;
  *result = 0;
  if (v1)
  {
    v2 = (_QWORD *)v1[3];
    if (v2 == v1)
    {
      v3 = 4;
      v2 = v1;
    }
    else
    {
      if (!v2)
        goto LABEL_8;
      v3 = 5;
    }
    (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_8:
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

void IOThreadClientMappedMemory::~IOThreadClientMappedMemory(IOThreadClientMappedMemory *this)
{
  JUMPOUT(0x24267E4D8);
}

void ServerIOThreadResources::ServerIOThreadResources(ServerIOThreadResources *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)((char *)this + 8) = 0u;
  v2 = (_QWORD *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_QWORD *)this = &off_251076440;
  v3 = operator new();
  MEMORY[0x24267E3AC]();
  v7 = v3;
  std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100]<caulk::mach::semaphore,std::default_delete<caulk::mach::semaphore>,void>(v2, &v7);
  if (v7)
  {
    v4 = MEMORY[0x24267E3B8]();
    MEMORY[0x24267E4D8](v4, 0x1000C4090D0E795);
  }
  v5 = operator new();
  MEMORY[0x24267E3AC]();
  v7 = v5;
  std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100]<caulk::mach::semaphore,std::default_delete<caulk::mach::semaphore>,void>((_QWORD *)this + 3, &v7);
  if (v7)
  {
    v6 = MEMORY[0x24267E3B8]();
    MEMORY[0x24267E4D8](v6, 0x1000C4090D0E795);
  }
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 5) = &off_251076420;
  *((_QWORD *)this + 6) = mmap(0, 0x400uLL, 3, 4097, -1, 0);
  *((_QWORD *)this + 7) = 1024;
  *((_BYTE *)this + 64) = 0;
}

void sub_240191CE8(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = &off_251076290;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_BYTE *std::__call_once_proxy[abi:ne180100]<std::tuple<AudioClientForUnitTests::GetInstance(void)::$_0 &&>>()
{
  _BYTE *result;

  result = (_BYTE *)operator new();
  *result = 0;
  AudioClientForUnitTests::GetInstance(void)::sInstance = (uint64_t)result;
  return result;
}

void getClient(int a1)
{
  unint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  RemoteAudioHardwareServer *v5;
  RemoteAudioHardwareServer *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v13;
  int v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  std::__shared_weak_count_vtbl *v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  unint64_t v37;
  RemoteAudioHardwareServer *v38;
  RemoteAudioHardwareServer *v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  __int128 v61;
  std::__shared_weak_count *v62;
  std::__shared_weak_count *v63;
  std::__shared_weak_count *v64;
  __int128 v65;
  __int128 *v66;
  uint64_t v67[3];
  uint64_t *v68;
  _BYTE buf[18];
  __int16 v70;
  int v71;
  _BYTE *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if ((getClient::isInitialized & 1) != 0)
    return;
  getClient::isInitialized = 1;
  v2 = atomic_load(&AudioClientForUnitTests::GetInstance(void)::sOnce);
  if (v2 != -1)
  {
    *(_QWORD *)buf = &v65;
    v67[0] = (uint64_t)buf;
    std::__call_once(&AudioClientForUnitTests::GetInstance(void)::sOnce, v67, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<AudioClientForUnitTests::GetInstance(void)::$_0 &&>>);
  }
  if (!*(_BYTE *)AudioClientForUnitTests::GetInstance(void)::sInstance)
  {
    v11 = (std::__shared_weak_count *)operator new(0x40uLL);
    v11->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__shared_weak_owners_ = 0;
    v11->__vftable = (std::__shared_weak_count_vtbl *)&off_251075AD8;
    v11[1].__vftable = (std::__shared_weak_count_vtbl *)&off_2510764A8;
    v13 = v11 + 1;
    v11[1].__shared_owners_ = 0x400000400;
    v11[1].__shared_weak_owners_ = 0;
    LOBYTE(v11[2].__vftable) = 0;
    v14 = tb_conclave_endpoint_for_service();
    if (v14)
    {
      v15 = sIsolatedCoreAudioLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "IsolatedCoreAudioClientExclaveKitProxy.cpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 18;
        v70 = 1024;
        v71 = v14;
        _os_log_impl(&dword_240186000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error getting IsolateCoreAudioClient TightBeam endpoint - this should not happen!!! ErrorCode: %u", buf, 0x18u);
      }
    }
    else
    {
      v31 = tb_client_connection_create_with_endpoint();
      if (!tb_client_connection_activate())
        v11[2].__shared_owners_ = v31;
    }
    v63 = v11;
    v62 = v11;
    do
      v32 = __ldxr(p_shared_owners);
    while (__stxr(v32 + 1, p_shared_owners));
    ((void (*)(std::__shared_weak_count *))v13->__get_deleter)(v13);
    v33 = operator new(0x38uLL);
    v33[1] = 0;
    v33[2] = 0;
    *v33 = &off_251076BF8;
    v33[3] = &off_2510762B0;
    *((_DWORD *)v33 + 8) = a1;
    v34 = operator new(0x30uLL);
    v34[1] = 0;
    v34[2] = 0;
    *v34 = &off_251076CA0;
    v34[4] = 0;
    v34[5] = 0;
    v34[3] = 0;
    v33[5] = v34 + 3;
    v33[6] = v34;
    *(_QWORD *)&v61 = v33 + 3;
    *((_QWORD *)&v61 + 1) = v33;
    v35 = (_QWORD *)operator new();
    v36 = v35;
    v65 = v61;
    do
      v37 = __ldxr(p_shared_owners);
    while (__stxr(v37 + 1, p_shared_owners));
    v67[0] = (uint64_t)&off_251075920;
    v67[1] = (uint64_t)&v11[1];
    v67[2] = (uint64_t)v11;
    v68 = v67;
    *v35 = &off_251076328;
    v35[1] = &unk_251076388;
    v35[5] = 0;
    v35[6] = &off_251075A28;
    v35[9] = v35 + 6;
    v38 = (RemoteAudioHardwareServer *)operator new();
    v39 = v38;
    if (*((_QWORD *)&v61 + 1))
    {
      v40 = (unint64_t *)(*((_QWORD *)&v61 + 1) + 8);
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
    }
    RemoteAudioHardwareServer::RemoteAudioHardwareServer(v38, v61, *((uint64_t *)&v61 + 1));
    v36[10] = v39;
    if (*((_QWORD *)&v61 + 1))
    {
      v42 = (unint64_t *)(*((_QWORD *)&v61 + 1) + 8);
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v61 + 1) + 16))(*((_QWORD *)&v61 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v61 + 1));
      }
    }
    v44 = (_QWORD *)operator new();
    *(_QWORD *)buf = &off_251076570;
    *(_QWORD *)&buf[8] = defaultIOThreadExitHandler;
    v72 = buf;
    ClientSideAudioSwitchboardIOThread::ClientSideAudioSwitchboardIOThread(v44, (uint64_t)buf);
    v36[11] = v44;
    v45 = v72;
    if (v72 == buf)
    {
      v46 = 4;
      v45 = buf;
    }
    else
    {
      if (!v72)
        goto LABEL_69;
      v46 = 5;
    }
    (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_69:
    v36[12] = &off_251076570;
    v36[13] = ServerDeathMessage;
    v36[15] = v36 + 12;
    if (!v68)
    {
      v36[19] = 0;
      goto LABEL_79;
    }
    if (v68 == v67)
    {
      v36[19] = v36 + 16;
      (*(void (**)(uint64_t *))(v67[0] + 24))(v67);
    }
    else
    {
      v36[19] = (*(uint64_t (**)(void))(*v68 + 16))();
    }
    v47 = v68;
    if (v68 == v67)
    {
      v48 = 4;
      v47 = v67;
    }
    else
    {
      if (!v68)
        goto LABEL_79;
      v48 = 5;
    }
    (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_79:
    v49 = (std::__shared_weak_count *)*((_QWORD *)&v65 + 1);
    if (*((_QWORD *)&v65 + 1))
    {
      v50 = (unint64_t *)(*((_QWORD *)&v65 + 1) + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    v52 = (_QWORD *)operator new();
    v53 = (uint64_t)v52;
    v67[0] = (uint64_t)v36;
    *(_QWORD *)buf = v13;
    *(_QWORD *)&buf[8] = v63;
    if (v63)
    {
      v54 = (unint64_t *)&v63->__shared_owners_;
      do
        v55 = __ldxr(v54);
      while (__stxr(v55 + 1, v54));
      AudioClient::AudioClient(v52, v67, (uint64_t *)buf);
      do
        v56 = __ldaxr(v54);
      while (__stlxr(v56 - 1, v54));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    else
    {
      AudioClient::AudioClient(v52, v67, (uint64_t *)buf);
    }
    if (v67[0])
      (*(void (**)(uint64_t))(*(_QWORD *)v67[0] + 8))(v67[0]);
    std::unique_ptr<AudioClient>::reset[abi:ne180100](v53);
    if (v62)
    {
      v57 = (unint64_t *)&v62->__shared_owners_;
      do
        v58 = __ldaxr(v57);
      while (__stlxr(v58 - 1, v57));
      if (!v58)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }
    if (v63)
    {
      v59 = (unint64_t *)&v63->__shared_owners_;
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    return;
  }
  *(_QWORD *)&v65 = &off_251075978;
  v66 = &v65;
  v3 = (std::__shared_weak_count *)operator new(0x90uLL);
  *(_OWORD *)&v3->__shared_owners_ = 0u;
  v4 = (unint64_t *)&v3->__shared_owners_;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B50;
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)&off_2510761A0;
  v3[1].__shared_weak_owners_ = (uint64_t)&off_251076938;
  v3[2].__shared_weak_owners_ = (uint64_t)&v3[1].__shared_weak_owners_;
  v3[1].__shared_owners_ = (uint64_t)&unk_251076208;
  BYTE1(v3[4].__shared_owners_) = 0;
  v3[5].__shared_weak_owners_ = 0;
  v3[3].__shared_owners_ = 0;
  *(_OWORD *)&v3[3].__shared_weak_owners_ = 0u;
  v64 = v3;
  v5 = (RemoteAudioHardwareServer *)operator new();
  v6 = v5;
  *(_QWORD *)buf = v3 + 1;
  *(_QWORD *)&buf[8] = v3;
  do
    v7 = __ldxr(v4);
  while (__stxr(v7 + 1, v4));
  RemoteAudioHardwareServer::RemoteAudioHardwareServer(v5, (uint64_t)&v3[1], (uint64_t)v3);
  do
    v8 = __ldaxr(v4);
  while (__stlxr(v8 - 1, v4));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  v9 = (_QWORD *)operator new();
  v10 = (uint64_t)v66;
  if (!v66)
    goto LABEL_14;
  if (v66 != &v65)
  {
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)v66 + 16))();
LABEL_14:
    v68 = (uint64_t *)v10;
    goto LABEL_19;
  }
  v68 = v67;
  (*(void (**)(uint64_t, _QWORD *))(v65 + 24))((uint64_t)&v65, v67);
LABEL_19:
  *v9 = &off_251076328;
  v9[1] = &unk_251076388;
  v9[5] = 0;
  v9[6] = &off_2510768E0;
  v9[9] = v9 + 6;
  v9[10] = v6;
  v16 = (_QWORD *)operator new();
  v17 = (uint64_t)v68;
  if (!v68)
  {
LABEL_22:
    v72 = (_BYTE *)v17;
    goto LABEL_24;
  }
  if (v68 != v67)
  {
    v17 = (*(uint64_t (**)(void))(*v68 + 16))();
    goto LABEL_22;
  }
  v72 = buf;
  (*(void (**)(uint64_t *, _BYTE *))(v67[0] + 24))(v67, buf);
LABEL_24:
  ClientSideAudioSwitchboardIOThread::ClientSideAudioSwitchboardIOThread(v16, (uint64_t)buf);
  v9[11] = v16;
  v18 = v72;
  if (v72 == buf)
  {
    v19 = 4;
    v18 = buf;
  }
  else
  {
    if (!v72)
      goto LABEL_29;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_29:
  v9[12] = &off_251076570;
  v9[13] = ServerDeathMessage;
  v9[15] = v9 + 12;
  v9[16] = &off_251075A80;
  v9[19] = v9 + 16;
  v20 = v68;
  if (v68 == v67)
  {
    v21 = 4;
    v20 = v67;
  }
  else
  {
    if (!v68)
      goto LABEL_34;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_34:
  v22 = (std::__shared_weak_count_vtbl *)operator new();
  v22->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&off_251076460;
  v23 = (_QWORD *)operator new();
  v67[0] = (uint64_t)v9;
  *(_QWORD *)buf = v22;
  v24 = (std::__shared_weak_count *)operator new();
  v24->__shared_owners_ = 0;
  v25 = (unint64_t *)&v24->__shared_owners_;
  v24->__vftable = (std::__shared_weak_count_vtbl *)&off_251075B10;
  v24->__shared_weak_owners_ = 0;
  v24[1].__vftable = v22;
  *(_QWORD *)&buf[8] = v24;
  AudioClient::AudioClient(v23, v67, (uint64_t *)buf);
  do
    v26 = __ldaxr(v25);
  while (__stlxr(v26 - 1, v25));
  if (!v26)
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v67[0])
    (*(void (**)(uint64_t))(*(_QWORD *)v67[0] + 8))(v67[0]);
  std::unique_ptr<AudioClient>::reset[abi:ne180100]((uint64_t)v23);
  if (v64)
  {
    v27 = (unint64_t *)&v64->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
  v29 = v66;
  if (v66 == &v65)
  {
    v30 = 4;
    v29 = &v65;
  }
  else
  {
    if (!v66)
      return;
    v30 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v29 + 8 * v30))();
}

void sub_240192710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t *a26)
{
  _QWORD *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;

  v31 = (_QWORD *)v26[15];
  if (v31 == v28)
  {
    v32 = 4;
  }
  else
  {
    if (!v31)
      goto LABEL_6;
    v32 = 5;
    v28 = (_QWORD *)v26[15];
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v32))(v28);
LABEL_6:
  std::unique_ptr<ClientSideAudioSwitchboardIOThread>::reset[abi:ne180100](v27);
  v33 = v26[10];
  v26[10] = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  v34 = (_QWORD *)v26[9];
  if (v34 == v29)
  {
    v35 = 4;
    v34 = v29;
  }
  else
  {
    if (!v34)
      goto LABEL_13;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_13:
  v36 = (_QWORD *)v26[5];
  if (v36 == v26 + 2)
  {
    v37 = 4;
    v36 = v26 + 2;
  }
  else
  {
    if (!v36)
      goto LABEL_18;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_18:
  v38 = a26;
  if (a26 == &a23)
  {
    v39 = 4;
    v38 = &a23;
  }
  else
  {
    if (!a26)
      goto LABEL_23;
    v39 = 5;
  }
  (*(void (**)(void))(*v38 + 8 * v39))();
LABEL_23:
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  MEMORY[0x24267E4D8](v26, 0x10A1C40E8D70587);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_240192B64()
{
  JUMPOUT(0x240192B5CLL);
}

uint64_t std::unique_ptr<AudioClient>::reset[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;

  v1 = getClient::sClient;
  getClient::sClient = result;
  if (v1)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v1 + 32) + 24))(*(_QWORD *)(v1 + 32));
    v2 = *(std::__shared_weak_count **)(v1 + 48);
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
    v5 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 32) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

void std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<StubbedIsolatedCoreAudioClientProxy  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__114default_deleteI35StubbedIsolatedCoreAudioClientProxyEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_emplace<ClientLocalServer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ClientLocalServer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076B50;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<ClientLocalServer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__function::__func<getClient(unsigned int)::$_1,std::allocator<getClient(unsigned int)::$_1>,void ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<getClient(unsigned int)::$_1,std::allocator<getClient(unsigned int)::$_1>,void ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_251075978;
  return result;
}

void std::__function::__func<getClient(unsigned int)::$_1,std::allocator<getClient(unsigned int)::$_1>,void ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251075978;
}

uint64_t std::__function::__func<getClient(unsigned int)::$_1,std::allocator<getClient(unsigned int)::$_1>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z9getClientjE3$_1"))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<getClient(unsigned int)::$_1,std::allocator<getClient(unsigned int)::$_1>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_251075920;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_251075920;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_251075920;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_251075920;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8)) & 1) != 0)
    return 1;
  else
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
}

uint64_t std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z9getClientjE3$_0"))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<getClient(unsigned int)::$_0,std::allocator<getClient(unsigned int)::$_0>,BOOL ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<XPCConnectionToServer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076BF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<XPCConnectionToServer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076BF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<XPCConnectionToServer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251075AD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251075AD8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<IsolatedCoreAudioClientExclaveKitProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void IOThreadWorkgroup::IOThreadWorkgroup(IOThreadWorkgroup *this, OS_os_workgroup *a2)
{
  OS_os_workgroup *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[4];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = caulk::mach::details::retain_os_object((caulk::mach::details *)v3, v4);

  caulk::mach::details::release_os_object(0, v6);
  v7 = MEMORY[0x24BEC6F58] + 16;
  v16 = MEMORY[0x24BEC6F58] + 16;
  v17 = v5;
  v18 = 0u;
  memset(v19, 0, 25);
  caulk::mach::details::release_os_object(0, v8);
  v9 = operator new();
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)(v9 + 41) = 0u;
  v10 = v17;
  *(_QWORD *)v9 = v7;
  *(_QWORD *)(v9 + 8) = v10;
  v17 = 0;
  caulk::mach::details::release_os_object(0, v11);
  v12 = *(_QWORD *)(v9 + 48);
  v14 = *(_OWORD *)(v9 + 16);
  v13 = *(_OWORD *)(v9 + 32);
  v15 = v19[0];
  *(_OWORD *)(v9 + 16) = v18;
  *(_OWORD *)(v9 + 32) = v15;
  *(_QWORD *)(v9 + 48) = *(_QWORD *)&v19[1];
  v18 = v14;
  v19[0] = v13;
  *(_QWORD *)&v19[1] = v12;
  *(_BYTE *)(v9 + 56) = BYTE8(v19[1]);
  BYTE8(v19[1]) = 0;
  this->var0.var0.var0 = (os_workgroup_managed *)v9;
  caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)&v16);
}

void sub_2401930E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)&a9);
  _Unwind_Resume(a1);
}

void RemoteAudioHardwareServer::~RemoteAudioHardwareServer(RemoteAudioHardwareServer *this)
{
  RemoteAudioHardwareServer::~RemoteAudioHardwareServer(this);
  JUMPOUT(0x24267E4D8);
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  RemoteAudioHardwareServer *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251076308;
  v2 = (char *)this + 64;
  v3 = (char *)*((_QWORD *)this + 11);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (RemoteAudioHardwareServer *)*((_QWORD *)this + 7);
  if (v5 == (RemoteAudioHardwareServer *)((char *)this + 32))
  {
    v6 = 4;
    v5 = (RemoteAudioHardwareServer *)((char *)this + 32);
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
  }
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

_QWORD *RemoteAudioHardwareServer::connectToServer(RemoteAudioHardwareServer *this)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  atomic_store(0, (unsigned __int8 *)this + 24);
  v1 = *((_QWORD *)this + 1);
  v4[0] = &off_2510767D8;
  v4[1] = this;
  v5 = v4;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v1 + 16))(v1, v4);
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_240193264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2510767D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_2510767D8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 8);
  {
    sIsolatedCoreAudioLog(void)::sLog = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioServer");
  }
  v3 = sIsolatedCoreAudioLog(void)::sLog;
  if (os_log_type_enabled((os_log_t)sIsolatedCoreAudioLog(void)::sLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "RemoteAudioHardwareServer.mm";
    v6 = 1024;
    v7 = 23;
    _os_log_impl(&dword_240186000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d RemoteAudioHardwareServer::RemoteAudioHardwareServer::InvalidationHandler - Connection invalidated!!!", (uint8_t *)&v4, 0x12u);
  }
  atomic_store(1u, (unsigned __int8 *)(v1 + 24));
}

uint64_t std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN25RemoteAudioHardwareServer15connectToServerEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RemoteAudioHardwareServer::connectToServer(void)::$_0,std::allocator<RemoteAudioHardwareServer::connectToServer(void)::$_0>,void ()(void)>::target_type()
{
}

void RemoteAudioHardwareServer::RemoteAudioHardwareServer(RemoteAudioHardwareServer *this, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)this = &off_251076308;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = a3;
  if (a3)
  {
    v3 = (unint64_t *)(a3 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  *((_BYTE *)this + 24) = 1;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 11) = 0;
  RemoteAudioHardwareServer::connectToServer(this);
}

void sub_2401934C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = (_QWORD *)v2[11];
  if (v5 == v2 + 8)
  {
    v6 = 4;
    v5 = v2 + 8;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:
  v7 = (_QWORD *)v2[7];
  if (v7 == v3)
  {
    v8 = 4;
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    v8 = 5;
    v3 = (_QWORD *)v2[7];
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v8))(v3);
LABEL_11:
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2401935AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2401936C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_240193818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_240193928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2401939CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_240193A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOThreadSynchronizer::~IOThreadSynchronizer(IOThreadSynchronizer *this)
{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *(_QWORD *)this = &off_251076290;
  v1 = (char *)this + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x24267E4D8);
}

uint64_t IOThreadSynchronizer::signalAndWait(IOThreadSynchronizer *this, double a2, caulk::mach::semaphore *a3)
{
  uint64_t result;
  uint64_t v4;

  result = caulk::mach::semaphore::timed_wait_signal_or_error(a3, this, a2);
  v4 = result;
  if ((result & 0xFF00000000) != 0)
  {
    caulk::expected<BOOL,int>::value((uint64_t)&v4);
    if ((_BYTE)v4)
      return 0;
    else
      return 49;
  }
  return result;
}

void ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(ClientSideAudioSwitchboard *this)
{
  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(this);
  JUMPOUT(0x24267E4D8);
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  ClientSideAudioSwitchboard *v5;
  uint64_t v6;
  uint64_t v7;
  ClientSideAudioSwitchboard *v8;
  uint64_t v9;
  ClientSideAudioSwitchboard *v10;
  uint64_t v11;

  *(_QWORD *)this = &off_251076328;
  *((_QWORD *)this + 1) = &unk_251076388;
  v2 = (char *)this + 128;
  v3 = (char *)*((_QWORD *)this + 19);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (ClientSideAudioSwitchboard *)*((_QWORD *)this + 15);
  if (v5 == (ClientSideAudioSwitchboard *)((char *)this + 96))
  {
    v6 = 4;
    v5 = (ClientSideAudioSwitchboard *)((char *)this + 96);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  std::unique_ptr<ClientSideAudioSwitchboardIOThread>::reset[abi:ne180100]((uint64_t *)this + 11);
  v7 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = (ClientSideAudioSwitchboard *)*((_QWORD *)this + 9);
  if (v8 == (ClientSideAudioSwitchboard *)((char *)this + 48))
  {
    v9 = 4;
    v8 = (ClientSideAudioSwitchboard *)((char *)this + 48);
  }
  else
  {
    if (!v8)
      goto LABEL_18;
    v9 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
LABEL_18:
  v10 = (ClientSideAudioSwitchboard *)*((_QWORD *)this + 5);
  if (v10 == (ClientSideAudioSwitchboard *)((char *)this + 16))
  {
    v11 = 4;
    v10 = (ClientSideAudioSwitchboard *)((char *)this + 16);
  }
  else
  {
    if (!v10)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
}

_QWORD *ClientSideAudioSwitchboard::createIOProc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v8, a2);
  v3 = a1 + 16;
  if ((_QWORD *)(a1 + 16) != v8)
  {
    v4 = v9;
    v5 = *(_QWORD *)(a1 + 40);
    if (v9 == v8)
    {
      if (v5 == v3)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v8[0] + 24))(v8, v10);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 40) + 24))(*(_QWORD *)(a1 + 40), v8);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 32))(*(_QWORD *)(a1 + 40));
        *(_QWORD *)(a1 + 40) = 0;
        v9 = v8;
        (*(void (**)(_QWORD *, uint64_t))(v10[0] + 24))(v10, a1 + 16);
        (*(void (**)(_QWORD *))(v10[0] + 32))(v10);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t))(v8[0] + 24))(v8, a1 + 16);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = *(_QWORD **)(a1 + 40);
      }
      *(_QWORD *)(a1 + 40) = v3;
    }
    else if (v5 == v3)
    {
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 24))(a1 + 16, v8);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 32))(*(_QWORD *)(a1 + 40));
      *(_QWORD *)(a1 + 40) = v9;
      v9 = v8;
    }
    else
    {
      v9 = *(_QWORD **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v4;
    }
  }
  result = v9;
  if (v9 == v8)
  {
    v7 = 4;
    result = v8;
  }
  else
  {
    if (!v9)
      return result;
    v7 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
}

void sub_240193D14(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

_QWORD *ClientSideAudioSwitchboard::setLapseCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v8, a2);
  v3 = a1 + 48;
  if ((_QWORD *)(a1 + 48) != v8)
  {
    v4 = v9;
    v5 = *(_QWORD *)(a1 + 72);
    if (v9 == v8)
    {
      if (v5 == v3)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v8[0] + 24))(v8, v10);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 72) + 24))(*(_QWORD *)(a1 + 72), v8);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 72) + 32))(*(_QWORD *)(a1 + 72));
        *(_QWORD *)(a1 + 72) = 0;
        v9 = v8;
        (*(void (**)(_QWORD *, uint64_t))(v10[0] + 24))(v10, a1 + 48);
        (*(void (**)(_QWORD *))(v10[0] + 32))(v10);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t))(v8[0] + 24))(v8, a1 + 48);
        (*(void (**)(_QWORD *))(*v9 + 32))(v9);
        v9 = *(_QWORD **)(a1 + 72);
      }
      *(_QWORD *)(a1 + 72) = v3;
    }
    else if (v5 == v3)
    {
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 24))(a1 + 48, v8);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 72) + 32))(*(_QWORD *)(a1 + 72));
      *(_QWORD *)(a1 + 72) = v9;
      v9 = v8;
    }
    else
    {
      v9 = *(_QWORD **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v4;
    }
  }
  result = v9;
  if (v9 == v8)
  {
    v7 = 4;
    result = v8;
  }
  else
  {
    if (!v9)
      return result;
    v7 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
}

void sub_240193EDC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ClientSideAudioSwitchboard::startIOProc(ClientSideAudioSwitchboard *this)
{
  uint64_t started;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5[0] = &off_251076830;
  v5[1] = this;
  v6 = v5;
  started = ClientSideAudioSwitchboard::startIO((uint64_t)this, (uint64_t)v5);
  v2 = v6;
  if (v6 == v5)
  {
    v3 = 4;
    v2 = v5;
    goto LABEL_5;
  }
  if (v6)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return started;
}

void sub_240193F84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ClientSideAudioSwitchboard::startIOProcAtTime(ClientSideAudioSwitchboard *this, uint64_t a2)
{
  uint64_t started;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6[0] = &off_251076888;
  v6[1] = this;
  v6[2] = a2;
  v7 = v6;
  started = ClientSideAudioSwitchboard::startIO((uint64_t)this, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return started;
}

void sub_240194058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ClientSideAudioSwitchboard::stopIOProc(ClientSideAudioSwitchboard *this)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 10) + 8) + 64))(*(_QWORD *)(*((_QWORD *)this + 10)
                                                                                                  + 8));
  ClientSideAudioSwitchboardIOThread::stop(*((ClientSideAudioSwitchboardIOThread **)this + 11));
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 10) + 8) + 32))(*(_QWORD *)(*((_QWORD *)this + 10) + 8));
}

uint64_t ClientSideAudioSwitchboard::HandleServerDeath(ClientSideAudioSwitchboard *this)
{
  uint64_t v2;

  (*(void (**)(ClientSideAudioSwitchboard *))(*(_QWORD *)this + 56))(this);
  v2 = *((_QWORD *)this + 15);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
}

_QWORD *ClientSideAudioSwitchboard::SetServerDiedMessager(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(void)>::operator=((_QWORD *)(a1 + 96), a2);
}

void `non-virtual thunk to'ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard(ClientSideAudioSwitchboard *this)
{
  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard((ClientSideAudioSwitchboard *)((char *)this - 8));
}

{
  ClientSideAudioSwitchboard::~ClientSideAudioSwitchboard((ClientSideAudioSwitchboard *)((char *)this - 8));
  JUMPOUT(0x24267E4D8);
}

uint64_t `non-virtual thunk to'ClientSideAudioSwitchboard::HandleServerDeath(ClientSideAudioSwitchboard *this)
{
  return ClientSideAudioSwitchboard::HandleServerDeath((ClientSideAudioSwitchboard *)((char *)this - 8));
}

_QWORD *`non-virtual thunk to'ClientSideAudioSwitchboard::SetServerDiedMessager(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(void)>::operator=((_QWORD *)(a1 + 88), a2);
}

uint64_t *std::unique_ptr<ClientSideAudioSwitchboardIOThread>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    std::unique_ptr<caulk::mach::semaphore>::reset[abi:ne180100]((uint64_t *)(v1 + 72));
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v1 + 56);
    std::unique_ptr<IOThread>::reset[abi:ne180100]((uint64_t *)(v1 + 48), 0);
    v2 = *(_QWORD **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = 0;
    if (v2)
      std::default_delete<IOThreadWork>::operator()[abi:ne180100](v2);
    std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100]((_QWORD **)(v1 + 32), 0);
    v3 = *(_QWORD **)(v1 + 24);
    if (v3 == (_QWORD *)v1)
    {
      v4 = 4;
      v3 = (_QWORD *)v1;
    }
    else
    {
      if (!v3)
        goto LABEL_10;
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_10:
    JUMPOUT(0x24267E4D8);
  }
  return result;
}

uint64_t ClientSideAudioSwitchboard::startIO(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *size;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t *v28;
  unint64_t v29;
  std::string::size_type v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  NSObject *v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  __int128 v39;
  const std::string::value_type *v40;
  std::string::size_type v41;
  std::string *v42;
  __int128 v43;
  std::string *v44;
  __int128 v45;
  const std::string::value_type *v46;
  std::string::size_type v47;
  std::string *v48;
  __int128 v49;
  std::string *v50;
  __int128 v51;
  const std::string::value_type *v52;
  std::string::size_type v53;
  std::string *v54;
  __int128 v55;
  std::string *v56;
  __int128 v57;
  const std::string::value_type *v58;
  std::string::size_type v59;
  std::string *v60;
  __int128 v61;
  std::string *v62;
  __int128 v63;
  const std::string::value_type *v64;
  std::string::size_type v65;
  unsigned int v66;
  std::string *v67;
  NSObject *v68;
  std::string::size_type *p_size;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  std::string *v74;
  std::string::size_type v75;
  std::string *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  std::string::size_type *v80;
  uint64_t v81;
  std::string *v82;
  _QWORD *v83;
  std::string *v84;
  std::string *v85;
  std::string::size_type v86;
  std::string *data;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  std::string *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v106;
  int v107;
  int v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  _QWORD v111[3];
  _QWORD *v112;
  std::string v113;
  std::string *v114;
  std::string v115;
  std::string *v116;
  _BYTE buf[32];
  _BYTE *v118;
  std::string v119;
  std::string *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 80);
  v5 = atomic_load((unsigned __int8 *)(v4 + 24));
  if ((v5 & 1) != 0)
    RemoteAudioHardwareServer::connectToServer(*(RemoteAudioHardwareServer **)(a1 + 80));
  (*(void (**)(_BYTE *__return_ptr))(**(_QWORD **)(v4 + 8) + 24))(buf);
  v6 = *(_QWORD *)(a1 + 88);
  *(_OWORD *)&v119.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[8];
  v7 = operator new();
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_QWORD *)v7 = &off_251076400;
  std::allocate_shared[abi:ne180100]<caulk::mach::semaphore,std::allocator<caulk::mach::semaphore>,unsigned int const&,void>((uint64_t *)&v115);
  std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100](v7 + 8, (__int128 *)&v115);
  size = (std::__shared_weak_count *)v115.__r_.__value_.__l.__size_;
  if (v115.__r_.__value_.__l.__size_)
  {
    v9 = (unint64_t *)(v115.__r_.__value_.__l.__size_ + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  std::allocate_shared[abi:ne180100]<caulk::mach::semaphore,std::allocator<caulk::mach::semaphore>,unsigned int const&,void>((uint64_t *)&v115);
  std::shared_ptr<caulk::mach::semaphore>::operator=[abi:ne180100](v7 + 24, (__int128 *)&v115);
  v11 = (std::__shared_weak_count *)v115.__r_.__value_.__l.__size_;
  if (v115.__r_.__value_.__l.__size_)
  {
    v12 = (unint64_t *)(v115.__r_.__value_.__l.__size_ + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  *(_QWORD *)(v7 + 40) = &off_2510763E0;
  *(_OWORD *)(v7 + 48) = *(_OWORD *)&v119.__r_.__value_.__l.__data_;
  std::unique_ptr<ClientIOThreadResources>::reset[abi:ne180100]((_QWORD **)(v6 + 32), (_QWORD *)v7);
  v14 = *(_QWORD *)(v6 + 32);
  if (!**(_DWORD **)(v14 + 8) || !**(_DWORD **)(v14 + 24) || !*(_QWORD *)(v14 + 48))
  {
    v34 = 0;
    v16 = 0;
    goto LABEL_40;
  }
  v15 = *(_QWORD *)(v14 + 56);
  v16 = v15 != 0;
  if (!v15)
  {
    v34 = 0;
    goto LABEL_40;
  }
  (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(*(_QWORD *)(a1 + 80) + 8) + 40))(&v109);
  v17 = *(_QWORD *)(a1 + 88);
  v18 = v109;
  v19 = v110;
  if (v110)
  {
    p_shared_owners = (unint64_t *)&v110->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    v22 = (unint64_t *)&v19->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  v24 = *(std::__shared_weak_count **)(v17 + 64);
  *(_QWORD *)(v17 + 56) = v18;
  *(_QWORD *)(v17 + 64) = v19;
  if (v24)
  {
    v25 = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (!*(_QWORD *)(**(_QWORD **)(v17 + 56) + 8))
  {
    sIsolatedCoreAudioLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ClientSideAudioSwitchboardIOThread.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 52;
      _os_log_impl(&dword_240186000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboardIOThread::spawnIOThread - Provided workgroup is invalid!!!!", buf, 0x12u);
    }

  }
  if (v19)
  {
    v28 = (unint64_t *)&v19->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v30 = *(_QWORD *)(a1 + 88);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)&v113, a1 + 16);
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)v111, a1 + 48);
  v31 = (_QWORD *)(*(_QWORD *)(v30 + 40) + 32);
  *(_QWORD *)buf = &off_2510769E8;
  *(_QWORD *)&buf[8] = v30;
  *(_QWORD *)&buf[16] = 1024;
  *(_QWORD *)&buf[24] = buf;
  std::__function::__value_func<long long ()(void)>::swap[abi:ne180100](buf, v31);
  v32 = *(_QWORD **)&buf[24];
  if (*(_BYTE **)&buf[24] == buf)
  {
    v33 = 4;
    v32 = buf;
  }
  else
  {
    if (!*(_QWORD *)&buf[24])
      goto LABEL_119;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_119:
  v115.__r_.__value_.__r.__words[0] = v30;
  p_size = &v115.__r_.__value_.__l.__size_;
  v71 = (uint64_t)v114;
  if (!v114)
  {
LABEL_122:
    v116 = (std::string *)v71;
    goto LABEL_124;
  }
  if (v114 != &v113)
  {
    v71 = (*(uint64_t (**)(void))(v114->__r_.__value_.__r.__words[0] + 16))();
    goto LABEL_122;
  }
  v116 = (std::string *)&v115.__r_.__value_.__r.__words[1];
  (*(void (**)(std::string *, std::string::size_type *))(v113.__r_.__value_.__r.__words[0] + 24))(&v113, &v115.__r_.__value_.__l.__size_);
LABEL_124:
  v72 = *(_QWORD *)(v30 + 40);
  *(_QWORD *)buf = v115.__r_.__value_.__r.__words[0];
  v73 = &buf[8];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)&buf[8], (uint64_t)&v115.__r_.__value_.__l.__size_);
  v74 = (std::string *)operator new(0x30uLL);
  v75 = *(_QWORD *)buf;
  v74->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_251076A40;
  v74->__r_.__value_.__l.__size_ = v75;
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)&v74->__r_.__value_.__r.__words[2], (uint64_t)&buf[8]);
  v120 = v74;
  std::__function::__value_func<long long ()(void)>::swap[abi:ne180100](&v119, (_QWORD *)(v72 + 64));
  v76 = v120;
  if (v120 == &v119)
  {
    v77 = 4;
    v76 = &v119;
  }
  else
  {
    if (!v120)
      goto LABEL_129;
    v77 = 5;
  }
  (*(void (**)(void))(v76->__r_.__value_.__r.__words[0] + 8 * v77))();
LABEL_129:
  if (v118 == &buf[8])
  {
    v78 = 4;
  }
  else
  {
    if (!v118)
      goto LABEL_134;
    v78 = 5;
    v73 = v118;
  }
  (*(void (**)(_QWORD *))(*v73 + 8 * v78))(v73);
LABEL_134:
  if (v116 == (std::string *)&v115.__r_.__value_.__r.__words[1])
  {
    v79 = 4;
  }
  else
  {
    if (!v116)
      goto LABEL_139;
    v79 = 5;
    p_size = (std::string::size_type *)v116;
  }
  (*(void (**)(std::string::size_type *))(*p_size + 8 * v79))(p_size);
LABEL_139:
  v115.__r_.__value_.__r.__words[0] = v30;
  v80 = &v115.__r_.__value_.__l.__size_;
  v81 = (uint64_t)v112;
  if (!v112)
  {
LABEL_142:
    v116 = (std::string *)v81;
    goto LABEL_144;
  }
  if (v112 != v111)
  {
    v81 = (*(uint64_t (**)(void))(*v112 + 16))();
    goto LABEL_142;
  }
  v116 = (std::string *)&v115.__r_.__value_.__r.__words[1];
  (*(void (**)(_QWORD *, std::string::size_type *))(v111[0] + 24))(v111, &v115.__r_.__value_.__l.__size_);
LABEL_144:
  v82 = *(std::string **)(v30 + 40);
  *(_QWORD *)buf = v115.__r_.__value_.__r.__words[0];
  v83 = &buf[8];
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)&buf[8], (uint64_t)&v115.__r_.__value_.__l.__size_);
  v84 = (std::string *)operator new(0x30uLL);
  v85 = v82 + 4;
  v86 = *(_QWORD *)buf;
  v84->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_251076A98;
  v84->__r_.__value_.__l.__size_ = v86;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)&v84->__r_.__value_.__r.__words[2], (uint64_t)&buf[8]);
  v120 = v84;
  if (&v82[4] == &v119)
  {
    v88 = 5;
    goto LABEL_152;
  }
  data = (std::string *)v82[5].__r_.__value_.__l.__data_;
  if (data == v85)
  {
    v84 = &v119;
    (*(void (**)(std::string *, std::string *))(v85->__r_.__value_.__r.__words[0] + 24))(v82 + 4, &v119);
    (*(void (**)(std::string::size_type))(*(_QWORD *)v82[5].__r_.__value_.__l.__data_ + 32))(v82[5].__r_.__value_.__r.__words[0]);
    v82[5].__r_.__value_.__r.__words[0] = (std::string::size_type)v120;
    v120 = &v119;
    goto LABEL_151;
  }
  v120 = (std::string *)v82[5].__r_.__value_.__l.__data_;
  v82[5].__r_.__value_.__r.__words[0] = (std::string::size_type)v84;
  v84 = &v119;
  if (data == &v119)
  {
LABEL_151:
    v88 = 4;
    goto LABEL_152;
  }
  if (!data)
    goto LABEL_153;
  v88 = 5;
  v84 = data;
LABEL_152:
  (*(void (**)(std::string *))(v84->__r_.__value_.__r.__words[0] + 8 * v88))(v84);
LABEL_153:
  if (v118 == &buf[8])
  {
    v89 = 4;
  }
  else
  {
    if (!v118)
      goto LABEL_158;
    v89 = 5;
    v83 = v118;
  }
  (*(void (**)(_QWORD *))(*v83 + 8 * v89))(v83);
LABEL_158:
  if (v116 == (std::string *)&v115.__r_.__value_.__r.__words[1])
  {
    v90 = 4;
  }
  else
  {
    if (!v116)
      goto LABEL_163;
    v90 = 5;
    v80 = (std::string::size_type *)v116;
  }
  (*(void (**)(std::string::size_type *))(*v80 + 8 * v90))(v80);
LABEL_163:
  v91 = *(_QWORD *)(v30 + 40);
  v92 = operator new();
  IOThread::IOThread(v92, v91);
  std::unique_ptr<IOThread>::reset[abi:ne180100]((uint64_t *)(v30 + 48), v92);
  v93 = *(_QWORD *)(v30 + 48);
  v94 = v112;
  if (v112 == v111)
  {
    v95 = 4;
    v94 = v111;
  }
  else
  {
    if (!v112)
      goto LABEL_168;
    v95 = 5;
  }
  (*(void (**)(void))(*v94 + 8 * v95))();
LABEL_168:
  v96 = v114;
  if (v114 == &v113)
  {
    v97 = 4;
    v96 = &v113;
  }
  else
  {
    if (!v114)
      goto LABEL_173;
    v97 = 5;
  }
  (*(void (**)(void))(v96->__r_.__value_.__r.__words[0] + 8 * v97))();
LABEL_173:
  v98 = v110;
  if (v110)
  {
    v99 = (unint64_t *)&v110->__shared_owners_;
    do
      v100 = __ldaxr(v99);
    while (__stlxr(v100 - 1, v99));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
      std::__shared_weak_count::__release_weak(v98);
    }
  }
  v101 = *(_QWORD *)(a1 + 152);
  if (!v101)
    std::__throw_bad_function_call[abi:ne180100]();
  v102 = v93 != 0;
  v103 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v101 + 48))(v101);
  v34 = (v102 << 8) | v103;
  if ((v102 & v103) == 1)
  {
    v104 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 48);
    if (atomic_load((unsigned int *)v104))
    {
      atomic_store(1u, (unsigned __int8 *)(v104 + 4));
      if (!pthread_join(*(pthread_t *)(v104 + 8), 0))
      {
        *(_QWORD *)(v104 + 8) = 0;
        do
          __ldaxr((unsigned int *)v104);
        while (__stlxr(0, (unsigned int *)v104));
      }
    }
    if (!pthread_create((pthread_t *)(v104 + 8), 0, (void *(__cdecl *)(void *))IOThread::workloop, (void *)v104))
    {
      do
        __ldaxr((unsigned int *)v104);
      while (__stlxr(1u, (unsigned int *)v104));
    }
    v106 = *(_QWORD *)(a2 + 24);
    if (!v106)
      std::__throw_bad_function_call[abi:ne180100]();
    v107 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v106 + 48))(v106);
    v108 = v107 ? 0x10000 : 0;
    v34 |= v108;
    if (v107)
    {
      *(_QWORD *)buf = caulk::mach::semaphore::timed_wait_or_error(*(caulk::mach::semaphore **)(*(_QWORD *)(a1 + 88) + 72), 2.0);
      if ((*(_QWORD *)buf & 0xFF00000000) != 0)
      {
        caulk::expected<BOOL,int>::value((uint64_t)buf);
        if (buf[0])
          return 0;
      }
    }
  }
  v16 = 1;
LABEL_40:
  v35 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    std::string::basic_string[abi:ne180100]<0>(&v113, (char *)&unk_240199DE6);
    std::to_string(&v119, v16);
    v36 = std::string::insert(&v119, 0, "hasValidResources: ");
    v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    v115.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    v38 = std::string::append(&v115, " ");
    v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v38->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v40 = buf;
    else
      v40 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v41 = buf[23];
    else
      v41 = *(_QWORD *)&buf[8];
    std::string::append(&v113, v40, v41);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v115.__r_.__value_.__l.__data_);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    std::to_string(&v119, v34);
    v42 = std::string::insert(&v119, 0, "clientPrerequisitesMet: ");
    v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
    v115.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v43;
    v42->__r_.__value_.__l.__size_ = 0;
    v42->__r_.__value_.__r.__words[2] = 0;
    v42->__r_.__value_.__r.__words[0] = 0;
    v44 = std::string::append(&v115, " ");
    v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v44->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v45;
    v44->__r_.__value_.__l.__size_ = 0;
    v44->__r_.__value_.__r.__words[2] = 0;
    v44->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v46 = buf;
    else
      v46 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v47 = buf[23];
    else
      v47 = *(_QWORD *)&buf[8];
    std::string::append(&v113, v46, v47);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v115.__r_.__value_.__l.__data_);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    std::to_string(&v119, BYTE1(v34));
    v48 = std::string::insert(&v119, 0, "hasValidLocalIOThread: ");
    v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
    v115.__r_.__value_.__r.__words[2] = v48->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v49;
    v48->__r_.__value_.__l.__size_ = 0;
    v48->__r_.__value_.__r.__words[2] = 0;
    v48->__r_.__value_.__r.__words[0] = 0;
    v50 = std::string::append(&v115, " ");
    v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v50->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v51;
    v50->__r_.__value_.__l.__size_ = 0;
    v50->__r_.__value_.__r.__words[2] = 0;
    v50->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v52 = buf;
    else
      v52 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v53 = buf[23];
    else
      v53 = *(_QWORD *)&buf[8];
    std::string::append(&v113, v52, v53);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v115.__r_.__value_.__l.__data_);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    std::to_string(&v119, BYTE2(v34));
    v54 = std::string::insert(&v119, 0, "serverThreadStarted: ");
    v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
    v115.__r_.__value_.__r.__words[2] = v54->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v55;
    v54->__r_.__value_.__l.__size_ = 0;
    v54->__r_.__value_.__r.__words[2] = 0;
    v54->__r_.__value_.__r.__words[0] = 0;
    v56 = std::string::append(&v115, " ");
    v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v56->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v57;
    v56->__r_.__value_.__l.__size_ = 0;
    v56->__r_.__value_.__r.__words[2] = 0;
    v56->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v58 = buf;
    else
      v58 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v59 = buf[23];
    else
      v59 = *(_QWORD *)&buf[8];
    std::string::append(&v113, v58, v59);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v115.__r_.__value_.__l.__data_);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    std::to_string(&v119, HIBYTE(v34));
    v60 = std::string::insert(&v119, 0, "receivedPingFromLocalClientThread: ");
    v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
    v115.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v61;
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    v62 = std::string::append(&v115, " ");
    v63 = *(_OWORD *)&v62->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v62->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v63;
    v62->__r_.__value_.__l.__size_ = 0;
    v62->__r_.__value_.__r.__words[2] = 0;
    v62->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v64 = buf;
    else
      v64 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v65 = buf[23];
    else
      v65 = *(_QWORD *)&buf[8];
    std::string::append(&v113, v64, v65);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v115.__r_.__value_.__l.__data_);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    v66 = HIWORD(v34);
    v67 = &v113;
    if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v67 = (std::string *)v113.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "ClientSideAudioSwitchboard.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 147;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v67;
    _os_log_impl(&dword_240186000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::startIOProc Failed! Start Conditions: %s", buf, 0x1Cu);
    if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v113.__r_.__value_.__l.__data_);
  }
  else
  {
    v66 = HIWORD(v34);
  }
  if ((_BYTE)v66)
    (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 80) + 8) + 64))(*(_QWORD *)(*(_QWORD *)(a1 + 80)
                                                                                                  + 8));
  if ((v34 & 0xFF00) != 0)
    ClientSideAudioSwitchboardIOThread::stop(*(ClientSideAudioSwitchboardIOThread **)(a1 + 88));
  if (v16)
    (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 80) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 80)
                                                                                                  + 8));
  if (!HIBYTE(v34))
  {
    v68 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ClientSideAudioSwitchboard.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 169;
      _os_log_impl(&dword_240186000, v68, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::handleErrorConditions Failed to receive ping from local client thread", buf, 0x12u);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_240195028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

__n128 std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_251076888;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_251076888;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 80) + 8);
  return (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 56))(v2, v1) == 0;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboard17startIOProcAtTimeEyE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProcAtTime(unsigned long long)::$_0>,BOOL ()(void)>::target_type()
{
}

void std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251076830;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251076830;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 80) + 8);
  return (*(unsigned int (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1) == 0;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboard11startIOProcEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboard::startIOProc(void)::$_0,std::allocator<ClientSideAudioSwitchboard::startIOProc(void)::$_0>,BOOL ()(void)>::target_type()
{
}

void ServerDeathMessage(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315394;
    v2 = "ClientSideAudioSwitchboard.cpp";
    v3 = 1024;
    v4 = 17;
    _os_log_impl(&dword_240186000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::ServerDeathMessage - server disappeared!", (uint8_t *)&v1, 0x12u);
  }
}

void defaultIOThreadExitHandler(void)
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315394;
    v2 = "ClientSideAudioSwitchboard.cpp";
    v3 = 1024;
    v4 = 23;
    _os_log_impl(&dword_240186000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ClientSideAudioSwitchboard::defaultIOThreadExitHandler - Local IO Thread has exited.", (uint8_t *)&v1, 0x12u);
  }
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_251075A80;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251075A80;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::operator()()
{
  return 1;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboardC1ENSt3__18functionIFvvEEENS0_10unique_ptrI25RemoteAudioHardwareServerNS0_14default_deleteIS5_EEEEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_1>,BOOL ()(void)>::target_type()
{
}

void std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251076570;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251076570;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x8000000240199293))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target_type()
{
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(int)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_2510768E0;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_2510768E0;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboardC1ENSt3__18functionIFvvEEENS0_10unique_ptrI25RemoteAudioHardwareServerNS0_14default_deleteIS5_EEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::function<void ()(void)>,std::unique_ptr<RemoteAudioHardwareServer>)::$_0>,void ()(int)>::target_type()
{
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0>,void ()(int)>::~__func()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0>,void ()(int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_251075A28;
  return result;
}

void std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0>,void ()(int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251075A28;
}

uint64_t std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ClientSideAudioSwitchboardC1ENSt3__110shared_ptrI18ConnectionToServerEENS0_8functionIFbvEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0,std::allocator<ClientSideAudioSwitchboard::ClientSideAudioSwitchboard(std::shared_ptr<ConnectionToServer>,std::function<BOOL ()(void)>)::$_0>,void ()(int)>::target_type()
{
}

void ServerSideAudioSwitchboard::GetClientForIO(ServerSideAudioSwitchboard *this, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  unint64_t v7;
  uint8x8_t v8;
  NSObject *v9;
  char v10;
  void **v11;
  _QWORD *v12;
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
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  _BYTE v27[18];
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((_QWORD *)a2, a3))
  {
    v9 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315650;
      *(_QWORD *)&v27[4] = "ServerSideAudioSwitchboard.cpp";
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 115;
      v28 = 1024;
      v29 = a3;
      _os_log_impl(&dword_240186000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::GetClientForIO - No client exists for %u!", v27, 0x18u);
    }
    v10 = 0;
    *(_BYTE *)this = 0;
    goto LABEL_48;
  }
  v7 = *(_QWORD *)(a2 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a3;
      if (v7 <= a3)
        v3 = a3 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & a3;
    }
    v11 = *(void ***)(*(_QWORD *)a2 + 8 * v3);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == a3)
          {
            if (*((_DWORD *)v12 + 4) == a3)
              goto LABEL_44;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v13 >= v7)
                v13 %= v7;
            }
            else
            {
              v13 &= v7 - 1;
            }
            if (v13 != v3)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v14 = (_QWORD *)(a2 + 16);
  v12 = operator new(0x28uLL);
  *(_QWORD *)v27 = v12;
  *(_QWORD *)&v27[8] = a2 + 16;
  *v12 = 0;
  v12[1] = a3;
  *((_DWORD *)v12 + 4) = a3;
  v12[3] = 0;
  v12[4] = 0;
  v27[16] = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a2 + 24) + 1);
  v16 = *(float *)(a2 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>>>::__rehash<true>(a2, v20);
    v7 = *(_QWORD *)(a2 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a3)
        v3 = a3 % v7;
      else
        v3 = a3;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & a3;
    }
  }
  v21 = *(_QWORD *)a2;
  v22 = *(_QWORD **)(*(_QWORD *)a2 + 8 * v3);
  if (v22)
  {
    *v12 = *v22;
  }
  else
  {
    *v12 = *v14;
    *v14 = v12;
    *(_QWORD *)(v21 + 8 * v3) = v14;
    if (!*v12)
      goto LABEL_43;
    v23 = *(_QWORD *)(*v12 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7)
        v23 %= v7;
    }
    else
    {
      v23 &= v7 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a2 + 8 * v23);
  }
  *v22 = v12;
LABEL_43:
  *(_QWORD *)v27 = 0;
  ++*(_QWORD *)(a2 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100]((uint64_t)v27);
LABEL_44:
  *(_QWORD *)this = v12[3];
  v24 = v12[4];
  *((_QWORD *)this + 1) = v24;
  if (v24)
  {
    v25 = (unint64_t *)(v24 + 8);
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  v10 = 1;
LABEL_48:
  *((_BYTE *)this + 16) = v10;
}

void sub_240195B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

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
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

_QWORD *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_251076990;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 3));
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_251076990;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 3));
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x24267E4D8);
}

_QWORD *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::__clone(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  result = operator new(0x28uLL);
  v4 = a1[1];
  v3 = a1[2];
  *result = &off_251076990;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a1[4];
  result[3] = a1[3];
  result[4] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return result;
}

_QWORD *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::__clone(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v3 = result[1];
  v2 = result[2];
  *a2 = &off_251076990;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = result[4];
  a2[3] = result[3];
  a2[4] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

uint64_t std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 24);
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v1);
}

void std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::destroy_deallocate(void *a1)
{
  uint64_t v2;

  v2 = (uint64_t)a1 + 8;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 24);
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v2);
  operator delete(a1);
}

uint64_t *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::operator()(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v1 = a1[1];
  v2 = a1[2];
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a1[3];
  v6 = a1[4];
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = (_QWORD *)operator new();
  *v9 = v1;
  v9[1] = v2;
  v9[2] = v5;
  v9[3] = v6;
  v11 = 0;
  dispatch_async_f(MEMORY[0x24BDAC9B8], v9, (dispatch_function_t)applesauce::dispatch::v1::async<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>(dispatch_queue_s *,ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke);
  return std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v11);
}

uint64_t std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN26ServerSideAudioSwitchboard16addClientUseCaseEjE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0,std::allocator<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0>,void ()(void)>::target_type()
{
}

uint64_t *applesauce::dispatch::v1::async<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1}>(dispatch_queue_s *,ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v11 = a1;
  v2 = a1[2];
  v4 = *a1;
  v3 = (std::__shared_weak_count *)a1[1];
  v12 = v4;
  v13 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 64))(v2, &v12);
  v7 = v13;
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100]((uint64_t *)&v11);
}

void sub_240196124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;

  v13 = a12;
  if (a12)
  {
    p_shared_owners = (unint64_t *)&a12->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1},std::default_delete<ServerSideAudioSwitchboard::addClientUseCase(unsigned int)::$_0::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v2 + 16);
    v3 = std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v2);
    MEMORY[0x24267E4D8](v3, 0x20C40DC1BFBCFLL);
  }
  return a1;
}

void std::__shared_ptr_emplace<ServerSideUniqueClient>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076C30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ServerSideUniqueClient>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076C30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<ServerSideUniqueClient>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 56);
  v3 = *(_QWORD **)(a1 + 80);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 40);
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 24);
}

void _ZNSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEED0Ev()
{
  JUMPOUT(0x24267E4D8);
}

_QWORD *_ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_251076518;
  return result;
}

void _ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE7__cloneEPNS0_6__baseIS6_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251076518;
}

uint64_t _ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"N22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_E"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_ENS_9allocatorIS3_EEFvvEE11target_typeEv()
{
  return &_ZTIN22ServerSideUniqueClient24mSemaphoreTimeoutHandlerMUlvE_E;
}

void std::__shared_ptr_emplace<ServerIOThreadResources>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251076C68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ServerIOThreadResources>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251076C68;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24267E4D8);
}

uint64_t std::__shared_ptr_emplace<ServerIOThreadResources>::__on_zero_shared(uint64_t a1)
{
  IOThreadServerMappedMemory::~IOThreadServerMappedMemory((IOThreadServerMappedMemory *)(a1 + 64));
  *(_QWORD *)(a1 + 24) = &off_251076290;
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 48);
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 32);
}

uint64_t ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0::~$_0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)(a1 + 40);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1);
}

_QWORD *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_251076728;
  v2 = a1 + 3;
  v3 = (_QWORD *)a1[6];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_251076728;
  v2 = a1 + 3;
  v3 = (_QWORD *)a1[6];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
    {
LABEL_6:
      std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
      JUMPOUT(0x24267E4D8);
    }
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
  goto LABEL_6;
}

_QWORD *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)(a1 + 8);
  v2 = operator new(0x38uLL);
  *v2 = &off_251076728;
  std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(v2 + 1, v1);
  return v2;
}

void sub_2401964E4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_251076728;
  return std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(a2 + 1, (_QWORD *)(a1 + 8));
}

uint64_t std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 24);
  v3 = *(_QWORD **)(a1 + 48);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::destroy_deallocate(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1 + 3;
  v3 = (_QWORD *)a1[6];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

uint64_t std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::operator()(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v3 + 56) >= 0x10uLL)
  {
    *(_OWORD *)*(_QWORD *)(v3 + 48) = *a2;
    v3 = *(_QWORD *)(a1 + 8);
  }
  result = IOThreadSynchronizer::signalAndWait(*(IOThreadSynchronizer **)(v3 + 8), 10.0, *(caulk::mach::semaphore **)(v3 + 24));
  if ((_DWORD)result == 49)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (!v5)
      std::__throw_bad_function_call[abi:ne180100]();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
  }
  return result;
}

uint64_t std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN22ServerSideUniqueClient25GetClientFacingIOCallbackEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,std::allocator<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0>,void ()(CoreAudioTimestamp)>::target_type()
{
}

_QWORD *std::__compressed_pair_elem<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<ServerSideUniqueClient::GetClientFacingIOCallback(void)::$_0 const&,0ul>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_2401966C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

OSStatus AudioDeviceCreateIOProcID(AudioObjectID inDevice, AudioDeviceIOProc inProc, void *inClientData, AudioDeviceIOProcID *outIOProcID)
{
  return MEMORY[0x24BDBAEF0](*(_QWORD *)&inDevice, inProc, inClientData, outIOProcID);
}

OSStatus AudioDeviceDestroyIOProcID(AudioObjectID inDevice, AudioDeviceIOProcID inIOProcID)
{
  return MEMORY[0x24BDBAEF8](*(_QWORD *)&inDevice, inIOProcID);
}

OSStatus AudioDeviceStart(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x24BDBAF00](*(_QWORD *)&inDevice, inProcID);
}

OSStatus AudioDeviceStartAtTime(AudioObjectID inDevice, AudioDeviceIOProcID inProcID, AudioTimeStamp *ioRequestedStartTime, UInt32 inFlags)
{
  return MEMORY[0x24BDBAF08](*(_QWORD *)&inDevice, inProcID, ioRequestedStartTime, *(_QWORD *)&inFlags);
}

OSStatus AudioDeviceStop(AudioObjectID inDevice, AudioDeviceIOProcID inProcID)
{
  return MEMORY[0x24BDBAF10](*(_QWORD *)&inDevice, inProcID);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t caulk::mach::os_workgroup_managed::join(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x24BEC6E30](this);
}

uint64_t caulk::mach::os_workgroup_managed::leave(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x24BEC6E40](this);
}

void caulk::mach::os_workgroup_managed::~os_workgroup_managed(caulk::mach::os_workgroup_managed *this)
{
  MEMORY[0x24BEC6E48](this);
}

uint64_t caulk::mach::os_workgroup_interval_managed::make()
{
  return MEMORY[0x24BEC6E50]();
}

void caulk::mach::os_workgroup_interval_managed::~os_workgroup_interval_managed(caulk::mach::os_workgroup_interval_managed *this)
{
  MEMORY[0x24BEC6E58](this);
}

uint64_t caulk::mach::details::retain_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x24BEC6E60](this, a2);
}

uint64_t caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x24BEC6E68](this, a2);
}

uint64_t caulk::mach::semaphore::timed_wait_or_error(caulk::mach::semaphore *this, double a2)
{
  return MEMORY[0x24BEC6E70](this, a2);
}

uint64_t caulk::mach::semaphore::timed_wait_signal_or_error(caulk::mach::semaphore *this, caulk::mach::semaphore *a2, double a3)
{
  return MEMORY[0x24BEC6E78](this, a2, a3);
}

uint64_t caulk::mach::semaphore::signal(caulk::mach::semaphore *this)
{
  return MEMORY[0x24BEC6E80](this);
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x24BEC6E88](this);
}

{
  return MEMORY[0x24BEC6E90](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
  MEMORY[0x24BEC6E98](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x24BEDAA88](this);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x24BEDB038](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x24BEDB040](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x24BEDB198]();
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

void std::thread::join(std::thread *this)
{
  MEMORY[0x24BEDB468](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x24BEDB478](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
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
  off_2510754D0(__p);
}

uint64_t operator delete()
{
  return off_2510754D8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2510754E0(__sz);
}

uint64_t operator new()
{
  return off_2510754E8();
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

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int os_workgroup_copy_port(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return MEMORY[0x24BDAF518](wg, mach_port_out);
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x24BDAF528](name, *(_QWORD *)&mach_port);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x24BEB6F68]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x24BEB6F80]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x24BEB6F88]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x24BEB6F98]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x24BEB6FA8]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x24BEB6FC0]();
}

uint64_t tb_endpoint_destruct()
{
  return MEMORY[0x24BEB6FC8]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x24BEB6FD8]();
}

uint64_t tb_message_decode_BOOL()
{
  return MEMORY[0x24BEB6FF0]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x24BEB7098]();
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x24BDB0220](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x24BDB0A90]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0B60](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

