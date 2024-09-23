uint64_t IOMobileFramebufferSwapWait(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2216)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetTimestamps(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2088)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetLayer(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2016)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapBegin(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2176)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapEnd(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2184)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapDirtyRegion(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  result = 3758097090;
  if (a1)
  {
    *(_DWORD *)(a1 + 688) = (int)a2;
    *(_DWORD *)(a1 + 692) = (int)a3;
    v7 = vcvtpd_s64_f64(a4 + a2 - (double)(int)a2);
    *(_DWORD *)(a1 + 696) = v7;
    v8 = vcvtpd_s64_f64(a5 + a3 - (double)(int)a3);
    *(_DWORD *)(a1 + 700) = v8;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      result = 0;
      *(_BYTE *)(a1 + 740) = 1;
    }
  }
  return result;
}

uint64_t ioMobileFramebufferFinalize(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  CFMachPortRef *v6;
  ipc_space_t *v7;
  IONotificationPort *v8;
  mach_port_name_t v9;
  io_connect_t v10;
  void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  void *v16;
  unint64_t v17;
  unint64_t i;
  void *v19;
  const void *v20;
  const void *v21;

  v2 = 0;
  v3 = a1 + 1312;
  do
  {
    v4 = *(const void **)(v3 + v2);
    if (v4)
      CFRelease(v4);
    v2 += 8;
  }
  while (v2 != 32);
  v5 = 0;
  v6 = (CFMachPortRef *)(a1 + 1480);
  v7 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  do
  {
    v8 = *(v6 - 5);
    if (v8)
      IONotificationPortDestroy(v8);
    *(v6 - 5) = 0;
    if (*v6)
    {
      CFMachPortInvalidate(*v6);
      CFRelease(*v6);
    }
    v9 = *((_DWORD *)v6 - 4);
    if (v9)
    {
      mach_port_mod_refs(*v7, v9, 1u, -1);
      *((_DWORD *)v6 - 4) = 0;
    }
    if (*(v6 - 1))
    {
      MEMORY[0x1B5E4BC80](*(unsigned int *)(a1 + 20), v5, *v7);
      *(v6 - 1) = 0;
    }
    ++v5;
    v6 += 8;
  }
  while (v5 != 6);
  v10 = *(_DWORD *)(a1 + 20);
  if (v10)
  {
    IOServiceClose(v10);
    *(_DWORD *)(a1 + 20) = 0;
  }
  v11 = *(void **)(a1 + 1936);
  if (v11)
  {
    free(v11);
    *(_QWORD *)(a1 + 1936) = 0;
  }
  v12 = *(const void **)(a1 + 1944);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 1944) = 0;
  }
  v13 = *(const void **)(a1 + 2736);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 2736) = 0;
  }
  v14 = *(const void **)(a1 + 2744);
  if (v14)
  {
    CFRelease(v14);
    *(_QWORD *)(a1 + 2744) = 0;
  }
  v15 = *(const void **)(a1 + 2728);
  if (v15)
  {
    CFRelease(v15);
    *(_QWORD *)(a1 + 2728) = 0;
  }
  if (*(_BYTE *)(a1 + 1824))
  {
    v16 = *(void **)(a1 + 1816);
    if (v16)
    {
      v17 = *(unsigned int *)(a1 + 1828);
      if ((_DWORD)v17)
      {
        for (i = 0; i < v17; ++i)
        {
          v19 = *(void **)(*(_QWORD *)(a1 + 1816) + 8 * i);
          if (v19)
          {
            free(v19);
            v17 = *(unsigned int *)(a1 + 1828);
          }
        }
        v16 = *(void **)(a1 + 1816);
      }
      free(v16);
      *(_QWORD *)(a1 + 1816) = 0;
      *(_DWORD *)(a1 + 1828) = 0;
      *(_BYTE *)(a1 + 1824) = 0;
    }
  }
  v20 = *(const void **)(a1 + 3296);
  if (v20)
  {
    CFRelease(v20);
    *(_QWORD *)(a1 + 3296) = 0;
  }
  v21 = *(const void **)(a1 + 3304);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(a1 + 3304) = 0;
  }
  *(_DWORD *)(a1 + 3568) = 0;
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 1856));
}

_DWORD *IOMFBGainEncoderFinishEncoding(uint64_t a1, unsigned int *a2)
{
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const void *v11;
  void *v12;
  const void *v13;
  void *v14;
  const void *v15;
  kern_return_t v16;
  uint32_t outputCnt;
  uint64_t output;
  __int128 inputStruct;
  __int128 v21;
  size_t __n[2];
  size_t v23[2];
  _BOOL8 v24;

  if (!IOMFBgainencoder_finish((uint64_t)a2))
    return 0;
  v4 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v5 = v4;
  if (v4)
  {
    output = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = -1431655766;
    *(_QWORD *)v4 = 0;
    atomic_store(1u, v4 + 1);
    *(_OWORD *)__n = 0u;
    *(_OWORD *)v23 = 0u;
    inputStruct = 0u;
    v21 = 0u;
    v24 = IOMFBgainencoder_row_1_coded((uint64_t)a2) != 0;
    IOMFBgainencoder_get_origin((uint64_t)a2, (_DWORD *)((unint64_t)&inputStruct | 0xC), &v21);
    IOMFBgainencoder_get_size((uint64_t)a2, (_DWORD *)&v21 + 1, (_DWORD *)&v21 + 2);
    BYTE11(inputStruct) = *(_BYTE *)(a1 + 3200);
    HIDWORD(v21) = IOMFBgainencoder_count(a2, 0);
    LODWORD(__n[1]) = IOMFBgainencoder_count(a2, 1);
    HIDWORD(v23[0]) = IOMFBgainencoder_count(a2, 2);
    HIDWORD(__n[0]) = IOMFBgainencoder_map_size((_DWORD **)a2, 0);
    LODWORD(v23[0]) = IOMFBgainencoder_map_size((_DWORD **)a2, 1);
    v6 = IOMFBgainencoder_map_size((_DWORD **)a2, 2);
    v7 = v6 + HIDWORD(__n[0]) + LODWORD(v23[0]) + 0x3FFF;
    v8 = v7 & 0xFFFFC000;
    HIDWORD(v23[1]) = v6;
    DWORD2(inputStruct) = v7 & 0xFFC000 | (BYTE11(inputStruct) << 24);
    v9 = malloc_type_aligned_alloc(0x4000uLL, v7 & 0xFFFFC000, 0xB9298D8uLL);
    *(_QWORD *)&inputStruct = v9;
    if (v9)
    {
      v10 = v9;
      LODWORD(__n[0]) = 0;
      v11 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 0);
      memcpy(v10, v11, HIDWORD(__n[0]));
      HIDWORD(__n[1]) = HIDWORD(__n[0]);
      v12 = (void *)(inputStruct + HIDWORD(__n[0]));
      v13 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 1);
      memcpy(v12, v13, LODWORD(v23[0]));
      LODWORD(v23[1]) = LODWORD(v23[0]) + HIDWORD(__n[1]);
      v14 = (void *)(inputStruct + (LODWORD(v23[0]) + HIDWORD(__n[1])));
      v15 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 2);
      memcpy(v14, v15, HIDWORD(v23[1]));
      if (HIDWORD(v23[1]) + LODWORD(v23[1]) < v8)
        bzero((void *)(inputStruct + (HIDWORD(v23[1]) + LODWORD(v23[1]))), v8 + ~HIDWORD(v23[1]) - LODWORD(v23[1]) + 1);
      outputCnt = 1;
      v16 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x56u, 0, 0, &inputStruct, 0x48uLL, &output, &outputCnt, 0, 0);
      free((void *)inputStruct);
      if (!v16)
      {
        *v5 = output;
        return v5;
      }
    }
    free(v5);
    return 0;
  }
  return v5;
}

uint64_t IOMFBgainencoder_map_size(_DWORD **a1, int a2)
{
  _DWORD **v2;

  switch(a2)
  {
    case 2:
      v2 = a1 + 5;
      return (**v2 + 1);
    case 1:
      v2 = a1 + 4;
      return (**v2 + 1);
    case 0:
      v2 = a1 + 3;
      return (**v2 + 1);
  }
  return 0;
}

uint64_t IOMFBgainencoder_map(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      return *(_QWORD *)a1;
    case 2:
      a1 += 16;
      return *(_QWORD *)a1;
    case 1:
      a1 += 8;
      return *(_QWORD *)a1;
  }
  return 0;
}

uint64_t IOMFBgainencoder_count(unsigned int *a1, int a2)
{
  if (a2 == 2)
    return a1[73];
  if (a2 == 1)
    return a1[72];
  if (a2)
    return 0;
  return a1[71];
}

uint64_t IOMFBgainencoder_row_1_coded(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 302);
}

uint64_t IOMFBgainencoder_get_size(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 264);
  *a3 = *(_DWORD *)(result + 268);
  return result;
}

uint64_t IOMFBgainencoder_get_origin(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 272);
  *a3 = *(_DWORD *)(result + 276);
  return result;
}

uint64_t IOMFBgainencoder_finish(uint64_t a1)
{
  uint64_t result;
  int *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  char v9;
  __int128 v10;
  uint64_t v11;

  while (*(_DWORD *)(a1 + 244) < *(_DWORD *)(a1 + 268))
  {
    result = finish_row((_DWORD *)a1);
    if (!(_DWORD)result)
      return result;
  }
  append_run_map(a1);
  bw_pad_to_n_byte(*(unsigned int **)(a1 + 24));
  bw_pad_to_n_byte(*(unsigned int **)(a1 + 32));
  if (map_version)
  {
    v3 = *(int **)(a1 + 40);
    v4 = *v3;
    if (*v3 < 0)
    {
      v4 = 0;
      v5 = -32;
    }
    else
    {
      v5 = -24 - v3[1];
    }
    v6 = *(_DWORD *)(a1 + 304);
    v7 = *(_DWORD *)(a1 + 308);
    v10 = *(_OWORD *)v3;
    v11 = *((_QWORD *)v3 + 2);
    LODWORD(v10) = v6;
    DWORD1(v10) = 8 - v7;
    BYTE12(v10) = 1 << (7 - v7);
    v8 = v6 + ((v7 + 31) >> 3);
    v9 = *(_BYTE *)(v11 + v8);
    bw_set((unsigned int *)&v10, 32, v5 - v7 + 8 * (v4 - v6));
    *(_BYTE *)(v11 + v8) |= v9;
  }
  return !*(_BYTE *)(*(_QWORD *)(a1 + 24) + 13)
      && !*(_BYTE *)(*(_QWORD *)(a1 + 40) + 13)
      && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) == 0;
}

unsigned int *bw_pad_to_n_byte(unsigned int *result)
{
  unsigned int *v1;
  int v2;
  int v3;
  BOOL v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;

  v1 = result;
  v2 = result[1];
  if ((v2 - 1) <= 6)
    result = bw_set(result, v2, 0);
  v3 = *v1 + 1;
  v4 = -v3 < 0;
  v5 = -v3 & 0xF;
  v6 = v3 & 0xF;
  if (!v4)
    v6 = -v5;
  if (v6)
  {
    v7 = 0;
    v8 = 16 - v6;
    do
    {
      result = bw_set(v1, 8, 0);
      ++v7;
    }
    while (v8 > v7);
  }
  return result;
}

unsigned int *append_run_map(uint64_t a1)
{
  int v2;
  unsigned int *result;

  v2 = *(_DWORD *)(a1 + 296);
  if (map_version)
    v2 |= *(_DWORD *)(a1 + 236) << 14;
  result = bw_set(*(unsigned int **)(a1 + 24), 16, v2);
  ++*(_DWORD *)(a1 + 284);
  return result;
}

uint64_t IOMFBGainEncoderEmitRun(uint64_t a1, int a2, uint64_t a3)
{
  if (IOMFBgainencoder_emit_run(a1, a2, a3))
    return 0;
  else
    return 3758097084;
}

uint64_t update_pos_map(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v1 = *(int *)(a1 + 248);
  if ((int)v1 > 19)
    return 0;
  v4 = a1 + 4 * v1;
  v5 = *(_DWORD *)(v4 + 72);
  v6 = *(_DWORD *)(a1 + 252);
  v7 = *(_DWORD *)(a1 + 256);
  v8 = *(_DWORD *)(a1 + 152 + 4 * v1);
  *(_DWORD *)(v4 + 72) = v7;
  *(_DWORD *)(a1 + 152 + 4 * (int)(*(_DWORD *)(a1 + 248))++) = *(_DWORD *)(a1 + 252);
  bw_set(*(unsigned int **)(a1 + 32), 1, *(_DWORD *)(a1 + 260));
  egk_set(a1, v7 - v5);
  if (v7 != v5)
    bw_set(*(unsigned int **)(a1 + 32), 1, v7 - v5 < 1);
  egk_set(a1, v6 - v8);
  if (v6 != v8)
    bw_set(*(unsigned int **)(a1 + 32), 1, v6 - v8 < 1);
  ++*(_DWORD *)(a1 + 288);
  *(_DWORD *)(a1 + 252) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  return 1;
}

uint64_t IOMFBgainencoder_emit_run(uint64_t a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  BOOL v17;
  int v18;
  int i;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned __int16 v24;

  v3 = *(_DWORD *)(a1 + 280);
  if ((v3 + a2) > *(_DWORD *)(a1 + 264))
    return 0;
  if (!v3)
  {
    *(_QWORD *)(a1 + 248) = 0;
    *(_DWORD *)(a1 + 256) = 0;
    *(_DWORD *)(a1 + 240) = 0;
  }
  v7 = 0;
  v23 = -1431655766;
  v24 = -21846;
  do
  {
    *((_WORD *)&v23 + v7) = vcvts_n_s32_f32(*(float *)(a3 + 4 * v7), 8uLL);
    ++v7;
  }
  while (v7 != 3);
  v8 = (unsigned __int16)v23;
  v9 = HIWORD(v23);
  v10 = v24;
  v11 = (HIWORD(v23) << 9) | ((unsigned __int16)v23 << 18) | v24;
  if (v11)
    v12 = 3;
  else
    v12 = 1;
  if (v11 == 67240192)
    v13 = 2;
  else
    v13 = v12;
  if (*(_DWORD *)(a1 + 240))
  {
    if (!v3)
      goto LABEL_25;
LABEL_18:
    if (v11)
      v15 = v11 == 67240192;
    else
      v15 = 1;
    if (!v15 || v13 == *(_DWORD *)(a1 + 232))
      goto LABEL_39;
    goto LABEL_25;
  }
  update_run_map((unsigned int *)a1, 1u);
  *(_DWORD *)(a1 + 240) = 1;
  v14 = *(_DWORD *)(a1 + 280);
  if (v14)
  {
    *(_DWORD *)(a1 + 256) += v14;
    goto LABEL_18;
  }
LABEL_25:
  if (*(_DWORD *)(a1 + 252)
    || (v11 != 67240192 ? (v17 = v11 == 0) : (v17 = 1), !v17 ? (v18 = 0) : (v18 = 1), *(_DWORD *)(a1 + 256) && v18))
  {
    result = update_pos_map(a1);
    if (!(_DWORD)result)
      return result;
  }
  if (v13 == 3)
  {
    *(_DWORD *)(a1 + 232) = 3;
    if (*(_DWORD *)(a1 + 240) != 1)
      goto LABEL_47;
    goto LABEL_41;
  }
  *(_DWORD *)(a1 + 260) = v13 != 1;
LABEL_39:
  *(_DWORD *)(a1 + 232) = v13;
  if (*(_DWORD *)(a1 + 240) != 1)
    goto LABEL_47;
  if (v13 != 3)
  {
    *(_DWORD *)(a1 + 256) += a2;
    goto LABEL_47;
  }
LABEL_41:
  for (i = a2; i; --i)
  {
    append_gain_map(a1, v8, *(_QWORD *)(a1 + 48));
    append_gain_map(a1, v9, *(_QWORD *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 300))
      append_gain_map(a1, v10, *(_QWORD *)(a1 + 64));
    ++*(_DWORD *)(a1 + 252);
  }
LABEL_47:
  v20 = *(_DWORD *)(a1 + 280) + a2;
  *(_DWORD *)(a1 + 280) = v20;
  if (v20 != *(_DWORD *)(a1 + 264))
    return 1;
  if (!*(_DWORD *)(a1 + 240))
  {
    update_run_map((unsigned int *)a1, 0);
    return 1;
  }
  if (!*(_DWORD *)(a1 + 252) && !*(_DWORD *)(a1 + 256) || (result = update_pos_map(a1), (_DWORD)result))
  {
    v21 = *(int *)(a1 + 248);
    if ((int)v21 <= 19)
    {
      do
      {
        v22 = a1 + 4 * v21;
        *(_DWORD *)(v22 + 152) = 0;
        *(_DWORD *)(v22 + 72) = 0;
        ++v21;
      }
      while ((_DWORD)v21 != 20);
    }
    return 1;
  }
  return result;
}

unsigned int *append_gain_map(uint64_t a1, int a2, uint64_t a3)
{
  unsigned int *v4;
  unsigned int *result;
  unsigned int *v8;
  int v9;
  int v10;

  v4 = *(unsigned int **)a3;
  if (*(_DWORD *)(a3 + 8) == a2)
  {
    result = bw_set(v4, 1, 0);
  }
  else
  {
    bw_set(v4, 1, 1);
    v8 = *(unsigned int **)a3;
    v9 = 1;
    if (a2)
    {
      bw_set(v8, 1, 1);
      v8 = *(unsigned int **)a3;
      v10 = a2 - 1;
      v9 = 8;
    }
    else
    {
      v10 = 0;
    }
    result = bw_set(v8, v9, v10);
    *(_DWORD *)(a3 + 8) = a2;
  }
  ++*(_DWORD *)(a1 + 292);
  return result;
}

unsigned int *bw_set(unsigned int *result, int a2, int a3)
{
  BOOL v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;

  if (*((_BYTE *)result + 13))
    v3 = 1;
  else
    v3 = a2 == 0;
  if (!v3)
  {
    v4 = 1 << (a2 - 1);
    v5 = result[1];
    do
    {
      if (v5)
      {
        v6 = *((unsigned __int8 *)result + 12);
      }
      else
      {
        v7 = *result;
        v8 = *result + 1;
        *result = v8;
        if (v7 < -1 || v8 >= result[2])
        {
          *((_BYTE *)result + 13) = 1;
          return result;
        }
        *(_BYTE *)(*((_QWORD *)result + 2) + v8) = 0;
        v5 = 8;
        result[1] = 8;
        v6 = 128;
        *((_BYTE *)result + 12) = 0x80;
      }
      if ((v4 & a3) != 0)
      {
        *(_BYTE *)(*((_QWORD *)result + 2) + (int)*result) |= v6;
        v5 = result[1];
        v6 = *((unsigned __int8 *)result + 12);
      }
      result[1] = --v5;
      *((_BYTE *)result + 12) = v6 >> 1;
      v4 >>= 1;
      --a2;
    }
    while (a2);
  }
  return result;
}

unsigned int *egk_set(uint64_t a1, int a2)
{
  int v3;
  int v4;
  unsigned int v5;

  if (a2 >= 0)
    v3 = a2;
  else
    v3 = -a2;
  v4 = v3 + 1;
  v5 = __clz(v3 + 1);
  bw_set(*(unsigned int **)(a1 + 32), 32 - v5, 2 * ~(-1 << -(char)v5));
  return bw_set(*(unsigned int **)(a1 + 32), v5 ^ 0x1F, v4);
}

unsigned int *update_run_map(unsigned int *result, unsigned int a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v5;
  unsigned int *v6;

  v2 = result;
  v3 = result[59];
  if (v3 == a2)
  {
    ++result[74];
  }
  else
  {
    if (v3 == 255)
      *((_BYTE *)result + 302) = a2 == 1;
    else
      result = append_run_map((uint64_t)result);
    v2[74] = 1;
    v2[59] = a2;
    if (a2 == 1)
    {
      v5 = 0;
      *(_OWORD *)(v2 + 34) = 0u;
      *(_OWORD *)(v2 + 30) = 0u;
      *(_OWORD *)(v2 + 26) = 0u;
      *(_OWORD *)(v2 + 22) = 0u;
      *(_OWORD *)(v2 + 18) = 0u;
      do
      {
        v6 = &v2[v5 + 38];
        *(_QWORD *)v6 = 0;
        *((_QWORD *)v6 + 1) = 0;
        v5 += 4;
      }
      while (v5 != 20);
    }
  }
  return result;
}

uint64_t IOMobileFramebufferSetMatrix(uint64_t a1, unsigned int a2, void *inputStruct)
{
  uint64_t result;
  uint64_t input;

  input = a2;
  result = 3758097090;
  if (a1)
  {
    if (inputStruct)
      return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x37u, &input, 1u, inputStruct, 0x48uLL, 0, 0, 0, 0);
  }
  return result;
}

uint64_t kern_SetBrightnessCorrection(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 1928);
  input[0] = a2;
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x32u, input, 2u, 0, 0);
}

uint64_t kern_SwapSetBrightness(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;
  CFTypeRef cf;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3249))
  {
    cf = 0;
    s_bc_7(*(_QWORD *)(a1 + 3304), &cf, a2);
    if (cf)
      CFRelease(cf);
    *(_BYTE *)(a1 + 876) = 1;
    *(double *)(a1 + 884) = a2;
  }
  else
  {
    syslog(5, "SwapSetBrightness: Brightness control is not enabled\n");
  }
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetBrightnessLimit(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3249))
  {
    *(_BYTE *)(a1 + 880) = 1;
    *(double *)(a1 + 900) = a2;
  }
  else
  {
    syslog(5, "SwapSetBrightnessLimit: Brightness control is not enabled\n");
  }
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetAmbientLux(uint64_t a1, float a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  *(_BYTE *)(a1 + 1039) = 1;
  *(float *)(a1 + 1043) = a2;
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetCEStrength(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;
  float v5;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  *(_BYTE *)(a1 + 1047) = 1;
  v5 = a2;
  *(float *)(a1 + 1051) = v5;
  pthread_mutex_unlock(v4);
  return 0;
}

void IOMFBgainencoder_free(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *a1;
  if (v2)
    free(v2);
  v3 = a1[1];
  if (v3)
    free(v3);
  v4 = a1[2];
  if (v4)
    free(v4);
  v5 = a1[3];
  if (v5)
    free(v5);
  v6 = a1[4];
  if (v6)
    free(v6);
  v7 = a1[5];
  if (v7)
    free(v7);
  v8 = a1[6];
  if (v8)
    free(v8);
  v9 = a1[7];
  if (v9)
    free(v9);
  v10 = a1[8];
  if (v10)
    free(v10);
  free(a1);
}

CFArrayRef IOMobileFramebufferCreateDisplayList(const __CFAllocator *a1)
{
  iomfb_populate_all_display_infos();
  if (s_display_infos_len)
    return CFArrayCreate(a1, (const void **)&s_displays, s_display_infos_len, 0);
  else
    return 0;
}

uint64_t IOMobileFramebufferOpenByName(const __CFString *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t *v5;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  const CFDictionaryKeyCallBacks *v13;
  const CFDictionaryValueCallBacks *v14;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v16;
  __CFDictionary *v17;
  unsigned int display;
  uint64_t v19;
  mach_port_t v20;
  uint64_t v21;
  uint64_t input[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  iomfb_populate_all_display_infos();
  if (!a1 || !a2)
  {
    syslog(3, " %s:  Bad Argument\n", "IOMobileFramebufferOpenByName");
    return 3758097090;
  }
  v4 = 0;
  *a2 = 0;
  v5 = &s_display_infos;
  while (1)
  {
    if (!*v5)
    {
      syslog(3, "\n%s: Name is null idx=%d", "IOMobileFramebufferOpenByName", v4);
LABEL_10:
      v7 = 0;
LABEL_11:
      v8 = -536870212;
      goto LABEL_31;
    }
    if (CFStringCompare(a1, (CFStringRef)*v5, 0) == kCFCompareEqualTo)
      break;
    ++v4;
    v5 += 20;
    if (v4 == 16)
      goto LABEL_10;
  }
  if (*((_DWORD *)v5 + 2) != 2)
  {
    display = iomfb_get_display((uint64_t)v5, a2);
    if (!display)
    {
      v11 = *a2;
LABEL_23:
      v19 = *((unsigned int *)v5 + 2);
      *(_DWORD *)(v11 + 1928) = v19;
      if (s_thread_notified == 1)
      {
        input[0] = v19;
        v20 = *(_DWORD *)(v11 + 20);
      }
      else
      {
        sleep(3u);
        if (s_thread_notified != 1)
        {
          v8 = 0;
          goto LABEL_30;
        }
        v21 = *a2;
        input[0] = *((unsigned int *)v5 + 2);
        v20 = *(_DWORD *)(v21 + 20);
      }
      v7 = 1;
      IOConnectCallScalarMethod(v20, 0x58u, input, 1u, 0, 0);
      v8 = 0;
      goto LABEL_31;
    }
    v8 = display;
    goto LABEL_30;
  }
  if (!s_virt_context_len)
  {
    syslog(3, "IOMFB: no virtual display context installed\n");
    v7 = 1;
    goto LABEL_11;
  }
  v9 = *((unsigned int *)v5 + 4);
  v10 = _ioMobileFramebufferAlloc();
  if (!v10)
  {
    syslog(3, "IOMFB: framebuffer allocation failed\n");
    v8 = -536870211;
    goto LABEL_30;
  }
  v11 = v10;
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  *(_QWORD *)(v10 + 2728) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  *(_QWORD *)(v11 + 2736) = CFDictionaryCreateMutable(v12, 0, v13, v14);
  Mutable = CFDictionaryCreateMutable(v12, 0, v13, v14);
  *(_QWORD *)(v11 + 2744) = Mutable;
  v8 = -536870211;
  if (!*(_QWORD *)(v11 + 2728))
  {
LABEL_30:
    v7 = 1;
    goto LABEL_31;
  }
  v16 = Mutable;
  v17 = *(__CFDictionary **)(v11 + 2736);
  v7 = 1;
  if (v17 && v16)
  {
    setIntValue(v17, CFSTR("MaxSrcRectWidth"), 1920);
    setIntValue(*(__CFDictionary **)(v11 + 2736), CFSTR("MaxSrcRectTotal"), 2073600);
    setIntValue(*(__CFDictionary **)(v11 + 2736), CFSTR("MaxSrcBufferWidth"), 1919);
    setIntValue(*(__CFDictionary **)(v11 + 2736), CFSTR("MaxSrcBufferHeight"), 1079);
    setIntValue(*(__CFDictionary **)(v11 + 2744), CFSTR("RGBLayer_MinScaleFraction"), 1);
    setIntValue(*(__CFDictionary **)(v11 + 2744), CFSTR("RGBLayer_MaxScale"), 1);
    setIntValue(*(__CFDictionary **)(v11 + 2744), CFSTR("YUVLayer_MinScaleFraction"), 1);
    setIntValue(*(__CFDictionary **)(v11 + 2744), CFSTR("YUVLayer_MaxScale"), 1);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 2728), CFSTR("IOMFBMaxSrcPixels"), *(const void **)(v11 + 2736));
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 2728), CFSTR("IOMFBScalingLimits"), *(const void **)(v11 + 2744));
    *(_OWORD *)(v11 + 3168) = 0u;
    *(_OWORD *)(v11 + 3152) = 0u;
    *(_OWORD *)(v11 + 3136) = 0u;
    *(_OWORD *)(v11 + 3120) = 0u;
    *(_OWORD *)(v11 + 3104) = 0u;
    *(_OWORD *)(v11 + 3088) = 0u;
    *(_OWORD *)(v11 + 3072) = 0u;
    *(_OWORD *)(v11 + 3056) = 0u;
    *(_OWORD *)(v11 + 3040) = 0u;
    *(_OWORD *)(v11 + 3024) = 0u;
    *(_OWORD *)(v11 + 3008) = 0u;
    *(_OWORD *)(v11 + 2992) = 0u;
    *(_OWORD *)(v11 + 2976) = 0u;
    *(_OWORD *)(v11 + 2960) = 0u;
    *(_OWORD *)(v11 + 2944) = 0u;
    *(_OWORD *)(v11 + 2928) = 0u;
    *(_OWORD *)(v11 + 2912) = 0u;
    *(_OWORD *)(v11 + 2896) = 0u;
    *(_OWORD *)(v11 + 2880) = 0u;
    *(_OWORD *)(v11 + 2864) = 0u;
    *(_OWORD *)(v11 + 2848) = 0u;
    *(_OWORD *)(v11 + 2832) = 0u;
    *(_OWORD *)(v11 + 2816) = 0u;
    *(_OWORD *)(v11 + 2800) = 0u;
    *(_QWORD *)(v11 + 2768) = &s_virt_funcs;
    *(_QWORD *)(v11 + 2760) = s_virt_contexts[v9];
    *(_QWORD *)(v11 + 2432) = virt_GetSupportedDigitalOutModes;
    *(_QWORD *)(v11 + 2408) = virt_SetDigitalOutMode;
    *(_QWORD *)(v11 + 1976) = virt_GetLayerDefaultSurface;
    *(_QWORD *)(v11 + 1992) = virt_GetDisplaySize;
    *(_QWORD *)(v11 + 2312) = kern_RequestPowerChange;
    *(_QWORD *)(v11 + 2000) = kern_GetID;
    *(_QWORD *)(v11 + 2008) = virt_CopyProperty;
    *(_QWORD *)(v11 + 2016) = virt_SwapSetLayer;
    *(_QWORD *)(v11 + 2024) = virt_SwapSetEventWait;
    *(_QWORD *)(v11 + 2032) = virt_SwapSetEventSignalOnGlass;
    *(_QWORD *)(v11 + 2040) = virt_SwapSetEventSignal;
    *(_QWORD *)(v11 + 2056) = virt_SwapDebugInfo;
    *(_QWORD *)(v11 + 2072) = iomfb_SwapSetTimestamp;
    *(_QWORD *)(v11 + 2088) = iomfb_SwapSetTimestamps;
    *(_QWORD *)(v11 + 2176) = virt_SwapBegin;
    *(_QWORD *)(v11 + 2184) = virt_SwapEnd;
    *(_QWORD *)(v11 + 2208) = virt_SwapSignal;
    *(_QWORD *)(v11 + 2216) = virt_SwapWait;
    *(_QWORD *)(v11 + 2224) = virt_SwapWaitWithTimeout;
    *(_QWORD *)(v11 + 2232) = virt_SwapCancel;
    *(_QWORD *)(v11 + 2528) = virt_GetRunLoopSource;
    *(_QWORD *)(v11 + 2272) = virt_EnableNotifications;
    *(_QWORD *)(v11 + 2280) = virt_DisableNotifications;
    *(_QWORD *)(v11 + 2448) = virt_GetHDCPDownstreamState;
    *(_QWORD *)(v11 + 2440) = iomfb_GetHDCPAuthenticationProtocol;
    *(_QWORD *)(v11 + 2456) = virt_HDCPSendRequest;
    *(_QWORD *)(v11 + 2464) = virt_HDCPGetReply;
    *(_QWORD *)(v11 + 2472) = virt_GetProtectionOptions;
    *(_QWORD *)(v11 + 2352) = virt_EnableStatistics;
    *(_QWORD *)(v11 + 2648) = virt_CreateStatistics;
    *(_QWORD *)(v11 + 2712) = virt_gest_timestamp;
    *(_QWORD *)(v11 + 2720) = virt_gest_timestamp;
    *(_DWORD *)(v11 + 16) = 0;
    *a2 = v11;
    goto LABEL_23;
  }
LABEL_31:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  *(_OWORD *)input = 0u;
  v23 = 0u;
  CFStringGetCString(a1, (char *)input, 128, 0x8000100u);
  syslog(3, " %s: Framebuffer found=%d return %d Name = %s\n", "IOMobileFramebufferOpenByName", v7, v8, (const char *)input);
  if (v7)
    return v8;
  else
    return 3758097090;
}

void iomfb_populate_all_display_infos()
{
  int v0;
  int v1;

  if (iomfb_populate_all_display_infos_onceToken != -1)
    dispatch_once(&iomfb_populate_all_display_infos_onceToken, &__block_literal_global);
  v0 = s_number_display_pipes;
  v1 = s_number_display_instances;
  if (s_number_display_pipes < s_number_display_instances)
  {
    syslog(3, "%s: Reference FB count = %d < Enumerated FB count = %d - shouldn't happen - error\n", "iomfb_populate_all_display_infos", s_number_display_pipes, s_number_display_instances);
    v0 = s_number_display_pipes;
    v1 = s_number_display_instances;
  }
  if (v0 == v1)
    syslog(3, "%s: All Display Instances enumerated successfully - FB Count = %d\n");
  else
    syslog(3, "%s: All display instances are NOT enumerated: Disp_len %d, Ref_FB = %d, Act_FB = %d\n");
}

uint64_t iomfb_get_display(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t (*v6)(void);
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFTypeID v9;

  v4 = IOMobileFramebufferOpen(*(_DWORD *)(a1 + 20), *MEMORY[0x1E0C83DA0], 0, a2);
  if (!(_DWORD)v4 && !*(_BYTE *)(a1 + 152))
  {
    if (*a2)
    {
      v6 = *(uint64_t (**)(void))(*a2 + 2008);
      if (v6)
      {
        v7 = (const __CFBoolean *)v6();
        if (v7)
        {
          v8 = v7;
          v9 = CFGetTypeID(v7);
          if (v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8))
            *(_DWORD *)(*a2 + 1848) = 9;
          CFRelease(v8);
        }
      }
    }
  }
  return v4;
}

uint64_t IOMobileFramebufferOpen(io_service_t a1, task_port_t a2, uint32_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFNumber *CFProperty;
  const __CFNumber *v12;
  int v14;
  int v15;
  int valuePtr;

  if (a4)
  {
    v8 = _ioMobileFramebufferAlloc();
    *a4 = v8;
    if (v8)
    {
      *(_DWORD *)(v8 + 16) = a1;
      v9 = IOServiceOpen(a1, a2, a3, (io_connect_t *)(v8 + 20));
      v10 = *a4;
      if ((_DWORD)v9)
      {
        CFRelease((CFTypeRef)v10);
        *a4 = 0;
        syslog(3, " %s:  failed IOServiceOpen. return %d \n");
      }
      else
      {
        if (!*(_DWORD *)(v10 + 1420) || !*(_DWORD *)(v10 + 1424))
        {
          v14 = 0;
          v15 = 0;
          getEDTProperty(v10, CFSTR("canvas-width"), (UInt8 *)&v15);
          getEDTProperty(*a4, CFSTR("canvas-height"), (UInt8 *)&v14);
          v10 = *a4;
          if (v15)
            *(_DWORD *)(v10 + 1420) = v15;
          if (v14)
            *(_DWORD *)(v10 + 1424) = v14;
        }
        if (*(_DWORD *)(v10 + 3200) == -1)
        {
          CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(v10 + 16), CFSTR("GainMapVersion"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
          v12 = CFProperty;
          if (!CFProperty)
            goto LABEL_19;
          valuePtr = -1431655766;
          if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
            valuePtr = 0;
          CFRelease(v12);
          LODWORD(v12) = valuePtr;
          if (valuePtr == -1)
            LODWORD(v12) = 0;
          else
LABEL_19:
            IOMFBgainencoder_set_map_version(v12);
          v10 = *a4;
          *(_DWORD *)(*a4 + 3200) = (_DWORD)v12;
        }
        if (*(_BYTE *)(v10 + 3248))
        {
          *(_QWORD *)(v10 + 2056) = benchmark_SwapDebugInfo;
          *(_QWORD *)(*a4 + 2016) = benchmark_SwapSetLayer;
          *(_QWORD *)(*a4 + 2024) = benchmark_SwapSetEventWait;
          *(_QWORD *)(*a4 + 2032) = benchmark_SwapSetEventSignalOnGlass;
          *(_QWORD *)(*a4 + 2040) = benchmark_SwapSetEventSignal;
          *(_QWORD *)(*a4 + 2064) = benchmark_SwapSubtitleRegion;
          *(_QWORD *)(*a4 + 2096) = benchmark_SwapSetParams;
          *(_QWORD *)(*a4 + 2104) = benchmark_SwapSetBrightness;
          *(_QWORD *)(*a4 + 2112) = benchmark_SwapSetIndicatorBrightness;
          *(_QWORD *)(*a4 + 2120) = benchmark_SwapSetSecureAnimation;
          *(_QWORD *)(*a4 + 2128) = benchmark_SwapSetBrightnessLimit;
          *(_QWORD *)(*a4 + 2136) = benchmark_SwapSetDisplayEdr;
          *(_QWORD *)(*a4 + 2176) = benchmark_SwapBegin;
          *(_QWORD *)(*a4 + 2184) = benchmark_SwapEnd;
          *(_QWORD *)(*a4 + 2192) = benchmark_SwapSetColorMatrix;
          *(_QWORD *)(*a4 + 2208) = benchmark_SwapSignal;
          *(_QWORD *)(*a4 + 2216) = benchmark_SwapWait;
          *(_QWORD *)(*a4 + 2224) = benchmark_SwapWaitWithTimeout;
          *(_QWORD *)(*a4 + 2232) = benchmark_SwapCancel;
          *(_QWORD *)(*a4 + 2240) = benchmark_SwapCancelAll;
          *(_QWORD *)(*a4 + 2256) = benchmark_SetIdleBuffer;
          *(_QWORD *)(*a4 + 2264) = benchmark_SetIdleBufferEvent;
          *(_QWORD *)(*a4 + 2272) = benchmark_EnableNotifications;
          *(_QWORD *)(*a4 + 2280) = benchmark_DisableNotifications;
          *(_QWORD *)(*a4 + 2656) = benchmark_ChangeFrameInfo;
          *(_QWORD *)(*a4 + 2664) = benchmark_SupportedFrameInfo;
        }
        else
        {
          *(_QWORD *)(v10 + 2056) = kern_SwapDebugInfo;
          *(_QWORD *)(*a4 + 2016) = kern_SwapSetLayer;
          *(_QWORD *)(*a4 + 2024) = kern_SwapSetEventWait;
          *(_QWORD *)(*a4 + 2032) = kern_SwapSetEventSignalOnGlass;
          *(_QWORD *)(*a4 + 2040) = kern_SwapSetEventSignal;
          *(_QWORD *)(*a4 + 2064) = kern_SwapSubtitleRegion;
          *(_QWORD *)(*a4 + 2096) = kern_SwapSetParams;
          *(_QWORD *)(*a4 + 2104) = kern_SwapSetBrightness;
          *(_QWORD *)(*a4 + 2112) = kern_SwapSetIndicatorBrightness;
          *(_QWORD *)(*a4 + 2120) = kern_SwapSetSecureAnimation;
          *(_QWORD *)(*a4 + 2128) = kern_SwapSetBrightnessLimit;
          *(_QWORD *)(*a4 + 2136) = kern_SwapSetDisplayEdr;
          *(_QWORD *)(*a4 + 2144) = kern_SwapSetDisplayEdrHeadroom;
          *(_QWORD *)(*a4 + 2152) = kern_SwapSetUserLuminanceAdjustment;
          *(_QWORD *)(*a4 + 2160) = kern_SwapSetAmbientLux;
          *(_QWORD *)(*a4 + 2168) = kern_SwapSetCEStrength;
          *(_QWORD *)(*a4 + 2176) = kern_SwapBegin;
          *(_QWORD *)(*a4 + 2184) = kern_SwapEnd;
          *(_QWORD *)(*a4 + 2192) = kern_SwapSetColorMatrix;
          *(_QWORD *)(*a4 + 2208) = kern_SwapSignal;
          *(_QWORD *)(*a4 + 2216) = kern_SwapWait;
          *(_QWORD *)(*a4 + 2224) = kern_SwapWaitWithTimeout;
          *(_QWORD *)(*a4 + 2232) = kern_SwapCancel;
          *(_QWORD *)(*a4 + 2240) = kern_SwapCancelAll;
          *(_QWORD *)(*a4 + 2256) = kern_SetIdleBuffer;
          *(_QWORD *)(*a4 + 2264) = kern_SetIdleBufferEvent;
          *(_QWORD *)(*a4 + 2272) = kern_EnableNotifications;
          *(_QWORD *)(*a4 + 2280) = kern_DisableNotifications;
          *(_QWORD *)(*a4 + 2656) = kern_ChangeFrameInfo;
          *(_QWORD *)(*a4 + 2664) = kern_SupportedFrameInfo;
          *(_QWORD *)(*a4 + 2200) = kern_SetColorRemapMode;
        }
        *(_QWORD *)(*a4 + 2048) = kern_SwapSetBlit;
        *(_QWORD *)(*a4 + 2072) = iomfb_SwapSetTimestamp;
        *(_QWORD *)(*a4 + 2080) = iomfb_AnnounceNextSwapTimestamp;
        *(_QWORD *)(*a4 + 2088) = iomfb_SwapSetTimestamps;
        *(_QWORD *)(*a4 + 1976) = kern_GetLayerDefaultSurface;
        *(_QWORD *)(*a4 + 1984) = kern_CopyLayerDisplayedSurface;
        *(_QWORD *)(*a4 + 1992) = kern_GetDisplaySize;
        *(_QWORD *)(*a4 + 2000) = kern_GetID;
        *(_QWORD *)(*a4 + 2008) = kern_CopyProperty;
        *(_QWORD *)(*a4 + 2248) = kern_SurfaceIsReplaceable;
        *(_QWORD *)(*a4 + 2528) = kern_GetRunLoopSource;
        *(_QWORD *)(*a4 + 2288) = kern_SetTVOutMode;
        *(_QWORD *)(*a4 + 2296) = kern_SetTVOutSignalType;
        *(_QWORD *)(*a4 + 2304) = kern_SetWSSInfo;
        *(_QWORD *)(*a4 + 2312) = kern_RequestPowerChange;
        *(_QWORD *)(*a4 + 2320) = kern_SetWhiteOnBlackMode;
        *(_QWORD *)(*a4 + 2328) = kern_SetColorRemapMode;
        *(_QWORD *)(*a4 + 2336) = kern_GetColorRemapMode;
        *(_QWORD *)(*a4 + 2344) = kern_SetBrightnessCorrection;
        *(_QWORD *)(*a4 + 2352) = kern_EnableStatistics;
        *(_QWORD *)(*a4 + 2360) = kern_SetDebugFlags;
        *(_QWORD *)(*a4 + 2368) = kern_SetFlags;
        *(_QWORD *)(*a4 + 2376) = kern_SetGammaTable;
        *(_QWORD *)(*a4 + 2384) = kern_SetContrast;
        *(_QWORD *)(*a4 + 2392) = kern_GetGammaTable;
        *(_QWORD *)(*a4 + 2400) = kern_SetDisplayDevice;
        *(_QWORD *)(*a4 + 2408) = kern_SetDigitalOutMode;
        *(_QWORD *)(*a4 + 2416) = kern_GetDigitalOutState;
        *(_QWORD *)(*a4 + 2432) = kern_GetSupportedDigitalOutModes;
        *(_QWORD *)(*a4 + 2448) = kern_GetHDCPDownstreamState;
        *(_QWORD *)(*a4 + 2440) = iomfb_GetHDCPAuthenticationProtocol;
        *(_QWORD *)(*a4 + 2456) = kern_HDCPSendRequest;
        *(_QWORD *)(*a4 + 2464) = kern_HDCPGetReply;
        *(_QWORD *)(*a4 + 2480) = kern_printDisplayRegs;
        *(_QWORD *)(*a4 + 2488) = kern_GetDotPitch;
        *(_QWORD *)(*a4 + 2496) = kern_GetDotPitchFloat;
        *(_QWORD *)(*a4 + 2504) = kern_GetDisplayArea;
        *(_QWORD *)(*a4 + 2512) = kern_EnableDisableDithering;
        *(_QWORD *)(*a4 + 2520) = kern_SetUnderrunColor;
        *(_QWORD *)(*a4 + 2536) = kern_GetCRCNotifyMessageCount;
        *(_QWORD *)(*a4 + 2544) = kern_EnableDisableVideoPowerSavings;
        *(_QWORD *)(*a4 + 2552) = kern_SetVideoDACGain;
        *(_QWORD *)(*a4 + 2560) = kern_SetLine21Data;
        *(_QWORD *)(*a4 + 2568) = kern_GetDebugTraces;
        *(_QWORD *)(*a4 + 2576) = kern_EnableDebugTracing;
        *(_QWORD *)(*a4 + 2584) = kern_EnableVBLTraces;
        *(_QWORD *)(*a4 + 2592) = kern_PrintDebugTraces;
        *(_QWORD *)(*a4 + 2600) = kern_SetLogLevel;
        *(_QWORD *)(*a4 + 2608) = kern_SPLCSetBrightness;
        *(_QWORD *)(*a4 + 2616) = kern_SPLCGetBrightness;
        *(_QWORD *)(*a4 + 2624) = kern_SetBlock;
        *(_QWORD *)(*a4 + 2632) = kern_GetBlock;
        *(_QWORD *)(*a4 + 2640) = kern_SetParameter;
        *(_QWORD *)(*a4 + 2648) = kern_CreateStatistics;
        *(_QWORD *)(*a4 + 2672) = kern_FactoryPortal;
        *(_QWORD *)(*a4 + 2680) = kern_GetCurrentAbsoluteTime;
        *(_QWORD *)(*a4 + 2688) = kern_SwapWARSettings;
        *(_QWORD *)(*a4 + 2696) = kern_GetLinkQuality;
        *(_QWORD *)(*a4 + 2472) = kern_GetProtectionOptions;
        *(_QWORD *)(*a4 + 2704) = kern_GetBufBlock;
        *(_QWORD *)(*a4 + 2424) = kern_SetClamshellState;
        *(_QWORD *)(*a4 + 2712) = kern_ingest_timestamp;
        *(_QWORD *)(*a4 + 2720) = kern_egest_timestamp;
        syslog(3, " %s:  success, return %d \n", "IOMobileFramebufferOpen", 0);
        return 0;
      }
    }
    else
    {
      v9 = 3758097085;
      syslog(3, " %s:  failed _ioMobileFramebufferAlloc return %d \n");
    }
  }
  else
  {
    v9 = 3758097090;
    syslog(3, " %s:  failed, bad argument return %d \n", "IOMobileFramebufferOpen", -536870206);
  }
  return v9;
}

void getEDTProperty(uint64_t a1, const __CFString *a2, UInt8 *a3)
{
  const __CFData *v5;
  const __CFData *v6;
  CFRange v7;
  io_registry_entry_t parent;

  parent = -1431655766;
  IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent);
  v5 = (const __CFData *)IORegistryEntrySearchCFProperty(parent, "IOService", a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (v5)
  {
    v6 = v5;
    if (CFDataGetLength(v5) <= 4)
      v7.length = CFDataGetLength(v6);
    else
      v7.length = 4;
    v7.location = 0;
    CFDataGetBytes(v6, v7, a3);
    CFRelease(v6);
  }
}

uint64_t _ioMobileFramebufferAlloc()
{
  uint64_t Instance;
  int AppIntegerValue;
  int v2;
  int AppBooleanValue;
  BOOL v4;
  char v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  Boolean keyExistsAndHasValidFormat;

  if (!kIOMobileFramebufferID)
    pthread_once(&IOMobileFramebufferGetTypeID_once, (void (*)(void))ioMobileFramebufferClassInitialize);
  keyExistsAndHasValidFormat = -86;
  Instance = _CFRuntimeCreateInstance();
  *(_DWORD *)(Instance + 20) = 0;
  *(_DWORD *)(Instance + 2752) = 1;
  *(_QWORD *)(Instance + 1416) = 0;
  *(_DWORD *)(Instance + 1424) = 0;
  *(_OWORD *)(Instance + 1312) = 0u;
  *(_OWORD *)(Instance + 1328) = 0u;
  *(_OWORD *)(Instance + 1344) = 0u;
  *(_BYTE *)(Instance + 1360) = 0;
  *(_OWORD *)(Instance + 1368) = 0u;
  *(_OWORD *)(Instance + 1384) = 0u;
  *(_OWORD *)(Instance + 1432) = 0u;
  *(_OWORD *)(Instance + 1448) = 0u;
  *(_OWORD *)(Instance + 1464) = 0u;
  *(_OWORD *)(Instance + 1480) = 0u;
  *(_OWORD *)(Instance + 1496) = 0u;
  *(_OWORD *)(Instance + 1512) = 0u;
  *(_OWORD *)(Instance + 1528) = 0u;
  *(_OWORD *)(Instance + 1544) = 0u;
  *(_OWORD *)(Instance + 1560) = 0u;
  *(_OWORD *)(Instance + 1576) = 0u;
  *(_OWORD *)(Instance + 1592) = 0u;
  *(_OWORD *)(Instance + 1608) = 0u;
  *(_OWORD *)(Instance + 1624) = 0u;
  *(_OWORD *)(Instance + 1640) = 0u;
  *(_OWORD *)(Instance + 1656) = 0u;
  *(_OWORD *)(Instance + 1672) = 0u;
  *(_OWORD *)(Instance + 1688) = 0u;
  *(_OWORD *)(Instance + 1704) = 0u;
  *(_OWORD *)(Instance + 1720) = 0u;
  *(_OWORD *)(Instance + 1736) = 0u;
  *(_OWORD *)(Instance + 1752) = 0u;
  *(_OWORD *)(Instance + 1768) = 0u;
  *(_OWORD *)(Instance + 1784) = 0u;
  *(_OWORD *)(Instance + 1800) = 0u;
  *(_DWORD *)(Instance + 1848) = 1;
  *(_OWORD *)(Instance + 1920) = xmmword_1B55162C0;
  *(_QWORD *)(Instance + 3192) = 0;
  *(_OWORD *)(Instance + 1936) = 0u;
  *(_DWORD *)(Instance + 1952) = 0;
  *(_OWORD *)(Instance + 1960) = 0u;
  *(_OWORD *)(Instance + 3296) = 0u;
  *(_OWORD *)(Instance + 3312) = 0u;
  *(_OWORD *)(Instance + 3328) = 0u;
  *(_DWORD *)(Instance + 3568) = 0;
  *(_DWORD *)(Instance + 3200) = -1;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 1856), 0);
  *(_BYTE *)(Instance + 1824) = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("canvas_width"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(_DWORD *)(Instance + 1420) = AppIntegerValue;
  v2 = CFPreferencesGetAppIntegerValue(CFSTR("canvas_height"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(_DWORD *)(Instance + 1424) = v2;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enable_ktrace"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  v5 = !v4;
  *(_BYTE *)(Instance + 3240) = v5;
  v6 = CFPreferencesGetAppIntegerValue(CFSTR("override_display_width"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    *(_BYTE *)(Instance + 1360) = 1;
    *(double *)(Instance + 1344) = (double)v6;
  }
  v7 = CFPreferencesGetAppIntegerValue(CFSTR("override_display_height"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(double *)(Instance + 1352) = (double)v7;
  v8 = CFPreferencesGetAppIntegerValue(CFSTR("override_panel_width"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(double *)(Instance + 1368) = (double)v8;
  v9 = CFPreferencesGetAppIntegerValue(CFSTR("override_panel_height"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(double *)(Instance + 1376) = (double)v9;
  *(_BYTE *)(Instance + 3248) = 0;
  v10 = CFPreferencesGetAppBooleanValue(CFSTR("benchmark"), CFSTR("com.apple.iokit.IOMobileGraphicsFamily"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    *(_BYTE *)(Instance + 3248) = v10 != 0;
  return Instance;
}

uint64_t IOMFBgainencoder_set_map_version(unsigned int a1)
{
  if (a1 > 1)
    return 0;
  map_version = a1;
  return 1;
}

uint64_t kern_SwapEnd(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v6;

  v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 5u, (const void *)(a1 + 24), 0x508uLL, 0, 0);
  v3 = *(unsigned int **)(a1 + 3192);
  if (v3)
  {
    IOMFBGainMapRelease(a1, v3);
    *(_QWORD *)(a1 + 3192) = 0;
  }
  v4 = *(_DWORD *)(a1 + 1952) + 1;
  *(_DWORD *)(a1 + 1952) = v4;
  if (v4 >= 0x3E && core_analytics_send_data(a1, 0, (uint64_t)"com.apple.iomfb.underrun"))
  {
    if (core_analytics_send_data(a1, 4, (uint64_t)"com.apple.iomfb.underrunType"))
    {
      v6 = 4;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v6);
    }
    v6 = 0;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v6);
    *(_DWORD *)(a1 + 1952) = 0;
  }
  return v2;
}

uint64_t core_analytics_send_data(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  xpc_object_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  char v11;
  char v12;

  if (!*(_QWORD *)(a1 + 1960))
  {
    pthread_once(&open_core_analytics_s_ca_once, find_core_analytics);
    v6 = s_core_analytics_send_event_fn;
    *(_QWORD *)(a1 + 1960) = s_core_analytics_send_event_fn;
    *(_QWORD *)(a1 + 1968) = s_core_analytics_lib;
    if (!v6)
      return 0;
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  if (!v7)
    return 0;
  v8 = v7;
  switch(a2)
  {
    case 0:
      goto LABEL_29;
    case 1:
      if (!core_analytics_dict_insert(a1, CFSTR("CurrentCode"), v7)
        || !core_analytics_dict_insert(a1, CFSTR("TimezeroDelta"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SaturatePositiveCount"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SaturateNegativeCount"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageUIImageType"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageUIBrightness"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageUIBrightnessDim"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageFCMTemp"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageSIPTemp"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageFCMSIPTempDelta"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageExpectedVoltPerNit"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageMeasuredVoltPerNit"), v8))
      {
        goto LABEL_32;
      }
      v9 = CFSTR("SageVoltDeltaPct");
      break;
    case 2:
      if (!core_analytics_dict_insert(a1, CFSTR("SageUIImageType"), v7)
        || !core_analytics_dict_insert(a1, CFSTR("SageUIBrightness"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageFCMTemp"), v8)
        || !core_analytics_dict_insert(a1, CFSTR("SageSIPTemp"), v8)
        || (core_analytics_dict_insert(a1, CFSTR("SageFCMSIPTempDelta"), v8) & 1) == 0
        || !core_analytics_dict_insert(a1, CFSTR("SageUpdateStatus"), v8))
      {
        goto LABEL_32;
      }
      goto LABEL_31;
    case 3:
      v9 = CFSTR("Time");
      break;
    case 4:
      v11 = core_analytics_dict_insert(a1, CFSTR("decomp_fail"), v7);
      v12 = core_analytics_dict_insert(a1, CFSTR("downscale_fail"), v8);
      if ((v11 & 1) != 0 || (v12 & 1) != 0)
        goto LABEL_31;
LABEL_29:
      v9 = CFSTR("underrun");
      break;
    default:
      goto LABEL_32;
  }
  if ((core_analytics_dict_insert(a1, v9, v8) & 1) != 0)
  {
LABEL_31:
    (*(void (**)(uint64_t, void *))(a1 + 1960))(a3, v8);
    v10 = 1;
  }
  else
  {
LABEL_32:
    v10 = 0;
  }
  xpc_release(v8);
  return v10;
}

uint64_t core_analytics_dict_insert(uint64_t a1, const __CFString *a2, void *a3)
{
  uint64_t (*v3)(void);
  uint64_t v6;
  const void *v7;
  const char *CStringPtr;
  CFTypeID v9;
  uint64_t v10;
  CFTypeID v11;
  uint64_t valuePtr;

  if (a1)
  {
    v3 = *(uint64_t (**)(void))(a1 + 2008);
    if (v3)
    {
      v6 = v3();
      if (v6)
      {
        v7 = (const void *)v6;
        CStringPtr = CFStringGetCStringPtr(a2, 0);
        valuePtr = 0;
        v9 = CFGetTypeID(v7);
        if (v9 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)v7))
          {
            v10 = 1;
            xpc_dictionary_set_uint64(a3, CStringPtr, 1uLL);
LABEL_12:
            CFRelease(v7);
            return v10;
          }
        }
        else
        {
          v11 = CFGetTypeID(v7);
          if (v11 == CFNumberGetTypeID() && CFNumberGetValue((CFNumberRef)v7, kCFNumberSInt64Type, &valuePtr))
          {
            xpc_dictionary_set_uint64(a3, CStringPtr, valuePtr);
            v10 = 1;
            goto LABEL_12;
          }
        }
        v10 = 0;
        goto LABEL_12;
      }
    }
  }
  return 0;
}

CFTypeRef kern_CopyProperty(uint64_t a1, CFStringRef key)
{
  CFTypeRef v3;
  CFStringEncoding FastestEncoding;
  const char *CStringPtr;

  v3 = IORegistryEntrySearchCFProperty(*(_DWORD *)(a1 + 16), "IOService", key, 0, 0);
  if (!v3)
  {
    FastestEncoding = CFStringGetFastestEncoding(key);
    CStringPtr = CFStringGetCStringPtr(key, FastestEncoding);
    if (key != CFSTR("underrun"))
      syslog(3, " %s key : %s not found \n", "kern_CopyProperty", CStringPtr);
  }
  return v3;
}

void IOMFBGainMapRelease(uint64_t a1, unsigned int *a2)
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  void (*v6)(void);

  if (a2)
  {
    v3 = a2 + 1;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      if (a1)
      {
        v6 = *(void (**)(void))(a1 + 2640);
        if (v6)
          v6();
      }
      free(a2);
    }
  }
}

uint64_t kern_SetParameter(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *inputStruct)
{
  uint64_t v4;
  BOOL v7;
  BOOL v8;
  mach_port_t v11;
  uint64_t v12;
  uint64_t input;
  uint64_t v15;

  v4 = 3758097090;
  if (a1)
  {
    v7 = a3 && inputStruct == 0;
    v8 = v7;
    if (a3 <= 0x20 && !v8)
    {
      if (a2 != 8)
      {
        v11 = *(_DWORD *)(a1 + 20);
        input = a2;
        v12 = IOConnectCallMethod(v11, 0x44u, &input, 1u, inputStruct, 8 * a3, 0, 0, 0, 0);
        if (a2 == 10)
        {
          if (!a3)
            return v4;
          if (*inputStruct == 3)
          {
            if (core_analytics_send_data(a1, 2, (uint64_t)"com.apple.TritiumVSHCompensation.Status"))
            {
              if (get_vsh_update_status((_QWORD *)a1) == 1
                && core_analytics_send_data(a1, 1, (uint64_t)"com.apple.TritiumVSHCompensation.CalibStop"))
              {
                v15 = 1;
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v15);
              }
              v15 = 2;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v15);
            }
            if (core_analytics_send_data(a1, 3, (uint64_t)"com.apple.TritiumVSHCompensation.CumulativeOnTime"))
            {
              v15 = 3;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v15);
            }
          }
        }
        return v12;
      }
      if (a3 == 1 && *inputStruct <= 1u)
      {
        v4 = 0;
        *(_DWORD *)(a1 + 1932) = *inputStruct;
      }
    }
  }
  return v4;
}

uint64_t kern_SwapWait(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 6u, v4, 3u, 0, 0);
}

void FrameInfoNotifyFuncIOShq(uint64_t a1, uint64_t a2, uint64_t a3, uintptr_t a4)
{
  IODataQueueMemory *v4;
  IODataQueueEntry *v6;
  IODataQueueEntry *v7;
  unsigned int v8;
  uint32_t dataSize;

  dataSize = 0;
  v4 = *(IODataQueueMemory **)(a4 + 1664);
  if (v4)
  {
    v6 = IODataQueuePeek(v4);
    if (v6)
    {
      v7 = v6;
      v8 = 1;
      do
      {
        memcpy((void *)(a4 + 3312), v7->data, v7->size);
        PackAndDispatchFrameInfoNotifictionData(a4, v8);
        IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 1664), 0, &dataSize);
        v7 = IODataQueuePeek(*(IODataQueueMemory **)(a4 + 1664));
        ++v8;
      }
      while (v7);
    }
  }
  else
  {
    syslog(3, "FrameInfoNotifyFunc IO Data Queue not available");
  }
}

uint64_t kern_SetIdleBuffer(uint64_t a1, __IOSurface *a2)
{
  uint64_t result;
  uint64_t (*v4)(uint64_t);

  result = setIdleBuffer(a1, a2);
  if (!(_DWORD)result)
  {
    result = 3758097090;
    if (a1)
    {
      v4 = *(uint64_t (**)(uint64_t))(a1 + 2184);
      if (v4)
        return v4(a1);
    }
  }
  return result;
}

uint64_t setIdleBuffer(uint64_t a1, IOSurfaceRef buffer)
{
  uint64_t v2;
  size_t Width;
  size_t Height;
  unint64_t v7;
  uint64_t (*v8)(uint64_t, int *);
  uint64_t (*v10)(uint64_t, _QWORD, IOSurfaceRef, _QWORD, double, double, double, double, double, double, double, double);
  int v11;

  v2 = 3758097090;
  if (buffer)
  {
    if (IOSurfaceGetPlaneCount(buffer) < 2)
    {
      Width = IOSurfaceGetWidth(buffer);
      Height = IOSurfaceGetHeight(buffer);
    }
    else
    {
      Width = IOSurfaceGetWidthOfPlane(buffer, 0);
      Height = IOSurfaceGetHeightOfPlane(buffer, 0);
    }
    v7 = Height;
    if (a1)
    {
      v8 = *(uint64_t (**)(uint64_t, int *))(a1 + 2176);
      if (v8)
      {
        v11 = -1431655766;
        v2 = v8(a1, &v11);
        if (!(_DWORD)v2)
        {
          v10 = *(uint64_t (**)(uint64_t, _QWORD, IOSurfaceRef, _QWORD, double, double, double, double, double, double, double, double))(a1 + 2016);
          v2 = 3758097090;
          if (v10)
          {
            v2 = v10(a1, 0, buffer, 0, 0.0, 0.0, (double)Width, (double)v7, 0.0, 0.0, (double)Width, (double)v7);
            if (!(_DWORD)v2)
            {
              *(_DWORD *)(a1 + 404) = 8;
              *(_DWORD *)(a1 + 360) |= 1u;
            }
          }
        }
      }
    }
  }
  return v2;
}

uint64_t kern_SwapSetLayer(uint64_t a1, unsigned int a2, IOSurfaceRef buffer, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unsigned int v30;
  unint64_t v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void (*v36)(uint64_t, __int128 *, double, double, double, double);
  double v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  float v55;
  unsigned int v56;
  float v57;
  unsigned int v58;
  _DWORD *v59;
  float v60;
  float v61;
  _QWORD *v62;
  double v63;
  double v64;
  float v65;
  double v66;
  float v67;
  float v68;
  float v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  _DWORD *v73;
  uint64_t v74;
  __int128 v75;
  double v76;
  __int128 v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;

  v79 = 0u;
  if (a2 >= 4)
  {
    syslog(3, "%s - layer index too large: %d\n", "IOReturn kern_SwapSetLayer(IOMobileFramebufferRef, uint32_t, IOSurfaceRef, CGRect, CGRect, uint32_t)", a2);
    return 3758097090;
  }
  v23 = a1 + 356;
  if (buffer)
  {
    v24 = 0;
    v25 = 0;
    do
    {
      if (4 * a2 != v24 && *(_DWORD *)(a1 + 180 + v24))
        ++v25;
      v24 += 4;
    }
    while (v24 != 16);
    if (v25 > 2)
      syslog(3, "%s - too many active layers: %d\n", "IOReturn kern_SwapSetLayer(IOMobileFramebufferRef, uint32_t, IOSurfaceRef, CGRect, CGRect, uint32_t)", v25 + 1);
    *(_DWORD *)(a1 + 4 * a2 + 180) = IOSurfaceGetID(buffer);
    v26 = *(double *)(a1 + 1368);
    v27 = 1.0;
    if (v26 == 0.0)
    {
      v29 = 1.0;
    }
    else
    {
      v28 = *(double *)(a1 + 1376);
      v29 = 1.0;
      if (v28 != 0.0)
      {
        v29 = v26 / *(double *)(a1 + 1344);
        v27 = v28 / *(double *)(a1 + 1352);
        a9 = a9 * v29;
        a10 = a10 * v27;
        a11 = a11 * v29;
        a12 = a12 * v27;
      }
    }
    *(_DWORD *)(a1 + 356) |= 1 << a2;
    *(_DWORD *)(a1 + 360) &= ~(1 << a2);
  }
  else
  {
    *(int8x8_t *)v23 = vorr_s8(*(int8x8_t *)v23, (int8x8_t)vdup_n_s32(1 << a2));
    v29 = 1.0;
    v27 = 1.0;
  }
  HIDWORD(v31) = a4;
  LODWORD(v31) = (a4 & 0xE) - 2;
  v30 = v31 >> 1;
  if (v30 > 6)
    v32 = 0;
  else
    v32 = dword_1B55162A4[v30];
  *(_DWORD *)(a1 + 4 * a2 + 372) = v32;
  if ((a4 & 0x20) != 0)
  {
    *(_BYTE *)(a1 + 846) = 1;
    if ((a4 & 0x80000000) == 0)
    {
LABEL_22:
      if ((a4 & 0x40) == 0)
        goto LABEL_23;
LABEL_66:
      *(_BYTE *)(a1 + 871) = 1;
      if ((a4 & 0x80) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((a4 & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(a1 + 848) = 1;
  if ((a4 & 0x40) != 0)
    goto LABEL_66;
LABEL_23:
  if ((a4 & 0x80) != 0)
LABEL_24:
    *(_BYTE *)(a1 + 873) = 1;
LABEL_25:
  if ((a4 & 0x100) != 0)
    *(_BYTE *)(a1 + 875) = 1;
  v76 = a8;
  if ((a4 & 0x200) != 0)
    *(_BYTE *)(a1 + a2 + 1307) = 1;
  v33 = 0.0;
  v34 = 0.0;
  v35 = 0.0;
  v36 = *(void (**)(uint64_t, __int128 *, double, double, double, double))(a1 + 1992);
  if (v36)
  {
    v36(a1, &v79, 0.0, 0.0, 0.0, 0.0);
    v34 = *((double *)&v79 + 1);
    v35 = *(double *)&v79;
  }
  v84 = v29 * 0.0;
  v85 = v27 * 0.0;
  v86 = v29 * v35;
  v87 = v27 * v34;
  v80 = a9;
  v81 = a10;
  v82 = a11;
  v83 = a12;
  v37 = fabs(v27 * 0.0);
  v38 = fabs(v29 * 0.0) == INFINITY || v37 == INFINITY;
  if (v38
    || fabs(a9) == INFINITY
    || fabs(a10) == INFINITY
    || (__CGRectStandardize(&v84),
        __CGRectStandardize(&v80),
        v39 = fmax(v84, v80),
        v40 = fmin(v84 + v86, v80 + v82),
        v39 > v40))
  {
    v41 = 0.0;
    v42 = 0.0;
    v43 = 0.0;
  }
  else
  {
    v63 = fmax(v85, v81);
    v64 = fmin(v87 + v85, v83 + v81);
    v41 = 0.0;
    v42 = 0.0;
    v43 = 0.0;
    if (v63 <= v64)
    {
      v41 = v40 - v39;
      v33 = v64 - v63;
      v42 = v63;
      v43 = v39;
    }
  }
  if (!buffer
    || fabs(v42) == INFINITY
    || fabs(v43) == INFINITY
    || v33 == 0.0
    || v41 == 0.0
    || fabs(a5) == INFINITY
    || fabs(a6) == INFINITY
    || a7 == 0.0
    || v76 == 0.0)
  {
    result = 0;
    v62 = (_QWORD *)(a1 + 16 * a2);
    *(_QWORD *)((char *)v62 + 204) = 0;
    *(_QWORD *)((char *)v62 + 196) = 0;
    v62 = (_QWORD *)((char *)v62 + 292);
    *v62 = 0;
    v62[1] = 0;
  }
  else
  {
    v44 = v32 & 5;
    if (v44 == 1)
      v45 = a12;
    else
      v45 = a11;
    if (v44 == 1)
      v46 = a11;
    else
      v46 = a12;
    if (v44 == 1)
      v47 = v33;
    else
      v47 = v41;
    if (v44 == 1)
      v48 = v41;
    else
      v48 = v33;
    v49 = a7 / v45;
    v50 = v76 / v46;
    v51 = a5 + (v43 - a9) * v49;
    v52 = a6 + (v42 - a10) * (v76 / v46);
    v53 = a5 + (v47 + v43 - a9) * v49 - v51;
    v54 = a1 + 16 * a2;
    v55 = v51;
    v56 = llroundf(v55);
    v57 = v52;
    v58 = llroundf(v57);
    *(_DWORD *)(v54 + 200) = v58;
    v59 = (_DWORD *)(v54 + 200);
    *(v59 - 1) = v56;
    if (v49 <= 1.0)
    {
      v65 = v53 + -0.001;
      v61 = ceilf(v65);
    }
    else
    {
      v60 = v53 + 0.001;
      v61 = floorf(v60);
    }
    v66 = a6 + (v48 + v42 - a10) * v50 - v52;
    *(_DWORD *)(a1 + 16 * a2 + 204) = (int)v61;
    if (v50 <= 1.0)
    {
      v69 = v66 + -0.001;
      v68 = ceilf(v69);
    }
    else
    {
      v67 = v66 + 0.001;
      v68 = floorf(v67);
    }
    v70 = (int)v68;
    *(_DWORD *)(a1 + 16 * a2 + 208) = (int)v68;
    v71 = (a5 + a7);
    if ((int)v61 + v56 > v71)
      *(v59 - 1) = v71 - (int)v61;
    v72 = (a6 + v76);
    if (v70 + v58 > v72)
      *v59 = v72 - v70;
    result = 0;
    v73 = (_DWORD *)(a1 + 24 + 16 * a2);
    v73[67] = (int)v43;
    v73[68] = (int)v42;
    v73[69] = (int)v41;
    v73[70] = (int)v33;
    v74 = a1 + 24 + 4 * a2;
    *(_DWORD *)(v74 + 236) = 1;
    *(_DWORD *)(v74 + 252) = 0;
    if (a2 == 2)
    {
      result = 0;
      *(_QWORD *)&v75 = 0xFC00FC00FC00FC00;
      *((_QWORD *)&v75 + 1) = 0xFC00FC00FC00FC00;
      *(_OWORD *)(v23 + 32) = v75;
    }
  }
  return result;
}

double *__CGRectStandardize(double *result)
{
  double v1;
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v1 = result[2];
  if (v1 < 0.0 || result[3] < 0.0)
  {
    v2 = result[1];
    v3 = fabs(v2);
    v4 = 0.0;
    v5 = fabs(*result) == INFINITY || v3 == INFINITY;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if (!v5)
    {
      v9 = result[3];
      if (v1 >= 0.0)
        v6 = result[2];
      else
        v6 = -v1;
      if (v1 >= 0.0)
        v1 = -0.0;
      v8 = *result + v1;
      if (v9 >= 0.0)
        v4 = result[3];
      else
        v4 = -v9;
      if (v9 >= 0.0)
        v10 = -0.0;
      else
        v10 = result[3];
      v7 = v2 + v10;
    }
    *result = v8;
    result[1] = v7;
    result[2] = v6;
    result[3] = v4;
  }
  return result;
}

uint64_t kern_GetDisplaySize(uint64_t a1, float64x2_t *a2)
{
  pthread_mutex_t *v4;
  float64x2_t *v5;
  uint64_t v6;
  uint32_t outputCnt;
  uint64x2_t output;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v5 = (float64x2_t *)(a1 + 1344);
  if (*(double *)(a1 + 1344) == 0.0)
  {
    output.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    output.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = 2;
    v6 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 8u, 0, 0, (uint64_t *)&output, &outputCnt);
    if (!(_DWORD)v6)
      *v5 = vcvtq_f64_u64(output);
  }
  else
  {
    v6 = 0;
  }
  pthread_mutex_unlock(v4);
  *a2 = *v5;
  return v6;
}

uint64_t kern_SwapBegin(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  unsigned int *v5;
  int v6;
  uint32_t outputCnt;
  uint64_t output[3];

  output[2] = *MEMORY[0x1E0C80C00];
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  output[1] = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 4u, 0, 0, output, &outputCnt))
    return 3758097084;
  bzero((void *)(a1 + 24), 0x508uLL);
  v5 = *(unsigned int **)(a1 + 3192);
  if (v5)
  {
    IOMFBGainMapRelease(a1, v5);
    *(_QWORD *)(a1 + 3192) = 0;
  }
  v6 = output[0];
  *(_DWORD *)(a1 + 176) = output[0];
  if (a2)
    *a2 = v6;
  result = 0;
  *(_DWORD *)(a1 + 404) = 0;
  return result;
}

uint64_t iomfb_SwapSetTimestamps(uint64_t a1, int *a2, uint64_t *a3, int a4)
{
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t v7;
  int v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  pthread_mutex_t *v14;

  v4 = 3758097090;
  if (a1)
  {
    v5 = a2;
    if (a2)
    {
      v6 = a3;
      if (a3)
      {
        LODWORD(v7) = a4;
        if (a4)
        {
          v14 = (pthread_mutex_t *)(a1 + 1856);
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
          v7 = v7;
          while (2)
          {
            v10 = *v5++;
            v9 = v10;
            v11 = (_QWORD *)(a1 + 24);
            switch(v10)
            {
              case 1:
                goto LABEL_13;
              case 2:
                v11 = (_QWORD *)(a1 + 32);
                goto LABEL_13;
              case 3:
                v11 = (_QWORD *)(a1 + 40);
                goto LABEL_13;
              case 4:
                v11 = (_QWORD *)(a1 + 48);
                goto LABEL_13;
              case 5:
                v11 = (_QWORD *)(a1 + 56);
                goto LABEL_13;
              case 6:
                v11 = (_QWORD *)(a1 + 64);
                goto LABEL_13;
              case 7:
                v11 = (_QWORD *)(a1 + 72);
LABEL_13:
                v12 = *v6++;
                *v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2712))(a1, v12);
                if (--v7)
                  continue;
                v4 = 0;
LABEL_15:
                pthread_mutex_unlock(v14);
                break;
              default:
                syslog(4, "IOMFB: unknown timestamp type: %d\n", v9);
                v4 = 3758097090;
                goto LABEL_15;
            }
            break;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t kern_ingest_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2;
  if (a2 && !*(_DWORD *)(a1 + 1932))
  {
    v3 = mach_continuous_time();
    return v3 + v2 - mach_absolute_time();
  }
  return v2;
}

void PackAndDispatchFrameInfoNotifictionData(uintptr_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  int v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  BOOL v21;
  unsigned int arg2;
  unsigned int arg2_4;
  uint64_t valuePtr;

  v4 = *(_QWORD *)(a1 + 3312);
  v5 = *(_DWORD *)(a1 + 3320);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v8 = Mutable;
    arg2 = a2;
    arg2_4 = v5;
    v9 = v4 & 0x7FFFFFFF;
    if ((v4 & 0x7FFFFFFF) != 0)
    {
      v10 = 0;
      v11 = 2;
      do
      {
        v12 = 1 << v10;
        v13 = ((1 << v10) & v9) == 0;
        if (1 << v10 < v9 && ((1 << v10) & v9) == 0)
        {
          do
          {
            ++v10;
            v15 = v9 & (2 * v12);
            v12 *= 2;
            v13 = v15 == 0;
          }
          while (v12 < v9 && !v15);
        }
        if (v13)
          break;
        if ((v4 & 0x80000000) != 0)
        {
          v17 = *(_QWORD *)(a1 + 3312 + 8 * v11++);
          v16 = v17 | (*(_QWORD *)(a1 + 3312 + 8 * v11) << 32);
        }
        else
        {
          v16 = *(_QWORD *)(a1 + 8 * v11 + 3312);
        }
        v18 = CFStringCreateWithCString(v6, *(const char **)(*(_QWORD *)(a1 + 1816) + 8 * v10), 0x600u);
        valuePtr = 0xAAAAAAAAAAAAAAAALL;
        valuePtr = adjust_ni_timestamp(a1, *(char **)(*(_QWORD *)(a1 + 1816) + 8 * v10), v16);
        v19 = CFNumberCreate(v6, kCFNumberLongLongType, &valuePtr);
        v20 = v19;
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 1;
        if (v21)
        {
          CFRelease(v8);
          if (v18)
            CFRelease(v18);
          if (v20)
            goto LABEL_23;
          return;
        }
        v9 ^= v12;
        ++v11;
        CFDictionarySetValue(v8, v18, v19);
        CFRelease(v20);
        CFRelease(v18);
      }
      while (v9);
    }
    if (*(_BYTE *)(a1 + 3240))
      kdebug_signpost(0x31800100u, a1, arg2, 0, 0);
    (*(void (**)(uintptr_t, _QWORD, CFMutableDictionaryRef, _QWORD))(a1 + 1680))(a1, arg2_4, v8, *(_QWORD *)(a1 + 1624));
    v20 = v8;
LABEL_23:
    CFRelease(v20);
  }
}

uint64_t adjust_ni_timestamp(uint64_t a1, char *__s2, uint64_t a3)
{
  const char *v6;
  char **v7;
  const char *v8;

  if (*(_DWORD *)(a1 + 1932) == 1)
    return a3;
  v6 = "Issued_time";
  v7 = off_1E69270A8;
  while (strcmp(v6, __s2))
  {
    v8 = *v7++;
    v6 = v8;
    if (!v8)
      return a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2720))(a1, a3);
}

uint64_t IOMFBGainEncoderStartRow(_DWORD *a1)
{
  if (IOMFBgainencoder_start_row(a1))
    return 0;
  else
    return 3758097084;
}

uint64_t IOMFBgainencoder_start_row(_DWORD *a1)
{
  uint64_t result;
  unsigned int v3;

  if ((a1[61] & 0x80000000) != 0)
    goto LABEL_4;
  result = finish_row(a1);
  if (!(_DWORD)result)
    return result;
  v3 = a1[61];
  if ((v3 & 0x80000000) != 0)
  {
LABEL_4:
    v3 = 0;
    a1[61] = 0;
  }
  return v3 < a1[67];
}

uint64_t finish_row(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v2 = a1[70];
  v3 = a1[66];
  if (v3 <= v2 || (result = IOMFBgainencoder_emit_run((uint64_t)a1, v3 - v2, (uint64_t)&finish_row_ones), (_DWORD)result))
  {
    ++a1[61];
    a1[70] = 0;
    return 1;
  }
  return result;
}

uint64_t IOMobileFramebufferSetBrightnessCorrection(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2344)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapActiveRegion(uint64_t a1, unsigned int a2, double a3, double a4, double a5, double a6)
{
  uint64_t result;
  uint64_t v8;
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  float v12;
  signed int v13;
  float v14;
  signed int v15;
  float v16;
  unsigned int v17;
  float v18;
  unsigned int v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  _DWORD *i;
  int v24;
  int v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  result = 3758097090;
  if (a1 && a2 <= 3)
  {
    v8 = a1 + 4 * a2;
    v9 = *(_DWORD *)(v8 + 416);
    if (v9 == 4)
      return 3758097128;
    v10 = (_DWORD *)(v8 + 416);
    *v10 = v9 + 1;
    v11 = (_DWORD *)(a1 + ((unint64_t)a2 << 6) + 16 * v9);
    v12 = a3;
    v13 = vcvtas_u32_f32(v12);
    v14 = a4;
    v15 = vcvtas_u32_f32(v14);
    v11[108] = v13;
    v11[109] = v15;
    v16 = a5;
    v17 = vcvtas_u32_f32(v16);
    v11[110] = v17;
    v18 = a6;
    v19 = vcvtas_u32_f32(v18);
    v11[111] = v19;
    if (v17)
      v20 = v19 == 0;
    else
      v20 = 1;
    if (!v20)
    {
      if (v9 < 1)
        return 0;
      v21 = v13 + v17;
      v22 = v15 + v19;
      for (i = (_DWORD *)(a1 + ((unint64_t)a2 << 6) + 444); ; i += 4)
      {
        v24 = *(i - 3);
        if (*(i - 1) + v24 > v13)
        {
          v25 = *(i - 2);
          if (*i + v25 > v15)
          {
            v27 = __OFSUB__(v24, v21);
            v26 = (int)(v24 - v21) < 0;
          }
          else
          {
            v27 = 0;
            v26 = 0;
          }
          if (v26 != v27)
          {
            v29 = __OFSUB__(v25, v22);
            v28 = (int)(v25 - v22) < 0;
          }
          else
          {
            v29 = 0;
            v28 = 0;
          }
          if (v28 != v29)
            break;
        }
        if (!--v9)
          return 0;
      }
    }
    --*v10;
  }
  return result;
}

uint64_t IOMobileFramebufferCopyProperty(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2008)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferSetIdleBuffer(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2256)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferSwapSetContrastEnhancerStrength(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2168)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetBrightnessLimit(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2128)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetBrightness(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2104)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetAmbientLux(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2160)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferEnableDisableVideoPowerSavings(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2544)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetGainMap(uint64_t a1, _DWORD *a2)
{
  unsigned int *v4;
  _DWORD *v5;
  unsigned int *v6;
  unsigned int v7;

  v4 = *(unsigned int **)(a1 + 3192);
  if (v4)
    IOMFBGainMapRelease(a1, v4);
  v5 = (_DWORD *)(a1 + 1019);
  *(_BYTE *)(a1 + 1023) = 1;
  if (a2)
  {
    v6 = a2 + 1;
    *v5 = *a2;
    *(_QWORD *)(a1 + 3192) = a2;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  else
  {
    *v5 = 0;
    *(_QWORD *)(a1 + 3192) = 0;
  }
  return 0;
}

uint64_t kern_EnableDisableVideoPowerSavings(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x21u, v3, 1u, 0, 0);
}

uint64_t IOMFBGainEncoderCreate(int a1, _QWORD *a2, double a3, double a4, double a5, double a6)
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t result;

  v9 = IOMFBgainencoder_new((int)a5, (int)a6, a1 != 0, 0);
  if (!v9)
    return 3758097084;
  v10 = v9;
  IOMFBgainencoder_set_origin((uint64_t)v9, a3, a4);
  result = 0;
  *a2 = v10;
  return result;
}

uint64_t IOMFBgainencoder_set_origin(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(result + 272) = a2;
  *(_DWORD *)(result + 276) = a3;
  return result;
}

_QWORD *IOMFBgainencoder_new(int a1, int a2, char a3, char a4)
{
  _QWORD *v8;
  _QWORD *v9;
  size_t v10;
  int v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  int v25;

  v8 = malloc_type_malloc(0x138uLL, 0x103004008784C41uLL);
  v9 = v8;
  if (v8)
  {
    v8[38] = 0;
    *((_OWORD *)v8 + 17) = 0u;
    *((_OWORD *)v8 + 18) = 0u;
    *((_OWORD *)v8 + 15) = 0u;
    *((_OWORD *)v8 + 16) = 0u;
    *((_OWORD *)v8 + 13) = 0u;
    *((_OWORD *)v8 + 14) = 0u;
    *((_OWORD *)v8 + 11) = 0u;
    *((_OWORD *)v8 + 12) = 0u;
    *((_OWORD *)v8 + 9) = 0u;
    *((_OWORD *)v8 + 10) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *(_OWORD *)v8 = 0u;
    *((_BYTE *)v8 + 301) = a4;
    *((_BYTE *)v8 + 300) = a3;
    if (a1 | a2)
    {
      if (a2 <= 16)
        v10 = 16;
      else
        v10 = a2;
      v11 = 3 * a1 * a2;
      *v8 = malloc_type_malloc(v10, 0x3B85C5ADuLL);
      v9[1] = malloc_type_malloc(200 * a2, 0x257F5D86uLL);
      v9[2] = malloc_type_malloc(v11, 0x2BFB7777uLL);
      v12 = (char *)malloc_type_malloc(0x18uLL, 0x10100406F90CC4AuLL);
      v9[3] = v12;
      v13 = *v9;
      v12[15] = 0;
      *(_WORD *)(v12 + 13) = 0;
      *((_QWORD *)v12 + 2) = v13;
      *((_DWORD *)v12 + 2) = v10;
      *(_QWORD *)v12 = 0xFFFFFFFFLL;
      v12[12] = 0;
      v14 = (char *)malloc_type_malloc(0x18uLL, 0x10100406F90CC4AuLL);
      v9[4] = v14;
      v15 = v9[1];
      v14[15] = 0;
      *(_WORD *)(v14 + 13) = 0;
      *((_QWORD *)v14 + 2) = v15;
      *((_DWORD *)v14 + 2) = 200 * a2;
      *(_QWORD *)v14 = 0xFFFFFFFFLL;
      v14[12] = 0;
      v16 = (char *)malloc_type_malloc(0x18uLL, 0x10100406F90CC4AuLL);
      v9[5] = v16;
      v17 = v9[2];
      v16[15] = 0;
      *(_WORD *)(v16 + 13) = 0;
      *((_QWORD *)v16 + 2) = v17;
      *((_DWORD *)v16 + 2) = v11;
      *(_QWORD *)v16 = 0xFFFFFFFFLL;
      v16[12] = 0;
      v9[6] = malloc_type_malloc(0x10uLL, 0x10200403A5D3213uLL);
      v9[7] = malloc_type_malloc(0x10uLL, 0x10200403A5D3213uLL);
      v9[8] = malloc_type_malloc(0x10uLL, 0x10200403A5D3213uLL);
      v19 = v9[5];
      v18 = (_QWORD *)v9[6];
      *v18 = 0;
      v18[1] = 0;
      *v18 = v19;
      *((_DWORD *)v18 + 2) = 0;
      v20 = (_QWORD *)v9[7];
      v21 = v9[5];
      *v20 = 0;
      v20[1] = 0;
      *v20 = v21;
      *((_DWORD *)v20 + 2) = 0;
      v22 = (_QWORD *)v9[8];
      v23 = v9[5];
      *v22 = 0;
      v22[1] = 0;
      *v22 = v23;
      *((_DWORD *)v22 + 2) = 0;
      *((_DWORD *)v9 + 66) = a1;
      *((_DWORD *)v9 + 67) = a2;
      *((_DWORD *)v9 + 70) = 0;
      *((_DWORD *)v9 + 61) = -1;
    }
    *((_DWORD *)v9 + 59) = 255;
    if (map_version)
    {
      v24 = (unsigned int *)v9[5];
      if ((*v24 & 0x80000000) != 0)
      {
        v25 = 0;
        *((_DWORD *)v9 + 76) = 0;
      }
      else
      {
        *((_DWORD *)v9 + 76) = *v24;
        v25 = 8 - v24[1];
      }
      *((_DWORD *)v9 + 77) = v25;
      bw_set(v24, 32, 0);
    }
    *(_OWORD *)(v9 + 27) = 0u;
    *(_OWORD *)(v9 + 25) = 0u;
    *(_OWORD *)(v9 + 23) = 0u;
    *(_OWORD *)(v9 + 21) = 0u;
    *(_OWORD *)(v9 + 19) = 0u;
    *(_OWORD *)(v9 + 17) = 0u;
    *(_OWORD *)(v9 + 15) = 0u;
    *(_OWORD *)(v9 + 13) = 0u;
    *(_OWORD *)(v9 + 11) = 0u;
    *(_OWORD *)(v9 + 9) = 0u;
  }
  return v9;
}

uint64_t virt_HDCPSendRequest(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  v5 = a1[346];
  if (*(uint64_t *)v5 < 1)
    return 3758097095;
  a1[202] = a4;
  a1[195] = a5;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), _QWORD *))(v5 + 152))(a1[345], a2, a3, iomfb_VirtualDisplayHDCPCallback, a1);
}

uint64_t virt_HDCPGetReply(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 2768);
  if (*(uint64_t *)v1 < 1)
    return 3758097095;
  else
    return (*(uint64_t (**)(_QWORD))(v1 + 160))(*(_QWORD *)(a1 + 2760));
}

uint64_t iomfb_VirtualDisplayHDCPCallback(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);

  v2 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 1616);
  if (v2)
    return v2(result, *(_QWORD *)(result + 1560), a2);
  return result;
}

uint64_t IOMobileFramebufferHDCPSendRequest(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2456)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferHDCPGetReply(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2464)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetFrameworkInfo(_QWORD *a1)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    *a1 = 0;
    return 3758097136;
  }
  return result;
}

uint64_t IOMobileFramebufferGetLayerDefaultSurface(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 1976)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferCopyLayerDisplayedSurface(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 1984)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetDisplaySize(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 1992)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetCanvasSizes(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t (*v7)(uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  double v12;

  result = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        *(_DWORD *)(a1 + 1416) = 0;
        v7 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1992);
        if (v7)
        {
          result = v7(a1, a1 + 1384);
          if (!(_DWORD)result)
          {
            v8 = *(_DWORD *)(a1 + 1416);
            v9 = v8 + 1;
            *(_DWORD *)(a1 + 1416) = v8 + 1;
            v10 = *(_DWORD *)(a1 + 1420);
            if (v10 && (v11 = *(_DWORD *)(a1 + 1424)) != 0)
            {
              v12 = (double)v11;
              *(double *)(a1 + 1400) = (double)v10;
            }
            else
            {
              if (*(double *)(a1 + 1344) != 1080.0 || *(double *)(a1 + 1352) != 1920.0)
                goto LABEL_13;
              *(_QWORD *)(a1 + 1400) = 0x4093680000000000;
              v12 = 2208.0;
            }
            *(double *)(a1 + 1408) = v12;
            v9 = v8 + 2;
            *(_DWORD *)(a1 + 1416) = v8 + 2;
LABEL_13:
            result = 0;
            *a2 = a1 + 1384;
            *a3 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOMobileFramebufferSetCanvasSize(_DWORD *a1, double a2, double a3)
{
  const __CFAllocator *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v12;
  mach_port_t v13;
  unsigned int v14;
  unsigned int valuePtr;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  valuePtr = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  v6 = CFNumberCreate(v4, kCFNumberSInt32Type, &v14);
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v12 = v14;
    input[0] = valuePtr;
    input[1] = v14;
    a1[355] = valuePtr;
    a1[356] = v12;
    CFPreferencesSetAppValue(CFSTR("canvas_width"), v5, CFSTR("com.apple.iokit.IOMobileGraphicsFamily"));
    CFPreferencesSetAppValue(CFSTR("canvas_height"), v7, CFSTR("com.apple.iokit.IOMobileGraphicsFamily"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.iokit.IOMobileGraphicsFamily"));
    v13 = a1[5];
    if (v13)
      v9 = IOConnectCallScalarMethod(v13, 0x35u, input, 2u, 0, 0);
    else
      v9 = 0;
LABEL_13:
    CFRelease(v5);
    v10 = v9;
    if (!v7)
      return v10;
    goto LABEL_8;
  }
  v9 = 0;
  v10 = 0;
  if (v5)
    goto LABEL_13;
  if (v6)
LABEL_8:
    CFRelease(v7);
  return v10;
}

uint64_t IOMobileFramebufferGetID(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2000)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetEventWait(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2024)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetEventSignalOnGlass(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2032)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetEventSignal(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2040)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetBlit(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 2048))();
}

uint64_t IOMobileFramebufferSwapDebugInfo(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2056)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSubtitleRegion(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2064)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetTimestamp(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2072)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferAnnounceNextSwapTimestamp(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2080)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetParams(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a4 <= 3)
    return (*(uint64_t (**)(void))(a1 + 2096))();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapWorkaroundSettings(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2688)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetIndicatorBrightness(uint64_t a1)
{
  if (a1 && *(_QWORD *)(a1 + 2104))
    return (*(uint64_t (**)(void))(a1 + 2112))();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetSecureAnimation(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2120)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetDisplayEdr(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2136)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetDisplayEdrHeadroom(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2144)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFrameBufferSwapSetUserLuminanceAdjustment(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2152)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetColorMatrix(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2192)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSignal(uint64_t a1)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 2208))
      return 3758097095;
    else
      return 3758097090;
  }
  return result;
}

uint64_t IOMobileFramebufferSwapWaitWithTimeout(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2224)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapCancel(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2232)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapCancelAll(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2240)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferWaitSurface(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (!*(_DWORD *)(a1 + 176))
    return 0;
  v1 = *(uint64_t (**)(void))(a1 + 2216);
  if (v1)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSurfaceIsReplaceable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t (*v6)(uint64_t);

  result = 3758097090;
  if (a1 && a2 && a4)
  {
    v6 = *(uint64_t (**)(uint64_t))(a1 + 2248);
    if (v6)
      return v6(a1);
    else
      return 3758097095;
  }
  return result;
}

uint64_t IOMobileFramebufferSetIdleBufferEvent(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2264)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetVSyncRunLoopSource(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2528)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferEnableVSyncNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2272)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferDisableVSyncNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2280)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetTVOutMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2288)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetTVOutSignalType(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2296)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetWSSInfo(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2304)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferRequestPowerChange(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2312)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetWhiteOnBlackMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2320)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetColorRemapMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2328)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetColorRemapMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2200)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetColorRemapMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2336)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferEnableStatistics(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2352)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetDebugFlags(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2360)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetFlags(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2368)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetGammaTable(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2376)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetGammaTable(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2392)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetMatrix(uint64_t a1, unsigned int a2, void *outputStruct)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t input;
  size_t v8;

  v3 = 3758097090;
  v8 = 72;
  input = a2;
  if (a1 && outputStruct)
  {
    v4 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x36u, &input, 1u, 0, 0, 0, 0, outputStruct, &v8);
    if (v8 != 72 && v4 == 0)
      return 3758097097;
    else
      return v4;
  }
  return v3;
}

uint64_t IOMobileFramebufferSetDisplayDevice(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2400)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetDigitalOutMode(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2408)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetDigitalOutMode(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, _OWORD *, uint64_t, _QWORD, _QWORD);
  int v8;
  _OWORD v9[3];

  result = 3758097095;
  memset(v9, 0, 44);
  if (a1)
  {
    v5 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
    if (v5)
    {
      result = v5(a1, 64, v9, 44, 0, 0);
      if (!(_DWORD)result)
      {
        v8 = DWORD2(v9[0]);
        *a2 = DWORD1(v9[0]);
        *a3 = v8;
      }
    }
  }
  return result;
}

uint64_t IOMobileFramebufferGetDigitalOutState(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2416)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetClamshellState(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2424)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetSupportedDigitalOutModes(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2432)) != 0)
    return v1();
  else
    return 3758097090;
}

double IOMobileFramebufferGetBandwidth(uint64_t a1, uint64_t a2)
{
  double result;
  unsigned int (*v3)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD, _QWORD);
  __int128 v5;
  __int128 v6;

  result = 0.0;
  v5 = 0u;
  v6 = 0u;
  if (a1)
  {
    v3 = *(unsigned int (**)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
    if (v3)
    {
      if (!v3(a1, 115, &v5, 32, 0, 0))
      {
        *(_OWORD *)a2 = v5;
        *(_QWORD *)(a2 + 16) = v6;
        result = *((double *)&v6 + 1);
        *(_QWORD *)(a2 + 24) = *((_QWORD *)&v6 + 1);
      }
    }
  }
  return result;
}

uint64_t IOMobileFramebufferGetHotPlugRunLoopSource(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2528)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferEnablePowerNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2272)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferDisablePowerNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2280)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2272)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2280)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetHDCPDownstreamState(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2448)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetHDCPRunLoopSource(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2528)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferGetHDCPAuthenticationProtocol(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2440)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferGetProtectionOptions(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2472)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferprintDisplayRegs(uint64_t result)
{
  uint64_t (*v1)(void);

  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 2480);
    if (v1)
      return v1();
  }
  return result;
}

uint64_t IOMobileFramebufferGetDotPitch(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2488)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetDotPitchFloat(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2496)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetDisplayArea(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2504)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferEnableDisableDithering(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2512)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetUnderrunColor(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2520)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetCRCRunLoopSource(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2528)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferGetCRCNotifyMessageCount(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2536)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferEnableCRCNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2272)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferDisableCRCNotifications(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2280)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetRunLoopSource(uint64_t a1, unsigned int a2)
{
  uint64_t (*v2)(void);

  if (a1 && a2 <= 5 && (v2 = *(uint64_t (**)(void))(a1 + 2528)) != 0)
    return v2();
  else
    return 0;
}

uint64_t IOMobileFramebufferSetVideoDACGain(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2552)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSetLine21Data(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2560)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferGetDebugTraces(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2568)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferEnableDebugTracing(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2576)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferEnableVBLTraces(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2584)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFrameBufferPrintDebugTraces(uint64_t result)
{
  uint64_t (*v1)(void);

  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 2592);
    if (v1)
      return v1();
  }
  return result;
}

uint64_t IOMobileFrameBufferSetLogLevel(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2600)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSPLCSetBrightness(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2608)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSPLCGetBrightness(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2616)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferSwapSetToneMapConfig(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, _OWORD *, uint64_t, int *, uint64_t, uint64_t, uint64_t);
  __int128 v10;
  __int128 v11;
  _OWORD v13[4];
  uint64_t v14;
  int v15;

  v8 = 3758097095;
  if (a1)
  {
    v9 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, int *, uint64_t, uint64_t, uint64_t))(a1 + 2624);
    if (v9)
    {
      v10 = *(_OWORD *)(a2 + 48);
      v13[2] = *(_OWORD *)(a2 + 32);
      v13[3] = v10;
      v14 = *(_QWORD *)(a2 + 64);
      v11 = *(_OWORD *)(a2 + 16);
      v13[0] = *(_OWORD *)a2;
      v13[1] = v11;
      v15 = a3;
      return v9(a1, 107, v13, 72, &v15, 1, a7, a8);
    }
  }
  return v8;
}

uint64_t IOMobileFramebufferSetBlock(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2624)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferGetBlock(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2632)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferGetBufBlock(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2704)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetICCMatrix(uint64_t a1, int a2, int a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  __int128 v6;
  int v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[28];
  int v12;
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = 3758097095;
  v8 = 1;
  if (a1)
  {
    v5 = *(uint64_t (**)(void))(a1 + 2624);
    if (v5)
    {
      v6 = a4[1];
      v9 = *a4;
      v10 = v6;
      *(_OWORD *)v11 = a4[2];
      *(_OWORD *)&v11[12] = *(__int128 *)((char *)a4 + 44);
      v12 = *(_DWORD *)(a1 + 176);
      v13 = a2;
      v14 = a3;
      return v5();
    }
  }
  return v4;
}

uint64_t IOMobileFramebufferSwapSetICCCurve(uint64_t a1, int a2, int a3, int a4, int *a5)
{
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, _DWORD *, uint64_t, _DWORD *, uint64_t);
  int v12;
  _DWORD v14[3];
  _BYTE v15[28];
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  _BYTE v20[524];
  __int128 v21;
  _DWORD v22[4];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = 3758097095;
  bzero(v14, 0x258uLL);
  v14[0] = 1;
  if (a1)
  {
    v11 = *(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, _DWORD *, uint64_t))(a1 + 2624);
    if (v11)
    {
      v12 = *a5;
      v14[2] = *a5;
      if (a2 == 17 && !*(_DWORD *)(a1 + 1928))
      {
        return 3758097126;
      }
      else
      {
        switch(v12)
        {
          case 8:
            v16 = a5[3];
            v17 = a5[2];
            v18 = *((_QWORD *)a5 + 2);
            v19 = 4 * v17;
            goto LABEL_7;
          case 9:
            v16 = a5[6];
            v17 = a5[2];
            v18 = *((_QWORD *)a5 + 4);
            v19 = 4 * v17;
            break;
          case 12:
            memcpy(v20, a5 + 2, sizeof(v20));
            break;
          case 17:
            v21 = *(_OWORD *)(a5 + 2);
            break;
          default:
LABEL_7:
            *(_OWORD *)v15 = *(_OWORD *)(a5 + 2);
            *(_OWORD *)&v15[12] = *(_OWORD *)(a5 + 5);
            break;
        }
        v22[0] = *(_DWORD *)(a1 + 176);
        v22[1] = a2;
        v22[2] = a4;
        v22[3] = a3;
        return v11(a1, 51, v14, 600, v22, 4);
      }
    }
  }
  return v10;
}

uint64_t IOMobileFramebufferSetPreset(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2624)) != 0)
    return v1();
  else
    return 3758097095;
}

uint64_t IOMobileFramebufferSetParameter(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2640)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferCreateStatistics(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2648)) != 0)
    return v1();
  else
    return 0;
}

uint64_t IOMobileFramebufferFactoryPortal(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2672)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetCurrentAbsoluteTime(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2680)) != 0)
    return v1();
  else
    return 3758097090;
}

uint64_t IOMobileFramebufferGetLinkQuality(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (a1 && (v1 = *(uint64_t (**)(void))(a1 + 2696)) != 0)
    return v1();
  else
    return 0x80000000;
}

uint64_t IOMobileFramebufferSetDroppable(uint64_t a1, char a2)
{
  uint64_t result;

  if (!a1)
    return 3758097090;
  result = 0;
  *(_BYTE *)(a1 + 869) = a2;
  return result;
}

uint64_t IOMobileFramebufferGetBrightnessControlInfo(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  result = 3758097090;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 3249))
    {
      result = 0;
      v4 = *(_OWORD *)(a1 + 3256);
      *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 3272);
      *(_OWORD *)a2 = v4;
    }
    else
    {
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOMobileFramebufferSetBrightnessControlCallback(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const void *v7;
  uint64_t v9;

  v3 = 3758097095;
  v9 = 0;
  if (a1[263])
  {
    if (a1[264])
    {
      pthread_once(&s_bc_once, iomfb_bc_load_lib);
      if (s_bc_9 == 1)
      {
        a1[410] = a2;
        a1[411] = a3;
        if (a2)
        {
          v7 = (const void *)a1[412];
          if (v7)
            CFRelease(v7);
          v3 = 0;
          a1[412] = s_bc_0(iomfb_bc_up, a1, &v9);
        }
        else
        {
          iomfb_bc_invalid((uint64_t)a1);
          return 0;
        }
      }
    }
  }
  return v3;
}

void iomfb_bc_load_lib()
{
  void *v0;
  void *v1;

  v0 = dlopen("/System/Library/PrivateFrameworks/BrightnessControl.framework/BrightnessControl", 2);
  s_bc_lib = (uint64_t)v0;
  if (v0)
  {
    s_bc_0 = dlsym(v0, "BCBrtControlNewMonitorForAllDisplaysWithHandler");
    s_bc_1 = dlsym((void *)s_bc_lib, "BCBrtControlGetContainerID");
    s_bc_2 = dlsym((void *)s_bc_lib, "BCBrtControlGetMinNits");
    s_bc_3 = dlsym((void *)s_bc_lib, "BCBrtControlGetMaxNits");
    s_bc_4 = dlsym((void *)s_bc_lib, "BCBrtControlGetCapabilities");
    s_bc_5 = dlsym((void *)s_bc_lib, "BCBrtControlGetIsValid");
    s_bc_6 = dlsym((void *)s_bc_lib, "BCBrtControlSetDisplayInvalidHandler");
    s_bc_7 = (uint64_t (*)(_QWORD, _QWORD, double))dlsym((void *)s_bc_lib, "BCBrtControlSetNits");
    v1 = dlsym((void *)s_bc_lib, "BCBrtControlSetDisplayService");
    s_bc_8 = v1;
    if (s_bc_0 && s_bc_1 && s_bc_2 && s_bc_3 && s_bc_4 && s_bc_5 && s_bc_6 && s_bc_7)
      s_bc_9 = 1;
    if (!v1)
  }
  else
  {
    syslog(3, "IOMFB: %s not found\n");
  }
}

void iomfb_bc_up(uint64_t a1, const void *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  BOOL v9;
  CFTypeID v10;
  char v11;
  int v12;
  const __CFBoolean *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t (*v16)(uint64_t, const __CFString *);
  const __CFUUID *v17;
  const __CFString *v18;
  const __CFString *v19;
  const void *v20;
  void (*v21)(uint64_t, uint64_t, _QWORD);
  const char *CStringPtr;
  int valuePtr;

  if (!a2)
    return;
  if (*(_DWORD *)(a1 + 1928) == 2)
    return;
  if (!s_bc_5(a2))
    return;
  v4 = (const __CFDictionary *)s_bc_4(a2);
  if (!v4)
    return;
  v5 = v4;
  Value = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("BuiltIn"));
  if (!Value)
    goto LABEL_13;
  v7 = Value;
  v8 = CFGetTypeID(Value);
  if (v8 == CFNumberGetTypeID())
  {
    valuePtr = 0;
    CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
    v9 = valuePtr == 0;
    goto LABEL_10;
  }
  v10 = CFGetTypeID(v7);
  if (v10 != CFBooleanGetTypeID())
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v9 = v7 == (const __CFNumber *)*MEMORY[0x1E0C9AE40];
LABEL_10:
  v11 = !v9;
LABEL_14:
  v12 = *(_DWORD *)(a1 + 1928);
  if (!v12)
  {
    if ((v11 & 1) != 0)
    {
      v14 = 0;
      v15 = 0;
      syslog(6, "matched IOMFB (%p) to BC (%p) for embedded panel");
      goto LABEL_33;
    }
LABEL_21:
    v16 = *(uint64_t (**)(uint64_t, const __CFString *))(a1 + 2008);
    if (v16)
      v15 = (const __CFString *)v16(a1, CFSTR("DisplayContainerID"));
    else
      v15 = 0;
    v17 = (const __CFUUID *)s_bc_1(a2);
    if (!v17)
    {
      v14 = 0;
      goto LABEL_42;
    }
    v18 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17);
    v14 = v18;
    if (!v15 || !v18)
    {
LABEL_42:
      if (!v15)
        goto LABEL_44;
      goto LABEL_43;
    }
    if (CFStringCompare(v15, v18, 0) == kCFCompareEqualTo
      || (v19 = (const __CFString *)CFDictionaryGetValue(v5, CFSTR("kUSBContainerID"))) != 0
      && CFStringCompare(v15, v19, 1uLL) == kCFCompareEqualTo)
    {
      if (!isServicingTwoExternalDisplay(*(_DWORD *)(a1 + 16)) || *(_DWORD *)(a1 + 1928))
      {
        syslog(6, "matched IOMFB (%p) to BC (%p) for external display");
        goto LABEL_33;
      }
      CStringPtr = CFStringGetCStringPtr(v15, 0x600u);
      syslog(6, "Warning: tried to match BC (%p) to IOMFB (%p) disp type (%d) with container ID (%s) - skip", a2, (const void *)a1, 0, CStringPtr);
    }
LABEL_43:
    CFRelease(v15);
LABEL_44:
    if (v14)
      CFRelease(v14);
    return;
  }
  if (v12 != 3)
    goto LABEL_21;
  v13 = (const __CFBoolean *)CFDictionaryGetValue(v5, CFSTR("DFR"));
  if (v13 && CFBooleanGetValue(v13))
  {
    v14 = 0;
    v15 = 0;
    syslog(6, "matched IOMFB (%p) to BC (%p) for DFR");
LABEL_33:
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
    v20 = *(const void **)(a1 + 3304);
    if (v20)
    {
      if (s_bc_8)
      {
        ((void (*)(void))s_bc_8)();
        v20 = *(const void **)(a1 + 3304);
      }
      CFRelease(v20);
    }
    *(_BYTE *)(a1 + 3249) = 1;
    *(_QWORD *)(a1 + 3304) = a2;
    CFRetain(a2);
    *(_DWORD *)(a1 + 3256) = 1;
    *(double *)(a1 + 3264) = s_bc_3(a2);
    *(double *)(a1 + 3272) = s_bc_2(a2);
    s_bc_6(a2, iomfb_bc_invalid, a1);
    if (s_bc_8)
      ((void (*)(const void *, _QWORD))s_bc_8)(a2, *(unsigned int *)(a1 + 16));
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 1856));
    v21 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 3280);
    if (v21)
      v21(a1, 1, *(_QWORD *)(a1 + 3288));
    goto LABEL_42;
  }
}

uint64_t iomfb_bc_invalid(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD);

  v2 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  *(_BYTE *)(a1 + 3249) = 0;
  v3 = *(const void **)(a1 + 3304);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(a1 + 3304) = 0;
  *(_QWORD *)(a1 + 3256) = 0;
  *(_QWORD *)(a1 + 3272) = 0;
  *(_QWORD *)(a1 + 3264) = 0;
  result = pthread_mutex_unlock(v2);
  v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3280);
  if (v5)
    return v5(a1, 0, *(_QWORD *)(a1 + 3288));
  return result;
}

uint64_t IOMobileFramebufferGetBrightnessControlCapabilities(uint64_t a1)
{
  uint64_t v2;

  pthread_once(&s_bc_once, iomfb_bc_load_lib);
  if (s_bc_9 == 1 && *(_BYTE *)(a1 + 3249) && (v2 = *(_QWORD *)(a1 + 3304)) != 0)
    return s_bc_4(v2);
  else
    return 0;
}

uint64_t IOMobileFramebufferScheduleWithDispatchQueue(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  pthread_mutex_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t NotificationPort;
  uint64_t v12;
  uint64_t v13;
  IONotificationPortRef *v14;
  IONotificationPort *v15;
  uint64_t v16;
  uint64_t MachPort;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  unint64_t v25;

  v6 = 3758097084;
  v7 = a2;
  InfoKeyInitialize(a1);
  v8 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v9 = a1 + (v7 << 6);
  if (!*(_QWORD *)(v9 + 1456) && !*(_QWORD *)(v9 + 1448))
  {
    v10 = a1 + (v7 << 6);
    if (!*(_QWORD *)(v10 + 1440) || !*(_QWORD *)(v10 + 1472))
    {
      if ((_DWORD)a2 == 3 && *(_DWORD *)(a1 + 3568) == 1)
      {
        NotificationPort = IODataQueueAllocateNotificationPort();
        v12 = a1 + (v7 << 6);
        *(_DWORD *)(v12 + 1464) = NotificationPort;
        if (!(_DWORD)NotificationPort)
        {
          syslog(3, "IODataQueueAllocateNotificationPort failed\n");
          v6 = 0;
          goto LABEL_14;
        }
        v13 = MEMORY[0x1B5E4BC74](*(unsigned int *)(a1 + 20), 3, NotificationPort, 0);
        if ((_DWORD)v13)
        {
          v6 = v13;
          syslog(3, "IOConnectSetNotificationPort failed, error: %d\n", v13);
          goto LABEL_14;
        }
        v21 = a1 + (v7 << 6);
        *(_QWORD *)(v21 + 1472) = 0;
        v24 = 0xAAAAAAAAAAAAAAAALL;
        v25 = 0xAAAAAAAAAAAAAAAALL;
        v22 = MEMORY[0x1B5E4BC68](*(unsigned int *)(a1 + 20), 3, *MEMORY[0x1E0C83DA0], &v25, &v24, 1);
        if ((_DWORD)v22)
        {
          v6 = v22;
          syslog(3, "IOConnectMapMemory failed, error: %d\n", v22);
          goto LABEL_14;
        }
        *(_QWORD *)(v21 + 1472) = v25;
        v23 = dispatch_source_create(MEMORY[0x1E0C80D98], *(unsigned int *)(v12 + 1464), 0, a3);
        dispatch_set_context(v23, (void *)a1);
        dispatch_source_set_event_handler_f(v23, (dispatch_function_t)FrameInfoNotifyFuncIOShqDispatchQueue);
        dispatch_source_set_cancel_handler_f(v23, (dispatch_function_t)DispatchQueueCancelHandler);
        dispatch_resume(v23);
      }
      else
      {
        v14 = (IONotificationPortRef *)(v10 + 1440);
        v15 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
        *v14 = v15;
        LODWORD(v25) = notificationLimit[v7];
        v16 = *MEMORY[0x1E0C83DA0];
        MachPort = IONotificationPortGetMachPort(v15);
        if (MEMORY[0x1B5E4BF08](v16, MachPort, 1, &v25, 1))
          syslog(5, "couldn't set mach port limit\n");
        v18 = *(unsigned int *)(a1 + 20);
        v19 = IONotificationPortGetMachPort(*v14);
        MEMORY[0x1B5E4BC74](v18, a2, v19, 0);
        IONotificationPortSetDispatchQueue(*v14, a3);
      }
    }
    v6 = 0;
    *(_QWORD *)(v9 + 1456) = a3;
  }
LABEL_14:
  pthread_mutex_unlock(v8);
  return v6;
}

uint64_t InfoKeyInitialize(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  int v3;
  int v4;
  BOOL v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  char __s1[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(result + 1824))
  {
    v1 = result;
    if (*(_QWORD *)(result + 2664))
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 1856));
      while (!*(_BYTE *)(v1 + 1824))
      {
        *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v14 = v2;
        v15 = v2;
        *(_OWORD *)__s1 = v2;
        v13 = v2;
        v10 = 0;
        v11 = -1431655766;
        *(_BYTE *)(v1 + 1824) = 1;
        v3 = (*(uint64_t (**)(uint64_t, _QWORD, int *, char *, int *))(v1 + 2664))(v1, 0, &v11, __s1, &v10);
        v4 = v11;
        if (v3)
          v5 = 1;
        else
          v5 = v11 == 0;
        if (v5)
          break;
        *(_DWORD *)(v1 + 1828) = v11;
        v6 = malloc_type_calloc((v4 + 1), 8uLL, 0x50040EE9192B6uLL);
        *(_QWORD *)(v1 + 1816) = v6;
        *v6 = strndup(__s1, 0x40uLL);
        *(_DWORD *)(v1 + 3568) = v10;
        if (*(_DWORD *)(v1 + 1828) >= 2u)
        {
          v7 = 1;
          while (1)
          {
            v8 = (*(unsigned int (**)(uint64_t, uint64_t, int *, char *, int *))(v1 + 2664))(v1, v7, &v11, __s1, &v10)? 0: strndup(__s1, 0x40uLL);
            *(_QWORD *)(*(_QWORD *)(v1 + 1816) + 8 * v7) = v8;
            if (!*(_QWORD *)(*(_QWORD *)(v1 + 1816) + 8 * v7))
              break;
            if (++v7 >= (unint64_t)*(unsigned int *)(v1 + 1828))
              goto LABEL_19;
          }
          v9 = 0;
          do
            free(*(void **)(*(_QWORD *)(v1 + 1816) + 8 * v9++));
          while (v7 != v9);
          free(*(void **)(v1 + 1816));
          *(_DWORD *)(v1 + 1828) = 0;
        }
LABEL_19:
        ;
      }
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 1856));
    }
  }
  return result;
}

void FrameInfoNotifyFuncIOShqDispatchQueue(uintptr_t a1)
{
  IODataQueueMemory *v2;
  IODataQueueEntry *v3;
  IODataQueueEntry *v4;
  unsigned int v5;
  uint32_t dataSize;

  dataSize = 0;
  v2 = *(IODataQueueMemory **)(a1 + 1664);
  if (v2)
  {
    v3 = IODataQueuePeek(v2);
    if (v3)
    {
      v4 = v3;
      v5 = 1;
      do
      {
        memcpy((void *)(a1 + 3312), v4->data, v4->size);
        PackAndDispatchFrameInfoNotifictionData(a1, v5);
        IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 1664), 0, &dataSize);
        v4 = IODataQueuePeek(*(IODataQueueMemory **)(a1 + 1664));
        ++v5;
      }
      while (v4);
    }
  }
  else
  {
    syslog(3, "FrameInfoNotifyFuncIOShqDispatchQueue IO Data Queue not available");
  }
}

uint64_t DispatchQueueCancelHandler(uint64_t result)
{
  uint64_t v1;
  ipc_space_t *v2;
  mach_port_name_t v3;

  v1 = result;
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (*(_QWORD *)(result + 1664))
  {
    result = MEMORY[0x1B5E4BC80](*(unsigned int *)(result + 20), 3, *MEMORY[0x1E0C83DA0]);
    *(_QWORD *)(v1 + 1664) = 0;
  }
  v3 = *(_DWORD *)(v1 + 1656);
  if (v3)
  {
    result = mach_port_mod_refs(*v2, v3, 1u, -1);
    *(_DWORD *)(v1 + 1656) = 0;
  }
  return result;
}

uint64_t IOMobileFramebufferUnscheduleFromDispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  pthread_mutex_t *v8;
  uint64_t v9;
  IONotificationPort *v10;
  uint64_t v11;
  ipc_space_t *v12;
  mach_port_name_t v13;

  v6 = 3758097084;
  v7 = a2;
  v8 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v9 = a1 + (v7 << 6);
  v10 = *(IONotificationPort **)(v9 + 1440);
  if (v10 && *(_QWORD *)(v9 + 1456) == a3)
  {
    IONotificationPortSetDispatchQueue(v10, 0);
    v11 = a1 + (v7 << 6);
    v12 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    if (*(_QWORD *)(v11 + 1472))
    {
      MEMORY[0x1B5E4BC80](*(unsigned int *)(a1 + 20), a2, *MEMORY[0x1E0C83DA0]);
      *(_QWORD *)(v11 + 1472) = 0;
    }
    v13 = *(_DWORD *)(v11 + 1464);
    if (v13)
    {
      mach_port_mod_refs(*v12, v13, 1u, -1);
      *(_DWORD *)(v11 + 1464) = 0;
    }
    v6 = 0;
    *(_QWORD *)(v9 + 1456) = 0;
  }
  pthread_mutex_unlock(v8);
  return v6;
}

uint64_t IOMobileFramebufferSupportedFrameInfo(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 2664))
    return 0;
  InfoKeyInitialize(a1);
  return *(_QWORD *)(a1 + 1816);
}

uint64_t IOMobileFramebufferFrameInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  uint64_t result;
  uint64_t (*v13)(uint64_t, uint64_t);

  if (a2 && a4)
  {
    result = 3758097090;
    if (a1)
    {
      if (*(_QWORD *)(a1 + 2272))
      {
        if (*(_QWORD *)(a1 + 2656))
        {
          if (*(_QWORD *)(a1 + 2664))
          {
            InfoKeyInitialize(a1);
            *(_DWORD *)(a1 + 1832) = 0;
            result = figure_frame_info_mask(a1, 1, &a9);
            if (!(_DWORD)result)
            {
              result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2272))(a1, 3, a2, a3);
              if (!(_DWORD)result)
                return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 2656))(a1, *(unsigned int *)(a1 + 1832));
            }
          }
        }
      }
    }
  }
  else
  {
    result = 3758097090;
    if (a1)
    {
      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2280);
      if (v13)
        return v13(a1, 3);
    }
  }
  return result;
}

uint64_t figure_frame_info_mask(uint64_t a1, int a2, const char **a3)
{
  const char *v5;
  int v6;
  const char **v7;
  const char *v8;
  uint64_t v9;
  const char **v10;
  uint64_t result;
  int v12;
  const char **v13;

  v13 = a3 + 1;
  v5 = *a3;
  if (*a3)
  {
    v6 = 0;
    v7 = *(const char ***)(a1 + 1816);
    while (v7)
    {
      v8 = *v7;
      if (!*v7)
        break;
      v9 = 0;
      while (strncmp(v8, v5, 0x40uLL))
      {
        v8 = v7[++v9];
        if (!v8)
          return 3758097090;
      }
      v6 |= 1 << v9;
      v10 = v13++;
      v5 = *v10;
      if (!*v10)
        goto LABEL_13;
    }
    return 3758097090;
  }
  else
  {
    v6 = 0;
LABEL_13:
    result = 0;
    if (a2)
      v12 = *(_DWORD *)(a1 + 1832) | v6;
    else
      v12 = *(_DWORD *)(a1 + 1832) & ~v6;
    *(_DWORD *)(a1 + 1832) = v12;
  }
  return result;
}

uint64_t IOMobileFramebufferChangeFrameInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  uint64_t result;
  uint64_t (*v12)(uint64_t, _QWORD);

  result = 3758097090;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 2656))
    {
      if (*(_QWORD *)(a1 + 2664))
      {
        InfoKeyInitialize(a1);
        result = figure_frame_info_mask(a1, a2 != 0, &a9);
        v12 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2656);
        if (v12)
        {
          if (!(_DWORD)result)
            return v12(a1, *(unsigned int *)(a1 + 1832));
        }
      }
    }
  }
  return result;
}

uint64_t IOMobileFramebufferGetTypeID()
{
  uint64_t result;

  result = kIOMobileFramebufferID;
  if (!kIOMobileFramebufferID)
  {
    pthread_once(&IOMobileFramebufferGetTypeID_once, (void (*)(void))ioMobileFramebufferClassInitialize);
    return kIOMobileFramebufferID;
  }
  return result;
}

uint64_t ioMobileFramebufferClassInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOMobileFramebufferID = result;
  return result;
}

uint64_t benchmark_SwapDebugInfo()
{
  return 3758097095;
}

uint64_t benchmark_SwapSetLayer()
{
  return 0;
}

uint64_t benchmark_SwapSetEventWait()
{
  return 0;
}

uint64_t benchmark_SwapSetEventSignalOnGlass()
{
  return 0;
}

uint64_t benchmark_SwapSetEventSignal()
{
  return 0;
}

uint64_t benchmark_SwapSubtitleRegion()
{
  return 0;
}

uint64_t benchmark_SwapSetParams()
{
  return 0;
}

uint64_t benchmark_SwapSetBrightness()
{
  return 0;
}

uint64_t benchmark_SwapSetIndicatorBrightness()
{
  return 0;
}

uint64_t benchmark_SwapSetSecureAnimation()
{
  return 0;
}

uint64_t benchmark_SwapSetBrightnessLimit()
{
  return 0;
}

uint64_t benchmark_SwapSetDisplayEdr()
{
  return 0;
}

uint64_t benchmark_SwapBegin(uint64_t a1, int *a2)
{
  int v4;
  unsigned int *v5;

  bzero((void *)(a1 + 24), 0x508uLL);
  v4 = benchmark_SwapBegin_s_swapid++;
  *(_DWORD *)(a1 + 176) = v4;
  if (a2)
    *a2 = v4;
  v5 = *(unsigned int **)(a1 + 3192);
  if (v5)
  {
    IOMFBGainMapRelease(a1, v5);
    *(_QWORD *)(a1 + 3192) = 0;
  }
  return 0;
}

uint64_t benchmark_SwapEnd(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *global_queue;
  _QWORD v7[7];
  int v8;

  v2 = *(_DWORD *)(a1 + 176);
  v3 = *(_QWORD *)(a1 + 1680);
  v4 = *(_QWORD *)(a1 + 1624);
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __benchmark_SwapEnd_block_invoke;
  v7[3] = &__block_descriptor_tmp;
  v7[4] = v3;
  v7[5] = a1;
  v8 = v2;
  v7[6] = v4;
  dispatch_async(global_queue, v7);
  return 0;
}

uint64_t benchmark_SwapSetColorMatrix()
{
  return 0;
}

uint64_t benchmark_SwapSignal()
{
  return 0;
}

uint64_t benchmark_SwapWait()
{
  return 0;
}

uint64_t benchmark_SwapWaitWithTimeout()
{
  return 0;
}

uint64_t benchmark_SwapCancel()
{
  return 0;
}

uint64_t benchmark_SwapCancelAll()
{
  return 0;
}

uint64_t benchmark_SetIdleBuffer()
{
  return 0;
}

uint64_t benchmark_SetIdleBufferEvent()
{
  return 0;
}

uint64_t benchmark_EnableNotifications(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = a1 + ((unint64_t)a2 << 6);
  *(_QWORD *)(v4 + 1488) = a3;
  *(_QWORD *)(v4 + 1432) = a4;
  return 0;
}

uint64_t benchmark_DisableNotifications(uint64_t a1, unsigned int a2)
{
  _OWORD *v2;

  v2 = (_OWORD *)(a1 + ((unint64_t)a2 << 6) + 1432);
  v2[2] = 0u;
  v2[3] = 0u;
  *v2 = 0u;
  v2[1] = 0u;
  return 0;
}

uint64_t benchmark_ChangeFrameInfo()
{
  return 0;
}

uint64_t benchmark_SupportedFrameInfo(int a1, unsigned int a2, unsigned int *a3, char *__dst, _DWORD *a5)
{
  *a3 = 5;
  *a5 = 0;
  if (*a3 <= a2)
    return 3758097090;
  strncpy(__dst, benchmark_SupportedFrameInfo_names[a2], 0x40uLL);
  return 0;
}

uint64_t kern_SwapDebugInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 88) = a2;
  *(_QWORD *)(a1 + 96) = a3;
  return 0;
}

uint64_t kern_SwapSetEventWait(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 24 + 4 * a2 + 680) = MEMORY[0x1B5E4BDF4](a3);
  *(_QWORD *)(a1 + 24 + 8 * a2 + 80) = a4;
  return 0;
}

uint64_t kern_SwapSetEventSignalOnGlass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 720) = MEMORY[0x1B5E4BDF4](a2);
  *(_QWORD *)(a1 + 136) = a3;
  return 0;
}

uint64_t kern_SwapSetEventSignal(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 24 + 4 * a2 + 700) = MEMORY[0x1B5E4BDF4](a3);
  *(_QWORD *)(a1 + 24 + 8 * a2 + 120) = a4;
  return 0;
}

uint64_t kern_SwapSubtitleRegion(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = 0;
  while (1)
  {
    v7 = a1 + v6;
    if (!*(_BYTE *)(a1 + v6 + 761))
      break;
    v6 += 21;
    if (v6 == 105)
    {
      syslog(3, "%s no more available region!\n", "kern_SwapSubtitleRegion");
      return 3758097090;
    }
  }
  result = 0;
  *(_DWORD *)(v7 + 757) = a2;
  *(_BYTE *)(v7 + 761) = 1;
  *(_DWORD *)(v7 + 741) = a3;
  *(_DWORD *)(v7 + 745) = a4;
  *(_DWORD *)(v7 + 749) = a5;
  *(_DWORD *)(v7 + 753) = a6;
  return result;
}

uint64_t kern_SwapSetParams(uint64_t a1, uint64_t *a2, unint64_t a3, int a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v8 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  switch(a4)
  {
    case 0:
      if (a2 && a3 != 524)
        goto LABEL_10;
      v9 = 0;
      *(_BYTE *)(a1 + 870) = 1;
      *(_QWORD *)(a1 + 80) = a2;
      break;
    case 1:
      v9 = 3758097090;
      if (a2 && a3 <= 0xC)
      {
        v9 = 0;
        *(_BYTE *)(a1 + 924) = 1;
        v10 = *a2;
        *(_DWORD *)(a1 + 933) = *((_DWORD *)a2 + 2);
        *(_QWORD *)(a1 + 925) = v10;
      }
      break;
    case 2:
      if (!a2 || a3 == 73)
      {
        v9 = 0;
        *(_BYTE *)(a1 + 937) = 1;
        *(_OWORD *)(a1 + 938) = *(_OWORD *)a2;
        v11 = *((_OWORD *)a2 + 1);
        v12 = *((_OWORD *)a2 + 2);
        v13 = *((_OWORD *)a2 + 3);
        *(_OWORD *)(a1 + 995) = *(_OWORD *)((char *)a2 + 57);
        *(_OWORD *)(a1 + 970) = v12;
        *(_OWORD *)(a1 + 986) = v13;
        *(_OWORD *)(a1 + 954) = v11;
      }
      else
      {
LABEL_10:
        v9 = 3758097090;
      }
      break;
    case 3:
      v9 = 0;
      *(_BYTE *)(a1 + 1311) = 1;
      break;
    default:
      v9 = 0;
      break;
  }
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t kern_SwapSetIndicatorBrightness(uint64_t a1, int a2, double a3)
{
  pthread_mutex_t *v6;
  double v7;

  v6 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3249))
  {
    *(_BYTE *)(a1 + 878) = 1;
    *(_BYTE *)(a1 + 877) = a2;
    v7 = 0.0;
    if (a2)
      v7 = a3;
    *(double *)(a1 + 892) = v7;
  }
  else
  {
    syslog(5, "SwapSetIndicatorBrightness: Brightness control is not enabled\n");
  }
  pthread_mutex_unlock(v6);
  return 0;
}

uint64_t kern_SwapSetSecureAnimation(pthread_mutex_t *a1, char a2)
{
  pthread_mutex_t *v4;

  v4 = a1 + 29;
  pthread_mutex_lock(a1 + 29);
  a1[13].__opaque[39] = a2;
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetDisplayEdr(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3249))
  {
    *(_BYTE *)(a1 + 881) = 1;
    *(double *)(a1 + 908) = a2;
  }
  else
  {
    syslog(5, "SwapSetDisplayEdr: Brightness control is not enabled\n");
  }
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetDisplayEdrHeadroom(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3249))
  {
    *(_BYTE *)(a1 + 883) = 1;
    *(double *)(a1 + 1011) = a2;
  }
  else
  {
    syslog(5, "SwapSetDisplayEdrHeadroom: Brightness control is not enabled\n");
  }
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t kern_SwapSetUserLuminanceAdjustment(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (a2 == 0.0)
  {
    v5 = 3758097090;
  }
  else if (*(_BYTE *)(a1 + 3249))
  {
    v5 = 0;
    *(_BYTE *)(a1 + 882) = 1;
    *(double *)(a1 + 916) = a2;
  }
  else
  {
    syslog(5, "SwapSetUserLuminanceAdjustmen: Brightness control is not enabled\n");
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t kern_SwapSetColorMatrix(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __int128 v4;
  uint64_t i;
  float *v6;
  char *v7;
  uint64_t j;
  _OWORD v10[2];
  _OWORD v11[6];
  int v12;
  int v13;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[4] = v4;
  v11[5] = v4;
  v11[2] = v4;
  v11[3] = v4;
  v11[0] = v4;
  v11[1] = v4;
  v10[0] = v4;
  v10[1] = v4;
  *(_BYTE *)(a1 + 847) = 1;
  LOBYTE(v10[0]) = a2 == 0;
  v12 = a3;
  v13 = a4;
  if (a2)
  {
    for (i = 0; i != 3; ++i)
    {
      v6 = (float *)(a2 + 4 * i);
      v7 = (char *)v10 + 8 * i;
      *((_QWORD *)v7 + 1) = vcvts_n_s32_f32(*v6, 0x20uLL);
      *((_QWORD *)v7 + 13) = vcvts_n_s32_f32(v6[12], 0x20uLL);
    }
    for (j = 0; j != 9; ++j)
      *((_QWORD *)v11 + j) = vcvts_n_s32_f32(*(float *)(a2 + 12 + 4 * j), 0x20uLL);
  }
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x45u, v10, 0x88uLL, 0, 0);
}

uint64_t kern_SwapSignal(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x14u, input, 2u, 0, 0);
}

uint64_t kern_SwapWaitWithTimeout(uint64_t a1, unsigned int a2, unsigned int a3, double a4)
{
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  input[2] = (unint64_t)(a4 * 1000.0);
  input[3] = 0xAAAAAAAAAAAAAAAALL;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 6u, input, 3u, 0, 0);
}

uint64_t kern_SwapCancel(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x34u, v3, 1u, 0, 0);
}

uint64_t kern_SwapCancelAll(uint64_t a1)
{
  unint64_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(void))(a1 + 2712))();
  input[0] = HIDWORD(v2);
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x51u, input, 2u, 0, 0);
}

uint64_t kern_SetIdleBufferEvent(uint64_t a1, __IOSurface *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t (*v10)(uint64_t);

  result = setIdleBuffer(a1, a2);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 704) = MEMORY[0x1B5E4BDF4](a3);
    *(_DWORD *)(a1 + 724) = MEMORY[0x1B5E4BDF4](a3);
    *(_QWORD *)(a1 + 104) = a4;
    *(_QWORD *)(a1 + 144) = a5;
    v10 = *(uint64_t (**)(uint64_t))(a1 + 2184);
    if (v10)
      return v10(a1);
    else
      return 3758097090;
  }
  return result;
}

uint64_t kern_EnableNotifications(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = (uint64_t)NotifyCallbackFuncs[a2];
  input[1] = a1;
  input[2] = a2;
  input[3] = 0;
  v4 = a1 + ((unint64_t)a2 << 6);
  *(_QWORD *)(v4 + 1488) = a3;
  *(_QWORD *)(v4 + 1432) = a4;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x48u, input, 4u, 0, 0);
}

uint64_t kern_DisableNotifications(uint64_t a1, unsigned int a2)
{
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 0u;
  v3[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x48u, (const uint64_t *)v3, 4u, 0, 0);
}

uint64_t kern_ChangeFrameInfo(uint64_t a1, unsigned int a2)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = 3;
  input[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x49u, input, 2u, 0, 0);
}

uint64_t kern_SupportedFrameInfo(uint64_t a1, unsigned int a2, _DWORD *a3, void *outputStruct, _DWORD *a5)
{
  uint64_t result;
  int v8;
  uint32_t outputCnt;
  size_t v10;
  uint64_t output;
  unint64_t v12;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  v10 = 64;
  outputCnt = 2;
  output = 0xAAAAAAAAAAAAAAAALL;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x4Au, input, 1u, 0, 0, &output, &outputCnt, outputStruct, &v10);
  v8 = v12;
  *a3 = output;
  *a5 = v8;
  return result;
}

uint64_t kern_SetColorRemapMode(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x33u, v3, 1u, 0, 0);
}

uint64_t kern_SwapSetBlit(uint64_t a1, IOSurfaceRef buffer, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  _DWORD *v10;
  unsigned int v11;
  uint64_t v12;
  double v16;
  BOOL v17;
  IOSurfaceID ID;
  IOSurfaceID *v25;

  v10 = (_DWORD *)(a1 + 1087);
  v11 = *(_DWORD *)(a1 + 1087);
  v12 = 3758097090;
  if (v11 < 6)
  {
    if (buffer)
    {
      v16 = fabs(a4);
      v17 = fabs(a3) == INFINITY || v16 == INFINITY;
      if (!v17 && a5 != 0.0 && a6 != 0.0 && fabs(a7) != INFINITY && fabs(a8) != INFINITY && a9 != 0.0 && a10 != 0.0)
      {
        ID = IOSurfaceGetID(buffer);
        v12 = 0;
        v25 = (IOSurfaceID *)(a1 + 36 * v11 + 1091);
        *v25 = ID;
        v25[1] = (int)a3;
        v25[2] = (int)a4;
        v25[3] = (int)a5;
        v25[4] = (int)a6;
        v25[5] = (int)a7;
        v25[6] = (int)a8;
        v25[7] = (int)a9;
        v25[8] = (int)a10;
        ++*v10;
      }
    }
  }
  else
  {
    syslog(3, "%s - exceeded max number of blits: %d\n", "IOReturn kern_SwapSetBlit(IOMobileFramebufferRef, IOSurfaceRef, CGRect, CGRect, uint32_t)", 6);
  }
  return v12;
}

uint64_t iomfb_SwapSetTimestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return iomfb_SwapSetTimestamps(a1, &iomfb_SwapSetTimestamp_type, &v3, 1);
}

uint64_t iomfb_AnnounceNextSwapTimestamp(uint64_t a1)
{
  uint64_t input;

  input = (*(uint64_t (**)(void))(a1 + 2712))();
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x57u, &input, 1u, 0, 0);
}

uint64_t kern_GetLayerDefaultSurface(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v3;
  pthread_mutex_t *v6;
  uint64_t v7;
  __int128 v8;
  mach_port_name_t v10;
  uint32_t v11;
  io_connect_t connect;
  uint64_t output;
  uint64_t input[3];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  input[0] = 0xAAAAAAAAAAAAAAAALL;
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  v11 = 1;
  if (!a2)
  {
    connect = -1431655766;
    output = 0xAAAAAAAAAAAAAAAALL;
    v6 = (pthread_mutex_t *)(a1 + 1856);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
    if (!*(_QWORD *)(a1 + 1312))
    {
      v7 = *(_QWORD *)(a1 + 1420);
      *(_QWORD *)&v8 = v7;
      *((_QWORD *)&v8 + 1) = HIDWORD(v7);
      *(_OWORD *)input = v8;
      v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 3u, input, 2u, &output, &v11);
      if ((_DWORD)v3)
        goto LABEL_6;
      v10 = output;
      connect = output;
      if (!(_DWORD)output)
      {
        v3 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x1E0C83DA0], 3u, &connect);
        if (!(_DWORD)v3)
        {
          *(_QWORD *)(a1 + 1312) = IOSurfaceLookupFromMachPort(connect);
          IOServiceClose(connect);
        }
        goto LABEL_6;
      }
      *(_QWORD *)(a1 + 1312) = IOSurfaceLookupFromMachPort(output);
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v10);
    }
    v3 = 0;
LABEL_6:
    *a3 = *(_QWORD *)(a1 + 1312);
    pthread_mutex_unlock(v6);
    return v3;
  }
  return 3758097084;
}

uint64_t kern_CopyLayerDisplayedSurface(uint64_t a1, unsigned int a2, IOSurfaceRef *a3)
{
  uint64_t v3;
  pthread_mutex_t *v7;
  mach_port_name_t v8;
  IOSurfaceRef v9;
  uint64_t input;
  uint32_t outputCnt;
  uint64_t output;

  v3 = 3758097090;
  if (a2 <= 3 && a1 && a3)
  {
    output = 0xAAAAAAAAAAAAAAAALL;
    v7 = (pthread_mutex_t *)(a1 + 1856);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
    outputCnt = 1;
    input = a2;
    v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x53u, &input, 1u, &output, &outputCnt);
    if (!(_DWORD)v3)
    {
      v8 = output;
      v9 = IOSurfaceLookupFromMachPort(output);
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v8);
      *a3 = v9;
    }
    pthread_mutex_unlock(v7);
  }
  return v3;
}

uint64_t kern_GetID(uint64_t a1, _DWORD *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output;

  outputCnt = 1;
  if (!a2)
    return 3758097090;
  output = 0xAAAAAAAAAAAAAAAALL;
  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_DWORD *)(a1 + 1920))
  {
    v5 = 0;
  }
  else
  {
    v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 7u, 0, 0, &output, &outputCnt);
    if (!(_DWORD)v5)
      *(_DWORD *)(a1 + 1920) = output;
  }
  pthread_mutex_unlock(v4);
  *a2 = *(_DWORD *)(a1 + 1920);
  return v5;
}

uint64_t kern_SurfaceIsReplaceable(uint64_t a1, IOSurfaceRef buffer, uint64_t a3, BOOL *a4)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;

  output = 0;
  input = IOSurfaceGetID(buffer);
  outputCnt = 1;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x31u, &input, 1u, &output, &outputCnt);
  *a4 = output != 0;
  return result;
}

uint64_t kern_GetRunLoopSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  pthread_mutex_t *v5;
  uint64_t v6;
  uint64_t NotificationPort;
  uint64_t v8;
  IONotificationPort *v9;
  IONotificationPortRef *v10;
  uint64_t v11;
  uint64_t MachPort;
  uint64_t v13;
  uint64_t v14;
  CFRunLoopSourceRef RunLoopSource;
  uint64_t v16;
  const __CFAllocator *v18;
  __CFMachPort *v19;
  unint64_t v20;
  unint64_t v21;
  Boolean shouldFreeInfo;
  CFMachPortContext context;

  v4 = a2;
  shouldFreeInfo = -86;
  memset(&context, 0, sizeof(context));
  InfoKeyInitialize(a1);
  v5 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v6 = a1 + (v4 << 6);
  if (!*(_QWORD *)(v6 + 1456) && !*(_QWORD *)(v6 + 1448))
  {
    if ((_DWORD)a2 == 3 && *(_DWORD *)(a1 + 3568) == 1)
    {
      NotificationPort = IODataQueueAllocateNotificationPort();
      v8 = a1 + (v4 << 6);
      *(_DWORD *)(v8 + 1464) = NotificationPort;
      if (!(_DWORD)NotificationPort)
      {
        syslog(3, "IODataQueueAllocateNotificationPort failed\n");
        goto LABEL_15;
      }
      if (MEMORY[0x1B5E4BC74](*(unsigned int *)(a1 + 20), 3, NotificationPort, 0))
      {
        syslog(3, "IOConnectSetNotificationPort failed, error: %d\n");
        goto LABEL_15;
      }
      v16 = a1 + (v4 << 6);
      *(_QWORD *)(v16 + 1472) = 0;
      v20 = 0xAAAAAAAAAAAAAAAALL;
      v21 = 0xAAAAAAAAAAAAAAAALL;
      if (MEMORY[0x1B5E4BC68](*(unsigned int *)(a1 + 20), 3, *MEMORY[0x1E0C83DA0], &v21, &v20, 1))
      {
        syslog(3, "IOConnectMapMemory failed, error: %d\n");
        goto LABEL_15;
      }
      *(_QWORD *)(v16 + 1472) = v21;
      context.info = (void *)a1;
      v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v19 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(_DWORD *)(v8 + 1464), (CFMachPortCallBack)FrameInfoNotifyFuncIOShq, &context, &shouldFreeInfo);
      *(_QWORD *)(v16 + 1480) = v19;
      RunLoopSource = CFMachPortCreateRunLoopSource(v18, v19, 0);
    }
    else
    {
      v9 = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
      v10 = (IONotificationPortRef *)(a1 + (v4 << 6) + 1440);
      *v10 = v9;
      LODWORD(v21) = notificationLimit[v4];
      v11 = *MEMORY[0x1E0C83DA0];
      MachPort = IONotificationPortGetMachPort(v9);
      if (MEMORY[0x1B5E4BF08](v11, MachPort, 1, &v21, 1))
        syslog(5, "couldn't set mach port limit\n");
      v13 = *(unsigned int *)(a1 + 20);
      v14 = IONotificationPortGetMachPort(*v10);
      MEMORY[0x1B5E4BC74](v13, a2, v14, 0);
      RunLoopSource = IONotificationPortGetRunLoopSource(*v10);
    }
    *(_QWORD *)(v6 + 1448) = RunLoopSource;
  }
LABEL_15:
  pthread_mutex_unlock(v5);
  return *(_QWORD *)(v6 + 1448);
}

uint64_t kern_SetTVOutMode(uint64_t a1, unsigned int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (!*(_BYTE *)(a1 + 1360))
    *(_OWORD *)(a1 + 1344) = 0u;
  v7[0] = a2;
  v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xAu, v7, 1u, 0, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t kern_SetTVOutSignalType(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x10u, v3, 1u, 0, 0);
}

uint64_t kern_SetWSSInfo(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xBu, input, 2u, 0, 0);
}

uint64_t kern_RequestPowerChange(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  if (!a2
    && core_analytics_send_data(a1, 3, (uint64_t)"com.apple.TritiumVSHCompensation.CumulativeOnTime"))
  {
    v4 = 3;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640))(a1, 17, 1, &v4);
  }
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xCu, input, 1u, 0, 0);
}

uint64_t kern_SetWhiteOnBlackMode(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x13u, v3, 1u, 0, 0);
}

uint64_t kern_GetColorRemapMode(uint64_t a1, int *a2)
{
  uint64_t result;
  int v4;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  if (!a2)
    return 3758097090;
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x39u, 0, 0, output, &outputCnt);
  v4 = output[0];
  if ((_DWORD)result)
    v4 = 6;
  *a2 = v4;
  return result;
}

uint64_t kern_EnableStatistics(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xDu, v3, 1u, 0, 0);
}

uint64_t kern_SetDebugFlags(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xFu, input, 2u, &output, &outputCnt);
  if (a4)
    *a4 = output;
  return result;
}

uint64_t kern_SetFlags(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xEu, input, 2u, &output, &outputCnt);
  if (a4)
    *a4 = output;
  return result;
}

uint64_t kern_SetGammaTable(uint64_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x11u, inputStruct, 0xC0CuLL, 0, 0);
}

uint64_t kern_SetContrast(uint64_t a1, float a2)
{
  float inputStruct;

  inputStruct = a2;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x54u, &inputStruct, 4uLL, 0, 0);
}

uint64_t kern_GetGammaTable(uint64_t a1, void *a2)
{
  uint64_t v2;
  pthread_mutex_t *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  size_t outputStructCnt;

  v2 = 3758097085;
  if (a2)
  {
    v5 = (pthread_mutex_t *)(a1 + 1856);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
    v6 = *(void **)(a1 + 1936);
    if (v6)
    {
LABEL_3:
      memcpy(a2, v6, 0xC0CuLL);
      v2 = 0;
LABEL_16:
      pthread_mutex_unlock(v5);
      return v2;
    }
    v7 = malloc_type_malloc(0xC0CuLL, 0x100004026944624uLL);
    *(_QWORD *)(a1 + 1936) = v7;
    if (v7)
    {
      outputStructCnt = 3084;
      v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x1Bu, 0, 0, v7, &outputStructCnt);
      v9 = -536870199;
      if (outputStructCnt == 3084)
        v9 = 0;
      if (v8)
        v2 = v8;
      else
        v2 = v9;
      v6 = *(void **)(a1 + 1936);
      if (!v8 && outputStructCnt == 3084)
        goto LABEL_3;
    }
    else
    {
      v6 = 0;
    }
    free(v6);
    *(_QWORD *)(a1 + 1936) = 0;
    goto LABEL_16;
  }
  return 3758097090;
}

uint64_t kern_SetDisplayDevice(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  pthread_mutex_t *v5;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a2 > 4)
    return 3758097090;
  v5 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (!*(_BYTE *)(a1 + 1360))
    *(_OWORD *)(a1 + 1344) = 0u;
  v7[0] = a2;
  v2 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x16u, v7, 1u, 0, 0);
  pthread_mutex_unlock(v5);
  return v2;
}

uint64_t kern_SetDigitalOutMode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v6 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (!*(_BYTE *)(a1 + 1360))
    *(_OWORD *)(a1 + 1344) = 0u;
  input[0] = a2;
  input[1] = a3;
  v7 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x17u, input, 2u, 0, 0);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t kern_GetDigitalOutState(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x19u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
    *a2 = output;
  return result;
}

uint64_t kern_GetSupportedDigitalOutModes(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  const void *v6;
  uint64_t v7;
  io_registry_entry_t v8;
  const __CFAllocator *v9;
  CFMutableDictionaryRef Mutable;
  CFTypeRef CFProperty;
  const void *v12;
  CFTypeID v13;
  CFTypeID TypeID;
  void *v15;
  CFTypeRef v16;
  const void *v17;
  CFTypeID v18;
  CFTypeID v19;
  __CFDictionary *v20;
  const void *v21;

  *a2 = 0;
  *a3 = 0;
  v6 = *(const void **)(a1 + 1944);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 1944) = 0;
  }
  v7 = 3758097084;
  v8 = *(_DWORD *)(a1 + 16);
  if (!v8)
    return 3758097090;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  *(_QWORD *)(a1 + 1944) = Mutable;
  if (Mutable)
  {
    CFProperty = IORegistryEntryCreateCFProperty(v8, CFSTR("ColorElements"), v9, 0);
    if (CFProperty)
    {
      v12 = CFProperty;
      v13 = CFGetTypeID(CFProperty);
      TypeID = CFArrayGetTypeID();
      v15 = *(void **)(a1 + 1944);
      if (v13 != TypeID)
      {
        CFRelease(v15);
        *(_QWORD *)(a1 + 1944) = 0;
        v21 = v12;
        goto LABEL_14;
      }
      CFDictionarySetValue((CFMutableDictionaryRef)v15, CFSTR("ColorElements"), v12);
      *a2 = v12;
      CFRelease(v12);
      v16 = IORegistryEntryCreateCFProperty(v8, CFSTR("TimingElements"), v9, 0);
      if (v16)
      {
        v17 = v16;
        v18 = CFGetTypeID(v16);
        v19 = CFArrayGetTypeID();
        v20 = *(__CFDictionary **)(a1 + 1944);
        if (v18 == v19)
        {
          CFDictionarySetValue(v20, CFSTR("TimingElements"), v17);
          *a3 = v17;
          CFRelease(v17);
          return 0;
        }
        CFRelease(v20);
        *(_QWORD *)(a1 + 1944) = 0;
        v21 = v17;
LABEL_14:
        CFRelease(v21);
        return v7;
      }
    }
    CFRelease(*(CFTypeRef *)(a1 + 1944));
    *(_QWORD *)(a1 + 1944) = 0;
  }
  return v7;
}

uint64_t kern_GetHDCPDownstreamState(uint64_t a1, _QWORD *outputStruct)
{
  int v4;
  size_t outputStructCnt;

  if (!outputStruct)
    return 3758097090;
  outputStructCnt = 16;
  if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x18u, 0, 0, outputStruct, &outputStructCnt))
  {
    v4 = *(_QWORD *)(a1 + 1944) != 0;
    *outputStruct = 0x1000150434448;
    outputStruct[1] = (v4 << 27);
  }
  return 0;
}

uint64_t iomfb_GetHDCPAuthenticationProtocol(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1848);
}

uint64_t kern_HDCPSendRequest(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v5;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  v5 = 3758097090;
  if (a1 && a2 && a4)
  {
    if (*(_DWORD *)(a1 + 1848) == 1)
    {
      a4();
      return 0;
    }
    else
    {
      input[0] = a2;
      input[1] = a3;
      input[2] = (uint64_t)IOMobileFramebufferHdcpNotifyFunc;
      input[3] = a1;
      *(_QWORD *)(a1 + 1616) = a4;
      *(_QWORD *)(a1 + 1560) = a5;
      return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x2Fu, input, 4u, 0, 0);
    }
  }
  return v5;
}

uint64_t kern_HDCPGetReply(uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t HDCPDownstreamState;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HDCPDownstreamState = 3758097090;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a1 + 1848) == 1)
    {
      input[0] = 0xAAAAAAAAAAAAAAAALL;
      input[1] = 0xAAAAAAAAAAAAAAAALL;
      if (*a3 < 0x10)
      {
        syslog(4, "IOMFB: hdcp reply too small for upstread header\n");
      }
      else
      {
        *a3 = 16;
        HDCPDownstreamState = kern_GetHDCPDownstreamState(a1, input);
        if (!(_DWORD)HDCPDownstreamState)
          *a2 = *(_OWORD *)input;
      }
    }
    else
    {
      output = 0xAAAAAAAAAAAAAAAALL;
      input[0] = (uint64_t)a2;
      *(_QWORD *)(a1 + 1616) = 0;
      *(_QWORD *)(a1 + 1560) = 0;
      input[1] = *a3;
      outputCnt = 1;
      HDCPDownstreamState = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x30u, input, 2u, &output, &outputCnt);
      if (!(_DWORD)HDCPDownstreamState)
        *a3 = output;
    }
  }
  return HDCPDownstreamState;
}

uint64_t kern_printDisplayRegs(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Au, 0, 0, 0, 0);
}

uint64_t kern_GetDotPitch(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  outputCnt = 1;
  if (!a2)
    return 3758097090;
  output = 0xAAAAAAAAAAAAAAAALL;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Cu, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
    *a2 = output;
  return result;
}

uint64_t kern_GetDotPitchFloat(uint64_t a1, float *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  outputCnt = 1;
  if (!a2)
    return 3758097090;
  output = 0xAAAAAAAAAAAAAAAALL;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x5Au, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
    *a2 = (float)output;
  return result;
}

uint64_t kern_GetDisplayArea(uint64_t a1, void *outputStruct)
{
  size_t outputStructCnt;

  if (!outputStruct)
    return 3758097090;
  outputStructCnt = 8;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x1Du, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t kern_EnableDisableDithering(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Eu, v3, 1u, 0, 0);
}

uint64_t kern_SetUnderrunColor(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Fu, v3, 1u, 0, 0);
}

IONotificationPort *kern_GetCRCNotifyMessageCount(uint64_t a1)
{
  return iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1696));
}

uint64_t kern_SetVideoDACGain(uint64_t a1, float a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = vcvtd_n_u64_f64(a2, 0xBuLL);
  if (v3[0] <= 0xFFF)
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x22u, v3, 1u, 0, 0);
  else
    return 3758097090;
}

uint64_t kern_SetLine21Data(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x23u, v3, 1u, 0, 0);
}

uint64_t kern_GetDebugTraces()
{
  return 3758097095;
}

uint64_t kern_EnableDebugTracing()
{
  return 3758097095;
}

uint64_t kern_EnableVBLTraces()
{
  return 3758097095;
}

uint64_t kern_SetLogLevel()
{
  return 3758097095;
}

uint64_t kern_SPLCSetBrightness(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 1928);
  input[0] = a2;
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x42u, input, 2u, 0, 0);
}

uint64_t kern_SPLCGetBrightness(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  output[0] = 0;
  result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x43u, 0, 0, output, &outputCnt);
  if (!(_DWORD)result)
  {
    if (a2)
    {
      result = 0;
      *a2 = output[0];
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t kern_SetBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  size_t v20;
  size_t v21;
  uint64_t result;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = (a6 + 2);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)v24 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v24 - v13, 170, 8 * v12);
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      v16 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
  }
  v17 = 0;
  do
  {
    *(_QWORD *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }
  while (a6 != v17);
  v16 = *v15;
LABEL_8:
  if (v16 >= a4)
    return 0;
  do
  {
    v18 = (const void *)(v16 + a3);
    v19 = v16 + 4096;
    v20 = a4 - v16;
    if (v19 <= a4)
      v21 = 4096;
    else
      v21 = v20;
    result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x4Eu, (const uint64_t *)v14, v12, v18, v21, 0, 0, 0, 0);
    v16 = *((_QWORD *)v14 + 1) + 4096;
    *((_QWORD *)v14 + 1) = v16;
  }
  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

uint64_t kern_GetBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  size_t v20;
  uint64_t result;
  size_t v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v12 = (a6 + 2);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)v23 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v23 - v13, 170, 8 * v12);
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      v16 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
  }
  v17 = 0;
  do
  {
    *(_QWORD *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }
  while (a6 != v17);
  v16 = *v15;
LABEL_8:
  if (v16 >= a4)
    return 0;
  do
  {
    v18 = (void *)(v16 + a3);
    v19 = v16 + 4096;
    v20 = a4 - v16;
    if (v19 <= a4)
      v20 = 4096;
    v23[0] = v20;
    result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x4Fu, (const uint64_t *)v14, v12, 0, 0, 0, 0, v18, v23);
    v16 = *((_QWORD *)v14 + 1) + 4096;
    *((_QWORD *)v14 + 1) = v16;
  }
  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

CFTypeRef kern_CreateStatistics(uint64_t a1, CFAllocatorRef allocator)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), CFSTR("PerformanceStatistics"), allocator, 0);
}

uint64_t kern_FactoryPortal(uint64_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x4Bu, inputStruct, 0x8008uLL, 0, 0);
}

uint64_t kern_GetCurrentAbsoluteTime(uint64_t a1, uint64_t *output)
{
  uint32_t outputCnt;

  outputCnt = 1;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x4Du, 0, 0, output, &outputCnt);
}

uint64_t kern_SwapWARSettings(uint64_t a1, int a2, _OWORD *a3)
{
  pthread_mutex_t *v6;

  v6 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  *(_DWORD *)(a1 + 849) = a2;
  *(_OWORD *)(a1 + 853) = *a3;
  pthread_mutex_unlock(v6);
  return 0;
}

uint64_t kern_GetLinkQuality(uint64_t a1)
{
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  output[0] = 0;
  if (IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x50u, 0, 0, output, &outputCnt))
    return 0x80000000;
  else
    return LODWORD(output[0]);
}

uint64_t kern_GetProtectionOptions(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  result = 3758097090;
  if (a1 && a2)
  {
    output = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = 1;
    result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x52u, 0, 0, &output, &outputCnt);
    if (!(_DWORD)result)
      *a2 = output;
  }
  return result;
}

uint64_t kern_GetBufBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  size_t v20;
  size_t v21;
  uint64_t result;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = (a6 + 2);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)v24 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v24 - v13, 170, 8 * v12);
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      v16 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    *(_QWORD *)v14 = a2;
    *((_QWORD *)v14 + 1) = 0;
    v15 = (unint64_t *)(v14 + 8);
  }
  v17 = 0;
  do
  {
    *(_QWORD *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }
  while (a6 != v17);
  v16 = *v15;
LABEL_8:
  if (v16 >= a4)
    return 0;
  do
  {
    v18 = (const void *)(v16 + a3);
    v19 = v16 + 4096;
    v20 = a4 - v16;
    if (v19 <= a4)
      v21 = 4096;
    else
      v21 = v20;
    result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x55u, (const uint64_t *)v14, v12, v18, v21, 0, 0, 0, 0);
    v16 = *((_QWORD *)v14 + 1) + 4096;
    *((_QWORD *)v14 + 1) = v16;
  }
  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

uint64_t kern_SetClamshellState(uint64_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x59u, v3, 1u, 0, 0);
}

uint64_t kern_egest_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if (!a2 || *(_DWORD *)(a1 + 1932))
    return a2;
  v4 = mach_continuous_time();
  v5 = mach_absolute_time();
  return (a2 - v4 + v5) & ~((uint64_t)(a2 - v4 + v5) >> 63);
}

uint64_t IOMobileFramebufferGetServiceObject(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t IOMobileFramebufferSwapSetBackgroundColor(uint64_t a1, float a2, float a3, float a4)
{
  uint64_t result;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  if (!a1)
    return 3758097090;
  result = 0;
  v6 = vcvtms_s32_f32((float)(a2 * 255.0) + 0.5);
  v7 = vcvtms_s32_f32((float)(a3 * 255.0) + 0.5);
  v8 = vcvtms_s32_f32((float)(a4 * 255.0) + 0.5);
  v9 = v6 & ~(v6 >> 31);
  if (v9 >= 0xFF)
    v9 = 255;
  v10 = v7 & ~(v7 >> 31);
  if (v10 >= 0xFF)
    v10 = 255;
  v11 = v8 & ~(v8 >> 31);
  if (v11 >= 0xFF)
    v11 = 255;
  *(_DWORD *)(a1 + 364) = (v11 << 16) | (v10 << 8) | v9 | 0xFF000000;
  *(_QWORD *)(a1 + 356) |= 0x8000000080000000;
  return result;
}

uint64_t IOMobileFramebufferSwapUIEdgeBlendMode(uint64_t a1, unsigned int a2, int a3, float a4)
{
  uint64_t result;
  uint64_t v6;

  result = 3758097090;
  if (a1 && a2 <= 1 && a4 >= -1.0 && a4 <= 0.0)
  {
    v6 = a1 + 4 * a2;
    *(_DWORD *)(v6 + 260) = a3;
    *(float *)(v6 + 276) = a4;
    syslog(5, "IOMFB framebuffer->transaction.uiEdgeMode[layerIndex] = %d d \n", a3);
    syslog(5, "IOMFB framebuffer->transaction.uiSoftEdgeCoverage[layerIndex] = %f f \n", *(float *)(v6 + 276));
    return 0;
  }
  return result;
}

uint64_t IOMobileFramebufferSwapSetUISubRegion()
{
  return 3758097095;
}

uint64_t IOMobileFramebufferSwapSetVideoDestEdgeAlpha(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 388) = a2;
  *(_QWORD *)(a1 + 396) = a3;
  return 0;
}

uint64_t IOMobileFramebufferSwapSetGammaTable(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (a2 <= 2)
    {
      result = 0;
      *(_DWORD *)(a1 + 368) = a2;
    }
  }
  return result;
}

uint64_t IOMobileFramebufferSetContrast()
{
  uint64_t v0;
  float v1;
  uint64_t result;
  float v3;
  unsigned int (*v4)(uint64_t, _DWORD *);
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  _DWORD *v13;
  _DWORD *v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  _DWORD *v22;
  _DWORD *v23;
  _DWORD *v24;
  float v25;
  _DWORD *v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  void (*v31)(uint64_t, _DWORD *);
  _DWORD v32[771];
  _BYTE __b[1028];
  _BYTE v34[1028];
  _BYTE v35[1028];
  uint64_t v36;

  v0 = MEMORY[0x1E0C80A78]();
  v36 = *MEMORY[0x1E0C80C00];
  result = 3758097090;
  if (v0 && *(_QWORD *)(v0 + 2384))
  {
    v3 = v1;
    memset(v32, 170, sizeof(v32));
    v4 = *(unsigned int (**)(uint64_t, _DWORD *))(v0 + 2392);
    if (v4 && !v4(v0, v32))
    {
      memset(v35, 170, sizeof(v35));
      memset(v34, 170, sizeof(v34));
      memset(__b, 170, sizeof(__b));
      v5 = vcvtms_u32_f32((float)(v3 * 0.5) * 257.0);
      v6 = vcvtmd_u64_f64((1.0 - (float)(v3 * 0.5)) * 257.0);
      if (v5 >= 256)
        v7 = 256;
      else
        v7 = v5;
      v8 = v7 & ~(v7 >> 31);
      if (v6 >= 256)
        v9 = 256;
      else
        v9 = v6;
      v10 = v9 & ~(v9 >> 31);
      if (v7 < 1)
      {
        v18 = 0;
      }
      else
      {
        v11 = v32[0];
        v12 = v32[257];
        v13 = __b;
        v14 = v34;
        v15 = v35;
        v16 = v8;
        v17 = v32[514];
        do
        {
          *v15++ = v11;
          *v14++ = v12;
          *v13++ = v17;
          --v16;
        }
        while (v16);
        v18 = v8;
      }
      v19 = v18;
      if (v18 < v10)
      {
        v20 = 257.0 / (float)(v10 - v8);
        v21 = v10 - v18;
        v22 = &__b[4 * v18];
        v23 = &v34[4 * v19];
        v24 = &v35[4 * v19];
        v25 = 0.0;
        do
        {
          v26 = &v32[vcvtms_u32_f32(v25)];
          *v24++ = *v26;
          *v23++ = v26[257];
          *v22++ = v26[514];
          v25 = v20 + v25;
          --v21;
        }
        while (v21);
        v19 = v10;
      }
      v27 = v32[256];
      v28 = v32[513];
      v29 = 4 * v19;
      v30 = v32[770];
      do
      {
        *(_DWORD *)&v35[v29] = v27;
        *(_DWORD *)&v34[v29] = v28;
        *(_DWORD *)&__b[v29] = v30;
        v29 += 4;
      }
      while (v29 != 1028);
      memcpy(v32, v35, 0x404uLL);
      memcpy(&v32[257], v34, 0x404uLL);
      memcpy(&v32[514], __b, 0x404uLL);
      v31 = *(void (**)(uint64_t, _DWORD *))(v0 + 2376);
      if (v31)
        v31(v0, v32);
    }
    return (*(uint64_t (**)(uint64_t, float))(v0 + 2384))(v0, v3);
  }
  return result;
}

uint64_t IOMobileFramebufferIsMainDisplay(uint64_t a1, _DWORD *a2)
{
  int v4;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  *a2 = 0;
  if (!a1)
    return 3758097090;
  if (!*(_DWORD *)(a1 + 20))
    return 0;
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v4 = *(_DWORD *)(a1 + 1924);
  if (v4 == -1)
  {
    v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x12u, 0, 0, output, &outputCnt);
    if ((_DWORD)v5)
    {
      v4 = *(_DWORD *)(a1 + 1924);
    }
    else
    {
      v4 = LODWORD(output[0]) == 1;
      *(_DWORD *)(a1 + 1924) = v4;
    }
  }
  else
  {
    v5 = 0;
  }
  if (v4 == 1)
    *a2 = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 1856));
  return v5;
}

uint64_t IOMobileFramebufferInstallVirtualDisplay(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = *a3;
  v5 = a3[2];
  xmmword_1ED02C750 = a3[1];
  unk_1ED02C760 = v5;
  s_virt_funcs = v4;
  v6 = a3[3];
  v7 = a3[4];
  v8 = a3[6];
  xmmword_1ED02C790 = a3[5];
  unk_1ED02C7A0 = v8;
  xmmword_1ED02C770 = v6;
  unk_1ED02C780 = v7;
  v9 = a3[7];
  v10 = a3[8];
  v11 = a3[10];
  xmmword_1ED02C7D0 = a3[9];
  unk_1ED02C7E0 = v11;
  xmmword_1ED02C7B0 = v9;
  unk_1ED02C7C0 = v10;
  s_virt_contexts = a4;
  s_virt_context_len = 1;
  return 0;
}

uint64_t IOMobileFramebufferInstallVirtualDisplays(__int128 *a1, const void *a2, unint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a3 > 0xC)
    return 3758097090;
  v4 = *a1;
  v5 = a1[2];
  xmmword_1ED02C750 = a1[1];
  unk_1ED02C760 = v5;
  s_virt_funcs = v4;
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[6];
  xmmword_1ED02C790 = a1[5];
  unk_1ED02C7A0 = v8;
  xmmword_1ED02C770 = v6;
  unk_1ED02C780 = v7;
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[10];
  xmmword_1ED02C7D0 = a1[9];
  unk_1ED02C7E0 = v11;
  xmmword_1ED02C7B0 = v9;
  unk_1ED02C7C0 = v10;
  s_virt_context_len = a3;
  if ((_DWORD)a3)
    memcpy(s_virt_contexts, a2, 8 * a3);
  return 0;
}

uint64_t IOMobileFramebufferGetMainDisplay(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *i;

  iomfb_populate_all_display_infos();
  v2 = s_display_infos_len;
  if (!s_display_infos_len)
    return 3758097088;
  for (i = &s_display_infos; !*((_BYTE *)i + 152); i += 20)
  {
    if (!--v2)
      return 3758097088;
  }
  return iomfb_get_display((uint64_t)i, a1);
}

uint64_t IOMobileFramebufferGetSecondaryDisplay(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *i;

  iomfb_populate_all_display_infos();
  v2 = s_display_infos_len;
  if (!s_display_infos_len)
    return 3758097088;
  for (i = &s_display_infos; *((_BYTE *)i + 152) || *((_DWORD *)i + 2) == 2; i += 20)
  {
    if (!--v2)
      return 3758097088;
  }
  return iomfb_get_display((uint64_t)i, a1);
}

uint64_t IOMobileFramebufferEnableMirroring(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t IsMainDisplay;
  __int128 v8;
  uint64_t v9;
  int v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1B551628C;
  LODWORD(v9) = -1431655766;
  if (a1 && a2)
  {
    v10 = -1431655766;
    IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v10);
    if (!(_DWORD)IsMainDisplay)
    {
      IsMainDisplay = 3758097090;
      if (v10)
      {
        if (!a3
          || (IsMainDisplay = IOMobileFrameBufferGetMirroringCapability(a2, &v8), !(_DWORD)IsMainDisplay)
          && (IsMainDisplay = 3758097090, (_BYTE)v8))
        {
          input[0] = a3;
          IsMainDisplay = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x29u, input, 1u, 0, 0);
          if ((_DWORD)IsMainDisplay)
          {
            syslog(4, "IOMFB: mirror enable kernel failure\n");
LABEL_14:
            *(_QWORD *)(a2 + 3216) = 0;
            *(_QWORD *)(a1 + 3224) = 0;
            return IsMainDisplay;
          }
          if (!a3)
            goto LABEL_14;
          IsMainDisplay = 0;
          *(_QWORD *)(a2 + 3216) = a1;
          *(_QWORD *)(a1 + 3224) = a2;
        }
      }
    }
  }
  else
  {
    IsMainDisplay = 3758097090;
    syslog(4, "IOMFB: missing framebuffer for mirorr enable\n", v8, v9);
  }
  return IsMainDisplay;
}

uint64_t IOMobileFrameBufferGetMirroringCapability(uint64_t a1, void *a2)
{
  uint64_t v2;
  int v6;
  size_t outputStructCnt;

  v2 = 3758097090;
  if (a1 && a2)
  {
    v6 = -1431655766;
    if (IOMobileFramebufferIsMainDisplay(a1, &v6) || !v6)
    {
      outputStructCnt = 20;
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Au, 0, 0, a2, &outputStructCnt);
    }
    else
    {
      syslog(5, "Error -  IOMobileFrameBufferGetMirroringCapability called on internal framebuffer \n");
      return 3758097126;
    }
  }
  return v2;
}

uint64_t IOMobileFramebufferSetRenderingAngle(uint64_t a1, float *a2)
{
  int IsMainDisplay;
  float v5;
  unint64_t v6;
  uint64_t v7;
  float inputStruct;
  int v10;

  if (a1 && a2)
  {
    v10 = -1431655766;
    IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v10);
    if (IsMainDisplay | v10)
    {
      v5 = (float)(*a2 * 180.0) / 3.14159265;
      inputStruct = v5;
      HIDWORD(v6) = -1527099483 * v5;
      LODWORD(v6) = HIDWORD(v6);
      if ((v6 >> 1) < 0x2D82D83)
      {
        v7 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Bu, &inputStruct, 4uLL, 0, 0);
        if ((_DWORD)v7)
        {
          syslog(4, "IOMobileFramebufferSetRenderingAngle - kernel rejected the rendering angle trap\n");
          *(_DWORD *)(a1 + 3232) = 0;
        }
        else
        {
          *(_DWORD *)(a1 + 3232) = inputStruct;
        }
      }
      else
      {
        v7 = 3758097126;
        syslog(4, "IOMobileFramebufferSetRenderingAngle error - angle needs to be a multiple of 90\n");
      }
    }
    else
    {
      v7 = 3758097126;
      syslog(4, "IOMobileFramebufferSetRenderingAngle - can only set rending angle for internal display\n");
    }
  }
  else
  {
    syslog(4, "IOMobileFramebufferSetRenderingAngle - bad argument\n");
    return 3758097090;
  }
  return v7;
}

uint64_t IOMobileFramebufferSetMirrorContentRegion(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  _DWORD v10[4];

  if (!a1)
    return 3758097090;
  v5 = a2;
  v6 = a3;
  *(float *)v10 = v5;
  *(float *)&v10[1] = v6;
  v7 = a4;
  v8 = a5;
  *(float *)&v10[2] = v7;
  *(float *)&v10[3] = v8;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Cu, v10, 0x10uLL, 0, 0);
}

uint64_t IOMobileFramebufferGetMirrorError(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = 3758097090;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 3216))
    {
      v2 = 0;
      *a2 = 0;
    }
    else
    {
      syslog(3, "IOMobileFramebufferGetMirrorError - no mirror source\n");
    }
  }
  return v2;
}

uint64_t IOMobileFramebufferReadyForSwap(_QWORD *a1, BOOL *a2, uint64_t a3)
{
  uint64_t result;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  void (*v11)(_QWORD *, double *);
  int v12;
  double v13;
  double v14;

  v13 = 0.0;
  v14 = 0.0;
  result = 3758097090;
  if (a1)
  {
    if (a2)
    {
      v12 = -1431655766;
      result = IOMobileFramebufferIsMainDisplay((uint64_t)a1, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          v7 = 1;
        }
        else
        {
          v8 = a1[402];
          if (v8)
          {
            v9 = *(unsigned int *)(v8 + 3232);
            v10 = *(void (**)(void))(v8 + 1992);
            if (v10)
              v10();
          }
          else
          {
            v11 = (void (*)(_QWORD *, double *))a1[249];
            if (v11)
              v11(a1, &v13);
            v9 = 0;
          }
          v7 = (*(unsigned int (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, double, double))(a1[346] + 120))(a1[345], v9, a3, 1, 0, 0, v13, v14) == 0;
        }
        result = 0;
        *a2 = v7;
      }
    }
  }
  return result;
}

uint64_t IOMobileFramebufferGetWirelessSurface(uint64_t a1, double a2, double a3, uint64_t a4, IOSurfaceRef *a5)
{
  uint64_t v9;

  v9 = (*(uint64_t (**)(void))(a1 + 2720))();
  return IOMobileFramebufferGetWirelessSurfaceWithOptions(a1, v9, a5, 0, a2, a3);
}

uint64_t IOMobileFramebufferGetWirelessSurfaceWithOptions(uint64_t a1, uint64_t a2, IOSurfaceRef *a3, unsigned int a4, double a5, double a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, IOSurfaceID *, uint64_t, double, double);
  void (*v19)(_QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  IOSurfaceID *v22;
  IOSurfaceRef v23;
  int v24;

  if (!a1)
    return 3758097090;
  v24 = -1431655766;
  result = IOMobileFramebufferIsMainDisplay(a1, &v24);
  if ((_DWORD)result)
    return result;
  if (v24)
    return 3758097090;
  v13 = *(_QWORD *)(a1 + 3216);
  if (v13)
    v14 = *(unsigned int *)(v13 + 3232);
  else
    v14 = 0;
  v15 = 0;
  while (1)
  {
    v16 = a1 + v15;
    if (!*(_QWORD *)(a1 + v15 + 2816))
      break;
    v15 += 24;
    if (v15 == 384)
      return 3758097086;
  }
  v17 = *(_QWORD *)(a1 + 2768);
  if (!v17)
    return 3758097084;
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, IOSurfaceID *, uint64_t, double, double))(v17 + 120);
  if (!v18)
    return 3758097084;
  v19 = *(void (**)(_QWORD, _QWORD))(v17 + 112);
  if (v19)
  {
    v19(*(_QWORD *)(a1 + 2760), (a4 >> 1) & 1);
    v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, IOSurfaceID *, uint64_t, double, double))(*(_QWORD *)(a1 + 2768) + 120);
  }
  v20 = *(_QWORD *)(a1 + 2760);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2720))(a1, a2);
  v22 = (IOSurfaceID *)(a1 + v15 + 2808);
  result = v18(v20, v14, v21, 1, v22, v16 + 2816, a5, a6);
  if (!(_DWORD)result)
  {
    v23 = IOSurfaceLookup(*v22);
    *(_QWORD *)(v16 + 2800) = v23;
    *a3 = v23;
    result = 3758097084;
    if (*(_QWORD *)(v16 + 2800))
      return 0;
  }
  *(_QWORD *)(v16 + 2816) = 0;
  return result;
}

uint64_t IOMobileFramebufferKernelTests(uint64_t a1, _DWORD *inputStruct)
{
  if (*inputStruct < 0x15u)
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x38u, inputStruct, 0x9CuLL, 0, 0);
  syslog(3, "%s: passed %d surfaces, > %d\n", "IOReturn IOMobileFramebufferKernelTests(IOMobileFramebufferRef, struct IOMFBKernelTestsArguments)", *inputStruct, 20);
  return 3758097090;
}

uint64_t IOMFBGainEncoderEmitEmptyRows(_DWORD *a1, unsigned int a2)
{
  if (IOMFBgainencoder_emit_empty_rows(a1, a2))
    return 0;
  else
    return 3758097084;
}

uint64_t IOMFBGainEncoderRepeatPreviousRow()
{
  if (IOMFBgainencoder_repeat_row())
    return 0;
  else
    return 3758097084;
}

uint64_t IOMFBGainMapRetain(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  if (result)
  {
    v1 = (unsigned int *)(result + 4);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }
  return result;
}

uint64_t IOMobileFramebufferSetTwilightStrength(uint64_t a1, float a2)
{
  float v2;
  float v3;

  v2 = 0.0;
  if (a2 >= 0.0)
    v2 = a2;
  if (a2 <= 1.0)
    v3 = v2;
  else
    v3 = 1.0;
  *(_DWORD *)(a1 + 1031) = (2 * (v3 * 2147483650.0)) | 1;
  return 0;
}

uint64_t IOMobileFramebufferSetAmmoliteStrength(uint64_t a1, float a2)
{
  float v2;
  float v3;

  v2 = 0.0;
  if (a2 >= 0.0)
    v2 = a2;
  if (a2 <= 1.0)
    v3 = v2;
  else
    v3 = 1.0;
  *(_DWORD *)(a1 + 1035) = (2 * (v3 * 2147483650.0)) | 1;
  return 0;
}

uint64_t IOMobileFramebufferCalibrationBegin(uint64_t a1)
{
  uint64_t result;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v4;
  int v5;

  if (!a1)
    return 3758097090;
  v5 = -1431655766;
  result = IOMobileFramebufferIsMainDisplay(a1, &v5);
  if (!(_DWORD)result)
  {
    if (v5)
    {
      v4 = 1;
      v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640);
      if (v3)
        v3(a1, 20, 1, &v4);
      return 0;
    }
    else
    {
      syslog(3, "IOMobileFramebufferCalibrationBegin called on external framebuffer \n");
      return 3758097126;
    }
  }
  return result;
}

uint64_t IOMobileFramebufferCalibrationToolboxCommand(uint64_t a1, int a2, _DWORD *a3, size_t a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t IsMainDisplay;
  const __CFDictionary *v14;
  io_service_t MatchingService;
  io_object_t v16;
  kern_return_t v17;
  kern_return_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD);
  void (*v20)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD);
  void *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD);
  unsigned int v30;
  CFNumberRef v31;
  io_registry_entry_t v32;
  const __CFString *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD);
  kern_return_t v39;
  BOOL v40;
  const void **v41;
  const void *v42;
  io_registry_entry_t v43;
  const __CFString *v44;
  const void **v45;
  const void **v46;
  uint64_t input[2];
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  void *v52;
  int v53;
  io_connect_t connect;

  v52 = 0;
  v51 = 0;
  v6 = 3758097090;
  if (!a1)
    return 3758097090;
  v53 = -1431655766;
  IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v53);
  if ((_DWORD)IsMainDisplay)
    return IsMainDisplay;
  if (!v53)
  {
    syslog(3, "IOMobileFramebufferCalibrationBegin called on external framebuffer \n");
    return 3758097126;
  }
  if (a2 <= 16908289)
  {
    if (a2 != 16842757)
    {
      if (a2 == 16842758)
      {
        v14 = IOServiceMatching("AppleNVMeEAN");
        MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAB8], v14);
        if (!MatchingService)
          return 3758097090;
        v16 = MatchingService;
        connect = -1431655766;
        v17 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
        IOObjectRelease(v16);
        if (v17)
          return 3758097090;
        input[0] = 1430470988;
        v18 = IOConnectCallMethod(connect, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
        IOServiceClose(connect);
        if (v18)
        {
          syslog(3, "UserCalibration_EraseEAN   failed \n");
          return 3758097090;
        }
        v34 = 4;
LABEL_59:
        input[0] = v34;
        v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640);
        if (v35)
        {
          v36 = a1;
          v37 = 20;
LABEL_78:
          v35(v36, v37, 1, input);
          return 0;
        }
        return 0;
      }
      goto LABEL_33;
    }
    IsMainDisplay = 0;
    LODWORD(input[0]) = 0;
    if (!a5 || a6 != 4)
      return IsMainDisplay;
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
    if (v20)
    {
      v20(a1, 99, input, 4, 0, 0);
      if (*(float *)input != 0.0)
      {
        IsMainDisplay = 0;
        *a5 = input[0];
        return IsMainDisplay;
      }
    }
    IsMainDisplay = UserCalibration_ReadEAN(&v52, &v51);
    v21 = v52;
    if (!(_DWORD)IsMainDisplay)
    {
      v22 = v51 < 0x25 ? 0 : 4 * *((unsigned int *)v52 + 2);
      IsMainDisplay = UserCalibration_SetCalibrationData(a1, v52, v22, 0);
      if (!(_DWORD)IsMainDisplay)
      {
        v38 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
        if (v38)
          v38(a1, 99, input, 4, 0, 0);
        IsMainDisplay = 0;
        *a5 = input[0];
      }
    }
    if (v21)
    {
      v26 = v21;
      goto LABEL_68;
    }
    return IsMainDisplay;
  }
  if (a2 == 16908293)
  {
    IsMainDisplay = 0;
    if (a5 && a6 == 8)
    {
      v23 = UserCalibration_ReadEAN(&v52, &v51);
      if ((_DWORD)v23 == -536870160)
        goto LABEL_41;
      IsMainDisplay = v23;
      if ((_DWORD)v23)
        goto LABEL_43;
      if (v51 < 0x25)
LABEL_41:
        v24 = 0;
      else
        v24 = *(_QWORD *)((char *)v52 + 12);
      IsMainDisplay = 0;
      *(_QWORD *)a5 = v24;
    }
LABEL_43:
    v26 = v52;
    if (!v52)
      return IsMainDisplay;
    goto LABEL_68;
  }
  if (a2 != 16908290)
  {
LABEL_33:
    if (!a3 && !a4)
      return 3758097090;
    if (a2 > 16842751)
    {
      if (a2 <= 16908287)
      {
        IsMainDisplay = 3758097090;
        switch(a2)
        {
          case 16842752:
          case 16842753:
          case 16842754:
          case 16842756:
            return UserCalibration_SetCalibrationData(a1, a3, a4, 1);
          case 16842755:
            IsMainDisplay = UserCalibration_SetCalibrationData(a1, a3, a4, 1);
            if ((_DWORD)IsMainDisplay)
              return IsMainDisplay;
            IsMainDisplay = UserCalibration_WriteEAN(a3, a4);
            if ((_DWORD)IsMainDisplay)
              return IsMainDisplay;
            v34 = 2;
            goto LABEL_59;
          case 16842757:
          case 16842758:
            return IsMainDisplay;
          case 16842759:
            LODWORD(input[0]) = *a3;
            v31 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, input);
            v32 = *(_DWORD *)(a1 + 16);
            v33 = CFSTR("CMDegammaMethod");
            goto LABEL_73;
          default:
            return 3758097090;
        }
      }
      if (a2 == 16908288)
      {
        if (*a3)
          v45 = (const void **)MEMORY[0x1E0C9AE50];
        else
          v45 = (const void **)MEMORY[0x1E0C9AE40];
        v42 = *v45;
        v43 = *(_DWORD *)(a1 + 16);
        v44 = CFSTR("IOMFBTemperatureCompensationEnable");
      }
      else
      {
        if (a2 != 16908291)
        {
          IsMainDisplay = 3758097090;
          if (a2 != 16908289)
            return IsMainDisplay;
          IsMainDisplay = 0;
          v30 = *a3;
          LODWORD(input[0]) = v30;
          if (v30 == 1 || v30 > 0xA)
            return IsMainDisplay;
          v31 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, input);
          v32 = *(_DWORD *)(a1 + 16);
          v33 = CFSTR("APTFixedRR");
LABEL_73:
          v39 = IORegistryEntrySetCFProperty(v32, v33, v31);
          if (v31)
            CFRelease(v31);
          v40 = v39 == 0;
          goto LABEL_93;
        }
        if (*a3)
          v46 = (const void **)MEMORY[0x1E0C9AE50];
        else
          v46 = (const void **)MEMORY[0x1E0C9AE40];
        v42 = *v46;
        v43 = *(_DWORD *)(a1 + 16);
        v44 = CFSTR("NormalModeEnable");
      }
LABEL_92:
      v40 = IORegistryEntrySetCFProperty(v43, v44, v42) == 0;
LABEL_93:
      if (v40)
        return 0;
      else
        return 3758097090;
    }
    if (a2 == 0x1000000)
    {
      input[0] = *a3;
      v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2640);
      if (v35)
      {
        v36 = a1;
        v37 = 21;
        goto LABEL_78;
      }
      return 0;
    }
    if (a2 == 16777221)
    {
      if (*a3)
        v41 = (const void **)MEMORY[0x1E0C9AE50];
      else
        v41 = (const void **)MEMORY[0x1E0C9AE40];
      v42 = *v41;
      v43 = *(_DWORD *)(a1 + 16);
      v44 = CFSTR("uniformity2D");
      goto LABEL_92;
    }
    IsMainDisplay = 3758097090;
    if (a2 != 16777222)
      return IsMainDisplay;
    if (a4 != 11200)
      return 0;
    v27 = malloc_type_aligned_alloc(0x4000uLL, 0x4000uLL, 0x9C330F6EuLL);
    memcpy(v27, a3, 0x2BC0uLL);
    *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)input = v28;
    v49 = 0x4000;
    v50 = 0xAAAAAAAAAAAA0000;
    LODWORD(input[0]) = 1;
    LOBYTE(input[1]) = 1;
    v48 = v27;
    v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(a1 + 2624);
    if (v29)
      IsMainDisplay = v29(a1, 22, input, 40, 0, 0);
    else
      IsMainDisplay = 3758097095;
    v26 = v27;
LABEL_68:
    free(v26);
    return IsMainDisplay;
  }
  LODWORD(input[0]) = -1;
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
  if (v19)
    v19(a1, 96, input, 4, 0, 0);
  if (a5 && a6 == 4)
  {
    v6 = 0;
    *a5 = input[0];
  }
  return v6;
}

uint64_t UserCalibration_ReadEAN(void **a1, _DWORD *a2)
{
  uint64_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  kern_return_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;
  io_connect_t connect;
  uint64_t v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = 3758097090;
  v5 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAB8], v5);
  if (MatchingService)
  {
    v7 = MatchingService;
    connect = -1431655766;
    v8 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    IOObjectRelease(v7);
    if (!v8)
    {
      *a1 = 0;
      output = 0xAAAAAAAAAAAAAAAALL;
      input = 1430470988;
      outputCnt = 1;
      v9 = 3758097136;
      if (!IOConnectCallMethod(connect, 3u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0))
      {
        v10 = output;
        if (output)
        {
          *a2 = output >> 2;
          v11 = malloc_type_malloc(v10, 0xEC60EDABuLL);
          *a1 = v11;
          if (v11)
          {
            v17[0] = 1430470988;
            v17[1] = (uint64_t)v11;
            v17[2] = output;
            if (!IOConnectCallMethod(connect, 4u, v17, 3u, 0, 0, 0, 0, 0, 0))
            {
              IOServiceClose(connect);
              return 0;
            }
            v9 = 3758097136;
          }
          else
          {
            v9 = 3758097085;
          }
        }
      }
      IOServiceClose(connect);
      if (*a1)
        free(*a1);
      *a1 = 0;
      syslog(3, "UserCalibration_ReadEAN failed: 0x%X", v9);
      return v9;
    }
  }
  return v4;
}

uint64_t UserCalibration_SetCalibrationData(uint64_t a1, const void *a2, size_t a3, int a4)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD);
  void *v10;
  __int128 v11;
  uint64_t (*v12)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD, _QWORD);
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v15)(uint64_t, uint64_t);
  __int128 v16;
  void *v17;
  int v18;
  int v19;

  if (a3 >> 19)
    return 0;
  if (a4)
  {
    v8 = 3758097090;
    if (!a1 || (v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2312)) == 0 || (v8 = v9(a1, 0), (_DWORD)v8))
    {
      syslog(3, "UserCalibration_SetCalibrationData Power up Failed with %x\n", v8);
      return v8;
    }
  }
  v10 = malloc_type_aligned_alloc(0x4000uLL, (a3 + 0x3FFF) & 0xFFFFFFFFFFFFC000, 0x86AFC4CCuLL);
  memcpy(v10, a2, a3);
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16 = v11;
  v19 = -1431655766;
  LODWORD(v16) = 1;
  DWORD2(v16) = a3;
  v17 = v10;
  v18 = (a3 + 0x3FFF) & 0xFFFFC000;
  if (!a1)
  {
    free(v10);
    v8 = 3758097095;
    syslog(3, "UserCalibration_SetCalibrationData Failed with %x\n");
    return v8;
  }
  v12 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD, _QWORD))(a1 + 2624);
  if (v12)
  {
    v8 = v12(a1, 97, &v16, 32, 0, 0);
    free(v10);
    if (!(_DWORD)v8)
    {
      if (a4)
      {
        v13 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2312);
        if (v13)
        {
          v8 = v13(a1, 1);
          if (!(_DWORD)v8)
            return 0;
        }
        else
        {
          v8 = 3758097090;
        }
        syslog(3, "UserCalibration_SetCalibrationData Power up Failed with %x\n");
        return v8;
      }
      return 0;
    }
  }
  else
  {
    free(v10);
    v8 = 3758097095;
  }
  syslog(3, "UserCalibration_SetCalibrationData Failed with %x\n", v8);
  v15 = *(void (**)(uint64_t, uint64_t))(a1 + 2312);
  if (v15)
    v15(a1, 1);
  return v8;
}

uint64_t UserCalibration_WriteEAN(const void *a1, size_t a2)
{
  uint64_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  kern_return_t v8;
  size_t v9;
  void *v10;
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  v4 = 3758097090;
  v5 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAB8], v5);
  if (MatchingService)
  {
    v7 = MatchingService;
    connect = -1431655766;
    v8 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    IOObjectRelease(v7);
    if (!v8)
    {
      output = 0;
      outputCnt = 1;
      v9 = (a2 + 4095) & 0xFFFFFFFFFFFFF000;
      v10 = malloc_type_aligned_alloc(0x1000uLL, v9, 0x16A24CDCuLL);
      memcpy(v10, a1, a2);
      input[0] = 1430470988;
      input[1] = (uint64_t)v10;
      input[2] = v9;
      v11 = IOConnectCallMethod(connect, 2u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
      free(v10);
      if (v11)
        syslog(3, "UserCalibration_WriteEAN EANSize write failed  input_buffer_size 0x%zx ret 0x%x \n", v9, v11);
      else
        v4 = 0;
      IOServiceClose(connect);
    }
  }
  return v4;
}

uint64_t IOMobileFrameBufferGetAutoLuminanceBoost(uint64_t a1, int *a2)
{
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  int v6;
  int v7;

  if (!a1)
    return 3758097090;
  v6 = -1;
  v7 = -1431655766;
  result = IOMobileFramebufferIsMainDisplay(a1, &v7);
  if (!(_DWORD)result)
  {
    if (v7)
    {
      v5 = *(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD))(a1 + 2632);
      if (v5)
      {
        result = v5(a1, 119, &v6, 4, 0, 0);
        if (!(_DWORD)result)
          *a2 = v6;
      }
      else
      {
        return 3758097095;
      }
    }
    else
    {
      return 3758097126;
    }
  }
  return result;
}

BOOL isServicingTwoExternalDisplay(io_registry_entry_t a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  v1 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("IOMFBIntDcpUsedForExtWhenLidClose"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFBooleanGetValue(v1) != 0;
  CFRelease(v2);
  return v3;
}

CFStringRef ioMobileFramebufferCopyFormatDescription(const void *a1, const __CFDictionary *a2)
{
  CFIndex v4;

  v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOMobileFramebuffer %p refcnt=%d>"), a1, v4);
}

uint64_t ioMobileFramebufferCopyDebugDescription()
{
  return 0;
}

void find_core_analytics()
{
  void *v0;

  v0 = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  s_core_analytics_lib = (uint64_t)v0;
  if (v0)
  {
    s_core_analytics_send_event_fn = (uint64_t)dlsym(v0, "analytics_send_event");
    if (s_core_analytics_send_event_fn)
      return;
  }
  else
  {
    syslog(3, "IOMFB: %s not found\n", "/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics");
  }
  syslog(3, "IOMFB: %s not found\n", "analytics_send_event");
}

IONotificationPort *IOMobileFramebufferHotPlugNotifyFunc(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  IONotificationPort *result;
  uint64_t (*v8)(uint64_t, unint64_t, _QWORD);

  result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1440));
  if ((int)result <= 0)
  {
    v8 = *(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a1 + 1488);
    if (v8)
      return (IONotificationPort *)v8(a1, a3 | (unint64_t)(a4 << 32), *(_QWORD *)(a1 + 1432));
  }
  return result;
}

IONotificationPort *IOMobileFramebufferPowerNotifyFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  IONotificationPort *result;

  *(_OWORD *)(a1 + 1344) = 0u;
  result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1504));
  if ((int)result <= 0)
    return (IONotificationPort *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 1552))(a1, a3, a4, *(_QWORD *)(a1 + 1496));
  return result;
}

void FrameInfoNotifyFunc(uintptr_t a1, uint64_t a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v7;
  unsigned int v8;
  const __CFAllocator *v9;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t *v15;
  uint64_t *v16;
  unsigned int v17;
  BOOL v18;
  int v20;
  CFStringRef v21;
  unsigned int v22;
  uint64_t v23;
  CFNumberRef v24;
  CFNumberRef v25;
  BOOL v26;
  CFNumberRef v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  uint64_t valuePtr;

  if (a4 > 1)
  {
    v7 = *a3;
    v8 = *((_DWORD *)a3 + 2);
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v11 = Mutable;
      v28 = v8;
      v29 = v7;
      v12 = v7 & 0x7FFFFFFF;
      if ((v7 & 0x7FFFFFFF) != 0)
      {
        v13 = 0;
        v14 = 0;
        v15 = a3 + 2;
        v30 = a4 - 2;
        v16 = v15;
        do
        {
          v17 = 1 << v13;
          v18 = ((1 << v13) & v12) == 0;
          if (1 << v13 < v12 && ((1 << v13) & v12) == 0)
          {
            do
            {
              ++v13;
              v20 = v12 & (2 * v17);
              v17 *= 2;
              v18 = v20 == 0;
            }
            while (v17 < v12 && !v20);
          }
          if (v18)
            break;
          v21 = CFStringCreateWithCString(v9, *(const char **)(*(_QWORD *)(a1 + 1816) + 8 * v13), 0x600u);
          valuePtr = 0xAAAAAAAAAAAAAAAALL;
          if (v14 >= v30)
          {
            v23 = 0;
          }
          else
          {
            v22 = v14 + 1;
            v23 = v15[v14];
            if (v29 < 0)
            {
              v14 += 2;
              v23 |= v15[v22] << 32;
            }
            else
            {
              ++v14;
            }
          }
          valuePtr = adjust_ni_timestamp(a1, *(char **)(*(_QWORD *)(a1 + 1816) + 8 * v13), v23);
          v24 = CFNumberCreate(v9, kCFNumberLongLongType, &valuePtr);
          v25 = v24;
          if (v21)
            v26 = v24 == 0;
          else
            v26 = 1;
          if (v26)
          {
            CFRelease(v11);
            if (v21)
              CFRelease(v21);
            if (v25)
            {
              v27 = v25;
              goto LABEL_27;
            }
            return;
          }
          v12 ^= v17;
          CFDictionarySetValue(v11, v21, v24);
          CFRelease(v25);
          CFRelease(v21);
          v15 = v16;
        }
        while (v12);
      }
      if (*(_BYTE *)(a1 + 3240))
        kdebug_signpost(0x31800100u, a1, 0, 0, 0);
      (*(void (**)(uintptr_t, _QWORD, CFMutableDictionaryRef, _QWORD))(a1 + 1680))(a1, v28, v11, *(_QWORD *)(a1 + 1624));
      v27 = v11;
LABEL_27:
      CFRelease(v27);
    }
  }
  else
  {
    syslog(3, "IOMFB: FrameInfoNotifyFunc dropped notification, numArgs is %u, expected %u", a4, 2);
  }
}

void IOMobileFramebufferCRCNotifyFunc(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  void (*v4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);

  if (a4 == 3)
  {
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 1744);
    if (v4)
      v4(a1, *a3, a3[2], a3[4], *(_QWORD *)(a1 + 1688));
  }
  else
  {
    syslog(3, "not enough values for callback %d != %d\n", a4, 3);
  }
}

IONotificationPort *IOMobileFramebufferVsyncNotifyFunc(IONotificationPort *arg1, uint64_t a2, _QWORD *a3)
{
  IONotificationPort *v4;
  uint64_t v5;
  uint64_t v6;

  if (arg1)
  {
    v4 = arg1;
    if (*((_BYTE *)arg1 + 3240))
      kdebug_signpost(0x31800100u, (uintptr_t)arg1, 0, 0, 0);
    arg1 = iomfb_GetMachMessageCount(*((IONotificationPort **)v4 + 220));
    if (!(_DWORD)arg1)
    {
      v5 = *a3 | (a3[1] << 32);
      v6 = (*((uint64_t (**)(IONotificationPort *, _QWORD))v4 + 340))(v4, a3[2] | (a3[3] << 32));
      return (IONotificationPort *)(*((uint64_t (**)(IONotificationPort *, uint64_t, uint64_t, _QWORD, _QWORD))v4
                                    + 226))(v4, v5, v6, a3[4] | (a3[5] << 32), *((_QWORD *)v4 + 219));
    }
  }
  return arg1;
}

IONotificationPort *iomfb_GetMachMessageCount(IONotificationPort *result)
{
  __int128 v1;
  ipc_space_read_t v2;
  mach_port_t MachPort;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v6;
  unint64_t v7;

  if (result)
  {
    v7 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)port_info_out = v1;
    v6 = v1;
    port_info_outCnt = 10;
    v2 = *MEMORY[0x1E0C83DA0];
    MachPort = IONotificationPortGetMachPort(result);
    if (mach_port_get_attributes(v2, MachPort, 2, port_info_out, &port_info_outCnt))
      return 0;
    else
      return (IONotificationPort *)v6;
  }
  return result;
}

IONotificationPort *IOMobileFramebufferHdcpNotifyFunc(uint64_t a1, uint64_t a2, int a3)
{
  IONotificationPort *result;
  uint64_t (*v6)(uint64_t, _QWORD, BOOL);

  result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1568));
  if ((int)result <= 0)
  {
    v6 = *(uint64_t (**)(uint64_t, _QWORD, BOOL))(a1 + 1616);
    if (v6)
      return (IONotificationPort *)v6(a1, *(_QWORD *)(a1 + 1560), a3 != 0);
  }
  return result;
}

_QWORD *get_vsh_update_status(_QWORD *result)
{
  uint64_t (*v1)(void);
  const void *v2;
  uint64_t valuePtr;

  if (result)
  {
    v1 = (uint64_t (*)(void))result[251];
    if (v1)
    {
      result = (_QWORD *)v1();
      if (result)
      {
        v2 = result;
        valuePtr = 0;
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
        CFRelease(v2);
        return (_QWORD *)valuePtr;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __iomfb_populate_all_display_infos_block_invoke()
{
  uint64_t v0;
  io_object_t v1;
  BOOL v2;
  io_object_t v3;
  io_object_t v4;
  const __CFAllocator *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFData *v8;
  const __CFData *v9;
  __int128 v10;
  CFRange v11;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFData *v18;
  const __CFData *v19;
  __int128 v20;
  CFRange v21;
  int v25;
  io_iterator_t iterator;
  _BYTE buffer[32];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&s_cond_mutex);
  if (!s_number_display_pipes)
  {
    v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/arm-io");
    if ((_DWORD)v0)
    {
      v1 = v0;
      iterator = 0;
      if (MEMORY[0x1B5E4BD1C](v0, "IODeviceTree", &iterator))
        v2 = 1;
      else
        v2 = iterator == 0;
      if (!v2)
      {
        v3 = IOIteratorNext(iterator);
        if (v3)
        {
          v4 = v3;
          v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          do
          {
            v6 = CFStringCreateWithCString(v5, "device_type", 0x600u);
            if (v6)
            {
              v7 = v6;
              v8 = (const __CFData *)IORegistryEntrySearchCFProperty(v4, "IODeviceTree", v6, v5, 0);
              if (v8)
              {
                v9 = v8;
                *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&buffer[16] = v10;
                v28 = v10;
                *(_OWORD *)buffer = v10;
                if ((unint64_t)CFDataGetLength(v8) <= 0x30)
                  v11.length = CFDataGetLength(v9);
                else
                  v11.length = 48;
                v11.location = 0;
                CFDataGetBytes(v9, v11, buffer);
                v13 = *(_QWORD *)buffer == 0x2D79616C70736964
                   && *(_QWORD *)&buffer[8] == 0x6574737973627573
                   && buffer[16] == 109;
                if (v13
                  || (*(_QWORD *)buffer == 0x707369642D747865
                    ? (v14 = *(_QWORD *)&buffer[8] == 0x736275732D79616CLL)
                    : (v14 = 0),
                      v14 ? (v15 = *(_QWORD *)&buffer[13] == 0x6D65747379736275) : (v15 = 0),
                      v15))
                {
                  ++s_number_display_pipes;
                }
                CFRelease(v9);
              }
              CFRelease(v7);
            }
            v16 = CFStringCreateWithCString(v5, "compatible", 0x600u);
            if (v16)
            {
              v17 = v16;
              v18 = (const __CFData *)IORegistryEntrySearchCFProperty(v4, "IODeviceTree", v16, v5, 0);
              if (v18)
              {
                v19 = v18;
                *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&buffer[16] = v20;
                v28 = v20;
                *(_OWORD *)buffer = v20;
                if ((unint64_t)CFDataGetLength(v18) <= 0x30)
                  v21.length = CFDataGetLength(v19);
                else
                  v21.length = 48;
                v21.location = 0;
                CFDataGetBytes(v19, v21, buffer);
                if (*(_QWORD *)buffer == 0x7472697661726170
                  && *(_QWORD *)&buffer[8] == 0x6764657A696C6175
                  && *(_QWORD *)&buffer[16] == 0x2C73636968706172
                  && *(_QWORD *)&buffer[19] == 0x7570672C73636968)
                {
                  syslog(3, "%s: compatible: %s \n", "getDisplayListNumber", buffer);
                  ++s_number_display_pipes;
                }
                CFRelease(v19);
              }
              CFRelease(v17);
            }
            v4 = IOIteratorNext(iterator);
          }
          while (v4);
        }
        IOObjectRelease(iterator);
      }
      IOObjectRelease(v1);
    }
    else
    {
      syslog(3, "%s: IORegistryEntryFromPath unable to find /arm-io node\n", "getDisplayListNumber");
    }
  }
  syslog(6, "%s: %d\n", "getDisplayListNumber", s_number_display_pipes);
  pthread_mutex_unlock(&s_cond_mutex);
  if (s_number_display_pipes > s_number_display_instances)
  {
    *(_QWORD *)buffer = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutex_lock(&s_thr_init_mutex);
    v25 = pthread_create((pthread_t *)buffer, 0, (void *(__cdecl *)(void *))iomfb_populate_thread, 0);
    pthread_dependency_init_np();
    pthread_mutex_unlock(&s_thr_init_mutex);
    syslog(3, "%s: Spawn separate thread and wait for all FBs to be enumerated\n", "iomfb_populate_all_display_infos_block_invoke");
    if (v25)
      syslog(3, "%s: pthread_create error %d\n", "iomfb_populate_all_display_infos_block_invoke", v25);
    pthread_detach(*(pthread_t *)buffer);
    syslog(3, "%s: pthread_dependency_wait_np expect: %d current: %d \n", "iomfb_populate_all_display_infos_block_invoke", s_number_display_pipes, s_number_display_instances);
    pthread_dependency_wait_np();
    if (s_number_display_pipes != s_number_display_instances)
      syslog(3, "%s: Timeout: expect: %d current: %d\n", "iomfb_populate_all_display_infos_block_invoke", s_number_display_pipes, s_number_display_instances);
  }
}

uint64_t iomfb_populate_thread()
{
  uint64_t v0;
  const __CFDictionary *v1;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  unsigned int v4;
  unsigned int v5;
  const __CFAllocator *v6;
  uint64_t *v7;
  int v8;
  io_iterator_t notification;

  pthread_mutex_lock(&s_thr_init_mutex);
  syslog(3, "%s: iomfb_populate_matched_displays\n", "iomfb_populate_thread");
  pthread_once(&s_open_media_toolbox, open_media_toolbox);
  notification = 0;
  pthread_mutex_lock(&s_display_infos_mutex);
  if (!s_display_infos_len
    && (s_notification_port || (s_notification_port = (uint64_t)IONotificationPortCreate(*MEMORY[0x1E0CBBAA8])) != 0))
  {
    v1 = IOServiceMatching("IOMobileFramebuffer");
    if (v1)
    {
      if (!IOServiceAddMatchingNotification((IONotificationPortRef)s_notification_port, "IOServiceFirstMatch", v1, (IOServiceMatchingCallback)iomfb_match_callback, 0, &notification))
      {
        RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)s_notification_port);
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        if (s_virt_context_len)
        {
          v4 = s_display_infos_len;
          if (s_display_infos_len <= 0xF)
          {
            v5 = 1;
            v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
            do
            {
              v7 = &s_display_infos[20 * v4];
              v7[2] = v5 - 1;
              snprintf((char *)v7 + 24, 0x80uLL, "%s%d", "wireless", v5 - 1);
              *v7 = (uint64_t)CFStringCreateWithCStringNoCopy(0, (const char *)v7 + 24, 0x600u, v6);
              *((_DWORD *)v7 + 2) = 2;
              v8 = s_display_infos_len;
              s_displays[s_display_infos_len] = v7;
              v4 = v8 + 1;
              s_display_infos_len = v4;
            }
            while (v4 <= 0xF && v5++ < s_virt_context_len);
          }
        }
      }
    }
  }
  pthread_mutex_unlock(&s_display_infos_mutex);
  if (notification)
  {
    syslog(3, "%s: Local call to iomfb_match_callback\n", "iomfb_populate_matched_displays");
    iomfb_match_callback(v0, notification);
  }
  pthread_mutex_unlock(&s_thr_init_mutex);
  if (s_number_display_pipes != s_number_display_instances)
  {
    syslog(3, "%s: Start Runloop for 30 seconds\n", "iomfb_populate_thread");
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E0C9B280], 30.0, 1u);
    pthread_mutex_lock(&s_cond_mutex);
    if (s_number_display_pipes == s_number_display_instances)
    {
      syslog(3, "%s: Runloop Timer expired: FBs enumerated, no signalling needed from here as Callback would have notified main thread\n");
    }
    else if ((s_thread_notified & 1) != 0)
    {
      syslog(3, "%s: Runloop Timer expired: FB mismatch but still main thread notified - so avoiding notify here\n");
    }
    else
    {
      s_thread_notified = 1;
      syslog(3, "%s: Runloop Timer expired: FB still not enumerated, notify main thread\n", "iomfb_populate_thread");
      pthread_dependency_fulfill_np();
    }
    pthread_mutex_unlock(&s_cond_mutex);
  }
  return 0;
}

void open_media_toolbox()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  const char *v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  void (*v8)(void);
  char v9;

  v0 = 0;
  v1 = 0;
  v2 = 1;
  do
  {
    while (1)
    {
      v3 = v2;
      v4 = (&off_1E6927148)[v1];
      v5 = dlopen(v4, 2);
      if (v5)
        break;
      syslog(3, "IOMFB: %s not found\n", v4);
      v2 = 0;
      v1 = 1;
      v0 = 1;
      if ((v3 & 1) == 0)
        goto LABEL_10;
    }
    v6 = v5;
    v7 = (void (*)(void))dlsym(v5, "FigInstallVirtualDisplay");
    v8 = v7;
    if (v7)
      v7();
    dlclose(v6);
    v2 = 0;
    v9 = (v8 != 0) | v0;
    v0 = 1;
    v1 = 1;
  }
  while ((v9 & 1) == 0);
  if (v8)
    return;
LABEL_10:
  syslog(3, "IOMFB: FigInstallVirtualDisplay not found\n");
}

uint64_t iomfb_match_callback(uint64_t a1, io_iterator_t a2)
{
  unsigned int v2;
  const __CFAllocator *v3;
  io_object_t v4;
  io_registry_entry_t v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  _BOOL4 v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  int Value;
  _BOOL4 v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  const char *v20;
  uint64_t *v21;
  uint64_t *v22;
  int v23;
  int v24;
  uint64_t *v25;
  int v26;
  int v27;
  const __CFAllocator *contentsDeallocator;

  pthread_mutex_lock(&s_display_infos_mutex);
  v2 = s_display_infos_len;
  if (s_display_infos_len <= 0xF)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    contentsDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    do
    {
      v4 = IOIteratorNext(a2);
      if (!v4)
        break;
      v5 = v4;
      v6 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v4, "IOService", CFSTR("dfr"), v3, 0);
      if (v6)
      {
        v7 = v6;
        v8 = CFBooleanGetValue(v6) != 0;
        CFRelease(v7);
      }
      else
      {
        v8 = 0;
      }
      v9 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v5, "IOService", CFSTR("AppleTV"), v3, 0);
      if (v9 && (v10 = v9, Value = CFBooleanGetValue(v9), CFRelease(v10), Value))
      {
        v12 = 1;
      }
      else
      {
        v13 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v5, "IOService", CFSTR("external"), v3, 0);
        if (v13)
        {
          v14 = v13;
          v12 = CFBooleanGetValue(v13) != 0;
          CFRelease(v14);
        }
        else
        {
          v12 = 0;
        }
      }
      v15 = &s_display_infos[20 * v2];
      *((_DWORD *)v15 + 5) = v5;
      v16 = !v12 && !v8;
      *((_BYTE *)v15 + 152) = v16;
      if (!v8)
      {
        if (v12)
        {
          v18 = iomfb_match_callback_s_num++;
          v19 = &s_display_infos[20 * v2];
          *((_DWORD *)v19 + 4) = v18;
          v20 = (const char *)(v19 + 3);
          snprintf((char *)v19 + 24, 0x80uLL, "%s-%d", "external", v18);
          syslog(3, "%s: %s\n", "iomfb_match_callback", v20);
        }
        else
        {
          v21 = &s_display_infos[20 * v2];
          v21[3] = 0x7972616D697270;
          v21 += 3;
          *((_DWORD *)v21 - 2) = 0;
          syslog(3, "%s: %s\n", "iomfb_match_callback", (const char *)v21);
        }
      }
      else
      {
        v17 = &s_display_infos[20 * v2];
        *((_DWORD *)v17 + 4) = 0;
        *((_DWORD *)v17 + 6) = 7497316;
      }
      v22 = &s_display_infos[20 * v2];
      *v22 = (uint64_t)CFStringCreateWithCStringNoCopy(0, (const char *)v22 + 24, 0x600u, contentsDeallocator);
      if (v8)
        v23 = 3;
      else
        v23 = v12;
      *((_DWORD *)v22 + 2) = v23;
      v24 = s_display_infos_len;
      s_displays[s_display_infos_len] = v22;
      v2 = v24 + 1;
      s_display_infos_len = v24 + 1;
      if (!v8)
      {
        if (isServicingTwoExternalDisplay(v5) && !*((_DWORD *)v22 + 2))
        {
          v25 = &s_display_infos[20 * s_display_infos_len];
          v26 = iomfb_match_callback_s_num++;
          *((_DWORD *)v25 + 4) = v26;
          snprintf((char *)v25 + 24, 0x80uLL, "%s-%d", "external", v26);
          *((_DWORD *)v25 + 5) = v5;
          *((_BYTE *)v25 + 152) = v16;
          syslog(3, "%s: %s service is 0x%x\n", "iomfb_match_callback", (const char *)v25 + 24, v5);
          *v25 = (uint64_t)CFStringCreateWithCStringNoCopy(0, (const char *)v25 + 24, 0x600u, contentsDeallocator);
          *((_DWORD *)v25 + 2) = 1;
          v27 = s_display_infos_len;
          s_displays[s_display_infos_len] = v25;
          s_display_infos_len = v27 + 1;
          ++s_number_display_instances;
          ++s_number_display_pipes;
        }
        pthread_mutex_lock(&s_cond_mutex);
        if (s_number_display_pipes == ++s_number_display_instances && (s_thread_notified & 1) == 0)
        {
          s_thread_notified = 1;
          syslog(3, "%s: Notify main thread as all FB callbacks hit\n", "iomfb_match_callback");
          pthread_dependency_fulfill_np();
        }
        pthread_mutex_unlock(&s_cond_mutex);
        v2 = s_display_infos_len;
      }
    }
    while (v2 < 0x10);
  }
  return pthread_mutex_unlock(&s_display_infos_mutex);
}

void setIntValue(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

uint64_t virt_GetSupportedDigitalOutModes(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 2768) + 8))(*(_QWORD *)(a1 + 2760));
}

uint64_t virt_SetDigitalOutMode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (!*(_BYTE *)(a1 + 1360))
    *(_OWORD *)(a1 + 1344) = 0u;
  syslog(5, "IOMFB setting virtual mode: %d %d\n", a2, a3);
  v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 2768) + 16))(*(_QWORD *)(a1 + 2760), a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t virt_GetLayerDefaultSurface(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t result;

  if (a2)
    return 3758097084;
  result = 0;
  *a3 = *(_QWORD *)(a1 + 1312);
  return result;
}

uint64_t virt_GetDisplaySize(uint64_t a1, _OWORD *a2)
{
  pthread_mutex_t *v4;
  _OWORD *v5;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v5 = (_OWORD *)(a1 + 1344);
  if (*(double *)(a1 + 1344) == 0.0)
    *v5 = xmmword_1B55162D0;
  *a2 = *v5;
  pthread_mutex_unlock(v4);
  return 0;
}

CFTypeRef virt_CopyProperty(_QWORD *a1, void *key)
{
  const __CFDictionary *v4;
  const void *Value;
  uint64_t (*v7)(_QWORD, void *);

  v4 = (const __CFDictionary *)a1[341];
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, key);
    if (Value)
      return CFRetain(Value);
  }
  v7 = *(uint64_t (**)(_QWORD, void *))(a1[346] + 136);
  if (v7)
    return (CFTypeRef)v7(a1[345], key);
  else
    return 0;
}

uint64_t virt_SwapSetLayer(pthread_mutex_t *a1, unsigned int a2, __IOSurface *a3, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v13;
  uint64_t result;
  uint64_t v26;
  IOSurfaceID ID;
  uint64_t v28;
  char *v29;

  v13 = 3758097084;
  result = 3758097090;
  if (a1 && a2 <= 3)
  {
    pthread_mutex_lock(a1 + 29);
    if (a3)
    {
      v26 = 0;
      while (!*(_DWORD *)&a1[2].__opaque[v26 + 44])
      {
        v26 += 4;
        if (v26 == 16)
        {
          ID = IOSurfaceGetID(a3);
          v13 = 0;
          v28 = (uint64_t)&a1->__opaque[4 * a2 + 16];
          *(_DWORD *)(v28 + 156) = ID;
          *(_DWORD *)(v28 + 348) = a4;
          v29 = &a1->__opaque[16 * a2 + 16];
          *((_DWORD *)v29 + 43) = (int)a5;
          *((_DWORD *)v29 + 44) = (int)a6;
          *((_DWORD *)v29 + 45) = (int)a7;
          *((_DWORD *)v29 + 46) = (int)a8;
          *((_DWORD *)v29 + 67) = (int)a9;
          *((_DWORD *)v29 + 68) = (int)a10;
          *((_DWORD *)v29 + 69) = (int)a11;
          *((_DWORD *)v29 + 70) = (int)a12;
          break;
        }
      }
    }
    else
    {
      v13 = 0;
      *(_DWORD *)&a1[2].__opaque[4 * a2 + 44] = 0;
    }
    pthread_mutex_unlock(a1 + 29);
    return v13;
  }
  return result;
}

uint64_t virt_SwapSetEventWait()
{
  return 0;
}

uint64_t virt_SwapSetEventSignalOnGlass()
{
  return 0;
}

uint64_t virt_SwapSetEventSignal()
{
  return 0;
}

uint64_t virt_SwapDebugInfo()
{
  return 3758097095;
}

uint64_t virt_SwapBegin(uint64_t a1, int *a2)
{
  pthread_mutex_t *v4;
  int v5;
  int v6;
  unsigned int *v7;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  v5 = *(_DWORD *)(a1 + 2752);
  if ((v5 + 1) > 1)
    v6 = v5 + 1;
  else
    v6 = 1;
  *(_DWORD *)(a1 + 2752) = v6;
  *(_BYTE *)(a1 + 3184) = 0;
  bzero((void *)(a1 + 24), 0x508uLL);
  v7 = *(unsigned int **)(a1 + 3192);
  if (v7)
  {
    IOMFBGainMapRelease(a1, v7);
    *(_QWORD *)(a1 + 3192) = 0;
    v6 = *(_DWORD *)(a1 + 2752);
  }
  *(_DWORD *)(a1 + 176) = v6;
  *a2 = v6;
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t virt_SwapEnd(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  IOSurfaceRef v10;
  IOSurfaceRef v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_BYTE *)(a1 + 3184))
  {
    v3 = 3758097084;
    syslog(6, "IOMFB: ignoring cancelled swap\n");
    goto LABEL_3;
  }
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    v5 = mach_absolute_time();
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2712))(a1, v5);
  v7 = 0;
  while (!*(_DWORD *)(a1 + 4 * v7 + 180))
  {
    if (++v7 == 4)
    {
      LODWORD(v7) = 0;
      break;
    }
  }
  v8 = a1 + 4 * v7;
  v9 = *(unsigned int *)(v8 + 180);
  if (!(_DWORD)v9)
  {
LABEL_17:
    v12 = (int *)(a1 + 24 + 16 * v7);
    v3 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 2768) + 24))(*(_QWORD *)(a1 + 2760), 0, v9, *(unsigned int *)(a1 + 176), v6, *(unsigned int *)(a1 + 24 + 4 * v7 + 348), (double)v12[43], (double)v12[44], (double)v12[45], (double)v12[46], (double)v12[67], (double)v12[68], (double)v12[69], (double)v12[70]);
    if (*(_DWORD *)(a1 + 2792))
      ++*(_QWORD *)(a1 + 2784);
    if (!(_DWORD)v9)
      goto LABEL_3;
    goto LABEL_22;
  }
  v10 = IOSurfaceLookup(*(_DWORD *)(v8 + 180));
  if (v10)
  {
    v11 = v10;
    IOSurfaceSetTimestamp();
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(uint64_t))(a1 + 2712))(a1);
      IOSurfaceSetTimestamp();
    }
    if (*(_QWORD *)(a1 + 40))
    {
      (*(void (**)(uint64_t))(a1 + 2712))(a1);
      IOSurfaceSetTimestamp();
    }
    CFRelease(v11);
    goto LABEL_17;
  }
  v3 = 3758097084;
  syslog(3, "IOMFB: surface lookup failure for id: %d\n", v9);
LABEL_22:
  v13 = a1 + 2800;
  v14 = -1;
  while (*(_DWORD *)(v13 + 8) != (_DWORD)v9)
  {
    v13 += 24;
    if ((unint64_t)++v14 > 0xE)
      goto LABEL_3;
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 2768) + 128))(*(_QWORD *)(a1 + 2760), v9, *(_QWORD *)(v13 + 16), v3);
  if (*(_QWORD *)v13)
    CFRelease(*(CFTypeRef *)v13);
  *(_QWORD *)v13 = 0;
  *(_QWORD *)(v13 + 8) = 0;
  *(_QWORD *)(v13 + 16) = 0;
LABEL_3:
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t virt_SwapSignal()
{
  return 3758097084;
}

uint64_t virt_SwapWait(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 2768) + 32))(*(_QWORD *)(a1 + 2760), 0.0);
}

uint64_t virt_SwapWaitWithTimeout(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 2768) + 32))(*(_QWORD *)(a1 + 2760));
}

uint64_t virt_SwapCancel(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (pthread_mutex_t *)(a1 + 1856);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1856));
  if (*(_DWORD *)(a1 + 176) == a2)
  {
    v5 = 0;
    *(_BYTE *)(a1 + 3184) = 1;
  }
  else
  {
    v5 = 3758097090;
  }
  v6 = 0;
  while (!*(_DWORD *)(a1 + 180 + 4 * v6))
  {
    if (++v6 == 4)
    {
      LODWORD(v6) = 0;
      break;
    }
  }
  v7 = *(_DWORD *)(a1 + 4 * v6 + 180);
  if (v7)
  {
    v8 = a1 + 2800;
    v9 = -1;
    while (*(_DWORD *)(v8 + 8) != v7)
    {
      v8 += 24;
      if ((unint64_t)++v9 > 0xE)
        goto LABEL_16;
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 2768) + 128))(*(_QWORD *)(a1 + 2760));
    if (*(_QWORD *)v8)
      CFRelease(*(CFTypeRef *)v8);
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_16:
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t virt_GetRunLoopSource(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (**v4)(_QWORD);
  uint64_t (**v5)(_QWORD);
  uint64_t *v6;

  v2 = a1 + ((unint64_t)a2 << 6);
  v3 = *(_QWORD *)(v2 + 1448);
  if (!v3)
  {
    v4 = *(uint64_t (***)(_QWORD))(a1 + 2768);
    if (a2)
    {
      if (a2 == 2)
      {
        v5 = v4 + 18;
      }
      else
      {
        if (a2 != 5)
          return 0;
        v5 = v4 + 6;
      }
    }
    else
    {
      v5 = v4 + 9;
    }
    v6 = (uint64_t *)(v2 + 1448);
    v3 = (*v5)(*(_QWORD *)(a1 + 2760));
    *v6 = v3;
  }
  return v3;
}

uint64_t virt_EnableNotifications(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t (**v5)(_QWORD, void *, _QWORD *);
  void *v6;

  v4 = &a1[8 * (unint64_t)a2];
  v4[186] = a3;
  v4[179] = a4;
  if (a2 == 5)
  {
    v5 = (uint64_t (**)(_QWORD, void *, _QWORD *))(a1[346] + 56);
    v6 = IOMobileFramebufferVirtualDisplayVSyncNotificationFunc;
    return (*v5)(a1[345], v6, a1);
  }
  if (!a2)
  {
    v4[186] = virt_interceptHotplugCallback;
    a1[230] = a3;
    v5 = (uint64_t (**)(_QWORD, void *, _QWORD *))(a1[346] + 80);
    v6 = IOMobileFramebufferVirtualDisplayHotPlugDetectNotificationFunc;
    return (*v5)(a1[345], v6, a1);
  }
  return 3758097090;
}

uint64_t virt_DisableNotifications(uint64_t a1, int a2)
{
  uint64_t (**v2)(_QWORD);

  if (a2 == 5)
  {
    v2 = (uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 2768) + 64);
    return (*v2)(*(_QWORD *)(a1 + 2760));
  }
  if (!a2)
  {
    v2 = (uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 2768) + 88);
    return (*v2)(*(_QWORD *)(a1 + 2760));
  }
  return 3758097090;
}

uint64_t virt_GetHDCPDownstreamState(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  int v5;

  if (!a2)
    return 3758097090;
  result = (*(uint64_t (**)(_QWORD))(a1[346] + 96))(a1[345]);
  if ((_DWORD)result)
  {
    result = 0;
    v5 = a1[243] != 0;
    *a2 = 0x1000150434448;
    a2[1] = (v5 << 27);
  }
  return result;
}

uint64_t virt_GetProtectionOptions(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 2768);
  if (*(uint64_t *)v1 < 2)
    return 3758097095;
  else
    return (*(uint64_t (**)(_QWORD))(v1 + 168))(*(_QWORD *)(a1 + 2760));
}

uint64_t virt_EnableStatistics(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 2776) = 0u;
  *(_DWORD *)(a1 + 2792) = a2;
  return 0;
}

CFDictionaryRef virt_CreateStatistics(uint64_t a1, const __CFAllocator *a2)
{
  CFDictionaryRef v4;
  CFTypeRef cf;
  CFTypeRef v7;
  void *keys[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E6927158;
  cf = CFNumberCreate(0, kCFNumberCFIndexType, (const void *)(a1 + 2784));
  v7 = CFNumberCreate(0, kCFNumberCFIndexType, (const void *)(a1 + 2776));
  v4 = CFDictionaryCreate(a2, (const void **)keys, &cf, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFRelease(cf);
  CFRelease(v7);
  return v4;
}

uint64_t virt_gest_timestamp(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t virt_interceptHotplugCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t);

  if (a1)
  {
    v6 = *(void (**)(uint64_t, uint64_t))(a1 + 2312);
    if (v6)
      v6(a1, a2);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1840))(a1, a2, a3);
}

uint64_t IOMobileFramebufferVirtualDisplayHotPlugDetectNotificationFunc(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 1488))(a2, a1, *(_QWORD *)(a2 + 1432));
}

uint64_t IOMobileFramebufferVirtualDisplayVSyncNotificationFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  if (*(_DWORD *)(a4 + 2792))
    ++*(_QWORD *)(a4 + 2776);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a4 + 1808);
  v7 = (*(uint64_t (**)(uint64_t))(a4 + 2720))(a4);
  return v9(a4, a1, v7, a3, *(_QWORD *)(a4 + 1752));
}

uint64_t IOMFBgainencoder_emit_empty_rows(_DWORD *a1, unsigned int a2)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  int v7;

  if (!a1[70] || (result = IOMFBgainencoder_start_row(a1), (_DWORD)result))
  {
    if (a2)
    {
      result = finish_row(a1);
      if ((_DWORD)result)
      {
        v5 = 1;
        do
        {
          v6 = v5;
          if (a2 == v5)
            break;
          v7 = finish_row(a1);
          v5 = v6 + 1;
        }
        while (v7);
        return v6 >= a2;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t IOMFBgainencoder_repeat_row()
{
  return 0;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C990D8](theString);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
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

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x1E0CBADC0](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1E0CBADF0](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x1E0CBAE20]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x1E0CBAE28](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x1E0CBAE30](dataQueue);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
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

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x1E0CBB920](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD38](*(_QWORD *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD40](*(_QWORD *)&port);
}

uint64_t IOSurfaceSetTimestamp()
{
  return MEMORY[0x1E0CBBE38]();
}

uint64_t IOSurfaceSharedEventGetMachPort()
{
  return MEMORY[0x1E0CBBE60]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int kdebug_signpost(uint32_t code, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
  return MEMORY[0x1E0C83A18](*(_QWORD *)&code, arg1, arg2, arg3, arg4);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C83D20](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF0](alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

uint64_t pthread_dependency_fulfill_np()
{
  return MEMORY[0x1E0C84D60]();
}

uint64_t pthread_dependency_init_np()
{
  return MEMORY[0x1E0C84D68]();
}

uint64_t pthread_dependency_wait_np()
{
  return MEMORY[0x1E0C84D70]();
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x1E0C84D78](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

