void IOAccelInitCommPage()
{
  if (__globalCommPageInit != -1)
    dispatch_once(&__globalCommPageInit, &__block_literal_global_2);
}

uint64_t *IOAccelMemoryInfoRegisterAPICollectionBlock(const void *a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;

  if (notify_once != -1)
    dispatch_once(&notify_once, &__block_literal_global_4);
  pthread_mutex_lock(&ioaccel_collection_block_mutex);
  v2 = 0;
  while (1)
  {
    if ((const void *)ioaccel_collection_blocks_orig[v2] == a1)
    {
      v3 = &ioaccel_collection_blocks[v2];
      goto LABEL_10;
    }
    if (!ioaccel_collection_blocks[v2])
      break;
    if (++v2 == 16)
    {
      v3 = 0;
      goto LABEL_10;
    }
  }
  ioaccel_collection_blocks_orig[v2] = (uint64_t)a1;
  v4 = _Block_copy(a1);
  v3 = &ioaccel_collection_blocks[v2];
  ioaccel_collection_blocks[v2] = (uint64_t)v4;
LABEL_10:
  pthread_mutex_unlock(&ioaccel_collection_block_mutex);
  return v3;
}

uint64_t IOAccelDeviceGetTypeID()
{
  if (IOAccelDeviceGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelDeviceGetTypeID_onceToken, &__block_literal_global);
  return kIOAccelDeviceID;
}

uint64_t IOAccelDeviceCreate(io_service_t a1)
{
  return IOAccelDeviceCreateWithAPIProperty(a1, 0);
}

uint64_t IOAccelDeviceCreateWithAPIProperty(io_service_t a1, const char *a2)
{
  kern_return_t v4;
  int v5;
  mach_port_t v6;
  uint64_t Instance;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  size_t v14;
  size_t outputStruct;
  uint64_t v16;
  uint64_t v17;
  size_t outputStructCnt;
  io_connect_t connect;
  char __dst[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  connect = 0;
  v4 = IOServiceOpen(a1, *MEMORY[0x1E0C83DA0], 1u, &connect);
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      IOAccelDeviceCreateWithAPIProperty_cold_1(v5);
    return 0;
  }
  if (a2)
  {
    strncpy(__dst, a2, 0x10uLL);
    IOConnectCallStructMethod(connect, 7u, __dst, 0x10uLL, 0, 0);
  }
  v6 = connect;
  if (IOAccelDeviceGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelDeviceGetTypeID_onceToken, &__block_literal_global);
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (!Instance)
    return v8;
  *(_DWORD *)(Instance + 16) = a1;
  *(_DWORD *)(Instance + 20) = v6;
  v24 = 0u;
  memset(v25, 0, 432);
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)__dst = 0u;
  v21 = 0u;
  outputStructCnt = 600;
  if (IOConnectCallStructMethod(v6, 2u, 0, 0, __dst, &outputStructCnt))
  {
LABEL_20:
    CFRelease((CFTypeRef)v8);
    return 0;
  }
  *(_QWORD *)(v8 + 32) = *(_QWORD *)__dst;
  v9 = DWORD1(v21);
  *(_DWORD *)(v8 + 48) = DWORD1(v21);
  if ((int)v9 < 2)
  {
    *(_QWORD *)(v8 + 40) = v8 + 32;
    goto LABEL_16;
  }
  *(_QWORD *)(v8 + 40) = malloc_type_malloc(8 * v9, 0x10040436913F5uLL);
  v9 = *(unsigned int *)(v8 + 48);
  if ((int)v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
      *(_QWORD *)(*(_QWORD *)(v8 + 40) + 8 * i) = *((unsigned int *)v25 + i + 2) + *(_QWORD *)(v8 + 32);
LABEL_16:
    if ((int)v9 >= 1)
    {
      v11 = 0;
      v12 = *(_QWORD *)(v8 + 40);
      do
      {
        *(_DWORD *)(v8 + 68 + 4 * v11) = **(_DWORD **)(v12 + 8 * v11);
        ++v11;
      }
      while (v11 < (int)v9);
    }
  }
  *(_QWORD *)(v8 + 52) = *(_QWORD *)&__dst[8];
  *(_DWORD *)(v8 + 60) = v21;
  *(_QWORD *)(v8 + 24) = IOAccelDeviceTestEventFast;
  outputStruct = 64;
  if (IOConnectCallStructMethod(*(_DWORD *)(v8 + 20), 0, 0, 0, (void *)(v8 + 624), &outputStruct))
    goto LABEL_20;
  outputStruct = 0;
  v16 = 0;
  v17 = 0;
  v14 = 24;
  if (!IOConnectCallStructMethod(*(_DWORD *)(v8 + 20), 5u, 0, 0, &outputStruct, &v14))
  {
    *(_QWORD *)(v8 + 584) = outputStruct;
    if (v17 >= 4)
      *(_QWORD *)(v8 + 592) = v16;
  }
  if (__globalCommPageInit != -1)
    dispatch_once(&__globalCommPageInit, &__block_literal_global_2);
  *(_QWORD *)(v8 + 616) = 0;
  *(_OWORD *)(v8 + 600) = 0u;
  return v8;
}

void IOAccelDeviceRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t IOAccelDeviceTestEvent(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t IOAccelDeviceGetConfig(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6;

  v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOAccelDeviceID)
  {
    v6 = 0;
    *a2 = *(_DWORD *)(a1 + 624);
    *a3 = *(_DWORD *)(a1 + 628);
    *a4 = *(_QWORD *)(a1 + 632);
    *a5 = *(_QWORD *)(a1 + 640);
    *a6 = *(_DWORD *)(a1 + 648);
  }
  return v6;
}

uint64_t IOAccelDeviceGetConfig64(uint64_t a1, _DWORD *a2, _DWORD *a3, _QWORD *a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t v6;

  v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOAccelDeviceID)
  {
    v6 = 0;
    *a2 = *(_DWORD *)(a1 + 624);
    *a3 = *(_DWORD *)(a1 + 628);
    *a4 = *(_QWORD *)(a1 + 632);
    *a5 = *(_QWORD *)(a1 + 640);
    *a6 = *(_DWORD *)(a1 + 648);
  }
  return v6;
}

uint64_t IOAccelDeviceGetSharedMemorySize(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOAccelDeviceID)
  {
    v2 = 0;
    *a2 = a1[82];
  }
  return v2;
}

uint64_t IOAccelDeviceGetMaxResourceSize(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOAccelDeviceID)
  {
    v2 = 0;
    *a2 = a1[83];
  }
  return v2;
}

unsigned int *IOAccelDeviceGetConnect(unsigned int *result)
{
  unsigned int *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOAccelDeviceID)
      return (unsigned int *)v1[5];
    else
      return 0;
  }
  return result;
}

uint64_t IOAccelDeviceGetName(mach_port_t *a1, char *a2, size_t a3)
{
  uint64_t v3;
  size_t v8;
  char outputStruct[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = 3758097090;
  v8 = 64;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOAccelDeviceID)
    {
      v3 = IOConnectCallStructMethod(a1[5], 1u, 0, 0, outputStruct, &v8);
      if (!(_DWORD)v3)
        strncpy(a2, outputStruct, a3);
    }
  }
  return v3;
}

unint64_t IOAccelDeviceGetNextGlobalTraceID(uint64_t a1)
{
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  size_t outputStructCnt;
  uint64_t outputStruct;
  uint64_t v12;

  v2 = (unint64_t *)(a1 + 616);
LABEL_2:
  v3 = *(_QWORD *)(a1 + 616);
  v4 = *(_QWORD *)(a1 + 608);
  do
  {
    v5 = __ldaxr(v2);
    if (v5 != v4)
    {
      __clrex();
      *(_QWORD *)(a1 + 608) = v5;
      while (!*v2)
        ;
      goto LABEL_14;
    }
  }
  while (__stlxr(0, v2));
  outputStructCnt = 16;
  outputStruct = 0;
  v12 = 0;
  if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, &outputStruct, &outputStructCnt))
  {
    *(_QWORD *)(a1 + 600) = 1;
    v6 = 0x100000000;
    v7 = 1;
  }
  else
  {
    v7 = outputStruct;
    if (!outputStruct)
      IOAccelDeviceGetNextGlobalTraceID_cold_1();
    *(_QWORD *)(a1 + 600) = outputStruct;
    v6 = v12;
  }
  *(_QWORD *)(a1 + 608) = v6;
  *(_QWORD *)(a1 + 616) = v7;
LABEL_14:
  result = v3 + 1;
  do
  {
    v9 = __ldaxr(v2);
    if (v9 != v3)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(result, v2));
  return result;
}

uint64_t IOAccelDeviceTraceEvent()
{
  return kdebug_trace();
}

uint64_t IOAccelDeviceTraceObjectLabel()
{
  uint64_t v0;

  v0 = kdebug_trace_string();
  kdebug_trace();
  return v0;
}

uint64_t IOAccelDeviceGetCurrentTraceFilter(mach_port_t *a1)
{
  uint64_t v1;
  size_t v4;
  uint64_t outputStruct;

  v1 = 3758097090;
  v4 = 8;
  if (a1 && CFGetTypeID(a1) == kIOAccelDeviceID)
  {
    outputStruct = 0;
    return IOConnectCallMethod(a1[5], 4u, 0, 0, 0, 0, 0, 0, &outputStruct, &v4);
  }
  return v1;
}

uint64_t IOAccelDeviceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 584);
}

uint64_t ioAccelDeviceFinalize(uint64_t a1)
{
  void *v2;
  BOOL v3;
  uint64_t result;

  v2 = *(void **)(a1 + 40);
  if (v2)
    v3 = v2 == (void *)(a1 + 32);
  else
    v3 = 1;
  if (!v3)
    free(v2);
  result = IOConnectRelease(*(_DWORD *)(a1 + 20));
  *(_DWORD *)(a1 + 20) = 0;
  return result;
}

CFStringRef ioAccelDeviceCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[5];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOAccelDevice %p connect=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioAccelDeviceCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[5];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOAccelDevice %p connect=%08x refcnt=%d>"), a1, v2, v3);
}

uint64_t IOAccelSharedGetTypeID()
{
  if (IOAccelSharedGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelSharedGetTypeID_onceToken, &__block_literal_global_0);
  return kIOAccelSharedID;
}

uint64_t IOAccelSharedCreate(uint64_t a1)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t Instance;
  kern_return_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v9;
  uint64_t outputStruct;
  uint64_t v11;
  io_connect_t connect;

  connect = 0;
  if (IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x1E0C83DA0], 2u, &connect))
    return 0;
  v3 = connect;
  if (IOAccelSharedGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelSharedGetTypeID_onceToken, &__block_literal_global_0);
  Instance = _CFRuntimeCreateInstance();
  v2 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 84) = 0;
    *(_QWORD *)(Instance + 16) = a1;
    *(_DWORD *)(Instance + 24) = v3;
    *(_QWORD *)(Instance + 32) = 0;
    *(_DWORD *)(Instance + 48) = 0;
    outputStruct = 0;
    v11 = 0;
    v9 = 16;
    v5 = IOConnectCallStructMethod(v3, 7u, 0, 0, &outputStruct, &v9);
    v6 = outputStruct;
    v7 = v11;
    if (v5)
    {
      v6 = 0;
      v7 = 0;
    }
    *(_QWORD *)(v2 + 40) = v6;
    *(_QWORD *)(v2 + 96) = v7;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 84));
    *(_QWORD *)(v2 + 88) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 84));
  }
  return v2;
}

void *IOAccelSharedSetWaitForGPUCallback(uint64_t a1, void *aBlock)
{
  void *result;

  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void IOAccelSharedRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

unsigned int *IOAccelSharedGetConnect(unsigned int *result)
{
  unsigned int *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOAccelSharedID)
      return (unsigned int *)v1[6];
    else
      return 0;
  }
  return result;
}

uint64_t IOAccelSharedCreateDeviceShmem(uint64_t a1, unsigned int a2, _QWORD *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v9;
  int v10;
  void (*v11)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD);
  _QWORD *v12;
  _QWORD *v13;
  size_t v15;
  uint64_t outputStruct;
  uint64_t v17;
  uint64_t input;

  v17 = 0;
  input = a2;
  v15 = 16;
  outputStruct = 0;
  v9 = IOConnectCallMethod(*(_DWORD *)(a1 + 24), 5u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v15);
  if ((_DWORD)v9)
  {
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
  }
  else
  {
    *a3 = outputStruct;
    v10 = HIDWORD(v17);
    *a4 = v17;
    *a5 = v10;
    v11 = (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))*MEMORY[0x1E0C80C60];
    if (*MEMORY[0x1E0C80C60])
    {
      v12 = malloc_type_malloc(0x18uLL, 0x10200403ED2C137uLL);
      if (v12)
      {
        v13 = v12;
        *v12 = outputStruct;
        v12[1] = v17;
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 84));
        v13[2] = *(_QWORD *)(a1 + 88);
        *(_QWORD *)(a1 + 88) = v13;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 84));
        v11(1677721616, *MEMORY[0x1E0C83DA0], v17, 0, outputStruct, 0);
      }
    }
  }
  return v9;
}

uint64_t IOAccelSharedDestroyDeviceShmem(uint64_t a1, unsigned int a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t input;

  input = a2;
  v4 = (os_unfair_lock_s *)(a1 + 84);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 84));
  v6 = (_QWORD *)(a1 + 88);
  v5 = *(_QWORD **)(a1 + 88);
  if (v5)
  {
    v7 = *(_QWORD **)(a1 + 88);
    while (*((_DWORD *)v7 + 3) != a2)
    {
      v7 = (_QWORD *)v7[2];
      if (!v7)
        goto LABEL_12;
    }
    if (*MEMORY[0x1E0C80C60])
    {
      ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(1677721632, *MEMORY[0x1E0C83DA0], *v7, *((unsigned int *)v7 + 2), 0, 0);
      v5 = (_QWORD *)*v6;
    }
    if (v5 != v7)
    {
      do
      {
        v8 = v5;
        v5 = (_QWORD *)v5[2];
      }
      while (v5 != v7);
      v6 = v8 + 2;
    }
    *v6 = v7[2];
    free(v7);
  }
LABEL_12:
  os_unfair_lock_unlock(v4);
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 24), 6u, &input, 1u, 0, 0);
}

uint64_t IOAccelSharedGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t IOAccelSharedAllocateFenceMemory(uint64_t a1, uint64_t a2)
{
  size_t outputStructCnt;
  uint64_t outputStruct;
  uint64_t inputStruct;

  inputStruct = a2;
  outputStructCnt = 8;
  outputStruct = 0;
  if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 8u, &inputStruct, 8uLL, &outputStruct, &outputStructCnt))
    return 0;
  else
    return outputStruct;
}

uint64_t IOAccelSharedGetMemoryData(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t result;
  size_t outputStructCnt;
  __int128 outputStruct;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  outputStruct = 0u;
  outputStructCnt = 48;
  result = IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 0xBu, 0, 0, &outputStruct, &outputStructCnt);
  if (!(_DWORD)result)
  {
    if (a2)
      *a2 = outputStruct;
    if (a3)
      *a3 = *((_QWORD *)&outputStruct + 1);
    if (a4)
      *a4 = v16;
    if (a5)
      *a5 = *((_QWORD *)&v16 + 1);
    if (a6)
      *a6 = v17;
    if (a7)
      *a7 = *((_QWORD *)&v17 + 1);
  }
  return result;
}

uint64_t IOAccelSharedGetAllocatedSize(uint64_t a1, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  size_t v6;
  uint64_t outputStruct;

  v3 = *(uint64_t **)(a1 + 96);
  if (v3)
  {
    result = 0;
    if (!a2)
      return result;
    v5 = *v3;
    goto LABEL_7;
  }
  v6 = 8;
  outputStruct = 0;
  result = IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 0xDu, 0, 0, &outputStruct, &v6);
  if (a2 && !(_DWORD)result)
  {
    v5 = outputStruct;
LABEL_7:
    *a2 = v5;
  }
  return result;
}

uint64_t IOAccelSharedSetResourcesPurgeable()
{
  return 3758097095;
}

void ioAccelSharedFinalize(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void (**v6)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  _Block_release(*(const void **)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  IOConnectRelease(*(_DWORD *)(a1 + 24));
  *(_DWORD *)(a1 + 24) = 0;
  v2 = (os_unfair_lock_s *)(a1 + 84);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 84));
  v5 = *(_QWORD **)(a1 + 88);
  v3 = (_QWORD *)(a1 + 88);
  v4 = v5;
  if (v5)
  {
    v6 = (void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0C80C60];
    v7 = (unsigned int *)MEMORY[0x1E0C83DA0];
    do
    {
      v8 = (_QWORD *)v4[2];
      if (*v6)
        (*v6)(1677721632, *v7, *v4, *((unsigned int *)v4 + 2), 0, 0);
      v9 = (_QWORD *)*v3;
      v10 = v3;
      if ((_QWORD *)*v3 != v4)
      {
        do
        {
          v11 = v9;
          v9 = (_QWORD *)v9[2];
        }
        while (v9 != v4);
        v10 = v11 + 2;
      }
      *v10 = v4[2];
      free(v4);
      v4 = v8;
    }
    while (v8);
  }
  os_unfair_lock_unlock(v2);
}

CFStringRef ioAccelSharedCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[6];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOAccelShared %p connect=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioAccelSharedCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[6];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOAccelShared %p connect=%08x refcnt=%d>"), a1, v2, v3);
}

void IOAccelKillClient_LeakingContext()
{
  abort();
}

uint64_t IOAccelContextGetTypeID()
{
  if (IOAccelContextGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelContextGetTypeID_onceToken, &__block_literal_global_1);
  return kIOAccelContextID;
}

const void *IOAccelContextCreate(uint64_t a1, uint32_t type)
{
  kern_return_t v3;
  io_connect_t v4;
  uint64_t Instance;
  const void *v6;
  io_connect_t connect;

  connect = 0;
  v3 = IOServiceOpen(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 16), *MEMORY[0x1E0C83DA0], type, &connect);
  if (v3)
  {
    if (v3 == -536379391)
      abort();
    return 0;
  }
  v4 = connect;
  if (IOAccelContextGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelContextGetTypeID_onceToken, &__block_literal_global_1);
  Instance = _CFRuntimeCreateInstance();
  v6 = (const void *)Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 168) = 0u;
    *(_QWORD *)(Instance + 16) = a1;
    *(_DWORD *)(Instance + 24) = v4;
    *(_DWORD *)(Instance + 164) = 16;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 80) = 0u;
    *(_OWORD *)(Instance + 96) = 0u;
    *(_OWORD *)(Instance + 112) = 0u;
    *(_OWORD *)(Instance + 128) = 0u;
    *(_OWORD *)(Instance + 144) = 0u;
    *(_OWORD *)(Instance + 184) = 0u;
    *(_OWORD *)(Instance + 200) = 0u;
    *(_OWORD *)(Instance + 216) = 0u;
    *(_OWORD *)(Instance + 232) = 0u;
    *(_OWORD *)(Instance + 248) = 0u;
    *(_OWORD *)(Instance + 264) = 0u;
    *(_OWORD *)(Instance + 280) = 0u;
    *(_QWORD *)(Instance + 296) = 0;
    if (MEMORY[0x1BCCCA4A0](connect, *(unsigned int *)(a1 + 24)))
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

void IOAccelContextRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

unsigned int *IOAccelContextGetConnect(unsigned int *result)
{
  unsigned int *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOAccelContextID)
      return (unsigned int *)v1[6];
    else
      return 0;
  }
  return result;
}

uint64_t IOAccelContextFinish(uint64_t a1)
{
  uint64_t v2;

  if (!a1 || CFGetTypeID((CFTypeRef)a1) != kIOAccelContextID)
    return 3758097090;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return IOConnectCallMethod(*(_DWORD *)(a1 + 24), 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAccelContextFinishFenceEvent(uint64_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 24), 5u, &input, 1u, 0, 0);
}

uint64_t IOAccelContextSetDataBufferClassUsedBytes(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 164) > a2)
    *(_QWORD *)(result + 8 * a2 + 168) = a3;
  return result;
}

uint64_t IOAccelContextSubmitDataBuffers(uint64_t a1, int a2, _DWORD *a3, _DWORD *a4)
{
  int v5;
  int v6;

  return IOAccelContextSubmitDataBuffersExt2(a1, a2, a3, a4, &v6, &v5);
}

uint64_t IOAccelContextSubmitDataBuffersExt2(uint64_t a1, int a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  unsigned int *v15;
  CFTypeRef *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *DataBuffer;
  _DWORD *v25;
  size_t outputStructCnt;

  v12 = 3758097090;
  v13 = *(unsigned int *)(a1 + 164);
  if (CFGetTypeID((CFTypeRef)a1) == kIOAccelContextID)
  {
    *(_DWORD *)(a1 + 160) = a2;
    v14 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 60);
    v25 = a6;
    outputStructCnt = (v14 * v13) + 48 * v13 + 24;
    v15 = (unsigned int *)malloc_type_malloc(outputStructCnt, 0xE45ED4F0uLL);
    if ((_DWORD)v13)
    {
      v16 = (CFTypeRef *)(a1 + 32);
      do
      {
        if (*v16)
        {
          CFRelease(*v16);
          *v16 = 0;
        }
        ++v16;
        --v13;
      }
      while (v13);
    }
    v17 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 2u, (const void *)(a1 + 160), 0x88uLL, v15, &outputStructCnt);
    if (!(_DWORD)v17)
    {
      *a3 = v15[2];
      *a4 = v15[1];
      *a5 = v15[3];
      *v25 = v15[4];
      v18 = *v15;
      if (v15[1]
        || (v17 = 3758097090,
            (v18 * v14) + 48 * (unint64_t)v18 + 24 >= outputStructCnt))
      {
        *(_DWORD *)(a1 + 164) = v18;
        if ((_DWORD)v18)
        {
          v19 = 0;
          v20 = (uint64_t)&v15[12 * v18 + 6];
          v21 = v15 + 6;
          v22 = (_QWORD *)(a1 + 32);
          v17 = 3758097086;
          while (1)
          {
            DataBuffer = IOAccelResourceCreateDataBuffer(*(_QWORD **)(a1 + 16), v21, (const void *)(v20 + v19), v14);
            if (!DataBuffer)
              break;
            *v22++ = DataBuffer;
            v19 += v14;
            v21 += 6;
            if (!--v18)
              goto LABEL_14;
          }
        }
        else
        {
LABEL_14:
          v17 = 0;
        }
      }
    }
    free(v15);
    return v17;
  }
  return v12;
}

uint64_t IOAccelContextSubmitDataBuffersExt(uint64_t a1, int a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int v6;

  return IOAccelContextSubmitDataBuffersExt2(a1, a2, a3, a4, a5, &v6);
}

uint64_t IOAccelContextRequestDataBuffer(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  size_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *DataBuffer;
  _QWORD *v10;
  uint64_t v11;
  const void *v12;
  _QWORD *v13;
  const void *v14;
  size_t v16;
  _DWORD inputStruct[2];

  v3 = 3758097090;
  if (a2 <= 0xF)
  {
    v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 60);
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    v16 = v6 + 48;
    v7 = (char *)malloc_type_malloc(v6 + 48, 0x3FCD3CEuLL);
    v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 3u, inputStruct, 8uLL, v7, &v16);
    if (!(_DWORD)v8)
    {
      v8 = 3758097090;
      if (v6 + 48 >= v16)
      {
        DataBuffer = IOAccelResourceCreateDataBuffer(*(_QWORD **)(a1 + 16), v7, v7 + 48, v6);
        if (DataBuffer)
        {
          v10 = DataBuffer;
          v11 = a1 + 8 * a2;
          v14 = *(const void **)(v11 + 32);
          v13 = (_QWORD *)(v11 + 32);
          v12 = v14;
          if (v14)
            CFRelease(v12);
          v8 = 0;
          *v13 = v10;
        }
        else
        {
          v8 = 3758097086;
        }
      }
    }
    free(v7);
    return v8;
  }
  return v3;
}

uint64_t IOAccelContextGetDataBufferResource(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 164) <= a2)
    return 0;
  else
    return *(_QWORD *)(a1 + 8 * a2 + 32);
}

uint64_t IOAccelContextGetDataBufferClassCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 164);
}

uint64_t IOAccelContextReclaimResources(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 24), 4u, 0, 0, 0, 0);
}

uint64_t IOAccelContextSetExecutableName(uint64_t a1, const char *a2)
{
  char __dst[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  strncpy(__dst, a2, 0x3FFuLL);
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 24), 1u, __dst, 0x400uLL, 0, 0);
}

uint64_t IOAccelContextGetSidebandBuffer(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  result = MEMORY[0x1BCCCA4DC](*(unsigned int *)(a1 + 24), 0, *MEMORY[0x1E0C83DA0], &v9, &v8, 1);
  v7 = v8;
  v6 = v9;
  if ((_DWORD)result)
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  *a3 = v7;
  return result;
}

uint64_t IOAccelContextGetFenceBuffer(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  unsigned int *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v10 = (unsigned int *)MEMORY[0x1E0C83DA0];
  result = MEMORY[0x1BCCCA4DC](*(unsigned int *)(a1 + 24), 2, *MEMORY[0x1E0C83DA0], &v13, &v12, 1);
  if ((_DWORD)result)
  {
    *a4 = 0;
    *a5 = 0;
  }
  else
  {
    *a4 = v13;
    *a5 = v12;
    result = MEMORY[0x1BCCCA4DC](*(unsigned int *)(a1 + 24), 1, *v10, &v13, &v12, 1);
    if ((_DWORD)result)
    {
      *a2 = 0;
      *a3 = 0;
    }
    else
    {
      *a2 = v13;
      *a3 = v12;
    }
  }
  return result;
}

uint64_t IOAccelContextSetBackgroundRendering(uint64_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 24), 7u, &input, 1u, 0, 0);
}

void IOAccelContextAddResource(uint64_t a1, uint64_t a2, __int16 a3, _DWORD *a4)
{
  unsigned int *v4;
  unsigned int v5;

  *a4 = *(_DWORD *)(*(_QWORD *)(a2 + 72) + 256);
  if ((a3 & 0x100) == 0)
  {
    v4 = (unsigned int *)(*(_QWORD *)(a2 + 80) + 24);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
}

uint64_t IOAccelContextTestResourceSysMem(uint64_t a1, _QWORD *a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  if ((*(_BYTE *)(a2[9] + 260) & 0x80) == 0)
    return 1;
  if (*(_DWORD *)(a2[10] + 24) != 1)
    a4(a5);
  return (*(uint64_t (**)(void))(a2[2] + 24))();
}

uint64_t IOAccelContextFlushResourceSysMem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t result;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 72) + 260) & 0xD) == 0 && *(_DWORD *)(*(_QWORD *)(a2 + 80) + 24) != 1)
    return a4(a5);
  return result;
}

_QWORD *IOAccelContextFinishResourceSysMem(uint64_t a1, _QWORD *a2, int a3, void (*a4)(uint64_t), uint64_t a5)
{
  if ((*(_BYTE *)(a2[9] + 260) & 0xD) == 0 && *(_DWORD *)(a2[10] + 24) != 1)
    a4(a5);
  return IOAccelResourceFinishSysMem(a2, a3);
}

uint64_t IOAccelContextEnableBlockFences(unint64_t a1)
{
  uint64_t v2;
  dispatch_queue_t v3;
  NSObject *v4;
  IONotificationPort *v5;
  mach_port_t MachPort;
  uint64_t reference[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    IOAccelContextEnableBlockFences_cold_1();
  if (*(_QWORD *)(a1 + 296))
    IOAccelContextEnableBlockFences_cold_4();
  v2 = 3758097085;
  v3 = dispatch_queue_create("com.apple.IOAccelerator.BlockFences", 0);
  if (v3)
  {
    v4 = v3;
    v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    *(_QWORD *)(a1 + 296) = v5;
    if (v5)
    {
      IONotificationPortSetDispatchQueue(v5, v4);
      dispatch_release(v4);
      reference[0] = 0;
      v10 = 0u;
      v11 = 0u;
      reference[1] = (uint64_t)ioAccelContextBlockFenceCallback;
      v9 = a1;
      if (!*(_DWORD *)(a1 + 24))
        IOAccelContextEnableBlockFences_cold_2();
      MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(a1 + 296));
      if (!MachPort)
        IOAccelContextEnableBlockFences_cold_3();
      v2 = IOConnectCallAsyncScalarMethod(*(_DWORD *)(a1 + 24), 6u, MachPort, reference, 3u, 0, 0, 0, 0);
      if ((_DWORD)v2)
      {
        IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 296));
        *(_QWORD *)(a1 + 296) = 0;
      }
    }
    else
    {
      dispatch_release(v4);
    }
  }
  return v2;
}

void ioAccelContextBlockFenceCallback(const void *a1, int a2, uint64_t a3)
{
  dispatch_block_t v3;
  NSObject *v4;

  if (!a1)
    ioAccelContextBlockFenceCallback_cold_1();
  if (a2)
    ioAccelContextBlockFenceCallback_cold_4();
  v3 = *(dispatch_block_t *)a3;
  if (!*(_QWORD *)a3)
    ioAccelContextBlockFenceCallback_cold_2();
  v4 = *(NSObject **)(a3 + 8);
  if (!v4)
    ioAccelContextBlockFenceCallback_cold_3();
  dispatch_async(*(dispatch_queue_t *)(a3 + 8), *(dispatch_block_t *)a3);
  dispatch_release(v4);
  _Block_release(v3);
  CFRelease(a1);
}

uint64_t IOAccelContextSetBlockFenceOnQueue(_QWORD *a1, CFTypeRef cf, const void *a3, NSObject *a4)
{
  uint64_t result;
  void *v9;

  if (*((_QWORD *)cf + 37) || (result = IOAccelContextEnableBlockFences((unint64_t)cf), !(_DWORD)result))
  {
    CFRetain(cf);
    v9 = _Block_copy(a3);
    dispatch_retain(a4);
    result = 0;
    *a1 = v9;
    a1[1] = a4;
  }
  return result;
}

uint64_t ioAccelContextFinalize(uint64_t a1)
{
  IONotificationPort *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t result;

  v2 = *(IONotificationPort **)(a1 + 296);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    *(_QWORD *)(a1 + 296) = 0;
  }
  v3 = 0;
  v4 = a1 + 32;
  do
  {
    v5 = *(const void **)(v4 + v3);
    if (v5)
      CFRelease(v5);
    *(_QWORD *)(v4 + v3) = 0;
    v3 += 8;
  }
  while (v3 != 128);
  result = IOConnectRelease(*(_DWORD *)(a1 + 24));
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

CFStringRef ioAccelContextCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[6];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOAccelContext %p connect=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioAccelContextCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[6];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOAccelContext %p connect=%08x refcnt=%d>"), a1, v2, v3);
}

uint64_t IOAccelCommandQueueGetTypeID()
{
  if (IOAccelCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelCommandQueueGetTypeID_onceToken, &__block_literal_global_2);
  return kIOAccelCommandQueueID;
}

uint64_t IOAccelCommandQueueCreateWithQoS(uint64_t a1, int a2)
{
  mach_port_name_t *v4;
  kern_return_t v5;
  io_connect_t v6;
  uint64_t Instance;
  uint64_t v8;
  dispatch_queue_t v10;
  NSObject *v11;
  IONotificationPort *v12;
  mach_port_t MachPort;
  kern_return_t v14;
  uint64_t v15;
  size_t outputStructCnt;
  uint64_t outputStruct;
  int x;
  io_connect_t connect;
  _BYTE buffer[1024];
  int v21;
  uint64_t reference[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  connect = 0;
  v4 = (mach_port_name_t *)MEMORY[0x1E0C83DA0];
  v5 = IOServiceOpen(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 16), *MEMORY[0x1E0C83DA0], 4u, &connect);
  if (v5)
  {
    if (v5 == -536379391)
      IOAccelKillClient_LeakingContext();
    return 0;
  }
  v6 = connect;
  if (IOAccelCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelCommandQueueGetTypeID_onceToken, &__block_literal_global_2);
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = a1;
    *(_DWORD *)(Instance + 24) = v6;
    *(_QWORD *)(Instance + 32) = 0;
    if (MEMORY[0x1BCCCA4A0](connect, *(unsigned int *)(a1 + 24)))
      goto LABEL_8;
    v10 = dispatch_queue_create("com.apple.IOAccelerator.CommandQueueCompletion", 0);
    if (!v10)
      goto LABEL_8;
    v11 = v10;
    v12 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    *(_QWORD *)(v8 + 32) = v12;
    if (!v12)
    {
      dispatch_release(v11);
      goto LABEL_8;
    }
    IONotificationPortSetDispatchQueue(v12, v11);
    dispatch_release(v11);
    reference[0] = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    reference[1] = (uint64_t)ioAccelCommandQueueBlockFenceCallback;
    *(_QWORD *)&v23 = v8;
    MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(v8 + 32));
    if (!MachPort)
      IOAccelCommandQueueCreateWithQoS_cold_1();
    if (IOConnectCallAsyncScalarMethod(*(_DWORD *)(v8 + 24), 0, MachPort, reference, 3u, 0, 0, 0, 0))
    {
      IONotificationPortDestroy(*(IONotificationPortRef *)(v8 + 32));
      *(_QWORD *)(v8 + 32) = 0;
LABEL_8:
      CFRelease((CFTypeRef)v8);
      return 0;
    }
    bzero(buffer, 0x404uLL);
    x = 0;
    pid_for_task(*v4, &x);
    proc_pidpath(x, buffer, 0x400u);
    v21 = a2;
    outputStructCnt = 8;
    outputStruct = 0;
    v14 = IOConnectCallStructMethod(*(_DWORD *)(v8 + 24), 5u, buffer, 0x404uLL, &outputStruct, &outputStructCnt);
    v15 = outputStruct;
    if (v14)
      v15 = 0;
    *(_QWORD *)(v8 + 40) = v15;
  }
  return v8;
}

void ioAccelCommandQueueBlockFenceCallback(const void *a1, int a2, uint64_t a3)
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);

  if (!a1)
    ioAccelCommandQueueBlockFenceCallback_cold_1();
  if (a2)
    ioAccelCommandQueueBlockFenceCallback_cold_3();
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD, _QWORD))a3;
  if (!*(_QWORD *)a3)
    ioAccelCommandQueueBlockFenceCallback_cold_2();
  v3[2](*(_QWORD *)a3, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), *(unsigned int *)(a3 + 48));
  _Block_release(v3);
  CFRelease(a1);
}

uint64_t IOAccelCommandQueueCreate(uint64_t a1)
{
  return IOAccelCommandQueueCreateWithQoS(a1, 2);
}

void IOAccelCommandQueueSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 32), a2);
}

void IOAccelCommandQueueRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

unsigned int *IOAccelCommandQueueGetConnect(unsigned int *result)
{
  unsigned int *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOAccelCommandQueueID)
      return (unsigned int *)v1[6];
    else
      return 0;
  }
  return result;
}

uint64_t IOAccelCommandQueueSubmitCommandBuffers(mach_port_t *a1, _DWORD *a2)
{
  uint64_t v2;
  CFTypeID v5;
  int v6;
  int v7;
  BOOL v8;

  v2 = 3758097090;
  if (a1)
  {
    v5 = CFGetTypeID(a1);
    if (a2)
    {
      if (v5 == kIOAccelCommandQueueID)
      {
        v6 = a2[1];
        if (v6 >= 1)
        {
          v7 = a2[1];
          do
          {
            CFRetain(a1);
            CFRetain(a1);
            --v7;
          }
          while (v7);
        }
        v2 = IOConnectCallMethod(a1[6], 1u, 0, 0, a2, 24 * v6 + 8, 0, 0, 0, 0);
        if ((_DWORD)v2)
          v8 = v6 < 1;
        else
          v8 = 1;
        if (!v8)
        {
          do
          {
            CFRelease(a1);
            CFRelease(a1);
            --v6;
          }
          while (v6);
        }
      }
    }
  }
  return v2;
}

uint64_t IOAccelCommandQueueSetPriorityAndBackground(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 24), 2u, 0, 0, inputStruct, 0xCuLL, 0, 0, 0, 0);
}

uint64_t IOAccelCommandQueueSetQualityOfService(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 24), 4u, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t IOAccelCommandQueueGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t ioAccelCommandQueueFinalize(uint64_t a1)
{
  IONotificationPort *v2;
  uint64_t result;

  v2 = *(IONotificationPort **)(a1 + 32);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  result = IOConnectRelease(*(_DWORD *)(a1 + 24));
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

CFStringRef ioAccelCommandQueueCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[6];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOAccelCommandQueue %p connect=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioAccelCommandQueueCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[6];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOAccelCommandQueue %p connect=%08x refcnt=%d>"), a1, v2, v3);
}

const void *IOAccelGLContextCreate(uint64_t a1)
{
  return IOAccelContextCreate(a1, 0);
}

void IOAccelGLContextRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t IOAccelGLContextGetConnect(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAccelResourceGetTypeID()
{
  if (IOAccelResourceGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelResourceGetTypeID_onceToken, &__block_literal_global_3);
  return kIOAccelResourceID;
}

uint64_t IOAccelResourceCreate(uint64_t a1, _QWORD *a2, size_t a3)
{
  size_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _WORD *v20;
  size_t v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 60);
  v21[0] = v6 + 88;
  v7 = (_QWORD *)MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)v21 - ((v6 + 103) & 0x1FFFFFFF0);
  v9 = _IOAccelResourceAlloc(v7);
  if (v9)
  {
    bzero((char *)v21 - ((v6 + 103) & 0x1FFFFFFF0), v6 + 88);
    if (IOConnectCallMethod(*(_DWORD *)(a1 + 24), 0, 0, 0, a2, a3, 0, 0, (char *)v21 - ((v6 + 103) & 0x1FFFFFFF0), v21))
    {
      CFRelease((CFTypeRef)v9);
      return 0;
    }
    else
    {
      *(_QWORD *)(v9 + 32) = *((_QWORD *)v8 + 1);
      *(_QWORD *)(v9 + 48) = *((_QWORD *)v8 + 5);
      if ((*(_BYTE *)a2 & 0xF) != 0)
        v11 = 0;
      else
        v11 = a2[11];
      *(_QWORD *)(v9 + 40) = v11;
      *(_QWORD *)(v9 + 56) = *(_QWORD *)v8;
      v12 = *((_QWORD *)v8 + 2);
      v13 = *((_QWORD *)v8 + 3);
      *(_QWORD *)(v9 + 64) = *((_QWORD *)v8 + 10);
      *(_QWORD *)(v9 + 72) = v12;
      *(_QWORD *)(v9 + 80) = v13;
      memcpy((void *)(v9 + 128), v8 + 88, v6);
      *(_OWORD *)(v9 + 96) = *(_OWORD *)(v8 + 56);
      *(_QWORD *)(v9 + 112) = *((_QWORD *)v8 + 9);
      v14 = (unsigned int *)(v13 + 24);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      if ((*((_BYTE *)a2 + 36) & 0x40) != 0
        && (v8[32] & 1) != 0
        && (*(_DWORD *)(*(_QWORD *)(v9 + 72) + 260) | 0x40) == 0x40)
      {
        v16 = *(void **)(v9 + 32);
        if (v16)
        {
          bzero(v16, a2[11]);
          if (*(_DWORD *)(*(_QWORD *)(v9 + 72) + 260) == 64)
          {
            v17 = *((unsigned __int8 *)a2 + 32);
            v18 = *(_QWORD *)(v9 + 80);
            if (*((_BYTE *)a2 + 32))
            {
              v19 = ~(-1 << *((_BYTE *)a2 + 33));
              v20 = *(_WORD **)(v9 + 80);
              do
              {
                *v20++ |= v19;
                --v17;
              }
              while (v17);
            }
            *(_BYTE *)(v18 + 28) |= 1u;
          }
        }
      }
      *(_QWORD *)(v9 + 88) = *((_QWORD *)v8 + 6);
      if (*MEMORY[0x1E0C80C60] && *(_QWORD *)(v9 + 32) && !a2[9])
        ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(1677721616, *MEMORY[0x1E0C83DA0], *(_QWORD *)(v9 + 48), 0);
    }
  }
  return v9;
}

uint64_t _IOAccelResourceAlloc(_QWORD *a1)
{
  uint64_t Instance;

  if (IOAccelResourceGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelResourceGetTypeID_onceToken, &__block_literal_global_3);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    CFRetain(a1);
    *(_QWORD *)(Instance + 16) = a1[2];
    *(_QWORD *)(Instance + 24) = a1;
    *(_DWORD *)(Instance + 120) = 0;
    *(_QWORD *)(Instance + 72) = 0;
    *(_QWORD *)(Instance + 80) = 0;
  }
  return Instance;
}

uint64_t IOAccelResourceClientSharedRetain(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(*(_QWORD *)(result + 80) + 24);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

_QWORD *IOAccelResourceCreateDataBuffer(_QWORD *a1, _QWORD *a2, const void *a3, size_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;

  v7 = (_QWORD *)_IOAccelResourceAlloc(a1);
  v8 = v7;
  if (v7)
  {
    v9 = a2[1];
    v7[4] = *a2;
    v7[5] = v9;
    v10 = a2[3];
    v7[7] = a2[2];
    v11 = a2[4];
    v7[9] = v10;
    v7[10] = v11;
    memcpy(v7 + 16, a3, a4);
    v12 = (unsigned int *)(v11 + 24);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    if (*MEMORY[0x1E0C80C60])
    {
      v14 = v8[4];
      if (v14)
        ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))*MEMORY[0x1E0C80C60])(1677721616, *MEMORY[0x1E0C83DA0], v8[5], 0, v14, 0);
    }
  }
  return v8;
}

void IOAccelResourceRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

_QWORD *IOAccelResourceGetDataBytes(_QWORD *result)
{
  _QWORD *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (IOAccelResourceGetTypeID_onceToken != -1)
      dispatch_once(&IOAccelResourceGetTypeID_onceToken, &__block_literal_global_3);
    if (v2 == kIOAccelResourceID)
      return (_QWORD *)v1[4];
    else
      return 0;
  }
  return result;
}

uint64_t IOAccelResourceGetDataSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t IOAccelResourceGetResidentDataSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t IOAccelResourceGetGPUVirtualAddress(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t IOAccelResourceGetGPUVirtualAddressLength(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t IOAccelResourceGetPrivate(uint64_t a1)
{
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 60))
    return a1 + 128;
  else
    return 0;
}

uint64_t IOAccelResourceGetClientShared(_QWORD *a1, _QWORD *a2)
{
  CFTypeID v4;
  uint64_t result;

  if (!a1)
    goto LABEL_8;
  v4 = CFGetTypeID(a1);
  if (IOAccelResourceGetTypeID_onceToken != -1)
    dispatch_once(&IOAccelResourceGetTypeID_onceToken, &__block_literal_global_3);
  if (v4 == kIOAccelResourceID)
  {
    if (a2)
      *a2 = a1[10];
    return a1[9];
  }
  else
  {
LABEL_8:
    result = 0;
    if (a2)
      *a2 = 0;
  }
  return result;
}

uint64_t IOAccelResourceGetClientSharedPrivate(_QWORD *a1, uint64_t *a2)
{
  CFTypeID v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (a1)
  {
    v4 = CFGetTypeID(a1);
    if (IOAccelResourceGetTypeID_onceToken != -1)
      dispatch_once(&IOAccelResourceGetTypeID_onceToken, &__block_literal_global_3);
    if (v4 == kIOAccelResourceID)
    {
      v5 = a1[2];
      if (*(_DWORD *)(v5 + 52))
      {
        result = a1[9] + 264;
        if (!a2)
          return result;
      }
      else
      {
        result = 0;
        if (!a2)
          return result;
      }
      if (*(_DWORD *)(v5 + 56))
        v7 = a1[10] + 32;
      else
        v7 = 0;
LABEL_14:
      *a2 = v7;
      return result;
    }
  }
  v7 = 0;
  result = 0;
  if (a2)
    goto LABEL_14;
  return result;
}

uint64_t IOAccelResourcePageoff(uint64_t a1, int a2, int a3)
{
  _DWORD inputStruct[2];

  inputStruct[0] = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 256);
  inputStruct[1] = a3 | (a2 << 16);
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 24), 2u, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t IOAccelResourceSetPurgeable(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 72) + 256);
  output = 0;
  input[0] = v4;
  input[1] = a2;
  result = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 24), 4u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  if (a3)
    *a3 = output;
  return result;
}

uint64_t IOAccelResourceTestEvent(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)(a1 + 16) + 24))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 72) + ((unint64_t)a2 << 6));
}

CFTypeID IOAccelResourceFinishEvent(_QWORD *a1, unsigned int a2)
{
  uint64_t v3;
  CFTypeID result;
  uint64_t v5;
  uint64_t v6;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  result = (*(uint64_t (**)(void))(a1[2] + 24))();
  if (!(_DWORD)result)
  {
    result = CFGetTypeID(a1);
    if (result == kIOAccelResourceID)
    {
      input[0] = *(unsigned int *)(a1[9] + 256);
      input[1] = v3;
      v5 = a1[3];
      v6 = *(_QWORD *)(v5 + 32);
      if (v6)
      {
        (*(void (**)(void))(v6 + 16))();
        v5 = a1[3];
      }
      return IOConnectCallMethod(*(_DWORD *)(v5 + 24), 3u, input, 2u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t IOAccelResourceCheckSysMem(_QWORD *a1)
{
  if ((*(_BYTE *)(a1[9] + 260) & 0x80) == 0)
    return 1;
  if (*(_DWORD *)(a1[10] + 24) == 1)
    return (*(uint64_t (**)(void))(a1[2] + 24))();
  return 0;
}

_QWORD *IOAccelResourceFinishSysMem(_QWORD *result, int a2)
{
  if ((*(_BYTE *)(result[9] + 260) & 0x80) != 0)
    return (_QWORD *)IOAccelResourceFinishEvent(result, a2 == 0);
  return result;
}

uint64_t IOAccelResourceCreateAllocationIdentifierSet(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  *a2 = *(_QWORD *)(result + 96);
  *a3 = *(_QWORD *)(result + 104);
  return result;
}

uint64_t IOAccelResourceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t IOAccelResourceGetProtectionOptions(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

void ioAccelResourceFinalize(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  const void *v9;
  uint64_t input;

  v3 = a1 + 9;
  v2 = a1[9];
  if (v2)
    v2 = *(unsigned int *)(v2 + 256);
  input = v2;
  v4 = a1[10];
  if (v4)
  {
    v5 = (unsigned int *)(v4 + 24);
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stxr(v7, v5));
    if (!v7)
    {
      if (*MEMORY[0x1E0C80C60])
      {
        v8 = a1[4];
        if (v8)
          ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(32, *MEMORY[0x1E0C83DA0], v8, a1[6], 0, 0);
      }
      if (IOConnectCallMethod(*(_DWORD *)(a1[3] + 24), 1u, &input, 1u, 0, 0, 0, 0, 0, 0) == -536870187)
        ioAccelResourceFinalize_cold_1();
      *v3 = 0;
      v3[1] = 0;
    }
  }
  v9 = (const void *)a1[3];
  if (v9)
  {
    CFRelease(v9);
    a1[3] = 0;
  }
}

CFStringRef ioAccelResourceCopyFormatDescription(_QWORD *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = *(unsigned int *)(a1[9] + 256);
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOAccelResource %p id=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioAccelResourceCopyDebugDescription(_QWORD *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = *(unsigned int *)(a1[9] + 256);
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOAccelResource %p id=%08x refcnt=%d>"), a1, v2, v3);
}

uint64_t IOAccelDeviceTestEventFast(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int v9;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  while (1)
  {
    v4 = *(_QWORD *)(a2 + v2);
    if ((_DWORD)v4 != -1)
    {
      v5 = HIDWORD(v4);
      v6 = a1 + 4 * (int)v4;
      v8 = *(_DWORD *)(v6 + 68);
      v7 = (_DWORD *)(v6 + 68);
      if (HIDWORD(v4) - v8 >= 1)
      {
        v9 = **(_DWORD **)(v3 + 8 * (int)v4);
        *v7 = v9;
        if ((int)v5 - v9 > 0)
          break;
      }
    }
    v2 += 8;
    if (v2 == 64)
      return 1;
  }
  return 0;
}

double IOAccelResourceListInit(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  __int128 v7;
  double result;

  *(_QWORD *)&v7 = -1;
  *((_QWORD *)&v7 + 1) = -1;
  *(_OWORD *)(a1 + 480) = v7;
  *(_OWORD *)(a1 + 496) = v7;
  *(_OWORD *)(a1 + 448) = v7;
  *(_OWORD *)(a1 + 464) = v7;
  *(_OWORD *)(a1 + 416) = v7;
  *(_OWORD *)(a1 + 432) = v7;
  *(_OWORD *)(a1 + 384) = v7;
  *(_OWORD *)(a1 + 400) = v7;
  *(_OWORD *)(a1 + 352) = v7;
  *(_OWORD *)(a1 + 368) = v7;
  *(_OWORD *)(a1 + 320) = v7;
  *(_OWORD *)(a1 + 336) = v7;
  *(_OWORD *)(a1 + 288) = v7;
  *(_OWORD *)(a1 + 304) = v7;
  *(_OWORD *)(a1 + 256) = v7;
  *(_OWORD *)(a1 + 272) = v7;
  *(_OWORD *)(a1 + 224) = v7;
  *(_OWORD *)(a1 + 240) = v7;
  *(_OWORD *)(a1 + 192) = v7;
  *(_OWORD *)(a1 + 208) = v7;
  *(_OWORD *)(a1 + 160) = v7;
  *(_OWORD *)(a1 + 176) = v7;
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 144) = v7;
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 536) = a3 / 0x58;
  *(_QWORD *)(a1 + 528) = a4;
  *(_QWORD *)(a1 + 512) = a2;
  *(_QWORD *)(a1 + 520) = a4;
  *(_DWORD *)(a1 + 540) = 0;
  *(_DWORD *)(a1 + 548) = 0;
  result = 0.0;
  *(_QWORD *)(a1 + 552) = 0;
  *(_DWORD *)(a1 + 560) = a5;
  *(_QWORD *)(a1 + 568) = a6;
  *(_QWORD *)(a1 + 576) = a7;
  return result;
}

double IOAccelResourceListDestroy(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 568) = 0u;
  return result;
}

uint64_t IOAccelResourceListAddResourceNoThreshold(uint64_t a1, uint64_t a2, __int16 a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v16;
  _WORD *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = v4;
  v6 = *(unsigned __int16 *)(a1 + 2 * v4);
  if (v6 == 0xFFFF)
    return ioAccelResourceListAddNewGroupAndResource(a1, *(_DWORD *)(a2 + 16), *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 1);
  v7 = *(_QWORD *)(a1 + 512);
  v8 = v7 + 88 * *(unsigned __int16 *)(a1 + 2 * v4);
  v9 = *(unsigned __int16 *)(v8 + 86);
  if (!*(_WORD *)(v8 + 86))
  {
LABEL_6:
    v11 = v7 + 88 * *(unsigned __int16 *)(a1 + 2 * v4);
    v14 = *(unsigned __int16 *)(v11 + 84);
    v12 = (_WORD *)(v11 + 84);
    v13 = v14;
    if (v9 <= 5 && v13 == 0xFFFF)
      return ioAccelResourceGroupAddNewResource(a1, v7 + 88 * v6, v6, v9, v4, *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 1);
    while (v13 != 0xFFFF)
    {
      v16 = v13;
      v17 = v12;
      v18 = v13;
      v19 = v7 + 88 * v13;
      v20 = *(unsigned __int16 *)(v19 + 86);
      if (*(_WORD *)(v19 + 86))
      {
        v21 = 0;
        while (*(_DWORD *)(v19 + 4 * v21) != v4)
        {
          if (v20 == ++v21)
            goto LABEL_13;
        }
        v25 = v7 + 88 * v18;
        *v17 = *(_WORD *)(v25 + 84);
        *(_WORD *)(v25 + 84) = v6;
        *(_WORD *)(a1 + 2 * v5) = v16;
        v26 = v7 + 88 * v16 + 2 * v21;
        *(_WORD *)(v26 + 72) |= a3;
        return v21 | (8 * v16);
      }
LABEL_13:
      v22 = v7 + 88 * v18;
      v23 = *(unsigned __int16 *)(v22 + 84);
      v12 = (_WORD *)(v22 + 84);
      v13 = v23;
      if (v20 <= 5 && v13 == 0xFFFF)
      {
        *v17 = -1;
        *v12 = v6;
        *(_WORD *)(a1 + 2 * v4) = v16;
        return ioAccelResourceGroupAddNewResource(a1, v19, v16, v20, v4, *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 1);
      }
    }
    return ioAccelResourceListAddNewGroupAndResource(a1, *(_DWORD *)(a2 + 16), *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 1);
  }
  v10 = 0;
  while (*(_DWORD *)(v8 + 4 * v10) != v4)
  {
    if (v9 == ++v10)
      goto LABEL_6;
  }
  *(_WORD *)(v8 + 2 * v10 + 72) |= a3;
  return v10 | (8 * (_DWORD)v6);
}

uint64_t IOAccelResourceListAddResource(uint64_t a1, uint64_t a2, __int16 a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v16;
  _WORD *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = v4;
  v6 = *(unsigned __int16 *)(a1 + 2 * v4);
  if (v6 == 0xFFFF)
    return ioAccelResourceListAddNewGroupAndResource(a1, *(_DWORD *)(a2 + 16), *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 0);
  v7 = *(_QWORD *)(a1 + 512);
  v8 = v7 + 88 * *(unsigned __int16 *)(a1 + 2 * v4);
  v9 = *(unsigned __int16 *)(v8 + 86);
  if (!*(_WORD *)(v8 + 86))
  {
LABEL_6:
    v11 = v7 + 88 * *(unsigned __int16 *)(a1 + 2 * v4);
    v14 = *(unsigned __int16 *)(v11 + 84);
    v12 = (_WORD *)(v11 + 84);
    v13 = v14;
    if (v9 <= 5 && v13 == 0xFFFF)
      return ioAccelResourceGroupAddNewResource(a1, v7 + 88 * v6, v6, v9, v4, *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 0);
    while (v13 != 0xFFFF)
    {
      v16 = v13;
      v17 = v12;
      v18 = v13;
      v19 = v7 + 88 * v13;
      v20 = *(unsigned __int16 *)(v19 + 86);
      if (*(_WORD *)(v19 + 86))
      {
        v21 = 0;
        while (*(_DWORD *)(v19 + 4 * v21) != v4)
        {
          if (v20 == ++v21)
            goto LABEL_13;
        }
        v25 = v7 + 88 * v18;
        *v17 = *(_WORD *)(v25 + 84);
        *(_WORD *)(v25 + 84) = v6;
        *(_WORD *)(a1 + 2 * v5) = v16;
        v26 = v7 + 88 * v16 + 2 * v21;
        *(_WORD *)(v26 + 72) |= a3;
        return v21 | (8 * v16);
      }
LABEL_13:
      v22 = v7 + 88 * v18;
      v23 = *(unsigned __int16 *)(v22 + 84);
      v12 = (_WORD *)(v22 + 84);
      v13 = v23;
      if (v20 <= 5 && v13 == 0xFFFF)
      {
        *v17 = -1;
        *v12 = v6;
        *(_WORD *)(a1 + 2 * v4) = v16;
        return ioAccelResourceGroupAddNewResource(a1, v19, v16, v20, v4, *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 0);
      }
    }
    return ioAccelResourceListAddNewGroupAndResource(a1, *(_DWORD *)(a2 + 16), *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL, a3, *(_QWORD *)a2, 0);
  }
  v10 = 0;
  while (*(_DWORD *)(v8 + 4 * v10) != v4)
  {
    if (v9 == ++v10)
      goto LABEL_6;
  }
  *(_WORD *)(v8 + 2 * v10 + 72) |= a3;
  return v10 | (8 * (_DWORD)v6);
}

BOOL IOAccelResourceListMerge(uint64_t a1, uint64_t a2)
{
  return _ioAccelResourceListMergeGroup(a1, a2 + 24, *(_DWORD *)(a2 + 20));
}

BOOL _ioAccelResourceListMergeGroup(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _WORD *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  _WORD *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v33;

  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v7 = a3;
    while (1)
    {
      v8 = a2 + 88 * v5;
      v9 = *(unsigned __int16 *)(v8 + 86);
      if (*(_WORD *)(v8 + 86))
        break;
LABEL_30:
      v6 = ++v5 >= v7;
      if (v5 == v7)
        return 1;
    }
    v10 = 0;
    while (1)
    {
      v11 = *(_DWORD *)(v8 + 4 * v10);
      v12 = a2 + 88 * v5;
      v13 = *(_QWORD *)(v12 + 8 * v10 + 24);
      v14 = *(_WORD *)(v12 + 2 * v10 + 72);
      v15 = *(unsigned __int16 *)(a1 + 2 * v11);
      if (v15 != 0xFFFF)
      {
        v16 = *(_QWORD *)(a1 + 512);
        v17 = v16 + 88 * *(unsigned __int16 *)(a1 + 2 * v11);
        v18 = *(unsigned __int16 *)(v17 + 86);
        if (*(_WORD *)(v17 + 86))
        {
          v19 = 0;
          while (*(_DWORD *)(v17 + 4 * v19) != v11)
          {
            if (v18 == ++v19)
              goto LABEL_10;
          }
          *(_WORD *)(v17 + 2 * v19 + 72) |= v14;
          v25 = v19 | (8 * v15);
          goto LABEL_28;
        }
LABEL_10:
        v20 = v16 + 88 * *(unsigned __int16 *)(a1 + 2 * v11);
        v23 = *(unsigned __int16 *)(v20 + 84);
        v21 = (_WORD *)(v20 + 84);
        v22 = v23;
        if (v18 <= 5 && v22 == 0xFFFF)
        {
          v24 = a1;
LABEL_13:
          v25 = ioAccelResourceGroupMergeNewResource(v24, v17, v15, v18, v11, v13, v14);
          goto LABEL_28;
        }
        while (v22 != 0xFFFF)
        {
          v26 = v22;
          v27 = v21;
          v28 = v22;
          v17 = v16 + 88 * v22;
          v18 = *(unsigned __int16 *)(v17 + 86);
          if (*(_WORD *)(v17 + 86))
          {
            v29 = 0;
            while (*(_DWORD *)(v17 + 4 * v29) != v11)
            {
              if (v18 == ++v29)
                goto LABEL_19;
            }
            v33 = v16 + 88 * v28;
            *v27 = *(_WORD *)(v33 + 84);
            *(_WORD *)(v33 + 84) = v15;
            *(_WORD *)(a1 + 2 * v11) = v26;
            *(_WORD *)(v17 + 2 * v29 + 72) |= v14;
            v25 = v29 | (8 * v26);
            goto LABEL_28;
          }
LABEL_19:
          v30 = v16 + 88 * v28;
          v31 = *(unsigned __int16 *)(v30 + 84);
          v21 = (_WORD *)(v30 + 84);
          v22 = v31;
          if (v18 <= 5 && v22 == 0xFFFF)
          {
            *v27 = -1;
            *v21 = v15;
            *(_WORD *)(a1 + 2 * v11) = v26;
            v24 = a1;
            LODWORD(v15) = v26;
            goto LABEL_13;
          }
        }
      }
      v25 = ioAccelResourceListMergeNewResource(a1, *(_DWORD *)(v8 + 4 * v10), v13, v14);
LABEL_28:
      if (v25 == -1)
        return v6;
      if (++v10 == v9)
        goto LABEL_30;
    }
  }
  return 1;
}

BOOL IOAccelResourceListMergeLists(uint64_t a1, uint64_t a2)
{
  return _ioAccelResourceListMergeGroup(a1, *(_QWORD *)(a2 + 512), *(_DWORD *)(a2 + 544));
}

__n128 IOAccelResourceListReset(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  __n128 result;

  *(_QWORD *)(a1 + 512) = a2;
  *(_DWORD *)(a1 + 536) = a3 / 0x58;
  if (a4)
  {
    *(_QWORD *)(a1 + 520) = *(_QWORD *)(a1 + 528);
    *(_QWORD *)(a1 + 540) = 0;
    result.n128_u64[0] = -1;
    result.n128_u64[1] = -1;
    *(__n128 *)a1 = result;
    *(__n128 *)(a1 + 16) = result;
    *(__n128 *)(a1 + 32) = result;
    *(__n128 *)(a1 + 48) = result;
    *(__n128 *)(a1 + 64) = result;
    *(__n128 *)(a1 + 80) = result;
    *(__n128 *)(a1 + 96) = result;
    *(__n128 *)(a1 + 112) = result;
    *(__n128 *)(a1 + 128) = result;
    *(__n128 *)(a1 + 144) = result;
    *(__n128 *)(a1 + 160) = result;
    *(__n128 *)(a1 + 176) = result;
    *(__n128 *)(a1 + 192) = result;
    *(__n128 *)(a1 + 208) = result;
    *(__n128 *)(a1 + 224) = result;
    *(__n128 *)(a1 + 240) = result;
    *(__n128 *)(a1 + 256) = result;
    *(__n128 *)(a1 + 272) = result;
    *(__n128 *)(a1 + 288) = result;
    *(__n128 *)(a1 + 304) = result;
    *(__n128 *)(a1 + 320) = result;
    *(__n128 *)(a1 + 336) = result;
    *(__n128 *)(a1 + 352) = result;
    *(__n128 *)(a1 + 368) = result;
    *(__n128 *)(a1 + 384) = result;
    *(__n128 *)(a1 + 400) = result;
    *(__n128 *)(a1 + 416) = result;
    *(__n128 *)(a1 + 432) = result;
    *(__n128 *)(a1 + 448) = result;
    *(__n128 *)(a1 + 464) = result;
    *(__n128 *)(a1 + 480) = result;
    *(__n128 *)(a1 + 496) = result;
  }
  return result;
}

uint64_t IOAccelResourceListShowResources(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(unsigned int *)(result + 544);
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 512);
    v4 = v3;
    do
    {
      v5 = v3 + 88 * v2;
      v6 = *(unsigned __int16 *)(v5 + 86);
      if (*(_WORD *)(v5 + 86))
      {
        v7 = 0;
        do
        {
          result = printf("Resource at %d(%d,%d) is %08x\n", (8 * v2) | v7, v2, v7, *(_DWORD *)(v4 + 4 * v7));
          ++v7;
        }
        while (v6 != v7);
      }
      ++v2;
      v4 += 88;
    }
    while (v2 != v1);
  }
  return result;
}

uint64_t ioAccelResourceGroupAddNewResource(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5, unint64_t a6, __int16 a7, uint64_t a8, char a9)
{
  unint64_t v11;
  BOOL v12;
  unint64_t v13;

  if ((a9 & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 520);
    v12 = v11 >= a6;
    v13 = v11 - a6;
    if (!v12)
    {
      *(_QWORD *)(a1 + 520) = 0;
      return 0xFFFFFFFFLL;
    }
    *(_QWORD *)(a1 + 520) = v13;
    if (v13 > *(_QWORD *)(a1 + 528))
      __assert_rtn("ioAccelResourceGroupAddNewResource", "IOAccelResourceList.c", 52, "l->remainingBytes <= l->threshold");
  }
  *(_DWORD *)(a2 + 4 * a4) = a5;
  *(_QWORD *)(a2 + 8 * a4 + 24) = a6;
  *(_WORD *)(a2 + 2 * a4 + 72) = a7;
  *(_WORD *)(a2 + 86) = a4 + 1;
  ++*(_DWORD *)(a1 + 540);
  ++*(_DWORD *)(a1 + 548);
  if (a8)
    IOSurfaceBindAccel();
  return a4 | (8 * a3);
}

uint64_t ioAccelResourceListAddNewGroupAndResource(uint64_t a1, int a2, unint64_t a3, __int16 a4, uint64_t a5, char a6)
{
  unsigned int v7;
  uint64_t v13;

  v7 = *(_DWORD *)(a1 + 544);
  if (v7 >= 0xFFFE)
    abort();
  if (v7 >= *(_DWORD *)(a1 + 536))
  {
    (*(void (**)(_QWORD))(a1 + 568))(*(_QWORD *)(a1 + 576));
    v7 = *(_DWORD *)(a1 + 544);
    if (v7 >= *(_DWORD *)(a1 + 536))
      __assert_rtn("ioAccelResourceListAddNewGroupAndResource", "IOAccelResourceList.c", 92, "l->numResourceGroups < l->capacity");
  }
  *(_DWORD *)(a1 + 544) = v7 + 1;
  v13 = *(_QWORD *)(a1 + 512) + 88 * v7;
  *(_WORD *)(v13 + 86) = 0;
  *(_WORD *)(v13 + 84) = *(_WORD *)(a1 + 2 * a2);
  *(_WORD *)(a1 + 2 * a2) = v7;
  return ioAccelResourceGroupAddNewResource(a1, v13, v7, 0, a2, a3, a4, a5, a6);
}

uint64_t ioAccelResourceGroupMergeNewResource(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5, unint64_t a6, __int16 a7)
{
  unint64_t v7;
  BOOL v8;
  unint64_t v9;

  v7 = *(_QWORD *)(a1 + 520);
  v8 = v7 >= a6;
  v9 = v7 - a6;
  if (v8)
  {
    *(_QWORD *)(a1 + 520) = v9;
    if (v9 > *(_QWORD *)(a1 + 528))
      __assert_rtn("ioAccelResourceGroupMergeNewResource", "IOAccelResourceList.c", 229, "l->remainingBytes <= l->threshold");
    *(_DWORD *)(a2 + 4 * a4) = a5;
    *(_QWORD *)(a2 + 8 * a4 + 24) = a6;
    *(_WORD *)(a2 + 2 * a4 + 72) = a7;
    *(_WORD *)(a2 + 86) = a4 + 1;
    ++*(_DWORD *)(a1 + 540);
    ++*(_DWORD *)(a1 + 548);
    return a4 | (8 * a3);
  }
  else
  {
    *(_QWORD *)(a1 + 520) = 0;
    return 0xFFFFFFFFLL;
  }
}

uint64_t ioAccelResourceListMergeNewResource(uint64_t a1, int a2, unint64_t a3, __int16 a4)
{
  unsigned int v5;
  uint64_t v9;

  v5 = *(_DWORD *)(a1 + 544);
  if (v5 >= 0xFFFE)
    abort();
  if (v5 >= *(_DWORD *)(a1 + 536))
  {
    (*(void (**)(_QWORD))(a1 + 568))(*(_QWORD *)(a1 + 576));
    v5 = *(_DWORD *)(a1 + 544);
    if (v5 >= *(_DWORD *)(a1 + 536))
      __assert_rtn("ioAccelResourceListMergeNewResource", "IOAccelResourceList.c", 258, "l->numResourceGroups < l->capacity");
  }
  *(_DWORD *)(a1 + 544) = v5 + 1;
  v9 = *(_QWORD *)(a1 + 512) + 88 * v5;
  *(_WORD *)(v9 + 86) = 0;
  *(_WORD *)(v9 + 84) = *(_WORD *)(a1 + 2 * a2);
  *(_WORD *)(a1 + 2 * a2) = v5;
  return ioAccelResourceGroupMergeNewResource(a1, v9, v5, 0, a2, a3, a4);
}

const void *IOAccelCLContextCreate(uint64_t a1)
{
  return IOAccelContextCreate(a1, 3u);
}

void IOAccelCLContextRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t IOAccelCLContextGetConnect(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAccelVideoContextCreate()
{
  return 0;
}

void IOAccelVideoContextRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t IOAccelVideoContextGetConnect(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAccelMemoryInfoDeregisterAPICollectionBlock(const void **a1)
{
  pthread_mutex_lock(&ioaccel_collection_block_mutex);
  _Block_release(*a1);
  *a1 = 0;
  return pthread_mutex_unlock(&ioaccel_collection_block_mutex);
}

uint64_t __launchMemlistConnection_block_invoke(uint64_t a1, void *a2)
{
  __CFArray *Mutable;
  uint64_t i;
  uint64_t v5;
  const __CFArray *v6;
  const __CFArray *v7;
  void *v8;
  xpc_object_t reply;
  _xpc_connection_s *remote_connection;
  CFRange v12;

  pthread_mutex_lock(&ioaccel_collection_block_mutex);
  if (MEMORY[0x1BCCCA77C](a2) == MEMORY[0x1E0C81310])
  {
    if (ioaccel_memlist_connection)
    {
      xpc_connection_cancel((xpc_connection_t)ioaccel_memlist_connection);
      xpc_release((xpc_object_t)ioaccel_memlist_connection);
      ioaccel_memlist_connection = 0;
    }
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    for (i = 0; i != 16; ++i)
    {
      v5 = ioaccel_collection_blocks[i];
      if (v5)
      {
        v6 = (const __CFArray *)(*(uint64_t (**)(void))(v5 + 16))();
        if (v6)
        {
          v7 = v6;
          v12.length = CFArrayGetCount(v6);
          v12.location = 0;
          CFArrayAppendArray(Mutable, v7, v12);
          CFRelease(v7);
        }
      }
    }
    v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    CFRelease(Mutable);
    reply = xpc_dictionary_create_reply(a2);
    xpc_dictionary_set_value(reply, "Payload", v8);
    xpc_release(v8);
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    xpc_connection_send_message(remote_connection, reply);
    xpc_release(reply);
  }
  return pthread_mutex_unlock(&ioaccel_collection_block_mutex);
}

void IOAccelDeviceCreateWithAPIProperty_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_1B9B97000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to create an IOAccelDevice... IOServiceOpen returned kIOReturn(0x%X)", (uint8_t *)v1, 8u);
}

void IOAccelDeviceGetNextGlobalTraceID_cold_1()
{
  __assert_rtn("getNextGIDGroup", "IOAccelDeviceRef.c", 406, "0 != gid_group_data.gid_group_min");
}

void IOAccelContextEnableBlockFences_cold_1()
{
  __assert_rtn("IOAccelContextEnableBlockFences", "IOAccelContextRef.c", 634, "context");
}

void IOAccelContextEnableBlockFences_cold_2()
{
  __assert_rtn("IOAccelContextEnableBlockFences", "IOAccelContextRef.c", 656, "context->context_connect");
}

void IOAccelContextEnableBlockFences_cold_3()
{
  __assert_rtn("IOAccelContextEnableBlockFences", "IOAccelContextRef.c", 659, "wakePort");
}

void IOAccelContextEnableBlockFences_cold_4()
{
  __assert_rtn("IOAccelContextEnableBlockFences", "IOAccelContextRef.c", 635, "!context->fenceNotificationPort");
}

void ioAccelContextBlockFenceCallback_cold_1()
{
  __assert_rtn("ioAccelContextBlockFenceCallback", "IOAccelContextRef.c", 65, "refcon != NULL");
}

void ioAccelContextBlockFenceCallback_cold_2()
{
  __assert_rtn("ioAccelContextBlockFenceCallback", "IOAccelContextRef.c", 73, "block");
}

void ioAccelContextBlockFenceCallback_cold_3()
{
  __assert_rtn("ioAccelContextBlockFenceCallback", "IOAccelContextRef.c", 74, "queue");
}

void ioAccelContextBlockFenceCallback_cold_4()
{
  __assert_rtn("ioAccelContextBlockFenceCallback", "IOAccelContextRef.c", 66, "result == kIOReturnSuccess");
}

void IOAccelCommandQueueCreateWithQoS_cold_1()
{
  __assert_rtn("IOAccelCommandQueueCreateWithQoS", "IOAccelCommandQueue.c", 154, "wakePort");
}

void ioAccelCommandQueueBlockFenceCallback_cold_1()
{
  __assert_rtn("ioAccelCommandQueueBlockFenceCallback", "IOAccelCommandQueue.c", 258, "refcon != NULL");
}

void ioAccelCommandQueueBlockFenceCallback_cold_2()
{
  __assert_rtn("ioAccelCommandQueueBlockFenceCallback", "IOAccelCommandQueue.c", 274, "block");
}

void ioAccelCommandQueueBlockFenceCallback_cold_3()
{
  __assert_rtn("ioAccelCommandQueueBlockFenceCallback", "IOAccelCommandQueue.c", 259, "result == kIOReturnSuccess");
}

void ioAccelResourceFinalize_cold_1()
{
  __assert_rtn((const char *)0xFFFFFFFFFFFFFFFFLL, "/Library/Caches/com.apple.xbs/Sources/IOAcceleratorFamily/Framework/IOAccelResourceRef.c", 70, "Resource freed while busy");
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

kern_return_t IOConnectAddClient(io_connect_t connect, io_connect_t client)
{
  return MEMORY[0x1E0CBAD58](*(_QWORD *)&connect, *(_QWORD *)&client);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD70](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1E0CBAD98](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x1E0CBADA8](*(_QWORD *)&connect);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1E0CBB6A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x1E0CBBAD0]();
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  return MEMORY[0x1E0CBBC18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1E0C83A28]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1E0C84AF8](*(_QWORD *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
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

