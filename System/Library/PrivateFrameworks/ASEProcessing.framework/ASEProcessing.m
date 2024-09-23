BOOL match(uint64_t a1, uint64_t a2)
{
  return a1
      && a2
      && *(_DWORD *)a1 == *(_DWORD *)a2
      && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
      && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
      && *(float *)(a1 + 24) == *(float *)(a2 + 24);
}

_OWORD *createCacheNode(int *a1, uint64_t a2, int a3)
{
  _OWORD *v3;
  int v5;
  size_t v6;
  unsigned int v7;
  _OWORD *v8;
  __int128 v9;

  v3 = 0;
  if (a1 && a2 && a3)
  {
    v5 = *a1;
    if (*a1 == 4)
    {
      if (a3 != 1552)
        createCacheNode_cold_4();
      v6 = 1600;
      v7 = 1416888032;
    }
    else if (v5 == 3)
    {
      if (a3 != 2108)
        createCacheNode_cold_3();
      v6 = 2160;
      v7 = 1128583905;
    }
    else
    {
      if (v5 != 2)
        createCacheNode_cold_1();
      if (a3 != 1284)
        createCacheNode_cold_2();
      v6 = 1336;
      v7 = 1105201864;
    }
    v8 = malloc_type_malloc(v6, v7 | 0x10E004000000000);
    v3 = v8;
    if (v8)
    {
      v9 = *((_OWORD *)a1 + 1);
      *v8 = *(_OWORD *)a1;
      v8[1] = v9;
      *((_QWORD *)v8 + 4) = 0;
      *((_QWORD *)v8 + 5) = 0;
      __memmove_chk();
    }
  }
  return v3;
}

uint64_t addToFront(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (result && a2)
  {
    v2 = *(_QWORD *)(result + 8);
    if (v2)
    {
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = v2;
      v3 = (_QWORD *)(v2 + 32);
    }
    else
    {
      v3 = (_QWORD *)(result + 16);
    }
    *v3 = a2;
    *(_QWORD *)(result + 8) = a2;
    ++*(_DWORD *)result;
  }
  return result;
}

uint64_t removeNode(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a2 + 32);
    if (v3)
    {
      *(_QWORD *)(v3 + 40) = *(_QWORD *)(a2 + 40);
    }
    else if (*(_QWORD *)(a1 + 8) == a2)
    {
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 40);
    }
    v4 = *(_QWORD *)(a2 + 40);
    if (v4)
    {
      v5 = (_QWORD *)(v4 + 32);
    }
    else
    {
      v5 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 16) != a2)
        goto LABEL_11;
    }
    *v5 = v3;
LABEL_11:
    --*(_DWORD *)a1;
    return a2;
  }
  return v2;
}

double initCache(_OWORD *a1)
{
  double result;

  if (a1)
  {
    if (!disableHcuCache)
    {
      result = 0.0;
      a1[7] = 0u;
      a1[8] = 0u;
      a1[5] = 0u;
      a1[6] = 0u;
      a1[3] = 0u;
      a1[4] = 0u;
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
  }
  return result;
}

_QWORD *deleteCacheObject(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 8);
  if (result)
  {
    do
    {
      v4 = (_QWORD *)result[5];
      free(result);
      result = v4;
    }
    while (v4);
  }
  *(_DWORD *)a1 = 0;
  *v3 = 0;
  v3[1] = 0;
  return result;
}

void deleteCache(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  if (a1 && !disableHcuCache)
  {
    v3 = a1 + 1;
    v2 = (_QWORD *)a1[1];
    if (v2)
    {
      do
      {
        v4 = (_QWORD *)v2[5];
        free(v2);
        v2 = v4;
      }
      while (v4);
    }
    *(_DWORD *)a1 = 0;
    *v3 = 0;
    a1[2] = 0;
    v5 = (_QWORD *)a1[7];
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)v5[5];
        free(v5);
        v5 = v6;
      }
      while (v6);
    }
    *((_DWORD *)a1 + 12) = 0;
    a1[7] = 0;
    a1[8] = 0;
    v7 = (_QWORD *)a1[13];
    if (v7)
    {
      do
      {
        v8 = (_QWORD *)v7[5];
        free(v7);
        v7 = v8;
      }
      while (v8);
    }
  }
  free(a1);
}

uint64_t getCache(uint64_t a1, uint64_t a2, void *__dst, size_t __len)
{
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  result = 0;
  if (__dst && a2 && a1 && !disableHcuCache)
  {
    ++*(_QWORD *)(a1 + 24);
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
    {
      v7 = __len;
      v9 = *(_QWORD *)(a1 + 8);
      while (*(_DWORD *)a2 != *(_DWORD *)v9
           || *(_QWORD *)(a2 + 8) != *(_QWORD *)(v9 + 8)
           || *(_QWORD *)(a2 + 16) != *(_QWORD *)(v9 + 16)
           || *(float *)(a2 + 24) != *(float *)(v9 + 24))
      {
        v9 = *(_QWORD *)(v9 + 40);
        if (!v9)
          goto LABEL_12;
      }
      ++*(_QWORD *)(a1 + 32);
      if (v9 != v6)
      {
        v10 = removeNode(a1, v9);
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 8);
          if (v11)
          {
            *(_QWORD *)(v10 + 32) = 0;
            *(_QWORD *)(v10 + 40) = v11;
            v12 = (uint64_t *)(v11 + 32);
          }
          else
          {
            v12 = (uint64_t *)(a1 + 16);
          }
          *v12 = v10;
          *(_QWORD *)(a1 + 8) = v10;
          ++*(_DWORD *)a1;
        }
      }
      memmove(__dst, (const void *)(v9 + 48), v7);
      return 1;
    }
    else
    {
LABEL_12:
      result = 0;
      ++*(_QWORD *)(a1 + 40);
    }
  }
  return result;
}

uint64_t updateCache(uint64_t result, uint64_t a2, void *__src, size_t __len)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;

  if (!__src)
    return result;
  if (!a2)
    return result;
  v5 = result;
  if (!result || disableHcuCache)
    return result;
  v6 = __len;
  v8 = *(_QWORD *)(result + 8);
  if (!v8)
  {
LABEL_11:
    if (*(_DWORD *)result == 3)
    {
      v9 = (void *)removeNode(result, *(_QWORD *)(result + 16));
      free(v9);
    }
    result = (uint64_t)createCacheNode((int *)a2, (uint64_t)__src, v6);
    if (!result)
      return result;
LABEL_14:
    v10 = *(_QWORD *)(v5 + 8);
    if (v10)
    {
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = v10;
      v11 = (_QWORD *)(v10 + 32);
    }
    else
    {
      v11 = (_QWORD *)(v5 + 16);
    }
    *v11 = result;
    *(_QWORD *)(v5 + 8) = result;
    ++*(_DWORD *)v5;
    return result;
  }
  while (*(_DWORD *)a2 != *(_DWORD *)v8
       || *(_QWORD *)(a2 + 8) != *(_QWORD *)(v8 + 8)
       || *(_QWORD *)(a2 + 16) != *(_QWORD *)(v8 + 16)
       || *(float *)(a2 + 24) != *(float *)(v8 + 24))
  {
    v8 = *(_QWORD *)(v8 + 40);
    if (!v8)
      goto LABEL_11;
  }
  result = (uint64_t)memmove((void *)(v8 + 48), __src, __len);
  if (v8 != *(_QWORD *)(v5 + 8))
  {
    result = removeNode(v5, v8);
    if (result)
      goto LABEL_14;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

uint64_t getHcuId(int a1)
{
  if ((a1 - 1634952555) > 5)
    return 0;
  else
    return *((unsigned int *)&unk_2065198D4 + a1 - 1634952555);
}

uint64_t getHcuType(int a1)
{
  if ((a1 - 1) > 5)
    return 0;
  else
    return dword_2065198EC[a1 - 1];
}

uint64_t getHcuSize(int a1)
{
  if ((a1 - 1) > 5)
    return 0;
  else
    return dword_206519904[a1 - 1];
}

_BYTE *getMin(_BYTE *result)
{
  if (result)
  {
    if (*result)
      return (_BYTE *)(-1 << result[1]);
    else
      return 0;
  }
  return result;
}

uint64_t getMax(uint64_t result)
{
  if (result)
    return ~(-1 << *(_BYTE *)(result + 1));
  return result;
}

float *calcSlope(float *result, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  float v7;
  float v8;
  float v9;
  float v10;
  int v11;
  int v12;
  int v13;

  v3 = -1 << *(_BYTE *)(a2 + 5);
  if (*(_BYTE *)(a2 + 4))
    v4 = -1 << *(_BYTE *)(a2 + 5);
  else
    v4 = 0;
  v5 = (a3 - 1);
  result[3 * v5 + 2] = 0.0;
  if (a3 != 1)
  {
    v6 = ~v3;
    v7 = *result;
    result += 2;
    v8 = v7;
    do
    {
      v9 = v8;
      *result = 0.0;
      v8 = result[1];
      v10 = v8 - v9;
      if (v10 > 0.0)
      {
        v11 = (int)(float)((float)((float)(result[2] - *(result - 1)) * *(float *)(a2 + 8)) / v10);
        if (v6 >= v11)
          v12 = (int)(float)((float)((float)(result[2] - *(result - 1)) * *(float *)(a2 + 8)) / v10);
        else
          v12 = v6;
        if (v4 <= v11)
          v13 = v12;
        else
          v13 = v4;
        *result = (float)v13;
      }
      result += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t float_to_fixed(char a1, char a2, float a3)
{
  int v3;
  unsigned int v4;
  float v5;
  double v6;

  v3 = -1 << (a2 + a1);
  v4 = ~v3;
  v5 = 0.5;
  if (a3 < 0.0)
    v5 = -0.5;
  v6 = v5 + (float)((float)(1 << a2) * a3);
  if (v6 > (double)v4)
    v6 = (double)v4;
  return (int)v6 & ~v3;
}

uint64_t interpolate_int(uint64_t result, int a2, float a3, float a4, float a5)
{
  if (a4 != a5)
    return (int)(float)((float)(int)result
                                    + (float)((float)(a2 - result) * (float)((float)(a3 - a4) / (float)(a5 - a4))));
  return result;
}

float interpolate(float a1, float a2, float a3, float a4, float a5)
{
  if (a2 == a3)
    return a4;
  else
    return a4 + (float)((float)(a5 - a4) * (float)((float)(a1 - a2) / (float)(a3 - a2)));
}

float *copyPieceWiseCurve(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  int v4;
  float32x2_t v5;
  float32x2_t v6;
  int v7;
  char v8;
  int v9;
  float v10;
  uint64_t v11;
  float32x2_t *v12;
  int8x8_t *v13;
  float32x2_t v14;

  if (a4)
  {
    v4 = -1 << a4[1];
    v5.f32[0] = (float)v4;
    v6.f32[0] = (float)~v4;
    if (!*a4)
      v5.f32[0] = 0.0;
  }
  else
  {
    v5.i32[0] = 0;
    v6.i32[0] = 0;
  }
  v7 = a4[2];
  v8 = a4[3];
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (a3)
  {
    v9 = -1 << v8;
    v10 = (float)v9;
    if (!v7)
      v10 = 0.0;
    v11 = a3;
    v5.f32[1] = v10;
    v6.f32[1] = (float)~v9;
    v12 = (float32x2_t *)(a2 + 4);
    v13 = (int8x8_t *)a1;
    do
    {
      v14 = *v12++;
      *v13 = vbsl_s8((int8x8_t)vcgt_f32(v5, v14), (int8x8_t)v5, vbsl_s8((int8x8_t)vcgt_f32(v14, v6), (int8x8_t)v6, (int8x8_t)v14));
      v13 = (int8x8_t *)((char *)v13 + 12);
      --v11;
    }
    while (v11);
  }
  return calcSlope((float *)a1, (uint64_t)a4, a3);
}

void copyArray(int *a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  int *v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v6 = a1;
  if (a4)
  {
    if (*a4)
      v7 = -1 << a4[1];
    else
      v7 = 0;
    v8 = ~(-1 << a4[1]);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  if (a3 >= 0x11)
    copyArray_cold_1();
  bzero(a1, 4 * a3);
  if (a3)
  {
    v9 = a3;
    v10 = (int *)(a2 + 4);
    do
    {
      v12 = *v10++;
      v11 = v12;
      if (v12 >= v8)
        v13 = v8;
      else
        v13 = v11;
      if (v11 >= v7)
        v14 = v13;
      else
        v14 = v7;
      *v6++ = v14;
      --v9;
    }
    while (v9);
  }
}

float *interpolateTwoPieceWiseCurves(uint64_t a1, float *a2, float *a3, unsigned int a4, _BYTE *a5, float a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  float *v11;
  float v12;
  float v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float *v19;
  float v20;
  double v21;
  double v22;
  int v23;
  int v24;
  int v25;
  float v26;
  double v27;
  double v28;
  int v29;
  int v30;
  int v31;

  if (a5)
  {
    if (*a5)
      v6 = -1 << a5[1];
    else
      v6 = 0;
    v7 = ~(-1 << a5[1]);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = -1 << a5[3];
  if (a5[2])
    v9 = -1 << a5[3];
  else
    v9 = 0;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (a4)
  {
    v10 = ~v8;
    v12 = *a2;
    v11 = a2 + 2;
    v13 = v12;
    v15 = *a3;
    v14 = a3 + 2;
    v16 = v15;
    v17 = (float)(a6 - v13) / (float)(v15 - v13);
    v18 = a4;
    v19 = (float *)(a1 + 4);
    do
    {
      v20 = *(v11 - 1);
      if (v13 != v16)
        v20 = v20 + (float)((float)(*(v14 - 1) - v20) * v17);
      v21 = v20;
      if (v20 >= 0.0)
        v22 = 0.5;
      else
        v22 = -0.5;
      v23 = (int)(v22 + v21);
      if (v7 >= v23)
        v24 = (int)(v22 + v21);
      else
        v24 = v7;
      if (v6 <= v23)
        v25 = v24;
      else
        v25 = v6;
      *(v19 - 1) = (float)v25;
      v26 = *v11;
      if (v13 != v16)
        v26 = v26 + (float)((float)(*v14 - v26) * v17);
      v27 = v26;
      if (v26 >= 0.0)
        v28 = 0.5;
      else
        v28 = -0.5;
      v29 = (int)(v28 + v27);
      if (v10 >= v29)
        v30 = (int)(v28 + v27);
      else
        v30 = v10;
      if (v9 <= v29)
        v31 = v30;
      else
        v31 = v9;
      *v19 = (float)v31;
      v19 += 3;
      v11 += 2;
      v14 += 2;
      --v18;
    }
    while (v18);
  }
  return calcSlope((float *)a1, (uint64_t)a5, a4);
}

float *copyPieceWiseCurves(uint64_t a1, _BYTE *a2)
{
  unsigned int v4;
  uint8_t v6[16];

  if (!a2 || *a2 || (v4 = a2[2], v4 >= 0x11))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_CONSTANT && input->pointCount <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 185\n", v6, 2u);
    }
    if (!a2 || *a2 || (v4 = a2[2], v4 >= 0x11))
      copyPieceWiseCurves_cold_1();
  }
  return copyPieceWiseCurve(a1, (uint64_t)(a2 + 16), v4, a2 + 4);
}

void interpolatePieceWiseCurves(uint64_t a1, uint64_t a2, float a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float v13;
  uint8_t v14[16];

  if (!a2 || *(_BYTE *)a2 != 1 || (v6 = *(unsigned __int8 *)(a2 + 2), v6 >= 0x11))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_INTERPOLATED && input->pointCount <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 193\n", v14, 2u);
    }
    if (!a2 || *(_BYTE *)a2 != 1 || (v6 = *(unsigned __int8 *)(a2 + 2), v6 >= 0x11))
      interpolatePieceWiseCurves_cold_1();
  }
  v7 = a2 + 16;
  if (*(float *)(a2 + 16) >= a3
    || (v8 = a2 + 132 * *(unsigned __int8 *)(a2 + 1), v9 = *(float *)(v8 - 116), v7 = v8 - 116, v9 <= a3))
  {
    copyPieceWiseCurve(a1, v7, v6, (_BYTE *)(a2 + 4));
  }
  else
  {
    v10 = a2 + 16;
    v11 = v6 + 1;
    while (--v11)
    {
      v12 = (float *)(v10 + 132);
      v13 = *(float *)(v10 + 132);
      v10 += 132;
      if (v13 > a3)
      {
        interpolateTwoPieceWiseCurves(a1, v12 - 33, v12, v6, (_BYTE *)(a2 + 4), a3);
        return;
      }
    }
  }
}

void interpolateTwoArrays(int *a1, _DWORD *a2, float *a3, unsigned int a4, _BYTE *a5, float a6)
{
  int *v10;
  int v11;
  int v12;
  int *v13;
  float v14;
  float v15;
  uint64_t v16;
  _DWORD *v17;
  float v18;
  float v19;
  float v20;
  int v21;
  int v22;
  int v23;
  int v24;

  v10 = a1;
  if (a5)
  {
    if (*a5)
      v11 = -1 << a5[1];
    else
      v11 = 0;
    v12 = ~(-1 << a5[1]);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  bzero(a1, 4 * a4);
  if (a4)
  {
    v14 = *(float *)a2;
    v13 = a2 + 1;
    v15 = v14;
    v16 = a4;
    v18 = *a3;
    v17 = a3 + 1;
    v19 = v18;
    v20 = (float)(a6 - v15) / (float)(v18 - v15);
    do
    {
      v22 = *v13++;
      v21 = v22;
      if (v15 != v19)
        v21 = (int)(float)((float)v21 + (float)((float)(*v17 - v21) * v20));
      if (v21 >= v12)
        v23 = v12;
      else
        v23 = v21;
      if (v21 >= v11)
        v24 = v23;
      else
        v24 = v11;
      *v10++ = v24;
      ++v17;
      --v16;
    }
    while (v16);
  }
}

void interpolateArray(int *a1, uint64_t a2, float a3)
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  float v12;
  unsigned int v13;
  _BYTE *v14;
  int *v15;
  uint8_t v16[16];

  if (!a2 || *(_BYTE *)a2 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_INTERPOLATED\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 247\n", v16, 2u);
    }
    if (!a2 || *(_BYTE *)a2 != 1)
      interpolateArray_cold_1();
  }
  v6 = a2 + 8;
  if (*(float *)(a2 + 8) >= a3)
  {
    v13 = *(unsigned __int8 *)(a2 + 2);
    v14 = (_BYTE *)(a2 + 3);
    v15 = a1;
LABEL_15:
    copyArray(v15, v6, v13, v14);
    return;
  }
  v7 = a2 + 68 * *(unsigned __int8 *)(a2 + 1);
  v8 = *(float *)(v7 - 60);
  v6 = v7 - 60;
  if (v8 <= a3)
  {
    v14 = (_BYTE *)(a2 + 3);
    v15 = a1;
    v13 = *(unsigned __int8 *)(a2 + 2);
    goto LABEL_15;
  }
  v9 = a2 + 8;
  v10 = *(unsigned __int8 *)(a2 + 2) + 1;
  while (--v10)
  {
    v11 = (float *)(v9 + 68);
    v12 = *(float *)(v9 + 68);
    v9 += 68;
    if (v12 > a3)
    {
      interpolateTwoArrays(a1, (_DWORD *)v11 - 17, v11, *(unsigned __int8 *)(a2 + 2), (_BYTE *)(a2 + 3), a3);
      return;
    }
  }
}

int8x8_t populateScalingConfig(int8x8_t *a1, _DWORD *a2, int8x8_t a3, float a4, int32x2_t a5)
{
  float32x2_t v7;
  _BOOL4 v8;
  float32x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  int8x8_t result;
  float32x2_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  a5.i32[0] = overrideASEScalingFactor;
  *(float *)&a3.i32[1] = a4;
  v7 = (float32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(*(float *)&overrideASEScalingFactor != 0.0), 0x1FuLL)), (int8x8_t)vdup_lane_s32(a5, 0), a3);
  if (logLevel >= 3)
  {
    v18 = v7;
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    v7 = v18;
    if (v8)
    {
      *(_DWORD *)buf = 136315650;
      v20 = "void populateScalingConfig(scalingConfigV3Hcu *, float, float, uint32_t *)";
      v21 = 2048;
      v22 = v18.f32[0];
      v23 = 2048;
      v24 = v18.f32[1];
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : xScaler = %f, yScaler = %f\n", buf, 0x20u);
      v7 = v18;
    }
  }
  __asm { FMOV            V0.2S, #1.0 }
  v14 = vdiv_f32(_D0, v7);
  v15 = vaddq_f64(vcvtq_f64_f32(vmul_f32(v14, (float32x2_t)vdup_n_s32(0x4A800000u))), vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcltz_f32(v14), (int8x8_t)0xBF000000BF000000, (int8x8_t)0x3F0000003F000000)));
  v16 = (float64x2_t)vdupq_n_s64(0x415FFFFFC0000000uLL);
  result = vand_s8((int8x8_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v15, v16), (int8x16_t)v16, (int8x16_t)v15))), (int8x8_t)0x7F0000007FLL);
  *a1 = 0;
  a1[1] = result;
  a1[2].i32[0] = 0;
  a1[2].i32[1] = 0;
  *a2 |= 2u;
  return result;
}

uint64_t populatePeakingConfig(char *__dst, const void *a2, uint64_t a3, uint64_t a4, _DWORD *a5, float32_t a6)
{
  float32x2_t v6;
  uint64_t result;
  float32x2_t v13;
  __int128 v14;
  int v15;
  int v16;
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  LODWORD(v17) = 2;
  if (*(float *)&overrideASEScalingFactor == 0.0)
    v6.f32[0] = a6;
  else
    v6.f32[0] = *(float *)&overrideASEScalingFactor;
  *((_QWORD *)&v17 + 1) = a2;
  *(_QWORD *)&v18 = a3;
  DWORD2(v18) = v6.i32[0];
  result = getCache(a4, (uint64_t)&v17, __dst, 0x504uLL);
  if ((result & 1) == 0)
  {
    if (a2)
      memmove(__dst, a2, 0x504uLL);
    else
      bzero(__dst, 0x504uLL);
    copyPieceWiseCurves((uint64_t)(__dst + 4), *(_BYTE **)a3);
    interpolatePieceWiseCurves((uint64_t)(__dst + 388), *(_QWORD *)(a3 + 8), v6.f32[0]);
    interpolatePieceWiseCurves((uint64_t)(__dst + 772), *(_QWORD *)(a3 + 16), v6.f32[0]);
    interpolateArray((int *)__dst + 294, *(_QWORD *)(a3 + 24), v6.f32[0]);
    interpolateArray((int *)__dst + 296, *(_QWORD *)(a3 + 32), v6.f32[0]);
    interpolateArray((int *)__dst + 299, *(_QWORD *)(a3 + 40), v6.f32[0]);
    interpolateArray((int *)__dst + 303, *(_QWORD *)(a3 + 48), v6.f32[0]);
    interpolateArray((int *)__dst + 308, *(_QWORD *)(a3 + 56), v6.f32[0]);
    interpolateArray((int *)__dst + 314, *(_QWORD *)(a3 + 64), v6.f32[0]);
    v13.i32[0] = 2.5;
    *(int8x8_t *)&v14 = vbsl_s8((int8x8_t)vdup_lane_s32((int32x2_t)vmvn_s8((int8x8_t)vcge_f32(v13, v6)), 0), (int8x8_t)0x1A00000010, (int8x8_t)0x1E0000001ALL);
    if (v6.f32[0] <= 2.5)
      v15 = 0;
    else
      v15 = 28;
    if (v6.f32[0] <= 2.5)
      v16 = 1;
    else
      v16 = 2;
    *((_QWORD *)&v14 + 1) = v14;
    *(_DWORD *)__dst = v15;
    *((_DWORD *)__dst + 289) = v16;
    *(_OWORD *)(__dst + 1160) = v14;
    result = updateCache(a4, (uint64_t)&v17, __dst, 0x504uLL);
  }
  *a5 |= 4u;
  return result;
}

uint64_t populateEbeConfig(int *__dst, const void *a2, uint64_t *a3, uint64_t a4, _DWORD *a5, float a6)
{
  float v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  LODWORD(v13) = 3;
  if (*(float *)&overrideASEScalingFactor == 0.0)
    v10 = a6;
  else
    v10 = *(float *)&overrideASEScalingFactor;
  *((_QWORD *)&v13 + 1) = a2;
  *(_QWORD *)&v14 = a3;
  *((float *)&v14 + 2) = v10;
  v11 = a4 + 48;
  result = getCache(a4 + 48, (uint64_t)&v13, __dst, 0x83CuLL);
  if ((result & 1) == 0)
  {
    if (a2)
      memmove(__dst, a2, 0x83CuLL);
    else
      bzero(__dst, 0x83CuLL);
    interpolatePieceWiseCurves((uint64_t)__dst, *a3, v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 96), a3[1], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 192), a3[2], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 288), a3[3], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 384), a3[4], v10);
    interpolateArray(__dst + 509, a3[5], v10);
    result = updateCache(v11, (uint64_t)&v13, __dst, 0x83CuLL);
  }
  *a5 |= 8u;
  return result;
}

uint64_t populateBlendConfig(void *__dst, const void *a2, uint64_t *a3, uint64_t a4, _DWORD *a5, float a6)
{
  float v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  LODWORD(v13) = 4;
  if (*(float *)&overrideASEScalingFactor == 0.0)
    v10 = a6;
  else
    v10 = *(float *)&overrideASEScalingFactor;
  *((_QWORD *)&v13 + 1) = a2;
  *(_QWORD *)&v14 = a3;
  *((float *)&v14 + 2) = v10;
  v11 = a4 + 96;
  result = getCache(a4 + 96, (uint64_t)&v13, __dst, 0x610uLL);
  if ((result & 1) == 0)
  {
    if (a2)
      memmove(__dst, a2, 0x610uLL);
    else
      bzero(__dst, 0x610uLL);
    interpolatePieceWiseCurves((uint64_t)__dst, *a3, v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 384, a3[1], v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 768, a3[2], v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 1152, a3[3], v10);
    result = updateCache(v11, (uint64_t)&v13, __dst, 0x610uLL);
  }
  *a5 |= 0x10u;
  return result;
}

_QWORD *populateAngleDetectConfig(_QWORD *result, _QWORD *a2, _DWORD *a3)
{
  *result = *a2;
  *a3 |= 0x20u;
  return result;
}

void populateNoiseConfig(int *a1, int a2, int a3, int a4, _DWORD *a5)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *a1 = a2 - 22;
  a1[1] = a3 - 22;
  a1[2] = a4;
  *(_QWORD *)(a1 + 3) = 0x400000007;
  *a5 |= 0x40u;
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *a1;
    v7 = a1[1];
    v8 = a1[2];
    v9 = a1[3];
    v10 = a1[4];
    v11[0] = 67110144;
    v11[1] = v6;
    v12 = 1024;
    v13 = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", (uint8_t *)v11, 0x20u);
  }
}

void calculate_control_setting_V3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9, unsigned int *a10, _DWORD *a11, unsigned int *a12, int a13, unsigned int a14, unsigned int a15, uint64_t a16, _DWORD *a17)
{
  uint64_t v17;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  unsigned int *v22;
  int *v23;
  int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int8x8_t *v30;
  int8x8_t *v31;
  _DWORD *v32;
  int8x8_t v33;
  int32x2_t v34;
  _DWORD *v35;
  float v36;
  float v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  _BOOL4 v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  _DWORD *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  _BOOL4 v58;
  int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  int *v70;
  int *v71;
  unsigned int *v72;
  int v73;
  int v74;
  unsigned int *v75;
  _DWORD *v76;
  int *v77;
  int *v78;
  int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t i;
  int v85;
  signed int v86;
  int v87;
  uint64_t v88;
  unsigned int v89;
  unint64_t v90;
  double v91;
  signed int v92;
  signed int v93;
  unsigned int v94;
  _BOOL4 v95;
  NSObject *v96;
  const char *v97;
  unsigned int v98;
  int *v99;
  unsigned int *v100;
  int v101;
  _BOOL4 v102;
  char *v103;
  int *v104;
  NSObject *v105;
  int v106;
  _BOOL4 v107;
  unsigned int v108;
  int v109;
  int v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  int *v114;
  int *v115;
  _DWORD *v116;
  int v117;
  int8x8_t *v118;
  int *v119;
  unsigned int v120;
  int8x8_t *v121;
  unsigned int v122;
  _OWORD v123[97];
  _OWORD __dst[97];
  _OWORD __src[132];
  _OWORD v126[132];
  _OWORD v127[81];
  _OWORD v128[81];
  uint8_t buf[4];
  _BYTE v130[10];
  const char *v131;
  int v132;
  __int16 v133;
  unsigned int v134;
  __int16 v135;
  int v136;
  __int16 v137;
  int v138;
  uint64_t v139;

  v17 = MEMORY[0x24BDAC7A8]();
  v19 = v18;
  v21 = v20;
  v23 = (int *)v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = (_DWORD *)v17;
  v139 = *MEMORY[0x24BDAC8D0];
  v110 = *v20;
  v112 = *v22;
  v108 = *a9;
  v109 = *v18;
  if (!isT1OrNewer(a13))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v126[0]) = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 508\n", (uint8_t *)v126, 2u);
    }
    if (!isT1OrNewer(a13))
      calculate_control_setting_V3_cold_1();
  }
  v119 = v23;
  v114 = v19;
  v115 = v21;
  v35 = a17;
  *a17 = 0;
  *(float *)v33.i32 = (float)a14 / (float)v29;
  v36 = (float)a15 / (float)v27;
  if (*(float *)v33.i32 >= v36)
    v37 = (float)a15 / (float)v27;
  else
    v37 = (float)a14 / (float)v29;
  v121 = v31;
  *(float *)v34.i32 = (float)v27;
  populateScalingConfig(v31 + 2, a17, v33, v36, v34);
  memset(v128, 0, 512);
  memset(v127, 0, 512);
  memset(v126, 0, 512);
  memset(__src, 0, 512);
  memset(__dst, 0, 512);
  memset(&v123[22], 0, 160);
  v38 = 100 * v32[94];
  v39 = v32[30];
  if (v39 <= v32[46])
    v39 = v32[46];
  memset(&v123[2], 0, 320);
  v40 = v38 / v39;
  v122 = v29;
  v42 = v29 > 0x383 && v27 > 0x1F3;
  v107 = v42;
  memset(v123, 0, 32);
  v120 = v40;
  if (v25)
  {
    v43 = v27;
    v44 = v32[16] + v32[15];
    v45 = *a10 - v44;
    v46 = v32[32] + v32[31];
    v47 = a11;
    v48 = *a11;
    v49 = *a12;
    if (v44 > *a10)
      v45 = v44 - *a10;
    if (v44 >= *a10)
      v44 = *a10;
    v50 = v46 - v48;
    if (v46 <= v48)
      v50 = *a11 - v46;
    v51 = 100 * v45 / v44;
    v52 = 100 * v50;
    if (v46 >= v48)
      v53 = *a11;
    else
      v53 = v32[32] + v32[31];
    v54 = v52 / v53;
    if (v51 <= v54)
      v51 = v54;
    v55 = v40 - v49;
    if (v40 <= v49)
      v55 = *a12 - v40;
    v56 = 100 * v55;
    if (v40 >= v49)
      v57 = *a12;
    else
      v57 = v40;
    v58 = v51 + v56 / v57 > 0x64;
  }
  else
  {
    v47 = a11;
    v43 = v27;
    v58 = 0;
  }
  v59 = *v32;
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v60 = *a12;
    v61 = v32[16] + v32[15];
    v62 = *a10;
    v63 = v32[32] + v32[31];
    v64 = *v47;
    *(_DWORD *)buf = 67110656;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = v120;
    LOWORD(v131) = 1024;
    *(_DWORD *)v130 = v58;
    *(_DWORD *)((char *)&v131 + 2) = v60;
    HIWORD(v131) = 1024;
    v132 = v61;
    v133 = 1024;
    v135 = 1024;
    v136 = v63;
    v137 = 1024;
    v134 = v62;
    v138 = v64;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
      buf,
      0x2Cu);
  }
  if (!v25 || (int)(100 * v59 / (v29 - 22) * (v43 - 22)) < 20 || v25 != 1 && v58)
  {
    populatePeakingConfig((char *)&v121[6], &peakingConfig_InitialSettingVideo_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
    populateEbeConfig((int *)&v121[167] + 1, &ebeConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
    populateBlendConfig(&v121[432], &blendConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
    if (logLevel < 3)
    {
      v66 = 0;
      v67 = 0;
      v68 = 4;
      v69 = 1;
      v70 = v19;
      v65 = v122;
    }
    else
    {
      v65 = v29;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v130 = &peakingConfig_InitialSettingVideo_V3;
        *(_WORD *)&v130[8] = 2080;
        v131 = "peakingConfig_InitialSettingVideo_V3";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      v66 = 0;
      v67 = 0;
      v68 = 4;
      v69 = 1;
      v70 = v114;
    }
    v71 = v115;
    v72 = a10;
    goto LABEL_48;
  }
  v80 = 0;
  v81 = 0;
  v82 = 0;
  do
  {
    v81 += v32[v80 + 23];
    v82 += v32[v80 + 39];
    ++v80;
  }
  while (v80 != 7);
  v83 = 0;
  for (i = 79; i != 94; ++i)
    v83 += v32[i];
  v85 = 10 * v32[46] / v82 + 10 * v32[30] / v81;
  v86 = 10 * v32[94] / v83;
  if (v86 <= 349)
    v85 = 350 * v85 / v86;
  v87 = 0;
  v88 = 47;
  v89 = v112;
  do
    v87 += v32[v88++];
  while (v88 != 62);
  HIDWORD(v90) = 1079574528;
  LODWORD(v90) = *v32;
  v91 = (double)v87 * 100.0 / (double)v90;
  if (v91 >= 7.0)
  {
    if (v91 > 8.0)
    {
      if (v112 - 1 <= 4)
        v89 = 4;
      else
        v89 = v112 - 1;
    }
  }
  else
  {
    v89 = v112 + 1;
  }
  if (v89 <= 0xE)
  {
    if (v89 < 0xA)
    {
      if (v89 < 6)
        v92 = 0;
      else
        v92 = (50 * v89 - 300) >> 2;
    }
    else
    {
      v92 = ((50 * (_BYTE)v89 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    v92 = 100;
  }
  v113 = v89;
  if (v85 <= 30)
  {
    if (v85 < 24)
    {
      if (v85 < 12)
        v93 = 100;
      else
        v93 = (unsigned __int16)(50 * (24 - v85)) / 0xCu + 50;
    }
    else
    {
      v93 = (unsigned __int16)(50 * (30 - v85)) / 6u;
    }
  }
  else
  {
    v93 = 0;
  }
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = v92;
    LOWORD(v131) = 1024;
    *(_DWORD *)v130 = v25;
    *(_DWORD *)((char *)&v131 + 2) = v93;
    HIWORD(v131) = 1024;
    v132 = v85;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
  }
  if (v92 <= v93)
    v94 = v93;
  else
    v94 = v92;
  v106 = v43;
  if (isPhone(a13) && isT1OrNewer(a13))
  {
    v95 = v107;
    if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V3\n", buf, 2u);
    }
    if (v107)
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_Heavy_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_Heavy_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_Heavy_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level3_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level3_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_level3_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level2_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level2_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_iPhone_Video_level2_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_172;
            *(_WORD *)buf = 0;
            v96 = MEMORY[0x24BDACB70];
            v97 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level1_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level1_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_iPhone_Video_level1_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_172;
          *(_WORD *)buf = 0;
          v96 = MEMORY[0x24BDACB70];
          v97 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_light_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_light_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_iPhone_Video_light_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_light_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_light_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_iPhone_Video_light_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_172;
        *(_WORD *)buf = 0;
        v96 = MEMORY[0x24BDACB70];
        v97 = " [1.37.0] Film grain level light\n";
      }
    }
    else
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level heavy LargeRatio\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level 3 LargeRatio\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_172;
            *(_WORD *)buf = 0;
            v96 = MEMORY[0x24BDACB70];
            v97 = " [1.37.0] Film grain level 2 LargeRatio\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_172;
          *(_WORD *)buf = 0;
          v96 = MEMORY[0x24BDACB70];
          v97 = " [1.37.0] Film grain level 1 LargeRatio\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_172;
        *(_WORD *)buf = 0;
        v96 = MEMORY[0x24BDACB70];
        v97 = " [1.37.0] Film grain level light LargeRatio\n";
      }
    }
  }
  else
  {
    v95 = v107;
    if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPad control setting V3\n", buf, 2u);
    }
    if (v107)
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_Heavy_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_Heavy_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_Heavy_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_Heavy_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_level3_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level3_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_level3_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_level3_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level3_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_level3_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_Video_level2_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level2_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_SettingVideo_level2_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_Video_level2_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level2_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_SettingVideo_level2_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_172;
            *(_WORD *)buf = 0;
            v96 = MEMORY[0x24BDACB70];
            v97 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_Video_level1_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level1_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_SettingVideo_level1_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_Video_level1_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level1_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_SettingVideo_level1_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_172;
          *(_WORD *)buf = 0;
          v96 = MEMORY[0x24BDACB70];
          v97 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_Video_light_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_light_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_SettingVideo_light_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_Video_light_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_light_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_SettingVideo_light_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_172;
        *(_WORD *)buf = 0;
        v96 = MEMORY[0x24BDACB70];
        v97 = " [1.37.0] Film grain level light\n";
      }
    }
    else
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_Heavy_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level heavy LargeRatio\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_level3_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_level3_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_172;
              *(_WORD *)buf = 0;
              v96 = MEMORY[0x24BDACB70];
              v97 = " [1.37.0] Film grain level 3 LargeRatio\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_Video_level2_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_SettingVideo_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_Video_level2_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_SettingVideo_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_172;
            *(_WORD *)buf = 0;
            v96 = MEMORY[0x24BDACB70];
            v97 = " [1.37.0] Film grain level 2 LargeRatio\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_Video_level1_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_SettingVideo_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_Video_level1_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_SettingVideo_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_172;
          *(_WORD *)buf = 0;
          v96 = MEMORY[0x24BDACB70];
          v97 = " [1.37.0] Film grain level 1 LargeRatio\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_Video_light_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_SettingVideo_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_Video_light_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_SettingVideo_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_172;
        *(_WORD *)buf = 0;
        v96 = MEMORY[0x24BDACB70];
        v97 = " [1.37.0] Film grain level light LargeRatio\n";
      }
    }
  }
  _os_log_impl(&dword_206505000, v96, OS_LOG_TYPE_DEFAULT, v97, buf, 2u);
LABEL_172:
  if (v94 <= 0x14)
    v66 = v108 + 1;
  else
    v66 = 0;
  if (v94 > 0x14)
    v98 = v109 + 1;
  else
    v98 = 0;
  if (!v110)
  {
    if (v66 >= 0x30)
      v66 = 48;
    if (v98 > 0x18)
    {
      v99 = v71;
      v100 = v72;
      v67 = 0;
      goto LABEL_189;
    }
    v111 = v98;
    goto LABEL_202;
  }
  if (v110 != 2)
  {
    if (v98 <= 0x18)
      v67 = v98;
    else
      v67 = 0;
    if (v66 <= 0x30)
    {
      v99 = v71;
      v100 = v72;
      if (v98 <= 0x18)
        v101 = v110;
      else
        v101 = 2;
      if (v101 != 2)
        goto LABEL_190;
      goto LABEL_211;
    }
    v111 = v67;
    v66 = 0;
LABEL_202:
    v102 = isPhone(a13);
    v103 = (char *)&v121[6];
    v104 = (int *)&v121[167] + 1;
    v118 = v121 + 432;
    if (v95)
    {
      if (v102)
      {
        populatePeakingConfig(v103, &peakingConfig_iPhone_Video_NFG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig(v104, &ebeConfig_iPhone_Video_NFG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v118, &blendConfig_iPhone_Video_NFG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        if (logLevel >= 3)
        {
          v65 = v122;
          v67 = v111;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v130 = &peakingConfig_iPhone_Video_NFG_V3;
            *(_WORD *)&v130[8] = 2080;
            v131 = "peakingConfig_iPhone_Video_NFG_V3";
            v105 = MEMORY[0x24BDACB70];
LABEL_226:
            _os_log_impl(&dword_206505000, v105, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
            goto LABEL_227;
          }
          goto LABEL_227;
        }
      }
      else
      {
        populatePeakingConfig(v103, &peakingConfig_Video_NFG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig(v104, &ebeConfig_SettingVideo_NFG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v118, &blendConfig_SettingVideo_NFG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        if (logLevel >= 3)
        {
          v65 = v122;
          v67 = v111;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v130 = &peakingConfig_Video_NFG_V3;
            *(_WORD *)&v130[8] = 2080;
            v131 = "peakingConfig_Video_NFG_V3";
            v105 = MEMORY[0x24BDACB70];
            goto LABEL_226;
          }
          goto LABEL_227;
        }
      }
    }
    else if (v102)
    {
      populatePeakingConfig(v103, &peakingConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
      populateEbeConfig(v104, &ebeConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
      populateBlendConfig(v118, &blendConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
      if (logLevel >= 3)
      {
        v65 = v122;
        v67 = v111;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v130 = &peakingConfig_iPhone_Video_NFG_LargeRatio_V3;
          *(_WORD *)&v130[8] = 2080;
          v131 = "peakingConfig_iPhone_Video_NFG_LargeRatio_V3";
          v105 = MEMORY[0x24BDACB70];
          goto LABEL_226;
        }
LABEL_227:
        v69 = 0;
        v68 = v113;
LABEL_229:
        v70 = v114;
        goto LABEL_48;
      }
    }
    else
    {
      populatePeakingConfig(v103, &peakingConfig_Video_NFG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
      populateEbeConfig(v104, &ebeConfig_SettingVideo_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
      populateBlendConfig(v118, &blendConfig_SettingVideo_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
      if (logLevel >= 3)
      {
        v65 = v122;
        v67 = v111;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v130 = &peakingConfig_Video_NFG_LargeRatio_V3;
          *(_WORD *)&v130[8] = 2080;
          v131 = "peakingConfig_Video_NFG_LargeRatio_V3";
          v105 = MEMORY[0x24BDACB70];
          goto LABEL_226;
        }
        goto LABEL_227;
      }
    }
    v69 = 0;
    v65 = v122;
    v67 = v111;
    v68 = v113;
    goto LABEL_229;
  }
  v99 = v71;
  v100 = v72;
  if (v98 >= 0x18)
    v67 = 24;
  else
    v67 = v98;
  if (v66 <= 0x30)
  {
LABEL_211:
    v65 = v122;
    memcpy(&v121[6], v127, 0x504uLL);
    memcpy((char *)&v121[167] + 4, v126, 0x83CuLL);
    memcpy(&v121[432], __dst, 0x610uLL);
    if (logLevel < 3)
    {
      v69 = 2;
      v72 = v100;
      v68 = v113;
      v43 = v106;
      v70 = v114;
      v71 = v99;
      goto LABEL_48;
    }
    v71 = v99;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v130 = v127;
      *(_WORD *)&v130[8] = 2080;
      v131 = "peakingConfig_FG";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
    }
    v69 = 2;
    v72 = v100;
    v68 = v113;
    v43 = v106;
    goto LABEL_229;
  }
  v66 = 0;
LABEL_189:
  v101 = 1;
LABEL_190:
  v117 = v101;
  v65 = v122;
  memcpy(&v121[6], v128, 0x504uLL);
  memcpy((char *)&v121[167] + 4, __src, 0x83CuLL);
  memcpy(&v121[432], v123, 0x610uLL);
  if (logLevel < 3)
  {
    v72 = v100;
    v68 = v113;
    v43 = v106;
    v70 = v114;
    v71 = v99;
  }
  else
  {
    v71 = v99;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v130 = v128;
      *(_WORD *)&v130[8] = 2080;
      v131 = "peakingConfig_Mix";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
    }
    v72 = v100;
    v68 = v113;
    v43 = v106;
    v70 = v114;
  }
  v69 = v117;
LABEL_48:
  *a17 |= 0x1Cu;
  if (v65 >= 0x501)
  {
    v73 = v43;
    v74 = v68;
    v116 = v32;
    v75 = v72;
    v76 = v47;
    v77 = v71;
    v78 = v70;
    v79 = v69;
    isPhone(a13);
    v69 = v79;
    v70 = v78;
    v71 = v77;
    v47 = v76;
    v72 = v75;
    v35 = a17;
    v65 = v122;
    v32 = v116;
    v68 = v74;
    v43 = v73;
  }
  v121[627] = (int8x8_t)0x2D0000000005;
  *v35 |= 0x20u;
  *v119 = v68;
  *v71 = v69;
  *v70 = v67;
  *a9 = v66;
  *v72 = v32[16] + v32[15];
  *v47 = v32[32] + v32[31];
  *a12 = v120;
  populateNoiseConfig((int *)&v121[629], v65, v43, v68, v35);
}

uint64_t calculate_graphics_control_setting_V3(int8x8_t *a1, unsigned int a2, unsigned int a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, unsigned int a9, unsigned int a10, uint64_t a11, _DWORD *a12)
{
  float v14;
  float v15;

  *(float *)&a4 = (float)a9 / (float)a2;
  v14 = (float)a10 / (float)a3;
  if (*(float *)&a4 >= v14)
    v15 = (float)a10 / (float)a3;
  else
    v15 = (float)a9 / (float)a2;
  *(float *)&a6 = (float)a3;
  populateScalingConfig(a1 + 2, a12, *(int8x8_t *)&a4, v14, *(int32x2_t *)&a6);
  populatePeakingConfig((char *)&a1[6], &peakingConfig_InitialSettingVideo_V3, (uint64_t)&defaultWeightedPeakingConfig, a11, a12, v15);
  populateEbeConfig((int *)&a1[167] + 1, &ebeConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedEbeConfig, a11, a12, v15);
  return populateBlendConfig(&a1[432], &blendConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedBlendConfig, a11, a12, v15);
}

uint64_t getCurrentProductType()
{
  uint64_t v0;
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  _BYTE v9[28];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (const __CFString *)v0;
    v2 = MGGetSInt64Answer();
    if (CFStringCompare(v1, CFSTR("iPhone"), 0))
    {
      if (CFStringCompare(v1, CFSTR("iPad"), 0))
      {
        if (CFStringCompare(v1, CFSTR("Mac"), 0))
        {
          if (CFStringCompare(v1, CFSTR("Apple TV"), 0))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v6 = 136315906;
              v7 = "ASEproductType getCurrentProductType(void)";
              v8 = 2048;
              *(_QWORD *)v9 = v1;
              *(_WORD *)&v9[8] = 2112;
              *(_QWORD *)&v9[10] = v1;
              *(_WORD *)&v9[18] = 2048;
              *(_QWORD *)&v9[20] = v2;
              _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : Unknown device! deviceNameRef: %p, %@, chipID = 0x%llx\n", (uint8_t *)&v6, 0x2Au);
            }
            v3 = 7;
            goto LABEL_68;
          }
          v3 = 20;
LABEL_64:
          if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v6 = 136315906;
            v7 = "getCurrentProductType";
            v8 = 1024;
            *(_DWORD *)v9 = v3;
            *(_WORD *)&v9[4] = 2112;
            *(_QWORD *)&v9[6] = v1;
            *(_WORD *)&v9[14] = 2048;
            *(_QWORD *)&v9[16] = v2;
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: productType=%d, deviceName = %@, chipID = 0x%llx\n", (uint8_t *)&v6, 0x26u);
          }
          goto LABEL_68;
        }
        if (v2 == 33090)
          v3 = 19;
        else
          v3 = 18;
        if (!enableT1Sim)
          goto LABEL_64;
        if (logLevel >= 4)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v6 = 136315138;
            v7 = "getCurrentProductType";
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: T1 Simulation enabled!\n", (uint8_t *)&v6, 0xCu);
          }
          v3 = 19;
          goto LABEL_64;
        }
        v3 = 19;
LABEL_68:
        CFRelease(v1);
        return v3;
      }
      if (v2 > 33041)
      {
        if (v2 > 33073)
        {
          if (v2 == 33090)
          {
            v3 = 17;
            goto LABEL_58;
          }
          if (v2 == 33074)
          {
            v3 = 16;
            goto LABEL_58;
          }
        }
        else
        {
          if (v2 == 33042)
          {
            v3 = 14;
            goto LABEL_58;
          }
          if (v2 == 33058)
          {
            v3 = 15;
            goto LABEL_58;
          }
        }
      }
      else if (v2 > 33026)
      {
        if (v2 == 33027)
        {
          v3 = 11;
          goto LABEL_58;
        }
        if (v2 == 33040)
        {
          v3 = 13;
          goto LABEL_58;
        }
      }
      else
      {
        if (v2 == 32807)
        {
          v3 = 9;
          goto LABEL_58;
        }
        if (v2 == 33025)
        {
          v3 = 10;
          goto LABEL_58;
        }
      }
      v3 = 7;
LABEL_58:
      if (!enableT1Sim)
        goto LABEL_64;
      if (logLevel >= 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v6 = 136315138;
          v7 = "getCurrentProductType";
          v4 = MEMORY[0x24BDACB70];
          goto LABEL_62;
        }
        goto LABEL_63;
      }
      goto LABEL_67;
    }
    if (v2 <= 33055)
    {
      if (v2 == 33025)
      {
        v3 = 2;
        goto LABEL_42;
      }
      if (v2 == 33040)
      {
        v3 = 3;
        goto LABEL_42;
      }
    }
    else
    {
      switch(v2)
      {
        case 33056:
          v3 = 4;
          goto LABEL_42;
        case 33088:
          v3 = 6;
          goto LABEL_42;
        case 33072:
          v3 = 5;
          goto LABEL_42;
      }
    }
    v3 = 1;
LABEL_42:
    if (!enableT1Sim)
      goto LABEL_64;
    if (logLevel >= 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "getCurrentProductType";
        v4 = MEMORY[0x24BDACB70];
LABEL_62:
        _os_log_impl(&dword_206505000, v4, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: T1 Simulation enabled!\n", (uint8_t *)&v6, 0xCu);
      }
LABEL_63:
      v3 = 17;
      goto LABEL_64;
    }
LABEL_67:
    v3 = 17;
    goto LABEL_68;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "getCurrentProductType";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: Failed to query kMGQDeviceName\n", (uint8_t *)&v6, 0xCu);
  }
  return 7;
}

BOOL isPhone(int a1)
{
  return (a1 - 1) < 6;
}

BOOL isPad(int a1)
{
  return (a1 - 8) < 0xA;
}

BOOL isMac(int a1)
{
  return a1 == 19;
}

BOOL isT1OrNewer(int a1)
{
  return (a1 & 0xFFFFFFFD) == 17;
}

float calculate_control_setting_V2(int *a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5, unsigned int *a6, int *a7, int *a8, unsigned int *a9, unsigned int *a10, unsigned int *a11, unsigned int *a12, unsigned int a13)
{
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  _BOOL4 v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  _BOOL4 v37;
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  __int128 v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  int v48;
  int *v49;
  int *v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t i;
  int v56;
  signed int v57;
  int v58;
  uint64_t j;
  unint64_t v60;
  double v61;
  signed int v62;
  signed int v63;
  unsigned int v64;
  NSObject *v65;
  const char *v66;
  unsigned int v67;
  unsigned int v68;
  void *v69;
  _OWORD *v70;
  _OWORD *v71;
  __int128 v72;
  NSObject *v73;
  __int128 v74;
  __int128 v75;
  NSObject *v76;
  __int128 v77;
  BOOL v78;
  float result;
  int v80;
  int v81;
  int v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  unsigned int v89;
  int v90;
  int v91;
  unsigned int *v92;
  _BOOL4 v93;
  unsigned int v97;
  unsigned int v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[28];
  __int128 v102;
  __int128 v103;
  _BYTE v104[28];
  _OWORD v105[18];
  _OWORD v106[18];
  __int128 v107;
  int v108;
  __int128 v109;
  int v110;
  _OWORD __dst[35];
  _OWORD __src[35];
  uint8_t buf[4];
  _BYTE v114[10];
  const char *v115;
  int v116;
  __int16 v117;
  unsigned int v118;
  __int16 v119;
  int v120;
  __int16 v121;
  unsigned int v122;
  uint64_t v123;

  v17 = a12;
  v123 = *MEMORY[0x24BDAC8D0];
  v18 = *a6;
  v90 = *a8;
  v91 = *a7;
  v89 = *a9;
  memset(__src, 0, 512);
  memset(__dst, 0, 512);
  v109 = 0uLL;
  v110 = 0;
  v107 = 0uLL;
  v108 = 0;
  memset(v106, 0, sizeof(v106));
  memset(&v105[14], 0, 64);
  v19 = 100 * a1[94];
  v20 = a1[30];
  if (v20 <= a1[46])
    v20 = a1[46];
  memset(v105, 0, 224);
  v21 = v19 / v20;
  v23 = a3 > 0x383 && a4 > 0x1F3;
  v93 = v23;
  if (a5)
  {
    v24 = a1[16] + a1[15];
    v25 = *a10 - v24;
    v26 = a1[32] + a1[31];
    v27 = *a11;
    v28 = *a12;
    if (v24 > *a10)
      v25 = v24 - *a10;
    if (v24 >= *a10)
      v24 = *a10;
    v29 = v26 - v27;
    if (v26 <= v27)
      v29 = *a11 - v26;
    v30 = 100 * v25 / v24;
    v31 = 100 * v29;
    if (v26 >= v27)
      v32 = *a11;
    else
      v32 = a1[32] + a1[31];
    v33 = v31 / v32;
    if (v30 <= v33)
      v30 = v33;
    v34 = v21 - v28;
    if (v21 <= v28)
      v34 = *a12 - v21;
    v35 = 100 * v34;
    if (v21 >= v28)
      v36 = *a12;
    else
      v36 = v21;
    v37 = v30 + v35 / v36 > 0x64;
  }
  else
  {
    v37 = 0;
  }
  v38 = *a1;
  v97 = a4 - 22;
  v98 = a3 - 22;
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v39 = *a12;
    v40 = a1[16] + a1[15];
    v41 = *a10;
    v42 = a1[32] + a1[31];
    v43 = *a11;
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v114 = v37;
    *(_WORD *)&v114[4] = 1024;
    *(_DWORD *)&v114[6] = v21;
    LOWORD(v115) = 1024;
    *(_DWORD *)((char *)&v115 + 2) = v39;
    HIWORD(v115) = 1024;
    v116 = v40;
    v117 = 1024;
    v118 = v41;
    v119 = 1024;
    v120 = v42;
    v121 = 1024;
    v122 = v43;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
      buf,
      0x2Cu);
  }
  if (!a5 || (int)(100 * v38 / v98 * v97) < 20 || a5 != 1 && v37)
  {
    memcpy((void *)(a2 + 28), &InitialSettingVideo_V2, 0x22CuLL);
    *(_DWORD *)(a2 + 592) = 0;
    *(_OWORD *)(a2 + 604) = downSample_InitialSettingVideo_V2;
    *(_DWORD *)(a2 + 620) = dword_254507C54;
    memcpy((void *)(a2 + 632), &blendLogic_InitialSettingVideo_V2, 0x120uLL);
    v44 = unk_254507D88;
    *(_OWORD *)(a2 + 928) = objectProtection_InitialSettingVideo_V2;
    *(_OWORD *)(a2 + 944) = v44;
    *(_OWORD *)(a2 + 960) = xmmword_254507D98;
    *(_OWORD *)(a2 + 972) = *(__int128 *)((char *)&xmmword_254507D98 + 12);
    if (logLevel >= 3)
    {
      v45 = a13;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v114 = &InitialSettingVideo_V2;
        *(_WORD *)&v114[8] = 2080;
        v115 = "InitialSettingVideo_V2";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      v46 = 0;
      v47 = 0;
      v18 = 4;
      v48 = 1;
      goto LABEL_41;
    }
    v46 = 0;
    v47 = 0;
    v18 = 4;
    v48 = 1;
LABEL_40:
    v45 = a13;
    goto LABEL_41;
  }
  v51 = 0;
  v52 = 0;
  v53 = 0;
  do
  {
    v52 += a1[v51 + 23];
    v53 += a1[v51 + 39];
    ++v51;
  }
  while (v51 != 7);
  v54 = 0;
  for (i = 79; i != 94; ++i)
    v54 += a1[i];
  v56 = 10 * a1[46] / v53 + 10 * a1[30] / v52;
  v57 = 10 * a1[94] / v54;
  if (v57 <= 349)
    v56 = 350 * v56 / v57;
  v58 = 0;
  for (j = 47; j != 62; ++j)
    v58 += a1[j];
  HIDWORD(v60) = 1079574528;
  LODWORD(v60) = *a1;
  v61 = (double)v58 * 100.0 / (double)v60;
  if (v61 >= 7.0)
  {
    if (v61 > 8.0)
    {
      if (v18 - 1 <= 4)
        v18 = 4;
      else
        --v18;
    }
  }
  else
  {
    ++v18;
  }
  if (v18 <= 0xE)
  {
    if (v18 < 0xA)
    {
      if (v18 < 6)
        v62 = 0;
      else
        v62 = (50 * v18 - 300) >> 2;
    }
    else
    {
      v62 = ((50 * (_BYTE)v18 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    v62 = 100;
  }
  if (v56 <= 30)
  {
    if (v56 < 24)
    {
      if (v56 < 12)
        v63 = 100;
      else
        v63 = (unsigned __int16)(50 * (24 - v56)) / 0xCu + 50;
    }
    else
    {
      v63 = (unsigned __int16)(50 * (30 - v56)) / 6u;
    }
  }
  else
  {
    v63 = 0;
  }
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v114 = a5;
    *(_WORD *)&v114[4] = 1024;
    *(_DWORD *)&v114[6] = v62;
    LOWORD(v115) = 1024;
    *(_DWORD *)((char *)&v115 + 2) = v63;
    HIWORD(v115) = 1024;
    v116 = v56;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
  }
  if (v62 <= v63)
    v64 = v63;
  else
    v64 = v62;
  v45 = a13;
  if (a13 - 2 > 4)
  {
    if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPad control setting V2\n", buf, 2u);
    }
    if (v93)
    {
      if (v64 > 0x1D)
      {
        if (v64 > 0x31)
        {
          if (v64 > 0x45)
          {
            if (v64 > 0x5E)
            {
              memcpy(__dst, &SettingVideo_Heavy_FG_V2, 0x22CuLL);
              v109 = downSample_SettingVideo_Heavy_FG_V2;
              v110 = dword_25450838C;
              memcpy(v106, &blendLogic_SettingVideo_Heavy_FG_V2, sizeof(v106));
              v102 = objectProtection_SettingVideo_Heavy_FG_V2;
              v103 = unk_2545084C0;
              *(_OWORD *)v104 = xmmword_2545084D0;
              *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_2545084D0 + 12);
              memcpy(__src, &SettingVideo_Heavy_FG_mix_V2, 0x22CuLL);
              v107 = downSample_SettingVideo_Heavy_FG_mix_V2;
              v108 = dword_254509598;
              memcpy(v105, &blendLogic_SettingVideo_Heavy_FG_mix_V2, sizeof(v105));
              v99 = objectProtection_SettingVideo_Heavy_FG_mix_V2;
              v100 = unk_2545096CC;
              *(_OWORD *)v101 = xmmword_2545096DC;
              *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_2545096DC + 12);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_167;
              *(_WORD *)buf = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dst, &SettingVideo_level3_FG_V2, 0x22CuLL);
              v109 = downSample_SettingVideo_level3_FG_V2;
              v110 = dword_2545091FC;
              memcpy(v106, &blendLogic_SettingVideo_level3_FG_V2, sizeof(v106));
              v102 = objectProtection_SettingVideo_level3_FG_V2;
              v103 = unk_254509330;
              *(_OWORD *)v104 = xmmword_254509340;
              *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_254509340 + 12);
              memcpy(__src, &SettingVideo_level3_FG_mix_V2, 0x22CuLL);
              v107 = downSample_SettingVideo_level3_FG_mix_V2;
              v108 = dword_25450A408;
              memcpy(v105, &blendLogic_SettingVideo_level3_FG_mix_V2, sizeof(v105));
              v99 = objectProtection_SettingVideo_level3_FG_mix_V2;
              v100 = unk_25450A53C;
              *(_OWORD *)v101 = xmmword_25450A54C;
              *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450A54C + 12);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_167;
              *(_WORD *)buf = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dst, &SettingVideo_level2_FG_V2, 0x22CuLL);
            v109 = downSample_SettingVideo_level2_FG_V2;
            v110 = dword_254508E60;
            memcpy(v106, &blendLogic_SettingVideo_level2_FG_V2, sizeof(v106));
            v102 = objectProtection_SettingVideo_level2_FG_V2;
            v103 = unk_254508F94;
            *(_OWORD *)v104 = xmmword_254508FA4;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_254508FA4 + 12);
            memcpy(__src, &SettingVideo_level2_FG_mix_V2, 0x22CuLL);
            v107 = downSample_SettingVideo_level2_FG_mix_V2;
            v108 = dword_25450A06C;
            memcpy(v105, &blendLogic_SettingVideo_level2_FG_mix_V2, sizeof(v105));
            v99 = objectProtection_SettingVideo_level2_FG_mix_V2;
            v100 = unk_25450A1A0;
            *(_OWORD *)v101 = xmmword_25450A1B0;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450A1B0 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dst, &SettingVideo_level1_FG_V2, 0x22CuLL);
          v109 = downSample_SettingVideo_level1_FG_V2;
          v110 = dword_254508AC4;
          memcpy(v106, &blendLogic_SettingVideo_level1_FG_V2, sizeof(v106));
          v102 = objectProtection_SettingVideo_level1_FG_V2;
          v103 = unk_254508BF8;
          *(_OWORD *)v104 = xmmword_254508C08;
          *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_254508C08 + 12);
          memcpy(__src, &SettingVideo_level1_FG_mix_V2, 0x22CuLL);
          v107 = downSample_SettingVideo_level1_FG_mix_V2;
          v108 = dword_254509CD0;
          memcpy(v105, &blendLogic_SettingVideo_level1_FG_mix_V2, sizeof(v105));
          v99 = objectProtection_SettingVideo_level1_FG_mix_V2;
          v100 = unk_254509E04;
          *(_OWORD *)v101 = xmmword_254509E14;
          *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254509E14 + 12);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_167;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dst, &SettingVideo_light_FG_V2, 0x22CuLL);
        v109 = downSample_SettingVideo_light_FG_V2;
        v110 = dword_254508728;
        memcpy(v106, &blendLogic_SettingVideo_light_FG_V2, sizeof(v106));
        v102 = objectProtection_SettingVideo_light_FG_V2;
        v103 = unk_25450885C;
        *(_OWORD *)v104 = xmmword_25450886C;
        *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450886C + 12);
        memcpy(__src, &SettingVideo_light_FG_mix_V2, 0x22CuLL);
        v107 = downSample_SettingVideo_light_FG_mix_V2;
        v108 = dword_254509934;
        memcpy(v105, &blendLogic_SettingVideo_light_FG_mix_V2, sizeof(v105));
        v99 = objectProtection_SettingVideo_light_FG_mix_V2;
        v100 = unk_254509A68;
        *(_OWORD *)v101 = xmmword_254509A78;
        *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254509A78 + 12);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_167;
        *(_WORD *)buf = 0;
        v65 = MEMORY[0x24BDACB70];
        v66 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v64 > 0x1D)
    {
      if (v64 > 0x31)
      {
        if (v64 > 0x45)
        {
          if (v64 > 0x5E)
          {
            memcpy(__dst, &SettingVideo_Heavy_FG_LargeRatio_V2, 0x22CuLL);
            v109 = downSample_SettingVideo_Heavy_FG_LargeRatio_V2;
            v110 = dword_25450AB40;
            memcpy(v106, &blendLogic_SettingVideo_Heavy_FG_LargeRatio_V2, sizeof(v106));
            v102 = objectProtection_SettingVideo_Heavy_FG_LargeRatio_V2;
            v103 = unk_25450AC74;
            *(_OWORD *)v104 = xmmword_25450AC84;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450AC84 + 12);
            memcpy(__src, &SettingVideo_Heavy_FG_mix_LargeRatio_V2, 0x22CuLL);
            v107 = downSample_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            v108 = dword_25450BD4C;
            memcpy(v105, &blendLogic_SettingVideo_Heavy_FG_mix_LargeRatio_V2, sizeof(v105));
            v99 = objectProtection_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            v100 = unk_25450BE80;
            *(_OWORD *)v101 = xmmword_25450BE90;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450BE90 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dst, &SettingVideo_level3_FG_LargeRatio_V2, 0x22CuLL);
            v109 = downSample_SettingVideo_level3_FG_LargeRatio_V2;
            v110 = dword_25450B9B0;
            memcpy(v106, &blendLogic_SettingVideo_level3_FG_LargeRatio_V2, sizeof(v106));
            v102 = objectProtection_SettingVideo_level3_FG_LargeRatio_V2;
            v103 = unk_25450BAE4;
            *(_OWORD *)v104 = xmmword_25450BAF4;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450BAF4 + 12);
            memcpy(__src, &SettingVideo_level3_FG_mix_LargeRatio_V2, 0x22CuLL);
            v107 = downSample_SettingVideo_level3_FG_mix_LargeRatio_V2;
            v108 = dword_25450CBBC;
            memcpy(v105, &blendLogic_SettingVideo_level3_FG_mix_LargeRatio_V2, sizeof(v105));
            v99 = objectProtection_SettingVideo_level3_FG_mix_LargeRatio_V2;
            v100 = unk_25450CCF0;
            *(_OWORD *)v101 = xmmword_25450CD00;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450CD00 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dst, &SettingVideo_level2_FG_LargeRatio_V2, 0x22CuLL);
          v109 = downSample_SettingVideo_level2_FG_LargeRatio_V2;
          v110 = dword_25450B614;
          memcpy(v106, &blendLogic_SettingVideo_level2_FG_LargeRatio_V2, sizeof(v106));
          v102 = objectProtection_SettingVideo_level2_FG_LargeRatio_V2;
          v103 = unk_25450B748;
          *(_OWORD *)v104 = xmmword_25450B758;
          *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450B758 + 12);
          memcpy(__src, &SettingVideo_level2_FG_mix_LargeRatio_V2, 0x22CuLL);
          v107 = downSample_SettingVideo_level2_FG_mix_LargeRatio_V2;
          v108 = dword_25450C820;
          memcpy(v105, &blendLogic_SettingVideo_level2_FG_mix_LargeRatio_V2, sizeof(v105));
          v99 = objectProtection_SettingVideo_level2_FG_mix_LargeRatio_V2;
          v100 = unk_25450C954;
          *(_OWORD *)v101 = xmmword_25450C964;
          *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450C964 + 12);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_167;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dst, &SettingVideo_level1_FG_LargeRatio_V2, 0x22CuLL);
        v109 = downSample_SettingVideo_level1_FG_LargeRatio_V2;
        v110 = dword_25450B278;
        memcpy(v106, &blendLogic_SettingVideo_level1_FG_LargeRatio_V2, sizeof(v106));
        v102 = objectProtection_SettingVideo_level1_FG_LargeRatio_V2;
        v103 = unk_25450B3AC;
        *(_OWORD *)v104 = xmmword_25450B3BC;
        *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450B3BC + 12);
        memcpy(__src, &SettingVideo_level1_FG_mix_LargeRatio_V2, 0x22CuLL);
        v107 = downSample_SettingVideo_level1_FG_mix_LargeRatio_V2;
        v108 = dword_25450C484;
        memcpy(v105, &blendLogic_SettingVideo_level1_FG_mix_LargeRatio_V2, sizeof(v105));
        v99 = objectProtection_SettingVideo_level1_FG_mix_LargeRatio_V2;
        v100 = unk_25450C5B8;
        *(_OWORD *)v101 = xmmword_25450C5C8;
        *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450C5C8 + 12);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_167;
        *(_WORD *)buf = 0;
        v65 = MEMORY[0x24BDACB70];
        v66 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dst, &SettingVideo_light_FG_LargeRatio_V2, 0x22CuLL);
      v109 = downSample_SettingVideo_light_FG_LargeRatio_V2;
      v110 = dword_25450AEDC;
      memcpy(v106, &blendLogic_SettingVideo_light_FG_LargeRatio_V2, sizeof(v106));
      v102 = objectProtection_SettingVideo_light_FG_LargeRatio_V2;
      v103 = unk_25450B010;
      *(_OWORD *)v104 = xmmword_25450B020;
      *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450B020 + 12);
      memcpy(__src, &SettingVideo_light_FG_mix_LargeRatio_V2, 0x22CuLL);
      v107 = downSample_SettingVideo_light_FG_mix_LargeRatio_V2;
      v108 = dword_25450C0E8;
      memcpy(v105, &blendLogic_SettingVideo_light_FG_mix_LargeRatio_V2, sizeof(v105));
      v99 = objectProtection_SettingVideo_light_FG_mix_LargeRatio_V2;
      v100 = unk_25450C21C;
      *(_OWORD *)v101 = xmmword_25450C22C;
      *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450C22C + 12);
      if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_167;
      *(_WORD *)buf = 0;
      v65 = MEMORY[0x24BDACB70];
      v66 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  else
  {
    if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V2\n", buf, 2u);
    }
    if (v93)
    {
      if (v64 > 0x1D)
      {
        if (v64 > 0x31)
        {
          if (v64 > 0x45)
          {
            if (v64 > 0x5E)
            {
              memcpy(__dst, &iPhone_SettingVideo_Heavy_FG_V2, 0x22CuLL);
              v109 = downSample_iPhone_SettingVideo_Heavy_FG_V2;
              v110 = dword_25450D2F4;
              memcpy(v106, &blendLogic_iPhone_SettingVideo_Heavy_FG_V2, sizeof(v106));
              v102 = objectProtection_iPhone_SettingVideo_Heavy_FG_V2;
              v103 = unk_25450D428;
              *(_OWORD *)v104 = xmmword_25450D438;
              *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450D438 + 12);
              memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_V2, 0x22CuLL);
              v107 = downSample_iPhone_SettingVideo_Heavy_FG_mix_V2;
              v108 = dword_25450E500;
              memcpy(v105, &blendLogic_iPhone_SettingVideo_Heavy_FG_mix_V2, sizeof(v105));
              v99 = objectProtection_iPhone_SettingVideo_Heavy_FG_mix_V2;
              v100 = unk_25450E634;
              *(_OWORD *)v101 = xmmword_25450E644;
              *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450E644 + 12);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_167;
              *(_WORD *)buf = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dst, &iPhone_SettingVideo_level3_FG_V2, 0x22CuLL);
              v109 = downSample_iPhone_SettingVideo_level3_FG_V2;
              v110 = dword_25450E164;
              memcpy(v106, &blendLogic_iPhone_SettingVideo_level3_FG_V2, sizeof(v106));
              v102 = objectProtection_iPhone_SettingVideo_level3_FG_V2;
              v103 = unk_25450E298;
              *(_OWORD *)v104 = xmmword_25450E2A8;
              *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450E2A8 + 12);
              memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_V2, 0x22CuLL);
              v107 = downSample_iPhone_SettingVideo_level3_FG_mix_V2;
              v108 = dword_25450F370;
              memcpy(v105, &blendLogic_iPhone_SettingVideo_level3_FG_mix_V2, sizeof(v105));
              v99 = objectProtection_iPhone_SettingVideo_level3_FG_mix_V2;
              v100 = unk_25450F4A4;
              *(_OWORD *)v101 = xmmword_25450F4B4;
              *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450F4B4 + 12);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_167;
              *(_WORD *)buf = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dst, &iPhone_SettingVideo_level2_FG_V2, 0x22CuLL);
            v109 = downSample_iPhone_SettingVideo_level2_FG_V2;
            v110 = dword_25450DDC8;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_level2_FG_V2, sizeof(v106));
            v102 = objectProtection_iPhone_SettingVideo_level2_FG_V2;
            v103 = unk_25450DEFC;
            *(_OWORD *)v104 = xmmword_25450DF0C;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450DF0C + 12);
            memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_V2, 0x22CuLL);
            v107 = downSample_iPhone_SettingVideo_level2_FG_mix_V2;
            v108 = dword_25450EFD4;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_level2_FG_mix_V2, sizeof(v105));
            v99 = objectProtection_iPhone_SettingVideo_level2_FG_mix_V2;
            v100 = unk_25450F108;
            *(_OWORD *)v101 = xmmword_25450F118;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450F118 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dst, &iPhone_SettingVideo_level1_FG_V2, 0x22CuLL);
          v109 = downSample_iPhone_SettingVideo_level1_FG_V2;
          v110 = dword_25450DA2C;
          memcpy(v106, &blendLogic_iPhone_SettingVideo_level1_FG_V2, sizeof(v106));
          v102 = objectProtection_iPhone_SettingVideo_level1_FG_V2;
          v103 = unk_25450DB60;
          *(_OWORD *)v104 = xmmword_25450DB70;
          *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450DB70 + 12);
          memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_V2, 0x22CuLL);
          v107 = downSample_iPhone_SettingVideo_level1_FG_mix_V2;
          v108 = dword_25450EC38;
          memcpy(v105, &blendLogic_iPhone_SettingVideo_level1_FG_mix_V2, sizeof(v105));
          v99 = objectProtection_iPhone_SettingVideo_level1_FG_mix_V2;
          v100 = unk_25450ED6C;
          *(_OWORD *)v101 = xmmword_25450ED7C;
          *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450ED7C + 12);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_167;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dst, &iPhone_SettingVideo_light_FG_V2, 0x22CuLL);
        v109 = downSample_iPhone_SettingVideo_light_FG_V2;
        v110 = dword_25450D690;
        memcpy(v106, &blendLogic_iPhone_SettingVideo_light_FG_V2, sizeof(v106));
        v102 = objectProtection_iPhone_SettingVideo_light_FG_V2;
        v103 = unk_25450D7C4;
        *(_OWORD *)v104 = xmmword_25450D7D4;
        *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450D7D4 + 12);
        memcpy(__src, &iPhone_SettingVideo_light_FG_mix_V2, 0x22CuLL);
        v107 = downSample_iPhone_SettingVideo_light_FG_mix_V2;
        v108 = dword_25450E89C;
        memcpy(v105, &blendLogic_iPhone_SettingVideo_light_FG_mix_V2, sizeof(v105));
        v99 = objectProtection_iPhone_SettingVideo_light_FG_mix_V2;
        v100 = unk_25450E9D0;
        *(_OWORD *)v101 = xmmword_25450E9E0;
        *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_25450E9E0 + 12);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_167;
        *(_WORD *)buf = 0;
        v65 = MEMORY[0x24BDACB70];
        v66 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v64 > 0x1D)
    {
      if (v64 > 0x31)
      {
        if (v64 > 0x45)
        {
          if (v64 > 0x5E)
          {
            memcpy(__dst, &iPhone_SettingVideo_Heavy_FG_LargeRatio_V2, 0x22CuLL);
            v109 = downSample_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2;
            v110 = dword_25450FAA8;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2, sizeof(v106));
            v102 = objectProtection_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2;
            v103 = unk_25450FBDC;
            *(_OWORD *)v104 = xmmword_25450FBEC;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450FBEC + 12);
            memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2, 0x22CuLL);
            v107 = downSample_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            v108 = dword_254510CB4;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2, sizeof(v105));
            v99 = objectProtection_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            v100 = unk_254510DE8;
            *(_OWORD *)v101 = xmmword_254510DF8;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254510DF8 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dst, &iPhone_SettingVideo_level3_FG_LargeRatio_V2, 0x22CuLL);
            v109 = downSample_iPhone_SettingVideo_level3_FG_LargeRatio_V2;
            v110 = dword_254510918;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_level3_FG_LargeRatio_V2, sizeof(v106));
            v102 = objectProtection_iPhone_SettingVideo_level3_FG_LargeRatio_V2;
            v103 = unk_254510A4C;
            *(_OWORD *)v104 = xmmword_254510A5C;
            *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_254510A5C + 12);
            memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2, 0x22CuLL);
            v107 = downSample_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2;
            v108 = dword_254511B24;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2, sizeof(v105));
            v99 = objectProtection_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2;
            v100 = unk_254511C58;
            *(_OWORD *)v101 = xmmword_254511C68;
            *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254511C68 + 12);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_167;
            *(_WORD *)buf = 0;
            v65 = MEMORY[0x24BDACB70];
            v66 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dst, &iPhone_SettingVideo_level2_FG_LargeRatio_V2, 0x22CuLL);
          v109 = downSample_iPhone_SettingVideo_level2_FG_LargeRatio_V2;
          v110 = dword_25451057C;
          memcpy(v106, &blendLogic_iPhone_SettingVideo_level2_FG_LargeRatio_V2, sizeof(v106));
          v102 = objectProtection_iPhone_SettingVideo_level2_FG_LargeRatio_V2;
          v103 = unk_2545106B0;
          *(_OWORD *)v104 = xmmword_2545106C0;
          *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_2545106C0 + 12);
          memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2, 0x22CuLL);
          v107 = downSample_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2;
          v108 = dword_254511788;
          memcpy(v105, &blendLogic_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2, sizeof(v105));
          v99 = objectProtection_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2;
          v100 = unk_2545118BC;
          *(_OWORD *)v101 = xmmword_2545118CC;
          *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_2545118CC + 12);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_167;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dst, &iPhone_SettingVideo_level1_FG_LargeRatio_V2, 0x22CuLL);
        v109 = downSample_iPhone_SettingVideo_level1_FG_LargeRatio_V2;
        v110 = dword_2545101E0;
        memcpy(v106, &blendLogic_iPhone_SettingVideo_level1_FG_LargeRatio_V2, sizeof(v106));
        v102 = objectProtection_iPhone_SettingVideo_level1_FG_LargeRatio_V2;
        v103 = unk_254510314;
        *(_OWORD *)v104 = xmmword_254510324;
        *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_254510324 + 12);
        memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2, 0x22CuLL);
        v107 = downSample_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2;
        v108 = dword_2545113EC;
        memcpy(v105, &blendLogic_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2, sizeof(v105));
        v99 = objectProtection_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2;
        v100 = unk_254511520;
        *(_OWORD *)v101 = xmmword_254511530;
        *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254511530 + 12);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_167;
        *(_WORD *)buf = 0;
        v65 = MEMORY[0x24BDACB70];
        v66 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dst, &iPhone_SettingVideo_light_FG_LargeRatio_V2, 0x22CuLL);
      v109 = downSample_iPhone_SettingVideo_light_FG_LargeRatio_V2;
      v110 = dword_25450FE44;
      memcpy(v106, &blendLogic_iPhone_SettingVideo_light_FG_LargeRatio_V2, sizeof(v106));
      v102 = objectProtection_iPhone_SettingVideo_light_FG_LargeRatio_V2;
      v103 = unk_25450FF78;
      *(_OWORD *)v104 = xmmword_25450FF88;
      *(_OWORD *)&v104[12] = *(__int128 *)((char *)&xmmword_25450FF88 + 12);
      memcpy(__src, &iPhone_SettingVideo_light_FG_mix_LargeRatio_V2, 0x22CuLL);
      v107 = downSample_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2;
      v108 = dword_254511050;
      memcpy(v105, &blendLogic_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2, sizeof(v105));
      v99 = objectProtection_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2;
      v100 = unk_254511184;
      *(_OWORD *)v101 = xmmword_254511194;
      *(_OWORD *)&v101[12] = *(__int128 *)((char *)&xmmword_254511194 + 12);
      if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_167;
      *(_WORD *)buf = 0;
      v65 = MEMORY[0x24BDACB70];
      v66 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  _os_log_impl(&dword_206505000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
LABEL_167:
  if (v64 <= 0x14)
    v46 = v89 + 1;
  else
    v46 = 0;
  if (v64 > 0x14)
    v67 = v90 + 1;
  else
    v67 = 0;
  if (!v91)
  {
    if (v46 >= 0x30)
      v46 = 48;
    if (v67 > 0x18)
    {
      v47 = 0;
      goto LABEL_184;
    }
    v68 = a13 - 2;
    v92 = a12;
    v47 = v67;
    goto LABEL_194;
  }
  if (v91 != 2)
  {
    v68 = a13 - 2;
    if (v67 <= 0x18)
      v47 = v67;
    else
      v47 = 0;
    if (v46 <= 0x30)
    {
      if (v67 <= 0x18)
        v48 = v91;
      else
        v48 = 2;
      if (v48 != 2)
      {
LABEL_185:
        memcpy((void *)(a2 + 28), __src, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        *(_OWORD *)(a2 + 604) = v107;
        *(_DWORD *)(a2 + 620) = v108;
        memcpy((void *)(a2 + 632), v105, 0x120uLL);
        *(_OWORD *)(a2 + 928) = v99;
        *(_OWORD *)(a2 + 944) = v100;
        *(_OWORD *)(a2 + 960) = *(_OWORD *)v101;
        *(_OWORD *)(a2 + 972) = *(_OWORD *)&v101[12];
        if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v114 = __src;
          *(_WORD *)&v114[8] = 2080;
          v115 = "Mix_dyn_setting";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
        }
        goto LABEL_41;
      }
      goto LABEL_203;
    }
    v92 = a12;
    v46 = 0;
LABEL_194:
    v69 = (void *)(a2 + 28);
    v70 = (_OWORD *)(a2 + 604);
    v71 = (_OWORD *)(a2 + 928);
    if (v93)
    {
      if (v68 <= 4)
      {
        memcpy(v69, &iPhone_SettingVideo_NFG_V2, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        *v70 = downSample_iPhone_SettingVideo_NFG_V2;
        *(_DWORD *)(a2 + 620) = dword_25450CF58;
        memcpy((void *)(a2 + 632), &blendLogic_iPhone_SettingVideo_NFG_V2, 0x120uLL);
        v72 = unk_25450D08C;
        *v71 = objectProtection_iPhone_SettingVideo_NFG_V2;
        *(_OWORD *)(a2 + 944) = v72;
        *(_OWORD *)(a2 + 960) = xmmword_25450D09C;
        *(_OWORD *)(a2 + 972) = *(__int128 *)((char *)&xmmword_25450D09C + 12);
        if (logLevel >= 3)
        {
          v17 = v92;
          v45 = a13;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v114 = &iPhone_SettingVideo_NFG_V2;
            *(_WORD *)&v114[8] = 2080;
            v115 = "iPhone_SettingVideo_NFG_V2";
            v73 = MEMORY[0x24BDACB70];
LABEL_211:
            _os_log_impl(&dword_206505000, v73, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
            goto LABEL_212;
          }
          goto LABEL_212;
        }
        goto LABEL_221;
      }
      memcpy(v69, &SettingVideo_NFG_V2, 0x22CuLL);
      *(_DWORD *)(a2 + 592) = 0;
      *v70 = downSample_SettingVideo_NFG_V2;
      *(_DWORD *)(a2 + 620) = dword_254507FF0;
      memcpy((void *)(a2 + 632), &blendLogic_SettingVideo_NFG_V2, 0x120uLL);
      v75 = unk_254508124;
      *v71 = objectProtection_SettingVideo_NFG_V2;
      *(_OWORD *)(a2 + 944) = v75;
      *(_OWORD *)(a2 + 960) = xmmword_254508134;
      *(_OWORD *)(a2 + 972) = *(__int128 *)((char *)&xmmword_254508134 + 12);
      if (logLevel >= 3)
      {
        v17 = v92;
        v45 = a13;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v114 = &SettingVideo_NFG_V2;
          *(_WORD *)&v114[8] = 2080;
          v115 = "SettingVideo_NFG_V2";
          v76 = MEMORY[0x24BDACB70];
LABEL_219:
          _os_log_impl(&dword_206505000, v76, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
          goto LABEL_220;
        }
        goto LABEL_220;
      }
    }
    else
    {
      if (v68 <= 4)
      {
        memcpy(v69, &iPhone_SettingVideo_NFG_LargeRatio_V2, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        *v70 = downSample_iPhone_SettingVideo_NFG_LargeRatio_V2;
        *(_DWORD *)(a2 + 620) = dword_25450F70C;
        memcpy((void *)(a2 + 632), &blendLogic_iPhone_SettingVideo_NFG_LargeRatio_V2, 0x120uLL);
        v74 = unk_25450F840;
        *v71 = objectProtection_iPhone_SettingVideo_NFG_LargeRatio_V2;
        *(_OWORD *)(a2 + 944) = v74;
        *(_OWORD *)(a2 + 960) = xmmword_25450F850;
        *(_OWORD *)(a2 + 972) = *(__int128 *)((char *)&xmmword_25450F850 + 12);
        if (logLevel >= 3)
        {
          v17 = v92;
          v45 = a13;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v114 = &iPhone_SettingVideo_NFG_LargeRatio_V2;
            *(_WORD *)&v114[8] = 2080;
            v115 = "iPhone_SettingVideo_NFG_LargeRatio_V2";
            v73 = MEMORY[0x24BDACB70];
            goto LABEL_211;
          }
LABEL_212:
          v48 = 0;
          goto LABEL_41;
        }
LABEL_221:
        v48 = 0;
        v17 = v92;
        goto LABEL_40;
      }
      memcpy(v69, &SettingVideo_NFG_LargeRatio_V2, 0x22CuLL);
      *(_DWORD *)(a2 + 592) = 0;
      *v70 = downSample_SettingVideo_NFG_LargeRatio_V2;
      *(_DWORD *)(a2 + 620) = dword_25450A7A4;
      memcpy((void *)(a2 + 632), &blendLogic_SettingVideo_NFG_LargeRatio_V2, 0x120uLL);
      v77 = unk_25450A8D8;
      *v71 = objectProtection_SettingVideo_NFG_LargeRatio_V2;
      *(_OWORD *)(a2 + 944) = v77;
      *(_OWORD *)(a2 + 960) = xmmword_25450A8E8;
      *(_OWORD *)(a2 + 972) = *(__int128 *)((char *)&xmmword_25450A8E8 + 12);
      if (logLevel >= 3)
      {
        v17 = v92;
        v45 = a13;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v114 = &SettingVideo_NFG_LargeRatio_V2;
          *(_WORD *)&v114[8] = 2080;
          v115 = "SettingVideo_NFG_LargeRatio_V2";
          v76 = MEMORY[0x24BDACB70];
          goto LABEL_219;
        }
LABEL_220:
        v48 = 0;
        goto LABEL_223;
      }
    }
    v48 = 0;
    v17 = v92;
    v45 = a13;
    goto LABEL_223;
  }
  if (v67 >= 0x18)
    v47 = 24;
  else
    v47 = v67;
  if (v46 > 0x30)
  {
    v46 = 0;
LABEL_184:
    v48 = 1;
    goto LABEL_185;
  }
LABEL_203:
  memcpy((void *)(a2 + 28), __dst, 0x22CuLL);
  *(_DWORD *)(a2 + 592) = 0;
  *(_OWORD *)(a2 + 604) = v109;
  *(_DWORD *)(a2 + 620) = v110;
  memcpy((void *)(a2 + 632), v106, 0x120uLL);
  *(_OWORD *)(a2 + 928) = v102;
  *(_OWORD *)(a2 + 944) = v103;
  *(_OWORD *)(a2 + 960) = *(_OWORD *)v104;
  *(_OWORD *)(a2 + 972) = *(_OWORD *)&v104[12];
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v114 = __dst;
    *(_WORD *)&v114[8] = 2080;
    v115 = "FG_dyn_setting";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
  }
  v48 = 2;
LABEL_41:
  if (a3 < 0x501 || v45 - 2 > 4)
  {
LABEL_223:
    if (a3 < 0x781)
    {
      v50 = a7;
      v49 = a8;
    }
    else
    {
      v78 = v45 >= 7;
      v50 = a7;
      v49 = a8;
      if (v78)
      {
        *(_BYTE *)(a2 + 28) = 0;
        *(_QWORD *)(a2 + 40) = 0;
        *(_DWORD *)(a2 + 36) = 0;
      }
    }
    goto LABEL_228;
  }
  *(_BYTE *)(a2 + 28) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 64) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 88) = 0;
  *(_DWORD *)(a2 + 100) = 0;
  *(_DWORD *)(a2 + 112) = 0;
  *(_DWORD *)(a2 + 124) = 0;
  *(_DWORD *)(a2 + 136) = 0;
  *(float32x2_t *)(a2 + 264) = vmul_f32(*(float32x2_t *)(a2 + 264), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 276) = vmul_f32(*(float32x2_t *)(a2 + 276), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 288) = vmul_f32(*(float32x2_t *)(a2 + 288), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 300) = vmul_f32(*(float32x2_t *)(a2 + 300), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 312) = vmul_f32(*(float32x2_t *)(a2 + 312), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 324) = vmul_f32(*(float32x2_t *)(a2 + 324), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 336) = vmul_f32(*(float32x2_t *)(a2 + 336), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 348) = vmul_f32(*(float32x2_t *)(a2 + 348), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 360) = vmul_f32(*(float32x2_t *)(a2 + 360), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 372) = vmul_f32(*(float32x2_t *)(a2 + 372), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 384) = vmul_f32(*(float32x2_t *)(a2 + 384), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 396) = vmul_f32(*(float32x2_t *)(a2 + 396), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 408) = vmul_f32(*(float32x2_t *)(a2 + 408), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 420) = vmul_f32(*(float32x2_t *)(a2 + 420), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 432) = vmul_f32(*(float32x2_t *)(a2 + 432), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 444) = vmul_f32(*(float32x2_t *)(a2 + 444), (float32x2_t)0x3F0000003F000000);
  if (logLevel < 3)
  {
    v50 = a7;
    v49 = a8;
    goto LABEL_231;
  }
  v50 = a7;
  v49 = a8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] noDS == 1, set mediumAdaptGain = 0, adjust Hfactor\n", buf, 2u);
  }
LABEL_228:
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] applying the zoneplate fix to all HH02012023\n", buf, 2u);
  }
LABEL_231:
  *(_DWORD *)(a2 + 32) = 204800;
  *a6 = v18;
  *v50 = v48;
  *v49 = v47;
  *a9 = v46;
  *a10 = a1[16] + a1[15];
  *a11 = a1[32] + a1[31];
  *v17 = v21;
  *(_DWORD *)(a2 + 564) = v98;
  *(_DWORD *)(a2 + 568) = v97;
  *(_DWORD *)(a2 + 572) = v18;
  LODWORD(result) = 7;
  *(_QWORD *)(a2 + 576) = 0x400000007;
  if (logLevel >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v80 = *(_DWORD *)(a2 + 564);
      v81 = *(_DWORD *)(a2 + 568);
      v82 = *(_DWORD *)(a2 + 572);
      v83 = *(_DWORD *)(a2 + 576);
      v84 = *(_DWORD *)(a2 + 580);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v114 = v80;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v81;
      LOWORD(v115) = 1024;
      *(_DWORD *)((char *)&v115 + 2) = v82;
      HIWORD(v115) = 1024;
      v116 = v83;
      v117 = 1024;
      v118 = v84;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", buf, 0x20u);
    }
    if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v85 = *(unsigned __int8 *)(a2 + 28);
      v87 = *(_DWORD *)(a2 + 36);
      v86 = *(_DWORD *)(a2 + 40);
      v88 = *(_DWORD *)(a2 + 44);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v114 = v85;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v86;
      LOWORD(v115) = 1024;
      *(_DWORD *)((char *)&v115 + 2) = v87;
      HIWORD(v115) = 1024;
      v116 = v88;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->asePixelControl.dsEnable=%d, enhancementConfig.{ebeEnable=%d, peakingEnable=%d, chromaEnhanceEnable=%d}\n", buf, 0x1Au);
    }
  }
  return result;
}

void calculate_control_setting_V1(int *a1, char *__dst, unsigned int a3, unsigned int a4, int a5, int *a6, int *a7, int *a8, unsigned int *a9, unsigned int *a10, unsigned int *a11, unsigned int *a12, int a13)
{
  unsigned int v15;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  _BOOL4 v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  _BOOL4 v37;
  int v38;
  unsigned int v40;
  NSObject *v41;
  id v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int v50;
  int v51;
  int v52;
  int v53;
  float32x2_t *v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  double v59;
  NSObject *v60;
  id v61;
  double v62;
  NSObject *v63;
  id v64;
  double v65;
  NSObject *v71;
  id v72;
  NSObject *v73;
  id v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t i;
  int v85;
  signed int v86;
  int v87;
  uint64_t j;
  unint64_t v89;
  double v90;
  signed int v91;
  signed int v92;
  NSObject *v93;
  id v94;
  unsigned int v95;
  _BOOL4 v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  const char *v100;
  BOOL v101;
  unsigned int v102;
  const void *v103;
  const void *v104;
  NSObject *v105;
  _BOOL4 v106;
  unsigned int v107;
  int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v115;
  _OWORD __dsta[35];
  _OWORD __src[35];
  uint8_t buf[4];
  _BYTE v119[10];
  const char *v120;
  int v121;
  __int16 v122;
  unsigned int v123;
  __int16 v124;
  int v125;
  __int16 v126;
  unsigned int v127;
  uint64_t v128;

  v15 = a3;
  v128 = *MEMORY[0x24BDAC8D0];
  v18 = *a6;
  v108 = *a8;
  v109 = *a7;
  v107 = *a9;
  memset(__src, 0, 512);
  memset(&__dsta[22], 0, 160);
  v19 = 100 * a1[94];
  v20 = a1[30];
  if (v20 <= a1[46])
    v20 = a1[46];
  memset(&__dsta[2], 0, 320);
  v21 = v19 / v20;
  v23 = a3 > 0x383 && a4 > 0x1F3;
  memset(__dsta, 0, 32);
  v115 = v21;
  v106 = v23;
  if (a5)
  {
    v24 = a1[16] + a1[15];
    v25 = *a10 - v24;
    v26 = a1[32] + a1[31];
    v27 = *a11;
    v28 = *a12;
    if (v24 > *a10)
      v25 = v24 - *a10;
    if (v24 >= *a10)
      v24 = *a10;
    v29 = v26 - v27;
    if (v26 <= v27)
      v29 = *a11 - v26;
    v30 = 100 * v25 / v24;
    v31 = 100 * v29;
    if (v26 >= v27)
      v32 = *a11;
    else
      v32 = a1[32] + a1[31];
    v33 = v31 / v32;
    if (v30 <= v33)
      v30 = v33;
    v34 = v21 - v28;
    if (v21 <= v28)
      v34 = *a12 - v21;
    v35 = 100 * v34;
    if (v21 >= v28)
      v36 = *a12;
    else
      v36 = v21;
    v37 = v30 + v35 / v36 > 0x64;
  }
  else
  {
    v37 = 0;
  }
  v38 = *a1;
  if (logLevel >= 3)
  {
    v40 = v18;
    v41 = MEMORY[0x24BDACB70];
    v42 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v43 = *a12;
      v44 = a1[16] + a1[15];
      v45 = *a10;
      v46 = a1[32] + a1[31];
      v47 = *a11;
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v119 = v37;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v115;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v43;
      HIWORD(v120) = 1024;
      v121 = v44;
      v122 = 1024;
      v123 = v45;
      v124 = 1024;
      v125 = v46;
      v126 = 1024;
      v127 = v47;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
        buf,
        0x2Cu);
    }

    v18 = v40;
    v15 = a3;
  }
  v48 = a4 - 22;
  v110 = v48;
  v111 = v15 - 22;
  if (!a5 || (int)(100 * v38 / (v15 - 22) * v48) < 20 || a5 != 1 && v37)
  {
    memcpy(__dst, &InitialSettingVideo_V1, 0x22CuLL);
    if (logLevel < 3)
    {
      v50 = 0;
      v51 = 0;
      v52 = 4;
      v53 = 1;
      v49 = a12;
    }
    else
    {
      v49 = a12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v119 = &InitialSettingVideo_V1;
        *(_WORD *)&v119[8] = 2080;
        v120 = "InitialSettingVideo";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      v50 = 0;
      v51 = 0;
      v52 = 4;
      v53 = 1;
    }
    goto LABEL_41;
  }
  v80 = 0;
  v81 = 0;
  v82 = 0;
  do
  {
    v81 += a1[v80 + 23];
    v82 += a1[v80 + 39];
    ++v80;
  }
  while (v80 != 7);
  v83 = 0;
  for (i = 79; i != 94; ++i)
    v83 += a1[i];
  v85 = 10 * a1[46] / v82 + 10 * a1[30] / v81;
  v86 = 10 * a1[94] / v83;
  if (v86 <= 349)
    v85 = 350 * v85 / v86;
  v87 = 0;
  for (j = 47; j != 62; ++j)
    v87 += a1[j];
  HIDWORD(v89) = 1079574528;
  LODWORD(v89) = *a1;
  v90 = (double)v87 * 100.0 / (double)v89;
  if (v90 >= 7.0)
  {
    if (v90 > 8.0)
    {
      if (v18 - 1 <= 4)
        v18 = 4;
      else
        --v18;
    }
  }
  else
  {
    ++v18;
  }
  if (v18 <= 0xE)
  {
    if (v18 < 0xA)
    {
      if (v18 < 6)
        v91 = 0;
      else
        v91 = (50 * v18 - 300) >> 2;
    }
    else
    {
      v91 = ((50 * (_BYTE)v18 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    v91 = 100;
  }
  if (v85 <= 30)
  {
    if (v85 < 24)
    {
      if (v85 < 12)
        v92 = 100;
      else
        v92 = (unsigned __int16)(50 * (24 - v85)) / 0xCu + 50;
    }
    else
    {
      v92 = (unsigned __int16)(50 * (30 - v85)) / 6u;
    }
  }
  else
  {
    v92 = 0;
  }
  if (logLevel >= 3)
  {
    v93 = MEMORY[0x24BDACB70];
    v94 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v119 = a5;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v91;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v92;
      HIWORD(v120) = 1024;
      v121 = v85;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
    }

  }
  if (v91 <= v92)
    v95 = v92;
  else
    v95 = v91;
  if (a13 == 1)
  {
    v49 = a12;
    v96 = v106;
    if (logLevel >= 4)
    {
      v97 = MEMORY[0x24BDACB70];
      v98 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V1\n", buf, 2u);
      }

    }
    if (v106)
    {
      if (v95 > 0x1D)
      {
        if (v95 > 0x31)
        {
          if (v95 > 0x45)
          {
            if (v95 > 0x5E)
            {
              memcpy(__dsta, &iPhone_SettingVideo_Heavy_FG_V1, 0x22CuLL);
              memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_190;
              *(_WORD *)buf = 0;
              v99 = MEMORY[0x24BDACB70];
              v100 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dsta, &iPhone_SettingVideo_level3_FG_V1, 0x22CuLL);
              memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_190;
              *(_WORD *)buf = 0;
              v99 = MEMORY[0x24BDACB70];
              v100 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dsta, &iPhone_SettingVideo_level2_FG_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dsta, &iPhone_SettingVideo_level1_FG_V1, 0x22CuLL);
          memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_190;
          *(_WORD *)buf = 0;
          v99 = MEMORY[0x24BDACB70];
          v100 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dsta, &iPhone_SettingVideo_light_FG_V1, 0x22CuLL);
        memcpy(__src, &iPhone_SettingVideo_light_FG_mix_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_190;
        *(_WORD *)buf = 0;
        v99 = MEMORY[0x24BDACB70];
        v100 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v95 > 0x1D)
    {
      if (v95 > 0x31)
      {
        if (v95 > 0x45)
        {
          if (v95 > 0x5E)
          {
            memcpy(__dsta, &iPhone_SettingVideo_Heavy_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dsta, &iPhone_SettingVideo_level3_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dsta, &iPhone_SettingVideo_level2_FG_LargeRatio_V1, 0x22CuLL);
          memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_LargeRatio_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_190;
          *(_WORD *)buf = 0;
          v99 = MEMORY[0x24BDACB70];
          v100 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dsta, &iPhone_SettingVideo_level1_FG_LargeRatio_V1, 0x22CuLL);
        memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_LargeRatio_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_190;
        *(_WORD *)buf = 0;
        v99 = MEMORY[0x24BDACB70];
        v100 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dsta, &iPhone_SettingVideo_light_FG_LargeRatio_V1, 0x22CuLL);
      memcpy(__src, &iPhone_SettingVideo_light_FG_mix_LargeRatio_V1, 0x22CuLL);
      if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_190;
      *(_WORD *)buf = 0;
      v99 = MEMORY[0x24BDACB70];
      v100 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  else
  {
    v49 = a12;
    v96 = v106;
    if (v106)
    {
      if (v95 > 0x1D)
      {
        if (v95 > 0x31)
        {
          if (v95 > 0x45)
          {
            if (v95 > 0x5E)
            {
              memcpy(__dsta, &SettingVideo_Heavy_FG_V1, 0x22CuLL);
              memcpy(__src, &SettingVideo_Heavy_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_190;
              *(_WORD *)buf = 0;
              v99 = MEMORY[0x24BDACB70];
              v100 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dsta, &SettingVideo_level3_FG_V1, 0x22CuLL);
              memcpy(__src, &SettingVideo_level3_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_190;
              *(_WORD *)buf = 0;
              v99 = MEMORY[0x24BDACB70];
              v100 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dsta, &SettingVideo_level2_FG_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_level2_FG_mix_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dsta, &SettingVideo_level1_FG_V1, 0x22CuLL);
          memcpy(__src, &SettingVideo_level1_FG_mix_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_190;
          *(_WORD *)buf = 0;
          v99 = MEMORY[0x24BDACB70];
          v100 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dsta, &SettingVideo_light_FG_V1, 0x22CuLL);
        memcpy(__src, &SettingVideo_light_FG_mix_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_190;
        *(_WORD *)buf = 0;
        v99 = MEMORY[0x24BDACB70];
        v100 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v95 > 0x1D)
    {
      if (v95 > 0x31)
      {
        if (v95 > 0x45)
        {
          if (v95 > 0x5E)
          {
            memcpy(__dsta, &SettingVideo_Heavy_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_Heavy_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dsta, &SettingVideo_level3_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_level3_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v99 = MEMORY[0x24BDACB70];
            v100 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dsta, &SettingVideo_level2_FG_LargeRatio_V1, 0x22CuLL);
          memcpy(__src, &SettingVideo_level2_FG_mix_LargeRatio_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_190;
          *(_WORD *)buf = 0;
          v99 = MEMORY[0x24BDACB70];
          v100 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dsta, &SettingVideo_level1_FG_LargeRatio_V1, 0x22CuLL);
        memcpy(__src, &SettingVideo_level1_FG_mix_LargeRatio_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_190;
        *(_WORD *)buf = 0;
        v99 = MEMORY[0x24BDACB70];
        v100 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dsta, &SettingVideo_light_FG_LargeRatio_V1, 0x22CuLL);
      memcpy(__src, &SettingVideo_light_FG_mix_LargeRatio_V1, 0x22CuLL);
      if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_190;
      *(_WORD *)buf = 0;
      v99 = MEMORY[0x24BDACB70];
      v100 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  _os_log_impl(&dword_206505000, v99, OS_LOG_TYPE_DEFAULT, v100, buf, 2u);
LABEL_190:
  v101 = v95 > 0x14;
  if (v95 <= 0x14)
    v50 = v107 + 1;
  else
    v50 = 0;
  if (v101)
    v102 = v108 + 1;
  else
    v102 = 0;
  if (!v109)
  {
    if (v50 >= 0x30)
      v50 = 48;
    if (v102 > 0x18)
    {
      v52 = v18;
      v51 = 0;
      goto LABEL_207;
    }
    v51 = v102;
    if (!v96)
    {
LABEL_216:
      if (a13 == 1)
        v103 = &iPhone_SettingVideo_NFG_LargeRatio_V1;
      else
        v103 = &SettingVideo_NFG_LargeRatio_V1;
      memcpy(__dst, v103, 0x22CuLL);
      v52 = v18;
      if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_239;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v119 = &SettingVideo_NFG_LargeRatio_V1;
      *(_WORD *)&v119[8] = 2080;
      v120 = "SettingVideo_NFG LargeRatio";
      v105 = MEMORY[0x24BDACB70];
LABEL_238:
      _os_log_impl(&dword_206505000, v105, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
LABEL_239:
      v53 = 0;
      goto LABEL_41;
    }
LABEL_219:
    if (a13 == 1)
      v104 = &iPhone_SettingVideo_NFG_V1;
    else
      v104 = &SettingVideo_NFG_V1;
    memcpy(__dst, v104, 0x22CuLL);
    v52 = v18;
    if (logLevel < 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_239;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v119 = &SettingVideo_NFG_V1;
    *(_WORD *)&v119[8] = 2080;
    v120 = "SettingVideo_NFG";
    v105 = MEMORY[0x24BDACB70];
    goto LABEL_238;
  }
  if (v109 != 2)
  {
    if (v102 <= 0x18)
      v51 = v102;
    else
      v51 = 0;
    if (v50 <= 0x30)
    {
      v52 = v18;
      if (v102 <= 0x18)
        v53 = v109;
      else
        v53 = 2;
      if (v53 != 2)
      {
LABEL_208:
        memcpy(__dst, __src, 0x22CuLL);
        if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v119 = __src;
          *(_WORD *)&v119[8] = 2080;
          v120 = "Mix_dyn_setting";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
        }
        goto LABEL_41;
      }
      v18 = v52;
      goto LABEL_226;
    }
    v50 = 0;
    if (!v96)
      goto LABEL_216;
    goto LABEL_219;
  }
  if (v102 >= 0x18)
    v51 = 24;
  else
    v51 = v102;
  if (v50 > 0x30)
  {
    v52 = v18;
    v50 = 0;
LABEL_207:
    v53 = 1;
    goto LABEL_208;
  }
LABEL_226:
  memcpy(__dst, __dsta, 0x22CuLL);
  v52 = v18;
  if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v119 = __dsta;
    *(_WORD *)&v119[8] = 2080;
    v120 = "FG_dyn_setting";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
  }
  v53 = 2;
LABEL_41:
  v54 = (float32x2_t *)(__dst + 260);
  if (v15 >= 0x501 && a13 == 1)
  {
    *__dst = 0;
    *((_DWORD *)__dst + 4) = 0;
    *((_QWORD *)__dst + 1) = 0;
    *((_DWORD *)__dst + 6) = 0;
    *((_DWORD *)__dst + 9) = 0;
    *((_DWORD *)__dst + 12) = 0;
    *((_DWORD *)__dst + 15) = 0;
    *((_DWORD *)__dst + 18) = 0;
    *((_DWORD *)__dst + 21) = 0;
    *((_DWORD *)__dst + 24) = 0;
    *((_DWORD *)__dst + 27) = 0;
    *(float32x2_t *)(__dst + 236) = vmul_f32(*(float32x2_t *)(__dst + 236), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 31) = vmul_f32(*(float32x2_t *)(__dst + 248), (float32x2_t)0x3F0000003F000000);
    *v54 = vmul_f32(*v54, (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 34) = vmul_f32(*(float32x2_t *)(__dst + 272), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 284) = vmul_f32(*(float32x2_t *)(__dst + 284), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 37) = vmul_f32(*(float32x2_t *)(__dst + 296), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 308) = vmul_f32(*(float32x2_t *)(__dst + 308), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 40) = vmul_f32(*(float32x2_t *)(__dst + 320), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 332) = vmul_f32(*(float32x2_t *)(__dst + 332), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 43) = vmul_f32(*(float32x2_t *)(__dst + 344), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 356) = vmul_f32(*(float32x2_t *)(__dst + 356), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 46) = vmul_f32(*(float32x2_t *)(__dst + 368), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 380) = vmul_f32(*(float32x2_t *)(__dst + 380), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 49) = vmul_f32(*(float32x2_t *)(__dst + 392), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 404) = vmul_f32(*(float32x2_t *)(__dst + 404), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 52) = vmul_f32(*(float32x2_t *)(__dst + 416), (float32x2_t)0x3F0000003F000000);
    if (logLevel < 3)
      goto LABEL_60;
    v55 = MEMORY[0x24BDACB70];
    v56 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] noDS == 1, set mediumAdaptGain = 0, adjust Hfactor\n", buf, 2u);
    }

  }
  if (logLevel >= 3)
  {
    v57 = MEMORY[0x24BDACB70];
    v58 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v59 = *((float *)__dst + 106);
      *(_DWORD *)buf = 134217984;
      *(double *)v119 = v59;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.x_position=%f\n", buf, 0xCu);
    }

    if (logLevel >= 3)
    {
      v60 = MEMORY[0x24BDACB70];
      v61 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v62 = *((float *)__dst + 107);
        *(_DWORD *)buf = 134217984;
        *(double *)v119 = v62;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.y_position=%f\n", buf, 0xCu);
      }

      if (logLevel >= 3)
      {
        v63 = MEMORY[0x24BDACB70];
        v64 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v65 = *((float *)__dst + 108);
          *(_DWORD *)buf = 134217984;
          *(double *)v119 = v65;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.slope=%f\n", buf, 0xCu);
        }

      }
    }
  }
  if (v15 >= 0x76D && a13 == 8)
  {
    *__dst = 0;
    *((_DWORD *)__dst + 6) = 0;
    *((_DWORD *)__dst + 9) = 0;
    *((_DWORD *)__dst + 12) = 0;
    *((_DWORD *)__dst + 15) = 0;
    *((_DWORD *)__dst + 18) = 0;
    *((_DWORD *)__dst + 21) = 0;
    *((_DWORD *)__dst + 24) = 0;
    *((_DWORD *)__dst + 27) = 0;
    __asm { FMOV            V1.2S, #0.25 }
    *(float32x2_t *)(__dst + 236) = vmul_f32(*(float32x2_t *)(__dst + 236), _D1);
    *((float32x2_t *)__dst + 31) = vmul_f32(*(float32x2_t *)(__dst + 248), _D1);
    *v54 = vmul_f32(*v54, _D1);
    *((float32x2_t *)__dst + 34) = vmul_f32(*(float32x2_t *)(__dst + 272), _D1);
    *(float32x2_t *)(__dst + 284) = vmul_f32(*(float32x2_t *)(__dst + 284), _D1);
    *((float32x2_t *)__dst + 37) = vmul_f32(*(float32x2_t *)(__dst + 296), _D1);
    *(float32x2_t *)(__dst + 308) = vmul_f32(*(float32x2_t *)(__dst + 308), _D1);
    *((float32x2_t *)__dst + 40) = vmul_f32(*(float32x2_t *)(__dst + 320), _D1);
    *(float32x2_t *)(__dst + 332) = vmul_f32(*(float32x2_t *)(__dst + 332), _D1);
    *((float32x2_t *)__dst + 43) = vmul_f32(*(float32x2_t *)(__dst + 344), _D1);
    *(float32x2_t *)(__dst + 356) = vmul_f32(*(float32x2_t *)(__dst + 356), _D1);
    *((float32x2_t *)__dst + 46) = vmul_f32(*(float32x2_t *)(__dst + 368), _D1);
    *(float32x2_t *)(__dst + 380) = vmul_f32(*(float32x2_t *)(__dst + 380), _D1);
    *((float32x2_t *)__dst + 49) = vmul_f32(*(float32x2_t *)(__dst + 392), _D1);
    *(float32x2_t *)(__dst + 404) = vmul_f32(*(float32x2_t *)(__dst + 404), _D1);
    *((float32x2_t *)__dst + 52) = vmul_f32(*(float32x2_t *)(__dst + 416), _D1);
  }
LABEL_60:
  if (v15 >= 0x781)
  {
    *__dst = 0;
    *((_QWORD *)__dst + 1) = 0;
    *((_DWORD *)__dst + 4) = 0;
  }
  if (logLevel >= 3)
  {
    v71 = MEMORY[0x24BDACB70];
    v72 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]  applying the fix to all HH02012023\n", buf, 2u);
    }

  }
  *((_DWORD *)__dst + 1) = 204800;
  *(float32x2_t *)(__dst + 428) = vmul_f32(*(float32x2_t *)(__dst + 428), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 55) = vmul_f32(*(float32x2_t *)(__dst + 440), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 452) = vmul_f32(*(float32x2_t *)(__dst + 452), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 58) = vmul_f32(*(float32x2_t *)(__dst + 464), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 476) = vmul_f32(*(float32x2_t *)(__dst + 476), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 61) = vmul_f32(*(float32x2_t *)(__dst + 488), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 500) = vmul_f32(*(float32x2_t *)(__dst + 500), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 64) = vmul_f32(*(float32x2_t *)(__dst + 512), (float32x2_t)0x3F0000003F000000);
  *a6 = v52;
  *a7 = v53;
  *a8 = v51;
  *a9 = v50;
  *a10 = a1[16] + a1[15];
  *a11 = a1[32] + a1[31];
  *v49 = v115;
  *((_DWORD *)__dst + 134) = v111;
  *((_DWORD *)__dst + 135) = v110;
  *((_DWORD *)__dst + 136) = v52;
  *(_QWORD *)(__dst + 548) = 0x400000007;
  if (logLevel >= 3)
  {
    v73 = MEMORY[0x24BDACB70];
    v74 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v75 = *((_DWORD *)__dst + 134);
      v76 = *((_DWORD *)__dst + 135);
      v77 = *((_DWORD *)__dst + 136);
      v78 = *((_DWORD *)__dst + 137);
      v79 = *((_DWORD *)__dst + 138);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v119 = v75;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v76;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v77;
      HIWORD(v120) = 1024;
      v121 = v78;
      v122 = 1024;
      v123 = v79;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", buf, 0x20u);
    }

  }
}

CFIndex initASEProcessLog()
{
  CFIndex AppIntegerValue;
  int v1;
  int v2;
  int v3;
  int v4;
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("logLevel"), CFSTR("com.apple.aseprocessing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v1 = 4;
    if (AppIntegerValue < 4)
      v1 = AppIntegerValue;
    logLevel = v1;
  }
  v2 = CFPreferencesGetAppIntegerValue(CFSTR("disableHcuCache"), CFSTR("com.apple.aseprocessing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    disableHcuCache = v2;
  v3 = CFPreferencesGetAppIntegerValue(CFSTR("enableT1Sim"), CFSTR("com.apple.aseprocessing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    enableT1Sim = v3;
  v4 = CFPreferencesGetAppIntegerValue(CFSTR("hideHcu"), CFSTR("com.apple.aseprocessing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    hideHcu = v4;
  result = CFPreferencesGetAppIntegerValue(CFSTR("dumpOutputHcu"), CFSTR("com.apple.aseprocessing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    dumpOutputHcu = result;
  return result;
}

char *getASEProcessingType(unsigned int a1)
{
  int v1;

  if (a1 >= 9)
    v1 = 9;
  else
    v1 = a1;
  return (&aseProcessingTypes)[v1];
}

void createCacheNode_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x24BDACB70]))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 44\n", v1, v2, v3, v4, 0);
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 44, "0");
}

void createCacheNode_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x24BDACB70]))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValuePeaking)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 32\n", v1, v2, v3, v4, 0);
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 32, "size == sizeof(ASEHcuCacheNodeValuePeaking)");
}

void createCacheNode_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x24BDACB70]))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValueEbe)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 36\n", v1, v2, v3, v4, 0);
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 36, "size == sizeof(ASEHcuCacheNodeValueEbe)");
}

void createCacheNode_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x24BDACB70]))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValueBlend)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 40\n", v1, v2, v3, v4, 0);
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 40, "size == sizeof(ASEHcuCacheNodeValueBlend)");
}

void copyArray_cold_1()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"count <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 128\n", v0, 2u);
  }
  __assert_rtn("copyArray", "ASECalculateControlSettingV3.m", 128, "count <= 16");
}

void copyPieceWiseCurves_cold_1()
{
  __assert_rtn("copyPieceWiseCurves", "ASECalculateControlSettingV3.m", 185, "input && input->type == WDT_TYPE_CONSTANT && input->pointCount <= 16");
}

void interpolatePieceWiseCurves_cold_1()
{
  __assert_rtn("interpolatePieceWiseCurves", "ASECalculateControlSettingV3.m", 193, "input && input->type == WDT_TYPE_INTERPOLATED && input->pointCount <= 16");
}

void interpolateArray_cold_1()
{
  __assert_rtn("interpolateArray", "ASECalculateControlSettingV3.m", 247, "input && input->type == WDT_TYPE_INTERPOLATED");
}

void calculate_control_setting_V3_cold_1()
{
  __assert_rtn("calculate_control_setting_V3", "ASECalculateControlSettingV3.m", 508, "isT1OrNewer(productType)");
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x24BE51728]();
}

uint64_t IOSurfaceAcceleratorGetServiceObject()
{
  return MEMORY[0x24BE51740]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x24BED84A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

