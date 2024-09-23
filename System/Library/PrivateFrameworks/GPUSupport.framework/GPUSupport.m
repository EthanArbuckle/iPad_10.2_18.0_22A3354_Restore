void gpusLoadTransformFeedbackBuffers(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(_QWORD *)(a1 + 816))
  {
    v2 = malloc_type_zone_malloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 0x28uLL, 0x1357CB10uLL);
    if (!v2)
      abort();
    *(_QWORD *)(a1 + 816) = v2;
  }
  v3 = 0;
  while (1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + v3 + 376);
    if (!v4 || !**(_DWORD **)(v4 + 8))
      goto LABEL_9;
    if (!(*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), v4, **(_DWORD **)(v4 + 8)))break;
    **(_DWORD **)(v4 + 8) = 0;
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(a1 + 816) + v3) = v4;
    v3 += 8;
    if (v3 == 40)
      return;
  }
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), *(void **)(a1 + 816));
  *(_QWORD *)(a1 + 816) = 0;
}

uint64_t gldCreateBuffer(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 128), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  (*(void (**)(_QWORD *, _QWORD *))(a1[1] + 128))(a1, v8);
  *a2 = v9;
  return 0;
}

BOOL gldLoadBuffer(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;
  _BYTE *v6;

  v2 = *(_BYTE **)(a2 + 8);
  v3 = *v2;
  if (*v2)
  {
    if (!*(_BYTE *)(a1 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)), v6 = *(_BYTE **)(a2 + 8), v3 = *v6, *v6))
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 320))(a1, a2, v3))
      {
        LODWORD(v3) = 0;
        **(_DWORD **)(a2 + 8) = 0;
      }
    }
    if (*(_BYTE *)(a1 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return (_DWORD)v3 == 0;
}

uint64_t gldDestroyBuffer(_QWORD *a1, _QWORD *a2)
{
  _OWORD *v4;

  (*(void (**)(void))(a1[1] + 136))();
  v4 = (_OWORD *)a2[2];
  if (v4)
  {
    gldDestroyMemoryPlugin((uint64_t)a1, v4);
    a2[2] = 0;
  }
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldDestroyMemoryPlugin(uint64_t a1, _OWORD *a2)
{
  if (*(_QWORD *)a2)
  {
    if (*(_BYTE *)(a1 + 288))
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    gpusWaitResource();
    IOAccelResourceRelease();
    *a2 = 0u;
    a2[1] = 0u;
    if (*(_BYTE *)(a1 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)(a1 + 8) + 152))(a1, a2);
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), a2);
  return 0;
}

uint64_t gldUnbindBuffer(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a2 + 16);
    if (v2)
    {
      v3 = *(_QWORD *)(v2 + 16);
      if (v3)
      {
        if (*(_DWORD *)(v3 + 24) != 1)
          return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 472))();
      }
    }
  }
  return result;
}

void gldRestoreBufferData(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v6;
  CFTypeRef v7;
  int v8;
  int v9;

  v2 = a2[2];
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 8);
    if (v3)
    {
      if (*(_BYTE *)(a1 + 288))
      {
        pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
        v2 = a2[2];
        v3 = *(_QWORD *)(v2 + 8);
      }
      v6 = *(unsigned __int16 **)(v2 + 16);
      v7 = *(CFTypeRef *)v2;
      CFRetain(*(CFTypeRef *)v2);
      if (*(_BYTE *)(a1 + 288))
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
      if (!v3)
        goto LABEL_17;
      v8 = *(_DWORD *)(v3 + 260);
      if (v8 == 128)
      {
        v9 = *v6;
        if ((v6[6] & 1 & ~v9) != 0)
          *v6 = v6[6] & 1 | v9;
        if (!*(_BYTE *)(*a2 + 29))
          goto LABEL_17;
      }
      else
      {
        if (v8 != 192)
        {
LABEL_17:
          CFRelease(v7);
          return;
        }
        if ((v6[6] & ~*v6 & 1) != 0)
        {
          IOAccelResourcePageoff();
          goto LABEL_17;
        }
      }
      IOAccelResourceFinishEvent();
      goto LABEL_17;
    }
  }
}

uint64_t gpusGetKernelBufferResource(_QWORD *a1, uint64_t a2, int a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, int a8, uint64_t a9)
{
  _OWORD *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t ClientShared;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v23;

  v16 = *(_OWORD **)(a2 + 16);
  if (!v16)
  {
    v23 = 0;
    gldCreateMemoryPlugin(a1, &v23);
    v16 = v23;
    *(_QWORD *)(a2 + 16) = v23;
  }
  *v16 = 0u;
  v16[1] = 0u;
  *(_QWORD *)(a9 + 80) = a4;
  *(_QWORD *)(a9 + 88) = a7;
  *(_QWORD *)(a9 + 64) = a5;
  *(_QWORD *)(a9 + 72) = a6;
  if (a7 >= a4)
    v17 = a4;
  else
    v17 = a7;
  *(_WORD *)(a9 + 8) = v17;
  *(_DWORD *)(a9 + 10) = 65537;
  *(_QWORD *)(a9 + 16) = a4;
  *(_QWORD *)(a9 + 24) = a7;
  *(_DWORD *)a9 = a3;
  *(_DWORD *)(a9 + 4) = a8;
  *(_QWORD *)(a9 + 32) = 16777473;
  v18 = IOAccelResourceCreate();
  **(_QWORD **)(a2 + 16) = v18;
  if (v18)
  {
    ClientShared = IOAccelResourceGetClientShared();
    v20 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(v20 + 8) = ClientShared;
    v21 = 1;
    *(_BYTE *)(*(_QWORD *)(v20 + 16) + 28) = 1;
    *(_QWORD *)(*(_QWORD *)(a2 + 16) + 24) = IOAccelResourceGetDataBytes();
  }
  else
  {
    v21 = 0;
  }
  IOAccelResourceRelease();
  return v21;
}

uint64_t gldCreateMemoryPlugin(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;

  v4 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 152), 0xD68DC258uLL);
  if (!v4)
    abort();
  v5 = v4;
  (*(void (**)(_QWORD *, void *))(a1[1] + 144))(a1, v4);
  *a2 = v5;
  return 0;
}

void gldGetMemoryPlugin(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    *a3 = v3;
    if (v3)
    {
      **(_DWORD **)(a2 + 8) |= 1u;
      v4 = *(_QWORD *)(v3 + 8);
      if (v4)
      {
        if (*(_DWORD *)(v4 + 260) == 192)
        {
          v5 = *(_QWORD *)(v3 + 16);
          if (*(_DWORD *)(v5 + 24) == 1)
          {
            *(_WORD *)v5 = 0;
            *(_WORD *)(v5 + 12) = 0;
          }
        }
      }
    }
  }
}

void gldSetMemoryPlugin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    v4 = *(_QWORD *)(a3 + 8);
    v3 = *(_QWORD *)(a3 + 16);
    *(_QWORD *)(a2 + 16) = a3;
    if (v3)
    {
      *(_BYTE *)(v3 + 28) = 1;
      if (*(_DWORD *)(v4 + 260) == 192)
      {
        *(_WORD *)(v3 + 12) = 0;
        *(_WORD *)v3 = 0;
      }
      **(_DWORD **)(a2 + 8) &= ~1u;
    }
  }
}

uint64_t gldFlushMemoryPlugin(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 24) != 1)
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 472))();
  }
  return result;
}

uint64_t gldTestMemoryPlugin(uint64_t a1, _QWORD *a2)
{
  if (*a2)
    return gpusCheckResource();
  else
    return 1;
}

uint64_t gldBufferSubData(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;

  v10 = (_BYTE *)a2[1];
  v11 = *v10;
  if (*v10 && !*(_BYTE *)(*a2 + 31))
  {
    v12 = *(_QWORD *)(a1 + 16);
    if (!*(_BYTE *)(v12 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v12 + 48)), v13 = (_BYTE *)a2[1], v11 = *v13, *v13))
    {
      if ((*(unsigned int (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), a2, v11))
      {
        LODWORD(v11) = 0;
        *(_DWORD *)a2[1] = 0;
      }
    }
    v14 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v14 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 48));
  }
  if ((_DWORD)v11)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 432))(a1, a2, a3, a4, a5);
}

uint64_t gldCopyBufferSubData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v12 = **(_DWORD **)(a2 + 8);
  v13 = **(_DWORD **)(a3 + 8);
  if (v13 | v12)
  {
    v14 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v14 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v14 + 48));
      LOBYTE(v12) = **(_BYTE **)(a2 + 8);
    }
    if ((_BYTE)v12
      && (*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), a2, v12))
    {
      LOBYTE(v12) = 0;
      **(_DWORD **)(a2 + 8) = 0;
    }
    v13 = **(unsigned __int8 **)(a3 + 8);
    if ((_BYTE)v12)
      v15 = 1;
    else
      v15 = v13 == 0;
    if (!v15
      && (*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), a3, **(unsigned __int8 **)(a3 + 8)))
    {
      LOBYTE(v13) = 0;
      **(_DWORD **)(a3 + 8) = 0;
    }
    v16 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v16 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v16 + 48));
  }
  if (v13 | v12)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 440))(a1, a2, a3, a4, a5, a6);
}

uint64_t gpumUpdateUniformBuffers(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = 0;
  while (1)
  {
    v3 = *(_QWORD **)(a1[5] + 8 * v2 + 328);
    if (!v3)
      goto LABEL_20;
    v4 = *v3;
    v5 = *(unsigned int *)(*v3 + 60);
    if ((int)v5 >= 1)
    {
      v6 = 0;
      v7 = 4 * v5;
      do
      {
        v8 = *(_QWORD *)(a1[5] + 8 * *(int *)(*v3 + v6 + 64) + 528);
        if (v8 && **(_BYTE **)(v8 + 8))
        {
          result = (*(uint64_t (**)(_QWORD, uint64_t))(a1[1] + 320))(a1[2], v8);
          if (!(_DWORD)result)
            return result;
          **(_DWORD **)(v8 + 8) = 0;
        }
        v6 += 4;
      }
      while (v7 != v6);
      v4 = *v3;
    }
    v10 = *(unsigned int *)(v4 + 28);
    if (!(_DWORD)v10)
      goto LABEL_20;
    if (*(_DWORD *)(v4 + 24))
      return 0;
    if ((*(_BYTE *)(v3[1] + 64) & 8) != 0 && (int)v10 >= 1)
    {
      v11 = 0;
      v12 = 8 * v10;
      do
      {
        v13 = *(_QWORD *)(*(_QWORD *)(v3[1] + 40) + v11);
        if (**(_BYTE **)(v13 + 8))
        {
          result = (*(uint64_t (**)(_QWORD, _QWORD))(a1[1] + 320))(a1[2], *(_QWORD *)(*(_QWORD *)(v3[1] + 40) + v11));
          if (!(_DWORD)result)
            return result;
          **(_DWORD **)(v13 + 8) = 0;
        }
        v11 += 8;
      }
      while (v12 != v11);
    }
LABEL_20:
    if (++v2 == 5)
      return 1;
  }
}

uint64_t gldGetBufferAllocationIdentifiers(uint64_t result, _DWORD *a2)
{
  uint64_t *v2;

  *a2 = 0;
  v2 = *(uint64_t **)(result + 16);
  if (v2)
  {
    result = *v2;
    if (*v2)
      return IOAccelResourceCreateAllocationIdentifierSet();
  }
  return result;
}

void gpus_ReturnContextErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnObjectErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnTextureErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnCmdBufferErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnTokenErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnNotPermittedKillClient()
{
  MEMORY[1] = -559038737;
}

uint64_t gpus_ReturnUnexpectedKillClient(uint64_t result)
{
  MEMORY[1] = result;
  return result;
}

void gpus_ReturnGuiltyForHardwareRestart()
{
  MEMORY[1] = -559038737;
}

void gpusGenerateCrashLog(uint64_t a1, int a2, uint64_t a3)
{
  if ((a2 & 0x20000000) != 0)
  {
    gpus_ReturnGuiltyForHardwareRestart();
  }
  else
  {
    switch((int)a3)
    {
      case -5:
        gpus_ReturnTokenErrorKillClient();
        break;
      case -4:
        gpus_ReturnCmdBufferErrorKillClient();
        break;
      case -3:
        gpus_ReturnTextureErrorKillClient();
        break;
      case -2:
        gpus_ReturnObjectErrorKillClient();
        break;
      case -1:
        gpus_ReturnContextErrorKillClient();
        break;
      default:
        if ((_DWORD)a3 == -536870174)
          gpus_ReturnNotPermittedKillClient();
        else
          gpus_ReturnUnexpectedKillClient(a3);
        break;
    }
  }
}

uint64_t gpumCreateComputeContext()
{
  return 10015;
}

uint64_t gpumDestroyComputeContext()
{
  return 10015;
}

uint64_t gpumCompCreateFence(_QWORD *a1, _QWORD *a2)
{
  _DWORD *v4;
  _DWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t result;
  int i;

  v4 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, 0x18uLL, 0xD68DC258uLL);
  if (!v4)
    abort();
  v5 = v4;
  v6 = a1[145];
  v7 = v6 >> 5;
  if ((v6 >> 5))
  {
    v8 = 0;
    v9 = (v6 >> 5);
    while (1)
    {
      v10 = *(_DWORD *)(a1[144] + 4 * v8);
      if (v10 != -1)
        break;
      if (v9 == ++v8)
        goto LABEL_9;
    }
  }
  else
  {
    LODWORD(v8) = 0;
    v10 = 0;
  }
  if ((_DWORD)v8 == (_DWORD)v7)
  {
LABEL_9:
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v4);
    v5 = 0;
    result = 10016;
  }
  else
  {
    for (i = 0; i != 32; ++i)
    {
      if (((v10 >> i) & 1) == 0)
        break;
    }
    result = 0;
    *(_DWORD *)(a1[144] + 4 * v8) |= 1 << i;
    v5[4] = i + 32 * v8;
    *((_BYTE *)v5 + 20) = 1;
  }
  *a2 = v5;
  return result;
}

void *__abort_malloc_zone_calloc(malloc_zone_t *a1, size_t size)
{
  void *result;

  result = malloc_type_zone_calloc(a1, 1uLL, size, 0xD68DC258uLL);
  if (!result)
    abort();
  return result;
}

uint64_t gpumCompTestFence(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;

  v2 = *(_BYTE *)(a2 + 20);
  if (v2)
    return v2;
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 1128) + 16 * *(unsigned int *)(a2 + 16)))
  {
    v2 = IOAccelDeviceTestEvent();
    *(_BYTE *)(a2 + 20) = v2;
    return v2;
  }
  return 0;
}

uint64_t gpumCompFinishFence(uint64_t a1, uint64_t a2)
{
  char v4;

  if (*(_BYTE *)(a2 + 20))
    return 1;
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 1128) + 16 * *(unsigned int *)(a2 + 16)))
  {
    v4 = IOAccelDeviceTestEvent();
    if ((v4 & 0xFE) == 0)
      v4 = 1;
    *(_BYTE *)(a2 + 20) = v4;
    return 1;
  }
  return 0;
}

void gpumCompDestroyFence(_QWORD *a1, unsigned int *a2)
{
  *(_DWORD *)(a1[144] + (((unint64_t)a2[4] >> 3) & 0x1FFFFFFC)) &= ~(1 << a2[4]);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
}

BOOL gpumCompGetFenceStatus(uint64_t a1, uint64_t a2, int *a3)
{
  int v4;
  BOOL v5;
  _BOOL8 result;
  int v7;

  v4 = gpumCompTestFence(a1, a2);
  v5 = v4 == 0;
  result = v4 != 0;
  if (v5)
    v7 = 3;
  else
    v7 = 1;
  *a3 = v7;
  return result;
}

uint64_t gpumCompGetFenceProfilingInfo()
{
  return 0;
}

uint64_t gldCreateQueue(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  vm_size_t v13;
  uint64_t *v14;
  unsigned int *v15;
  _QWORD **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t result;

  v7 = *(uint64_t **)(a1 + 8);
  v8 = *v7;
  v9 = malloc_type_zone_calloc(*(malloc_zone_t **)(*v7 + 232), 1uLL, *(_QWORD *)(*v7 + 160), 0xD68DC258uLL);
  if (!v9)
    abort();
  v10 = (uint64_t)v9;
  *v9 = v8;
  v9[1] = v7;
  v9[2] = a1;
  v9[3] = a4;
  *((_DWORD *)v9 + 8) = 0;
  v11 = IOAccelCLContextCreate();
  *(_QWORD *)(v10 + 40) = v11;
  if (!v11)
    goto LABEL_19;
  *(_QWORD *)(v10 + 1104) = 0;
  if (MEMORY[0x2207A9340](v11, v10 + 1104, v10 + 1112)
    || MEMORY[0x2207A9334](*(_QWORD *)(v10 + 40), v10 + 1136, v10 + 1152, v10 + 1120, v10 + 1128))
  {
LABEL_18:
    IOAccelCLContextRelease();
LABEL_19:
    malloc_zone_free(*(malloc_zone_t **)(v8 + 232), (void *)v10);
    return 10015;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  v12 = *(_QWORD *)(v10 + 1128);
  *(_QWORD *)(v10 + 1168) = v12 >> 6;
  v13 = 24 * (v12 >> 6);
  v14 = (uint64_t *)(v10 + 1184);
  *(_QWORD *)(v10 + 1200) = v13;
  *(_QWORD *)(v10 + 1192) = v13;
  *(_DWORD *)(v10 + 1208) = -2001041176;
  *(_BYTE *)(v10 + 1212) = 0;
  *(_DWORD *)(v10 + 1240) = -1;
  v15 = (unsigned int *)MEMORY[0x24BDAEC58];
  if (vm_allocate(*MEMORY[0x24BDAEC58], (vm_address_t *)(v10 + 1184), v13, 1))
  {
LABEL_17:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    goto LABEL_18;
  }
  *(_QWORD *)(v10 + 1144) = *(_QWORD *)(v10 + 1184);
  v16 = (_QWORD **)(v10 + 1176);
  if (gldCreateBuffer((_QWORD *)a1, (_QWORD *)(v10 + 1176), v10 + 1184, v10 + 1240))
  {
    v17 = *v15;
    v18 = *(_QWORD *)(v10 + 1184);
    v19 = *(_QWORD *)(v10 + 1200);
LABEL_16:
    MEMORY[0x2207A9640](v17, v18, v19);
    goto LABEL_17;
  }
  v20 = ((uint64_t (*)(uint64_t))v7[40])(a1);
  v21 = (uint64_t)*v16;
  if (!v20)
  {
    gldDestroyBuffer((_QWORD *)a1, (_QWORD *)v21);
    v17 = *v15;
    v18 = *(_QWORD *)(v10 + 1184);
LABEL_15:
    v19 = *(_QWORD *)(v10 + 1192);
    goto LABEL_16;
  }
  **(_DWORD **)(v21 + 8) = 0;
  *(_DWORD *)(v10 + 1084) = 16;
  if (gpusQueueSubmitDataBuffers(v10))
  {
    if (*v16)
      gldDestroyBuffer((_QWORD *)a1, *v16);
    v18 = *v14;
    if (!*v14)
      goto LABEL_17;
    v17 = *v15;
    goto LABEL_15;
  }
  *(_QWORD *)(v10 + 1160) = __abort_malloc_zone_calloc(*(malloc_zone_t **)(v8 + 232), (*(_QWORD *)(v10 + 1168) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
  ++*(_DWORD *)(a1 + 292);
  *(_BYTE *)(a1 + 288) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  ((void (*)(uint64_t))v7[6])(v10);
  result = 0;
  *a2 = v10;
  return result;
}

uint64_t gpusQueueSubmitDataBuffers(uint64_t a1)
{
  unint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  void (*v5)(void);
  int v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t DataBytes;
  uint64_t DataSize;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  int v15;

  v15 = 0;
  if (*(_DWORD *)(a1 + 1084))
  {
    v2 = 0;
    v3 = (_DWORD *)(a1 + 100);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x2207A9364](*(_QWORD *)(a1 + 40), v2);
      *(_QWORD *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 1084));
  }
  v4 = MEMORY[0x2207A9370](*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 1072), a1 + 1076, &v15);
  if (!(_DWORD)v4)
  {
    if ((*(_DWORD *)(a1 + 1076) & 0x20000000) != 0)
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
    }
    else
    {
      if (!v15)
        goto LABEL_10;
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
    }
    v5();
  }
LABEL_10:
  v6 = MEMORY[0x2207A931C](*(_QWORD *)(a1 + 40));
  *(_DWORD *)(a1 + 1084) = v6;
  if (v6)
  {
    v7 = 0;
    v8 = (_QWORD *)(a1 + 56);
    do
    {
      v8[4] = MEMORY[0x2207A9328](*(_QWORD *)(a1 + 40), v7);
      DataBytes = IOAccelResourceGetDataBytes();
      *(v8 - 1) = DataBytes;
      DataSize = IOAccelResourceGetDataSize();
      v11 = *(v8 - 1);
      *v8 = DataBytes + DataSize - 128;
      v8[1] = v11;
      v8[2] = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      *(_QWORD *)((char *)v8 + 44) = 0x100000000;
      ++v7;
      v8 += 8;
    }
    while (v7 < *(unsigned int *)(a1 + 1084));
  }
  *(_DWORD *)(a1 + 1072) = 0;
  v12 = *(unsigned int **)(a1 + 1104);
  v13 = *v12;
  *((_QWORD *)v12 + 2) = 131328;
  *(_QWORD *)(a1 + 1096) = &v12[v13 - 28];
  *(_QWORD *)(a1 + 1088) = v12 + 6;
  return v4;
}

uint64_t gldDestroyQueue(_QWORD *a1)
{
  void *v2;

  (*(void (**)(void))(a1[1] + 56))();
  gldDestroyBuffer((_QWORD *)a1[2], (_QWORD *)a1[147]);
  MEMORY[0x2207A9640](*MEMORY[0x24BDAEC58], a1[148], a1[149]);
  IOAccelCLContextRelease();
  v2 = (void *)a1[145];
  if (v2)
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v2);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a1);
  return 0;
}

uint64_t gldCreateComputeModule(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 168), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  (*(void (**)(_QWORD *, _QWORD *))(a1[1] + 160))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyComputeModule(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 168))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldCreateComputeProgram(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 176), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  (*(void (**)(_QWORD *, _QWORD *))(a1[1] + 176))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyComputeProgram(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 184))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldCreateKernel(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  _QWORD *v13;

  v12 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 184), 0xD68DC258uLL);
  if (!v12)
    abort();
  v13 = v12;
  *v12 = a4;
  v12[1] = a5;
  v12[2] = a6;
  (*(void (**)(_QWORD *, uint64_t, _QWORD *))(a1[1] + 192))(a1, a2, v12);
  *a3 = v13;
  return 0;
}

uint64_t gldDestroyKernel(_QWORD *a1, uint64_t a2, void *a3)
{
  (*(void (**)(void))(a1[1] + 200))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a3);
  return 0;
}

uint64_t gpusComputeSubmitDataBuffers(uint64_t a1)
{
  unint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  void (*v5)(void);
  int v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t DataBytes;
  uint64_t DataSize;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  int v15;
  int v16;

  v16 = 0;
  if (*(_DWORD *)(a1 + 1076))
  {
    v2 = 0;
    v3 = (_DWORD *)(a1 + 92);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x2207A9364](*(_QWORD *)(a1 + 32), v2);
      *(_QWORD *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 1076));
  }
  v4 = MEMORY[0x2207A9370](*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 1064), a1 + 1068, &v16);
  if ((_DWORD)v4)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  v15 = *(_DWORD *)(a1 + 1068);
  if ((v15 & 0x68000000) != 0)
  {
    if ((v15 & 0x8000000) != 0)
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
    goto LABEL_6;
  }
LABEL_7:
  v6 = MEMORY[0x2207A931C](*(_QWORD *)(a1 + 32));
  *(_DWORD *)(a1 + 1076) = v6;
  if (v6)
  {
    v7 = 0;
    v8 = (_QWORD *)(a1 + 48);
    do
    {
      v8[4] = MEMORY[0x2207A9328](*(_QWORD *)(a1 + 32), v7);
      DataBytes = IOAccelResourceGetDataBytes();
      *(v8 - 1) = DataBytes;
      DataSize = IOAccelResourceGetDataSize();
      v11 = *(v8 - 1);
      *v8 = DataBytes + DataSize - 128;
      v8[1] = v11;
      v8[2] = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      *(_QWORD *)((char *)v8 + 44) = 0x100000000;
      ++v7;
      v8 += 8;
    }
    while (v7 < *(unsigned int *)(a1 + 1076));
  }
  *(_DWORD *)(a1 + 1064) = 0;
  v12 = *(unsigned int **)(a1 + 1096);
  v13 = *v12;
  *((_QWORD *)v12 + 2) = 131328;
  *(_QWORD *)(a1 + 1088) = &v12[v13 - 28];
  *(_QWORD *)(a1 + 1080) = v12 + 6;
  return v4;
}

uint64_t gpusComputeGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t DataBytes;
  uint64_t DataSize;
  uint64_t v8;

  v4 = MEMORY[0x2207A9358](*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v4)
  {
    v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 92) += *(_DWORD *)(v5 + 56) - *(_DWORD *)(v5 + 40);
    *(_QWORD *)(v5 + 80) = MEMORY[0x2207A9328](*(_QWORD *)(a1 + 32), a2);
    DataBytes = IOAccelResourceGetDataBytes();
    *(_QWORD *)(v5 + 40) = DataBytes;
    DataSize = IOAccelResourceGetDataSize();
    v8 = *(_QWORD *)(v5 + 40);
    *(_QWORD *)(v5 + 48) = DataBytes + DataSize - 128;
    *(_QWORD *)(v5 + 56) = v8;
    *(_QWORD *)(v5 + 64) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 96);
  }
  return v4;
}

uint64_t gpusQueueGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t DataBytes;
  uint64_t DataSize;
  uint64_t v8;

  v4 = MEMORY[0x2207A9358](*(_QWORD *)(a1 + 40));
  if (!(_DWORD)v4)
  {
    v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 100) += *(_DWORD *)(v5 + 64) - *(_DWORD *)(v5 + 48);
    *(_QWORD *)(v5 + 88) = MEMORY[0x2207A9328](*(_QWORD *)(a1 + 40), a2);
    DataBytes = IOAccelResourceGetDataBytes();
    *(_QWORD *)(v5 + 48) = DataBytes;
    DataSize = IOAccelResourceGetDataSize();
    v8 = *(_QWORD *)(v5 + 48);
    *(_QWORD *)(v5 + 56) = DataBytes + DataSize - 128;
    *(_QWORD *)(v5 + 64) = v8;
    *(_QWORD *)(v5 + 72) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 104);
  }
  return v4;
}

uint64_t gldCreateContext(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v12;
  uint64_t v13;
  uint64_t result;
  int v15;
  int v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unsigned int v20;
  char v21;
  int v22;

  v12 = *(uint64_t **)(a1 + 8);
  v13 = *v12;
  *a2 = 0;
  result = ((uint64_t (*)(uint64_t *, uint64_t))v12[31])(v12, a3);
  if (!(_DWORD)result)
  {
    v15 = *(_DWORD *)(a3 + 52);
    v16 = *((_DWORD *)v12 + 149);
    if ((v16 & v15) != 0 && (v15 & ~v16) == 0)
    {
      v17 = malloc_type_zone_calloc(*(malloc_zone_t **)(v13 + 232), 1uLL, *(_QWORD *)(v13 + 80), 0xD68DC258uLL);
      if (!v17)
        abort();
      v18 = v17;
      __CFSetLastAllocationEventName();
      v19 = IOAccelGLContextCreate();
      v18[8] = v19;
      if (v19)
      {
        v18[271] = 0;
        if (MEMORY[0x2207A9430](v19, v18 + 271, v18 + 272)
          || MEMORY[0x2207A9424](v18[8], v18 + 275, v18 + 276, v18 + 273, v18 + 274)
          || (v18[278] = v18[274] >> 6,
              *((_DWORD *)v18 + 537) = 16,
              v18[1] = v12,
              gpusSubmitDataBuffers((uint64_t)v18)))
        {
          IOAccelGLContextRelease();
          malloc_zone_free(*(malloc_zone_t **)(v13 + 232), v18);
          return 10015;
        }
        else
        {
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
          v20 = *(_DWORD *)(a1 + 292) + 1;
          *(_DWORD *)(a1 + 292) = v20;
          if (v20 >= 3)
          {
            *(_BYTE *)(a1 + 288) = 1;
            glgSetTakeLock();
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
          *((_DWORD *)v18 + 20) = *(_DWORD *)(a1 + 296);
          v18[11] = v12[98];
          v18[277] = __abort_malloc_zone_calloc_0(*(malloc_zone_t **)(v13 + 232), (v18[278] >> 3) & 0x1FFFFFFFFFFFFFFCLL);
          if ((MEMORY[0xFFFFFC020] & 0x20) != 0)
          {
            v21 = 64;
          }
          else if ((MEMORY[0xFFFFFC020] & 0x40) != 0)
          {
            v21 = 0x80;
          }
          else
          {
            v21 = 32;
          }
          *((_BYTE *)v18 + 72) = v21;
          v18[19] = glgCreateProcessor();
          *v18 = v13;
          v18[1] = v12;
          v18[2] = a1;
          v18[3] = a5;
          v18[5] = a6;
          *((_BYTE *)v18 + 2366) = 1;
          *((_BYTE *)v18 + 2363) = 1;
          *((_DWORD *)v18 + 28) = 3;
          ((void (*)(_QWORD *, uint64_t))v12[4])(v18, a3);
          if ((v18[10] & 0x80) != 0)
            v22 = 1;
          else
            v22 = 3;
          *(_DWORD *)(a4 + 120) = v22;
          ((void (*)(_QWORD *, uint64_t, uint64_t))v12[32])(v18, a4, a3);
          result = 0;
          v18[4] = a4;
          *a2 = v18;
        }
      }
      else
      {
        return 10004;
      }
    }
    else
    {
      return 10006;
    }
  }
  return result;
}

void *__abort_malloc_zone_calloc_0(malloc_zone_t *a1, size_t size)
{
  void *result;

  result = malloc_type_zone_calloc(a1, 1uLL, size, 0xD68DC258uLL);
  if (!result)
    abort();
  return result;
}

uint64_t gpusSubmitDataBuffers(uint64_t a1)
{
  unint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  void (*v5)(void);
  int v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t DataBytes;
  unsigned int *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;

  v14 = 0;
  if (*(_DWORD *)(a1 + 2148))
  {
    v2 = 0;
    v3 = (_DWORD *)(a1 + 1164);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x2207A9460](*(_QWORD *)(a1 + 64), v2);
      *(_QWORD *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 2148));
  }
  v4 = MEMORY[0x2207A946C](*(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 2136), a1 + 2140, (char *)&v14 + 4, &v14, a1 + 2144);
  if ((_DWORD)v4)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  v13 = *(_DWORD *)(a1 + 2140);
  if ((v13 & 0x6C000000) != 0)
  {
    if ((v13 & 0x8000000) != 0)
    {
      *(_BYTE *)(a1 + 76) = 2;
      if (!no_crash_upon_reset && !*(_BYTE *)(a1 + 77))
      {
        v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
        goto LABEL_6;
      }
    }
    else if ((v13 & 0x20000000) != 0)
    {
      *(_BYTE *)(a1 + 76) = 1;
    }
  }
  else if (HIDWORD(v14))
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 504);
    goto LABEL_6;
  }
LABEL_7:
  v6 = MEMORY[0x2207A940C](*(_QWORD *)(a1 + 64));
  *(_DWORD *)(a1 + 2148) = v6;
  if (v6)
  {
    v7 = 0;
    v8 = (_QWORD *)(a1 + 1164);
    do
    {
      *(_QWORD *)((char *)v8 - 12) = MEMORY[0x2207A9418](*(_QWORD *)(a1 + 64), v7);
      DataBytes = IOAccelResourceGetDataBytes();
      *(_QWORD *)((char *)v8 - 52) = DataBytes;
      *(_QWORD *)((char *)v8 - 44) = DataBytes + IOAccelResourceGetDataSize() - 128;
      *(_QWORD *)((char *)v8 - 36) = *(_QWORD *)((char *)v8 - 52);
      *(_QWORD *)((char *)v8 - 28) = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      *v8 = 0x100000000;
      v8 += 8;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 2148));
  }
  *(_DWORD *)(a1 + 2136) = 0;
  v10 = *(unsigned int **)(a1 + 2168);
  v11 = *v10;
  *((_QWORD *)v10 + 2) = 131328;
  *(_QWORD *)(a1 + 2160) = &v10[v11 - 28];
  *(_QWORD *)(a1 + 2152) = v10 + 6;
  return v4;
}

uint64_t gldDestroyContext(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = a1[2];
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    if (!*(_BYTE *)(v2 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)), v4 = a1[2], (v3 = *(_QWORD *)(v4 + 24)) != 0))
    {
      do
      {
        gpuiCleanContextFromProgram((uint64_t)a1, v3);
        v3 = *(_QWORD *)(v3 + 32);
      }
      while (v3);
      v4 = a1[2];
    }
    if (*(_BYTE *)(v4 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 48));
  }
  gpuiReleaseDrawable(a1);
  (*(void (**)(_QWORD *))(a1[1] + 40))(a1);
  glgDestroyProcessor();
  IOAccelGLContextRelease();
  v5 = (void *)a1[277];
  if (v5)
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v5);
  v6 = *a1;
  if (*(_BYTE *)(*a1 + 231) && a1[103])
  {
    gpuiDestroyQueryBufferClientAlloc((uint64_t)a1);
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), (void *)a1[103]);
    v6 = *a1;
  }
  v7 = (void *)a1[280];
  if (v7)
  {
    malloc_zone_free(*(malloc_zone_t **)(v6 + 232), v7);
    v6 = *a1;
  }
  v8 = (void *)a1[102];
  if (v8)
  {
    malloc_zone_free(*(malloc_zone_t **)(v6 + 232), v8);
    v6 = *a1;
  }
  malloc_zone_free(*(malloc_zone_t **)(v6 + 232), a1);
  return 0;
}

void gldReclaimContext(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 472))();
  JUMPOUT(0x2207A943CLL);
}

uint64_t gpusGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t DataBytes;

  v4 = MEMORY[0x2207A9454](*(_QWORD *)(a1 + 64));
  if (!(_DWORD)v4)
  {
    v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 1164) += *(_DWORD *)(v5 + 1128) - *(_DWORD *)(v5 + 1112);
    *(_QWORD *)(v5 + 1152) = MEMORY[0x2207A9418](*(_QWORD *)(a1 + 64), a2);
    DataBytes = IOAccelResourceGetDataBytes();
    *(_QWORD *)(v5 + 1112) = DataBytes;
    *(_QWORD *)(v5 + 1120) = DataBytes + IOAccelResourceGetDataSize() - 128;
    *(_QWORD *)(v5 + 1128) = *(_QWORD *)(v5 + 1112);
    *(_QWORD *)(v5 + 1136) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 1168);
  }
  return v4;
}

uint64_t gpumCreateDevice(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t result;

  v8 = *(_DWORD *)(a4 + 216);
  v9 = *(_QWORD *)(a4 + 208);
  v10 = 0;
  if (v8)
  {
    while ((*(_DWORD *)(v9 + 596) & a2) == 0)
    {
      ++v10;
      v9 += *(_QWORD *)(a4 + 64);
      if (v8 == v10)
        return 10006;
    }
  }
  if (v10 == v8 || (a2 & ~*(_DWORD *)(v9 + 596)) != 0)
    return 10006;
  *(_DWORD *)a3 = *(_DWORD *)(v9 + 772);
  IORegistryEntryGetRegistryEntryID(*(_DWORD *)(v9 + 592), (uint64_t *)(a3 + 384));
  if ((*(_BYTE *)(v9 + 765) & 0x20) != 0)
    *(_BYTE *)(a3 + 5) = 1;
  *(_BYTE *)(a3 + 4) = 0;
  *(_QWORD *)(a3 + 392) = getpagesize();
  a5(v9, a3);
  result = 0;
  *(_QWORD *)(v9 + 8) = a3;
  *a1 = v9;
  return result;
}

uint64_t gldDestroyDevice()
{
  return 0;
}

uint64_t gldGetError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(unsigned int *)(a1 + 116);
  *(_DWORD *)(a1 + 116) = 0;
  if (!(_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 16);
    result = *(unsigned int *)(v3 + 300);
    *(_DWORD *)(v3 + 300) = 0;
  }
  return result;
}

uint64_t gpumAcquireFenceOnQueue(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)(a2 + 8) != result)
  {
    v3 = result;
    gldClearFence(result, a2);
    result = gpulAllocFenceIndexOnQueue(v3, (_DWORD *)(a2 + 16));
    if ((_DWORD)result)
      *(_QWORD *)(a2 + 8) = v3;
  }
  return result;
}

void gldClearFence(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  if (*(_QWORD *)a2)
  {
    v2 = (_QWORD *)(*(_QWORD *)a2 + 2216);
    v3 = (_QWORD *)a2;
  }
  else
  {
    v3 = (_QWORD *)(a2 + 8);
    v4 = *(_QWORD *)(a2 + 8);
    if (!v4)
      return;
    v2 = (_QWORD *)(v4 + 1160);
  }
  *(_DWORD *)(*v2 + (((unint64_t)*(unsigned int *)(a2 + 16) >> 3) & 0x1FFFFFFC)) &= ~(1 << *(_DWORD *)(a2 + 16));
  *v3 = 0;
  *(_BYTE *)(a2 + 20) = 1;
  *(_DWORD *)(a2 + 16) = -1;
}

uint64_t gpulAllocFenceIndexOnQueue(uint64_t a1, _DWORD *a2)
{
  unsigned int v3;
  vm_map_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  uint64_t result;
  int i;
  vm_address_t address;

  v3 = 0;
  v4 = (vm_map_t *)MEMORY[0x24BDAEC58];
  v5 = *(_QWORD *)(a1 + 1168);
  v6 = v5 >> 5;
  if ((v5 >> 5))
  {
    v7 = 0;
    v8 = (v5 >> 5);
    while (1)
    {
      v3 = *(_DWORD *)(*(_QWORD *)(a1 + 1160) + 4 * v7);
      if (v3 != -1)
        break;
      if (v8 == ++v7)
        goto LABEL_8;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }
  if ((_DWORD)v7 == (_DWORD)v6)
  {
LABEL_8:
    if (!MEMORY[0x2207A9334](*(_QWORD *)(a1 + 40), a1 + 1136, a1 + 1152, a1 + 1120, a1 + 1128))
    {
      address = 0;
      v9 = *(_QWORD *)(a1 + 1128);
      *(_QWORD *)(a1 + 1168) = v9 >> 6;
      v10 = (v9 >> 9) & 0x7FFFFFFFFFFFFCLL;
      v11 = (char *)malloc_type_zone_realloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), *(void **)(a1 + 1160), v10, 0xDB6CA469uLL);
      if (!v11)
        abort();
      *(_QWORD *)(a1 + 1160) = v11;
      bzero(&v11[v10 >> 1], v10 >> 1);
      if (!vm_allocate(*v4, &address, 24 * *(_QWORD *)(a1 + 1168), 1))
        gpusFinishQueueResourceUsingFlushFunc();
    }
    return 0;
  }
  else
  {
    for (i = 0; i != 32; ++i)
    {
      if (((v3 >> i) & 1) == 0)
        break;
    }
    result = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 1160) + 4 * v7) |= 1 << i;
    *a2 = i + 32 * v7;
  }
  return result;
}

uint64_t gpumAcquireFenceOnQueueNolock(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)(a2 + 8) != result)
  {
    v3 = result;
    gldClearFence(result, a2);
    result = gpulAllocFenceIndexOnQueue(v3, (_DWORD *)(a2 + 16));
    if ((_DWORD)result)
      *(_QWORD *)(a2 + 8) = v3;
  }
  return result;
}

uint64_t gpumSetFenceOnQueue(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 464))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(a2 + 20) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 1136) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldCreateFence(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;

  v3 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, 0x18uLL, 0xD68DC258uLL);
  if (!v3)
    abort();
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)v3 + 20) = 1;
  *((_DWORD *)v3 + 4) = -1;
  *a2 = v3;
  return 0;
}

uint64_t gldDestroyFence(uint64_t a1, void *a2)
{
  gldClearFence(a1, (uint64_t)a2);
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), a2);
  return 0;
}

uint64_t gldSetFenceOnContext(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  size_t v11;
  char *v12;
  int i;

  if (*(_QWORD *)a2 != a1)
  {
    gldClearFence(a1, a2);
    v4 = 0;
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 2224);
      v6 = v5 >> 5;
      if ((v5 >> 5))
      {
        v7 = 0;
        v8 = (v5 >> 5);
        while (1)
        {
          v4 = *(_DWORD *)(*(_QWORD *)(a1 + 2216) + 4 * v7);
          if (v4 != -1)
            break;
          if (v8 == ++v7)
          {
            v4 = -1;
            goto LABEL_10;
          }
        }
      }
      else
      {
        LODWORD(v7) = 0;
      }
      if ((_DWORD)v7 != (_DWORD)v6)
        break;
LABEL_10:
      result = MEMORY[0x2207A9424](*(_QWORD *)(a1 + 64), a1 + 2200, a1 + 2208, a1 + 2184, a1 + 2192);
      if ((_DWORD)result)
        return result;
      v10 = *(_QWORD *)(a1 + 2192);
      *(_QWORD *)(a1 + 2224) = v10 >> 6;
      v11 = (v10 >> 9) & 0x7FFFFFFFFFFFFCLL;
      v12 = (char *)malloc_type_zone_realloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), *(void **)(a1 + 2216), v11, 0xDB6CA469uLL);
      if (!v12)
        abort();
      *(_QWORD *)(a1 + 2216) = v12;
      bzero(&v12[v11 >> 1], v11 >> 1);
    }
    for (i = 0; i != 32; ++i)
    {
      if (((v4 >> i) & 1) == 0)
        break;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 2216) + 4 * v7) |= 1 << i;
    *(_DWORD *)(a2 + 16) = i + 32 * v7;
    *(_QWORD *)a2 = a1;
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 456))(a1, a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(a2 + 20) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 2200) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldSetFenceOnQueue(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  gpumAcquireFenceOnQueue(a1, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 464))(a1, a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(a2 + 20) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 1136) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldFlushFenceOnQueue(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 20) && *(_QWORD *)(a2 + 8) == result)
  {
    if (*(_DWORD *)(*(_QWORD *)(result + 1136) + 16 * *(unsigned int *)(a2 + 16)))
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 480))();
  }
  return result;
}

uint64_t gldFinishFenceOnQueue(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  if (*(_BYTE *)(a2 + 20))
    return 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(_DWORD *)(*(_QWORD *)(v4 + 1136) + 16 * *(unsigned int *)(a2 + 16)))
  {
    if (v4 != a1)
      return 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 480))();
  }
  v5 = IOAccelDeviceTestEvent();
  *(_BYTE *)(a2 + 20) = v5;
  if (!v5)
  {
    MEMORY[0x2207A9304](*(_QWORD *)(v4 + 40), *(unsigned int *)(a2 + 16));
    *(_BYTE *)(a2 + 20) = 1;
  }
  result = *(unsigned int *)(v4 + 32);
  if ((_DWORD)result)
    *(_DWORD *)(v4 + 32) = 0;
  return result;
}

uint64_t gldGetFenceStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  if (*(_BYTE *)(a2 + 20))
    return 3;
  if (!*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    if (!v4)
      return 3;
    if (!*(_DWORD *)(*(_QWORD *)(v4 + 1136) + 16 * *(unsigned int *)(a2 + 16)))
      goto LABEL_9;
    return 0;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 2200) + 16 * *(unsigned int *)(a2 + 16)))
    return 0;
LABEL_9:
  v5 = IOAccelDeviceTestEvent();
  *(_BYTE *)(a2 + 20) = v5;
  if (v5)
    return 3;
  else
    return 1;
}

uint64_t gpuiTestFence(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  LOBYTE(v3) = *(_BYTE *)(a2 + 20);
  if ((_BYTE)v3)
    return v3;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 2200) + 16 * *(unsigned int *)(a2 + 16)))
  {
LABEL_6:
    LOBYTE(v3) = IOAccelDeviceTestEvent();
    *(_BYTE *)(a2 + 20) = v3;
    return v3;
  }
  v3 = 0;
  if (a3 && *(_QWORD *)a2 == a1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 472))();
    goto LABEL_6;
  }
  return v3;
}

uint64_t gpuiFlushFence(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 20) && *(_QWORD *)a2 == result)
  {
    if (*(_DWORD *)(*(_QWORD *)(result + 2200) + 16 * *(unsigned int *)(a2 + 16)))
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 472))();
  }
  return result;
}

uint64_t gpuiFinishFence(uint64_t result, uint64_t *a2)
{
  uint64_t v3;

  if (!*((_BYTE *)a2 + 20))
  {
    v3 = *a2;
    if (*(_DWORD *)(*(_QWORD *)(*a2 + 2200) + 16 * *((unsigned int *)a2 + 4)))
    {
      if (v3 != result)
        return result;
      (*(void (**)(void))(*(_QWORD *)(result + 8) + 472))();
    }
    result = IOAccelDeviceTestEvent();
    *((_BYTE *)a2 + 20) = result;
    if (!(_BYTE)result)
    {
      result = MEMORY[0x2207A93E8](*(_QWORD *)(v3 + 64), *((unsigned int *)a2 + 4));
      *((_BYTE *)a2 + 20) = 1;
    }
  }
  return result;
}

void gpuiWaitForFence(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  if (!*((_BYTE *)a2 + 20))
  {
    v3 = *a2;
    if (*a2)
    {
      if (*(_DWORD *)(*(_QWORD *)(v3 + 2200) + 16 * *((unsigned int *)a2 + 4)))
        return;
      v4 = IOAccelDeviceTestEvent();
      *((_BYTE *)a2 + 20) = v4;
      if (v4)
        return;
      MEMORY[0x2207A93E8](*(_QWORD *)(v3 + 64), *((unsigned int *)a2 + 4));
    }
    else
    {
      v5 = a2[1];
      if (!v5)
        return;
      if (*(_DWORD *)(*(_QWORD *)(v5 + 1136) + 16 * *((unsigned int *)a2 + 4)))
        return;
      v6 = IOAccelDeviceTestEvent();
      *((_BYTE *)a2 + 20) = v6;
      if (v6)
        return;
      MEMORY[0x2207A9304](*(_QWORD *)(v5 + 40), *((unsigned int *)a2 + 4));
    }
    *((_BYTE *)a2 + 20) = 1;
  }
}

uint64_t gpumChoosePixelFormat(char **a1, int *a2, uint64_t a3, uint64_t (*a4)(uint64_t *, unint64_t, _QWORD, _QWORD))
{
  int v6;
  int v7;
  char v8;
  unsigned int v9;
  signed int v10;
  signed int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int *v16;
  int v17;
  int *v18;
  uint64_t v19;
  int v20;
  int v21;
  signed int v22;
  signed int v23;
  signed int v24;
  signed int v25;
  int v26;
  int v27;
  __int128 v28;
  BOOL v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  __int16 v36;
  int v37;
  _BOOL4 v38;
  unint64_t v39;
  int v40;
  int v41;
  unint64_t v42;
  int v43;
  char v44;
  uint8x8_t v45;
  unsigned int v46;
  int v47;
  char v48;
  int v49;
  int v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  _OWORD *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  __int128 v66;
  uint64_t v67;
  char **v68;
  char *v69;
  int v71;
  char *ptr;
  uint64_t v73;
  unint64_t v74;
  int v75;
  __int16 v76;
  int v77;
  unsigned int v78;
  int v79;
  int v80;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  int v85;
  uint64_t v86;
  int v87;
  int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  int v92;
  int v93;
  __int16 v94;
  __int16 v95;
  __int16 v96;
  __int16 v97;
  int v98;
  char v99;
  __int16 v100;
  char v101;
  int v102;
  uint64_t v103;

  v82 = 0;
  v84 = 0;
  v83 = 0;
  LOWORD(v6) = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v103 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  v85 = *(_DWORD *)(a3 + 220);
  v14 = 16777212;
  v15 = 1280;
  v16 = a2;
  while (2)
  {
    v17 = *v16;
    if (*v16)
    {
      v18 = v16 + 1;
      v19 = 10000;
      switch(v17)
      {
        case '3':
          HIDWORD(v82) = 1;
          goto LABEL_48;
        case '4':
          LODWORD(v83) = 1;
          goto LABEL_48;
        case '5':
          v15 |= 4u;
          goto LABEL_48;
        case '6':
          v15 |= 2u;
          goto LABEL_48;
        case '7':
          v21 = *v18;
          if (*v18 < 0)
            return 10008;
          v18 = v16 + 2;
          HIDWORD(v83) = (unsigned __int16)v21;
          goto LABEL_48;
        case '8':
          v6 = *v18;
          if (*v18 < 0)
            return 10008;
LABEL_28:
          v18 = v16 + 2;
LABEL_48:
          v16 = v18;
          if ((char *)v18 - (char *)a2 <= 192)
            continue;
          v19 = 10000;
          break;
        case '9':
          v15 |= 0x800u;
          goto LABEL_48;
        case ':':
          v14 = 1056964608;
          goto LABEL_48;
        case ';':
          v7 = 2;
          goto LABEL_48;
        case '<':
          v7 = 1;
          goto LABEL_48;
        case '=':
          v8 = 1;
          goto LABEL_48;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'Q':
        case 'R':
        case 'S':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
          return v19;
        case 'L':
          v15 |= 8u;
          goto LABEL_48;
        case 'M':
          v15 |= 0x10u;
          goto LABEL_48;
        case 'P':
          v15 |= 1u;
          goto LABEL_48;
        case 'T':
          v18 = v16 + 2;
          v85 &= v16[1];
          goto LABEL_48;
        case 'Z':
          v15 |= 0x2000u;
          goto LABEL_48;
        default:
          switch(v17)
          {
            case 3:
              v20 = v84 | 0x18;
              goto LABEL_26;
            case 4:
              goto LABEL_48;
            case 5:
              v20 = v84 | 8;
              goto LABEL_26;
            case 6:
              v20 = v84 | 2;
LABEL_26:
              v84 = v20;
              goto LABEL_48;
            case 7:
              LODWORD(v82) = *v18;
              if ((*v18 & 0x80000000) == 0)
                goto LABEL_28;
              return 10008;
            case 8:
              v22 = *v18;
              if (*v18 < 0)
                return 10008;
              v18 = v16 + 2;
              if (v22 > (int)v9)
                v9 = v22;
              break;
            case 11:
              v23 = *v18;
              if (*v18 < 0)
                return 10008;
              v18 = v16 + 2;
              if (v23 > (int)v13)
                v13 = v23;
              break;
            case 12:
              v24 = *v18;
              if (*v18 < 0)
                return 10008;
              v18 = v16 + 2;
              if (v24 > v10)
                v10 = v24;
              break;
            case 13:
              v25 = *v18;
              if (*v18 < 0)
                return 10008;
              v18 = v16 + 2;
              if (v25 > v11)
                v11 = v25;
              break;
            case 14:
              v26 = *v18;
              if (*v18 < 0)
                return 10008;
              v18 = v16 + 2;
              if (v26 > v12)
                v12 = v26;
              break;
            default:
              return v19;
          }
          goto LABEL_48;
      }
    }
    else
    {
      v77 = v15;
      v27 = v7;
      v80 = gpulGLIBitsGE(v11);
      v79 = gpulGLIBitsGE(v10);
      v29 = (int)v13 < 9 && (int)v9 < 33;
      v30 = v14 & 0x3F0FFFFC;
      if (!v29)
        v30 = v14;
      if (v9 <= 0x100)
      {
        if (v9 <= 0x80)
        {
          if (v9 <= 0x40)
          {
            if (v9 <= 0x20)
            {
              if (v9 <= 0x10)
              {
                if (v9 <= 8)
                {
                  if (v9)
                    v31 = 1073741820;
                  else
                    v31 = -1073741828;
                }
                else
                {
                  v31 = 1073741760;
                }
              }
              else
              {
                v31 = 1073725440;
              }
            }
            else
            {
              v31 = 1072693248;
            }
          }
          else
          {
            v31 = 201326592;
          }
        }
        else
        {
          v31 = 805306368;
        }
      }
      else
      {
        v31 = 0;
      }
      v32 = v77;
      if (v13 <= 0x20)
      {
        if (v13 <= 0x10)
        {
          if (v13 <= 0xC)
          {
            if (v13 <= 8)
            {
              v33 = 178891048;
              if (v13 <= 4)
              {
                if (v13 <= 2)
                {
                  if (v13)
                    v34 = 179154344;
                  else
                    v34 = -1073741828;
                  if (v13 == 2)
                    v33 = 179153320;
                  else
                    v33 = v34;
                }
                else
                {
                  v33 = 178891176;
                }
              }
            }
            else
            {
              v33 = 178257920;
            }
          }
          else
          {
            v33 = 176160768;
          }
        }
        else
        {
          v33 = 0x8000000;
        }
      }
      else
      {
        v33 = 0;
      }
      if (v12)
        v35 = 0x8000000;
      else
        v35 = 0x80000000;
      v78 = v35;
      if (HIDWORD(v83))
        v36 = v6;
      else
        v36 = 0;
      v76 = v36;
      if (HIDWORD(v83))
        v37 = v27;
      else
        v37 = 0;
      if (!HIDWORD(v83))
        v8 = 0;
      v38 = (v32 & 0x2006) == 0;
      if (*(_DWORD *)(a3 + 216))
      {
        v39 = 0;
        v71 = 0;
        ptr = 0;
        v73 = a3;
        v40 = v30 & 0x3FFFFFFC & v31 & v33;
        v41 = v32 | v38;
        v75 = v32 | v38 | 0x200;
        do
        {
          v42 = *(_QWORD *)(a3 + 208) + *(_QWORD *)(a3 + 64) * v39;
          v43 = *(_DWORD *)(v42 + 596) & v85;
          if (v43)
          {
            v44 = 0;
            LODWORD(v28) = *(_DWORD *)(v42 + 596) & v85;
            v45 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v28);
            v45.i16[0] = vaddlv_u8(v45);
            v46 = v45.i32[0];
            v74 = v39;
            v47 = ((_DWORD)v39 << 24) + 0x1000000;
            v48 = 1;
            while (1)
            {
              v86 = 0;
              v87 = 0;
              v88 = v41;
              v89 = v84;
              v90 = v40;
              v91 = v78;
              v92 = v79;
              v93 = v80;
              v94 = 0;
              v95 = v82;
              v96 = WORD2(v83);
              v97 = v76;
              v98 = v37;
              v99 = v8;
              v100 = 0;
              v101 = 0;
              v102 = v85;
              if ((v44 & 1) != 0)
                v89 = v84 & 0xFFFFFFEF;
              if (v46 >= 2)
                v88 = v75;
              v87 = *(_DWORD *)(v42 + 780) | v47;
              v102 = v43;
              v49 = a4(&v86, v42, HIDWORD(v82), v83);
              if (v49)
                break;
              v50 = *(_DWORD *)&v48 & ((v89 & 0x10) >> 4);
              v44 = 1;
              v48 = 0;
              if ((v50 & 1) == 0)
              {
                a3 = v73;
                v39 = v74;
                goto LABEL_123;
              }
            }
            v51 = (v49 + v71);
            v52 = (char *)malloc_type_zone_malloc(*(malloc_zone_t **)(v73 + 232), 56 * (int)v51, 0x1357CB10uLL);
            if (!v52)
              abort();
            v53 = v52;
            v39 = v74;
            if (v71 < 1)
            {
              v61 = 0;
              v57 = v51;
            }
            else
            {
              v54 = v71;
              v55 = v52 + 56;
              v56 = ptr;
              v57 = v51;
              do
              {
                v58 = v56[1];
                v28 = v56[2];
                v59 = *((_QWORD *)v56 + 6);
                v60 = *v56;
                v56 = (_OWORD *)((char *)v56 + 56);
                *(_OWORD *)(v55 - 56) = v60;
                *((_QWORD *)v55 - 1) = v59;
                *(_OWORD *)(v55 - 24) = v28;
                *(_OWORD *)(v55 - 40) = v58;
                *((_QWORD *)v55 - 7) = v55;
                v55 += 56;
                --v54;
              }
              while (v54);
              v61 = v71;
            }
            a3 = v73;
            if ((int)v61 < (int)v57)
            {
              v62 = v61 - v71;
              v63 = (uint64_t)&v52[56 * v61 + 56];
              v64 = v57 - v61;
              do
              {
                v65 = &v86 + 7 * v62;
                v66 = *((_OWORD *)v65 + 1);
                v28 = *((_OWORD *)v65 + 2);
                v67 = v65[6];
                *(_OWORD *)(v63 - 56) = *(_OWORD *)v65;
                *(_QWORD *)(v63 - 8) = v67;
                *(_OWORD *)(v63 - 24) = v28;
                *(_OWORD *)(v63 - 40) = v66;
                *(_QWORD *)(v63 - 56) = v63;
                ++v62;
                v63 += 56;
                --v64;
              }
              while (v64);
              v61 = v57;
            }
            *(_QWORD *)&v52[56 * (v61 - 1)] = 0;
            if (ptr)
              malloc_zone_free(*(malloc_zone_t **)(v73 + 232), ptr);
            ptr = v53;
            v71 = v57;
          }
LABEL_123:
          ++v39;
        }
        while (v39 < *(unsigned int *)(a3 + 216));
        v68 = a1;
        v69 = ptr;
        if (ptr && v71 <= 0)
        {
          malloc_zone_free(*(malloc_zone_t **)(a3 + 232), ptr);
          v69 = 0;
        }
      }
      else
      {
        v69 = 0;
        v68 = a1;
      }
      v19 = 0;
      *v68 = v69;
    }
    return v19;
  }
}

uint64_t gpulGLIBitsGE(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0x10000;
  if (a1 > 0x5F)
    return 98304;
  if (a1 > 0x3F)
    return 114688;
  if (a1 > 0x2F)
    return 122880;
  if (a1 > 0x1F)
    return 126976;
  if (a1 > 0x17)
    return 129024;
  if (a1 > 0xF)
    return 130048;
  if (a1 > 0xB)
    return 130560;
  if (a1 > 9)
    return 130816;
  if (a1 > 7)
    return 130944;
  if (a1 > 5)
    return 131008;
  if (a1 == 5)
    return 131040;
  if (a1 > 3)
    return 131056;
  if (a1 == 3)
    return 131064;
  if (a1 > 1)
    return 131068;
  if (a1 == 1)
    return 131070;
  return 0x3FFFFLL;
}

uint64_t gpumDestroyPixelFormat(void *ptr, uint64_t a2)
{
  if (ptr)
    malloc_zone_free(*(malloc_zone_t **)(a2 + 232), ptr);
  return 0;
}

uint64_t gldCreateFramebuffer(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 96), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  *((_DWORD *)v8 + 4) = 0;
  (*(void (**)(_QWORD *, _QWORD *))(a1[1] + 64))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyFramebuffer(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 72))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldUnbindFramebuffer(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  v3 = result;
  if (*(_QWORD *)(result + 48) == a2)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(result + 8) + 352))(result, 0);
    *(_QWORD *)(v3 + 48) = 0;
    *(_DWORD *)(v3 + 840) = 0;
  }
  if (*(_QWORD *)(v3 + 56) == a2)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 8) + 360))(v3, 0);
    *(_QWORD *)(v3 + 56) = 0;
    *(_DWORD *)(v3 + 844) = 0;
  }
  return result;
}

BOOL gldLoadFramebuffer(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;

  v4 = *(_DWORD *)(*(_QWORD *)a2 + 200);
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  for (*(_BYTE *)(*(_QWORD *)(a2 + 8) + 81) = 1; v4; v4 ^= 1 << v5)
  {
    v5 = __clz(__rbit32(v4));
    v6 = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8 * v5);
    if (*(_BYTE *)(*(_QWORD *)(v6 + 8) + 20))
    {
      v7 = *(_DWORD *)(a1 + 316) + 1;
      *(_DWORD *)(a1 + 316) = v7;
      *(_DWORD *)(v6 + 56) = v7;
      if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 296))(a1, v6))
        goto LABEL_9;
      v8 = *(_QWORD *)(v6 + 8);
      *(_QWORD *)(v8 + 13) = 0;
      *(_QWORD *)(v8 + 8) = 0;
    }
  }
  v9 = *(_DWORD *)(a1 + 312) + 1;
  *(_DWORD *)(a1 + 312) = v9;
  *(_DWORD *)(a2 + 16) = v9;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 264))(a1, a2, 7);
  v11 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(v11 + 81) = v10 == 0;
  *(_BYTE *)(v11 + 80) = 0;
LABEL_9:
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return *(_BYTE *)(*(_QWORD *)(a2 + 8) + 81) == 0;
}

uint64_t gldUpdateReadFramebuffer(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (a2 < 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(v3 + 424);
    if (v4)
    {
      gpulCheckForFramebufferIOSurfaceChanges(*(_QWORD *)(a1 + 16), *(_QWORD **)(v3 + 424));
      v5 = *(_DWORD *)(v4 + 16);
      if (*(_DWORD *)(a1 + 844) != v5)
      {
        *(_DWORD *)(a1 + 844) = v5;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 360))(a1, v4);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 844) = 0;
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 360))(a1, 0);
    }
    *(_QWORD *)(a1 + 56) = v4;
  }
  return 1;
}

uint64_t gpulCheckForFramebufferIOSurfaceChanges(uint64_t a1, _QWORD *a2)
{
  unsigned int i;
  unsigned int v4;
  uint64_t result;

  for (i = *(_DWORD *)(*a2 + 200); i; i ^= 1 << v4)
  {
    v4 = __clz(__rbit32(i));
    if ((***(_WORD ***)(a2[1] + 8 * v4) & 0x800) != 0)
      result = IOSurfaceBindAccel();
  }
  return result;
}

uint64_t gldUpdateDrawFramebuffer(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  if ((a2 & 0x40000000) == 0)
  {
    if ((a2 & 0x43C0478) == 0)
      goto LABEL_10;
LABEL_9:
    (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 328))(a1);
    goto LABEL_10;
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 416);
  if (v5)
  {
    gpulCheckForFramebufferIOSurfaceChanges(*(_QWORD *)(a1 + 16), *(_QWORD **)(v4 + 416));
    v6 = *(_DWORD *)(v5 + 16);
    if (*(_DWORD *)(a1 + 840) != v6)
    {
      *(_DWORD *)(a1 + 840) = v6;
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 352))(a1, v5);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 840) = 0;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 352))(a1, 0);
  }
  *(_QWORD *)(a1 + 48) = v5;
  v7 = *(_DWORD *)(a1 + 832) | a2 & 0x43C0478;
  *(_DWORD *)(a1 + 832) = 0;
  if (v7)
    goto LABEL_9;
LABEL_10:
  if (*(_DWORD *)(a1 + 836))
    return 2;
  else
    return 1;
}

uint64_t gldUpdateTransformFeedbackState(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 336))();
  return 0;
}

uint64_t gldPopulateRendererInfo(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  *(_QWORD *)a2 = 0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 8) + 5))
    v2 = 566683;
  else
    v2 = 42395;
  v3 = *(_DWORD *)(a1 + 596);
  *(_DWORD *)(a2 + 8) = ((*(_DWORD *)(a1 + 776) << 24) + 0x1000000) | *(_DWORD *)(a1 + 780);
  *(_DWORD *)(a2 + 12) = v2;
  *(_QWORD *)(a2 + 52) = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 384);
  *(_OWORD *)(a2 + 16) = xmmword_21E042C70;
  *(_DWORD *)(a2 + 32) = 128;
  *(_DWORD *)(a2 + 36) = v3;
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 43) = 0;
  *(_QWORD *)(a2 + 68) = 0;
  *(_QWORD *)(a2 + 60) = 0;
  *(_QWORD *)(a2 + 76) = (*(_QWORD *)(a1 + 792) >> 20);
  *(_DWORD *)(a2 + 84) = *(_QWORD *)(a1 + 784) >> 20;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  (*(void (**)(uint64_t, uint64_t))(a1 + 240))(a2, a1);
  return 0;
}

void gpumInitializeIOData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, void (*a8)(uint64_t))
{
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t);
  uint64_t Connect;
  _DWORD v23[96];
  uint64_t v24;

  v9 = 0;
  v10 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a7 = a4;
  *(_QWORD *)(a7 + 8) = a5;
  *(_DWORD *)(a7 + 220) = a3;
  *(_DWORD *)(a7 + 224) = a6;
  *(_BYTE *)(a7 + 230) = a6;
  do
  {
    v11 = 1 << v9;
    v23[v9 + 64] = 0;
    v23[v9 + 32] = 0;
    v23[v9] = 0;
    v12 = v10;
    if (((1 << v9) & a3) != 0)
    {
      v13 = *(_DWORD *)(a1 + 4 * v9);
      if (!v10)
        goto LABEL_11;
      v14 = 0;
      while (v23[v14 + 64] != v13)
      {
        if (v10 == (_DWORD)++v14)
          goto LABEL_11;
      }
      if ((v14 & 0x80000000) != 0)
      {
LABEL_11:
        v23[v10++ + 64] = v13;
        v23[v12 + 32] |= v11;
      }
      else
      {
        v23[v14 + 32] |= v11;
        ++v23[v14];
      }
    }
    ++v9;
  }
  while (v9 != 32);
  a8(a7);
  if (v10)
  {
    v15 = v10;
    v16 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(a7 + 232), 1uLL, *(_QWORD *)(a7 + 64) * v10, 0xD68DC258uLL);
    if (!v16)
      abort();
    v17 = v16;
    v18 = 0;
    *(_QWORD *)(a7 + 208) = v16;
    while (1)
    {
      v19 = &v17[*(_QWORD *)(a7 + 64) * v18];
      *((_DWORD *)v19 + 194) = v18;
      *(_QWORD *)v19 = a7;
      *((_DWORD *)v19 + 148) = v23[v18 + 64];
      *((_DWORD *)v19 + 149) = v23[v18 + 32];
      *((_DWORD *)v19 + 150) = v23[v18];
      v20 = IOAccelDeviceCreateWithAPIProperty();
      if (!v20)
        break;
      *((_QWORD *)v19 + 73) = v20;
      if (IOAccelDeviceGetConfig64())
        break;
      v21 = *(unsigned int (**)(char *, uint64_t))(a7 + 16);
      Connect = IOAccelDeviceGetConnect();
      if (v21(v19, Connect))
        break;
      if (v15 == ++v18)
      {
        LODWORD(v18) = v15;
        break;
      }
    }
    *(_DWORD *)(a7 + 216) = v18;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    gpumInitializeIOData_cold_1();
  }
}

void gpumTerminateIOData(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t i;
  char *v5;

  v2 = *(char **)(a1 + 208);
  v3 = *(unsigned int *)(a1 + 216);
  if ((_DWORD)v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = &v2[*(_QWORD *)(a1 + 64) * i];
      (*(void (**)(char *))(a1 + 24))(v5);
      IOAccelDeviceRelease();
      *((_QWORD *)v5 + 73) = 0;
    }
    v2 = *(char **)(a1 + 208);
  }
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
  {
    malloc_zone_free(*(malloc_zone_t **)(a1 + 232), v2);
    *(_QWORD *)(a1 + 208) = 0;
  }
}

uint64_t gldSetInteger(uint64_t a1, int a2, int *a3)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t (*v16)(void);
  unint64_t v17;
  unint64_t i;
  uint64_t v19;
  _DWORD *v20;
  _QWORD *v21;

  if (!a3)
    return 10014;
  if (a2 > 665)
  {
    if (a2 > 700)
    {
      if (a2 == 701)
        return 0;
      if (a2 == 1402)
      {
        result = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 16) + 308) = *a3 != 0;
        return result;
      }
      goto LABEL_31;
    }
    if (a2 == 666)
    {
      v7 = *(_DWORD *)(a1 + 144);
      result = 0;
      if (*a3)
        v6 = v7 & 0xFFFFFDFF;
      else
        v6 = v7 | 0x200;
    }
    else
    {
      if (a2 != 667)
      {
LABEL_31:
        v16 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 496);
        return v16();
      }
      v5 = *(_DWORD *)(a1 + 144);
      result = 0;
      if (*a3)
        v6 = v5 & 0xFFDFFFFF;
      else
        v6 = v5 | 0x200000;
    }
    *(_DWORD *)(a1 + 144) = v6;
    return result;
  }
  if (a2 <= 606)
  {
    if (a2 == 318)
    {
      result = 0;
      *(_BYTE *)(a1 + 77) = *a3 == 0;
      return result;
    }
    if (a2 == 321)
    {
      IOAccelContextSetBackgroundRendering();
      return 0;
    }
    goto LABEL_31;
  }
  if (a2 != 607)
  {
    if (a2 == 610)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 16) + 309) = *a3 != 0;
      return result;
    }
    goto LABEL_31;
  }
  v8 = *a3;
  if (!*a3)
  {
    result = 0;
    no_crash_upon_reset = 1;
    return result;
  }
  if (v8 == 1)
  {
    v17 = *(unsigned int *)(a1 + 2148);
    if (!(_DWORD)v17)
      return 0;
    for (i = 0; i < v17; ++i)
    {
      v19 = a1 + (i << 6);
      v20 = *(_DWORD **)(v19 + 1112);
      if ((unint64_t)v20 < *(_QWORD *)(v19 + 1128))
      {
        v21 = (_QWORD *)(v19 + 1128);
        do
          *v20++ = random();
        while ((unint64_t)v20 < *v21);
        v17 = *(unsigned int *)(a1 + 2148);
      }
      result = 0;
    }
  }
  else
  {
    if (v8 != 2)
    {
      v16 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 496);
      return v16();
    }
    if (!*(_DWORD *)(a1 + 2148))
      return 0;
    v9 = 0;
    do
    {
      v10 = a1 + (v9 << 6);
      v11 = (_QWORD *)(v10 + 1112);
      v12 = ((*(_QWORD *)(v10 + 1128) - *(_QWORD *)(v10 + 1112)) >> 2);
      v13 = random();
      do
      {
        v14 = v13;
        v13 >>= 1;
      }
      while (v14 > v12);
      v15 = random();
      result = 0;
      *(_DWORD *)(*v11 + 4 * v14) = v15;
      ++v9;
    }
    while (v9 < *(unsigned int *)(a1 + 2148));
  }
  return result;
}

uint64_t gldGetInteger(uint64_t a1, int a2, int *a3)
{
  int v4;
  uint64_t result;
  int v6;
  uint64_t v7;

  if (!a3)
    return 10014;
  if (a2 <= 666)
  {
    switch(a2)
    {
      case 317:
        v4 = *(unsigned __int8 *)(a1 + 76);
        *a3 = v4;
        result = 0;
        if (v4 == 1)
          *(_BYTE *)(a1 + 76) = 0;
        return result;
      case 318:
        result = 0;
        v6 = *(unsigned __int8 *)(a1 + 77) == 0;
        goto LABEL_21;
      case 319:
        result = 0;
        v6 = (*(_DWORD *)(a1 + 80) >> 8) & 1;
        goto LABEL_21;
      case 320:
        result = 0;
        v6 = (*(_DWORD *)(a1 + 80) >> 9) & 1;
        goto LABEL_21;
      default:
        if (a2 != 666)
          return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 488))(a1);
        result = 0;
        v6 = ((*(_DWORD *)(a1 + 144) >> 9) & 1) == 0;
        goto LABEL_21;
    }
  }
  if (a2 > 1400)
  {
    if (a2 == 1401)
    {
      result = 0;
      v7 = *(_QWORD *)(a1 + 16);
      *a3 = *(_DWORD *)(v7 + 304) | *(_DWORD *)(a1 + 2392);
      *(_DWORD *)(a1 + 2392) = 0;
      *(_DWORD *)(v7 + 304) = 0;
      return result;
    }
    if (a2 == 1402)
    {
      result = 0;
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 16) + 308);
      goto LABEL_21;
    }
  }
  else
  {
    if (a2 == 667)
    {
      result = 0;
      v6 = ((*(_DWORD *)(a1 + 144) >> 21) & 1) == 0;
      goto LABEL_21;
    }
    if (a2 == 1400)
    {
      result = 0;
      v6 = 1;
LABEL_21:
      *a3 = v6;
      return result;
    }
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 488))(a1);
}

uint64_t gpusPixelBytes(int a1, int a2)
{
  uint64_t result;
  char v4;
  int v5;

  result = 1;
  if (a2 > 33633)
  {
    if (a2 > 34233)
    {
      if (a2 <= 36192)
      {
        if ((a2 - 34234) >= 2)
          return 4;
        return 2;
      }
      if (a2 != 36193)
      {
        if (a2 == 36269)
          return 8;
        return 4;
      }
      return 2 * gpulComponents(a1);
    }
    if (a2 > 33638)
      return 4;
    if ((a2 - 33635) < 4)
      return 2;
    v5 = 33634;
LABEL_29:
    if (a2 != v5)
      return 4;
    return result;
  }
  if (a2 > 32817)
  {
    if ((a2 - 32819) < 2)
      return 2;
    if ((a2 - 32821) < 2)
      return 4;
    v5 = 32818;
    goto LABEL_29;
  }
  if ((a2 - 5120) > 0xB)
  {
LABEL_27:
    if (!a2)
    {
      if (a1 <= 37807)
      {
        result = 8;
        if (a1 > 36282)
        {
          if ((a1 - 37488) > 9)
          {
            if ((a1 - 36283) < 2)
              return result;
          }
          else if (((1 << (a1 - 112)) & 0xF3) != 0)
          {
            return result;
          }
        }
        else if (a1 > 35411)
        {
          if ((a1 - 35412) < 4 || (a1 - 35420) >= 4 && (a1 - 35840) < 4)
            return result;
        }
        else if ((a1 - 33776) < 2)
        {
          return result;
        }
      }
      return 16;
    }
    v5 = 6656;
    goto LABEL_29;
  }
  if (((1 << a2) & 0x70) != 0)
    return 4 * gpulComponents(a1);
  if (((1 << a2) & 0x80C) != 0)
    return 2 * gpulComponents(a1);
  if (((1 << a2) & 3) == 0)
    goto LABEL_27;
  v4 = a1 - 101;
  if ((a1 - 35429) > 0xF)
  {
    if ((a1 - 37883) < 3)
      return result;
    if (a1 == 37902 || (a1 - 37875) < 6)
      return 2;
    if ((a1 - 37903) >= 2)
      return gpulComponents(a1);
    return 4;
  }
  if (((1 << v4) & 0xE2E2) != 0)
    return 2;
  if (((1 << v4) & 0xD0D) == 0)
    return 4;
  return result;
}

uint64_t gpulComponents(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 1;
  if (a1 > 35428)
  {
    if ((a1 - 35429) < 0x10 || (a1 - 37875) <= 0x1B && ((1 << (a1 + 13)) & 0x800073F) != 0)
      return 3;
    v3 = a1 - 36244;
    if (v3 > 9)
      return 4;
    if (((1 << v3) & 0x10F) != 0)
      return result;
    if (((1 << v3) & 0x50) != 0)
      return 3;
    if (v3 != 9)
      return 4;
    return 2;
  }
  if (a1 > 32991)
  {
    if (a1 > 34040)
    {
      if (a1 != 34041 && a1 != 34233)
        return 4;
    }
    else if ((a1 - 33319) >= 2)
    {
      if (a1 == 32992)
        return 3;
      return 4;
    }
    return 2;
  }
  switch(a1)
  {
    case 6400:
    case 6401:
    case 6402:
    case 6403:
    case 6404:
    case 6405:
    case 6406:
    case 6409:
      return result;
    case 6407:
      return 3;
    case 6408:
      return 4;
    case 6410:
      return 2;
    default:
      if (a1 != 32841)
        return 4;
      break;
  }
  return result;
}

uint64_t gpusRowBytes(int a1, int a2, int a3)
{
  int v4;
  int v5;

  if (a2)
  {
    if (a2 == 6656)
      return ((a3 + 7) >> 3);
    else
      return gpusPixelBytes(a1, a2) * a3;
  }
  else
  {
    v4 = 4;
    v5 = 4;
    switch(a1)
    {
      case 37808:
      case 37840:
      case 37886:
      case 37887:
LABEL_8:
        v5 = 1;
        break;
      case 37809:
      case 37810:
      case 37841:
      case 37842:
      case 37888:
      case 37889:
        v5 = 1;
        v4 = 5;
        break;
      case 37811:
      case 37812:
      case 37843:
      case 37844:
      case 37890:
      case 37891:
        v5 = 1;
        v4 = 6;
        break;
      case 37813:
      case 37814:
      case 37815:
      case 37845:
      case 37846:
      case 37847:
      case 37892:
      case 37893:
      case 37894:
      case 37895:
LABEL_9:
        v5 = 1;
        v4 = 8;
        break;
      case 37816:
      case 37817:
      case 37818:
      case 37819:
      case 37848:
      case 37849:
      case 37850:
      case 37851:
      case 37896:
      case 37897:
      case 37898:
      case 37899:
        v5 = 1;
        v4 = 10;
        break;
      case 37820:
      case 37821:
      case 37852:
      case 37853:
      case 37900:
      case 37901:
        v5 = 1;
        v4 = 12;
        break;
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
      case 37874:
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
        return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
      default:
        v5 = 4;
        switch(a1)
        {
          case 35412:
          case 35414:
LABEL_15:
            v5 = 8;
            v4 = 16;
            break;
          case 35413:
          case 35415:
LABEL_14:
            v4 = 8;
            v5 = 8;
            break;
          case 35416:
          case 35417:
          case 35418:
          case 35419:
            return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
          case 35420:
          case 35422:
            goto LABEL_8;
          case 35421:
          case 35423:
            goto LABEL_9;
          default:
            v5 = 4;
            switch(a1)
            {
              case 35840:
              case 35842:
                goto LABEL_14;
              case 35841:
              case 35843:
                goto LABEL_15;
              default:
                return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
            }
        }
        break;
    }
    return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
  }
}

uint64_t gpusPixelSettings(int a1, int a2, int a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, int *a8, char a9)
{
  uint64_t result;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;

  result = gpusPixelBytes(a1, a2);
  *a6 = result;
  if (a2 && a8)
  {
    v18 = result;
    v19 = a8[1];
    if (!v19)
    {
      v20 = *a8;
      if (*a8 < 1)
      {
        result = gpusRowBytes(a1, a2, a3);
      }
      else
      {
        v21 = v20 * result;
        v22 = (v20 + 7) >> 3;
        result = a2 == 6656 ? v22 : v21;
      }
      v23 = a8[7];
      v24 = result % v23;
      v19 = v23 + result - result % v23;
      if (!v24)
        v19 = result;
    }
    *a5 = v19;
    v25 = a8[3];
    if (!v25)
    {
      v26 = a8[2];
      if (v26 <= 0)
        v26 = a4;
      v25 = v26 * v19;
    }
    v27 = a8[5];
    v28 = v27 >> 3;
    v29 = v27 * v18;
    if (a2 == 6656)
      v29 = v28;
    if ((a9 & 4) != 0)
      v30 = a8[6];
    else
      v30 = 0;
    *a7 = v29 + v30 * v25 + a8[4] * v19;
  }
  else
  {
    *a7 = 0;
    result = gpusRowBytes(a1, a2, a3);
    *a5 = result;
  }
  return result;
}

uint64_t gldCreateProgram(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;

  v7 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, *(_QWORD *)(*(_QWORD *)a1 + 136), 0xD68DC258uLL);
  if (!v7)
    abort();
  *v7 = a3;
  v7[1] = a4;
  *a2 = v7;
  return 0;
}

uint64_t gldDestroyProgram(uint64_t a1, void *a2)
{
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), a2);
  return 0;
}

unint64_t *gpusPPParameterOffset(unint64_t *result, unsigned int *a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = *result;
  *a3 = 4;
  if ((v3 & 0x1F00) == 0xE00)
  {
    *a2 = (v3 >> 14) & 0x3FFFC;
    *a3 = (v3 >> 30) & 0x1C;
  }
  return result;
}

void gpumDeleteCachedProgram(uint64_t a1, uint64_t a2, _QWORD *ptr)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = ptr[1];
  v5 = ptr[2];
  if (v5)
  {
    *(_QWORD *)(v5 + 8) = v6;
    v6 = ptr[1];
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v6;
  }
  if (v6)
    v7 = (_QWORD *)(v6 + 16);
  else
    v7 = (_QWORD *)(a2 + 24);
  *v7 = v5;
  --*(_DWORD *)(a2 + 48);
  if (ptr[3])
    (*(void (**)(_QWORD))(*(_QWORD *)a1 + 40))(*ptr);
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), ptr);
}

_QWORD *gpumGetCachedProgram(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v5 = *(_QWORD **)(a2 + 16);
    while ((uint64_t *)*v5 != a1)
    {
      v5 = (_QWORD *)v5[1];
      if (!v5)
        goto LABEL_5;
    }
    v10 = v5[2];
    if (v10)
    {
      *(_QWORD *)(v10 + 8) = v5[1];
      v11 = v5[1];
      if (v11)
        v12 = (_QWORD *)(v11 + 16);
      else
        v12 = (_QWORD *)(a2 + 24);
      *v12 = v10;
      v5[1] = v4;
      v5[2] = 0;
      *(_QWORD *)(v4 + 16) = v5;
      *(_QWORD *)(a2 + 16) = v5;
    }
  }
  else
  {
LABEL_5:
    v6 = malloc_type_zone_malloc(*(malloc_zone_t **)(*a1 + 232), 0x40uLL, 0x1357CB10uLL);
    if (!v6)
      abort();
    v5 = v6;
    v6[2] = 0;
    v7 = *(_QWORD *)(a2 + 16);
    *v6 = a1;
    v6[1] = v7;
    if (v7)
      *(_QWORD *)(v7 + 16) = v6;
    v6[3] = 0;
    (*(void (**)(_QWORD *))(*a1 + 56))(v6 + 4);
    *(_QWORD *)(a2 + 16) = v5;
    v8 = *(_QWORD **)(a2 + 24);
    if (!v8)
    {
      *(_QWORD *)(a2 + 24) = v5;
      v8 = v5;
    }
    v9 = *(_DWORD *)(a2 + 48) + 1;
    *(_DWORD *)(a2 + 48) = v9;
    if (v9 >= 5)
      gpumDeleteCachedProgram(a1[2], a2, v8);
  }
  return v5;
}

void gpuiCleanContextFromProgram(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a2 + 16);
  if (v2)
  {
    while (*v2 != a1)
    {
      v2 = (_QWORD *)v2[1];
      if (!v2)
        return;
    }
    gpumDeleteCachedProgram(*(_QWORD *)(a1 + 16), a2, v2);
  }
}

uint64_t gldObjectPurgeable(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *, uint64_t, uint64_t, uint64_t);
  BOOL v16;
  _DWORD *v17;
  _DWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;

  v5 = a5;
  if (a2 != 3)
  {
    if (a2 != 1)
      return 35355;
    v8 = *(_QWORD *)(a3 + 32);
    if (v8)
    {
      v9 = a1[1];
      v10 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v9 + 512);
      if (v10)
      {
        LODWORD(result) = v10(a1, a3, a4, a5);
      }
      else if ((_DWORD)a4 == 35353)
      {
        v17 = (_DWORD *)a1[269];
        if ((unint64_t)(v17 + 3) > a1[270])
        {
          (*(void (**)(_QWORD *, uint64_t))(v9 + 472))(a1, 2);
          v17 = (_DWORD *)a1[269];
        }
        a1[269] = v17 + 3;
        *v17 = 197888;
        v17[1] = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        IOAccelResourceRelease();
        *(_QWORD *)(a3 + 24) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        *(_QWORD *)(a3 + 40) = 0;
        *(_BYTE *)(*(_QWORD *)(a3 + 8) + 20) = 3;
        LODWORD(result) = 35353;
      }
      else if ((*(_BYTE *)(v8 + 260) & 0xF) != 0)
      {
        LODWORD(result) = 35355;
      }
      else
      {
        v22 = a1[269];
        if ((unint64_t)(v22 + 16) > a1[270])
        {
          (*(void (**)(_QWORD *, uint64_t))(v9 + 472))(a1, 2);
          v22 = a1[269];
        }
        a1[269] = v22 + 16;
        *(_DWORD *)v22 = 263168;
        *(_DWORD *)(v22 + 4) = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        *(_BYTE *)(v22 + 14) = 0;
        v23 = *(_DWORD *)(v8 + 260);
        *(_BYTE *)(v22 + 13) = (v23 & 0x40) != 0;
        *(_BYTE *)(v22 + 12) = (v23 & 0x80) == 0 || !v5;
        LODWORD(result) = 35354;
      }
      if ((*(_BYTE *)(*(_QWORD *)(a3 + 8) + 20) & 0xF) != 0)
        return 35355;
      else
        return result;
    }
    v16 = (*(_BYTE *)(*(_QWORD *)(a3 + 8) + 20) & 0xF) == 0;
LABEL_13:
    if (v16)
      return 35353;
    else
      return 35355;
  }
  v12 = *(_QWORD *)(a3 + 16);
  if (!v12 || (v13 = *(_QWORD *)(v12 + 8)) == 0)
  {
    v16 = **(_QWORD **)a3 == 0;
    goto LABEL_13;
  }
  v14 = a1[1];
  v15 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v14 + 528);
  if (v15)
  {
    result = v15(a1, a3, a4, a5);
  }
  else if ((_DWORD)a4 == 35353)
  {
    v18 = (_DWORD *)a1[269];
    if ((unint64_t)(v18 + 3) > a1[270])
    {
      (*(void (**)(_QWORD *, uint64_t))(v14 + 472))(a1, 2);
      v18 = (_DWORD *)a1[269];
    }
    a1[269] = v18 + 3;
    *v18 = 197888;
    v18[1] = (a1[141] - a1[139]) >> 2;
    IOAccelContextAddResource();
    IOAccelResourceRelease();
    v19 = *(_OWORD **)(a3 + 16);
    *v19 = 0u;
    v19[1] = 0u;
    (*(void (**)(_QWORD))(a1[1] + 152))(a1[2]);
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), *(void **)(a3 + 16));
    *(_QWORD *)(a3 + 16) = 0;
    **(_DWORD **)(a3 + 8) = 1;
    result = 35353;
  }
  else
  {
    if ((*(_BYTE *)(v13 + 260) & 0xF) == 0)
    {
      v20 = a1[269];
      if ((unint64_t)(v20 + 16) > a1[270])
      {
        (*(void (**)(_QWORD *, uint64_t))(v14 + 472))(a1, 2);
        v20 = a1[269];
      }
      a1[269] = v20 + 16;
      *(_DWORD *)v20 = 263168;
      *(_DWORD *)(v20 + 4) = (a1[141] - a1[139]) >> 2;
      IOAccelContextAddResource();
      *(_BYTE *)(v20 + 14) = 0;
      v21 = *(_DWORD *)(v13 + 260);
      *(_BYTE *)(v20 + 13) = (v21 & 0x40) != 0;
      *(_BYTE *)(v20 + 12) = (v21 & 0x80) == 0 || !v5;
    }
    result = 35355;
  }
  if ((**(_BYTE **)(a3 + 8) & 5) != 0)
  {
    if (**(_QWORD **)a3)
      return 35355;
    else
      return 35356;
  }
  return result;
}

uint64_t gldObjectUnpurgeable(_QWORD *a1, int a2, _QWORD *a3, uint64_t a4, _DWORD *a5)
{
  unsigned __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  int v21;

  if (a2 != 3)
  {
    if (a2 != 1)
      return 35355;
    v8 = (unsigned __int16 *)a3[5];
    if ((*(_BYTE *)(a3[1] + 20) & 0xF) != 0)
    {
      if (v8)
        *((_BYTE *)v8 + 29) = 0;
      goto LABEL_26;
    }
    if (!v8)
    {
LABEL_26:
      *a5 = 1;
      return 35356;
    }
    v11 = a3[4];
    *a5 = (*(_DWORD *)(v11 + 260) & 0xFFFFFFBF) == 0;
    v12 = a1[1];
    v13 = *(uint64_t (**)(_QWORD *, _QWORD *, uint64_t))(v12 + 520);
    if (!v13)
    {
      if ((*(_BYTE *)(v11 + 260) & 0xF) == 0)
      {
        v14 = a1[269];
        if ((unint64_t)(v14 + 16) > a1[270])
        {
          (*(void (**)(_QWORD *, uint64_t))(v12 + 472))(a1, 2);
          v14 = a1[269];
        }
        a1[269] = v14 + 16;
        *(_DWORD *)v14 = 263168;
        *(_DWORD *)(v14 + 4) = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        *(_WORD *)(v14 + 12) = 0;
        if ((_DWORD)a4 == 35355)
        {
          *(_BYTE *)(v14 + 14) = 0;
          if (a1[141] > a1[139] || a1[269] > (unint64_t)(a1[271] + 16))
            (*(void (**)(_QWORD *, uint64_t))(a1[1] + 472))(a1, 2);
          v15 = *(unsigned __int8 *)(*a3 + 211);
          if (!*(_BYTE *)(*a3 + 211))
            return 35356;
          v16 = 0;
          do
          {
            v16 |= *v8;
            if ((*(_DWORD *)(v11 + 260) & 0x40) != 0)
              v16 |= v8[6];
            ++v8;
            --v15;
          }
          while (v15);
          if (!v16)
            return 35356;
          return 35355;
        }
LABEL_43:
        *(_BYTE *)(v14 + 14) = 1;
        return 35356;
      }
      return 35355;
    }
    return v13(a1, a3, a4);
  }
  v9 = a3[2];
  if ((*(_BYTE *)a3[1] & 5) != 0)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 16);
      if (v10)
        *(_BYTE *)(v10 + 29) = 0;
    }
    goto LABEL_26;
  }
  v18 = *(_QWORD *)(v9 + 8);
  *a5 = (*(_DWORD *)(v18 + 260) & 0xFFFFFFBF) == 0;
  v19 = a1[1];
  v13 = *(uint64_t (**)(_QWORD *, _QWORD *, uint64_t))(v19 + 536);
  if (v13)
    return v13(a1, a3, a4);
  if ((*(_BYTE *)(v18 + 260) & 0xF) != 0)
    return 35355;
  v20 = *(unsigned __int16 **)(v9 + 16);
  v14 = a1[269];
  if ((unint64_t)(v14 + 16) > a1[270])
  {
    (*(void (**)(_QWORD *, uint64_t))(v19 + 472))(a1, 2);
    v14 = a1[269];
  }
  a1[269] = v14 + 16;
  *(_DWORD *)v14 = 263168;
  *(_DWORD *)(v14 + 4) = (a1[141] - a1[139]) >> 2;
  IOAccelContextAddResource();
  *(_WORD *)(v14 + 12) = 0;
  if ((_DWORD)a4 != 35355)
    goto LABEL_43;
  *(_BYTE *)(v14 + 14) = 0;
  if (a1[141] > a1[139] || a1[269] > (unint64_t)(a1[271] + 16))
    (*(void (**)(_QWORD *, uint64_t))(a1[1] + 472))(a1, 2);
  v21 = *v20;
  if ((*(_BYTE *)(v18 + 260) & 0x40) != 0)
    v21 |= v20[6];
  if (v21)
    return 35355;
  else
    return 35356;
}

uint64_t gpuiDestroyQueryBufferClientAlloc(uint64_t a1)
{
  _QWORD *v2;

  if (**(_QWORD **)(a1 + 824))
  {
    IOAccelResourceRelease();
    v2 = *(_QWORD **)(a1 + 824);
    *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 232))(a1);
  return 0;
}

uint64_t gpumCreateQuery(uint64_t a1, _QWORD *a2, size_t a3)
{
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  int v16;
  unsigned int v17;
  char *v18;
  uint64_t v19;
  uint64_t DataBytes;
  void *v21;
  const void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  size_t v26;
  void *v27;
  malloc_zone_t *v28;
  char *v29;
  void *v30;
  int v31;
  _QWORD *v32;
  uint64_t result;
  int v34;
  _DWORD *v35;
  _DWORD *ptr;

  v5 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, *(_QWORD *)(*(_QWORD *)a1 + 192), 0xD68DC258uLL);
  if (!v5)
LABEL_40:
    abort();
  v6 = 0;
  *(_QWORD *)v5 = 0xCFFFFFFFFLL;
  ptr = v5;
  v5[2] = 0;
  while (1)
  {
    v7 = *(_DWORD *)(a1 + 2252);
    v8 = v7 >> 5;
    if (v7 >= 0x20)
    {
      v10 = 0;
      v9 = v8 <= 1 ? 1 : v8;
      while (1)
      {
        v6 = *(_DWORD *)(*(_QWORD *)(a1 + 2240) + 4 * v10);
        if (v6 != -1)
          break;
        if (v9 == ++v10)
        {
          v6 = -1;
          goto LABEL_12;
        }
      }
      LODWORD(v9) = v10;
    }
    else
    {
      LODWORD(v9) = 0;
    }
LABEL_12:
    if ((_DWORD)v9 != v8)
      break;
    v11 = *(_QWORD *)(a1 + 8);
    v12 = *(_QWORD *)(v11 + 568);
    v13 = *(_QWORD *)(v11 + 560);
    v14 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, a3, 0xD68DC258uLL);
    if (!v14)
      goto LABEL_40;
    v15 = (uint64_t *)v14;
    if (*(_DWORD *)(a1 + 2248))
    {
      v16 = 2 * *(_DWORD *)(a1 + 2252);
      v17 = v13 + v12 + v12 * v16;
    }
    else
    {
      v17 = v13 + v12 + 32 * v12;
      v16 = 32;
    }
    *((_QWORD *)v14 + 2) = 0;
    v18 = v14 + 16;
    *((_QWORD *)v14 + 1) = 0;
    *((_DWORD *)v14 + 6) = 0;
    *((_QWORD *)v14 + 11) = 0;
    *((_QWORD *)v14 + 12) = 0;
    *((_QWORD *)v14 + 13) = 0;
    *((_QWORD *)v14 + 14) = v17;
    *((_WORD *)v14 + 28) = 257;
    v14[58] = 0;
    *((_WORD *)v14 + 16) = v17;
    *(_DWORD *)(v14 + 34) = 65537;
    *((_QWORD *)v14 + 5) = 0;
    *((_QWORD *)v14 + 6) = v17;
    v19 = IOAccelResourceCreate();
    *v15 = v19;
    v15[1] = IOAccelResourceGetClientShared();
    *(_BYTE *)(*(_QWORD *)v18 + 28) = 1;
    IOAccelResourceRelease();
    if (!v19)
    {
      malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), ptr);
      v35 = 0;
      result = 10016;
      v32 = a2;
      goto LABEL_39;
    }
    DataBytes = IOAccelResourceGetDataBytes();
    v21 = (void *)DataBytes;
    v22 = *(const void **)(a1 + 2232);
    if (v22 && DataBytes)
    {
      v23 = *(_QWORD *)(a1 + 824);
      if (v23)
      {
        if (*(_DWORD *)(*(_QWORD *)(v23 + 16) + 24) != 1)
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 472))(a1, 2);
        IOAccelResourceFinishEvent();
        v22 = *(const void **)(a1 + 2232);
      }
      memcpy(v21, v22, *(unsigned int *)(a1 + 2248));
    }
    v24 = *(_QWORD **)(a1 + 824);
    if (v24)
    {
      if (*v24)
      {
        gpuiDestroyQueryBufferClientAlloc(a1);
        v24 = *(_QWORD **)(a1 + 824);
      }
      malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), v24);
    }
    *(_QWORD *)(a1 + 824) = v15;
    *(_QWORD *)(a1 + 2232) = v21;
    *(_DWORD *)(a1 + 2252) = v16;
    *(_DWORD *)(a1 + 2248) = v17;
    (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 224))(a1);
    v25 = *(unsigned int *)(a1 + 2252);
    v26 = v25 >> 3;
    v27 = *(void **)(a1 + 2240);
    v28 = *(malloc_zone_t **)(*(_QWORD *)a1 + 232);
    if (v27)
    {
      v29 = (char *)malloc_type_zone_realloc(v28, v27, v26, 0xDB6CA469uLL);
      if (!v29)
        goto LABEL_40;
      *(_QWORD *)(a1 + 2240) = v29;
      bzero(&v29[v25 >> 4], v25 >> 4);
    }
    else
    {
      v30 = malloc_type_zone_calloc(v28, 1uLL, v26, 0xD68DC258uLL);
      if (!v30)
        goto LABEL_40;
      *(_QWORD *)(a1 + 2240) = v30;
    }
  }
  v31 = 0;
  v32 = a2;
  do
  {
    if (((v6 >> v31) & 1) == 0)
      break;
    ++v31;
  }
  while (v31 != 32);
  result = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 2240) + 4 * v9) |= 1 << v31;
  v34 = v31 + 32 * v9;
  v35 = ptr;
  ptr[2] = v34;
LABEL_39:
  *v32 = v35;
  return result;
}

uint64_t gpumModifyQuery(uint64_t a1, uint64_t a2, int a3, _QWORD *a4, void (*a5)(uint64_t, uint64_t, _QWORD), void (*a6)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v11;

  v11 = *(int *)(a2 + 4);
  if ((_DWORD)v11 != 12)
  {
    a5(a1, a2, *(int *)(a2 + 4));
    *(_DWORD *)(a2 + 4) = 12;
    *(_QWORD *)(a1 + 8 * v11 + 712) = 0;
  }
  if (a3)
    return 10010;
  a6(a1, a2, *a4);
  return 0;
}

uint64_t gpumGetQueryInfo(uint64_t a1, _DWORD *a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t, _QWORD, uint64_t), void (*a6)(uint64_t, _DWORD *, uint64_t), uint64_t (*a7)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD, _QWORD, _QWORD, _QWORD);

  if (!(_DWORD)a3)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 520);
    if (v14 == *(_QWORD *)(a1 + 800))
    {
      v15 = (int)a2[1];
      if ((int)v15 > 9)
        return 0;
    }
    else
    {
      a5(a1, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 520), 11);
      *(_DWORD *)(v14 + 4) = 11;
      *(_QWORD *)(a1 + 800) = v14;
      v15 = (int)a2[1];
    }
    a6(a1, a2, v15);
    result = 0;
    a2[1] = 12;
    *(_QWORD *)(a1 + 8 * v15 + 712) = 0;
    return result;
  }
  if (*a2 == -1)
  {
    if ((_DWORD)a3 == 34918)
    {
      result = 0;
      *a4 = 0;
    }
    else if ((_DWORD)a3 == 34919)
    {
      result = 0;
      *a4 = 1;
    }
    else
    {
      return 10010;
    }
  }
  else
  {
    v12 = (int)a2[1];
    if ((int)v12 <= 9)
    {
      v16 = a7;
      a6(a1, a2, (int)a2[1]);
      a7 = v16;
      a2[1] = 12;
      *(_QWORD *)(a1 + 8 * v12 + 712) = 0;
    }
    return a7(a1, a2, a3, a4);
  }
  return result;
}

uint64_t gpumDestroyQuery(_QWORD *a1, int *ptr, void (*a3)(_QWORD *, int *, _QWORD))
{
  uint64_t v5;

  v5 = ptr[1];
  if ((_DWORD)v5 != 12)
  {
    a3(a1, ptr, ptr[1]);
    ptr[1] = 12;
    a1[v5 + 89] = 0;
  }
  *(_DWORD *)(a1[280] + (((unint64_t)ptr[2] >> 3) & 0x1FFFFFFC)) &= ~(1 << ptr[2]);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), ptr);
  return 0;
}

uint64_t gpumLoadCurrentQueries(uint64_t result, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  for (i = 0; i != 11; ++i)
  {
    v7 = *(_QWORD *)(v5 + 40) + 8 * i;
    v8 = *(_QWORD *)(v7 + 432);
    v9 = v5 + 8 * i;
    v10 = *(_QWORD *)(v9 + 712);
    if (v8 != v10)
    {
      if (v8)
      {
        v11 = *(int *)(v8 + 4);
        if ((_DWORD)v11 != 12)
        {
          result = a3(v5, *(_QWORD *)(v7 + 432), *(int *)(v8 + 4));
          *(_DWORD *)(v8 + 4) = 12;
          *(_QWORD *)(v5 + 8 * v11 + 712) = 0;
          v10 = *(_QWORD *)(v9 + 712);
        }
      }
      if (v10)
      {
        v12 = *(int *)(v10 + 4);
        result = a3(v5, v10, v12);
        *(_DWORD *)(v10 + 4) = 12;
        *(_QWORD *)(v5 + 8 * v12 + 712) = 0;
      }
      if (v8)
      {
        result = a2(v5, v8, i);
        *(_DWORD *)(v8 + 4) = i;
        *(_QWORD *)(v9 + 712) = v8;
      }
    }
  }
  return result;
}

uint64_t gldReadFramebufferData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v17;
  uint64_t v18;
  uint64_t v19;

  if (!a10)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 448))(a1, a2, a3, a4, a5, a6, a7);
  v17 = **(_DWORD **)(a10 + 8);
  if (!v17)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 448))(a1, a2, a3, a4, a5, a6, a7);
  v18 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v18 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v18 + 48));
    LOBYTE(v17) = **(_BYTE **)(a10 + 8);
  }
  if ((_BYTE)v17
    && (*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), a10, v17))
  {
    LOBYTE(v17) = 0;
    **(_DWORD **)(a10 + 8) = 0;
  }
  v19 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v19 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(v19 + 48));
  if ((_BYTE)v17)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 448))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t gldCreateSampler(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  int v10;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, *(_QWORD *)(*(_QWORD *)a1 + 120), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  v10 = *(_DWORD *)(a1 + 320) + 1;
  *(_DWORD *)(a1 + 320) = v10;
  *((_DWORD *)v8 + 4) = v10;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(a1 + 8) + 112))(a1, v8);
  *a2 = v9;
  return 0;
}

BOOL gldLoadSampler(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;
  int v6;
  int v7;

  v2 = *(_BYTE **)(a2 + 8);
  v3 = *v2;
  if (!*v2)
    return (_DWORD)v3 == 0;
  if (!*(_BYTE *)(a1 + 288))
  {
    v7 = *(_DWORD *)(a1 + 320) + 1;
    *(_DWORD *)(a1 + 320) = v7;
    *(_DWORD *)(a2 + 16) = v7;
LABEL_6:
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 312))(a1, a2, v3))
    {
      LODWORD(v3) = 0;
      **(_BYTE **)(a2 + 8) = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  v3 = **(unsigned __int8 **)(a2 + 8);
  v6 = *(_DWORD *)(a1 + 320) + 1;
  *(_DWORD *)(a1 + 320) = v6;
  *(_DWORD *)(a2 + 16) = v6;
  if ((_DWORD)v3)
    goto LABEL_6;
LABEL_8:
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return (_DWORD)v3 == 0;
}

uint64_t gldDestroySampler(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 120))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gpusLoadCurrentSamplers(uint64_t result, unsigned __int16 a2)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;

  v2 = *(_QWORD *)(result + 24);
  if (!*(_BYTE *)(v2 + 12724))
    return result;
  v3 = (_QWORD *)result;
  v4 = 0;
  v5 = *(_QWORD *)(result + 16);
  v6 = a2;
  v15 = a2;
  do
  {
    if (!v6)
      goto LABEL_21;
    v16 = v4;
    v7 = 16 * v4;
    do
    {
      v8 = __clz(__rbit32(v6));
      v9 = v8 + v7;
      v10 = *(_QWORD *)(v3[5] + 8 * v9 + 720);
      if (!v10)
      {
        if (!v3[v9 + 57])
        {
          v10 = 0;
          goto LABEL_18;
        }
        v10 = 0;
        *((_DWORD *)v3 + v9 + 244) = 0;
        v13 = 1;
        goto LABEL_17;
      }
      v11 = (_DWORD *)v3 + v9 + 244;
      v12 = *(_DWORD *)(v10 + 16);
      if (*v11 == v12)
        v13 = **(unsigned __int8 **)(v10 + 8);
      else
        v13 = 1;
      if (**(_BYTE **)(v10 + 8))
      {
        v14 = *(_DWORD *)(v5 + 320) + 1;
        *(_DWORD *)(v5 + 320) = v14;
        *(_DWORD *)(v10 + 16) = v14;
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v3[1] + 312))(v5, v10);
        if ((_DWORD)result)
        {
          **(_BYTE **)(v10 + 8) = 0;
          v12 = *(_DWORD *)(v10 + 16);
          goto LABEL_12;
        }
        v10 = 0;
        *v11 = 0;
        v13 = v3[v9 + 57] != 0;
        if (!v3[v9 + 57])
          goto LABEL_18;
LABEL_17:
        result = (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD, uint64_t))(v3[1] + 384))(v3, v10, v8 + v7, v13);
        goto LABEL_18;
      }
LABEL_12:
      *v11 = v12;
      if ((_DWORD)v13)
        goto LABEL_17;
LABEL_18:
      v3[v9 + 57] = v10;
      v6 ^= 1 << v8;
    }
    while (v6);
    v2 = v3[3];
    v6 = v15;
    v4 = v16;
LABEL_21:
    ++v4;
  }
  while (v4 < *(unsigned __int8 *)(v2 + 12724));
  return result;
}

uint64_t gldCreateShareGroup(uint64_t a1, char **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t result;

  *a2 = 0;
  v6 = IOAccelSharedCreate();
  if (!v6)
    return 10015;
  v7 = v6;
  v8 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, *(_QWORD *)(*(_QWORD *)a1 + 72), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *(_QWORD *)v8 = *(_QWORD *)a1;
  *((_QWORD *)v8 + 1) = a1;
  *((_QWORD *)v8 + 2) = a3;
  *((_QWORD *)v8 + 5) = v7;
  *((_DWORD *)v8 + 74) = *(_DWORD *)(a1 + 764);
  pthread_mutex_init((pthread_mutex_t *)(v8 + 48), 0);
  v9[288] = 0;
  *((_DWORD *)v9 + 73) = 1;
  *((_DWORD *)v9 + 75) = 0;
  *((_QWORD *)v9 + 4) = glgCreateProcessor();
  (*(void (**)(char *, _QWORD))(a1 + 16))(v9, 0);
  result = 10020;
  if (*((_DWORD *)v9 + 75) != 10020)
  {
    result = 0;
    *a2 = v9;
  }
  return result;
}

uint64_t gldDestroyShareGroup(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  for (i = 0; i != 88; i += 8)
  {
    v3 = a1 + i;
    v4 = *(_QWORD **)(a1 + i + 112);
    if (v4)
    {
      gpusDestroyZeroTexture((_QWORD *)a1, v4);
      *(_QWORD *)(v3 + 112) = 0;
    }
    v5 = *(_QWORD **)(v3 + 200);
    if (v5)
    {
      gpusDestroyZeroTexture((_QWORD *)a1, v5);
      *(_QWORD *)(v3 + 200) = 0;
    }
  }
  (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 24))(a1);
  IOAccelSharedRelease();
  glgDestroyProcessor();
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 48));
  malloc_zone_free(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), (void *)a1);
  return 0;
}

uint64_t gpusPixelSize(int a1)
{
  unsigned int v1;

  v1 = ((a1 & 0x30000000) != 0) << 8;
  if ((a1 & 0xC000000) != 0)
    v1 = 128;
  if ((a1 & 0x3F00000) != 0)
    v1 = 64;
  if ((a1 & 0xFC000) != 0)
    v1 = 32;
  if ((a1 & 0x3FC0) != 0)
    v1 = 16;
  if ((a1 & 0x3C) != 0)
    return 8;
  else
    return v1;
}

uint64_t gpusDepthSize(unsigned int a1)
{
  int v1;
  unsigned int v2;

  if ((a1 & 0x400) != 0)
    v1 = 16;
  else
    v1 = (a1 >> 4) & 8;
  if ((a1 & 0x800) != 0)
    v2 = 24;
  else
    v2 = v1;
  if ((a1 & 0x1000) != 0)
    return 32;
  else
    return v2;
}

uint64_t gpusAlphaSize(unsigned int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;

  if ((a1 & 0x2800000) != 0)
    v1 = 16;
  else
    v1 = (a1 >> 22) & 0x20;
  if ((a1 & 0x200000) != 0)
    v2 = 12;
  else
    v2 = v1;
  if ((a1 & 0x9A928) != 0)
    v3 = 8;
  else
    v3 = v2;
  if ((a1 & 0x80) != 0)
    v4 = 4;
  else
    v4 = v3;
  if ((a1 & 0x40000) != 0)
    v5 = 2;
  else
    v5 = v4;
  if ((a1 & 0x400) != 0)
    return 1;
  else
    return v5;
}

uint64_t gpusColorSizes(unsigned int a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;
  __int16 v4;

  *(_WORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0;
  if ((a1 & 0x3C) != 0)
  {
    v2 = 2;
    v3 = 3;
    v4 = 3;
LABEL_10:
    *(_WORD *)a2 = v3;
    *(_WORD *)(a2 + 2) = v4;
    *(_WORD *)(a2 + 4) = v2;
    *(_WORD *)(a2 + 6) = gpusAlphaSize(a1);
    return 1;
  }
  if ((a1 & 0x1C0) != 0)
  {
    v3 = 4;
    v4 = 4;
    v2 = 4;
    goto LABEL_10;
  }
  if ((a1 & 0xE00) != 0)
  {
    v3 = 5;
    v4 = 5;
LABEL_9:
    v2 = 5;
    goto LABEL_10;
  }
  if ((a1 & 0x3000) != 0)
  {
    v4 = 6;
    v3 = 5;
    goto LABEL_9;
  }
  if ((a1 & 0x1C000) != 0)
  {
    v3 = 8;
    v4 = 8;
    v2 = 8;
    goto LABEL_10;
  }
  if ((a1 & 0xE0000) != 0)
  {
    v3 = 10;
    v4 = 10;
    v2 = 10;
    goto LABEL_10;
  }
  if ((a1 & 0x300000) != 0)
  {
    v3 = 12;
    v4 = 12;
    v2 = 12;
    goto LABEL_10;
  }
  if ((a1 & 0x2C00000) != 0)
  {
    v3 = 16;
    v4 = 16;
    v2 = 16;
    goto LABEL_10;
  }
  if ((a1 & 0x8000000) != 0)
  {
    v3 = 32;
    v4 = 32;
    v2 = 32;
    goto LABEL_10;
  }
  return 0;
}

uint64_t gldFlushContext(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 472))();
}

uint64_t gldWaitForContext(uint64_t a1)
{
  void (*v2)(uint64_t);
  uint64_t result;

  v2 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 544);
  if (v2)
    v2(a1);
  do
    result = MEMORY[0x2207A93DC](*(_QWORD *)(a1 + 64));
  while ((_DWORD)result == -536870186);
  return result;
}

uint64_t gldFinishContext(uint64_t a1)
{
  void (*v2)(uint64_t);
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 472))();
  v2 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 544);
  if (v2)
    v2(a1);
  do
    result = MEMORY[0x2207A93DC](*(_QWORD *)(a1 + 64));
  while ((_DWORD)result == -536870186);
  return result;
}

uint64_t gpusCheckResource()
{
  return IOAccelResourceCheckSysMem();
}

uint64_t gpusWaitResource()
{
  return IOAccelResourceFinishSysMem();
}

void gpusTestContextResource()
{
  JUMPOUT(0x2207A9478);
}

void gpusFlushContextResource()
{
  JUMPOUT(0x2207A9400);
}

void gpusFinishContextResource()
{
  JUMPOUT(0x2207A93F4);
}

void gpusFinishQueueResourceUsingFlushFunc()
{
  JUMPOUT(0x2207A9310);
}

uint64_t gldTestObject(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t *v8;

  result = 1;
  switch(a2)
  {
    case 0:
      result = gpuiTestFence(a1, a5, a4);
      break;
    case 1:
      v7 = *(_QWORD *)(a5 + 24);
      if (!a4)
        goto LABEL_9;
      goto LABEL_5;
    case 2:
      return result;
    case 3:
      v8 = *(uint64_t **)(a5 + 16);
      if (v8)
      {
        v7 = *v8;
        if (a4)
        {
LABEL_5:
          if (v7)
            JUMPOUT(0x2207A9478);
        }
        else
        {
LABEL_9:
          if (v7)
            result = IOAccelResourceCheckSysMem();
        }
      }
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t gldFlushObject(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _QWORD *v6;

  result = 0;
  switch(a2)
  {
    case 0:
      gpuiFlushFence(a1, a4);
      goto LABEL_9;
    case 1:
      if (!*(_QWORD *)(a4 + 24))
        goto LABEL_9;
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      v6 = *(_QWORD **)(a4 + 16);
      if (v6 && *v6)
LABEL_8:
        MEMORY[0x2207A9400](*(_QWORD *)(a1 + 64));
LABEL_9:
      result = 0;
      break;
    default:
      result = 10010;
      break;
  }
  return result;
}

uint64_t gldFinishObject(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  _QWORD *v6;

  result = 0;
  switch(a2)
  {
    case 0:
      gpuiFinishFence(a1, a4);
      goto LABEL_9;
    case 1:
      if (!a4[3])
        goto LABEL_9;
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      v6 = (_QWORD *)a4[2];
      if (v6 && *v6)
LABEL_8:
        MEMORY[0x2207A93F4](*(_QWORD *)(a1 + 64));
LABEL_9:
      result = 0;
      break;
    default:
      result = 10010;
      break;
  }
  return result;
}

uint64_t gldWaitForObject(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t *v6;

  result = 0;
  switch(a2)
  {
    case 0:
      gpuiWaitForFence(a1, a4);
      return 0;
    case 1:
      result = a4[3];
      if (!result)
        return result;
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      v6 = (uint64_t *)a4[2];
      if (!v6)
        return 0;
      result = *v6;
      if (*v6)
      {
LABEL_8:
        IOAccelResourceFinishSysMem();
        return 0;
      }
      return result;
    default:
      return 10010;
  }
}

uint64_t gldFinishBufferCPUAccess(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 416))(a2);
}

uint64_t gldCreateTexture(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  int v10;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, *(_QWORD *)(*(_QWORD *)a1 + 112), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  v8[6] = 0;
  v10 = *(_DWORD *)(a1 + 316) + 1;
  *(_DWORD *)(a1 + 316) = v10;
  *((_DWORD *)v8 + 14) = v10;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(a1 + 8) + 96))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldModifyTexture(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;

  v3 = a2 + 3;
  v2 = a2[3];
  *(_BYTE *)(a2[1] + 20) |= 2u;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 288))
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    v6 = a2[4];
    if (v6 && (*(_DWORD *)(v6 + 260) & 0x8F) == 0x80)
    {
      IOAccelResourceRelease();
      *v3 = 0;
      v3[1] = 0;
      v3[2] = 0;
    }
    if (*(_BYTE *)(a1 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return 0;
}

BOOL gldLoadTexture(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v10;
  _DWORD *v11;
  BOOL v12;
  uint64_t v13;

  v2 = *(uint64_t **)(a2 + 8);
  v3 = *((unsigned __int8 *)v2 + 20);
  if (!*((_BYTE *)v2 + 20))
    return (_DWORD)v3 == 0;
  v6 = **(_WORD **)a2 & 0xF;
  if (*(_BYTE *)(a1 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    v2 = *(uint64_t **)(a2 + 8);
    v3 = *((unsigned __int8 *)v2 + 20);
  }
  v7 = *(_DWORD *)(a1 + 316) + 1;
  *(_DWORD *)(a1 + 316) = v7;
  *(_DWORD *)(a2 + 56) = v7;
  v8 = *v2;
  if (v6 == 7 || v8 != 0)
  {
    v10 = (v3 & 8) == 0;
    if ((v3 & 8) != 0 && v8)
    {
      v11 = *(_DWORD **)(v8 + 8);
      if (*v11)
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 320))(a1, v8, *v11))goto LABEL_23;
        v11 = *(_DWORD **)(v8 + 8);
      }
      *v11 = 0;
      v10 = 1;
    }
    v12 = !v10 || (_DWORD)v3 == 0;
    if (v12
      || !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 296))(a1, a2, v3, *(_QWORD *)(a2 + 8) + 8))
    {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if ((_DWORD)v3
    && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)(a1 + 8) + 296))(a1, a2, v3, v2 + 1))
  {
LABEL_22:
    LODWORD(v3) = 0;
    v13 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v13 + 13) = 0;
    *(_QWORD *)(v13 + 8) = 0;
  }
LABEL_23:
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return (_DWORD)v3 == 0;
}

uint64_t gldReclaimTexture(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  result = gpulDeleteKernelTexture(a2);
  if (*(_BYTE *)(a1 + 288))
    result = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a2 + 8) + 20) = 15;
  return result;
}

uint64_t gpulDeleteKernelTexture(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t result;

  v2 = 0;
  v3 = (_OWORD *)(a1 + 24);
  v4 = a1 + 64;
  v5 = (uint64_t *)(a1 + 80);
  do
  {
    result = *v5;
    if (*v5)
    {
      if (result == *(_QWORD *)v3)
      {
        *v3 = 0u;
        v3[1] = 0u;
      }
      gpusWaitResource();
      result = IOAccelResourceRelease();
      *v5 = 0;
      v5[4] = 0;
      v5[8] = 0;
      *(_DWORD *)(v4 + v2) = 0;
    }
    v2 += 4;
    ++v5;
  }
  while (v2 != 16);
  if (*(_QWORD *)v3)
  {
    gpusWaitResource();
    result = IOAccelResourceRelease();
    *v3 = 0u;
    v3[1] = 0u;
  }
  *(_DWORD *)(a1 + 216) = -1;
  return result;
}

uint64_t gldDestroyTexture(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 104))();
  gldReclaimTexture((uint64_t)a1, (uint64_t)a2);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldUnbindTexture(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;

  v3 = result;
  if ((**(_WORD **)a2 & 0xF) == 7 && (v4 = **(_QWORD **)(a2 + 8)) != 0 && (v5 = *(_QWORD *)(v4 + 16)) != 0)
    v6 = (uint64_t *)(v5 + 16);
  else
    v6 = (uint64_t *)(a2 + 40);
  v7 = *v6;
  if (*v6)
  {
    for (i = 0; i != 32; ++i)
    {
      v9 = v3 + 8 * i;
      if (*(_QWORD *)(v9 + 200) == a2)
      {
        result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8) + 376))(v3, 0, i, 143);
        *(_QWORD *)(v9 + 200) = 0;
        *(_DWORD *)(v3 + 4 * i + 848) = 0;
      }
    }
    if (*(_DWORD *)(v7 + 24) != 1)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 8) + 472))(v3, 2);
  }
  return result;
}

BOOL gldIsTextureResident(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24) != 0;
}

uint64_t gpumGetTextureLevelInfo(_QWORD *a1, unsigned __int16 **a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6, void (*a7)(uint64_t, unsigned __int16 **, uint64_t, uint64_t, unint64_t *))
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t result;
  _OWORD v21[2];
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  v23 = 0;
  if ((a2[1][10] & 2) != 0)
  {
    v14 = a1[2];
    if (!*(_BYTE *)(v14 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v14 + 48)), v14 = a1[2], (a2[1][10] & 2) != 0))
    {
      (*(void (**)(uint64_t, unsigned __int16 **))(a1[1] + 304))(v14, a2);
      *((_BYTE *)a2[1] + 20) &= ~2u;
      v14 = a1[2];
    }
    if (*(_BYTE *)(v14 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 48));
  }
  v22 = ((unint64_t)**a2 >> 8) & 1;
  a7(a1[2], a2, a3, a4, &v22);
  if ((**a2 & 0x100) == 0)
    goto LABEL_20;
  v15 = 0;
  v16 = v22;
  do
  {
    v17 = *(_QWORD *)(a1[5] + v15);
    if (v17)
    {
      memset(v21, 0, sizeof(v21));
      v18 = a1[2];
      if ((*(_BYTE *)(*(_QWORD *)(v17 + 8) + 20) & 2) != 0)
      {
        if (!*(_BYTE *)(v18 + 288)
          || (pthread_mutex_lock((pthread_mutex_t *)(v18 + 48)),
              v18 = a1[2],
              (*(_BYTE *)(*(_QWORD *)(v17 + 8) + 20) & 2) != 0))
        {
          (*(void (**)(uint64_t, uint64_t))(a1[1] + 304))(v18, v17);
          *(_BYTE *)(*(_QWORD *)(v17 + 8) + 20) &= ~2u;
          v18 = a1[2];
        }
        if (*(_BYTE *)(v18 + 288))
        {
          pthread_mutex_unlock((pthread_mutex_t *)(v18 + 48));
          v18 = a1[2];
        }
      }
      *(_QWORD *)&v21[0] = 1;
      a7(v18, (unsigned __int16 **)v17, a3, a4, (unint64_t *)v21);
      v16 += *(_QWORD *)&v21[0];
    }
    v15 += 8;
  }
  while (v15 != 256);
  if (v16 > a1[11])
  {
    v19 = 0;
    result = 10016;
  }
  else
  {
LABEL_20:
    result = 10010;
    if (a5 > 34889)
    {
      if (a5 > 36010)
      {
        if (a5 == 36011 || a5 == 37126)
        {
          result = 0;
          v19 = WORD2(v25);
        }
        else
        {
          if (a5 != 37127)
            return result;
          result = 0;
          v19 = BYTE6(v25);
        }
      }
      else
      {
        switch(a5)
        {
          case 34890:
            result = 0;
            v19 = HIWORD(v24);
            break;
          case 35057:
            result = 0;
            v19 = (unsigned __int16)v25;
            break;
          case 35903:
            result = 0;
            v19 = WORD1(v25);
            break;
          default:
            return result;
        }
      }
    }
    else
    {
      switch(a5)
      {
        case 32860:
          result = 0;
          v19 = WORD1(v23);
          break;
        case 32861:
          result = 0;
          v19 = WORD2(v23);
          break;
        case 32862:
          result = 0;
          v19 = HIWORD(v23);
          break;
        case 32863:
          result = 0;
          v19 = (unsigned __int16)v24;
          break;
        case 32864:
          result = 0;
          v19 = WORD1(v24);
          break;
        case 32865:
          result = 0;
          v19 = WORD2(v24);
          break;
        default:
          if (a5 != 4099)
            return result;
          result = 0;
          v19 = (unsigned __int16)v23;
          break;
      }
    }
  }
  *a6 = v19;
  return result;
}

uint64_t gpumRestoreTextureData(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v19;
  int v20;

  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  v12 = a2[4];
  v11 = a2[5];
  if ((*(_DWORD *)(v12 + 260) | 0x80) != 0xC0)
  {
    v13 = (unsigned __int16 *)(v11 + 2 * (int)a3);
    v14 = v13[6];
    v15 = *v13;
    if ((v14 & ~v15 & (1 << a4)) != 0)
      *(_WORD *)(v11 + 2 * (int)a3) = v14 & (1 << a4) | v15;
    IOAccelResourceFinishEvent();
    goto LABEL_9;
  }
  if (((1 << a4) & *(unsigned __int16 *)(v11 + 2 * (int)a3 + 12) & ~*(unsigned __int16 *)(v11 + 2 * (int)a3)) != 0)
  {
    IOAccelResourcePageoff();
LABEL_9:
    v16 = *(_DWORD *)(v12 + 260);
    goto LABEL_10;
  }
  IOAccelResourceFinishEvent();
  v16 = *(_DWORD *)(v12 + 260);
  if (v16 == 192)
  {
    if ((*(_BYTE *)(a1 + 296) & 0x80) != 0)
    {
      v19 = *a2 + 480 * (int)a3 + 32 * (int)a4;
      v20 = gpusRowBytes(*(unsigned __int16 *)(v19 + 280), *(unsigned __int16 *)(v19 + 282), *(unsigned __int16 *)(v19 + 276));
      gpusFlushMemoryForIn(*(void **)(v19 + 288), *(unsigned __int16 *)(v19 + 278) * (uint64_t)v20 * *(unsigned __int16 *)(v19 + 272));
    }
    goto LABEL_9;
  }
LABEL_10:
  if ((v16 | 0x40) == 0x40)
    v17 = a6(a1, a2, a3, a4);
  else
    v17 = 0;
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return v17;
}

uint64_t gpumReadTextureData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v16;

  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  v16 = a9(a1, a2, a3, a4, a5, a6, a7);
  if (*(_BYTE *)(a1 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return v16;
}

uint64_t gpusLoadCurrentTextures(uint64_t result, unsigned __int16 a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  _DWORD *v16;
  int v17;
  unsigned __int8 v18;
  _WORD *v20;
  int v21;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v36;

  v3 = a2;
  *(_DWORD *)(result + 140) &= ~a2;
  v4 = *(_QWORD *)(result + 24);
  if (!*(_BYTE *)(v4 + 12724))
    return result;
  v5 = a3;
  v6 = result;
  v7 = 0;
  v36 = *(_QWORD *)(result + 16);
  v34 = a2;
  do
  {
    if (!v3)
      goto LABEL_55;
    do
    {
      v8 = __clz(__rbit32(v3));
      v9 = 1 << v8;
      v10 = v8 + 16 * (_DWORD)v7;
      v11 = *(_QWORD *)(v5 + 8 * v7) >> (4 * v8);
      v12 = v11 & 0xF;
      if (v12 > 0xA)
      {
        if (!*(_QWORD *)(v6 + 8 * v10 + 200))
        {
          v13 = 0;
          goto LABEL_51;
        }
        v13 = 0;
        *(_DWORD *)(v6 + 4 * v10 + 848) = 0;
        goto LABEL_22;
      }
      v13 = *(_QWORD *)(*(_QWORD *)(v6 + 40) + 8 * v10);
      if (v13)
      {
        v14 = *(uint64_t **)(v13 + 8);
        v15 = *((unsigned __int8 *)v14 + 20);
        v16 = (_DWORD *)(v6 + 4 * v10 + 848);
        v17 = *v16;
        if (*v16 == *(_DWORD *)(v13 + 56))
          v18 = *((_BYTE *)v14 + 20);
        else
          v18 = -113;
        if (v12 != 7)
        {
          v20 = *(_WORD **)v13;
          if (((unsigned __int16)v9 & *(_WORD *)(*(_QWORD *)(v6 + 24) + 2 * v7 + 12720)) == 0 || *((_BYTE *)v20 + 2))
          {
            v21 = (unsigned __int16)v20[2];
            v23 = v21 == 6402 || v21 == 34041;
            result = v36;
            v24 = v36 + 88 * v23 + 8 * (v11 & 0xF);
            v26 = *(_QWORD *)(v24 + 112);
            v25 = (uint64_t *)(v24 + 112);
            v13 = v26;
            if (!v26)
            {
              result = gpusCreateZeroTexture(v36, v23, v12);
              v16 = (_DWORD *)(v6 + 4 * v10 + 848);
              v13 = result;
              *v25 = result;
              v17 = *v16;
            }
            v15 = *(unsigned __int8 *)(*(_QWORD *)(v13 + 8) + 20);
            if (v17 == *(_DWORD *)(v13 + 56))
              v18 = *(_BYTE *)(*(_QWORD *)(v13 + 8) + 20);
            else
              v18 = -113;
          }
          if (!v15)
          {
            v5 = a3;
LABEL_47:
            *v16 = *(_DWORD *)(v13 + 56);
            if ((**(_WORD **)v13 & 0x800) != 0)
              result = IOSurfaceBindAccel();
LABEL_49:
            if (!v18)
              goto LABEL_51;
            goto LABEL_50;
          }
          v27 = v16;
          v28 = *(_DWORD *)(v36 + 316) + 1;
          *(_DWORD *)(v36 + 316) = v28;
          *(_DWORD *)(v13 + 56) = v28;
          result = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 8) + 296))();
          if ((_DWORD)result)
          {
            v16 = v27;
            v5 = a3;
LABEL_45:
            v33 = *(_QWORD *)(v13 + 8);
            *(_QWORD *)(v33 + 13) = 0;
            *(_QWORD *)(v33 + 8) = 0;
            goto LABEL_47;
          }
          v5 = a3;
          goto LABEL_16;
        }
        if ((v15 & 8) == 0)
        {
          if (!*((_BYTE *)v14 + 20))
          {
            v5 = a3;
            goto LABEL_47;
          }
          goto LABEL_44;
        }
        v29 = *v14;
        if (*v14)
        {
          v30 = **(_DWORD **)(v29 + 8);
          if (!(_BYTE)v30)
            goto LABEL_44;
          result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 + 8) + 320))(v36, v29, v30);
          if ((_DWORD)result)
          {
            **(_DWORD **)(v29 + 8) = 0;
            v16 = (_DWORD *)(v6 + 4 * v10 + 848);
LABEL_44:
            v31 = *(_DWORD *)(v36 + 316) + 1;
            *(_DWORD *)(v36 + 316) = v31;
            *(_DWORD *)(v13 + 56) = v31;
            v32 = v16;
            result = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 8) + 296))();
            v16 = v32;
            v5 = a3;
            if ((_DWORD)result)
              goto LABEL_45;
            goto LABEL_16;
          }
        }
        v5 = a3;
      }
      else
      {
        v18 = 0;
      }
LABEL_16:
      v13 = 0;
      if (v12 == 7 && *(_DWORD *)(v6 + 84) != 0)
        goto LABEL_49;
      *(_DWORD *)(v6 + 140) |= 1 << v10;
      *(_DWORD *)(v6 + 4 * v10 + 848) = 0;
      if (!*(_QWORD *)(v6 + 8 * v10 + 200))
        goto LABEL_51;
LABEL_22:
      v18 = -113;
LABEL_50:
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 + 8) + 376))(v6, v13, v10, v18);
LABEL_51:
      *(_QWORD *)(v6 + 8 * v10 + 200) = v13;
      v3 ^= v9;
    }
    while (v3);
    v4 = *(_QWORD *)(v6 + 24);
    v3 = v34;
LABEL_55:
    ++v7;
  }
  while (v7 < *(unsigned __int8 *)(v4 + 12724));
  return result;
}

uint64_t gpusCreateZeroTexture(uint64_t a1, int a2, int a3)
{
  int v6;
  int v7;
  char v8;
  unsigned int v9;
  _BOOL4 v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  char v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t result;
  uint64_t v32;

  if (a3 == 10)
  {
    v11 = 15;
    v7 = 1;
    v9 = 6;
    v8 = 2;
    v10 = 1;
  }
  else
  {
    if (a3)
      v6 = 1;
    else
      v6 = 6;
    if (a3 == 2)
      v7 = 1;
    else
      v7 = v6;
    v8 = 0;
    v9 = 1;
    v10 = a3 != 2;
    if (a3 == 2)
      v11 = 1;
    else
      v11 = 15;
  }
  v12 = 32 * v7 * v11 + 264;
  v13 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(_QWORD *)a1 + 232), 1uLL, v12 + 4 * v9 + 24, 0xD68DC258uLL);
  if (!v13)
    abort();
  v14 = (uint64_t)v13;
  v15 = 0;
  v16 = (uint64_t)&v13[v12];
  v17 = (uint64_t)&v13[v12 + 24];
  do
  {
    *(_DWORD *)(v17 + v15) = -16777216;
    v15 += 4;
  }
  while (4 * v9 != v15);
  *(_WORD *)v13 = a3 & 0xF | 0x1000;
  *((_WORD *)v13 + 3) = 1028;
  *((_DWORD *)v13 + 2) = 1065353216;
  if (a2)
    v18 = 6402;
  else
    v18 = 6408;
  *((_WORD *)v13 + 2) = v18;
  v13[24] = v13[24] & 0xE7 | 8;
  *((_DWORD *)v13 + 38) = 687941889;
  *((_WORD *)v13 + 78) = 10497;
  *((_OWORD *)v13 + 10) = xmmword_21E042D30;
  *((_QWORD *)v13 + 18) = 0x20326002600;
  *(_QWORD *)(v13 + 116) = 0x3E800000000;
  *((_DWORD *)v13 + 31) = 0;
  v13[130] &= 0xFAu;
  *((_DWORD *)v13 + 28) = 420054461;
  *((_DWORD *)v13 + 33) = 0;
  v19 = *((_WORD *)v13 + 64) & 0xF000;
  *((_QWORD *)v13 + 17) = 0;
  *((_WORD *)v13 + 64) = v19 | 0x688;
  switch(a3)
  {
    case 1:
      v20 = *((_WORD *)v13 + 107);
      v21 = 20;
      goto LABEL_27;
    case 2:
    case 8:
      v20 = *((_WORD *)v13 + 107);
      v21 = 5;
      goto LABEL_27;
    case 4:
      v22 = *((_WORD *)v13 + 107) & 0xC0FF;
      break;
    case 5:
    case 10:
      v20 = *((_WORD *)v13 + 107);
      v21 = 36;
      goto LABEL_27;
    case 6:
      v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x2000;
      break;
    case 7:
      v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x100;
      break;
    case 9:
      v20 = *((_WORD *)v13 + 107);
      v21 = 37;
LABEL_27:
      v22 = v20 & 0xC0FF | ((v21 & 0x3F) << 8);
      break;
    default:
      v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x400;
      break;
  }
  v23 = 0;
  v13[211] = v7;
  v13[213] = v11;
  *((_DWORD *)v13 + 50) = -2090368799;
  *((_WORD *)v13 + 98) = 1;
  *((_WORD *)v13 + 99) = v9;
  *((_WORD *)v13 + 107) = v22 & 0xBF00 | 0x4000;
  *((_DWORD *)v13 + 48) = 98392;
  *((_WORD *)v13 + 102) = 0;
  if (v11 <= 2)
    v24 = 2;
  else
    v24 = v11;
  v13[206] = v8;
  *(_DWORD *)(v13 + 207) = 0x10000;
  *(_BYTE *)(v16 + 20) = -113;
  v25 = v13 + 314;
  v26 = v24 - 1;
  *(_QWORD *)(v16 + 8) = -1;
  *(_DWORD *)(v16 + 16) = -1;
  do
  {
    v27 = v14 + 480 * v23;
    *(_DWORD *)(v27 + 268) = 65537;
    *(_WORD *)(v27 + 272) = v9;
    *(_QWORD *)(v27 + 288) = v17;
    *(_QWORD *)(v27 + 276) = 0x836780E100010001;
    *(_BYTE *)(v27 + 275) = 48;
    v28 = v14 + 2 * v23;
    *(_WORD *)(v28 + 216) |= 1u;
    *(_WORD *)(v28 + 228) |= 1u;
    if (v10)
    {
      v29 = v26;
      v30 = v25;
      do
      {
        *(_DWORD *)(v30 - 2) = 335616264;
        v30 += 32;
        --v29;
      }
      while (v29);
    }
    ++v23;
    v25 += 480;
  }
  while (v23 != v7);
  v32 = 0;
  gldCreateTexture(a1, &v32, v14, v16);
  result = v32;
  *(_QWORD *)(v32 + 16) = v14;
  return result;
}

uint64_t gldModifyTexSubImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v17 = *(_QWORD *)(a2 + 8);
  v18 = *(unsigned __int8 *)(v17 + 20);
  if (!*(_BYTE *)(v17 + 20) && (!a13 || !**(_BYTE **)(a13 + 8)))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 392))(a1, a2, a3, a4);
  if ((((unsigned __int16)(*(_WORD *)(*(_QWORD *)a2 + 2 * (int)a3 + 228) & *(_WORD *)(v17 + 2 * (int)a3 + 8)) >> a4) & 1) == 0)
  {
    v19 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v19 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v19 + 48));
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 20);
    }
    if (v18)
    {
      v21 = *(_QWORD *)(a1 + 8);
      v20 = *(_QWORD *)(a1 + 16);
      v22 = *(_DWORD *)(v20 + 316) + 1;
      *(_DWORD *)(v20 + 316) = v22;
      *(_DWORD *)(a2 + 56) = v22;
      if (!(*(unsigned int (**)(void))(v21 + 296))())
        goto LABEL_19;
      v23 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(v23 + 13) = 0;
      *(_QWORD *)(v23 + 8) = 0;
    }
    if (a13 && **(_BYTE **)(a13 + 8))
    {
      if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 8) + 320))(*(_QWORD *)(a1 + 16), a13))
      {
        v18 = 0;
        **(_DWORD **)(a13 + 8) = 0;
      }
      else
      {
        v18 = 1;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_19:
    v24 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v24 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v24 + 48));
    if (!v18)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 392))(a1, a2, a3, a4);
    return 0;
  }
  if (*(_BYTE *)(v17 + 20))
    return 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 392))(a1, a2, a3, a4);
}

uint64_t gldCopyTexSubImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  if (!*(_BYTE *)(*(_QWORD *)(a2 + 8) + 20))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 400))(a1, a2, a3, a4, a5);
  v10 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v10 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v10 + 48));
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 20);
    v13 = *(_DWORD *)(v11 + 316) + 1;
    *(_DWORD *)(v11 + 316) = v13;
    *(_DWORD *)(a2 + 56) = v13;
    if (!v12)
      goto LABEL_8;
  }
  else
  {
    v14 = *(_DWORD *)(v10 + 316) + 1;
    *(_DWORD *)(v10 + 316) = v14;
    *(_DWORD *)(a2 + 56) = v14;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 8) + 296))())
  {
    v15 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v15 + 13) = 0;
    *(_QWORD *)(v15 + 8) = 0;
LABEL_8:
    v16 = 1;
    goto LABEL_10;
  }
  v16 = 0;
LABEL_10:
  v17 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v17 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 48));
  if (v16)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 400))(a1, a2, a3, a4, a5);
  return 0;
}

uint64_t gldCopyTextureData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v16 = *(_QWORD *)(a2 + 8);
  v17 = *(unsigned __int8 *)(v16 + 20);
  v18 = *(unsigned __int8 *)(*(_QWORD *)(a5 + 8) + 20);
  if (!*(_BYTE *)(v16 + 20))
    goto LABEL_10;
  v19 = *(_QWORD *)(a1 + 16);
  if (!*(_BYTE *)(v19 + 288))
  {
    v22 = *(_DWORD *)(v19 + 316) + 1;
    *(_DWORD *)(v19 + 316) = v22;
    *(_DWORD *)(a2 + 56) = v22;
LABEL_6:
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 8) + 296))())
    {
      v17 = 0;
      v23 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(v23 + 13) = 0;
      *(_QWORD *)(v23 + 8) = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v19 + 48));
  v20 = *(_QWORD *)(a1 + 16);
  v17 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 20);
  v21 = *(_DWORD *)(v20 + 316) + 1;
  *(_DWORD *)(v20 + 316) = v21;
  *(_DWORD *)(a2 + 56) = v21;
  if (v17)
    goto LABEL_6;
LABEL_8:
  v24 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v24 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(v24 + 48));
LABEL_10:
  if (v18)
  {
    v25 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v25 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v25 + 48));
      v25 = *(_QWORD *)(a1 + 16);
    }
    v26 = *(_DWORD *)(v25 + 316) + 1;
    *(_DWORD *)(v25 + 316) = v26;
    *(_DWORD *)(a5 + 56) = v26;
    v27 = *(_QWORD *)(a5 + 8);
    v18 = *(unsigned __int8 *)(v27 + 20);
    if (*(_BYTE *)(v27 + 20) && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 8) + 296))())
    {
      v18 = 0;
      v28 = *(_QWORD *)(a5 + 8);
      *(_QWORD *)(v28 + 13) = 0;
      *(_QWORD *)(v28 + 8) = 0;
    }
    v29 = *(_QWORD *)(a1 + 16);
    if (*(_BYTE *)(v29 + 288))
      pthread_mutex_unlock((pthread_mutex_t *)(v29 + 48));
  }
  if (v18 | v17)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 408))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t gldGenerateTexMipmaps(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  if (!*(_BYTE *)(*(_QWORD *)(a2 + 8) + 20))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 424))(a1, a2, a3, a4);
  v8 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v8 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v8 + 48));
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 20);
    v11 = *(_DWORD *)(v9 + 316) + 1;
    *(_DWORD *)(v9 + 316) = v11;
    *(_DWORD *)(a2 + 56) = v11;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v12 = *(_DWORD *)(v8 + 316) + 1;
    *(_DWORD *)(v8 + 316) = v12;
    *(_DWORD *)(a2 + 56) = v12;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 8) + 296))())
  {
    v13 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v13 + 13) = 0;
    *(_QWORD *)(v13 + 8) = 0;
LABEL_8:
    v14 = 1;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:
  v15 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v15 + 288))
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 48));
  if (v14)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 424))(a1, a2, a3, a4);
  return 0;
}

uint64_t gpusGetKernelTexture(uint64_t a1, _QWORD *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, unsigned int a7, unsigned int a8, uint64_t a9, unsigned int a10, int a11, int a12, uint64_t a13)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  int v20;
  __int16 v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v30;
  __int16 v31;
  unsigned int v32;

  v15 = a9;
  v16 = a2[3];
  v17 = *a2;
  v18 = *(_BYTE *)(*a2 + 208);
  v19 = (*(unsigned __int16 *)(*a2 + 198) >> v18) | (*(unsigned __int16 *)(*a2 + 198) >> v18 == 0);
  if (v18)
    v20 = (*(unsigned __int16 *)(*a2 + 194) >> v18) | (*(unsigned __int16 *)(*a2 + 194) >> v18 == 0);
  else
    LOWORD(v20) = *(_WORD *)(*a2 + 194);
  if (*(_BYTE *)(*a2 + 208))
    v21 = (*(unsigned __int16 *)(*a2 + 196) >> v18) | (*(unsigned __int16 *)(*a2 + 196) >> v18 == 0);
  else
    v21 = *(_WORD *)(*a2 + 196);
  if (!*(_BYTE *)(*a2 + 208))
    LOWORD(v19) = *(_WORD *)(*a2 + 198);
  *(_OWORD *)(a2 + 3) = 0u;
  *(_OWORD *)(a2 + 5) = 0u;
  if (!a6 && v16)
  {
    v32 = a8;
    v22 = a4;
    v23 = a7;
    v24 = a5;
    v31 = v20;
    v30 = v19;
    IOAccelResourceRelease();
    LOWORD(v19) = v30;
    LOWORD(v20) = v31;
    v15 = a9;
    a5 = v24;
    a7 = v23;
    a4 = v22;
    a8 = v32;
  }
  if (a6 || !v15)
  {
    if (a6 && v15)
    {
      v25 = 192;
    }
    else
    {
      if (v15)
        v26 = 1;
      else
        v26 = a6 == 0;
      if (v26)
        v25 = 0;
      else
        v25 = 128;
    }
  }
  else
  {
    v25 = 64;
  }
  *(_QWORD *)(a13 + 64) = a5;
  *(_QWORD *)(a13 + 72) = a6;
  *(_QWORD *)(a13 + 80) = v15;
  *(_QWORD *)(a13 + 88) = a7;
  *(_BYTE *)(a13 + 32) = *(_BYTE *)(v17 + 211);
  *(_BYTE *)(a13 + 33) = *(_BYTE *)(v17 + 209);
  *(_BYTE *)(a13 + 34) = v18;
  *(_WORD *)(a13 + 8) = v20;
  *(_WORD *)(a13 + 10) = v21;
  *(_WORD *)(a13 + 12) = v19;
  *(_DWORD *)a13 = v25;
  *(_DWORD *)(a13 + 4) = a12;
  *(_BYTE *)(a13 + 35) = a4;
  *(_QWORD *)(a13 + 16) = a10;
  *(_QWORD *)(a13 + 24) = a8;
  v27 = IOAccelResourceCreate();
  if (!v27)
    return 0;
  a2[3] = v27;
  a2[4] = IOAccelResourceGetClientShared();
  v28 = 1;
  *(_BYTE *)(a2[5] + 28) = 1;
  a2[6] = IOAccelResourceGetDataBytes();
  IOAccelResourceRelease();
  return v28;
}

uint64_t gldGetTextureAllocationIdentifiers(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *a2;
  *a2 = 0;
  if ((**(_WORD **)a1 & 0x800) != 0)
  {
    v9 = 0;
    v10 = a1 + 80;
    do
    {
      result = *(_QWORD *)(v10 + v9);
      if (result)
      {
        result = IOAccelResourceCreateAllocationIdentifierSet();
        v11 = *a2;
        if (v11 < v5)
        {
          *(_QWORD *)(a3 + 8 * v11) = 0xDEADBEEFDEADBEEFLL;
          *a2 = v11 + 1;
        }
        v12 = *a2;
        if (v12 < v5)
        {
          *(_QWORD *)(a3 + 8 * v12) = 0xDEADBEEFDEADBEEFLL;
          *a2 = v12 + 1;
        }
      }
      v9 += 8;
    }
    while (v9 != 32);
  }
  else
  {
    result = *(_QWORD *)(a1 + 24);
    if (result)
    {
      result = IOAccelResourceCreateAllocationIdentifierSet();
      v7 = *a2;
      if (v7 < v5)
      {
        *(_QWORD *)(a3 + 8 * v7) = 0xDEADBEEFDEADBEEFLL;
        *a2 = v7 + 1;
      }
      v8 = *a2;
      if (v8 < v5)
      {
        *(_QWORD *)(a3 + 8 * v8) = 0xDEADBEEFDEADBEEFLL;
        *a2 = v8 + 1;
      }
    }
  }
  return result;
}

uint64_t gpusGetKernelTextureSurface()
{
  return 0;
}

uint64_t gpusReleaseAccumIOSurface(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)(a2 + 204))
  {
    result = IOAccelResourceRelease();
    *(_QWORD *)(a2 + 176) = 0;
  }
  *(_DWORD *)(a2 + 204) = 0;
  *(_QWORD *)(a2 + 184) = 0;
  *(_QWORD *)(a2 + 192) = 0;
  return result;
}

uint64_t gpusGetKernelTextureIOSurface(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  char v8;
  int v9;
  uint64_t v10;
  char v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __IOSurface *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  int v29;
  unsigned int v32;
  unsigned int v33;

  v5 = *(_QWORD *)a2;
  v6 = *(unsigned __int16 *)(*(_QWORD *)a2 + 196);
  v7 = *(unsigned __int16 *)(*(_QWORD *)a2 + 198);
  v8 = *(_BYTE *)(*(_QWORD *)a2 + 208);
  if (v8)
    v9 = (*(unsigned __int16 *)(*(_QWORD *)a2 + 194) >> v8) | (*(unsigned __int16 *)(*(_QWORD *)a2 + 194) >> v8 == 0);
  else
    v9 = *(unsigned __int16 *)(*(_QWORD *)a2 + 194);
  if (*(_BYTE *)(*(_QWORD *)a2 + 208))
  {
    v6 = (v6 >> v8) | (v6 >> v8 == 0);
    v7 = (v7 >> v8) | (v7 >> v8 == 0);
  }
  v10 = *(_QWORD *)(v5 + 256);
  if (!v10)
    return 0;
  v12 = a4;
  v13 = a3;
  v32 = v7;
  v33 = v6;
  v15 = 0;
  v16 = -1;
  do
  {
    if (v10 == *(_QWORD *)(v5 + 48 + 8 * v15))
      v16 = v15;
    ++v15;
  }
  while (v15 != 4);
  v17 = *(_QWORD *)(a2 + 24);
  if (v17)
  {
    v29 = v9;
    v18 = 0;
    v19 = a2 + 64;
    v20 = (uint64_t *)(a2 + 80);
    while (1)
    {
      v21 = *v20;
      if (*v20)
      {
        if (!*(_QWORD *)(v5 + 48 + 8 * v18))
          goto LABEL_17;
        if (IOSurfaceGetID(*(IOSurfaceRef *)(v5 + 48 + 8 * v18)) != *(_DWORD *)(v19 + 4 * v18))
          break;
      }
LABEL_23:
      ++v18;
      ++v20;
      if (v18 == 4)
      {
        v13 = a3;
        v12 = a4;
        LOWORD(v9) = v29;
        if (*(_DWORD *)a5 != 130
          || *(_DWORD *)(a5 + 68) != *(unsigned __int16 *)(v5 + 248)
          || *(_DWORD *)(a5 + 72) != *(unsigned __int16 *)(v5 + 250)
          || *(_DWORD *)(a5 + 76) != a3
          || *(unsigned __int8 *)(a5 + 32) != *(unsigned __int8 *)(v5 + 211)
          || *(unsigned __int8 *)(a5 + 33) != *(unsigned __int8 *)(v5 + 209)
          || *(unsigned __int8 *)(a5 + 34) != *(unsigned __int8 *)(v5 + 208)
          || *(unsigned __int8 *)(a5 + 35) != a4
          || v29 != *(unsigned __int16 *)(a5 + 8)
          || v33 != *(unsigned __int16 *)(a5 + 10)
          || v32 != *(unsigned __int16 *)(a5 + 12))
        {
          if (*(_DWORD *)(a2 + 204))
          {
            IOAccelResourceRelease();
            *(_QWORD *)(a2 + 176) = 0;
          }
          *(_DWORD *)(a2 + 204) = 0;
          *(_QWORD *)(a2 + 184) = 0;
          *(_QWORD *)(a2 + 192) = 0;
        }
        goto LABEL_38;
      }
    }
    v21 = *v20;
LABEL_17:
    if (v21 == *(_QWORD *)(a2 + 176))
    {
      *(_DWORD *)(a2 + 204) = 1;
    }
    else
    {
      gpusWaitResource();
      IOAccelResourceRelease();
      v21 = *v20;
    }
    if (v21 == v17)
    {
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
    }
    *v20 = 0;
    v20[4] = 0;
    v20[8] = 0;
    *(_DWORD *)(v19 + 4 * v18) = 0;
    goto LABEL_23;
  }
LABEL_38:
  v22 = 0;
  *(_DWORD *)(a5 + 68) = *(unsigned __int16 *)(v5 + 248);
  *(_DWORD *)(a5 + 72) = *(unsigned __int16 *)(v5 + 250);
  *(_DWORD *)(a5 + 76) = v13;
  *(_BYTE *)(a5 + 32) = *(_BYTE *)(v5 + 211);
  *(_BYTE *)(a5 + 33) = *(_BYTE *)(v5 + 209);
  *(_BYTE *)(a5 + 34) = *(_BYTE *)(v5 + 208);
  *(_WORD *)(a5 + 8) = v9;
  *(_WORD *)(a5 + 10) = v33;
  *(_WORD *)(a5 + 12) = v32;
  *(_BYTE *)(a5 + 35) = v12;
  *(_QWORD *)a5 = 130;
  for (i = a2 + 144; ; i += 8)
  {
    v24 = *(__IOSurface **)(v5 + 48 + 8 * v22);
    if (!v24 || *(_QWORD *)(i - 64))
      goto LABEL_43;
    *(_DWORD *)(a5 + 64) = IOSurfaceGetID(v24);
    v25 = IOAccelResourceCreate();
    if (!v25)
      break;
    *(_QWORD *)(i - 64) = v25;
    *(_QWORD *)(i - 32) = IOAccelResourceGetClientShared();
    *(_DWORD *)(a2 + 4 * v22 + 64) = *(_DWORD *)(a5 + 64);
LABEL_43:
    if (++v22 == 4)
    {
      v26 = (_QWORD *)(a2 + 8 * v16);
      v27 = v26[14];
      *(_QWORD *)(a2 + 24) = v26[10];
      *(_QWORD *)(a2 + 32) = v27;
      *(_QWORD *)(a2 + 40) = v26[18];
      *(_QWORD *)(a2 + 48) = 0;
      *(_DWORD *)(a2 + 216) = v16;
      return 1;
    }
  }
  gpulDeleteKernelTexture(a2);
  return 0;
}

void gpusDestroyZeroTexture(_QWORD *a1, _QWORD *a2)
{
  void *v3;

  v3 = (void *)a2[2];
  a2[2] = 0;
  gldDestroyTexture(a1, a2);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v3);
}

uint64_t gldCreateVertexArray(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(_QWORD *)(*a1 + 104), 0xD68DC258uLL);
  if (!v8)
    abort();
  v9 = v8;
  *v8 = a3;
  v8[1] = a4;
  v8[4] = 0;
  (*(void (**)(_QWORD *, _QWORD *))(a1[1] + 80))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldModifyVertexArray()
{
  return 0;
}

uint64_t gldFlushVertexArray(uint64_t a1, int a2, void *start, size_t len, int a5)
{
  if (!a5)
    return 0;
  if ((*(_BYTE *)(a1 + 296) & 0x80) != 0)
    gpusFlushMemoryForOut(start, len);
  return 1;
}

uint64_t gldDestroyVertexArray(_QWORD *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 88))();
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldUnbindVertexArray(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 808) == a2)
  {
    v2 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 368))();
    *(_QWORD *)(v2 + 808) = 0;
    *(_DWORD *)(v2 + 1104) = 0;
  }
  return result;
}

_QWORD *gpusLoadCurrentVertexArray(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD, uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t i;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = result;
  v2 = result[5];
  v3 = *(uint64_t **)(v2 + 368);
  if ((*(_BYTE *)(result[15] + 12) & 1) != 0)
  {
    v4 = *(_QWORD *)(v2 + 976);
    if (v4)
    {
      if (**(_DWORD **)(v4 + 8))
      {
        result = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(result[2] + 8) + 320))();
        if (!(_DWORD)result)
          goto LABEL_17;
        **(_DWORD **)(v4 + 8) = 0;
      }
    }
  }
  if (v3)
  {
    v5 = *v3;
    v6 = *(_QWORD *)(v3[1] + 272);
    v7 = *((_DWORD *)v3 + 9);
    if (*((_DWORD *)v1 + 277) == v7)
      v8 = *(_QWORD *)(v3[1] + 272);
    else
      v8 = -1;
    if (v6)
    {
      v10 = v1[1];
      v9 = v1[2];
      v11 = *(_DWORD *)(v9 + 328) + 1;
      *(_DWORD *)(v9 + 328) = v11;
      *((_DWORD *)v3 + 9) = v11;
      result = (_QWORD *)(*(uint64_t (**)(void))(v10 + 272))();
      v7 = *((_DWORD *)v3 + 9);
    }
    *((_DWORD *)v1 + 277) = v7;
    if (v8)
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t *, uint64_t))(v1[1] + 344))(v1, v3, v8);
    v12 = *(_QWORD *)(v5 + 768);
    if ((*(char *)(v1[4] + 25) < 0 || v12) && (v12 & ~*(_QWORD *)(v5 + 776)) == 0)
    {
      v14 = *(uint64_t (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(v1[1] + 280);
      if (v14)
      {
        v15 = v3[1];
        v16 = *(_QWORD *)(v15 + 264);
        if (v16 != 128)
        {
          v17 = *((_DWORD *)v3 + 8);
          if (*((_DWORD *)v1 + 276) == v17)
            v13 = *(_QWORD *)(v15 + 264);
          else
            v13 = -1;
          if (!v16)
          {
LABEL_45:
            *((_DWORD *)v1 + 276) = v17;
            if (!v13)
              goto LABEL_22;
            goto LABEL_21;
          }
          v18 = v1[2];
          v19 = *(_DWORD *)(v18 + 324) + 1;
          *(_DWORD *)(v18 + 324) = v19;
          v20 = v3[2];
          *((_DWORD *)v3 + 8) = v19;
          v28 = v20;
          v27 = v3[3];
          v29 = v27 | v6;
          v30 = v20 | v16;
          if (((v20 | v16) & 0x10) == 0)
            goto LABEL_43;
          v21 = *v3;
          if ((v30 & 4) == 0)
          {
LABEL_38:
            for (i = *(_QWORD *)(v21 + 768) & v30; i; i ^= 1 << v25)
            {
              v25 = __clz(__rbit64(i));
              v26 = *(_QWORD *)(v3[1] + 8 * v25 - 128);
              if (**(_DWORD **)(v26 + 8))
              {
                result = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v18 + 8) + 320))(v18, *(_QWORD *)(v3[1] + 8 * v25 - 128), **(_DWORD **)(v26 + 8));
                if (!(_DWORD)result)
                  goto LABEL_47;
                **(_DWORD **)(v26 + 8) = 0;
              }
            }
LABEL_43:
            result = (_QWORD *)v14(v1[2], v3, v30, v29);
            if ((_DWORD)result)
            {
              v13 |= v28;
              v8 |= v27;
              v3[2] = 0;
              v3[3] = 0;
              *(_QWORD *)(v3[1] + 264) = 0;
              *(_QWORD *)(v3[1] + 272) = 0;
              v17 = *((_DWORD *)v3 + 8);
              goto LABEL_45;
            }
LABEL_47:
            v3[2] = v30;
            v3[3] = v29;
            *(_QWORD *)(v3[1] + 264) = 128;
            *(_QWORD *)(v3[1] + 272) = 0;
            goto LABEL_17;
          }
          v22 = *(_QWORD *)(v15 + 256);
          if (v22)
          {
            if (!**(_DWORD **)(v22 + 8))
            {
LABEL_35:
              v23 = 1;
LABEL_37:
              *((_BYTE *)v3 + 40) = v23;
              goto LABEL_38;
            }
            if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v18 + 8) + 320))(v18, v22, **(_DWORD **)(v22 + 8)))
            {
              **(_DWORD **)(v22 + 8) = 0;
              goto LABEL_35;
            }
          }
          v23 = 0;
          goto LABEL_37;
        }
      }
    }
  }
LABEL_17:
  v3 = 0;
  *((_DWORD *)v1 + 276) = 0;
  if (v1[101])
    v13 = -1;
  else
    v13 = 0;
  v8 = v13;
  if (v13)
LABEL_21:
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t *, uint64_t, uint64_t))(v1[1] + 368))(v1, v3, v13, v8);
LABEL_22:
  v1[101] = v3;
  return result;
}

uint64_t gstctxOpState()
{
  return 0;
}

uint64_t gldAttachDrawable()
{
  return 10010;
}

void gpumInitializeIOData_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_21E03A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "No devices found while initializing the GLContext", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t IOAccelCLContextCreate()
{
  return MEMORY[0x24BE513A0]();
}

uint64_t IOAccelCLContextFinishFenceEvent()
{
  return MEMORY[0x24BE513A8]();
}

uint64_t IOAccelCLContextFinishResourceSysMem()
{
  return MEMORY[0x24BE513B0]();
}

uint64_t IOAccelCLContextGetDataBufferClassCount()
{
  return MEMORY[0x24BE513B8]();
}

uint64_t IOAccelCLContextGetDataBufferResource()
{
  return MEMORY[0x24BE513C0]();
}

uint64_t IOAccelCLContextGetFenceBuffer()
{
  return MEMORY[0x24BE513C8]();
}

uint64_t IOAccelCLContextGetSidebandBuffer()
{
  return MEMORY[0x24BE513D0]();
}

uint64_t IOAccelCLContextRelease()
{
  return MEMORY[0x24BE513D8]();
}

uint64_t IOAccelCLContextRequestDataBuffer()
{
  return MEMORY[0x24BE513E0]();
}

uint64_t IOAccelCLContextSetDataBufferClassUsedBytes()
{
  return MEMORY[0x24BE513E8]();
}

uint64_t IOAccelCLContextSubmitDataBuffers()
{
  return MEMORY[0x24BE513F0]();
}

uint64_t IOAccelContextAddResource()
{
  return MEMORY[0x24BE513F8]();
}

uint64_t IOAccelContextSetBackgroundRendering()
{
  return MEMORY[0x24BE51400]();
}

uint64_t IOAccelDeviceCreateWithAPIProperty()
{
  return MEMORY[0x24BE51408]();
}

uint64_t IOAccelDeviceGetConfig64()
{
  return MEMORY[0x24BE51410]();
}

uint64_t IOAccelDeviceGetConnect()
{
  return MEMORY[0x24BE51418]();
}

uint64_t IOAccelDeviceRelease()
{
  return MEMORY[0x24BE51420]();
}

uint64_t IOAccelDeviceTestEvent()
{
  return MEMORY[0x24BE51428]();
}

uint64_t IOAccelGLContextCreate()
{
  return MEMORY[0x24BE51430]();
}

uint64_t IOAccelGLContextFinish()
{
  return MEMORY[0x24BE51438]();
}

uint64_t IOAccelGLContextFinishFenceEvent()
{
  return MEMORY[0x24BE51440]();
}

uint64_t IOAccelGLContextFinishResourceSysMem()
{
  return MEMORY[0x24BE51448]();
}

uint64_t IOAccelGLContextFlushResourceSysMem()
{
  return MEMORY[0x24BE51450]();
}

uint64_t IOAccelGLContextGetDataBufferClassCount()
{
  return MEMORY[0x24BE51458]();
}

uint64_t IOAccelGLContextGetDataBufferResource()
{
  return MEMORY[0x24BE51460]();
}

uint64_t IOAccelGLContextGetFenceBuffer()
{
  return MEMORY[0x24BE51468]();
}

uint64_t IOAccelGLContextGetSidebandBuffer()
{
  return MEMORY[0x24BE51470]();
}

uint64_t IOAccelGLContextReclaimResources()
{
  return MEMORY[0x24BE51478]();
}

uint64_t IOAccelGLContextRelease()
{
  return MEMORY[0x24BE51480]();
}

uint64_t IOAccelGLContextRequestDataBuffer()
{
  return MEMORY[0x24BE51488]();
}

uint64_t IOAccelGLContextSetDataBufferClassUsedBytes()
{
  return MEMORY[0x24BE51490]();
}

uint64_t IOAccelGLContextSubmitDataBuffersExt2()
{
  return MEMORY[0x24BE51498]();
}

uint64_t IOAccelGLContextTestResourceSysMem()
{
  return MEMORY[0x24BE514A0]();
}

uint64_t IOAccelResourceCheckSysMem()
{
  return MEMORY[0x24BE514B8]();
}

uint64_t IOAccelResourceCreate()
{
  return MEMORY[0x24BE514C0]();
}

uint64_t IOAccelResourceCreateAllocationIdentifierSet()
{
  return MEMORY[0x24BE514C8]();
}

uint64_t IOAccelResourceFinishEvent()
{
  return MEMORY[0x24BE514D0]();
}

uint64_t IOAccelResourceFinishSysMem()
{
  return MEMORY[0x24BE514D8]();
}

uint64_t IOAccelResourceGetClientShared()
{
  return MEMORY[0x24BE514E0]();
}

uint64_t IOAccelResourceGetDataBytes()
{
  return MEMORY[0x24BE514E8]();
}

uint64_t IOAccelResourceGetDataSize()
{
  return MEMORY[0x24BE514F0]();
}

uint64_t IOAccelResourcePageoff()
{
  return MEMORY[0x24BE514F8]();
}

uint64_t IOAccelResourceRelease()
{
  return MEMORY[0x24BE51500]();
}

uint64_t IOAccelSharedCreate()
{
  return MEMORY[0x24BE51508]();
}

uint64_t IOAccelSharedRelease()
{
  return MEMORY[0x24BE51510]();
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x24BDD8B38]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x24BDBD190]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

uint64_t glgCreateProcessor()
{
  return MEMORY[0x24BDE2DF8]();
}

uint64_t glgDestroyProcessor()
{
  return MEMORY[0x24BDE2E00]();
}

uint64_t glgSetTakeLock()
{
  return MEMORY[0x24BDE2E38]();
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED98](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAEDA0](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAEDB0](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x24BDAEDC0](zone, ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

void sys_dcache_flush(void *start, size_t len)
{
  MEMORY[0x24BDB00C8](start, len);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

